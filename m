Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OYVIY-0001el-4N
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Jul 2010 04:32:48 +0200
Received: by pzk2 with SMTP id 2so1413889pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jul 2010 19:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=/DxkwhBZNfZQSR+kedXbZws6+UlTMKh5jKGg62VPrlM=;
	b=SkiVo21/HxFvk4IJX8+LfpbFA5LTIgPIeJoTBUO7cpdp0wlkEL5YjHISrJHUie2dKt
	4FfyBNruAqq6LQ3yNeeLe9oXr39R49ti0e1KjHpAGKchzLmSduVLoM9J/xvep+SqXurI
	Ns04hBeS8C3UHS/D0wRCO+Z4duYxEIcbVmxVQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=agRII0Mi5WTc8gymiVgxYSK90WCNmI6c+7pGLEpXpJQIz+Hu3I1ZVTzE5OPkVXYoJI
	qd6fVEtv3egNN8E2p0D9kZI5YKyastZtg/CXNMcY7Vmj+NQ2KvBhhOE18k15/qcr67Do
	cAC8541nYfOdTsVWLb02MZPs58AbONAKiCgDI=
Received: by 10.142.134.13 with SMTP id h13mr18209375wfd.119.1278988063919;
	Mon, 12 Jul 2010 19:27:43 -0700 (PDT)
Received: from [10.0.0.4] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	v38sm5567101wfh.12.2010.07.12.19.27.41
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 12 Jul 2010 19:27:43 -0700 (PDT)
Message-ID: <4C3BCF14.1060604@gmail.com>
Date: Tue, 13 Jul 2010 11:57:32 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.9) Gecko/20100401 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C356475.2060208@gmail.com>
In-Reply-To: <4C356475.2060208@gmail.com>
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] gcc: badness with -ibad, a replacement for zecke-no-host-includes.patch
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
X-List-Received-Date: Tue, 13 Jul 2010 02:32:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Subject: [PATCH] gcc: badness with -ibad, a replacement for zecke-no-host-includes.patch

This change makes it significantly easier to add new blacklisted include
paths by introducing a new command line parameter to gcc, -ibad, which
may be used to specify blacklisted include prefixes. A list of bad
include paths are provided in gcc's default specs file and may be modified
by editing ibad-specs.sed.

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---

This version addresses previous concerns regarding bitbake.conf changes
breaking toolchains without -ibad support and the enforcement of the
-ibad flags for recipes which may break CPPFLAGS.

If it is desired that an environment variable be used for additional
flags, this could be supported in the spec file with %:getenv(), see
http://gcc.gnu.org/onlinedocs/gcc/Spec-Files.html

I've only provided patches against recent gcc versions, but older versions
should work fine too, with the ibad-4.2.1.patch previously posted. I
confirmed that ibad-4.6.patch applies correctly to gcc from svn, but was
unable to test due to an unrelated patch failing (gcc-flags-for-build.patch).

---
 recipes/gcc/files/ibad-4.3.3.patch |  117 ++++++++++++++++++++++++++++++++++
 recipes/gcc/files/ibad-4.4.1.patch |  117 ++++++++++++++++++++++++++++++++++
 recipes/gcc/files/ibad-4.6.patch   |  122 ++++++++++++++++++++++++++++++++++++
 recipes/gcc/files/ibad-specs.sed   |    9 +++
 recipes/gcc/gcc-cross_4.3.1.bb     |   11 +++-
 recipes/gcc/gcc-cross_4.3.2.bb     |   12 +++-
 recipes/gcc/gcc-cross_4.3.3.bb     |   11 +++-
 recipes/gcc/gcc-cross_4.3.4.bb     |   11 +++-
 recipes/gcc/gcc-cross_4.4.1.bb     |   11 +++-
 recipes/gcc/gcc-cross_4.4.2.bb     |   11 +++-
 recipes/gcc/gcc-cross_4.4.4.bb     |   12 +++-
 recipes/gcc/gcc-cross_4.5.bb       |   12 +++-
 recipes/gcc/gcc-cross_svn.bb       |   12 +++-
 13 files changed, 450 insertions(+), 18 deletions(-)
 create mode 100644 recipes/gcc/files/ibad-4.3.3.patch
 create mode 100644 recipes/gcc/files/ibad-4.4.1.patch
 create mode 100644 recipes/gcc/files/ibad-4.6.patch
 create mode 100644 recipes/gcc/files/ibad-specs.sed

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
index 0000000..b268989
--- /dev/null
+++ b/recipes/gcc/files/ibad-4.4.1.patch
@@ -0,0 +1,117 @@
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
+diff -ur gcc-4.4.1-orig/gcc/incpath.h gcc-4.4.1/gcc/incpath.h
+--- gcc-4.4.1-orig/gcc/incpath.h	2009-02-21 01:50:38.000000000 +1030
++++ gcc-4.4.1/gcc/incpath.h	2010-07-08 13:12:54.000000000 +0930
+@@ -31,4 +31,4 @@
+ 
+ extern struct target_c_incpath_s target_c_incpath;
+ 
+-enum { QUOTE = 0, BRACKET, SYSTEM, AFTER };
++enum { QUOTE = 0, BRACKET, SYSTEM, AFTER, BAD };
diff --git a/recipes/gcc/files/ibad-4.6.patch b/recipes/gcc/files/ibad-4.6.patch
new file mode 100644
index 0000000..6c40303
--- /dev/null
+++ b/recipes/gcc/files/ibad-4.6.patch
@@ -0,0 +1,122 @@
+Index: gcc/c-family/c.opt
+===================================================================
+--- gcc/c-family/c.opt	(revision 162065)
++++ gcc/c-family/c.opt	(working copy)
+@@ -885,6 +885,10 @@
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
+Index: gcc/c-family/c-opts.c
+===================================================================
+--- gcc/c-family/c-opts.c	(revision 162065)
++++ gcc/c-family/c-opts.c	(working copy)
+@@ -163,6 +163,7 @@
+ 
+     case OPT_F:
+     case OPT_I:
++    case OPT_ibad:
+     case OPT_idirafter:
+     case OPT_isysroot:
+     case OPT_isystem:
+@@ -800,6 +801,10 @@
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
+Index: gcc/incpath.c
+===================================================================
+--- gcc/incpath.c	(revision 162065)
++++ gcc/incpath.c	(working copy)
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
+Index: gcc/incpath.h
+===================================================================
+--- gcc/incpath.h	(revision 162065)
++++ gcc/incpath.h	(working copy)
+@@ -31,4 +31,4 @@
+ 
+ extern struct target_c_incpath_s target_c_incpath;
+ 
+-enum { QUOTE = 0, BRACKET, SYSTEM, AFTER };
++enum { QUOTE = 0, BRACKET, SYSTEM, AFTER, BAD };
+Index: gcc/gcc.h
+===================================================================
+--- gcc/gcc.h	(revision 162065)
++++ gcc/gcc.h	(working copy)
+@@ -47,6 +47,7 @@
+  (!strcmp (STR, "Tdata") || !strcmp (STR, "Ttext")	\
+   || !strcmp (STR, "Tbss") || !strcmp (STR, "include")	\
+   || !strcmp (STR, "imacros") || !strcmp (STR, "aux-info") \
++  || !strcmp (STR, "ibad") \
+   || !strcmp (STR, "idirafter") || !strcmp (STR, "iprefix") \
+   || !strcmp (STR, "iwithprefix") || !strcmp (STR, "iwithprefixbefore") \
+   || !strcmp (STR, "iquote") || !strcmp (STR, "isystem") \
diff --git a/recipes/gcc/files/ibad-specs.sed b/recipes/gcc/files/ibad-specs.sed
new file mode 100644
index 0000000..59ad077
--- /dev/null
+++ b/recipes/gcc/files/ibad-specs.sed
@@ -0,0 +1,9 @@
+# Add bad_includes to the cpp spec string.
+/^*cpp:$/ {n; s|^|%(bad_includes) |}
+
+# Add bad_includes to the cc1plus spec string.
+/^*cc1plus:$/ {n; s|^|%(bad_includes) |}
+
+# Append the bad_incldues spec string to the file.
+$ a *bad_includes:\
+-ibad /usr/include -ibad /sw/include -ibad /opt/include -ibad /usr/X11R6/include -ibad /usr/X11/include -ibad /usr/local/include
diff --git a/recipes/gcc/gcc-cross_4.3.1.bb b/recipes/gcc/gcc-cross_4.3.1.bb
index 1c191fa..879c2ac 100644
--- a/recipes/gcc/gcc-cross_4.3.1.bb
+++ b/recipes/gcc/gcc-cross_4.3.1.bb
@@ -1,11 +1,18 @@
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 require gcc-${PV}.inc
 require gcc-cross4.inc
 
-SRC_URI_append_fail-fast = " file://zecke-no-host-includes.patch "
+SRC_URI_append_fail-fast = " file://ibad-4.3.3.patch \
+				file://ibad-specs.sed"
 
 EXTRA_OECONF += "  --enable-cheaders=c_std --disable-libunwind-exceptions --with-mpfr=${STAGING_DIR_NATIVE}${prefix_native}"
 
 ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_DIR_TARGET}${target_includedir}"
 
+do_install_append() {
+	# Add -ibad paths to the default cflags.
+	install -m 0755 -d ${gcclibdir}/${TARGET_SYS}/${BINV}
+	${TARGET_PREFIX}gcc -dumpspecs | sed -f ${WORKDIR}/ibad-specs.sed \
+		> ${gcclibdir}/${TARGET_SYS}/${BINV}/specs
+}
diff --git a/recipes/gcc/gcc-cross_4.3.2.bb b/recipes/gcc/gcc-cross_4.3.2.bb
index 322a203..c9433e9 100644
--- a/recipes/gcc/gcc-cross_4.3.2.bb
+++ b/recipes/gcc/gcc-cross_4.3.2.bb
@@ -1,9 +1,17 @@
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 require gcc-${PV}.inc
 require gcc-cross4.inc
 
-SRC_URI_append_fail-fast = " file://zecke-no-host-includes.patch "
+SRC_URI_append_fail-fast = " file://ibad-4.3.3.patch \
+				file://ibad-specs.sed"
 
 EXTRA_OECONF += "  --enable-cheaders=c_std --disable-libunwind-exceptions --with-mpfr=${STAGING_DIR_NATIVE}${prefix_native}"
 
 ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_DIR_TARGET}${target_includedir}"
+
+do_install_append() {
+	# Add -ibad paths to the default cflags.
+	install -m 0755 -d ${gcclibdir}/${TARGET_SYS}/${BINV}
+	${TARGET_PREFIX}gcc -dumpspecs | sed -f ${WORKDIR}/ibad-specs.sed \
+		> ${gcclibdir}/${TARGET_SYS}/${BINV}/specs
+}
diff --git a/recipes/gcc/gcc-cross_4.3.3.bb b/recipes/gcc/gcc-cross_4.3.3.bb
index c8e2f9b..c9433e9 100644
--- a/recipes/gcc/gcc-cross_4.3.3.bb
+++ b/recipes/gcc/gcc-cross_4.3.3.bb
@@ -1,10 +1,17 @@
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 require gcc-${PV}.inc
 require gcc-cross4.inc
 
-SRC_URI_append_fail-fast = " file://zecke-no-host-includes.patch "
+SRC_URI_append_fail-fast = " file://ibad-4.3.3.patch \
+				file://ibad-specs.sed"
 
 EXTRA_OECONF += "  --enable-cheaders=c_std --disable-libunwind-exceptions --with-mpfr=${STAGING_DIR_NATIVE}${prefix_native}"
 
 ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_DIR_TARGET}${target_includedir}"
 
+do_install_append() {
+	# Add -ibad paths to the default cflags.
+	install -m 0755 -d ${gcclibdir}/${TARGET_SYS}/${BINV}
+	${TARGET_PREFIX}gcc -dumpspecs | sed -f ${WORKDIR}/ibad-specs.sed \
+		> ${gcclibdir}/${TARGET_SYS}/${BINV}/specs
+}
diff --git a/recipes/gcc/gcc-cross_4.3.4.bb b/recipes/gcc/gcc-cross_4.3.4.bb
index 7edb21b..c35abbb 100644
--- a/recipes/gcc/gcc-cross_4.3.4.bb
+++ b/recipes/gcc/gcc-cross_4.3.4.bb
@@ -1,10 +1,17 @@
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 require gcc-${PV}.inc
 require gcc-cross4.inc
 
-SRC_URI_append_fail-fast = " file://zecke-no-host-includes.patch "
+SRC_URI_append_fail-fast = " file://ibad-4.3.3.patch \
+				file://ibad-specs.sed"
 
 EXTRA_OECONF += "  --enable-cheaders=c_std --disable-libunwind-exceptions --with-mpfr=${STAGING_DIR_NATIVE}${prefix_native}"
 
 ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_DIR_TARGET}${target_includedir}"
 
+do_install_append() {
+	# Add -ibad paths to the default cflags.
+	install -m 0755 -d ${gcclibdir}/${TARGET_SYS}/${BINV}
+	${TARGET_PREFIX}gcc -dumpspecs | sed -f ${WORKDIR}/ibad-specs.sed \
+		> ${gcclibdir}/${TARGET_SYS}/${BINV}/specs
+}
diff --git a/recipes/gcc/gcc-cross_4.4.1.bb b/recipes/gcc/gcc-cross_4.4.1.bb
index fce459b..9aceaa2 100644
--- a/recipes/gcc/gcc-cross_4.4.1.bb
+++ b/recipes/gcc/gcc-cross_4.4.1.bb
@@ -1,10 +1,17 @@
 require gcc-${PV}.inc
 require gcc-cross4.inc
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
-SRC_URI_append_fail-fast = " file://zecke-no-host-includes.patch "
+SRC_URI_append_fail-fast = " file://ibad-4.4.1.patch \
+				file://ibad-specs.sed"
 
 EXTRA_OECONF += " --disable-libunwind-exceptions --with-mpfr=${STAGING_DIR_NATIVE}${prefix_native}"
 
 ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_DIR_TARGET}${target_includedir}"
 
+do_install_append() {
+	# Add -ibad paths to the default cflags.
+	install -m 0755 -d ${gcclibdir}/${TARGET_SYS}/${BINV}
+	${TARGET_PREFIX}gcc -dumpspecs | sed -f ${WORKDIR}/ibad-specs.sed \
+		> ${gcclibdir}/${TARGET_SYS}/${BINV}/specs
+}
diff --git a/recipes/gcc/gcc-cross_4.4.2.bb b/recipes/gcc/gcc-cross_4.4.2.bb
index fce459b..9aceaa2 100644
--- a/recipes/gcc/gcc-cross_4.4.2.bb
+++ b/recipes/gcc/gcc-cross_4.4.2.bb
@@ -1,10 +1,17 @@
 require gcc-${PV}.inc
 require gcc-cross4.inc
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
-SRC_URI_append_fail-fast = " file://zecke-no-host-includes.patch "
+SRC_URI_append_fail-fast = " file://ibad-4.4.1.patch \
+				file://ibad-specs.sed"
 
 EXTRA_OECONF += " --disable-libunwind-exceptions --with-mpfr=${STAGING_DIR_NATIVE}${prefix_native}"
 
 ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_DIR_TARGET}${target_includedir}"
 
+do_install_append() {
+	# Add -ibad paths to the default cflags.
+	install -m 0755 -d ${gcclibdir}/${TARGET_SYS}/${BINV}
+	${TARGET_PREFIX}gcc -dumpspecs | sed -f ${WORKDIR}/ibad-specs.sed \
+		> ${gcclibdir}/${TARGET_SYS}/${BINV}/specs
+}
diff --git a/recipes/gcc/gcc-cross_4.4.4.bb b/recipes/gcc/gcc-cross_4.4.4.bb
index 4309fd4..431ba44 100644
--- a/recipes/gcc/gcc-cross_4.4.4.bb
+++ b/recipes/gcc/gcc-cross_4.4.4.bb
@@ -1,9 +1,17 @@
 require gcc-${PV}.inc
 require gcc-cross4.inc
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
-SRC_URI_append_fail-fast = " file://zecke-no-host-includes.patch "
+SRC_URI_append_fail-fast = " file://ibad-4.4.1.patch \
+				file://ibad-specs.sed"
 
 EXTRA_OECONF += " --disable-libunwind-exceptions --with-mpfr=${STAGING_DIR_NATIVE}${prefix_native}"
 
 ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_DIR_TARGET}${target_includedir}"
+
+do_install_append() {
+	# Add -ibad paths to the default cflags.
+	install -m 0755 -d ${gcclibdir}/${TARGET_SYS}/${BINV}
+	${TARGET_PREFIX}gcc -dumpspecs | sed -f ${WORKDIR}/ibad-specs.sed \
+		> ${gcclibdir}/${TARGET_SYS}/${BINV}/specs
+}
diff --git a/recipes/gcc/gcc-cross_4.5.bb b/recipes/gcc/gcc-cross_4.5.bb
index a2da4a8..abf0af5 100644
--- a/recipes/gcc/gcc-cross_4.5.bb
+++ b/recipes/gcc/gcc-cross_4.5.bb
@@ -1,10 +1,18 @@
-PR = "r1"
+PR = "r2"
 require gcc-${PV}.inc
 require gcc-cross4.inc
 
 NATIVEDEPS += "libmpc-native libelf-native"
-SRC_URI_append_fail-fast = " file://zecke-no-host-includes.patch "
+SRC_URI_append_fail-fast = " file://ibad-4.4.1.patch \
+				file://ibad-specs.sed"
 
 EXTRA_OECONF += " --disable-libunwind-exceptions --with-mpfr=${STAGING_DIR_NATIVE}${prefix_native} --with-system-zlib"
 
 ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_DIR_TARGET}${target_includedir}"
+
+do_install_append() {
+	# Add -ibad paths to the default cflags.
+	install -m 0755 -d ${gcclibdir}/${TARGET_SYS}/${BINV}
+	${TARGET_PREFIX}gcc -dumpspecs | sed -f ${WORKDIR}/ibad-specs.sed \
+		> ${gcclibdir}/${TARGET_SYS}/${BINV}/specs
+}
diff --git a/recipes/gcc/gcc-cross_svn.bb b/recipes/gcc/gcc-cross_svn.bb
index 825a7bd..3d1e22a 100644
--- a/recipes/gcc/gcc-cross_svn.bb
+++ b/recipes/gcc/gcc-cross_svn.bb
@@ -1,11 +1,19 @@
-PR = "r0"
+PR = "r1"
 require gcc-${PV}.inc
 require gcc-cross4.inc
 
 DEPENDS += "libmpc-native"
 
-SRC_URI_append_fail-fast = " file://zecke-no-host-includes.patch "
+SRC_URI_append_fail-fast = " file://ibad-4.6.patch \
+				file://ibad-specs.sed"
 
 EXTRA_OECONF += " --disable-libunwind-exceptions --with-mpfr=${STAGING_DIR_NATIVE}${prefix_native} --with-system-zlib"
 
 ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_DIR_TARGET}${target_includedir}"
+
+do_install_append() {
+	# Add -ibad paths to the default cflags.
+	install -m 0755 -d ${gcclibdir}/${TARGET_SYS}/${BINV}
+	${TARGET_PREFIX}gcc -dumpspecs | sed -f ${WORKDIR}/ibad-specs.sed \
+		> ${gcclibdir}/${TARGET_SYS}/${BINV}/specs
+}
-- 
1.7.1




