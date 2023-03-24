Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AD49C6FD1C
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 00:36:33 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.90631.1679618185495158380
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Mar 2023 17:36:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=p/kFWSWG;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679618183; i=@fujitsu.com;
	bh=lVqqi+FYH6jIrEExHCTSZ2QeuGbk7LeqxsLE7h4P8AE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=p/kFWSWGQy6xUYf0mG3gz2eMAmHjjn4TgkrimHFqChZgCaMxtfERTrB4iaKs49+mR
	 IeePhcyXLVZYTLfZbCENwcYsnheh3gkW2Jshr8XoHQEkvUhswlmd/6OICfua4y8OYv
	 87CRgNA9+8T73bX7qwDAO6Bc9J4MteTUGhfg8pEGZENqFSLQ/+c+zaEEkYl5GPrnL+
	 //mIpgBnaTrcoBdNRGYwPkGHCZRwhCOg7YKZdPaxp1KolAPtsJ6puXtni82HfL/kOJ
	 tGYcsDTwstqoL9lEmduzmQMVR9hIVMGoUr3nDOmkqrw2kjd+pmDRLUuCsittF5IGA+
	 cxJFYQbbvA40g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8OxWbftg0y
  KQcthOYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaOrbT17wUaeijN/5jE1MP7k6mLk4hASeMgo
  8W3HMjYI5zKTxIZny5m6GDmBnD2MEl9W1IDYbAJSEjfu/2cDsUUE9CWWzt7DDGIzC6hIvPjdw
  w5iCwu4Sjx/+B0sziKgKvHx/AYWEJtXwEniY+9ksLiEgILElIfvmSHighInZz5hgZgjIXHwxQ
  uoGkWJ2ZebWSDsConG6YeYIGw1iavnNjFPYOSfhaR9FpL2BYxMqxjNilOLylKLdE31kooy0zN
  KchMzc/QSq3QT9VJLdfPyi0oydA31EsuL9VKLi/WKK3OTc1L08lJLNjECgzGlOJlhB2Nn31+9
  Q4ySHExKorwSodIpQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4P7+RSRESLEpNT61Iy8wBRgZMW
  oKDR0mE99BZoDRvcUFibnFmOkTqFKOilDiv3zughABIIqM0D64NFo2XGGWlhHkZGRgYhHgKUo
  tyM0tQ5V8xinMwKglDTOHJzCuBm/4KaDET0GLnGrDFJYkIKakGplTLCUb97/sZHoQuNtrkvOo
  LL/spzZNN+kl6RRN6phTXPPVc+0put/EeAy2feU+SbE+ltBQxRwVlq+w4op/a/JV/TdV7fyFt
  adursXxaN7QLrvE1JV8IEGBqym9Tuzp7jlLRArvoQBOhgHOnJndWPTRkrep9JRTF/f3ngblvZ
  v16uyzAU1tU78bae/6P7npzlmfGTtt7uPJUqf1+XX710KtPzy++XZ7OrLLEpsvm76Zti6XWrt
  T5u9h+O/PseZZe13vtuN/6xGemfl/MsmT3rYunS6+eOcusseJo+HqlL8vk6/7kugdZzf4yc1O
  jrEZuU8rriOkFunxdXbPWHs9NZji85sXRpBczQhS2mnu+UGIpzkg01GIuKk4EAAK3cyRBAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-728.messagelabs.com!1679618182!254393!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19270 invoked from network); 24 Mar 2023 00:36:22 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-8.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Mar 2023 00:36:22 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id CB32C150
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:36:21 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id BF0A37C
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:36:21 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Fri, 24 Mar 2023 00:36:20 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] libadwaita: upgrade 1.2.1 -> 1.3.1
Date: Fri, 24 Mar 2023 08:36:03 +0800
Message-ID: <1679618167-27390-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:36:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101693

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- AdwAboutWindow
  - Add a missing Since annotation
- AdwCarousel
  - Fix allocation
- AdwFlap
  - Add a missing setter annotation for :fold-policy
  - Correctly measure separator
  - Avoid notify emissions in dispose()
- AdwTabBar
  - Fix clipped labels
- AdwTabOverview
  - Fix clipped labels
  - Add a translator comment for "%u tabs"
- Demo
  - Open primary menu with F10
- Don't show marshal functions in docs

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libadwaita/{libadwaita_1.2.1.bb => libadwaita_1.3.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/libadwaita/{libadwaita_1.2.1.bb => libadwaita_1.3.1.bb} (85%)

diff --git a/meta-gnome/recipes-gnome/libadwaita/libadwaita_1.2.1.bb b/meta-gnome/recipes-gnome/libadwaita/libadwaita_1.3.1.bb
similarity index 85%
rename from meta-gnome/recipes-gnome/libadwaita/libadwaita_1.2.1.bb
rename to meta-gnome/recipes-gnome/libadwaita/libadwaita_1.3.1.bb
index 3a9576634..8f927e3f7 100644
--- a/meta-gnome/recipes-gnome/libadwaita/libadwaita_1.2.1.bb
+++ b/meta-gnome/recipes-gnome/libadwaita/libadwaita_1.3.1.bb
@@ -10,7 +10,7 @@ DEPENDS = " \
 
 inherit gnomebase gobject-introspection gtk-doc vala features_check
 
-SRC_URI[archive.sha256sum] = "326f142a4f0f3de5a63f0d5e7a9de66ea85348a4726cbfd13930dcf666d22779"
+SRC_URI[archive.sha256sum] = "6b8bbf413c501b46c8616a0e5b836d7a34091140941412520bbd9ddda6df8cbd"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "opengl"
-- 
2.34.1


