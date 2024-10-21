Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D157ED0E6FB
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 11:42:57 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web10.40587.1729493294889954154
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Oct 2024 23:48:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HaswJqgs;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: sanakazi720@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3e5fb8a4e53so1768283b6e.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 20 Oct 2024 23:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729493294; x=1730098094; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=M15FYXeN/qZmME6EMvJEdMIsVc0emQkKT88YU8lLZn4=;
        b=HaswJqgsJ4X+OWH8GNd0Ow7Cle+FQi338qRHmg7ZZQHLdWTHxVsGhl31NhHD7bIoky
         I2ZACMVp7kmvVTqdMPwRiRMxQtM1SOtwnuDsUuk/57MX6Wdv+hjNpN18YSPenKf919Qb
         oZT5qG+tYSIt0gopfg0aK1GCEcdGFns8h2fYpq8bP/qgrqtzcM/ho5l5171/RaIj6nqP
         uF4iwdyL8R1M6KM2qiIXQwAu9YhBjVPH0s16+5ZkY66wHAtj0sCoW/joCv6ZYueZrX8E
         nQw98ftdcD2L5egxRiomPR5VvIAxER1lJunbbgzn8uhiI4hQJ+rZqjcAerRt15YoErQb
         TJUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729493294; x=1730098094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M15FYXeN/qZmME6EMvJEdMIsVc0emQkKT88YU8lLZn4=;
        b=g0ZIbi96yyepDWhPaZw1pvss4w0Rvx3dPJglLPcIgtcxjM3jvNtWVbuEXZAiG4lX+d
         zUXR78TheIAfRXwjTutgTNL6WI3WZLXSQHCe3LPhSz0ufpgiXRI4RRQ+MAJLJ9Y/Ixlr
         Frmb/c4gkM49m+Q1iDOoHm3scP4kKURRVD1HAuCBCn6dSRLy5bYfxJbnoqxfo/7y9MDZ
         5T9D2TA8mi0bEQD3TheJvrrTBpMiSLexu3tnu1LIVG2NoLlRRl86nmEibA7D5JgbyZA5
         fdhVPDiX1de3OAk48cKlUETKIIbsP5h+xvtjlQmxXnsNhZyuWX0kzapcypIenvY/fJ8s
         b4Dg==
X-Gm-Message-State: AOJu0Yy3EU1xOc7L/QCKCLDCcxSBAkX3GS9L6AcA6n8XOxHe8Koql8Jo
	rtiWVQlAmLuKVKkP2+pWmgag/X+TRtjAwUy0tXd6iTnA1uUbSC9fhYO2Jg==
X-Google-Smtp-Source: AGHT+IF5cEIZLCBP9w517k763Xjvwzp+EGrmwmrg2KOthAeGfhLBPLENdPFWY/nGWpUwhWjUbqIESw==
X-Received: by 2002:a05:6808:15a6:b0:3e4:d82f:dabb with SMTP id 5614622812f47-3e602df135amr6463454b6e.39.1729493293618;
        Sun, 20 Oct 2024 23:48:13 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:889e:df9b:7faf:a425:80b1:3174])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7eaeaafbba8sm2252924a12.18.2024.10.20.23.48.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2024 23:48:13 -0700 (PDT)
From: "Sana Kazi" <sanakazi720@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][master][PATCH] libp11: Treat all openssl-3.x releases the same
Date: Mon, 21 Oct 2024 12:17:46 +0530
Message-Id: <20241021064746.859980-1-sanakazi720@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Oct 2024 11:42:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113075

OpenSSL's soversion will not change for any 3.x minor release.

https://www.openssl.org/policies/general/versioning-policy.html

Signed-off-by: Sana Kazi <sanakazi720@gmail.com>
---
 .../0001-detect-correct-openssl-3.x.patch     | 28 +++++++++++++++++++
 .../recipes-support/libp11/libp11_0.4.12.bb   |  5 +++-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/libp11/files/0001-detect-correct-openssl-3.x.patch

diff --git a/meta-oe/recipes-support/libp11/files/0001-detect-correct-openssl-3.x.patch b/meta-oe/recipes-support/libp11/files/0001-detect-correct-openssl-3.x.patch
new file mode 100644
index 000000000..aa61e9d97
--- /dev/null
+++ b/meta-oe/recipes-support/libp11/files/0001-detect-correct-openssl-3.x.patch
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
+Signed-off-by: Sana Kazi <sanakazi720@gmail.com>
+
+diff --git a/configure.ac b/configure.ac
+index b96979d9..c344e84a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -33,7 +33,7 @@ AC_C_BIGENDIAN
+ # issues with applications linking to new openssl, old libp11, and vice versa
+ case "`$PKG_CONFIG --modversion --silence-errors libcrypto || \
+ 	$PKG_CONFIG --modversion openssl`" in
+-	3.0.*) # Predicted engines directory prefix for OpenSSL 3.x
++	3.*) # Predicted engines directory prefix for OpenSSL 3.x
+ 	    LIBP11_LT_OLDEST="3"
+ 	    debian_ssl_prefix="openssl-3.0.0";;
+ 	1.1.*) # Predicted engines directory prefix for OpenSSL 1.1.x
diff --git a/meta-oe/recipes-support/libp11/libp11_0.4.12.bb b/meta-oe/recipes-support/libp11/libp11_0.4.12.bb
index 223778200..cc4a138e2 100644
--- a/meta-oe/recipes-support/libp11/libp11_0.4.12.bb
+++ b/meta-oe/recipes-support/libp11/libp11_0.4.12.bb
@@ -9,7 +9,10 @@ LICENSE = "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fad9b3332be894bab9bc501572864b29"
 DEPENDS = "libtool openssl"
 
-SRC_URI = "git://github.com/OpenSC/libp11.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/OpenSC/libp11.git;branch=master;protocol=https \
+    file://0001-detect-correct-openssl-3.x.patch \
+"
+
 SRCREV = "53d65dc48cf436694f7edcfc805414e608e8a2bf"
 
 UPSTREAM_CHECK_GITTAGREGEX = "libp11-(?P<pver>\d+(\.\d+)+)"
-- 
2.25.1


