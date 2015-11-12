Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1E71E771F7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 10:44:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tACAiWtn022001
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 02:44:32 -0800 (PST)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 12 Nov 2015 02:44:31 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 12 Nov 2015 18:44:24 +0800
Message-ID: <91df606158a9be43155e994b4534106cbb53315e.1447324249.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1447324249.git.jackie.huang@windriver.com>
References: <cover.1447324249.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/6] samba: backport patches for cross-compiling
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Nov 2015 10:44:32 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

* Adds a new mode for samba cross-compiling:

  When both --cross-answers and --cross-execute are set, this means:
  - Use cross-answers
  - If answer is unknown, then instead of adding UNKNOWN to the cross-answers
    file and failing configure, the new mode runs cross-execute to determine the
    answer and adds that to the cross-answers file.

* And some fixes and improvements for cross-compiling.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 ...1-waf-sanitize-and-fix-added-cross-answer.patch |  60 ++++++++
 ...-Adds-a-new-mode-to-samba-cross-compiling.patch | 112 ++++++++++++++
 ...-readability-of-cross-answers-generated-b.patch |  66 ++++++++
 ...wafsamba-CHECK_SIZEOF-cross-compile-frien.patch |  72 +++++++++
 .../0005-build-unify-and-fix-endian-tests.patch    | 169 +++++++++++++++++++++
 ...006-avoid-using-colon-in-the-checking-msg.patch |  32 ++++
 ...sing-of-cross-answers-file-in-case-answer.patch |  36 +++++
 meta-oe/recipes-connectivity/samba/samba_4.1.12.bb |   7 +
 8 files changed, 554 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/samba/samba-4.1.12/0001-waf-sanitize-and-fix-added-cross-answer.patch
 create mode 100644 meta-oe/recipes-connectivity/samba/samba-4.1.12/0002-Adds-a-new-mode-to-samba-cross-compiling.patch
 create mode 100644 meta-oe/recipes-connectivity/samba/samba-4.1.12/0003-waf-improve-readability-of-cross-answers-generated-b.patch
 create mode 100644 meta-oe/recipes-connectivity/samba/samba-4.1.12/0004-build-make-wafsamba-CHECK_SIZEOF-cross-compile-frien.patch
 create mode 100644 meta-oe/recipes-connectivity/samba/samba-4.1.12/0005-build-unify-and-fix-endian-tests.patch
 create mode 100644 meta-oe/recipes-connectivity/samba/samba-4.1.12/0006-avoid-using-colon-in-the-checking-msg.patch
 create mode 100644 meta-oe/recipes-connectivity/samba/samba-4.1.12/0007-waf-Fix-parsing-of-cross-answers-file-in-case-answer.patch

diff --git a/meta-oe/recipes-connectivity/samba/samba-4.1.12/0001-waf-sanitize-and-fix-added-cross-answer.patch b/meta-oe/recipes-connectivity/samba/samba-4.1.12/0001-waf-sanitize-and-fix-added-cross-answer.patch
new file mode 100644
index 0000000..69668c0
--- /dev/null
+++ b/meta-oe/recipes-connectivity/samba/samba-4.1.12/0001-waf-sanitize-and-fix-added-cross-answer.patch
@@ -0,0 +1,60 @@
+From 1b32c7d7f148bcf2598799b21dfa3ba1ed824d32 Mon Sep 17 00:00:00 2001
+From: Uri Simchoni <urisimchoni@gmail.com>
+Date: Mon, 18 May 2015 21:12:06 +0300
+Subject: [PATCH 1/7] waf: sanitize and fix added cross answer
+
+When configuring samba for cross-compilation using the cross-answers
+method, the function add_answer receives the standard output and exit code
+of a configuration test and updates the cross-answers file accordingly.
+
+This patch sanitizes the standard output to conform to the cross-answers
+file format - one line of output. It also adds a missing newline.
+
+(Note - at this point add_answer is only ever called with empty output
+but this change is significant for the reminder of this patchset)
+
+Signed-off-by: Uri Simchoni <urisimchoni@gmail.com>
+Reviewed-by: Andrew Bartlett <abartlet@samba.org>
+Reviewed-by: Alexander Bokovoy <ab@samba.org>
+
+Upstream-Status: Backport
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ buildtools/wafsamba/samba_cross.py | 13 +++++++++++--
+ 1 file changed, 11 insertions(+), 2 deletions(-)
+
+diff --git a/buildtools/wafsamba/samba_cross.py b/buildtools/wafsamba/samba_cross.py
+index 3838e34..fc1d78e 100644
+--- a/buildtools/wafsamba/samba_cross.py
++++ b/buildtools/wafsamba/samba_cross.py
+@@ -19,6 +19,16 @@ def add_answer(ca_file, msg, answer):
+     except:
+         Logs.error("Unable to open cross-answers file %s" % ca_file)
+         sys.exit(1)
++    (retcode, retstring) = answer
++    # if retstring is more than one line then we probably
++    # don't care about its actual content (the tests should
++    # yield one-line output in order to comply with the cross-answer
++    # format)
++    retstring = retstring.strip()
++    if len(retstring.split('\n')) > 1:
++        retstring = ''
++    answer = (retcode, retstring)
++
+     if answer == ANSWER_OK:
+         f.write('%s: OK\n' % msg)
+     elif answer == ANSWER_UNKNOWN:
+@@ -26,8 +36,7 @@ def add_answer(ca_file, msg, answer):
+     elif answer == ANSWER_FAIL:
+         f.write('%s: FAIL\n' % msg)
+     else:
+-        (retcode, retstring) = answer
+-        f.write('%s: (%d, "%s")' % (msg, retcode, retstring))
++        f.write('%s: (%d, "%s")\n' % (msg, retcode, retstring))
+     f.close()
+ 
+ 
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-connectivity/samba/samba-4.1.12/0002-Adds-a-new-mode-to-samba-cross-compiling.patch b/meta-oe/recipes-connectivity/samba/samba-4.1.12/0002-Adds-a-new-mode-to-samba-cross-compiling.patch
new file mode 100644
index 0000000..fce3abc
--- /dev/null
+++ b/meta-oe/recipes-connectivity/samba/samba-4.1.12/0002-Adds-a-new-mode-to-samba-cross-compiling.patch
@@ -0,0 +1,112 @@
+From add52538b9a0ccf66ca87c7a691bf59901765849 Mon Sep 17 00:00:00 2001
+From: Uri Simchoni <urisimchoni@gmail.com>
+Date: Mon, 18 May 2015 21:15:19 +0300
+Subject: [PATCH 2/7] Adds a new mode to samba cross-compiling.
+
+When both --cross-answers and --cross-execute are set, this means:
+- Use cross-answers
+- If answer is unknown, then instead of adding UNKNOWN to the cross-answers
+  file and failing configure, the new mode runs cross-execute to determine the
+  answer and adds that to the cross-answers file.
+
+Signed-off-by: Uri Simchoni <urisimchoni@gmail.com>
+Reviewed-by: Andrew Bartlett <abartlet@samba.org>
+Reviewed-by: Alexander Bokovoy <ab@samba.org>
+
+Upstream-Status: Backport
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ buildtools/wafsamba/samba_cross.py | 46 ++++++++++++++++++++++++++++----------
+ 1 file changed, 34 insertions(+), 12 deletions(-)
+
+diff --git a/buildtools/wafsamba/samba_cross.py b/buildtools/wafsamba/samba_cross.py
+index fc1d78e..3f1ef12 100644
+--- a/buildtools/wafsamba/samba_cross.py
++++ b/buildtools/wafsamba/samba_cross.py
+@@ -45,7 +45,6 @@ def cross_answer(ca_file, msg):
+     try:
+         f = open(ca_file, 'r')
+     except:
+-        add_answer(ca_file, msg, ANSWER_UNKNOWN)
+         return ANSWER_UNKNOWN
+     for line in f:
+         line = line.strip()
+@@ -78,7 +77,6 @@ def cross_answer(ca_file, msg):
+                 else:
+                     raise Utils.WafError("Bad answer format '%s' in %s" % (line, ca_file))
+     f.close()
+-    add_answer(ca_file, msg, ANSWER_UNKNOWN)
+     return ANSWER_UNKNOWN
+ 
+ 
+@@ -86,24 +84,47 @@ class cross_Popen(Utils.pproc.Popen):
+     '''cross-compilation wrapper for Popen'''
+     def __init__(*k, **kw):
+         (obj, args) = k
+-
+-        if '--cross-execute' in args:
+-            # when --cross-execute is set, then change the arguments
+-            # to use the cross emulator
+-            i = args.index('--cross-execute')
+-            newargs = args[i+1].split()
+-            newargs.extend(args[0:i])
+-            args = newargs
+-        elif '--cross-answers' in args:
++        use_answers = False
++        ans = ANSWER_UNKNOWN
++
++        # Three possibilities:
++        #   1. Only cross-answers - try the cross-answers file, and if
++        #      there's no corresponding answer, add to the file and mark
++        #      the configure process as unfinished.
++        #   2. Only cross-execute - get the answer from cross-execute
++        #   3. Both - try the cross-answers file, and if there is no
++        #      corresponding answer - use cross-execute to get an answer,
++        #       and add that answer to the file.
++        if '--cross-answers' in args:
+             # when --cross-answers is set, then change the arguments
+             # to use the cross answers if available
++            use_answers = True
+             i = args.index('--cross-answers')
+             ca_file = args[i+1]
+             msg     = args[i+2]
+             ans = cross_answer(ca_file, msg)
++
++        if '--cross-execute' in args and ans == ANSWER_UNKNOWN:
++            # when --cross-execute is set, then change the arguments
++            # to use the cross emulator
++            i = args.index('--cross-execute')
++            newargs = args[i+1].split()
++            newargs.extend(args[0:i])
++            if use_answers:
++                p = real_Popen(newargs,
++                               stdout=Utils.pproc.PIPE,
++                               stderr=Utils.pproc.PIPE)
++                ce_out, ce_err = p.communicate()
++                ans = (p.returncode, ce_out)
++                add_answer(ca_file, msg, ans)
++            else:
++                args = newargs
++
++        if use_answers:
+             if ans == ANSWER_UNKNOWN:
+                 global cross_answers_incomplete
+                 cross_answers_incomplete = True
++                add_answer(ca_file, msg, ans)
+             (retcode, retstring) = ans
+             args = ['/bin/sh', '-c', "echo -n '%s'; exit %d" % (retstring, retcode)]
+         real_Popen.__init__(*(obj, args), **kw)
+@@ -124,7 +145,8 @@ def SAMBA_CROSS_ARGS(conf, msg=None):
+ 
+     if conf.env.CROSS_EXECUTE:
+         ret.extend(['--cross-execute', conf.env.CROSS_EXECUTE])
+-    elif conf.env.CROSS_ANSWERS:
++
++    if conf.env.CROSS_ANSWERS:
+         if msg is None:
+             raise Utils.WafError("Cannot have NULL msg in cross-answers")
+         ret.extend(['--cross-answers', os.path.join(Options.launch_dir, conf.env.CROSS_ANSWERS), msg])
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-connectivity/samba/samba-4.1.12/0003-waf-improve-readability-of-cross-answers-generated-b.patch b/meta-oe/recipes-connectivity/samba/samba-4.1.12/0003-waf-improve-readability-of-cross-answers-generated-b.patch
new file mode 100644
index 0000000..ec17d9d
--- /dev/null
+++ b/meta-oe/recipes-connectivity/samba/samba-4.1.12/0003-waf-improve-readability-of-cross-answers-generated-b.patch
@@ -0,0 +1,66 @@
+From f7052d633396005563e44509428503f42c9faa97 Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Thu, 12 Nov 2015 01:00:11 -0500
+Subject: [PATCH 3/7] waf: improve readability of cross-answers generated by cross-execute
+
+When generating a result for cross-answers from the (retcode, retstring) tuple:
+- (0, "output") indicated as "output"
+- 1 is interpreted as generic fail code, instead of 255, because most
+  if not all tests fail with 1 as exit code rather than 255
+- For failing test, use NO instead of FAIL, because that's not
+  necessarily a failure (it could mean that something is NOT
+  broken)
+
+Signed-off-by: Uri Simchoni <urisimchoni@gmail.com>
+Reviewed-by: Andrew Bartlett <abartlet@samba.org>
+Reviewed-by: Alexander Bokovoy <ab@samba.org>
+
+Upstream-Status: Backport
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ buildtools/wafsamba/samba_cross.py | 13 ++++++++-----
+ 1 file changed, 8 insertions(+), 5 deletions(-)
+
+diff --git a/buildtools/wafsamba/samba_cross.py b/buildtools/wafsamba/samba_cross.py
+index 3f1ef12..d1e7006 100644
+--- a/buildtools/wafsamba/samba_cross.py
++++ b/buildtools/wafsamba/samba_cross.py
+@@ -6,7 +6,7 @@ from Configure import conf
+ real_Popen = None
+ 
+ ANSWER_UNKNOWN = (254, "")
+-ANSWER_FAIL    = (255, "")
++ANSWER_NO      = (1, "")
+ ANSWER_OK      = (0, "")
+ 
+ cross_answers_incomplete = False
+@@ -33,10 +33,13 @@ def add_answer(ca_file, msg, answer):
+         f.write('%s: OK\n' % msg)
+     elif answer == ANSWER_UNKNOWN:
+         f.write('%s: UNKNOWN\n' % msg)
+-    elif answer == ANSWER_FAIL:
+-        f.write('%s: FAIL\n' % msg)
++    elif answer == ANSWER_NO:
++        f.write('%s: NO\n' % msg)
+     else:
+-        f.write('%s: (%d, "%s")\n' % (msg, retcode, retstring))
++        if retcode == 0:
++            f.write('%s: "%s"\n' % (msg, retstring))
++        else:
++            f.write('%s: (%d, "%s")\n' % (msg, retcode, retstring))
+     f.close()
+ 
+ 
+@@ -64,7 +67,7 @@ def cross_answer(ca_file, msg):
+                 return ANSWER_UNKNOWN
+             elif ans == "FAIL" or ans == "NO":
+                 f.close()
+-                return ANSWER_FAIL
++                return ANSWER_NO
+             elif ans[0] == '"':
+                 return (0, ans.strip('"'))
+             elif ans[0] == "'":
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-connectivity/samba/samba-4.1.12/0004-build-make-wafsamba-CHECK_SIZEOF-cross-compile-frien.patch b/meta-oe/recipes-connectivity/samba/samba-4.1.12/0004-build-make-wafsamba-CHECK_SIZEOF-cross-compile-frien.patch
new file mode 100644
index 0000000..3fbb770
--- /dev/null
+++ b/meta-oe/recipes-connectivity/samba/samba-4.1.12/0004-build-make-wafsamba-CHECK_SIZEOF-cross-compile-frien.patch
@@ -0,0 +1,72 @@
+From 8ffb1892b5c42d8d29124d274aa4b5f1726d7e9f Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Mon, 21 Apr 2014 10:18:16 -0300
+Subject: [PATCH 4/7] build: make wafsamba CHECK_SIZEOF cross-compile friendly
+
+Use the same trick as commit 0d9bb86293c9d39298786df095c73a6251b08b7e
+We do the same array trick iteratively starting from 1 (byte) by powers
+of 2 up to 32.
+
+The new 'critical' option is used to make the invocation die or not
+according to each test.
+The default is True since normally it's expected to find a proper
+result and should error out if not.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Reviewed-by: Andrew Bartlett <abartlet@samba.org>
+Reviewed-by: David Disseldorp <ddiss@samba.org>
+
+Upstream-Status: Backport
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ buildtools/wafsamba/samba_autoconf.py | 28 ++++++++++++++++------------
+ 1 file changed, 16 insertions(+), 12 deletions(-)
+
+diff --git a/buildtools/wafsamba/samba_autoconf.py b/buildtools/wafsamba/samba_autoconf.py
+index fe110bd..59953d9 100644
+--- a/buildtools/wafsamba/samba_autoconf.py
++++ b/buildtools/wafsamba/samba_autoconf.py
+@@ -304,23 +304,27 @@ def CHECK_FUNCS(conf, list, link=True, lib=None, headers=None):
+ 
+ 
+ @conf
+-def CHECK_SIZEOF(conf, vars, headers=None, define=None):
++def CHECK_SIZEOF(conf, vars, headers=None, define=None, critical=True):
+     '''check the size of a type'''
+-    ret = True
+     for v in TO_LIST(vars):
+         v_define = define
++        ret = False
+         if v_define is None:
+             v_define = 'SIZEOF_%s' % v.upper().replace(' ', '_')
+-        if not CHECK_CODE(conf,
+-                          'printf("%%u", (unsigned)sizeof(%s))' % v,
+-                          define=v_define,
+-                          execute=True,
+-                          define_ret=True,
+-                          quote=False,
+-                          headers=headers,
+-                          local_include=False,
+-                          msg="Checking size of %s" % v):
+-            ret = False
++        for size in list((1, 2, 4, 8, 16, 32)):
++            if CHECK_CODE(conf,
++                      'static int test_array[1 - 2 * !(((long int)(sizeof(%s))) <= %d)];' % (v, size),
++                      define=v_define,
++                      quote=False,
++                      headers=headers,
++                      local_include=False,
++                      msg="Checking if size of %s == %d" % (v, size)):
++                conf.DEFINE(v_define, size)
++                ret = True
++                break
++        if not ret and critical:
++            Logs.error("Couldn't determine size of '%s'" % v)
++            sys.exit(1)
+     return ret
+ 
+ @conf
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-connectivity/samba/samba-4.1.12/0005-build-unify-and-fix-endian-tests.patch b/meta-oe/recipes-connectivity/samba/samba-4.1.12/0005-build-unify-and-fix-endian-tests.patch
new file mode 100644
index 0000000..5546b6d
--- /dev/null
+++ b/meta-oe/recipes-connectivity/samba/samba-4.1.12/0005-build-unify-and-fix-endian-tests.patch
@@ -0,0 +1,169 @@
+From 81379b6b14ea725c72953be2170b382403ed8728 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Mon, 21 Apr 2014 10:18:15 -0300
+Subject: [PATCH 5/7] build: unify and fix endian tests
+
+Unify the endian tests out of lib/ccan/wscript into wafsamba since
+they're almost cross-compile friendly.
+While at it fix them to be so by moving the preprocessor directives out
+of main scope since that will fail.
+And keep the WORDS_BIGENDIAN, HAVE_LITTLE_ENDIAN and HAVE_BIG_ENDIAN
+defines separate because of different codebases.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Reviewed-by: Andrew Bartlett <abartlet@samba.org>
+Reviewed-by: David Disseldorp <ddiss@samba.org>
+
+Upstream-Status: Backport
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ buildtools/wafsamba/wscript | 65 ++++++++++++++++++++++++++++++++++++++++++---
+ lib/ccan/wscript            | 55 --------------------------------------
+ 2 files changed, 62 insertions(+), 58 deletions(-)
+
+diff --git a/buildtools/wafsamba/wscript b/buildtools/wafsamba/wscript
+index 7984227..1a2cfe6 100755
+--- a/buildtools/wafsamba/wscript
++++ b/buildtools/wafsamba/wscript
+@@ -390,9 +390,68 @@ def configure(conf):
+     else:
+         conf.define('SHLIBEXT', "so", quote=True)
+ 
+-    conf.CHECK_CODE('long one = 1; return ((char *)(&one))[0]',
+-                    execute=True,
+-                    define='WORDS_BIGENDIAN')
++    # First try a header check for cross-compile friendlyness
++    conf.CHECK_CODE(code = """#ifdef __BYTE_ORDER
++                        #define B __BYTE_ORDER
++                        #elif defined(BYTE_ORDER)
++                        #define B BYTE_ORDER
++                        #endif
++
++                        #ifdef __LITTLE_ENDIAN
++                        #define LITTLE __LITTLE_ENDIAN
++                        #elif defined(LITTLE_ENDIAN)
++                        #define LITTLE LITTLE_ENDIAN
++                        #endif
++
++                        #if !defined(LITTLE) || !defined(B) || LITTLE != B
++                        #error Not little endian.
++                        #endif
++                        int main(void) { return 0; }""",
++                            addmain=False,
++                            headers="endian.h sys/endian.h",
++                            define="HAVE_LITTLE_ENDIAN")
++    conf.CHECK_CODE(code = """#ifdef __BYTE_ORDER
++                        #define B __BYTE_ORDER
++                        #elif defined(BYTE_ORDER)
++                        #define B BYTE_ORDER
++                        #endif
++
++                        #ifdef __BIG_ENDIAN
++                        #define BIG __BIG_ENDIAN
++                        #elif defined(BIG_ENDIAN)
++                        #define BIG BIG_ENDIAN
++                        #endif
++
++                        #if !defined(BIG) || !defined(B) || BIG != B
++                        #error Not big endian.
++                        #endif
++                        int main(void) { return 0; }""",
++                            addmain=False,
++                            headers="endian.h sys/endian.h",
++                            define="HAVE_BIG_ENDIAN")
++
++    if not conf.CONFIG_SET("HAVE_BIG_ENDIAN") and not conf.CONFIG_SET("HAVE_LITTLE_ENDIAN"):
++        # That didn't work!  Do runtime test.
++        conf.CHECK_CODE("""union { int i; char c[sizeof(int)]; } u;
++            u.i = 0x01020304;
++            return u.c[0] == 0x04 && u.c[1] == 0x03 && u.c[2] == 0x02 && u.c[3] == 0x01 ? 0 : 1;""",
++                          addmain=True, execute=True,
++                          define='HAVE_LITTLE_ENDIAN',
++                          msg="Checking for HAVE_LITTLE_ENDIAN - runtime")
++        conf.CHECK_CODE("""union { int i; char c[sizeof(int)]; } u;
++            u.i = 0x01020304;
++            return u.c[0] == 0x01 && u.c[1] == 0x02 && u.c[2] == 0x03 && u.c[3] == 0x04 ? 0 : 1;""",
++                          addmain=True, execute=True,
++                          define='HAVE_BIG_ENDIAN',
++                          msg="Checking for HAVE_BIG_ENDIAN - runtime")
++
++    # Extra sanity check.
++    if conf.CONFIG_SET("HAVE_BIG_ENDIAN") == conf.CONFIG_SET("HAVE_LITTLE_ENDIAN"):
++        Logs.error("Failed endian determination.  The PDP-11 is back?")
++	sys.exit(1)
++    else:
++        if conf.CONFIG_SET("HAVE_BIG_ENDIAN"):
++            conf.DEFINE('WORDS_BIGENDIAN', 1)
+ 
+     # check if signal() takes a void function
+     if conf.CHECK_CODE('return *(signal (0, 0)) (0) == 1',
+diff --git a/lib/ccan/wscript b/lib/ccan/wscript
+index a0b5406..5b3a910 100644
+--- a/lib/ccan/wscript
++++ b/lib/ccan/wscript
+@@ -25,61 +25,6 @@ def configure(conf):
+     conf.CHECK_CODE('int __attribute__((used)) func(int x) { return x; }',
+                     addmain=False, link=False, cflags=conf.env['WERROR_CFLAGS'],
+                     define='HAVE_ATTRIBUTE_USED')
+-    # We try to use headers for a compile-time test.
+-    conf.CHECK_CODE(code = """#ifdef __BYTE_ORDER
+-                        #define B __BYTE_ORDER
+-                        #elif defined(BYTE_ORDER)
+-                        #define B BYTE_ORDER
+-                        #endif
+-
+-                        #ifdef __LITTLE_ENDIAN
+-                        #define LITTLE __LITTLE_ENDIAN
+-                        #elif defined(LITTLE_ENDIAN)
+-                        #define LITTLE LITTLE_ENDIAN
+-                        #endif
+-
+-                        #if !defined(LITTLE) || !defined(B) || LITTLE != B
+-                        #error Not little endian.
+-                        #endif""",
+-                           headers="endian.h sys/endian.h",
+-                           define="HAVE_LITTLE_ENDIAN")
+-    conf.CHECK_CODE(code = """#ifdef __BYTE_ORDER
+-                        #define B __BYTE_ORDER
+-                        #elif defined(BYTE_ORDER)
+-                        #define B BYTE_ORDER
+-                        #endif
+-
+-                        #ifdef __BIG_ENDIAN
+-                        #define BIG __BIG_ENDIAN
+-                        #elif defined(BIG_ENDIAN)
+-                        #define BIG BIG_ENDIAN
+-                        #endif
+-
+-                        #if !defined(BIG) || !defined(B) || BIG != B
+-                        #error Not big endian.
+-                        #endif""",
+-                           headers="endian.h sys/endian.h",
+-                           define="HAVE_BIG_ENDIAN")
+-
+-    if not conf.CONFIG_SET("HAVE_BIG_ENDIAN") and not conf.CONFIG_SET("HAVE_LITTLE_ENDIAN"):
+-        # That didn't work!  Do runtime test.
+-        conf.CHECK_CODE("""union { int i; char c[sizeof(int)]; } u;
+-	  u.i = 0x01020304;
+-	  return u.c[0] == 0x04 && u.c[1] == 0x03 && u.c[2] == 0x02 && u.c[3] == 0x01 ? 0 : 1;""",
+-                        addmain=True, execute=True,
+-                        define='HAVE_LITTLE_ENDIAN',
+-                        msg="Checking for HAVE_LITTLE_ENDIAN - runtime")
+-        conf.CHECK_CODE("""union { int i; char c[sizeof(int)]; } u;
+-	  u.i = 0x01020304;
+-	  return u.c[0] == 0x01 && u.c[1] == 0x02 && u.c[2] == 0x03 && u.c[3] == 0x04 ? 0 : 1;""",
+-                        addmain=True, execute=True,
+-                        define='HAVE_BIG_ENDIAN',
+-                        msg="Checking for HAVE_BIG_ENDIAN - runtime")
+-
+-    # Extra sanity check.
+-    if conf.CONFIG_SET("HAVE_BIG_ENDIAN") == conf.CONFIG_SET("HAVE_LITTLE_ENDIAN"):
+-        Logs.error("Failed endian determination.  The PDP-11 is back?")
+-        sys.exit(1)
+ 
+     conf.CHECK_CODE('return __builtin_choose_expr(1, 0, "garbage");',
+                     link=True,
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-connectivity/samba/samba-4.1.12/0006-avoid-using-colon-in-the-checking-msg.patch b/meta-oe/recipes-connectivity/samba/samba-4.1.12/0006-avoid-using-colon-in-the-checking-msg.patch
new file mode 100644
index 0000000..cdf7a38
--- /dev/null
+++ b/meta-oe/recipes-connectivity/samba/samba-4.1.12/0006-avoid-using-colon-in-the-checking-msg.patch
@@ -0,0 +1,32 @@
+From 5413f97290d3126262eb309ecbcf7769509f2a11 Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Tue, 10 Nov 2015 00:48:35 -0500
+Subject: [PATCH 6/7] avoid using colon in the checking msg
+
+Upstream-Status: Pending
+
+colon is used as the separator when parse from
+a answers file, the colon here makes it never
+get the right answer.
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ wscript_configure_system_mitkrb5 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/wscript_configure_system_mitkrb5 b/wscript_configure_system_mitkrb5
+index a62d00b..a2d89f0 100644
+--- a/wscript_configure_system_mitkrb5
++++ b/wscript_configure_system_mitkrb5
+@@ -240,7 +240,7 @@ conf.CHECK_CODE('''
+        ''',
+     'HAVE_WRFILE_KEYTAB',
+     headers='krb5.h', lib='krb5', execute=True,
+-    msg="Checking whether the WRFILE:-keytab is supported");
++    msg="Checking whether the WRFILE -keytab is supported");
+ # Check for KRB5_DEPRECATED handling
+ conf.CHECK_CODE('''#define KRB5_DEPRECATED 1
+        #include <krb5.h>''',
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-connectivity/samba/samba-4.1.12/0007-waf-Fix-parsing-of-cross-answers-file-in-case-answer.patch b/meta-oe/recipes-connectivity/samba/samba-4.1.12/0007-waf-Fix-parsing-of-cross-answers-file-in-case-answer.patch
new file mode 100644
index 0000000..de0d32c
--- /dev/null
+++ b/meta-oe/recipes-connectivity/samba/samba-4.1.12/0007-waf-Fix-parsing-of-cross-answers-file-in-case-answer.patch
@@ -0,0 +1,36 @@
+From 649c731526dc1473bd1804d2903d7559e63616da Mon Sep 17 00:00:00 2001
+From: Uri Simchoni <urisimchoni@gmail.com>
+Date: Mon, 4 May 2015 09:12:45 +0300
+Subject: [PATCH 7/7] waf: Fix parsing of cross-answers file in case answer includes a colon
+
+The answer provided in the cross-answers file may include a colon,
+as in:
+Checking uname version type: "#57-Ubuntu SMP Tue Jul 15 03:51:08 UTC 2014"
+
+Signed-off-by: Uri Simchoni <urisimchoni@gmail.com>
+Reviewed-by: Andrew Bartlett <abartlet@samba.org>
+Reviewed-by: Alexander Bokovoy <ab@samba.org>
+
+Upstream-Status: Backport
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ buildtools/wafsamba/samba_cross.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/buildtools/wafsamba/samba_cross.py b/buildtools/wafsamba/samba_cross.py
+index d1e7006..7961212 100644
+--- a/buildtools/wafsamba/samba_cross.py
++++ b/buildtools/wafsamba/samba_cross.py
+@@ -54,7 +54,7 @@ def cross_answer(ca_file, msg):
+         if line == '' or line[0] == '#':
+             continue
+         if line.find(':') != -1:
+-            a = line.split(':')
++            a = line.split(':', 1)
+             thismsg = a[0].strip()
+             if thismsg != msg:
+                 continue
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-connectivity/samba/samba_4.1.12.bb b/meta-oe/recipes-connectivity/samba/samba_4.1.12.bb
index af2cc1f..938e07e 100644
--- a/meta-oe/recipes-connectivity/samba/samba_4.1.12.bb
+++ b/meta-oe/recipes-connectivity/samba/samba_4.1.12.bb
@@ -33,6 +33,13 @@ SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://18-avoid-get-config-by-native-ncurses.patch \
            file://19-systemd-daemon-is-contained-by-libsystemd.patch \
            file://20-do-not-import-target-module-while-cross-compile.patch \
+           file://0001-waf-sanitize-and-fix-added-cross-answer.patch \
+           file://0002-Adds-a-new-mode-to-samba-cross-compiling.patch \
+           file://0003-waf-improve-readability-of-cross-answers-generated-b.patch \
+           file://0004-build-make-wafsamba-CHECK_SIZEOF-cross-compile-frien.patch \
+           file://0005-build-unify-and-fix-endian-tests.patch \
+           file://0006-avoid-using-colon-in-the-checking-msg.patch \
+           file://0007-waf-Fix-parsing-of-cross-answers-file-in-case-answer.patch \
           "
 
 SRC_URI[md5sum] = "232016d7581a1ba11e991ec2674553c4"
-- 
1.9.1


