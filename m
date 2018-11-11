Return-Path: <freebendy@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id A94C16C238
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Nov 2018 01:18:35 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id p4-v6so2610925plo.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Nov 2018 17:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=7OScAdwaoV+ZDgKbGSkuf3cLJGTpgvgr8GdKck0lVvo=;
	b=YPx76kKvzov+Q5Lc3QuLf/sZO0V7CEhTPQ78PKxdihTX7VsiPK1bOBhMvB+L/PMdpD
	TdPmUu7XRgyEFPtOwC9mRLW0+AaeQ9kuUn8py4/5tRGeLFKjMuPjp9SQjsp7lgHKL2uQ
	8qE0USRtBWLh1+H44Nd936WRGU2/Uynw7veFZ5napa3tI7mhVbMcgHRsZ8MHM9LoOcVQ
	KxNJKP5bZZ4aPFRHIoWypRGiNQA2nZ3RVimbXSjpPph9fKqO181yDRQSudn4l/7GGdq3
	X6+97I6vznfs+3FCa+pPzCx47Ku4ubrr4kyl7T7X9MIdYk9j0m5U+OQmbg/X3/Drwd1z
	RybQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7OScAdwaoV+ZDgKbGSkuf3cLJGTpgvgr8GdKck0lVvo=;
	b=LnsMnfzaZSm+83THIuwu/Enb43ym9VjVx/d+7OQyaLrqrInKctKhqI37izqsN2hFSI
	xv6tgFJF84t6FKLQSPA8t5OmenJFZhiAgM5C6gMzfSwyZjvQLYtqd8wszbdwuqvHDGL3
	86GhFL3OCJMsWqUlOP0h9PLcXisV9vKDASEWEBqGWdJ6UwaoVfRvWkRRyMsuQbqZ7BMe
	5ZmimU4MLWWKxP7wOXrDWqWPxwopZakjJBQSbPPoXkPRMymtS98lEZMDSJNRUzmyNrKM
	bpWLCOjNbF2z7kuozUlLACTF5qB6/2cFV2SkpnsmG017/DcG5PaJAKGcmzk9yyFWutUt
	TDjw==
X-Gm-Message-State: AGRZ1gLELMkdgs52WwLLpFrGI67VFe0/ADrn5b4EZGZGy4YcUcXUbSh9
	iHP1tiX9z0wgPpWFOuvKnBWggbW0Gw==
X-Google-Smtp-Source: AJdET5dLzpGeNMRLVip4KGf7XHqmgDxNvLXsRKjQlF548xrp1CsUQE6McpYDj9MKtFLlKirw3trrMA==
X-Received: by 2002:a17:902:2943:: with SMTP id
	g61-v6mr14799054plb.82.1541899116488; 
	Sat, 10 Nov 2018 17:18:36 -0800 (PST)
Received: from localhost.localdomain ([116.7.217.236])
	by smtp.gmail.com with ESMTPSA id
	w2-v6sm12548668pfw.26.2018.11.10.17.18.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 10 Nov 2018 17:18:35 -0800 (PST)
From: Binghua Guan <freebendy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 Nov 2018 01:18:19 +0000
Message-Id: <20181111011819.22894-1-freebendy@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe] [PATCH] imagemagick: add PACKAGECONFIG[rsvg]
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
X-List-Received-Date: Sun, 11 Nov 2018 01:18:35 -0000

Signed-off-by: Binghua Guan <freebendy@gmail.com>
---
 meta-oe/recipes-support/imagemagick/imagemagick_7.0.7.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.7.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.7.bb
index 669534eaa..46cc78ed7 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.7.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.7.bb
@@ -3,7 +3,7 @@ SECTION = "console/utils"
 LICENSE = "ImageMagick"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dad5a98f173fd3fa6958a1a58c6131c1"
 # FIXME: There are many more checked libraries. All should be added or explicitly disabled to get consistent results.
-DEPENDS = "lcms bzip2 jpeg libpng librsvg tiff zlib fftw freetype"
+DEPENDS = "lcms bzip2 jpeg libpng tiff zlib fftw freetype"
 
 BASE_PV := "${PV}"
 PV .= "_7"
@@ -25,6 +25,7 @@ PACKAGECONFIG[jp2] = "--with-jp2,,jasper"
 PACKAGECONFIG[lzma] = "--with-lzma,--without-lzma,xz"
 PACKAGECONFIG[openjpeg] = "--with-openjp2,--without-openjp2,openjpeg"
 PACKAGECONFIG[pango] = "--with-pango,--without-pango,pango cairo"
+PACKAGECONFIG[rsvg] = "--with-rsvg,--without-rsvg,librsvg"
 PACKAGECONFIG[webp] = "--with-webp,--without-webp,libwebp"
 PACKAGECONFIG[wmf] = "--with-wmf,--without-wmf,libwmf"
 PACKAGECONFIG[x11] = "--with-x,--without-x,virtual/libx11 libxext libxt"
-- 
2.17.1


