Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 716647FA45
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 18:54:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4723mm3HSmz7x
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 19:54:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572288888;
	bh=b7CFM6Jd0NEMZI1X5IYeHAYzkfsfoYsy7eXkPEDX7+s=;
	h=From:To:Subject:Date:From;
	b=fAMUguUYRZeKKxThXhiF2fIEZmwXBRy+1g9KtHR8CcMle3EKbEc/ffDHTqu6nj9L1
	h3CJI0Nu5fyrLkFUWLIrYTVbRpx2hGdUmE7ypNhhgeegX9gIRaZSgZxmeaRubkWlaL
	iXqjY6P7u5cCbwBeLV8uI81bCUFLaLHjNk7XXwQ9al/vWml0Y78+EjR8EtESNu9UnD
	RRwnpW5FVmVhv7IAnWccDa6NQdzEQPdih1mkxuO5lN+AmZv9oBF+D7XJMQwUox82So
	igcnbmqwVP4MN3fko9GqiDhSCWEpp2fR78lnTt3pYbZjqnt+HnzGtPZqxQJ2IkfZ2L
	61PIA0LefusytbCpXjDEcBO2v9AdzshnjDwOyEdgQ8ri3erMzoimOaVXmnQYbog6gJ
	Mqm7Gt94HPNdTw1iD0zbTxvbRp2LqEKSKqumQxHgoCl5ZdV0DxdNFvH458ynWL3Jof
	+lcv6keSipUpmc67eYwcckzoFsfi1VVpG0gI2FpXvJiCtXE9yJ8/lumfyG/FG4CMVA
	Yvp/M+GLAh4GjctqLecy+yp4WPpjdAFKOop3p3otcc6LwBdh60Zpsag0+gb+jS6U/9
	zQSPiWjboIIsJvvCOWaUvyKnhhE+Lcssye/tIgEUGUU3lFPLxpIZM/JkTRGGQjvoRE
	+fSHRZADMcR5nnDYjc6dQXs8=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Oct 2019 20:54:45 +0200
Message-Id: <20191028185447.3553-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-multimedia][PATCH] gstd: Fix the version number
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

This is Gstd 0.6.3 for GStreamer 1.x.

Also merge the inc into the recipe.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../recipes-multimedia/gstreamer-1.0/gstd_1.0.bb            | 3 ---
 .../gstreamer-1.0/{gstd.inc => gstd_git.bb}                 | 6 +++++-
 2 files changed, 5 insertions(+), 4 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_1.0.bb
 rename meta-multimedia/recipes-multimedia/gstreamer-1.0/{gstd.inc => gstd_git.bb} (82%)

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_1.0.bb b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_1.0.bb
deleted file mode 100644
index 94f6b575b..000000000
--- a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_1.0.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require gstd.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd.inc b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb
similarity index 82%
rename from meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd.inc
rename to meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb
index 455d89684..828caa883 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd.inc
+++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb
@@ -1,8 +1,9 @@
-DESCRIPTION = "Gstreamer Daemon 1.0"
+DESCRIPTION = "Gstreamer Daemon"
 SUMMARY = "GStreamer framework for controlling audio and video streaming using TCP connection messages"
 HOMEPAGE = "https://developer.ridgerun.com/wiki/index.php?title=Gstd-1.0"
 SECTION = "multimedia"
 LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad gstreamer1.0-rtsp-server json-glib libdaemon"
 
@@ -14,6 +15,9 @@ SRC_URI = "git://git@github.com/RidgeRun/gstd-1.x.git;protocol=https;branch=${SR
            "
 S = "${WORKDIR}/git"
 
+# Remove the +really when upstream version is > 1.0
+PV = "1.0+really0.6.3"
+
 inherit autotools pkgconfig gettext gtk-doc
 
 do_configure_prepend() {
-- 
2.17.1


