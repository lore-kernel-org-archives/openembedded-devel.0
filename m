Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web12.4009.1616582795227363028
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Mar 2021 03:46:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Dh2ZatlI;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id u9so32042382ejj.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Mar 2021 03:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aXKWQwvZmLD0CXQAYDWoZjbmEoNgNG9V3xOpUgB64Uc=;
        b=Dh2ZatlIN5KP2o/9mYaMZJHVSWqz29pDaEk1bObUcjwzzw0U0yzV5qlJKXB8moVMxI
         B4YbKC16iFKItKLwVQMk/5pMTqGMcX6SKDxnOKvE0TTmilq6WTRZziZwXKphFwkWeAEw
         w1BD+9O0BiZvR+AsgJDZzCU0Wa1t+QtFkiSJGKCOO9mT8tPdbaZ4hyAFiRwiUfyrIFuU
         +2NyU1jIINw/jVMLzaTbLJcK9KX8JBaM7M4HHF1JLrI/b3tI2PGig72jPW8HDGl26oG8
         qzVdRdz51rDeJ+dYW5mUq6FN+k8LbJKHRh1YoJDqdmVXryRucSjOFxBJPAB3FPyVkQGb
         fQNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aXKWQwvZmLD0CXQAYDWoZjbmEoNgNG9V3xOpUgB64Uc=;
        b=X3Zfr4WBHxZzEsNLab1y24GTgtGNj5QVsEHCyQQ0feyCSgRAsDyq6Em6Jh5190CoQP
         yU5rtfYUP0z476Tf0dJRcjqZN6W22G6oVejP/XfSnsvY5+AW1L/so9pewKA1lSVlyga3
         OtJQjgkg7d+Ek8Sln71J3qkqApjogJGO48GgmhEVFWktweoow9r8swabED0UWwIYO5K8
         SGa7odj7gCwNMvZS4zdKxXtLG2jW5ESsIeMugR6H5T0TQXqtD8iTHYLweFmiKFhp8/dr
         iuKKkK8MupWScVvKHFymsJVUNU5CKPjHH4TIKDLBjCcxX+UovGf787vVXaluCYqh94cs
         /cGw==
X-Gm-Message-State: AOAM531BlTHTye5GkaGum5MaKa5YkbFB5BXWJcdiF86tGzSEfR4vZcuS
	etJu3p1gzziv228NI762+o02GYP5w0w=
X-Google-Smtp-Source: ABdhPJxrx5AYXI2TqBtIbO9bcnrErOC1wN7fdHo8vOxs+irEk8+g5nc4TNjAVgajf6w2VCpDRaXJ0g==
X-Received: by 2002:a17:906:5d12:: with SMTP id g18mr2900492ejt.246.1616582793419;
        Wed, 24 Mar 2021 03:46:33 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a22sm724813ejr.89.2021.03.24.03.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 03:46:32 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peace Lee <iipeace5@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [dunfell][PATCH] guider: Upgrade to 3.9.7
Date: Wed, 24 Mar 2021 11:46:29 +0100
Message-Id: <20210324104629.3484418-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peace Lee <iipeace5@gmail.com>

Signed-off-by: Peace Lee <iipeace5@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/guider/guider_3.9.6.bb   | 39 -------------------
 .../recipes-devtools/guider/guider_3.9.7.bb   | 19 +++++++++
 2 files changed, 19 insertions(+), 39 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/guider/guider_3.9.6.bb
 create mode 100644 meta-oe/recipes-devtools/guider/guider_3.9.7.bb

diff --git a/meta-oe/recipes-devtools/guider/guider_3.9.6.bb b/meta-oe/recipes-devtools/guider/guider_3.9.6.bb
deleted file mode 100644
index f059002161..0000000000
--- a/meta-oe/recipes-devtools/guider/guider_3.9.6.bb
+++ /dev/null
@@ -1,39 +0,0 @@
-SUMMARY = "runtime performance analyzer"
-HOMEPAGE = "https://github.com/iipeace/guider"
-BUGTRACKER = "https://github.com/iipeace/guider/issues"
-AUTHOR = "Peace Lee <ipeace5@gmail.com>"
-
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2c1c00f9d3ed9e24fa69b932b7e7aff2"
-
-PV = "3.9.6+git${SRCPV}"
-PR = "r0"
-
-SRC_URI = "git://github.com/iipeace/${BPN}"
-#SRCREV = "${AUTOREV}"
-SRCREV = "fef25c41efb9bde0614ea477d0b90bd9565ae0b4"
-
-S = "${WORKDIR}/git"
-R = "${RECIPE_SYSROOT}"
-
-inherit ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "distutils", "", d)}
-
-GUIDER_OBJ = "guider.pyc"
-GUIDER_SCRIPT = "guider"
-
-do_install() {
-    python ${S}/setup.py install
-
-    install -d ${D}${bindir}
-    install -v -m 0755 ${STAGING_BINDIR_NATIVE}/${GUIDER_SCRIPT} ${D}${bindir}/${GUIDER_SCRIPT}
-
-    install -d ${D}${datadir}/${BPN}
-    install -v -m 0755 ${STAGING_LIBDIR_NATIVE}/python${PYTHON_BASEVERSION}/site-packages/${BPN}/${GUIDER_OBJ} ${D}${datadir}/${BPN}/${GUIDER_OBJ}
-}
-
-RDEPENDS_${PN} = "python-ctypes python-shell \
-                  python-json python-subprocess"
-python() {
-    if 'meta-python2' not in d.getVar('BBFILE_COLLECTIONS').split():
-        raise bb.parse.SkipRecipe('Requires meta-python2 to be present.')
-}
diff --git a/meta-oe/recipes-devtools/guider/guider_3.9.7.bb b/meta-oe/recipes-devtools/guider/guider_3.9.7.bb
new file mode 100644
index 0000000000..2b799fd5e4
--- /dev/null
+++ b/meta-oe/recipes-devtools/guider/guider_3.9.7.bb
@@ -0,0 +1,19 @@
+SUMMARY = "runtime performance analyzer"
+HOMEPAGE = "https://github.com/iipeace/guider"
+BUGTRACKER = "https://github.com/iipeace/guider/issues"
+AUTHOR = "Peace Lee <ipeace5@gmail.com>"
+
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2c1c00f9d3ed9e24fa69b932b7e7aff2"
+
+PV = "3.9.7+git${SRCPV}"
+
+SRC_URI = "git://github.com/iipeace/${BPN}"
+SRCREV = "c87269d6d4669d12c99a2a7b9b07c39a5dd24ac6"
+
+S = "${WORKDIR}/git"
+
+inherit setuptools3
+
+RDEPENDS_${PN} = "python3 python3-core \
+        python3-ctypes python3-shell python3-json"
-- 
2.30.2

