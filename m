Return-Path: <zangrc.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32C39C433F5
	for <webhook@archiver.kernel.org>; Mon, 27 Sep 2021 02:03:29 +0000 (UTC)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.5])
 by mx.groups.io with SMTP id smtpd.web12.25902.1632708208310397577
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Sep 2021 19:03:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ymGlc/r1;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.5,
 mailfrom: zangrc.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1632708206; i=@fujitsu.com;
	bh=kvyMLYqG21Q6OR8go01R+WOO53yBz2eTdnybG8Q3VkA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ymGlc/r1n4rxffgdu5m4RezQDCzFQKqORtZf66ViJykRFJfHtnDqnCxDZ4D7hFuYZ
	 tsX7MAbh/JhGUYK2g5gu+N1ptjgOfsmiIR+A94cSFEv22Qytma74GouJrCGA00Ah9r
	 iAqPp3qOb2Kp8kTHlXHuSKGBb9ZP9vN+D1SOOQNV+piS4is8/snydPZhRcYeBeaZbC
	 iMxrM0keGB9H+FrUon0Ndb48V51oNuKJ6vHHCT6otM4i+lx0Wu7bY5XrZZ8IRWyCq8
	 jW9bULxpHhPg6vDlmFetLzZzU/P9IBIwp8GGmWgXJajPE9hZM8zLPHD2iPNW0ZH2F4
	 v54vAUiSqC5Ig==
Received: from [100.112.195.149] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-west-1.aws.symcld.net id 5F/CD-01625-D6621516;
 Mon, 27 Sep 2021 02:03:25 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+EI0c1VC0w
  02LRYxeLi4aXMDowe5zauYAxgjGLNzEvKr0hgzWh4GFLwVLji6s6DzA2MywW7GLk4hARmM0k8
  7LzKCOGcYJT42L6GrYuRk4NNQEei40U3C4gtIqAvsXT2HmYQW1jAXmLrlKlgNSwCqhKH1l9nA
  rF5Bdwkru46DmZLCChITHn4nhkiLihxcuYTsDnMAhISB1+8YIaoUZTYvvMMC4RdIfH68CXmCY
  w8s5C0zELSsoCRaRWjRVJRZnpGSW5iZo6uoYGBrqGhka6hpZGukYGJXmKVbqJeaqlueWpxia6
  hXmJ5sV5xZW5yTopeXmrJJkZgGKUUHDizg/HU6w96hxglOZiURHlV2AIThfiS8lMqMxKLM+KL
  SnNSiw8xynBwKEnwflYBygkWpaanVqRl5gBDGiYtwcGjJMKrJAmU5i0uSMwtzkyHSJ1iVJQS5
  52iCpQQAElklObBtcHi6BKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd5lIFN4MvNK4Ka/Al
  rMBLS4dlIAyOKSRISUVAMT0yd9Ew8XnnP8ybe7ePZt8/+osCMjhmOq+ArukN45C+2Nljw/Mtl
  FveXt/zO3Vk147FdWF8I+e+tBsyyFycXr/jwXvOHY9/216K730721PM6my531DotoZBZ+/vDI
  +6XTPsj/WV+vFvD/gNfXM6dv79wuFfJQRsAgoS3k95zdFjvVLddbrrLfZHN/X1VaQ7Q+b+hXl
  6gPz36blk6ZKsXJ69XMtHvZuvMn7e13cMa8kZ7y5IKXwpL08EAviylndNmrI86XtywzuLZE7A
  zLyxn1ySlWmy0UHuQ9LPzk831xdU3Xwy9Hpt//5JDexyoWEKP/+NPvGea/DzzjMpv6xd/zv/S
  O+ben2RZfm1BvdGwalxJLcUaioRZzUXEiALgI4HAeAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-4.tower-265.messagelabs.com!1632708205!354604!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4795 invoked from network); 27 Sep 2021 02:03:25 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-4.tower-265.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Sep 2021 02:03:25 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 18R23P0M027490
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Sep 2021 03:03:25 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Mon, 27 Sep 2021 03:03:23 +0100
From: Zang Ruochen <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] libjs-jquery-icheck: Add recipe
Date: Mon, 27 Sep 2021 10:03:18 +0800
Message-ID: <1632708198-7906-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Sep 2021 02:03:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93137

Highly customizable checkboxes and radio buttons (jQuery & Zepto).

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../libjs/libjs-jquery-icheck_1.0.3.bb        | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 meta-oe/recipes-support/libjs/libjs-jquery-icheck_1.0.3.bb

diff --git a/meta-oe/recipes-support/libjs/libjs-jquery-icheck_1.0.3.bb b/meta-oe/recipes-support/libjs/libjs-jquery-icheck_1.0.3.bb
new file mode 100644
index 0000000000..f14b619a94
--- /dev/null
+++ b/meta-oe/recipes-support/libjs/libjs-jquery-icheck_1.0.3.bb
@@ -0,0 +1,42 @@
+DESCRIPTION = "Highly customizable checkboxes and radio buttons (jQuery & Zepto)"
+SECTION = "console/network"
+HOMEPAGE = "http://fronteed.com/iCheck"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://icheck.js;start_line=1;end_line=8;md5=404078d7de9f05ed64d364274f790055"
+
+DEPENDS = "virtual/libc"
+
+SRC_URI = "git://github.com/fronteed/icheck.git;protocol=https;branch=${PV};tag=${PV}"
+
+FILES:${PN} += "${datadir}/javascript/jquery-icheck"
+
+S = "${WORKDIR}/git"
+
+do_install() {
+        install -d ${D}${datadir}/javascript/jquery-icheck/
+        install -m 0644 ${S}/icheck.js ${D}${datadir}/javascript/jquery-icheck/
+        install -m 0644 ${S}/icheck.min.js ${D}${datadir}/javascript/jquery-icheck/
+
+        install -d ${D}${datadir}/javascript/jquery-icheck/skins/
+        install -m 0644 ${S}/skins/all.css ${D}${datadir}/javascript/jquery-icheck/skins/
+
+        install -d ${D}${datadir}/javascript/jquery-icheck/skins/flat/
+        install -m 0644 ${S}/skins/flat/* ${D}${datadir}/javascript/jquery-icheck/skins/flat/
+
+        install -d ${D}${datadir}/javascript/jquery-icheck/skins/futurico/
+        install -m 0644 ${S}/skins/futurico/* ${D}${datadir}/javascript/jquery-icheck/skins/futurico/
+
+        install -d ${D}${datadir}/javascript/jquery-icheck/skins/line/
+        install -m 0644 ${S}/skins/line/* ${D}${datadir}/javascript/jquery-icheck/skins/line/
+
+        install -d ${D}${datadir}/javascript/jquery-icheck/skins/minimal/
+        install -m 0644 ${S}/skins/minimal/* ${D}${datadir}/javascript/jquery-icheck/skins/minimal/
+
+        install -d ${D}${datadir}/javascript/jquery-icheck/skins/polaris/
+        install -m 0644 ${S}/skins/polaris/* ${D}${datadir}/javascript/jquery-icheck/skins/polaris/
+
+        install -d ${D}${datadir}/javascript/jquery-icheck/skins/square/
+        install -m 0644 ${S}/skins/square/* ${D}${datadir}/javascript/jquery-icheck/skins/square/
+}
+
-- 
2.25.1


