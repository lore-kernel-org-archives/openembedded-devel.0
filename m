Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AB2ECFC516
	for <webhook@archiver.kernel.org>; Sat, 22 Nov 2025 00:12:56 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.484.1763770368082505229
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Nov 2025 16:12:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=TmWKXaf7;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so24576385e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Nov 2025 16:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1763770366; x=1764375166; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uE8zVOz43i6sF2/calzDSfyRWX34tVqdzddnAUbvrp4=;
        b=TmWKXaf71o2+LIzhqCwm2FoMxxWlkXRGZ44GwgzJMiYqx5f7ulU7qv58sYdBU3z0W/
         NLwQv1RWUz0BiGqpkVypSxKIcxB6swlohymznkb0tb7vgxYhPfgPEJH9D0o3shCbWKoz
         /SEsDIqq3hBnE2ZZfubYRiJOcjIAcUU7L5FMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763770366; x=1764375166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uE8zVOz43i6sF2/calzDSfyRWX34tVqdzddnAUbvrp4=;
        b=bQyMogsMcdQ0YFjpHsf0cS9vRUugkgyCiCO2efJQYD+uKmyi4ulVzeqSHh5LFk4wOO
         yvv/cP3lEON6qShfCh9Xx9Xk4uy3lZg09wN6UjwDp9zNxFEGkL/lsS15mOQTLgIrxR8h
         UBxyFCR3cVVcYDiW6bwYnUPxGQhVGH2c5gdKgc1h8D5YMR1ejXEX11LDT5ALEpkGdcvT
         DiZ+mshuzVJX3G4+x7eCaUSEZe4dDFtELuvrJVplsHIhuYlOT1+8+6fnZzFJFh65Vzcb
         zym2zzFdFjOg5yzT5XNTnu91iSq9t/ziAsGABu4VKHml/gNYW5t8ZEQ+LTlPg7+hfVEa
         urZA==
X-Gm-Message-State: AOJu0YyzoF3IGeagrUOMKGkF0Q06fPls4LENaifkgLkOiJvbT7qsdjfs
	71ADkh774EZDAk6bK+z6rN4beD8Q3iNiZobVmKQtKZFPuYJb4GM6AJo8aS0pR/bw9pp2rLfcSFd
	6QysK7Wg=
X-Gm-Gg: ASbGnct7tZ9BpwcZJFYGPnu0RIdzgjisaqWjo3VqRhqbkK9xHI583aaPUXu5BCg8kmG
	yp9/nW6RAUy3rRtzMOo0pG2xaF9y5O6qnQMKs2vpKSml4uQ52bn+mkJRke8ZJtGVariPp3eRO+3
	eTYGiuyGEvPAkKPDbg1jQsRQjdobIyIX1HQA/Y6Vt7knpM/JqwpWV2+z9diDMW59zr7Xaf5n/2x
	KZSvKKGcBEB5QuUkxNZCCGWBJHEceyurpDe/2F4uD8OMafuP+OzD9vjAEXSHOqxArNDEDgxJnSH
	euLFzEvkJgssyBYcQSwbZTTS0PAOzw3FB0NDiduioz2UgxLAJdFz6mURZPvQs9NcyT7EdJzwrOe
	PaFDzMxJX9Ny+QPiyFfQR5OGyDxNmHpMnteWmgpGKp70eWp8rxtdZGI4aTmHgn4W3BUElUlBsgY
	o5cfI1OpM3IpWtYfn0xKExIG3h/XGZDHgd1Buph7RqbOdKZ+KX6wvUpg3hKryHFvxtDtBikWLjA
	qyxyXvZRetP9nUYkr/OyQ==
X-Google-Smtp-Source: AGHT+IGP1irTKLYQnTAALBuWmX5gUn6KuLlhVyHcw/Cga9hqJI5h3E6sLzyHbQLC3mdAv/WTPJhkpA==
X-Received: by 2002:a05:600c:548b:b0:477:1af2:f40a with SMTP id 5b1f17b1804b1-477c01be313mr38312065e9.17.1763770365804;
        Fri, 21 Nov 2025 16:12:45 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.home (2a01cb001331aa0017b58d8bf04048c3.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:17b5:8d8b:f040:48c3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9dcbca9sm95018525e9.6.2025.11.21.16.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 16:12:45 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-python][PATCH 1/4] python3-asttokens: add BBCLASSEXTEND nativesdk
Date: Sat, 22 Nov 2025 01:12:24 +0100
Message-Id: <20251122001227.3538675-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Nov 2025 00:12:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121964

From: Yoann Congal <yoann.congal@smile.fr>

nativesdk-python3-asttokens is needed for the dependency tree :
`-> nativesdk-python3-icontract
   `-> nativesdk-python3-pylddwrap
       `-> nativesdk-python3-checksec-py

Cc: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-python/recipes-devtools/python/python3-asttokens_3.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-asttokens_3.0.1.bb b/meta-python/recipes-devtools/python/python3-asttokens_3.0.1.bb
index 81eab1d5c7..5b6cf0624f 100644
--- a/meta-python/recipes-devtools/python/python3-asttokens_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-asttokens_3.0.1.bb
@@ -15,4 +15,4 @@ RDEPENDS:${PN} += " \
 	python3-six \
 "
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"

