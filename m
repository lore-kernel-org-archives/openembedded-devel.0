Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TRAzv-0005Kp-NJ
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Oct 2012 02:08:31 +0200
Received: by mail-wi0-f171.google.com with SMTP id hj13so4741115wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Oct 2012 16:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=IgNhqoEzcWO/EIs7xK8bIcyd8vgkDbuDmrqDH86ZcS4=;
	b=L1rHrWQMT8YUceZ5WXS/UveUHzLEkmIplTN1FSFR3CLg616DuknVyJiPYIzgcONpcs
	X4B9kQS/+/p8m58WRQb2VcqShOitRNYT0HS4dBrboxCutEa86hhPBzYvic29ickCwcCa
	HewzKscenOnApLEAkuIxSctgS04QaCnE5bwBiLcVbeXXDPevZZr2h91Xqt9PpsUb7/Km
	51C2z6Vwd2etc6U6d47jocVIuaUEYhfOjnI0wS28vfUTRfWlW9GX2C48jaw7EuDHrKpC
	sHiG45nmynPLWUSlSizpYQ/JZqeC8uYf0RyA1ZP3h1HxZrK0qMGusD3dtBA1z6PvH7MI
	Lq+g==
Received: by 10.180.102.131 with SMTP id fo3mr6035191wib.1.1351122903994;
	Wed, 24 Oct 2012 16:55:03 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w8sm6980372wif.4.2012.10.24.16.55.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 24 Oct 2012 16:55:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Oct 2012 01:54:28 +0200
Message-Id: <f08fcb0184f79acb79decb568032614cd5f781b4.1351122431.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12.4
In-Reply-To: <cover.1351122431.git.Martin.Jansa@gmail.com>
References: <cover.1351122431.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1351122431.git.Martin.Jansa@gmail.com>
References: <cover.1351122431.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 7/8] check: drop from meta-oe, there is libcheck in oe-core
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
X-List-Received-Date: Thu, 25 Oct 2012 00:08:31 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../check/check-0.9.8/fix.automake-1.12.x.patch    | 26 ----------------------
 meta-oe/recipes-support/check/check_0.9.8.bb       | 15 -------------
 2 files changed, 41 deletions(-)
 delete mode 100644 meta-oe/recipes-support/check/check-0.9.8/fix.automake-1.12.x.patch
 delete mode 100644 meta-oe/recipes-support/check/check_0.9.8.bb

diff --git a/meta-oe/recipes-support/check/check-0.9.8/fix.automake-1.12.x.patch b/meta-oe/recipes-support/check/check-0.9.8/fix.automake-1.12.x.patch
deleted file mode 100644
index e11aabe..0000000
--- a/meta-oe/recipes-support/check/check-0.9.8/fix.automake-1.12.x.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Fixes this error:
-
-| /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/share/automake-1.12/am/ltlibrary.am: warning: 'libcompat.la': linking libtool libraries using a non-POSIX
-| /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/share/automake-1.12/am/ltlibrary.am: archiver requires 'AM_PROG_AR' in 'configure.ac'
-| lib/Makefile.am:3:   while processing Libtool library 'libcompat.la'
-| /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/share/automake-1.12/am/ltlibrary.am: warning: 'libcheck.la': linking libtool libraries using a non-POSIX
-| /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/share/automake-1.12/am/ltlibrary.am: archiver requires 'AM_PROG_AR' in 'configure.ac'
-| src/Makefile.am:3:   while processing Libtool library 'libcheck.la'
-| /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/share/automake-1.12/am/ltlibrary.am: warning: 'libcheckinternal.la': linking libtool libraries using a non-POSIX
-| /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/share/automake-1.12/am/ltlibrary.am: archiver requires 'AM_PROG_AR' in 'configure.ac'
-| src/Makefile.am:4:   while processing Libtool library 'libcheckinternal.la'
-| autoreconf: automake failed with exit status: 1
-
-Upstream-Status: Pending
-
-diff -uNr check-0.9.8.orig//configure.ac check-0.9.8/configure.ac
---- check-0.9.8.orig//configure.ac	2009-09-23 12:50:08.000000000 +0200
-+++ check-0.9.8/configure.ac	2012-07-19 17:43:51.000000000 +0200
-@@ -102,6 +102,7 @@
- AC_PROG_INSTALL
- AC_PROG_LN_S
- AC_PROG_LIBTOOL
-+AM_PROG_AR
- 
- # add these options to CFLAGS if the compiler supports them
- AC_DEFUN([AX_CFLAGS_ADD],[AX_C_CHECK_FLAG($1, , , CFLAGS="$CFLAGS $1")])
diff --git a/meta-oe/recipes-support/check/check_0.9.8.bb b/meta-oe/recipes-support/check/check_0.9.8.bb
deleted file mode 100644
index ca79740..0000000
--- a/meta-oe/recipes-support/check/check_0.9.8.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-DESCRIPTION = "a unit test framework for C"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=2d5025d4aa3495befef8f17206a5b0a1"
-SECTION = "devel"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/check/check-${PV}.tar.gz \
-           file://fix.automake-1.12.x.patch \
-          "
-
-inherit autotools pkgconfig
-
-EXTRA_OECONF += "--enable-plain-docdir"
-
-SRC_URI[md5sum] = "5d75e9a6027cde79d2c339ef261e7470"
-SRC_URI[sha256sum] = "82acf956bb07584ffea2bf04d5989fe939c3e74ecf93133a21037fd0f7996a7f"
-- 
1.7.12.4



