Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web11.2989.1586024479908965726
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 11:21:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: straka.derek@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id m14so9341392oic.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 11:21:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=58KpFCiJ1LmVmsCwixQzX2j/kIMce4b96taXgu4y0lA=;
        b=XvSs2RLMVlEzpEqtXhbckcOcu0sPINsddVDHQMcL1qg0rj/tsexa5VuyPrZDpX/RAW
         hdrHt2mldTCK43pLUSCeEwV0xt/xJAAOZcvHRQefbRH2DKKk71+sj9KPPtnZxiX1v+A3
         bcy4DV8x2XYhJlDR//hWbGGMxvhwoO82NPee2OuszjTkdDjNMLnHMe3zaA2knBZx7/iW
         cq2pTwZC714PMJNHqZZm8cxFh0raXOcfDLhMwmhA0xvb9IcbCozvoK76YJlSehlcnXY1
         2QVMZIJMZv+bm+i5G40WrhR+M9vdr338dRSR2HLvyQVKjEle+ieUMY0a0Kd2bZ0DRce9
         kybA==
X-Gm-Message-State: AGi0PuY/4Ieuvzcr/WxHj6Q8s9iVigmyWMdXu3Z5dxM5E5eWJUIv+kj/
	nD4G2aaqWVQP+I2RQsRAQshqiszfn/Q=
X-Google-Smtp-Source: APiQypKoXo8eb0JvetfNTt9CyjNH4B+zA4laizmWqTA0XaSet0nZ+bzGHxlHYtuzonQ8LUldjTV2RQ==
X-Received: by 2002:aca:5109:: with SMTP id f9mr7192970oib.14.1586024478991;
        Sat, 04 Apr 2020 11:21:18 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id j23sm3162059oib.32.2020.04.04.11.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 11:21:18 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 02/12] python-rdflib: consolidate inc and bb files into a single bb file
Date: Sat,  4 Apr 2020 14:20:54 -0400
Message-Id: <20200404182104.21027-2-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404182104.21027-1-derek@asterius.io>
References: <20200404182104.21027-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-rdflib.inc   | 15 ---------------
 .../python/python3-rdflib_4.2.2.bb              | 17 +++++++++++++++--
 2 files changed, 15 insertions(+), 17 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-rdflib.inc

diff --git a/meta-python/recipes-devtools/python/python-rdflib.inc b/meta-python/recipes-devtools/python/python-rdflib.inc
deleted file mode 100644
index 2fa6d98153..0000000000
--- a/meta-python/recipes-devtools/python/python-rdflib.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "RDFLib is a pure Python package for working with RDF"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=68c1a3bb687bd63b8e5552f3ea249840"
-
-SRC_URI[md5sum] = "534fe35b13c5857d53fa1ac5a41eca67"
-SRC_URI[sha256sum] = "da1df14552555c5c7715d8ce71c08f404c988c58a1ecd38552d0da4fc261280d"
-
-inherit pypi
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-isodate \
-    ${PYTHON_PN}-pyparsing \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-rdflib_4.2.2.bb b/meta-python/recipes-devtools/python/python3-rdflib_4.2.2.bb
index 6511df3ce1..f7e7f63106 100644
--- a/meta-python/recipes-devtools/python/python3-rdflib_4.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-rdflib_4.2.2.bb
@@ -1,2 +1,15 @@
-inherit setuptools3
-require python-rdflib.inc
+SUMMARY = "RDFLib is a pure Python package for working with RDF"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=68c1a3bb687bd63b8e5552f3ea249840"
+
+SRC_URI[md5sum] = "534fe35b13c5857d53fa1ac5a41eca67"
+SRC_URI[sha256sum] = "da1df14552555c5c7715d8ce71c08f404c988c58a1ecd38552d0da4fc261280d"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-isodate \
+    ${PYTHON_PN}-pyparsing \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

