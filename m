Return-Path: <zangrc.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC3D8C433EF
	for <webhook@archiver.kernel.org>; Fri, 22 Oct 2021 03:34:52 +0000 (UTC)
Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com
 [195.245.230.83])
 by mx.groups.io with SMTP id smtpd.web09.3552.1634873691537273329
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Oct 2021 20:34:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=r45Z+3GR;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.83,
 mailfrom: zangrc.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1634873689; i=@fujitsu.com;
	bh=izo73ZTio39UOFxvZbyVuZ3p1DqtNdIPefi92ymlZlc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=r45Z+3GRxqUVZjgGojXqYIG2n7h2bfKAVvXy2lgU7yLf+kd4y2/hnWIvelv4+mC4l
	 VeZaO6IPtCaO7O1Xa4RdS6/pkPvLQgWJwDNBfuZZaUt/pdEX7UW4YDXmcnANGztKkz
	 ECl0yMm1YKUn9PxjLJUom2+ptvRG2KvXpLyG1xrFfIM7Q76SzLKyDXWkO3IvSd5LbH
	 FPBQamQE7gOPPLpLynUdXREdggIXdlvMAthrBM5ZDwjB5hOn++u4wOgeVAB4KJL2M+
	 9AfCh8xM+5j6ckNphelqFcfxPV7Qp4oCE2OEOd3KCEpaVcRmMvtaPv4haZVDo0T1/M
	 jwrjiE+CSfalw==
Received: from [100.112.196.248] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-west-1.aws.symcld.net id 81/31-20159-85132716;
 Fri, 22 Oct 2021 03:34:48 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+EI1Q03LEo
  02L/S2OLi4aXMDowe5zauYAxgjGLNzEvKr0hgzZgw5RZbwW/uik9fbrE1MJ7h6mLk4hASmM0k
  sWn+e1YI5wSjxKr1K9m7GDk52AR0JDpedLOA2CIC+hJLZ+9hBrGFBVwlGpfMZASxWQRUJea/f
  QZUz8HBK+AmsfWROEhYQkBBYsrD92DlvAKCEidnPgEbwywgIXHwxQtmiBpFie07z7BA2BUSrw
  9fYp7AyDMLScssJC0LGJlWMVokFWWmZ5TkJmbm6BoaGOgaGhrpGlpa6BoaG+glVukm6aWW6pa
  nFpfoGuollhfrFVfmJuek6OWllmxiBIZRSsGxph2MJ19/0DvEKMnBpCTKe/t+YaIQX1J+SmVG
  YnFGfFFpTmrxIUYZDg4lCd75ukWJQoJFqempFWmZOcCQhklLcPAoifBu1wdK8xYXJOYWZ6ZDp
  E4xKkqJ86oZACUEQBIZpXlwbbA4usQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmPcKyHiezL
  wSuOmvgBYzAS0usCgAWVySiJCSamBqXGo9SfzYD+Hvb//XHH9T8nOHS1StVF6eyOSwV1b++uc
  ny12JWnnzn3fkrW6v5sJJxRyJl2qnvXdz8EoSXiKUKZhTrixl6RxpYij53+zxGcttJ5vbJ0+O
  arf4o7H4d7Pby5IvL4wZdrvfdj3R8dFzkdvGBP7c2x8vBHq7nOl/+/46Y9POZ3dkDwrqtj36d
  nvPr5llDE1K7jMKbedfmilv9oPVomj1GvNs9YAKpXkah6PcDSNY9bhLbi3Ny3Wfs9FdbHYXo9
  eU8qUPDnAEp1xqt91iVC2w1ZTpdvPfjSrnWJwCL7Iu/PctMWv/liU+6xinVUwLe2CTv8XvsFn
  S+prmC0IPDePfHJoWLziF0VSJpTgj0VCLuag4EQDJeYFfHgMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-17.tower-285.messagelabs.com!1634873687!3205787!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4264 invoked from network); 22 Oct 2021 03:34:47 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-17.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Oct 2021 03:34:47 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 19M3Yl38025402
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Oct 2021 04:34:47 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Fri, 22 Oct 2021 04:34:46 +0100
From: Zang Ruochen <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH v2] libjs-jquery-globalize: Add recipe
Date: Fri, 22 Oct 2021 23:34:40 +0800
Message-ID: <1634916880-4471-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Oct 2021 03:34:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93528

A JavaScript library for internationalization and localization that leverages the official Unicode CLDR JSON data.

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../libjs/libjs-jquery-globalize_1.7.0.bb     | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-support/libjs/libjs-jquery-globalize_1.7.0.bb

diff --git a/meta-oe/recipes-support/libjs/libjs-jquery-globalize_1.7.0.bb b/meta-oe/recipes-support/libjs/libjs-jquery-globalize_1.7.0.bb
new file mode 100644
index 0000000000..a87c5bf758
--- /dev/null
+++ b/meta-oe/recipes-support/libjs/libjs-jquery-globalize_1.7.0.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "A JavaScript library for internationalization and localization that leverages the official Unicode CLDR JSON data"
+SECTION = "console/network"
+HOMEPAGE = "https://github.com/globalizejs/globalize"
+LICENSE = "MIT"
+
+S = "${WORKDIR}/git"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4db68fb4d1d9986d736b35039f2ad9ea"
+
+SRC_URI = "git://github.com/globalizejs/globalize;tag=1.7.0;nobranch=1"
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


