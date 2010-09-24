Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Oz2Sn-0006Sv-3x
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Sep 2010 09:12:58 +0200
Received: by pwi10 with SMTP id 10so561375pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Sep 2010 00:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=vcCAhfItFLj1LqGfKBb/Lcddy76r2pcPT/WL103jxS4=;
	b=UCT7aeG1fuHbHNajHzQPsShsfPWwaj0rFtLkABMvOReEdRhvDyA1hc9mqFLtaiDuGt
	qcn6xyIFhbr/ur57PpCFniz6/ttRwdolO3bmGsN6m2E3fj6cJYbtRpUeFV4FqStiwTwP
	SVtyqOdOU0AL6n1G+F9iHGig8hL48GvkPq0tc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=GvbCEMDr1yb+5HNAzPecq2xi6BB3uNsPKiy8TTnp4NwUsGcqC9kzD8o2ivlKMGlcfx
	2xFAM7zxNOtSOlCVYSu2K5FGKLywy3DsMMIbRIo4+hXd90OXA9KNx70fGTnTrcZa+FNE
	qWcFNWUXIEa3GhiZA9CWv8GHYDqW4Wa5vtEz0=
Received: by 10.142.191.12 with SMTP id o12mr2329064wff.301.1285312369763;
	Fri, 24 Sep 2010 00:12:49 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id v3sm1903166wfv.11.2010.09.24.00.12.48
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 24 Sep 2010 00:12:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Sep 2010 00:12:44 -0700
Message-Id: <1285312364-12627-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] eglibc.inc: Transfer PARALLEL_MAKE to PARALLELMFLAGS
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
X-List-Received-Date: Fri, 24 Sep 2010 07:12:58 -0000

* Currently we are passing -jN flags to eglibc makefiles
  however eglibc uses a make variable called PARALLELMFLAGS
  to pass information about parallel build to sub-makes

* Currently make install ran without parallelism but now
  it should have parallel building flags passed to do_install
  correctly which inturn should improve build time of
  eglibc on systems using parallel build -j with values > 1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/eglibc/eglibc.inc |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/recipes/eglibc/eglibc.inc b/recipes/eglibc/eglibc.inc
index 66bb90e..c8ecff8 100644
--- a/recipes/eglibc/eglibc.inc
+++ b/recipes/eglibc/eglibc.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.eglibc.org/home"
 SECTION = "libs"
 PRIORITY = "required"
 LICENSE = "LGPL"
-INC_PR = "r11"
+INC_PR = "r12"
 # nptl needs unwind support in gcc, which can't be built without glibc.
 DEPENDS = "virtual/${TARGET_PREFIX}gcc-intermediate linux-libc-headers"
 #this leads to circular deps, so lets not add it yet
@@ -20,5 +20,8 @@ GLIBC_EXTRA_OECONF ?= ""
 INHIBIT_DEFAULT_DEPS = "1"
 
 ARM_INSTRUCTION_SET = "arm"
-
+# eglibc uses PARALLELMFLAGS variable to pass parallel build info so transfer
+# PARALLEL_MAKE into PARALLELMFLAGS and empty out PARALLEL_MAKE
+EXTRA_OEMAKE := "PARALLELMFLAGS=${PARALLEL_MAKE}"
+PARALLEL_MAKE = ""
 PACKAGES = "glibc catchsegv sln nscd ldd localedef glibc-utils glibc-dev glibc-doc glibc-locale libsegfault glibc-extra-nss glibc-thread-db glibc-pcprofile"
-- 
1.7.1



