Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E36BC4332F
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 04:34:52 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.114831.1699504486994789731
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Nov 2023 20:34:47 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="138861113"
X-IronPort-AV: E=Sophos;i="6.03,288,1694703600"; 
   d="scan'208";a="138861113"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 13:34:45 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8382DD64A0
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Nov 2023 13:34:42 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id AF0F6D5E3E
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Nov 2023 13:34:41 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8042386D4E;
	Thu,  9 Nov 2023 13:34:40 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] gnome-remote-desktop: move from meta-virtualization to meta-security
Date: Thu,  9 Nov 2023 12:12:46 +0800
Message-Id: <1699503166-16206-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27986.002
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27986.002
X-TMASE-Result: 10--0.745200-10.000000
X-TMASE-MatchedRID: G+VdM6uSBxrz34/0W8UMJsTiL+P6CoMgFqnmaWfX3POaC7pyEMmvb9nf
	JrUSEbFDJMPD8FR5f5+KyFQABzstKFpCIuRr0RxKxLSsi9FKAT3BOVz0Jwcxl4UHaA6YOQoro8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXI5RQHvIzJxWRUHrXDf80Ts0opxKKX3eSvQ2v
	b7ankHVvXd0PCtZlBmLlw1rhL8jjpNz91gYQO0hJnnwqhmxUEjU8SAg/OLwcj+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Nov 2023 04:34:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106496

From: Wang Mingyu <wangmy@fujitsu.com>

There's no tpm2-tss under meta-virtualization:
Missing or unbuildable dependency chain was: ['gnome-remote-desktop', 'tpm2-tss']

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-gnome/conf/layer.conf                                       | 1 +
 .../gnome-remote-desktop/gnome-remote-desktop_45.1.bb            | 0
 2 files changed, 1 insertion(+)
 rename meta-gnome/dynamic-layers/{meta-virtualization => meta-security}/recipes-gnome/gnome-remote-desktop/gnome-remote-desktop_45.1.bb (100%)

diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
index acebb12892..1674283d51 100644
--- a/meta-gnome/conf/layer.conf
+++ b/meta-gnome/conf/layer.conf
@@ -27,4 +27,5 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "\
 BBFILES_DYNAMIC += " \
     virtualization-layer:${LAYERDIR}/dynamic-layers/meta-virtualization/*/*/*.bb \
     virtualization-layer:${LAYERDIR}/dynamic-layers/meta-virtualization/*/*/*.bbappend \
+    security:${LAYERDIR}/dynamic-layers/meta-security/*/*/*.bb \
 "
diff --git a/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gnome-remote-desktop/gnome-remote-desktop_45.1.bb b/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-desktop/gnome-remote-desktop_45.1.bb
similarity index 100%
rename from meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gnome-remote-desktop/gnome-remote-desktop_45.1.bb
rename to meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-desktop/gnome-remote-desktop_45.1.bb
-- 
2.34.1


