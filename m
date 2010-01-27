Received: from mail-gx0-f217.google.com ([209.85.217.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Na2ju-0000VJ-6j
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Jan 2010 08:55:05 +0100
Received: by gxk9 with SMTP id 9so8542838gxk.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jan 2010 23:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=a90Ov3UJq4dVUBE+vYmME7JzsGg2GzinVvkyzHuF2gU=;
	b=swvfCJS3FUZf4C1cVE0HO9yg9AHv/c+yFmd3KakWLNzSWlcph8bV0ecUNGLWAt9/yE
	2+7+5aF1t4xj0cZELtdyRR5hqWjCvqptbEqQr6fkZwzkkE9W7BYindqRRwFG1pT169te
	ZWBg65eQS4212qwAPRSm4pvR5Y+hOzCM86XB4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=Ed9KPaPp8SA6NyPnMDvhjR/Lwd/ZHYuOkXl3mMn3r+G8aWAMNQJ8dJ6Hn1eTji8m/A
	gG6DyEn8BJZf343lrvFvsP1VENqrFnK7bszIDKSvOIv9xx46H3ogS3P691MLO8fKfnLs
	9+cSt292xCtXSz2nJj1pgQZuT7JCYG9dFDTCo=
Received: by 10.150.251.41 with SMTP id y41mr12053524ybh.247.1264578758755;
	Tue, 26 Jan 2010 23:52:38 -0800 (PST)
Received: from localhost (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 35sm2321351yxh.33.2010.01.26.23.52.37
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 26 Jan 2010 23:52:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Jan 2010 23:52:17 -0800
Message-Id: <1264578737-7573-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.6.5
X-SA-Exim-Connect-IP: 209.85.217.217
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] gcc-configure-common.inc: Disable --enable-target-optspace for *-*-linux-gnuspe.
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
X-List-Received-Date: Wed, 27 Jan 2010 07:55:05 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/gcc/gcc-configure-common.inc |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/recipes/gcc/gcc-configure-common.inc b/recipes/gcc/gcc-configure-common.inc
index ee6c0e7..7a15562 100644
--- a/recipes/gcc/gcc-configure-common.inc
+++ b/recipes/gcc/gcc-configure-common.inc
@@ -16,6 +16,13 @@ OBJC_nylon ?= ""
 OBJC_mips ?= ""
 OBJC_mipsel ?= ""
 OBJC ?= ",objc"
+# disable --enable-target-optspace for powerpc SPE
+# at -Os libgcc.so.1 creates references into
+# hidden symbols in libgcc.a which linker complains
+# when linking shared libraries further in the build like (gnutls)
+
+OPTSPACE_linux-gnuspe ?= ""
+OPTSPACE ?= "--enable-target-optspace"
 
 # gcc 3.x expects 'f77', 4.0 expects 'f95', 4.1 and 4.2 expect 'fortran'
 FORTRAN ?= ",f77"
@@ -27,7 +34,6 @@ EXTRA_OECONF_PATHS ?= ""
 EXTRA_OECONF = "${@['--enable-clocale=generic', ''][bb.data.getVar('USE_NLS', d, 1) != 'no']} \
                 --with-gnu-ld \
                 --enable-shared \
-                --enable-target-optspace \
                 --enable-languages=${LANGUAGES} \
                 --enable-threads=posix \
                 --enable-multilib \
@@ -36,6 +42,7 @@ EXTRA_OECONF = "${@['--enable-clocale=generic', ''][bb.data.getVar('USE_NLS', d,
                 --enable-symvers=gnu \
                 --enable-libstdcxx-pch \
                 --program-prefix=${TARGET_PREFIX} \
+                ${OPTSPACE} \
                 ${EXTRA_OECONF_BASE} \
                 ${EXTRA_OECONF_FPU} \
                 ${EXTRA_OECONF_PATHS} \
-- 
1.6.5



