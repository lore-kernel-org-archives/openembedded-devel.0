Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.1495.1632356998706752526
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Sep 2021 17:29:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LGfL8Ti5;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id me1so3253221pjb.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Sep 2021 17:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QADuWnspF0petXwGD2HqQ0n8vwwHHXQECW2qwVvFsv0=;
        b=LGfL8Ti5zWYaUobB3bfkUNIDI0EyMYdanUfzxc2lKXMaMIGhlt2uacxEDdn3KslOao
         EubXeuVqzjRAsvz67tLBmNLZovlToKOCTCgIAdWOluntpWPLCcF1+IEbCEXqbpdIiem9
         1Rr+5R2L+SHEbggI/HlSSfqSDtI4CHaHrAYpKt7O1hhE4q7CmJM9eJFAcSWLMXaGStXj
         cDQXDhjdG2xO/7pEY8NG0eSNBi+fUaaZfrdfvPM2n/pZ3436JF0tx0bTI9Z2aAPLLfEU
         2MuhC8WYc01hMUlEfqEp+y6NWYfqTMNN7y7sZ0k+Tq1Xue+LsOgmDtE6ZME+cY0phLbM
         VNeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QADuWnspF0petXwGD2HqQ0n8vwwHHXQECW2qwVvFsv0=;
        b=gXqYZ5WISS9v9raR6+53FHtP8Y1k/m0pvszFktnQmMLISOL99ozWwaMHAWnW59cdE1
         8Xt6xYe+pQYkJqU6QklS978nwlsxUw/jk0LWZQKTLbr1h+oSY3k1xSVIgGe2I9wfLgwi
         Mun3mOOsAFkLLIERY2+GgdVDuED2I85JaTyzeqhzIcKX3rigknwfKSRxhNvun7Pk2D+6
         mhJvB9GRGvy/bZtpBTAurOY9HGGxvROYuo4GD7CNdsWjmHSKd+WoBkBrubXX5ofGtmt5
         mF1HzdHfZVVK9wukYQjUvw2gXK1v4bUSqAu3Plv2k5vvtWnhc+9iW2xOpJHYhUtf/vqQ
         iZpA==
X-Gm-Message-State: AOAM531oVhFUxh/Dr3jX+W6qurVR+Aj5nefnD3lilRCn2fAYi9qs7+z5
	yQqzSLBXIlcJuJwLetmRj+fSBUlI7T4iLw==
X-Google-Smtp-Source: ABdhPJzf0j5le+D28R+un5xasPdBz8UzVdOr9cBVDUHkWkS7lydQIvzIj+CXKuGaxZl3QdejvfI8nQ==
X-Received: by 2002:a17:90b:1c92:: with SMTP id oo18mr14680555pjb.56.1632356997903;
        Wed, 22 Sep 2021 17:29:57 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id i5sm6713519pjk.47.2021.09.22.17.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 17:29:57 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] libldb: Inherit pkgconfig
Date: Wed, 22 Sep 2021 17:29:54 -0700
Message-Id: <20210923002954.637162-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes linking errors
| ../../lib/tevent/tevent.h:1446:8: error: unknown type name 'pid_t'
|                                    pid_t *pid,
|                                    ^
| ../../lib/tevent/tevent.h:1525:8: error: unknown type name 'pid_t'
|                                    pid_t pid,
|                                    ^

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/libldb/libldb_2.3.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/libldb/libldb_2.3.0.bb b/meta-networking/recipes-support/libldb/libldb_2.3.0.bb
index 719353058e..f1b8cd6067 100644
--- a/meta-networking/recipes-support/libldb/libldb_2.3.0.bb
+++ b/meta-networking/recipes-support/libldb/libldb_2.3.0.bb
@@ -34,7 +34,7 @@ LIC_FILES_CHKSUM = "file://pyldb.h;endline=24;md5=dfbd238cecad76957f7f860fbe9ada
 SRC_URI[md5sum] = "fe4b1f17f77e2ea52b4e1320d927844c"
 SRC_URI[sha256sum] = "a4d308b3d0922ef01f3661a69ebc373e772374defa76cf0979ad21b21f91922d"
 
-inherit waf-samba
+inherit pkgconfig waf-samba
 
 S = "${WORKDIR}/ldb-${PV}"
 
-- 
2.33.0

