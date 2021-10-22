Return-Path: <zangrc.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4CEFC433EF
	for <webhook@archiver.kernel.org>; Fri, 22 Oct 2021 03:34:27 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.3])
 by mx.groups.io with SMTP id smtpd.web08.3635.1634873666616835334
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Oct 2021 20:34:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=S/mKMXlq;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.3,
 mailfrom: zangrc.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1634873664; i=@fujitsu.com;
	bh=u+7bHXX//y2u3lsdB5BUh0rQiu06squLcp/RmCmIVR4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=S/mKMXlqxeUXSVy1dDO1y1yPAKWg1wARO826IdZ870Vi9r1FdI0WRqNaQowEEx87D
	 A7bqE+KYTQ96h+Ejuh992C4UaZ2K/7MzYTJVXdhbQQLm59iXHFis6tDrM7UuqTUDIG
	 aO5/8IM6LSBb/Syfu7PhJjijzORl/C+W+5GFmVp0oTkoxNmCXvkbCdPRH3+jkoIzZr
	 uEMiWCdxSdLD7GtFhZ7VyIr51+bawDthat8L9j6l6Os4hpzGE6qY9GFP1N3/0OtwhB
	 y7FJc0Bv1RQpSbXe3+tkzbVPoyfY2W5oZ03gJJwuCguy/Lenn7Inka258YjRbHH5ob
	 8OjOAqRyJ7lQA==
Received: from [100.113.0.18] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.symcld.net id 60/FB-15394-04132716;
 Fri, 22 Oct 2021 03:34:24 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+EI0bU3LEo
  02PDeyOLi4aXMDowe5zauYAxgjGLNzEvKr0hgzXgw5RlrQSdPxdurt1kbGM9zdTFycQgJzGaS
  uPr3GnMXIyeQc4JRomNZOIjNJqAj0fGimwXEFhHQl1g6ew9YjbCAk8TpB7MYQWwWAVWJNZ87m
  EBsXgE3if4dd8HiEgIKElMevmeGiAtKnJz5BGwOs4CExMEXL5ghahQltu88wwJhV0i8PnyJeQ
  IjzywkLbOQtCxgZFrFaJFUlJmeUZKbmJmja2hgoGtoaKxrpGtqqJdYpZuol1qqm5yaV1KUCJT
  USywv1iuuzE3OSdHLSy3ZxAgMo5RCJuMdjNdef9A7xCjJwaQkynv7fmGiEF9SfkplRmJxRnxR
  aU5q8SFGGQ4OJQne+bpFiUKCRanpqRVpmTnAkIZJS3DwKInwbtcHSvMWFyTmFmemQ6ROMSpKi
  fOqGQAlBEASGaV5cG2wOLrEKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZj3Csh4nsy8Erjpr4
  AWMwEtLrAoAFlckoiQkmpgWrlho7v3bleV/yZK9g+VGoq/8XikqPO9/PxR5ENlj/Nx2cT7LQ+
  j5ROXSXyeldIactGwzOgTX4pr4udbSaVtqRxN9wMLCnb9KvORMKqc82+naE9c9449U57ceies
  wybr6P/G5difT2/3f9z54236FrVl5x5pWd9e/uGDrNyXlkkpuyK7JTWs5x8U1LzxpOpd38M3a
  T8nRgvPiXi30O1fnfixoxqzL6QkOtsf7dlmvvGtePVkp29N1je/3BRhT31b7+wYqTPhOtP+Hb
  4cqvNY6hmsDK6oP5lpI7Ozj3/J/hU7UouXt8b1Lyw4dzxwn/nPKXs4ym8u5Ir62m3GxR7ae35
  fSOfh79MzdAqzW1wblFiKMxINtZiLihMB0Uyt3R4DAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-3.tower-232.messagelabs.com!1634873663!2731544!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29343 invoked from network); 22 Oct 2021 03:34:23 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-3.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Oct 2021 03:34:23 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 19M3YIce024502
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Oct 2021 04:34:23 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Fri, 22 Oct 2021 04:34:17 +0100
From: Zang Ruochen <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH v2] libjs-jquery-cookie: Add recipe
Date: Fri, 22 Oct 2021 23:34:09 +0800
Message-ID: <1634916849-4419-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Oct 2021 03:34:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93527

A simple, lightweight JavaScript API for handling browser cookies.

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../libjs/libjs-jquery-cookie_3.0.1.bb        | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.1.bb

diff --git a/meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.1.bb b/meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.1.bb
new file mode 100644
index 0000000000..66fb5a3ffb
--- /dev/null
+++ b/meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.1.bb
@@ -0,0 +1,27 @@
+SUMMARY = "A simple, lightweight JavaScript API for handling cookies."
+HOMEPAGE = "https://github.com/js-cookie/js-cookie"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e16cf0e247d84f8999bf55865a9c98cf"
+
+SRC_URI = "git://github.com/js-cookie/js-cookie.git;protocol=http"
+
+SRCREV = "0ba77141dd215782cc7770347a457906908c66ff"
+
+S = "${WORKDIR}/git"
+
+JQUERYCOOKIEDIR = "${datadir}/javascript/jquery-cookie"
+JQUERYCOOKIEDOCDIR = "${docdir}/libjs-jquery-cookie"
+
+do_install() {
+        install -d ${D}${JQUERYCOOKIEDIR}
+        install -m 0644 ${S}/*.js ${D}${JQUERYCOOKIEDIR}
+        install -m 0644 ${S}/src/*.mjs ${D}${JQUERYCOOKIEDIR}
+        install -m 0644 ${S}/*.json ${D}${JQUERYCOOKIEDIR}
+
+        install -d ${D}${JQUERYCOOKIEDOCDIR}
+        install -m 0644 ${S}/*.md ${D}${JQUERYCOOKIEDOCDIR}
+
+}
+
+FILES:${PN} += "${datadir}/javascript/jquery-cookie"
+FILES:${PN}-doc += "${docdir}/libjs-jquery-cookie"
-- 
2.25.1


