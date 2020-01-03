Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
	[209.85.210.176])
	by mail.openembedded.org (Postfix) with ESMTP id 60E3D7F962
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jan 2020 02:49:38 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id q10so22907748pfs.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jan 2020 18:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=dzftl5zKVA5JnxV7c0X1FbgnajS6Flp4W1wVZXT/wFU=;
	b=Jx1knZjMcjEHnSZxngRJ23DUKz33Sao0aOGesqESA/kmxUBq+XT2X95BQGX0POvd4y
	jwyzDXd36gxdVLyAd50BVoNXiXCh0adP8nuBbUBy6k54bkXQvhykNgrSMxLMxIIrg3J1
	yMgvrEdIucpXU1wPOMuj3WHwm2OsYY4yz6HVtBVqBiSd0dtsXUcoBTz2qI/WV3QEuGm5
	aZVlZFV3rQPFXuZdvriWfHuublULzpzRPOO3eL3o4GIstTKcn6Ak1HAzemrWUTq5+fEg
	+s6BqSRodQbm1Iy5ahs5qDmarZgw6v/BobEPafc78PYXBqOw9NnL0Ydv0h1zM3B2LAf0
	4fgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=dzftl5zKVA5JnxV7c0X1FbgnajS6Flp4W1wVZXT/wFU=;
	b=BsrKB78Z0DumjKkv8VQfzAG/LXhvcROCENEKo/ySMb6Pkb76JGtSWrSuAx5bXPs6OL
	bAn0hdZdw6vvGH2BMIKVyLq7wuyLqktG2+vMhyIVOsAoMeyWsgZzCgthpOjaoACgARFJ
	MLQjbAgs45EVxYhZZRft5q6Vlg8oSIPY6QTkQzXjf/Qk3VrgMIQDp5QXdrffHryG6+1W
	7I7ngdGekfzSOS2P3D8TctrnguynMDCU3Fqk3n+GSYmlKULVzxf8Zm+d80nK2kERLOJj
	Dm9G3O4cfn640Uxxq3za0K1pO1Ib7l5+mWHZl7gWKP2hwT9hhkdft3D2guvjohtDcpt0
	6M2w==
X-Gm-Message-State: APjAAAVaNyk5j1ascZkrE6VpcuF4ap4dUSMA7whpb/Sd31Qi7xYjvPxi
	gQcoCLfYqCDPTHbOXIV/0oLNCi3LiuA=
X-Google-Smtp-Source: APXvYqz/VT5XpPQ7VgjJhC2WB+QRsWmj9XeVFdyhTZPLjGRkNPGPVh/5R3072rGDoEiOCAQFDn4Rqg==
X-Received: by 2002:a63:b64a:: with SMTP id v10mr95667064pgt.145.1578019779234;
	Thu, 02 Jan 2020 18:49:39 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:555:ddff:6770:148b])
	by smtp.gmail.com with ESMTPSA id
	p5sm61306640pga.69.2020.01.02.18.49.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 02 Jan 2020 18:49:38 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Jan 2020 18:49:06 -0800
Message-Id: <5db8389377a707604fba5aa526765d1c719d9af1.1578019547.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578019547.git.akuster808@gmail.com>
References: <cover.1578019547.git.akuster808@gmail.com>
Subject: [zeus 09/17] lirc: Fix build for 32bit arches with 64bit time_t
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
X-List-Received-Date: Fri, 03 Jan 2020 02:49:38 -0000

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 049a2a371fd29e61a4ae1a79a6bd4064f12120dd)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...ld-on-32bit-arches-with-64bit-time_t.patch | 40 +++++++++++++++++++
 .../recipes-connectivity/lirc/lirc_0.9.4d.bb  |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/lirc/lirc/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch

diff --git a/meta-oe/recipes-connectivity/lirc/lirc/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch b/meta-oe/recipes-connectivity/lirc/lirc/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
new file mode 100644
index 00000000000..0e38f7d8ece
--- /dev/null
+++ b/meta-oe/recipes-connectivity/lirc/lirc/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
@@ -0,0 +1,40 @@
+From 50a48a7bd8d65a165ce2aac4ba0c1e02bded04aa Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 30 Nov 2019 12:21:31 -0800
+Subject: [PATCH] Fix build on 32bit arches with 64bit time_t
+
+time element is deprecated on new input_event structure in kernel's
+input.h [1]
+
+[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=152194fe9c3f
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ plugins/devinput.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/plugins/devinput.c b/plugins/devinput.c
+index d4d733a..feb4a61 100644
+--- a/plugins/devinput.c
++++ b/plugins/devinput.c
+@@ -34,6 +34,11 @@
+ #include <linux/uinput.h>
+ #include <sys/stat.h>
+ 
++#ifndef input_event_sec
++#define input_event_sec time.tv_sec
++#define input_event_usec time.tv_usec
++#endif
++
+ #ifndef EV_SYN
+ /* previous name */
+ #define EV_SYN EV_RST
+@@ -459,7 +464,7 @@ char* devinput_rec(struct ir_remote* remotes)
+ 		return 0;
+ 	}
+ 
+-	log_trace("time %ld.%06ld  type %d  code %d  value %d", event.time.tv_sec, event.time.tv_usec, event.type,
++	log_trace("time %ld.%06ld  type %d  code %d  value %d", event.input_event_sec, event.input_event_usec, event.type,
+ 		  event.code, event.value);
+ 
+ 	value = (unsigned)event.value;
diff --git a/meta-oe/recipes-connectivity/lirc/lirc_0.9.4d.bb b/meta-oe/recipes-connectivity/lirc/lirc_0.9.4d.bb
index b13163debb6..606caee8928 100644
--- a/meta-oe/recipes-connectivity/lirc/lirc_0.9.4d.bb
+++ b/meta-oe/recipes-connectivity/lirc/lirc_0.9.4d.bb
@@ -13,6 +13,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "http://prdownloads.sourceforge.net/lirc/lirc-${PV}.tar.bz2 \
     file://pollfd.patch \
+    file://0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch \
     file://lircd.service \
     file://lircd.init \
     file://lircexec.init \
-- 
2.17.1


