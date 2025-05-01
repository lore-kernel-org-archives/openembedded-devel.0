Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D07C4C369DC
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 20:47:32 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.4807.1746132449761702034
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 May 2025 13:47:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=IeVYo0lK;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso7336175e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 May 2025 13:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1746132448; x=1746737248; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RBWiDaOMOdscBKrpGSyQBBuKIFP6+rFFNexN/PTtmbc=;
        b=IeVYo0lKLAbaRxUAQspRs2Lv+L1/xpVd/N6VbwCZhxsSlVM8b/51JGsn1bFgjK0iDh
         dj4DOj8blIshuRzrxMx3Fsv+1e7ZQXLzvMrUnituApstaMeOy1ygStlFODwyWw4axSWY
         cw4x3xy3hX+ZrbbOklNXMOHbGS5KsQPu9vNfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746132448; x=1746737248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RBWiDaOMOdscBKrpGSyQBBuKIFP6+rFFNexN/PTtmbc=;
        b=B0iMKEyKBUQSon+8saRWTCW6hRLv3CBu1ey7+PcsVCSpxGmAEVZsqLxtHg8mFi8nzS
         l1+B5x3dM7ZwLOBOVfO91+Z2tyeSv72os3gklUqXjfb82vh4Z2Pb9Y1ycg8WVFiff3Tg
         Kpnla9pm5AzQ8WftEH7E6+rzfhN6nsHI2eTyNRI0QW4Gh6cZK3a99lMm/k4N3qousXyo
         MVx7zfQuNOa+UT2ZxO3RAdvkuwY45OpOeQROZ2cS0//KEQroxd7nN0W1B61OSYgYAbmn
         Ag+VY/vXfxkXBlQI9d8WQ7NgNaKbvXpXHZ/iaijR2552y+edAvYTyeJOpOQGirOJ9LP4
         76KQ==
X-Gm-Message-State: AOJu0YycGIwVR7myGZlnR1JPxL+aWXp3Nxqtoyfef5tdeoj1qdbD5KZY
	ubK6/7xRhYSqgS4U7URMU79X+W2AjALstrZnrYz6zLNnFDyl8QbnkPS79PLPVh9Uv25F7FtukAQ
	C
X-Gm-Gg: ASbGncsjOuLpHBFXncDF7cuf+W+YvBY4+8RjWNKqg/RbK9TE557YxSN6QvUqgoGgy6r
	hhk8seMQf0XBBf94nzi625jijSqoQxVx99VrOrtvkLFKz2hQPURwbV8uJdOVDnyVe20ZJLkdP/C
	Qhe3g21r+94jZ0gTMyMOgXrA6nvayDMDcUpY8encCXSciId8fJ/7Xonmj9UfE1ZM9RQ1HGc8Bsf
	ezpFSPoLF5A6mhEj6tL/cwjMWmPqBPb6qgTKGNF/TF6o0/4B5praqYCqRj2KNLyXNI1sp3/4GgF
	XUmvTbwSgc3rrjjMhjN0VH3eLHIbssgUvnKYbu760YRrpnoU+cWG7kFh5MjO8/3ctYwSWmktomx
	sxTkNWtTXUtZ4IqVUQspcjDxMAZtzH/EvGWJ3Fo4nZzwHogjt
X-Google-Smtp-Source: AGHT+IE8/NN20PbkyWg3nQc/khm4GJwnFt8tiVOPDZnx/t5Lg+i7e+/8ww2RJRbOLM5fidIK1NfFCg==
X-Received: by 2002:a05:600c:a4c:b0:43d:26e3:f2f6 with SMTP id 5b1f17b1804b1-441bbe991abmr1611675e9.5.1746132447970;
        Thu, 01 May 2025 13:47:27 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.home (2a01cb001331aa0017b58d8bf04048c3.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:17b5:8d8b:f040:48c3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b89ed4f5sm22990385e9.18.2025.05.01.13.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 13:47:27 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH v2 4/4] reproducibility: mark libbotan as known non-reproducible
Date: Thu,  1 May 2025 22:47:08 +0200
Message-Id: <20250501204708.10398-4-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250501204708.10398-1-yoann.congal@smile.fr>
References: <20250501204708.10398-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 May 2025 20:47:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117273

From: Yoann Congal <yoann.congal@smile.fr>

libbotan packages are not reproducible.

Quick analysis: A path in /usr/lib/libbotan-3.so.7.7.1 changes:
-/etc/ssl/ca-bundle.pem
+/etc/ssl/certs/ca-certificates.crt
Look like the trusted TLS CA store full path. This path most likely
changes depending on host OS.

Relevant logs:
- https://autobuilder.yoctoproject.org/valkyrie/#/builders/87/builds/42/steps/32/logs/stdio
- https://valkyrie.yocto.io/pub/repro-fail-openembedded/meta-oe/oe-reproducible-20250426-pazz3nt5/packages/diff-html/#reproducibleA-tmp---reproducibleA-tmp-deploy---reproducibleA-tmp-deploy-deb---reproducibleA-tmp-deploy-deb-core-------reproducibleA-tmp-deploy-deb-core-----libbotan----_-.-.--r-_amd--.deb

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
v1->v2: Added quick analysis
---
 meta-oe/conf/include/non-repro-meta-oe.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/conf/include/non-repro-meta-oe.inc b/meta-oe/conf/include/non-repro-meta-oe.inc
index ff93db3a21..894d7f330a 100755
--- a/meta-oe/conf/include/non-repro-meta-oe.inc
+++ b/meta-oe/conf/include/non-repro-meta-oe.inc
@@ -58,6 +58,7 @@ KNOWN_NON_REPRO_META_OE = " \
     ldns \
     libass9 \
     libass-dbg \
+    libbotan-3-7 \
     libbotan-3-bin \
     libbotan-3-dbg \
     libbotan-3-dev \

