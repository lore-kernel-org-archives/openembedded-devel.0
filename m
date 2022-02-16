Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1811AC433F5
	for <webhook@archiver.kernel.org>; Wed, 16 Feb 2022 07:50:58 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web08.9352.1644997856549959505
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Feb 2022 23:50:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=r4WDlTED;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1644997854; i=@fujitsu.com;
	bh=XwVsW5Dzzz6IHnp9BUCdPRD4waflLrPi2gpsxnZ+v4M=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=r4WDlTEDOZHIRWnngxu5YsZtoC7Mng2nn4oEn3xqEs9UgiQmZryjjZTqivuf0Tbz9
	 CmrSYcU0r6hq21EF7xbMEX4Y0wNRTgBqHT0MO9edAmSFTyFcjEwPtxfvIdi3gkNhG0
	 kMzhjhUXDNlxJaIGFYqlIkevVAQ3vaWZPa5TON1ziq/EncVN44Zz+iPWcaQpSIpo8c
	 liJiCs6qKnL8YdkNCn7+IIV68DiLhSxS874wYaVPCOyyLRiZxxXeNkYlvaTbuLMiTu
	 ymRfwGpO9hd1WzbLT+K04MoXN5Bha9KOmagDWfNQd8DbeoVluKb+YpG3Py80oJEqW1
	 iu4gmohDA97Wg==
Received: from [100.115.37.140] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-2.aws.ess.symcld.net id BD/FB-22205-EDCAC026;
 Wed, 16 Feb 2022 07:50:54 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOIsWRWlGSWpSXmKPExsViZ8MxSffeGp4
  kg9uzOC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1owLcxezFmzmqfj08BhzA+Nfri5GLg4hgSeM
  EjP/fmCEcC4wSXy4tpgVwtnDKHGifSGQw8nBJqArce7xWnYQW0RAX2Lp7D3MILawgJ3E7vZpY
  DaLgKrE1h9LWEBsXgEPiZvHPoHVSwgoSEx5+J4ZIi4ocXLmE7AaZgEJiYMvXgDFOYBqFCVmT5
  eHKK+QeH34EjOErSZx9dwm5gmMfLOQdM9C0r2AkWkVo3VSUWZ6RkluYmaOrqGBga6hoamusYW
  ukaGRXmKVbqJeaqlueWpxiS6QW16sl1pcrFdcmZuck6KXl1qyiREYfinFald2MO5Z9VPvEKMk
  B5OSKK/VKp4kIb6k/JTKjMTijPii0pzU4kOMMhwcShK8P0BygkWp6akVaZk5wFiASUtw8CiJ8
  C5eCZTmLS5IzC3OTIdInWJUlBLnLVsNlBAASWSU5sG1weLvEqOslDAvIwMDgxBPQWpRbmYJqv
  wrRnEORiVh3k6QKTyZeSVw018BLWYCWqzYyAWyuCQRISXVwDTlle6KK1vsDXbN1tr+WU4i7mN
  QVvH/xS9MFweY2E0S9DJLfWHIPGlRx/MYC7O5gUJXC6ZvntH/8deafbx37RZv0vnsxDVD6PnN
  mZav5rotfGPCzepw7NieCu5vrd/85p3a+1r2maH8ieAnQlfbBbe2ePnNZ+hkvfyv1LBLIGbz2
  V3Vz32n/0/w2v03RCD/orr45/gvjZs3PdPqmHtZSnFWykZlv18hPv9yct38TCdnuhtoO6Va+N
  VUXv299lzQqq2NgZZtefl9wsws08tMSl3bjhWdlDxzNj4711cibcOct8ETVhzz2t4SlrgqI0S
  /4f4tiWVWM74tP37wyJ7iv4c3lgtmWbdbb15vcj/dIEaJpTgj0VCLuag4EQBCbc1OOgMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-15.tower-565.messagelabs.com!1644997853!46600!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19260 invoked from network); 16 Feb 2022 07:50:54 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-15.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 16 Feb 2022 07:50:54 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id C9125100450
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Feb 2022 07:50:53 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id BCDA810033A
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Feb 2022 07:50:53 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 16 Feb 2022 07:50:33 +0000
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe][PATCH] libjs-jquery: Upgrade to 3.3.1.
Date: Wed, 16 Feb 2022 15:50:17 +0800
Message-ID: <1644997817-76002-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Feb 2022 07:50:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95331

libjs-jquery has been removed a few days ago because the version is too
old.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../libjs/libjs-jquery_3.3.1.bb               | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta-oe/recipes-support/libjs/libjs-jquery_3.3.1.bb

diff --git a/meta-oe/recipes-support/libjs/libjs-jquery_3.3.1.bb b/meta-oe/recipes-support/libjs/libjs-jquery_3.3.1.bb
new file mode 100644
index 0000000000..1a5c35a4d2
--- /dev/null
+++ b/meta-oe/recipes-support/libjs/libjs-jquery_3.3.1.bb
@@ -0,0 +1,27 @@
+SUMMARY = "JavaScript library for dynamic web applications"
+HOMEPAGE = "https://jquery.com/"
+LICENSE = "GPL-2 | MIT"
+LIC_FILES_CHKSUM = "file://usr/share/doc/libjs-jquery/copyright;md5=04bfd6e5b918af29f2f79ce44527da62"
+
+SRC_URI = "http://kr.archive.ubuntu.com/ubuntu/pool/main/j/jquery/${BPN}_${PV}~dfsg-3_all.deb"
+
+SRC_URI[sha256sum] = "e04d192c2356e9d4c2b2c7d83fde9408713212b53c4d106e5b9e46c1a56da33b"
+
+JQUERYDIR = "${datadir}/javascript/jquery"
+JQUERYDOCDIR = "${docdir}/libjs-jquery"
+
+S = "${WORKDIR}"
+
+do_install() {
+    install -d -m 0755 ${D}${JQUERYDIR}
+    install -m 0644 ${S}${JQUERYDIR}/jquery.js ${D}${JQUERYDIR}/
+    install -m 0644 ${S}${JQUERYDIR}/jquery.min.js ${D}${JQUERYDIR}/
+
+    ln -sf jquery.min.js ${D}${JQUERYDIR}/jquery.lite.js
+    ln -sf jquery.min.js ${D}${JQUERYDIR}/jquery.pack.js
+
+    install -d -m 0644 ${D}${JQUERYDOCDIR}
+    install -m 0644 ${S}${JQUERYDOCDIR}/copyright ${D}${JQUERYDOCDIR}/
+}
+
+FILES:${PN} = "/usr/share/javascript/jquery"
-- 
2.25.1


