Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CCDEC27C4E
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 09:10:41 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.10753.1715677834352617882
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 May 2024 02:10:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mhzeIepl;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1715677834; x=1747213834;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=M9mGFmZBx8psj2Mfu6eF1H8Rf8WEk2XuYyWPRKpKecs=;
  b=mhzeIeplrG8Z1h/3lhBsLp1inngJ40M9I+QyBxej0/DuXO3G0qtr0zDE
   OZAyuO0tY6WmAESd0mlrB+Vv+tSsXXYupQA6OH37rK9Au/HuX6AhuoQ3j
   pXIgbaQViMG3Lfjlq0OtFsBYAWNXmwp3smY+grSOQBCCjD0mU6a/cu8SG
   DrqTYdpB5O00vw44oBGa6btRLmJFp+QdPuc/kZ01h8JJ8g9CfvzEyHuLs
   Ns1NCAEPucIbysWFIlxaPvj/t48+A6dbbkLx5HUpv/0DVNkQCTTpLME42
   P7H+zc+D3kbKI+3bjIcEJa9ynwh5yHEB254A5XqI9ON7I4OSp/hH8c+oj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="146707016"
X-IronPort-AV: E=Sophos;i="6.08,159,1712588400"; 
   d="scan'208";a="146707016"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 18:10:31 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id ABC97D4F57
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:29 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id E76A51B85C
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7F53770BFE
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:28 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2CF0C1A000B;
	Tue, 14 May 2024 17:10:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 13/44] openipmi: upgrade 2.0.34 -> 2.0.35
Date: Tue, 14 May 2024 17:09:46 +0800
Message-Id: <1715677817-2223-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
References: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28384.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28384.006
X-TMASE-Result: 10--0.451400-10.000000
X-TMASE-MatchedRID: uzDfqB7OXkqjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ5D53rZ0sb/daVXJCx4JNCngIgpj8eDcBpkajQR5gb3lQwtQm7iV5jKra
	uXd3MZDXJZkoovy/C5FuH2hx3WAKJ9yZgjUtvL/vruvwpfn8ZuPjAbm5xzK0Gv9flWCC/je/c3w
	us9GAuXn3Vxs9EkMhj/7Uo+RDkES6OIN/Y0IxYTVPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWL
	WlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 09:10:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110361

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../openipmi/{openipmi_2.0.34.bb => openipmi_2.0.35.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/openipmi/{openipmi_2.0.34.bb => openipmi_2.0.35.bb} (98%)

diff --git a/meta-networking/recipes-support/openipmi/openipmi_2.0.34.bb b/meta-networking/recipes-support/openipmi/openipmi_2.0.35.bb
similarity index 98%
rename from meta-networking/recipes-support/openipmi/openipmi_2.0.34.bb
rename to meta-networking/recipes-support/openipmi/openipmi_2.0.35.bb
index 743eef3b7..96d60a01f 100644
--- a/meta-networking/recipes-support/openipmi/openipmi_2.0.34.bb
+++ b/meta-networking/recipes-support/openipmi/openipmi_2.0.35.bb
@@ -34,7 +34,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/openipmi/OpenIPMI-${PV}.tar.gz \
 
 S = "${WORKDIR}/OpenIPMI-${PV}"
 
-SRC_URI[sha256sum] = "93227e43c72b5c3bd5949323e0669aa5527d1a971473a3a365af03fb8284a95f"
+SRC_URI[sha256sum] = "b059114f6299d73f04ff6e76a0857a0ab81aa362dee99644d256b223872437ad"
 
 inherit autotools-brokensep pkgconfig perlnative update-rc.d systemd cpan-base python3targetconfig
 
-- 
2.34.1


