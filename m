Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4030CCA0EFA
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 08:40:20 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.15391.1755679211835707185
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Aug 2025 01:40:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UgG3crwJ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1755679211; x=1787215211;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mgb+tKgibwtpFAPMPquTPuy8P0uOfPdWRh3imYERY9g=;
  b=UgG3crwJUB9iMkxEUieQBgJDS1GLghK3lBy5lpX4rJDOofG3tBQS+6r/
   rI3ZgEe8SkLE4W3dmwahZbku5tLqMa3XhXNJhR5iSdxpSve0bv7SpdSEq
   ZgwvQB0tQT3OB6FI4xijZvz80RBBW9teZhqCHJGSl1AWr+i6hvUGTfjAn
   lq+g8hVgCu/9zf9wPw/9cDpvIZSSyyPOIQslcaKOQmJx+p2WOSNS/mQNY
   TMbDBMwNMQTE1y7boeDM+3pb5wwzi/3AuG8N4726yN2bZPbekjQPUZ8s2
   qlRoxGSq7bsh8AEd/4uQPtu5oegt+Hd8ymXKdIN325P4WQ3POaLBO+okD
   w==;
X-CSE-ConnectionGUID: q7iu3VAGTUi0r1iB74JfzQ==
X-CSE-MsgGUID: 5XdVH+1hTnKluamTfd1p3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="210584687"
X-IronPort-AV: E=Sophos;i="6.17,302,1747666800"; 
   d="scan'208";a="210584687"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 17:40:04 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 3375C1000344
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:04 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id DDB2DC0373F
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:03 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTPS id BDB0F10003F5
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:01 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C4A781A0069;
	Wed, 20 Aug 2025 16:39:58 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 15/26] nss: upgrade 3.114 -> 3.115
Date: Wed, 20 Aug 2025 16:39:34 +0800
Message-ID: <20250820083945.802-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250820083945.802-1-wangmy@fujitsu.com>
References: <20250820083945.802-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119037

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/nss/{nss_3.114.bb => nss_3.115.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/nss/{nss_3.114.bb => nss_3.115.bb} (99%)

diff --git a/meta-oe/recipes-support/nss/nss_3.114.bb b/meta-oe/recipes-support/nss/nss_3.115.bb
similarity index 99%
rename from meta-oe/recipes-support/nss/nss_3.114.bb
rename to meta-oe/recipes-support/nss/nss_3.115.bb
index 14aa12c923..7ac488cd4c 100644
--- a/meta-oe/recipes-support/nss/nss_3.114.bb
+++ b/meta-oe/recipes-support/nss/nss_3.115.bb
@@ -33,7 +33,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/security/nss/releases/${VERSION_DIR}/src/$
            file://0006-Fix-nss-multilib-build-on-openSUSE-11.x-32bit.patch \
            file://0007-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
            "
-SRC_URI[sha256sum] = "cac3c0d67028804fb316e9695f81749fa4dc118e731d674b4c4c347bd849c2f1"
+SRC_URI[sha256sum] = "ac2a47fb33bd79320159144e01c0d4af9a937a2d928c7c77ff06f5d9507861ab"
 
 UPSTREAM_CHECK_URI = "https://ftp.mozilla.org/pub/security/nss/releases/"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>\d+(\_\d+)+)"
-- 
2.43.0


