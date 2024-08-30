Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD2DBCA0ED6
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 03:58:35 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.5221.1724990315249642593
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Aug 2024 20:58:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OGPbr3sR;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7cd76b56e59so507273a12.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Aug 2024 20:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724990314; x=1725595114; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ltfo++SsHzVDWsfuyG8gJE/XAZC5jlebbwD7Rro3XY=;
        b=OGPbr3sRpPrRswv7z977qDKANt5k1Z7fwQ11lqHGryMxcJrcPcmZL4SSXDzDnf/cN8
         TxVF6q5aASgtKKCbB+vMa65NzxjjNyIdl6maVsPp1FcwxBxEaurgHp2zTzTxPrnCkio6
         RuRm1JT+bmpzbP06vNk2vNIUwBJVvL6i7WXHg4gvLnMTiTRwwGxblyPMwLJJW8cPBDOs
         wpwMQN/DEI2kkuN3wixPzKtwVY0SxCBvYR3iRunwzElcJqIjmVnUNX+kYUqunDhyCnXZ
         UDRyIm7Rds8xyZ33ezhclzdMYQqo8hmgWu5+kRQEnrg2/Z6q/bSkKQUy+iDxUAPadUxK
         XCsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724990314; x=1725595114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ltfo++SsHzVDWsfuyG8gJE/XAZC5jlebbwD7Rro3XY=;
        b=hB5hLrVFanYEyKWfK7dDsAR3zU7Pi9tseCEKiZ5j7XIgq8pcg9svICzbq6v3UkHcCc
         YphBzR8rg3EaQFmeKWNUumrezJNwhbVdvLqOtPiRFwgL8tbP/F91sueKJwuZ5eLpUkuH
         1iIVrIonKf3qJOBybRZvBTvWmr1EfKZrlgspXI5mIaFR1uahPLndJsETbfjQMJuTOPSw
         dz5ksuF/TtdVdhcKPuHpmrHBJaSNMF33mRBOzcyKgcQXKg04nUV9eOQ1+BkNY/g1IXq9
         IbrN7cwp449Fma92SWoKGeEl84F2vhdhoKdpax9bLJp+TsUDuOlIS7VRDd0ZyHqN5P2L
         7vpA==
X-Gm-Message-State: AOJu0YxBFILWYfrlBT8lVUStOO3CqHA+PKAkIdKSez/ttMdsGUWe4nvO
	y7tflRV79Xk+MBFrbwpUU16rbQEbaKiA0tfrikS6YHS4pzXgX8had/PCvAN9
X-Google-Smtp-Source: AGHT+IEk0cOFJWPh43jKgsNl/syMwdNgo69yBgIS6OaARDtCpjj990Y4frapnbzG5UEg6PFfMbwPBw==
X-Received: by 2002:a05:6a20:e617:b0:1ca:da64:4f4b with SMTP id adf61e73a8af0-1cce0ff0f21mr5397399637.2.1724990314269;
        Thu, 29 Aug 2024 20:58:34 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:9d80:4380::2696])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2052919afb2sm2705035ad.3.2024.08.29.20.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 20:58:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/8] libplacebo: Add recipe
Date: Thu, 29 Aug 2024 20:58:23 -0700
Message-ID: <20240830035827.406391-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240830035827.406391-1-raj.khem@gmail.com>
References: <20240830035827.406391-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Aug 2024 03:58:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112043

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../mplayer/libplacebo_7.349.0.bb             | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/mplayer/libplacebo_7.349.0.bb

diff --git a/meta-oe/recipes-multimedia/mplayer/libplacebo_7.349.0.bb b/meta-oe/recipes-multimedia/mplayer/libplacebo_7.349.0.bb
new file mode 100644
index 0000000000..b68e67a8cb
--- /dev/null
+++ b/meta-oe/recipes-multimedia/mplayer/libplacebo_7.349.0.bb
@@ -0,0 +1,22 @@
+SUMMARY ="Reusable library for GPU-accelerated video/image rendering primitives"
+LICENSE = "Apache-2.0 & BSD-3-Clause & BSL-1.0 & MIT"
+LIC_FILES_CHKSUM = "file://3rdparty/Vulkan-Headers/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57 \
+                    file://3rdparty/fast_float/LICENSE-APACHE;md5=81db248e90379bcfc0582b578b009bc3 \
+                    file://3rdparty/fast_float/LICENSE-BOOST;md5=2c7a3fa82e66676005cd4ee2608fd7d2 \
+                    file://3rdparty/fast_float/LICENSE-MIT;md5=32b11d50c7d9788d4270f6a83f3e68eb \
+                    file://3rdparty/glad/LICENSE;md5=ae570f26774ac096cff8f992091a223c \
+                    file://3rdparty/jinja/LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462 \
+                    file://3rdparty/jinja/docs/license.rst;md5=5f4c795946979fabc2361be4c70d0a9f \
+                    file://3rdparty/markupsafe/LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75 \
+                    file://3rdparty/markupsafe/docs/license.rst;md5=5f4c795946979fabc2361be4c70d0a9f \
+                    file://LICENSE;md5=435ed639f84d4585d93824e7da3d85da \
+                    file://demos/3rdparty/nuklear/src/LICENSE;md5=6052431ae6cd4f0082276c54996e7770 \
+                    file://demos/LICENSE;md5=65d3616852dbf7b1a6d4b53b00626032"
+
+SRC_URI = "gitsm://github.com/haasn/libplacebo;protocol=https;branch=master"
+
+SRCREV = "1fd3c7bde7b943fe8985c893310b5269a09b46c5"
+
+inherit meson pkgconfig
+
+S = "${WORKDIR}/git"

