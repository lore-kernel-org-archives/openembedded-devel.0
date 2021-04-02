Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web08.10602.1617328736320759897
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Apr 2021 18:58:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CoV0m/P3;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id t18so2049832pjs.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Apr 2021 18:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=HGkPKXbjXe85mMhuQwB4iTR/VaA+cpSosTGO99ba+pU=;
        b=CoV0m/P3thDE90fcalJaHArOMOTr8CIj2TFTBAuSptAN0JAhyEI/Xz91x6k75vCz47
         JtZ8tcr66/DKcJRY8GZ+hyJ9ZKBeSnkThCwf54k9CvHYfqvBgwpeGdRkpBlI94gxkE96
         i6edzmoOvtRsso04eYQl72vxpoTu1QkypgrMYhA3aKHPpBL+2II6cvalIp4x/O3nQ+kp
         MSKC5lp5BpwHxSkv2QuZGm4a1eddptOv9qOIzXamEijS3rVBh72SanV8MrEZT8UZTEWa
         +itDYG80PJQN217mx6jm8uZwr9EMJICqQ6JRLk+ze3bEwZPud6wcEHwM6wGxFXcAabA8
         CXKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=HGkPKXbjXe85mMhuQwB4iTR/VaA+cpSosTGO99ba+pU=;
        b=i9tc7OT7Ojnng1J2U382kVE1MW7zIzS9B8Q9/b4nkAPG3uqGq3ee8WTw/r4j3s4A67
         pI/ZWYEbV5VBmqIKxUZbOsC+lp1I89S4+J8Uva4zTtu67bzxHQ0s37+QMzryrJpy+ygD
         FgyQ70krxGfURB9R43fQWeX7lbe0jrNEeH2hd2js3h1yKyhvqz5DJ+BK7xRmAjazG4vB
         D8Qz25v2J+TsXEQcSjCseVNvelxQRVMcWzw2c3l20UhF2DFFNUWy0ruHCm+jzw3svKSj
         5tMvb/eKAY3xqeDWcZPwu74/PmjxMjln5EFNHi1xf4VTCh+txQqkAZmhv8mK6UvJ+HgJ
         8B1w==
X-Gm-Message-State: AOAM532LTppCe9+Sa2L7BhZvBJl+Lheq7vbImoGhwpnMD8qf07wAA4Qz
	IlFPyw6zSg55b1i3b2IztetOuIHPRm8=
X-Google-Smtp-Source: ABdhPJw346fH9MmNFEbNqwebvWl0/V4bKExxJdYgbVrYRtRdf/MWJqSowI+hhAxycf5jvoakHw4jtQ==
X-Received: by 2002:a17:90a:8c08:: with SMTP id a8mr11693092pjo.136.1617328735715;
        Thu, 01 Apr 2021 18:58:55 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:344e:3d2c:47a3:4e6b])
        by smtp.gmail.com with ESMTPSA id x9sm707641pfd.158.2021.04.01.18.58.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 18:58:55 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 10/14] neon: Add ptest
Date: Thu,  1 Apr 2021 18:58:38 -0700
Message-Id: <ac235c6ceebdc3bb55c2b8cd8e83c906da6523ff.1617328609.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617328609.git.akuster808@gmail.com>
References: <cover.1617328609.git.akuster808@gmail.com>

From: "Aditya.Tayade" <Aditya.Tayade@kpit.com>

Reused below test suites from neon source package:
BASIC_TESTS:
auth
basic
request
session
socket
string-tests
stubs
uri-tests
util-tests

DAV_TESTS:
acl3744
lock
oldacl
props
xml
xmlreq

Overall execution time of above test suite is approximately 15sec.

Signed-off-by: Neetika.Singh <Neetika.Singh@kpit.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/neon/neon/run-ptest | 25 +++++++++++++++++++++
 meta-oe/recipes-support/neon/neon_0.30.2.bb | 15 ++++++++++++-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/neon/neon/run-ptest

diff --git a/meta-oe/recipes-support/neon/neon/run-ptest b/meta-oe/recipes-support/neon/neon/run-ptest
new file mode 100644
index 00000000000..602084a52c1
--- /dev/null
+++ b/meta-oe/recipes-support/neon/neon/run-ptest
@@ -0,0 +1,25 @@
+#!/bin/sh
+
+set -eux
+
+rm -f debug.log child.log
+
+ulimit -c unlimited
+ulimit -t 120
+
+cd test
+echo foobar > foobar.txt
+
+BASIC_TESTS="auth basic redirect request session socket string-tests \
+             stubs uri-tests util-tests"
+DAV_TESTS="acl3744 lock oldacl props xml xmlreq"
+for t in $BASIC_TESTS $DAV_TESTS
+do
+    echo "Running $t..."
+    if "./$t"
+    then
+        echo "PASS:$t"
+    else
+        echo "FAIL:$t"
+    fi
+done
diff --git a/meta-oe/recipes-support/neon/neon_0.30.2.bb b/meta-oe/recipes-support/neon/neon_0.30.2.bb
index 00b79f6330b..7feec41d626 100644
--- a/meta-oe/recipes-support/neon/neon_0.30.2.bb
+++ b/meta-oe/recipes-support/neon/neon_0.30.2.bb
@@ -7,12 +7,13 @@ LIC_FILES_CHKSUM = "file://src/COPYING.LIB;md5=f30a9716ef3762e3467a2f62bf790f0a
 
 SRC_URI = "${DEBIAN_MIRROR}/main/n/neon27/neon27_${PV}.orig.tar.gz \
            file://pkgconfig.patch \
+           file://run-ptest \
           "
 
 SRC_URI[md5sum] = "e28d77bf14032d7f5046b3930704ef41"
 SRC_URI[sha256sum] = "db0bd8cdec329b48f53a6f00199c92d5ba40b0f015b153718d1b15d3d967fbca"
 
-inherit autotools binconfig-disabled lib_package pkgconfig
+inherit autotools binconfig-disabled lib_package pkgconfig ptest
 
 # Enable gnutls or openssl, not both
 PACKAGECONFIG ?= "expat gnutls libproxy webdav zlib"
@@ -33,6 +34,18 @@ do_compile_append() {
     oe_runmake -C test
 }
 
+do_install_ptest(){
+    BASIC_TESTS="auth basic redirect request session socket string-tests \
+                 stubs uri-tests util-tests"
+    DAV_TESTS="acl3744 lock oldacl props xml xmlreq"
+    mkdir "${D}${PTEST_PATH}/test"
+    for i in ${BASIC_TESTS} ${DAV_TESTS}
+    do
+        install -m 0755 "${B}/test/${i}" \
+        "${D}${PTEST_PATH}/test"
+    done
+}
+
 BINCONFIG = "${bindir}/neon-config"
 
 BBCLASSEXTEND = "native"
-- 
2.17.1

