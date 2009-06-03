Received: from [209.85.220.220] (helo=mail-fx0-f220.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1MBsfm-0000e6-Vz
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Jun 2009 17:46:39 +0200
Received: by mail-fx0-f220.google.com with SMTP id 20so73110fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jun 2009 08:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=cougck4NPPJs5WqOQPOZRgFNnJpV4woH5Hgs2Amg9X8=;
	b=RqZb9AYN+X1dQv/aD2kr2o1oFsSkp+9e27WgyY73AAvAfHyeNO+PgdWeJSKKyl8i4K
	RQjDD3le5irvT3b9ZdV/r5UIDRbbZ7oQH+qpe80NJ2Jg8eFVPIKhjw8UDoPMjfVQx//n
	ZXN3QI5mwEDELPR+UMshJ7BLdSQzImxEsUJ3U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Nf7HFuP+TvQJSS+dWSEKUi9vVmBbU1jiCfPtC2/DA6r7b694jDT2DhGL9/G+8MwX85
	HZ923F3Sos45dFUfbGH0rjCiLvrPoABjF2u7FMSKt1kEMGZ1ozHyWN2iQRhzgwanMXiM
	+LB4xw83PFjCjyXTb1wN5ahX9kdICSf1lZfvA=
Received: by 10.103.172.9 with SMTP id z9mr709417muo.58.1244043461957;
	Wed, 03 Jun 2009 08:37:41 -0700 (PDT)
Received: from localhost (cpmsq.epam.com [217.21.56.2])
	by mx.google.com with ESMTPS id 23sm452458mun.46.2009.06.03.08.37.41
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 03 Jun 2009 08:37:41 -0700 (PDT)
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Jun 2009 18:37:12 +0300
Message-Id: <1244043442-3868-3-git-send-email-ihar.hrachyshka@gmail.com>
X-Mailer: git-send-email 1.6.3.1
In-Reply-To: <1244043442-3868-2-git-send-email-ihar.hrachyshka@gmail.com>
References: <20090603151754.GI26065@smtp.west.cox.net>
	<1244043442-3868-1-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-2-git-send-email-ihar.hrachyshka@gmail.com>
Subject: [PATCH 02/12] qt4-embedded: added directfb plugin
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
X-List-Received-Date: Wed, 03 Jun 2009 15:46:39 -0000

Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
---
 recipes/qt4/qt4-embedded.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/qt4/qt4-embedded.inc b/recipes/qt4/qt4-embedded.inc
index bae52ab..3d986b2 100644
--- a/recipes/qt4/qt4-embedded.inc
+++ b/recipes/qt4/qt4-embedded.inc
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "GPL QPL"
 PRIORITY = "optional"
 HOMEPAGE = "http://www.trolltech.com"
-DEPENDS += "tslib"
+DEPENDS += "directfb tslib"
 INC_PR = "r11"
 
 SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-embedded-linux-opensource-src-${PV}.tar.bz2 \
@@ -23,7 +23,7 @@ S = "${WORKDIR}/qt-embedded-linux-opensource-src-${PV}"
 QT_CONFIG_FLAGS += " \
     -qtlibinfix E \
     -qt-decoration-styled -plugin-decoration-default -plugin-decoration-windows \
-    -plugin-gfx-transformed -plugin-gfx-qvfb -plugin-gfx-vnc \
+    -plugin-gfx-transformed -plugin-gfx-qvfb -plugin-gfx-vnc -plugin-gfx-directfb \
     -plugin-mouse-tslib -qt-mouse-pc -qt-mouse-qvfb \
     -qt-kbd-tty -qt-kbd-usb -qt-kbd-qvfb \
     -DQT_KEYPAD_NAVIGATION \
-- 
1.6.3.1



