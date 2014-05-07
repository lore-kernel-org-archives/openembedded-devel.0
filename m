Return-Path: <ticotimo@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 0C1AD60167
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 May 2014 17:44:32 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id ld10so1473856pab.31
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 May 2014 10:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=YqyNTP9RK49CMBPR+PAaNeuaEuFMnZnI8L92kwqnEJo=;
	b=K+dV9Ol1SQSDy7j1W/tordcJr05RyZdVBaUwQbP89WvyC4dU8I7z3MzBN7Nygx+bgf
	BFLM2+LTaCabQxbCKPWhYMlfptL1ORaiq0ZbkJ9c1McMJDKwQfmRKb8rHMqrAsTir7Xf
	bSb5N79HKWfrsL4JCgEwzV/BySM96O1yIgnL63+ONwKoW1DhdqJ9PRqIecDcFygbUNuM
	hVS1q8Q4MCCwECSwa+GHE4KQGbTxBY++6VsNihc5NESHODl0HiDgJ/icRy8oe4GRHRF5
	ct9gRu3PHR5mUxJhQR2ayF0i/mQDmoI82m/TvqzvEbNVckanr/POHXOHZ9l2c4/h0FSj
	Tz9w==
X-Received: by 10.66.149.37 with SMTP id tx5mr21416433pab.81.1399484673528;
	Wed, 07 May 2014 10:44:33 -0700 (PDT)
Received: from gentoo.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150])
	by mx.google.com with ESMTPSA id nh8sm4296180pbc.25.2014.05.07.10.44.31
	for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Wed, 07 May 2014 10:44:32 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 May 2014 10:45:02 -0700
Message-Id: <1399484702-22433-1-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-multimedia][WIP][PATCH v2] fluidsynth: upgrade to 1.1.6
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
X-List-Received-Date: Wed, 07 May 2014 17:44:35 -0000

From: Tim Orling <TicoTimo@gmail.com>

  First version had no [PATCH] on subject line and non-helpful "inherit gettext"
  
  * now hosted at sourceforge
  * drop unrecognized option for readline

  NOTE: autotools is deprecated
  TODO: investigate cmake build

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 .../fluidsynth/{fluidsynth_1.1.1.bb => fluidsynth_1.1.6.bb}      | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)
 rename meta-multimedia/recipes-multimedia/fluidsynth/{fluidsynth_1.1.1.bb => fluidsynth_1.1.6.bb} (64%)

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.1.bb b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.6.bb
similarity index 64%
rename from meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.1.bb
rename to meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.6.bb
index c497d98..6358613 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.1.bb
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.6.bb
@@ -2,13 +2,13 @@ SUMMARY = "Fluidsynth is a software synthesizer"
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
 
 inherit autotools pkgconfig lib_package
 
@@ -17,4 +17,3 @@ PACKAGECONFIG[sndfile] = "--enable-libsndfile-support,--disable-libsndfile-suppo
 PACKAGECONFIG[jack] = "--enable-jack-support,--disable-jack-support,jack"
 PACKAGECONFIG[pulseaudio] = "--enable-pulse-support,--disable-pulse-support,pulseaudio"
 PACKAGECONFIG[portaudio] = "--enable-portaudio-support,--disable-portaudio-support,portaudio"
-PACKAGECONFIG[readline] = "--with-readline,--without-readline-support,readline"
-- 
1.8.3.2


