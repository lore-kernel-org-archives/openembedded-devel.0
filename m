Return-Path: <zangrc.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47772C433EF
	for <webhook@archiver.kernel.org>; Mon, 27 Sep 2021 02:03:43 +0000 (UTC)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.3])
 by mx.groups.io with SMTP id smtpd.web10.25832.1632708222454265468
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Sep 2021 19:03:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=BG7tSDIj;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.3,
 mailfrom: zangrc.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1632708220; i=@fujitsu.com;
	bh=sye2Vf3uBebvmIhIxk93y5EOJg2WF4bYkLVVH5o8Jxo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=BG7tSDIjKQnfJy0plJj0K+/odK/0LmwbodzqRUhU76vEOoa11SIW8MrJlYsPbWbHC
	 m3AAxrQWaYAWLQ2Tnces4IGlLhtUExXkUPo9tce+cJ5ommiyMkEmJ9IwBrehyV3hJQ
	 t1BHztbynh8JTT3Lj7uPu5+yE/Vw4pbsgdaLVKzOhD8G1HAuRKWV4ny3hcdxR+EmnH
	 0+moTiB6fKpB61+WE90lX1aod7XvKAcqp8GcogI8AcCvQ0WMFQFbGyYgrciQrLZd7U
	 0sPQOgaq9G35gP/VUiAya5V8j8DUmUgWsC7nwCCBe2h6recqZ9omxrNsZuTp5rD9Ne
	 gul2G83Gnubkw==
Received: from [100.112.195.149] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.symcld.net id 56/2D-14609-C7621516;
 Mon, 27 Sep 2021 02:03:40 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeJIrShJLcpLzFFi42Kxs+GYolujFph
  o8GeTkMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnGzeytLwQruiv+XD7E0MH7n7GLk4hASmM0k
  sePQdGYI5wSjROvrZ0AOJwebgI5Ex4tuFhBbREBfYunsPWBxYQEjidNLzjB2MbJzsAioSkxyA
  4nyCrhJPL3xjQ3ElhBQkJjy8D0zRFxQ4uTMJ2BTmAUkJA6+eMEMUaMosX3nGRYIu0Li9eFLzB
  MYeWYhaZmFpGUBI9MqRoukosz0jJLcxMwcXUMDA11DQyNdQ0sgNjHRS6zSTdRLLdUtTy0u0TX
  USywv1iuuzE3OSdHLSy3ZxAgMopSCAxN2MO5//UHvEKMkB5OSKK8KW2CiEF9SfkplRmJxRnxR
  aU5q8SFGGQ4OJQnezypAOcGi1PTUirTMHGBAw6QlOHiURHiVJIHSvMUFibnFmekQqVOMilLiv
  FNUgRICIImM0jy4NlgUXWKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzLsMZApPZl4J3PRXQI
  uZgBbXTgoAWVySiJCSamBaIK+2kGFLedBKh4eKERsSTY/ee7w0eP+Xhb5umyUKjEUOaDBNi1J
  sLqm+F/LytbOVQvonlstXl5R3GK92i81Y+yL7Vm40j8//kNuhkzkyeUocGVJ3PLK9f+Qwm5es
  57Xj1un3dU9yyD/+2eXLvK71i7s2/6NFzm0G9w9eLtt9iSuiY9HTihb2L/et52U7ma823XX6w
  EPu5C867OymSo/S5QO4Vi790nn8i/LbnBcL5U877d0fLtJbqK9VN7FDLd1jV2zV5MPsSydK8W
  91377sw9c67owVVnYTL9RdYZ18/V+/WlhqTkl5SvvlJQ9UUgJ+acimemrWX56c1RHfdVvhnvn
  /489Vzob1sJr3yyixFGckGmoxFxUnAgAxvEL4HQMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-13.tower-271.messagelabs.com!1632708220!321061!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4210 invoked from network); 27 Sep 2021 02:03:40 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-13.tower-271.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Sep 2021 02:03:40 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 18R23dxY016246
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Sep 2021 03:03:39 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Mon, 27 Sep 2021 03:03:38 +0100
From: Zang Ruochen <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] smarty: Add recipe
Date: Mon, 27 Sep 2021 10:03:33 +0800
Message-ID: <1632708213-7968-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Sep 2021 02:03:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93138

Smarty is a template engine for PHP, facilitating the separation of presentation (HTML/CSS) from application logic.

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../recipes-support/smarty/smarty_3.1.39.bb   | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-oe/recipes-support/smarty/smarty_3.1.39.bb

diff --git a/meta-oe/recipes-support/smarty/smarty_3.1.39.bb b/meta-oe/recipes-support/smarty/smarty_3.1.39.bb
new file mode 100644
index 0000000000..50d9958384
--- /dev/null
+++ b/meta-oe/recipes-support/smarty/smarty_3.1.39.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "the compiling PHP template engine"
+SECTION = "console/network"
+HOMEPAGE = "https://www.smarty.net/"
+
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2c0f216b2120ffc367e20f2b56df51b3"
+
+DEPENDS = "php"
+
+SRC_URI = "git://github.com/smarty-php/smarty.git;protocol=https;tag=v${PV}"
+
+FILES:${PN} = "${datadir}/php/smarty3/"
+
+S = "${WORKDIR}/git"
+
+do_install() {
+        install -d ${D}${datadir}/php/smarty3/libs/
+        install -m 0644 ${S}/libs/*.php ${D}${datadir}/php/smarty3/libs/
+
+        install -d ${D}${datadir}/php/smarty3/libs/plugins
+        install -m 0644 ${S}/libs/plugins/*.php ${D}${datadir}/php/smarty3/libs/plugins/
+
+        install -d ${D}${datadir}/php/smarty3/libs/sysplugins
+        install -m 0644 ${S}/libs/sysplugins/*.php ${D}${datadir}/php/smarty3/libs/sysplugins/
+}
-- 
2.25.1


