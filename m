Return-Path: <ticotimo@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 51000601A2
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 May 2014 15:59:55 +0000 (UTC)
Received: by mail-pd0-f175.google.com with SMTP id x10so1212778pdj.20
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 May 2014 08:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=+8XyUvgg1fUatuIWTjkYzWnTCZOTDi8nMDoz8LPMwvw=;
	b=T5xG4F/1qKJKM8smpSzpAoZBjIOcLbWjiSb2+phWM6QnX9SuG5VFkEtnP6HfpUVmOP
	QqvIiYbC6Y9A2bspJep+YIxNjbRMiBIsnC8hp0w3X8QoPy/dIO4/p7Ijis0SoUHjXH1o
	c27yD2P0CgNL51SRUDt7KnfS07Db6/EgOQX4V36NJhrjAUzGWNngysk8nIzaAD8pmI2B
	H+dYXwPBlkQFNcb2/YezcyGHLqXUs8gOUz8w2+990e31PvI65NTPIgdWK3TzJnzUIXCV
	21SHOPyaVNpQ4O7yKuVoiGMNofAHcx37rIpodMlD870s7zzQ8lmBLEX+4utRAp2ASah/
	ow0A==
X-Received: by 10.66.190.4 with SMTP id gm4mr20365084pac.116.1399478396540;
	Wed, 07 May 2014 08:59:56 -0700 (PDT)
Received: from gentoo.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150])
	by mx.google.com with ESMTPSA id nf5sm3894546pbc.77.2014.05.07.08.59.54
	for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Wed, 07 May 2014 08:59:55 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 May 2014 09:00:18 -0700
Message-Id: <1399478418-22180-1-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-multimedia][WIP] fluidsynth: upgrade to 1.1.6
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
X-List-Received-Date: Wed, 07 May 2014 15:59:59 -0000

From: Tim Orling <TicoTimo@gmail.com>

  * now hosted at sourceforge
  * drop unrecognized option for readline

  NOTE: autotools is deprecated
  TODO: investigate cmake build

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 .../fluidsynth/{fluidsynth_1.1.1.bb => fluidsynth_1.1.6.bb}   | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)
 rename meta-multimedia/recipes-multimedia/fluidsynth/{fluidsynth_1.1.1.bb => fluidsynth_1.1.6.bb} (60%)

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.1.bb b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.6.bb
similarity index 60%
rename from meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.1.bb
rename to meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.6.bb
index c497d98..f928ed0 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.1.bb
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.6.bb
@@ -2,19 +2,18 @@ SUMMARY = "Fluidsynth is a software synthesizer"
 HOMEPAGE = "http://www.fluidsynth.org/"
 SECTION = "libs/multimedia"
 LICENSE = "LGPL-2.0+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=dda26baa823649da9a68947707650272"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e198e9aac94943d0ec29a7dae8c29416"
 
 DEPENDS = "alsa-lib ncurses glib-2.0"
 
-SRC_URI = "http://savannah.nongnu.org/download/fluid/${P}.tar.gz"
-SRC_URI[md5sum] = "0db3da78028d255026230809c6e21b44"
-SRC_URI[sha256sum] = "55638cb04f39f4df76c081e22ca7feeea58ddd20ebf779a7db2d38b1ff374cd6"
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/${PN}/${PN}-${PV}/${PN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "ae5aca6de824b4173667cbd3a310b263"
+SRC_URI[sha256sum] = "50853391d9ebeda9b4db787efb23f98b1e26b7296dd2bb5d0d96b5bccee2171c"
 
-inherit autotools pkgconfig lib_package
+inherit autotools pkgconfig lib_package gettext
 
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)}"
 PACKAGECONFIG[sndfile] = "--enable-libsndfile-support,--disable-libsndfile-support,libsndfile1"
 PACKAGECONFIG[jack] = "--enable-jack-support,--disable-jack-support,jack"
 PACKAGECONFIG[pulseaudio] = "--enable-pulse-support,--disable-pulse-support,pulseaudio"
 PACKAGECONFIG[portaudio] = "--enable-portaudio-support,--disable-portaudio-support,portaudio"
-PACKAGECONFIG[readline] = "--with-readline,--without-readline-support,readline"
-- 
1.8.3.2


