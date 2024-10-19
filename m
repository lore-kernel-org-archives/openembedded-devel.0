Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C918D3C91E
	for <webhook@archiver.kernel.org>; Sat, 19 Oct 2024 16:10:34 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.8235.1729351988354876945
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Oct 2024 08:33:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i0twFt77;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: sanakazi720@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7ea79711fd4so2194124a12.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Oct 2024 08:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729351987; x=1729956787; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9Icrc75w5zBgjvkjF51gtkMysjC+uDq8KJP1gdFbd9c=;
        b=i0twFt77y2N8tCay3B1BIMvnoosIcwWiMCAEyW2NnkdRobBQiFP8WbCXDi8i5aflAT
         9cUlAiK/by+Kq9f2mEbR1l1iX3TPfROqJw2oNGEQyF/N2OLZZFckAE+NMOD+xKFEVooF
         rGaU2xBu5SNbckzsbO3ZDBOhHusqb+EZ0zh6lWD/xkV2uwfDhYv6R8azmd2KqSW0wqDS
         YWKW+Z1gekuSozJdXhGN7QQPhA7o0BIsSWowSUARmUaHJkJ5hELK9FPaXCImiVjj7W0e
         a4R7c7Io1juA3asLC1fhmp4l7mvcSlMbIzm5CtFC+MtYQBbRWIgnfIKsr7zXDVLv7pDT
         S1gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729351987; x=1729956787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Icrc75w5zBgjvkjF51gtkMysjC+uDq8KJP1gdFbd9c=;
        b=XNSSw8N9Jd6MdOeSydMd6stuscbWlzRld8lMQwNULd/6lxJSS18yJ0KtnznXoy5NVX
         MFFp71Vx51nIrJC23x+3Sdl1kjgQrG5BSb4mPE+Nu4hnoVHyGbDosGzT8C/BXzMoxbo7
         Zb+i2csoQ7ttOg/FRGD/BqiPr+WEto9yF1oomN6sHijlm2ZOHllZJGSwCZORIr8CPJLU
         /pEMOuKk9nJK4cjvXZmJe0+4ySTbsdf+7nzievpamfxKbYbqq1X7DeWvVYXlCEP1eImU
         IXywDqOlkTsaFPw92HshoAvK5sYQjIxXXz87yFLliO4XjtLViDxIZ04nc87CYE9Ee77e
         osZg==
X-Gm-Message-State: AOJu0Yy2oPVWMq+tbzqUAF+hZGZqi4g/Q8hoNnO2RSR+nuucYc5tG7uj
	VXdzoDkdAXpzRoJsgXvR3woqrDNeEDP0PdJVdSKBVW0cx7Gjq7w0z+KjtA==
X-Google-Smtp-Source: AGHT+IGNoCPMiJtURRYKp/nlhas7JlyQkPg6KuuQjOIBCQvi+KNrnmp+EYxGqMaVTeRqwe0kDw1BDA==
X-Received: by 2002:a05:6a21:1693:b0:1cf:4ad8:83b9 with SMTP id adf61e73a8af0-1d92c5abf0dmr8468805637.43.1729351987272;
        Sat, 19 Oct 2024 08:33:07 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:889e:cf08:f857:4c84:b1f5:90a8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7eacc22a5c9sm3074480a12.32.2024.10.19.08.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 08:33:06 -0700 (PDT)
From: "Sana Kazi" <sanakazi720@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Sana <sanakazi720@gmail.com>
Subject: [meta-oe][scarthgap][PATCH] configure: treat all openssl-3.x releases the same
Date: Sat, 19 Oct 2024 21:02:31 +0530
Message-Id: <20241019153231.175637-1-sanakazi720@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Oct 2024 16:10:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113060

OpenSSL's soversion will not change for any 3.x minor release.

https://www.openssl.org/policies/general/versioning-policy.html

Signed-off-by: Sana <sanakazi720@gmail.com>
---
 .../0002-detect-correct-openssl-3.x.patch     | 28 +++++++++++++++++++
 .../recipes-support/libp11/libp11_0.4.12.bb   |  4 ++-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/libp11/files/0002-detect-correct-openssl-3.x.patch

diff --git a/meta-oe/recipes-support/libp11/files/0002-detect-correct-openssl-3.x.patch b/meta-oe/recipes-support/libp11/files/0002-detect-correct-openssl-3.x.patch
new file mode 100644
index 000000000..b56e2602d
--- /dev/null
+++ b/meta-oe/recipes-support/libp11/files/0002-detect-correct-openssl-3.x.patch
@@ -0,0 +1,28 @@
+From 74497e0fa5b69b15790d6697e1ebce13af842d4c Mon Sep 17 00:00:00 2001
+From: Mike Gilbert <floppym@gentoo.org>
+Date: Thu, 13 Jul 2023 13:52:54 -0400
+Subject: [PATCH] configure: treat all openssl-3.x releases the same
+
+OpenSSL's soversion will not change for any 3.x minor release.
+
+https://www.openssl.org/policies/general/versioning-policy.html
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Upstream-Status: Backport [https://github.com/OpenSC/libp11/commit/74497e0fa5b69b15790d6697e1ebce13af842d4c.patch]
+Signed-off-by: Sana Kazi sana.kazi@kpit.com
+
+diff --git a/configure.ac b/configure.ac
+index b96979d9..c344e84a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -33,7 +33,7 @@ AC_C_BIGENDIAN
+ # issues with applications linking to new openssl, old libp11, and vice versa
+ case "`$PKG_CONFIG --modversion --silence-errors libcrypto || \
+        $PKG_CONFIG --modversion openssl`" in
+-       3.0.*) # Predicted engines directory prefix for OpenSSL 3.x
++       3.*) # Predicted engines directory prefix for OpenSSL 3.x
+            LIBP11_LT_OLDEST="3"
+            debian_ssl_prefix="openssl-3.0.0";;
+        1.1.*) # Predicted engines directory prefix for OpenSSL 1.1.x
diff --git a/meta-oe/recipes-support/libp11/libp11_0.4.12.bb b/meta-oe/recipes-support/libp11/libp11_0.4.12.bb
index 223778200..87b26bf01 100644
--- a/meta-oe/recipes-support/libp11/libp11_0.4.12.bb
+++ b/meta-oe/recipes-support/libp11/libp11_0.4.12.bb
@@ -9,7 +9,9 @@ LICENSE = "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fad9b3332be894bab9bc501572864b29"
 DEPENDS = "libtool openssl"
 
-SRC_URI = "git://github.com/OpenSC/libp11.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/OpenSC/libp11.git;branch=master;protocol=https \
+    file://0002-detect-correct-openssl-3.x.patch \
+"
 SRCREV = "53d65dc48cf436694f7edcfc805414e608e8a2bf"
 
 UPSTREAM_CHECK_GITTAGREGEX = "libp11-(?P<pver>\d+(\.\d+)+)"
-- 
2.25.1


