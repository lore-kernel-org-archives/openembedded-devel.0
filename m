Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PKlLk-0006hq-5r
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Nov 2010 06:23:28 +0100
Received: by pxi17 with SMTP id 17so1819630pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Nov 2010 21:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=MuuvAIevBWlJ1lieDwGpkqDFhQ8l3tzOu5w++dWHNrE=;
	b=jGpAWBGOFsSyGOdeJJcp5h9+4+YN+bNMU5gtyX9gWxHVpSFpn90B8LOrLOxzTk1pXF
	yJFIhWb3IgCGmu2p2KzQR3hx1xyU98rS3y1nNEPaYZsmNh2ETbDPPqHkWUYQ/bJkOEG2
	Otyu0Um8oo3P/2dR/BRyZFK/otj0eMvbL5qo0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=nT2zLwJR5M/H7bBnT39X3TYaxzMAXqoOzdv7J6G647pZqKdfBrVOkP3jSp7uPkTKAj
	0g5Kf7CtaYYtzksDHIVmPPxKV3Y6m16xCkr/B7Lb2zGkUK3BHW+s4adrEzTtU7ke7XTz
	lj89DBSLG3oxWoXE/5aR/+yBpJr1uBIPpbYIs=
Received: by 10.142.98.3 with SMTP id v3mr5986044wfb.191.1290489735011;
	Mon, 22 Nov 2010 21:22:15 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id f5sm4053863wfg.14.2010.11.22.21.22.13
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 22 Nov 2010 21:22:14 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Nov 2010 21:21:25 -0800
Message-Id: <1290489685-22499-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=AWL,BAYES_00,LONGWORDS,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] xserver-kdrive-common.inc: Add $PACKAGES to PROVIDES
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
X-List-Received-Date: Tue, 23 Nov 2010 05:23:28 -0000

Fixes the issue where opkg complains about missing
Unknown package 'xserver-kdrive-fbdev'.
| Collected errors:
| * opkg_install_cmd: Cannot install package  xserver-kdrive-fbdev.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/xorg-xserver/xserver-kdrive-common.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/xorg-xserver/xserver-kdrive-common.inc b/recipes/xorg-xserver/xserver-kdrive-common.inc
index 6272a3a..7ee22b1 100644
--- a/recipes/xorg-xserver/xserver-kdrive-common.inc
+++ b/recipes/xorg-xserver/xserver-kdrive-common.inc
@@ -1,11 +1,12 @@
 LICENSE = "MIT"
 DEPENDS = "compositeproto damageproto fixesproto recordproto resourceproto scrnsaverproto xineramaproto videoproto xextproto xproto \
 	libxau libxext libxdmcp libxfont libxrandr tslib virtual/libx11 xtrans xextproto-70-includes"
-INC_PR = "r28"
+INC_PR = "r29"
 
 PKGN ?= "xserver-kdrive"
 
 PROVIDES = "virtual/xserver"
+PROVIDES += "${PACKAGES}"
 PACKAGES =+ "${PKGN}-fbdev \
              ${PKGN}-sdl \
              ${PKGN}-fake \
-- 
1.7.0.4



