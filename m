Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web12.8464.1598431908305298833
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2020 01:51:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=Znv8aRt3;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.67, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f67.google.com with SMTP id b18so950714wrs.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2020 01:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mKkpnGDX0ZtUuxUIYJvW39vqMtglaQRvPlP8JPhKUSA=;
        b=Znv8aRt3kp/Ro8VLdcncX4Oc9V76a5GoenPkLcuHiXs7dzmMHw8BTO8z9Pfk2IuJEX
         XbeQcA7K73xDY64xC8DMLn1EWwp+4dBjji/NhyUEZ7Fv9evoLdxhrgdBsOJhkbqSZOr3
         MqJVweo+e4sC1HHUI6rO8tdQmYHKa/XhVNiW+7HNFga38XecgZk35gNbDfVr4kN4LC6i
         t1DsVQYickGEGjOVk6LDwoIZ+OnScL+31RMFZpFSndDVz/I9/t1nOw9VEcTMRtdNks6z
         SCU+tmRXkNjIHQ8cuWqTQXiWBdoQOaJTzjKN8Ali74794jZ/qMkFWN6nhS0uRa6qkoxu
         n0eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mKkpnGDX0ZtUuxUIYJvW39vqMtglaQRvPlP8JPhKUSA=;
        b=SnL8Zpeg4MvDOR6xJTFHzSZODCDna518pSYMn8JVhs8l3gn9Wo/7A5y8BWLTDxIssM
         SdlwleuZ4qqXn6IAwPOlsrGPP2B+tP3qystppCgwqebx5bzToMFRse8pTt+eSuKRg9yT
         vWDWyt8ylV2u1y1xgJOWK33Qpc693YHXu3RVAFmyushXEyRnT2bPcaSDEN/Bdf/rUAWo
         qwW1JpgiA4dRU2GrRzzjLa4n1eQ5WmcIZgK1RW64EGV2PQRAg7iGoqRWO48I1Ucd9nnZ
         nvJsqDxH6Nrz/JRk+i0UIlymS2ZUWWUZyVzWTI4GG/Nagtlid66cOggTehs/kbZ8tDJS
         sZeQ==
X-Gm-Message-State: AOAM532wt1Dw8K2tPd1tXqpvewytxgWU8vJuSjbFRtF/RaozBOwjRDm4
	LQiiyYzXfXp841Yy8UYLkeph7Q==
X-Google-Smtp-Source: ABdhPJzBAVF4X5TvNo2ML3LcTe3JkV+L68q/6J2ffqafvT0sqITBaSmdTVW7NpxPiNPdY4SkFL4Zyg==
X-Received: by 2002:adf:80c7:: with SMTP id 65mr14209301wrl.35.1598431906532;
        Wed, 26 Aug 2020 01:51:46 -0700 (PDT)
Return-Path: <brgl@bgdev.pl>
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id x133sm3935798wmg.39.2020.08.26.01.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2020 01:51:45 -0700 (PDT)
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [meta-oe PATCH] libgpiod: update v1.4.3 -> v1.4.4
Date: Wed, 26 Aug 2020 10:51:43 +0200
Message-Id: <20200826085143.22246-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This is a bug-fix release fixing the issue with reading line values for
bulks of lineevents.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 .../libgpiod/{libgpiod_1.4.3.bb => libgpiod_1.4.4.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libgpiod/{libgpiod_1.4.3.bb => libgpiod_1.4.4.bb} (80%)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.4.3.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.4.4.bb
similarity index 80%
rename from meta-oe/recipes-support/libgpiod/libgpiod_1.4.3.bb
rename to meta-oe/recipes-support/libgpiod/libgpiod_1.4.4.bb
index a6320da8e..a9a462866 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.4.3.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.4.4.bb
@@ -2,8 +2,8 @@ require libgpiod.inc
 
 DEPENDS += "autoconf-archive-native"
 
-SRC_URI[md5sum] = "d4826720a8de13379436f9c207237bc0"
-SRC_URI[sha256sum] = "0ad080d1eb89c422cf13001293ffa72869ca13028e85dab5f6b3ba90f88da46d"
+SRC_URI[md5sum] = "064c2627397e6641c52de09a26951112"
+SRC_URI[sha256sum] = "f1cda2789e6a13a92aefc012a76e5a7cc57a1b402d66f71df8719ee314b67699"
 
 # enable cxx bindings
 PACKAGECONFIG ?= "cxx"
-- 
2.26.1

