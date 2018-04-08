Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 873057554F
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Apr 2018 06:59:07 +0000 (UTC)
Received: by mail-pf0-f177.google.com with SMTP id j2so3719048pff.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Apr 2018 23:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=bSAaUOCkpAfcHl4Dtz8nfN5x4y0bSKI8OFo5nQWjLtI=;
	b=dnb5MQLAEDo581O9kiLJ8bM/dJTqKQxBvFPD7acBw6ARmm6+P8Xdr+R72fsyoyBoMv
	LCYHDUYLuequramVjD3BLSiL+MObi+C3HJTEAv3AA+PzJxoieLiXQ7/fH1b8LhrFLhNe
	cHRtY6RfRFXowQJ7x3gKO+SsLsBi9BzBMhsO4otI4cugPtnAvrPtLfWSnqTAcOW2mlKD
	DdQp3fpvEs0gX6MyukVjyEvvr3FW9rGlZOvFL1iPuKA3NJ3LyQWDCsv4zVcW30h9pGhV
	zTD1C/udBufUg8rSJBsls4UpDsr/Klcmen1S61iFCJmHMbFcFjozxQdXHLvnIRtXTRI/
	7WHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=bSAaUOCkpAfcHl4Dtz8nfN5x4y0bSKI8OFo5nQWjLtI=;
	b=nKt5ZnT3h5c9x3sF9C8RY6TKdkyjID8ivy00vu2t0qDo0kJqPHWWeCD3COtA+3wv8A
	7cd7mqgwZoTG2FOENEFS9aH7g8L54gah16MCVG1+KjEggvCmBCra5mPLvn/jg6LZe9Wc
	l+u0Guo4ulweyQhRkwf5ECktQ+c9mv7O5k43qwa1jCL5TKRztmGkamGjmJfHzVP6QtwE
	3UY678FVqwxfJyoeAltYqgqUvU8EKFFWnauH1HHIu+9F9vkVFAXfbAFJrd8si9P2jtrh
	PA8RJOlMuFX4seLMEaKjL6MWaf/mGCFZ6YrvCOXifjk5pbkWB9ZrN4TtCpCV2VFF8pHH
	GblA==
X-Gm-Message-State: AElRT7FH+gXVqdoXssra8HakATM501fFVg3XLVAFSM1/G2CTwkQ8rpzD
	nrKFKHJw4Cnbt/gqHdnyyElwUg==
X-Google-Smtp-Source: AIpwx49b8x914vwBcc/mow3ohWCDtfS1PusbNnLT4KxVEiLcFDKY1KrE01YyDfR0kRHIMS/y6b332g==
X-Received: by 10.98.224.93 with SMTP id f90mr25187085pfh.21.1523170748173;
	Sat, 07 Apr 2018 23:59:08 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:932:e5ef:c5a4:fdbd])
	by smtp.gmail.com with ESMTPSA id
	c186sm20506137pfb.40.2018.04.07.23.59.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 07 Apr 2018 23:59:07 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sat,  7 Apr 2018 23:58:28 -0700
Message-Id: <1523170729-26321-16-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
References: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 16/37] autofs: refresh patches
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 08 Apr 2018 06:59:07 -0000

WARNING:
Some of the context lines in patches were ignored. This can lead to incorrectly applied patches.
The context lines in the patches can be updated with devtool:

    devtool modify <recipe>
    devtool finish --force-patch-refresh <recipe> <layer_path>

Then the updated patches and the source tree (in devtool's workspace)
should be reviewed to make sure the patches apply in the correct place
and don't introduce duplicate lines (which can, and does happen
when some of the context is ignored). Further information:
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
Details:
checking file configure.in
checking file daemon/module.c
Hunk #1 succeeded at 19 with fuzz 2 (offset 1 line).
Hunk #2 succeeded at 55 with fuzz 2 (offset 1 line).
checking file include/automount.h
Hunk #1 succeeded at 51 (offset 1 line).
WARNING:

among others

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...fine-__SWORD_TYPE-and-_PATH_NSSWITCH_CONF.patch | 12 +++---
 ...kup_multi.c-Replace-__S_IEXEC-with-S_IEXE.patch |  6 +--
 .../0002-Replace-__S_IEXEC-with-S_IEXEC.patch      | 18 ++++-----
 .../autofs/autofs/add-the-needed-stdarg.h.patch    | 13 +++---
 .../autofs-5.0.7-do-not-check-for-modprobe.patch   | 46 ++++++++++++++--------
 .../autofs/autofs/autofs-5.0.7-fix-lib-deps.patch  | 12 +++---
 ...7-include-linux-nfs.h-directly-in-rpc_sub.patch | 14 +++----
 .../autofs/autofs-5.1.2-libtirpc-as-need.patch     | 19 ++++++---
 .../recipes-daemons/autofs/autofs/cross.patch      | 31 +++++++++------
 ...x-the-YACC-rule-to-fix-a-building-failure.patch | 11 +++---
 .../autofs/autofs/fix_disable_ldap.patch           | 17 ++++----
 .../autofs/autofs/force-STRIP-to-emtpy.patch       | 13 +++---
 .../recipes-daemons/autofs/autofs/libtirpc.patch   | 45 ++++++++++++---------
 .../recipes-daemons/autofs/autofs/no-bash.patch    | 25 ++++++++----
 .../autofs/autofs/pkgconfig-libnsl.patch           | 17 ++++++--
 .../autofs/autofs/remove-bashism.patch             | 10 ++---
 ...-pkg-config-to-detect-libxml-2.0-and-krb5.patch | 15 +++----
 17 files changed, 189 insertions(+), 135 deletions(-)

diff --git a/meta-networking/recipes-daemons/autofs/autofs/0001-Define-__SWORD_TYPE-and-_PATH_NSSWITCH_CONF.patch b/meta-networking/recipes-daemons/autofs/autofs/0001-Define-__SWORD_TYPE-and-_PATH_NSSWITCH_CONF.patch
index 075af57..8715971 100644
--- a/meta-networking/recipes-daemons/autofs/autofs/0001-Define-__SWORD_TYPE-and-_PATH_NSSWITCH_CONF.patch
+++ b/meta-networking/recipes-daemons/autofs/autofs/0001-Define-__SWORD_TYPE-and-_PATH_NSSWITCH_CONF.patch
@@ -1,19 +1,20 @@
-From 933e065cf8aecfa0cce5f8f92abbed5baaaf3f77 Mon Sep 17 00:00:00 2001
+From 987c8f4a718cdd6b764592ba7510090a59623959 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 31 Mar 2017 19:10:57 -0700
-Subject: [PATCH 1/2] Define __SWORD_TYPE and _PATH_NSSWITCH_CONF
+Subject: [PATCH] Define __SWORD_TYPE and _PATH_NSSWITCH_CONF
 
 if they are not defined as is in musl then define
 them here
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  include/automount.h | 8 ++++++++
  include/nsswitch.h  | 3 +++
  2 files changed, 11 insertions(+)
 
 diff --git a/include/automount.h b/include/automount.h
-index 219b07d..b12c22a 100644
+index cc336ad..8bdcf12 100644
 --- a/include/automount.h
 +++ b/include/automount.h
 @@ -42,6 +42,14 @@
@@ -32,7 +33,7 @@ index 219b07d..b12c22a 100644
  #ifndef HAVE_MOUNT
  #error Failed to locate mount(8)!
 diff --git a/include/nsswitch.h b/include/nsswitch.h
-index 2b445a9..3db77b2 100644
+index d3e4027..7a0c38f 100644
 --- a/include/nsswitch.h
 +++ b/include/nsswitch.h
 @@ -24,6 +24,9 @@
@@ -45,6 +46,3 @@ index 2b445a9..3db77b2 100644
  #define NSSWITCH_FILE _PATH_NSSWITCH_CONF
  
  enum nsswitch_status {
--- 
-2.12.1
-
diff --git a/meta-networking/recipes-daemons/autofs/autofs/0001-modules-lookup_multi.c-Replace-__S_IEXEC-with-S_IEXE.patch b/meta-networking/recipes-daemons/autofs/autofs/0001-modules-lookup_multi.c-Replace-__S_IEXEC-with-S_IEXE.patch
index 7ac1456..32293dd 100644
--- a/meta-networking/recipes-daemons/autofs/autofs/0001-modules-lookup_multi.c-Replace-__S_IEXEC-with-S_IEXE.patch
+++ b/meta-networking/recipes-daemons/autofs/autofs/0001-modules-lookup_multi.c-Replace-__S_IEXEC-with-S_IEXE.patch
@@ -1,4 +1,4 @@
-From e4ee00e08acd7c0912a3264ad32e4de861c7416f Mon Sep 17 00:00:00 2001
+From 745e355ac8b595a27e1fcca75bf01d3e244f4a5f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 7 Sep 2017 22:22:31 -0700
 Subject: [PATCH] modules/lookup_multi.c: Replace __S_IEXEC with S_IEXEC
@@ -7,6 +7,7 @@ __S_IEXEC is internal to libc and may not be available on
 all libc e.g. musl
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  modules/lookup_multi.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -24,6 +25,3 @@ index 3ecda6d..cf109de 100644
  					type = src_prog;
  				else
  					type = src_file;
--- 
-2.14.1
-
diff --git a/meta-networking/recipes-daemons/autofs/autofs/0002-Replace-__S_IEXEC-with-S_IEXEC.patch b/meta-networking/recipes-daemons/autofs/autofs/0002-Replace-__S_IEXEC-with-S_IEXEC.patch
index 6b6ba6d..469027a 100644
--- a/meta-networking/recipes-daemons/autofs/autofs/0002-Replace-__S_IEXEC-with-S_IEXEC.patch
+++ b/meta-networking/recipes-daemons/autofs/autofs/0002-Replace-__S_IEXEC-with-S_IEXEC.patch
@@ -1,21 +1,22 @@
-From 8fd74ddb3369572c594b22b396346131af00faee Mon Sep 17 00:00:00 2001
+From 557ca399f4b3a397f20bb147ec6dc4ab9732dd1e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 31 Mar 2017 19:12:10 -0700
-Subject: [PATCH 2/2] Replace __S_IEXEC with S_IEXEC
+Subject: [PATCH] Replace __S_IEXEC with S_IEXEC
 
 S_IEXEC is portable
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  daemon/lookup.c        | 4 ++--
  modules/lookup_multi.c | 2 +-
  2 files changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/daemon/lookup.c b/daemon/lookup.c
-index 62071df..1bec97f 100644
+index 201ccbb..d821db8 100644
 --- a/daemon/lookup.c
 +++ b/daemon/lookup.c
-@@ -400,7 +400,7 @@ static int read_file_source_instance(struct autofs_point *ap, struct map_source
+@@ -366,7 +366,7 @@ static int read_file_source_instance(struct autofs_point *ap, struct map_source
  	if (!S_ISREG(st.st_mode))
  		return NSS_STATUS_NOTFOUND;
  
@@ -24,7 +25,7 @@ index 62071df..1bec97f 100644
  		type = src_prog;
  	else
  		type = src_file;
-@@ -890,7 +890,7 @@ static int lookup_name_file_source_instance(struct autofs_point *ap, struct map_
+@@ -856,7 +856,7 @@ static int lookup_name_file_source_instance(struct autofs_point *ap, struct map_
  	if (!S_ISREG(st.st_mode))
  		return NSS_STATUS_NOTFOUND;
  
@@ -34,10 +35,10 @@ index 62071df..1bec97f 100644
  	else
  		type = src_file;
 diff --git a/modules/lookup_multi.c b/modules/lookup_multi.c
-index 6ec8434..88d081f 100644
+index fadd2ea..3ecda6d 100644
 --- a/modules/lookup_multi.c
 +++ b/modules/lookup_multi.c
-@@ -104,7 +104,7 @@ static struct lookup_mod *nss_open_lookup(const char *format, int argc, const ch
+@@ -247,7 +247,7 @@ static struct lookup_mod *nss_open_lookup(const char *format, int argc, const ch
  				continue;
  			}
  
@@ -46,6 +47,3 @@ index 6ec8434..88d081f 100644
  				type = src_prog;
  			else
  				type = src_file;
--- 
-2.12.1
-
diff --git a/meta-networking/recipes-daemons/autofs/autofs/add-the-needed-stdarg.h.patch b/meta-networking/recipes-daemons/autofs/autofs/add-the-needed-stdarg.h.patch
index fdb906b..816a409 100644
--- a/meta-networking/recipes-daemons/autofs/autofs/add-the-needed-stdarg.h.patch
+++ b/meta-networking/recipes-daemons/autofs/autofs/add-the-needed-stdarg.h.patch
@@ -1,14 +1,18 @@
-[PATCH] add the needed stdarg.h
+From df5d45b2d7ad7e7b5f0542a816d08b0409a529a1 Mon Sep 17 00:00:00 2001
+From: Roy Li <rongqing.li@windriver.com>
+Date: Tue, 19 Aug 2014 11:31:35 +0800
+Subject: [PATCH] [PATCH] add the needed stdarg.h
 
 Upstream-status: Pending
 
 Signed-off-by: Roy Li <rongqing.li@windriver.com>
+
 ---
- lib/defaults.c |    1 +
+ lib/defaults.c | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/lib/defaults.c b/lib/defaults.c
-index 2b03ea2..5728e67 100644
+index 0e48a78..667f35d 100644
 --- a/lib/defaults.c
 +++ b/lib/defaults.c
 @@ -16,6 +16,7 @@
@@ -19,6 +23,3 @@ index 2b03ea2..5728e67 100644
  #include <ctype.h>
  #include <string.h>
  #include <sys/utsname.h>
--- 
-1.7.10.4
-
diff --git a/meta-networking/recipes-daemons/autofs/autofs/autofs-5.0.7-do-not-check-for-modprobe.patch b/meta-networking/recipes-daemons/autofs/autofs/autofs-5.0.7-do-not-check-for-modprobe.patch
index af5be6a..1d5c3e1 100644
--- a/meta-networking/recipes-daemons/autofs/autofs/autofs-5.0.7-do-not-check-for-modprobe.patch
+++ b/meta-networking/recipes-daemons/autofs/autofs/autofs-5.0.7-do-not-check-for-modprobe.patch
@@ -1,3 +1,8 @@
+From 2cbc576ea1fbd1cbf4579d64b30e41d762084e7f Mon Sep 17 00:00:00 2001
+From: "yanjun.zhu" <yanjun.zhu@windriver.com>
+Date: Tue, 15 Jan 2013 12:45:44 +0800
+Subject: [PATCH] autofs: do not check for modprobe
+
 Description: Loading autofs module is #ifdef'ed in the source, so
  there is no need to check for /proc (which is only used
  to load module) or modprobe.  Both modprobe and /proc
@@ -7,9 +12,16 @@ Description: Loading autofs module is #ifdef'ed in the source, so
 Upstream-Status: Backport [1]
 [1] http://www.spinics.net/lists/autofs/msg00139.html
 
-diff -urpN a/configure.in b/configure.in
---- a/configure.in	2013-01-15 11:30:22.000000000 +0800
-+++ b/configure.in	2013-01-15 11:31:45.000000000 +0800
+---
+ configure.in        |  6 ------
+ daemon/module.c     |  3 +++
+ include/automount.h | 11 +++--------
+ 3 files changed, 6 insertions(+), 14 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index 44a1c8b..b226236 100644
+--- a/configure.in
++++ b/configure.in
 @@ -34,11 +34,6 @@ AC_MSG_CHECKING([for binaries in])
  AC_MSG_RESULT([$searchpath])
  
@@ -22,7 +34,7 @@ diff -urpN a/configure.in b/configure.in
  # Location of init.d directory?
  #
  AF_INIT_D()
-@@ -142,7 +137,6 @@ AF_PATH_INCLUDE(UMOUNT, umount, /bin/umo
+@@ -142,7 +137,6 @@ AF_PATH_INCLUDE(UMOUNT, umount, /bin/umount, $searchpath)
  AF_PATH_INCLUDE(E2FSCK, fsck.ext2 e2fsck, , $searchpath)
  AF_PATH_INCLUDE(E3FSCK, fsck.ext3 e3fsck, , $searchpath)
  AF_PATH_INCLUDE(E4FSCK, fsck.ext4 e4fsck, , $searchpath)
@@ -30,30 +42,32 @@ diff -urpN a/configure.in b/configure.in
  
  AF_CHECK_PROG(LEX, flex lex, , $searchpath)
  AF_CHECK_PROG(YACC, bison, , $searchpath)
-diff -urpN a/daemon/module.c b/daemon/module.c
---- a/daemon/module.c	2013-01-15 11:30:49.000000000 +0800
-+++ b/daemon/module.c	2013-01-15 11:32:00.000000000 +0800
-@@ -18,6 +18,8 @@
- #include <stdlib.h>
+diff --git a/daemon/module.c b/daemon/module.c
+index bed8f7a..e41a98e 100644
+--- a/daemon/module.c
++++ b/daemon/module.c
+@@ -19,6 +19,8 @@
  #include "automount.h"
+ #include "nsswitch.h"
  
 +#if 0
 +/* see comment in daemon/automount.c around load_autofs4_module() call */
  int load_autofs4_module(void)
  {
  	FILE *fp;
-@@ -52,6 +54,7 @@ int load_autofs4_module(void)
+@@ -53,6 +55,7 @@ int load_autofs4_module(void)
  
  	return 1;
  }
 +#endif
  
- struct lookup_mod *open_lookup(const char *name, const char *err_prefix,
- 			       const char *mapfmt, int argc, const char *const *argv)
-diff -urpN a/include/automount.h b/include/automount.h
---- a/include/automount.h	2013-01-15 11:31:10.000000000 +0800
-+++ b/include/automount.h	2013-01-15 11:32:06.000000000 +0800
-@@ -50,16 +50,11 @@
+ int open_lookup(const char *name, const char *err_prefix, const char *mapfmt,
+ 		int argc, const char *const *argv, struct lookup_mod **lookup)
+diff --git a/include/automount.h b/include/automount.h
+index c0f5fbf..cc336ad 100644
+--- a/include/automount.h
++++ b/include/automount.h
+@@ -51,16 +51,11 @@
  #error Failed to locate umount(8)!
  #endif
  
diff --git a/meta-networking/recipes-daemons/autofs/autofs/autofs-5.0.7-fix-lib-deps.patch b/meta-networking/recipes-daemons/autofs/autofs/autofs-5.0.7-fix-lib-deps.patch
index 09fea49..8e06db6 100644
--- a/meta-networking/recipes-daemons/autofs/autofs/autofs-5.0.7-fix-lib-deps.patch
+++ b/meta-networking/recipes-daemons/autofs/autofs/autofs-5.0.7-fix-lib-deps.patch
@@ -1,4 +1,4 @@
-From 54a9bd28a307dd74df044d779ca85adcf36aa202 Mon Sep 17 00:00:00 2001
+From 080626108c9ab70e2489752ef2a14006d0564b0c Mon Sep 17 00:00:00 2001
 From: Joe MacDonald <joe.macdonald@windriver.com>
 Date: Tue, 18 Jun 2013 10:05:21 -0400
 Subject: [PATCH] Fix the dependency issue
@@ -10,19 +10,17 @@ generated by rpcgen during buildtime
 
 Signed-off-by: Roy.Li <rongqing.li@windriver.com>
 Signed-off-by: Joe MacDonald <joe.macdonald@windriver.com>
+
 ---
- lib/Makefile |    1 +
+ lib/Makefile | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/lib/Makefile b/lib/Makefile
-index 5418009..bff4e1d 100644
+index 518b483..4798a4b 100644
 --- a/lib/Makefile
 +++ b/lib/Makefile
-@@ -75,3 +75,4 @@ install: all
+@@ -81,3 +81,4 @@ install: all
  clean:
  	rm -f $(LIB) $(RPCS) $(OBJS) $(YACCSRC) *.output *~
  
 +$(OBJS): $(RPCS)
--- 
-1.7.10.4
-
diff --git a/meta-networking/recipes-daemons/autofs/autofs/autofs-5.0.7-include-linux-nfs.h-directly-in-rpc_sub.patch b/meta-networking/recipes-daemons/autofs/autofs/autofs-5.0.7-include-linux-nfs.h-directly-in-rpc_sub.patch
index 3a87898..9b0942e 100644
--- a/meta-networking/recipes-daemons/autofs/autofs/autofs-5.0.7-include-linux-nfs.h-directly-in-rpc_sub.patch
+++ b/meta-networking/recipes-daemons/autofs/autofs/autofs-5.0.7-include-linux-nfs.h-directly-in-rpc_sub.patch
@@ -1,21 +1,22 @@
-Upstream-Status: Pending
-
-From 44bdce8c6ed9b30c1643e5981172a4f9025f013c Mon Sep 17 00:00:00 2001
+From 2256b8aa98cff15ddf2a8d36496e6c9125927901 Mon Sep 17 00:00:00 2001
 From: Andreas Oberritter <obi@opendreambox.org>
 Date: Wed, 13 Mar 2013 16:17:08 +0100
 Subject: [PATCH] autofs-5.0.7: include linux/nfs.h directly in rpc_subs.h
 
+Upstream-Status: Pending
+
 Fixes compile error with uclibc. Glibc's nfs/nfs.h contains
 nothing but "#include linux/nfs.h". rpc_subs.h already includes
 other linux/nfs*.h files directly.
 
 Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
+
 ---
- include/rpc_subs.h |    2 +-
+ include/rpc_subs.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/include/rpc_subs.h b/include/rpc_subs.h
-index b6d59f9..a2d9648 100644
+index e744e89..83db47e 100644
 --- a/include/rpc_subs.h
 +++ b/include/rpc_subs.h
 @@ -18,7 +18,7 @@
@@ -27,6 +28,3 @@ index b6d59f9..a2d9648 100644
  #include <linux/nfs2.h>
  #include <linux/nfs3.h>
  
--- 
-1.7.10.4
-
diff --git a/meta-networking/recipes-daemons/autofs/autofs/autofs-5.1.2-libtirpc-as-need.patch b/meta-networking/recipes-daemons/autofs/autofs/autofs-5.1.2-libtirpc-as-need.patch
index cbf2bf8..18ce193 100644
--- a/meta-networking/recipes-daemons/autofs/autofs/autofs-5.1.2-libtirpc-as-need.patch
+++ b/meta-networking/recipes-daemons/autofs/autofs/autofs-5.1.2-libtirpc-as-need.patch
@@ -1,12 +1,21 @@
+From b31decac4acb194b020c621d2d11019f636a45e0 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 24 Apr 2017 20:41:25 -0700
+Subject: [PATCH] autofs: Upgrade to 5.1.2 release
+
 Make configure compatible with -Wl,--as-needed following
 https://wiki.gentoo.org/wiki/Project:Quality_Assurance/As-needed#Failure_in_..2Fconfigure
 
 2016-07-05 Martin von Gagern
 
-Index: autofs-5.1.2/aclocal.m4
-===================================================================
---- autofs-5.1.2.orig/aclocal.m4
-+++ autofs-5.1.2/aclocal.m4
+---
+ aclocal.m4 | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/aclocal.m4 b/aclocal.m4
+index 0e4a624..2e620cd 100644
+--- a/aclocal.m4
++++ b/aclocal.m4
 @@ -415,9 +415,9 @@ AC_DEFUN([AF_CHECK_LIBTIRPC],
  [
  # save current flags
@@ -19,7 +28,7 @@ Index: autofs-5.1.2/aclocal.m4
  
  AC_TRY_LINK(
      [ #include <rpc/rpc.h> ],
-@@ -440,7 +440,7 @@ AC_CHECK_FUNCS([getrpcbyname getservbyna
+@@ -440,7 +440,7 @@ AC_CHECK_FUNCS([getrpcbyname getservbyname])
  
  # restore flags
  CFLAGS="$af_check_libtirpc_save_cflags"
diff --git a/meta-networking/recipes-daemons/autofs/autofs/cross.patch b/meta-networking/recipes-daemons/autofs/autofs/cross.patch
index 8f1af62..b25c43f 100644
--- a/meta-networking/recipes-daemons/autofs/autofs/cross.patch
+++ b/meta-networking/recipes-daemons/autofs/autofs/cross.patch
@@ -1,8 +1,17 @@
-Index: autofs-5.0.7/aclocal.m4
-===================================================================
---- autofs-5.0.7.orig/aclocal.m4	2012-10-28 04:45:07.000000000 -0700
-+++ autofs-5.0.7/aclocal.m4	2012-10-28 10:47:53.263996910 -0700
-@@ -7,6 +7,8 @@
+From b9b44cd82caceeb638cc6a862b5bb90b93ad6c6a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 5 Jan 2013 19:53:10 -0800
+
+---
+ aclocal.m4   | 2 ++
+ configure.in | 8 ++++++--
+ 2 files changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/aclocal.m4 b/aclocal.m4
+index 2115204..2a9a802 100644
+--- a/aclocal.m4
++++ b/aclocal.m4
+@@ -7,6 +7,8 @@ dnl --------------------------------------------------------------------------
  AC_DEFUN(AF_PATH_INCLUDE,
  [AC_PATH_PROGS($1,$2,$3,$4)
  if test -n "$$1"; then
@@ -11,11 +20,11 @@ Index: autofs-5.0.7/aclocal.m4
    AC_DEFINE(HAVE_$1,1,[define if you have $1])
    AC_DEFINE_UNQUOTED(PATH_$1, "$$1", [define if you have $1])
    HAVE_$1=1
-Index: autofs-5.0.7/configure.in
-===================================================================
---- autofs-5.0.7.orig/configure.in	2012-10-28 04:45:06.000000000 -0700
-+++ autofs-5.0.7/configure.in	2012-10-28 10:50:07.580000628 -0700
-@@ -301,13 +301,15 @@
+diff --git a/configure.in b/configure.in
+index 25d7c4e..44a1c8b 100644
+--- a/configure.in
++++ b/configure.in
+@@ -324,13 +324,15 @@ AC_PROG_CC
  cat > pietest.c <<EOF
  int main(void) { return 0; }
  EOF
@@ -33,7 +42,7 @@ Index: autofs-5.0.7/configure.in
  AC_MSG_RESULT([$gcc_supports_pie])
  if test $gcc_supports_pie = yes ; then
  	DAEMON_CFLAGS="-fPIE"
-@@ -316,6 +318,8 @@
+@@ -339,6 +341,8 @@ fi
  rm -f pietest.c
  AC_SUBST(DAEMON_CFLAGS)
  AC_SUBST(DAEMON_LDFLAGS)
diff --git a/meta-networking/recipes-daemons/autofs/autofs/fix-the-YACC-rule-to-fix-a-building-failure.patch b/meta-networking/recipes-daemons/autofs/autofs/fix-the-YACC-rule-to-fix-a-building-failure.patch
index 9b64183..21a97c8 100644
--- a/meta-networking/recipes-daemons/autofs/autofs/fix-the-YACC-rule-to-fix-a-building-failure.patch
+++ b/meta-networking/recipes-daemons/autofs/autofs/fix-the-YACC-rule-to-fix-a-building-failure.patch
@@ -1,4 +1,7 @@
-[PATCH] fix the YACC rule to fix a building failure
+From 971d48a00ef82880c34e89778bf430a01360ebd5 Mon Sep 17 00:00:00 2001
+From: Roy Li <rongqing.li@windriver.com>
+Date: Mon, 18 May 2015 16:28:36 +0800
+Subject: [PATCH] [PATCH] fix the YACC rule to fix a building failure
 
 Upstream-Statu: Pending
 
@@ -14,6 +17,7 @@ This lead to a race when compile amd_tok.o, the header file maybe rewritten.
   |../Makefile.rules:64: recipe for target 'amd_tok.o' failed
   |----------------------
 Signed-off-by: Roy Li <rongqing.li@windriver.com>
+
 ---
  lib/Makefile     | 6 ++++--
  modules/Makefile | 3 ++-
@@ -44,7 +48,7 @@ index 4798a4b..c40cf86 100644
  
  nss_tok.o: nss_tok.c nss_parse.tab.h
 diff --git a/modules/Makefile b/modules/Makefile
-index 237b70b..71415d0 100644
+index d9ab06c..abc7698 100644
 --- a/modules/Makefile
 +++ b/modules/Makefile
 @@ -103,7 +103,8 @@ amd_tok.c: amd_tok.l
@@ -57,6 +61,3 @@ index 237b70b..71415d0 100644
  	$(YACC) -v -d -p amd_ -b amd_parse $?
  
  amd_parse.tab.o: amd_parse.tab.c amd_parse.tab.h
--- 
-1.9.1
-
diff --git a/meta-networking/recipes-daemons/autofs/autofs/fix_disable_ldap.patch b/meta-networking/recipes-daemons/autofs/autofs/fix_disable_ldap.patch
index 94750b2..4143259 100644
--- a/meta-networking/recipes-daemons/autofs/autofs/fix_disable_ldap.patch
+++ b/meta-networking/recipes-daemons/autofs/autofs/fix_disable_ldap.patch
@@ -1,6 +1,9 @@
-autofs: fails to compile with openldap disabled
+From c500d9906f163bf716c872d37403b9de02ef0a86 Mon Sep 17 00:00:00 2001
+From: Amy Fong <amy.fong@windriver.com>
+Date: Fri, 18 Jan 2013 12:13:32 -0500
+Subject: [PATCH] autofs: fails to compile with openldap disabled
 
-As of 5.0.6, it appears that changes were introduced so that 
+As of 5.0.6, it appears that changes were introduced so that
 if you compile with openldap disabled and openldap headers are not
 available, then autofs fails to build.
 
@@ -12,13 +15,13 @@ Signed-off-by: Amy Fong <amy.fong@windriver.com>
  1 file changed, 4 insertions(+)
 
 ---
- include/lookup_ldap.h |    4 ++++
+ include/lookup_ldap.h | 4 ++++
  1 file changed, 4 insertions(+)
 
-Index: autofs-5.1.2/include/lookup_ldap.h
-===================================================================
---- autofs-5.1.2.orig/include/lookup_ldap.h
-+++ autofs-5.1.2/include/lookup_ldap.h
+diff --git a/include/lookup_ldap.h b/include/lookup_ldap.h
+index 3a7aba7..bfdb0b3 100644
+--- a/include/lookup_ldap.h
++++ b/include/lookup_ldap.h
 @@ -1,7 +1,9 @@
  #ifndef LOOKUP_LDAP_H
  #define LOOKUP_LDAP_H
diff --git a/meta-networking/recipes-daemons/autofs/autofs/force-STRIP-to-emtpy.patch b/meta-networking/recipes-daemons/autofs/autofs/force-STRIP-to-emtpy.patch
index 634005b..21396dd 100644
--- a/meta-networking/recipes-daemons/autofs/autofs/force-STRIP-to-emtpy.patch
+++ b/meta-networking/recipes-daemons/autofs/autofs/force-STRIP-to-emtpy.patch
@@ -1,14 +1,18 @@
-[PATCH] force STRIP to emtpy
+From 3cbee00fe5725b87abdae80cfa2ee735e4513ca6 Mon Sep 17 00:00:00 2001
+From: Roy Li <rongqing.li@windriver.com>
+Date: Tue, 19 Aug 2014 11:31:35 +0800
+Subject: [PATCH] [PATCH] force STRIP to emtpy
 
 otherwise the generate file will be stripped
 
 Signed-off-by: Roy Li <rongqing.li@windriver.com>
+
 ---
- Makefile.rules |    2 +-
+ Makefile.rules | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile.rules b/Makefile.rules
-index 710a2c9..e4334db 100644
+index 709dd04..b1f7e50 100644
 --- a/Makefile.rules
 +++ b/Makefile.rules
 @@ -31,7 +31,7 @@ LDFLAGS   ?= -s
@@ -20,6 +24,3 @@ index 710a2c9..e4334db 100644
  else
  STRIP     ?= strip --strip-debug
  endif
--- 
-1.7.10.4
-
diff --git a/meta-networking/recipes-daemons/autofs/autofs/libtirpc.patch b/meta-networking/recipes-daemons/autofs/autofs/libtirpc.patch
index d68944b..0a2d502 100644
--- a/meta-networking/recipes-daemons/autofs/autofs/libtirpc.patch
+++ b/meta-networking/recipes-daemons/autofs/autofs/libtirpc.patch
@@ -1,21 +1,17 @@
-Index: autofs-5.0.7/aclocal.m4
-===================================================================
---- autofs-5.0.7.orig/aclocal.m4	2012-10-28 13:17:45.504237027 -0700
-+++ autofs-5.0.7/aclocal.m4	2012-10-28 13:20:50.108242739 -0700
-@@ -403,7 +403,7 @@
- # save current flags
- af_check_libtirpc_save_cflags="$CFLAGS"
- af_check_libtirpc_save_ldflags="$LDFLAGS"
--CFLAGS="$CFLAGS -I/usr/include/tirpc"
-+CFLAGS="$CFLAGS -I=/usr/include/tirpc"
- LDFLAGS="$LDFLAGS -ltirpc"
- 
- AC_TRY_LINK(
-Index: autofs-5.0.7/Makefile.rules
-===================================================================
---- autofs-5.0.7.orig/Makefile.rules	2012-10-28 13:17:45.308237022 -0700
-+++ autofs-5.0.7/Makefile.rules	2012-10-28 13:21:25.720242803 -0700
-@@ -48,7 +48,7 @@
+From cb6a4f61adb027f2366318f2c08c8264ebf39218 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 5 Jan 2013 19:53:10 -0800
+
+---
+ Makefile.rules | 2 +-
+ aclocal.m4     | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.rules b/Makefile.rules
+index 6fa3e02..709dd04 100644
+--- a/Makefile.rules
++++ b/Makefile.rules
+@@ -46,7 +46,7 @@ CFLAGS += -D_REENTRANT -D_FILE_OFFSET_BITS=64
  LIBS += -lpthread
  
  ifdef TIRPCLIB
@@ -24,3 +20,16 @@ Index: autofs-5.0.7/Makefile.rules
  LIBS += $(TIRPCLIB)
  endif
  
+diff --git a/aclocal.m4 b/aclocal.m4
+index 2a9a802..0e4a624 100644
+--- a/aclocal.m4
++++ b/aclocal.m4
+@@ -416,7 +416,7 @@ AC_DEFUN([AF_CHECK_LIBTIRPC],
+ # save current flags
+ af_check_libtirpc_save_cflags="$CFLAGS"
+ af_check_libtirpc_save_ldflags="$LDFLAGS"
+-CFLAGS="$CFLAGS -I/usr/include/tirpc"
++CFLAGS="$CFLAGS -I=/usr/include/tirpc"
+ LDFLAGS="$LDFLAGS -ltirpc"
+ 
+ AC_TRY_LINK(
diff --git a/meta-networking/recipes-daemons/autofs/autofs/no-bash.patch b/meta-networking/recipes-daemons/autofs/autofs/no-bash.patch
index cf03635..c46c0e5 100644
--- a/meta-networking/recipes-daemons/autofs/autofs/no-bash.patch
+++ b/meta-networking/recipes-daemons/autofs/autofs/no-bash.patch
@@ -1,17 +1,26 @@
-Index: autofs-5.0.7/samples/auto.net
-===================================================================
---- autofs-5.0.7.orig/samples/auto.net	2012-07-24 23:05:26.000000000 -0700
-+++ autofs-5.0.7/samples/auto.net	2012-10-28 10:44:25.035991715 -0700
+From a3007d7ea930823926611081bb873ddd771325cb Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 5 Jan 2013 19:53:10 -0800
+
+---
+ samples/auto.net | 2 +-
+ samples/auto.smb | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/samples/auto.net b/samples/auto.net
+index 0384f61..61215f6 100755
+--- a/samples/auto.net
++++ b/samples/auto.net
 @@ -1,4 +1,4 @@
 -#!/bin/bash
 +#!/bin/sh
  
  # This file must be executable to work! chmod 755!
  
-Index: autofs-5.0.7/samples/auto.smb
-===================================================================
---- autofs-5.0.7.orig/samples/auto.smb	2012-07-24 23:05:26.000000000 -0700
-+++ autofs-5.0.7/samples/auto.smb	2012-10-28 10:44:25.035991715 -0700
+diff --git a/samples/auto.smb b/samples/auto.smb
+index 6af5d85..d296b81 100755
+--- a/samples/auto.smb
++++ b/samples/auto.smb
 @@ -1,4 +1,4 @@
 -#!/bin/bash
 +#!/bin/sh
diff --git a/meta-networking/recipes-daemons/autofs/autofs/pkgconfig-libnsl.patch b/meta-networking/recipes-daemons/autofs/autofs/pkgconfig-libnsl.patch
index bf2c964..1c7b119 100644
--- a/meta-networking/recipes-daemons/autofs/autofs/pkgconfig-libnsl.patch
+++ b/meta-networking/recipes-daemons/autofs/autofs/pkgconfig-libnsl.patch
@@ -1,13 +1,22 @@
+From e3ae56cf0bb4063c31295f45d04e3c504f4b6cc7 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 24 Apr 2017 20:41:25 -0700
+Subject: [PATCH] autofs: Upgrade to 5.1.2 release
+
 Use pkg-config first to look for external libnsl which is now
 split out from glibc, if it does not exist then see if its provided
 by glibc itself.
 
 -Khem
 
-Index: autofs-5.1.2/configure.in
-===================================================================
---- autofs-5.1.2.orig/configure.in
-+++ autofs-5.1.2/configure.in
+---
+ configure.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.in b/configure.in
+index 9cf73b8..1016c71 100644
+--- a/configure.in
++++ b/configure.in
 @@ -186,7 +186,7 @@ fi
  #
  # glibc/libc 6 new libraries
diff --git a/meta-networking/recipes-daemons/autofs/autofs/remove-bashism.patch b/meta-networking/recipes-daemons/autofs/autofs/remove-bashism.patch
index 282d6f0..4183069 100644
--- a/meta-networking/recipes-daemons/autofs/autofs/remove-bashism.patch
+++ b/meta-networking/recipes-daemons/autofs/autofs/remove-bashism.patch
@@ -1,4 +1,4 @@
-From 79034f969bbd12215d65b4337dfd38a13d02d4ef Mon Sep 17 00:00:00 2001
+From cfacbb917f87b903b50132a5025f86b0cc522e9c Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Sat, 13 Sep 2014 20:19:28 -0700
 Subject: [PATCH] autofs.init.in: remove bashism
@@ -9,9 +9,10 @@ Upstream-Status: Pending
 
 Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+
 ---
- redhat/autofs.init.in |   12 ++++++------
- samples/rc.autofs.in  |   10 +++++-----
+ redhat/autofs.init.in | 12 ++++++------
+ samples/rc.autofs.in  | 10 +++++-----
  2 files changed, 11 insertions(+), 11 deletions(-)
 
 diff --git a/redhat/autofs.init.in b/redhat/autofs.init.in
@@ -115,6 +116,3 @@ index 487669f..e96cde1 100644
  	pid=`pidof $prog`
  	if [ -z $pid ]; then
  		echo $"$prog not running"
--- 
-1.7.9.5
-
diff --git a/meta-networking/recipes-daemons/autofs/autofs/using-pkg-config-to-detect-libxml-2.0-and-krb5.patch b/meta-networking/recipes-daemons/autofs/autofs/using-pkg-config-to-detect-libxml-2.0-and-krb5.patch
index 93b76bd..3d0c6bd 100644
--- a/meta-networking/recipes-daemons/autofs/autofs/using-pkg-config-to-detect-libxml-2.0-and-krb5.patch
+++ b/meta-networking/recipes-daemons/autofs/autofs/using-pkg-config-to-detect-libxml-2.0-and-krb5.patch
@@ -1,14 +1,18 @@
-using pkg-config to detect libxml-2.0 and krb5
+From dabcbdae38038a8e4ad2c4286112381c407c5ce7 Mon Sep 17 00:00:00 2001
+From: Roy Li <rongqing.li@windriver.com>
+Date: Tue, 19 Aug 2014 11:31:35 +0800
+Subject: [PATCH] using pkg-config to detect libxml-2.0 and krb5
 
 Upstream-status: Pending
 
 Signed-off-by: Roy Li <rongqing.li@windriver.com>
+
 ---
- configure.in |   16 ++++++++++++++--
- 2 files changed, 14 insertions(+), 2 deletions(-)
+ configure.in | 16 ++++++++++++++--
+ 1 file changed, 14 insertions(+), 2 deletions(-)
 
 diff --git a/configure.in b/configure.in
-index 392d122..a3028aa 100644
+index b226236..9cf73b8 100644
 --- a/configure.in
 +++ b/configure.in
 @@ -162,8 +162,20 @@ if test x$enable_sloppy_mount = xyes; then
@@ -34,6 +38,3 @@ index 392d122..a3028aa 100644
  
  AC_SEARCH_LIBS([versionsort],[])
  if test "$ac_cv_search_versionsort" = "no"; then
--- 
-1.7.10.4
-
-- 
2.7.4


