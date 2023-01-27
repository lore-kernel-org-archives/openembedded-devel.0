Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEE12C54EAA
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 18:04:31 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.109334.1674842671068819965
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Jan 2023 10:04:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Gr2B0YB7;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id b24-20020a17090a551800b0022beefa7a23so9356285pji.5
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Jan 2023 10:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P9oygP9unV3XY7i2NXn8+/RZpaW2oqMF958CNq/aSc4=;
        b=Gr2B0YB75GAU391Cj9kvddl0nqe6ycO1evfgv+NDvHqr49pfR+1JjsJY42kLa2CgS9
         r8RUpvsIhNQ/WUjXMdMa7miq3mNM9gOHGkJHw/8OLF7nrW7RdZOhcOM2LxPCiDAebL4k
         AL3+Q4XMncY7J3HkpPNFMATAzvYJEB6nQkCCc0rQh4ZnOREonVBo6Hf+lAhu4i8AwDj5
         IvKeK8Qacq0a8Wn8X/4avAqxqkgJN63mQpW/u8myGE/rvVtKFx0vGmTrU4XEPf+teoB/
         GwbobEK+YGL9CrIzKGam2DZq35fX1dJrNMhxeVGOraEIc9c6bGxi2L5dEZwWzkkGiCjz
         uHcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P9oygP9unV3XY7i2NXn8+/RZpaW2oqMF958CNq/aSc4=;
        b=5nU3kWQLXDaOHuiq29Q8xjU7fZPcx4VFcjSwM4jQLOTzaVEvgeORYVgFjzNeLZctns
         3fu1YGBU9sUIZ/ppKFuz3sPIaekSq54U+RL7zPYE4zEgHdfPoevDOZgTAqtnfx+/zGG6
         qSzhYhBePaAYtbx9Y091E6KGMtg1uja2JUeYlbUDhDs5TALuU4zGa47+S3tRdRXq5kn9
         +Ae8jM7q1IOvasuiiWGF9t1ldET1aj079NOYpjD6j+tPS7L4QiEMNoS/MX9WnVrCzI6+
         YaFqfhf9qaI8ivpbvdMsNhy5mwLU9CSewZbwDCQk3HYAaYyxxtEWM81AccMDaJdoXUSz
         yN5w==
X-Gm-Message-State: AFqh2kozoQIx6P1j9JmpGMht52Z+t1TjVKzqwLXdfXMbYtbAtZkExfwZ
	GruSvRYIsiRVcri/GQZTW1XfT1tibmktTg==
X-Google-Smtp-Source: AMrXdXv7WNEQBTDJQnbTwbk6xFwIFkjqlQTf+rVGSmhon93ypHjiqAGK30q8jd86erK2gB88UBKfZQ==
X-Received: by 2002:a17:902:9b97:b0:193:3314:540d with SMTP id y23-20020a1709029b9700b001933314540dmr38012045plp.51.1674842670303;
        Fri, 27 Jan 2023 10:04:30 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id iy15-20020a170903130f00b00186748fe6ccsm3163554plb.214.2023.01.27.10.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 10:04:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/4] usbguard: Fix build with gcc13
Date: Fri, 27 Jan 2023 10:04:25 -0800
Message-Id: <20230127180426.754319-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127180426.754319-1-raj.khem@gmail.com>
References: <20230127180426.754319-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Jan 2023 18:04:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100825

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-include-missing-cstdint.patch        | 45 +++++++++++++++++++
 .../usbguard/usbguard_1.1.2.bb                |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta-oe/recipes-security/usbguard/usbguard/0001-include-missing-cstdint.patch

diff --git a/meta-oe/recipes-security/usbguard/usbguard/0001-include-missing-cstdint.patch b/meta-oe/recipes-security/usbguard/usbguard/0001-include-missing-cstdint.patch
new file mode 100644
index 0000000000..5cbe64091c
--- /dev/null
+++ b/meta-oe/recipes-security/usbguard/usbguard/0001-include-missing-cstdint.patch
@@ -0,0 +1,45 @@
+From 1da0cfbb9ae978822d961d8b22d8d5125c11247a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 26 Jan 2023 23:46:56 -0800
+Subject: [PATCH] include missing <cstdint>
+
+gcc 13 moved some includes around and as a result <cstdint> is no
+longer transitively included [1]. Explicitly include it for
+uint8_t.
+
+[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
+
+Upstream-Status: Submitted [https://github.com/USBGuard/usbguard/pull/583]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/Library/Base64.cpp | 1 -
+ src/Library/Base64.hpp | 1 +
+ 2 files changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/Library/Base64.cpp b/src/Library/Base64.cpp
+index ddb28dc..0246a13 100644
+--- a/src/Library/Base64.cpp
++++ b/src/Library/Base64.cpp
+@@ -22,7 +22,6 @@
+ 
+ #include "Base64.hpp"
+ #include <stdexcept>
+-#include <cstdint>
+ 
+ namespace usbguard
+ {
+diff --git a/src/Library/Base64.hpp b/src/Library/Base64.hpp
+index 0947f21..e0c745c 100644
+--- a/src/Library/Base64.hpp
++++ b/src/Library/Base64.hpp
+@@ -23,6 +23,7 @@
+ #endif
+ 
+ #include <string>
++#include <cstdint>
+ #include <cstddef>
+ 
+ namespace usbguard
+-- 
+2.39.1
+
diff --git a/meta-oe/recipes-security/usbguard/usbguard_1.1.2.bb b/meta-oe/recipes-security/usbguard/usbguard_1.1.2.bb
index e1e087a6d0..4e96b4f41e 100644
--- a/meta-oe/recipes-security/usbguard/usbguard_1.1.2.bb
+++ b/meta-oe/recipes-security/usbguard/usbguard_1.1.2.bb
@@ -12,6 +12,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "https://github.com/USBGuard/usbguard/releases/download/${BPN}-${PV}/${BPN}-${PV}.tar.gz \
+    file://0001-include-missing-cstdint.patch \
     file://0001-Add-and-use-pkgconfig-instead-of-libgcrypt-config.patch"
 
 SRC_URI[sha256sum] = "dcf5c90f3f93030e04df1baeb8d388b678c40dd48b135ea12a7be7dee8944934"
-- 
2.39.1


