Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B3A4D35153
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 07:38:23 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7607.1775029096047793323
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2026 00:38:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NVRWYnl8;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775029096; x=1806565096;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/4pw3OTUGRLtFtRqWeahuDgkdFsGizwaQl2t7W2n8bY=;
  b=NVRWYnl8LqvPwiUn6cwGuCIDJboi/bSvbXgmjEysboh8YCQRpOy9gJHP
   l+eq1CN5qKqYoIgiazqwuAgkixwqQiOefpvXu8ldjdkVxT8V6GfDHdMps
   r6O6sxweX5QNQ4ZqvHGMWyb23VUoazNUMB2IDBQkAl7OzEWLfTX8a/sL+
   HlWgUMqnj6r5cvelmB9Cny7uiTy7RJmFje/jINQLBNR3LGzcaH2IlrK4u
   nW56n+vtVbdkH0mElHh6mt1DLJPa7GEsJeRh6DxJoXIXV95UBHzloxbLS
   xBEXubGI1huA6P8TFrIB9unl41ryGBOeLSLLLZkNqkeCcR01WUMuSmNKL
   w==;
X-CSE-ConnectionGUID: PgaeZcmrS3e0as5WSJo+ew==
X-CSE-MsgGUID: cuo/VdIKSZiUqGSctrC8SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="236117483"
X-IronPort-AV: E=Sophos;i="6.23,153,1770562800"; 
   d="scan'208";a="236117483"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 16:38:14 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 647BF1540
	for <openembedded-devel@lists.openembedded.org>; Wed,  1 Apr 2026 07:38:14 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 194EC18461B2
	for <openembedded-devel@lists.openembedded.org>; Wed,  1 Apr 2026 07:38:14 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id CF3B38214FB
	for <openembedded-devel@lists.openembedded.org>; Wed,  1 Apr 2026 07:38:11 +0000 (UTC)
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] zabbix: Fix multilib pkg check error
Date: Wed,  1 Apr 2026 15:38:06 +0800
Message-ID: <20260401073806.13715-1-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Apr 2026 07:38:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125900

Fix following error when multilib is used.
  configure: WARNING: using cross tools not prefixed with host triplet
  checking pkg-config is at least version 0.9.0... yes
  configure: error: cannot find pkg-config package for libpcre

Signed-off-by:  Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 meta-oe/recipes-connectivity/zabbix/zabbix_7.0.23.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_7.0.23.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_7.0.23.bb
index 1cbe9ed9b0..2712ef6589 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix_7.0.23.bb
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix_7.0.23.bb
@@ -56,6 +56,7 @@ EXTRA_OECONF = " \
     --with-libpthread \
     --with-libevent \
     --with-libpcre=${STAGING_EXECPREFIXDIR} \
+    --with-libpcre-lib=${STAGING_LIBDIR} \
     --with-iconv=${STAGING_EXECPREFIXDIR} \
 "
 CFLAGS:append = " -lldap -llber -pthread"
-- 
2.43.0


