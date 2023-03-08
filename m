Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DBCCC742A7
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 13:24:01 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.6683.1678281838292718362
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Mar 2023 05:23:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=fLZNaz2c;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678281836; i=@fujitsu.com;
	bh=nqUYJB+9pjidgwxZ9scKKXm9Fyt8sf+rhTQUW83MgbU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=fLZNaz2caimp55AbVomtON0r9aXEedXRRYtCa6NDdt1bNggdMc6770/XCACrXGU5z
	 u2f5Ug2CkcsaGaAuKRb59KyCL1WFiTMEgDEqNwr1zUTwHk8E1jdp3MhVr7EFXzqPUl
	 zaS/9ah9d/6bW5TZS8ZURhfYTcYHaPTnQHfaB7cM5XIrGXg0uhQ4b885aG02hcJl3O
	 bDEY8/OnjGvGmPJxyJuCxEJMbaRWCGoqUZ1BgQHbZr9n4E2+E0k76NyzHI5NiBz0AU
	 CVjVmX1iIJcljo4gkEHcOD/8YDOBV08nN07vP+cvQ+Lxj/wzmxSMZbB5ghb5cEe41F
	 VdxtKA6vb8zww==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8OxWTenhyP
  FYEkLs8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrHkfUDBSY6KJRf+MzUwnmHvYuTkEBJ4wCjx
  qTOvi5ELyL7CJHH02m1mCGcPo8Srh6fZQKrYBKQkbtz/D2aLCOhLLJ29hxnEZhZQkXjxuwdsk
  rCAg8T9ebfBaliA4u82vmAEsXkFnCQef/8JVi8hoCAx5eF7MJtTwFli5tLTLBBXOEncbDrJCl
  EvKHFy5hMWiPkSEgdfvIDqVZSYfbmZBcKulGj98AvKVpO4em4T8wRGwVlI2mchaV/AyLSK0bw
  4tagstUjX0EAvqSgzPaMkNzEzRy+xSjdRL7VUNy+/qCRD11AvsbxYL7W4WK+4Mjc5J0UvL7Vk
  EyMweFOKE+fvYLzc91fvEKMkB5OSKC9rDEeKEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQneT11AO
  cGi1PTUirTMHGAkwaQlOHiURHjv1gOleYsLEnOLM9MhUqcYFaXEeTeA9AmAJDJK8+DaYNF7iV
  FWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iw73aQKTyZeSVw018BLWYCWnxhPwvI4pJEhJRUA1P
  trn3cH8X1+Btm2jXWR0hkJ7F8Y7ZUX/70pd3kh8sfLwk/9m/LCVtP68kNXN2xCxtLjyi+WT69
  eNK5BZkf/WKWO36OUQ5gYVnnZtXKEnd/rugJ7oAJTyxLXYIMNLYfjeZ9310oafr7iE7lFU2rK
  LdA/tAnKs8elMmwGhcvOBS4lvu2fryZ6STuL5tOpL2NPNHuVrNl8szsrDXnNubU3fDhUZq+wC
  X+feKNgHfzm+Mm1dtxbl8xJ/G0UUMkQ/+JpFD7D9/X/km1Eoq9G3xtoXqU1Z5l3c1X/0x8xfZ
  WO05Rd+uPcEu25TXJja+VQy82rRJZFfZuweynbvUit52538W+uDf7TKtgQOGCzWvOMyqxFGck
  GmoxFxUnAgB6zkzkWQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-745.messagelabs.com!1678281835!892364!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16584 invoked from network); 8 Mar 2023 13:23:56 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-17.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Mar 2023 13:23:56 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 709F37C
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Mar 2023 13:23:55 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 64CEC7B
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Mar 2023 13:23:55 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 8 Mar 2023 13:23:54 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libvpx: upgrade 1.12.0 -> 1.13.0
Date: Wed, 8 Mar 2023 21:23:38 +0800
Message-ID: <1678281820-25489-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678281820-25489-1-git-send-email-wangmy@fujitsu.com>
References: <1678281820-25489-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Mar 2023 13:24:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101418

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../webm/{libvpx_1.12.0.bb => libvpx_1.13.0.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-multimedia/webm/{libvpx_1.12.0.bb => libvpx_1.13.0.bb} (96%)

diff --git a/meta-oe/recipes-multimedia/webm/libvpx_1.12.0.bb b/meta-oe/recipes-multimedia/webm/libvpx_1.13.0.bb
similarity index 96%
rename from meta-oe/recipes-multimedia/webm/libvpx_1.12.0.bb
rename to meta-oe/recipes-multimedia/webm/libvpx_1.13.0.bb
index e9e3e9364..79b330c31 100644
--- a/meta-oe/recipes-multimedia/webm/libvpx_1.12.0.bb
+++ b/meta-oe/recipes-multimedia/webm/libvpx_1.13.0.bb
@@ -7,7 +7,7 @@ LICENSE = "BSD-3-Clause"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d5b04755015be901744a78cc30d390d4"
 
-SRCREV = "03265cd42b3783532de72f2ded5436652e6f5ce3"
+SRCREV = "d6eb9696aa72473c1a11d34d928d35a3acc0c9a9"
 SRC_URI += "git://chromium.googlesource.com/webm/libvpx;protocol=https;branch=main \
            file://libvpx-configure-support-blank-prefix.patch \
            "
-- 
2.34.1


