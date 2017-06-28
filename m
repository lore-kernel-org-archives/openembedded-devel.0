Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id F0B847807A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jun 2017 02:08:56 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id u62so6332936pgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jun 2017 19:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=p+k9Wz2mloZHGrm3HK4ihTe2VcdDNQ5fis/1wcxwkuk=;
	b=OluyuyUvobw5j5Orvk1yIPqoj1nyHma4fFYzK86C9f+s/jxf1BTiTurYl19CBuH99B
	7C4POlQIdXHYjkHyTQuAzcFeTNuWDF5ZnCDZZYshgppjnhu62u4YC8S7MW7by6HLdey4
	KIhAduJLnyo7ewpOWqzYW/NHsm7L6wziGTrp9yAyueV08yli4+Ez9wOpTNqAQI+NJMZ1
	hN9DcbSIJOz/P0qDk87MuXjiPLxW6u0ePMK57ys1k8Qi+RyH0BcmHjIR4KVoRPXq0khB
	4asui18Gg+1pp27BKkxI12XEYc4wwCfQrPxU9IaBQst4V6BiDKblaBwub+SIYy4x0gBP
	gVGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=p+k9Wz2mloZHGrm3HK4ihTe2VcdDNQ5fis/1wcxwkuk=;
	b=Nr9Y+cAi7bwUuBzHnnTuZdiYunlN191PPHHJfpXcZwI6Po+KFYqiLVTmhpdycKhfY2
	Lz9/vKQsoBsM0nzX2pSMhlp0awE5/Ov1vUFnzNt4Ei0nOZZfYV1PewQeBIMJ0QKDr15k
	L4eLEAc65E3tl2TOIjH3b5c9yzUgvDRTAnZZj0WX89yYvgFjRg4Ci4OVGEycTDnXCw3q
	i4VopsXOnT09/WUbO4tD08eoLXOIj5iP7SFVSlWqCswec61MF89WMYoi6KkHVNP9x+xC
	L1HIHKLKHD6xfKNPVLghTd+VcipWBpzeohKRyOpOArQ5EjoLoVWIBdJR96WftHHVsvCZ
	Bb2g==
X-Gm-Message-State: AKS2vOwoNAqDZjJ9pFKqAK72dqD2dntQWmKJjVXIqKDziDYUNrWU14R5
	qqYMxngIHLLiLx/r
X-Received: by 10.84.232.77 with SMTP id f13mr8831239pln.172.1498615737749;
	Tue, 27 Jun 2017 19:08:57 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id b8sm1003591pfd.65.2017.06.27.19.08.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Jun 2017 19:08:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Jun 2017 19:08:18 -0700
Message-Id: <20170628020819.17047-12-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170628020819.17047-1-raj.khem@gmail.com>
References: <20170628020819.17047-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 12/13] ippool: Fix build errors found with hardening flags
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
X-List-Received-Date: Wed, 28 Jun 2017 02:08:57 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
2.13.2


