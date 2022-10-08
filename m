Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E61B9C4332F
	for <webhook@archiver.kernel.org>; Sat,  8 Oct 2022 07:52:50 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web09.2008.1665215564804496780
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Oct 2022 00:52:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=s+9o/4+U;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1665215563; i=@fujitsu.com;
	bh=6ae+6ZE3cauBDrZOk5p7Lwk0wZPGhwG2yg+Kp2EymxQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=s+9o/4+U+Day/g3bKT1vRQTV2mSRumX/9p5JJkaYsrmCsFYkJ/d1cYPt6TlBW0UfY
	 OWc81F1aRyFjUolwq1aKz6DQCOhRDzvheU5oxrl+/hPj2pjEqyEGlUnUD7zBI3hqsS
	 BnsRGurkCj8w6tWqCZSdhhzHxedeoBHcX7xcEuOqk50W2gZjoIMrOxJBBZ9nSw6qro
	 SjkXyPWjfcTYg2d1qiOXRl5kYqetJBYrcGo5Bx4imZyv+SUtI06xLh6Rh8Od0Az22C
	 BRAcohdU5aKQLxyeutdgOREH92sS4aM3K8jjB0ggn1BzzX9fz73JVqLeWZaaiQxhhK
	 H6ORuIBClB2TQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8ORpOul45h
  s8HuNoMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnF7wXHmguVcFTf/OTYwtnF2MXJxCAk8ZJR4
  M7eVEcK5wiRx8ko/E4Szm1Hi/Jm/QA4nB5uAmsT0WzdYQWwRAX2JpbP3MIPYzAIqEi9+97CD2
  MICNhJPF8wFq2cBis/rnQgW5xVwkjix6yJYvYSAgsSUh+/BbE4BZ4kfb9eD2UJANbu3/GaCqB
  eUODnzCQvEfAmJgy9eQPUqSsy+3MwCYVdIzJrVxgRhq0lcPbeJeQKj4Cwk7bOQtC9gZFrFaJV
  UlJmeUZKbmJmja2hgoGtoaKprAmQZ6iVW6SbqpZbqlqcWl+gCueXFeqnFxXrFlbnJOSl6eakl
  mxiBQZxSzJK6g7Gv76feIUZJDiYlUd6nWx2ShfiS8lMqMxKLM+KLSnNSiw8xynBwKEnwdqg6J
  gsJFqWmp1akZeYAIwomLcHBoyTCG6ANlOYtLkjMLc5Mh0idYlSUEufdBpIQAElklObBtcGi+B
  KjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYV4JdaApPJl5JXDTXwEtZgJabPXQDmRxSSJCSqq
  BaU9l9V7eJF9++Z3zm8znWfe5vOBtfLNKPHaFmeWtvEeHdHYce/ua68zb7meT3jM456h9nMp8
  sfviYedVsZwr1jNofk1dE8IdxnTkSJT9g8UzvzYfCH/+NOm+xp8Tky9tyN38egfbP4XXn4OuZ
  uf71Mv9eiTS6rfDrE9f6H1d1QwFq1SepKZNt37WbclsLbSuzFTtzpiZwi4069XtHo1FHNu52M
  4+vqqmer3TVS2za/ZVj7fBUl4K0lpzeXreLyr6e/WHc8C+pW6SM1+VcVeHfr+4b3r07L2Xpp+
  tv8qlYNGb9nyDoo3Qysj77rNTVpbIy0iL3Xd9/NtFaoHjh+tP1xkHC1avqeSuK4+a+YEhQ4ml
  OCPRUIu5qDgRAHjE4uVdAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-591.messagelabs.com!1665215562!221829!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12696 invoked from network); 8 Oct 2022 07:52:42 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-3.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 8 Oct 2022 07:52:42 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id E1AFA1AC
	for <openembedded-devel@lists.openembedded.org>;
 Sat,  8 Oct 2022 08:52:41 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id D68E01AB
	for <openembedded-devel@lists.openembedded.org>;
 Sat,  8 Oct 2022 08:52:41 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Sat, 8 Oct 2022 08:52:40 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] dool: upgrade 1.0.0 -> 1.1.0
Date: Sat, 8 Oct 2022 15:52:13 +0800
Message-ID: <1665215534-23236-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1665215534-23236-1-git-send-email-wangmy@fujitsu.com>
References: <1665215534-23236-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Oct 2022 07:52:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99094

Changelog:
========
 Use unicode box drawing characters to make things look more modern
 Add installation script
 Make the output cleaner by using better ANSI line clearing options
 Better compatibility on older versions of Python. Tested on Python 3.6
 Memory calculation is now closer to free
 Include "available" memory instead of "buffers"
 Major README updates to help new users get started

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/dool/{dool_1.0.0.bb => dool_1.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/dool/{dool_1.0.0.bb => dool_1.1.0.bb} (94%)

diff --git a/meta-oe/recipes-support/dool/dool_1.0.0.bb b/meta-oe/recipes-support/dool/dool_1.1.0.bb
similarity index 94%
rename from meta-oe/recipes-support/dool/dool_1.0.0.bb
rename to meta-oe/recipes-support/dool/dool_1.1.0.bb
index d34397c12a..dcb66c7fd4 100644
--- a/meta-oe/recipes-support/dool/dool_1.0.0.bb
+++ b/meta-oe/recipes-support/dool/dool_1.1.0.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://github.com/scottchiefbaker/dool.git;branch=master;protocol=http
 	   file://0001-Fix-build-error-as-following.patch \
           "
 
-SRCREV = "34a3244b46aa70a31f871a7ca8ffa8d3a7b950d2"
+SRCREV = "41ec7b392b358dae29f0b587711d5c8f7f462805"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


