Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D44CAC4708E
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:58 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.21345.1649623505302103274
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 13:45:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=7uXU7brY;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.54, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f54.google.com with SMTP id d40so15857652lfv.11
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 13:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mv9g0PiG8BBr1Hy3yL747flzBIz0POS1Dkn1gOQZz5I=;
        b=7uXU7brYi1QFUA4lMJjTn+EENnOYlD6Md8qI2zOqyyZoKjMDL4ozoGOyiLAitaiRB0
         I7uY9CaNY83NWGzSK6OZ2SfjJmbmmaGHzUlrIH+QQ/RLoglWmUD0+KLSa3fc9VXw9+AG
         NFfCXZb6tqILu8DRNFZn2LjBJO3hjuy+RdZt1aw7d08Qp1wsGLRktjFIwDImi2Uh3Ay7
         mSFNCqR8po2Vt65CQSCwjLDCl8djGlBdy1ShuZIK8XMCgwqmOHl+Rx8vK+YaDs2iPGkJ
         YV/314cBHeL7ANY70GN/xrKmS7lqEerdpodqWAzOFjTVWTX4kgUeOM0RBzo8eDaepTrb
         Yuxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mv9g0PiG8BBr1Hy3yL747flzBIz0POS1Dkn1gOQZz5I=;
        b=tOAaI1wFIyZA+i5oJMfWuY8rn9xqrGQAsIsRcyBbhF0M+RZ7tFNrn3RmAqhmssdBoe
         cVwOFxTLNkBh7ma1JKL/yoNwJdSR29JIWQLxaHsiZx2juqdTb5q4NTglZs7aBkxvzYz4
         1+WwQOtuMqHWgdj+S8elnCThsMDASgUhSWpI9xFGN49Ivt2gqThN4w0T5HD0oeXdYARs
         lP35Zk1o5b3zNjvTN/gXN11zS5rm6iucslz06A+Dtt4LgsiOXvDFEZfvrsP364HlKprp
         BgJg6PoTQMC5W/H8XYjUlVpE5QWEyb1dM6GrbFCj3JeWdhdiRMqq8EYNXtz3NrgzN6pp
         H5DA==
X-Gm-Message-State: AOAM532b6CeAJzst1lbkG/JUjXY5HCY3Nz5zM0mH0m0XKvvJqgJkDTvk
	e9LtbfVnjXUXOTio8SU+Eb78dfpcQdrpqNO0
X-Google-Smtp-Source: 
 ABdhPJzRsbNLQnW5DK3/hlT5WNkAVHroecKWRFG0tkPaUYt1ifdLzdqZAejE9yjBA9J2FKqVO0lVGg==
X-Received: by 2002:a05:6512:3d24:b0:46b:9f95:9e57 with SMTP id
 d36-20020a0565123d2400b0046b9f959e57mr3598824lfv.246.1649623503095;
        Sun, 10 Apr 2022 13:45:03 -0700 (PDT)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 n15-20020a2e720f000000b0024b5810649bsm608411ljc.40.2022.04.10.13.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 13:45:02 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-can: update t 4.0.0
Date: Sun, 10 Apr 2022 22:45:01 +0200
Message-Id: <20220410204501.4048018-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96532

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../python/{python3-can_3.3.4.bb => python3-can_4.0.0.bb}      | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-can_3.3.4.bb => python3-can_4.0.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-can_3.3.4.bb b/meta-python/recipes-devtools/python/python3-can_4.0.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-can_3.3.4.bb
rename to meta-python/recipes-devtools/python/python3-can_4.0.0.bb
index 4fe7bcbff..2cd2e624b 100644
--- a/meta-python/recipes-devtools/python/python3-can_3.3.4.bb
+++ b/meta-python/recipes-devtools/python/python3-can_4.0.0.bb
@@ -3,8 +3,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI[md5sum] = "305075968c56bd85130b19d86e9e505d"
-SRC_URI[sha256sum] = "2d3c223b7adc4dd46ce258d4a33b7e0dbb6c339e002faa40ee4a69d5fdce9449"
+SRC_URI[sha256sum] = "59d92846ffb981e634e9e0f2d14a6b4967a875e3869bd2ba168c92c4db6b8b5d"
 
 PYPI_PACKAGE="python-can"
 
-- 
2.25.1


