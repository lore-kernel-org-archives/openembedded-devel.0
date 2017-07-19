Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0AB3E782EE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jul 2017 15:41:44 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id c23so289994pfe.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jul 2017 08:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=dRqogqce+C3rgSBychEIO450KXe3qlIgs90GI6ivtmM=;
	b=WspGSxMceXxzIhjM0M0fyGjssuM1zCpCqcpDa+cTAfquzMrPhaholnXmtov9212Xzg
	fGaYxblbBdD6lHDAnR4/qSS3NvvzHP4X+xe07PQR1RgHyYaiHD+GwspmZ4cekuePUpkD
	06ANszk6GaFqLfIdsYVu1aAbJwW2d1TzuVJ3Rz+4ZNsBi2EgNoRyTp2+pka+3t6iQvEU
	iT/SzbmD9mfBsMGUBu0Orv7xAvvBW1oCg6JYvFT9GkWhH1EGGpM8lWoK9PY5WNdz+FzA
	w0NPEKERdjkKZg9IjeiMLq0OxUglAV8UgvGTLX+ZWdMyR0rAlPAoGsGoAaAy6h2Tirfp
	J9ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=dRqogqce+C3rgSBychEIO450KXe3qlIgs90GI6ivtmM=;
	b=ZH7VisCg+zQ2GyVWLZDWI7gTkZdWn0dXX5EI+Jhw8hb8+seMvS2JQLs8VkTOA73RDV
	uZd5V+hCJVYJKiPsrxmlTal70iSE4hCNHp/mEMH4bVuf6Dv9w6OtOiZvuTsNTXUX2OCI
	lT8D46P380LYN+J5O1gjgTnVkTJ6sygZ6iz66MdcKf0vQHXEbJrOajDMWLRmDp2qbuTj
	f4y+kYQXzKo5b6yccPeJbjCZyhSfYoMAhxQZS+VjUa/KqBWBbc5blmvBsN0nTjiuf4o0
	Snv7N7+XH0lTeN70NkY22k6YiTAQBnhLEayH1/gEoYxN009wm+6AluK5jtkFcV3a6ZNw
	PZqA==
X-Gm-Message-State: AIVw111EzPZl7vgkX0Tg308HQ4Ba2IDIULoR6/+jwY6z8n3oPewKPEw8
	WeQaMZth+mpl3nTu
X-Received: by 10.99.166.17 with SMTP id t17mr558150pge.60.1500478906030;
	Wed, 19 Jul 2017 08:41:46 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	b85sm494845pfe.94.2017.07.19.08.41.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Jul 2017 08:41:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Jul 2017 08:41:29 -0700
Message-Id: <20170719154132.20556-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
Subject: [meta-networking][PATCH 1/4] ippool: Fix build errors found with hardening flags
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Jul 2017 15:41:45 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...timer-Check-for-return-value-of-write-API.patch | 28 ++++++++++++++++++++++
 .../recipes-daemons/ippool/ippool_1.3.bb           | 22 ++++++++---------
 2 files changed, 39 insertions(+), 11 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/ippool/ippool/0001-usl_timer-Check-for-return-value-of-write-API.patch

diff --git a/meta-networking/recipes-daemons/ippool/ippool/0001-usl_timer-Check-for-return-value-of-write-API.patch b/meta-networking/recipes-daemons/ippool/ippool/0001-usl_timer-Check-for-return-value-of-write-API.patch
new file mode 100644
index 000000000..6fb7cc5c4
--- /dev/null
+++ b/meta-networking/recipes-daemons/ippool/ippool/0001-usl_timer-Check-for-return-value-of-write-API.patch
@@ -0,0 +1,28 @@
+From 5d7f20c045b3c74dad2c53d65e30bd4840250082 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 27 Jun 2017 15:17:19 -0700
+Subject: [PATCH] usl_timer: Check for return value of write() API
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ usl/usl_timer.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/usl/usl_timer.c b/usl/usl_timer.c
+index fda752b..d8414a6 100644
+--- a/usl/usl_timer.c
++++ b/usl/usl_timer.c
+@@ -94,7 +94,9 @@ void usl_timer_tick(void)
+ 
+ 	if (!usl_tick_pending) {
+ 		usl_tick_pending = 1;
+-		write(usl_tick_pipe[1], &msg, sizeof(msg));
++		if (write(usl_tick_pipe[1], &msg, sizeof(msg)) != sizeof(msg)) {
++			fprintf(stderr, "write to fd %i failed: %s\n", usl_tick_pipe[1], strerror(errno));
++		}
+ 	}
+ }
+ 
+-- 
+2.13.2
+
diff --git a/meta-networking/recipes-daemons/ippool/ippool_1.3.bb b/meta-networking/recipes-daemons/ippool/ippool_1.3.bb
index 969f434cc..e1c9215ca 100644
--- a/meta-networking/recipes-daemons/ippool/ippool_1.3.bb
+++ b/meta-networking/recipes-daemons/ippool/ippool_1.3.bb
@@ -11,16 +11,16 @@ HOMEPAGE = "http://www.openl2tp.org/"
 SECTION = "console/network"
 LICENSE = "GPLv2+"
 
-SRC_URI = "\
-        https://sourceforge.net/projects/openl2tp/files/${BPN}/${PV}/${BPN}-${PV}.tar.gz \
-        file://ippool_usl_timer.patch \
-        file://ippool_parallel_make_and_pic.patch \
-        file://ippool_init.d.patch \
-        file://always_syslog.patch \
-        file://makefile-add-ldflags.patch \
-        file://runtest.sh \
-        file://ippool.service \
-        "
+SRC_URI = "https://sourceforge.net/projects/openl2tp/files/${BPN}/${PV}/${BPN}-${PV}.tar.gz \
+           file://runtest.sh \
+           file://ippool.service \
+           file://ippool_usl_timer.patch \
+           file://ippool_parallel_make_and_pic.patch \
+           file://ippool_init.d.patch \
+           file://always_syslog.patch \
+           file://makefile-add-ldflags.patch \
+           file://0001-usl_timer-Check-for-return-value-of-write-API.patch \
+           "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4c59283b82fc2b166455e0fc23c71c6f"
 SRC_URI[md5sum] = "e2401e65db26a3764585b97212888fae"
@@ -50,7 +50,7 @@ do_compile_prepend() {
 
     # ignore the OPT_CFLAGS?= in Makefile,
     # it should be in CFLAGS from env
-    export OPT_CFLAGS=
+    export OPT_CFLAGS="${SELECTED_OPTIMIZATION}"
 }
 
 
-- 
2.13.3


