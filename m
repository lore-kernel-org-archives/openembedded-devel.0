Return-Path: <ticotimo@gmail.com>
Received: from mail-pa0-f50.google.com (unknown [209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id B30EF6FA3F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 May 2014 18:12:22 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id fb1so7941123pad.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 May 2014 11:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=YrW5RB0Dk4VLYChtHaFt2qHeTZRSb8/XVF9QeO2ytc8=;
	b=v/RC+EBKBuDcXo4V1aQjT6qluhcRMmNVyN2EgsmgjeSF4rF5HAs3Eknv39Jd2hEPww
	JWsDs8Ghy0xGDtVXG+eTf0LKQM44sBjhv0ti3gi9fjjbzNfBudSXLhvnPsnsGJY7jNHv
	HkmsF8c+EDvSgzyp7kzVCmb4uCqDmAHVNXP88Nm0Bnyr/D4AK9Z4HrLj4y0ZibCXPhFc
	qpsfpgIWCqwLaWYc51Swk9b3rX4HYYZ9bZ/BvZbz/iiBiG0iGkVKxtvLJL699PTKCFdi
	67D0uHzdkawlkak42s45ZeUl1tJ1KRk6YOF88L+JorlxAKl+S7zQvqaeyLGPoDlk75OP
	cRZw==
X-Received: by 10.66.161.69 with SMTP id xq5mr29756553pab.62.1401127943636;
	Mon, 26 May 2014 11:12:23 -0700 (PDT)
Received: from gentoo.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150]) by mx.google.com with ESMTPSA id
	bz4sm19372930pbb.12.2014.05.26.11.12.22 for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Mon, 26 May 2014 11:12:23 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 May 2014 11:15:03 -0700
Message-Id: <1401128103-26421-1-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-multimedia][PATCH] fluidsynth: fix S!=B errors
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
X-List-Received-Date: Mon, 26 May 2014 18:12:22 -0000

From: Tim Orling <TicoTimo@gmail.com>

Fixes:
: fatal error: fluidsynth/version.h: No such file or directory
|  #include "fluidsynth/version.h"

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.6.bb b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.6.bb
index 6358613..4052e42 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.6.bb
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.6.bb
@@ -10,7 +10,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/${PN}/${PN}-${PV}/${PN}-${PV}.tar.gz"
 SRC_URI[md5sum] = "ae5aca6de824b4173667cbd3a310b263"
 SRC_URI[sha256sum] = "50853391d9ebeda9b4db787efb23f98b1e26b7296dd2bb5d0d96b5bccee2171c"
 
-inherit autotools pkgconfig lib_package
+inherit autotools-brokensep pkgconfig lib_package
 
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)}"
 PACKAGECONFIG[sndfile] = "--enable-libsndfile-support,--disable-libsndfile-support,libsndfile1"
-- 
1.8.3.2


