Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TzUbj-0005to-S0
	for openembedded-devel@lists.openembedded.org;
	Sun, 27 Jan 2013 16:57:24 +0100
Received: by mail-ee0-f47.google.com with SMTP id e52so914273eek.20
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Jan 2013 07:41:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=trnUaT1gN58pDLc/0bCYkGneu3nnUcj8y1NQAMmyhps=;
	b=kJ4VjDgMpLR/ZuIpqohG3gJ9Hx+eZgqm7gkYChyXj6twGkgnBLfK8NavrT3eCzHQLo
	aRdpR1u3FdMZeP1tvSfuhiot0a92+d0+YoP2hCjtCXsappv5IcDrMmpf4dIYsazlJqBk
	uRpOTvJO/sJO1TJnOrJunKSLEDVGywXR4b4m08t0PUkSmzDutt65UA1aSaMKtWBeB/0p
	9TY6JCzt+c3TT99mAms3ly+h6k/jXbYpLITlPCYgneqc228Uh1fsm9VY4twViUHj9c9p
	PDYtAHJkYfgWp1PFV61EB9jU6S64xOqi9xzbhycE4S9sAYZebBKV+HW8LF1hlmUqNWll
	qjCQ==
X-Received: by 10.14.194.199 with SMTP id m47mr42138658een.11.1359301306790;
	Sun, 27 Jan 2013 07:41:46 -0800 (PST)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id q5sm11876147eeo.17.2013.01.27.07.41.45
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 27 Jan 2013 07:41:46 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 27 Jan 2013 16:41:20 +0100
Message-Id: <1359301282-5470-5-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1
In-Reply-To: <1359301282-5470-1-git-send-email-koen@dominion.thruhere.net>
References: <1359301282-5470-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQl1MTykFocob8Cinx8Fzov3HHVX0O4DFsVa0oT+ofIVBB4Yw4xKnzuqq01wRQtzsNS/3H94
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH 5/7] libav: enable x264 encoder support
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
X-List-Received-Date: Sun, 27 Jan 2013 15:57:37 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-multimedia/libav/libav.inc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-multimedia/libav/libav.inc b/meta-oe/recipes-multimedia/libav/libav.inc
index e85ae29..388a567 100644
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
 
@@ -42,6 +42,7 @@ EXTRA_OECONF = " \
         --enable-x11grab \
         --enable-libtheora  \
         --enable-libvorbis \
+        --enable-libx264 \
         --arch=${TARGET_ARCH} \
         --target-os="linux" \
         --enable-cross-compile \
-- 
1.8.1



