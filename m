Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B47BCC02180
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 13:49:56 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.16912.1736776181845699162
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jan 2025 05:49:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=IPQFcYWk;
 spf=pass (domain: konsulko.com, ip: 209.85.218.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aab925654d9so110730366b.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Jan 2025 05:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1736776180; x=1737380980; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yfOjaAvk5n9Lo8ev3hedDd8rXI5sk65QHUcLVHgSl5I=;
        b=IPQFcYWktkwGF0VKNU7ErizLwxD1UJkjtjwcxjL3XZNmEl/ABE9/9gM0JNWpF/uerL
         +ihnkWOtZOyqR2uNIX2iWvZp9EI3KwH50VQNRQ+IHMm/6eeu1jxZUrEQ+YniiAWDdyzu
         Xsb28vwTICzvBv4lETRghB1Xz56QYDK9pQRB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736776180; x=1737380980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yfOjaAvk5n9Lo8ev3hedDd8rXI5sk65QHUcLVHgSl5I=;
        b=CBVAXpuPB8qr/9rEUb3zNwGISRyEKH4M0Gr6ZU6drDBiHVr/Xrgvb1XdlxdrsFmx9o
         parfxHISb2lQnSGZkBmhSpCDThOr/uOMRp4xCs8Dv1bw5yp2i95MxilZXt67c3XQ5DzQ
         NUiu//b0s0corYIYDfAeqlKj5njrlMdpiLQcIzW+XLerbrRntwhx8XGoNMnoJ3P4b/mS
         VGr4HB0ZiJe03PDZUZtNI0oBqFBd2jTnotu1AyB2Ty2Sy2c7/t0V2IL3dCBj2X2l+obF
         Q2iML4chrgnGUP2WAYTL4rh7z0mKzDebUS6r1mQU60A/RSG9v6u+nZISIGsaD7WU4lKO
         qtJQ==
X-Gm-Message-State: AOJu0YwQJ8lSYdefOb/zwJnTFsGr/rv9DmtkJywq6cWVxdkDH+QteVaW
	oB2ZOVHwfDB7MYhqE1X2T6R2A9nXgGBUsG+uZ9pc35ZlC/l+6OOhXItardhvaXcMfmpcI6cKa5o
	V
X-Gm-Gg: ASbGnctAscBe90qEv46+PeUjIOQ1E+eRqcsxEfV8YFXaPZPRbvashetmGBYFVWlnJ/w
	H3n2YXuWfu/h+XcycY8cECfuT4bGYL7nHyj8Xt3PTTlQNQV3V0nV5CLwd/3w5VQvM/shZKMdlB7
	FD9oXCE1U8cO1ZPA4g7BnGA/WeTIX3G6Q6rdpE3eqqL8XbOsNdqlaX4fdJZcpGQQoD/biXoXPJF
	knOcA9NC4nFPMxWj8oND6IPDBx8wnt1jrfOFHWFJsmYL/zQVpY1XcP1M9497fZr63JqIO0=
X-Google-Smtp-Source: AGHT+IHU7qtc4AI76mQCb0kGvwx5K+mjhGuZNTU/esGqNmKrxMLRXql+UWqaKJxPZCj621ytt/tYig==
X-Received: by 2002:a17:906:6a04:b0:aa6:800a:128c with SMTP id a640c23a62f3a-ab2ab6a8dc8mr2116350666b.11.1736776180054;
        Mon, 13 Jan 2025 05:49:40 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c90dad57sm509938366b.66.2025.01.13.05.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 05:49:39 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/6] python3-inline-snapshot: Upgrade 0.18.2 -> 0.19.1
Date: Mon, 13 Jan 2025 15:49:33 +0200
Message-Id: <20250113134936.3594358-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250113134936.3594358-1-leon.anavi@konsulko.com>
References: <20250113134936.3594358-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Jan 2025 13:49:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114833

Upgrade to release 0.19.1:

- added the optional inline-snapshot[dirty-equals] dependency to
  depend on the dirty-equals version which works in combination
  with inline-snapshot.
- snapshots with pydantic models can now be compared multiple
  times

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ine-snapshot_0.18.2.bb => python3-inline-snapshot_0.19.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-inline-snapshot_0.18.2.bb => python3-inline-snapshot_0.19.1.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.18.2.bb b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.19.1.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-inline-snapshot_0.18.2.bb
rename to meta-python/recipes-devtools/python/python3-inline-snapshot_0.19.1.bb
index 8ea777fcbc..049d8f25ce 100644
--- a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.18.2.bb
+++ b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.19.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a35eb90dfdf03953dd2074d0fdba1d4"
 
 DEPENDS = "python3-hatchling-native"
-SRC_URI[sha256sum] = "1be34afa453b75d120e12e8fb4724e28cb23f71b8f0fb0a7bc822a78c97ff826"
+SRC_URI[sha256sum] = "28b17612e12bc7012468e59c47aeb0e84ce6d6a392b3f78f3bafe8cbf0d77bff"
 
 inherit pypi python_hatchling
 
-- 
2.39.5


