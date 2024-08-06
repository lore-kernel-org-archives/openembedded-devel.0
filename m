Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32AD5C5472E
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 08:47:08 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.2883.1722934016725115195
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 01:46:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kdzi/t6o;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722934018; x=1754470018;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=IMCM07cNpjCPZGTaFc/3iQd+IiSpDakVe5FjDZSmvx8=;
  b=kdzi/t6ou78saDrsYUkIlhDDpQOKy2iYtqvEUezPw7BJtEnMyR7R4Qi1
   BRJljRolZHSt2yRP1JG422FMrn8QCRaOrpgjW6jge0fX+t1fLMh08LmqK
   s5DJwwIqLwGLFICR/nlG09LJabhFhiDIe24B/4GOhL+FlPoIZQml2s8cQ
   EXCbdodxncKoQkyQP2HyshgWSzNDaFoeJP87OxjYH6FAcS23Ftc/O28iy
   bKzUVnas5sBmkYrcKQdGxVtSU9nayIWaTVS13/CeMqyyn+ycJ9Net1c2u
   XsS2UdhoaA4Lv69daJTlJkBuHHW1xcqUaOCV/CwAD82MoBJon/yH6QfEg
   A==;
X-CSE-ConnectionGUID: T/hYkEZ6TbmjzKKsqJaD1w==
X-CSE-MsgGUID: lSxzylB6TGui8LhSK2q84g==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="157929859"
X-IronPort-AV: E=Sophos;i="6.09,267,1716217200"; 
   d="scan'208";a="157929859"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:46:56 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id CD228C9447
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:54 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 22F57D50B5
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9F2B6401B2
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:53 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4E55F1A000C;
	Tue,  6 Aug 2024 16:46:53 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 18/60] libpcsc-perl: upgrade 1.4.14 -> 1.4.15
Date: Tue,  6 Aug 2024 16:45:52 +0800
Message-Id: <1722933994-32549-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
References: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28578.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28578.006
X-TMASE-Result: 10-2.379800-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmLP85tlrdTfE3uDhljfG03rOwpfLMeBwRsGAD6h6FZmEdW0pkpPR1Da4nP
	T8jZv1NHi8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFKyBz/zUxvUzgyw/yCTRXGy45D
	l2KNebuEPNc064VAs9Y5ZZM++CTqobJkvOh37mtBE1FK5D7Va2criGkR7x0KG3gx/EsuZaZex9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 08:47:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111533

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../perl/{libpcsc-perl_1.4.14.bb => libpcsc-perl_1.4.15.bb}    | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/perl/{libpcsc-perl_1.4.14.bb => libpcsc-perl_1.4.15.bb} (84%)

diff --git a/meta-oe/recipes-devtools/perl/libpcsc-perl_1.4.14.bb b/meta-oe/recipes-devtools/perl/libpcsc-perl_1.4.15.bb
similarity index 84%
rename from meta-oe/recipes-devtools/perl/libpcsc-perl_1.4.14.bb
rename to meta-oe/recipes-devtools/perl/libpcsc-perl_1.4.15.bb
index aa2f2477c..ff1552a99 100644
--- a/meta-oe/recipes-devtools/perl/libpcsc-perl_1.4.14.bb
+++ b/meta-oe/recipes-devtools/perl/libpcsc-perl_1.4.15.bb
@@ -8,8 +8,7 @@ LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "https://cpan.metacpan.org/authors/id/W/WH/WHOM/pcsc-perl-${PV}.tar.bz2"
-SRC_URI[md5sum] = "45601505dbb7b27329811ac9bad35fab"
-SRC_URI[sha256sum] = "2722b7e5543e4faf3ba1ec6b29a7dfec6d92be1edec09d0a3191992d4d88c69d"
+SRC_URI[sha256sum] = "5cc834438739bd6e4e837fb7e10bd8befb809cd185ae6cf4b33e5fa9161f59fe"
 
 UPSTREAM_CHECK_URI = "https://cpan.metacpan.org/authors/id/W/WH/WHOM/"
 UPSTREAM_CHECK_REGEX = "pcsc-perl-(?P<pver>\d+(\.\d+)+)"
-- 
2.34.1


