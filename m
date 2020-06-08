Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.28480.1591618464920410154
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jun 2020 05:14:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=50432 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jiGfX-0005b8-Ie; Mon, 08 Jun 2020 15:14:24 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/7] python3-lxml: Upgrade 4.5.0 -> 4.5.1
Date: Mon,  8 Jun 2020 15:14:05 +0300
Message-Id: <20200608121410.5814-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200608121410.5814-1-leon.anavi@konsulko.com>
References: <20200608121410.5814-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.2
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Upgrade to release 4.5.1 but keep setupinfo.py from 4.5.0
because the new version doesn't support properly arguments
--with-xslt-config and --with-xml2-config as well as retriving
versions of dependencies.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../0001-setupinfo.py-Revert-changes.patch    | 237 ++++++++++++++++++
 ...n3-lxml_4.5.0.bb => python3-lxml_4.5.1.bb} |   5 +-
 2 files changed, 240 insertions(+), 2 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-lxml/0001-setupinfo.py-Revert-changes.patch
 rename meta-python/recipes-devtools/python/{python3-lxml_4.5.0.bb => python3-lxml_4.5.1.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-lxml/0001-setupinfo.py-Revert-changes.patch b/meta-python/recipes-devtools/python/python3-lxml/0001-setupinfo.py-Revert-changes.patch
new file mode 100644
index 000000000..d6e63712c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-lxml/0001-setupinfo.py-Revert-changes.patch
@@ -0,0 +1,237 @@
+From 24d0c9885b7a259b61a28eb440d0c0585016d73b Mon Sep 17 00:00:00 2001
+From: Leon Anavi <leon.anavi@konsulko.com>
+Date: Mon, 8 Jun 2020 13:05:23 +0300
+Subject: [PATCH] setupinfo.py: Revert changes
+
+Use setupinfo.py from release 4.5.0 to revert changes replacing
+--with-xslt-config and --with-xml2-config with --xslt-config and
+--xml2-config as well as to properly determine versions of
+dependencies.
+
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
+---
+ setupinfo.py | 155 +++++++++++++++++++++------------------------------
+ 1 file changed, 64 insertions(+), 91 deletions(-)
+
+diff --git a/setupinfo.py b/setupinfo.py
+index cf195245..5a833d45 100644
+--- a/setupinfo.py
++++ b/setupinfo.py
+@@ -2,7 +2,6 @@ import sys
+ import io
+ import os
+ import os.path
+-import subprocess
+ from distutils.core import Extension
+ from distutils.errors import CompileError, DistutilsOptionError
+ from distutils.command.build_ext import build_ext as _build_ext
+@@ -110,7 +109,17 @@ def ext_modules(static_include_dirs, static_library_dirs,
+         use_cython = False
+         print("Building without Cython.")
+ 
+-    if not check_build_dependencies():
++    lib_versions = get_library_versions()
++    versions_ok = True
++    if lib_versions[0]:
++        print("Using build configuration of libxml2 %s and libxslt %s" %
++              lib_versions)
++        versions_ok = check_min_version(lib_versions[0], (2, 7, 0), 'libxml2')
++    else:
++        print("Using build configuration of libxslt %s" %
++              lib_versions[1])
++    versions_ok |= check_min_version(lib_versions[1], (1, 1, 23), 'libxslt')
++    if not versions_ok:
+         raise RuntimeError("Dependency missing")
+ 
+     base_dir = get_base_dir()
+@@ -351,118 +360,53 @@ def define_macros():
+     macros.append(('CYTHON_CLINE_IN_TRACEBACK', '1' if OPTION_WITH_CLINES else '0'))
+     return macros
+ 
++_ERROR_PRINTED = False
+ 
+ def run_command(cmd, *args):
+     if not cmd:
+         return ''
+     if args:
+         cmd = ' '.join((cmd,) + args)
+-
++    import subprocess
+     p = subprocess.Popen(cmd, shell=True,
+                          stdout=subprocess.PIPE, stderr=subprocess.PIPE)
+     stdout_data, errors = p.communicate()
+-
+-    if errors:
+-        return ''
++    global _ERROR_PRINTED
++    if errors and not _ERROR_PRINTED:
++        _ERROR_PRINTED = True
++        print("ERROR: %s" % errors)
++        print("** make sure the development packages of libxml2 and libxslt are installed **\n")
+     return decode_input(stdout_data).strip()
+ 
+ 
+-def check_min_version(version, min_version, libname):
++def check_min_version(version, min_version, error_name):
+     if not version:
+         # this is ok for targets like sdist etc.
+         return True
+-    lib_version = tuple(map(int, version.split('.')[:3]))
+-    req_version = tuple(map(int, min_version.split('.')[:3]))
+-    if lib_version < req_version:
+-        print("Minimum required version of %s is %s. Your system has version %s." % (
+-            libname, min_version, version))
++    version = tuple(map(int, version.split('.')[:3]))
++    min_version = tuple(min_version)
++    if version < min_version:
++        print("Minimum required version of %s is %s, found %s" % (
++            error_name, '.'.join(map(str, version)), '.'.join(map(str, min_version))))
+         return False
+     return True
+ 
+ 
+-def get_library_version(prog, libname=None):
+-    if libname:
+-        return run_command(prog, '--modversion %s' % libname)
+-    else:
+-        return run_command(prog, '--version')
+-
++def get_library_version(config_tool):
++    is_pkgconfig = "pkg-config" in config_tool
++    return run_command(config_tool,
++                       "--modversion" if is_pkgconfig else "--version")
+ 
+-PKG_CONFIG = None
+-XML2_CONFIG = None
+-XSLT_CONFIG = None
+ 
+ def get_library_versions():
+-    global XML2_CONFIG, XSLT_CONFIG
+-
+-    # Pre-built libraries
+-    if XML2_CONFIG and XSLT_CONFIG:
+-        xml2_version = get_library_version(XML2_CONFIG)
+-        xslt_version = get_library_version(XSLT_CONFIG)
+-        return xml2_version, xslt_version
+-
+-    # Path to xml2-config and xslt-config specified on the command line
+-    if OPTION_WITH_XML2_CONFIG:
+-        xml2_version = get_library_version(OPTION_WITH_XML2_CONFIG)
+-        if xml2_version and OPTION_WITH_XSLT_CONFIG:
+-            xslt_version = get_library_version(OPTION_WITH_XSLT_CONFIG)
+-            if xslt_version:
+-                XML2_CONFIG = OPTION_WITH_XML2_CONFIG
+-                XSLT_CONFIG = OPTION_WITH_XSLT_CONFIG
+-                return xml2_version, xslt_version
+-
+-    # Try pkg-config
+-    global PKG_CONFIG
+-    PKG_CONFIG = os.getenv('PKG_CONFIG', 'pkg-config')
+-    xml2_version = get_library_version(PKG_CONFIG, 'libxml-2.0')
+-    if xml2_version:
+-        xslt_version = get_library_version(PKG_CONFIG, 'libxslt')
+-        if xml2_version and xslt_version:
+-            return xml2_version, xslt_version
+-
+-    # Try xml2-config and xslt-config
+-    XML2_CONFIG = os.getenv('XML2_CONFIG', 'xml2-config')
+-    xml2_version = get_library_version(XML2_CONFIG)
+-    if xml2_version:
+-        XSLT_CONFIG = os.getenv('XSLT_CONFIG', 'xslt-config')
+-        xslt_version = get_library_version(XSLT_CONFIG)
+-        if xml2_version and xslt_version:
+-            return xml2_version, xslt_version
+-
+-    # One or both build dependencies not found. Fail on Linux platforms only.
+-    if sys.platform.startswith('win'):
+-        return '', ''
+-    print("Error: Please make sure the libxml2 and libxslt development packages are installed.")
+-    sys.exit(1)
+-
+-
+-def check_build_dependencies():
+-    xml2_version, xslt_version = get_library_versions()
+-
+-    xml2_ok = check_min_version(xml2_version, '2.7.0', 'libxml2')
+-    xslt_ok = check_min_version(xslt_version, '1.1.23', 'libxslt')
+-
+-    if xml2_version and xslt_version:
+-        print("Building against libxml2 %s and libxslt %s" % (xml2_version, xslt_version))
+-    else:
+-        print("Building against pre-built libxml2 andl libxslt libraries")
+-
+-    return (xml2_ok and xslt_ok)
+-
+-
+-def get_flags(prog, option, libname=None):
+-    if libname:
+-        return run_command(prog, '--%s %s' % (option, libname))
+-    else:
+-        return run_command(prog, '--%s' % option)
++    xml2_version = get_library_version(find_xml2_config())
++    xslt_version = get_library_version(find_xslt_config())
++    return xml2_version, xslt_version
+ 
+ 
+ def flags(option):
+-    if XML2_CONFIG:
+-        xml2_flags = get_flags(XML2_CONFIG, option)
+-        xslt_flags = get_flags(XSLT_CONFIG, option)
+-    else:
+-        xml2_flags = get_flags(PKG_CONFIG, option, 'libxml-2.0')
+-        xslt_flags = get_flags(PKG_CONFIG, option, 'libxslt')
++    xml2_flags = run_command(find_xml2_config(), "--%s" % option)
++    xslt_flags = run_command(find_xslt_config(), "--%s" % option)
+ 
+     flag_list = xml2_flags.split()
+     for flag in xslt_flags.split():
+@@ -474,6 +418,37 @@ def flags(option):
+ def get_xcode_isysroot():
+     return run_command('xcrun', '--show-sdk-path')
+ 
++XSLT_CONFIG = None
++XML2_CONFIG = None
++
++def find_xml2_config():
++    global XML2_CONFIG
++    if XML2_CONFIG:
++        return XML2_CONFIG
++    option = '--with-xml2-config='
++    for arg in sys.argv:
++        if arg.startswith(option):
++            sys.argv.remove(arg)
++            XML2_CONFIG = arg[len(option):]
++            return XML2_CONFIG
++    else:
++        # default: do nothing, rely only on xslt-config
++        XML2_CONFIG = os.getenv('XML2_CONFIG', '')
++    return XML2_CONFIG
++
++def find_xslt_config():
++    global XSLT_CONFIG
++    if XSLT_CONFIG:
++        return XSLT_CONFIG
++    option = '--with-xslt-config='
++    for arg in sys.argv:
++        if arg.startswith(option):
++            sys.argv.remove(arg)
++            XSLT_CONFIG = arg[len(option):]
++            return XSLT_CONFIG
++    else:
++        XSLT_CONFIG = os.getenv('XSLT_CONFIG', 'xslt-config')
++    return XSLT_CONFIG
+ 
+ ## Option handling:
+ 
+@@ -526,8 +501,6 @@ OPTION_AUTO_RPATH = has_option('auto-rpath')
+ OPTION_BUILD_LIBXML2XSLT = staticbuild or has_option('static-deps')
+ if OPTION_BUILD_LIBXML2XSLT:
+     OPTION_STATIC = True
+-OPTION_WITH_XML2_CONFIG = option_value('xml2-config')
+-OPTION_WITH_XSLT_CONFIG = option_value('xslt-config')
+ OPTION_LIBXML2_VERSION = option_value('libxml2-version')
+ OPTION_LIBXSLT_VERSION = option_value('libxslt-version')
+ OPTION_LIBICONV_VERSION = option_value('libiconv-version')
+-- 
+2.17.1
+
diff --git a/meta-python/recipes-devtools/python/python3-lxml_4.5.0.bb b/meta-python/recipes-devtools/python/python3-lxml_4.5.1.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-lxml_4.5.0.bb
rename to meta-python/recipes-devtools/python/python3-lxml_4.5.1.bb
index e3cfa46d1..8ab657475 100644
--- a/meta-python/recipes-devtools/python/python3-lxml_4.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-lxml_4.5.1.bb
@@ -18,8 +18,9 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[md5sum] = "f088e452ed45b030b6f84269f1e84d11"
-SRC_URI[sha256sum] = "8620ce80f50d023d414183bf90cc2576c2837b88e00bea3f33ad2630133bbb60"
+SRC_URI += "file://0001-setupinfo.py-Revert-changes.patch"
+SRC_URI[md5sum] = "4d3cca9c0018dd98f39e0ac54fcc3d14"
+SRC_URI[sha256sum] = "27ee0faf8077c7c1a589573b1450743011117f1aa1a91d5ae776bbc5ca6070f2"
 
 DISTUTILS_BUILD_ARGS += " \
                      --with-xslt-config='pkg-config libxslt' \
-- 
2.17.1

