Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.28542.1595768862712965019
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Jul 2020 06:07:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=U5kITxlZ;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.174, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f174.google.com with SMTP id f5so14358419ljj.10
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Jul 2020 06:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NeJyIccqKPBllutjnsNUhoSA8noR9e9M01q+FQIvQhc=;
        b=U5kITxlZ8sNdsODwls3yiYFS1He12nsDnMONM6V4AxIWvzD6JdK95d3FD+W+/HOZMs
         nGY2TiWTPwMdTtmkXOY6x3trg9s+NkA2tUIULn5i212M01DFHFAEwEifh9TbTjys7old
         edWGq/ynNM3dkN1FkCpvPBpbLQcuJAkVUp8j+PQi02XL+0Qf6QGzK6B7auWePryx8TRs
         o3qpZKk6s6brqJ0So4aBWJ53dRT6/8QEpRDUhw5Oj0MXmlVBVTZuSI5MQTdHDRnnqHbe
         L+Mi2dii1k6IP0/HSL9eGCes3Q7bZrMY/SK/kgwYiCIwmM4AXRDTXH7470V7tyXtOy+z
         N+KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NeJyIccqKPBllutjnsNUhoSA8noR9e9M01q+FQIvQhc=;
        b=Hjlb5FkK6oOy9o1z3knyONEJPF9HkmQRvoT8leWdBHhyvu+N2H8rXV+e2vN+UcfaiL
         jmtCD318SHZIFyXVq6QPwDWVSldlhZzzEJGC5jYzLG2PDnQZPp43ic9M04Nmve9pHLAt
         t2vVnlnQJL0APUirkUHDrSgFsnx/LU9Qo9RkC5HZZQzpKCdX+0LfKcmV5VPb4MFYEk4w
         YC9L7m8uWqzgJLQPHyguErlDVcAZ2peE8OKkmM4W6MEJfE9JGxSlPabsU8GrkoeLeZBL
         J4Pq0GaRsUoJMeAWvozT8rf3NcbiZAnyYXz9PZx9VaCiKEiUZZb5HjJhBZkc7af+02ly
         STkA==
X-Gm-Message-State: AOAM532oXD/zkGpapBq4IXkOV3ZMKjeF0WjoNT0XHhutoOSdWogzgbA/
	4+/S+KDdJIak4xYQBkSCwSmp6q5U3v8=
X-Google-Smtp-Source: ABdhPJzvITQQbyHiVOlg5jpNUgb74X5RJ/JodrjvzBCVzjFuNA4Vzc+zyjlYv9LjaL6f3cEKJlxbAQ==
X-Received: by 2002:a2e:844f:: with SMTP id u15mr145856ljh.200.1595768860459;
        Sun, 26 Jul 2020 06:07:40 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id z23sm1804043ljz.3.2020.07.26.06.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 06:07:39 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] valijson: update to 0.3
Date: Sun, 26 Jul 2020 15:07:37 +0200
Message-Id: <20200726130737.57830-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../recipes-devtools/valijson/valijson_0.3.bb | 36 +++++++++++++++++++
 .../recipes-devtools/valijson/valijson_git.bb | 21 -----------
 2 files changed, 36 insertions(+), 21 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/valijson/valijson_0.3.bb
 delete mode 100644 meta-oe/recipes-devtools/valijson/valijson_git.bb

diff --git a/meta-oe/recipes-devtools/valijson/valijson_0.3.bb b/meta-oe/recipes-devtools/valijson/valijson_0.3.bb
new file mode 100644
index 0000000000..049cdeffc0
--- /dev/null
+++ b/meta-oe/recipes-devtools/valijson/valijson_0.3.bb
@@ -0,0 +1,36 @@
+SUMMARY = "Header-only C++ library for JSON Schema validation"
+HOMEPAGE = "https://github.com/tristanpenman/valijson"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=015106c62262b2383f6c72063f0998f2"
+
+SRC_URI = "git://github.com/tristanpenman/valijson.git"
+SRCREV = "7a52fc88cdffd6678c009ca2fad700151f7363c6"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+EXTRA_OECMAKE = "-DINSTALL_HEADERS=1 -DBUILD_TESTS=0"
+
+DEPENDS = "curlpp"
+
+# valijson is a header only C++ library, so the main package will be empty.
+RDEPENDS_${PN}-dev = ""
+
+BBCLASSEXTEND = "native nativesdk"
+
+do_install() {
+    install -d ${D}${includedir}/compat
+    install -d ${D}${includedir}/valijson
+    install -d ${D}${includedir}/valijson/adapters
+    install -d ${D}${includedir}/valijson/constraints
+    install -d ${D}${includedir}/valijson/internal
+    install -d ${D}${includedir}/valijson/utils
+
+    install -m 0644 ${S}/include/compat/* ${D}${includedir}/compat
+    install -D -m 0644 ${S}/include/valijson/*.hpp -t ${D}${includedir}/valijson
+    install -D -m 0644 ${S}/include/valijson/adapters/*.hpp -t ${D}${includedir}/valijson/adapters
+    install -D -m 0644 ${S}/include/valijson/constraints/*.hpp -t ${D}${includedir}/valijson/constraints
+    install -D -m 0644 ${S}/include/valijson/internal/*.hpp -t ${D}${includedir}/valijson/internal
+    install -D -m 0644 ${S}/include/valijson/utils/*.hpp -t ${D}${includedir}/valijson/utils
+}
diff --git a/meta-oe/recipes-devtools/valijson/valijson_git.bb b/meta-oe/recipes-devtools/valijson/valijson_git.bb
deleted file mode 100644
index c3254d16e7..0000000000
--- a/meta-oe/recipes-devtools/valijson/valijson_git.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "Header-only C++ library for JSON Schema validation"
-HOMEPAGE = "https://github.com/tristanpenman/valijson"
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=015106c62262b2383f6c72063f0998f2"
-
-SRC_URI = "git://github.com/tristanpenman/valijson.git"
-PV = "0.1+git${SRCPV}"
-
-SRCREV = "c2f22fddf599d04dc33fcd7ed257c698a05345d9"
-
-S = "${WORKDIR}/git"
-
-inherit cmake
-
-EXTRA_OECMAKE = "-DINSTALL_HEADERS=1 -DBUILD_TESTS=0"
-
-# valijson is a header only C++ library, so the main package will be empty.
-RDEPENDS_${PN}-dev = ""
-
-BBCLASSEXTEND = "native nativesdk"
-
-- 
2.25.1

