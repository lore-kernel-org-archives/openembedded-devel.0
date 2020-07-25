Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web12.7239.1595671930199738497
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Jul 2020 03:12:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=iMaXhTyV;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.173, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f173.google.com with SMTP id 185so2192596ljj.7
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Jul 2020 03:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qFndl+t/j+13r8RlHP8fIDBWXOEdyob3e1HcseQzVwU=;
        b=iMaXhTyV+AIHP4Kams9BvUb7DvC4tCDNZ8h43c7av6kByPuepZoMnQvzg2PrFVNYOF
         rl0khL6kWaVvBy55UEkri3XKZ8/mxq01mcCqFhMjZJWB91Dfrl8MV7LnBBK778tsQRM5
         WrAiUKCirs7hJ5MhI+4PHtZbq98Wenzn5CLqU3415vODQCbuSQ5/Megp03JxRMPGcK4N
         8bdaZmpCkjzcymP+CWzXGxXLEXOFqGenEVE9xcYOAdIKHcfOTN+est4wRxjYLJatAjLm
         kDOTHSs9bWYW/lj0wpkZR5susLYTDhFNgGAjGWJeVlH5yesPfinVqLsdl+LnImeohSY7
         jQog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qFndl+t/j+13r8RlHP8fIDBWXOEdyob3e1HcseQzVwU=;
        b=Dg7xLGZFWa460+BDel07qV+QKzRNDrk8Lz7EPeFFGzE/u9TfQ/97B54EtQ1sW/uEwe
         THm/piUKQ59/ZieaGXaSTwEl0LibJX9Dk+flqi10uMUt/DcW9qZpnEWGPF6bqNZYwpqJ
         Ac1VYVc7gQA/NQWq4GtNfvuJ0X9PAr06kmqayN1AXT0Lg1B15XOrLcFTavJu7Pv5a5kQ
         /bBXkFAbVSLN4aLoPCIBNQ7sa7e9sLiei19TurwQWeWpx4rPPzoxaEzPZmhd6pOILWq0
         K6QJgvZw+i1hUSEVu3EpoojZ/9x663eOMHDpjOJ9vGLMvxm6J9syVf/Edy/swCNZOQMR
         pgwQ==
X-Gm-Message-State: AOAM533UFFRzgP3qHCYvEgqTr+c+at9tkxSaAF77s02/NjNhtfkiYTBX
	2GKYhJppYa7Ap97E2LIKjAg4kHDfexk=
X-Google-Smtp-Source: ABdhPJyUlnMspIbZlH4nqBID37/Ocez2btvZ7JT22ilpHvX3BN/GvTpkS/NHZn3iJAzEe3UOmboQiA==
X-Received: by 2002:a2e:9792:: with SMTP id y18mr6488108lji.172.1595671928019;
        Sat, 25 Jul 2020 03:12:08 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id q22sm1154227lfc.33.2020.07.25.03.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2020 03:12:07 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] nvme-cli: update to 1.12
Date: Sat, 25 Jul 2020 12:12:05 +0200
Message-Id: <20200725101205.1932784-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed patch is included in this version.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../nvme-cli/0001-fix-musl-compilation.patch  | 26 -------------------
 .../{nvme-cli_1.10.1.bb => nvme-cli_1.12.bb}  |  6 ++---
 2 files changed, 2 insertions(+), 30 deletions(-)
 delete mode 100644 meta-oe/recipes-bsp/nvme-cli/nvme-cli/0001-fix-musl-compilation.patch
 rename meta-oe/recipes-bsp/nvme-cli/{nvme-cli_1.10.1.bb => nvme-cli_1.12.bb} (85%)

diff --git a/meta-oe/recipes-bsp/nvme-cli/nvme-cli/0001-fix-musl-compilation.patch b/meta-oe/recipes-bsp/nvme-cli/nvme-cli/0001-fix-musl-compilation.patch
deleted file mode 100644
index be5d0dac79..0000000000
--- a/meta-oe/recipes-bsp/nvme-cli/nvme-cli/0001-fix-musl-compilation.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 0ff7ad2c88e3a47e7e3f6fe68c28a8d2d8a71f1f Mon Sep 17 00:00:00 2001
-From: Neel Chotai <neel@chot.ai>
-Date: Fri, 14 Feb 2020 17:56:23 +0000
-Subject: [PATCH] fix musl compilation
-
-Upstream-Status: Backport [https://github.com/linux-nvme/nvme-cli/commit/0ff7ad2c88e3a47e7e3f6fe68c28a8d2d8a71f1f]
-Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
----
- plugins/micron/micron-nvme.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/plugins/micron/micron-nvme.c b/plugins/micron/micron-nvme.c
-index 8240887..165fcf0 100644
---- a/plugins/micron/micron-nvme.c
-+++ b/plugins/micron/micron-nvme.c
-@@ -13,6 +13,7 @@
- #include "nvme-print.h"
- #include "nvme-ioctl.h"
- #include <sys/ioctl.h>
-+#include <limits.h>
- 
- #define CREATE_CMD
- #include "micron-nvme.h"
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-bsp/nvme-cli/nvme-cli_1.10.1.bb b/meta-oe/recipes-bsp/nvme-cli/nvme-cli_1.12.bb
similarity index 85%
rename from meta-oe/recipes-bsp/nvme-cli/nvme-cli_1.10.1.bb
rename to meta-oe/recipes-bsp/nvme-cli/nvme-cli_1.12.bb
index 4f4bb2dfab..a18b71a7ca 100644
--- a/meta-oe/recipes-bsp/nvme-cli/nvme-cli_1.10.1.bb
+++ b/meta-oe/recipes-bsp/nvme-cli/nvme-cli_1.12.bb
@@ -7,10 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8264535c0c4e9c6c335635c4026a8022"
 DEPENDS = "util-linux"
 PV .= "+git${SRCPV}"
 
-SRC_URI = "git://github.com/linux-nvme/nvme-cli.git \
-           file://0001-fix-musl-compilation.patch \
-"
-SRCREV = "1d84d6ae0c7d7ceff5a73fe174dde8b0005f6108"
+SRC_URI = "git://github.com/linux-nvme/nvme-cli.git"
+SRCREV = "949d0aea730136d04af1fb9e0efd4427c20dee6d"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

