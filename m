Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1On3cU-00086F-Th
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Aug 2010 08:01:29 +0200
Received: by fxm6 with SMTP id 6so2589133fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Aug 2010 23:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=+cBTedCqDT3LEgUiZcyHi0lcXh7A2ehRBALOjIrg+ZY=;
	b=MuDrTKjd4d+DY/DZ2HLUYSNS5S3Pbyu0SvCQQHwIXbKCIBiOpd0Jd1lM1hNQJS8mjo
	ZXb+BP9AJod9BGFefqBWYwJh5HOCt9Ysl6Hpl1B009uHCVvZSRIfRNCP43nwXyOe06Y+
	0iwP/xnjsCsonS1Qmqvp9974jC1or6GDlTuNg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=BP4s/ekmgBl0inh2y4n0rknM+4rX7bIfNnldJUqRk4OFIlMGNy9F3DxzGwbwveLZ/L
	AE2SlXZMgeVaKdbdmgk5sP/oN1D6JBCw163MB/ar912hv1ED2aocQRDgIWZRA7y2EEqj
	7sVCI4R2Ttv/Kx3+8Srqbhj/nuJ+I12iUKMKk=
Received: by 10.223.110.212 with SMTP id o20mr2794523fap.27.1282456860684;
	Sat, 21 Aug 2010 23:01:00 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 2sm1895904faz.38.2010.08.21.23.00.59
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 21 Aug 2010 23:01:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 22 Aug 2010 08:01:03 +0200
Message-Id: <1282456863-18251-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.2
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] matchbox-panel-2-icon-themes: use same SRCREV as matchbox-panel-2
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
X-List-Received-Date: Sun, 22 Aug 2010 06:01:29 -0000

* battery/data was removed in 1919 http://svn.o-hand.com/view/matchbox/trunk/matchbox-panel-2/applets/battery/Makefile.am?rev=1919&view=auto
* prevent downgrade/upgrade cycle in matchbox-panel-2 checkout ending with (svn: Failed to add directory 'applets': an unversioned directory of the same name already exists)
---
 .../matchbox-panel-2-icon-themes_0.0.1.bb          |    7 ++-----
 1 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/recipes/matchbox2/matchbox-panel-2-icon-themes_0.0.1.bb b/recipes/matchbox2/matchbox-panel-2-icon-themes_0.0.1.bb
index bcd7706..257477f 100644
--- a/recipes/matchbox2/matchbox-panel-2-icon-themes_0.0.1.bb
+++ b/recipes/matchbox2/matchbox-panel-2-icon-themes_0.0.1.bb
@@ -5,14 +5,13 @@ DEPENDS = "imagemagick-native"
 RPROVIDES_${PN} = "matchbox-panel-2-icon-theme"
 PACKAGE_ARCH = "all"
 SRCREV_FORMAT = "startup"
-SRCREV = "1907"
+SRCREV = "2098"
 PV = "0.0.1+svnr${SRCPV}"
 PR = "r0"
 
 inherit gtk-icon-cache
 
-SRC_URI = "svn://svn.o-hand.com/repos/matchbox/trunk;module=matchbox-panel-2/applets/battery/data;proto=http;maxrev=1918 \
-	   svn://svn.o-hand.com/repos/matchbox/trunk;module=matchbox-panel-2/applets/startup/data;proto=http;name=startup \
+SRC_URI = "svn://svn.o-hand.com/repos/matchbox/trunk;module=matchbox-panel-2/applets/startup/data;proto=http;name=startup \
 	   svn://svn.o-hand.com/repos/matchbox/trunk;module=matchbox-panel-2/applets/brightness/data;proto=http \
 	   file://user-desktop.png \
 	   file://task-switcher.png \
@@ -21,8 +20,6 @@ S = "${WORKDIR}"
 
 do_install() {
 	cd ${S}
-	mkdir -p ${D}${datadir}/icons/HighContrast/48x48/status ${D}${datadir}/icons/HighContrastInverse/48x48/status
-	install -m 0644 matchbox-panel-2/applets/battery/data/*.png ${D}${datadir}/icons/HighContrastInverse/48x48/status/
 	mkdir -p ${D}${datadir}/icons/HighContrast/32x32/status ${D}${datadir}/icons/HighContrastInverse/32x32/status
 	install -m 0644 matchbox-panel-2/applets/brightness/data/*.png ${D}${datadir}/icons/HighContrastInverse/32x32/status/
 	mkdir -p ${D}${datadir}/icons/HighContrast/32x32/animations ${D}${datadir}/icons/HighContrastInverse/32x32/animations
-- 
1.7.2



