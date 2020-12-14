Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web10.746.1607971377613150256
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Dec 2020 10:42:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iKNPvoDg;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id b9so12612432qtr.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Dec 2020 10:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v0x83fuRaUt3BBrAETt+HyUBA557UO8zYdrKMpFf6Qw=;
        b=iKNPvoDgHkI9t66pkuONywRRKLd8nPNVduP3ZslhAqF7OwOOfqnlUg2woXOWtGsgh/
         2IRR4V0ry4r6bjG6gR6Z9Q3EG6SRJaPgVuO5YB/wkdwcNSr7eq3RYFrD8F8oiHXVJ7rW
         z4q7Ovdwl8X2VnGUAgEXzoL8khW0N96Md4D4jJN4dCHdqEJV3T/0Ti2svRXdJ1PgPZFk
         sqn9U6VVSDJ8+p7LWztIs2V8sHM+8RDO14Gznm0VtzLz60CzkcDsLf4XRKVQJ2pzlXJb
         p7mqOmTzrr5mfLaPCTJsEAMGVEBOxNc5oLlOyTAiH7WJq3GthMH9wEz9aA0inhPu/X2f
         GgGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v0x83fuRaUt3BBrAETt+HyUBA557UO8zYdrKMpFf6Qw=;
        b=ko2TXo0n9N9ulY9TZotT+TBND5L+ZsjL2DvP77Bf06XiGOjVkBFuZx1qOQFXR3FFKX
         7t/fMa4v5R9XhdEWeiIU05R0UZvgBJykZu8Ml+IiWMvIdG2Fmlo60p44X5wExrtcntoS
         BMag5dxzkwN7xvX9H/ndeY6cS0EZSAiepXI2JDUdJcbzOCN/9vuF/ydrx+rfDiOxb+dy
         CeDt7e/zsdB6BnuHFhB7GbIliUHFjy/SWlBcmpcx1iMLrvPY+v9e4XGeKRgNwr3OeWTh
         wwJftPX9cZdV/U/Y5ON8a/2RdVX+/oLM//LBWiTNFosII8JDqlCFTVYtFGvZveW4nwdk
         kp0w==
X-Gm-Message-State: AOAM532cbbyO8jBA4PERDNhXe4ByeG1jVrAvflUqLNU0ife3Q9HPTScJ
	zEgZfQEY3PjGxI1YPXFut33XnBMskyzhog==
X-Google-Smtp-Source: ABdhPJxoVbsuOB+LVoVWL+nG6kdJlp0LdGbvMherHashUrndf+g7TFNlBK/T+no7KjEebuT/wf/BZQ==
X-Received: by 2002:aed:2d65:: with SMTP id h92mr31559207qtd.263.1607971376465;
        Mon, 14 Dec 2020 10:42:56 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.cable.comcast.com ([2601:646:9200:4e0::64a3])
        by smtp.gmail.com with ESMTPSA id m10sm14864483qtg.52.2020.12.14.10.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 10:42:56 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] redis: Update to 6.0.9
Date: Mon, 14 Dec 2020 10:42:51 -0800
Message-Id: <20201214184251.353899-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214184251.353899-1-raj.khem@gmail.com>
References: <20201214184251.353899-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-extended/redis/{redis_6.0.8.bb => redis_6.0.9.bb} | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta-oe/recipes-extended/redis/{redis_6.0.8.bb => redis_6.0.9.bb} (94%)

diff --git a/meta-oe/recipes-extended/redis/redis_6.0.8.bb b/meta-oe/recipes-extended/redis/redis_6.0.9.bb
similarity index 94%
rename from meta-oe/recipes-extended/redis/redis_6.0.8.bb
rename to meta-oe/recipes-extended/redis/redis_6.0.9.bb
index 14091b565c..50571ed550 100644
--- a/meta-oe/recipes-extended/redis/redis_6.0.8.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.0.9.bb
@@ -18,9 +18,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://riscv32.patch \
            file://ilp32.patch \
            "
-
-SRC_URI[md5sum] = "70113b4b8ea7ee4c7e148be62b5d1e0b"
-SRC_URI[sha256sum] = "04fa1fddc39bd1aecb6739dd5dd73858a3515b427acd1e2947a66dadce868d68"
+SRC_URI[sha256sum] = "dc2bdcf81c620e9f09cfd12e85d3bc631c897b2db7a55218fd8a65eaa37f86dd"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.29.2

