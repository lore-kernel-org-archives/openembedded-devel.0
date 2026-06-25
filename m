Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D3D6CDE002
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 09:01:57 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7004.1782378113498773788
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2026 02:01:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bkAO6T8X;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782378115; x=1813914115;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IFt1jj/aYXb9WK9wgtRrPVhrl/1xzcFeZeVNM8Oy0Is=;
  b=bkAO6T8XKiJUZs4Qm+8sy3I0lrS/VtzfeJ6lsc13Hkc3pXKP+TI+ba+E
   nGsWtyKTogd1cgJAkYDJLbr78pmOIG5jR6H8Vtqlb9EZjLccZU/XZWJ56
   xOQxFBiC3ZTRN7l4+Gna3SlVjsIwCiGv5x/BDHVpifDgimKryerBtTSgz
   ZVOOsBVqD9w1DpsaqFcdWvc3/0Mm956NYiLNfHRBoOn/EPHUirqPCFEhZ
   IhCdD5F1qB5cZQeG26LvJ5Zs2Xa/qjmI99dh8RC0r3uF27NzGsTbMOmkV
   iCg05QFbdxS5q+/Z5ZzBc5ksJdhgeX36dDOUMjjMzfH7lF9Rd9+96Xg8b
   Q==;
X-CSE-ConnectionGUID: 80EPMVFaQeGnDzmEYqn2RQ==
X-CSE-MsgGUID: yxOM3T1jTp2/K/wJMUugJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="243444578"
X-IronPort-AV: E=Sophos;i="6.24,224,1774278000"; 
   d="scan'208";a="243444578"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 18:01:53 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id D319E820C2D
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:01:51 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 8AB411407343
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:01:51 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 8CD25101732C;
	Thu, 25 Jun 2026 09:01:49 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 13/47] postfix: upgrade 3.11.3 -> 3.11.4
Date: Thu, 25 Jun 2026 17:00:53 +0800
Message-ID: <20260625090127.1563-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260625090127.1563-1-wangmy@fujitsu.com>
References: <20260625090127.1563-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:01:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127745

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../postfix/{postfix_3.11.3.bb => postfix_3.11.4.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/postfix/{postfix_3.11.3.bb => postfix_3.11.4.bb} (99%)

diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.11.3.bb b/meta-networking/recipes-daemons/postfix/postfix_3.11.4.bb
similarity index 99%
rename from meta-networking/recipes-daemons/postfix/postfix_3.11.3.bb
rename to meta-networking/recipes-daemons/postfix/postfix_3.11.4.bb
index 0c38c743e7..1877c3c187 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.11.3.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.11.4.bb
@@ -29,7 +29,7 @@ SRC_URI = "http://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${P
            file://0001-Fix-build-with-musl.patch \
            "
 
-SRC_URI[sha256sum] = "bd11dcc463d7045e40f2c11cc00216489c73b58cc40b3d06c54265b088a173e1"
+SRC_URI[sha256sum] = "226ec59a18e43e277691005e31496f7608b9ba9210be600a267fb217a4a6cee9"
 
 UPSTREAM_CHECK_URI = "https://www.postfix.org/announcements.html"
 UPSTREAM_CHECK_REGEX = "postfix-(?P<pver>\d+(\.\d+)+)"
-- 
2.43.0


