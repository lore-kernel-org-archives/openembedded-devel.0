Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OWju0-0002eh-Vm
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Jul 2010 07:44:09 +0200
Received: by pxi12 with SMTP id 12so203805pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Jul 2010 22:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=G5BiFbuQikcorT+46SaipWop/Gyn0le23PoUrLIzBwQ=;
	b=uaw+6CtDOlyd7YhdXVd/LL7Oqoy1U+niJ0FEab0LYJaS8XNg9rVJ75GILBF/1eJxNg
	PK8LOG7N/MAdURxHVq9zsbPGB3+UUs4jEebnymB4TZHiJtHkiW9Q0vXFTHbXK7Vzdb1o
	uMvBnGyi9+CZ9uI7mH0Bg2DPTc/NlJ65MdD+k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=rgf498K+xcEiqgCNX+j5EtxwotEdbED9mNul70pvxcghy+aS1/Y+Rp3oAGtFw/nOoK
	0ldNp0R0uM3D1Z6Tf9lTZyFuqgAinB3XZrFAhGHcRFqbDMBzIyLqNFRSIUlHa6zKR1Dy
	W6txQgAO+6USfKvRL2ZeSj4QkSZzyUuwcsGO4=
Received: by 10.114.109.6 with SMTP id h6mr8936090wac.49.1278567547987;
	Wed, 07 Jul 2010 22:39:07 -0700 (PDT)
Received: from [10.0.0.4] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id r27sm8079962rvq.9.2010.07.07.22.39.05
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 07 Jul 2010 22:39:06 -0700 (PDT)
Message-ID: <4C356475.2060208@gmail.com>
Date: Thu, 08 Jul 2010 15:09:01 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.9) Gecko/20100401 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFC] Badness with -ibad, a replacement for zecke-no-host-includes.patch.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Jul 2010 05:44:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

This patch introduces a new command line parameter to gcc (at
Zecke's suggestion), -ibad, which may be used to specify
blacklisted include prefixes. E.g.

grg@eye7:/tmp$ ~/oe2/tmp/cross/mipsel/bin/mipsel-angstrom-linux-gcc -c test.c -ibad /usr/include -I /usr/include
CROSS COMPILE Badness: /usr/include in INCLUDEPATH: /usr/include

This makes it much easier to add new blacklisted include paths,
with a trivial edit to bitbake.conf. No additional paths have
been added yet, but my motivation for this was to add
/usr/X11R6/include and /usr/X11/include.

Please note that the bitbake.conf change will break builds with
versions of gcc that do not accept this -ibad parameter. I have
tested that the ibad patch applies to each of the gcc versions
in this patch, but only done functional tests for gcc-4.3.3 and
gcc-.4.1.

The following gcc versions may need attention:
3.3.3
3.3.4
svn
csl-arm-2007q3
csl-arm-2008q1
csl-arm-2008q3

3.3.x will require a completely reworked ibad patch. The others
should be compatible with one of the three ibad patches
included below.

-Graham

---
 conf/bitbake.conf                  |    8 ++-
 recipes/gcc/files/ibad-4.2.1.patch |  117 ++++++++++++++++++++++++++++++++++
 recipes/gcc/files/ibad-4.3.3.patch |  117 ++++++++++++++++++++++++++++++++++
 recipes/gcc/files/ibad-4.4.1.patch |  122 ++++++++++++++++++++++++++++++++++++
 recipes/gcc/gcc-3.4.4.inc          |    4 +-
 recipes/gcc/gcc-3.4.6.inc          |    1 -
 recipes/gcc/gcc-4.0.0.inc          |    1 -
 recipes/gcc/gcc-4.0.2.inc          |    2 -
 recipes/gcc/gcc-4.1.0.inc          |    4 +-
 recipes/gcc/gcc-cross_3.4.4.bb     |    4 +-
 recipes/gcc/gcc-cross_4.0.0.bb     |    4 +-
 recipes/gcc/gcc-cross_4.0.2.bb     |    4 +-
 recipes/gcc/gcc-cross_4.1.0.bb     |    4 +-
 recipes/gcc/gcc-cross_4.1.1.bb     |    4 +-
 recipes/gcc/gcc-cross_4.1.2.bb     |    4 +-
 recipes/gcc/gcc-cross_4.2.1.bb     |    4 +-
 recipes/gcc/gcc-cross_4.2.2.bb     |    4 +-
 recipes/gcc/gcc-cross_4.2.3.bb     |    4 +-
 recipes/gcc/gcc-cross_4.2.4.bb     |    4 +-
 recipes/gcc/gcc-cross_4.3.1.bb     |    4 +-
 recipes/gcc/gcc-cross_4.3.2.bb     |    4 +-
 recipes/gcc/gcc-cross_4.3.3.bb     |    4 +-
 recipes/gcc/gcc-cross_4.3.4.bb     |    4 +-
 recipes/gcc/gcc-cross_4.4.1.bb     |    4 +-
 recipes/gcc/gcc-cross_4.4.2.bb     |    4 +-
 recipes/gcc/gcc-cross_4.4.4.bb     |    4 +-
 recipes/gcc/gcc-cross_4.5.bb       |    4 +-
 27 files changed, 405 insertions(+), 43 deletions(-)
 create mode 100644 recipes/gcc/files/ibad-4.2.1.patch
 create mode 100644 recipes/gcc/files/ibad-4.3.3.patch
 create mode 100644 recipes/gcc/files/ibad-4.4.1.patch

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 0119294..93f8574 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -463,9 +463,15 @@ PATCHRESOLVE = 'noop'
 # Build flags and options.
 ##################################################################
 
+# We don't want cross builds to include these paths.
+BAD_HOST_INCDIRS = " \
+		-ibad /usr/include \
+		-ibad /sw/include \
+		-ibad /opt/include"
+
 export BUILD_CPPFLAGS = "-isystem${STAGING_INCDIR_NATIVE}"
 export CPPFLAGS = "${TARGET_CPPFLAGS}"
-export TARGET_CPPFLAGS = "-isystem${STAGING_DIR_TARGET}${includedir}"
+export TARGET_CPPFLAGS = "-isystem${STAGING_DIR_TARGET}${includedir} ${BAD_HOST_INCDIRS}"
 export SDK_CPPFLAGS = "-isystem${STAGING_DIR_SDK}${includedir} -isystem${STAGING_DIR_HOST}${includedir}"
 
 export BUILD_CFLAGS = "${BUILD_CPPFLAGS} ${BUILD_OPTIMIZATION}"
diff --git a/recipes/gcc/files/ibad-4.2.1.patch b/recipes/gcc/files/ibad-4.2.1.patch
new file mode 100644
index 0000000..a3a7ec3
--- /dev/null
+++ b/recipes/gcc/files/ibad-4.2.1.patch
@@ -0,0 +1,117 @@
+diff -ur gcc-4.2.1-orig/gcc/c-incpath.c gcc-4.2.1/gcc/c-incpath.c
+--- gcc-4.2.1-orig/gcc/c-incpath.c	2006-05-19 07:46:23.000000000 +0930
++++ gcc-4.2.1/gcc/c-incpath.c	2010-07-08 13:49:01.000000000 +0930
+@@ -57,8 +57,8 @@
+ 					   struct cpp_dir *, int);
+ 
+ /* Include chains heads and tails.  */
+-static struct cpp_dir *heads[4];
+-static struct cpp_dir *tails[4];
++static struct cpp_dir *heads[5];
++static struct cpp_dir *tails[5];
+ static bool quote_ignores_source_dir;
+ enum { REASON_QUIET = 0, REASON_NOENT, REASON_DUP, REASON_DUP_SYS };
+ 
+@@ -256,6 +256,32 @@
+   return head;
+ }
+ 
++/* Exit if paths in BAD are found in HEAD. */
++static void
++check_bad_includes (struct cpp_dir *head, struct cpp_dir *bad)
++{
++  struct cpp_dir *h, *b;
++  size_t len;
++
++  if (head == NULL)
++    return;
++
++  for (b = bad; b; b = b->next)
++    {
++      len = strlen(b->name);
++      for (h = head; h; h = h->next)
++        {
++          if (!strncmp(h->name, b->name, len))
++            {
++                fprintf(stderr,
++                          _("CROSS COMPILE Badness: %s in INCLUDEPATH: %s\n"),
++                          b->name, h->name);
++                exit(EXIT_FAILURE);
++            }
++        }
++    }
++}
++
+ /* Merge the four include chains together in the order quote, bracket,
+    system, after.  Remove duplicate dirs (as determined by
+    INO_T_EQ()).
+@@ -269,6 +295,13 @@
+ static void
+ merge_include_chains (cpp_reader *pfile, int verbose)
+ {
++  /* Exit if paths specified with -ibad are found in the include chain.
++     This must be done before inode duplicates are removed. */
++  check_bad_includes(heads[QUOTE], heads[BAD]);
++  check_bad_includes(heads[BRACKET], heads[BAD]);
++  check_bad_includes(heads[SYSTEM], heads[BAD]);
++  check_bad_includes(heads[AFTER], heads[BAD]);
++
+   /* Join the SYSTEM and AFTER chains.  Remove duplicates in the
+      resulting SYSTEM chain.  */
+   if (heads[SYSTEM])
+diff -ur gcc-4.2.1-orig/gcc/c-incpath.h gcc-4.2.1/gcc/c-incpath.h
+--- gcc-4.2.1-orig/gcc/c-incpath.h	2006-01-21 07:30:03.000000000 +1030
++++ gcc-4.2.1/gcc/c-incpath.h	2010-07-08 13:46:57.000000000 +0930
+@@ -30,4 +30,4 @@
+ 
+ extern struct target_c_incpath_s target_c_incpath;
+ 
+-enum { QUOTE = 0, BRACKET, SYSTEM, AFTER };
++enum { QUOTE = 0, BRACKET, SYSTEM, AFTER, BAD };
+diff -ur gcc-4.2.1-orig/gcc/c-opts.c gcc-4.2.1/gcc/c-opts.c
+--- gcc-4.2.1-orig/gcc/c-opts.c	2007-03-13 05:20:38.000000000 +1030
++++ gcc-4.2.1/gcc/c-opts.c	2010-07-08 13:46:57.000000000 +0930
+@@ -162,6 +162,7 @@
+ 
+     case OPT_F:
+     case OPT_I:
++    case OPT_ibad:
+     case OPT_idirafter:
+     case OPT_isysroot:
+     case OPT_isystem:
+@@ -815,6 +816,10 @@
+       flag_gen_declaration = 1;
+       break;
+ 
++    case OPT_ibad:
++      add_path (xstrdup (arg), BAD, 0, true);
++      break;
++
+     case OPT_idirafter:
+       add_path (xstrdup (arg), AFTER, 0, true);
+       break;
+diff -ur gcc-4.2.1-orig/gcc/c.opt gcc-4.2.1/gcc/c.opt
+--- gcc-4.2.1-orig/gcc/c.opt	2007-03-22 05:16:44.000000000 +1030
++++ gcc-4.2.1/gcc/c.opt	2010-07-08 13:46:57.000000000 +0930
+@@ -756,6 +756,10 @@
+ ObjC ObjC++
+ Dump declarations to a .decl file
+ 
++ibad
++C ObjC C++ ObjC++ Joined Separate
++-ibad <dir>	Abort if <dir> is specified in the include paths
++
+ idirafter
+ C ObjC C++ ObjC++ Joined Separate
+ -idirafter <dir>	Add <dir> to the end of the system include path
+diff -ur gcc-4.2.1-orig/gcc/gcc.h gcc-4.2.1/gcc/gcc.h
+--- gcc-4.2.1-orig/gcc/gcc.h	2006-01-17 05:30:56.000000000 +1030
++++ gcc-4.2.1/gcc/gcc.h	2010-07-08 13:46:57.000000000 +0930
+@@ -46,6 +46,7 @@
+  (!strcmp (STR, "Tdata") || !strcmp (STR, "Ttext")	\
+   || !strcmp (STR, "Tbss") || !strcmp (STR, "include")	\
+   || !strcmp (STR, "imacros") || !strcmp (STR, "aux-info") \
++  || !strcmp (STR, "ibad") \
+   || !strcmp (STR, "idirafter") || !strcmp (STR, "iprefix") \
+   || !strcmp (STR, "iwithprefix") || !strcmp (STR, "iwithprefixbefore") \
+   || !strcmp (STR, "iquote") || !strcmp (STR, "isystem") \
diff --git a/recipes/gcc/files/ibad-4.3.3.patch b/recipes/gcc/files/ibad-4.3.3.patch
new file mode 100644
index 0000000..dfc1d10
--- /dev/null
+++ b/recipes/gcc/files/ibad-4.3.3.patch
@@ -0,0 +1,117 @@
+diff -ur gcc-4.3.3-orig/gcc/c-incpath.c gcc-4.3.3/gcc/c-incpath.c
+--- gcc-4.3.3-orig/gcc/c-incpath.c	2007-07-26 18:07:01.000000000 +0930
++++ gcc-4.3.3/gcc/c-incpath.c	2010-07-08 12:21:08.000000000 +0930
+@@ -58,8 +58,8 @@
+ 					   struct cpp_dir *, int);
+ 
+ /* Include chains heads and tails.  */
+-static struct cpp_dir *heads[4];
+-static struct cpp_dir *tails[4];
++static struct cpp_dir *heads[5];
++static struct cpp_dir *tails[5];
+ static bool quote_ignores_source_dir;
+ enum { REASON_QUIET = 0, REASON_NOENT, REASON_DUP, REASON_DUP_SYS };
+ 
+@@ -283,6 +283,32 @@
+   return head;
+ }
+ 
++/* Exit if paths in BAD are found in HEAD. */
++static void
++check_bad_includes (struct cpp_dir *head, struct cpp_dir *bad)
++{
++  struct cpp_dir *h, *b;
++  size_t len;
++
++  if (head == NULL)
++    return;
++
++  for (b = bad; b; b = b->next)
++    {
++      len = strlen(b->name);
++      for (h = head; h; h = h->next)
++        {
++          if (!strncmp(h->name, b->name, len))
++            {
++                fprintf(stderr,
++                          _("CROSS COMPILE Badness: %s in INCLUDEPATH: %s\n"),
++                          b->name, h->name);
++                exit(EXIT_FAILURE);
++            }
++        }
++    }
++}
++
+ /* Add SYSROOT to any user-supplied paths in CHAIN starting with
+    "=".  */
+ 
+@@ -318,6 +344,13 @@
+       add_sysroot_to_chain (sysroot, AFTER);
+     }
+ 
++  /* Exit if paths specified with -ibad are found in the include chain.
++     This must be done before inode duplicates are removed. */
++  check_bad_includes(heads[QUOTE], heads[BAD]);
++  check_bad_includes(heads[BRACKET], heads[BAD]);
++  check_bad_includes(heads[SYSTEM], heads[BAD]);
++  check_bad_includes(heads[AFTER], heads[BAD]);
++
+   /* Join the SYSTEM and AFTER chains.  Remove duplicates in the
+      resulting SYSTEM chain.  */
+   if (heads[SYSTEM])
+diff -ur gcc-4.3.3-orig/gcc/c-incpath.h gcc-4.3.3/gcc/c-incpath.h
+--- gcc-4.3.3-orig/gcc/c-incpath.h	2007-07-26 18:07:01.000000000 +0930
++++ gcc-4.3.3/gcc/c-incpath.h	2010-07-07 14:58:53.000000000 +0930
+@@ -30,4 +30,4 @@
+ 
+ extern struct target_c_incpath_s target_c_incpath;
+ 
+-enum { QUOTE = 0, BRACKET, SYSTEM, AFTER };
++enum { QUOTE = 0, BRACKET, SYSTEM, AFTER, BAD };
+diff -ur gcc-4.3.3-orig/gcc/c-opts.c gcc-4.3.3/gcc/c-opts.c
+--- gcc-4.3.3-orig/gcc/c-opts.c	2008-01-23 00:41:44.000000000 +1030
++++ gcc-4.3.3/gcc/c-opts.c	2010-07-08 09:31:23.000000000 +0930
+@@ -164,6 +164,7 @@
+ 
+     case OPT_F:
+     case OPT_I:
++    case OPT_ibad:
+     case OPT_idirafter:
+     case OPT_isysroot:
+     case OPT_isystem:
+@@ -848,6 +849,10 @@
+       set_struct_debug_option (arg);
+       break;
+ 
++    case OPT_ibad:
++      add_path (xstrdup (arg), BAD, 0, true);
++      break;
++
+     case OPT_idirafter:
+       add_path (xstrdup (arg), AFTER, 0, true);
+       break;
+diff -ur gcc-4.3.3-orig/gcc/c.opt gcc-4.3.3/gcc/c.opt
+--- gcc-4.3.3-orig/gcc/c.opt	2008-01-13 10:52:38.000000000 +1030
++++ gcc-4.3.3/gcc/c.opt	2010-07-07 14:57:21.000000000 +0930
+@@ -822,6 +822,10 @@
+ C ObjC C++ ObjC++ Joined
+ -femit-struct-debug-detailed=<spec-list>	Detailed reduced debug info for structs
+ 
++ibad
++C ObjC C++ ObjC++ Joined Separate
++-ibad <dir>	Abort if <dir> is specified in the include paths
++
+ idirafter
+ C ObjC C++ ObjC++ Joined Separate
+ -idirafter <dir>	Add <dir> to the end of the system include path
+diff -ur gcc-4.3.3-orig/gcc/gcc.h gcc-4.3.3/gcc/gcc.h
+--- gcc-4.3.3-orig/gcc/gcc.h	2007-07-26 18:07:01.000000000 +0930
++++ gcc-4.3.3/gcc/gcc.h	2010-07-08 09:26:17.000000000 +0930
+@@ -45,6 +45,7 @@
+  (!strcmp (STR, "Tdata") || !strcmp (STR, "Ttext")	\
+   || !strcmp (STR, "Tbss") || !strcmp (STR, "include")	\
+   || !strcmp (STR, "imacros") || !strcmp (STR, "aux-info") \
++  || !strcmp (STR, "ibad") \
+   || !strcmp (STR, "idirafter") || !strcmp (STR, "iprefix") \
+   || !strcmp (STR, "iwithprefix") || !strcmp (STR, "iwithprefixbefore") \
+   || !strcmp (STR, "iquote") || !strcmp (STR, "isystem") \
diff --git a/recipes/gcc/files/ibad-4.4.1.patch b/recipes/gcc/files/ibad-4.4.1.patch
new file mode 100644
index 0000000..b52934b
--- /dev/null
+++ b/recipes/gcc/files/ibad-4.4.1.patch
@@ -0,0 +1,122 @@
+diff -ur gcc-4.4.1-orig/gcc/c-opts.c gcc-4.4.1/gcc/c-opts.c
+--- gcc-4.4.1-orig/gcc/c-opts.c	2009-02-18 12:46:03.000000000 +1030
++++ gcc-4.4.1/gcc/c-opts.c	2010-07-08 13:12:54.000000000 +0930
+@@ -161,6 +161,7 @@
+ 
+     case OPT_F:
+     case OPT_I:
++    case OPT_ibad:
+     case OPT_idirafter:
+     case OPT_isysroot:
+     case OPT_isystem:
+@@ -830,6 +831,10 @@
+       set_struct_debug_option (arg);
+       break;
+ 
++    case OPT_ibad:
++      add_path (xstrdup (arg), BAD, 0, true);
++      break;
++
+     case OPT_idirafter:
+       add_path (xstrdup (arg), AFTER, 0, true);
+       break;
+Only in gcc-4.4.1/gcc: c-opts.c~
+diff -ur gcc-4.4.1-orig/gcc/c.opt gcc-4.4.1/gcc/c.opt
+--- gcc-4.4.1-orig/gcc/c.opt	2009-03-19 07:44:53.000000000 +1030
++++ gcc-4.4.1/gcc/c.opt	2010-07-08 13:12:54.000000000 +0930
+@@ -841,6 +841,10 @@
+ C ObjC C++ ObjC++ Joined
+ -femit-struct-debug-detailed=<spec-list>	Detailed reduced debug info for structs
+ 
++ibad
++C ObjC C++ ObjC++ Joined Separate
++-ibad <dir>	Abort if <dir> is specified in the include paths
++
+ idirafter
+ C ObjC C++ ObjC++ Joined Separate
+ -idirafter <dir>	Add <dir> to the end of the system include path
+Only in gcc-4.4.1/gcc: c.opt~
+diff -ur gcc-4.4.1-orig/gcc/gcc.h gcc-4.4.1/gcc/gcc.h
+--- gcc-4.4.1-orig/gcc/gcc.h	2009-02-21 01:50:38.000000000 +1030
++++ gcc-4.4.1/gcc/gcc.h	2010-07-08 13:12:54.000000000 +0930
+@@ -46,6 +46,7 @@
+  (!strcmp (STR, "Tdata") || !strcmp (STR, "Ttext")	\
+   || !strcmp (STR, "Tbss") || !strcmp (STR, "include")	\
+   || !strcmp (STR, "imacros") || !strcmp (STR, "aux-info") \
++  || !strcmp (STR, "ibad") \
+   || !strcmp (STR, "idirafter") || !strcmp (STR, "iprefix") \
+   || !strcmp (STR, "iwithprefix") || !strcmp (STR, "iwithprefixbefore") \
+   || !strcmp (STR, "iquote") || !strcmp (STR, "isystem") \
+Only in gcc-4.4.1/gcc: gcc.h~
+diff -ur gcc-4.4.1-orig/gcc/incpath.c gcc-4.4.1/gcc/incpath.c
+--- gcc-4.4.1-orig/gcc/incpath.c	2009-02-21 01:50:38.000000000 +1030
++++ gcc-4.4.1/gcc/incpath.c	2010-07-08 13:12:48.000000000 +0930
+@@ -60,8 +60,8 @@
+ 					   struct cpp_dir *, int);
+ 
+ /* Include chains heads and tails.  */
+-static struct cpp_dir *heads[4];
+-static struct cpp_dir *tails[4];
++static struct cpp_dir *heads[5];
++static struct cpp_dir *tails[5];
+ static bool quote_ignores_source_dir;
+ enum { REASON_QUIET = 0, REASON_NOENT, REASON_DUP, REASON_DUP_SYS };
+ 
+@@ -284,6 +284,32 @@
+   return head;
+ }
+ 
++/* Exit if paths in BAD are found in HEAD. */
++static void
++check_bad_includes (struct cpp_dir *head, struct cpp_dir *bad)
++{
++  struct cpp_dir *h, *b;
++  size_t len;
++
++  if (head == NULL)
++    return;
++
++  for (b = bad; b; b = b->next)
++    {
++      len = strlen(b->name);
++      for (h = head; h; h = h->next)
++        {
++          if (!strncmp(h->name, b->name, len))
++            {
++                fprintf(stderr,
++                          _("CROSS COMPILE Badness: %s in INCLUDEPATH: %s\n"),
++                          b->name, h->name);
++                exit(EXIT_FAILURE);
++            }
++        }
++    }
++}
++
+ /* Add SYSROOT to any user-supplied paths in CHAIN starting with
+    "=".  */
+ 
+@@ -319,6 +345,13 @@
+       add_sysroot_to_chain (sysroot, AFTER);
+     }
+ 
++  /* Exit if paths specified with -ibad are found in the include chain.
++     This must be done before inode duplicates are removed. */
++  check_bad_includes(heads[QUOTE], heads[BAD]);
++  check_bad_includes(heads[BRACKET], heads[BAD]);
++  check_bad_includes(heads[SYSTEM], heads[BAD]);
++  check_bad_includes(heads[AFTER], heads[BAD]);
++
+   /* Join the SYSTEM and AFTER chains.  Remove duplicates in the
+      resulting SYSTEM chain.  */
+   if (heads[SYSTEM])
+Only in gcc-4.4.1/gcc: incpath.c~
+diff -ur gcc-4.4.1-orig/gcc/incpath.h gcc-4.4.1/gcc/incpath.h
+--- gcc-4.4.1-orig/gcc/incpath.h	2009-02-21 01:50:38.000000000 +1030
++++ gcc-4.4.1/gcc/incpath.h	2010-07-08 13:12:54.000000000 +0930
+@@ -31,4 +31,4 @@
+ 
+ extern struct target_c_incpath_s target_c_incpath;
+ 
+-enum { QUOTE = 0, BRACKET, SYSTEM, AFTER };
++enum { QUOTE = 0, BRACKET, SYSTEM, AFTER, BAD };
+Only in gcc-4.4.1/gcc: incpath.h~
diff --git a/recipes/gcc/gcc-3.4.4.inc b/recipes/gcc/gcc-3.4.4.inc
index b63f59e..f749160 100644
--- a/recipes/gcc/gcc-3.4.4.inc
+++ b/recipes/gcc/gcc-3.4.4.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-INC_PR = "r15"
+INC_PR = "r16"
 
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
 	   file://gcc34-reverse-compare.patch \
@@ -26,7 +26,5 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
 	   file://gcc-cross-fixincl.patch \
 	   file://gcc-posix-open-fix.patch \
 	   "
-SRC_URI_append = " file://zecke-no-host-includes.patch "
-
 SRC_URI[archive.md5sum] = "b594ff4ea4fbef4ba9220887de713dfe"
 SRC_URI[archive.sha256sum] = "3444179840638cb8664e8e53604900c4521d29d57785a5091202ee4937d8d0fd"
diff --git a/recipes/gcc/gcc-3.4.6.inc b/recipes/gcc/gcc-3.4.6.inc
index b6b01e3..171b54f 100644
--- a/recipes/gcc/gcc-3.4.6.inc
+++ b/recipes/gcc/gcc-3.4.6.inc
@@ -21,7 +21,6 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
 
 SRC_URI += "file://gcc34-configure.in.patch"
 SRC_URI += "file://gcc34-thumb-support.patch"
-SRC_URI_append = " file://zecke-no-host-includes.patch "
 
 SRC_URI[archive.md5sum] = "4a21ac777d4b5617283ce488b808da7b"
 SRC_URI[archive.sha256sum] = "7791a601878b765669022b8b3409fba33cc72f9e39340fec8af6d0e6f72dec39"
diff --git a/recipes/gcc/gcc-4.0.0.inc b/recipes/gcc/gcc-4.0.0.inc
index dd48595..e16b388 100644
--- a/recipes/gcc/gcc-4.0.0.inc
+++ b/recipes/gcc/gcc-4.0.0.inc
@@ -6,7 +6,6 @@ NATIVEDEPS = "mpfr-native gmp-native"
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
 	file://gcc-posix-open-fix.patch \
 	file://zecke-xgcc-cpp.patch"
-SRC_URI_append_fail-fast = " file://zecke-no-host-includes.patch "
 
 # Language Overrides
 FORTRAN = ",f95"
diff --git a/recipes/gcc/gcc-4.0.2.inc b/recipes/gcc/gcc-4.0.2.inc
index 16584ec..9eb25d7 100644
--- a/recipes/gcc/gcc-4.0.2.inc
+++ b/recipes/gcc/gcc-4.0.2.inc
@@ -21,8 +21,6 @@ SRC_URI_append = " file://100-uclibc-conf.patch   \
 		   file://gcc-4.0.2-atmel.0.99.2.patch \
 		   "
 
-SRC_URI_append_fail-fast = " file://zecke-no-host-includes.patch "
-
 # Language Overrides
 FORTRAN = ""
 
diff --git a/recipes/gcc/gcc-4.1.0.inc b/recipes/gcc/gcc-4.1.0.inc
index bfaf699..1e296fc 100644
--- a/recipes/gcc/gcc-4.1.0.inc
+++ b/recipes/gcc/gcc-4.1.0.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-INC_PR = "r10"
+INC_PR = "r11"
 
 DEFAULT_PREFERENCE = "-1"
 
@@ -13,8 +13,6 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
 	file://zecke-xgcc-cpp.patch \
     file://pr34130.patch"
 
-SRC_URI_append_fail-fast = " file://zecke-no-host-includes.patch "
-
 EXTRA_OECONF_BASE = "--disable-libssp --disable-libmudflap"
 EXTRA_OECONF_INITIAL = "--disable-libmudflap --disable-libssp"
 EXTRA_OECONF_INTERMEDIATE = "--disable-libmudflap --disable-libssp"
diff --git a/recipes/gcc/gcc-cross_3.4.4.bb b/recipes/gcc/gcc-cross_3.4.4.bb
index 40ea603..d8199e4 100644
--- a/recipes/gcc/gcc-cross_3.4.4.bb
+++ b/recipes/gcc/gcc-cross_3.4.4.bb
@@ -1,4 +1,6 @@
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 require gcc-${PV}.inc
 require gcc-cross.inc
+
+SRC_URI_append_fail-fast = " file://ibad-4.2.1.patch "
diff --git a/recipes/gcc/gcc-cross_4.0.0.bb b/recipes/gcc/gcc-cross_4.0.0.bb
index 2ab9ef4..7b57648 100644
--- a/recipes/gcc/gcc-cross_4.0.0.bb
+++ b/recipes/gcc/gcc-cross_4.0.0.bb
@@ -1,4 +1,6 @@
-PR = "r9"
+PR = "r10"
 
 require gcc-${PV}.inc
 require gcc-cross4.inc
+
+SRC_URI_append_fail-fast = " file://ibad-4.2.1.patch "
diff --git a/recipes/gcc/gcc-cross_4.0.2.bb b/recipes/gcc/gcc-cross_4.0.2.bb
index 1294af5..4c2997c 100644
--- a/recipes/gcc/gcc-cross_4.0.2.bb
+++ b/recipes/gcc/gcc-cross_4.0.2.bb
@@ -1,4 +1,6 @@
-PR = "r15"
+PR = "r16"
 
 require gcc-${PV}.inc
 require gcc-cross4.inc
+
+SRC_URI_append_fail-fast = " file://ibad-4.2.1.patch "
diff --git a/recipes/gcc/gcc-cross_4.1.0.bb b/recipes/gcc/gcc-cross_4.1.0.bb
index 39ad5fe..5e9df67 100644
--- a/recipes/gcc/gcc-cross_4.1.0.bb
+++ b/recipes/gcc/gcc-cross_4.1.0.bb
@@ -1,7 +1,9 @@
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 require gcc-${PV}.inc
 require gcc-cross4.inc
 
+SRC_URI_append_fail-fast = " file://ibad-4.2.1.patch "
+
 EXTRA_OECONF += "--disable-libunwind-exceptions --with-mpfr=${STAGING_DIR_NATIVE}${prefix_native}"
 
diff --git a/recipes/gcc/gcc-cross_4.1.1.bb b/recipes/gcc/gcc-cross_4.1.1.bb
index 1864078..606a4cb 100644
--- a/recipes/gcc/gcc-cross_4.1.1.bb
+++ b/recipes/gcc/gcc-cross_4.1.1.bb
@@ -1,8 +1,8 @@
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 require gcc-${PV}.inc
 require gcc-cross4.inc
 
-SRC_URI_append_fail-fast = " file://zecke-no-host-includes.patch "
+SRC_URI_append_fail-fast = " file://ibad-4.2.1.patch "
 
 EXTRA_OECONF += "--disable-libunwind-exceptions --with-mpfr=${STAGING_DIR_NATIVE}${prefix_native}"
diff --git a/recipes/gcc/gcc-cross_4.1.2.bb b/recipes/gcc/gcc-cross_4.1.2.bb
index d2038c7..7431368 100644
--- a/recipes/gcc/gcc-cross_4.1.2.bb
+++ b/recipes/gcc/gcc-cross_4.1.2.bb
@@ -1,9 +1,9 @@
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 require gcc-${PV}.inc
 require gcc-cross4.inc
 
-SRC_URI_append_fail-fast = " file://zecke-no-host-includes.patch "
+SRC_URI_append_fail-fast = " file://ibad-4.2.1.patch "
 
 EXTRA_OECONF_append_avr32= "  --disable-libmudflap "
 
diff --git a/recipes/gcc/gcc-cross_4.2.1.bb b/recipes/gcc/gcc-cross_4.2.1.bb
index ae7f2b7..e6a14aa 100644
--- a/recipes/gcc/gcc-cross_4.2.1.bb
+++ b/recipes/gcc/gcc-cross_4.2.1.bb
@@ -1,9 +1,9 @@
-PR = "r21"
+PR = "r22"
 
 require gcc-${PV}.inc
 require gcc-cross4.inc
 
-SRC_URI_append_fail-fast = " file://zecke-no-host-includes.patch "
+SRC_URI_append_fail-fast = " file://ibad-4.2.1.patch "
 
 EXTRA_OECONF += "--disable-libunwind-exceptions --with-mpfr=${STAGING_DIR_NATIVE}${prefix_native}"
 
diff --git a/recipes/gcc/gcc-cross_4.2.2.bb b/recipes/gcc/gcc-cross_4.2.2.bb
index 30c1d78..272610a 100644
--- a/recipes/gcc/gcc-cross_4.2.2.bb
+++ b/recipes/gcc/gcc-cross_4.2.2.bb
@@ -1,9 +1,9 @@
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 require gcc-${PV}.inc
 require gcc-cross4.inc
 
-SRC_URI_append_fail-fast = " file://zecke-no-host-includes.patch "
+SRC_URI_append_fail-fast = " file://ibad-4.2.1.patch "
 
 EXTRA_OECONF += "--disable-libunwind-exceptions --with-mpfr=${STAGING_DIR_NATIVE}${prefix_native}"
 
diff --git a/recipes/gcc/gcc-cross_4.2.3.bb b/recipes/gcc/gcc-cross_4.2.3.bb
index 13dec27..4f2cea1 100644
--- a/recipes/gcc/gcc-cross_4.2.3.bb
+++ b/recipes/gcc/gcc-cross_4.2.3.bb
@@ -1,9 +1,9 @@
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 require gcc-${PV}.inc
 require gcc-cross4.inc
 
-SRC_URI_append_fail-fast = " file://zecke-no-host-includes.patch "
+SRC_URI_append_fail-fast = " file://ibad-4.2.1.patch "
 
 EXTRA_OECONF += "--disable-libunwind-exceptions --with-mpfr=${STAGING_DIR_NATIVE}${prefix_native}"
 
diff --git a/recipes/gcc/gcc-cross_4.2.4.bb b/recipes/gcc/gcc-cross_4.2.4.bb
index 13dec27..4f2cea1 100644
--- a/recipes/gcc/gcc-cross_4.2.4.bb
+++ b/recipes/gcc/gcc-cross_4.2.4.bb
@@ -1,9 +1,9 @@
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 require gcc-${PV}.inc
 require gcc-cross4.inc
 
-SRC_URI_append_fail-fast = " file://zecke-no-host-includes.patch "
+SRC_URI_append_fail-fast = " file://ibad-4.2.1.patch "
 
 EXTRA_OECONF += "--disable-libunwind-exceptions --with-mpfr=${STAGING_DIR_NATIVE}${prefix_native}"
 
diff --git a/recipes/gcc/gcc-cross_4.3.1.bb b/recipes/gcc/gcc-cross_4.3.1.bb
index 1c191fa..672a892 100644
--- a/recipes/gcc/gcc-cross_4.3.1.bb
+++ b/recipes/gcc/gcc-cross_4.3.1.bb
@@ -1,9 +1,9 @@
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 require gcc-${PV}.inc
 require gcc-cross4.inc
 
-SRC_URI_append_fail-fast = " file://zecke-no-host-includes.patch "
+SRC_URI_append_fail-fast = " file://ibad-4.3.3.patch "
 
 EXTRA_OECONF += "  --enable-cheaders=c_std --disable-libunwind-exceptions --with-mpfr=${STAGING_DIR_NATIVE}${prefix_native}"
 
diff --git a/recipes/gcc/gcc-cross_4.3.2.bb b/recipes/gcc/gcc-cross_4.3.2.bb
index 322a203..19407b0 100644
--- a/recipes/gcc/gcc-cross_4.3.2.bb
+++ b/recipes/gcc/gcc-cross_4.3.2.bb
@@ -1,8 +1,8 @@
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 require gcc-${PV}.inc
 require gcc-cross4.inc
 
-SRC_URI_append_fail-fast = " file://zecke-no-host-includes.patch "
+SRC_URI_append_fail-fast = " file://ibad-4.3.3.patch "
 
 EXTRA_OECONF += "  --enable-cheaders=c_std --disable-libunwind-exceptions --with-mpfr=${STAGING_DIR_NATIVE}${prefix_native}"
 
diff --git a/recipes/gcc/gcc-cross_4.3.3.bb b/recipes/gcc/gcc-cross_4.3.3.bb
index c8e2f9b..20440cc 100644
--- a/recipes/gcc/gcc-cross_4.3.3.bb
+++ b/recipes/gcc/gcc-cross_4.3.3.bb
@@ -1,8 +1,8 @@
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 require gcc-${PV}.inc
 require gcc-cross4.inc
 
-SRC_URI_append_fail-fast = " file://zecke-no-host-includes.patch "
+SRC_URI_append_fail-fast = " file://ibad-4.3.3.patch "
 
 EXTRA_OECONF += "  --enable-cheaders=c_std --disable-libunwind-exceptions --with-mpfr=${STAGING_DIR_NATIVE}${prefix_native}"
 
diff --git a/recipes/gcc/gcc-cross_4.3.4.bb b/recipes/gcc/gcc-cross_4.3.4.bb
index 7edb21b..69fa142 100644
--- a/recipes/gcc/gcc-cross_4.3.4.bb
+++ b/recipes/gcc/gcc-cross_4.3.4.bb
@@ -1,8 +1,8 @@
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 require gcc-${PV}.inc
 require gcc-cross4.inc
 
-SRC_URI_append_fail-fast = " file://zecke-no-host-includes.patch "
+SRC_URI_append_fail-fast = " file://ibad-4.3.3.patch "
 
 EXTRA_OECONF += "  --enable-cheaders=c_std --disable-libunwind-exceptions --with-mpfr=${STAGING_DIR_NATIVE}${prefix_native}"
 
diff --git a/recipes/gcc/gcc-cross_4.4.1.bb b/recipes/gcc/gcc-cross_4.4.1.bb
index fce459b..5a8ebb8 100644
--- a/recipes/gcc/gcc-cross_4.4.1.bb
+++ b/recipes/gcc/gcc-cross_4.4.1.bb
@@ -1,8 +1,8 @@
 require gcc-${PV}.inc
 require gcc-cross4.inc
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
-SRC_URI_append_fail-fast = " file://zecke-no-host-includes.patch "
+SRC_URI_append_fail-fast = " file://ibad-4.4.1.patch "
 
 EXTRA_OECONF += " --disable-libunwind-exceptions --with-mpfr=${STAGING_DIR_NATIVE}${prefix_native}"
 
diff --git a/recipes/gcc/gcc-cross_4.4.2.bb b/recipes/gcc/gcc-cross_4.4.2.bb
index fce459b..5a8ebb8 100644
--- a/recipes/gcc/gcc-cross_4.4.2.bb
+++ b/recipes/gcc/gcc-cross_4.4.2.bb
@@ -1,8 +1,8 @@
 require gcc-${PV}.inc
 require gcc-cross4.inc
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
-SRC_URI_append_fail-fast = " file://zecke-no-host-includes.patch "
+SRC_URI_append_fail-fast = " file://ibad-4.4.1.patch "
 
 EXTRA_OECONF += " --disable-libunwind-exceptions --with-mpfr=${STAGING_DIR_NATIVE}${prefix_native}"
 
diff --git a/recipes/gcc/gcc-cross_4.4.4.bb b/recipes/gcc/gcc-cross_4.4.4.bb
index 4309fd4..d069bd6 100644
--- a/recipes/gcc/gcc-cross_4.4.4.bb
+++ b/recipes/gcc/gcc-cross_4.4.4.bb
@@ -1,8 +1,8 @@
 require gcc-${PV}.inc
 require gcc-cross4.inc
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
-SRC_URI_append_fail-fast = " file://zecke-no-host-includes.patch "
+SRC_URI_append_fail-fast = " file://ibad-4.4.1.patch "
 
 EXTRA_OECONF += " --disable-libunwind-exceptions --with-mpfr=${STAGING_DIR_NATIVE}${prefix_native}"
 
diff --git a/recipes/gcc/gcc-cross_4.5.bb b/recipes/gcc/gcc-cross_4.5.bb
index a2da4a8..82ff1ae 100644
--- a/recipes/gcc/gcc-cross_4.5.bb
+++ b/recipes/gcc/gcc-cross_4.5.bb
@@ -1,9 +1,9 @@
-PR = "r1"
+PR = "r2"
 require gcc-${PV}.inc
 require gcc-cross4.inc
 
 NATIVEDEPS += "libmpc-native libelf-native"
-SRC_URI_append_fail-fast = " file://zecke-no-host-includes.patch "
+SRC_URI_append_fail-fast = " file://ibad-4.4.1.patch "
 
 EXTRA_OECONF += " --disable-libunwind-exceptions --with-mpfr=${STAGING_DIR_NATIVE}${prefix_native} --with-system-zlib"
 
-- 
1.7.1



