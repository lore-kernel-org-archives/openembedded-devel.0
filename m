Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7B1B273189
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Sep 2016 14:41:11 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id b184so15389455wma.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Sep 2016 07:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=S3i0fkCAUh+wXIBq53lVXrcqDc6jdP7s9EGxATlV6Sg=;
	b=ax2ib/xRrA0J63nxD/CelH9GIv0AHMbIy8HLSWlmbp0mso7hDbUW04Y48YsdI1czti
	iBcOoQ9/lsGARwZk2FlBUzKVtt9/TFaCauUrqTyFezRpINCRhI9l2cjHSVk5JQfHto4Z
	o9/KoaGVXHvz9g4oXq35nqSiqaDXPHG5npz3RWDKdcedTC8Eodh7r4wruMI/H4iYPGZ8
	c5wPI64J24bSMvdWshMmV6U4a8R/smi5AKG3MpYvAxhKKv2nhd+luZJAX3mqXAwbBz+1
	UVEow+VHkQjVXzpqjFaDYakBtuKrKGhSgYtniKWkl5yDf5XXV8ayRyOoJ73pkYXLyqa3
	My5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=S3i0fkCAUh+wXIBq53lVXrcqDc6jdP7s9EGxATlV6Sg=;
	b=XZmVAOGV/fluNRb04E5h072xVKleyZVUVUovwe4lIL2J5d6jNrUgaBsWkaGclJertU
	+1hZGRMfBIkWqOBWjkBzhCQrlbyFe0PsDoPPGRmClf3ZLd1jCnmtL/ie9IlRi7SfcnZw
	GDclyy1SNR0CuwIHZKw3fzzzPpV2v+6xPZs0mhhfTKhyZbm9xHzbEg+kd0DdFMXqtstD
	1VhukQRtk7kqN4ETMFQ3bOek6BKyZUbBRljmTBfpzWZIdvEUrH2SesvfTNXrGEEEV+Nh
	MpOmQhnWwEYmn2kGuo3pFFzRyd4//ssSbJVYcy5qrPKdcCnfur+azEEAfEcsQROvzY3p
	W+0g==
X-Gm-Message-State: AE9vXwMmU8cipFk9WN60Xc8i9H+/84rguujheBknSFufKFpQU0YRs1dJkkycQU1Kk4pu8Q==
X-Received: by 10.194.242.101 with SMTP id wp5mr24500606wjc.44.1474296072336; 
	Mon, 19 Sep 2016 07:41:12 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	g184sm22464813wme.15.2016.09.19.07.41.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Sep 2016 07:41:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Sep 2016 16:41:10 +0200
Message-Id: <20160919144110.13678-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.10.0
Subject: [meta-oe][PATCH] p7zip, mce-inject: update LIC_FILES_CHKSUM
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
X-List-Received-Date: Mon, 19 Sep 2016 14:41:13 -0000

* both were failing since last upgrade, but nobody noticed, because nobody
  reads QA issues in "bitbake world status" e-mails and LIC_FILES_CHKSUM
  mismatch wasn't fatal due to bug in insane.bbclass
* http://errors.yoctoproject.org/Errors/Details/83571/
* http://errors.yoctoproject.org/Errors/Details/83572/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/p7zip/p7zip_16.02.bb    | 2 +-
 meta-oe/recipes-support/mcelog/mce-inject_git.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb b/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
index 12be02c..9f87e9f 100644
--- a/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
+++ b/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.7-zip.org/"
 LICENSE = "LGPL-2.1+ & unRAR"
 LIC_FILES_CHKSUM = "file://DOC/copying.txt;md5=4fbd65380cdd255951079008b364516c \
                     file://DOC/unRarLicense.txt;md5=9c87ddde469ef94aed153b0951d088de \
-                    file://DOC/License.txt;md5=8346bfd0a2fa0987e7a3a512adf84ab9"
+                    file://DOC/License.txt;md5=879598edf1f54dddb6930d7581357f8b"
 
 SRC_URI = "http://downloads.sourceforge.net/p7zip/p7zip/${PV}/p7zip_${PV}_src_all.tar.bz2 \
           file://do_not_override_compiler_and_do_not_strip.patch"
diff --git a/meta-oe/recipes-support/mcelog/mce-inject_git.bb b/meta-oe/recipes-support/mcelog/mce-inject_git.bb
index d80cc05..f876144 100644
--- a/meta-oe/recipes-support/mcelog/mce-inject_git.bb
+++ b/meta-oe/recipes-support/mcelog/mce-inject_git.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/utils/cpu/mce/mce-inject.git"
 SRCREV = "4cbe46321b4a81365ff3aafafe63967264dbfec5"
 
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://README;beginline=30;md5=3d12dd2a10bdd22379cc4c0fc6949a88"
+LIC_FILES_CHKSUM = "file://README;beginline=30;md5=94c18755082a2da9c9cf97cba3ad47d6"
 
 S = "${WORKDIR}/git"
 
-- 
2.10.0


