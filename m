Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E15C1CAC5AD
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 11:24:02 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.11620.1758194633729376783
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Sep 2025 04:23:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Iw34LEIk;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b07c2908f3eso124678066b.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 04:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758194632; x=1758799432; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MGQcU6l29qSLXQB2t91Pe6iQt1+aajZIYgXNpWttNsw=;
        b=Iw34LEIksyXsf5XOh01va1Z0gHWF917ZGheagDp/k+TYjM5l9UKQeyVL/1DArEcj7v
         hUq4RTHr2wq4ro7zkUNUcqS7nNH4WDggFQ0Kpr3E2BjAuS4uP3Ft7mF8UJVjO/U2eAb0
         2rJMLZQfwYaJr6nVn1jyXk3+nOC87uAAboG/7p1ZhA8orSEt0HQQLqvEHZ1NeLd6QWK5
         H2V+W7BSW5c1VYuSDBIRlJJDP9uhp6lo4XO0AC9q9eu/78ILhdVQkuL1RGj9hh11z9Gl
         QYRB1sn+Nn9S0MEkm20q13gId16k7sIC5rwkOyklcQ92RBWBCTo3dQQhEO5I03U4gnHn
         YC5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758194632; x=1758799432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MGQcU6l29qSLXQB2t91Pe6iQt1+aajZIYgXNpWttNsw=;
        b=VNPtx/AWB/KuXeBRGBe20HvslTJJjgKu8oP4ey1oM2aDeUzGBuq0+isCrjH2d2sHbB
         Pv+8mtM+9wG598tf3gh7pCC3ShQRPp+N6nW9nResdCeaLx169hMsl8krUw9bybWUGjyX
         CP2qW5AEXIh2WLBBC+jNUWm9qnnJLv8fxi2HHWay2zIMf+Mg9mws5nYA4DsFbev4+JDt
         dXtN0lm8M/G3UsJ/Jo/Qa1PVvt9smT/GGX4j66XG71+z+IG4Zr6qfQky2RmU4u2MBH1z
         CoMOAkEZfYFD588x1SlhqvZH48WHed3DOpg4qSF/kruOPLaw3t+nJjI4BxBjIiRnhqTt
         zXMQ==
X-Gm-Message-State: AOJu0YwguHmtszu+hSech4y5hQK2Krb3v+eQFUMFs6sEID20O61vmkrD
	AQCwMM9D/Utvd2c1zy4BXRwHh8lNzkyPpjsW/h7WxQ1dWiyZvHFmktaOi4HVeQ==
X-Gm-Gg: ASbGnctlrWO0eKVMr2aaPxVjeoN2W8OzTka8YIj1qwbDV0oSR9YUDUEbKrEiqM78hG5
	99Z6S+TuwLGvAI+YeuHHA56tbWD/tztxUhxkY7UVlt6DzKa2KlzB6MVLLzeZC3RltqcKZj+6bu1
	ayAsQTdelsAsZSNirSAoPV6b5ApAu8pPZNP1plwb94CvNdZiopm4Qg9ganAdxxPYsRIIivefeNm
	fgha8sKNFDzuQnQzc18WVUva2IXuDhg4+85FllkOJahi9lDPgsglRt6sSeyhexyF6ia0wycPvbk
	u1nxtNhyoGrLAJQRJeTH5A90HnLH+GkSF7MriQHBcVJBE5Ep22ptHN7HG3TgX+dVBbYx/DhbcCl
	kvd7J++6OaTVKkDwf2XFfZq+aeBsTJ3A/+8dI4eg=
X-Google-Smtp-Source: AGHT+IFmuF7GYBtT6YQfZDcjj2quy+uK08Z0cWsm2WkPhs9YOAPcjn1+hy58vhmwdKhiD8zO0UlXyw==
X-Received: by 2002:a17:907:d94:b0:b04:6e60:4df1 with SMTP id a640c23a62f3a-b1bbe403937mr565824866b.53.1758194631956;
        Thu, 18 Sep 2025 04:23:51 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fc75ac5e1sm180410366b.43.2025.09.18.04.23.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 04:23:51 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 05/10] augeas: Check for __GLIBC__ to use gnu extention for strerror_r
Date: Thu, 18 Sep 2025 13:23:39 +0200
Message-ID: <20250918112347.1331393-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250918112347.1331393-1-skandigraun@gmail.com>
References: <20250918112347.1331393-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 11:24:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119564

From: Khem Raj <raj.khem@gmail.com>

Merge .bb and .inc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit aca683fb18c3a62874e6687e36fb4c35a25d0615)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
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

