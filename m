Return-Path: <zangrc.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60B3EC433EF
	for <webhook@archiver.kernel.org>; Mon, 27 Sep 2021 02:03:16 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web09.25865.1632708195102688241
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Sep 2021 19:03:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=eugOHQ4U;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: zangrc.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1632708193; i=@fujitsu.com;
	bh=dfCKm3T/F81ao8hHojDELmOAmbkW2x/0Grb+izSbUy8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=eugOHQ4U35Z1xm902ICBLFqimbxXreBlMiYaEW/j0ejQ6At043GYYOgbYg6Sivx+G
	 pvYF8TL8ORD/E0cYOKwk4mCryX9IpjsuGWaWZQYehd8pALiDatK5+pZuRsk3GRYuS0
	 tzG8NC3pp2ms31O6LPxFOKVl/yv8HMvg89dTsDezydaXsseVWfOeAcdmlQcSb3+EAs
	 opJwy+EY9u8+/J8Bmr3sf0m0TvYhCycsPspUd7IBD9mliRd6iHgHFB9tBpR8phuf6H
	 kAcaQP4gRqJw8xIWufORCWLsphEv5LDoq4DiQ9x06bZgtp7PTEUCL/bcMQ/K9f0TuG
	 FOc7ceSBoCdxQ==
Received: from [100.113.4.108] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-central-1.aws.symcld.net id D0/90-23595-16621516;
 Mon, 27 Sep 2021 02:03:13 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplkeJIrShJLcpLzFFi42Kxs+GYqpugFph
  ocHaLnsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmjGz8RNTwTueiiVdJ1gaGHdzdzFycQgJzGaS
  OL9zByOEc4JR4sCCy6xdjJwcbAI6Eh0vullAbBEBfYmls/cwg9jCAk4SF2ZMA7NZBFQl7q3Zx
  ARi8wq4SaycPZ0dxJYQUJCY8vA9M0RcUOLkzCdgc5gFJCQOvnjBDFGjKLF95xkWCLtC4vXhS8
  wTGHlmIWmZhaRlASPTKkbLpKLM9IyS3MTMHF1DAwNdQ0NjXXNdI1MjvcQq3SS91FLd5NS8kqJ
  EoKxeYnmxXnFlbnJOil5easkmRmAopRSy/9nBeP31B71DjJIcTEqivCpsgYlCfEn5KZUZicUZ
  8UWlOanFhxhlODiUJHg/qwDlBItS01Mr0jJzgGENk5bg4FES4VWSBErzFhck5hZnpkOkTjEqS
  onzTlEFSgiAJDJK8+DaYLF0iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iw7zKQKTyZeSVw01
  8BLWYCWlw7KQBkcUkiQkqqgUnRZ+mtk4/f5S3k1u7eytRRarMvdslLQ0/J7Xm8H2o7Q1d+u8z
  4Um6/luaELUl1p/7MuN/kmWEe+Gj392bmRc+Pp/xPSk03zTkhfble1Dli2gtfKaMzKTfre9VU
  Ehv/Jdo+bOw6WaA3e6flpXnn1XYdKYo+dEZfONHI4W1zdOolxTNcMrN0k8S4k/u0NsU01M7qv
  RLQcHSi++U7B3uEb773e3Sk41jnfotIR/Nwr6cWpfMdb059mB5RUCHhl1l2IO/whh+HUzPmmc
  tW6hT7PjT1XX9//oqHx+/7bctgktRbX1ufusEsX75tTYHC2bdTbPlOn7ToTP8U83P5GcVNPY9
  epqpY3A/72xj409rqpRJLcUaioRZzUXEiAOezkwAgAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-14.tower-245.messagelabs.com!1632708192!288917!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 918 invoked from network); 27 Sep 2021 02:03:12 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-14.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Sep 2021 02:03:12 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 18R23CMK018175
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Sep 2021 03:03:12 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Mon, 27 Sep 2021 03:03:11 +0100
From: Zang Ruochen <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] libjs-jquery-globalize: Add recipe
Date: Mon, 27 Sep 2021 10:03:05 +0800
Message-ID: <1632708185-7854-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Sep 2021 02:03:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93135

A JavaScript library for internationalization and localization that
leverages the official Unicode CLDR JSON data.

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../libjs/libjs-jquery-globalize_1.7.0.bb     | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-oe/recipes-support/libjs/libjs-jquery-globalize_1.7.0.bb

diff --git a/meta-oe/recipes-support/libjs/libjs-jquery-globalize_1.7.0.bb b/meta-oe/recipes-support/libjs/libjs-jquery-globalize_1.7.0.bb
new file mode 100644
index 0000000000..ec218299b2
--- /dev/null
+++ b/meta-oe/recipes-support/libjs/libjs-jquery-globalize_1.7.0.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "A JavaScript library for internationalization and localization that leverages the official Unicode CLDR JSON data"
+SECTION = "console/network"
+HOMEPAGE = "https://github.com/globalizejs/globalize"
+LICENSE = "MIT"
+
+S = "${WORKDIR}/globalize-${PV}"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4db68fb4d1d9986d736b35039f2ad9ea"
+
+SRC_URI = "https://github.com/globalizejs/globalize/archive/refs/tags/${PV}.tar.gz"
+
+SRC_URI[sha256sum] = "51928dd6dbaceaab8cd89e7b430aa366b3029a8b70e74d4ca4be2d89cc929bab"
+
+FILES:${PN} = "${datadir}/javascript/jquery-globalize"
+FILES:${PN}-doc += "${docdir}/${PN}"
+
+do_install() {
+        install -d ${D}${datadir}/javascript/jquery-globalize/
+        install -m 0644 ${S}/dist/*.js ${D}${datadir}/javascript/jquery-globalize/
+        install -m 0644 ${S}/dist/globalize/*.js ${D}${datadir}/javascript/jquery-globalize/
+
+        install -d ${D}${docdir}/${PN}/
+        install -m 0644 ${S}/LICENSE ${D}${docdir}/${PN}/
+}
-- 
2.25.1


