Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6D71D116F3
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 06:15:17 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15137.1764569715809469381
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Nov 2025 22:15:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FoMmh4G2;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b98a619f020so2871541a12.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 22:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764569715; x=1765174515; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K1B7QcNdZtQ8GahTU6RXeJXCRPjzGKGGHT25P+sqMLk=;
        b=FoMmh4G2z8tge2o8dID7PrVleW7Jvoy4fuLPV7FR1a+EhL8mlsFMFzUEl0KOvs3Wmw
         iFRtlv7oK1nBPW6tRaUd1xSuKS1MK6cfBt49kp6Yzx21/GDQiYW4yOMGOSz/giTnElV4
         ddZVlLNlz5MOn/4GNCY5mE04iSJNsI7IojiIOxIdHU6HZ8vq41oHCf/9HXn/KiFfo8G9
         0rZvlCb0DJGswshn0dijhzgPuJBvWhOQwwco0cKGeA4YXvhrsALwLDT8x8c1MyJpm7TZ
         jnWv3Hb5Jck9FENVud58G2yzJn9xjtnl4WHH6BxJgoBn/7n0AA1WgeIpVEL2DrlkMPmK
         zBVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764569715; x=1765174515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K1B7QcNdZtQ8GahTU6RXeJXCRPjzGKGGHT25P+sqMLk=;
        b=GjK2FkVvRY56G1pMyqZkjknAERIVl4JWCHp8UvoGL3DA1PFnXuCKib78AZdD1Eeflz
         sNyg4btwwgx/Ivd2X81gzs4Pqzzu6HJjypblgDho/2ixT6jQg2jVHR/BtQ+BFem7nApW
         uvNz1LQ4VzN+Rgv4G6wOflAiWxnE0xwwZknvHiBmM96VXVOiCCoev6mFDq2zCGTDl/Wz
         ZvuIE9V0HEe96Ysr338PAQoN43X88u17/qf7ofakFU/bDSt4jmK1Wq+g4+t2zN1CCoBW
         cU158fPienFZrCG7suZm/LwMCmwopDS8DrVbl3UCDabVA1yimzQL7Xxwq69Y8C1zG7Iv
         Jahg==
X-Gm-Message-State: AOJu0YwMHX0JNj2UO88NOh4FXyOJaOD/Kb3q9DBe/e6VZZTqN5+LJBBa
	eoAEwP6U0uFG8FIHUF2rf2YbPlm3Tz5A4GaFSg4vrkej1OPncxfz3AY8JxeUJrti
X-Gm-Gg: ASbGncuykcsMvktacZlWhta/Brg9CYrnecXxNXFpoHnTkMa8Seu/LlDzGvE5eeiUWUI
	jms1+CI/ZyQFLZNyWAwe+DS0a9XsTBwXkofUZp9ci/CrneapFdnXI9anx3XPFNjWajcDFAhwXh5
	7/3UGxKFd8Pw6MapsRkxCYYMcfyQYgDuAgQE47lG0c2typwhzb99g8UE6RtJ8JSSaAPkSzifnTE
	3FTUoKRKDQD42LOVp8H8s1dzNuirrPKeMB5xgcF3ay2Eu044WM1AQo8rUDbeYwSTNve+CsZytfo
	qcJ6maBSFjzeZYgXd8KMW3n6Ix39waMYu1/NbaGi/pQCl1HfupDYKSpQVLmpgjmCkc/7yqi+GZR
	Y5ovZC7t/R/rd1Ao0IDzBWOq+F01WVaEQ5mqR1Q5pCYXigckVTZUbbmevk0ia4XxPZ47kPtgdXX
	hkxqEPmw1poWukY9GmXnv67VBnF5UoRzRwTXNepVx1aWS5OU7Ilep4FBYlKCJRQUNbbFGOYhceO
	2E69qAAfHZCv9xFF+kgTNLWH2GuwO67
X-Google-Smtp-Source: AGHT+IECpJUj+SLqq8RbPKBLveWO36Odj+JY95VORJeNQeyZDpg2jirKs9ry8lQrzfmOxNaOl2EbDA==
X-Received: by 2002:a05:7301:da10:b0:2a4:617a:418a with SMTP id 5a478bee46e88-2a7190f25ecmr19314547eec.13.1764569714602;
        Sun, 30 Nov 2025 22:15:14 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::821d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a9653ca11esm40031104eec.0.2025.11.30.22.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 22:15:13 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/2] python3-fastapi: Add missing ptest dependencies
Date: Sun, 30 Nov 2025 22:15:11 -0800
Message-ID: <20251201061512.961293-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Dec 2025 06:15:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122189

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-fastapi_0.122.0.bb                 | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-fastapi_0.122.0.bb b/meta-python/recipes-devtools/python/python3-fastapi_0.122.0.bb
index 02da557663..7dc5d833bc 100644
--- a/meta-python/recipes-devtools/python/python3-fastapi_0.122.0.bb
+++ b/meta-python/recipes-devtools/python/python3-fastapi_0.122.0.bb
@@ -24,4 +24,13 @@ RDEPENDS:${PN} += "\
     python3-typing-extensions \
 "

-RDEPENDS:${PN}-ptest += "python3-orjson"
+RDEPENDS:${PN}-ptest += "\
+                        python3-coverage \
+                        python3-httpx \
+                        python3-orjson \
+                        python3-dirty-equals \
+                        python3-pytest-httpx \
+                        python3-python-multipart \
+                        python3-sqlalchemy \
+                        python3-trio \
+"

