Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id 7F5246BE2A
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 Dec 2019 18:46:36 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id q127so305526pga.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Dec 2019 10:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=gpmGgSZId9grtLS1rkVkOIcYrBthBHRDUMoiIcuZOvs=;
	b=SCNuMRRR2TRltqIUUuXq+NGRAEC1u1Vz5AAmhb0hNH9UgBjhH3T+ENYWTrGMVzBASo
	f3EHdxfHRJ938eDuzmeneoswga6L0NelLnIy8bUnF87QdfMn/YHTnDdqFR234QkG4rof
	MjmyrmHeikpGg/3wVw0+54lUkge4vVsUl+oPd+d5B7uVw2IfDSOBfGVEDvElvvdc/AoR
	RcDjOaVH6HKrkJefiUXwmHkJlQfA4Uia0Ycj6nucK8txIS9NZm4Kx9RgtPlOmBxV3t5e
	Nea30og23rW0RaOIoFO1CT2mdUMvIx1wg6JxvEvzR41oYKsxaKUpAGac4P5QzI/m5Zar
	6hQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=gpmGgSZId9grtLS1rkVkOIcYrBthBHRDUMoiIcuZOvs=;
	b=lRR3TBCZHS3JdPMj9APDw1L5BCAJWtOBDk7EAhn8Y4Y1S19wPbBg937dHk3hONqDOy
	ZXPZtC6RE9/8LnKmOecAtYvdl0jfSjnK+4+pOi0hdqDTUCHmvUTQFiqkJZbz/31SqN1/
	vHOJjldDy3n9StfScBDrVT57rmzZo9agxGwk+NHvmxMdh0W6Zcs76lqciOuk1giSZjny
	Ll6QOvw1alrTw0wbaWdvssGEjjLZpOASZ0sJdToOpigRk9/EprtYjSjrh/eBIhRE9cHk
	ZoLy1JaUELzi7RZWFgRfwYFuYimrkpdQLXMa0KTH62ZBULGiZCCDi64hfgi9AESgrjxE
	0YLg==
X-Gm-Message-State: APjAAAW7Tc0lbqXuyZVBxMPFj9WHRWz1SLqRf1t20qBl9F4VVgWDzYD7
	XMuhlthrNNDq+oxjubq707YJ2Am/pfk=
X-Google-Smtp-Source: APXvYqxsKwbYzREkOmMy2JqKWp63lU9zK8Y19Rx/umj4KuNKdLa3qmAGwF8pct1AslmxCqCgQFym4w==
X-Received: by 2002:a62:e105:: with SMTP id q5mr67909070pfh.105.1575225997081; 
	Sun, 01 Dec 2019 10:46:37 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8500:1c20:55f2:e19b:8d5e:a884])
	by smtp.gmail.com with ESMTPSA id
	y24sm33916800pfr.116.2019.12.01.10.46.36
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 01 Dec 2019 10:46:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  1 Dec 2019 10:46:17 -0800
Message-Id: <20191201184622.889513-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191201184622.889513-1-raj.khem@gmail.com>
References: <20191201184622.889513-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 4/9] lirc: Fix build for 32bit arches with 64bit time_t
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
X-List-Received-Date: Sun, 01 Dec 2019 18:46:36 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ld-on-32bit-arches-with-64bit-time_t.patch | 40 +++++++++++++++++++
 .../recipes-connectivity/lirc/lirc_0.9.4d.bb  |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/lirc/lirc/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch

diff --git a/meta-oe/recipes-connectivity/lirc/lirc/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch b/meta-oe/recipes-connectivity/lirc/lirc/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
new file mode 100644
index 0000000000..0e38f7d8ec
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
index b13163debb..606caee892 100644
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
2.24.0


