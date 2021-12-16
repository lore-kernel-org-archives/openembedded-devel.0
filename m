Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EF32C433EF
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 15:23:39 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web08.11880.1639668217941838708
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 07:23:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=N347k9kp;
 spf=pass (domain: gmail.com, ip: 209.85.216.45,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id
 a11-20020a17090a854b00b001b11aae38d6so3555771pjw.2
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 07:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=UhkZ2NhiN/lrPkG1Rxs2HaPLKZ6fW5g/v7a0fNCEUVk=;
        b=N347k9kpsDf6lt09OV2PMQVCFWgQOkQUStX6UKAbte6VnAOd4TqRZfC4tPIOA+4W25
         LQh5UGKq0fppefUaNB9MtMkvj2mLQ++LkI9xR1I0b3GjqKBluxDQAsSu8gYf9CLOqLMG
         zLwG/bfgjzxxsdZpYxi9Zskc20CBD+Ui1zf+dJKTTUn12dd7yDa2lHie/wwALRDhATmL
         y2jbNc5M5pL4RziDSbEGdwg1//6Vgfd1oBjMZpYkSJV/1SAInewV04C/ZkZ+epJ69TrK
         RZWvbrWdFZFu3PiJXkXa+KQnjbMSiHJmBoBJyD8S00s4IV1uHqs513TYtacOesdiMiT1
         QDDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UhkZ2NhiN/lrPkG1Rxs2HaPLKZ6fW5g/v7a0fNCEUVk=;
        b=bSSUDx6czJwDhyOQTwVmvs4NzszBtqIxZtVXHh6Az02ZXgUGdcqjvaKTt+7xSo4zQ+
         Dm5KYvG6qJdWc/HNza3qz6xWlhv9tDz86MvJ3PkRHO0cstwAOBoLyF1mWO6wf/AjHxeu
         GIFbJAw1CLPYO+eG300OyNdhoyWt7hhuG2UWOJKIbDuIU6PoeoAlsgTDPFFSzKClhb2j
         vva7y4GCvw9MPKQ+Jq9nNBM7WdD/O14+4VR4sgQ2q4tWmUkALp5o08ArPb4tp8/O0E4S
         JsMvVXxql6hZdsLx/51AuBiuEy0G5UBmtPxxloUSA21/zx9dvwsyYH/TNrjRsuc81i/H
         bYig==
X-Gm-Message-State: AOAM532z89mnlckDhA/2/bdiO2dHILTakSInSoQSDZea4oofHGQo87lX
	i/FfnYYRCPmTjIX9NYm6fZd8lYvED/U=
X-Google-Smtp-Source: 
 ABdhPJy0GgiAHUTxngAQfs02CIMU35GDPhj2F1TA1COBjerIzROQnmBLlr1f9WwdLz6ySN3CeA648g==
X-Received: by 2002:a17:902:b695:b0:148:a2f7:9d76 with SMTP id
 c21-20020a170902b69500b00148a2f79d76mr10205797pls.149.1639668217301;
        Thu, 16 Dec 2021 07:23:37 -0800 (PST)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:7d7:ca51:b150:8ee7])
        by smtp.gmail.com with ESMTPSA id
 k15sm6795703pff.215.2021.12.16.07.23.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 07:23:37 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [honister 12/18] python3-gevent: use system libraries instead of
 embedding
Date: Thu, 16 Dec 2021 07:23:17 -0800
Message-Id: 
 <c035aa28e0692edd9df1c715648705cc280b7c16.1639668121.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1639668121.git.akuster808@gmail.com>
References: <cover.1639668121.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Dec 2021 15:23:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94397

From: Ross Burton <ross@burtonini.com>

gevent by default will build its own c-ares and libuv, but that build
needs patches and embedded libraries are bad form.

DEPEND on the recipes instead, and turn off embedding.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit 2d63ec9476690a0da648c805dc3fdb9b0201bbbb)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../python/python-gevent/libev-conf.patch     | 26 -------------------
 .../python/python3-gevent_21.8.0.bb           | 22 ++++++----------
 2 files changed, 8 insertions(+), 40 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-gevent/libev-conf.patch

diff --git a/meta-python/recipes-devtools/python/python-gevent/libev-conf.patch b/meta-python/recipes-devtools/python/python-gevent/libev-conf.patch
deleted file mode 100644
index 79c1867ba7..0000000000
--- a/meta-python/recipes-devtools/python/python-gevent/libev-conf.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 2294734ef9d5e2efb05820e9759a1635799bdea9 Mon Sep 17 00:00:00 2001
-From: Andrej Rode <andrej.rode@ettus.com>
-Date: Mon, 10 Apr 2017 19:25:18 -0700
-Subject: [PATCH] libev: make configure crosscompile compatible
-
-Signed-off-by: Andrej Rode <andrej.rode@ettus.com>
----
- deps/libev/configure | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/deps/libev/configure b/deps/libev/configure
-index 743817e..96c2366 100755
---- a/deps/libev/configure
-+++ b/deps/libev/configure
-@@ -2208,7 +2208,7 @@ fi
- ac_ext=c
- ac_cpp='$CPP $CPPFLAGS'
- ac_compile='$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
--ac_link='$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conftest.$ac_ext $LIBS >&5'
-+ac_link='$CC -static -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conftest.$ac_ext $LIBS >&5'
- ac_compiler_gnu=$ac_cv_c_compiler_gnu
- 
- 
--- 
-2.10.2
-
diff --git a/meta-python/recipes-devtools/python/python3-gevent_21.8.0.bb b/meta-python/recipes-devtools/python/python3-gevent_21.8.0.bb
index 74ae6cf69d..8fb6e18504 100644
--- a/meta-python/recipes-devtools/python/python3-gevent_21.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gevent_21.8.0.bb
@@ -7,27 +7,21 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4de99aac27b470c29c6c309e0c279b65 \
                     file://NOTICE;md5=18108df3583462cafd457f024b9b09b5 \
                     file://deps/libev/LICENSE;md5=d6ad416afd040c90698edcdf1cbee347 \
                     "
-DEPENDS += "libevent"
-DEPENDS += "${PYTHON_PN}-greenlet"
+DEPENDS += "${PYTHON_PN}-greenlet libev c-ares"
+
 RDEPENDS:${PN} = "${PYTHON_PN}-greenlet \
 		  ${PYTHON_PN}-mime \
 		  ${PYTHON_PN}-pprint \
 		 "
 
-FILESEXTRAPATHS:prepend := "${THISDIR}/python-gevent:"
+SRC_URI[sha256sum] = "43e93e1a4738c922a2416baf33f0afb0a20b22d3dba886720bc037cd02a98575"
 
-SRC_URI:append = " \
-    file://libev-conf.patch;patch=1;pnum=1 \
-"
+inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "43e93e1a4738c922a2416baf33f0afb0a20b22d3dba886720bc037cd02a98575"
+# Don't embed libraries, link to the system instead
+export GEVENTSETUP_EMBED = "0"
 
-# The python-gevent has no autoreconf ability
-# and the logic for detecting a cross compile is flawed
-# so always force a cross compile
+# Delete the embedded copies of libraries so we can't accidentally link to them
 do_configure:append() {
-	sed -i -e 's/^cross_compiling=no/cross_compiling=yes/' ${S}/deps/libev/configure
-	sed -i -e 's/^cross_compiling=no/cross_compiling=yes/' ${S}/deps/c-ares/configure
+	rm -rf ${S}/deps
 }
-
-inherit pypi setuptools3
-- 
2.25.1


