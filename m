Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.jrz.cbn>) id 1P92au-00082Z-RF
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 23:22:42 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 0C9AE8D07E7;
	Thu, 21 Oct 2010 17:22:05 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 24163-02; Thu, 21 Oct 2010 17:22:04 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id A76318CD485; Thu, 21 Oct 2010 17:22:04 -0400 (EDT)
Received: from sles10-64.jrz.cbn (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 6C17D89DD00;
	Thu, 21 Oct 2010 17:22:02 -0400 (EDT)
Received: by sles10-64.jrz.cbn (Postfix, from userid 1001)
	id 34FA95000E7; Thu, 21 Oct 2010 17:22:02 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Oct 2010 17:22:00 -0400
Message-Id: <1287696121-28307-1-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.7.0.4
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: michael@sles10-64.jrz.cbn
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM,
	SPF_HELO_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] gcc 4.3.3: backport -print-sysroot for libtool
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
X-List-Received-Date: Thu, 21 Oct 2010 21:22:42 -0000

libtoolized configure scripts need this in order to autodetect sysroot
path when --with-sysroot is passed.

Signed-off-by: Michael Smith <msmith@cbnco.com>
Cc: Khem Raj <raj.khem@gmail.com>
---
 recipes/gcc/gcc-4.3.3.inc                          |    3 +-
 .../gcc-4.3.3/gcc-4.3-backport-print-sysroot.patch |   69 ++++++++++++++++++++
 2 files changed, 71 insertions(+), 1 deletions(-)
 create mode 100644 recipes/gcc/gcc-4.3.3/gcc-4.3-backport-print-sysroot.patch

diff --git a/recipes/gcc/gcc-4.3.3.inc b/recipes/gcc/gcc-4.3.3.inc
index 7bee4af..7239f82 100644
--- a/recipes/gcc/gcc-4.3.3.inc
+++ b/recipes/gcc/gcc-4.3.3.inc
@@ -8,7 +8,7 @@ LICENSE = "GPLv3"
 DEPENDS = "mpfr gmp"
 NATIVEDEPS = "mpfr-native gmp-native"
 
-INC_PR = "r18"
+INC_PR = "r19"
 
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
 	file://fedora/gcc43-c++-builtin-redecl.patch;striplevel=0 \
@@ -65,6 +65,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
         file://arm-gcc-objective.patch \
 	file://Makefile.in.patch \
 	file://Makefile.in.parallel.patch \
+	file://gcc-4.3-backport-print-sysroot.patch \
 "
 
 SRC_URI_append_sh3  = " file://sh3-installfix-fixheaders.patch "
diff --git a/recipes/gcc/gcc-4.3.3/gcc-4.3-backport-print-sysroot.patch b/recipes/gcc/gcc-4.3.3/gcc-4.3-backport-print-sysroot.patch
new file mode 100644
index 0000000..c44d050
--- /dev/null
+++ b/recipes/gcc/gcc-4.3.3/gcc-4.3-backport-print-sysroot.patch
@@ -0,0 +1,69 @@
+Backport "gcc -print-sysroot" from 4.4.x, required by some tools
+that auto-detect sysroot (e.g. libtool configured with --with-sysroot).
+
+Source: http://gcc.gnu.org/viewcvs/trunk/gcc/gcc.c?r1=137548&r2=137584&view=patch
+
+--- trunk/gcc/gcc.c	2008/07/07 00:48:55	137548
++++ trunk/gcc/gcc.c	2008/07/07 18:20:06	137584
+@@ -155,6 +155,8 @@
+ 
+ static int print_multi_directory;
+ 
++static int print_sysroot;
++
+ /* Flag saying to print the relative path we'd use to
+    find OS libraries given the current compiler flags.  */
+ 
+@@ -1162,6 +1164,7 @@
+    {"--print-multi-directory", "-print-multi-directory", 0},
+    {"--print-multi-os-directory", "-print-multi-os-directory", 0},
+    {"--print-prog-name", "-print-prog-name=", "aj"},
++   {"--print-sysroot", "-print-sysroot", 0},
+    {"--print-sysroot-headers-suffix", "-print-sysroot-headers-suffix", 0},
+    {"--profile", "-p", 0},
+    {"--profile-blocks", "-a", 0},
+@@ -3244,6 +3247,7 @@
+   -print-multi-lib         Display the mapping between command line options and\n\
+                            multiple library search directories\n"), stdout);
+   fputs (_("  -print-multi-os-directory Display the relative path to OS libraries\n"), stdout);
++  fputs (_("  -print-sysroot           Display the target libraries directory\n"), stdout);
+   fputs (_("  -print-sysroot-headers-suffix Display the sysroot suffix used to find headers\n"), stdout);
+   fputs (_("  -Wa,<options>            Pass comma-separated <options> on to the assembler\n"), stdout);
+   fputs (_("  -Wp,<options>            Pass comma-separated <options> on to the preprocessor\n"), stdout);
+@@ -3686,6 +3690,8 @@
+ 	print_multi_lib = 1;
+       else if (! strcmp (argv[i], "-print-multi-directory"))
+ 	print_multi_directory = 1;
++      else if (! strcmp (argv[i], "-print-sysroot"))
++	print_sysroot = 1;
+       else if (! strcmp (argv[i], "-print-multi-os-directory"))
+ 	print_multi_os_directory = 1;
+       else if (! strcmp (argv[i], "-print-sysroot-headers-suffix"))
+@@ -4126,6 +4132,8 @@
+ 	;
+       else if (! strcmp (argv[i], "-print-multi-directory"))
+ 	;
++      else if (! strcmp (argv[i], "-print-sysroot"))
++	;
+       else if (! strcmp (argv[i], "-print-multi-os-directory"))
+ 	;
+       else if (! strcmp (argv[i], "-print-sysroot-headers-suffix"))
+@@ -6529,6 +6537,18 @@
+       return (0);
+     }
+ 
++  if (print_sysroot)
++    {
++      if (target_system_root)
++	{
++          if (target_sysroot_suffix)
++	    printf ("%s%s\n", target_system_root, target_sysroot_suffix);
++          else
++	    printf ("%s\n", target_system_root);
++	}
++      return (0);
++    }
++
+   if (print_multi_os_directory)
+     {
+       if (multilib_os_dir == NULL)
-- 
1.7.0.4



