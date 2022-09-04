Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE2BCC6FA89
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:35:24 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web08.11133.1662276919387338646
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:35:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Vr0ANFWo;
 spf=pass (domain: gmail.com, ip: 209.85.214.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id 9so2553787plj.11
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=tk9bEwBoa414bJIFL6+Z/dJ9CT78uDs1BvG2tV4uJJ0=;
        b=Vr0ANFWoM3iARKQnFWGcRcH5TbHXganevyZsuxa/xHhuOOVzo5meVsC8j9Qrwx+hOs
         VM8M2G9BjVTvYhDH7G+H+B8Md8YYAQMTbYiKzaky4Sg6DdyywyaM5hQuCWi8c+nCZkmd
         SnyCIuebuECqLpvVem5EdKUsU2XR/+eWSjj33eGfW3MD7NeSlB6jOPQk/HRaih5dStlx
         Hp+pqOGelr9MM0WcrLUFene/7Hbq5vc5WvZjDPVFlXyMmE1EkKDbVz42iELIfdyvJ5RD
         fl6V0HB6gmiEhOM41CiQHJbaPmXosXi5HJOLEETyioo96YLSeFbtzkMtJm2aP41PTqjX
         1q2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=tk9bEwBoa414bJIFL6+Z/dJ9CT78uDs1BvG2tV4uJJ0=;
        b=Li5jnqf7+M6pbmhTaV+Qhc+4tNVMkqcRMflF4tlW0N1TjtRyjLcP4UdMQA9FK4fYAa
         tRj1Nm7OME9IP8s6oDiDj1yLiwSPtNSIi6MtCAtJZjo8PfTeovNLzYXL9Ui3+gQ2qr6r
         Ijvdvmve3HEq5deOGuIFiRPQInHLGagstL339I6oa4JrrdMdwDA4WgaDL15j3jnDfxNs
         b4kk6/f8tgxi9XddGK7Nin2LqmYtiDSrr+sYD0lk5hMuREI4mcS++t4G+4WHZEnePMtU
         qfmd1IzCbZoqxR6Zd15YByeo41ZHKr4nfFtIsmAYQ7on4KxiHwKoJONpo8Y8SNmI6Bzy
         vYYQ==
X-Gm-Message-State: ACgBeo1HI3Q6J7tyEDvNnvsSTmn3YqNk1TK89NGD2IQmFT4d/0pMSoU6
	3BZQAEfyC8o/bKFjA5gwrVG9TV5BwtfVHA==
X-Google-Smtp-Source: 
 AA6agR6iUygef0oHPUPdVNL8HZSTmXHYKKrhKLz61Fsu8ImtS6mZZdO4fm6OkR4DisEZOx0hPpbX0Q==
X-Received: by 2002:a17:90b:1bc4:b0:1fd:b913:ef58 with SMTP id
 oa4-20020a17090b1bc400b001fdb913ef58mr13055960pjb.220.1662276918524;
        Sun, 04 Sep 2022 00:35:18 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::48c3])
        by smtp.gmail.com with ESMTPSA id
 w11-20020a62820b000000b00537a38ec2c6sm5089800pfd.164.2022.09.04.00.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:35:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 57/63] augeas: Check for __GLIBC__ to use gnu
 extention for strerror_r
Date: Sun,  4 Sep 2022 00:34:11 -0700
Message-Id: <20220904073417.3251865-57-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220904073417.3251865-1-raj.khem@gmail.com>
References: <20220904073417.3251865-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Sep 2022 07:35:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98651

Merge .bb and .inc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/augeas/augeas.inc     | 33 ------------------
 ...-__GLIBC__-to-check-for-GNU-extentio.patch | 34 +++++++++++++++++++
 .../recipes-support/augeas/augeas_1.12.0.bb   | 34 ++++++++++++++++++-
 3 files changed, 67 insertions(+), 34 deletions(-)
 delete mode 100644 meta-oe/recipes-support/augeas/augeas.inc
 create mode 100644 meta-oe/recipes-support/augeas/augeas/0001-src-internal-Use-__GLIBC__-to-check-for-GNU-extentio.patch

diff --git a/meta-oe/recipes-support/augeas/augeas.inc b/meta-oe/recipes-support/augeas/augeas.inc
deleted file mode 100644
index d46f3888bd..0000000000
--- a/meta-oe/recipes-support/augeas/augeas.inc
+++ /dev/null
@@ -1,33 +0,0 @@
-SUMMARY = "Augeas configuration API"
-HOMEPAGE = "http://augeas.net/"
-BUGTRACKER = "https://fedorahosted.org/augeas/report/1"
-
-LICENSE = "LGPL-2.1-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=bbb461211a33b134d42ed5ee802b37ff"
-
-SRC_URI = "http://download.augeas.net/${BP}.tar.gz \
-           file://sepbuildfix.patch \
-          "
-
-DEPENDS = "readline libxml2"
-
-inherit autotools pkgconfig
-
-PACKAGES =+ "${PN}-lenses lib${BPN}"
-
-FILES:${PN}-lenses = "${datadir}/augeas/lenses"
-FILES:lib${BPN} = "${libdir}/lib*${SOLIBS}"
-
-RDEPENDS:lib${BPN} += "${PN}-lenses"
-RRECOMMENDS:lib${BPN} += "${PN}"
-
-LEAD_SONAME = "libaugeas.so"
-
-do_install:append() {
-    rm -fr ${D}${datadir}/vim
-}
-
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)}"
-PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux"
-
-EXTRA_AUTORECONF += "-I ${S}/gnulib/m4"
diff --git a/meta-oe/recipes-support/augeas/augeas/0001-src-internal-Use-__GLIBC__-to-check-for-GNU-extentio.patch b/meta-oe/recipes-support/augeas/augeas/0001-src-internal-Use-__GLIBC__-to-check-for-GNU-extentio.patch
new file mode 100644
index 0000000000..9424be2aa6
--- /dev/null
+++ b/meta-oe/recipes-support/augeas/augeas/0001-src-internal-Use-__GLIBC__-to-check-for-GNU-extentio.patch
@@ -0,0 +1,34 @@
+From e5ccf769c2dc7283b56a597fffdb5dc1558e3ce8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 3 Sep 2022 01:23:28 -0700
+Subject: [PATCH] src/internal: Use __GLIBC__ to check for GNU extention
+ implementation
+
+__USE_GNU is defined by _GNU_SOURCE and configure explicitly sets this
+macro and it does have meaning on musl too, where it may have some level
+of GNU compatibility but strerror_r is not one of them. Therefore we
+have to check for libc implementation for this to be sure.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/internal.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/internal.c b/src/internal.c
+index ef83b71..fb326fa 100644
+--- a/src/internal.c
++++ b/src/internal.c
+@@ -431,7 +431,7 @@ char *cleanpath(char *path) {
+ 
+ const char *xstrerror(int errnum, char *buf, size_t len) {
+ #ifdef HAVE_STRERROR_R
+-# ifdef __USE_GNU
++# ifdef __GLIBC__
+     /* Annoying linux specific API contract */
+     return strerror_r(errnum, buf, len);
+ # else
+-- 
+2.37.3
+
diff --git a/meta-oe/recipes-support/augeas/augeas_1.12.0.bb b/meta-oe/recipes-support/augeas/augeas_1.12.0.bb
index d32c4691d2..2c6d4cdc88 100644
--- a/meta-oe/recipes-support/augeas/augeas_1.12.0.bb
+++ b/meta-oe/recipes-support/augeas/augeas_1.12.0.bb
@@ -1,4 +1,36 @@
-require augeas.inc
+SUMMARY = "Augeas configuration API"
+HOMEPAGE = "http://augeas.net/"
+BUGTRACKER = "https://fedorahosted.org/augeas/report/1"
 
+LICENSE = "LGPL-2.1-or-later"
+LIC_FILES_CHKSUM = "file://COPYING;md5=bbb461211a33b134d42ed5ee802b37ff"
+
+SRC_URI = "http://download.augeas.net/${BP}.tar.gz \
+           file://sepbuildfix.patch \
+           file://0001-src-internal-Use-__GLIBC__-to-check-for-GNU-extentio.patch \
+          "
 SRC_URI[md5sum] = "74f1c7b8550f4e728486091f6b907175"
 SRC_URI[sha256sum] = "321942c9cc32185e2e9cb72d0a70eea106635b50269075aca6714e3ec282cb87"
+
+DEPENDS = "readline libxml2"
+
+inherit autotools pkgconfig
+
+PACKAGES =+ "${PN}-lenses lib${BPN}"
+
+FILES:${PN}-lenses = "${datadir}/augeas/lenses"
+FILES:lib${BPN} = "${libdir}/lib*${SOLIBS}"
+
+RDEPENDS:lib${BPN} += "${PN}-lenses"
+RRECOMMENDS:lib${BPN} += "${PN}"
+
+LEAD_SONAME = "libaugeas.so"
+
+do_install:append() {
+    rm -fr ${D}${datadir}/vim
+}
+
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)}"
+PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux"
+
+EXTRA_AUTORECONF += "-I ${S}/gnulib/m4"
-- 
2.37.3


