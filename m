Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id D41867DDA2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 May 2019 14:46:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 459ThH2x4Rz4J
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 May 2019 16:46:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1558709167;
	bh=9VrKOWonnwU89Bto3Qmnbh2aTHbHdfP09mZMvuf4cPs=;
	h=From:To:Subject:Date:From;
	b=R/NWJvUm1DqWyNtPSJh3YynTXc+JbjSc0zUB3EQMjVfwzD5LaMxAepiJdLX+w+Jwz
	HCJ2IGBJOLs8gq6SiOJtHrs8ABZhhIqg6G1FVlt+uKjvhlR/1Ok8xo3cLBHiVzjKj/
	adMR3nwjgHv4uF+U4l8VIdokVu3m66v5e8hen2DavbG1VBNzl1fa4CUbmzSjVgRFJL
	pMYGYXRcyXRr95GWS8cIF91C10xWku9a1m0bjVCTTdV10T8xmwk6aWecpdSGTGADwK
	5j+0pqOa0st1RG9qFjAkSARMVu+mbgEkcu49MCQMfpufi6cp62Pt8slQxrLQp4lNes
	PYdbuhaKJUxa4Lv6BOPmlr6KPiM5DLygeJA9+W8ijopvCLUZkyx5pdCidjkOP/sjcL
	HnfEniDNJEMRprr37p+V6jwLpGTybxpGhL9hQjRCDehesS7XUhyrTsHagfUMHrZRXU
	fSA8UNC7VuOgEWjmpmcTKuvVInMgOQvbY6tijiUP9wqccpA/6Bl/8idDVtzu/Q4LJ4
	xd1Q3fIibnzYIVI5ZgN/ay2K8phiF/rh+u8VZkBFhkQsq9JxFZl8303Eyd/ZL3yzZE
	/aU7vWyS90lJwnlGkqjvDu6Wl68Ng+pbkchfU0/jN1bb2kREy9g86t/f1SrDpkw0JJ
	Y7SIfnX2fBEPWLi1ZMU/PKQs=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 May 2019 17:46:06 +0300
Message-Id: <20190524144606.27416-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] gpsd: Switch PACKAGECONFIG[qt] from Qt4 to Qt5
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
X-List-Received-Date: Fri, 24 May 2019 14:46:07 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.17.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.17.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.17.bb
index e823e42a5..131e84961 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.17.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.17.bb
@@ -28,7 +28,7 @@ export STAGING_LIBDIR
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)}"
 PACKAGECONFIG[bluez] = "bluez='true',bluez='false',${BLUEZ}"
-PACKAGECONFIG[qt] = "qt='yes',qt='no',qt4-x11-free"
+PACKAGECONFIG[qt] = "qt='yes' qt_versioned=5,qt='no',qtbase"
 EXTRA_OESCONS = " \
     sysroot=${STAGING_DIR_TARGET} \
     libQgpsmm='false' \
-- 
2.17.1


