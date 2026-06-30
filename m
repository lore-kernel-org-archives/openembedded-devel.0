Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1072AC44502
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 09:22:51 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16868.1782811369638600450
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2026 02:22:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=AdFSIzTw;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782811370; x=1814347370;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=03tKsWP0VU0Cz1a7oie0o/+kbpR4CJQqXVDoKv2LGBI=;
  b=AdFSIzTwpPEBB80WF4pivkcnj3mzozBmAqjE5Rufk2Gw2q/U47CR37hk
   u56lEBASg7xGyM4Gwtw+oZSdWcMIzzg5EGb7ta1Npymy06r0XrJNHMQjf
   8y5TdF1o/xG8EIXUsa5gmrf6VT8UtWyati6BZuFdRAa7xwUMDxW9XBmqW
   V7L5e6r11VSDpkfsXYXs1Wt74wbfUqjpaU9tLqjv3UnOPnP0g6QT10obP
   tKzlQOBzRA6s0KkKoW98cesH8XoxX6VA226t/1E8WcYBdBgE1Tj1UPjWx
   qozmMUcBvop+OwLeT2G3hqvi8gkGO+7ADNY5iMdNSQE0I2V23udKcSgvn
   Q==;
X-CSE-ConnectionGUID: HweoboclRS+Afb2pGeRrhA==
X-CSE-MsgGUID: b9xwPJLCR0Ssd/9tJp8rSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="249218249"
X-IronPort-AV: E=Sophos;i="6.24,233,1774278000"; 
   d="scan'208";a="249218249"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 18:22:50 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id BD4ABC00567
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:49 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 745ADC00805
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:49 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 82B63826FFA;
	Tue, 30 Jun 2026 09:22:47 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 25/37] python3-pandas: upgrade 3.0.3 -> 3.0.4
Date: Tue, 30 Jun 2026 17:21:53 +0800
Message-ID: <20260630092206.322-25-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260630092206.322-1-wangmy@fujitsu.com>
References: <20260630092206.322-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127967

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pandas_3.0.3.bb => python3-pandas_3.0.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pandas_3.0.3.bb => python3-pandas_3.0.4.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_3.0.3.bb b/meta-python/recipes-devtools/python/python3-pandas_3.0.4.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-pandas_3.0.3.bb
rename to meta-python/recipes-devtools/python/python3-pandas_3.0.4.bb
index 132a0acee7..d837e7d79a 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_3.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_3.0.4.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e98642e1210ade884e5254ab18d55b7d"
 
 SRC_URI:append:class-target = " file://0001-BLD-add-option-to-specify-numpy-header-location.patch "
 
-SRC_URI[sha256sum] = "696a4a00a2a2a35d4e5deb3fc946641b96c944f02230e4f76137fe35d806c4fc"
+SRC_URI[sha256sum] = "62f6062586d159663825f06e70ef49cd1572d45824cb63a9559f3ffd1d0d2a20"
 
 CVE_PRODUCT = "pandas"
 
-- 
2.43.0


