Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id E676471C59
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Oct 2016 05:38:48 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id i85so1426801pfa.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2016 22:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1JW6T++JsU4fB9dgUJ3NwOrWuKMRZQ8tI4jAhdd3wYI=;
	b=JjJWiIMiQcKM6jwWpUcq2LBvgBG8wsQahQR4dcWRSbWmWqWrzw4VHXOvt4q76q4Yry
	arkLgCCM6Cg6UylmGqbnaN8HXVE03R5Nbss43NQo5S3pQU8CaGA+r+eXoCldcIUvZewM
	kx599qXQiSymBq6QywsD4ZixkbInxt9vflWzBghtjUZ3awgzfEpcehMJkVc++fVafaEc
	jgDavLRlC9AxbpWv2Mfh+RJx+pk9uxZVNFxa0lfenahGvUwMuIbcNErAD8F+AkinPTW/
	5hwkmVOb0wOn2wADDwttjePCka/5MN3/PkNGee8VCNoAdDZxk+EqbYtqOuPJrmJRpCyh
	mnRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1JW6T++JsU4fB9dgUJ3NwOrWuKMRZQ8tI4jAhdd3wYI=;
	b=Ab6oblxl8eeZH+JrIt3vC/JZPHcj4o1ix+ueg0tPKFMkYJUCmHcGUj6O1fm3V2OcRV
	3vcRDEuoLDthNmAuiX/XxJ4l0KPVBGzgp53bYMRA5fVEqPbi7rW5QdesoTM3AbATVZlF
	ynlTY790K4bKLV8KCfxdyz2k66fW3jvyFYo3L2QBawEtsC9yZPx1CZlQkBXB+SwHBE9X
	w1HUAZN65jJvYS0INqrSiMUp8kxcXmFFB4vMWqQudSseWGEfRK4m/MVT3hbGxRUUH1T3
	+GPi2UU12gjbj5ptzf77U4wQag9VqZ2mwmkHuwp12ZIihPJ7P38haFbJ+n+q6dXPmq7D
	WkZg==
X-Gm-Message-State: AA6/9RmSMToGmXQctEiKgy425RMgN/o1/dAplv9UaAAa147FoSh8MJTffpEQj5LbZmDrLg==
X-Received: by 10.98.67.133 with SMTP id l5mr7744130pfi.170.1476855530666;
	Tue, 18 Oct 2016 22:38:50 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	qd12sm60099564pab.22.2016.10.18.22.38.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Oct 2016 22:38:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Oct 2016 22:38:29 -0700
Message-Id: <20161019053834.11523-11-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.0
In-Reply-To: <20161019053834.11523-1-raj.khem@gmail.com>
References: <20161019053834.11523-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 11/16] openl2tp: Fix build with clang
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
X-List-Received-Date: Wed, 19 Oct 2016 05:38:49 -0000

Fix a typo in compile cmdline specified via
EXTRA_OECMAKE

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-test-pppd_dummy.c-Fix-return-value.patch  | 38 ++++++++++++++++++++++
 .../recipes-protocols/openl2tp/openl2tp_1.8.bb     |  5 +--
 2 files changed, 41 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-protocols/openl2tp/openl2tp/0001-test-pppd_dummy.c-Fix-return-value.patch

diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp/0001-test-pppd_dummy.c-Fix-return-value.patch b/meta-networking/recipes-protocols/openl2tp/openl2tp/0001-test-pppd_dummy.c-Fix-return-value.patch
new file mode 100644
index 0000000..1f576fa
--- /dev/null
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp/0001-test-pppd_dummy.c-Fix-return-value.patch
@@ -0,0 +1,38 @@
+From ce5f5563ab54db9d28dba44a0e25e8a8c7bb9876 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 19 Oct 2016 00:34:35 +0000
+Subject: [PATCH] test/pppd_dummy.c: Fix return value
+
+pause() is defined in unistd.h, clang does not
+like the fact that we are using a function without
+declaration
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ test/pppd_dummy.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/test/pppd_dummy.c b/test/pppd_dummy.c
+index 148e7d2..b564c36 100644
+--- a/test/pppd_dummy.c
++++ b/test/pppd_dummy.c
+@@ -26,6 +26,7 @@
+ #include <sys/types.h>
+ #include <sys/wait.h>
+ #include <syslog.h>
++#include <unistd.h>
+ 
+ #define PPPD_DUMMY_TMP_FILE	"/tmp/pppd_dummy"
+ 
+@@ -40,7 +41,7 @@ int main(int argc, char **argv)
+ 	
+ 	if (file == NULL) {
+ 		syslog(LOG_ERR, "Failed to open %s\n", filename);
+-		return;
++		return -1;
+ 	}
+ 
+ 	for (arg = 1; arg < argc; arg++) {
+-- 
+1.9.1
+
diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
index 270472e..5a63404 100644
--- a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
@@ -15,14 +15,15 @@ SRC_URI = "http://ftp.jaist.ac.jp/pub/sourceforge/o/op/${PN}/${PN}/${PV}/${BP}.t
            file://Makefile-modify-CFLAGS-to-aviod-build-error.patch \
            file://openl2tp-simplify-gcc-warning-hack.patch \
            file://Makefile-obey-LDFLAGS.patch \
-          "
+           file://0001-test-pppd_dummy.c-Fix-return-value.patch \
+           "
 SRC_URI[md5sum] = "e3d08dedfb9e6a9a1e24f6766f6dadd0"
 SRC_URI[sha256sum] = "1c97704d4b963a87fbc0e741668d4530933991515ae9ab0dffd11b5444f4860f"
 
 inherit autotools-brokensep pkgconfig
 
 PARALLEL_MAKE = ""
-EXTRA_OEMAKE = 'CFLAGS="${CFLAGS} -Wno-nused-but-set-variable"'
+EXTRA_OEMAKE = 'CFLAGS="${CFLAGS} -Wno-unused-but-set-variable"'
 
 do_compile_prepend() {
     sed -i -e "s:SYS_LIBDIR=.*:SYS_LIBDIR=${libdir}:g" \
-- 
2.10.0


