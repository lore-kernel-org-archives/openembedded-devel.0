Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com [209.85.167.195])
 by mx.groups.io with SMTP id smtpd.web12.3069.1586024483569063700
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 11:21:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.167.195, mailfrom: straka.derek@gmail.com)
Received: by mail-oi1-f195.google.com with SMTP id e4so9269425oig.9
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 11:21:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=fcTxMwoWCXBplGQ60ZVEABJ0sWDiWzk9adKNZ9UelG4=;
        b=nEMgBy6eiPNRPtG39RGw8YTHT1dxIMI6zUGXYB81/WZ3qXd+Id/hp6bkPwpB3dYV9O
         tTwnzLVy26A8QfFv297l97V5OcrFQ34Dq5Pin+0ahoNGOAf9FyEVYBXH4bK9YrtLypH1
         zYHm8IXzwNYd+FIZtqhUYiWzPskfK0yoQNwrgTW907SvgAejjua57E+yoZMMhom6q5Ts
         YB/u4ifD0yB6idHxW3LHgWXOLxDFszOKzeKHT+SHu/qYCHXzZ5vwXaLcuTyMWn5xVTYW
         xC0F/oWFvmGKXRZTGUcfrDzyNmiJFq+B5smnfy4egkOFXTYPPyKXwFK4RhB7PIGxRUbo
         YYkQ==
X-Gm-Message-State: AGi0PuY+YR/fM3dL12u9fISBN+vfYi5KEM3ErPWBdgQfApmkPQhxPG88
	gjz5hLLkMTopjWgI1CrWrfpoWuMq/2w=
X-Google-Smtp-Source: APiQypIMntQBkMBxnkDTb2URnAXR9n6YBEZqdle7aP9tpl0vD3pyGsro8XgzU22ISxzvXn4KoUQW/Q==
X-Received: by 2002:aca:2209:: with SMTP id b9mr7652851oic.103.1586024482703;
        Sat, 04 Apr 2020 11:21:22 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id j23sm3162059oib.32.2020.04.04.11.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 11:21:21 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 06/12] python-pyusb: consolidate inc and bb files into a single bb file
Date: Sat,  4 Apr 2020 14:20:58 -0400
Message-Id: <20200404182104.21027-6-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404182104.21027-1-derek@asterius.io>
References: <20200404182104.21027-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-pyusb.inc       | 12 ------------
 .../recipes-devtools/python/python3-pyusb_1.0.2.bb | 14 ++++++++++++--
 2 files changed, 12 insertions(+), 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pyusb.inc

diff --git a/meta-python/recipes-devtools/python/python-pyusb.inc b/meta-python/recipes-devtools/python/python-pyusb.inc
deleted file mode 100644
index e783dd4325..0000000000
--- a/meta-python/recipes-devtools/python/python-pyusb.inc
+++ /dev/null
@@ -1,12 +0,0 @@
-SUMMARY = "PyUSB provides USB access on the Python language"
-HOMEPAGE = "http://pyusb.sourceforge.net/"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=51691ed11cc2c7ae93e383f60ed49b0f"
-DEPENDS += "libusb1"
-
-SRC_URI[md5sum] = "862b56452c64948c787ad8ef9498590b"
-SRC_URI[sha256sum] = "4e9b72cc4a4205ca64fbf1f3fff39a335512166c151ad103e55c8223ac147362"
-
-inherit pypi
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-pyusb_1.0.2.bb b/meta-python/recipes-devtools/python/python3-pyusb_1.0.2.bb
index 1ecede7cf8..44c24f423a 100644
--- a/meta-python/recipes-devtools/python/python3-pyusb_1.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyusb_1.0.2.bb
@@ -1,2 +1,12 @@
-inherit setuptools3
-require python-pyusb.inc
+SUMMARY = "PyUSB provides USB access on the Python language"
+HOMEPAGE = "http://pyusb.sourceforge.net/"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=51691ed11cc2c7ae93e383f60ed49b0f"
+DEPENDS += "libusb1"
+
+SRC_URI[md5sum] = "862b56452c64948c787ad8ef9498590b"
+SRC_URI[sha256sum] = "4e9b72cc4a4205ca64fbf1f3fff39a335512166c151ad103e55c8223ac147362"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

