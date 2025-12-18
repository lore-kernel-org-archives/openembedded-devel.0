Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 401D4D6ACCE
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 09:04:33 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37586.1766048666714132088
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Dec 2025 01:04:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sqr56Qux;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766048666; x=1797584666;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xmPmmTAJJKhuNoAdd7iCDcDEZhze5OAXpHydue+rEkA=;
  b=sqr56Qux76fQcIPHDB6i+JgGEv5j++HW8o4Q6kj8snaYXczolKp9fCJ5
   ya9b+DsAl6Wq9rniECBBTAaxMpev2cAqSp6QcR48dLjwo7TJoclq9WtBT
   o+MwpWJZT2KtQrmZ/4wvmHVvoUiY6tTYMKgxElkT3FHuP8T3bFHgEEh9X
   gY97J7CL2Pzwa8yCiWf+9EJRulDJg8q12QJeKrQVGdjm+zotTD4wo3zCk
   4fCWtv9U/mxVKOjwxZEk9eCkd8zDig0qZSmK2PNh3u/QllTJkmMk849HE
   PEx6Ioo05/xiyf8sEssOrktsuClUTTwJlmFlyE+URIxTytUEJJDz3ZiVN
   A==;
X-CSE-ConnectionGUID: eVB056OGSBygmvsgbEQn2w==
X-CSE-MsgGUID: vOa/YVMjQGmGBkpSfon2cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="210514216"
X-IronPort-AV: E=Sophos;i="6.21,158,1763391600"; 
   d="scan'208";a="210514216"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 18:04:25 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 4CCC64071C6
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:04:25 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 00C5EC00222
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:04:25 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 8926D101E51F;
	Thu, 18 Dec 2025 09:04:22 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 19/20] switchtec-user: upgrade 4.2 -> 4.3
Date: Thu, 18 Dec 2025 17:03:45 +0800
Message-ID: <20251218090346.735-19-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251218090346.735-1-wangmy@fujitsu.com>
References: <20251218090346.735-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:04:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122753

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{switchtec-user_4.2.bb => switchtec-user_4.3.bb}           | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-support/switchtec-user/{switchtec-user_4.2.bb => switchtec-user_4.3.bb} (89%)

diff --git a/meta-oe/recipes-support/switchtec-user/switchtec-user_4.2.bb b/meta-oe/recipes-support/switchtec-user/switchtec-user_4.3.bb
similarity index 89%
rename from meta-oe/recipes-support/switchtec-user/switchtec-user_4.2.bb
rename to meta-oe/recipes-support/switchtec-user/switchtec-user_4.3.bb
index bba2507e14..17567e27bd 100644
--- a/meta-oe/recipes-support/switchtec-user/switchtec-user_4.2.bb
+++ b/meta-oe/recipes-support/switchtec-user/switchtec-user_4.3.bb
@@ -6,8 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3d6b07c89629cff2990d2e8e1f4c2382"
 
 DEPENDS = "ncurses openssl"
 
-SRCREV = "e7c351c6c722336b3c79b79cd002c7c2986eefb0"
-SRC_URI = "git://github.com/Microsemi/switchtec-user.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/Microsemi/switchtec-user.git;protocol=https;branch=master;tag=v${PV}"
 SRC_URI[sha256sum] = "a715e46d8498418dbb8a2519318ba0714ee148151d7e4a7fa5e27770a2f6888f"
 
 
-- 
2.43.0


