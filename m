Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QCrF9-0001kH-Pz
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Apr 2011 12:36:15 +0200
Received: by wye20 with SMTP id 20so1494976wye.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Apr 2011 03:33:52 -0700 (PDT)
Received: by 10.217.6.202 with SMTP id y52mr1942495wes.42.1303382031844;
	Thu, 21 Apr 2011 03:33:51 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id r80sm883724wei.39.2011.04.21.03.33.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Apr 2011 03:33:51 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Apr 2011 12:33:21 +0200
Message-Id: <1303382002-23874-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <1303382002-23874-1-git-send-email-koen@dominion.thruhere.net>
References: <1303382002-23874-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe 2/3] xinput-calibrator: make pointercal-xinput a soft dependency
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
X-List-Received-Date: Thu, 21 Apr 2011 10:36:15 -0000

pointercal-xinput is machine specific and empty for most machines, so it it's only a soft dependency.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../xinput-calibrator/xinput-calibrator.inc        |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator.inc b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator.inc
index 357b0e5..691a45c 100644
--- a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator.inc
+++ b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator.inc
@@ -2,7 +2,11 @@ DESCRIPTION = "A generic touchscreen calibration program for X.Org"
 HOMEPAGE = "http://www.freedesktop.org/wiki/Software/xinput_calibrator"
 LICENSE = "MIT/X11"
 DEPENDS = "virtual/libx11 libxi"
-RDEPENDS_${PN} = "xinput pointercal-xinput"
-INC_PR = "r7"
+
+INC_PR = "r8"
 
 inherit autotools
+
+RDEPENDS_${PN} = "xinput"
+RRECOMMENDS_${PN} = "pointercal-xinput"
+
-- 
1.6.6.1



