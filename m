Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web08.5899.1617634473104451446
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Apr 2021 07:54:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OJMKOfVM;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id b17so4626030pgh.7
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Apr 2021 07:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=HGkPKXbjXe85mMhuQwB4iTR/VaA+cpSosTGO99ba+pU=;
        b=OJMKOfVMihDRieaV/+tGYfhUDWPRDKw9rFPNAuAS85R7crOI4mCbOdkIBRrlA/mdmC
         g4WWk+DVWU+29tHFPIuTBsJZgxOFR5W54pQUZM+HOHL8/kH0Pg1FhgHXO+60jxg2nEqq
         iRCq3czaXYQK3V1mBDYh+4T8UB4O26cvcIzXGoVbVkqRATQnNlS5VQB+fjj3KqiHAwqg
         vVGXdcRd1szgn7zOL8ttECLcweYqgdlriQvaxJOU/S2JtlsRJnAU6RxRocpg+c8B4Uwr
         fP0+aQkgxwNw4tZliwxMKwf8x7QcNy0WxrlpSOI9tsLoioDDqT0mL/nkp0x0EA9BQq1n
         R3mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=HGkPKXbjXe85mMhuQwB4iTR/VaA+cpSosTGO99ba+pU=;
        b=oeL7ejvAq3gOQBGIA2pOr6GJaYiexsesIJ73OkJwYhaYHee/MZa9mlFp8mZlzzfZhN
         lwHjkgLxllc/cwxGQhNIMUH9YYDf/vSEyYdPDBN2QhM6ViW0pfis6Jiuw+pu4zuaEEOz
         aTSS/WmdexC1/F8162G4lCgGhM4Zv/V1DvAdrSP13inZPyRQMCSfW0+o2DkltSBKWVf9
         k4ybuPs2qbCAb+c8meaSeIKexK0IpGUJ/cHqqXkM1UxxWrFJEyuwVG9jk0tf/CzzNhsX
         W7YXM3D9kOMajP/NhwsNOFpVfVxt+3g21tSWK0UTQlDQuqAtITyEQKBac2CfHuD++WqZ
         0+7Q==
X-Gm-Message-State: AOAM532e+EM7F0QW49iFtWDIpc9+dlKoZERmpRnoQrVLAcJt02jl5UF9
	P9ImezbzhyllFpBXA25Hg2+hInktJEU=
X-Google-Smtp-Source: ABdhPJwCvMqFflrjIFh8tKQ4SxmOoi+8xJNGlKzjl2Zo0dGQdl5GhpPbh+Wg8p4HSh7KSJ8nnJbNWQ==
X-Received: by 2002:a63:604:: with SMTP id 4mr23388191pgg.267.1617634472476;
        Mon, 05 Apr 2021 07:54:32 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:cb2:3225:c999:3d47])
        by smtp.gmail.com with ESMTPSA id k11sm16501654pjs.1.2021.04.05.07.54.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 07:54:32 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [Dunfell patch review 03/11] neon: Add ptest
Date: Mon,  5 Apr 2021 07:54:16 -0700
Message-Id: <10d31063833c371939cc75b8b2f5e093f13d912c.1617634345.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617634345.git.akuster808@gmail.com>
References: <cover.1617634345.git.akuster808@gmail.com>

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

