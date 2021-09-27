Return-Path: <zangrc.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A165C433F5
	for <webhook@archiver.kernel.org>; Mon, 27 Sep 2021 02:03:17 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.114])
 by mx.groups.io with SMTP id smtpd.web09.25866.1632708196299954103
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Sep 2021 19:03:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=sAAnR1W9;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.114,
 mailfrom: zangrc.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1632708188; i=@fujitsu.com;
	bh=sylluqZlIAltqmapkObvwBWkvoAKh+ADoDBEekDM9aE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=sAAnR1W9jnwDcz5Qb2H3geZRKSI9eWm99j7RjBvD+SsRlcu5rV7pFUDHsnMkOBQ1o
	 wstQuOdIHxiD8PXz5jy01WprQGqHQ4yCHH+PTwCt0RU942a1SdI9n4kkXnqvj0J9bJ
	 qBfHpl4D6yDpXKeY4stbTOVa1uV5qFvTQHEHtbsJ8c2/CePw3aw6pdI6DuLWrpTEhe
	 51pJP3/q3nyKXAxZat8gOmLq5ViikxdyfHKjjGcDENrHvGhOJU7JTGFJuvk8KJZ+Bc
	 Mc00FFtl1FYLGR+8Axk9LthmPf9OFPgwrLMD2dB4+/d+iIFhIfvFxpxt1e2zBzwd0b
	 /Ic/bW9af4x2A==
Received: from [100.113.4.108] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-central-1.aws.symcld.net id 5F/2E-23198-C5621516;
 Mon, 27 Sep 2021 02:03:08 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+GYohutFph
  oMO+SvsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvFsfxtzwVKeiouXlrM0MD7j6mLk4hASmM0k
  8bFpC1MXIyeQc4JRYkOvP4jNJqAj0fGimwXEFhHQl1g6ew8ziC0sYC/xZsssMJtFQFXi4tbjY
  L28Am4SV7d/AItLCChITHn4nhkiLihxcuYTsDnMAhISB1+8gKpRlNi+8wwLhF0h8frwJeYJjD
  yzkLTMQtKygJFpFaNFUlFmekZJbmJmjq6hgYGuoaGxrhmQpZdYpZukl1qqm5yaV1KUCJTUSyw
  v1iuuzE3OSdHLSy3ZxAgMo5RCNq4djE9ff9A7xCjJwaQkyqvCFpgoxJeUn1KZkVicEV9UmpNa
  fIhRhoNDSYL3swpQTrAoNT21Ii0zBxjSMGkJDh4lEV4lSaA0b3FBYm5xZjpE6hSjopQ47xRVo
  IQASCKjNA+uDRZHlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ8y4DmcKTmVcCN/0V0GImoM
  W1kwJAFpckIqSkGpiuxORPPq/ClFN12ddtr8aak4mXbA7HFh2c0/daL9Hhb3GAfeaW9zxJkUH
  p4ucsNdfnuzLuOb3Xenpix5bfWzzvzWO4Wvw7cU4pz65pVvfzf9QeTNM4t6nm9KzPTytTgres
  P3HspeiOVVei1kpaLdh3bUvo8bKvP9UYpuQF7dl3063S8fvvp42L1swsuCuxb/sJycidzpuSu
  EMedV16cVHgiULG55rNS5NzOidyPCtOnlyYd6r1Ux/TrSiVfcrH7dZH5B8Lnzjx8eEpCyVP/W
  u+31YhdI3nwXm5WekyL9+w2W+17DQS7L/Kfqfyac7KCRtk23b9Z9RrOhfybsqP23GbYwJN7lz
  KyWSf7tQqz3PTSomlOCPRUIu5qDgRAO4UvFAeAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-13.tower-238.messagelabs.com!1632708187!286574!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2550 invoked from network); 27 Sep 2021 02:03:07 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-13.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Sep 2021 02:03:07 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 18R22vKK015976
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Sep 2021 03:03:07 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Mon, 27 Sep 2021 03:02:56 +0100
From: Zang Ruochen <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] libjs-jquery-cookie: Add recipe
Date: Mon, 27 Sep 2021 10:02:50 +0800
Message-ID: <1632708170-7789-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Sep 2021 02:03:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93136

A simple, lightweight JavaScript API for handling browser cookies.

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../libjs/libjs-jquery-cookie_3.0.1.bb        | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.1.bb

diff --git a/meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.1.bb b/meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.1.bb
new file mode 100644
index 0000000000..e10c6c4d33
--- /dev/null
+++ b/meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.1.bb
@@ -0,0 +1,30 @@
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
+RDEPENDS_${PN} = "rpm"
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
+
-- 
2.25.1


