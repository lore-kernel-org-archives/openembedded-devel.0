Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id EF1F877EA5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 16:43:43 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id g2so18480276pge.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 09:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=lq7ysmnLtqWoFzrnsj2Giwv2EAJ4oHSygfrPgbpfwx4=;
	b=c4xuCHD8N1jD6kNRyu0Hbu/7ip4tJxDPCMZz6BuEYnWN+ARKoaD8Y3HN7BjlQLF5zQ
	fAQXliQnJOmjN+Fs5k+LknG30rIMIMcTVfvy8+Zjj+i1LiqrAPCI248bPpN6sTQnpNNk
	E2bFHzw4O1hSO16RFHntMgr3hn/TNk7V1rXKRF/CvDDa8aTjT5MZU2eOTNNLPmLcAphe
	dUXYqlRYHGQdhYFRBZoDvIKalLRfuGS36YqpmHNjR0raApaYD8EgPiWGMnaRtd+PeC1I
	33zgTpIyDBnmQVWRgPq2P7ksuKdq86b0Q/LgJUqLtMGlNakjbqCD43wBYi522WM4li8E
	wbqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=lq7ysmnLtqWoFzrnsj2Giwv2EAJ4oHSygfrPgbpfwx4=;
	b=JzfgPA02q1XAHGXWJDDuS321xXD52rjDfA79Lq0JV7PHxOvp3S2E1sx6NAipVT86Hf
	OXNKmRxNBaaXIaInQjQEuQUD0YXMrccyLCIwDo4+WVtXyyBsvRRO7ypDqO545HWjou6b
	aEn02jW8j6chiEcPmzgdhFCmOyMGXXjbzO4aqatDy46N51xpydDSYlKdnmNDE31SBmHD
	QYXavnvXzMCy20c6lpKOm3KuCowsaafVbgoW8RgWrlPGiOcLbDOqL3Pc3IngggF2rEL1
	A61B+BsdEu6MRX7cT7SkpzEgtzXfrTjyO4fPwIODgDD6CkQ5qgFKzRkCsDYUBUrAZjtk
	+D3g==
X-Gm-Message-State: AFeK/H3V4CCj2qh8IpTrXUarrgUW3Ts8R5VbkgI4iXkfQ+o9RT1irOTk8zmINkPs/G/4Cw==
X-Received: by 10.98.160.19 with SMTP id r19mr3726620pfe.16.1490978625191;
	Fri, 31 Mar 2017 09:43:45 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm11569706pfh.124.2017.03.31.09.43.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 09:43:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Mar 2017 09:42:38 -0700
Message-Id: <20170331164247.5052-34-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.1
In-Reply-To: <20170331164247.5052-1-raj.khem@gmail.com>
References: <20170331164247.5052-1-raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 34/43] libavc1394: Add libargp on musl
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
X-List-Received-Date: Fri, 31 Mar 2017 16:43:44 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-multimedia/libavc1394/libavc1394_0.5.4.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/libavc1394/libavc1394_0.5.4.bb b/meta-multimedia/recipes-multimedia/libavc1394/libavc1394_0.5.4.bb
index 97e2bf1b4..f5b0d48c4 100644
--- a/meta-multimedia/recipes-multimedia/libavc1394/libavc1394_0.5.4.bb
+++ b/meta-multimedia/recipes-multimedia/libavc1394/libavc1394_0.5.4.bb
@@ -4,6 +4,7 @@ HOMEPAGE = "http://sourceforge.net/projects/libavc1394/"
 SECTION = "libs/multimedia"
 
 DEPENDS = "libraw1394"
+DEPENDS_append_libc-musl = " argp-standalone"
 
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=dcf3c825659e82539645da41a7908589"
@@ -13,3 +14,5 @@ SRC_URI[md5sum] = "caf0db059d8b8d35d6f08e6c0e1c7dfe"
 SRC_URI[sha256sum] = "7cb1ff09506ae911ca9860bef4af08c2403f3e131f6c913a2cbd6ddca4215b53"
 
 inherit autotools pkgconfig
+
+LDFLAGS_append_libc-musl = " -largp"
-- 
2.12.1


