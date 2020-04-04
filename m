Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web12.1519.1586020392470345035
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 10:13:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id f52so10758889otf.8
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 10:13:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=z8uJX4QAkXmdy5j6HHZMQUHQHCGmrxOpx4qWIhxRYRM=;
        b=hFBgDI/ZqUncJiE3Luj0Oof935xxS6EebYtJIfFsXwdi+Z9GHO/gPM3h1xiuZ+POhv
         +grO0tPxi9endZqIXUINECHqe8BdUfInEDPUNtu4tEdIfaZe+PVt/DiepesVaWbL8lM9
         K2gFPdrau10h94c33MsPHuezNlLWBgyp2X45Z8AtacFwVClw0g8ISd5+HNGG6+UJMWJH
         zgsjC2UXbozhaHdVKipA9YMzfjWpkTiDwY3kWntwP9Q0DylIQgK+5azFCkUSGUQ1+un/
         l28Li2uqBvqZ/BT2XgDQ9aapH18RFR/e0yfPY3MamQvQuEF9aADLMLlMcHDHXVaN7hLk
         lB6w==
X-Gm-Message-State: AGi0PuZ3k4VtrEBpSGuGoeZdjououFttzwbtUPHT11um1kUx1/z7rITB
	kNRcHJHj6ecPfrogvjWcAtndXyFRXJ4=
X-Google-Smtp-Source: APiQypI9WC63XOHpkMAMN533M+QrhT8c6FIkG6N5gJ7qyJE+FeqjPcPF2wY+g+puw3Oi3EoGw/Of6w==
X-Received: by 2002:a9d:5187:: with SMTP id y7mr10951547otg.159.1586020391328;
        Sat, 04 Apr 2020 10:13:11 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id q12sm3054551otn.43.2020.04.04.10.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 10:13:10 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 04/27] python-tinyrecord: consolidate inc and bb files into a single bb file
Date: Sat,  4 Apr 2020 13:12:28 -0400
Message-Id: <20200404171251.19823-4-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404171251.19823-1-derek@asterius.io>
References: <20200404171251.19823-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python-tinyrecord.inc                | 15 ---------------
 .../python/python3-tinyrecord_0.1.5.bb          | 17 +++++++++++++++--
 2 files changed, 15 insertions(+), 17 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-tinyrecord.inc

diff --git a/meta-python/recipes-devtools/python/python-tinyrecord.inc b/meta-python/recipes-devtools/python/python-tinyrecord.inc
deleted file mode 100644
index 981dc074fc..0000000000
--- a/meta-python/recipes-devtools/python/python-tinyrecord.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "transaction support for TinyDB"
-DESCRIPTION = "\
-Tinyrecord is a library which implements atomic transaction \
-support for the TinyDB NoSQL database. It uses a record-first \
-then execute architecture which allows us to minimize the time \
-that we are within a thread lock."
-HOMEPAGE = "https://github.com/eugene-eeo/tinyrecord"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://README;md5=31c1dc11b4ae83546538de4c16bceabc"
-
-SRC_URI[md5sum] = "e47dcfe299686cd3fa7ffaa7cb2ee8b1"
-SRC_URI[sha256sum] = "bc7e6a8e78600df234d7a85c2f5d584130f2c6ffd7cd310f9d3a1d976d3373c8"
-
-PYPI_PACKAGE = "tinyrecord"
-inherit pypi
diff --git a/meta-python/recipes-devtools/python/python3-tinyrecord_0.1.5.bb b/meta-python/recipes-devtools/python/python3-tinyrecord_0.1.5.bb
index 3f1b31f48b..65df2e1c33 100644
--- a/meta-python/recipes-devtools/python/python3-tinyrecord_0.1.5.bb
+++ b/meta-python/recipes-devtools/python/python3-tinyrecord_0.1.5.bb
@@ -1,2 +1,15 @@
-inherit setuptools3
-require python-tinyrecord.inc
+SUMMARY = "transaction support for TinyDB"
+DESCRIPTION = "\
+Tinyrecord is a library which implements atomic transaction \
+support for the TinyDB NoSQL database. It uses a record-first \
+then execute architecture which allows us to minimize the time \
+that we are within a thread lock."
+HOMEPAGE = "https://github.com/eugene-eeo/tinyrecord"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://README;md5=31c1dc11b4ae83546538de4c16bceabc"
+
+SRC_URI[md5sum] = "e47dcfe299686cd3fa7ffaa7cb2ee8b1"
+SRC_URI[sha256sum] = "bc7e6a8e78600df234d7a85c2f5d584130f2c6ffd7cd310f9d3a1d976d3373c8"
+
+PYPI_PACKAGE = "tinyrecord"
+inherit pypi setuptools3
-- 
2.17.1

