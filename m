Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C277F588FD
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 15:49:28 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22607.1776700167557935195
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2026 08:49:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jMWn1HfC;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4891f625344so11213745e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 08:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776700166; x=1777304966; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LdcgccPlyb5I5k82Zt2TFGONqMxwfCgUIsGg62AurgY=;
        b=jMWn1HfCFplotHyhZuphZnNOHl6/qjAjdr80kdEcj4RKVmQFQHN/4e00E4ySD1Fq59
         ph/Zh/UgdDrxmQo85JSy+bKKpLY5LbVf+6Z8jAE4GgKTF/xDYm3DphIFzkAdNAA+YIFR
         h8mvHcAbNHuDJVoRvZtHiMUj7SNaGVtMuxuH2q6gO0zf7HcQLciTJ1nCidA6aTJ5F6B4
         Zwv+s/jdMCsgnVKbnUWTsO4b93THjptrhMX+ppKLbWWV+WHRVleL1LRuWYDrwiLkN8sV
         SxBMuyFQVO2Jai04JefOQAgpTPmQoouUvQ9/HkqftRBuUJjywlpmgRv20pcgFp0LKDiZ
         d/tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776700166; x=1777304966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LdcgccPlyb5I5k82Zt2TFGONqMxwfCgUIsGg62AurgY=;
        b=h1h4EHyFDEUN+vW2yP6RGRO2jfaLxN95uZejl+FaGsd/TMQ/8rwJJCPuMWWuIp1yxp
         jnwdMdPN81Ocz9DVlNYIl0RBlTeFsS7Dn/T18qgwBUHtW8Ka7aAX9aVIp52oJ1gLSwgF
         KnfvcsL16LCg8CQZePf55uwK8ce9i1iTdFiw3E83sIvhw3CMWTnHl2ZOafF5n7wDRD4d
         drXHDutUFbFtb0zWKVok+F1H61s3YOhv3o1QcZb0bk33SQq1YTk8lPnOL0A3iisttObN
         E/xuO+buBuBXflblQsdMRkbdsA4RXOoIbi8j5g6MLtXgAopZZ0kBMduJuHcPZO1EaVAz
         VumQ==
X-Gm-Message-State: AOJu0YyCDN91VvPwQfUshJsGB/c6n+4Ke29QXK6CBmSllRmULGaGTLB0
	vc6WZYeij8f/qrCjNF7+OK8qeQ2SoqXi1TeFkg3c3FdxSllQBLX+8qh6YGun+A==
X-Gm-Gg: AeBDiesfa9ZNq1vSR1hOZVYor0u3R3k9Ag6vabumHnszgq//lyqNU83sFT0aFaquP9M
	vT0AfjESw9/oXal3DmWy5KkUNIGSR0YyUGKWwJQTw+lTNQ0oKnf1cHDrf2x+LZBvF3xmwiwb6qt
	1+BaIc5jDqSDt3a4c8dwvz8Cq9J3dS0Z8S6g4hlQSUL09X4VjsZmfbzI2dJto2spk9D9UcSbuDv
	bO91JHTvrCBs66hU2jKfazL5RNiIS0ZwNpQXEKIXlnPBt1F+tfI+HeKD6Daq5z6Qps42cHeaJng
	OvSqzYjehP0toI46PodnNpjGJR4c7fwQAC3mZZqd+FWI1hISVVvXPuOwGFSu8hb/QL2nJP6yrQ8
	YdROi4e6z3i//ZDumlAMI2kSpHtV67S/HVDsfKMEN/PZcUMnjPe6XzAsgCmSZwpnUiQz5eD8rW5
	nAA27rA/AfJwMDNeRM/QbML8SN2QvItXU=
X-Received: by 2002:a05:600c:c167:b0:485:3428:774c with SMTP id 5b1f17b1804b1-488fb889336mr190319115e9.4.1776700165847;
        Mon, 20 Apr 2026 08:49:25 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm85279255e9.9.2026.04.20.08.49.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 08:49:25 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 12/12] ttf-vlgothic: fix SRC_URI
Date: Mon, 20 Apr 2026 17:49:15 +0200
Message-ID: <20260420154915.952359-12-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420154915.952359-1-skandigraun@gmail.com>
References: <20260420154915.952359-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 15:49:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126515

The old one stopped working.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20200720.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20200720.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20200720.bb
index 6b79eb9197..ec74eb267c 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20200720.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20200720.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.en;md5=cc06b20e7a20bdf6c989624405378303 \
                     file://LICENSE_E.mplus;md5=1c4767416f20215f1e61b970f2117db9 \
 "
 
-SRC_URI = "https://osdn.jp/dl/vlgothic/VLGothic-${PV}.tar.xz"
+SRC_URI = "https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/fonts-vlgothic/${PV}-1ubuntu1/fonts-vlgothic_${PV}.orig.tar.xz"
 
 SRC_URI[sha256sum] = "297a3813675fbea12c5813b55a78091c9a5946515ecbf9fde8b8102e01c579f4"
 

