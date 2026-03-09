Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EFF6EF371E
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 08:48:43 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9632.1773046121176005132
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Mar 2026 01:48:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UWLi8zkI;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-439b9cf8cb5so6991641f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 01:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773046119; x=1773650919; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=JQ35G0rS7Z+V/qk7q8OoNYaBk5f31Omkx0eL3VlDbc8=;
        b=UWLi8zkITlHI17BBh5ifQYy9uIvwNk404ClLeLhyOF8Q+c0eLQOoSYC5zUQZSc5s+s
         ZgGoKj+wMHMglp87GU2mjqZSZM+HIOeKctKz/TKkC1QW8hXZUlnfR4xznoE/P3k/hwL5
         dQ9oLURXxTo+jVjF26ag9wWs2ctUZI0Y4rz50j9jhZECQEsBarkMhvBnvoqDFX1K3w1P
         F/ZTxLwx3XDBg3x+sqJ/oqpa7wn8L+Ci+syQIJ9uJt0JYk5Jpk7nOn4WIkGlhPB122fu
         xj1xvi2QhUMIw+l7bLFCPjhH2p5puvi73mkQa7pQBHqPGJ9jh0tzZ0cTL4C8Ovb8YYdO
         2+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773046119; x=1773650919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JQ35G0rS7Z+V/qk7q8OoNYaBk5f31Omkx0eL3VlDbc8=;
        b=b78rbJh1vvJdC80XCEYZZhQpqzmV0joJnCJqoClQkxjIu4T7iefcUQH4cRvlDo2TlB
         BQruttRGT0s+dq2kmcKsTNhkmtZlmGBJwVFzgJmmn73Nk3BqtJVnJqf/5LohGORbK+NN
         qgNQR0QusEl/QSjMmlCB5GsnsnSZLoYYe2vrLFKxB47LrHFm/2d+wdFtfHU9+kztVcHX
         hCIudg7JoZ2l5QUNOftFOBVifOSDHpQsBHMGPvx2noeqje8eRfLUquM4I8/9RbrCtAlu
         0npUIUc5L1YTt+6u6As0h+YudGjQA6mg5pGgDs+XNF3R9unhuSwNwYe45JGrUPUc3cNB
         ztXg==
X-Gm-Message-State: AOJu0Yy8k8A3ApOdfUK43jJkVakame6FDT8CcUnxYPFoJ9odcuHHSBaJ
	FTiXE2488qgqcJqsVwwU8Vy29IC/2am57Q42lVR61naMtR0jiPTwFeeXAAOYmA==
X-Gm-Gg: ATEYQzxj9WB80k7mQIW6jugtlb4N+gW+jEj4GezbcYqNRaknwIc+yf/qSlwUgrFi9+x
	ZG76B93KWkEqh/TAxrh47WawJbMcrtfp3MXMak3KOR8o/A91wgx8bGZMf6f9Re++az8UKPG0REs
	lAfXFwduJNTTeIQzlX1ITAgfT+piT7FzTsv4o+lUXEBNODaSNa+j9ty1p55dYYGeCbfWqU91Nze
	ie3eYM+wNUeABIvE0/Z2xZBgD7pPT/dBE7MNxPqnRjOnxVnm9u4l32nauZqeCcvrtKLUqm13px3
	sUdOj9W0+crJfu532686Il2LNauPTQMn0pUv/wQXaA6lg/B0wxyCyjNnCTLK4g09n12m0DdvevH
	27Zk+h41dCrS8ZHhy+d+NeU6I9LNApb2VAoC8fs1fKSO5XqwO1YJLJ3tLshemdBIoptoPjd78Zi
	W5yf2XSxUYgcVjplNa6oYaTaKw1FEAQ7A=
X-Received: by 2002:a5d:5c89:0:b0:439:bddb:cc77 with SMTP id ffacd0b85a97d-439da880da1mr17230238f8f.37.1773046118995;
        Mon, 09 Mar 2026 01:48:38 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8d95dsm26850386f8f.7.2026.03.09.01.48.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 01:48:38 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 1/2] libheif: upgrade 1.20.2 -> 1.21.2
Date: Mon,  9 Mar 2026 09:48:36 +0100
Message-ID: <20260309084837.185189-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 08:48:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124959

Changelog:

1.21.2:
- build script for JS/WASM now supports building with JPEG2000
  and "ISO23001-17 Uncompressed" support.
- image sequence SAI data now works when using the OpenH264 decoder plugin

1.21.1:
- This patch release only fixes a build error with some GCC versions
  because of a missing #include.

1.21.0:
- CVE-2025-68431 fixed
- This release adds full support for reading and writing HEIF image sequences.
- libheif will now encode HEIF image sequences with all included codecs.
- Since HEIF image sequences are very similar to MP4 videos, this new version
  is also capable of decoding most MP4 videos (without audio, of course).
- Support for image sequences with alpha channels. For most codecs, the alpha
  channel will be stored in a separate, auxiliary, monochrome track. For
  ISO/IEC 23001-17 (uncompressed) streams, the alpha channel is stored in
  the main video track.
- Support for sequence track edit lists to define the number of sequence
  repetitions (without actually repeating the video data).
- New encoder plugin using x264 to write H.264-compressed video streams and images.
- The FFmpeg decoder plugin will now decode both H.265 and H.264.
- Support for HEIF text items and language properties

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../libheif/{libheif_1.20.2.bb => libheif_1.21.2.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-multimedia/libheif/{libheif_1.20.2.bb => libheif_1.21.2.bb} (94%)

diff --git a/meta-multimedia/recipes-multimedia/libheif/libheif_1.20.2.bb b/meta-multimedia/recipes-multimedia/libheif/libheif_1.21.2.bb
similarity index 94%
rename from meta-multimedia/recipes-multimedia/libheif/libheif_1.20.2.bb
rename to meta-multimedia/recipes-multimedia/libheif/libheif_1.21.2.bb
index b268b37d8e..7ccac771dc 100644
--- a/meta-multimedia/recipes-multimedia/libheif/libheif_1.20.2.bb
+++ b/meta-multimedia/recipes-multimedia/libheif/libheif_1.21.2.bb
@@ -6,9 +6,9 @@ LICENSE_FLAGS = "commercial"
 
 COMPATIBLE_MACHINE:powerpc64le = "null"
 
-SRC_URI = "git://github.com/strukturag/libheif.git;protocol=https;branch=v1.20.x-releases"
+SRC_URI = "git://github.com/strukturag/libheif.git;protocol=https;branch=master;tag=v${PV}"
 
-SRCREV = "35dad50a9145332a7bfdf1ff6aef6801fb613d68"
+SRCREV = "62f1b8c76ed4d8305071fdacbe74ef9717bacac5"
 
 inherit cmake pkgconfig
 

