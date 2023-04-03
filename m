Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25246C76196
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 10:07:24 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.66319.1680516433997105929
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Apr 2023 03:07:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=rLN+XaNn;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1680516438; i=@fujitsu.com;
	bh=1ko7sKKFkzzcDdUEgmOQNUvsPlzxEk6R+7p7UUyuDjM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=rLN+XaNnkh5bykR/jwl2xkrGHUKI8yo8h6RKExz1V55vnPYoj472DBrqz5Eo/s+O0
	 kyxJEIkK7RkT28i4OOfpq/78oA/TEjP8M6fW+tl1edmoMEo5NVpqGCt08KSE/0KUTi
	 aNU/8I1XmiDMK4ZHjJha/yxj811LIVNh9N0XLpyeeV+A/axtrkC0ebn/0Al5qcIjRo
	 H+m/VJ8RLQk9YauiM0Pzp88HIetrDZh64SOHjDg4icUbCWVuKwpVLwNNIigW807Gcf
	 BonEPYFEm2zWniHLif+81eA+IIQ1WWRX3wae3dt7xdN0J1Ra8MeNqZOoNBOseO4bwk
	 z6Ow/OnCPjlPg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORpBu6VCv
  F4MFNYYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePZse/MBWc4Kx7ffMvYwPiao4uRi0NI4CGj
  xOY/p1ghnCtMEv2HbjFCOLsZJVaeeQ+U4eRgE5CSuHH/PxuILSKgL7F09h5mEJtZQEXixe8ed
  hBbWMBH4m/rE7AaFqD4+sbfTCA2r4CTxOxvq8HqJQQUJKY8fA9mcwo4S2w//BpsvhBQTc+6z6
  wQ9YISJ2c+YYGYLyFx8MULqF5FidmXm1kg7AqJxumHmCBsNYmr5zYxT2AUnIWkfRaS9gWMTKs
  YTYtTi8pSi3RN9ZKKMtMzSnITM3P0Eqt0E/VSS3XLU4tLdI30EsuL9VKLi/WKK3OTc1L08lJL
  NjECgzelWG3XDsYJfX/1DjFKcjApifIK1mulCPEl5adUZiQWZ8QXleakFh9ilOHgUJLgnbcIK
  CdYlJqeWpGWmQOMJJi0BAePkgiv4gKgNG9xQWJucWY6ROoUo6KUOG/cEqCEAEgiozQPrg0WvZ
  cYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfOKLQaawpOZVwI3/RXQYiagxa1RGiCLSxIRUlI
  NTMHawY3rBby/RF9aP41xV92XmWtbJjEuepC5smx6h+3tJGtrmdXKqx4LOaVxHzngKLl/vqjN
  Ljflz3t8rxUfmWlj7L7xbluQRt/zX+kqJ5Wctp80nT45pnJ50LXqjuXG1VNqG79za7LdlZV6/
  fiJTOze1o/8U351VXf5zLkXmrZ8Weh3uaCTbJIrP/IJvt7QGpcab5ecPp3J/N4T7wx9u+SfH8
  UVYp7skStdF3r576cMXvmDIhL2LbNSJ9ed0H68V5nzpNH2Xe17y9W21vcb3Xt8OeuM3oTeOf9
  XtTA7Z379GlRxzjlA/YubSAb3EoGVXkKJ8498OBRSu/UfCx+XknOYHo+g8zORZtOIdQvfKrEU
  ZyQaajEXFScCAAUXmjdZAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-565.messagelabs.com!1680516437!192083!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32663 invoked from network); 3 Apr 2023 10:07:17 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-14.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Apr 2023 10:07:17 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 0E0B81D2
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 11:07:17 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 030C01B0
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 11:07:17 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 3 Apr 2023 11:07:15 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pymodbus: upgrade 3.2.1 -> 3.2.2
Date: Mon, 3 Apr 2023 18:06:54 +0800
Message-ID: <1680516416-31035-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1680516416-31035-1-git-send-email-wangmy@fujitsu.com>
References: <1680516416-31035-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Apr 2023 10:07:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101926

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
Add forgotten await

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymodbus_3.2.1.bb => python3-pymodbus_3.2.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymodbus_3.2.1.bb => python3-pymodbus_3.2.2.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pymodbus_3.2.1.bb b/meta-python/recipes-devtools/python/python3-pymodbus_3.2.2.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pymodbus_3.2.1.bb
rename to meta-python/recipes-devtools/python/python3-pymodbus_3.2.2.bb
index 5b3ea1bb7..783bed821 100644
--- a/meta-python/recipes-devtools/python/python3-pymodbus_3.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pymodbus_3.2.2.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=430604f78bee72425da231d42eac9cee"
 DEPENDS += "python3-six-native"
 
-SRC_URI[sha256sum] = "2a0c82651a7eb96c784493b5fc26ccca26ba8e9530258d811dab50b87ce132de"
+SRC_URI[sha256sum] = "6f46f55b41875e5ac41ba660f514f4bb7a732811e303f671b76f310906355089"
 S = "${WORKDIR}/pymodbus-${PV}"
 
 inherit pypi setuptools3
-- 
2.34.1


