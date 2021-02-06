Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web08.13779.1612652662262133877
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Feb 2021 15:04:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=1yhS98XJ;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.196, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f196.google.com with SMTP id f2so12028705ljp.11
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Feb 2021 15:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mONqSQXrC0frEsMuFq9o8zMEqtzGel0XzYyJ1fM6Bmc=;
        b=1yhS98XJkb30+shjD2DGBqRb5Wd5Tm2TxhZhEy3x/T9dLo8lAIzL5cdZXyb7H6XoD9
         9o6VEsgXDBMYi7FDyXBtJO2zfnj+LZ8P1cMqz7qV618/+BSQVtpwes7i5/2iJAQBi/ca
         UMDOKxl6QfBQfRB2vByBpYc64mvPD5kESSpeZp69mD0wjSkJDFWD69w9iMvpDFOA4Yej
         7FI1cp1ExaYkPaqoss+BiYJM37VLGRiKcclak+UCjotaeMNWOrO5FuFf2ZjkHncexgQk
         bR6M3p+juewK61c6Rueg494eAwM7fuDkslaDisMQGm6lvmV4epJvjkTtzxAIy/ZIBFoM
         NiAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mONqSQXrC0frEsMuFq9o8zMEqtzGel0XzYyJ1fM6Bmc=;
        b=Pz/u87smYGgk+Yz1qdMVkjSs5AiJSXBgxts1Y/rdx04VnZizMYokF0/Zm1S1W/Q4Qi
         vzTnRmGA6HJcnjVmHqGR6NaAX0TBaY7XdcvZj/qx81dR5L7sEqUc+RotPt1VLtxabsha
         a12ATYzXrO/fMUNAHLHLM0tPP3JIeoc8eY6ab+6kaNFxTiJ3op4MVA5m85snXwRar0jX
         qwEwOrwcmQVP37y6MZ4pm510GZttkuinD99SgMtAbnOTInPzw40pumR2mfdT7B6uX68m
         Fd7vghhg6fouRaVE9IKNzSmmSuCR+gRXOxjNqlE/NPzodl6jGpbD6KyhWqlss7RPGTgR
         jCeQ==
X-Gm-Message-State: AOAM5315lY3bOfLvPd2wjEMNekSmgVjgmDCr3BsqxtyhOMZSOU38Ml9K
	8ghEuvAtWWdYS1+9nr6rgfZRvqYJyTiMoDqI
X-Google-Smtp-Source: ABdhPJzTVwV+0Ni4XBeUG14rh6Pt5Ne91c4NrJZxuCATx8I+ZhdxSyXjbkNKtzQFK4xqFV/8NVMwHw==
X-Received: by 2002:a2e:5c46:: with SMTP id q67mr6787635ljb.358.1612652660079;
        Sat, 06 Feb 2021 15:04:20 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id x25sm1471110lfc.298.2021.02.06.15.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Feb 2021 15:04:19 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-twitter: update to 3.10.0
Date: Sun,  7 Feb 2021 00:04:17 +0100
Message-Id: <20210206230417.4106536-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-twitter_3.9.0.bb => python3-twitter_3.10.0.bb}    | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-twitter_3.9.0.bb => python3-twitter_3.10.0.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-twitter_3.9.0.bb b/meta-python/recipes-devtools/python/python3-twitter_3.10.0.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-twitter_3.9.0.bb
rename to meta-python/recipes-devtools/python/python3-twitter_3.10.0.bb
index 01bbf831a..94fd65649 100644
--- a/meta-python/recipes-devtools/python/python3-twitter_3.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twitter_3.10.0.bb
@@ -4,8 +4,7 @@ DESCRIPTION = "Python module to support twitter API"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
 
-SRC_URI[md5sum] = "b5bc640fa9f6baff6471c127aba1fec0"
-SRC_URI[sha256sum] = "bfd19a5c11f35f7f199c795f99d9cbf8a52eb33f0ecfb6c91ee10b601180f604"
+SRC_URI[sha256sum] = "76e6954b806ca470dda877f57db8792fff06a0beba0ed43efc3805771e39f06a"
 
 PYPI_PACKAGE = "tweepy"
 
-- 
2.25.1

