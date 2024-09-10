Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A91EBECE582
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 09:03:42 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.18600.1725959018062381503
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Sep 2024 02:03:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HDrUtkiZ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725959018; x=1757495018;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=oQNIBjPZlnu3gTTo0SCoMMfJKtvOI6+DLdCNKdFuGkI=;
  b=HDrUtkiZ0x1nlPdY47V9EyG6gV0slYI/elqr3e5f83URzPJ10n6jnJZK
   zemSaO+LtlyJFXZP8TNIymnF1oSxjdeXygY/YYJLcC5Rfo0Ufdt88Jrc1
   wwP7aWCw11caVom8Dzzxs9BXhJsDI0I4YyIuX6O7uYYlceKUwhp5GxVB2
   PJPRZCJAEvVljRkZTrH9dJQTDblly125YiiXpaKXKGY4GT6QZ1uQ+CkYs
   fFANwlI5ATXz12FbKljmKoy9/+6z8pUzL3qM5SUGF33w79IzC28cv330+
   EYQe3AjoVKP2W5Nu86sdi9BdP6LaV3+wdKKG9jdWGSv1pqvkZT4yAyOqR
   w==;
X-CSE-ConnectionGUID: 7ovC2JRuRFCdGI9TxqyvUQ==
X-CSE-MsgGUID: 4A6eiLb3TT6r2s/nPWlKvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="173254634"
X-IronPort-AV: E=Sophos;i="6.10,216,1719846000"; 
   d="scan'208";a="173254634"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 18:03:36 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0700D16B902
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:34 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4313FD3F07
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:33 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C699B200894AD
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:32 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 79B681A01E9;
	Tue, 10 Sep 2024 17:03:32 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 39/42] uhubctl: upgrade 2.5.0 -> 2.6.0
Date: Tue, 10 Sep 2024 17:03:07 +0800
Message-Id: <1725958990-5719-39-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
References: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28654.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28654.006
X-TMASE-Result: 10--0.443200-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrrOCEGIPhtwhWLer44mCwezbo
	/KL/an8nnJ0c0AWmZwFMQ8GITGODLbBAQLqGlKivP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW7YxZ62pNYIbQhBeNJICtc+eBzEkCCpnRloMLOoNHsM9n0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtLZfdWrZEkN5A+kbRjmz3Wit1A5RBEE0mAfdr9JVJqUdwTJUiIquu29LDd
	5o6n+L0Vs/El4jvcVMlYXedCwAskI5zF6ex0PAFHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 09:03:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112226

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- Added support for Raspberry Pi 5
- Fixed bug for big-endian platforms
- Fixed sysfs path bug for Linux kernel 6.x or higher
- Added flash (inverted cycle) option - turn power on then off
- Improved Linux detection
- Added more devices to supported table

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../uhubctl/{uhubctl_2.5.0.bb => uhubctl_2.6.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/uhubctl/{uhubctl_2.5.0.bb => uhubctl_2.6.0.bb} (92%)

diff --git a/meta-oe/recipes-support/uhubctl/uhubctl_2.5.0.bb b/meta-oe/recipes-support/uhubctl/uhubctl_2.6.0.bb
similarity index 92%
rename from meta-oe/recipes-support/uhubctl/uhubctl_2.5.0.bb
rename to meta-oe/recipes-support/uhubctl/uhubctl_2.6.0.bb
index 8b334dbde..1a1d4ec33 100644
--- a/meta-oe/recipes-support/uhubctl/uhubctl_2.5.0.bb
+++ b/meta-oe/recipes-support/uhubctl/uhubctl_2.6.0.bb
@@ -6,7 +6,7 @@ DEPENDS = "libusb1"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRCREV = "20276ad5ced147d018e2b3fccedabd94597aa25e"
+SRCREV = "352f5878e999c0a9d5a453b34110479b2056d7e7"
 SRC_URI = "git://github.com/mvp/${BPN};branch=master;protocol=https"
 S = "${WORKDIR}/git"
 
-- 
2.34.1


