Received: from mail-ea0-f171.google.com ([209.85.215.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TmMjs-00029R-FB
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Dec 2012 11:55:34 +0100
Received: by mail-ea0-f171.google.com with SMTP id n10so2299805eaa.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Dec 2012 02:40:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=NmdLe32zqjNi393l3ybLjIU0hSUVdK/AF0bmg1rUhuM=;
	b=QJubx4Pk1HzZhiM8TwRUS426tiA+ObjI9JxmfiWAYUCkdGlTFyZsppyPoAKD5TIgg1
	I//XG+OjXxavi4D22C/i+dU/Yp80A1dCnozdfyU+8wKKXj1geixwl81/PGqMZ0W3LXc2
	Z48ztBYf/X/3QdSiZfF15UmummiXXbJuEqzL7rzdycrWZYOKD3nHei/ti75DONO1MZPs
	/N8sBwKVGGTSIVOIjDAtCLUkx/msUkgn7C8OJvNtyumoPP9Gvb874zUWXoKxDqLaP+/T
	WOmh8rtIdDIA/RcLVIs67ypBlCnd/Z1ZoHUbyui/7z6c0AzW0HsvRsSBcUEc1bhG2+4k
	ggog==
X-Received: by 10.14.205.198 with SMTP id j46mr39848183eeo.27.1356172845597;
	Sat, 22 Dec 2012 02:40:45 -0800 (PST)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id f49sm27396371eep.12.2012.12.22.02.40.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 22 Dec 2012 02:40:44 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 22 Dec 2012 11:40:26 +0100
Message-Id: <1356172826-24392-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1356172826-24392-1-git-send-email-koen@dominion.thruhere.net>
References: <1356172826-24392-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQm1qK4rNZNmRmbrNZXGyWsCF0VHX6A926UfqDyc5yC46uVoekxmdpCuAYphPvK7jTNtem2t
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][meta-multimedia][PATCH 2/2] libav: enable x264 encoder support
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
X-List-Received-Date: Sat, 22 Dec 2012 10:55:34 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-multimedia/libav/libav.inc |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-multimedia/libav/libav.inc b/meta-oe/recipes-multimedia/libav/libav.inc
index 32fcd61..d5a767e 100644
--- a/meta-oe/recipes-multimedia/libav/libav.inc
+++ b/meta-oe/recipes-multimedia/libav/libav.inc
@@ -9,9 +9,9 @@ PROVIDES = "ffmpeg"
 ARM_INSTRUCTION_SET = "arm"
 
 # faac faad2 lame schroedinger libgsm
-DEPENDS = "virtual/libsdl zlib libogg libvorbis libvpx libtheora ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'liba52', d)}"
+DEPENDS = "x264 virtual/libsdl zlib libogg libvorbis libvpx libtheora ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'liba52', d)}"
 
-INC_PR = "r6"
+INC_PR = "r7"
 
 inherit autotools pkgconfig
 
@@ -43,6 +43,7 @@ EXTRA_OECONF = " \
         --enable-x11grab \
         --enable-libtheora  \
         --enable-libvorbis \
+        --enable-libx264 \
         --arch=${TARGET_ARCH} \
         --target-os="linux" \
         --enable-cross-compile \
-- 
1.7.7.6



