Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53BFBC3ABA2
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 15:27:53 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.116692.1726414068550572271
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Sep 2024 08:27:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LnVazj41;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-718e9c8bd83so3337088b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Sep 2024 08:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726414067; x=1727018867; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t5ruqHaFP8A7Vov2nsmkUXmCbb2Gc636ttt+3bIiJpc=;
        b=LnVazj41pTy8lO5RUaVT+I35B01nEQmVia1UqLzu8KAW2v1tK4Wfwz7kPZQ/g1xiS2
         hnJJ+qVE0/xkiGQu9LtjJRdSji/exLpWTIzmFoaVG1mnzqlEIWrOSJCs+Vz9HapdR5tW
         U3oehLhJjJd3jJR5xu8jsUoeG0y24WJpcChwoxa3uhQA5VC4E/dYxrdQrfnNQJW2zAhR
         mT3Rk4t/61Xnem0n7ecuwGa51JQuKpy5220puOdPkuSGyCEUvRcIiUT+oqLnFvDysfJR
         uEzbrUa8NMWvGvpJF8wqSYNIosQler2vfcieyCkHMvqajJAi2R1A9TdGcdEWK0ljRvLn
         klOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726414067; x=1727018867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t5ruqHaFP8A7Vov2nsmkUXmCbb2Gc636ttt+3bIiJpc=;
        b=YQbkmGvuQ6OM/S8t+rxqbOUZOp89I4ApCqZg7++6c/DzckLL2AcNkvy2Sg23AadTWG
         gd+0qmE7WcuhKJeZvCbsWr9vj17xaBCZKPxE4n3EpS28j4f8t774KDok9KV3pnmhGiBC
         jYXNoQZQqeLjG8tx7ms6YoxE89VSOcLflZTJ5YIamc1/UXqhv5WwelmUA6jK/thYyFM8
         XOpGxlJKr4nXQml8SYm0LE7yfoyL7TUjN1UiTmmuFK9p69x6/Q6wbKwhj8DxMESRb42Z
         szCTZLTTGURvWlAWKudDHFN9wKw3IMN4KUA2lqCz9n07WEJNrYaMNhpXbGeQjsTWhETT
         /qfg==
X-Gm-Message-State: AOJu0YxuBgEf3DarLzZh+5FYRGHA+BT0aXGc1INQI4HzVdgCPgAqkNGY
	Hyw5YXsRW0NRIKSCAKa8y3v6C/U7DeGC6tQVOb9KI03iFgHjv7lCEcEvLBhl
X-Google-Smtp-Source: AGHT+IG2LsdwAVJcZfGcEOcuM2vbAs2g9qsboUUPOup/StMoLh7mudwCoMgdRF66SAjXKWtVudbScw==
X-Received: by 2002:a05:6a20:2443:b0:1c6:8c89:88c9 with SMTP id adf61e73a8af0-1cf5e1ae57bmr25963811637.18.1726414067326;
        Sun, 15 Sep 2024 08:27:47 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::9c53])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944abc8dfsm2315909b3a.63.2024.09.15.08.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 08:27:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-wrapt: Add missing rdep on misc modules for ptests
Date: Sun, 15 Sep 2024 08:27:44 -0700
Message-ID: <20240915152744.2151595-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Sep 2024 15:27:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112300

Needed for 'this', 'abc' modules

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-wrapt_1.16.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-wrapt_1.16.0.bb b/meta-python/recipes-devtools/python/python3-wrapt_1.16.0.bb
index 056323cd39..398d2fa6b7 100644
--- a/meta-python/recipes-devtools/python/python3-wrapt_1.16.0.bb
+++ b/meta-python/recipes-devtools/python/python3-wrapt_1.16.0.bb
@@ -12,7 +12,9 @@ SRC_URI += " \
 	file://run-ptest \
 "
 
+# python3-misc for 'this' module
 RDEPENDS:${PN}-ptest += " \
+	python3-misc \
 	python3-pytest \
 	python3-unittest-automake-output \
 "

