Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A34F9CFC51C
	for <webhook@archiver.kernel.org>; Sat, 22 Nov 2025 00:12:56 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.485.1763770369282204510
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Nov 2025 16:12:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Wtge2E21;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-477632d9326so16101015e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Nov 2025 16:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1763770367; x=1764375167; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWo8G+dAngWiZyWD55qQEvrgKblROB9xo/dbq5cqMxM=;
        b=Wtge2E21Pdtnz2zSALL41QhuOZJ17xbkKcXeugk/+7Crnoh7q8l75jEqOpWKEoP3VS
         tR4ddJ57/k69B1yZ3RoxPtEW/Ql6Tbz6XiLrSbZDLTqk/qYtZgCebzpc3h9+jPt0WNsn
         Xfv9syrYRlwGZNfIyEXf0can+pN4RbPxwHX7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763770367; x=1764375167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fWo8G+dAngWiZyWD55qQEvrgKblROB9xo/dbq5cqMxM=;
        b=pT4u3AvW0XACP9rrLPfRMpDfSatYcYnOr/AATJaIc4qHGVILl00ssEqLy0oXXF+D2j
         RsvuvjjBbZqYoU1uhWkf+VI7rFka2h4u44PKS9o4mgZ+i8sFnItl1HUDAA/Dp1zjP+Q+
         fz8kyNzJDIUvwMufWbl86nerzQP4QRRaCvTJFWe6A+uJpYHrJCAyFCt1YOkTdmuAsJQF
         spvKjKv8MoaZlplRsDdaWknFQhjriYdRak3BTKD3pQHBdJfYv1zZNY/IwO0beglqeIVY
         +EYWYg8WOzFckwFl4fR5A6vx7sdvQ/sRBwor1PZlmOYfM8t2VDPC7eVI/4Ad+/tzR497
         YeyQ==
X-Gm-Message-State: AOJu0Yxj7eQQw41tIGkiqZTrLiGy4BZcRa0XRDnL1WmgfekdAsiHVBp2
	kbiWyxdqPOG7RqEBbx7Lp/+xRXMUys6evntoTTixEHhylHofdqZ/Jw6mnfmnoyeM922l/WtobC2
	L5JLtKCo=
X-Gm-Gg: ASbGncu8rl9QmoiaEd9g4cDcRfSJYwNAvmOWpM3HRM0pjPp6BE/qIcXpEiv7pbDDJ6G
	2BLDCEFnZvaiaVneIIAH775pt1j4orTtGYRvHIaBWwKbC0u7ufPKc4Y6YlcMtgyrQeZXUkK0Axo
	JzgVd+A2Tvh5dkzaxQskGzIXgkPTaUxw105nKx2LuFk1PWKrKLFSURvsqARaVs4agTzQT5b6Sgp
	wl/o/9Z/kuyA/zNKKRDM0/P9HeW8fxTjmsuWHWoJ0LRhCcRcgW9FZRKdwdrW937deBe965Gnb5R
	HL2qPKvFDulHI5N+s0Oupgy75HeP1GMYpGhkt5nuu5xA78HBqI7wWDyV/Q9djduqaZH2IrKRlDU
	8lmezp+tdUeg4rEdvW56y/bli8Xro/Qmx2Ha8pZrABa1eH0/2WxoS8rxfd+qATGRSGGzOYT4rlP
	KzISAjyHjS3/sbgeSQC1jR1sNDU+yrVzF8XXk84F7oeSekweHUXNvhf/mVwcGuWF0rlrl+EpCy0
	8pKdV5PXu8Z8b7pKz/i8g==
X-Google-Smtp-Source: AGHT+IEq4DlDT2+49VlVWmPJ3V7Jv5jtPOYlLpv+pN40dnir4PKK+ELUPCj1kRbHFVK8CyXb06YOvg==
X-Received: by 2002:a05:600c:1c8a:b0:477:5af7:6fa with SMTP id 5b1f17b1804b1-477c01ff636mr43974435e9.32.1763770367005;
        Fri, 21 Nov 2025 16:12:47 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.home (2a01cb001331aa0017b58d8bf04048c3.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:17b5:8d8b:f040:48c3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9dcbca9sm95018525e9.6.2025.11.21.16.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 16:12:46 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-python][PATCH 3/4] python3-pylddwrap: add BBCLASSEXTEND native & nativesdk
Date: Sat, 22 Nov 2025 01:12:26 +0100
Message-Id: <20251122001227.3538675-3-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251122001227.3538675-1-yoann.congal@smile.fr>
References: <20251122001227.3538675-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Nov 2025 00:12:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121966

From: Yoann Congal <yoann.congal@smile.fr>

nativesdk-python3-pylddwrap is needed for the dependency tree :
`-> nativesdk-python3-checksec-py

Cc: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-python/recipes-devtools/python/python3-pylddwrap_1.2.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pylddwrap_1.2.2.bb b/meta-python/recipes-devtools/python/python3-pylddwrap_1.2.2.bb
index 045ccb9f1e..a0f5188f28 100644
--- a/meta-python/recipes-devtools/python/python3-pylddwrap_1.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pylddwrap_1.2.2.bb
@@ -11,7 +11,7 @@ PR = "r0"
 
 RDEPENDS:${PN} += "python3-icontract"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 
 do_install:append() {
     # similarly to https://gitlab.com/akuster/meta-security/-/commit/0fd8e0f8cae612010bafecbff77ed9bb6f647a2d#4e154e295e639fd6c298ca644c75291eb99e0a57_0_16

