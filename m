Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46BABC636CC
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 07:42:08 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web10.7920.1676878927707618550
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Feb 2023 23:42:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=K2GJhC/T;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676878926; i=@fujitsu.com;
	bh=IuxQRYMzJfSd/ZhOYAAZpyBFKe2wKk5iTVBaqNHtNck=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=K2GJhC/Tb7ERRkb9B8rU2i7y3MOYJj1GgIfMHuiTC7IJNgNE3aPMxc4/rPHbaF7sG
	 zMCnqH/L5PQ1Sy+bpt5soVW9iO2r7ROhgBxsxFNN5pjdQt4dTZf0qeayzgm04WKFFg
	 Lh1KuCG+L7tu3UamqXzSwkcx3a2bi/kacZ0Shibwx3jToYXd3FXL3EaiTOA+BJddbD
	 uHc6XBWl5SdcJbFZXIviLqohJLlThP9gAjWrOmafx64tIiHtfd3QqXRSvFzIO6KNeT
	 +87Cb7Mp7qup2NYNcuHGEPO1ta6ePVeNoLJThP7wa4xY1T3dB1pSQqarLEJH8t09OZ
	 SCMkfa/XfOexw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8ORqOur8jn
  Z4PY1aYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPClh/sBY+4Ks42nmFtYNzO2cXIxSEk8IRR
  YlvLRTYI5waTRM+vT0AOJ5Czl1Fi9YYKEJtNQErixv3/YHERAX2JpbP3MIPYzAIqEi9+97CD2
  MICzhK7Pm1mBbFZBFQllv5YyQJi8wo4SaxY0AsWlxBQkJjy8D0zRFxQ4uTMJywQcyQkDr54wQ
  xRoygx+3IzC4RdKdH64ReUrSZx9dwm5gmM/LOQtM9C0r6AkWkVo1lxalFZapGuoYFeUlFmekZ
  JbmJmjl5ilW6iXmqpbnlqcYmuoV5iebFeanGxXnFlbnJOil5easkmRmAwphQzJu9gvNr3V+8Q
  oyQHk5Io7ybhz8lCfEn5KZUZicUZ8UWlOanFhxhlODiUJHirFIFygkWp6akVaZk5wMiASUtw8
  CiJ8EpLA6V5iwsSc4sz0yFSpxgVpcR5FZSBEgIgiYzSPLg2WDReYpSVEuZlZGBgEOIpSC3KzS
  xBlX/FKM7BqCTMexxkO09mXgnc9FdAi5mAFrv/+ACyuCQRISXVwKR3XjNi6cEZc9d2uSfPn7m
  6SkDEgmfXk4M67XtqPZatV8zcm9b94yjba4fn7zf+6Quc4HvtaYlVXqz5fquHzS/fOSn+uTFz
  2/vVeTcrfBc75JcfDlvf/G4Rl1VQo/ThT3zuKT4LcirePX7+yD9o25RZrJx+Kg/kp7A9uj3DL
  uKPiGr8sbrfbsZn5pwylvA1eZ0kzFNQ42xbvyq4M9QuyuRdDvNOvtjpfLV7PeLNlzgFL05bsP
  Cn15vgHYaL3dQ+TH0s/Dz0qMDzh7KdczJrBDYrLm0pmR1YxHe8789c8wrB4nCFj4fZ9UrOndn
  aUXrJmOf/3+l7TfdPPvVxhtTsV7OmqR786fHRMoy/m+O7dZoSS3FGoqEWc1FxIgAnI85dQQMA
  AA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-585.messagelabs.com!1676878925!184800!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15247 invoked from network); 20 Feb 2023 07:42:05 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-2.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 Feb 2023 07:42:05 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 114BD100191
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Feb 2023 07:42:05 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 050D1100182
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Feb 2023 07:42:05 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 20 Feb 2023 07:42:03 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] poppler: upgrade 23.01.0 -> 23.02.0
Date: Mon, 20 Feb 2023 15:41:49 +0800
Message-ID: <1676878912-15532-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Feb 2023 07:42:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101160

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* CairoOutputDev: Fix rendering of color type 3 fonts
* CairoOutputDev: Add handling matte entry
* Fix segfault on wrong nssdir
* Fix "NSS could not shutdown"
* pdfsig: Point out supports PKCS#11 URIs as nickname

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../poppler/{poppler_23.01.0.bb => poppler_23.02.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/poppler/{poppler_23.01.0.bb => poppler_23.02.0.bb} (96%)

diff --git a/meta-oe/recipes-support/poppler/poppler_23.01.0.bb b/meta-oe/recipes-support/poppler/poppler_23.02.0.bb
similarity index 96%
rename from meta-oe/recipes-support/poppler/poppler_23.01.0.bb
rename to meta-oe/recipes-support/poppler/poppler_23.02.0.bb
index 4d1a089d7..3752c901a 100644
--- a/meta-oe/recipes-support/poppler/poppler_23.01.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_23.02.0.bb
@@ -8,7 +8,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://basename-include.patch \
            file://0001-cmake-Do-not-use-isystem.patch \
            "
-SRC_URI[sha256sum] = "fae9b88d3d5033117d38477b79220cfd0d8e252c278ec870ab1832501741fd94"
+SRC_URI[sha256sum] = "3315dda270fe2b35cf1f41d275948c39652fa863b90de0766f6b293d9a558fc9"
 
 DEPENDS = "fontconfig zlib cairo lcms glib-2.0"
 
-- 
2.34.1


