Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A784C47422
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 12:01:01 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.14061.1706270452659687125
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jan 2024 04:00:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WMl2s4hK;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-55cdaa96f34so3308952a12.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Jan 2024 04:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706270451; x=1706875251; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vDSHKurSBJjt6LwtoGsbrp6+DSYlHAKh9LsF46i8BGE=;
        b=WMl2s4hKCLMqqF7f9LZCKjJ06B1VrZYwx+88eSEn6kZowiFB1yyAoI3725k1KbT6iq
         K5T5w3t9Zfxx6rzuwuG8/s05uEdNTB+AnyrP4nvkN4nbHCNlp21kj59sraiHiNyG7GhL
         FZce9K/M21jNiQAyLCqwlZv77jrEKOhmsuUQDerYZZSNsN/7ytkUViZJynPG7US6iO1d
         eC0M+9dX13jaMQBfQjipQeUppDCACuXZyhG4S06mhu2/N9qi1yXpO0dtf6qfi/nllffx
         XhV23eRz5L4V26xFekH2OgfKRpWn6dE7cuuGCXLK0gBgINWe6GaUtdICULv18ecsVukP
         BcyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706270451; x=1706875251;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vDSHKurSBJjt6LwtoGsbrp6+DSYlHAKh9LsF46i8BGE=;
        b=UvNiX/iPphmsgp20vZ0r2H9qRklSESclpsHkUA6HZIYhI9NYrxfG7qEv7k3VYUHAx9
         LNjXVRgqzp6Fc927SmWaTxTQgTx8Rncy4Gi5/l+Xs6r/Q6ImBs+IkMPHuZ5aBRkOE7Xq
         Se7FaFpWi1zPNyN+Hd74fKFAXCzfOKEascho2NnwMCzD6T+KX8gXlygdJs5qz36HOGmL
         Swt6P2Wm/g58ntweoCMEVKrxwUFR5iPQ/3Iii01yQDRyjWD7fAFtxzw7hOmTUR51fi8Y
         rMAZOpYxMaw9bgR+tPG4Eyy9vZqs9zQGXlsUFfC2vUNbTNSxNEhekBJVmTTvrZSHDxNY
         nb6w==
X-Gm-Message-State: AOJu0YxCBVq99dS0GajyeQQjI6OTy5D4ltr6Bz58vMSKFvY0sH1Y0Ja7
	cBUUSBttKWsEnxjTyvRWzmIoFDWkfG77kiXciCttF0FwRPMNTjXcp1l87Bd/
X-Google-Smtp-Source: AGHT+IF6cwkAdNfs3JQz+q/sHIWFqHj2iuDlL/kw5jv8TzQcsHoRzly0cO8IkpMa/bk2kGlv/dop4A==
X-Received: by 2002:a17:906:d29a:b0:a34:96fa:9602 with SMTP id ay26-20020a170906d29a00b00a3496fa9602mr821078ejb.34.1706270450549;
        Fri, 26 Jan 2024 04:00:50 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id tk7-20020a170907c28700b00a34a17a0eeasm552796ejc.116.2024.01.26.04.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 04:00:50 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: zboszor@gmail.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] jack: fix build with python3 on host
Date: Fri, 26 Jan 2024 13:00:42 +0100
Message-ID: <20240126120044.1775176-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Jan 2024 12:01:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108461

* first backport from waflib fixes:
| DEBUG: Executing shell function do_configure
| Traceback (most recent call last):
|   File "/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/jack/1.9.22/git/./waf", line 166, in <module>
|     from waflib import Scripting
|   File "/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/jack/1.9.22/git/waflib/Scripting.py", line 10, in <module>
|     from waflib import Utils, Configure, Logs, Options, ConfigSet, Context, Errors, Build, Node
|   File "/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/jack/1.9.22/git/waflib/Configure.py", line 16, in <module>
|     from waflib import ConfigSet, Utils, Options, Logs, Context, Build, Errors
|   File "/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/jack/1.9.22/git/waflib/Options.py", line 14, in <module>
|     from waflib import Logs, Utils, Context, Errors
|   File "/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/jack/1.9.22/git/waflib/Context.py", line 9, in <module>
|     import os, re, imp, sys
| ModuleNotFoundError: No module named 'imp'

  the 2nd one avoids SyntaxWarning from waf --version which causes
  waf_preconfigure to fail, because SyntaxWarning ends in
    waf_preconfigure to fail, because SyntaxWarning ends in bb.utils.vercmp_string_op:

jack/1.9.22/git $ python3 waf --version
/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/jack/1.9.22/git/waflib/Context.py:617: SyntaxWarning: invalid escape sequence '\_'
  """
/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/jack/1.9.22/git/waflib/Build.py:107: SyntaxWarning: invalid escape sequence '\*'
  """List of targets to build (default: \*)"""
/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/jack/1.9.22/git/waflib/Task.py:1047: SyntaxWarning: invalid escape sequence '\w'
  re_cond = re.compile('(?P<var>\w+)|(?P<or>\|)|(?P<and>&)')
/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/jack/1.9.22/git/waflib/TaskGen.py:730: SyntaxWarning: invalid escape sequence '\w'
  re_m4 = re.compile('@(\w+)@', re.M)
waf 2.0.12 (54841218840ffa34fddf834680a5a17db69caa12)

As reported in
https://lists.openembedded.org/g/openembedded-core/message/194348

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ...0001-Conceal-imp-warnings-in-Python3.patch |  34 +++
 ...ationWarning-invalid-escape-sequence.patch | 229 ++++++++++++++++++
 .../recipes-multimedia/jack/jack_1.9.22.bb    |   5 +-
 3 files changed, 267 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-multimedia/jack/jack/0001-Conceal-imp-warnings-in-Python3.patch
 create mode 100644 meta-oe/recipes-multimedia/jack/jack/0002-Fix-all-DeprecationWarning-invalid-escape-sequence.patch

diff --git a/meta-oe/recipes-multimedia/jack/jack/0001-Conceal-imp-warnings-in-Python3.patch b/meta-oe/recipes-multimedia/jack/jack/0001-Conceal-imp-warnings-in-Python3.patch
new file mode 100644
index 0000000000..8411d12caf
--- /dev/null
+++ b/meta-oe/recipes-multimedia/jack/jack/0001-Conceal-imp-warnings-in-Python3.patch
@@ -0,0 +1,34 @@
+From f864a2aa29377a77c3aef61ce917cc03d099c430 Mon Sep 17 00:00:00 2001
+From: Thomas Nagy <tnagy@waf.io>
+Date: Wed, 14 Aug 2019 22:05:45 +0200
+Subject: [PATCH] Conceal imp warnings in Python3
+
+---
+Upstream-Status: Backport [from waflib not jack: https://gitlab.com/ita1024/waf/-/commit/d2060dfd8af4edb5824153ff24e207b39ecd67a2.patch]
+
+ waflib/Context.py | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/waflib/Context.py b/waflib/Context.py
+index 761b521f..38ab03f1 100644
+--- a/waflib/Context.py
++++ b/waflib/Context.py
+@@ -6,10 +6,17 @@
+ Classes and functions enabling the command system
+ """
+ 
+-import os, re, imp, sys
++import os, re, sys
+ from waflib import Utils, Errors, Logs
+ import waflib.Node
+ 
++if sys.hexversion > 0x3040000:
++	import types
++	class imp(object):
++		new_module = lambda x: types.ModuleType(x)
++else:
++	import imp
++
+ # the following 3 constants are updated on each new release (do not touch)
+ HEXVERSION=0x2000c00
+ """Constant updated on new releases"""
diff --git a/meta-oe/recipes-multimedia/jack/jack/0002-Fix-all-DeprecationWarning-invalid-escape-sequence.patch b/meta-oe/recipes-multimedia/jack/jack/0002-Fix-all-DeprecationWarning-invalid-escape-sequence.patch
new file mode 100644
index 0000000000..cbced56a67
--- /dev/null
+++ b/meta-oe/recipes-multimedia/jack/jack/0002-Fix-all-DeprecationWarning-invalid-escape-sequence.patch
@@ -0,0 +1,229 @@
+From bcba27168d99a3919b730e6a533cf79ab3b24eee Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Micka=C3=ABl=20Schoentgen?= <contact@tiger-222.fr>
+Date: Sat, 5 Jan 2019 12:02:42 +0100
+Subject: [PATCH] Fix all DeprecationWarning: invalid escape sequence
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Mickaël Schoentgen <contact@tiger-222.fr>
+---
+Upstream-Status: Backport [from waflib not jack: https://gitlab.com/ita1024/waf/-/commit/412a9b819e86a0061f990c7245f0f5db76d0eda3]
+
+ waflib/Build.py           |  2 +-
+ waflib/ConfigSet.py       |  2 +-
+ waflib/Context.py         |  2 +-
+ waflib/Task.py            |  2 +-
+ waflib/TaskGen.py         |  2 +-
+ waflib/Tools/c_config.py  |  2 +-
+ waflib/Tools/c_preproc.py |  6 +++---
+ waflib/Tools/msvc.py      | 16 ++++++++--------
+ waflib/Utils.py           |  2 +-
+ waflib/ansiterm.py        |  2 +-
+ 10 files changed, 19 insertions(+), 19 deletions(-)
+
+diff --git a/waflib/Build.py b/waflib/Build.py
+index c9661df1..9e733c9e 100644
+--- a/waflib/Build.py
++++ b/waflib/Build.py
+@@ -104,7 +104,7 @@ class BuildContext(Context.Context):
+ 		"""Amount of jobs to run in parallel"""
+ 
+ 		self.targets = Options.options.targets
+-		"""List of targets to build (default: \*)"""
++		"""List of targets to build (default: \\*)"""
+ 
+ 		self.keep = Options.options.keep
+ 		"""Whether the build should continue past errors"""
+diff --git a/waflib/ConfigSet.py b/waflib/ConfigSet.py
+index 84736c9c..901fba6c 100644
+--- a/waflib/ConfigSet.py
++++ b/waflib/ConfigSet.py
+@@ -11,7 +11,7 @@ The values put in :py:class:`ConfigSet` must be serializable (dicts, lists, stri
+ 
+ import copy, re, os
+ from waflib import Logs, Utils
+-re_imp = re.compile('^(#)*?([^#=]*?)\ =\ (.*?)$', re.M)
++re_imp = re.compile(r'^(#)*?([^#=]*?)\ =\ (.*?)$', re.M)
+ 
+ class ConfigSet(object):
+ 	"""
+diff --git a/waflib/Context.py b/waflib/Context.py
+index 38ab03f1..5799a60a 100644
+--- a/waflib/Context.py
++++ b/waflib/Context.py
+@@ -614,7 +614,7 @@ class Context(ctx):
+ 		Logs.pprint(color, msg)
+ 
+ 	def load_special_tools(self, var, ban=[]):
+-		"""
++		r"""
+ 		Loads third-party extensions modules for certain programming languages
+ 		by trying to list certain files in the extras/ directory. This method
+ 		is typically called once for a programming language group, see for
+diff --git a/waflib/Task.py b/waflib/Task.py
+index 6aebc607..0c5cb994 100644
+--- a/waflib/Task.py
++++ b/waflib/Task.py
+@@ -1044,7 +1044,7 @@ def funex(c):
+ 	exec(c, dc)
+ 	return dc['f']
+ 
+-re_cond = re.compile('(?P<var>\w+)|(?P<or>\|)|(?P<and>&)')
++re_cond = re.compile(r'(?P<var>\w+)|(?P<or>\|)|(?P<and>&)')
+ re_novar = re.compile(r'^(SRC|TGT)\W+.*?$')
+ reg_act = re.compile(r'(?P<backslash>\\)|(?P<dollar>\$\$)|(?P<subst>\$\{(?P<var>\w+)(?P<code>.*?)\})', re.M)
+ def compile_fun_shell(line):
+diff --git a/waflib/TaskGen.py b/waflib/TaskGen.py
+index a74e6431..3776bac1 100644
+--- a/waflib/TaskGen.py
++++ b/waflib/TaskGen.py
+@@ -727,7 +727,7 @@ def sequence_order(self):
+ 	self.bld.prev = self
+ 
+ 
+-re_m4 = re.compile('@(\w+)@', re.M)
++re_m4 = re.compile(r'@(\w+)@', re.M)
+ 
+ class subst_pc(Task.Task):
+ 	"""
+diff --git a/waflib/Tools/c_config.py b/waflib/Tools/c_config.py
+index d2b3c0d8..60cc0ecd 100644
+--- a/waflib/Tools/c_config.py
++++ b/waflib/Tools/c_config.py
+@@ -239,7 +239,7 @@ def validate_cfg(self, kw):
+ 
+ @conf
+ def exec_cfg(self, kw):
+-	"""
++	r"""
+ 	Executes ``pkg-config`` or other ``-config`` applications to collect configuration flags:
+ 
+ 	* if atleast_pkgconfig_version is given, check that pkg-config has the version n and return
+diff --git a/waflib/Tools/c_preproc.py b/waflib/Tools/c_preproc.py
+index 7e04b4a7..68e5f5ae 100644
+--- a/waflib/Tools/c_preproc.py
++++ b/waflib/Tools/c_preproc.py
+@@ -75,13 +75,13 @@ re_lines = re.compile(
+ 	re.IGNORECASE | re.MULTILINE)
+ """Match #include lines"""
+ 
+-re_mac = re.compile("^[a-zA-Z_]\w*")
++re_mac = re.compile(r"^[a-zA-Z_]\w*")
+ """Match macro definitions"""
+ 
+ re_fun = re.compile('^[a-zA-Z_][a-zA-Z0-9_]*[(]')
+ """Match macro functions"""
+ 
+-re_pragma_once = re.compile('^\s*once\s*', re.IGNORECASE)
++re_pragma_once = re.compile(r'^\s*once\s*', re.IGNORECASE)
+ """Match #pragma once statements"""
+ 
+ re_nl = re.compile('\\\\\r*\n', re.MULTILINE)
+@@ -660,7 +660,7 @@ def extract_macro(txt):
+ 			# empty define, assign an empty token
+ 			return (v, [[], [('T','')]])
+ 
+-re_include = re.compile('^\s*(<(?:.*)>|"(?:.*)")')
++re_include = re.compile(r'^\s*(<(?:.*)>|"(?:.*)")')
+ def extract_include(txt, defs):
+ 	"""
+ 	Process a line in the form::
+diff --git a/waflib/Tools/msvc.py b/waflib/Tools/msvc.py
+index 17b347d4..ff58449d 100644
+--- a/waflib/Tools/msvc.py
++++ b/waflib/Tools/msvc.py
+@@ -281,7 +281,7 @@ def gather_wince_supported_platforms():
+ 
+ def gather_msvc_detected_versions():
+ 	#Detected MSVC versions!
+-	version_pattern = re.compile('^(\d\d?\.\d\d?)(Exp)?$')
++	version_pattern = re.compile(r'^(\d\d?\.\d\d?)(Exp)?$')
+ 	detected_versions = []
+ 	for vcver,vcvar in (('VCExpress','Exp'), ('VisualStudio','')):
+ 		prefix = 'SOFTWARE\\Wow6432node\\Microsoft\\' + vcver
+@@ -367,7 +367,7 @@ def gather_wsdk_versions(conf, versions):
+ 	:param versions: list to modify
+ 	:type versions: list
+ 	"""
+-	version_pattern = re.compile('^v..?.?\...?.?')
++	version_pattern = re.compile(r'^v..?.?\...?.?')
+ 	try:
+ 		all_versions = Utils.winreg.OpenKey(Utils.winreg.HKEY_LOCAL_MACHINE, 'SOFTWARE\\Wow6432node\\Microsoft\\Microsoft SDKs\\Windows')
+ 	except OSError:
+@@ -525,7 +525,7 @@ def gather_icl_versions(conf, versions):
+ 	:param versions: list to modify
+ 	:type versions: list
+ 	"""
+-	version_pattern = re.compile('^...?.?\....?.?')
++	version_pattern = re.compile(r'^...?.?\....?.?')
+ 	try:
+ 		all_versions = Utils.winreg.OpenKey(Utils.winreg.HKEY_LOCAL_MACHINE, 'SOFTWARE\\Wow6432node\\Intel\\Compilers\\C++')
+ 	except OSError:
+@@ -579,7 +579,7 @@ def gather_intel_composer_versions(conf, versions):
+ 	:param versions: list to modify
+ 	:type versions: list
+ 	"""
+-	version_pattern = re.compile('^...?.?\...?.?.?')
++	version_pattern = re.compile(r'^...?.?\...?.?.?')
+ 	try:
+ 		all_versions = Utils.winreg.OpenKey(Utils.winreg.HKEY_LOCAL_MACHINE, 'SOFTWARE\\Wow6432node\\Intel\\Suites')
+ 	except OSError:
+@@ -683,7 +683,7 @@ def find_lt_names_msvc(self, libname, is_static=False):
+ 				if not is_static and ltdict.get('library_names', ''):
+ 					dllnames=ltdict['library_names'].split()
+ 					dll=dllnames[0].lower()
+-					dll=re.sub('\.dll$', '', dll)
++					dll=re.sub(r'\.dll$', '', dll)
+ 					return (lt_libdir, dll, False)
+ 				elif ltdict.get('old_library', ''):
+ 					olib=ltdict['old_library']
+@@ -700,7 +700,7 @@ def find_lt_names_msvc(self, libname, is_static=False):
+ @conf
+ def libname_msvc(self, libname, is_static=False):
+ 	lib = libname.lower()
+-	lib = re.sub('\.lib$','',lib)
++	lib = re.sub(r'\.lib$','',lib)
+ 
+ 	if lib in g_msvc_systemlibs:
+ 		return lib
+@@ -747,11 +747,11 @@ def libname_msvc(self, libname, is_static=False):
+ 		for libn in libnames:
+ 			if os.path.exists(os.path.join(path, libn)):
+ 				Logs.debug('msvc: lib found: %s', os.path.join(path,libn))
+-				return re.sub('\.lib$', '',libn)
++				return re.sub(r'\.lib$', '',libn)
+ 
+ 	#if no lib can be found, just return the libname as msvc expects it
+ 	self.fatal('The library %r could not be found' % libname)
+-	return re.sub('\.lib$', '', libname)
++	return re.sub(r'\.lib$', '', libname)
+ 
+ @conf
+ def check_lib_msvc(self, libname, is_static=False, uselib_store=None):
+diff --git a/waflib/Utils.py b/waflib/Utils.py
+index a0cc2a09..da1b73e7 100644
+--- a/waflib/Utils.py
++++ b/waflib/Utils.py
+@@ -730,7 +730,7 @@ def unversioned_sys_platform():
+ 	if s == 'cli' and os.name == 'nt':
+ 		# ironpython is only on windows as far as we know
+ 		return 'win32'
+-	return re.split('\d+$', s)[0]
++	return re.split(r'\d+$', s)[0]
+ 
+ def nada(*k, **kw):
+ 	"""
+diff --git a/waflib/ansiterm.py b/waflib/ansiterm.py
+index 0d20c637..027f0ad6 100644
+--- a/waflib/ansiterm.py
++++ b/waflib/ansiterm.py
+@@ -264,7 +264,7 @@ else:
+ 			'u': pop_cursor,
+ 		}
+ 		# Match either the escape sequence or text not containing escape sequence
+-		ansi_tokens = re.compile('(?:\x1b\[([0-9?;]*)([a-zA-Z])|([^\x1b]+))')
++		ansi_tokens = re.compile(r'(?:\x1b\[([0-9?;]*)([a-zA-Z])|([^\x1b]+))')
+ 		def write(self, text):
+ 			try:
+ 				wlock.acquire()
diff --git a/meta-oe/recipes-multimedia/jack/jack_1.9.22.bb b/meta-oe/recipes-multimedia/jack/jack_1.9.22.bb
index b5c52a6edc..bb844e4ff1 100644
--- a/meta-oe/recipes-multimedia/jack/jack_1.9.22.bb
+++ b/meta-oe/recipes-multimedia/jack/jack_1.9.22.bb
@@ -16,7 +16,10 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS = "libsamplerate0 libsndfile1"
 
-SRC_URI = "git://github.com/jackaudio/jack2.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/jackaudio/jack2.git;branch=master;protocol=https \
+    file://0001-Conceal-imp-warnings-in-Python3.patch \
+    file://0002-Fix-all-DeprecationWarning-invalid-escape-sequence.patch \
+"
 SRCREV = "4f58969432339a250ce87fe855fb962c67d00ddb"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
-- 
2.43.0


