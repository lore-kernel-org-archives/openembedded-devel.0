Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75939C64EC7
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 09:01:06 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web10.17678.1677661259006838110
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Mar 2023 01:00:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=LCbjOPpj;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677661257; i=@fujitsu.com;
	bh=c5WLkQE/Q1+NziCx0hLrSx1J/xUi59mdV2CkmvSpCcQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=LCbjOPpjbFdktedtxY8L8Qn+IsB2Fd0uqXYbpVbj7JbauCc8ckW1cgypqDw/5v5NU
	 FXP6ZaAsk7Sb/KKVjMfTI5JMB9NGClpAkTqivg0uYNGBy3PKDUTxfOHwGEOl4P2KDf
	 A0OzL2r0xWVlJzFfSa4/5bEDE5BV+uRF7T8zuE8FTDG6sHR2bjHfGFg304owlnt9Bt
	 9A5WGiGzo3lKmGvqeqG95j05X4SHyzi076A255gyYz0zYhFRIHTjQSlqGZRfm+0WE3
	 So3Pjd3uTjh8mA1oH/JuscT1pw4IvSh3qb2uf8SyXP7kcUHCUA7PPxBTrwcJTNBFhT
	 Pzvm+KgktQaqw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJIsWRWlGSWpSXmKPExsViZ8ORpOsh8j/
  Z4PRFNYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePFqaPsBZf1KnbPvc/awLhTo4uRi0NI4CGj
  xKL181i7GDmBnKtMEnNnlEIk9jJK/Pj0mRkkwSagIbF76mUwW0RAX2Lp7D1gNrOAmsTRlz/Bb
  GEBe4n3rS8YQWwWARWJ+11TwWxeAVeJFc+bmUBsCQEFiSkP3zNDxAUlTs58wgIxR0Li4IsXzB
  A1ShJvL+1hhLArJVo//GKBsNUkrp7bxDyBkX8WkvZZSNoXMDKtYjQtTi0qSy3SNdZLKspMzyj
  JTczM0Uus0k3USy3VLU8tLtE11EssL9ZLLS7WK67MTc5J0ctLLdnECAzFlGLmvh2MX3v/6h1i
  lORgUhLlDTD/lyzEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgteI83+ykGBRanpqRVpmDjAuYNISH
  DxKIrxxLEBp3uKCxNzizHSI1ClGXY6Pfy7uZRZiycvPS5US59UQBCoSACnKKM2DGwGL0UuMsl
  LCvIwMDAxCPAWpRbmZJajyrxjFORiVhHkP8gNN4cnMK4Hb9AroCCagIxqu/QE5oiQRISXVwGQ
  dyuexgWXP3QNc+8NW7VULqegSaLixwnX6i/2r9tcJvz24fddnCSPNyvddW9NDjinzLCw7s8Ba
  8pOiwuc4YXlOCamYJYu/7Yh5vH9iUvUmnznPDzaV63VpK/z0n2a+b7nzr6vPPbIlJI9957PN4
  uWe8y/DMkPhe+rz9wv16hunte4/2dW2W7o3aNOxJoXsNpnvJQKFx2ZNnsGfPMVX1unPJZZVGU
  pNflZ8SX/iJf72VnaqqmTsyIqtOB4yzcXEZaLo2X0vr/3I/7xggUHhs18brUrYxAr5/H47LXE
  vU5nZsJHznOffONOYzSWFzi0Lr6/11fi/e5rwPP6LNiEHRHULNzx8P9Fu95UdWu31fUosxRmJ
  hlrMRcWJAIw+sSZMAwAA
X-Env-Sender: leimaohui@fujitsu.com
X-Msg-Ref: server-6.tower-587.messagelabs.com!1677661256!431626!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22284 invoked from network); 1 Mar 2023 09:00:56 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-6.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 1 Mar 2023 09:00:56 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 34F231B1
	for <openembedded-devel@lists.openembedded.org>; Wed,  1 Mar 2023 09:00:56 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 28E8B1AF
	for <openembedded-devel@lists.openembedded.org>; Wed,  1 Mar 2023 09:00:56 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.227) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 1 Mar 2023 09:00:54 +0000
From: Lei Maohui <leimaohui@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Lei Maohui <leimaohui@fujitsu.com>
Subject: [oe] [meta-oe][PATCHi v2] pgpool2: Added a new recipe.
Date: Wed, 1 Mar 2023 17:00:43 +0800
Message-ID: <1677661243-20004-1-git-send-email-leimaohui@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Mar 2023 09:01:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101314

Pgpool-II is a middleware that works between PostgreSQL servers and a PostgreSQL database client. It is distributed under a license similar to BSD and MIT. It provides the  following features.

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 ...0001-Fix-build-error-when-build-this-file.patch | 32 +++++++++++++
 .../recipes-support/pgpool2/pgpool2/pgpool.service | 17 +++++++
 .../pgpool2/pgpool2/pgpool.sysconfig               |  7 +++
 meta-oe/recipes-support/pgpool2/pgpool2_4.4.1.bb   | 53 ++++++++++++++++++++++
 4 files changed, 109 insertions(+)
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
index 0000000..57280e4
--- /dev/null
+++ b/meta-oe/recipes-support/pgpool2/pgpool2_4.4.1.bb
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
+	   file://pgpool.sysconfig \
+	   file://pgpool.service \
+           "
+SRC_URI[sha256sum] = "4b379bbba8e178128a1cee4a5bd1ae116dedb3da6121b728c18f0f54c881f328"
+
+S = "${WORKDIR}/pgpool-II-${PV}"
+
+inherit autotools systemd pkgconfig
+
+SYSTEMD_SERVICE:${PN} = "pgpool.service"
+
+PACKAGECONFIG ??= " openssl libmemcached postgresql \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
+    "
+PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam,"
+PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl"
+PACKAGECONFIG[libmemcached] = "--with-memcached=${STAGING_INCDIR}/libmemcachedutil-1.0,--without-memcached,libmemcached"
+PACKAGECONFIG[postgresql] = "--with-pgsql-includedir=${STAGING_INCDIR}/postgresql --with-pgsql=${STAGING_LIBDIR}/../ ,,postgresql"
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


