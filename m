Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 256E2C54EC4
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:49 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web08.2675.1649137235965065919
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Apr 2022 22:40:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Me5yCwMB;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649137234; i=@fujitsu.com;
	bh=w97QFF1xuh30+UjXK6kD++n0YZw3lV1HsV0l25kYX/0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Me5yCwMBGnhpCUwnkGiiJ9znTIT3NXQznP8mXXip5vsp+j1D0bhq+QJFeYZayyC2W
	 bKR8LeDA5LK2ilAMLYJduDdcy7SghFN14w9dOMg2VbB8JFYNk8NEdSRtCkVwjlQ6m3
	 Q/oGkjA8pqBRDCnDk0veIScsOJdHEjqAIrnqpwTSxucdhL7MvLO20FXKR+uh1m8bfm
	 UWWSy7yGGz4PXAlLHhXq/sWhmsgrQzlglQ8wu5X+FeUzCRbhKpGnZo9kiUcxZ6f7OR
	 Kt61xypSTcoCjZOAd0MEYhNDY0curx0hDmcHADgTZb53XyzuO84ciw6L1X13Cn626s
	 vgjFj+xJFYWcA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHIsWRWlGSWpSXmKPExsViZ8ORqBt4zTv
  JYPFiA4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP5zm2MBbc4KloWX2JsYGzj6GLk4hASeMIo
  8fnXfDYI5wKTxP5pk9ghnN2MEh2P9wFlODnYBNQkpt+6wQpiiwjoSyydvYcZxGYWUJF48buHH
  cQWFvCUmL7hK1gNC1D877ujLCA2r4CTxP+VN8DqJQQUJKY8fA9mcwo4Szzf8Z4JxBYCqjlz/z
  czRL2gxMmZT1gg5ktIHHzxAqpXUWL25WYWCLtCYtasNiYIW03i6rlNzBMYBWchaZ+FpH0BI9M
  qRtukosz0jJLcxMwcXUMDA11DQ1NdMxNdYxO9xCrdRL3UUt3k1LySokSgrF5iebFeanGxXnFl
  bnJOil5easkmRmAwpxQ7KO1gPNv3U+8QoyQHk5Io7xlX7yQhvqT8lMqMxOKM+KLSnNTiQ4wyH
  BxKErwnzwLlBItS01Mr0jJzgJEFk5bg4FES4T1yESjNW1yQmFucmQ6ROsWoKCXOe/MKUEIAJJ
  FRmgfXBovmS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeXlApvBk5pXATX8FtJgJaPG7M54
  gi0sSEVJSDUyTmZauTrl1zbzlavulMsPDZvJa8eyPuxbPOOgT0f8zvC6kO0m1SnuPsletF1//
  q1WbHnIcWtKjn7rbwVM35Z0CD3eqzKsr9fGCqzpktwe961D0/yDYuGm7F8MOoxXPrBu+aj175
  2GxZjZ/kdXZmBOV+p33f915l/ym7rS70abtvHLLHoh1vxNuultUeKI3oLuK2do95tlG0U+P63
  8fuzqrpDf1/0+LOys/yJxRvBX7TNuPbYJAvate61PvX2eX8/TvZc5sLwoL497jtuWi4rduR7e
  4G5MWTsqV8Usp3Nus8kjg1YryUvG7htwWMclpmdal139cTRDIMjhxO9BEbvGsNzyPToktLz/Z
  +NWvWomlOCPRUIu5qDgRAIHIo11hAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-528.messagelabs.com!1649137233!90177!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6153 invoked from network); 5 Apr 2022 05:40:33 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-8.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 5 Apr 2022 05:40:33 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 2F8211001AA
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  5 Apr 2022 06:40:33 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 03B5010019E
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  5 Apr 2022 06:40:33 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 5 Apr 2022 06:40:14 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-redis: upgrade 4.2.0 -> 4.2.1
Date: Sat, 2 Apr 2022 20:36:47 +0800
Message-ID: <1648903009-19854-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1648903009-19854-1-git-send-email-wangmy@fujitsu.com>
References: <1648903009-19854-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Apr 2022 17:24:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96408

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-redis_4.2.0.bb => python3-redis_4.2.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-redis_4.2.0.bb => python3-redis_4.2.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-redis_4.2.0.bb b/meta-python/recipes-devtools/python/python3-redis_4.2.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-redis_4.2.0.bb
rename to meta-python/recipes-devtools/python/python3-redis_4.2.1.bb
index d4fc98817d..9370cbab67 100644
--- a/meta-python/recipes-devtools/python/python3-redis_4.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-redis_4.2.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://github.com/andymccurdy/redis-py"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=51d9ad56299ab60ba7be65a621004f27"
 
-SRC_URI[sha256sum] = "6758d01dec81af191b98a35cce3402675d115456584c39b500ab485a5e386bbb"
+SRC_URI[sha256sum] = "fe45513881229dbee610620b9e0817b1f48c47ba635870320fd44a712204bbdd"
 
 inherit pypi setuptools3
 
-- 
2.25.1


