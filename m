Return-Path: <akash.hadke27@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B01A9D5E37A
	for <webhook@archiver.kernel.org>; Sat,  9 Nov 2024 17:32:57 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.21187.1731173567937618679
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 Nov 2024 09:32:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bWj9s3wU;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: akash.hadke27@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2e2a97c2681so2527542a91.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 09 Nov 2024 09:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731173567; x=1731778367; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6CYs1E1RaJmnyF6vLEmDfUi+Ueb/QWDfYwTWRYfQO7Q=;
        b=bWj9s3wUfonoMCUzXgHcHm8bkSZokPqmLr085zEIfVRL8aNGBTA0TS88XaVpPA4Rwg
         G4f/i711LyHS5+khdqD6orVsFKcf+G1y9apux3ZFEodNsl6cV6JlbhMQnOb5vxA5YlMv
         0nK83S7XiVJz/zudg6oJ+50JFNlH1By0s/QhFS5x2hllt2KyPfMlYYQnmInbTL7XHXy0
         RXnoKirYYqYaXX5HayGpO9K3SvZ9CKpmYBtf5s7XQBkMwlWY/wcYVbv+m5E0OKUtvj0V
         3NQKXH/oMeYQSKJ1E5GPj1Wwy4IqDc5WkcMW5kQu1So5k4ox8KQuBGSacV1VFSWDq2UX
         JbpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731173567; x=1731778367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6CYs1E1RaJmnyF6vLEmDfUi+Ueb/QWDfYwTWRYfQO7Q=;
        b=VgyWSQXSBUbqTpIr6kn45s/bOMcouuCTgCEUGoFUcnDNBVhY0G3V36ikB1RgpDH9UH
         ytQM69mz3PcRiNZyabhfwoSkWG99eBBo4osugdUSpBI4eEFa4UT7qOIGyPj45KldLrPH
         fsVJvxv56dHvTB3/qifo6d4RP4ecokojHZZu2+wzHX3Pie2tJ0F1e70oHdHhehszhCfK
         dh6yguVaYNR66vDli4nqlH2ZKks61VvA036dR1lmul1BogVD7jxmWAyQ6XFZTmzV4vci
         CIWRlDFVn3XR1s3Ji1FCccCgavalphk3wJqz+cjtmj0DMdP8jlhSVKz7ZQkzrUroioRh
         SSpg==
X-Gm-Message-State: AOJu0YzJMWK8HpH0/BC3YPwTMm0/p3gjKPbAGFcuw7+aYUCN/a8jBnHH
	AjYYa9EmmcLO7gVQg1tkYI+zqa06Cn6xg5XeKgTLrEEBStcQBGZs631h3g==
X-Google-Smtp-Source: AGHT+IGGYmD9yZ7RsGQIqB7CL+3plNiABxIIER/eHdYB/SuvShqUjWsRq75AtpLREJpZeQxAkuiTZQ==
X-Received: by 2002:a17:90b:17c8:b0:2e2:c406:ec89 with SMTP id 98e67ed59e1d1-2e9b16ab101mr9898614a91.20.1731173566698;
        Sat, 09 Nov 2024 09:32:46 -0800 (PST)
Received: from L-18010.kpit.com ([42.107.86.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9a5fd1a74sm5560607a91.36.2024.11.09.09.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2024 09:32:45 -0800 (PST)
From: Akash Hadke <akash.hadke27@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Sana Kazi <sanakazi720@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH] libp11: Treat all openssl-3.x releases the same
Date: Sat,  9 Nov 2024 23:02:05 +0530
Message-Id: <20241109173205.2393515-1-akash.hadke27@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 09 Nov 2024 17:32:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113774

From: Sana Kazi <sanakazi720@gmail.com>

OpenSSL's soversion will not change for any 3.x minor release.

https://www.openssl.org/policies/general/versioning-policy.html

Signed-off-by: Sana Kazi <sanakazi720@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c3e4879c5c7abbf57b0c2633a66137e302604e0a)
Signed-off-by: Akash Hadke <akash.hadke27@gmail.com>
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


