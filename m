Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A69C0C3F6B0
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 06:32:19 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web08.13630.1660545132778175417
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Aug 2022 23:32:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=DcwyU1SP;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1660545131; i=@fujitsu.com;
	bh=2JfXJfRiV0mJXvCgW20WO0u7nObMx7FMVKVqmTT1f+Y=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=DcwyU1SPUDhk50Grp0LTARzpgyU0I2V9JPMV4MEwizI0TiGPvaNGtBlXgPYSTgmNV
	 Dbv8hbdI9mjrcEnoPvyAvWxXIPRa6nR7NbPksoOnHQuYol/OtEb7pTKazPKmKv8IVK
	 rvQCHiwPoWyMp0QuVa1jF7dFdAnnsabCtEeWN8X5MDT8p9TusOaUl/4T5sxOyKOtGm
	 Lh0qvdNDPo06JXq9zoVaLmt/zVJnNJcrMIQFYGIF46G47wcfdOqieOdsYXf9CeHPft
	 IBimBPJZBP9N4lTcm5W5C+v5frjosv/0Kgyjw7AdnUFHS3TeVKh0DsBQezRIbuSZM4
	 JoePYtZnznKcQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLIsWRWlGSWpSXmKPExsViZ8ORpJv14me
  SwbwZyhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8b/BQ8ZCw7zVBz+OZ2lgXEddxcjF4eQwENG
  iUO/Gtm6GDmBnMtMEmf320LYexglmj67gNhsAmoS02/dYAWxRQT0JZbO3sMMYjMLqEi8+N3DD
  mILCwRJvNzcBFbDIqAqMbsdop5XwFHi0N87YLaEgILElIfvmSHighInZz5hgZgjIXHwxQtmiB
  pFidmXm1kg7AqJGTO2sUHYahJXz21insDIPwtJ+ywk7QsYmVYxWiUVZaZnlOQmZuboGhoY6Bo
  amuqa6RqaWeolVukm6qWW6panFpfoGuollhfrpRYX6xVX5ibnpOjlpZZsYgSGZEox28odjCv7
  fuodYpTkYFIS5b128WeSEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQne0udAOcGi1PTUirTMHGB8w
  KQlOHiURHgX3AZK8xYXJOYWZ6ZDpE4x6nLM/Np2gFmIJS8/L1VKnLfuGVCRAEhRRmke3AhYrF
  5ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMzLCzKFJzOvBG7TK6AjmICO0Lv7HeSIkkSElFQ
  D05qXHuwf5ipxzX1mt6Gu7O0z6cMK/Pe0nhstm57cFKD+V6ZAafJi94uVNYcm1H/1+OPpd6j0
  yxvlBM8XM9fmitv8331erfRr9MZriXO9XHKvlG/OvGKi826HUn3++oVT1bWK95iFPrmhKvONo
  SNQr2H522rFtecXWOzlU1z2rE3rRq/Ti1lXxXld1t36HfV/gRiPz8FCr+Xac18nbf3kb1277H
  nA8431czlWpJoLvjTIaz1/cPWqcr7l5/e/nPduua226q1uvQVP92/3q1KaF8n+1Z8xxuJGfep
  XXTnBfR5B9bktlm87XtjdYw7zNmHafYlrLk+GKf+jSjvt79uK4tPkWY42lRfweTGvP5oiqsRS
  nJFoqMVcVJwIAIMM785QAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-585.messagelabs.com!1660545130!878103!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 715 invoked from network); 15 Aug 2022 06:32:10 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-14.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Aug 2022 06:32:10 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 32E131AC
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Aug 2022 07:32:10 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 27D947C
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Aug 2022 07:32:10 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 15 Aug 2022 07:32:08 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH] libmime-charset-perl: upgrade 1.012.2 ->
 1.013.1
Date: Mon, 15 Aug 2022 14:31:51 +0800
Message-ID: <1660545115-1513-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Aug 2022 06:32:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98244

Changelog:
==========
 * Update META.json.
 * Update tests.
 * A typo in comment: "3.18" should be "3.19".
 * Fix: Escape sequences won't be used with DIN 66003.
 * Imp: Added support for DIN 66003.
 * Chg: Workaround: "ISO-8859-8-I" is treated as an alias of "ISO-8859-8"
   by Encode (3.18): See the note in
   https://encoding.spec.whatwg.org/#legacy-single-byte-encodings

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...charset-perl_1.012.2.bb => libmime-charset-perl_1.013.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libmime/{libmime-charset-perl_1.012.2.bb => libmime-charset-perl_1.013.1.bb} (78%)

diff --git a/meta-perl/recipes-perl/libmime/libmime-charset-perl_1.012.2.bb b/meta-perl/recipes-perl/libmime/libmime-charset-perl_1.013.1.bb
similarity index 78%
rename from meta-perl/recipes-perl/libmime/libmime-charset-perl_1.012.2.bb
rename to meta-perl/recipes-perl/libmime/libmime-charset-perl_1.013.1.bb
index 20557a3f3e..27ed41e99d 100644
--- a/meta-perl/recipes-perl/libmime/libmime-charset-perl_1.012.2.bb
+++ b/meta-perl/recipes-perl/libmime/libmime-charset-perl_1.013.1.bb
@@ -9,8 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/N/NE/NEZUMI/MIME-Charset-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "71440416376248c31aa3bef753fae28d"
-SRC_URI[sha256sum] = "878c779c0256c591666bd06c0cde4c0d7820eeeb98fd1183082aee9a1e7b1d13"
+SRC_URI[sha256sum] = "1bb7a6e0c0d251f23d6e60bf84c9adefc5b74eec58475bfee4d39107e60870f0"
 
 S = "${WORKDIR}/MIME-Charset-${PV}"
 
-- 
2.25.1


