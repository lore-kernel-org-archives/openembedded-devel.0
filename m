Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 692F2C4332F
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 07:37:58 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.37725.1670830675109835257
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Dec 2022 23:37:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=CCWKLHuH;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670830672; i=@fujitsu.com;
	bh=3xj0SLB/JBCFm42KpBEH62cL8UAfeKxEl3jBusaeDXo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=CCWKLHuHJ272tsfD94BAJGARAedui+Zi7kT4jPjgdiPbYjh2wz/CCTA0dP+Z8d7YV
	 /LpTkT7H/wy1ifrATqSvDubBZb2PKOK7XRcEamOlfUZkmkTslfzQ5OvpXJDHljek8s
	 SbAqg5lFUEUBkrEyEiHsX8rhDTddk5r17SB4AgV/K+CvZj16+zWevEz488SCBz3vZ0
	 KL4E8gf1h+b3Mu4SFk92WzmYQz9a1HOp5Ont7T+FrdC1uoCUm90JM8zPWrUFudT9GZ
	 pIY2nKLNzcR0d4zgxA8+ipI6U+927gLn+aTRAbNFl1hmEn690ku2B4Ige7Mw+MfI0J
	 GCLFvWUWzajvA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrLIsWRWlGSWpSXmKPExsViZ8OxWdf/1rR
  kgx+/RSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oyzN9axFPznqDj46zlbA+Miji5GTg4hgYeM
  Ej29ARD2ZSaJi4c0Iew9jBL/FvmA2GwCUhI37v9nA7FFBPQlls7ewwxiMwuoSLz43cMOYgsLe
  Eo0/vjMAmKzCKhKdHz5wQhi8wo4Sjyf0wtmSwgoSEx5+B6sl1PASWJp93pGiF2OEq+6zrFC1A
  tKnJz5hAVivoTEwRcvmCF6FSVmX25mgbArJGbNamOCsNUkrp7bxDyBUXAWkvZZSNoXMDKtYjQ
  vTi0qSy3SNTTRSyrKTM8oyU3MzNFLrNJN1Est1c3LLyrJ0DXUSywv1kstLtYrrsxNzknRy0st
  2cQIDN2U4vSYHYy/l/3RO8QoycGkJMpbeWVashBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3g3Xg
  HKCRanpqRVpmTnAOIJJS3DwKInwuoG08hYXJOYWZ6ZDpE4xWnJMnf1vPzPHcjA582vbAWYhlr
  z8vFQpcV72G0ANAiANGaV5cONgsX6JUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjCvzXWgKTy
  ZeSVwW18BHcQEdFDUy6kgB5UkIqSkGpiCeiQ3NuXoTH03Nf9IkuZu49cdG5byN++Rei3y5t6/
  hedEA1heJP/b8nbtyotVvzbzfVDUdC+fpZ9beX3Otc43/p86p5XuYi19fn93a/LN4ywpzVdTv
  O8J8wvy5WpN51dPjqqV5BXfI9a3TaBox75NdznrjW7m+aueqV6oebngdYz1lWuK8Z1fe43zdl
  Y7n3rbWrlWp2jaG0O9hJ70qrhDXgJlPy3+/bieP63H45eeyQlFx/8SrSUmHfOLTUKElt2rSzv
  u4L/vx0SGcpPoue8ueYVucq33/Kjvc3lV3IL+lrdua4ri3JPqn9TzHFt3Ne32kpdT8rI7dOPj
  smZzRP1iefl5xVG3bU927dcwNlJiKc5INNRiLipOBACyrbc8cAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-732.messagelabs.com!1670830670!223452!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10858 invoked from network); 12 Dec 2022 07:37:51 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-18.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Dec 2022 07:37:51 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id C9B16142
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:37:50 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id BD5B673
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:37:50 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 12 Dec 2022 07:37:49 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-gmpy2: upgrade 2.1.2 -> 2.1.3
Date: Mon, 12 Dec 2022 15:37:14 +0800
Message-ID: <1670830635-3098-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670830635-3098-1-git-send-email-wangmy@fujitsu.com>
References: <1670830635-3098-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:37:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100048

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-gmpy2_2.1.2.bb => python3-gmpy2_2.1.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gmpy2_2.1.2.bb => python3-gmpy2_2.1.3.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-gmpy2_2.1.2.bb b/meta-python/recipes-devtools/python/python3-gmpy2_2.1.3.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-gmpy2_2.1.2.bb
rename to meta-python/recipes-devtools/python/python3-gmpy2_2.1.3.bb
index 274f24090..2db469406 100644
--- a/meta-python/recipes-devtools/python/python3-gmpy2_2.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-gmpy2_2.1.3.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 DEPENDS += "gmp mpfr libmpc"
 
 PYPI_PACKAGE = "gmpy2"
-SRC_URI[sha256sum] = "da75140bca128ece795895477e53b43773e3748aa90ba6170eae7ca2c74b82d1"
+SRC_URI[sha256sum] = "10360cc39f1eb56e3a833a4d1cae3884c7f65b6ec490994801e6939dc08870ae"
 
 inherit pypi setuptools3 python3native
 
-- 
2.25.1


