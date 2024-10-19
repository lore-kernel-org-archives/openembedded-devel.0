Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6EABD3C910
	for <webhook@archiver.kernel.org>; Sat, 19 Oct 2024 12:48:52 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.1831.1729318287047358268
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 23:11:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KzgBeLLd;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: sanakazi720@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20cbb1cf324so24955995ad.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 23:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729318286; x=1729923086; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Iwg6uTldXgeFo5WlhgI5DCFIudzz8+n++BRHHe1q83I=;
        b=KzgBeLLd2/TGTCSDEF4Ir9qQ/bBwhkYoRLrepwjkKNn/uRt/YOtdgO63THCGI95XG4
         LxwTXio72UA0KfyaVK553Qyual0NMev2m9Jv7BH3U7wcOncuPnkgB49Uv6psD5cmMQ33
         iWa3GhgUMoLnzxHKpPkp89VRrUMXYxnynD8S5dPNzbymSY8XEyxHK5cbMQGDcLH/Kue0
         Sdz4k/h+or/Gpie/ASYWEIQJzoty+z5/i2FydOOEhOh/zO6n8otG+9flLrHyHF4V92fK
         FoOnIihinAl5vzVLFn1XOWjZ5YrayNJDdvaQ0xw3quKhZbgm8xOOjWDuV0D2mrnH9sW+
         UOfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729318286; x=1729923086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Iwg6uTldXgeFo5WlhgI5DCFIudzz8+n++BRHHe1q83I=;
        b=djSnmAcPUoySwsHV6kRaKLcwML5WgZnH1MYJlTarja43WXo6Y4pfzdLRbuFyZfAMnx
         pRUFCDQzFyJtVy8I08RDWHcBnUXaUb/OGP8pQb8DBpcTDe6UCbFAeb3FPVxK+plp9FZn
         wdDALkQJzWAT+2rfZfjlPI8aA2GDQMyVLar3cWIdPDO6LfNPKtYuKTHO9WOLmb5irBhi
         W+sqW8uKI4Fh+tTXkvQLYYfuic2wjiRm2GfUfBgFZuLTd/7T6Jtx7yuoaUm1TA4NydpQ
         hV3lCE+8OGT6xey+H3dcfEjz1cgmenQL0EUyUe335A1fVK3cw6XWU6us3jCySAR8Ph8T
         54TQ==
X-Gm-Message-State: AOJu0Yx437lYWYrF3mUKpgj0Kforo408UU4x++J9gh+fnZ3QDq88eCgV
	VrmluK77HD/qQftEGLdmFeNlU0a2jMsrDyH3bincN/CJoeond9GQEjwGAw==
X-Google-Smtp-Source: AGHT+IEey5AQF+UeodvjT3Xu4sJT51g8ssK9Wx4wxu550tSrnzcxpbUzZ+9SLIj2ZS4UPsh9YgvE8A==
X-Received: by 2002:a17:902:ecd0:b0:20c:d2e4:dc33 with SMTP id d9443c01a7336-20e5a7372a1mr55252555ad.14.1729318286251;
        Fri, 18 Oct 2024 23:11:26 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c17:8115:96a1:8120:10eb:a55b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e5a8de5b3sm21676345ad.159.2024.10.18.23.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 23:11:25 -0700 (PDT)
From: "Sana Kazi" <sanakazi720@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Sana <sanakazi720@gmail.com>
Subject: [meta-oe][scarthgap][PATCH] configure: treat all openssl-3.x releases the same
Date: Sat, 19 Oct 2024 11:41:06 +0530
Message-Id: <20241019061106.144661-1-sanakazi720@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Oct 2024 12:48:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113057

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
index 223778200..afab932a6 100644
--- a/meta-oe/recipes-support/libp11/libp11_0.4.12.bb
+++ b/meta-oe/recipes-support/libp11/libp11_0.4.12.bb
@@ -9,7 +9,9 @@ LICENSE = "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fad9b3332be894bab9bc501572864b29"
 DEPENDS = "libtool openssl"
 
-SRC_URI = "git://github.com/OpenSC/libp11.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/OpenSC/libp11.git;branch=master;protocol=https \
+    file://files/0002-detect-correct-openssl-3.x.patch \
+"
 SRCREV = "53d65dc48cf436694f7edcfc805414e608e8a2bf"
 
 UPSTREAM_CHECK_GITTAGREGEX = "libp11-(?P<pver>\d+(\.\d+)+)"
-- 
2.25.1


