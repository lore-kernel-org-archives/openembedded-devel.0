Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A6DEC6FD20
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 13:24:01 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.6808.1678281839800915339
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Mar 2023 05:24:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=FmWZGG+g;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678281838; i=@fujitsu.com;
	bh=qXpDE6H2+zWydcPvE5r9DR9DPtJhadITCpvIie+Tz+Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=FmWZGG+gqOSq9Awm+L6nCU5HcDMRMacJCsIGN19yPzb9eBwkOcYYt1hsfTf5fhVGy
	 yZKe82lX0A/QyTxpq8mCrqso7LcRDd4G/6Pu1VhwcOziJqh+0etDQ40gspyPaKVqjC
	 nzcns427JGisl2soI1fxlsrTZu3UScm9nC45p1wmqnJXOsIprUoJ49IJdU2HbN1sVs
	 q/vXIamNTy5F4O/XGLkvlyOzmr8g5tEpusutZbLHMMq0hmET0E8fp3eOX+t5iEWtRA
	 VUDDCgdUXt1UBdvMJbbuOASR5lPQRLioNL/5DuSlHx5n1syhai04rQvo9jnPBR3ovY
	 OEO1SLBKgmGzQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8ORpJvbw5F
  i8PCSscXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvHzzybWgl7OirkL37A2MC7k6GLk4hASeMgo
  MfPiejYI5yqTxP1/h5ggnD2MEiueL2LtYuTkYBOQkrhx/z8biC0ioC+xdPYeZhCbWUBF4sXvH
  vYuRg4OYQEbic+/pUDCLEDhnb+vMYLYvAJOEh2df8HKJQQUJKY8fA9mcwo4S8xcepoFxBYCqr
  nZdJIVol5Q4uTMJywQ4yUkDr54AdWrKDH7cjMLhF0p0frhF5StJnH13CbmCYyCs5C0z0LSvoC
  RaRWjaXFqUVlqka6xXlJRZnpGSW5iZo5eYpVuol5qqW55anGJrpFeYnmxXmpxsV5xZW5yTope
  XmrJJkZg6KYUqwnvYPzS+1fvEKMkB5OSKC9rDEeKEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQneT
  11AOcGi1PTUirTMHGAcwaQlOHiURHjv1gOleYsLEnOLM9MhUqcYFaXEeTeA9AmAJDJK8+DaYL
  F7iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iw73aQKTyZeSVw018BLWYCWnxhPwvI4pJEhJR
  UA1PxRY++I79nOqsuWltReSOk/+DFLlV+npyaOXZHZ5n/6lzRPftYQoZWfdKThpN3bjjxTm//
  EndHbOuipDdcwlqxp0LZ71fYGehxuPwvN1cXedIqtW+VdNKE0kl2PfMtxb5w/Xn0dH7O6faNJ
  6TXyJo5ff+6d5/xCwXmpMzvi0LyJ0Y3u5hcvtWm5rd32e6j174JRYTv2r1NsXMbK9PvO8VruN
  9JLI/6fuzvsrleNxvP5GqJyt7usNVeycDnulGi9PRDtnXXvVW3Xd8648n85m9h1w/crPh2pS2
  kKO/j+X0BE87M7Z9UeGznvr9e/cvbRRINmbL2fblx/+6ER8vbr0qq6obFSCsLrd1SKV6y4co+
  JZbijERDLeai4kQAR/cUtVgDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-571.messagelabs.com!1678281837!457716!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8433 invoked from network); 8 Mar 2023 13:23:57 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-6.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Mar 2023 13:23:57 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 8C35C1B2
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Mar 2023 13:23:57 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 80ABB1B4
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Mar 2023 13:23:57 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 8 Mar 2023 13:23:56 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] logwatch: upgrade 7.7 -> 7.8
Date: Wed, 8 Mar 2023 21:23:39 +0800
Message-ID: <1678281820-25489-4-git-send-email-wangmy@fujitsu.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101419

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../logwatch/{logwatch_7.7.bb => logwatch_7.8.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/logwatch/{logwatch_7.7.bb => logwatch_7.8.bb} (96%)

diff --git a/meta-oe/recipes-extended/logwatch/logwatch_7.7.bb b/meta-oe/recipes-extended/logwatch/logwatch_7.8.bb
similarity index 96%
rename from meta-oe/recipes-extended/logwatch/logwatch_7.7.bb
rename to meta-oe/recipes-extended/logwatch/logwatch_7.8.bb
index 37a94661a..187e794b3 100644
--- a/meta-oe/recipes-extended/logwatch/logwatch_7.7.bb
+++ b/meta-oe/recipes-extended/logwatch/logwatch_7.8.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ba882fa9b4b6b217a51780be3f4db9c8"
 RDEPENDS:${PN} = "perl"
 
 SRC_URI = "http://jaist.dl.sourceforge.net/project/${BPN}/${BP}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "2a10c2c73f85d2ec9d8e9be3f553b7b5849cf795b89a1c1379c99cc36a06adbd"
+SRC_URI[sha256sum] = "b1df31779306c2c87d595816305c89c19c382edf9ebbfce03143f567e580be42"
 
 do_install() {
     install -m 0755 -d ${D}${sysconfdir}/logwatch/scripts
-- 
2.34.1


