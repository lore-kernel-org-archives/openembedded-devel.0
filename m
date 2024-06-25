Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C9BEC3065D
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 08:57:04 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.167215.1719305816461089847
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 01:57:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=oyfl6Aw7;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719305821; x=1750841821;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=5CdyUOhp6qJ1IYJoUZE7pKNC7v18Q+AHq3hilALguc0=;
  b=oyfl6Aw7it4gFsICOtJTDqSh3WrKY4F8bdB4z4TUARLDr4ZDTkxqbx7X
   oCy+PTQ+sXfkhD4/s9D+GdvcNz1uOrQFKf9PDmpilJHLpDDJnfxqJuESJ
   tiyT+K2r2eHsyg5YMiGMyJt2FO7+h6LqEzOpoeNO9aBOn0DKQhZPF5JF9
   BJC9Siw17ylnd8enIN7El4VNEXEgnbvBuN9oFf4re5cdM8zGXNJe5Jgej
   +uzvLgdiJO75ER3nbvhVhKi5jeeP84mdzp+elGvM8073utjG633OsIAOg
   anQ9HEptYo0rRVQ5Xi2r0FAw9Qe5kwC/Lk45esN0f8mTxtGA1iiV6+4jB
   Q==;
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="164869256"
X-IronPort-AV: E=Sophos;i="6.08,263,1712588400"; 
   d="scan'208";a="164869256"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 17:56:59 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 03590D6473
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:56:57 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 43241D8AF0
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:56:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id B08D02007CDC4
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:56:55 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5E0C61A0002;
	Tue, 25 Jun 2024 16:56:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 11/57] libcgi-perl: upgrade 4.64 -> 4.66
Date: Tue, 25 Jun 2024 16:55:44 +0800
Message-Id: <1719305790-11484-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
References: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28478.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28478.003
X-TMASE-Result: 10--2.219300-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrRvya7CP2yogI8aE7tJDUcFKC
	SV79DbqwIX+UmmSwEkcNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG21vZ
	7s3YIVDIcfwGQIbwrkNBDEhtWUzwVzdWLAp2GeBaeAiCmPx4NwGmRqNBHmBveeFIQTy0Zb4bfaY
	87m2dqxydET58jp62SwpQYN6qxKYDd3iQIvDDUJLBPGNRdxcCP6cPufi6JznjXev+WU5r2OLatd
	hcR5v23+ZNw8ZZn8emou1HUeK5T0VYYbLWWn7dsS7+RMq/2CK6rA4c7UV2fQpvi2PQO/FFQiz2u
	jrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 08:57:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111022

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Restore trailing slashes in the ->url call (GH #267)
- "fix" t/url.t for older Perls (GH #266)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libcgi/{libcgi-perl_4.64.bb => libcgi-perl_4.66.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libcgi/{libcgi-perl_4.64.bb => libcgi-perl_4.66.bb} (93%)

diff --git a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.64.bb b/meta-perl/recipes-perl/libcgi/libcgi-perl_4.66.bb
similarity index 93%
rename from meta-perl/recipes-perl/libcgi/libcgi-perl_4.64.bb
rename to meta-perl/recipes-perl/libcgi/libcgi-perl_4.66.bb
index 7b67cd862..94fb4393c 100644
--- a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.64.bb
+++ b/meta-perl/recipes-perl/libcgi/libcgi-perl_4.66.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=415fc49abed2728f9480cd32c8d67beb"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/L/LE/LEEJO/CGI-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "39bd8e40ce00cdab39e0a2bc71abd2bbe451d1d97bc7e54e41a2e199eb6226e7"
+SRC_URI[sha256sum] = "4697437688a193e3f02556e1d223015590c1f2800b40becf83dc12d5cc5ed8e1"
 
 S = "${WORKDIR}/CGI-${PV}"
 
-- 
2.34.1


