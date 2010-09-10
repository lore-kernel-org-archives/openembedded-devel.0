Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1Ou6cT-0007sZ-Al
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Sep 2010 18:38:37 +0200
Received: by gya6 with SMTP id 6so1334107gya.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Sep 2010 09:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=bpVeXQ0JdL+kOJDhM49He9Df5fNaGVhcm/1jnzixfPk=;
	b=Bjulk5jfG0+85jm3fxH5VtAV0p8z/ObmUGIngJLpknjL2jL8nXoHh2x3mTb5rY0pnF
	c4Js71x4CrYIAYB+J0OfikOASH2DvjSfYQIl/YunbkJQRTsS36RCNVILp4pClsj4mi5O
	WzkMgg4A6hjo75JQblwctlVJq1VePE8+xi/TY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=u3GEnZER/jCMLNZXV/yFOPh64CxmVU37C7A/c205A23cEQxmz7r+cbS2zpWfrAoEv4
	cXDkCNBjPLg8zmqPUlcPgiQulgWnyZx7tF0hPvXa0GePDoUx1hOcfvmy5OxqZleljAX2
	BPMc+k1ENsYYx6P1HvLpYaW67g5GgWNGQ9gpg=
Received: by 10.151.8.1 with SMTP id l1mr1179320ybi.167.1284136665853;
	Fri, 10 Sep 2010 09:37:45 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id v6sm9042209ybm.11.2010.09.10.09.37.43
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 10 Sep 2010 09:37:44 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Sep 2010 11:27:24 -0500
Message-Id: <1284136044-7651-1-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] qte: only export touchscreen setting if ts exists
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
X-List-Received-Date: Fri, 10 Sep 2010 16:38:38 -0000

* Changed the qte.sh script to check for whether or not the
  touchscreen exists before exporting QWS_MOUSE_PROTO to use
  the touchscreen.  This is so that devices that don't have
  a touchscreen can use the regular mouse support.
* Bumped the PR

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
 recipes/qt4/files/qte.sh     |    8 +++++---
 recipes/qt4/qt4-embedded.inc |    2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/recipes/qt4/files/qte.sh b/recipes/qt4/files/qte.sh
index ddea77d..21d6ecb 100644
--- a/recipes/qt4/files/qte.sh
+++ b/recipes/qt4/files/qte.sh
@@ -1,5 +1,7 @@
 #!/bin/sh
 
-QWS_MOUSE_PROTO=Tslib:/dev/input/touchscreen0
-
-export QWS_MOUSE_PROTO
+if [ -e /dev/input/touchscreen0 ]
+then
+    QWS_MOUSE_PROTO=Tslib:/dev/input/touchscreen0
+    export QWS_MOUSE_PROTO
+fi
diff --git a/recipes/qt4/qt4-embedded.inc b/recipes/qt4/qt4-embedded.inc
index 61cd3bf..d756a29 100644
--- a/recipes/qt4/qt4-embedded.inc
+++ b/recipes/qt4/qt4-embedded.inc
@@ -4,7 +4,7 @@ LICENSE = "GPL QPL"
 PRIORITY = "optional"
 HOMEPAGE = "http://www.trolltech.com"
 DEPENDS += "directfb tslib"
-INC_PR = "r21"
+INC_PR = "r22"
 
 QT_BASE_NAME ?= "qt4-embedded"
 QT_BASE_LIB  ?= "libqt-embedded"
-- 
1.7.0.4



