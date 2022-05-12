Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 584B5C43217
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 09:21:22 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web08.2091.1652347273155137779
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 02:21:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=cNPcuqWJ;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652347271; i=@fujitsu.com;
	bh=0ubjvugmroqxPteYYaKT8VLpfl+PWiJgQCz5Y+5RwF8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=cNPcuqWJ/rX+giI8+kJ0r/r/ecaErHe2dTdgC6b2DJT11iKdlLbrOqJBnAS2MY5NY
	 hK7HV3roBAehTwFcD5k+Rp/vuG/JsrZflitZ26N2Cj11ANkmchgYG0bLxoCRkiGWqm
	 Az/BW3f6pFYDwUS4kMPzv1z9wbjPyP5O8LlYkMolG519WFT+JiryNQ3Riez2Jo0agA
	 vkbCCy0jXxDvvyRTgHwu+Aed9+U6frW/HSpqupFSHrjryORRZfrwiQVrbsJuSMO2ai
	 hBy8WbBneXQrM3BZtZo1uq27a92A2I3NYPtzr1ySBKRwLkhzp0iQR7dZXIBH5fkkPf
	 Yk2+DmX/DAvPw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRWlGSWpSXmKPExsViZ8ORqNt+sSb
  J4OwRVouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP1gynMBT08FTfbWlgbGL9xdTFycQgJPGGU
  WHelhw3CucAksezLYSjnJKPExGfnmLsYOTnYBNQlHt98zQhiiwjoSyydvQcsziygKtF9cQ07i
  C0s4C+xaNMUMJsFKH7hZjcbiM0r4CbRMfs6WK+EgILElIfvwXo5Bdwlbl9tAKsXAqo5/OMaC0
  S9oMTJmU9YIOZLSBx88YIZoldJ4sSKj0wQdoXE68OXoOJqElfPbWKewCg4C0n7LCTtCxiZVjF
  aJxVlpmeU5CZm5ugaGhjoGhqa6hpb6hoZGuslVukm6qWW6panFpfoGukllhfrpRYX6xVX5ibn
  pOjlpZZsYgQGckqx+tUdjJtX/dQ7xCjJwaQkynvufE2SEF9SfkplRmJxRnxRaU5q8SFGGQ4OJ
  QneneeAcoJFqempFWmZOcCogklLcPAoifAWg6R5iwsSc4sz0yFSpxgVpcR5P+wDSgiAJDJK8+
  DaYJF8iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iw72mQy3gy80rgpr8CWswEtHi/ayXI4pJ
  EhJRUA1Nljq5A1w3+7gje7/27Rfkrt6hYin3J14vlm/3prMqSkOsGsqZWIof/91bfb4o4r15+
  Zq26TuWD2TJ7nsZ/PHWo87zvCZNzsY97mbPFSvx6uG6uPNsQ7/3hiA7Tu7sGVudDDhQzzjrg5
  GXa9uS0/Uq9I9fW35U4eme6iR6v/+SsY82er+d5NcjJrefcf6sy11uZZYXAppKigFuerCsXX+
  WP+3B6XkmEq0aVSOEHwalrK1vfTLs8/dcpM9ZFtlHK/t+8dwYfrQroUmIQ5trtMX35aaFUiXl
  LD58tP6v2LPEdp0zymk/HZqvx6i1h2m7zKEJm7UzfLdFH9c+tbnvq0HJ9su6KzS2tfkevsy5X
  1lNiKc5INNRiLipOBACOsUjcXwMAAA==
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-14.tower-565.messagelabs.com!1652347270!463409!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10181 invoked from network); 12 May 2022 09:21:11 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-14.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 12 May 2022 09:21:11 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 9FC9D1001A5
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 10:21:10 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 925D5100193
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 10:21:10 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 12 May 2022 10:20:50 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-flask-login: upgrade 0.6.0 ->
 0.6.1
Date: Thu, 12 May 2022 17:20:32 +0800
Message-ID: <1652347241-2533-2-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1652347241-2533-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1652347241-2533-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 May 2022 09:21:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97075

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Changelog:
==========
    Only preserve subdomain or host view args in unauthorized redirect
    The new utility function login_remembered returns True if the current login is remembered across sessions.
    Fix side effect potentially executing view twice for same request.
    Clarify usage of FlaskLoginClient test client in docs.

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...ython3-flask-login_0.6.0.bb => python3-flask-login_0.6.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask-login_0.6.0.bb => python3-flask-login_0.6.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-login_0.6.0.bb b/meta-python/recipes-devtools/python/python3-flask-login_0.6.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-flask-login_0.6.0.bb
rename to meta-python/recipes-devtools/python/python3-flask-login_0.6.1.bb
index dd295cf2d..d19acd9b6 100644
--- a/meta-python/recipes-devtools/python/python3-flask-login_0.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-login_0.6.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = " https://github.com/maxcountryman/flask-login"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8aa87a1cd9fa41d969ad32cfdac2c596"
 
-SRC_URI[sha256sum] = "aa84fcfb4c3cf09ca58c08e816b7bce73f1349ba1cf13d00d8dffc5872d5fcf6"
+SRC_URI[sha256sum] = "1306d474a270a036d6fd14f45640c4d77355e4f1c67ca4331b372d3448997b8c"
 
 PYPI_PACKAGE = "Flask-Login"
 
-- 
2.25.1


