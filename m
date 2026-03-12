Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53D6D103E30C
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 10:52:56 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18514.1773312767352861847
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 03:52:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MthBnVgt;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773312765; x=1804848765;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Iz8tKHnA11Ecd1LekxE3MAAnPC6eUM3s6L3nx+JSLdQ=;
  b=MthBnVgtoJz9c13ums6a2gtlZwjZqYC0mt30yUjh8I57lpqNvii/FtZe
   iduDewhboo9gZQx9R+EBnLVYquXJ+I+Iqv/O+dqO8+8DkhkGUmPNJm4JB
   l1IxQrcPPQRFLMu1gyHQzyUZUHHTX3Gbd5tJ+ZVfwlT9edCFOnLYeDIhB
   NhjtlfJ4v5XGasw2F6H+/ujUmNqcULs+2HHfRAu6ofGddiDTm85B3awYj
   F0a17udZwuQk0YiiHo3Af2Mpt+Oz23ZNcHnfh8fik0nCDSqqe5k6cxaax
   G+W5r7K1ydJvxDRMNpJSEGA49Ul4Tq96jcby+lyl52FxAPXubFhcgAqhP
   w==;
X-CSE-ConnectionGUID: hKN6FSAbR5yj5QaVvQnaAg==
X-CSE-MsgGUID: tBVHIz4QQ0+v4oh0EQ6jzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="211824316"
X-IronPort-AV: E=Sophos;i="6.23,116,1770562800"; 
   d="scan'208";a="211824316"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 19:52:43 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 79CE44071DE
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:52:45 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 2E07DC00D7E
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:52:45 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 4414F18029A5;
	Thu, 12 Mar 2026 10:52:41 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 09/64] imapfilter: upgrade 2.8.3 -> 2.8.5
Date: Thu, 12 Mar 2026 18:51:25 +0800
Message-ID: <20260312105220.1856-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260312105220.1856-1-wangmy@fujitsu.com>
References: <20260312105220.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:52:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125109

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: copyright year updated to 2026.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../imapfilter/{imapfilter_2.8.3.bb => imapfilter_2.8.5.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/imapfilter/{imapfilter_2.8.3.bb => imapfilter_2.8.5.bb} (80%)

diff --git a/meta-oe/recipes-support/imapfilter/imapfilter_2.8.3.bb b/meta-oe/recipes-support/imapfilter/imapfilter_2.8.5.bb
similarity index 80%
rename from meta-oe/recipes-support/imapfilter/imapfilter_2.8.3.bb
rename to meta-oe/recipes-support/imapfilter/imapfilter_2.8.5.bb
index f4905e3c0b..754e793faa 100644
--- a/meta-oe/recipes-support/imapfilter/imapfilter_2.8.3.bb
+++ b/meta-oe/recipes-support/imapfilter/imapfilter_2.8.5.bb
@@ -1,9 +1,9 @@
 SUMMARY = "IMAPFilter is a mail filtering utility that processes mailboxes based on IMAP queries"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f8d2fc4954306888fd0e4b27bef83525"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c9e8d74e78283c6319317d3cb15eded4"
 
 # v2.7.6
-SRCREV = "72f7fa621357299bb6c8f5d29b4efbafcbd34bf7"
+SRCREV = "23b693f7f7cad8b459beb5cf748078f9cc0e5dc8"
 SRC_URI = "git://github.com/lefcha/imapfilter;protocol=https;branch=master;tag=v${PV} \
            file://ldflags.patch \
 "
-- 
2.43.0


