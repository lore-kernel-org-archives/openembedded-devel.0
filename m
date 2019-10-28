Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 707BB7FA44
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 18:54:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4723mm0WC1z4Q
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 19:54:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572288888;
	bh=o7+fLRB9W23uR4GM4pfYoRsXx7dPLz9W0pMOqF4oxEw=;
	h=From:To:Subject:Date:From;
	b=ckXS7jv8hQCeS6JBCZq/DkcGTgQjtij6O3j5JwGA8WbYCHZ4K1hr7ZBqHb34P0yef
	iSXqew5usPq2/A95EkZHgDAf0brgQISvuHB25Z2Paf2M0ratmGshIP9IJEfoA/kJOM
	G2vPIAZiSMV8Aqylea+wFlHLnGXlVxQPYok9qQg6XOFfHkrcolZaZQcH+mp7PeEp4B
	wbyCZSVpxHiEufoVSnXPwzF+8w7xW+olOqVcEvM+Gd65PH5wJuwDN4pfaC30gT5PAk
	N4ygtb/rDRs4F2GTXRpMYF386wOgxzrHeBF2y77jKr70DyiT2Zg0OWbhbObYvnupVU
	7fs9pa04ipluCdvjXlxOWfKxQJvaSf5macQVQZEVmt6YAXrJXOuZLGOBbA9vbO7XJo
	6cG4v52C/0yw6SDA2WdzGeIKNo1awcFU+fItLIQQDrXlcGOJbo/13Y3B1J299VM1nx
	1poo5xI2hiu56J8ICspuRqGj1aMXgBNJYXlJw1XJplFZCxD0cV6yxsGjUpCHIGKucc
	6jOBN/lk3fvWjJK+gq+7/jTWTx/OS8GHWP90PJ0TZLARb6vFH9i2zrWfgNipGBG4gr
	F9i8LdgynFvhuOB7Hic1aIv/ymlqG5u5G8pVyhJHQCJJstcrDrlBEp8yE9xcXANDMz
	St1QEay06aquPyUkGNfnvE+4=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Oct 2019 20:54:44 +0200
Message-Id: <20191028185447.3553-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-multimedia][PATCH] gerbera: Upgrade 1.3.0 -> 1.3.2
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
X-List-Received-Date: Mon, 28 Oct 2019 18:54:49 -0000

Use the upstream systemd service file.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../gerbera/files/gerbera.service                   | 13 -------------
 .../recipes-multimedia/gerbera/gerbera_git.bb       |  8 ++------
 2 files changed, 2 insertions(+), 19 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/gerbera/files/gerbera.service

diff --git a/meta-multimedia/recipes-multimedia/gerbera/files/gerbera.service b/meta-multimedia/recipes-multimedia/gerbera/files/gerbera.service
deleted file mode 100644
index 1b5a3ad3e..000000000
--- a/meta-multimedia/recipes-multimedia/gerbera/files/gerbera.service
+++ /dev/null
@@ -1,13 +0,0 @@
-[Unit]
-Description=Start Gerbera, an UPnP media server
-After=multi-user.target network-online.target
-Wants=network-online.target
-
-[Service]
-ExecStart=/usr/bin/gerbera
-Environment='HOME=/root'
-Type=simple
-RemainAfterExit=yes
-
-[Install]
-WantedBy=multi-user.target
\ No newline at end of file
diff --git a/meta-multimedia/recipes-multimedia/gerbera/gerbera_git.bb b/meta-multimedia/recipes-multimedia/gerbera/gerbera_git.bb
index 9c78da0d2..c96e4c52e 100644
--- a/meta-multimedia/recipes-multimedia/gerbera/gerbera_git.bb
+++ b/meta-multimedia/recipes-multimedia/gerbera/gerbera_git.bb
@@ -4,12 +4,10 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=25cdec9afe3f1f26212ead6bd2f7fac8"
 
 SRC_URI = "git://github.com/v00d00/gerbera.git;protocol=https \
-    file://gerbera.service \
 "
 
-PV = "1.3.0+git${SRCPV}"
-# v1.3.0
-SRCREV = "c7a81fb41e446ee67b3eac90e2caecd6de651a16"
+PV = "1.3.2"
+SRCREV = "42b035ea9098c02af503d6391a0ed56d973aaf23"
 
 S = "${WORKDIR}/git"
 
@@ -26,8 +24,6 @@ EXTRA_OECMAKE = "-DWITH_JS=FALSE -DWITH_MAGIC=FALSE -DWITH_EXIF=FALSE -DLIBUUID_
 
 do_install_append() {
     install -d ${D}/root/.config/
-    install -d ${D}${systemd_system_unitdir}
-    install -m 0644 ${WORKDIR}/gerbera.service ${D}${systemd_system_unitdir}/
 }
 
 FILES_${PN} += "/root/.config/"
-- 
2.17.1


