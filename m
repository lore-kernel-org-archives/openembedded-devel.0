Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE54EC433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 10:12:15 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web08.6468.1646734326219720250
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Mar 2022 02:12:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112
 header.b=3ZNV0hcc;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.44,
 mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f44.google.com with SMTP id q14so12078903wrc.4
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Mar 2022 02:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vPCgkC/0bQAyp0jKvS+OxuYMYFepjrjmAqyJmxKiLBw=;
        b=3ZNV0hcci5Dtv4rpX9N8dDj0abazbrhJQ8UiKIcRlxnPefwDGsVpjdZo9qkSLZqi6B
         gC+QT5EHOcZlKd1jEiiTTPSnAgn43kKSnwJavHv8Pv0iI0QGGKku+eEASpm/ySZhTafu
         aUqnNeuXjG4RAOsv61m4a62HAo2jPNM9l5b67mPi4BEc1FqoZouNzYn/RoSqY8yRwzow
         oLesycUWCJqjZFkBeeWrMU4K9wEVCT7v3bakppm+3an+qNXJY2m+71FPMMYkTbqHP9BY
         b88F5XG992COh9kmPFed9dysx10covpdaki+VnaogLJFHsEQkOwW4E8ZJsBvkt9cwjhj
         TIlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vPCgkC/0bQAyp0jKvS+OxuYMYFepjrjmAqyJmxKiLBw=;
        b=uAMVD95R8mcVg3Jspd48B6yCgIRfopaDnIziGO0iNgxc2pZ48DvAV3o6JbWPsSbXmF
         PBTaTUJrwgQ6MF/m+YYrSUO3OUDHK97nk202vNfe6W4LvpPBO6mjGR8L1/xrbT9tNEUw
         MCnI+BAL59O6U0Der1lRQBfqyfKKJVzJI2rLWijXKH2Dc9VXcHhb2MUyKEMilVmOCbv8
         2HV1iaI0fH80KAYwi0dA2wCfilX5Tt1ET1X58gm10R9uSJJ8ZL8wfxLt8xK47uozxbIR
         71Ej3AigTN2EgaR0dyw/54sUq2A7lBFSAR2bNDhUEWHN6JPCfH2wnAKEcnCX83v1j/de
         Lknw==
X-Gm-Message-State: AOAM530m65yUgaYshVYnYSneN2IUqMPNe8RjpC82m6xJLXBnyzjyrDhw
	dwP5Z6SKhUgb9zhW8NydvjsFlg==
X-Google-Smtp-Source: 
 ABdhPJwRkvqae4ZIcANOaN0fj+frvx6MyXVXU29qCc5OWQF8qiVrIR2OdpGxw4nRB7QoCVKjNpHmCw==
X-Received: by 2002:a5d:5849:0:b0:1e3:1df9:1b1e with SMTP id
 i9-20020a5d5849000000b001e31df91b1emr12062440wrf.640.1646734324604;
        Tue, 08 Mar 2022 02:12:04 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id
 z5-20020a05600c0a0500b0037bb8df81a2sm2084363wmp.13.2022.03.08.02.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 02:12:04 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Naveen Saini <naveen.kumar.saini@intel.com>
Cc: =?UTF-8?q?Eil=C3=ADs=20N=C3=AD=20Fhlannag=C3=A1in?=
 <elizabeth.flanagan@huawei.com>,
	yocto@lists.yoctoproject.org,
	openembedded-devel@lists.openembedded.org,
	Bartosz Golaszewski <bartosz.golaszewski@huawei.com>
Subject: [meta-zephyr][PATCH 1/2] zephyr-kernel: drop support for zephyr
 v2.6.1
Date: Tue,  8 Mar 2022 11:11:59 +0100
Message-Id: <20220308101200.418279-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Mar 2022 10:12:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95879

From: Bartosz Golaszewski <bartosz.golaszewski@huawei.com>

v2.7.1 is the LTS release and we'll be adding support fr v3.0.0 in the
subsequent patch. Drop support for v2.6.1.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@huawei.com>
---
 .../zephyr-kernel/zephyr-kernel-src-2.6.1.inc | 54 -------------------
 1 file changed, 54 deletions(-)
 delete mode 100644 meta-zephyr-core/recipes-kernel/zephyr-kernel/zephyr-kernel-src-2.6.1.inc

diff --git a/meta-zephyr-core/recipes-kernel/zephyr-kernel/zephyr-kernel-src-2.6.1.inc b/meta-zephyr-core/recipes-kernel/zephyr-kernel/zephyr-kernel-src-2.6.1.inc
deleted file mode 100644
index 5306196..0000000
--- a/meta-zephyr-core/recipes-kernel/zephyr-kernel/zephyr-kernel-src-2.6.1.inc
+++ /dev/null
@@ -1,54 +0,0 @@
-SRCREV_FORMAT = "default_cmsis"
-SRCREV_default = "c8755e0b46bd9e171fae38adc1c614197b8ac2cd"
-SRCREV_cmsis = "c3bd2094f92d574377f7af2aec147ae181aa5f8e"
-SRCREV_atmel = "d17b7dd92d209b20bc1e15431d068edc29bf438d"
-SRCREV_altera = "23c1c1dd7a0c1cc9a399509d1819375847c95b97"
-SRCREV_canopennode = "468d350028a975b96563e58344de48281a0ab371"
-SRCREV_civetweb = "e6903b80c09d17cd1a8bb32e40080005558aad29"
-SRCREV_espressif = "22e757632677e3579e6f20bb9955fffb2e1b3e1c"
-SRCREV_fatfs = "1d1fcc725aa1cb3c32f366e0c53d7490d0fe1109"
-SRCREV_cypress = "81a059f21435bc7e315bccd720da5a9b615bbb50"
-SRCREV_infineon = "f1fa8241f8786198ba41155413243de36ed878a5"
-SRCREV_nordic = "574493fe29c79140df4827ab5d4a23df79d03681"
-SRCREV_openisa = "40d049f69c50b58ea20473bee14cf93f518bf262"
-SRCREV_nuvoton = "b4d31f33238713a568e23618845702fadd67386f"
-SRCREV_microchip = "b280eec5d3b1296b231117c1999bcd0269b6ecc4"
-SRCREV_silabs = "be39d4eebeddac6e18e9c0c3ba1b31ad1e82eaed"
-SRCREV_st = "b52fdbf4b62439be9fab9bb4bae9690a42d2fb14"
-SRCREV_stm32 = "f8ff8d25aa0a9e65948040c7b47ec67f3fa300df"
-SRCREV_ti = "3da6fae25fc44ec830fac4a92787b585ff55435e"
-SRCREV_libmetal = "39d049d4ae68e6f6d595fce7de1dcfc1024fb4eb"
-SRCREV_quicklogic = "b3a66fe6d04d87fd1533a5c8de51d0599fcd08d0"
-SRCREV_lvgl = "31acbaa36e9e74ab88ac81e3d21e7f1d00a71136"
-SRCREV_mbedtls = "5765cb7f75a9973ae9232d438e361a9d7bbc49e7"
-SRCREV_mcuboot = "2fce9769b191411d580bbc65b043956c2ae9307e"
-SRCREV_mcumgr = "5c5055f5a7565f8152d75fcecf07262928b4d56e"
-SRCREV_net-tools = "f49bd1354616fae4093bf36e5eaee43c51a55127"
-SRCREV_nxp = "0d11138724959e1162777d9206f841ccdf64348e"
-SRCREV_open-amp = "6010f0523cbc75f551d9256cf782f173177acdef"
-SRCREV_loramac-node = "2cee5f7295ff0ff804bf06fea5de006bc7cd121e"
-SRCREV_openthread = "385e19da1ae15f27872c2543b97276a42f102ead"
-SRCREV_segger = "3a52ab222133193802d3c3b4d21730b9b1f1d2f6"
-SRCREV_sof = "779f28ed465c03899c8a7d4aaf399856f4e51158"
-SRCREV_tinycbor = "40daca97b478989884bffb5226e9ab73ca54b8c4"
-SRCREV_tinycrypt = "3e9a49d2672ec01435ffbf0d788db6d95ef28de0"
-SRCREV_littlefs = "9e4498d1c73009acd84bb36036ee5e2869112a6c"
-SRCREV_mipi-sys-t = "75e671550ac1acb502f315fe4952514dc73f7bfb"
-SRCREV_nrf_hw_models = "a47e326ca772ddd14cc3b9d4ca30a9ab44ecca16"
-SRCREV_TraceRecorder = "5b5f8d7adbf0e93a09087e8f5708f0eebb8b25bf"
-SRCREV_xtensa = "2f04b615cd5ad3a1b8abef33f9bdd10cc1990ed6"
-SRCREV_edtt = "7dd56fc100d79cc45c33d43e7401d1803e26f6e7"
-SRCREV_tfm = "e18b7a9b040b5b5324520388047c9e7d678447e6"
-SRCREV_tfm-mcuboot = "4aa516e7281fc6f9a2dce0b0efda9acc580fa254"
-SRCREV_nanopb = "d148bd26718e4c10414f07a7eb1bd24c62e56c5d"
-SRCREV_tensorflow = "dc70a45a7cc12c25726a32cd91b28be59e7bc596"
-
-ZEPHYR_BRANCH = "v2.6-branch"
-PV = "2.6.1+git${SRCPV}"
-
-SRC_URI:append = " \
-    file://0001-cmake-add-yocto-toolchain.patch \
-    file://0001-x86-fix-efi-binary-generation-issue-in-cross-compila.patch \
-    file://arduino-nano-33-ble-storage-partition.patch \
-    file://dtc.patch \
-"
-- 
2.30.1


