Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39D13C38142
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 05:54:58 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.96464.1674798891123466735
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Jan 2023 21:54:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=duyAyAh2;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id j5so3602451pjn.5
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Jan 2023 21:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vw/EPCRcySJR2taKRvcF7zGWK+jFTVoAHgAbxUzqYCo=;
        b=duyAyAh2wBdQuyqRM2s06LtxKHmPhwb2OuWNy/OAgBDXrb5fpMbS1ny9wEpT2sXQUN
         qZQ6HbDgxRlaTWHghLMVMXCUbY1n5xZmXhT0IaQPu6VobOuiA4fyAAvQrOSO1CyZimU0
         HUc/qB4MqgG41U5K0sXkvR8ZzS3cvgyUXDZO3Sin55toep1vkzEikgeAGmdcUoM2TT/o
         02P+R/c/UAjZdexdinJ5wj6/W0hjfImzk6EszYwuC3dswDdUu8J+APuh083g1vuhHM2y
         tOxFS2TII2dtQpzeB5W8kSSYyS70PUimIA3OwbHooMFTR0ni4ZjrZPLP5EhHuUTu09iQ
         qfwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vw/EPCRcySJR2taKRvcF7zGWK+jFTVoAHgAbxUzqYCo=;
        b=2pBq6TJ5BLX0hgkk3jQPxU/b8f3mdUujFJZJtVajn+ZxF+TuUJ7VERqXDEiiJsQKsK
         vHHjt+4XI9lEv0X6pqnoxARRWBJAjSLpuzZhkKvGcHxhq1Kh0t2Si00TzRebOK1TrbeM
         u80q/Zsv/r84nEz7xHjOdJPUv2AmUBZAScqaPzqNIBbqJODnGmFsnKFFyh7Vmcj4FprI
         e/gTm4L/Tw74qHAXLYy5+PcqcC1OaJJu6Hclc2GUgJBE73+HujLchP5xGYc3bXznNgfH
         DwKlh4+Fdh2xZEKbbwSQEM3Z7lWS7UDxy/EsJFwifbAuS3yCnNHfWkalw1x2rmxLfz90
         1xiA==
X-Gm-Message-State: AFqh2ko6MN2A41M5ye+8D5T0SYYJQs7nAZLi5RlIOBnoIdlQvHpotScQ
	Q05TfZKA7MJ8+tmSeAR7m7Pl7Dg03Amb3g==
X-Google-Smtp-Source: AMrXdXt+zz9l/CxrIhJHFZb/E/jA4uo/y57NIFSjdbbBn1vQ0P+kKjFuJuiKxjG7tNPInpu8ChHZEw==
X-Received: by 2002:a17:903:11c7:b0:194:a531:4b39 with SMTP id q7-20020a17090311c700b00194a5314b39mr52077977plh.67.1674798890318;
        Thu, 26 Jan 2023 21:54:50 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id b13-20020a170902b60d00b001947982eb8fsm230074pls.60.2023.01.26.21.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 21:54:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 10/10] rwmem: Update to latest
Date: Thu, 26 Jan 2023 21:54:40 -0800
Message-Id: <20230127055440.2108933-10-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127055440.2108933-1-raj.khem@gmail.com>
References: <20230127055440.2108933-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Jan 2023 05:54:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100814

- Switch to using meson
- Fix build with gcc13
- Use packageconfig for enabling python support and static libs

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../rwmem/0001-include-missing-cstdint.patch  | 32 +++++++++++++++++++
 .../recipes-bsp/rwmem/rwmem_1.2.bb            | 26 +++++++--------
 2 files changed, 45 insertions(+), 13 deletions(-)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem/0001-include-missing-cstdint.patch

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem/0001-include-missing-cstdint.patch b/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem/0001-include-missing-cstdint.patch
new file mode 100644
index 0000000000..0560daa4c2
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem/0001-include-missing-cstdint.patch
@@ -0,0 +1,32 @@
+From 84e884f99e581515b49d8973538bb17e1e6c0dc0 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 26 Jan 2023 20:45:57 -0800
+Subject: [PATCH] include missing <cstdint>
+
+gcc 13 moved some includes around and as a result <cstdint> is no
+longer transitively included [1]. Explicitly include it for
+uint{32,64}_t.
+
+[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
+
+Upstream-Status: Submitted [https://github.com/tomba/rwmem/pull/7]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ librwmem/helpers.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/librwmem/helpers.h b/librwmem/helpers.h
+index a0a738b..8d02c9c 100644
+--- a/librwmem/helpers.h
++++ b/librwmem/helpers.h
+@@ -1,6 +1,7 @@
+ #pragma once
+ 
+ #include <cerrno>
++#include <cstdint>
+ #include <string>
+ #include <vector>
+ #include <string.h>
+-- 
+2.39.1
+
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb b/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb
index 7bca24cc0a..8ccdc27a8e 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb
@@ -11,25 +11,25 @@ In i2c mode rwmem accesses an i2c peripheral by sending i2c messages to it."
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-DEPENDS += "python3 python3-pybind11"
+DEPENDS += "fmt libinih"
 
 PV .= "+git${SRCPV}"
 
-SRCREV_rwmem = "3ec3e421211b58e766651c2e3a3a21acf14a1906"
-SRCREV_inih = "4b10c654051a86556dfdb634c891b6c3224c4109"
+SRCREV = "8416326777b2aada0706539b8f9f6acefa476b16"
 
-SRCREV_FORMAT = "rwmem_inih"
-
-SRC_URI = " \
-    git://github.com/tomba/rwmem.git;protocol=https;name=rwmem;branch=master \
-    git://github.com/benhoyt/inih.git;protocol=https;name=inih;nobranch=1;destsuffix=git/ext/inih \
-"
+SRC_URI = "git://github.com/tomba/rwmem.git;protocol=https;name=rwmem;branch=master \
+           file://0001-include-missing-cstdint.patch"
 
 S = "${WORKDIR}/git"
 
-inherit cmake pkgconfig
+inherit meson pkgconfig python3native
+
+PACKAGECONFIG ?= "python static"
+PACKAGECONFIG[python] = "-Dpyrwmem=enabled,-Dpyrwmem=disabled,cmake-native python3 python3-pybind11"
+PACKAGECONFIG[static] = "-Dstatic-libc=true,-Dstatic-libc=false,"
 
-do_install() {
-	install -D -m 0755 ${B}/bin/rwmem ${D}${bindir}/rwmem
-	install -D -m 0644 ${B}/lib/librwmem.a ${D}${libdir}/librwmem.a
+do_install:append() {
+	install -D -m 0644 ${B}/librwmem/librwmem.a ${D}${libdir}/librwmem.a
 }
+
+FILES:${PN} += "${libdir}/python3.11/site-packages/pyrwmem"
-- 
2.39.1


