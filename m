Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43D49C433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 22:48:15 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.1773.1646088493986216898
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 14:48:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XJJDp+Yu;
 spf=pass (domain: gmail.com, ip: 209.85.210.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id y11so12402607pfa.6
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 14:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Bvwj3OXFrP7AAVC461znKcBoHQHgBMWSJa+OF/edT6E=;
        b=XJJDp+Yug7Rq7Zf6CIiVWC9ohZRD2xczNBg91W2n6rXVJwv8vicwsvskEQU9razMyb
         o9hIB+tBkCu9A2h7Wjq96DwI8StDQM9bU+kf7eLVq+jZ/Nfsg4g7YQev5ompFhnQ53V0
         9XutGKt3E3b5M69JJ2fsYXgyIEjje+5KwKT9mdMGqzkgJlBOBQBwbzPDnDWhtI4BQ9OP
         fxVBexEkrq35MjaYQKHS0rrZ/3TJWg3g+mscwWucznTqs0YRCDQTgPyf7Ko86lCSE3BB
         P3iYjL4nmwU1R3QEs5G52LmV6pi9bfUBrC3rpoUwtBe5XEKrpV8k5F4+Hob2LTHJRk9a
         1c3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Bvwj3OXFrP7AAVC461znKcBoHQHgBMWSJa+OF/edT6E=;
        b=oMNTlwr3tPZyZuKNuJVpIXROMSsL4GO8sMDyCjAcTVs6syGn0Gbr6UndXQs4Fcr6wN
         pqGlvFMDVT8KhoelnnF1+IZbJ/melCgPJrtmNJ7EjqlK7yv0r5cYtaZRF1HNgD8xX+J/
         yhtqU5IyUi5fNWKZ/mvC5Wzikg6i0rD+U7Z5LkrSNvYNcuhezGFR2uN4mC+Peglj3tJ7
         GjPRlvYddFrCJKWozyfNHNNs5UEseFFRqBg67dzw4lyOJZD8Plw69WAb7R/wLR09jqyf
         5dqLSEhP/UxDh+7Pw/YJ8d1rn7vKEzNpStffUX/kZzJX/8J8IoS+yXq3Tlvej43nIGbJ
         IntA==
X-Gm-Message-State: AOAM531cpLEGiwNC0gesWgyvkLeLIdidr3jFVXlsnBAeGY0CqpO6iAAg
	r4zNlWWJJc/OE/Ax4IxCXHLO2rzQxcKGDg==
X-Google-Smtp-Source: 
 ABdhPJzVVC+wlU+1D6JKc1DF87AlYOttv4kEyjJL0KPuuInSwlcApAXDkEXDBvBO5FnGvSIwF83+5g==
X-Received: by 2002:a63:9245:0:b0:377:7e40:1905 with SMTP id
 s5-20020a639245000000b003777e401905mr14833299pgn.139.1646088493235;
        Mon, 28 Feb 2022 14:48:13 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1a20])
        by smtp.gmail.com with ESMTPSA id
 l9-20020a655609000000b0037589f4337dsm11470769pgs.78.2022.02.28.14.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 14:48:12 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Justin Bronder <jsbronder@cold-front.org>
Subject: [meta-python][PATCH] python3-termcolor: Use setuptools instead of
 distutils
Date: Mon, 28 Feb 2022 14:48:10 -0800
Message-Id: <20220228224810.218466-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Feb 2022 22:48:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95606

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Justin Bronder <jsbronder@cold-front.org>
---
 ...-Use-setuptools-instead-of-distutils.patch | 27 +++++++++++++++++++
 .../python/python3-termcolor_1.1.0.bb         |  3 ++-
 2 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-termcolor/0001-setup.py-Use-setuptools-instead-of-distutils.patch

diff --git a/meta-python/recipes-devtools/python/python3-termcolor/0001-setup.py-Use-setuptools-instead-of-distutils.patch b/meta-python/recipes-devtools/python/python3-termcolor/0001-setup.py-Use-setuptools-instead-of-distutils.patch
new file mode 100644
index 0000000000..a55a6a914b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-termcolor/0001-setup.py-Use-setuptools-instead-of-distutils.patch
@@ -0,0 +1,27 @@
+From e30308284c721210e2ba50d8b3d159cedf5eada8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 28 Feb 2022 14:44:42 -0800
+Subject: [PATCH] setup.py: Use setuptools instead of distutils
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ setup.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index c4fe4ed..dad1d29 100755
+--- a/setup.py
++++ b/setup.py
+@@ -23,7 +23,7 @@
+ # Author: Konstantin Lepa <konstantin.lepa@gmail.com>
+ 
+ import os
+-from distutils.core import setup
++from setuptools import setup
+ 
+ prjdir = os.path.dirname(__file__)
+ 
+-- 
+2.35.1
+
diff --git a/meta-python/recipes-devtools/python/python3-termcolor_1.1.0.bb b/meta-python/recipes-devtools/python/python3-termcolor_1.1.0.bb
index 17df7f983d..15bab622a6 100644
--- a/meta-python/recipes-devtools/python/python3-termcolor_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-termcolor_1.1.0.bb
@@ -6,7 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=809e8749b63567978acfbd81d9f6a27d"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "043e89644f8909d462fbbfa511c768df"
+SRC_URI += "file://0001-setup.py-Use-setuptools-instead-of-distutils.patch"
+
 SRC_URI[sha256sum] = "1d6d69ce66211143803fbc56652b41d73b4a400a2891d7bf7a1cdf4c02de613b"
 
 BBCLASSEXTEND = "native"
-- 
2.35.1


