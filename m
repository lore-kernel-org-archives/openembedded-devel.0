Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86305E7718F
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:20 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.30503.1735032439305966671
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=AZFat8MV;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032439; x=1766568439;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=xMhKs6+yZAi4Mz5uQXafw2bMzRfzFxLk6LvaFDlWdIM=;
  b=AZFat8MVDNT+7XwhcwL+Ux473YKc4dBsFeXRIXQeQFyLSDJ4s9xNYd3x
   OlRSKdDZp7Brv8HUPlzzdFFq4hNZmBe0aHlb+pSi0mCpK3/utjtU1HTSy
   8IXOinhXPw8vJThu/R318l31V7G6jmxZlfsjaYYOTNMaJ8RsNdOzI9BAw
   oyDAnueTrhQMwosc+G14PQsWnP8u5NmCRcISDNqOcS6rIOSHfQJjbVsi3
   Jdk92neni0F8hJms1YZijoJ8BfoLrTvweT2SNX6dscCExlm9Mhu1+Nggg
   KLPMPyIVDuP5pXp7cxwFunpBP3cmDn6P7GlGGN383zRHYjtloWeR8ByXb
   w==;
X-CSE-ConnectionGUID: f7iJ2QFvQaSGgmhQXkn85A==
X-CSE-MsgGUID: sAnW7l4TQ/KnCKckBJXnWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="184807078"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="184807078"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:17 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0E0CFD4C2B
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:15 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id CDC3FD6FE5
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:14 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6CA6820071A3A
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:14 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1251D1A0071;
	Tue, 24 Dec 2024 17:27:14 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/67] nano: upgrade 8.2 -> 8.3
Date: Tue, 24 Dec 2024 17:25:58 +0800
Message-Id: <1735032421-13513-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10-5.874400-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrrOCEGIPhtwg3UrsA6U4tpDNW
	Kvzwh564CC8aAmGeO6nqXvXKPBg5BmVjCRquYdk+EXjPIvKd74BMkOX0UoduueuLH9BII+4qFCg
	FP1MFntYiihUtpSvK7UG82NOsVVSkkfRhdidsajMURSScn+QSXpjDMT0TyDk5+gtHj7OwNO2BMV
	0kqc2hZMATok6GGdZcESKgm9srssl9KwMC3qExEt8GZGu3aBAHNNpOFySQaYZHsRe34ZDcyjnpR
	IG4NrzHy2MQTJxj0DkO/hS9pQn1Wg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114478

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- A build failure with gcc-15 is fixed.
- Several translations were updated.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/nano/{nano_8.2.bb => nano_8.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/nano/{nano_8.2.bb => nano_8.3.bb} (88%)

diff --git a/meta-oe/recipes-support/nano/nano_8.2.bb b/meta-oe/recipes-support/nano/nano_8.3.bb
similarity index 88%
rename from meta-oe/recipes-support/nano/nano_8.2.bb
rename to meta-oe/recipes-support/nano/nano_8.3.bb
index 46e5a15c1c..c6ca55f444 100644
--- a/meta-oe/recipes-support/nano/nano_8.2.bb
+++ b/meta-oe/recipes-support/nano/nano_8.3.bb
@@ -13,7 +13,7 @@ RDEPENDS:${PN} = "ncurses-terminfo-base"
 PV_MAJOR = "${@d.getVar('PV').split('.')[0]}"
 
 SRC_URI = "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz"
-SRC_URI[sha256sum] = "d5ad07dd862facae03051c54c6535e54c7ed7407318783fcad1ad2d7076fffeb"
+SRC_URI[sha256sum] = "551b717b2e28f7e90f749323686a1b5bbbd84cfa1390604d854a3ca3778f111e"
 
 UPSTREAM_CHECK_URI = "https://ftp.gnu.org/gnu/nano"
 
-- 
2.43.0


