Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com [209.85.167.195])
 by mx.groups.io with SMTP id smtpd.web12.3066.1586024481616548645
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 11:21:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.167.195, mailfrom: straka.derek@gmail.com)
Received: by mail-oi1-f195.google.com with SMTP id q204so9253212oia.13
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 11:21:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=U562UdoR1GEFL2nLHJ0EKMrQkjO7s9FW0RQvxfCxkO0=;
        b=pmjJLfnImXn7Vn9XQWGLB4BkVp0rDbSJA4EC4oz93D+u85DMOYG6oi/qSvv8AQKiLC
         IMhQe5tddLs3an8uE4NTmZXk4X6NGiQxgO1WKlEeuJJq8SepK8/JiwyCxB3lNRTnG7H1
         ZREy06wG7bmNCBrsJTpPof2luQi+VP+LKZoQjWD65AVBCOawFIjwjruZqRMOYfL+iwor
         KGYLI21Zun4VUngwIc5kNZ5I6GYeY/GSzJBJ2mV+c4ZouCbilIGxcXnbbE9C7lvfOwcf
         lmWalrhJHvXbP589wzlI0K/Qflh/CgPcQfHFd5eY8ucuD2Tmvv6GHFNBvsMklqncwB5C
         rgXw==
X-Gm-Message-State: AGi0Pub+dTibWqQ60TfdgCC7XNf1x5gG0HdJUMnVNY+1KSVTjcCVF9nf
	37TZTHToNSAaWeQNGm9SeQBRaS3wpR8=
X-Google-Smtp-Source: APiQypKNnMaKLe6SizLkvBpPsWJH8QPSdiMWo05xMW2eRwCtoQBg2Dgmj4PPwdo4IoqVE7Wk7bhnsA==
X-Received: by 2002:aca:b743:: with SMTP id h64mr7612597oif.176.1586024480684;
        Sat, 04 Apr 2020 11:21:20 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id j23sm3162059oib.32.2020.04.04.11.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 11:21:20 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 04/12] python-pyzmq: consolidate inc and bb files into a single bb file
Date: Sat,  4 Apr 2020 14:20:56 -0400
Message-Id: <20200404182104.21027-4-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404182104.21027-1-derek@asterius.io>
References: <20200404182104.21027-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-pyzmq.inc  | 27 -----------------
 .../python/python3-pyzmq_17.1.0.bb            | 29 +++++++++++++++++--
 2 files changed, 27 insertions(+), 29 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pyzmq.inc

diff --git a/meta-python/recipes-devtools/python/python-pyzmq.inc b/meta-python/recipes-devtools/python/python-pyzmq.inc
deleted file mode 100644
index 2447c2f34b..0000000000
--- a/meta-python/recipes-devtools/python/python-pyzmq.inc
+++ /dev/null
@@ -1,27 +0,0 @@
-SUMMARY = "Pyzmq provides Zero message queue access for the Python language"
-HOMEPAGE = "http://zeromq.org/bindings:python"
-LICENSE = "BSD & LGPL-3.0"
-LIC_FILES_CHKSUM = "file://COPYING.BSD;md5=11c65680f637c3df7f58bbc8d133e96e \
-                    file://COPYING.LESSER;md5=12c592fa0bcfff3fb0977b066e9cb69e"
-DEPENDS = "zeromq"
-
-FILESEXTRAPATHS_prepend := "${THISDIR}/python-pyzmq:"
-
-SRC_URI += "file://club-rpath-out.patch"
-SRC_URI[md5sum] = "aecdfc328193fbd81f6dc23228319943"
-SRC_URI[sha256sum] = "2199f753a230e26aec5238b0518b036780708a4c887d4944519681a920b9dee4"
-
-inherit pypi pkgconfig
-
-RDEPENDS_${PN} += "${PYTHON_PN}-multiprocessing"
-
-FILES_${PN}-dbg =+ "${PYTHON_SITEPACKAGES_DIR}/zmq/backend/cython/.debug"
-
-do_compile_prepend() {
-    echo [global] > ${S}/setup.cfg
-    echo zmq_prefix = ${STAGING_DIR_HOST} >> ${S}/setup.cfg
-    echo have_sys_un_h = True >> ${S}/setup.cfg
-    echo skip_check_zmq = True >> ${S}/setup.cfg
-    echo libzmq_extension = False >> ${S}/setup.cfg
-    echo no_libzmq_extension = True >> ${S}/setup.cfg
-}
diff --git a/meta-python/recipes-devtools/python/python3-pyzmq_17.1.0.bb b/meta-python/recipes-devtools/python/python3-pyzmq_17.1.0.bb
index 050f53af14..2369f067ee 100644
--- a/meta-python/recipes-devtools/python/python3-pyzmq_17.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzmq_17.1.0.bb
@@ -1,2 +1,27 @@
-require python-pyzmq.inc
-inherit setuptools3
+SUMMARY = "Pyzmq provides Zero message queue access for the Python language"
+HOMEPAGE = "http://zeromq.org/bindings:python"
+LICENSE = "BSD & LGPL-3.0"
+LIC_FILES_CHKSUM = "file://COPYING.BSD;md5=11c65680f637c3df7f58bbc8d133e96e \
+                    file://COPYING.LESSER;md5=12c592fa0bcfff3fb0977b066e9cb69e"
+DEPENDS = "zeromq"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/python-pyzmq:"
+
+SRC_URI += "file://club-rpath-out.patch"
+SRC_URI[md5sum] = "aecdfc328193fbd81f6dc23228319943"
+SRC_URI[sha256sum] = "2199f753a230e26aec5238b0518b036780708a4c887d4944519681a920b9dee4"
+
+inherit pypi pkgconfig setuptools3
+
+RDEPENDS_${PN} += "${PYTHON_PN}-multiprocessing"
+
+FILES_${PN}-dbg =+ "${PYTHON_SITEPACKAGES_DIR}/zmq/backend/cython/.debug"
+
+do_compile_prepend() {
+    echo [global] > ${S}/setup.cfg
+    echo zmq_prefix = ${STAGING_DIR_HOST} >> ${S}/setup.cfg
+    echo have_sys_un_h = True >> ${S}/setup.cfg
+    echo skip_check_zmq = True >> ${S}/setup.cfg
+    echo libzmq_extension = False >> ${S}/setup.cfg
+    echo no_libzmq_extension = True >> ${S}/setup.cfg
+}
-- 
2.17.1

