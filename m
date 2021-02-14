Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
 by mx.groups.io with SMTP id smtpd.web12.11683.1613265554788153028
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Feb 2021 17:19:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=Mo/qpqTO;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.195, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f195.google.com with SMTP id e17so3624631ljl.8
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Feb 2021 17:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n4CBv0Xym0xJlRsRFNl33h2t0oyKIiEjN43I5tp0st8=;
        b=Mo/qpqTOCICMWIz6sROntEr4IJeD5alQqXiCtQj3J0GzwbpxXwEDtI/tAJ9RePU0lT
         BeFGuza+OeuvbXwNpP9jGcXAk10urM38aARUU6YtKxsR9GhGZh9wPrBy8rnwa9Iut9OO
         8Ergy7rdcpu6feqbhC3oO49vp5sI2NCs8SKrk4vku3qUlTcLm0ijAE+6EwjGvFfBEK/f
         /oScyDRXP3bGGt/b4DClTh8YIxWHGs6MMSlmV4o/kXfibFfX5ZQ62kLiX7miTPhb2USZ
         qncSJANk6QOFfqkb7yUinfqEhhFi7HygzykZYxciYxyFBx2ZJ9LIVGFjxcRjhiJ4OI/t
         2U+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n4CBv0Xym0xJlRsRFNl33h2t0oyKIiEjN43I5tp0st8=;
        b=EzeAWuqeEaN++HLXpUbSG2aQnBFq+2Tym8OuZoyNGA43a4KNdpPiatBmFAWlNHRlF/
         Qf14XBliE5rMqwl7ZSYAVVFamKImUSnr+wZj5xvtSeVvbGSPdmwo/qLIc28aYDOGD7hb
         v+O1cG8qifF0guTcJAWy8K09DRKivq1JcPs0mD7bHQUD45xV29zfKudWzfH/mw7soRUE
         SEm4CnI+ASc1Am5MgPRfu8Rle4H+NHl3IcRhFryqLG9UFXq6837TACf+nRoDY5dIIYiw
         smvkxJD3pFIXj4JcP793aFIIqZkySlGrQXBTmGNBrVJSBV7QzQ0Y5W9RxC9zx+L0zj0k
         UyfQ==
X-Gm-Message-State: AOAM531vW8i7GBTnsTgXuaxzGegToARBILY81QyubefLMW4ZR6aSQ4QA
	c+3WqObBK3KGeuG9BfzMoYjNUrDcrMrQwcVH
X-Google-Smtp-Source: ABdhPJzl+SqRtN5dLzJFnHxq/kUZYintLknmqWYp+VNBxxLHVLQed/9gfm+QelU/IEHxjQb+Jv3HTA==
X-Received: by 2002:a2e:721a:: with SMTP id n26mr5310197ljc.293.1613265552387;
        Sat, 13 Feb 2021 17:19:12 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id i2sm1742307lfb.66.2021.02.13.17.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Feb 2021 17:19:11 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-protobuf: update to 3.14.0
Date: Sun, 14 Feb 2021 02:19:10 +0100
Message-Id: <20210214011910.446840-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-protobuf_3.12.2.bb => python3-protobuf_3.14.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_3.12.2.bb => python3-protobuf_3.14.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_3.12.2.bb b/meta-python/recipes-devtools/python/python3-protobuf_3.14.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-protobuf_3.12.2.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_3.14.0.bb
index 03d0b0c60..3cf850d1f 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_3.12.2.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_3.14.0.bb
@@ -7,8 +7,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=19e8f490f9526b1de8
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "b4336acee38ebe915b6e72fe8c5bce7b"
-SRC_URI[sha256sum] = "49ef8ab4c27812a89a76fa894fe7a08f42f2147078392c0dee51d4a444ef6df5"
+SRC_URI[sha256sum] = "1d63eb389347293d8915fb47bee0951c7b5dab522a4a60118b9a18f33e21f8ce"
 
 # http://errors.yoctoproject.org/Errors/Details/184715/
 # Can't find required file: ../src/google/protobuf/descriptor.proto
-- 
2.25.1

