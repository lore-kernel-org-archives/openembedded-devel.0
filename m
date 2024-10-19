Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDD87D3C911
	for <webhook@archiver.kernel.org>; Sat, 19 Oct 2024 12:49:02 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.1876.1729318797126974593
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 23:19:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j6szfdk5;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: sanakazi720@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-71e5a1c9071so2167236b3a.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 23:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729318796; x=1729923596; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Iwg6uTldXgeFo5WlhgI5DCFIudzz8+n++BRHHe1q83I=;
        b=j6szfdk5uaYxZzPu9bKUtVLlQbuO0XB8Bm8X504a3ProVEtUj1gEusC6+4hAsNfACK
         Hq6oG+19A93Rr/nuBpmWT9g0rGRltTGddszTIBw/1Ohi6LlbqJEgpnVlV3ZI3bDTmdzM
         i0IxlWMVimTlvjg+WNxhEVUXq+l4iCiG55L2+XnYBrNw+cy55J2R1o4ukLYsB5JI0yeg
         Kg8CHR9JgusBbm1CpDz4ujpy/joEDFpRZbgkD7qD6vJhDAQ8m9MWXEhiey//d7Gy+YY4
         2DC7U+O0SVQHIMfyNM7PQRo8pjmnc9vYwRnWmZpHV+Bw97+0yz3RalXxYbUv8JGl81WJ
         kmFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729318796; x=1729923596;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Iwg6uTldXgeFo5WlhgI5DCFIudzz8+n++BRHHe1q83I=;
        b=e3slXgZior9QRnvBx5JpCS8pwtb5HOs8USQpqTp9Iiwu6UnR6+9cvB9PV/GjPm5vyL
         fukfjF9FpCt/geb6Mlk8l8NMDFDijyEQpAdskJ5Bl4K63JTOFyt5gXx46H9lHjqPsOfG
         24pdRRAp3f+cY3hBgdmUyZz/j+FN2WEU7O5FEk0e/14kH0ZUIYQZoefODCkrvzDSC6tW
         5BZHhpAKGoqNNFd0SLJqCL+nklJ+iedJSKPoJNWfZzWNPtFv2LYWb5S/SS/uPle3K4jH
         mihmrRKLOGmu7PswxEhBz0taxam9AkIzbFIoM5rFehIZ/YUkj6ImTIgVfVdggAopmnj1
         6Hxg==
X-Gm-Message-State: AOJu0Yz+69L4tSyK0jVRlVTXkBKIx+XIeo2I7xkxfxlDXIYXj1BknvzS
	YG/Z74GgGSNtICxAKda3wZIS6eAWxSUqwI62GeQDAPg+TvG+l1rrlRA2Yw==
X-Google-Smtp-Source: AGHT+IHon4MS7RLRsrndSGzWbpoY/fQlY958foyKgaLvNZjDvFdGPBB6F0kA0fL48dtyfFftMt4rmA==
X-Received: by 2002:a05:6a21:1707:b0:1d9:275b:4eef with SMTP id adf61e73a8af0-1d92c4e1424mr6142158637.14.1729318796174;
        Fri, 18 Oct 2024 23:19:56 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c17:8115:96a1:8120:10eb:a55b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ea333cfbesm2443332b3a.59.2024.10.18.23.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 23:19:55 -0700 (PDT)
From: "Sana Kazi" <sanakazi720@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Sana <sanakazi720@gmail.com>
Subject: [meta-oe][scarthgap][PATCH] configure: treat all openssl-3.x releases the same
Date: Sat, 19 Oct 2024 11:49:45 +0530
Message-Id: <20241019061945.146707-1-sanakazi720@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Oct 2024 12:49:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113058

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


