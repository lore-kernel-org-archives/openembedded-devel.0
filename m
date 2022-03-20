Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A2BFC433F5
	for <webhook@archiver.kernel.org>; Sun, 20 Mar 2022 08:08:25 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.16166.1647763704355642992
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 01:08:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HcwQqwbg;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id e3so10697794pjm.5
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 01:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gX/a4UnJHAMnEPr944tOD1+5jv22wbuAGnr3pTbmqnQ=;
        b=HcwQqwbgAkumzP7wkiYDi5y4z+6SrfiRGDLSzhn6GGUn1yIdiamhnF2tqiqbQR29Yd
         yXb5HeAFf5jEkwnVm59vDA075F/Sb7sFNXHFqiOIfVTD9aW6/bLc6Nd9OXQhJaLB32p1
         oIYTgW0/ChoPs3kTsehlEzy/ntd0RsazfFDMIjmeHP9Luho5Ga1q7KF0qJyydNoehRd+
         qjqyDTRuv9t0LjywEGQoyB21ARGLEa7SffPYsWN7Wq/qG8BSNXNQL9tdvAXjqdzUxZP0
         YMz+FG2l3S/iJHvlFkhW+X/DKwuV6/0FVQK5lxYkLmT6n4JOK8suqoskA/4P3FiBsVQI
         +7iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gX/a4UnJHAMnEPr944tOD1+5jv22wbuAGnr3pTbmqnQ=;
        b=i9hT/YpRwz1PPqjeAx0vOMpQ/OqQ+g/Dg1Qkf5j+HYHzHhnY3bKYIMC1XXFsToYSHG
         5mfClW5JTVCjuKo4mK96B2Fb0nNdyH7fKkocCDfsEJkj/WB5GB5mj3XWc7NllbHsP++R
         JoSJ/ARKg8Phe2YTzhd5ojZFhJIgG1rYveBavx0IuEwi9iS/DxCI7+LA36JQMCy4IBYb
         UvhIo3j6B2k3s1KaxrnKePjzX6s4+TyYb0viWy/81ML24zZcMGx723Me//M+4JINB63W
         d2IOxEGWqBaidBmVo7tAX/tZ9r/PHuDLJL6frORuJoF7o83PqTHXnS43nU04ie2jbUf6
         vVPQ==
X-Gm-Message-State: AOAM530NFqCUbYJH4hm+89gHzjoWfRIaTuDyCcbLX83wcq+irNKP33HY
	pKBBK1ip2+M1nery4ZHhksU7yOaNzthxtw==
X-Google-Smtp-Source: 
 ABdhPJyNAz1IVH8y4wN2dqRAiMzlNI3RfKcpIE9jQ2FzwPc2Wm5+di3nQNUV8dbsepCDmnkrPmriVA==
X-Received: by 2002:a17:90a:4e87:b0:1c7:49c:2e3f with SMTP id
 o7-20020a17090a4e8700b001c7049c2e3fmr1134186pjh.191.1647763703561;
        Sun, 20 Mar 2022 01:08:23 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 s6-20020a056a0008c600b004f667b8a6b6sm15607763pfu.193.2022.03.20.01.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Mar 2022 01:08:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 09/17] libiec61850: Use GNUInstallDirs in
 cmake
Date: Sun, 20 Mar 2022 01:08:07 -0700
Message-Id: <20220320080815.825928-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220320080815.825928-1-raj.khem@gmail.com>
References: <20220320080815.825928-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 20 Mar 2022 08:08:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96073

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...MAKE_INSTALL_LIBDIR-from-GNUInstallD.patch | 29 +++++++++++++++++++
 .../libiec61850/libiec61850_1.5.1.bb          |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch

diff --git a/meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch b/meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch
new file mode 100644
index 0000000000..e778e8158b
--- /dev/null
+++ b/meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch
@@ -0,0 +1,29 @@
+From 16d07a82242c3263ec0038c9b4c97355795d2dd9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 19 Mar 2022 23:16:51 -0700
+Subject: [PATCH] pyiec61850: Use CMAKE_INSTALL_LIBDIR from GNUInstallDirs in
+ cmake
+
+This ensures that it gets installed in platform specified system libdir
+all platforms do not use /usr/lib as assumed here e.g. ppc64 uses lib64
+
+Upstream-Status: Submitted [https://github.com/mz-automation/libiec61850/pull/376]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ pyiec61850/CMakeLists.txt | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+--- a/pyiec61850/CMakeLists.txt
++++ b/pyiec61850/CMakeLists.txt
+@@ -31,7 +31,9 @@ endif()
+ 
+ swig_link_libraries(iec61850 ${PYTHON_LIBRARIES} ${LIBS})
+ 
+-install(FILES ${CMAKE_CURRENT_BINARY_DIR}/iec61850.py DESTINATION /usr/lib/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/site-packages)
+-install(TARGETS _iec61850 LIBRARY DESTINATION /usr/lib/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/site-packages)
++include(GNUInstallDirs)
++
++install(FILES ${CMAKE_CURRENT_BINARY_DIR}/iec61850.py DESTINATION ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/site-packages)
++install(TARGETS _iec61850 LIBRARY DESTINATION ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}//python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/site-packages)
+ 
+ add_test(test_pyiec61850 ${PYTHON_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/test_pyiec61850.py)
diff --git a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.1.bb b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.1.bb
index 11050e2050..3e5fc91dad 100644
--- a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.1.bb
+++ b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.1.bb
@@ -17,6 +17,7 @@ SRCREV = "210cf30897631fe2006ac50483caf8fd616622a2"
 
 SRC_URI = "git://github.com/mz-automation/${BPN}.git;branch=v1.5;protocol=https \
            file://0001-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch \
+           file://0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.35.1


