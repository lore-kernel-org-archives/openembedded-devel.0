Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web10.7942.1601068854493384048
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Sep 2020 14:20:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LCPj9Ww6;
 spf=pass (domain: gmail.com, ip: 209.85.216.65, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f65.google.com with SMTP id fa1so160851pjb.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Sep 2020 14:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=QrAg4Nvyfy29hC/qoG2t0GXK+ESDaIroAJPk+Ev1Yeg=;
        b=LCPj9Ww6XmzffMpRVYFFLNGqs355iLarjKeK6T3cxhm+DW3/Dlj8iCexCeTbqAJNOy
         /yRWvLlzJeYKlqE0nUt/g2y+FGb+EftMWkJ3i9M05W1GDbrr0eRRVKlnUB7jQaDHV1h4
         mFjLeVoEaZell5EwIaGLNPfEh6/eeU6VYk67gfy6e2COgosokgMh1mbTNlThpxfeF4cy
         FhOKwQi2HX5Y0fhIX4T04YIU4oeT+DYkwwE7GaHpPbyTQRaMphd125LWEMHhLzNYsBsG
         upWeI437Dy4eAieCTAuAmC+k35PIsrRiZ7Ur3zLsClArZvVHkwvEhwR4Ofk2k1JLDJ2X
         Pwgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=QrAg4Nvyfy29hC/qoG2t0GXK+ESDaIroAJPk+Ev1Yeg=;
        b=cMlEbumaXWEok6Cu4bKdba7bU2506Ur/PdQPSoYgSOaQMlBh3MmgkeBqVITU1zN1S9
         E9kfp2ODNlVsIUaGP7UNo5vZtll/460krTU0wewvS+PBAji/72gWEbRUXYzwu13dIYt2
         iV8ODNKrrw+YJ8ZUIdmCF35SOw5iXL5jibUFVQeSF4UvtPDkodJPWs5Ycw23pDIfVGaQ
         Svi7rtU3zfYxAXHu+9I+pIywjW9/pqp5gds38scDVtlTJZsOfXKXRouB7i8ztCOaYb+i
         lh7uyFPQ4/ObE+Zetd/4D624Icl7L83U/d13NoMJ7C1p6VfTQlSvxXuupFQnSBp6K1kk
         3bbA==
X-Gm-Message-State: AOAM530gaIfUGEIN0E49+lTf3Q/TUkgDugQygq7bOoT8TJ5nK34JoQJ+
	6JskmoDm8CGHJgqhkz+nynpCdIwGYrQ=
X-Google-Smtp-Source: ABdhPJxCTih5WJw1DWnzhAT0QObeus0E4sXo3fDSVVLVfRf9RSD+0gaRSXVYFp/A6xm4xRwd3p2Uxg==
X-Received: by 2002:a17:90b:1256:: with SMTP id gx22mr442223pjb.47.1601068853516;
        Fri, 25 Sep 2020 14:20:53 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:a500:b7f2:f3e0:ae01])
        by smtp.gmail.com with ESMTPSA id q65sm2867079pga.88.2020.09.25.14.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2020 14:20:52 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster@mvista.com>
Subject: [meta-oe][PATCH] cmocka: add recipe
Date: Fri, 25 Sep 2020 14:20:51 -0700
Message-Id: <20200925212051.18414-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

From: Armin Kuster <akuster@mvista.com>

includes ptest and bundling of examples that can be used for testing

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb | 37 +++++++++++++++++++++
 meta-oe/recipes-test/cmocka/files/run-ptest | 10 ++++++
 2 files changed, 47 insertions(+)
 create mode 100644 meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb
 create mode 100644 meta-oe/recipes-test/cmocka/files/run-ptest

diff --git a/meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb b/meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb
new file mode 100644
index 0000000000..6125d116cd
--- /dev/null
+++ b/meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb
@@ -0,0 +1,37 @@
+DESCRIPTION = "cmocka is an elegant unit testing framework for C with support for mock \
+objects. It only requires the standard C library, works on a range of computing \
+platforms (including embedded) and with different compilers."
+HOMEPAGE = "https://cmocka.org/"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+SRCREV = "56eb3a183fc222120f86d0c54fd033992c30135e"
+SRC_URI = "git://git.cryptomilk.org/projects/cmocka.git \
+           file://run-ptest "
+
+S = "${WORKDIR}/git"
+
+inherit cmake ptest
+
+EXTRA_OECMAKE = "${@bb.utils.contains('PTEST_ENABLED', '1', '-DCMAKE_BUILD_TYPE=Debug -DUNIT_TESTING=ON', '', d)}"
+
+do_install_append () {
+    install -d ${D}${datadir}/${BPN}/example
+    install -d ${D}${datadir}/${BPN}/example/mock/chef_wrap
+    install -d ${D}${datadir}/${BPN}/example/mock/uptime
+
+    install -m 0755 ${B}/example/*_test ${D}/${datadir}/${BPN}/example
+    install -m 0755 ${B}/example/mock/chef_wrap/waiter_test_wrap ${D}/${datadir}/${BPN}/example/mock/chef_wrap
+    install -m 0755 ${B}/example/mock/uptime/uptime ${D}/${datadir}/${BPN}/example/mock/uptime
+    install -m 0755 ${B}/example/mock/uptime/test_uptime ${D}/${datadir}/${BPN}/example/mock/uptime
+}
+
+do_install_ptest () {
+    install -d ${D}${PTEST_PATH}/tests
+    install -m 0755 ${B}/tests/test_* ${D}${PTEST_PATH}/tests
+}
+
+PACKAGE_BEFORE_PN += "${PN}-examples"
+
+FILES_${PN}-examples = "${datadir}/${BPN}/example"
diff --git a/meta-oe/recipes-test/cmocka/files/run-ptest b/meta-oe/recipes-test/cmocka/files/run-ptest
new file mode 100644
index 0000000000..48b9cd9fc5
--- /dev/null
+++ b/meta-oe/recipes-test/cmocka/files/run-ptest
@@ -0,0 +1,10 @@
+#!/bin/sh
+
+cd tests
+for i in `ls *`; do
+   if [ ./$i ] ; then
+       echo "PASS: $i"
+   else
+       echo "FAIL: $i"
+   fi
+done
-- 
2.17.1

