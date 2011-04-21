Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QCrFA-0001kI-PH
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Apr 2011 12:36:16 +0200
Received: by wwb17 with SMTP id 17so1612415wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Apr 2011 03:33:53 -0700 (PDT)
Received: by 10.227.36.209 with SMTP id u17mr6632386wbd.117.1303382033175;
	Thu, 21 Apr 2011 03:33:53 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id bd8sm1097504wbb.65.2011.04.21.03.33.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Apr 2011 03:33:52 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Apr 2011 12:33:22 +0200
Message-Id: <1303382002-23874-3-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <1303382002-23874-2-git-send-email-koen@dominion.thruhere.net>
References: <1303382002-23874-1-git-send-email-koen@dominion.thruhere.net>
	<1303382002-23874-2-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe 3/3] pointercal-xinput: don't allow empty packages
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
X-List-Received-Date: Thu, 21 Apr 2011 10:36:16 -0000

Now that it is a soft dependency for xinput-calibrator only generate packages for machines with actual calibration data

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../xinput-calibrator/pointercal-xinput_0.0.bb     |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb b/meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
index 10360f7..993a75d 100644
--- a/meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
+++ b/meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
@@ -4,7 +4,8 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384
 
 SECTION = "base"
 
-PR = "r2"
+PR = "r3"
+
 SRC_URI = "file://pointercal.xinput"
 S = "${WORKDIR}"
 
@@ -16,6 +17,5 @@ do_install() {
 	fi
 }
 
-ALLOW_EMPTY_${PN} = "1"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 CONFFILES_${PN} = "${sysconfdir}/pointercal.xinput"
-- 
1.6.6.1



