Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59B6AC83F21
	for <webhook@archiver.kernel.org>; Sun, 13 Jul 2025 06:30:41 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.52282.1752388234602912805
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Jul 2025 23:30:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lFw0e6+P;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-74ce477af25so2070275b3a.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Jul 2025 23:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752388234; x=1752993034; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gEJx6HfjRuIpQ7Av3kl/OXELvFJnmqFSW2oZCTp/3Fk=;
        b=lFw0e6+P9aSteh/BREuvYsiKqTM+c05F9PBVAcZt0Rhql63Jj+fUTdscvRMPIYXvp0
         3IJ+e7UkyG/cP1r3bN+cv6ZeCuInUamkGMCRpeR/eY5ESwHCts7YV7TgdzprK0sLa10z
         6Zm33EnPaxLS0ds0opXuFNXW5SB6YywcSDx0lVsad1M3tBrryFSV08Q9NvesZXRBrgwz
         y4pD57ZyKwtG7G/ow7m4/ZBHdKfR2Ifo2en5m8EstnA4/XKCowS4tB6qgG07ZlF86ysW
         anX6l3oO2SYm/gkezuoKwVpblMiXzy4UHjnBPJ2kUVXxJe2mlqXj5ql0yXTrwnEUVgjU
         gxlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752388234; x=1752993034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gEJx6HfjRuIpQ7Av3kl/OXELvFJnmqFSW2oZCTp/3Fk=;
        b=YrGT38DLGrjCHhAd/Iot10OR3WwzmiJ6fAlBXo59v1pkf50FlIqAySUynpoMQyqha+
         +r9CxwX+ntjkBh1WeogbnsblWTVPlErWCE1uJ+E32zIVZeI93r4i764uXpwMKlV84eCs
         B27fV6JK8x+etE2QA5Hajx6P4Suk7H7+NRvE6+MaPP6LCrcwgoekKO0l4LtOMic/l0Vu
         ROSYSVQf8/OOHUW2lGpiW5kjQ55HqoAUPJdTn07AhwZueCsrt9Q7PyJH/INGifKn9p/l
         1pdHEDdJpPOIo6pOipWnrV/FS0vRkucWdKlj2fjHF/ycY8WoqVknOEouISLLV+Ncy8sO
         LpEA==
X-Gm-Message-State: AOJu0Yz0j7xn9q/n+3QYbBE5mKEFIEM+t511k0f5a0FeXEgTFoT9+D3+
	hAKb0A+xq4VAO6w44vgGfVFhqzAjPhU16dP8aQBEzw1P/GVXljJ1UW1RYaheMThq
X-Gm-Gg: ASbGncs7GOuaPtv6OiB27z8gyltcetPpBpnOle39K/PMt1mEBskP6ZyceRDC151uCzl
	ngN6V2g9Cbuq+VvRR5yWMZsM+kZ4z8LQ1XYEXCSj1jaMuid76MZyxY6w9TAWrFiZxYJ1DfUIkgl
	fOGXJvfnyMSZmvESWusJdey/DMCihz3etGhlmrk9BphGA7mVqGWuY1onbQW3IC4yZwcNlSqsTO7
	uKg1oW9WiSc3tK+ibwJ6nu6ccxaFci1yQluOnH3FMzFHeqw9MRAEq4AsIPCGpVEUHAG8Mg9CvYS
	Q3L47rjMzmABZi6Vgyhd5E7FgXNPQ+cxMILQF0HgoNhciLcyPQ/RmHteysPyXAA16hFYEmC55X3
	J9WJzwmVdBQiWxA==
X-Google-Smtp-Source: AGHT+IFXb9l0W9vGSBsXbmlPs/u8ndiBHfIxRnViKckzXbcz3bh99bDGz9nCVQYNUycZHGqzIXyiEQ==
X-Received: by 2002:a05:6a00:3cc9:b0:748:6a1f:6d3b with SMTP id d2e1a72fcca58-74ee3045989mr13193360b3a.19.1752388233557;
        Sat, 12 Jul 2025 23:30:33 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::1c1d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bce529689sm4928927a12.52.2025.07.12.23.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jul 2025 23:30:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 5/7] nngpp: Fix build with cmake4
Date: Sat, 12 Jul 2025 23:30:21 -0700
Message-ID: <20250713063023.3538218-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250713063023.3538218-1-raj.khem@gmail.com>
References: <20250713063023.3538218-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Jul 2025 06:30:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118498

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...1-cmake-Bump-minimum-version-to-3.10.patch | 25 +++++++++++++++++++
 .../recipes-connectivity/nanomsg/nngpp_git.bb | 10 ++++----
 2 files changed, 30 insertions(+), 5 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/nanomsg/nngpp/0001-cmake-Bump-minimum-version-to-3.10.patch

diff --git a/meta-networking/recipes-connectivity/nanomsg/nngpp/0001-cmake-Bump-minimum-version-to-3.10.patch b/meta-networking/recipes-connectivity/nanomsg/nngpp/0001-cmake-Bump-minimum-version-to-3.10.patch
new file mode 100644
index 0000000000..170d799502
--- /dev/null
+++ b/meta-networking/recipes-connectivity/nanomsg/nngpp/0001-cmake-Bump-minimum-version-to-3.10.patch
@@ -0,0 +1,25 @@
+From c5004770784dc5ff80b88487de38c22275a7960a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 12 Jul 2025 16:04:38 -0700
+Subject: [PATCH] cmake: Bump minimum version to 3.10
+
+Cmake4+ has dropped support for cmake < 3.5 [1]
+
+[1] https://cmake.org/cmake/help/latest/release/4.0.html#deprecated-and-removed-features
+
+Upstream-Status: Submitted [https://github.com/cwzx/nngpp/pull/38]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index caa7145..45a5ad5 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required (VERSION 3.1)
++cmake_minimum_required (VERSION 3.10)
+ project(nngpp CXX)
+ 
+ include(GNUInstallDirs)
diff --git a/meta-networking/recipes-connectivity/nanomsg/nngpp_git.bb b/meta-networking/recipes-connectivity/nanomsg/nngpp_git.bb
index aac26966f1..81a85a7e27 100644
--- a/meta-networking/recipes-connectivity/nanomsg/nngpp_git.bb
+++ b/meta-networking/recipes-connectivity/nanomsg/nngpp_git.bb
@@ -4,10 +4,10 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://license.txt;md5=6d17d78c3597e0d4452fb1c63bf7c58e"
 DEPENDS = "nng"
 
-SRCREV = "cc5d2641babab165d8a9943817c46d36c6dc17c2"
-PV = "1.3.0"
-
-SRC_URI = "git://github.com/cwzx/nngpp;branch=master;protocol=https"
-
+SRCREV = "8da8c026bd551b7685a8a140909ff96cfe91bf90"
+PV = "1.3.0+git"
+SRC_URI = "git://github.com/cwzx/nngpp;branch=master;protocol=https \
+           file://0001-cmake-Bump-minimum-version-to-3.10.patch \
+          "
 
 inherit cmake

