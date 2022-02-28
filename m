Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C75BC43217
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 14:12:20 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.20024.1646057538853277179
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 06:12:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=NKSOC+pa;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646057537; i=@fujitsu.com;
	bh=baUK9r7rPtAQ25D2crjyH20NrA+hMkghtvQojo9nZNA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=NKSOC+paQE8p7m8UnYfod9fBPS/BDDy02QnyYIIyRkzj5IbTkLpMB/MnuJjNNfsds
	 EdaVQ2z3tRkjZROmuhjKC12z5t/nqs/i+iXuky6C1JFsq8zMntFdl57KrHTfICi3kp
	 50J21yOs3dSEcGfB5cIcCRfH1D4jAe2LODlEzSGmXrSklweTN1N/m/rvOI38HqLW1U
	 e2nwJ1xOjPtyvuVZQCsOAtsseBrZ/YQ1JQoP7L6lA1fFTAA2zG8jqq3PJII8m38N4Y
	 6KH8v4yzeU1okh4aOsLr48xQE2GkMjs2taDYMhqNYiMxE1wdB5go0U9rT9WIrLus4b
	 ll0zFxLzNgmvQ==
Received: from [100.115.66.23] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 56/25-24566-148DC126; Mon, 28 Feb 2022 14:12:17 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLIsWRWlGSWpSXmKPExsViZ8ORqOtwQyb
  JYO8aHYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPfn+WMBQ+5Kg7/fMLYwHiIs4uRk0NI4Amj
  xKy9qV2MXED2BSaJg6ffM0I4Jxglbvf8ZQepYhNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvH
  rAaYQFLiVOTnoDFWQRUJfYvuwYW5xVwkui6tpsFxJYQUJCY8vA9WA2ngLPE38+HGSGucJLYcb
  mZFaJeUOLkzCcsEPMlJA6+eMEM0asoMftyM9ScColZs9qYIGw1iavnNjFPYBSchaR9FpL2BYx
  Mqxhtk4oy0zNKchMzc3QNDQx0DQ1Ndc0sdI1M9BKrdBP1Ukt1k1PzSooSgbJ6ieXFeqnFxXrF
  lbnJOSl6eaklmxiBoZxS7CKxg/Fm30+9Q4ySHExKorycXZJJQnxJ+SmVGYnFGfFFpTmpxYcYZ
  Tg4lCR4O4/JJAkJFqWmp1akZeYA4womLcHBoyTC+/QyUJq3uCAxtzgzHSJ1ilFRSpw35RpQQg
  AkkVGaB9cGi+VLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5/4FM4cnMK4Gb/gpoMRPQ4r/
  BUiCLSxIRUlINTPsYv3vZnOR3asq5kq1id6+V2zkw6Y7MtTUvhXlfLVv6qvbq1v2JYsqHQiZs
  vntXrL07dqFB3xq7jqmG2gtc7Dv3a95h17lfx8l6iVPd719IIkNISL177Oun58/uvOf5uafuh
  M+dVW2Wbfwz2s1TqoJ1NhiqHdzWJqVnvbFx6ZF42e2JBYmma3nY35QFfSxMP//t4vJ7jFe/Pk
  07/OxHHadrjyLLgZx63saKizdXL7xyNnfht9x7Z/d0TN1wecXupYk/1xxlCD6qmF6x57RokHb
  UfkXhZl/Ol+sbFQp8ei80XjnZZpAo+f/CvHW6P/XD3OfXr3+T0lD77rKU45NSr45tb9heKr0V
  nCi1ZY/BZiWW4oxEQy3mouJEAIyO0FxgAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-532.messagelabs.com!1646057536!34538!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20473 invoked from network); 28 Feb 2022 14:12:16 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-12.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Feb 2022 14:12:16 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 0A1621001A6
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 14:12:16 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id E85D1100186
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 14:12:15 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 28 Feb 2022 14:12:08 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] iwd: upgrade 1.24 -> 1.25
Date: Mon, 28 Feb 2022 22:11:46 +0800
Message-ID: <1646057506-36235-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1646057506-36235-1-git-send-email-wangmy@fujitsu.com>
References: <1646057506-36235-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Feb 2022 14:12:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95576

Changelog:
=========
  Fix issue with handling abort of periodic scans.
  Fix issue with handling connection when link goes down.
  Fix issue with handling operating channel information.
  Add support for encrypted network profile storage.
  Add support for DPP initiating as a configurator.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-connectivity/iwd/{iwd_1.24.bb => iwd_1.25.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/iwd/{iwd_1.24.bb => iwd_1.25.bb} (94%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_1.24.bb b/meta-oe/recipes-connectivity/iwd/iwd_1.25.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/iwd/iwd_1.24.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_1.25.bb
index 6ee2651afe..055c689215 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_1.24.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_1.25.bb
@@ -8,7 +8,7 @@ DEPENDS = "ell"
 SRC_URI = "https://www.kernel.org/pub/linux/network/wireless/${BP}.tar.xz \
            file://0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-for-e.patch \
            "
-SRC_URI[sha256sum] = "61b5e48380cd3a6d0529f725eb6974157f1410af165f5d266b87add0bf395224"
+SRC_URI[sha256sum] = "3f138e03301beb2afc7b385a62f56db17059137857ab579f269c4e441783e760"
 
 inherit autotools manpages pkgconfig python3native systemd
 
-- 
2.25.1


