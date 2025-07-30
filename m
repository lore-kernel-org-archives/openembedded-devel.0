Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EC68C87FD5
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 09:55:09 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.31369.1753869305704228510
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Jul 2025 02:55:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pE7s6iFX;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753869307; x=1785405307;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uKn14JwgQjNDdCMsq4ZSosnotN/H2MfmsE9pG+EppsY=;
  b=pE7s6iFX3ExAgztX1KTuRPb6nIyTfiWwZwmcXdH/5L65HCABRxUqG4TH
   aJQ8gyaawbdpSmyCIcI37L585kT3v1IC8khp4avYGvZd8V1bpuId16WYE
   hWwlqNvHZHpjL4mt49H4QhFTOc6nyMcia5Kqm0w/bOI7NAYUNYNOEfViP
   MUJX6F4tL3LBHZZp2VJS+hALR5SNXY3+IG0LM8FkJ90hdbinI2/OnMfag
   a+nVJsoEbNbmiqX4NEVzpkBRAy1Kpm1nYTF44nYlRr66uM8cjRIafMZUw
   bC54obV7rLjiKha+Ra13ZybqaO3YMubeGh331f4Wvj8Gs4TBaIv329wsV
   w==;
X-CSE-ConnectionGUID: JsRuCOm+TZ2qufpLMIZJig==
X-CSE-MsgGUID: ll6nJSHtSoi1xmFuvecf/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="211191707"
X-IronPort-AV: E=Sophos;i="6.16,350,1744038000"; 
   d="scan'208";a="211191707"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 18:55:06 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 9B19C1446
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:05 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 0C0061C00169
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:05 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5961D1A0090;
	Wed, 30 Jul 2025 17:55:01 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 07/40] flashrom: upgrade 1.5.1 -> 1.6.0
Date: Wed, 30 Jul 2025 17:54:23 +0800
Message-ID: <20250730095456.695-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250730095456.695-1-wangmy@fujitsu.com>
References: <20250730095456.695-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118772

From: Wang Mingyu <wangmy@fujitsu.com>

0002-meson-Add-options-pciutils-ftdi-usb.patch
refreshed for 1.6.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
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
index f7121e2503..2125f19dfe 100644
--- a/meta-oe/recipes-bsp/flashrom/flashrom_1.5.1.bb
+++ b/meta-oe/recipes-bsp/flashrom/flashrom_1.6.0.bb
@@ -7,7 +7,7 @@ SRC_URI = "https://download.flashrom.org/releases/flashrom-v${PV}.tar.xz \
            file://0002-meson-Add-options-pciutils-ftdi-usb.patch \
            "
 
-SRC_URI[sha256sum] = "1f934b076ed49eace203655ec249fc7861a6b8e87fe4aef732e47b6e485b6293"
+SRC_URI[sha256sum] = "8b9db3987df9b5fc81e70189d017905dd5f6be1e1410347f22687ab6d4c94423"
 
 S = "${UNPACKDIR}/flashrom-v${PV}"
 
-- 
2.43.0


