Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id D9FEE77FF5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jul 2017 03:10:38 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id d193so1050558pgc.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jul 2017 20:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=H0SUr4jv91IdlYRoVQ6IYHueSlKrMcnTebY/9rGFyE0=;
	b=qsAD98Fs+mATNeekfAZDnSA8JcW4BL7GmBvwsRbARhKg+rM5JrN4gmEN5mm4FluBKt
	Lwtwi2SabY6GMKKgahXpbZ8BzkG2qM/7LDgcFJ8MHqc3CAveq1eGHcrwm3pMJo6LgPkn
	BpJmXJ6Q8YDq631Zq9tG+3N6edp7IZLpB8zvA4YsFgM6TVZlkFq0WR/7KDb4H5DL/LQI
	d2U0fw3QThsSwkWh9OfzXmh2cbp4bqF7mxzkhfwafVQKEBKVuD2P9FmWF4nEjqZ7vGxH
	BggN7qkA64A0m+W3374uKbgGFHZtYxjLOX7eYFx5VV/WIyTn1FMvu8THyy5by4zjAf4Y
	+7gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=H0SUr4jv91IdlYRoVQ6IYHueSlKrMcnTebY/9rGFyE0=;
	b=ncmirqka17WoorN9N99BzP7C2mGR7uBqUJD3XtiDxDAo4YOeq1n207EDJH7Jfky/ll
	f/Qu/TFG2kAjycTcR1Nmi9cliTBmjg/uuT4fJ2NvC2rXICyBbHLmW6SFRAbf4wZZdC/R
	jDanAY75Fn10cdyPFNHTNWzKYM1yBCoP3mphPz5hBigFNDKi3+0MQULNe2HGfA0ERSj0
	+Ud0jMliWmx/43elodovGX/uFbT/w3L36sga09q8VZd55q58u2oazSQ/tYUdv5u80MV8
	PfSSEJNIV+xBUzCjMjrLy+Vu3BnBc6/tfgNpVuuk9Tpwc8iSd3WCzPPnQUGH0YWKAs7u
	rcuQ==
X-Gm-Message-State: AIVw111+42iSHTe8CpRXBZv7BgkpMFj7fC+B+Msnlm/LLB5Iji0C9iSa
	CPJJ/c/NadyAFzjf
X-Received: by 10.99.165.3 with SMTP id n3mr784296pgf.233.1500347439641;
	Mon, 17 Jul 2017 20:10:39 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	w85sm1086674pfj.115.2017.07.17.20.10.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Jul 2017 20:10:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Jul 2017 20:10:07 -0700
Message-Id: <20170718031013.44536-11-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170718031013.44536-1-raj.khem@gmail.com>
References: <20170718031013.44536-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 11/17] linuxptp: Upgrade to 1.8
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
X-List-Received-Date: Tue, 18 Jul 2017 03:10:39 -0000

Fix build on musl along way

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0003-include-missing-time.h-for-time_t.patch   | 26 ++++++++++++++++
 ...ude-header-sequence-to-avoid-duplicate-de.patch | 36 ++++++++++++++++++++++
 .../linuxptp/{linuxptp_1.6.bb => linuxptp_1.8.bb}  |  9 ++++--
 3 files changed, 68 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/linuxptp/linuxptp/0003-include-missing-time.h-for-time_t.patch
 create mode 100644 meta-oe/recipes-connectivity/linuxptp/linuxptp/0004-Adjust-include-header-sequence-to-avoid-duplicate-de.patch
 rename meta-oe/recipes-connectivity/linuxptp/{linuxptp_1.6.bb => linuxptp_1.8.bb} (66%)

diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp/0003-include-missing-time.h-for-time_t.patch b/meta-oe/recipes-connectivity/linuxptp/linuxptp/0003-include-missing-time.h-for-time_t.patch
new file mode 100644
index 000000000..96163f654
--- /dev/null
+++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp/0003-include-missing-time.h-for-time_t.patch
@@ -0,0 +1,26 @@
+From b36cafdbcbe2193f5b669e703c608e19e23f80a3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 15 Jul 2017 11:16:42 -0700
+Subject: [PATCH 3/4] include missing time.h for time_t
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ util.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/util.h b/util.h
+index e912f19..3c634c1 100644
+--- a/util.h
++++ b/util.h
+@@ -22,7 +22,7 @@
+ 
+ #include "ddt.h"
+ #include "ether.h"
+-
++#include <time.h>
+ /**
+  * Table of human readable strings, one for each port state.
+  */
+-- 
+2.13.3
+
diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp/0004-Adjust-include-header-sequence-to-avoid-duplicate-de.patch b/meta-oe/recipes-connectivity/linuxptp/linuxptp/0004-Adjust-include-header-sequence-to-avoid-duplicate-de.patch
new file mode 100644
index 000000000..e69927514
--- /dev/null
+++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp/0004-Adjust-include-header-sequence-to-avoid-duplicate-de.patch
@@ -0,0 +1,36 @@
+From 3cd28aa771934d9165ff0d7e19932cde65de3e52 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 15 Jul 2017 11:16:57 -0700
+Subject: [PATCH 4/4] Adjust include header sequence to avoid duplicate
+ definitions on musl
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ raw.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/raw.c b/raw.c
+index f51c829..494ea7f 100644
+--- a/raw.c
++++ b/raw.c
+@@ -18,8 +18,6 @@
+  */
+ #include <errno.h>
+ #include <fcntl.h>
+-#include <linux/filter.h>
+-#include <linux/if_ether.h>
+ #include <net/ethernet.h>
+ #include <net/if.h>
+ #include <netinet/in.h>
+@@ -32,6 +30,8 @@
+ #include <sys/types.h>
+ #include <unistd.h>
+ 
++#include <linux/filter.h>
++#include <linux/if_ether.h>
+ #include <linux/errqueue.h>
+ #include <linux/net_tstamp.h>
+ #include <linux/sockios.h>
+-- 
+2.13.3
+
diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp_1.6.bb b/meta-oe/recipes-connectivity/linuxptp/linuxptp_1.8.bb
similarity index 66%
rename from meta-oe/recipes-connectivity/linuxptp/linuxptp_1.6.bb
rename to meta-oe/recipes-connectivity/linuxptp/linuxptp_1.8.bb
index 2e28644f0..c7b8b2933 100644
--- a/meta-oe/recipes-connectivity/linuxptp/linuxptp_1.6.bb
+++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp_1.8.bb
@@ -4,10 +4,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "http://sourceforge.net/projects/linuxptp/files/v${PV}/linuxptp-${PV}.tgz \
            file://build-Allow-CC-and-prefix-to-be-overriden.patch \
-           file://no-incdefs-using-host-headers.patch"
+           file://no-incdefs-using-host-headers.patch \
+           file://0003-include-missing-time.h-for-time_t.patch \
+           file://0004-Adjust-include-header-sequence-to-avoid-duplicate-de.patch \
+           "
 
-SRC_URI[md5sum] = "6aa15d83f5a35f1fd076ba9adc4e7285"
-SRC_URI[sha256sum] = "e7fd16a9f235b059be527bd512e86f0c1d9f2e7c36736e6d6d9727a4427ac14c"
+SRC_URI[md5sum] = "5688cdfe57932273e1dbf35b3b97b9a0"
+SRC_URI[sha256sum] = "fa8e00f6ec73cefa7bb313dce7f60dfe5eb9e2bde3353594e9ac18edc93e5165"
 
 EXTRA_OEMAKE = "ARCH=${TARGET_ARCH} \
     EXTRA_CFLAGS='-D_GNU_SOURCE -DHAVE_CLOCK_ADJTIME -DHAVE_POSIX_SPAWN -DHAVE_ONESTEP_SYNC ${CFLAGS}'"
-- 
2.13.3


