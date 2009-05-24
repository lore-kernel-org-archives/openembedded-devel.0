Received: from [209.85.220.172] (helo=mail-fx0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1M8JIB-0003Vs-C3
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 May 2009 21:23:31 +0200
Received: by mail-fx0-f172.google.com with SMTP id 20so2730357fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 May 2009 12:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=F9IhDdxglvkbZFMem6YykJLtLC4MSYXhWmmPKD5KEL4=;
	b=MvAb8boxJK3U6ZXrDBN2+yzAKpXjhR3HEzU1YeO9brpkFBzQSARNbuEsGSKsAT8dHQ
	wl2754YtoqDSJ/pMRhl5f0NxVzcO6gWFMLxyXLSOyoB48+4l68qJewSPcx3QlmpXdseg
	0uNpRaAlQWIK02/Q9D8Vk3m5JXfNnisZPqJ7U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=NIaRQrQ4KGYdD5gQlDTfg4ObYoQ59+c5jZM0Y2ddhE0otbPf1mH64lnX98ogFHnpUb
	ubb33QHlEST4a1atSWMoEpEZe0v18colDtD7Fj0InhAu074NK0TSeFIY4nGEtlyOF481
	uYJFcpF3CvHRFJEue/3kKuel620kidQvDNGV4=
Received: by 10.103.240.15 with SMTP id s15mr3202542mur.93.1243192536742;
	Sun, 24 May 2009 12:15:36 -0700 (PDT)
Received: from localhost ([80.249.91.57])
	by mx.google.com with ESMTPS id y2sm7573328mug.43.2009.05.24.12.15.35
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 24 May 2009 12:15:36 -0700 (PDT)
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 May 2009 22:15:26 +0300
Message-Id: <1243192526-31196-2-git-send-email-ihar.hrachyshka@gmail.com>
X-Mailer: git-send-email 1.6.3.1
In-Reply-To: <1243192526-31196-1-git-send-email-ihar.hrachyshka@gmail.com>
References: <1243192526-31196-1-git-send-email-ihar.hrachyshka@gmail.com>
Subject: [PATCH 2/2] qt4-embedded: added directfb gfx driver support.
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
X-List-Received-Date: Sun, 24 May 2009 19:23:31 -0000

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
index 994372c..e156575 100644
--- a/recipes/qt4/qt4-embedded_4.4.3.bb
+++ b/recipes/qt4/qt4-embedded_4.4.3.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "GPL QPL"
 PRIORITY = "optional"
 HOMEPAGE = "http://www.trolltech.com"
-PR = "r11"
+PR = "${INC_PR}.r1"
 
 SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-embedded-linux-opensource-src-${PV}.tar.bz2 \
            file://0001-cross-compile.patch;patch=1 \
diff --git a/recipes/qt4/qt4-embedded_4.5.1.bb b/recipes/qt4/qt4-embedded_4.5.1.bb
index 5073ad1..9463a58 100644
--- a/recipes/qt4/qt4-embedded_4.5.1.bb
+++ b/recipes/qt4/qt4-embedded_4.5.1.bb
@@ -3,6 +3,7 @@ SECTION = "libs"
 LICENSE = "GPL LGPL QPL"
 PRIORITY = "optional"
 HOMEPAGE = "http://www.trolltech.com"
+PR = "${INC_PR}.r1"
 
 SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-embedded-linux-opensource-src-${PV}.tar.bz2 \
            file://0001-cross-compile.patch;patch=1 \
-- 
1.6.3.1



