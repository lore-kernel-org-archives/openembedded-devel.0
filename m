Received: from mail-ea0-f170.google.com ([209.85.215.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TwtNK-00078O-G9
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Jan 2013 12:47:55 +0100
Received: by mail-ea0-f170.google.com with SMTP id a11so2120162eaa.29
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jan 2013 03:32:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=trnUaT1gN58pDLc/0bCYkGneu3nnUcj8y1NQAMmyhps=;
	b=hitpxWuQtG62hhDxS/oLwqQx0Hm2YXhuXzTIJkxOoR14O7meHxwvsvm30WkMZVCjCO
	uiheZ5Yc2zUPpQYHyfQHzZDXSVWcPCU9NwOEMI0eKZJLAtGlhnHt2WJJpgGL9SDxK0L8
	cozPEolNX1tWqrABiNFjscQKFMEVrsM+n7KvhCZk0E3DeIjclGIsJ6M6sBI24hlN/w3d
	53NxaJC7YcmCXNWtxNE3WzCVbMReZqRMC3f4kdJlz7EEi0NLT1mCXI4obiz4aNl7htKv
	I1sbQA+Z4tPMnEZDLQYNgD4iBEicBG6VNA1OHcrX1RFPiY+5CRcsJPh3ay7Tnt/KTxb5
	Z/0Q==
X-Received: by 10.14.202.3 with SMTP id c3mr48360322eeo.4.1358681539520;
	Sun, 20 Jan 2013 03:32:19 -0800 (PST)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id k4sm16888656eep.15.2013.01.20.03.32.16
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 20 Jan 2013 03:32:18 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 Jan 2013 12:32:04 +0100
Message-Id: <1358681528-19761-3-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1
In-Reply-To: <1358681528-19761-1-git-send-email-koen@dominion.thruhere.net>
References: <1358681528-19761-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQmyhkPTG5gjJ3+wsuux5DkUYDvlQM9/QOPuK6OuXea990GHDdk9F1d+X7Er6oHbxM8AGykO
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][meta-multimedia][PATCH v2 3/7] libav: enable x264 encoder support
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
X-List-Received-Date: Sun, 20 Jan 2013 11:47:57 -0000

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



