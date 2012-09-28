Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1THbcQ-0000RY-QC
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Sep 2012 16:32:42 +0200
Received: by daks35 with SMTP id s35so694966dak.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Sep 2012 07:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=b7opG2kSwI5lcJJfz9dBNIoowEH5xcGPsn83y/GoXNY=;
	b=pKDy2aOD2XalAXv/8/mRHbhyEMKXGEFviFI4TnfRCLjFD401f10Kg1H5+R128Dvr/Q
	bf4mffSKmEOJ7rkEkwJJ4upOTvlVILWAHkfsdhPi5jfpbRStrZ7TNbDHDQN2+Rt89/a6
	/BKrC6aZ3laC4uiWurlzLaqKBpr4vugm3PiSiHzzuIaCK53fQ7hHgV5p8h4NdrrSt8WF
	N/QfzyhlfA9+viBYQmVAYyS/Qav43vPkJOZ3Xtwu9EVurPxfj96t4WxH48OwjvAYRAC2
	5XtY3bqVA8xMEqfKMkS1T3uR5S2HLSUiDC4jPgnotCNzxAXQhbZA4syrewLpfbH25T6b
	Hzwg==
Received: by 10.68.226.38 with SMTP id rp6mr20955785pbc.116.1348841989056;
	Fri, 28 Sep 2012 07:19:49 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id i2sm5582370pav.13.2012.09.28.07.19.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 28 Sep 2012 07:19:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 28 Sep 2012 07:19:33 -0700
Message-Id: <1348841973-20329-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH] uhd,fuse: Fix misplaced quotations
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
X-List-Received-Date: Fri, 28 Sep 2012 14:32:43 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/uhd/uhd.inc   |    4 ++--
 meta-oe/recipes-support/fuse/fuse_2.9.1.bb |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-connectivity/uhd/uhd.inc b/meta-oe/recipes-connectivity/uhd/uhd.inc
index 5e2e329..27584da 100644
--- a/meta-oe/recipes-connectivity/uhd/uhd.inc
+++ b/meta-oe/recipes-connectivity/uhd/uhd.inc
@@ -7,7 +7,7 @@ DEPENDS = "git-native boost libusb1 uhd-firmware orc-native"
 RDEPENDS_${PN} += "uhd-firmware"
 
 PE = "1"
-INC_PR = "r1"
+INC_PR = "r2"
 
 inherit cmake
 
@@ -20,7 +20,7 @@ FILES_${PN} += "${libdir}/libuhd.so \
 FILES_${PN}-tests += "${datadir}/uhd/tests/*"
 FILES_${PN}-e1xx += "${datadir}/uhd/usrp_e_utils/*"
 FILES_${PN}-dbg += "${datadir}/uhd/examples/.debug/* \
-"                   ${datadir}/uhd/utils/.debug/* \
+                    ${datadir}/uhd/utils/.debug/* \
                     ${datadir}/uhd/tests/.debug/* \
                     ${datadir}/uhd/usrp_e_utils/.debug/*"
 FILES_${PN}-examples = "${datadir}/uhd/examples/*"
diff --git a/meta-oe/recipes-support/fuse/fuse_2.9.1.bb b/meta-oe/recipes-support/fuse/fuse_2.9.1.bb
index 6718758..86a8465 100644
--- a/meta-oe/recipes-support/fuse/fuse_2.9.1.bb
+++ b/meta-oe/recipes-support/fuse/fuse_2.9.1.bb
@@ -17,7 +17,7 @@ EXTRA_OECONF = "--disable-kernel-module"
 
 PACKAGES =+ "fuse-utils-dbg fuse-utils libulockmgr libulockmgr-dev libulockmgr-dbg"
 
-RRECOMMENDS_${PN} = "kernel-module-fuse""
+RRECOMMENDS_${PN} = "kernel-module-fuse"
 
 FILES_${PN} += "${libdir}/libfuse.so.*"
 FILES_${PN}-dev += "${libdir}/libfuse*.la"
-- 
1.7.9.5



