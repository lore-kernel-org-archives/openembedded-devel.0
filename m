Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web12.6738.1586035569807258642
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 14:26:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: straka.derek@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id y71so9586848oia.7
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 14:26:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=oA3VdJUaElyrti68PsZdcsQQWiUqZdXS5TY6EkaGpYI=;
        b=qGBaFuv9XpFNo5JlClm8XDvRVTpA/LGUTB2EanEDCZ8/OhaBR0N1bb2pMKVQe15hsF
         qXqlnvCx/tsO5lOCWDjVwWzi/v/MTyoP1o/k65RhuTWy5XxShXgwZrXJ3Zf0SZUKNH75
         SWeTaYIwTm0PO8qRzIkFLPpoEXZiJkCONoPml1jP4nG/2jgsYu88bNy60A0irnBtSCwu
         f2QcNAyx+l8FT0xk1Tc2tPNZSrNWgliVA6F0X4IF16iBNcFUSCYSnJDY3TwvRUqsn4lF
         csOI1d6XmYo+CzM2XLUVJcYmyca+uLbEQIKb564gQ0FXEBvbLeVeLFha1QxKQThsZd7f
         Anow==
X-Gm-Message-State: AGi0PuYWLTSf/RHh7k3xk3m7xiOyhAVBRTQZeWQqlWNj9e3GtnfCBHax
	VI3LG8yIwtnyrEbBdhWHUXDs5588XBo=
X-Google-Smtp-Source: APiQypJMI8UFv9kD0s2gD4OH5QYkOVyc16mWgxI69rAMKNpfJO9UgfbT1gX5DEm8WwT5SeX7JEi3dw==
X-Received: by 2002:aca:fc0f:: with SMTP id a15mr7921062oii.68.1586035568678;
        Sat, 04 Apr 2020 14:26:08 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id g72sm3183470otg.79.2020.04.04.14.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 14:26:08 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 2/5] python-pytest-asyncio: consolidate inc and bb files into a single bb file
Date: Sat,  4 Apr 2020 17:25:57 -0400
Message-Id: <20200404212600.25018-2-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404212600.25018-1-derek@asterius.io>
References: <20200404212600.25018-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python-pytest-asyncio.inc              | 13 -------------
 .../python/python3-pytest-asyncio_0.10.0.bb       | 15 +++++++++++++--
 2 files changed, 13 insertions(+), 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pytest-asyncio.inc

diff --git a/meta-python/recipes-devtools/python/python-pytest-asyncio.inc b/meta-python/recipes-devtools/python/python-pytest-asyncio.inc
deleted file mode 100644
index 9132c7452c..0000000000
--- a/meta-python/recipes-devtools/python/python-pytest-asyncio.inc
+++ /dev/null
@@ -1,13 +0,0 @@
-DESCRIPTION = "pytest-asyncio is an Apache2 licensed library, written in Python, for testing asyncio code with pytest"
-HOMEPAGE = "https://github.com/pytest-dev/pytest-asyncio"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://README.rst;md5=ae62268d207c73b615fbefddaf91a881"
-
-SRC_URI[md5sum] = "247a7ec32f24a185341327c42a0f85bf"
-SRC_URI[sha256sum] = "9fac5100fd716cbecf6ef89233e8590a4ad61d729d1732e0a96b84182df1daaf"
-
-inherit pypi
-
-DEPENDS += "${PYTHON_PN}-pytest-native"
-
-BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.10.0.bb b/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.10.0.bb
index 09f26f8d15..a7e963b044 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.10.0.bb
@@ -1,2 +1,13 @@
-inherit setuptools3
-require python-pytest-asyncio.inc
+DESCRIPTION = "pytest-asyncio is an Apache2 licensed library, written in Python, for testing asyncio code with pytest"
+HOMEPAGE = "https://github.com/pytest-dev/pytest-asyncio"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://README.rst;md5=ae62268d207c73b615fbefddaf91a881"
+
+SRC_URI[md5sum] = "247a7ec32f24a185341327c42a0f85bf"
+SRC_URI[sha256sum] = "9fac5100fd716cbecf6ef89233e8590a4ad61d729d1732e0a96b84182df1daaf"
+
+inherit pypi setuptools3
+
+DEPENDS += "${PYTHON_PN}-pytest-native"
+
+BBCLASSEXTEND = "native"
-- 
2.17.1

