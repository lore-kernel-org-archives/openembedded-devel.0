Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 66C026E752
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Mar 2014 00:53:04 +0000 (UTC)
Received: by mail-pd0-f178.google.com with SMTP id x10so4906636pdj.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Mar 2014 17:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=vg22Rxp1QGMdOuEZsohNoxeUHjDumbR7ajr8QT+klVY=;
	b=VTv0sVEHa9mRZjpRbNFmpIPZ6HysEGmEqkhWPtXyIpSSAFxsk6e6q2q+7Nfimh3WJz
	vlKQfEcXus2/zcYfhVOpndfY3hCRfYB0gyfwOHzUAVpqRUyW4yMWxag+SzvaBGT1NIk1
	GaK0Ts76m6HSizoOlXSx4LbP1XYnDTPeOocPq0KVBVuk99IBB/C/fLdukz6kyYp6NNpB
	eRLY0/2CFhWDr26olrqj2qaPbHQFVY1dHLhuhtvpEwGdOV7c2QradsoyLMEXXKJpTZyw
	0gQy8bTle7bNWa2MBHhyPpLJnR6JM7cYUAINxxUPDqRCGfTtJERo07FJWK48WsdClwfx
	Ts4w==
X-Received: by 10.68.196.226 with SMTP id ip2mr22172209pbc.106.1395017585459; 
	Sun, 16 Mar 2014 17:53:05 -0700 (PDT)
Received: from archimedes.arnolds.bogus
	(dsl-66-59-252-223.static.linkline.com. [66.59.252.223])
	by mx.google.com with ESMTPSA id gj9sm37984795pbc.7.2014.03.16.17.53.03
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 16 Mar 2014 17:53:04 -0700 (PDT)
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Mar 2014 17:52:47 -0700
Message-Id: <1395017567-19580-1-git-send-email-stephen.arnold42@gmail.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [meta-multimedia][PATCH v3 1/1] musicpd/mpd: bump to current upstream stable
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Mar 2014 00:53:05 -0000

From: "Stephen Arnold" <stephen.arnold42@gmail.com>

Bump music player daemon to the latest upstream stable release.
Same as previous 0.18.4 recipe with trivial updates.

Signed-off-by: Stephen Arnold <stephen.arnold42@gmail.com>

---
 .../musicpd/{mpd_0.18.4.bb => mpd_0.18.8.bb}                   | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)
 rename meta-multimedia/recipes-multimedia/musicpd/{mpd_0.18.4.bb => mpd_0.18.8.bb} (87%)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.4.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.8.bb
similarity index 87%
rename from meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.4.bb
rename to meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.8.bb
index 77ccc1f..b6882af 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.4.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.8.bb
@@ -1,19 +1,17 @@
 SUMMARY = "Music Player Daemon"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-HOMEPAGE ="http://sourceforge.net/projects/musicpd"
+HOMEPAGE ="http://www.musicpd.org"
 
 DEPENDS = "alsa-lib libsamplerate0 libsndfile1 libvorbis libogg faad2 ffmpeg curl sqlite bzip2 pulseaudio"
 
 SRC_URI = " \
-    http://www.musicpd.org/download/${PN}/stable/${PN}-0.18.tar.xz \
+    http://www.musicpd.org/download/${PN}/stable/${P}.tar.xz \
     file://mpd.conf.in \
 "
 
-SRC_URI[md5sum] = "0d881fb32f9d31afcdb0bb13cb78b9ab"
-SRC_URI[sha256sum] = "6b171985f192603150c879d105dc4d05d701ac60a2db41630a4dce823e068388"
-
-S = "${WORKDIR}/${PN}-0.18"
+SRC_URI[md5sum] = "7bbe1caf5abe404dc985ca4f44984b1f"
+SRC_URI[sha256sum] = "5366378e548fb77996cc33b0e15165ddd84f1e496bdd04616bd593aecdc26450"
 
 inherit autotools useradd systemd
 
-- 
1.8.5.3


