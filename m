Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id EFF716FFD8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jan 2016 05:03:16 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id x1so83315306qkc.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jan 2016 21:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gOWZPsMLLP97oRI+rHnb8gu0QbMZH9pmaxkMsUJB3Kg=;
	b=ECB/KI/SKZNeno3yQdXdwsGDPRYYnrUVjC79tOm/Cckz8GOpTyfm7RizMtyC9xQqQw
	Z3IeihdECFMjxIvRERB7pRrXDa5Kx/MI8y5rofLw1Al77uhTAGaeO2IhAsoS7lfLdgas
	6/7Vp9XOm+Kx7lwRqSwFcHorv855dKux1nmqs6sRN858BVYCYaxC0RWKUD1P1nqwSwQO
	WJWlUb616KBzF2MlYNRIaVLDwmqEsNUVM4xrwXJATSsOV8DKxQcru8gWO0l1cY7UoMym
	swDRRlQEApTe0NFDgN/saJl8L08tbZJfeaiOH4IrSaA+uMqpxopvlsyByPmQ+tznJbCm
	wdNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=gOWZPsMLLP97oRI+rHnb8gu0QbMZH9pmaxkMsUJB3Kg=;
	b=nEsV9Q7bzugZOyI8IyvtV6QT9jrsYnCVDrvwwRCNDi+5Wy40Ff6oYjnVfNUI+ooaZH
	v8szj2CLC9K4IrKBmLG3xXEDTgJPxOSHwcM4qUKI9EcXKJW61b9Cqrv8BEIXzbvQ0ht6
	7koaWLDalxu2bYbeLA2km/ntIIN6XR05SAKta6BupJztELW8VGbzJ8r3zolNFaNAwPsj
	btzXt1Jdh19r9AX4kFXjT1N/srnBZ1zvCSAhHhbxm3cgwVhN2MkPrFnyLd5nyOH89HEz
	5DIMLnoZPS/86C3SaytmSKBlqRSAXT7FmoHxcHKkuUqrXqqI3I+V52HlXsW+WXHTYVHK
	zz7A==
X-Gm-Message-State: AG10YORtkDiv00QxChcqi0KIGuBsxMNqOUsBcCS7OWOKxhpIMnezrlsRE+y3UHccduv2Kw==
X-Received: by 10.55.17.22 with SMTP id b22mr18390053qkh.75.1453266197110;
	Tue, 19 Jan 2016 21:03:17 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	c2sm13720662qkb.41.2016.01.19.21.03.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Jan 2016 21:03:16 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Jan 2016 05:03:09 +0000
Message-Id: <1453266190-95648-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1453266190-95648-1-git-send-email-raj.khem@gmail.com>
References: <1453266190-95648-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/3] fbset: Fix out of tree builds ( S != B )
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
X-List-Received-Date: Wed, 20 Jan 2016 05:03:17 -0000

Remove assumption about glibc == linux

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ding-asm-types.h-is-needed-on-all-linux-s.patch | 34 ++++++++++++++++++++++
 meta-oe/recipes-support/fbset/fbset_2.1.bb         |  9 +++---
 2 files changed, 39 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-support/fbset/fbset/0001-fbset-including-asm-types.h-is-needed-on-all-linux-s.patch

diff --git a/meta-oe/recipes-support/fbset/fbset/0001-fbset-including-asm-types.h-is-needed-on-all-linux-s.patch b/meta-oe/recipes-support/fbset/fbset/0001-fbset-including-asm-types.h-is-needed-on-all-linux-s.patch
new file mode 100644
index 0000000..7f45dbe
--- /dev/null
+++ b/meta-oe/recipes-support/fbset/fbset/0001-fbset-including-asm-types.h-is-needed-on-all-linux-s.patch
@@ -0,0 +1,34 @@
+From 06edd88833da93361d5408b880fbb890df332497 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 19 Jan 2016 01:55:47 +0000
+Subject: [PATCH] fbset: including asm/types.h is needed on all linux systems
+
+including asm/types.h is needed to get Linux typedef's like
+__s32 and so on which are independent of C library therefore this
+define should not be guarded by __GLIBC__ but by __linux__
+
+Helps to compile it on musl systems
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ fbset.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/fbset.h b/fbset.h
+index 9b1d2ac..0d8def8 100644
+--- a/fbset.h
++++ b/fbset.h
+@@ -15,7 +15,7 @@
+ #include <stdio.h>
+ #include <sys/types.h>
+ 
+-#ifdef __GLIBC__
++#ifdef __linux__
+ #include <asm/types.h>
+ #endif
+ 
+-- 
+2.7.0
+
diff --git a/meta-oe/recipes-support/fbset/fbset_2.1.bb b/meta-oe/recipes-support/fbset/fbset_2.1.bb
index 1855932..ce49019 100644
--- a/meta-oe/recipes-support/fbset/fbset_2.1.bb
+++ b/meta-oe/recipes-support/fbset/fbset_2.1.bb
@@ -16,15 +16,16 @@ PR = "r4"
 SRC_URI = "http://ftp.debian.org/debian/pool/main/f/fbset/fbset_2.1.orig.tar.gz \
            file://makefile.patch \
            file://fbset-2.1-fix-makefile-dep.patch \
-"
+           file://0001-fbset-including-asm-types.h-is-needed-on-all-linux-s.patch \
+           "
 
 inherit update-alternatives
 
 do_install() {
     install -d ${D}${sbindir} ${D}${datadir}/man/man8 ${D}${datadir}/man/man5
-    install -m 0755 ${WORKDIR}/${BP}/fbset ${D}${sbindir}/fbset.real
-    install -m 0644 ${WORKDIR}/${BP}/*.5 ${D}${datadir}/man/man5
-    install -m 0644 ${WORKDIR}/${BP}/*.8 ${D}${datadir}/man/man8
+    install -m 0755 ${B}/fbset ${D}${sbindir}/fbset.real
+    install -m 0644 ${B}/*.5 ${D}${datadir}/man/man5
+    install -m 0644 ${B}/*.8 ${D}${datadir}/man/man8
 }
 
 ALTERNATIVE_fbset = "fbset"
-- 
2.7.0


