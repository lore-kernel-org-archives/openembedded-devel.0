Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web12.1744.1598918209441869689
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Aug 2020 16:56:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TqtQ485k;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id u20so1622975pfn.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 Aug 2020 16:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+aZ5e3llVsB9i9PKCRQJtJ351k9f99eNFfDjoL/C0JE=;
        b=TqtQ485k0LsScEKaq/v//pQOmo7FfroSaF23l84jINoAWjVh028exn68SN/LwGqXKE
         DE+l/9d+NUz9k8zDwKY4F3IBby9kzIJZSSEQzXRWCWr000R90dohYPlGGoO40ExHd/qT
         gy+5WeGp1PmyIYgPrIKQ+tf7/mkmy4ULmhfIc7hSMwOdLcHC5QpMTV3YPQRt8Um/gR2J
         WyMOIEKcVxMs1qi0JH5p1wNHoS8N41qy8KcAHS2TxH6gdeM0gb0UcN5gS494W3o9rjkl
         MSIWPwg6gz2tEtQiPCwc9rdzToFxe274FT2iweuwdfNN+OOnV525s9dhrOUSq5un37Om
         kW8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+aZ5e3llVsB9i9PKCRQJtJ351k9f99eNFfDjoL/C0JE=;
        b=LumYfP7XTgYyhljj5uLzCvlI3h9RdvlrYlpoHHQ435N+0CWQdZE5hShKNqpN71n9dI
         ldUEDwTTK7ZdbX1C3UWle0y6AT+85iFgumLeAcry70XZ+2KlxSTHJ9qWtEHWcDWzRbFy
         jEhmtFIVgUBHmk34VBHDB6MPT8rlVUt9FpHr4+QYilLBwuAo4CPMyi6Up5/W6pEwlUHe
         gsct1odzTyfP0Fk2JMp2RNrP+LXjREDLOU8pV525B/vciP6ARJlmu+ZqCgzs2G5zG63v
         LjDd2rYCKHlVwqBBO34JtzXl2mkQlNddpwydoy+xLWBRLuhNx/3yH1NGJBzRWdBNNFx+
         T7fA==
X-Gm-Message-State: AOAM5319qBguMwqSHM6wEgjvTNI2saGVTQd/y9/vKVuu6lAEtJVO8o2N
	OXw5pBH1F9Fr4L6fbS5FjQHmI2huIjxDXg==
X-Google-Smtp-Source: ABdhPJwiaA6o+4kW9Pn9dszMCVe9IOgFCsEJeYjk1p4/mjv2Ym6MzjNTPeBuVFtsgu6iq/hV0H+VCw==
X-Received: by 2002:a62:5c4:: with SMTP id 187mr3410831pff.40.1598918208626;
        Mon, 31 Aug 2020 16:56:48 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e89d])
        by smtp.gmail.com with ESMTPSA id q24sm5357089pfs.206.2020.08.31.16.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 16:56:47 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] properties-cpp: Add recipe
Date: Mon, 31 Aug 2020 16:56:45 -0700
Message-Id: <20200831235645.49410-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../packagegroups/packagegroup-meta-oe.bb     |  2 +-
 .../properties-cpp/properties-cpp_git.bb      | 22 +++++++++++++++++++
 2 files changed, 23 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/properties-cpp/properties-cpp_git.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 01392d1435..52171a5fac 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -933,6 +933,6 @@ RDEPENDS_packagegroup-meta-oe-fortran-packages = "\
 # opencl-headers sdbus-c++-libsystemd boost-url nlohmann-fifo sqlite-orm
 # nlohmann-json exprtk liblightmodbus p8platform gnome-doc-utils-stub
 # glm ttf-mplus xbitmaps ceres-solver cli11 fftw gnulib libeigen ade
-# spdlog span-lite uthash websocketpp catch2
+# spdlog span-lite uthash websocketpp catch2 properties-cpp
 
 # rsyslog conflicts with syslog-ng so its not included here
diff --git a/meta-oe/recipes-extended/properties-cpp/properties-cpp_git.bb b/meta-oe/recipes-extended/properties-cpp/properties-cpp_git.bb
new file mode 100644
index 0000000000..5db38ac987
--- /dev/null
+++ b/meta-oe/recipes-extended/properties-cpp/properties-cpp_git.bb
@@ -0,0 +1,22 @@
+# Copyright (c) 2019 Christophe Chapuis <chris.chapuis@gmail.com>
+# Copyright (c) 2019 Herman van Hazendonk <github.com@herrie.org>
+
+SUMMARY = "A very simple convenience library for handling properties and signals in C++11."
+SECTION = "libs"
+LICENSE = "LGPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
+
+PV = "0.0.1+git${SRCPV}"
+
+SRCREV = "45863e849b39c4921d6553e6d27e267a96ac7d77"
+SRC_URI = "git://github.com/lib-cpp/${BPN}.git"
+
+S = "${WORKDIR}/git"
+
+do_configure_prepend() {
+    echo " " > ${S}/tests/CMakeLists.txt
+}
+
+inherit cmake pkgconfig
+
+RDEPENDS_${PN}-dev = ""
-- 
2.28.0

