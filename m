Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A806C5479D
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 05:19:36 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.64590.1673241570524393689
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Jan 2023 21:19:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=dlwgda0B;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673241568; i=@fujitsu.com;
	bh=qHxyd1uvwAiM6B/V2LqMn1uKHznYf09CzLDIR/FrQag=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=dlwgda0BS8yRkkyHCwtPdXNRzD5H4ztmYyVI/itw3L975F5Sbmz29GzAgMT/g7q6N
	 G3FTTm8tUchyMkSqu89ype/P7Xy6cTg//JtduPWWsswGGn/R7SjyQ5KnEd1noT0QGl
	 SAqh8B0folk+J4xVqdTDhwIofxjMt7iyEg9IiNlri8dAb7QlTw4ZGWiOu/Bntl0YlC
	 3o96a+slH+sne7bTUFgc87AyT+kNP6icO0alf6RY3MFF4OAanZBfcTGIzaKLYhnu12
	 dcZtVyDHiKp+ckuzSX+oqKx8QL/SK26+mM1eQ/wz0I6RudJiuIH7K32zSpKXvX12ub
	 p+G5+Ha4Yj3Ng==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBIsWRWlGSWpSXmKPExsViZ8ORpPtg8e5
  kg903hCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1ox/m/6zFfyTq2jetYy1gXGddBcjF4eQwENG
  iQWrfrJ2MXICOVeYJN5eDoNI7GWUWHpxCwtIgk1AQ2L31MvMILaIgL7E0tl7wGxmATWJoy9/g
  tnCAtYSR5v3soHYLAIqEhO7dwEN5eDgFXCRmN4lBRKWEFCQmPLwPVg5r4CgxMmZT1ggxkhIHH
  zxghmiRkni7aU9jBB2pUTrh18sELaaxNVzm5gnMPLPQtI+C0n7AkamVYymxalFZalFusZ6SUW
  Z6RkluYmZOXqJVbqJeqmluuWpxSW6RnqJ5cV6qcXFesWVuck5KXp5qSWbGIGBmFKsqryD8cvS
  P3qHGCU5mJREeTmqdiUL8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuCdvXB3spBgUWp6akVaZg4wK
  mDSEhw8SiK8XDOB0rzFBYm5xZnpEKlTjLocH/9c3MssxJKXn5cqJc5bCzJDAKQoozQPbgQsQi
  8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEuaVmAc0hSczrwRu0yugI5iAjvgxdSfIESWJCCm
  pBqaXgqs4o3dv5xOaYKa2WsYj2efU0/ntdrWsT4Ua78lNZ9kcMy/32x7ea1dXS87T0d+ak/96
  1/8EecGo/83nfxUzK+x+VBEiwPFK5PmTU8G3/qq7iqx2b3SxdlNYLHOTeW39Aq0zLXvMkwP+n
  /q6al7H3Lqpdy/pvfgwf+XHc8fbuLTOFPsEXrFiex2xyczuY6Cy49y5T9sEbbvvN3MovlZvfx
  D8XefFme6HFnf0Nr5ibjM8cbL/dG52+ZeFdfqRBf8XHPOaVxkfN+/Ksm13sncoL3Fhf2w8T8V
  ILf1/8FvjhbPTs8StEws5hBe+unF+4bMI34yWp59+xwRN71pf93SCbGzO91CGfYulLhdrWtQr
  sRRnJBpqMRcVJwIAejMHBEsDAAA=
X-Env-Sender: leimaohui@fujitsu.com
X-Msg-Ref: server-2.tower-565.messagelabs.com!1673241568!237464!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14951 invoked from network); 9 Jan 2023 05:19:28 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-2.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 9 Jan 2023 05:19:28 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 01DEF1AD
	for <openembedded-devel@lists.openembedded.org>; Mon,  9 Jan 2023 05:19:28 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id EA3E37B
	for <openembedded-devel@lists.openembedded.org>; Mon,  9 Jan 2023 05:19:27 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.227) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 9 Jan 2023 05:19:26 +0000
From: Lei Maohui <leimaohui@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Lei Maohui <leimaohui@fujitsu.com>
Subject: [oe] [meta-oe][PATCH] pgpool2: Added a new recipe.
Date: Mon, 9 Jan 2023 13:19:16 +0800
Message-ID: <1673241556-6067-1-git-send-email-leimaohui@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.227]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Jan 2023 05:19:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100478

Pgpool-II is a middleware that works between PostgreSQL servers and a PostgreSQL database client. It is distributed under a license similar to BSD and MIT. It provides the  following features.

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 .../recipes-support/pgpool2/pgpool2/pgpool.service | 17 ++++++++
 .../pgpool2/pgpool2/pgpool.sysconfig               |  7 ++++
 meta-oe/recipes-support/pgpool2/pgpool2_4.4.1.bb   | 46 ++++++++++++++++++++++
 3 files changed, 70 insertions(+)
 create mode 100644 meta-oe/recipes-support/pgpool2/pgpool2/pgpool.service
 create mode 100644 meta-oe/recipes-support/pgpool2/pgpool2/pgpool.sysconfig
 create mode 100644 meta-oe/recipes-support/pgpool2/pgpool2_4.4.1.bb

diff --git a/meta-oe/recipes-support/pgpool2/pgpool2/pgpool.service b/meta-oe/recipes-support/pgpool2/pgpool2/pgpool.service
new file mode 100644
index 0000000..bf2d323
--- /dev/null
+++ b/meta-oe/recipes-support/pgpool2/pgpool2/pgpool.service
@@ -0,0 +1,17 @@
+[Unit]
+Description=Pgpool-II
+After=syslog.target network.target
+
+[Service]
+
+User=postgres
+Group=postgres
+
+EnvironmentFile=-/etc/sysconfig/pgpool
+
+ExecStart=/usr/bin/pgpool -f /etc/pgpool-II/pgpool.conf $OPTS
+ExecStop=/usr/bin/pgpool -f /etc/pgpool-II/pgpool.conf $STOP_OPTS stop
+ExecReload=/usr/bin/pgpool -f /etc/pgpool-II/pgpool.conf reload
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-oe/recipes-support/pgpool2/pgpool2/pgpool.sysconfig b/meta-oe/recipes-support/pgpool2/pgpool2/pgpool.sysconfig
new file mode 100644
index 0000000..ea13089
--- /dev/null
+++ b/meta-oe/recipes-support/pgpool2/pgpool2/pgpool.sysconfig
@@ -0,0 +1,7 @@
+# Options for pgpool
+
+# -n: don't run in daemon mode. does not detach control tty
+# -d: debug mode. lots of debug information will be printed
+
+#OPTS=" -d -n"
+OPTS=" -n"
diff --git a/meta-oe/recipes-support/pgpool2/pgpool2_4.4.1.bb b/meta-oe/recipes-support/pgpool2/pgpool2_4.4.1.bb
new file mode 100644
index 0000000..52e0192
--- /dev/null
+++ b/meta-oe/recipes-support/pgpool2/pgpool2_4.4.1.bb
@@ -0,0 +1,46 @@
+SUMMARY = "a language independent connection pool server for PostgreSQL."
+
+DESCRIPTION = "Pgpool-II is a middleware that works between PostgreSQL \
+               servers and a PostgreSQL database client. It is distributed \
+               under a license similar to BSD and MIT. It provides the \
+               following features."
+
+HOMEPAGE = "http://pgpool.net"
+
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e4b38de086d73e0521de0bbdbaa4a1a9"
+
+SRC_URI = "http://www.pgpool.net/mediawiki/images/pgpool-II-${PV}.tar.gz \
+	   file://pgpool.sysconfig \
+	   file://pgpool.service \
+           "
+SRC_URI[sha256sum] = "4b379bbba8e178128a1cee4a5bd1ae116dedb3da6121b728c18f0f54c881f328"
+
+S = "${WORKDIR}/pgpool-II-${PV}"
+
+inherit autotools systemd
+
+SYSTEMD_SERVICE:${PN} = "pgpool.service"
+
+PACKAGECONFIG ??= " openssl libmemcached postgresql \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
+    "
+PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam,"
+PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl"
+PACKAGECONFIG[libmemcached] = "--with-memcached=${STAGING_INCDIR}/libmemcachedutil-1.0,--without-memcached,libmemcached"
+PACKAGECONFIG[postgresql] = "--with-pgsql-includedir=${STAGING_INCDIR}/postgresql --with-pgsql=${bindir} ,,postgresql"
+
+EXTRA_OECONF += "-disable-static \
+		"
+B = "${S}"
+CFLAGS:append = " -fcommon "
+
+FILES:${PN} += "${datadir}/pgpool-II/ "
+
+do_install:append() {
+    install -d ${D}${sysconfdir}/pgpool-II
+    install -D -m 0644 ${WORKDIR}/pgpool.sysconfig  ${D}${sysconfdir}/pgpool-II/pgpool.conf
+    install -D -m 0644 ${S}/src/sample/pcp.conf.sample ${D}${sysconfdir}/pgpool-II/pcp.conf
+    install -D -m 0644 ${S}/src/sample/pool_hba.conf.sample ${D}${sysconfdir}/pgpool-II/pool_hba.conf
+    install -Dm 0644 ${WORKDIR}/pgpool.service ${D}${systemd_system_unitdir}/pgpool.service
+}
-- 
1.8.3.1


