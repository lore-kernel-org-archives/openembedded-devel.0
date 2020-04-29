Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.1407.1588157509857674720
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Apr 2020 03:51:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=BV3IWwsN;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=6995; q=dns/txt; s=axis-central1;
  t=1588157510; x=1619693510;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wL6/oQ7i+iwtAp1Tx6A2SH8Lu1fiQAWhXceTlh0RvNE=;
  b=BV3IWwsN85UdKASkFv0ABVuhkvobvVaDYZJlU5I8sNTH+r8TixiHNOAN
   l1KewLVSJImMHdSbOh/xw6tDZ8R/XrVuitKmGx5b+HqijDHVGqHlTe4fE
   sqYVh2NaZT8WRDoLSbGoqDe4GAuvdfoT6N0HUF0JJ7AZfBmUfPLSKcB1x
   8m8W4f/DgQLakSrTMlHbwnPkJC344LMarjvGMdClLf9Pi1Ym+teM8o2yG
   Lf/SjIBpj6OoW3p550ACRcXFi9i9aWz28vqgTuf3m690x+szW9vP0Pmov
   eT20XoJBdjEtrnsyHEvqGDYUtthObyfal7zwPJLVXeLRoTj4VFbx3WfDX
   A==;
IronPort-SDR: t+XScYckJu8lcErxAhN3whMouMBFKjoot2qfovghdnP8vq+gehAx0BF+q+/xfxUPPi8hyHFjVo
 tpcRZO8OKFlHCbn7Uahik7d0b3xk/GoKec/FVCCNYeyNgoj2pYrUkDkHScbAMqmdredFEO+G8g
 IiXKntrlFKHq3Zv3GdWMwBx0tj8vjVNOt1SKdADtUfKrqletr5c4dE1/hw44xC7iOqhbUpi6Dm
 ib5WRDSEwt5Lp0niIYyflg3FmXKWR6uVg+oe2AIxsd/YCovhKDJv7Ov2FybKOgv+lZzoP2HbIJ
 eUk=
X-IronPort-AV: E=Sophos;i="5.73,331,1583190000"; 
   d="scan'208";a="7981387"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][master][dunfell][PATCH] samba: Remove the dependency on libbsd
Date: Wed, 29 Apr 2020 12:51:39 +0200
Message-ID: <20200429105139.22519-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

It is unnecessary, and libbsd uses the "BSD-4-Clause" license, which can
be problematic.

To make it deterministic, a patch is introduced to allow libbsd support
to be disabled. It resembles similar patches in, e.g., libldb,
libtalloc, libtdb and libtevent.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 ...tions-to-configure-the-use-of-libbsd.patch | 103 ++++++++++++++++++
 .../samba/samba_4.10.13.bb                    |   4 +-
 2 files changed, 106 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/0001-Add-options-to-configure-the-use-of-libbsd.patch

diff --git a/meta-networking/recipes-connectivity/samba/samba/0001-Add-options-to-configure-the-use-of-libbsd.patch b/meta-networking/recipes-connectivity/samba/samba/0001-Add-options-to-configure-the-use-of-libbsd.patch
new file mode 100644
index 000000000..80cdd3955
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/0001-Add-options-to-configure-the-use-of-libbsd.patch
@@ -0,0 +1,103 @@
+From 1e8d31c138395122df4cc2a3e0edd6cd3fad736c Mon Sep 17 00:00:00 2001
+From: Peter Kjellerstedt <pkj@axis.com>
+Date: Tue, 28 Apr 2020 02:05:33 +0200
+Subject: [PATCH] Add options to configure the use of libbsd
+
+Upstream-Status: Inappropriate [oe deterministic build specific]
+Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+---
+ buildtools/wafsamba/wscript  |  7 +++++++
+ lib/crypto/wscript_configure |  2 +-
+ lib/replace/wscript          | 29 +++++++++++++++--------------
+ lib/texpect/wscript          |  7 ++++++-
+ 4 files changed, 29 insertions(+), 16 deletions(-)
+
+diff --git a/buildtools/wafsamba/wscript b/buildtools/wafsamba/wscript
+index 7b8fb01..a8e4b0a 100644
+--- a/buildtools/wafsamba/wscript
++++ b/buildtools/wafsamba/wscript
+@@ -88,6 +88,13 @@ def options(opt):
+                    help=("Disable use of gettext"),
+                    action="store_true", dest='disable_gettext', default=False)
+ 
++    opt.add_option('--with-libbsd',
++                   help=("Enable use of libbsd"),
++                   action="store_true", dest='enable_libbsd')
++    opt.add_option('--without-libbsd',
++                   help=("Disable use of libbsd"),
++                   action="store_false", dest='enable_libbsd', default=False)
++
+     gr = opt.option_group('developer options')
+ 
+     gr.add_option('-C',
+diff --git a/lib/crypto/wscript_configure b/lib/crypto/wscript_configure
+index 09dfe04..e871718 100644
+--- a/lib/crypto/wscript_configure
++++ b/lib/crypto/wscript_configure
+@@ -2,7 +2,7 @@
+ from waflib import Options
+ from waflib import Errors, Logs
+ 
+-if not conf.CHECK_FUNCS_IN('MD5Init', 'bsd', headers='bsd/md5.h',
++if not Options.options.enable_libbsd or not conf.CHECK_FUNCS_IN('MD5Init', 'bsd', headers='bsd/md5.h',
+     checklibc=True):
+     conf.CHECK_FUNCS_IN('MD5Init', 'md5', headers='sys/md5.h',
+                         checklibc=True)
+diff --git a/lib/replace/wscript b/lib/replace/wscript
+index 0020d2a..cd9228f 100644
+--- a/lib/replace/wscript
++++ b/lib/replace/wscript
+@@ -407,20 +407,21 @@ def configure(conf):
+ 
+     strlcpy_in_bsd = False
+ 
+-    # libbsd on some platforms provides strlcpy and strlcat
+-    if not conf.CHECK_FUNCS('strlcpy strlcat'):
+-        if conf.CHECK_FUNCS_IN('strlcpy strlcat', 'bsd', headers='bsd/string.h',
+-                               checklibc=True):
+-            strlcpy_in_bsd = True
+-    if not conf.CHECK_FUNCS('getpeereid'):
+-        conf.CHECK_FUNCS_IN('getpeereid', 'bsd', headers='sys/types.h bsd/unistd.h')
+-    if not conf.CHECK_FUNCS_IN('setproctitle', 'setproctitle', headers='setproctitle.h'):
+-        conf.CHECK_FUNCS_IN('setproctitle', 'bsd', headers='sys/types.h bsd/unistd.h')
+-    if not conf.CHECK_FUNCS('setproctitle_init'):
+-        conf.CHECK_FUNCS_IN('setproctitle_init', 'bsd', headers='sys/types.h bsd/unistd.h')
+-
+-    if not conf.CHECK_FUNCS('closefrom'):
+-        conf.CHECK_FUNCS_IN('closefrom', 'bsd', headers='bsd/unistd.h')
++    if Options.options.enable_libbsd:
++        # libbsd on some platforms provides strlcpy and strlcat
++        if not conf.CHECK_FUNCS('strlcpy strlcat'):
++            if conf.CHECK_FUNCS_IN('strlcpy strlcat', 'bsd', headers='bsd/string.h',
++                                   checklibc=True):
++                strlcpy_in_bsd = True
++        if not conf.CHECK_FUNCS('getpeereid'):
++            conf.CHECK_FUNCS_IN('getpeereid', 'bsd', headers='sys/types.h bsd/unistd.h')
++        if not conf.CHECK_FUNCS_IN('setproctitle', 'setproctitle', headers='setproctitle.h'):
++            conf.CHECK_FUNCS_IN('setproctitle', 'bsd', headers='sys/types.h bsd/unistd.h')
++        if not conf.CHECK_FUNCS('setproctitle_init'):
++            conf.CHECK_FUNCS_IN('setproctitle_init', 'bsd', headers='sys/types.h bsd/unistd.h')
++
++        if not conf.CHECK_FUNCS('closefrom'):
++            conf.CHECK_FUNCS_IN('closefrom', 'bsd', headers='bsd/unistd.h')
+ 
+     conf.CHECK_CODE('''
+                 struct ucred cred;
+diff --git a/lib/texpect/wscript b/lib/texpect/wscript
+index e14c048..a91de59 100644
+--- a/lib/texpect/wscript
++++ b/lib/texpect/wscript
+@@ -1,7 +1,12 @@
+ #!/usr/bin/env python
++from waflib import Options
+ 
+ def configure(conf):
+-    conf.CHECK_FUNCS_IN('openpty', 'util', checklibc=True, headers='pty.h util.h bsd/libutil.h libutil.h')
++    hdrs = 'pty.h util.h'
++    if Options.options.enable_libbsd:
++        hdrs += ' bsd/libutil.h'
++    hdrs += ' libutil.h'
++    conf.CHECK_FUNCS_IN('openpty', 'util', checklibc=True, headers=hdrs)
+ 
+ def build(bld):
+     bld.SAMBA_BINARY('texpect', 'texpect.c', deps='popt util replace', install=False)
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.10.13.bb b/meta-networking/recipes-connectivity/samba/samba_4.10.13.bb
index 71d8fa2f8..5f227c892 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.10.13.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.10.13.bb
@@ -26,6 +26,7 @@ SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://0001-waf-add-support-of-cross_compile.patch \
            file://0001-lib-replace-wscript-Avoid-generating-nested-main-fun.patch \
            file://0002-util_sec.c-Move-__thread-variable-to-global-scope.patch \
+           file://0001-Add-options-to-configure-the-use-of-libbsd.patch \
            "
 SRC_URI_append_libc-musl = " \
            file://samba-pam.patch \
@@ -43,7 +44,7 @@ inherit systemd waf-samba cpan-base perlnative update-rc.d
 # remove default added RDEPENDS on perl
 RDEPENDS_${PN}_remove = "perl"
 
-DEPENDS += "readline virtual/libiconv zlib popt libtalloc libtdb libtevent libldb libbsd libaio libpam libtasn1 jansson"
+DEPENDS += "readline virtual/libiconv zlib popt libtalloc libtdb libtevent libldb libaio libpam libtasn1 jansson"
 
 inherit features_check
 REQUIRED_DISTRO_FEATURES = "pam"
@@ -91,6 +92,7 @@ PACKAGECONFIG[archive] = "--with-libarchive, --without-libarchive, libarchive"
 PACKAGECONFIG[libunwind] = ", , libunwind"
 PACKAGECONFIG[gpgme] = ",--without-gpgme,,"
 PACKAGECONFIG[lmdb] = ",--without-ldb-lmdb,lmdb,"
+PACKAGECONFIG[libbsd] = "--with-libbsd, --without-libbsd, libbsd"
 
 # Building the AD (Active Directory) DC (Domain Controller) requires GnuTLS,
 # And ad-dc doesn't work with mitkrb5 for versions prior to 4.7.0 according to:
-- 
2.21.1

