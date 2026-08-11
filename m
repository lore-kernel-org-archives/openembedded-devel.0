Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8768CC5AD7B
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 06:36:59 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48906.1786430217575746944
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2026 23:36:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XCS8IW2q;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-848743155bcso958640b3a.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 23:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786430217; x=1787035017; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6vEhIPiTJxJ1Qi50V834uQ5q0F2lQxcXDUGsCjm978I=;
        b=XCS8IW2qy+S5WYciVFUYgEolubG7ikdF1muxl/dzcEUsbX5lBC+643TWkQ1GaCgegp
         m7NbxF+fsrTbzYp1p/hhZrJcb9nOmC7fi0QTv7C4z377y1ggAAhmwP2gSbMlWWfJMZe5
         WHpHXVW0v52P0VzVLLZozkYlq7tJ/tqHnfr9UWwztJskKiJOpaRO5MxRAyFz5Bo5hhok
         hH1Xe5Yd0JIMxlyw9ue3XAEPNgWdEGwUxbM7A7Eh5tVhGL4MioHEyrC7BNapGGNG97HT
         Ws3b2VO8yED7Yassd/bVTuewyw8sdQ9ArWplMdetnetIDpF/oaqQoNB36eSN9X//vkgN
         V7tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786430217; x=1787035017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6vEhIPiTJxJ1Qi50V834uQ5q0F2lQxcXDUGsCjm978I=;
        b=I/B+2WKJb8hdVXEN5aYlj4GrV5D5ULjxYkd4YPuC17Af2a84Vd2+ybXaWoDrDS18n4
         J0+CiljFFPnhxcWhKH4djid4UgelF4k7UWg6tAn3q8p+lFTTwLY98ugazuQ8alGKQ3sU
         D90c61Wx0dRWQmJhBc5yUN13s3R7fmCKd5YmtS2b7w2KCC497UPZakUMvbhdS8hrBLXD
         U/LVddKTpUcdhDJHNgDZqIUgGyozdbSe0raTkJnxAcFWjjAQSVkaF+hsllD9BkibaFJL
         65ZdXDbWtOncRk56rmHgUpEVJLdhWn0FBxHaOHiQfcsy/oS6GXbKCuq5FJv9j9IqXZoR
         QNGQ==
X-Gm-Message-State: AOJu0Yz8SoAV05KjktuSxi8moYGjoZLcJViRJi6DwuiPA91NN87spY+F
	ES35Z0AKseuA9fx06eJcibHPdYAF914BZFlrBdToCH7sVi3I4xO2ItA0dx4WMOeG
X-Gm-Gg: AR+sD13fI/Zow9mnHecJr+k6r1rqKefpVadVS7f25/fu1dhc+QuCHBtpxipryXKR/wU
	MOmcL1sgnrWajBplTQs4oCp3mitXZtRYGtR8EzyUn/01gYVXJqcOmK+p9rokk5e0FfkhsUC4juj
	7eVOl2KUZIUZFexhvlaLC3yT/Xj8beJ0c3BzVyhth+mIh2U5tByad4hJCn+iZWXx7Sxc5/RLGE1
	q/oRfPQ1rj86ovGoKJ6e9asCFE5pfQN/k2kYYaxeVQGafUW37SQE/+UitSpt7BCris3wtQOoF+j
	yTbuOOS0e863I2aoNqI5+5X29Im5fqJBUP14iVrBvJfNZk+GOi8ojVThHVIkuKle0TSOYsTkAzz
	ECjhf1RhHH6P6SBooN+Huy1y5JEMjCGIg2UZVKMjS906EnjP4IP+bI9pGCmKLnc1DQa+zdMnVlj
	1qoCnUtad2PJS30vd2iu60Sw8UlxzoscRwCVwaWSkTq5OGoKTsGvannUKJht2DUQ0h0kkYNXbnj
	w==
X-Received: by 2002:a05:6a00:170c:b0:842:6004:3fd5 with SMTP id d2e1a72fcca58-84fa8875f27mr803531b3a.25.1786430216787;
        Mon, 10 Aug 2026 23:36:56 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fa952841dsm154852b3a.30.2026.08.10.23.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 23:36:56 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 3/6] python3-socketio: upgrade 5.16.3 -> 5.16.4
Date: Tue, 11 Aug 2026 18:36:40 +1200
Message-ID: <20260811063643.152169-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260811063643.152169-1-ankur.tyagi85@gmail.com>
References: <20260811063643.152169-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Aug 2026 06:36:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128918

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/miguelgrinberg/python-socketio/blob/v5.16.4/CHANGES.md

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-socketio_5.16.3.bb => python3-socketio_5.16.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-socketio_5.16.3.bb => python3-socketio_5.16.4.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-socketio_5.16.3.bb b/meta-python/recipes-devtools/python/python3-socketio_5.16.4.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-socketio_5.16.3.bb
rename to meta-python/recipes-devtools/python/python3-socketio_5.16.4.bb
index be352876a8..83131b26cb 100644
--- a/meta-python/recipes-devtools/python/python3-socketio_5.16.3.bb
+++ b/meta-python/recipes-devtools/python/python3-socketio_5.16.4.bb
@@ -9,7 +9,7 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "python_socketio"
 
-SRC_URI[sha256sum] = "89b136f677ae65607a84cecda9b4d6c5377b40a97582c504c25df89af16d520e"
+SRC_URI[sha256sum] = "f7fa4a43cc8e687930b5c6e44d6e2efc2071eca4bef49b8bb3dc0827f7f92235"
 
 PACKAGECONFIG ?= "asyncio_client client"
 PACKAGECONFIG[asyncio_client] = ",,,python3-aiohttp python3-websockets"

