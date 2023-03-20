Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C319CC6FD1F
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 03:02:57 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.5985.1679281368618394604
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Mar 2023 20:02:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=msYkBr+B;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679281366; i=@fujitsu.com;
	bh=G1ogx2eY4BqfwocPGR62UokI2RJe+I3dq0B4ObqKSPA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=msYkBr+BXzZCdmZT4A7KZaIHFY5uuWHl89pJ9atnWiCPY5dQf9CFeVUhv+J4s3T6p
	 LLNL1vkVUBSIig62T/7pwJ09l07qGH14F4jugM13C4NHWLixuPOZfSD1wrSvpw8+wn
	 twB7ecgWFHYSk2LjaoQjD+ZPoVEZpGAO32EJHvjLAdKQHTFURLIj9d6DjLR/+prb+S
	 AZgLSDG66DLKZubVAJFBuwSxXAr152G7DKSosyzR2xSit7SK41e87pm56zLiWc2SpN
	 itYy9766Piz/KGBt+8PpcxbWZ4WPSzEneQ+5cVO+e22DCNN8EdwbPdYkPQdnoz0fdf
	 P2Vv1V/ds20SA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJIsWRWlGSWpSXmKPExsViZ8OxWffaGfE
  Ug0MbWC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1ox7e3pZC27YVNx/n9/AeNeki5GLQ0jgIaPE
  nC9T2CCcy0wSe98dZIVw9jJK9C0+ytjFyMnBJqAhsXvqZWYQW0RAX2Lp7D1gNrOAmsTRlz/Bb
  GEBO4mZz66wgNgsAqoSM84cZgKxeQVcJW5N6GYHsSUEFCSmPHzPDBEXlDg58wkLxBwJiYMvXj
  BD1ChJvL20hxHCrpBonH6ICcJWk7h6bhPzBEb+WUjaZyFpX8DItIrRtDi1qCy1SNdML6koMz2
  jJDcxM0cvsUo3US+1VLc8tbhE10gvsbxYL7W4WK+4Mjc5J0UvL7VkEyMwFFOK1X/tYJzZ91fv
  EKMkB5OSKC/rMvEUIb6k/JTKjMTijPii0pzU4kOMMhwcShK8/PuBcoJFqempFWmZOcC4gElLc
  PAoifBazgRK8xYXJOYWZ6ZDpE4x6nJ8/HNxL7MQS15+XqqUOG//KaAiAZCijNI8uBGwGL3EKC
  slzMvIwMAgxFOQWpSbWYIq/4pRnINRSZjX6zTQFJ7MvBK4Ta+AjmACOuL+JBGQI0oSEVJSDUz
  LFW/3iCWISVU/st1xdr701Ntn3/x95r2pYmGMZ83JKP7tQjdvVc6/YnCTxUjPqJTlfvml42kb
  3HkMf3R83je7WM/ZjU+xuIbz8r4v6Rzp5y+Wc/i4frI19Tqz82OG74GCOU0uG+7u2FPvcr12X
  3mYiefi+cpHP9wpdNA9oKyldfjZ9IBbK4T7NTfs7Gc87i6lkSsj/+hAJPvfYiXx+YnXmPlfX5
  qp4ZLXs+zI1MMRvbfP+TNtXGFgbvW/fdoHzbBvD3fb3hVXan66+Kl5LM9qXu+9vPdklqw+cWN
  +crD93jsNvMu/2elOdMoy1w78MG1ldsyt3wvcDx+Z+DtzQoLh3wUrzRZPT/z2xejZtPnXlFiK
  MxINtZiLihMB4qm6vEwDAAA=
X-Env-Sender: leimaohui@fujitsu.com
X-Msg-Ref: server-13.tower-571.messagelabs.com!1679281365!480776!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2638 invoked from network); 20 Mar 2023 03:02:46 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-13.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 Mar 2023 03:02:46 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id C5448158
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Mar 2023 03:02:45 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id B84C173
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Mar 2023 03:02:45 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.227) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 20 Mar 2023 03:02:43 +0000
From: Lei Maohui <leimaohui@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Lei Maohui <leimaohui@fujitsu.com>
Subject: [oe] [meta-oe][PATCH v5] pgpool2: Added a new recipe.
Date: Mon, 20 Mar 2023 11:02:35 +0800
Message-ID: <1679281355-18266-1-git-send-email-leimaohui@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Mar 2023 03:02:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101602

Pgpool-II is a middleware that works between PostgreSQL servers and a PostgreSQL database client. It is distributed under a license similar to BSD and MIT. It provides the  following features.

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 ...0001-Fix-build-error-when-build-this-file.patch | 32 +++++++++++++
 ...-unknown-type-name-fd_set-error-with-musl.patch | 33 ++++++++++++++
 .../recipes-support/pgpool2/pgpool2/pgpool.service | 17 +++++++
 .../pgpool2/pgpool2/pgpool.sysconfig               |  7 +++
 .../recipes-support/pgpool2/pgpool2_4.4.1.bb       | 53 ++++++++++++++++++++++
 5 files changed, 142 insertions(+)
 create mode 100644 meta-networking/recipes-support/pgpool2/pgpool2/0001-Fix-build-error-when-build-this-file.patch
 create mode 100644 meta-networking/recipes-support/pgpool2/pgpool2/0001-pgpool2-Fix-unknown-type-name-fd_set-error-with-musl.patch
 create mode 100644 meta-networking/recipes-support/pgpool2/pgpool2/pgpool.service
 create mode 100644 meta-networking/recipes-support/pgpool2/pgpool2/pgpool.sysconfig
 create mode 100644 meta-networking/recipes-support/pgpool2/pgpool2_4.4.1.bb

diff --git a/meta-networking/recipes-support/pgpool2/pgpool2/0001-Fix-build-error-when-build-this-file.patch b/meta-networking/recipes-support/pgpool2/pgpool2/0001-Fix-build-error-when-build-this-file.patch
new file mode 100644
index 0000000..52bcc3b
--- /dev/null
+++ b/meta-networking/recipes-support/pgpool2/pgpool2/0001-Fix-build-error-when-build-this-file.patch
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
diff --git a/meta-networking/recipes-support/pgpool2/pgpool2/0001-pgpool2-Fix-unknown-type-name-fd_set-error-with-musl.patch b/meta-networking/recipes-support/pgpool2/pgpool2/0001-pgpool2-Fix-unknown-type-name-fd_set-error-with-musl.patch
new file mode 100644
index 0000000..26f8afe
--- /dev/null
+++ b/meta-networking/recipes-support/pgpool2/pgpool2/0001-pgpool2-Fix-unknown-type-name-fd_set-error-with-musl.patch
@@ -0,0 +1,33 @@
+From 5d335b5ddd052f047759cae0e9b94ec49f9f3884 Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@fujitsu.com>
+Date: Mon, 20 Mar 2023 02:03:04 +0000
+Subject: [PATCH] pgpool2: Fix unknown type name 'fd_set' error with musl.
+
+| read.c: In function 'read_until_ready_for_query':
+| read.c:53:24: error: storage size of 'timeoutval' isn't known
+|    53 |         struct timeval timeoutval;
+|       |                        ^~~~~~~~~~
+| read.c:54:9: error: unknown type name 'fd_set'
+|    54 |         fd_set          readmask;
+|       |         ^~~~~~
+
+Upstream-Status: Inappropriate [embedded specific]
+Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
+---
+ src/tools/pgproto/read.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/tools/pgproto/read.c b/src/tools/pgproto/read.c
+index c7fb548..4efe641 100644
+--- a/src/tools/pgproto/read.c
++++ b/src/tools/pgproto/read.c
+@@ -19,6 +19,7 @@
+ #include "../../include/config.h"
+ #include "pgproto/pgproto.h"
+ #include <unistd.h>
++#include <sys/select.h>
+ #include <stdlib.h>
+ #include <stdio.h>
+ #include <string.h>
+--
+2.34.1
diff --git a/meta-networking/recipes-support/pgpool2/pgpool2/pgpool.service b/meta-networking/recipes-support/pgpool2/pgpool2/pgpool.service
new file mode 100644
index 0000000..bf2d323
--- /dev/null
+++ b/meta-networking/recipes-support/pgpool2/pgpool2/pgpool.service
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
diff --git a/meta-networking/recipes-support/pgpool2/pgpool2/pgpool.sysconfig b/meta-networking/recipes-support/pgpool2/pgpool2/pgpool.sysconfig
new file mode 100644
index 0000000..ea13089
--- /dev/null
+++ b/meta-networking/recipes-support/pgpool2/pgpool2/pgpool.sysconfig
@@ -0,0 +1,7 @@
+# Options for pgpool
+
+# -n: don't run in daemon mode. does not detach control tty
+# -d: debug mode. lots of debug information will be printed
+
+#OPTS=" -d -n"
+OPTS=" -n"
diff --git a/meta-networking/recipes-support/pgpool2/pgpool2_4.4.1.bb b/meta-networking/recipes-support/pgpool2/pgpool2_4.4.1.bb
new file mode 100644
index 0000000..efb563b
--- /dev/null
+++ b/meta-networking/recipes-support/pgpool2/pgpool2_4.4.1.bb
@@ -0,0 +1,53 @@
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
+	   file://0001-pgpool2-Fix-unknown-type-name-fd_set-error-with-musl.patch \
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


