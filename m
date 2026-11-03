Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7971.1793701463387591361
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 02:24:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=p1S+P3r/;
 spf=pass (domain: konsulko.com, ip: 209.85.128.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso32294205e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 02:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793701462; x=1794306262; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CQyvcFkW0ACaUdtbU8Y4t/8ydOYHPovzFZJ6mpIV71M=;
        b=p1S+P3r/6VQtdluq+Xr8RckQiBrH8PzeiyKFK9GadFrXo4gYtvUTO/082E8JogSbHw
         2U1jAl1AJhzjwEXfDgjvKAiJud/CwUeIJOBtWgsCnmqOjEQEpQZmN+jbfGMpyBq7Kns2
         uOqFwq7DJXX9sjs2XME+Rfc4Z1M9xhfSMRQEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793701462; x=1794306262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CQyvcFkW0ACaUdtbU8Y4t/8ydOYHPovzFZJ6mpIV71M=;
        b=OOHzHrJuUoByAd9Q0lUTWcR+f+38j8lNFvsS4yBq2mMXny/xTT/1BjrZdxg0j46wfq
         1GOfuDD1ijlGaFwOjxc8WVTuLGf/WrBly25GVfjWWjN6TAMWXxcA9od1aADx4/0/e/97
         Lc8U2naE6kJXN7g7g2ttQW2ZHCdjAiETs6ELbC7kg3JisJUuPMHQXnMML1fDFtMgOLju
         rBsVxjycaq8sh5rTXZDlVVN9p5cJcaqPhH8MfrVrcPyr+x4qWqR6Ih8AADpeaMEYPZ1C
         5KtnO0eoRaifdXl9vGKxEiHo6v9TfYVbCXGMIed6wuq1LlSOVX2h/OyLWdtKcDsAYKxh
         L31Q==
X-Gm-Message-State: APuU4Z8tW70GSN1w935obfWjnno4imzqONbyIkdKC4SFT08MrwmpPsnG
	9JCWAmEh0rZxtbPWfjS8rZsOxd2PM1a2ZKqpVMQv4/HeLFi8N4F+7FIf6DsRv5gbrUVVXR36NWt
	53rD1
X-Gm-Gg: AYBFou22E08sHIpYzKqKkiFdBvDN6w7MrnHbaMfCUY8Q3ivkgwz1/2/OO67ZGiqcRsH
	xSI5awYNn7Vyl4yGP1bHsikkaWK579v1WfjWdcZ26faB0jjQHOOP40JT7t66E8AQgDXfttaqbam
	D3e0K9HC5bOHOUqtqqq0XoqQrM5o7RJNpglwuFzD4F9J38RJvF4vqGxIMlgxwBssOEBvObUYteK
	sfMtlMDM4VdHJAtHYXXfTqqLCYIiRwGHPcR+wUIMgGqj54J5NPeQAZSvkiIF10wSGi55yV9pvsd
	XTw4iGE1ViP9FzyXxSt2sCoRwt2pGDEoOWZpN77iSu+OEsOpmr21ZH8mJgP4wJRRNe193x+fZPP
	kI21BX1H7tjqSa9VQWDAMXm1Q0dbukkUu7U769uQX104tB7aog+3uheSVIb7zeXlVe79YC7kwwk
	D1WZ+Os34ImOaEWKVe1JlK1vK5omna0oVR84IduYjroiIKUKK77dHW1V60j2PJtRcqvVQPBnSPQ
	rbrf2HZ4WfNLocaCcLMxHDg1w4TzuYit4cJnFtV47AAcKw/GW5i7tUxFe61dJE+mgNkphDBdQp3
	NnMXn3e98y36cqflTKGEhHo0D/zFIl8vRjMt3PEHoEZ1AthI2nxCFCDGEptymu+cqD2bPXJ9s3Z
	aTuPZawpQAnwxLbbB54TkKRhhU66WsuiX3IEwOjZHQqjL5L2kHhHAXw==
X-Received: by 2002:a05:600c:a012:b0:4a3:59c9:a747 with SMTP id 5b1f17b1804b1-4ac1793fb0fmr285747225e9.17.1793701461729;
        Tue, 03 Nov 2026 02:24:21 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a9fafe08sm73017225e9.3.2026.11.03.02.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:24:21 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 15/22] python3-pytest-codspeed: Upgrade 5.0.3 -> 5.0.4
Date: Tue,  3 Nov 2026 12:23:43 +0200
Message-ID: <20261103102350.1952237-15-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261103102350.1952237-1-leon.anavi@konsulko.com>
References: <20261103102350.1952237-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 10:24:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131778
Content-Type: text/plain; charset="utf-8"

Upgrade to release 5.0.4:

- Support pytest 9.2: pytest --codspeed no longer crashes at
  session start when pytest-benchmark is installed
- build: pin -std=c11 for instrument-hooks core.c
- docs(readme): bump action version to v5
- feat: warn when running on an unsupported Python version
- ci: migrate to github default arm runners
- ci: use 26.04 image instead of latest
- ci: test against stable python 3.15 and 3.15t
- docs: add Python 3.15 to README version badge

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ytest-codspeed_5.0.3.bb => python3-pytest-codspeed_5.0.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-codspeed_5.0.3.bb => python3-pytest-codspeed_5.0.4.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-codspeed_5.0.3.bb b/meta-python/recipes-devtools/python/python3-pytest-codspeed_5.0.4.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-pytest-codspeed_5.0.3.bb
rename to meta-python/recipes-devtools/python/python3-pytest-codspeed_5.0.4.bb
index 674f1ae87a..84559eafaf 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-codspeed_5.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-codspeed_5.0.4.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2856cbe664e8843cd4fd4c1d1d85c2c3"
 
 DEPENDS = "python3-cffi-native"
-SRC_URI[sha256sum] = "91afef90e6a96b013495e4702ef5d6358614a449e71008cdc194ef668778b92f"
+SRC_URI[sha256sum] = "5098065fb9f91d80a7a81752d1970153e44036fe36ce0b6a7afa6bf7881b9d3e"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.3

