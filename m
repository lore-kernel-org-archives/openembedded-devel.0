Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
 by mx.groups.io with SMTP id smtpd.web10.1753.1613001911836728551
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Feb 2021 16:05:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=XKidx0gU;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.194, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f194.google.com with SMTP id u4so5269083ljh.6
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Feb 2021 16:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SCCJ2IACkf2OkdqmJnW9wXG5/9craYB2b93AKvHfUNs=;
        b=XKidx0gU3BSzauFBg+EFe0LBXG8BHnsmZphkew+qkqS0XpfMOZe2b2CUBTXjXna1ek
         wCjbDoGPz7fZv2kwNfrWnTk/IR+gtA1S4Rhogjxg46KJcC5A3pQ7WN+vgqMzcc1WrzGa
         n4RiXhnDjFOGobQMeZH6Xf7HZtpDrjV9kYI0vxr3RieK3aq2xeKwwc0Sy6hkrMVTJsJK
         7niSwqNw0w/uhgzuPo6ajW9rd2jO6QCPUT6YfvibIEPblU1cvKokWoPs+4DX/VMrzkTF
         +/86UysQurljAZvPE5QJhEgZTs1+QM026nGgRE+IqgjjRp70ac6O1VBVHvS+A2Hpzmjn
         et9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SCCJ2IACkf2OkdqmJnW9wXG5/9craYB2b93AKvHfUNs=;
        b=S90EhCBMvgAF0MkAsAEVNDq05hPEaY2wBPS3ecMrRVb+WHV9JLOBX0sTUogTDvdnrv
         VPueXM0cEO6uwMFTgxPlh7JGBRA7pJU0RSjLRh0KfH+Pcwb4oqQ7La9Z83pFxjsf86V1
         VL++Aa7MI65ILMQwCk1gKD93TRkSqVjxwL1bOutz2HBOYgOzZ38ChymOHyzlyqDQ3IeC
         /Vl4plMcl0nGibBJfH1sjSVvAzJnkvrjZ8RYFslCj7nEjV8Dq2QCn0tqleGSm7aiddkR
         c40b1aw/9mjoD2SXbjmsWZLXoWJ3adxbw/0agTrPDZa4j9ahQJGn8lJe4ttYMQg+/+Gu
         ztpA==
X-Gm-Message-State: AOAM533aUTp/n07Evgq3u8HanGKUvtr+2AClIfhgV1beu2NjZDBFnER3
	Q9fvaSFhgrqx8zz+S0sYozL256ZAy/KiwfjL
X-Google-Smtp-Source: ABdhPJwFgS/4gdmCS9bpTgLJY2ZzyRZpVOa+hPEowRUe/EyeZfM0z8btjEO0UmlhPc1y2Vpawlgg4Q==
X-Received: by 2002:a2e:b814:: with SMTP id u20mr3225872ljo.446.1613001909019;
        Wed, 10 Feb 2021 16:05:09 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id i15sm304040lfj.7.2021.02.10.16.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 16:05:08 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python[PATCH] python3-pika: update to 1.2.0
Date: Thu, 11 Feb 2021 01:05:06 +0100
Message-Id: <20210211000506.1922438-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

License-Update: copyright year.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../python/{python3-pika_1.1.0.bb => python3-pika_1.2.0.bb}  | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pika_1.1.0.bb => python3-pika_1.2.0.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-pika_1.1.0.bb b/meta-python/recipes-devtools/python/python3-pika_1.2.0.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-pika_1.1.0.bb
rename to meta-python/recipes-devtools/python/python3-pika_1.2.0.bb
index c61d47c47..9f275b301 100644
--- a/meta-python/recipes-devtools/python/python3-pika_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pika_1.2.0.bb
@@ -6,10 +6,9 @@ including RabbitMQ’s extensions. \
 SECTION = "devel/python"
 HOMEPAGE = "https://pika.readthedocs.io"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=535836bf0a5de515a7bfee026075701d"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=278bdfee5b51616941c1f6b2f1cfcb99"
 
-SRC_URI[md5sum] = "6002400cdd33bf85ec8680ece72910d4"
-SRC_URI[sha256sum] = "9fa76ba4b65034b878b2b8de90ff8660a59d925b087c5bb88f8fdbb4b64a1dbf"
+SRC_URI[sha256sum] = "f023d6ac581086b124190cb3dc81dd581a149d216fa4540ac34f9be1e3970b89"
 
 inherit pypi setuptools3
 
-- 
2.25.1

