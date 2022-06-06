Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACE26CCA473
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 12:19:54 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.31140.1654517990113120457
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jun 2022 05:19:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=HCa0ds7i;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1654517988; i=@fujitsu.com;
	bh=zbQpv7brqIZlhXpON7sS02VfF5SWk85dlz4pDMcTtYY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=HCa0ds7iA7usIOqWSaphYkuak7oD0s92qULLHlnnm4wA5I4hOXDvjSql+Gzq70RaM
	 Civ4CqPj/P/VOPOpI0F+y07MS1ke98ktTs9HZ4Bm1JZdr1yLQb1AgobB/3GfLQa0//
	 /2Ax5I/BiS5qxp51N/3ALAhbhDkSWXp9U4mLcOWGkP3LlM/JBoQoYr5Wz99Q2NCETC
	 imCNKKs8OrLL46Z4+9pKRkGGP33mtx41F8EW+YOX8MYHFQvz+EwFvncmoJi2jhm67R
	 Q5QyIbmjCix4m9VUmQkIFCTYLrRW2ZzfMgYaiA2eXqQESY1yIRGqEEJIwjlYjv4n8D
	 vCq70kmxmpTKQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJIsWRWlGSWpSXmKPExsViZ8ORqPv4w9w
  kg+mXNC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1owZ32exFGzmrOhZPJ2xgfEKRxcjF4eQwBNG
  ib+nrjBDOBeYJHYumM8E4exmlPi09DKQw8nBJqAmMf3WDVYQW0RAX2Lp7D3MIDazgIrEi9897
  CC2sIC7xOoZW8BqWIDiT6/3g/XyCjhK3Jh4FqxGQkBBYsrD92C9nAJOEjvmrQaLCwHVbP96hA
  2iXlDi5MwnLBDzJSQOvnjBDNGrKDH7cjMLhF0hMWPGNjYIW03i6rlNzBMYBWchaZ+FpH0BI9M
  qRpukosz0jJLcxMwcXUMDA11DQ1NdSzNdQxMLvcQq3US91FLdvPyikgxdQ73E8mK91OJiveLK
  3OScFL281JJNjMBQTilOmLKD8fC+X3qHGCU5mJREee2vzU0S4kvKT6nMSCzOiC8qzUktPsQow
  8GhJMF7/A1QTrAoNT21Ii0zBxhXMGkJDh4lEV7rd0Bp3uKCxNzizHSI1ClGXY6ZX9sOMAux5O
  XnpUqJ8wa9ByoSACnKKM2DGwGL8UuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHmLQabwZOa
  VwG16BXQEE9ARPg/mgBxRkoiQkmpg4jhd990r8tv5mfPlOEKchNR53C/2KT2OlTqwbz0LQ8G5
  iNpcjrk7SlLN5x4IOybyQW2ywxLjZxMMHWdvbt472VcgcIN1z0/tk/UXt2eb3X7Ae/229b942
  dv/X9uF/Pu9c3LX9msSgrKFSrNNbBqfheuvUeJ9eDhlbq+e5C7mJX+43cPytws3TrwyK1HLoj
  hE9oVwRk7wqTwb3Sm1sdJyYftU1z08HXNH/oZw/Uajpefl3BZ+q2vMluW0lUtumpgyTWjJ1Ox
  rFpZ6H5nKfLMEKvRMs3b8Ohfin/vo6mSf6L6eBiPLgok7vyZ8M7CPTVNv2N9/eL10TUTrLbPg
  P11v1umv4tzjdzjd2CU1OlKJpTgj0VCLuag4EQD9SJTEbAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-745.messagelabs.com!1654517987!628841!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26894 invoked from network); 6 Jun 2022 12:19:47 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-17.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 6 Jun 2022 12:19:47 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 15B22100191
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  6 Jun 2022 13:19:47 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id DE15A1001B4
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  6 Jun 2022 13:19:46 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 6 Jun 2022 13:19:40 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH] libnet-dns-perl: upgrade 1.33 -> 1.34
Date: Mon, 6 Jun 2022 20:19:07 +0800
Message-ID: <1654517949-9033-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1654517949-9033-1-git-send-email-wangmy@fujitsu.com>
References: <1654517949-9033-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jun 2022 12:19:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97420

Changelog:
==========
Improve robustness of EDNS option compose/decompose functions.

Simplify code in Makefile.PL.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libnet/{libnet-dns-perl_1.33.bb => libnet-dns-perl_1.34.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libnet/{libnet-dns-perl_1.33.bb => libnet-dns-perl_1.34.bb} (95%)

diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.33.bb b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.34.bb
similarity index 95%
rename from meta-perl/recipes-perl/libnet/libnet-dns-perl_1.33.bb
rename to meta-perl/recipes-perl/libnet/libnet-dns-perl_1.34.bb
index 2c7d793a7..69afe6eef 100644
--- a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.33.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.34.bb
@@ -9,7 +9,7 @@ DEPENDS += "perl"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/N/NL/NLNETLABS/Net-DNS-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "5a40e7cf524e4bd2c33cf03b82b47d5308b712083aa5ee180b0b5af54c71fbd2"
+SRC_URI[sha256sum] = "de756e3fb6addbd32beafc869c4dd1c6a0b3783c5ef56dbefc6809443a4b1d15"
 
 UPSTREAM_CHECK_REGEX = "Net\-DNS\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
-- 
2.25.1


