Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59F0FC79FB7
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 18:26:14 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19478.1788978365113898752
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Sep 2026 11:26:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=m1I40oap;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b7674fcb26so1050438e87.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 11:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788978363; x=1789583163; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KK/UIhFgBD8eoHEoSy0j4ptrmD+X96xbO4PnCY64Us8=;
        b=m1I40oapUcXM2Omz0jaHTn25DbEbcNS0OmvE2CIN51GC+zrFJcIikQku7hCM3j3T+r
         KeGdkM353ZFreLCAhxD95ntXSFCplJw3V7rJEeZtNZwT+ojQQpeARoO4brzDqOAe3n3e
         7DxevWErys1WkgBH+AZk/J/6HyFG9ZTqhWbkSILVwuO2KuHigDVqBX+0dm9aynb/WCgS
         jTiTVCfhskM8giYhsqCTEw3Xw7oi7X1yNHV+ETlyws6Ec645DObdtK265pU6osG4OuWn
         5kaNQt1aDQOh1hzi0UeBr9fkBsWa80EeEE5Rki6hbhnRNjQAzDggSRXbUgdoXO/qWrvW
         XXCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788978363; x=1789583163;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KK/UIhFgBD8eoHEoSy0j4ptrmD+X96xbO4PnCY64Us8=;
        b=bSLLMssNtEJ9hNISTTg/YKlWd9MNxEnASzq4qxnEsT9Ua0TstmlD3NR3hKc2wqwE5+
         6sedPcIblL1NDrBncM6RdyvXjs8/96xIuEDL7eMY/ipgpro6XB8G9778X6dyp9LJpoa1
         /TZS9XCWYnrFmhipKVrRhDwPQz9w8FWj++ctJV9na22TRU/l77uUAfgnjX48eKJ6zcM7
         Ku/QIdsXSCWHnXc3SFyc31lsvpiOk4LYPx+JEjFuxE4WE7M9NUI7ViZ0YjwNX0HJ7SOB
         eg7PFzbDH6XN7YwaaY16AoSZTZNAmvKUbdBzggk0GILBo7rMbAq8FtposZGiZ3TalFQq
         3KGQ==
X-Gm-Message-State: AFuF++m9xxssW1qS5x4PQOERCe43g5Ps+h1phge7tfIOl60XJ0W9UZVe
	0IEwJdHTKaLTtmZZJKW7hm6sUsdwJx41BWTDbvsAPgjyAapTOl6bj+eUHtdfOw==
X-Gm-Gg: AYBFou1SFNtfTJcQg05xF5G3OveK3fcBKe+uJlIozxbEGfe513Ha2ijelC2CD2+Y/Hb
	eypWHgjYWGMhr2NrGwhC4vNbsdjUsJDp0uUuTQupJyqMmUYyXJ8wJN1bvqLX3iFvGW3qJJsz2qn
	Lf6/QbGsOQtd/8uWYb3hXkBwrfclgBtw2ZvLncU5U1bGPjbtYG93hG0qsvNKzJLf0MoNVISE+bV
	A/iblpQjuFCPuro3uZecEa4Q5TveP3KB1pmG8jOOaNy/0QTq1Im1v5toSh3rOuLNUO6k4tZ7+ZB
	7pHgZI1Dc4vPNlrwUFRfFzx7/+Nml4GWfhDpvpyHI7WmFG2C63iaDVCA44CZSY79kF/9ldFRe/2
	hk5X1excyJHNJTGMBWbL8ABpBiViY5H7At9fplos/IHPGEIAHQrP1sN57F9ZC4xgegHdHV1GYKi
	RDiZFTnzgaiDmU9Jey8Erq6sD5pbM6ZJA+HqS5c1ZxJKQqm8wJPCOIeZk73cPasGDZQNQM26gXW
	svGe1GMKPdB0tvYcUVm172/wkfKm7PIb/BVP8xWx8RHMzrKG1g598nFMf7rSubP0rwVTVJw/udP
X-Received: by 2002:a05:6512:32c9:b0:5b6:183c:5c9f with SMTP id 2adb3069b0e04-5b6183c5eb7mr6516184e87.61.1788978362634;
        Wed, 09 Sep 2026 11:26:02 -0700 (PDT)
Received: from localhost.localdomain ([176.88.90.107])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5635e5d23sm3863271fa.14.2026.09.09.11.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 11:26:02 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] mercurial: fix build with Python built against OpenSSL 4.0
Date: Wed,  9 Sep 2026 21:25:53 +0300
Message-ID: <20260909182553.30555-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 18:26:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129893

do_compile fails with:

  The `ssl` module does not advertise support for TLS 1.2.
  Please make sure that your Python installation was compiled against an OpenSSL
  version enabling these features (likely this requires the OpenSSL version to
  be at least 1.0.1).

OpenSSL 4.0 removed TLSv1_2_method(), so Python reports ssl.HAS_TLSv1_2
as False even though TLS 1.2 still works. setup.py only looks at that
flag.

Accept ssl.HAS_TLSv1_3 as well.

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 ...etup-accept-the-TLS-1.3-flag-as-well.patch | 33 +++++++++++++++++++
 .../mercurial/mercurial_7.2.4.bb              |  4 ++-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/mercurial/mercurial/0001-setup-accept-the-TLS-1.3-flag-as-well.patch

diff --git a/meta-oe/recipes-devtools/mercurial/mercurial/0001-setup-accept-the-TLS-1.3-flag-as-well.patch b/meta-oe/recipes-devtools/mercurial/mercurial/0001-setup-accept-the-TLS-1.3-flag-as-well.patch
new file mode 100644
index 0000000000..42a06f4f23
--- /dev/null
+++ b/meta-oe/recipes-devtools/mercurial/mercurial/0001-setup-accept-the-TLS-1.3-flag-as-well.patch
@@ -0,0 +1,33 @@
+From 46eda44a8f696af27e50a3d6a6f846b604e465d2 Mon Sep 17 00:00:00 2001
+From: Alper Ak <alperyasinak1@gmail.com>
+Date: Tue, 8 Sep 2026 22:00:10 +0300
+Subject: [PATCH] setup: accept the TLS 1.3 flag as well
+
+OpenSSL 4.0 removed TLSv1_2_method(), so Python reports ssl.HAS_TLSv1_2
+as False even though TLS 1.2 still works. The check only looks at that
+flag and stops the build.
+
+Accept ssl.HAS_TLSv1_3 as well.
+
+Upstream-Status: Pending
+Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
+---
+ setup.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index ca70bc0..eaaca5b 100644
+--- a/setup.py
++++ b/setup.py
+@@ -12,9 +12,9 @@ import sys
+ import sysconfig
+ import tempfile
+ 
+-if not ssl.HAS_TLSv1_2:
++if not (ssl.HAS_TLSv1_2 or ssl.HAS_TLSv1_3):
+     error = """
+-The `ssl` module does not advertise support for TLS 1.2.
++The `ssl` module does not advertise support for TLS 1.2 or TLS 1.3.
+ Please make sure that your Python installation was compiled against an OpenSSL
+ version enabling these features (likely this requires the OpenSSL version to
+ be at least 1.0.1).
diff --git a/meta-oe/recipes-devtools/mercurial/mercurial_7.2.4.bb b/meta-oe/recipes-devtools/mercurial/mercurial_7.2.4.bb
index a517b3aa5e..8d111d1a4d 100644
--- a/meta-oe/recipes-devtools/mercurial/mercurial_7.2.4.bb
+++ b/meta-oe/recipes-devtools/mercurial/mercurial_7.2.4.bb
@@ -9,7 +9,9 @@ RDEPENDS:${PN} = "python3 python3-modules"
 
 inherit python3native python3targetconfig
 
-SRC_URI = "https://www.mercurial-scm.org/release/${BP}.tar.gz"
+SRC_URI = "https://www.mercurial-scm.org/release/${BP}.tar.gz \
+           file://0001-setup-accept-the-TLS-1.3-flag-as-well.patch \
+"
 SRC_URI[sha256sum] = "85839e0f39e6cb893a88932aa36ef661759f3c5c5de4551ad26bd9df53cb71a2"
 
 # Constrain the version to digits-and-dots, otherwise the auto-derived regex
-- 
2.43.0


