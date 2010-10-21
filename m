Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.jrz.cbn>) id 1P92au-00082Y-MM
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 23:22:41 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id C8AEB8C762D;
	Thu, 21 Oct 2010 17:22:04 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 23832-08; Thu, 21 Oct 2010 17:22:04 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id F3A028D07E7; Thu, 21 Oct 2010 17:22:03 -0400 (EDT)
Received: from sles10-64.jrz.cbn (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 71F818C762D;
	Thu, 21 Oct 2010 17:22:02 -0400 (EDT)
Received: by sles10-64.jrz.cbn (Postfix, from userid 1001)
	id 53C8B5000E5; Thu, 21 Oct 2010 17:22:02 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Oct 2010 17:22:01 -0400
Message-Id: <1287696121-28307-2-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1287696121-28307-1-git-send-email-msmith@cbnco.com>
References: <1287696121-28307-1-git-send-email-msmith@cbnco.com>
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: michael@sles10-64.jrz.cbn
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM,
	SPF_HELO_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] gcc 4.3.4: backport -print-sysroot for libtool
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
X-List-Received-Date: Thu, 21 Oct 2010 21:22:41 -0000

libtoolized configure scripts need this in order to autodetect sysroot
path when --with-sysroot is passed.

Signed-off-by: Michael Smith <msmith@cbnco.com>
Cc: Khem Raj <raj.khem@gmail.com>
---
 recipes/gcc/gcc-4.3.4.inc                          |    3 ++-
 .../gcc-4.3-backport-print-sysroot.patch           |    0
 2 files changed, 2 insertions(+), 1 deletions(-)
 copy recipes/gcc/{gcc-4.3.3 => gcc-4.3.4}/gcc-4.3-backport-print-sysroot.patch (100%)

diff --git a/recipes/gcc/gcc-4.3.4.inc b/recipes/gcc/gcc-4.3.4.inc
index 5aef5e5..3f3809c 100644
--- a/recipes/gcc/gcc-4.3.4.inc
+++ b/recipes/gcc/gcc-4.3.4.inc
@@ -8,7 +8,7 @@ LICENSE = "GPLv3"
 DEPENDS = "mpfr gmp"
 NATIVEDEPS = "mpfr-native gmp-native"
 
-INC_PR = "r12"
+INC_PR = "r13"
 
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
 	file://fedora/gcc43-c++-builtin-redecl.patch;striplevel=0 \
@@ -62,6 +62,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
 	file://gcc-4.3.x-fix-EXTRA_BUILD.patch \
 	file://gcc-flags-for-build.patch \
 	file://Makefile.in.patch \
+	file://gcc-4.3-backport-print-sysroot.patch \
 "
 
 SRC_URI_append_sh3  = " file://sh3-installfix-fixheaders.patch "
diff --git a/recipes/gcc/gcc-4.3.3/gcc-4.3-backport-print-sysroot.patch b/recipes/gcc/gcc-4.3.4/gcc-4.3-backport-print-sysroot.patch
similarity index 100%
copy from recipes/gcc/gcc-4.3.3/gcc-4.3-backport-print-sysroot.patch
copy to recipes/gcc/gcc-4.3.4/gcc-4.3-backport-print-sysroot.patch
-- 
1.7.0.4



