Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f172.google.com (mail-we0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id 619096B8F6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Sep 2014 02:13:52 +0000 (UTC)
Received: by mail-we0-f172.google.com with SMTP id q58so5244766wes.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Sep 2014 19:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ED7lCoQPSNLOENHYuxDgu4NY44GQXS8XVlq+hS9zAv4=;
	b=FG6Kg2sGS0qeO4vAqvOlreovckjFjzKw/LO7/Si87ENODWSIItaDcvKIkmZKrnHqai
	v5jM5QsJ5osoUHVwxhO8OnS7DuEeQbhSdXRfD/9VuZQdMhcoIpWqe5VCqsO8JakVpHlx
	QWHjNgLcK5a2gW51fSPn3/Cc0pwjfQLKF/eI8fECSpT0Dt2NJs3Wh1m+nG4720trh214
	kMqzInOG+1bLR7ZbSAeW8dKeuZM6+1qIzkGabNW3FeQqTW7Eg2R314cOTdZ2Wv2OZbLZ
	Z9MQy7yyntpWZPUNJVZQ4S/fivSP3y48xEPe9wv3yITnX7vB7OJ2noCCUNZOfgWOCj+q
	fwPg==
X-Received: by 10.194.142.209 with SMTP id ry17mr50215462wjb.57.1412043233292; 
	Mon, 29 Sep 2014 19:13:53 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ew1sm17524579wjb.31.2014.09.29.19.13.52 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Sep 2014 19:13:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Sep 2014 04:14:44 +0200
Message-Id: <1412043284-19901-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.1.1
Subject: [meta-multimedia][PATCH] libmpd: fix build with glibc-2.20
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Sep 2014 02:14:02 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-multimedia/musicpd/libmpd-11.8.17/glibc-2.20.patch | 10 ++++++++++
 meta-multimedia/recipes-multimedia/musicpd/libmpd_11.8.17.bb   |  4 +++-
 2 files changed, 13 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-multimedia/musicpd/libmpd-11.8.17/glibc-2.20.patch

diff --git a/meta-multimedia/recipes-multimedia/musicpd/libmpd-11.8.17/glibc-2.20.patch b/meta-multimedia/recipes-multimedia/musicpd/libmpd-11.8.17/glibc-2.20.patch
new file mode 100644
index 0000000..4a2b25c
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/musicpd/libmpd-11.8.17/glibc-2.20.patch
@@ -0,0 +1,10 @@
+--- libmpd-11.8.17/src/libmpd-internal.h.orig	2014-09-30 04:08:50.963292427 +0200
++++ libmpd-11.8.17/src/libmpd-internal.h	2014-09-30 04:08:30.595292223 +0200
+@@ -21,6 +21,7 @@
+ #define __MPD_INTERNAL_LIB_
+ 
+ #include "libmpdclient.h"
++#include "config.h"
+ struct _MpdData_real;
+ 
+ typedef struct _MpdData_real {
diff --git a/meta-multimedia/recipes-multimedia/musicpd/libmpd_11.8.17.bb b/meta-multimedia/recipes-multimedia/musicpd/libmpd_11.8.17.bb
index 8327b75..54d7910 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/libmpd_11.8.17.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/libmpd_11.8.17.bb
@@ -4,7 +4,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 HOMEPAGE ="http://sourceforge.net/projects/musicpd"
 DEPENDS = "glib-2.0"
 
-SRC_URI = "http://www.musicpd.org/download/${BPN}/${PV}/${BP}.tar.gz"
+SRC_URI = "http://www.musicpd.org/download/${BPN}/${PV}/${BP}.tar.gz \
+    file://glibc-2.20.patch \
+"
 SRC_URI[md5sum] = "5ae3d87467d52aef3345407adb0a2488"
 SRC_URI[sha256sum] = "fe20326b0d10641f71c4673fae637bf9222a96e1712f71f170fca2fc34bf7a83"
 
-- 
2.1.1


