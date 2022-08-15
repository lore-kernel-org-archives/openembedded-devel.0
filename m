Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BEE7C3F6B0
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 06:29:29 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web08.13617.1660544966651258531
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Aug 2022 23:29:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=iVstYcU+;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1660544964; i=@fujitsu.com;
	bh=DG4B/QUxOjaElzH1kwXFKg0d86gaJ35QDU18rj9rgKE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=iVstYcU+2hsQ1Ol8JslKVI6Yqo06cAPeg9mSU+XUdfyOi6RifSgbkftoqoEcK50j7
	 pyPWumBF6Far5Wo/csOji9Cmn6Uuyego3zN8SQQ1I3s9rLDG33x2yOmMqRigdJjLGR
	 VawS614NxKxOP+8NhZTyE2vtv2hfzbZzEnx8ZMCFxlleH2nBeoZu4U6g+w52GmT7RB
	 JWumeRm9GBtvte70bxh5AOCN18EfYolhYhq2WY6zG6U8wpJ/534FB+fjtoOjwDoHS4
	 rd0xDJwhtix1zjAHAnkw/EgkcToYfwk+W/ZwfHehDz6XZLjwhk+TTC9IjQ9tXF/fKU
	 hVae57Zn4/nRA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRWlGSWpSXmKPExsViZ8MxSffI859
  JBlt2CFtcPLyU2YHR49zGFYwBjFGsmXlJ+RUJrBmf/v1hLdjJWTHvVh97A+Mdji5GLg4hgSeM
  Eoum32GBcK4zScxsfsMG4exhlLiy4AxjFyMnB5uAmsT0WzdYQWwRAX2JpbP3MIPYzAIqEi9+9
  7B3MXJwCAu4STz/agcSZhFQldixcycjSJhXwFHizyNXkLCEgILElIfvwTo5BZwkXj9oYQEpEQ
  IqudpQBhLmFRCUODnzCQvEcAmJgy9eMEO0KkrMvtzMAmFXSMyYsY0NwlaTuHpuE/MERsFZSNp
  nIWlfwMi0itE6qSgzPaMkNzEzR9fQwEDX0NBU19JM19BML7FKN1EvtVQ3L7+oJEPXUC+xvFgv
  tbhYr7gyNzknRS8vtWQTIzCEU4oTBHYw7t33S+8QoyQHk5Io77WLP5OE+JLyUyozEosz4otKc
  1KLDzHKcHAoSfCaPQbKCRalpqdWpGXmAOMJJi3BwaMkwrvgNlCat7ggMbc4Mx0idYpRl2Pm17
  YDzEIsefl5qVLivHXPgIoEQIoySvPgRsBi+xKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYV5
  ekCk8mXklcJteAR3BBHSE3t3vIEeUJCKkpBqYbI27bi8trN/RtXZD8NdHOZJV3FUXl9ud3yrl
  uu7jCZn2pY5XBLTWGq7uON+rrW9lKj0t7ln+qjo+04fR+594Wuj95vJfv29GwmW2pD9By7+3N
  /4wVJn+0uscW4rmFF9jgbmzytUsJsSHvT7fkaP4boqt++3pStVPN14rX1d6Vem9wtHmxGRFp4
  hpLPvv9K3k23dVoHVV24Hj+9X/K/z+H28xN/h0+YcPscrm0qcSwr5bz/Kblz1FrvXOVVfDv7d
  adpRrN5z+9mXzoxeX/r9aa3zv5lUNKZ3fOWynjgjkyzxzbmzd3VKlpLuqI3vusvl71IO422J7
  3KQbZedJdRX8fe+jO02u4Xsss8H9HXFTlFiKMxINtZiLihMBozc55mgDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-732.messagelabs.com!1660544963!154456!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3437 invoked from network); 15 Aug 2022 06:29:24 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-11.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Aug 2022 06:29:24 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id BAC551000CE
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Aug 2022 07:29:23 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id AE1B71000C2
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Aug 2022 07:29:23 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 15 Aug 2022 07:29:22 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH] libencode-perl: upgrade 3.18 -> 3.19
Date: Mon, 15 Aug 2022 14:28:57 +0800
Message-ID: <1660544937-1453-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1660544937-1453-1-git-send-email-wangmy@fujitsu.com>
References: <1660544937-1453-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Aug 2022 06:29:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98243

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libencode-perl_3.18.bb => libencode-perl_3.19.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libencode/{libencode-perl_3.18.bb => libencode-perl_3.19.bb} (97%)

diff --git a/meta-perl/recipes-perl/libencode/libencode-perl_3.18.bb b/meta-perl/recipes-perl/libencode/libencode-perl_3.19.bb
similarity index 97%
rename from meta-perl/recipes-perl/libencode/libencode-perl_3.18.bb
rename to meta-perl/recipes-perl/libencode/libencode-perl_3.19.bb
index 999863b1fe..352517ca67 100644
--- a/meta-perl/recipes-perl/libencode/libencode-perl_3.18.bb
+++ b/meta-perl/recipes-perl/libencode/libencode-perl_3.19.bb
@@ -15,7 +15,7 @@ LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://META.json;beginline=8;endline=10;md5=b12e3be1e17a7e99ca4f429ff32c28b5"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/D/DA/DANKOGAI/Encode-${PV}.tar.gz"
-SRC_URI[sha256sum] = "74dcbd851171a68cf3ef225568ece47b0959b8e3cda887482fde97c1ae1691e2"
+SRC_URI[sha256sum] = "9163f848eef69e4d4cc8838397f0861fd9ea7ede001117dbd9694f8d95052ef5"
 
 UPSTREAM_CHECK_REGEX = "Encode\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
-- 
2.25.1


