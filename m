Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20796111225E
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 02:15:32 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7091.1775096126299395392
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2026 19:15:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TjA/Y4Pk;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775096126; x=1806632126;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LC3oS7bXP/DnF80i8RSrGWIqpwgS8nczGESCHJ5miJQ=;
  b=TjA/Y4PkswwnD7tIdVG77nUXTHGOf0KjT6fMvtz46DXpigdy56ErXXI2
   EpbKoG3S7bSxBkX+nrxqdc6N3kJYu6ITLMtLnCZlsbIjFsui4QGHtqstW
   qigl4UVcm6J9QWXBoeyUshHhnx3GSjRtne5gqCXWDZ6xyXtxTBVWsTm3o
   suzPUSay2TpZdRzjeTZfE4jH/w2xvnV4i4Fh8EuiF4qvAu79JfOxLA/ia
   1qm13ze0UPR7I1M0gmcMLaTTRALvmEBJ7nv1oaLjRnf1yvSIJ4ivt2a8B
   u4Urh/pCuf6D1sQSQMQHPm+wEFVd0MwUOJhdm3C7IpCa6gzNGsuJRX5hY
   g==;
X-CSE-ConnectionGUID: ZZAgwPw3S52vN5DRmVXaAg==
X-CSE-MsgGUID: +BGyvqlfRDqxO12UMXU1IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="214501867"
X-IronPort-AV: E=Sophos;i="6.23,153,1770562800"; 
   d="scan'208";a="214501867"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 11:15:25 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id D5F52820C24
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:15:24 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 8DD27896E17
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:15:24 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 33BE410001CA;
	Thu,  2 Apr 2026 02:15:21 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 12/39] libwebsockets: upgrade 4.5.7 -> 4.5.8
Date: Thu,  2 Apr 2026 10:13:27 +0800
Message-ID: <20260402021355.1324-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260402021355.1324-1-wangmy@fujitsu.com>
References: <20260402021355.1324-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 02:15:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125927

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libwebsockets_4.5.7.bb => libwebsockets_4.5.8.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/libwebsockets/{libwebsockets_4.5.7.bb => libwebsockets_4.5.8.bb} (98%)

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.7.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.8.bb
similarity index 98%
rename from meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.7.bb
rename to meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.8.bb
index 9c7c60742d..02843be7c3 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.7.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.8.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b5d391cc7929bcba238f9ba6805f7574"
 DEPENDS = "zlib"
 DEPENDS:append:class-native = " libcap-native"
 
-SRCREV = "94b9bdbfec2a89464505fc8cc379f33d4e334018"
+SRCREV = "fbb0baf6af9c4324f0f1591734c78b0089b599d4"
 SRC_URI = "git://github.com/warmcat/libwebsockets.git;protocol=https;branch=v4.5-stable;tag=v${PV}"
 
 UPSTREAM_CHECK_URI = "https://github.com/warmcat/${BPN}/releases"
-- 
2.43.0


