Return-Path: <alistair23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5588BC3600C
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 04:15:47 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.66873.1744085737352097591
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 21:15:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kuUHgER7;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: alistair23@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-af548cb1f83so4574404a12.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 21:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744085736; x=1744690536; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mHrIPILvoQtNzbhWqkhY2DytV6ndfS5hD/N+MwbIcA4=;
        b=kuUHgER7IIcIMSAyDZ8LJ1khQRzt40qWaYjxciXACcCbXcqMmy97wC0ha5x4TYNSJ8
         sWA1MQDCUYEYvEoDOFFTQj4yS6XvKelO9mXS9Bw+vhAQHNIdCQL23Ch0tdPFb8wtc8hR
         tb079cc25m6HarA146bUF944oeyxbq0l8kHkvOmfNnvIGMj9uJPpaHNxmXuCJOfOD85o
         R9IwHuVkHpVPRmtJy088AoRtje314Q2S54WAInEb2CDnIuebbPoiKhvH7N1Vo473SKMG
         jggVePCBHMNrKtTJ+qLy32Dx8BptvtgSfB2AW+EoP0hoiKCoSBJg4Wp8N35TFA6iKqgY
         GhaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744085736; x=1744690536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mHrIPILvoQtNzbhWqkhY2DytV6ndfS5hD/N+MwbIcA4=;
        b=mRnmB9Nm2ueev6Wc30NzUCdFePH6wJKbtHDTxaPttanUBnAZpqGwFPwtqB6tdqeXqT
         GrIVNYVpqAqz1qmm3ZJq4Tu5/fJLmChORiL3BQsuSxEDAZjHB5nZjYH4x/YBvI0LxG4f
         DBb94gBnh/mwtz5wNs3AT87v1M/wRZdemEB8uudrXlHigwt7tbKi2XnUYCOzQMySolux
         Ul7beTBGadM2HLksNDgbvqSzoTpY/vdYuOBy4GgpUBez3Q5hItD0mJEbmEeKvfXTlU2O
         7s5Q6rkUpULGoef/PnPlkOfQKhH0jXWN28b0agiS72ZBazAyALtxtvm39bfOOmi/DgaD
         YVTA==
X-Gm-Message-State: AOJu0Yzaw8/8Or2LvrtKtUnpEbQxOm4f6kC1yRpoFMNz0IGDQ0p3xXBp
	xqj8LPM+MaYB+xBDpeZ11Pam6XeykYXNijhbPrv8BHryQnH2BznuAZMDnQ==
X-Gm-Gg: ASbGncu4DR8IC3b5ybEQhgHWxU3oGuwSvtYKI6JjAqvYI7MiqEVzSpg0ElLo9CunlhL
	lni9UUSDQjsamwriiNa0FdGnwfMRLd4Iuz6FC4x1sXwxOb/AYPYV2CiAuaMNLt7eoKh947isaT4
	B7dPRaDeWcxtgbx4OODX8bJvV3s/8snR1+7epHF7KMA3QNqHTxPKfzQTyH2Fy/9xwTx85A8mMT4
	uVxQAMI8hZjh5FwW0AovZq+4C1WjuYrOhXB8Fuc4em2O8teCCmeTXUwNDhZplx6a54blFgT3kGQ
	dFhZkAOt4vxD9cH1aFmhpKqwjPMHAd8Mw8Hd51qsFrIFnOfKEVBn9T6KSOLdIlGRvDeCSUDYgBi
	BDbNvTNsNaMtpYqqt/uKk17ptvQbrmdK9Tw7WOqeLZz9vZrWrSQ==
X-Google-Smtp-Source: AGHT+IHlPgpaPZkbNtk4fbQQG4hDXqUTeEi6bBpU1TXQMiMFT5jsQ9vE2oP3jkZcm2yazdz+Kb5FZA==
X-Received: by 2002:a17:90b:4d0c:b0:2ff:6f88:b04a with SMTP id 98e67ed59e1d1-306a47ee42cmr23034005a91.15.1744085736421;
        Mon, 07 Apr 2025 21:15:36 -0700 (PDT)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30588a2f6b2sm9868212a91.24.2025.04.07.21.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 21:15:35 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-devel@lists.openembedded.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [meta-oe][PATCH 2/2] nvme-cli: Update to 1.12
Date: Tue,  8 Apr 2025 14:15:22 +1000
Message-ID: <20250408041523.4029757-2-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250408041523.4029757-1-alistair.francis@wdc.com>
References: <20250408041523.4029757-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Apr 2025 04:15:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116687

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 ...allback-for-non-standard-locale-cate.patch | 39 -------------------
 ...dd-include-of-libgen.h-for-basename-.patch | 34 ----------------
 .../{nvme-cli_2.11.bb => nvme-cli_2.12.bb}    |  7 +---
 3 files changed, 2 insertions(+), 78 deletions(-)
 delete mode 100644 meta-oe/recipes-bsp/nvme-cli/nvme-cli/0001-nvme-print-add-fallback-for-non-standard-locale-cate.patch
 delete mode 100644 meta-oe/recipes-bsp/nvme-cli/nvme-cli/0002-plugins-netapp-add-include-of-libgen.h-for-basename-.patch
 rename meta-oe/recipes-bsp/nvme-cli/{nvme-cli_2.11.bb => nvme-cli_2.12.bb} (85%)

diff --git a/meta-oe/recipes-bsp/nvme-cli/nvme-cli/0001-nvme-print-add-fallback-for-non-standard-locale-cate.patch b/meta-oe/recipes-bsp/nvme-cli/nvme-cli/0001-nvme-print-add-fallback-for-non-standard-locale-cate.patch
deleted file mode 100644
index 981acb1b81..0000000000
--- a/meta-oe/recipes-bsp/nvme-cli/nvme-cli/0001-nvme-print-add-fallback-for-non-standard-locale-cate.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 9444ce03a27b8d423f8170cf75f56d48d8a0a659 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Daniel=20N=C3=A9ri?= <dne+commits@rb67.eu>
-Date: Mon, 11 Nov 2024 23:06:03 +0100
-Subject: [PATCH] nvme-print: add fallback for non-standard locale category
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-LC_MEASUREMENT is a GNU (libc) extension - fall back to LC_ALL if it's
-not defined.
-
-Fixes build with musl libc
-
-Signed-off-by: Daniel Néri <dne+commits@rb67.eu>
-
-Upstream-Status: Backport [https://github.com/linux-nvme/nvme-cli/commit/9444ce03a27b8d423f8170cf75f56d48d8a0a659]
-Signed-off-by: Ryosuke Saito <ryosuke.saito@linaro.org>
----
- nvme-print.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/nvme-print.c b/nvme-print.c
-index 170e5c12fb22..5b1f2e827aef 100644
---- a/nvme-print.c
-+++ b/nvme-print.c
-@@ -797,6 +797,10 @@ static bool is_fahrenheit_country(const char *country)
- 	return false;
- }
- 
-+#ifndef LC_MEASUREMENT
-+#define LC_MEASUREMENT LC_ALL
-+#endif
-+
- static bool is_temperature_fahrenheit(void)
- {
- 	const char *locale, *underscore;
--- 
-2.47.0
-
diff --git a/meta-oe/recipes-bsp/nvme-cli/nvme-cli/0002-plugins-netapp-add-include-of-libgen.h-for-basename-.patch b/meta-oe/recipes-bsp/nvme-cli/nvme-cli/0002-plugins-netapp-add-include-of-libgen.h-for-basename-.patch
deleted file mode 100644
index 42ca7f5340..0000000000
--- a/meta-oe/recipes-bsp/nvme-cli/nvme-cli/0002-plugins-netapp-add-include-of-libgen.h-for-basename-.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From ac4818952c872ba465a2d0f48634f9a79aae064f Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Daniel=20N=C3=A9ri?= <dne+commits@rb67.eu>
-Date: Mon, 11 Nov 2024 22:34:57 +0100
-Subject: [PATCH] plugins/netapp: add include of libgen.h for basename(3)
- prototype
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes build with musl libc.
-
-Signed-off-by: Daniel Néri <dne+commits@rb67.eu>
-
-Upstream-Status: Backport [https://github.com/linux-nvme/nvme-cli/commit/ac4818952c872ba465a2d0f48634f9a79aae064f]
-Signed-off-by: Ryosuke Saito <ryosuke.saito@linaro.org>
----
- plugins/netapp/netapp-nvme.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/plugins/netapp/netapp-nvme.c b/plugins/netapp/netapp-nvme.c
-index 5c2e3d4989b8..9f05ffc5d97e 100644
---- a/plugins/netapp/netapp-nvme.c
-+++ b/plugins/netapp/netapp-nvme.c
-@@ -22,6 +22,7 @@
- #include <unistd.h>
- #include <errno.h>
- #include <string.h>
-+#include <libgen.h>
- 
- #include "common.h"
- #include "nvme.h"
--- 
-2.47.0
-
diff --git a/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.11.bb b/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.12.bb
similarity index 85%
rename from meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.11.bb
rename to meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.12.bb
index 7c030cd847..7ab244f3cc 100644
--- a/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.11.bb
+++ b/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.12.bb
@@ -6,12 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8264535c0c4e9c6c335635c4026a8022 \
                     file://ccan/licenses/CC0;md5=c17af43b05840255a6fedc5eda9d56cc \
                     file://ccan/licenses/BSD-MIT;md5=838c366f69b72c5df05c96dff79b35f2"
 DEPENDS = "json-c libnvme"
-SRCREV = "9f34fcb12e3ab098e9b30e0f31e92cefb497cc42"
-
-SRC_URI = "git://github.com/linux-nvme/nvme-cli.git;branch=master;protocol=https \
-           file://0001-nvme-print-add-fallback-for-non-standard-locale-cate.patch \
-           file://0002-plugins-netapp-add-include-of-libgen.h-for-basename-.patch"
+SRCREV = "71fa5d9310d6b41a69e844593423ac91b1453472"
 
+SRC_URI = "git://github.com/linux-nvme/nvme-cli.git;branch=master;protocol=https"
 S = "${WORKDIR}/git"
 
 inherit bash-completion meson pkgconfig systemd
-- 
2.49.0


