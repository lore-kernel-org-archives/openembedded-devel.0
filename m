Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C90EC43334
	for <webhook@archiver.kernel.org>; Tue, 19 Jul 2022 06:20:07 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.37724.1658211595759380050
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Jul 2022 23:19:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=sS0WZLCC;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658211593; i=@fujitsu.com;
	bh=l/B8bSPphF95//p6NUA+0Aswigutr2/3T081M55qQoc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=sS0WZLCCtSPSvNTf/amM+TOOg0Abd1kasKzfbf+lGMqZ71a5FVti2CYfUTDws4/f3
	 aVHTKN36MWq+GT7jsUrAMqsNfVrkXyDi8Kgro3LO2HdwJyfgeFjYu1X3OAMeG8ZEmL
	 vXlewvlNXvfSNGYChDVqOdQuVox+bh1mhlwj1upbVv9oe915Gdh5a7fTAZYSIDbCD9
	 jfKzj5xFhCoTyxGwDaYUqPuIQijR5HOAw6c4okFL7tsu6l93M+IDgHbPWINHDQyD/p
	 jDm/ywrlGSbwaoAca3HBg34imz7USQzTPDwDuQq4+D2VbTQHxGVLepXk0CiuxpfifM
	 OrMs8kwP+jGZg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRWlGSWpSXmKPExsViZ8OxWZfT91q
  Swda/HBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bixz9ZCtawV7z8sYS5gfE8WxcjF4eQwANG
  iXNLPzJ1MXICOZeZJHqbLSESexglFu66zAqSYBNQk5h+6waYLSKgL7F09h5mEJtZQEXixe8e9
  i5GDg5hAWuJO/e4QcIsAqoS1/8cYAOxeQUcJfZ1PGcBsSUEFCSmPHzPDBEXlDg58wkLxBgJiY
  MvXjBD1ChKzL7cDFVfITFjxjY2CFtN4uq5TcwTGPlnIWmfhaR9ASPTKkabpKLM9IyS3MTMHF1
  DAwNdQ0NTXUsLXSNjY73EKt1EvdRS3bz8opIMXUO9xPJivdTiYr3iytzknBS9vNSSTYzAsEwp
  Tnq5g/H8vl96hxglOZiURHmnal5LEuJLyk+pzEgszogvKs1JLT7EKMPBoSTBe8ETKCdYlJqeW
  pGWmQOMEZi0BAePkgjvHG+gNG9xQWJucWY6ROoUoy7HzK9tB5iFWPLy81KlxHn7QIoEQIoySv
  PgRsDi9RKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd7HIFN4MvNK4Da9AjqCCeiISU5XQI4
  oSURISTUwxfPay+4rnvnXINz+SpFowKRbjNutdM6pzJczLFxknt/DaSqS6Pt096FV4T+n+lmu
  Td8a+2ySqIdU8GMzrtcSrcqf/d7+DOdifNzHZNZyaNunAwLz5yTf5OXet0Z+188v6j+OeLiXL
  Np1zk2389LX9qDeLl9Oy00PNz+fvv61GO9lqTedhS1uijbia2prW+J3svmbhffOfbfHgPvWNr
  63a653Jcf5nllst2BWbOYF7e1LmWY3Hs6oqrsifnAi87UtD4QPab1Xds+d/fHNS4u5643b+BV
  i3y2Z2iZxIrDW8H7bCoE8tmUfPa74umVvSnjv82q6T4nel0OLpzRfcQqMuFy995Xpi32n8nZw
  Fp/gUmIpzkg01GIuKk4EAFyZxbdSAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-745.messagelabs.com!1658211592!140283!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12551 invoked from network); 19 Jul 2022 06:19:53 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-10.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 Jul 2022 06:19:53 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 8F7277B
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Jul 2022 07:19:52 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 8321075
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Jul 2022 07:19:52 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 19 Jul 2022 07:19:50 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] php: upgrade 8.1.7 -> 8.1.8
Date: Tue, 19 Jul 2022 14:18:53 +0800
Message-ID: <1658211533-3011-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Jul 2022 06:20:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97896

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/php/{php_8.1.7.bb => php_8.1.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.1.7.bb => php_8.1.8.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.1.7.bb b/meta-oe/recipes-devtools/php/php_8.1.8.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.1.7.bb
rename to meta-oe/recipes-devtools/php/php_8.1.8.bb
index 043f3a81b2..aef0a2c1d6 100644
--- a/meta-oe/recipes-devtools/php/php_8.1.7.bb
+++ b/meta-oe/recipes-devtools/php/php_8.1.8.bb
@@ -33,7 +33,7 @@ SRC_URI:append:class-target = " \
           "
 
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] = "b816753eb005511e695d90945c27093c3236cc73db1262656d9fadd73ead7e9d"
+SRC_URI[sha256sum] = "b8815a5a02431453d4261e3598bd1f28516e4c0354f328c12890f257870e4c01"
 
 inherit autotools pkgconfig python3native gettext
 
-- 
2.25.1


