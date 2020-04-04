Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web12.1544.1586020411968669520
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 10:13:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id l23so10819908otf.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 10:13:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=r8EHu//zGCe0ZwGNG8IeuK7T92gl/iXzBLzTJrJVW1s=;
        b=BH/SjIS42slol1KL9QfLbZOhDr5RYYNAAal/mP1aXoCqp9nPK5cVTZxkpCqdIIK19i
         TF021kYjieNBt2vuRZ6o3HZvf2HtQ2I4blc78Zeoid2Y+Eix1o4nzZDFKXN1XifYjDtK
         /+BK6A3ZmpV4J61ewaEzxaxdhd0SSjz5esBol+oBd0WbKUgu5oqXPu/86lHZvl5bPtrt
         XYlnBrmM26ggsNFEiAejRZCoV2eGQMLwagWg8S8RnLC0C97rC41cYROJ/SbKYxp4g3du
         TtAabHzAfn6d/hizvR8HqIwff2tClOkTfiMbDk4qDUhhGex1BB3+jt91Ehb0C6e8IHcQ
         Y/Ow==
X-Gm-Message-State: AGi0PuYyi0i9KFMy1NMMDrYboVsDYug2pD+4dycH6/TL9DOO/4/TuaGl
	2EVAjE6UQihqRCaSuiVuoKF0C/DGxW8=
X-Google-Smtp-Source: APiQypLISeYIuh11MGgdCujZp6zw49M3MS58J6qmtrr3HRbMXb2/glwQ/dNDD8F/Q/90t7LFFZQG9w==
X-Received: by 2002:a9d:340b:: with SMTP id v11mr10988799otb.14.1586020411010;
        Sat, 04 Apr 2020 10:13:31 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id q12sm3054551otn.43.2020.04.04.10.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 10:13:30 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 27/27] python-scrypt: consolidate inc and bb files into a single bb file
Date: Sat,  4 Apr 2020 13:12:51 -0400
Message-Id: <20200404171251.19823-27-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404171251.19823-1-derek@asterius.io>
References: <20200404171251.19823-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-scrypt.inc | 29 -------------------
 ...-remove-the-hard-coded-include-paths.patch |  0
 .../python/python3-scrypt_0.8.6.bb            | 25 ++++++++++++++--
 3 files changed, 23 insertions(+), 31 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-scrypt.inc
 rename meta-python/recipes-devtools/python/{python-scrypt => python3-scrypt}/0001-py-scrypt-remove-the-hard-coded-include-paths.patch (100%)

diff --git a/meta-python/recipes-devtools/python/python-scrypt.inc b/meta-python/recipes-devtools/python/python-scrypt.inc
deleted file mode 100644
index aa9d7b8d4d..0000000000
--- a/meta-python/recipes-devtools/python/python-scrypt.inc
+++ /dev/null
@@ -1,29 +0,0 @@
-DESCRIPTION = "Bindings for the scrypt key derivation function library"
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=168ff75417f75a83e63c8875292d44dc"
-HOMEPAGE="https://bitbucket.org/mhallin/py-scrypt/overview"
-
-FILESEXTRAPATHS_prepend := "${THISDIR}/python-scrypt:"
-
-SRC_URI += "file://0001-py-scrypt-remove-the-hard-coded-include-paths.patch"
-
-SRC_URI[md5sum] = "ae8e3263aa31b040c1f9c7f1e1843a56"
-SRC_URI[sha256sum] = "f8239b2d47fa1d40bc27efd231dc7083695d10c1c2ac51a99380360741e0362d"
-
-inherit pypi ptest
-
-SRC_URI += " \
-	file://run-ptest \
-"
-
-RDEPENDS_${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
-"
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-
-RDEPENDS_${PN}_class-target += "\
-"
diff --git a/meta-python/recipes-devtools/python/python-scrypt/0001-py-scrypt-remove-the-hard-coded-include-paths.patch b/meta-python/recipes-devtools/python/python3-scrypt/0001-py-scrypt-remove-the-hard-coded-include-paths.patch
similarity index 100%
rename from meta-python/recipes-devtools/python/python-scrypt/0001-py-scrypt-remove-the-hard-coded-include-paths.patch
rename to meta-python/recipes-devtools/python/python3-scrypt/0001-py-scrypt-remove-the-hard-coded-include-paths.patch
diff --git a/meta-python/recipes-devtools/python/python3-scrypt_0.8.6.bb b/meta-python/recipes-devtools/python/python3-scrypt_0.8.6.bb
index f49665322e..7588fc54ba 100644
--- a/meta-python/recipes-devtools/python/python3-scrypt_0.8.6.bb
+++ b/meta-python/recipes-devtools/python/python3-scrypt_0.8.6.bb
@@ -1,3 +1,24 @@
-inherit setuptools3 python3-dir
-require python-scrypt.inc
+DESCRIPTION = "Bindings for the scrypt key derivation function library"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=168ff75417f75a83e63c8875292d44dc"
+HOMEPAGE="https://bitbucket.org/mhallin/py-scrypt/overview"
 
+SRC_URI += "file://0001-py-scrypt-remove-the-hard-coded-include-paths.patch"
+
+SRC_URI[md5sum] = "ae8e3263aa31b040c1f9c7f1e1843a56"
+SRC_URI[sha256sum] = "f8239b2d47fa1d40bc27efd231dc7083695d10c1c2ac51a99380360741e0362d"
+
+inherit pypi ptest setuptools3
+
+SRC_URI += " \
+    file://run-ptest \
+"
+
+RDEPENDS_${PN}-ptest += " \
+    ${PYTHON_PN}-pytest \
+"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
-- 
2.17.1

