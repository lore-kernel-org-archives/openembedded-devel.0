Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9675EEE0203
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 14:29:12 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.65110.1767104945365589144
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 06:29:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lk96wlxj;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47d182a8c6cso44884655e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 06:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767104944; x=1767709744; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=RGsRoV+2hCn7uwEwK8mvjItBGu1iBKwpxvT52TS34Cs=;
        b=lk96wlxj+Y9deYGmmxPRpZsItxzlXrF3G83CJU9t+RXIhHpxVUu7B0ZntAremX6V+F
         TY/m2b5mwJx9vWraeaaAYNCO9vc7+F0PR8QFzYUya07TTrBwHZuoiasN6HPOgVNRpkf9
         /uUkaChdoKAl3JyQXJAJHCONlQjb7aMWb/jEdPJshId/7OXsZEXG/HAVjhZTVywAh13e
         L7YQkM4w483HlcLFGrABBcYjmbGHQu7sAbhAXuBVutoGyzqr6Q76JStuUiGhg5izEiB9
         MS/BM4L2jwBvMIQJUKqD/eRJqr9ESb7+npl+ZcFkVlbqO+1PPlEo1mrMxrEQhTL/cnbG
         PkJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767104944; x=1767709744;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RGsRoV+2hCn7uwEwK8mvjItBGu1iBKwpxvT52TS34Cs=;
        b=K4r1is9ocgkOswEv0BXR1ga55bhhvFmD6HoDqEnCmcSu3IlpDJK1A9nKjwRq1p890Z
         EYcraMr1WSUZIjg9t32NwrzsbADQ+chCjHvyvU2KxIQoXR3ox6+nhsDlUP+mhYqOBcDn
         XouKvn583PH3auCnDESB9lJmw96/YKxy1erAtuW7t+ysUWzWfKjgSmNd62AppV0pbzlI
         DKkixJXHznZqzkJNT58TgdIMkrp/rxXxShQa3v2Snhpp1m3GGH5lxv53fHvM0EuqEReJ
         bJiTjsAvgt7TbqNvBLXyVgkEl4sJQI5EC1WNzMKiviwFRenKFPnpDwe09NQYFYNpcj2s
         hqRw==
X-Gm-Message-State: AOJu0Yynoqsm5vunRikInXqyS8sJQ4V7HDddy027l+Z1OS8ZirLLlQGD
	5/AdNUCAjVgE63xVhNR5bnwELe/NuztWhsduZGVkoZP5bMZQXKYQVBkotNuznQ==
X-Gm-Gg: AY/fxX7p7RMCUX0JlgWVGczX/B4Cxmm/CD4LyOORQ5aohhByNQBHs3H8OIkVEfazWwq
	pgtn1+N/k3RugzE1uAg3VlIsr6sFap2zoL3Rz9OWwR157gF6Bfrul6jTME3avCYw7VPkIhQ+goG
	gDv3weqJrXDJ5T3dMB3FLNxVwPSJbv8Aj5M1Y2TmP2SPq0KISm2OkZ+aad59ZZaIgliouFCua4h
	0amAVOf4KE5HsND8Elgnx264glf0QN0tYVXwvgzhoO6esmyKxrS4tbjYaH4tTtJHBlDtdFFFbhi
	VTgb8WchCPN5sTqERdl9citGq3sdDzowEExOuFBxf9s3i0nkFW8ymKk8A9kKZqXw4MDlMCayT+z
	zHxv8Dv9yIfSBF3D4X/xg0GH8q6ZvL8wktMJRJDMqQ2ma9eV3rJ8wMueaZ7UVVeOG53w0UDgX5R
	3V5ybNv37wO7eLaCMG4Uw=
X-Google-Smtp-Source: AGHT+IF6DrdAE8C4NheBr5v+JPSaRILcW5Id8BWH4nQnFBZsimGi03QpnT4l9+ADrmVz5eOk4uTEjg==
X-Received: by 2002:a05:600c:548d:b0:477:79f8:da9d with SMTP id 5b1f17b1804b1-47d19584bf6mr444268315e9.24.1767104943441;
        Tue, 30 Dec 2025 06:29:03 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273e4d5sm653345045e9.6.2025.12.30.06.29.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 06:29:03 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 01/10] python3-simplejson: set CVE_PRODUCT
Date: Tue, 30 Dec 2025 15:28:53 +0100
Message-ID: <20251230142902.730667-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 14:29:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123017

There is one relevant CVE tracked using the simplejson_prject:simplejson
CPE, and no entries tracked with python:simplejson.

See CVE db query:
sqlite> select * from products where PRODUCT like '%simplejson%';
CVE-2014-4616|simplejson_project|simplejson|||2.6.1|<

Set the CVE_PRODUCT accordingly

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-simplejson_3.20.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-simplejson_3.20.2.bb b/meta-python/recipes-devtools/python/python3-simplejson_3.20.2.bb
index bc93da225a..f1a8d55132 100644
--- a/meta-python/recipes-devtools/python/python3-simplejson_3.20.2.bb
+++ b/meta-python/recipes-devtools/python/python3-simplejson_3.20.2.bb
@@ -20,5 +20,6 @@ FILES:${PN}-tests += " \
     ${PYTHON_SITEPACKAGES_DIR}/simplejson/tests \
     ${PYTHON_SITEPACKAGES_DIR}/simplejson/tool.py* \
 "
+CVE_PRODUCT = "simplejson"
 
 BBCLASSEXTEND = "native nativesdk"

