Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA995C6FD1D
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 00:43:23 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.1830.1678927397685036795
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Mar 2023 17:43:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=wxKMxc5I;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678927395; i=@fujitsu.com;
	bh=3HImt+0MT/qU361zHADQcHypvUza14DnlsgMdnMww24=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=wxKMxc5IoxlWOeMWjuBywYOLz113t2chW40vxJWVcmzIh0rDyQAJVuo2eGly8sT8+
	 HCKh1Czo0uhPKxwZdZCuNl+9vzHfCzq0CasGQhf0IY2SJkkbOkV344pBj8c1zPNpXy
	 7I4R2sEYSWa7K8IAjFD9nWSxvRLXGr8FKLxpvv2OV/dUVOAuV7ZFyb2D4RneIbycOf
	 YNCfabn+TyJjrIZP/89/FvRwvWyd0YiJkDxsoA3hQ1Qd4mYLtOBFomN67nLVEfOWLY
	 A29ISkQ5cSjmU7Iuk2WocQxF6gZQAVhapLZI4fu0MPVfg1g79CwMdm9IVooCdhWGPO
	 duF3/ST/R+OXw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRWlGSWpSXmKPExsViZ8OxWVcpTSj
  FYNk8OYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPmuzMsBTt0Kyb8PcPcwLhGvYuRi0NI4AGj
  xIb29YwQzmUmicuvLzFDOHsZJVZsegyU4eRgE9CQ2D31MjOILSKgL7F09h4wm1lATeLoy59AN
  geHsICdxIbvmSBhFgFViYsPp7KB2LwCrhJth6awg9gSAgoSUx6+Z4aIC0qcnPmEBWKMhMTBFy
  +YIWqUJN5e2sMIYVdINE4/xARhq0lcPbeJeQIj/ywk7bOQtC9gZFrFaFacWlSWWqRrqJdUlJm
  eUZKbmJmjl1ilm6iXWqqbl19UkgGUSiwv1kstLtYrrsxNzknRy0st2cQIDMaU4sTbOxiX9/7V
  O8QoycGkJMr7Z41AihBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3r8pQilCgkWp6akVaZk5wMiAS
  Utw8CiJ8IpFAKV5iwsSc4sz0yFSpxh1OT7+ubiXWYglLz8vVUqcVzYVqEgApCijNA9uBCxKLz
  HKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5k1LBprCk5lXArfpFdARTEBH8M4TADmiJBEhJdX
  AZK7eL7Fqv+nzY9l2t51uzdR9LfF/XZz0qdotdbMi7m86mnd0w70k4c6jdVNnq7Aze8a9bpQ7
  9mW3Y6vTnEUlN5ddD2HhDviva6WTbL7bPcExVKfrpE131kXpyNsiGy/sNbO2CDyv8/aUy6QXz
  2w8RWVSq6Jeu/OK3Hj1OzFiU3rlnSP66zdarq09NbOKOTObueWGbNDh6ewBtT2yvu5si7kn3U
  tj7J4s/fxcYtAyRhe+DTGXGgo//L/rs8Zmw/rNGovFK6YdFd1tuOYQ21quG2uqY7bF/Z7V88O
  /SOTThDNtGzm9bHQyvrdLs+a0WH3m3Xw23+ba/6hJDgwPU599rrvf9aluysaKS4unWXH8UGIp
  zkg01GIuKk4EAKDA3PBNAwAA
X-Env-Sender: leimaohui@fujitsu.com
X-Msg-Ref: server-4.tower-745.messagelabs.com!1678927394!12064!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29101 invoked from network); 16 Mar 2023 00:43:14 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-4.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 Mar 2023 00:43:14 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id D18007C
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Mar 2023 00:43:13 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id C4B1B73
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Mar 2023 00:43:13 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.227) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 16 Mar 2023 00:43:12 +0000
From: Lei Maohui <leimaohui@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Lei Maohui <leimaohui@fujitsu.com>
Subject: [oe] [meta-oe][PATCH v3] pgpool2: Added a new recipe.
Date: Thu, 16 Mar 2023 08:43:02 +0800
Message-ID: <1678927382-19409-1-git-send-email-leimaohui@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.227]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Mar 2023 00:43:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101568

Pgpool-II is a middleware that works between PostgreSQL servers and a PostgreSQL database client. It is distributed under a license similar to BSD and MIT. It provides the  following features.

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 ...0001-Fix-build-error-when-build-this-file.patch | 32 +++++++++++++
 .../recipes-support/pgpool2/pgpool2/pgpool.service | 17 +++++++
 .../pgpool2/pgpool2/pgpool.sysconfig               |  7 +++
 meta-oe/recipes-support/pgpool2/pgpool2_4.4.1.bb   | 52 ++++++++++++++++++++++
 4 files changed, 108 insertions(+)
 create mode 100644 meta-oe/recipes-support/pgpool2/pgpool2/0001-Fix-build-error-when-build-this-file.patch
 create mode 100644 meta-oe/recipes-support/pgpool2/pgpool2/pgpool.service
 create mode 100644 meta-oe/recipes-support/pgpool2/pgpool2/pgpool.sysconfig
 create mode 100644 meta-oe/recipes-support/pgpool2/pgpool2_4.4.1.bb

diff --git a/meta-oe/recipes-support/pgpool2/pgpool2/0001-Fix-build-error-when-build-this-file.patch b/meta-oe/recipes-support/pgpool2/pgpool2/0001-Fix-build-error-when-build-this-file.patch
new file mode 100644
index 0000000..52bcc3b
--- /dev/null
+++ b/meta-oe/recipes-support/pgpool2/pgpool2/0001-Fix-build-error-when-build-this-file.patch
@@ -0,0 +1,32 @@
+From f8ab74a76049f69adeebe92c62593547e05a075d Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@fujitsu.com>
+Date: Wed, 11 Jan 2023 17:22:41 +0900
+Subject: [PATCH] Fix build error when build this file.
+
+| snprintf.c:770:64: error: 'PG_STRERROR_R_BUFLEN' undeclared (first use in this function)
+|   770 |                                         char            errbuf[PG_STRERROR_R_BUFLEN];
+|       |                                                                ^~~~~~~~~~~~~~~~~~~~
+
+PG_STRERROR_R_BUFLEN is defined in postgresql, but pgpool doesn't
+include the header of postgresql.
+
+Upstream-Status: Inappropriate [OE-Specific]
+Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
+---
+ src/parser/snprintf.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/parser/snprintf.c b/src/parser/snprintf.c
+index 84ebdb2..3387897 100644
+--- a/src/parser/snprintf.c
++++ b/src/parser/snprintf.c
+@@ -46,6 +46,7 @@
+ #include "pool_parser.h"
+ #include "stringinfo.h"
+ #include "utils/palloc.h"
++#include "postgresql/server/port.h"
+
+ /*
+  * We used to use the platform's NL_ARGMAX here, but that's a bad idea,
+--
+2.25.1
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
index 0000000..9220c87
--- /dev/null
+++ b/meta-oe/recipes-support/pgpool2/pgpool2_4.4.1.bb
@@ -0,0 +1,52 @@
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
+	   file://0001-Fix-build-error-when-build-this-file.patch \
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
+"
+PACKAGECONFIG[pam] = "--with-pam,,libpam"
+PACKAGECONFIG[openssl] = "--with-openssl,,openssl"
+PACKAGECONFIG[libmemcached] = "--with-memcached=${STAGING_INCDIR}/libmemcachedutil-1.0,,libmemcached"
+PACKAGECONFIG[postgresql] = "--with-pgsql-includedir=${STAGING_INCDIR}/postgresql,, postgresql"
+
+EXTRA_OECONF += "--disable-static \
+	         --disable-rpath \
+	        "
+B = "${S}"
+CFLAGS:append = " -fcommon "
+
+FILES:${PN} += "${datadir}/pgpool-II/ "
+
+do_configure:append() {
+    echo "#define HAVE_STRCHRNUL 1" >> ${S}/src/include/config.h
+    sed -i "s,#define USE_REPL_SNPRINTF 1,/* #undef USE_REPL_SNPRINTF*/,g" ${S}/src/include/config.h
+}
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


