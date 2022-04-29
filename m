Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22952C433FE
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 08:31:13 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web12.29610.1652085065370388803
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 May 2022 01:31:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=IzKeE9DY;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652085063; i=@fujitsu.com;
	bh=OTN5CWCL3Ces+ZEd8D+chl712ONtPOU75nnjkF3kPmI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=IzKeE9DYsv3/x2oODbLKURfgOAfGcIgxr9in6AaSihueVoMu+d4BUSnu5TBs+/WDe
	 BBPiJNG/d7z9ynodqOqIzEIbGJ3Ezid+NT7aWEIFJrpmKawCr7RVqkba/I3kK2K0+Z
	 95JjeEcTsJD+ApHq915TLNGi5lLifiuX0nguid1mkH0jvXeCLcY+CLEY0a8AdH3M1a
	 PjOfxzaWxx7aE3bhi4cjBm8n7c3r+Mu/WEjgHizxOCk9kBH645ea5wJUPqY4oBhjjv
	 u/K73WGwYWY+685kZWm+inht7prYJSR0g0vCTYyuW/dB0CAYqWHo/8E3PiQinADJrq
	 P5smfWdIcyZcw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJIsWRWlGSWpSXmKPExsViZ8ORqOt+sSL
  J4LOexcXDS5kdGD3ObVzBGMAYxZqZl5RfkcCaMb/1PUvBKvaKm7dOMjYwnmXrYuTiEBJ4wihx
  5/0GJgjnApNE66pP7BDObkaJNYubmLsYOTnYBNQkpt+6wQpiiwjoSyydvQcsziygIvHidw87i
  C0sYC2x/MAOli5GDg4WAVWJmTssQMK8Ak4S9+9PZgSxJQQUJKY8fA/WyingLLG4uResVQiopr
  8FYhWvgKDEyZlPWCDGS0gcfPGCGaJXUWL25WYWCLtCYtasNiYIW03i6rlNzBMYBWchaZ+FpH0
  BI9MqRrukosz0jJLcxMwcXUMDA11DQ1NdM1NdQwsjvcQq3US91FLd5NS8kqJEoLReYnmxXmpx
  sV5xZW5yTopeXmrJJkZgKKcUO27bwXiq76feIUZJDiYlUd7KpookIb6k/JTKjMTijPii0pzU4
  kOMMhwcShK8IeeAcoJFqempFWmZOcC4gklLcPAoifDePQGU5i0uSMwtzkyHSJ1i1OW4u3DvXm
  Yhlrz8vFQpcd5b54GKBECKMkrz4EbAYvwSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWFe3wt
  AU3gy80rgNr0COoIJ6IiPAaUgR5QkIqSkGpimTZWocwjpOul+93byhYebZfO6d724zbrmR92J
  tcyBbz9a/js0ybbCcKfQ9NsPNnpMf7g7SO4q541Tl7XezTtiz3Pb0y7tBc/JU/2MRTyed44VZ
  L5+dvn4vySBfbHqhz4ym+zvkD151UPmkRxH04luiyMaJt6fbKfsX3zuUcfbGD8hldogd6asw6
  kBl02WCFb1VeQYr3CQfjrXp7ru5V2bGnH11O2z41eu7F3z6ekaLyNHU/sa/Utz07aH+sjLuwr
  K+pQVHe5P3p7/T2mnZZZOQazb81W3tkQsmTip7qbJC7a8N4WbnU79vte4cmHr87+zdT+m7zp9
  eNF3a/cpd7MZ7neY7Q140+L0RP+YilCrEktxRqKhFnNRcSIAUE3XGmwDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-545.messagelabs.com!1652085062!248833!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25416 invoked from network); 9 May 2022 08:31:02 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-13.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 May 2022 08:31:02 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 69D5C10018B
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  9 May 2022 09:31:02 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 48C3C100191
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  9 May 2022 09:31:02 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 9 May 2022 09:30:58 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] php: upgrade 8.1.4 -> 8.1.5
Date: Fri, 29 Apr 2022 16:13:10 +0800
Message-ID: <1651219993-27514-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1651219993-27514-1-git-send-email-wangmy@fujitsu.com>
References: <1651219993-27514-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 May 2022 08:31:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97003

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/php/{php_8.1.4.bb => php_8.1.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.1.4.bb => php_8.1.5.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.1.4.bb b/meta-oe/recipes-devtools/php/php_8.1.5.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.1.4.bb
rename to meta-oe/recipes-devtools/php/php_8.1.5.bb
index bf6c54309..e3af9f698 100644
--- a/meta-oe/recipes-devtools/php/php_8.1.4.bb
+++ b/meta-oe/recipes-devtools/php/php_8.1.5.bb
@@ -33,7 +33,7 @@ SRC_URI:append:class-target = " \
           "
 
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] = "b3f688cb69758523838b8e7f509aaef0152133d9b84a84a0b7cf68eeafc1df76"
+SRC_URI[sha256sum] = "827de56771c3ab8313a069812f15f6ec49989d510aebd0dce180839c6d8d6ff3"
 
 inherit autotools pkgconfig python3native gettext
 
-- 
2.25.1


