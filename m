Received: from mail-ea0-f173.google.com ([209.85.215.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UR0o5-0007Yg-5O
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Apr 2013 15:48:52 +0200
Received: by mail-ea0-f173.google.com with SMTP id k11so1563281eaj.18
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Apr 2013 06:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=zoCOlCSipoiFm/kykRtZcVf/7/4yRTzUV+21PxPbt+Y=;
	b=U8s1r4lMPkSDAjgrU3TMkzVTSk9+mxUdjYdVXYOwzIR9AsGlLLTVKUFGfvoM1/FE5O
	+ginqTLc45p+0jshjmY8tFg5Hiedg117LE5Q6ZpRSA05fVmdmnJsVWcA+tOdphxmbtUF
	4g6EwOX8gPs+yQww6HvlVFWHiA6jPV6YTQvAurxMbkkHe8RLD+pF5jaEa76c6oxpsKXe
	avd7gmDEGwHes9BOl0rG5xyZFG1z/LW9SkkK6AgWJFpv/bupIz5QX3+XlOghcqxkmA1f
	Utf9AvEa8W0jMaskYHiAG9SzSTBucr0dTMwraAPPIBwvMPOrXBahF+G4e9g3vJtQJkSn
	JLGw==
X-Received: by 10.15.43.73 with SMTP id w49mr39859143eev.12.1365859827390;
	Sat, 13 Apr 2013 06:30:27 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id j44sm6913851eeu.10.2013.04.13.06.30.26
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 13 Apr 2013 06:30:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Apr 2013 15:29:45 +0200
Message-Id: <1365859790-20947-28-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
References: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-systemd][PATCH 28/33] pcsc-lite: move systemd support from meta-systemd back to meta-oe
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
X-List-Received-Date: Sat, 13 Apr 2013 13:49:24 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bb             | 9 ++++++++-
 .../meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bbappend   | 8 --------
 2 files changed, 8 insertions(+), 9 deletions(-)
 delete mode 100644 meta-systemd/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bbappend

diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bb b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bb
index bc51f72..04ec03c 100644
--- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bb
+++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bb
@@ -8,7 +8,9 @@ SRC_URI = "https://alioth.debian.org/frs/download.php/3757/pcsc-lite-${PV}.tar.b
 SRC_URI[md5sum] = "3e4b777231d35ce35c15c0704f936eaa"
 SRC_URI[sha256sum] = "1e44049168d1ce55fd56c175f61206955254df0f385455f2a20ec7e8a0e6a77a"
 
-inherit autotools
+PR = "r3"
+
+inherit autotools systemd
 
 EXTRA_OECONF = " \
 	--disable-libusb \
@@ -23,3 +25,8 @@ PACKAGES =+ "${PN}-lib"
 RRECOMMENDS_${PN} = "ccid"
 
 FILES_${PN}-lib = "${libdir}/lib*${SOLIBS}"
+
+RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
+SYSTEMD_SERVICE_${PN} = "pcscd.socket"
diff --git a/meta-systemd/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bbappend b/meta-systemd/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bbappend
deleted file mode 100644
index f877801..0000000
--- a/meta-systemd/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bbappend
+++ /dev/null
@@ -1,8 +0,0 @@
-inherit systemd
-
-PRINC := "${@int(PRINC) + 2}"
-
-RPROVIDES_${PN} += "${PN}-systemd"
-RREPLACES_${PN} += "${PN}-systemd"
-RCONFLICTS_${PN} += "${PN}-systemd"
-SYSTEMD_SERVICE_${PN} = "pcscd.socket"
-- 
1.8.1.5



