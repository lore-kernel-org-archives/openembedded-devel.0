Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57ABAC0218C
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 08:13:59 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.6701.1737620037559678691
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jan 2025 00:13:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=BoPuOUwF;
 spf=pass (domain: konsulko.com, ip: 209.85.218.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aa689a37dd4so126864166b.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Jan 2025 00:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1737620036; x=1738224836; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oHNzb6IlXk5TqaO3TNB4Tfhjf8JwZL1X52ndkVQI3QY=;
        b=BoPuOUwFMbcA2WcVhjGoCpAZoqFIOVHUDwuVTOHCBwM7kOoQG96Dij8OwtGzOggR7B
         R6Qq3ISrKSo63zLFnG/eBkkp6JJ8hIHT7D9hLRs63AlPL6Wv1CvFxsgGMBf1xZpnbx7O
         BHL8ZzxMrLYWzDthgK+nkOQsEB568SBEZ2jRo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737620036; x=1738224836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oHNzb6IlXk5TqaO3TNB4Tfhjf8JwZL1X52ndkVQI3QY=;
        b=GKFxQ2tNAzRzb62/ojxMYt41vDS/SjmtEFMqfgm0XbrTTTBY14rzECPx/12/hRnMe0
         2PPR6fo3zyrysZRgpIOCkvtglOmJ7UBUeSyFGAX8jDHtgmQLdFF0ZbeyL9oPpN/hOeQv
         m5RSVcDG+IonJ1gL9tx+NJOOqkiL1opfildjg+5ylH14YxV2ulbreOOS/YoDDPBVLJ99
         kVYlH+o2YftB1qnoNT2DuZryqaUy2VJal6KaOMNvBOZ//G1SWrNML0ivkve/HD2uaCc+
         ZBCzPgA+ItFDAIIQ5RlbEr+waWj4I1opIQKRDFqlJrVShINMUD4kajmfSZD1syXL/J2C
         QdfA==
X-Gm-Message-State: AOJu0YwZ8OVFXzcK5u/zCDlVj2NxLba1g/wNBvWeWW2WpxZ5nue0EFsN
	L9vW3HjViyFA8ZCdWYNpw6mqmOySwHIUAg/t4JN3sm5LBT1lnzyNJq7mQVVS/fHkQ2yOfIMqLap
	m
X-Gm-Gg: ASbGncvmu/ZY8sleDI6EjXd6ENfEN5Dk6D0yVk7Qopc/5PI1Q2kCN9ucHw23SjO/Smy
	mF3ZzTbQAvpwemqctT/0fqosxrufPb9No9rajD1NgiWVaxx8GSoXA85FbC9yIjuZQmJ5g/E4rAv
	ZZMcmb5RIfVpXcgspJt6D2AvNfgrdjfyRoPjPfNO3TD1f3bThWqFgDI61plFfDfXQX8CFgbM2+8
	DwrZ8/q8toRG7KZmR+AakNGSd1CkIdGSd+HVjFgHxq8hRdvF702LstZOkZLhG+Q6l133emypH9A
	49jyaSDf/7ghZ3Z0qyY=
X-Google-Smtp-Source: AGHT+IGYpGhW7pgFtMV3Tyv1tw/Sd/E3i76h7mtlyAfAvuxQHolqDOAHUYzKjzAqHnkAbKmQIKXYng==
X-Received: by 2002:a17:907:9408:b0:aa6:a87e:f2e1 with SMTP id a640c23a62f3a-ab38b4b96d0mr2236694466b.56.1737620034752;
        Thu, 23 Jan 2025 00:13:54 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384f290fasm1040414966b.103.2025.01.23.00.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 00:13:54 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-cachetools: Upgrade 5.5.0 -> 5.5.1
Date: Thu, 23 Jan 2025 10:13:49 +0200
Message-Id: <20250123081349.3440231-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250123081349.3440231-1-leon.anavi@konsulko.com>
References: <20250123081349.3440231-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Jan 2025 08:13:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115032

Upgrade to release 5.5.1:

- Add documentation regarding caching of exceptions.
- Officially support Python 3.13.
- Update CI environment.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-cachetools_5.5.0.bb => python3-cachetools_5.5.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cachetools_5.5.0.bb => python3-cachetools_5.5.1.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-cachetools_5.5.0.bb b/meta-python/recipes-devtools/python/python3-cachetools_5.5.1.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-cachetools_5.5.0.bb
rename to meta-python/recipes-devtools/python/python3-cachetools_5.5.1.bb
index 00e208f9cf..a652d2d333 100644
--- a/meta-python/recipes-devtools/python/python3-cachetools_5.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cachetools_5.5.1.bb
@@ -28,6 +28,6 @@ do_install_ptest() {
 	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
 }
 
-SRC_URI[sha256sum] = "2cc24fb4cbe39633fb7badd9db9ca6295d766d9c2995f245725a46715d050f2a"
+SRC_URI[sha256sum] = "70f238fbba50383ef62e55c6aff6d9673175fe59f7c6782c7a0b9e38f4a9df95"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.5


