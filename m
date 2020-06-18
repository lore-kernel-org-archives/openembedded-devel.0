Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.10175.1592494092657349914
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jun 2020 08:28:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gyD8Fp8E;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id r18so3038512pgk.11
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Jun 2020 08:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=lxdMTEmXo4u8+GYiVx+GaiVgRJBCw/mtebJK2NC/s78=;
        b=gyD8Fp8E6Mvaq3XJ6j/waPID3woaIPxubjSOW9vdPXq3Wv+oYcWWNzmaJjsDrHcpc+
         p1qgVO+80iEGCcN+48AF/EBQ8mWChS5vsVjS7Wbnl6ykoYYGRqcZ9JV0iFRGFWjIiAUj
         5ZA8rRFdMhwkLmeqO1wLyCaf4wN9hPB2TvIFIKVMC76O8+HLifdkNk0TCrORXb7pqbjq
         //kDdLwRW22GjDJozDUmVeXw4ZL26LWlminAWmCDp8+eqvG9En5PPbtjgIZLKQ+R0kG0
         fsrh6Vbe9GEhCdsW2VwcX7+7oD2UxffOubq2Dfsvq6+1P5Zog013bnGRVYsOEWfIlvNa
         DBQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=lxdMTEmXo4u8+GYiVx+GaiVgRJBCw/mtebJK2NC/s78=;
        b=PqiQ8CQnKZ7tRj2LEfCFIst2JL5b0wvE5Chby5WaqrGrWn+hCzZYBQgX8Ld1gNybqr
         jvn2lp+bOXpPesMm6UFQ4aacCAk4k1vOCgmR4d+GmDpKRNudT8RWqQUv0RjHB4SjOxAM
         vxdRF+6HH/MPtMMjsO1pWolKBoH4OYOGVIooyQl75F7fvPsA01OSzF5TSWFe/TYRg4XL
         Ao17AHHE8V91TMmYeH8vvzlcJEu6aGDrkmaUXfPc85roGCmRKwWviFLrDRQNfYoMYkKQ
         TF+x958BJXrx8Z33eR3l13j7uD+ymNsm50mERbMwLzrjm+E3jG5E3nr2USvRCKN+yrR8
         lDDA==
X-Gm-Message-State: AOAM533V8eLeXUGm9Ji0a2HsMfoj7WYbjDaCLJEyXGMghQu0TIuNEdzW
	XRMxs7AErup6uW7jAkTIaNZV5maP
X-Google-Smtp-Source: ABdhPJyPIu1aXaiDayqHDaj9SCejqN8iZZA6Wu/fx1i+q9PR04LHWap5Hgt9k/tLYNGXNvpYIlXpBQ==
X-Received: by 2002:a62:2cd7:: with SMTP id s206mr3942499pfs.305.1592494091915;
        Thu, 18 Jun 2020 08:28:11 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:88de:dadb:4f45:bd2e])
        by smtp.gmail.com with ESMTPSA id u24sm2800356pga.47.2020.06.18.08.28.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 08:28:11 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 4/7] python3-huey: Add package
Date: Thu, 18 Jun 2020 08:28:02 -0700
Message-Id: <20200618152805.13075-5-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200618152805.13075-1-akuster808@gmail.com>
References: <20200618152805.13075-1-akuster808@gmail.com>

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-devtools/python/python3-huey_2.2.0.bb      | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-huey_2.2.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-huey_2.2.0.bb b/meta-python/recipes-devtools/python/python3-huey_2.2.0.bb
new file mode 100644
index 0000000000..cac6be9547
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-huey_2.2.0.bb
@@ -0,0 +1,10 @@
+SUMMARY = "a little task queue for python"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5cac039fcc82f01141cc170b48f315d4"
+
+PYPI_PACKAGE = "huey"
+SRC_URI[sha256sum] = "15cef4225f7ae200fbecf89a0fed13e389fd751d6c8e1d3b26562b7df953de0e"
+
+inherit pypi setuptools3
+
-- 
2.17.1

