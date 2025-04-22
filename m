Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F2ECC369D7
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 14:18:46 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.41083.1745331520097049265
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Apr 2025 07:18:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=lRj3ShC6;
 spf=pass (domain: konsulko.com, ip: 209.85.128.43, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43d0618746bso39923945e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 07:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1745331518; x=1745936318; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rNy41HD5YLGCdl5I2u188JZQQSNVxwauRDl3w9MrNtE=;
        b=lRj3ShC6Y7gk6O546U71qCiwkUY5uFk3xJdyuu2Ky6VHh8QsskL1/lLkLC4B8TN0QA
         csPo6kdQPYxB+GzD0Ub3xuRTodpwH/uIUA7DWuHUzfUpdhdkeN2ywRBvYYnisaDI2Zrm
         FuqyuCALbf++xA+xYM4NkuXEWF5vrRe+yp798=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745331518; x=1745936318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rNy41HD5YLGCdl5I2u188JZQQSNVxwauRDl3w9MrNtE=;
        b=FQoPz+upDgZG2XqSi66R+fcFSXfrLAtIwfg4pBS3/YJaggGwVOLKpBjcJiFXvj5/P+
         9BpDAGgnt2mqj1dGN4TMzScTGK6Dtz87ZEnNnsvUjWA9620U+PGXQneDLwI8Zu8ZeElK
         xcur5HYhOWQ1+DdlH/WTj7aFIqkvb9dIJiPYSCnJtOXBPpdlMsSpge8OJ88wn0Rw8H/O
         B+MMBpGzESusDABqYcHASX0UD3h3+57reN2GQ6RyS5MxF7r8+1XGmK1C0YJqqmY42cn+
         T2DbPRLRwVZWYdo2A7Kc+u4fRAULEDllOlfV9ofQvu28G7iowdKb7Ti4hsG0OyzG/1q4
         hrDA==
X-Gm-Message-State: AOJu0YwLJIX6L+FXwCeeI4FUU/MtGdyKlaYnz8biuANZf/rq+OrCDuKJ
	49t9KbbwLS9bpu6g+3oqzOB582YukJFt88IhB4AKDxcg+/y881lKgERWCRZzrRm1qCL0hWp/rOZ
	2
X-Gm-Gg: ASbGncui+gXjU9a17cDdbP8vuI2pG1B8OeJlOFecZpfrG95JIvfedRhNOxBwlAgaFti
	URbxRSMlnz3VghVs0ymqEVLc7RASLinlNTpLBJon2HcZVlLEacj1KbgCLZbooq40R1H7N0UGAkU
	y+1RFI6O+hlvLNp76QGif/m8GpyTtZjgfhiQH6YbC1aOx5IFpq6aEWv3MSqZPzL5keJ644YLG2X
	HCb/vhsSW7WuTGGjh65N3raJCZ1bahigEuP/nKEWmSw3uBt5st8M6mP9wbDcNBgURrMLnU1a29P
	4//6lZ0xVWyQUcsuy3RWNs316lB1oPlhwaw5lLsz/pRIqNJng5pv9OQ=
X-Google-Smtp-Source: AGHT+IHSVCla8Y0jholEEGaO4zoaudxt2PG5tcTGF6qmnWoDKoVnfefbl5haD+RxA9MxYg5xg9ladQ==
X-Received: by 2002:a05:600c:a363:b0:43d:2230:303b with SMTP id 5b1f17b1804b1-4406ac0a8b4mr126449175e9.20.1745331518383;
        Tue, 22 Apr 2025 07:18:38 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4408d04802fsm12388875e9.1.2025.04.22.07.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 07:18:38 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/4] python3-moteus: Upgrade 0.3.79 -> 0.3.81
Date: Tue, 22 Apr 2025 17:18:33 +0300
Message-Id: <20250422141833.862036-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250422141833.862036-1-leon.anavi@konsulko.com>
References: <20250422141833.862036-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 14:18:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117059

Upgrade to release 0.3.81:

- Set reasonable timing parameters for PCAN interfaces
- Don't barf when flashing firmwares older than family reporting

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-moteus_0.3.79.bb => python3-moteus_0.3.81.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-moteus_0.3.79.bb => python3-moteus_0.3.81.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-moteus_0.3.79.bb b/meta-python/recipes-devtools/python/python3-moteus_0.3.81.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-moteus_0.3.79.bb
rename to meta-python/recipes-devtools/python/python3-moteus_0.3.81.bb
index 4944e13ff4..bb8f572180 100644
--- a/meta-python/recipes-devtools/python/python3-moteus_0.3.79.bb
+++ b/meta-python/recipes-devtools/python/python3-moteus_0.3.81.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://setup.py;beginline=3;endline=9;md5=24025d3c660abfc62a
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "fae569f0c2e208059e081cf0fcca2e8f71c6c1de582836c745bb884af1e35bf4"
+SRC_URI[sha256sum] = "6f0f3b5ec38c044cf28546e4693b22644c3e9be7a1338933d20b67d0fd55eccc"
 
 S = "${WORKDIR}/moteus-${PV}"
 
-- 
2.39.5


