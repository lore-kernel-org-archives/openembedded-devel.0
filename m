Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web08.8192.1621940443643311442
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 May 2021 04:00:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1llUne-0003ht-EY; Tue, 25 May 2021 14:00:38 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.92)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1llUne-000794-Co; Tue, 25 May 2021 14:00:38 +0300
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: openembedded-devel@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@bmw.de>
Subject: [meta-networking][dunfell][PATCH] ebtables: use bitbake optimization levels
Date: Tue, 25 May 2021 14:00:27 +0300
Message-Id: <20210525110027.26414-1-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Rspam-Score: 2.3 (++)
X-Rspam-Report: Action: no action
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: ARC_NA(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: FROM_HAS_DN(0.00)
 Symbol: TO_DN_SOME(0.00)
 Symbol: R_MISSING_CHARSET(2.50)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: MIME_GOOD(-0.10)
 Symbol: BROKEN_CONTENT_TYPE(1.50)
 Symbol: RCPT_COUNT_TWO(0.00)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: R_SPF_NA(0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20210525110027.26414-1-mikko.rapeli@bmw.de
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Content-Transfer-Encoding: 8bit

Don't overwrite with O3 optimization. Reduces ebtables
binary package size from 416241 to 412145 bytes, and
enables further optimizations with e.g. -Os flags
via bitbake distro wide settings.

Only ebtables versions up to 2.0.10-4 and dunfell are affected.
The version 2.0.11 from hardknott and master branch use system
wide flags already.

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 .../ebtables_optimizations.patch              | 19 +++++++++++++++++++
 .../ebtables/ebtables_2.0.10-4.bb             |  1 +
 2 files changed, 20 insertions(+)
 create mode 100644 meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/ebtables_optimizations.patch

diff --git a/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/ebtables_optimizations.patch b/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/ebtables_optimizations.patch
new file mode 100644
index 000000000..21d4cfd82
--- /dev/null
+++ b/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/ebtables_optimizations.patch
@@ -0,0 +1,19 @@
+ebtables: use optimizations from bitbake
+
+Enables building with O2 or Os to create smaller binaries.
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
+
+--- a/Makefile	2021-04-16 12:43:40.475431286 +0000
++++ b/Makefile	2021-04-16 12:45:23.654597711 +0000
+@@ -18,7 +18,7 @@ SYSCONFIGDIR:=/etc/sysconfig
+ DESTDIR:=
+ 
+ CFLAGS:=-Wall -Wunused -Werror
+-CFLAGS_SH_LIB:=-fPIC -O3
++CFLAGS_SH_LIB:=-fPIC
+ CC:=gcc
+ 
+ ifeq ($(shell uname -m),sparc64)
diff --git a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
index 276784009..8b6dcea43 100644
--- a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
+++ b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
@@ -31,6 +31,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/ebtables/ebtables-v${PV}.tar.gz \
            file://0007-extensions-Use-stdint-types.patch \
            file://0008-ethernetdb.h-Remove-C-specific-compiler-hint-macro-_.patch \
            file://0009-ebtables-Allow-RETURN-target-rules-in-user-defined-c.patch \
+           file://ebtables_optimizations.patch \
            "
 
 SRC_URI_append_libc-musl = " file://0010-Adjust-header-include-sequence.patch"
-- 
2.20.1

