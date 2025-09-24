Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBD7FCAC5B2
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 07:57:04 +0000 (UTC)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
 by mx.groups.io with SMTP id smtpd.web10.7283.1758700621815507720
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 00:57:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AosH6/0W;
 spf=pass (domain: gmail.com, ip: 209.85.166.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-4248c9a64f7so4329875ab.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 00:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758700621; x=1759305421; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g9tiVRQVknczAoRMHQiUG0hW+BKVEmZhc7S/5ruDyok=;
        b=AosH6/0WPESk3ldH0kvNUdrwPehojsDhFLTf+a92GkLAYVyIGan8NXs/rMrIrMLsf3
         KnZIs6s7RmW+ghIg1LPDq8Y6rvx3oU4RFNRCTWKeMs+fPFaR7RdnehW8fBFnMDALHPmC
         APwO4zfBNIuYzj/GFYhm8OhSSMPh9JC15j+a3fV9F9txM11qHqZ527DCsgmPw0/yAZpm
         ZI6MkJZlkAVOuYfBti6yclTTgv7QaJhaX/yGrVEKBVnQUlpKis6oGkg8tY7MW3wJwsZO
         dYCLLwbDz6WtlpV+1odJum9/2fpRLSFQ5mjyBK9WSYRqsR3VRSaex82XFDSHRPHRk2Op
         Kl/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758700621; x=1759305421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g9tiVRQVknczAoRMHQiUG0hW+BKVEmZhc7S/5ruDyok=;
        b=P7T4AVRTuSlBc/JzXPjFy2ztpJHA3G2Y13QpkE+m74mCcLcdhAHwhyehcjA+FDdhVN
         uLKT/UyNRmsxoJFBHdxSd7i0SzzJ2RgbGCAi2nER+S6tugRvKd6e7MwNgy0QP5SyXnQH
         3DCXleKPv1ixHpoUa/s51EFJlB5c5qMJCh/L8GSDWsUlE0ZNv8SZJbnUPt0AzhCn8B3e
         2W6Df2eCAPmU1U5qWaI95sYNw3C27OsdEEPZgwdmL6+loBd8qdTXxcFmjuND7K82eBDA
         3TPgn5LUHf702/u1tgwhzJp7/rRLf+p71jvy217u6T7ZHbf2zJDZGFLr81xF3MqIIrH5
         FrwA==
X-Gm-Message-State: AOJu0Yz3mORmzwgr6wHP17TPYzG8ayE0ZmboF6PCDX0ASuM4eEpQCToC
	ThKQqq8BCKPMN017iv1Dt79k+Pfsfkqy4DlcIMh8K32u0BpbNzmuaF9lCfuWfw==
X-Gm-Gg: ASbGncuwbLWXo8bEkS6gOuNz5yN2hFlJa04e/nbPj2bOP+rtEs3OhkJ3cccjpNErRd1
	e4q5FuztIJinFtjWyMU/efkO+G72EXmdid2ebzvLzWL7vGaXe/YEHA9vvSuXNGjtLwH1l1DJ6Nj
	6jnXqo1bcWaCB1sFiuZvXVT2td270sWoPEw5PyyM7EznwhWiIeinepjWefNDfRDL6DNYtjPTyCz
	/6didXnCQGWPiXf43AN+0nK8XPOKmBfROHcmvVYMigTtmP4YUrlnBA6AaQEJne5Xgoe4+modUS5
	aAL4ZHq6l4VqkPy0Ku0GcrBS78Q6k15l4o4EV1mfBlX5Ild8pMS49plGWRGYWCJgiLT4ubwGim+
	W0kYHND6Aor9uVPeLj92omCAv+cSMqgKlPsK0LJgkPrRo+Zl8lBQRX/nDjGyVmKs=
X-Google-Smtp-Source: AGHT+IG3fNuF0kxJfppdv8FPD/J/AAR5e++Peo4VGY3bh2Uczw08wF6Ee4um9E++GsyXDSUQzmnO/w==
X-Received: by 2002:a05:6e02:3982:b0:424:52b:add8 with SMTP id e9e14a558f8ab-4258d8588a8mr26672245ab.3.1758700620725;
        Wed, 24 Sep 2025 00:57:00 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([147.161.216.253])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-55dba4465f4sm3203576173.37.2025.09.24.00.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 00:57:00 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH 2/6] flashrom: upgrade 1.5.1 -> 1.6.0
Date: Wed, 24 Sep 2025 19:56:39 +1200
Message-ID: <20250924075643.2047506-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250924075643.2047506-1-ankur.tyagi85@gmail.com>
References: <20250924075643.2047506-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 07:57:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119757

From: Wang Mingyu <wangmy@fujitsu.com>

0002-meson-Add-options-pciutils-ftdi-usb.patch
refreshed for 1.6.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d03d56c13e3245933bf2308276deefe03279b4cd)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...02-meson-Add-options-pciutils-ftdi-usb.patch | 17 ++++++++---------
 .../{flashrom_1.5.1.bb => flashrom_1.6.0.bb}    |  2 +-
 2 files changed, 9 insertions(+), 10 deletions(-)
 rename meta-oe/recipes-bsp/flashrom/{flashrom_1.5.1.bb => flashrom_1.6.0.bb} (89%)

diff --git a/meta-oe/recipes-bsp/flashrom/flashrom/0002-meson-Add-options-pciutils-ftdi-usb.patch b/meta-oe/recipes-bsp/flashrom/flashrom/0002-meson-Add-options-pciutils-ftdi-usb.patch
index 8dfed855b4..b1dd5d0773 100644
--- a/meta-oe/recipes-bsp/flashrom/flashrom/0002-meson-Add-options-pciutils-ftdi-usb.patch
+++ b/meta-oe/recipes-bsp/flashrom/flashrom/0002-meson-Add-options-pciutils-ftdi-usb.patch
@@ -1,7 +1,7 @@
-From 3ea99c117aa4c7a3502c93e4e4df50b3623e46c3 Mon Sep 17 00:00:00 2001
+From 5cf5fc64c6aab35b89b8cf7f69b84b6f5100d7a6 Mon Sep 17 00:00:00 2001
 From: Patrick Rudolph <patrick.rudolph@9elements.com>
 Date: Tue, 15 Oct 2024 10:42:05 +0200
-Subject: [PATCH 2/2] meson: Add options pciutils, ftdi, usb
+Subject: [PATCH] meson: Add options pciutils, ftdi, usb
 
 The options have been dropped in favor of an array option called programmer.
 Since this doesn't integrate well into yocto add back the old options.
@@ -16,10 +16,10 @@ Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
  2 files changed, 6 insertions(+), 3 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index 6c8d3d3..61b794d 100644
+index 35feb33..b5bb722 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -150,9 +150,9 @@ systems_serial     = [ 'linux', 'openbsd', 'freebsd', 'dragonfly', 'netbsd', 'da
+@@ -140,9 +140,9 @@ systems_serial     = [ 'linux', 'openbsd', 'freebsd', 'dragonfly', 'netbsd', 'da
  
  cpus_port_io = [ 'x86', 'x86_64' ]
  
@@ -33,10 +33,10 @@ index 6c8d3d3..61b794d 100644
  group_serial = get_option('programmer').contains('group_serial')
  group_jlink  = get_option('programmer').contains('group_jlink')
 diff --git a/meson_options.txt b/meson_options.txt
-index 87456a9..570b152 100644
+index 2829cd1..0e9d769 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
-@@ -24,4 +24,7 @@ option('ni845x_search_path', type : 'string', value : 'C:\Program Files (x86)\Na
+@@ -26,6 +26,9 @@ option('ni845x_search_path', type : 'string', value : 'C:\Program Files (x86)\Na
  option('delay_minimum_sleep_us', type : 'integer', min : 0, value : 100,
         description : 'Minimum time in microseconds to suspend execution for (rather than polling) when a delay is required.'
                     + ' Larger values may perform better on machines with low timer resolution, at the cost of increased power.')
@@ -44,6 +44,5 @@ index 87456a9..570b152 100644
 +option('usb', type : 'boolean', value : false, description : 'Select programmer group usb')
 +option('ftdi', type : 'boolean', value : false, description : 'Select programmer group ftdi')
  option('rpmc', type : 'feature', value : 'auto', description : 'Support for Replay Protected Monotonic Counter (RPMC) commands as specified by JESD260')
--- 
-2.43.0
-
+ option('log_message_length_limit', type : 'integer', min : 64, max : 1024, value : 256,
+        description : 'Log message length limit for v2 logging API')
diff --git a/meta-oe/recipes-bsp/flashrom/flashrom_1.5.1.bb b/meta-oe/recipes-bsp/flashrom/flashrom_1.6.0.bb
similarity index 89%
rename from meta-oe/recipes-bsp/flashrom/flashrom_1.5.1.bb
rename to meta-oe/recipes-bsp/flashrom/flashrom_1.6.0.bb
index 9a8e81bae3..4f07da79c6 100644
--- a/meta-oe/recipes-bsp/flashrom/flashrom_1.5.1.bb
+++ b/meta-oe/recipes-bsp/flashrom/flashrom_1.6.0.bb
@@ -7,7 +7,7 @@ SRC_URI = "https://download.flashrom.org/releases/flashrom-v${PV}.tar.xz \
            file://0002-meson-Add-options-pciutils-ftdi-usb.patch \
            "
 
-SRC_URI[sha256sum] = "1f934b076ed49eace203655ec249fc7861a6b8e87fe4aef732e47b6e485b6293"
+SRC_URI[sha256sum] = "8b9db3987df9b5fc81e70189d017905dd5f6be1e1410347f22687ab6d4c94423"
 
 S = "${WORKDIR}/flashrom-v${PV}"
 

