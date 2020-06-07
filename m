Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web11.1337.1591500290139830367
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Jun 2020 20:24:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KsO8CjU3;
 spf=pass (domain: gmail.com, ip: 209.85.216.65, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f65.google.com with SMTP id m2so4522393pjv.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Jun 2020 20:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=a6A6zm5nv+ygPSJee57esx6Kgw+3CZRPGrvy7jgiydQ=;
        b=KsO8CjU3aUTeeCYRqUQgvNooXQeeEDBtzqJy7zJOyEIoHWLEsl1wdXl0ZgwR5+eA/1
         ntbQebTqr1qoRaaesYIoD/zjDvGJ9l4TOaAyhXxBa6zG9rsk1qx0aufii2C0iohiwCd+
         lfXTWfCjazzkiI4xJv71vhQQzDy9/eSVbcF33GPTkWHk4b0+hAysHdbyfePRXh2OobQg
         Td9sYMhPb+8xBVRkHo6NKEsEWnmjZdFjEqZGuj9D4ZrQlXvF01pdVLHeO7Bv2ptYKLgk
         bwMSMGklah5Ww/wOCXl3fiv/jCEmGZcstGqyoKVP9fp9b0GHsfaXkJaOibEi67MoPpn8
         VLSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=a6A6zm5nv+ygPSJee57esx6Kgw+3CZRPGrvy7jgiydQ=;
        b=Z+HarHo8UrBFnM0PX3B8PFcchQ9rese8h0SDkVhoyiFINXYL6zOhqYDnA5byCHaqtF
         l0QFVMjjOwVYUWYH494zKc4PKVtk8s5EatrLOJ2Vgr8KSVG7iFMWqKZlQxDs97kBHOCl
         8jWQB5+Wm98R6vdRpXtBr3GgKL+1nFvspfgZRW9AgSWyI3CWPSpwYCqUHSUQi/kZI79x
         sz8sQqDHg4ZYpbI8RC3lbDK6MgqEkdflX2QKFj8cpe+CgQcXCF5/cdz4i594SWiTYaxV
         8WC+W1glQFQZcPe7nmB5AApjcQ4dlW5M7wClgbNHVXVsTAdTjfZMBtbyXXJdUVN2xLM9
         wrXA==
X-Gm-Message-State: AOAM530FlOyPm6EkGB2I0VbUSNzGIyQSEif2JHvSaOQVDyFrVFqOswdX
	ouVzX7DG1GRnyEoZme0d6LjR7fzq
X-Google-Smtp-Source: ABdhPJzb0l+/d2IRwY8pBizKkNNWxFjs9SkTe6pa608Ne9BvjOQ/ASIQgXxQjnjMR5YGQtDyzGOGXw==
X-Received: by 2002:a17:902:d682:: with SMTP id v2mr15855842ply.168.1591500289492;
        Sat, 06 Jun 2020 20:24:49 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:590a:7b35:9222:2f9])
        by smtp.gmail.com with ESMTPSA id m7sm3372463pfb.1.2020.06.06.20.24.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2020 20:24:48 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 08/26] python3-pyyaml: Update 5.3 -> 5.3.1
Date: Sat,  6 Jun 2020 20:24:18 -0700
Message-Id: <7c0467d5856446ac425312227983c96928971f65.1591500139.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1591500139.git.akuster808@gmail.com>
References: <cover.1591500139.git.akuster808@gmail.com>

From: Domarys Correa <domarys.correa@ossystems.com.br>

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 6a7ef1fbb8342d31b76128b102e028844b6f3c98)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../python/python3-pyyaml_5.3.1.bb            | 18 ++++++++++++++++++
 .../python/python3-pyyaml_5.3.bb              | 19 -------------------
 2 files changed, 18 insertions(+), 19 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-pyyaml_5.3.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-pyyaml_5.3.bb

diff --git a/meta-python/recipes-devtools/python/python3-pyyaml_5.3.1.bb b/meta-python/recipes-devtools/python/python3-pyyaml_5.3.1.bb
new file mode 100644
index 0000000000..8cf9093041
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyyaml_5.3.1.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Python support for YAML"
+DEPENDS += "libyaml ${PYTHON_PN}-cython-native"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7bbd28caa69f81f5cd5f48647236663d"
+
+PYPI_PACKAGE = "PyYAML"
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = "b8eac752c5e14d3eca0e6dd9199cd627518cb5ec06add0de9d32baeee6fe645d"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-netclient \
+"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-pyyaml_5.3.bb b/meta-python/recipes-devtools/python/python3-pyyaml_5.3.bb
deleted file mode 100644
index 17868a25dd..0000000000
--- a/meta-python/recipes-devtools/python/python3-pyyaml_5.3.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY = "Python support for YAML"
-HOMEPAGE = "http://www.pyyaml.org"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a76b4c69bfcf82313bbdc0393b04438a"
-DEPENDS = "libyaml ${PYTHON_PN}-cython-native ${PYTHON_PN}"
-
-PYPI_PACKAGE = "PyYAML"
-inherit pypi setuptools3
-
-SRC_URI[md5sum] = "adbb0d336b509d6472d3b095a0f1cf30"
-SRC_URI[sha256sum] = "e9f45bd5b92c7974e59bcd2dcc8631a6b6cc380a904725fce7bc08872e691615"
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-netclient \
-"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

