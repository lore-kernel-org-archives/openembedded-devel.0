Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web12.3070.1586024485665216884
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 11:21:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.49, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f49.google.com with SMTP id v2so10946927oto.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 11:21:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=JEtvVn1rz69KXiTAR/WSSbxbLHT5DHeN5uOle7R2+ok=;
        b=TZbYTGGhRSDktQPpLwIrvjkKO0csD3yD5+r+EUueXJPuML+VDPfpF7mDaZlQUFI/v/
         7QWqsjaDVNQJJwZJnqgRIHThPReuzUXL2HrdWEpeQGhi8o0UnM+WgcTVDSx9YGkH2saP
         Eg6kr7gaLc+FVTREqdlwkFcFXE6ngUlJ1db/IqMgppTdNoRH2BikqTn4haIRZwHpJJs4
         S0M5XEvi559lkIZV3dulgeEttuYsgWp7t7+88GwXfrkXBrTMC/AfnmX40lrqpfOjazG4
         PCSQ8ZY5dt7q3AYkTXYbFVirnToHQyUN0rD7sUN/1jR6OhOWumXvTTnBnHDHoU7+HGz6
         Z8fQ==
X-Gm-Message-State: AGi0PuZSK+7P77Fi0bS3Rjj/8EgqcfADdtv7Lukl5rhJZEjTSE+rcBk2
	xCfwDEbNppRO0JLQIejZP5+REW/Te2Y=
X-Google-Smtp-Source: APiQypLb5avL3nzL7YpJ2bmT4k4WlPGoLDlbBgucADo8W4GnmctVWgs3Sga2ghIsS/c+m964TEAj/w==
X-Received: by 2002:a9d:ef8:: with SMTP id 111mr6447507otj.94.1586024484700;
        Sat, 04 Apr 2020 11:21:24 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id j23sm3162059oib.32.2020.04.04.11.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 11:21:23 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 08/12] python-pytz: consolidate inc and bb files into a single bb file
Date: Sat,  4 Apr 2020 14:21:00 -0400
Message-Id: <20200404182104.21027-8-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404182104.21027-1-derek@asterius.io>
References: <20200404182104.21027-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-pytz.inc   | 20 -----------------
 .../python/python3-pytz_2019.3.bb             | 22 +++++++++++++++++--
 2 files changed, 20 insertions(+), 22 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pytz.inc

diff --git a/meta-python/recipes-devtools/python/python-pytz.inc b/meta-python/recipes-devtools/python/python-pytz.inc
deleted file mode 100644
index b4edea002b..0000000000
--- a/meta-python/recipes-devtools/python/python-pytz.inc
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY = "World timezone definitions, modern and historical"
-HOMEPAGE = "http://pythonhosted.org/pytz"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4878a915709225bceab739bdc2a18e8d"
-
-inherit pypi
-
-SRC_URI[md5sum] = "c3d84a465fc56a4edd52cca8873ac0df"
-SRC_URI[sha256sum] = "b02c06db6cf09c12dd25137e563b31700d3b80fcc4ad23abb7a315f2789819be"
-
-RDEPENDS_${PN}_class-target += "\
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-doctest \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-pickle \
-    ${PYTHON_PN}-pprint \
-    ${PYTHON_PN}-threading \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-pytz_2019.3.bb b/meta-python/recipes-devtools/python/python3-pytz_2019.3.bb
index 19a89dc55d..ffe336d2c3 100644
--- a/meta-python/recipes-devtools/python/python3-pytz_2019.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pytz_2019.3.bb
@@ -1,2 +1,20 @@
-inherit setuptools3
-require python-pytz.inc
+SUMMARY = "World timezone definitions, modern and historical"
+HOMEPAGE = "http://pythonhosted.org/pytz"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4878a915709225bceab739bdc2a18e8d"
+
+inherit pypi setuptools3
+
+SRC_URI[md5sum] = "c3d84a465fc56a4edd52cca8873ac0df"
+SRC_URI[sha256sum] = "b02c06db6cf09c12dd25137e563b31700d3b80fcc4ad23abb7a315f2789819be"
+
+RDEPENDS_${PN}_class-target += "\
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-doctest \
+    ${PYTHON_PN}-io \
+    ${PYTHON_PN}-pickle \
+    ${PYTHON_PN}-pprint \
+    ${PYTHON_PN}-threading \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

