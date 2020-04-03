Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web10.6857.1585948924743414563
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Apr 2020 14:22:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id f52so8813144otf.8
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Apr 2020 14:22:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=/TloFVgovD47rDkepH6tEhqunvtiuBNZ5IHEbSi/QjA=;
        b=hDK/p80C6YtuSX2eFZZhpex1bhOZNTfrayE7IeRKz36OKxohsClYAzBsProLBIKc86
         ZEaFblNpXybiHMr2HeYkzteDYZILLudGJP//wbHElouzaPG6Vs7UmQ0BiaUTwB5YO691
         PLkmi6oho7zzlMRa2nQrfx+jMUdSnQLwCNtRUysPPsEuuK+V5EF8FMNpw1m5IixAsOCy
         rsbgJBhc6IlEP4Rc84uXekynGmyB7k++SJLH31fxxKf8erfqmW6svpgCjiM4FkVsBYcF
         PCgizC4r4A6MFA/nK12V5B1vRADakfgZ5fAFcr25hYG8MHBXw3YXx8JDgToSAoxMAHx7
         +Nbg==
X-Gm-Message-State: AGi0PuaMHbNzhQRAnUjB7yY/uzzJCaUUDT65lLxGxf5/yCQDiFGYxSGp
	CWfps/aQ/povpMVwrKuNMe9TcwrL+VE=
X-Google-Smtp-Source: APiQypIuyw26P43A0+hJKZHFw1lua17oZ93QbfqLO+ng3/8eBTe+2QpZI8Dn6zeHPmKRohhshHQ4wQ==
X-Received: by 2002:a9d:1904:: with SMTP id j4mr8294384ota.37.1585948923382;
        Fri, 03 Apr 2020 14:22:03 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id a76sm2344771oob.5.2020.04.03.14.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2020 14:22:02 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 01/10] python-bitarray: consolidate inc and bb files into a single bb file
Date: Fri,  3 Apr 2020 17:21:11 -0400
Message-Id: <20200403212120.23481-1-derek@asterius.io>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-bitarray.inc     | 11 -----------
 .../python/python3-bitarray_1.2.1.bb                | 13 +++++++++++--
 2 files changed, 11 insertions(+), 13 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-bitarray.inc

diff --git a/meta-python/recipes-devtools/python/python-bitarray.inc b/meta-python/recipes-devtools/python/python-bitarray.inc
deleted file mode 100644
index 32da348c41..0000000000
--- a/meta-python/recipes-devtools/python/python-bitarray.inc
+++ /dev/null
@@ -1,11 +0,0 @@
-SUMMARY = "A high-level Python efficient arrays of booleans -- C extension"
-HOMEPAGE = "https://github.com/ilanschnell/bitarray"
-LICENSE = "PSF"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=dc301a25ebe210dcc53b0a2d5a038eae"
-
-SRC_URI[md5sum] = "a46bf869f6adf34f5b0dc82b469793b7"
-SRC_URI[sha256sum] = "2ed675f460bb0d3d66fd8042a6f1f0d36cf213e52e72a745283ddb245da7b9cf"
-
-inherit pypi
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-bitarray_1.2.1.bb b/meta-python/recipes-devtools/python/python3-bitarray_1.2.1.bb
index 7ee444dc9e..2bf2937d1d 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_1.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_1.2.1.bb
@@ -1,2 +1,11 @@
-inherit setuptools3
-require python-bitarray.inc
+SUMMARY = "A high-level Python efficient arrays of booleans -- C extension"
+HOMEPAGE = "https://github.com/ilanschnell/bitarray"
+LICENSE = "PSF"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=dc301a25ebe210dcc53b0a2d5a038eae"
+
+SRC_URI[md5sum] = "a46bf869f6adf34f5b0dc82b469793b7"
+SRC_URI[sha256sum] = "2ed675f460bb0d3d66fd8042a6f1f0d36cf213e52e72a745283ddb245da7b9cf"
+
+inherit setuptools3 pypi
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

