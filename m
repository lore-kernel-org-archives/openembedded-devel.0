Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.1181.1615569010350912464
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Mar 2021 09:10:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=Pz4jhLMF;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.53, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f53.google.com with SMTP id v9so46915856lfa.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Mar 2021 09:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=E7RKwidgec/BFmUXtUkGULMR8TKciJBcMMbxT61VIXQ=;
        b=Pz4jhLMFPueb+1tfiVyhau4Lp5uOV665sszHMwt5O3hVXf3YWJ1ZCQv0L2RRKlTafV
         fuJP2LWt5o21Uj2nLERZx8dFxaXzYniCwxUEN3fKLgWfwMRSCHJYzkpJc32dk96heNwN
         sM1IiaonDbea0s4nWa13tFogaBKVmFpRLiis/5kw5Is9rPFXcjv6oV+bwPnXa/O1N/08
         9WqzWHMndx19JZ6jPrwQlcrkaa9pHOJyOJTquUJ1RfbOqcICaa/mfcpPg2Uoeh9KBrgH
         xYuzXbwP+X71rlrqs2fpsVoWjr05ySoVkTZYOFr1tHlqQhHpUaX1SnElPw8aS1s5TJFY
         0L+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=E7RKwidgec/BFmUXtUkGULMR8TKciJBcMMbxT61VIXQ=;
        b=AQGCpss+YvbcteheyUFyfXvzFkyejzG4HsiLgqG3q87sr4I6O5artiYL/Q1mE7D57c
         KtulZFoyssFVFdKhhUPmfOv/qbOBBoWDtjCyYncKC9NBR5Xj7TFmsAZcCIAuh2aqTAo7
         JLpcz9iVfvCR8uIBRWVOt/iCvA3avK4no6WpiomEUTNYoE9F8CvtyG3Rn6C+IgtbUjvH
         JSztxLXA7kOCwgorHHgBy92o9dh3J+pNkIJHHcLWxPYmRaafavhUQPHHVg3T1B1qRny4
         C5ksYYSVIwekFmPDNIbgt7VL+vIboYEeUo6rRwOeeZulkOeT9OqCiNvFZn2ZrlBZotmD
         79Ww==
X-Gm-Message-State: AOAM530VQUltln4M/B9gpzaCL+19IQsSOojbZNatfrSDwBZtnR+3Yo5f
	+pcJoRSkByaFWez1zw2yX/tJfohiN46Hv+C4
X-Google-Smtp-Source: ABdhPJy0A+BL9MgbMh1zI8fm8/3v33F3Kf5l5oS0ylInr8fGEp9cA/nmsdRdFwNpW8O9LoDvcp4xLA==
X-Received: by 2002:a05:6512:304a:: with SMTP id b10mr113175lfb.399.1615569008308;
        Fri, 12 Mar 2021 09:10:08 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id k18sm1753606lfm.88.2021.03.12.09.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 09:10:04 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-robotframework: update to 4.0
Date: Fri, 12 Mar 2021 18:09:52 +0100
Message-Id: <20210312170952.567998-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...-robotframework_3.2.2.bb => python3-robotframework_4.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-robotframework_3.2.2.bb => python3-robotframework_4.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-robotframework_3.2.2.bb b/meta-python/recipes-devtools/python/python3-robotframework_4.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-robotframework_3.2.2.bb
rename to meta-python/recipes-devtools/python/python3-robotframework_4.0.bb
index 10f031c7b..6cb8643bd 100644
--- a/meta-python/recipes-devtools/python/python3-robotframework_3.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-robotframework_4.0.bb
@@ -12,8 +12,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 inherit pypi setuptools3
 
 PYPI_PACKAGE_EXT = "zip"
-SRC_URI[md5sum] = "ac6b77c223821856e8ac077acf5a7c1d"
-SRC_URI[sha256sum] = "a0786a916d0572bd9d6afe26e95c6021e3df5dcafa0ece6b302e36366e58c24e"
+
+SRC_URI[sha256sum] = "a02a6f4af3b0830e4396058694c333cb63eb47f50acf6723be34f0f7a4d73ad7"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-shell \
-- 
2.25.1

