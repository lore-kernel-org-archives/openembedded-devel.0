Received: from mailout03.rmx.de (mailout03.rmx.de [94.199.88.101])
 by mx.groups.io with SMTP id smtpd.web12.11599.1592806087292059635
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Jun 2020 23:08:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arri.de, ip: 94.199.88.101, mailfrom: ceggers@arri.de)
Received: from kdin02.retarus.com (kdin02.dmz1.retloc [172.19.17.49])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout03.rmx.de (Postfix) with ESMTPS id 49qzVB3qNzzldF6
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Jun 2020 08:08:02 +0200 (CEST)
Received: from ppmail.arri.de (unknown [217.111.95.7])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by kdin02.retarus.com (Postfix) with ESMTPS id 49qzV55GzHz2TTKr
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Jun 2020 08:07:57 +0200 (CEST)
Received: from mta.arri.de ([192.168.100.141]) by ppmail.arri.de over TLS secured channel with Microsoft SMTPSVC(7.0.6002.18264);
	 Mon, 22 Jun 2020 08:07:53 +0200
Received: from N95HX1G2.wgnetz.xx (192.168.54.60) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.408.0; Mon, 22 Jun
 2020 08:07:53 +0200
From: "Christian Eggers" <ceggers@arri.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Armin Kuster <akuster808@gmail.com>, Christian Eggers <ceggers@arri.de>,
	Khem Raj <raj.khem@gmail.com>
Subject: [dunfell][meta-oe][PATCH] linuxptp: Fix segmentation fault on 32 bit platforms with 64 bit time_t
Date: Mon, 22 Jun 2020 08:07:39 +0200
Message-ID: <20200622060739.6583-1-ceggers@arri.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [192.168.54.60]
X-OriginalArrivalTime: 22 Jun 2020 06:07:53.0993 (UTC) FILETIME=[779BC790:01D6485B]
X-RMX-ID: 20200622-080757-49qzV55GzHz2TTKr-0@kdin02
X-RMX-SOURCE: 217.111.95.7
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Back ported upstream patch:
https://github.com/richardcochran/linuxptp/commit/7de73fefc378cc42b9ed111=
5b3afa409d0250a48

Signed-off-by: Christian Eggers <ceggers@arri.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from 924bd4dd084cb86704c52fecee5bd147186a6efb)
---
 .../linuxptp/time_t_maybe_long_long.patch     | 135 ++++++++++++++++++
 .../linuxptp/linuxptp_2.0.bb                  |   1 +
 2 files changed, 136 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/linuxptp/linuxptp/time_t=
_maybe_long_long.patch

diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp/time_t_maybe_=
long_long.patch b/meta-oe/recipes-connectivity/linuxptp/linuxptp/time_t_m=
aybe_long_long.patch
new file mode 100644
index 000000000..af99d2b7f
--- /dev/null
+++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp/time_t_maybe_long_lo=
ng.patch
@@ -0,0 +1,135 @@
+Fix printf if time_t is long long
+
+On some platforms, time_t has recently switched from "long" to "long
+long" [1]. For these platforms it is necessary to use "%lld" as printf
+format specifier because the ABI differs between "long" and "long long".
+
+I found no way for creating something similar to PRId64 for time_t. No
+idea how to determine whether it's "long" or "long long". So I cast
+everything to "long long" instead.
+
+[1] https://git.musl-libc.org/cgit/musl/commit/?id=3D38143339646a4ccce8a=
fe298c34467767c899f51
+
+Upstream-Status: Accepted [next version is after 2.0]
+Upstream-Patch: https://github.com/richardcochran/linuxptp/commit/7de73f=
efc378cc42b9ed1115b3afa409d0250a48
+
+Signed-off-by: Christian Eggers <ceggers@arri.de>
+---
+diff -Naur linuxptp-2.0.org/phc_ctl.c linuxptp-2.0/phc_ctl.c
+--- linuxptp-2.0.org/phc_ctl.c	2018-08-12 23:08:43.000000000 +0200
++++ linuxptp-2.0/phc_ctl.c	2020-05-29 21:34:26.166519963 +0200
+@@ -230,8 +230,8 @@
+ 			strerror(errno));
+ 		return -1;
+ 	} else {
+-		pr_notice("set clock time to %ld.%09ld or %s",
+-			ts.tv_sec, ts.tv_nsec, ctime(&ts.tv_sec));
++		pr_notice("set clock time to %lld.%09ld or %s",
++			(long long)ts.tv_sec, ts.tv_nsec, ctime(&ts.tv_sec));
+ 	}
+=20
+ 	return args_to_eat;
+@@ -248,8 +248,8 @@
+=20
+ 		return -1;
+ 	} else {
+-		pr_notice("clock time is %ld.%09lu or %s",
+-			ts.tv_sec, ts.tv_nsec, ctime(&ts.tv_sec));
++		pr_notice("clock time is %lld.%09lu or %s",
++			(long long)ts.tv_sec, ts.tv_nsec, ctime(&ts.tv_sec));
+ 	}
+=20
+ 	/* get operation does not require any arguments */
+diff -Naur linuxptp-2.0.org/print.c linuxptp-2.0/print.c
+--- linuxptp-2.0.org/print.c	2018-08-12 23:08:43.000000000 +0200
++++ linuxptp-2.0/print.c	2020-05-29 21:34:26.166519963 +0200
+@@ -73,16 +73,16 @@
+=20
+ 	if (verbose) {
+ 		f =3D level >=3D LOG_NOTICE ? stdout : stderr;
+-		fprintf(f, "%s[%ld.%03ld]: %s%s%s\n",
++		fprintf(f, "%s[%lld.%03ld]: %s%s%s\n",
+ 			progname ? progname : "",
+-			ts.tv_sec, ts.tv_nsec / 1000000,
++			(long long)ts.tv_sec, ts.tv_nsec / 1000000,
+ 			message_tag ? message_tag : "", message_tag ? " " : "",
+ 			buf);
+ 		fflush(f);
+ 	}
+ 	if (use_syslog) {
+-		syslog(level, "[%ld.%03ld] %s%s%s",
+-		       ts.tv_sec, ts.tv_nsec / 1000000,
++		syslog(level, "[%lld.%03ld] %s%s%s",
++		       (long long)ts.tv_sec, ts.tv_nsec / 1000000,
+ 		       message_tag ? message_tag : "", message_tag ? " " : "",
+ 		       buf);
+ 	}
+diff -Naur linuxptp-2.0.org/unicast_service.c linuxptp-2.0/unicast_servi=
ce.c
+--- linuxptp-2.0.org/unicast_service.c	2018-08-12 23:08:43.000000000 +02=
00
++++ linuxptp-2.0/unicast_service.c	2020-05-29 21:36:23.170497415 +0200
+@@ -209,9 +209,9 @@
+ 	tmo =3D now.tv_sec + req->durationField;
+ 	if (tmo > client->grant_tmo) {
+ 		client->grant_tmo =3D tmo;
+-		pr_debug("%s grant of 0x%x extended to %ld",
++		pr_debug("%s grant of 0x%x extended to %lld",
+ 			 pid2str(&client->portIdentity),
+-			 client->message_types, tmo);
++			 client->message_types, (long long)tmo);
+ 	}
+ }
+=20
+@@ -226,8 +226,8 @@
+ 	interval =3D pqueue_peek(p->unicast_service->queue);
+ 	if (interval) {
+ 		tmo.it_value =3D interval->tmo;
+-		pr_debug("arming timer tmo=3D{%ld,%ld}",
+-			 interval->tmo.tv_sec, interval->tmo.tv_nsec);
++		pr_debug("arming timer tmo=3D{%lld,%ld}",
++			 (long long)interval->tmo.tv_sec, interval->tmo.tv_nsec);
+ 	} else {
+ 		pr_debug("stopping unicast service timer");
+ 	}
+@@ -499,8 +499,8 @@
+=20
+ 	while ((interval =3D pqueue_peek(p->unicast_service->queue)) !=3D NULL=
) {
+=20
+-		pr_debug("peek i=3D{2^%d} tmo=3D{%ld,%ld}", interval->log_period,
+-			 interval->tmo.tv_sec, interval->tmo.tv_nsec);
++		pr_debug("peek i=3D{2^%d} tmo=3D{%lld,%ld}", interval->log_period,
++			 (long long)interval->tmo.tv_sec, interval->tmo.tv_nsec);
+=20
+ 		if (timespec_compare(&now, &interval->tmo) >=3D 0) {
+ 			break;
+@@ -519,8 +519,8 @@
+ 		}
+=20
+ 		interval_increment(interval);
+-		pr_debug("next i=3D{2^%d} tmo=3D{%ld,%ld}", interval->log_period,
+-			 interval->tmo.tv_sec, interval->tmo.tv_nsec);
++		pr_debug("next i=3D{2^%d} tmo=3D{%lld,%ld}", interval->log_period,
++			 (long long)interval->tmo.tv_sec, interval->tmo.tv_nsec);
+ 		pqueue_insert(p->unicast_service->queue, interval);
+ 	}
+=20
+diff -Naur linuxptp-2.0.org/unicast_client.c linuxptp-2.0/unicast_client=
.c
+--- linuxptp-2.0.org/unicast_client.c	2018-08-12 23:08:43.000000000 +020=
0
++++ linuxptp-2.0/unicast_client.c	2020-06-02 11:13:06.922997844 +0200
+@@ -216,7 +216,7 @@
+ 				       long duration)
+ {
+ 	struct timespec now;
+-	long tmo;
++	time_t tmo;
+=20
+ 	if (clock_gettime(CLOCK_MONOTONIC, &now)) {
+ 		pr_err("clock_gettime failed: %m");
+@@ -226,7 +226,7 @@
+ 	tmo =3D now.tv_sec + duration;
+ 	if (!master->renewal_tmo || tmo < master->renewal_tmo) {
+ 		master->renewal_tmo =3D tmo;
+-		pr_debug("port %d: renewal timeout at %ld", portnum(p), tmo);
++		pr_debug("port %d: renewal timeout at %lld", portnum(p), (long long)t=
mo);
+ 	}
+ }
+=20
diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp_2.0.bb b/meta=
-oe/recipes-connectivity/linuxptp/linuxptp_2.0.bb
index eb262d36b..930c6673d 100644
--- a/meta-oe/recipes-connectivity/linuxptp/linuxptp_2.0.bb
+++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp_2.0.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fc=
e4486a80fdaf4a4263"
 SRC_URI =3D "http://sourceforge.net/projects/linuxptp/files/v${PV}/linux=
ptp-${PV}.tgz \
            file://build-Allow-CC-and-prefix-to-be-overriden.patch \
            file://no-incdefs-using-host-headers.patch \
+           file://time_t_maybe_long_long.patch \
            "
=20
 SRC_URI[md5sum] =3D "d8bb7374943bb747db7786ac26f17f11"
--=20
Christian Eggers
Embedded software developer

Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
Sitz: Muenchen - Registergericht: Amtsgericht Muenchen - Handelsregistern=
ummer: HRA 57918
Persoenlich haftender Gesellschafter: Arnold & Richter Cine Technik GmbH
Sitz: Muenchen - Registergericht: Amtsgericht Muenchen - Handelsregistern=
ummer: HRB 54477
Geschaeftsfuehrer: Dr. Michael Neuhaeuser; Stephan Schenk; Walter Traunin=
ger; Markus Zeiler

