Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AD7CC64ED6
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 08:07:51 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.85523.1677485267993645073
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Feb 2023 00:07:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=OIwIh3Pa;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677485266; i=@fujitsu.com;
	bh=7EmnNT71gNvTocqcSxYOYA9rjUhBZ8cV5NZ+ssV3i6g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=OIwIh3Pa9lT/YFh9IrXvStZE8NAw3avIgRhhYv39MaLfCD40OedBvdZDu548+HBOC
	 t6nqM9FxG+NohX3abLLhPrXC6GUVv0poaNhpAdfMiyQpPC/udAI3XJbcSFjfLpgSTI
	 a1JGfBIdWHZGv6qps94e5QbUPt+/h+P/UHMvvTFIIDHHu12SO07uW0vJ7HyfE9KVPx
	 JpJHrjYxIDlB7HfK2lKRCVBgyQ22uHWzA6iwZiSiWna7YySMp5ZvmBfFR7iyEVKudA
	 3cmerGxwq7QD+w20uk8Ln+LIa99l+YWy6VZomgbPDPqhjrphs/+lI1ZFmM9nThJ6jq
	 PUq9c5xBTuOZA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8MxSfdSyp9
  kg5fTOS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oyvG6awFHzlqvi3ahV7A+Nfzi5GTg4hgSeM
  Erdua3UxcgHZN5gk1k37xwTh7GWU+L/1JxNIFZuAlMSN+//ZQGwRAX2JpbP3MIPYzAIqEi9+9
  7CD2MICnhLPWk4wgtgsAqoSK/YtAqvnFXCS2DHnHiuILSGgIDHl4XuwXk4BZ4mrLd3sEFc4SW
  w+eIYJol5Q4uTMJywQ8yUkDr54wQzRqygx+3IzC4RdKdH64ReUrSZx9dwm5gmMgrOQtM9C0r6
  AkWkVo1lxalFZapGukYFeUlFmekZJbmJmjl5ilW6iXmqpbnlqcYmukV5iebFeanGxXnFlbnJO
  il5easkmRmDwphSrvdzBOLHvr94hRkkOJiVR3kVOf5KF+JLyUyozEosz4otKc1KLDzHKcHAoS
  fAeTALKCRalpqdWpGXmACMJJi3BwaMkwstsBJTmLS5IzC3OTIdInWJUlBLn5UsESgiAJDJK8+
  DaYNF7iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iwb1QC0BSezLwSuOmvgBYzAS3e/vAHyOK
  SRISUVANToun7ZQ/vftyR79SxpH+Rqw7Xn2l3t6uu7/H548BYIPFc6eTFxfJsmfqrdT4rtKSf
  4mO2UlvFHmC1+RjfXe83NUmLuydx98+7luY158Oqp2kBKYyMq7TEJ30svHY+P8vK7V3mtzeOq
  nox695pCB6T65NjYlG3yT7DuNrt2KqZduy3q/rlFr3Yefuix/Q1iyYoCzFPf1dQJPfu3O3s27
  yWDKaXE9vP5n67lfy7S5MxPuXto4q6zXx2a/7tMJ3sm20cvjhd8PGk7wKbnt5+sivmudrOIye
  qbyysn3I6xv+H0ekdHQ/3qXjKzvc0OnlGVXL2h1aty8VSBTfe7wypv37cTyptskyDjt3tMwZf
  Vz1YpsRSnJFoqMVcVJwIAKK080pZAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-571.messagelabs.com!1677485266!302816!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19319 invoked from network); 27 Feb 2023 08:07:46 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-7.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Feb 2023 08:07:46 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id C8C151000EE
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:07:45 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id BB9A81000E7
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:07:45 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 27 Feb 2023 08:07:44 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-flask: upgrade 2.2.2 -> 2.2.3
Date: Mon, 27 Feb 2023 16:07:30 +0800
Message-ID: <1677485254-11554-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1677485254-11554-1-git-send-email-wangmy@fujitsu.com>
References: <1677485254-11554-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:07:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101273

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Autoescape is enabled by default for ".svg" template files. :issue:'4831'
-Fix the type of "template_folder" to accept "pathlib.Path". :issue:'4892'
-Add "--debug" option to the "flask run" command. :issue:'4777'

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-flask_2.2.2.bb => python3-flask_2.2.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask_2.2.2.bb => python3-flask_2.2.3.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-flask_2.2.2.bb b/meta-python/recipes-devtools/python/python3-flask_2.2.3.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-flask_2.2.2.bb
rename to meta-python/recipes-devtools/python/python3-flask_2.2.3.bb
index cceab72ed..90c56c75a 100644
--- a/meta-python/recipes-devtools/python/python3-flask_2.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-flask_2.2.3.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/mitsuhiko/flask/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
 
-SRC_URI[sha256sum] = "642c450d19c4ad482f96729bd2a8f6d32554aa1e231f4f6b4e7e5264b16cca2b"
+SRC_URI[sha256sum] = "7eb373984bf1c770023fce9db164ed0c3353cd0b53f130f4693da0ca756a2e6d"
 
 PYPI_PACKAGE = "Flask"
 
-- 
2.34.1


