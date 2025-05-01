Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2514C3ABAC
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 20:47:32 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.4804.1746132448894881577
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 May 2025 13:47:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=pvvnx7ra;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so10692035e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 May 2025 13:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1746132447; x=1746737247; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0fe4usAySq0sshyz2rdIJQwtdwu0BnmoGY2gtix6XYY=;
        b=pvvnx7raBVBVAWKYjdoRb+foxkMBzOmx8MlfdKge41BAWZpdEjLpgHkYxj7aIXcXl8
         SSANPn1RGBwNAl5ndwyexe77HDKPz75FTdGZc1PpTp8i5gdiUvr9RY6DAeKdf7zCHfxo
         m56D3bjEaI9ODh9F0wuy2DIjJhUgo5dm7Ysxs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746132447; x=1746737247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0fe4usAySq0sshyz2rdIJQwtdwu0BnmoGY2gtix6XYY=;
        b=kPoMEwV8rpPOCjddn0iISl8BbKqNI3i1J3zElTPVHDVinycScaJbm2BRncAYXmKvzz
         +dZFmXh0laKocufatXCssZVXcw6Y5Muw6Qh/Cs+Qxaf8cpolrqUO7B3FeltKZfCFlsZY
         xSf5K7oLmhTTeOILVmkbeuMuA4B2C6dejzhifAMXOpUFd3vB/HDEJ35t9Q7DaE05hvvK
         BSiCiTrobZWGQHSs9pZTT8hnFu00SmUPH7RDpaECPdVEa/4T/4rOHAxyml4o5DcpVnna
         K+Gppj8uG/3GFg/2wfX+3oXqq79pP8+9r/1b1oZ+mautch6sy0AeybFPSEnUhXfxzH0f
         0RxA==
X-Gm-Message-State: AOJu0Yy2V37G9iNoXHD+94ntNtwBq/uLv0ZS9wnSmojx/Ge+xvG3CMPq
	manxGJwjxPm1PcgLDJR/3czSyRETovAec4gH3xoz0gD3ePh84vlqvY53bN5lO7KHx8+KZh583rN
	P
X-Gm-Gg: ASbGncu6dRFPfZNv58ahLnQRsoHyK0f1pp8I+Aq3H/0xeY1+Y+MfHVQl720ppiY7e52
	L7yQt/rQroQ6u6posOim+te0uDpdNP8XWDE9XxUgukGQ+938Qz9otWKuJHXN+UADgeJoEiMeqWx
	Xgi0fnsvDzGFj5PKpxHs3otO+FthrBW5nHNVxrBKUoq0bnXv8AQtZVr4H+UTJNHJ6Mb2wYRe9Wr
	CLlsKNLVSMqNJD6PsdIsiYDXUs/p6jHy9BNbLVoCfE153HbHoNH/QxBIa3LTsm1Kv98EcBw0IB6
	QcwS76K9eVBqvuZCO+lqlUA8ovRXciJv2EDyfjIJZvj+YcEb1Ch8FzRzO4mU17tVPxvOn6iBMTm
	9KWaVosqWswAWmGSlxB3hnTVqOGUXDM3QLduIee+TSl1kmaYc
X-Google-Smtp-Source: AGHT+IHze5TT5JJOsFaxpwVbROcGSAHcFIqeMJwJGhN2WDtU/oZ+94XaN2E2GWXc75EB4GUnoZyjYw==
X-Received: by 2002:a05:600c:3504:b0:43c:ed61:2c26 with SMTP id 5b1f17b1804b1-441bbedb9c2mr2089495e9.17.1746132446867;
        Thu, 01 May 2025 13:47:26 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.home (2a01cb001331aa0017b58d8bf04048c3.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:17b5:8d8b:f040:48c3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b89ed4f5sm22990385e9.18.2025.05.01.13.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 13:47:26 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH v2 2/4] reproducibility: mark libsource-highlight as known non-reproducible
Date: Thu,  1 May 2025 22:47:06 +0200
Message-Id: <20250501204708.10398-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250501204708.10398-1-yoann.congal@smile.fr>
References: <20250501204708.10398-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 May 2025 20:47:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117272

From: Yoann Congal <yoann.congal@smile.fr>

libsource-highlight packages are not reproducible.

Quick analysis: A path in a generated file changes:
/usr/include/srchilite/langdefparser.h:
-#line·95·"../../../git/lib/srchilite/langdefparser.yy"
+#line·95·"../../../lib/srchilite/langdefparser.yy"

Relevant logs:
- https://autobuilder.yoctoproject.org/valkyrie/#/builders/87/builds/41/steps/32/logs/stdio
- https://valkyrie.yocto.io/pub/repro-fail-openembedded/meta-oe/oe-reproducible-20250419-ye3feamr/packages/diff-html/

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
v1->v2: Added quick analysis
---
 meta-oe/conf/include/non-repro-meta-oe.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/conf/include/non-repro-meta-oe.inc b/meta-oe/conf/include/non-repro-meta-oe.inc
index b926b45b0a..5c8fc30052 100755
--- a/meta-oe/conf/include/non-repro-meta-oe.inc
+++ b/meta-oe/conf/include/non-repro-meta-oe.inc
@@ -71,6 +71,10 @@ KNOWN_NON_REPRO_META_OE = " \
     librelp-ptest \
     libsdl2-compat \
     libsdl2-compat-dbg \
+    libsource-highlight5 \
+    libsource-highlight-dbg \
+    libsource-highlight-dev \
+    libsource-highlight-src \
     libthrift-c-glib-zlib-src \
     libvncserver-dev \
     libwebsockets-testapps \

