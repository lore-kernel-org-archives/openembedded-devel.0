Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web12.1520.1586020395538952186
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 10:13:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id t28so10794661ott.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 10:13:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=W1FSNofIEHsz9VA679W+HzXL/FwFoaAOSQbT6sxcMfo=;
        b=iXEETf0xGRulFe4VrRx3V+KywzX4IccqOM1aQkkopuKuULiiyffFqi2/LAwaDQosVm
         PozDG5ZexVWRdHRF6/UOgommQNwhI5cR4wDJ0Mpw4Rd/ycsC4dpPY3/pnDnzXcOMjZGb
         b6T6eJzq8rXyZqi+paXFIsNfCU9Rm27WXagCXJFAm38i72Jr+sVvkrgxCNtf8wWxv3V5
         fqy546Kfiu06Kq3enXFLl99SuvtwxJrRq17Ng2ioTg2ylF5eOxXi9mtdzMdrhsNds+iy
         MnRnijEb1RaxuXaxXBgfW83ah6OYCn7fvojGjK/tkfic8kWW58nzEKf0iRvym3X7F6pk
         kdyQ==
X-Gm-Message-State: AGi0PuYMErSIRSLFxMHE9lDVG52uQdWUiyJX+5xRLih8aOxMz8RTYocD
	vS9mX/u9u5yK1M0naWPIRyyR/rL7Yyw=
X-Google-Smtp-Source: APiQypJ2ZtaHLezsvBWQMkYw4//hqMPQWLD88a3ZECQToHJoLiC8sMwpmrKa/wkTCMbw98Tabbtw0A==
X-Received: by 2002:a9d:6a97:: with SMTP id l23mr10741416otq.69.1586020394566;
        Sat, 04 Apr 2020 10:13:14 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id q12sm3054551otn.43.2020.04.04.10.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 10:13:14 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 08/27] python-strict-rfc3339: consolidate inc and bb files into a single bb file
Date: Sat,  4 Apr 2020 13:12:32 -0400
Message-Id: <20200404171251.19823-8-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404171251.19823-1-derek@asterius.io>
References: <20200404171251.19823-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-strict-rfc3339.inc  |  8 --------
 .../python/python3-strict-rfc3339_0.7.bb               | 10 +++++++++-
 2 files changed, 9 insertions(+), 9 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-strict-rfc3339.inc

diff --git a/meta-python/recipes-devtools/python/python-strict-rfc3339.inc b/meta-python/recipes-devtools/python/python-strict-rfc3339.inc
deleted file mode 100644
index dca9ea93ea..0000000000
--- a/meta-python/recipes-devtools/python/python-strict-rfc3339.inc
+++ /dev/null
@@ -1,8 +0,0 @@
-SUMMARY = "Strict, simple, lightweight RFC3339 function.s"
-LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=8f0e2cd40e05189ec81232da84bd6e1a"
-
-SRC_URI[md5sum] = "4d9b635b4df885bc37bc1189d66c9abc"
-SRC_URI[sha256sum] = "5cad17bedfc3af57b399db0fed32771f18fc54bbd917e85546088607ac5e1277"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-strict-rfc3339_0.7.bb b/meta-python/recipes-devtools/python/python3-strict-rfc3339_0.7.bb
index 9e37052aed..52ae9ebe9a 100644
--- a/meta-python/recipes-devtools/python/python3-strict-rfc3339_0.7.bb
+++ b/meta-python/recipes-devtools/python/python3-strict-rfc3339_0.7.bb
@@ -1,2 +1,10 @@
+SUMMARY = "Strict, simple, lightweight RFC3339 function.s"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8f0e2cd40e05189ec81232da84bd6e1a"
+
+SRC_URI[md5sum] = "4d9b635b4df885bc37bc1189d66c9abc"
+SRC_URI[sha256sum] = "5cad17bedfc3af57b399db0fed32771f18fc54bbd917e85546088607ac5e1277"
+
 inherit pypi setuptools3
-require python-strict-rfc3339.inc
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

