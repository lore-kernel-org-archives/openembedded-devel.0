Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web11.1518.1586020392955879772
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 10:13:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id 111so10748900oth.13
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 10:13:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=MC4Q3aoXaIZ8JiufEH+bhcVX4TbR5Zn75WG4IlDy5q8=;
        b=FKYRGskSt3CgFewlnK06r4Y8vKaRN7rsz4/goKZc64++q2y8TziFA1Bv9kZf09gqgX
         bB9Zdk18vC6zrppeCgwFBDq3Hzl3EP2/rjBo6NSosgGl9Oovv3xRjHCRNzlvSJYpt8wr
         +0pFySevdmqhAcBAGTC7wRYjCzreMKPsABj6WJ+nam4Gcg5PxXm3xJ1Q6vVheO6GCcox
         hlgTPTsDV0/xeZYNJBYCzG/eW7d3Ty5/+tVsll5YmB4e/Vl89Eaib0zz3Z7KLOUWcGpZ
         2B4Un/kfA+0xj358jDQov62/7FAUdiWxLV5VLaqT50hJ2KHAjZB4TdrR/qIX2At8pN1j
         gBqA==
X-Gm-Message-State: AGi0PubAkdC1Dibeh2wQKZSEPId8tpBZaqUcAUPdzfH4E04n8cBW3/rg
	8nfBFeR8+s5zemZCPYWHV8efWxS4ReE=
X-Google-Smtp-Source: APiQypKRkOIdjikySIDjN4gq5+0U6OWe76x08aR/kC32VVTu1/ECLcSN21oH56kLlQp4EKGe8q2mYQ==
X-Received: by 2002:a9d:6c19:: with SMTP id f25mr11366298otq.371.1586020391977;
        Sat, 04 Apr 2020 10:13:11 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id q12sm3054551otn.43.2020.04.04.10.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 10:13:11 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 05/27] python-term: consolidate inc and bb files into a single bb file
Date: Sat,  4 Apr 2020 13:12:29 -0400
Message-Id: <20200404171251.19823-5-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404171251.19823-1-derek@asterius.io>
References: <20200404171251.19823-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-term.inc   |  9 ---------
 .../recipes-devtools/python/python3-term_2.3.bb       | 11 ++++++++++-
 2 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-term.inc

diff --git a/meta-python/recipes-devtools/python/python-term.inc b/meta-python/recipes-devtools/python/python-term.inc
deleted file mode 100644
index 8a2df0e19f..0000000000
--- a/meta-python/recipes-devtools/python/python-term.inc
+++ /dev/null
@@ -1,9 +0,0 @@
-SUMMARY = "An enhanced version of the tty module"
-SECTION = "devel/python"
-LICENSE = "Python-2"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d90e2d280a4836c607520383d1639be1"
-
-PYPI_PACKAGE_EXT = "zip"
-
-SRC_URI[md5sum] = "ab0c1bce381b1109fe4390c56aa06237"
-SRC_URI[sha256sum] = "3dcc8c212e04700784e5c1c5b601916ba0549ae6025b35b64fd62144899e7180"
diff --git a/meta-python/recipes-devtools/python/python3-term_2.3.bb b/meta-python/recipes-devtools/python/python3-term_2.3.bb
index 372cffe047..723f1db512 100644
--- a/meta-python/recipes-devtools/python/python3-term_2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-term_2.3.bb
@@ -1,2 +1,11 @@
-require python-term.inc
+SUMMARY = "An enhanced version of the tty module"
+SECTION = "devel/python"
+LICENSE = "Python-2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d90e2d280a4836c607520383d1639be1"
+
+SRC_URI[md5sum] = "ab0c1bce381b1109fe4390c56aa06237"
+SRC_URI[sha256sum] = "3dcc8c212e04700784e5c1c5b601916ba0549ae6025b35b64fd62144899e7180"
+
+PYPI_PACKAGE_EXT = "zip"
+
 inherit pypi setuptools3
-- 
2.17.1

