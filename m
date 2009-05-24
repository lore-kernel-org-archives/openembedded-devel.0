Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1M8MuM-0003mF-Bx
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 May 2009 01:15:12 +0200
Received: by ewy20 with SMTP id 20so2913289ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 May 2009 16:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=Him+gtkjy1CE8wYyIH9TnMJ84RbcEHA3cEXuI+4HtPA=;
	b=Xbfj+8BtBq8weFQbpT5O6oLBSiB8OrH4O4wZ3aAHVkmmoYQezVECnTnQtZkrGyAa8M
	KgIbgyOcB6sau+p2xdCMIyYhNA4vDP6bT7579sCwGKtog1Xs3MR2wUuUWN9JX7SbzTq1
	Eerv5gyCKhT2/5cxuF4eN8kM2zKp/5TwEMgyw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=YEDudGViU8E5/6QZBZsfxF9w5vMSf+TyFgiG+IoszOEWaXM8I9L30anYgLgKoBCCWI
	Mi/HoDOPkwsJW6cycxTTPKgyy1m6H9khw7ui0NGwdmCupvCL3JrBbkbH49qGTbWIhQ74
	3wusaGkPaFAxnSVwjiV6XvkZpY3v8MRuiNgsA=
Received: by 10.210.115.17 with SMTP id n17mr3212945ebc.48.1243206431817;
	Sun, 24 May 2009 16:07:11 -0700 (PDT)
Received: from localhost ([80.249.91.57])
	by mx.google.com with ESMTPS id 5sm3047290eyh.40.2009.05.24.16.07.10
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 24 May 2009 16:07:11 -0700 (PDT)
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 May 2009 02:06:51 +0300
Message-Id: <1243206411-10004-1-git-send-email-ihar.hrachyshka@gmail.com>
X-Mailer: git-send-email 1.6.3.1
In-Reply-To: <be7a9f3d0905241522i10fa5ff7re486c07fdef1db92@mail.gmail.com>
References: <be7a9f3d0905241522i10fa5ff7re486c07fdef1db92@mail.gmail.com>
Subject: [PATCH 1/3] qt4-embedded: added directfb gfx driver support.
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
X-List-Received-Date: Sun, 24 May 2009 23:15:20 -0000

This fix adds qdirectfbscreen gfx driver to qt4-embedded.
Also moved recipes versioning to INC_PR.

Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
---
 recipes/qt4/qt4-embedded.inc      |    6 ++++--
 recipes/qt4/qt4-embedded_4.4.3.bb |    2 +-
 recipes/qt4/qt4-embedded_4.5.1.bb |    1 +
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/recipes/qt4/qt4-embedded.inc b/recipes/qt4/qt4-embedded.inc
index 0280dc4..c4112f7 100644
--- a/recipes/qt4/qt4-embedded.inc
+++ b/recipes/qt4/qt4-embedded.inc
@@ -1,11 +1,13 @@
-DEPENDS += "tslib"
+DEPENDS += "directfb tslib"
 
 S = "${WORKDIR}/qt-embedded-linux-opensource-src-${PV}"
 
+INC_PR = "r11"
+
 QT_CONFIG_FLAGS += " \
     -qtlibinfix E \
     -qt-decoration-styled -plugin-decoration-default -plugin-decoration-windows \
-    -plugin-gfx-transformed -plugin-gfx-qvfb -plugin-gfx-vnc \
+    -plugin-gfx-transformed -plugin-gfx-qvfb -plugin-gfx-vnc -plugin-gfx-directfb \
     -plugin-mouse-tslib -qt-mouse-pc -qt-mouse-qvfb \
     -qt-kbd-tty -qt-kbd-usb -qt-kbd-qvfb \
     -DQT_KEYPAD_NAVIGATION \
diff --git a/recipes/qt4/qt4-embedded_4.4.3.bb b/recipes/qt4/qt4-embedded_4.4.3.bb
index 994372c..209b006 100644
--- a/recipes/qt4/qt4-embedded_4.4.3.bb
+++ b/recipes/qt4/qt4-embedded_4.4.3.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "GPL QPL"
 PRIORITY = "optional"
 HOMEPAGE = "http://www.trolltech.com"
-PR = "r11"
+PR = "${INC_PR}.1"
 
 SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-embedded-linux-opensource-src-${PV}.tar.bz2 \
            file://0001-cross-compile.patch;patch=1 \
diff --git a/recipes/qt4/qt4-embedded_4.5.1.bb b/recipes/qt4/qt4-embedded_4.5.1.bb
index 5073ad1..c17ceac 100644
--- a/recipes/qt4/qt4-embedded_4.5.1.bb
+++ b/recipes/qt4/qt4-embedded_4.5.1.bb
@@ -3,6 +3,7 @@ SECTION = "libs"
 LICENSE = "GPL LGPL QPL"
 PRIORITY = "optional"
 HOMEPAGE = "http://www.trolltech.com"
+PR = "${INC_PR}.1"
 
 SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-embedded-linux-opensource-src-${PV}.tar.bz2 \
            file://0001-cross-compile.patch;patch=1 \
-- 
1.6.3.1



