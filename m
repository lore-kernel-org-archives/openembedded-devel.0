Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B68BC10F1B
	for <webhook@archiver.kernel.org>; Tue, 27 Dec 2022 06:36:55 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.152375.1672123008111317688
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Dec 2022 22:36:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Rk0ZReA4;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1672123006; i=@fujitsu.com;
	bh=XTs72D9bF7kbsEMh/dJAk5kDtoGWJOsON7Idzc36Y/k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Rk0ZReA4fWcYFgP09J7BM3YxWWkIFO+geEvffxjK4z2irpvz2kLm5zQM9aEcXL+im
	 ZdRtlQK6vPpuGoduI4J+BQ/BFim/FLqkBoWt8j2pInn7bcdSGMVaCot8UhuHLvUblp
	 HUaWrVVQJCIT8QtGAcMXs742cpSoiD4qMVBsra04WW1LVGm439iv3y8uZ5WkA2pGP7
	 w1IQnq4fKiGFvJLJqzA+/TAIB8hHqxF5OgfDqM5JmjqKDIid9yohHjIAMbvnRoAGo/
	 mzzoGRMr7Bg+S+U8tWtHSSg4KgWv9OeUP4h+KfAPkuqmLvFsiy+/iv5IsjSrFWrC0O
	 0pQQf8UI0i2bw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8MxSbd20qp
  kg9t/FS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1owDR+ayF7zhqnjclNLAOJGri5GLQ0jgCaPE
  vs3z2boYOYGc60wSXy7HQCT2MEosfT+XESTBJiAlceP+f7AiEQF9iaWz9zCD2MwCKhIvfvewd
  zFycAgL+ElMmFUHEmYRUJXovHaKFcTmFXCS+Lx1LwuILSGgIDHl4XuwVk4BZ4mVL/8wg7QKAd
  WsX5IBUS4ocXLmExaI6RISB1+8YIZoVZSYfbkZakyFxKxZbUwQtprE1XObmCcwCs5C0j4LSfs
  CRqZVjObFqUVlqUW6hoZ6SUWZ6RkluYmZOXqJVbqJeqmlunn5RSUZuoZ6ieXFeqnFxXrFlbnJ
  OSl6eaklmxiBgZtSnGq+g/H7sj96hxglOZiURHmlulclC/El5adUZiQWZ8QXleakFh9ilOHgU
  JLgvQySEyxKTU+tSMvMAUYRTFqCg0dJBKKVt7ggMbc4Mx0idYpRUUqct3MiUEIAJJFRmgfXBo
  vcS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEedVBxvNk5pXATX8FtJgJaPGHQytBFpckIqS
  kGpjezfWtWySY3rz4VVXlIa/+xuN5cxxFDK+GXzhlOYlt+6mdvHyrnWwvBi8PrWptLuat23Bz
  ZeGMx8xe0ft8F85z5n/K9+oOu93MxE2zrU5lcH2dmCU5OUJ8hrBqGC+XWndrg4jEUr76gm7xt
  dPXPj8pUbCoMrJKSo6lWDE9w/Mgq0/yK1Yxaa++93cTyme+VvWNyvjuHcmtzOnoO3smk2PwfP
  39TALfjt1JvqP3s6TAiplDeaL8hsbHYQJqL6dXcN1mjWJ5Gbu1ofj1k10Jtdf+3GnR5TA7Eqy
  2snZq0Q7Fno93GwQnKF+vCF99+3+rkabc+wsc1ozz1FPmBk8X8jWpj9zyv//C0V1+8h4KSizF
  GYmGWsxFxYkAVv8wLFcDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-745.messagelabs.com!1672123005!424063!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23563 invoked from network); 27 Dec 2022 06:36:45 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-16.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Dec 2022 06:36:45 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 043921000D5
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:36:45 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id EBFCC1000D2
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:36:44 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 27 Dec 2022 06:36:43 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] gst-editing-services: upgrade 1.20.4 -> 1.20.5
Date: Tue, 27 Dec 2022 14:36:03 +0800
Message-ID: <1672122966-31746-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1672122966-31746-1-git-send-email-wangmy@fujitsu.com>
References: <1672122966-31746-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:36:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100256

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...diting-services_1.20.4.bb => gst-editing-services_1.20.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/gst-editing-services/{gst-editing-services_1.20.4.bb => gst-editing-services_1.20.5.bb} (92%)

diff --git a/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.20.4.bb b/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.20.5.bb
similarity index 92%
rename from meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.20.4.bb
rename to meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.20.5.bb
index 6f76013db..6b7775c1c 100644
--- a/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.20.4.bb
+++ b/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.20.5.bb
@@ -18,7 +18,7 @@ inherit meson pkgconfig upstream-version-is-even gobject-introspection features_
 EXTRA_OEMESON = "-Dvalidate=disabled"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/gst-editing-services/gst-editing-services-${PV}.tar.xz"
-SRC_URI[sha256sum] = "aa03e983af5d79c1befffe3575b034e60960619a96bf877447cb73c28016fc41"
+SRC_URI[sha256sum] = "363f2b13675877b926b4be5259dbbeea8cc976805b40c871fc254bb8f382017d"
 
 PACKAGES += "gst-validate-launcher libges"
 
-- 
2.25.1


