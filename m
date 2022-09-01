Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D08E8ECAAD3
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 17:55:08 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.15651.1662054901527114171
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Sep 2022 10:55:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jZcqiwAY;
 spf=pass (domain: gmail.com, ip: 209.85.210.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id w139so2074669pfc.13
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Sep 2022 10:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=2+bCqifL0XLzdeMX3owWw+JL2iZ9coBZEbTJkd4DsNc=;
        b=jZcqiwAYfdmwMDTHMCyqWwyk/fBcUaeULKv6WmC5sPNgNOrWtUM2I0DS+yuS7XRTLW
         kKWO8tacHkkQcJLEBxpHPxMrKSj9H9lILR5PJQc5Zgqp+uEI1zQcbp+gTuZAsvUvOXOp
         l++BqOjkLStjOBAf5fIJWnm1OQrp0OiXExiJme2yep4cbTtPVZd2utNAsUTeWaBAFXyY
         ie78JbuZalSTwpQBycrfl55ru4oJKxeMnZ/AsnAILiguxQZkUbRg0Qh09vikOmaq0rnq
         kdcqdN70DGrQ58KjVfS6Nlzs4DhiG9JpV0oMdECgH9CMFWtDyCGE+FenVhrvkiDAutMB
         FJ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=2+bCqifL0XLzdeMX3owWw+JL2iZ9coBZEbTJkd4DsNc=;
        b=imom2RGn5I1LJbCDMHedZmjhid2OSc0yJiW5Il1+yuJSHlawzixGVXyO6xx0lT8xm6
         gp9r9TSjmKVTiI0FJEBMsEWjMRSVTjNr+0UlEFa956LGICGTBqtunoE14667SduoeV0W
         5PbkTbP+VZeVPcRSFHavWPYOuY7KuMbGtfo9pk1/z6uBUbzQi0CYd2WIt57qYXoC9BaC
         Ugjys45DkOv3DgASxLIm0WhhITh2dvviIyqcGcwhphJwNc/x+Da19j4ptCWBAVMGu6dD
         410b7Ay7PDlJdmEgZHR+95btOjWJiv083jt0hNIWqVSVMOlc/UQ2i86xnsIJwz86E4rk
         iqiQ==
X-Gm-Message-State: ACgBeo3fKGAyM9AalOZPiTBTLWPMea0r2+xNWNKFA1Aupn0vhmnhfSi5
	uhTYPgDZmmHIPGeLHsgaKlkBRzd4Hq7eKA==
X-Google-Smtp-Source: 
 AA6agR7p4PCV820NIzEJxYCN8+wOHL+9+ahYw/ng52ERVV6smWqP9br0wlv38d+M3ZeSlhQkg8Em7Q==
X-Received: by 2002:a62:188f:0:b0:536:ee23:e3ed with SMTP id
 137-20020a62188f000000b00536ee23e3edmr32163236pfy.33.1662054900438;
        Thu, 01 Sep 2022 10:55:00 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::24e6])
        by smtp.gmail.com with ESMTPSA id
 n5-20020a622705000000b00537eb0084f9sm11592623pfn.83.2022.09.01.10.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 10:55:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-xfce][PATCH 1/2] xfce4-dev-tools: Fix configure check for
 libX11
Date: Thu,  1 Sep 2022 10:54:57 -0700
Message-Id: <20220901175458.158577-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Sep 2022 17:55:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98585

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...or-a-function-provided-by-libX11-in-.patch | 35 +++++++++++++++++++
 .../xfce4-dev-tools/xfce4-dev-tools_4.16.0.bb |  4 ++-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools/0001-m4macros-Check-for-a-function-provided-by-libX11-in-.patch

diff --git a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools/0001-m4macros-Check-for-a-function-provided-by-libX11-in-.patch b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools/0001-m4macros-Check-for-a-function-provided-by-libX11-in-.patch
new file mode 100644
index 0000000000..43b1eb505a
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools/0001-m4macros-Check-for-a-function-provided-by-libX11-in-.patch
@@ -0,0 +1,35 @@
+From 8f58e1b5c15fc3b6f775207971d078c058d9eb7b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 1 Sep 2022 08:21:56 -0700
+Subject: [PATCH] m4macros: Check for a function provided by libX11 in
+ AC_CHECK_LIB
+
+checking for main is not ideal, since its not a function from libX11
+moreover with newer versions of autoconf this will start to fail [1], so
+change this to use XFree API which is provided by libX11 and seems more
+relevant to check here.
+
+[1] https://lists.gnu.org/archive/html/autoconf-patches/2022-08/msg00018.html
+
+Upstream-Status: Submitted [https://gitlab.xfce.org/xfce/xfce4-dev-tools/-/issues/57]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ m4macros/xdt-depends.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/m4macros/xdt-depends.m4 b/m4macros/xdt-depends.m4
+index 3c07c90..ce1b272 100644
+--- a/m4macros/xdt-depends.m4
++++ b/m4macros/xdt-depends.m4
+@@ -213,7 +213,7 @@ AC_DEFUN([XDT_CHECK_LIBX11],
+ 
+   LIBX11_CFLAGS= LIBX11_LDFLAGS= LIBX11_LIBS=
+   if test x"$no_x" != x"yes"; then
+-    AC_CHECK_LIB([X11], [main],
++    AC_CHECK_LIB([X11], [XFree],
+     [
+       AC_DEFINE([HAVE_LIBX11], [1], [Define if libX11 is available])
+       LIBX11_CFLAGS="$X_CFLAGS"
+-- 
+2.37.3
+
diff --git a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.16.0.bb b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.16.0.bb
index 5c41a76ed6..586a77efc6 100644
--- a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.16.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.16.0.bb
@@ -11,7 +11,9 @@ inherit autotools pkgconfig
 
 BBCLASSEXTEND = "native"
 
-SRC_URI = "http://archive.xfce.org/src/xfce/${BPN}/${@'${PV}'[0:4]}/${BPN}-${PV}.tar.bz2"
+SRC_URI = "http://archive.xfce.org/src/xfce/${BPN}/${@'${PV}'[0:4]}/${BPN}-${PV}.tar.bz2 \
+           file://0001-m4macros-Check-for-a-function-provided-by-libX11-in-.patch \
+           "
 SRC_URI:append:class-target = " file://0001-Run-native-xdt-csource-on-tests.patch"
 SRC_URI[sha256sum] = "f50b3070e66f3ebdf331744dd1ec5e1af5de333965d491e15ce05545e8eb4f04"
 
-- 
2.37.3


