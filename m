Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15C4BFEFB69
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 15:43:53 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.99121.1772207031326748487
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 07:43:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=m3xlbTLk;
 spf=pass (domain: konsulko.com, ip: 209.85.221.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-436309f1ad7so1832155f8f.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 07:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1772207029; x=1772811829; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=efYVhYICtFL5sB8hi1ddLASVv+8MKqYCR7gbsfxuEoI=;
        b=m3xlbTLk0sSrBulgXDkJq3cJZs/pQPD7THLxARB7QPKUHgjCcZ8LsbLZ2xZpGLz3qn
         pPWSq9bBoeHjehCM0i7FIIsXLD4iNnqJrgAsGyzXJ92ByFsJKH+O2h+qIrLiXFsUS/S9
         AqZwo39TrybybsbTUq3hc7eLjq+zSLy0huUKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772207029; x=1772811829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=efYVhYICtFL5sB8hi1ddLASVv+8MKqYCR7gbsfxuEoI=;
        b=rgTmlfF1P4DiY9H/CKV0ZoSi01Jyx1LXX8rv+m6wZCtLf3AjU2aBWYit+xXJAajyGK
         qdz4GEQgX4mqeYfCc++xnsxdZtN0xrzTOGMEk7PBMQYf7Nlc1SrdUk4cqCWDVOcEItZz
         cWg2z0c9T9L9z0+2HCtGmxfcWsCzXa1+PZv0M0epQTwWKgPWkfQKsi1rYK/UuDxMrvh2
         oK0ThSqUhB0YjmQiT/Z2uEGuJPmkaCJzvMt1kybr+goixEpmquUm4A9cR0lNm1t7Ad96
         ukCFI7XAFYaff4efUQqTTqNexrZ2O4omS6pMnFV/VRWqtedX6b6SS+Vzd8fwpk7KoXaH
         WoUQ==
X-Gm-Message-State: AOJu0YxJ+ztWm1XaiN4tnv57+q+3vfhCmqQYgIzp6L0B+76x101obK0k
	61Pc+bQK27coKRadIIb0vK45+dlBqDzlMzY47bNZVEy0yTnTjHRCSEj4Jl2u7p6jSgapmvNakWL
	voQRY
X-Gm-Gg: ATEYQzwMghIuDlNAm4sattGAvqaO5sthVlEFVW2UDoLaFcjfpCVbCjMZB2Lxz4F7Y2V
	uf/iWIY+2wMT038gczLh0J5eWyoBV96KWm0WmdFBt/L+QhdgxBg5KIfyJs0ZAV0g6FMVOKmO1qF
	Hm47eZf0f3OkWqw/mylYQSIUQmuWFf+KiDI5raQEhWsAk2iD9nRY9lmn7aokyS+kd63iv07Axhl
	VjVLRI1ayuoSTNT2fDlQ1+dvA4Aup7Ne2U1C8fZiPgebwC5vEGWCi4qjsKBImCDzhKfZS7vnDbQ
	ZVeWhFv/LdPKHwTyDv67jAE1YDbJKImIWpHZTREq39VRmpBRgMtGI6gratDc5/oceNDXty+aRVW
	Pb7cUkOPtyE/PaNXQAvkH1F+G0brhAM2LU0onY0cM6GznO4RqdxK06PIlX0phGwjGBmmW1XH8sX
	FbPpyVtCbxRklxopxnYRaJ3Tx1wbu+nnNV1Kdu
X-Received: by 2002:a05:600c:3b99:b0:483:71f7:2796 with SMTP id 5b1f17b1804b1-483c9b9d99cmr55094395e9.10.1772207029392;
        Fri, 27 Feb 2026 07:43:49 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd75df9fsm245845115e9.13.2026.02.27.07.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 07:43:48 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-moteus: Upgrade 0.3.98 -> 0.3.99
Date: Fri, 27 Feb 2026 17:43:42 +0200
Message-ID: <20260227154343.3923152-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260227154343.3923152-1-leon.anavi@konsulko.com>
References: <20260227154343.3923152-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 15:43:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124765

Upgrade to release 0.3.99:

- Resolve ADC performance issue introduced in 2026-01-16 by getting
  hardware triggering to only fire once per cycle

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-moteus_0.3.98.bb => python3-moteus_0.3.99.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-moteus_0.3.98.bb => python3-moteus_0.3.99.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-moteus_0.3.98.bb b/meta-python/recipes-devtools/python/python3-moteus_0.3.99.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-moteus_0.3.98.bb
rename to meta-python/recipes-devtools/python/python3-moteus_0.3.99.bb
index 412ee536f5..3de7f6a0ec 100644
--- a/meta-python/recipes-devtools/python/python3-moteus_0.3.98.bb
+++ b/meta-python/recipes-devtools/python/python3-moteus_0.3.99.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://setup.py;beginline=3;endline=9;md5=24025d3c660abfc62a
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "ef6c628bf64d56e30aac1f8e314f74b1bbd9875e5ec21ecd3c2ce9436f7e3644"
+SRC_URI[sha256sum] = "30d3cafa6b23692536102f52d9a7d919f2775fa75bdee087f98782c7e3c88805"
 
 S = "${UNPACKDIR}/moteus-${PV}"
 
-- 
2.47.3


