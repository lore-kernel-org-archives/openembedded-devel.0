Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 42A8F780C3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jul 2017 05:40:28 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id q85so9706343pfq.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jul 2017 22:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NCrCkRlbGSuZhaXxnlTeY2A34DMCi6dTtMyiUzd1tn8=;
	b=udLyYJLHlCsIf2g+rYDOaywvXDV0GvO9oaSMB6MiNsB2lDSJFh2VLvFPPGZ3EmDDsR
	QneVb+8IkvYq/3kQJKmvqXF2n+CKa3TZmrQCOmLfUF3gU8vAMvc/hhtYX5E96VUWjMqg
	Exj+GmN9m7d5Ud4cmfgV1/q0FkAyBGf1Cpsntp/HNxcypVhVIlHXC4WdEGtI4CIiTc10
	iPVNDCGSyrYjdPZNLlabyWY8bOG0BGbl6VubdF/WFUtHL2z7uT0En6nM69mw4r7ebDzQ
	Gzdr4JT3Afk6KLgqbzj+F9ed1/2xLFQY9qHd1Vf0RYtEddTaDGfACDtftnk/27bEw61h
	rCFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=NCrCkRlbGSuZhaXxnlTeY2A34DMCi6dTtMyiUzd1tn8=;
	b=Z/92FUiNU8NIgjfgFR837ZZjzHbsLYpFqiBvRc1x5s6PN5uahcLOzxvyffZk5NJf+j
	6/S4fDVkOVU7cqdpcz5JE11T2IiMtx/NDTTVAEBIFSfYF4zEoYm0yuW253R+ipuMpLIc
	uOEGrn3gCXeq3SdO2gX9HdiIhgoEBZJkzktlclxFoYKh5/xpX3OY6B1yc5SXiUXlIJXD
	HznR27Rc7A4UqHuMcCZyiJNYw//kGTqFwf0Pn/cE6qgJ2rBrDBjiaiHOED5Q39MeR1lR
	bfwSpcRvB8ACfoDxkdfCuhm9dyZcZmCqgwQv2s4dRWbseSH4QrgbhMFBRpIEhH6dvXSS
	CR2Q==
X-Gm-Message-State: AIVw113fmpK4geJxhICkxKjzNyUkDuJjyDdr0/9L2ppFiyZnySwWtUF3
	0JfObVEP8uQLS+uD
X-Received: by 10.84.217.134 with SMTP id p6mr14253368pli.196.1500010830057;
	Thu, 13 Jul 2017 22:40:30 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id
	z86sm17519420pfl.40.2017.07.13.22.40.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Jul 2017 22:40:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Jul 2017 22:39:59 -0700
Message-Id: <20170714054013.34458-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170714054013.34458-1-raj.khem@gmail.com>
References: <20170714054013.34458-1-raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 04/18] webrtc-audio-processing: Link with libexecinfo on musl
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
X-List-Received-Date: Fri, 14 Jul 2017 05:40:29 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../webrtc-audio-processing/webrtc-audio-processing_0.3.bb             | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing_0.3.bb b/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing_0.3.bb
index eb9a30466..2b0f7c684 100644
--- a/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing_0.3.bb
+++ b/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing_0.3.bb
@@ -2,6 +2,8 @@ DESCRIPTION = "Audio processing bits of the WebRTC reference implementation"
 HOMEPAGE = "https://www.freedesktop.org/software/pulseaudio/webrtc-audio-processing/"
 SECTION = "audio"
 
+DEPENDS_append_libc-musl = " libexecinfo"
+
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=da08a38a32a340c5d91e13ee86a118f2 \
                     file://webrtc/common.h;beginline=1;endline=9;md5=41f7322d91deabaf0acbbd0b8d0bc548 \
@@ -22,4 +24,5 @@ SRC_URI = "http://freedesktop.org/software/pulseaudio/webrtc-audio-processing/${
 SRC_URI[md5sum] = "336ae032f608e65808ac577cde0ab72c"
 SRC_URI[sha256sum] = "756e291d4f557d88cd50c4fe3b8454ec238362d22cedb3e6173240d90f0a80fa"
 
+LDFLAGS_append_libc-musl = " -lexecinfo"
 inherit autotools
-- 
2.13.2


