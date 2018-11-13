Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id 830A06C1FD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Nov 2018 09:55:37 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id f10-v6so11198797wme.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Nov 2018 01:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=SJo+6ZHIqsYVEsgXt+Uak+ebjbpTEE2C/YcN8ErZQ0c=;
	b=EsJ9RVu6USlKGr1kVk7PxlNS6xm4mS9yHCkH3I6istlRLwyvof7lk/Od7AfhM6z4GX
	H+spGuUOsiB5vQX78fMoT+kaSq5U1ZvPdgMKaTQQRV7hJFzAEnl09Gvds7aP/vE6bTRb
	GVm9Nk+N9auCQRmf2zHf4slws2SAc8QXownbdNbvq5GChuSTjYKGpBUNPCBwDtAhxWsh
	iD58OU1134TNPLXW8QTh19l+1JeIBLVkTpGhIJ9utVOp95L7kyYIYTKWmTmp2MPAoCeX
	6EByzCrcRsawG4SWKUpU/Pg8ZPLc82jrmZpWQhOX39a7xo6t3ntb9qLz12iwtykCwJv6
	zheg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=SJo+6ZHIqsYVEsgXt+Uak+ebjbpTEE2C/YcN8ErZQ0c=;
	b=N4dU372BDzXlcPDxMQ4Vdb1ixxAKXkobJibZRNCaY8a9tnUCebVPk2VGbY0Eji25Ye
	aysCSIz+vh1kNQ1wGBFALyNcOfbeeRf0f79oGT9GeDZtnn2cDFW/ngnhd0ovi4PUlJfs
	afbJdLAjuFHKolmNA+A7lCFilu7R/zExnzx7gNngXnGsAqkOSNiDUI6DRNzQdSpprQ0k
	GZDpl3L5XV6cwtvZluJU18UEHMF2ntMaic5At12VjAO+BrmHNI7BxD3TryGA1mbwgCTg
	pWBAMEXe4KahQkwiMM1npZ8QqzcmnxK4q28YWfHnd39KvH29VvRhPTvohl/LEB2cVCb2
	DP/w==
X-Gm-Message-State: AGRZ1gJT0CcOAF8e2iScIV0AQYp/bhWUKlGb623qjySpXEBwqGMep7eo
	J0umBGRk3zxjaUUUCK1BVQbbQjQI
X-Google-Smtp-Source: AJdET5eK6uVYAcF/PxmOQoF+Lj0XNgo6PLzaoyYVHA7Uv/Ft7pl5Hj0Qj4Jci8HL+v/ZEtLdi3/oLQ==
X-Received: by 2002:a7b:c052:: with SMTP id
	u18-v6mr2582516wmc.29.1542102938046; 
	Tue, 13 Nov 2018 01:55:38 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	o126-v6sm9006102wmo.3.2018.11.13.01.55.37
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 13 Nov 2018 01:55:37 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Nov 2018 09:55:35 +0000
Message-Id: <20181113095536.7256-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CA+chaQe-odXPBtfwRY3-SVJkexAa2WzyekTe-4w4z8tPPNAuEw@mail.gmail.com>
References: <CA+chaQe-odXPBtfwRY3-SVJkexAa2WzyekTe-4w4z8tPPNAuEw@mail.gmail.com>
Subject: [PATCH][meta-oe 1/2] xscreensaver: fix indentation and use BPN/BP in SRC_URI
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
X-List-Received-Date: Tue, 13 Nov 2018 09:55:37 -0000

---
 .../xscreensaver/xscreensaver_5.39.bb                | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.39.bb b/meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.39.bb
index e7f97b61a4..0a884e98b4 100644
--- a/meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.39.bb
+++ b/meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.39.bb
@@ -1,15 +1,17 @@
 SUMMARY = "X screen saver and locker"
+
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://driver/xscreensaver.h;endline=10;md5=e141ab5822fb2d43694e1e47b59fc0df"
-SRC_URI = "https://www.jwz.org/xscreensaver/xscreensaver-${PV}.tar.gz"
+
+SRC_URI = "https://www.jwz.org/${BPN}/${BP}.tar.gz"
 SRC_URI[md5sum] = "a5da62b91271f4e8afcc73d44697364b"
 SRC_URI[sha256sum] = "48ce1880f18b5321182be0c033aeceb5ec5628a1505b9d1ff69dbf06093c2426"
 
 SRC_URI += " \
-	file://xscreensaver.service \
-	file://fix-buildscripts.patch \
-	file://tweak-app-defaults.patch \
-	"
+    file://xscreensaver.service \
+    file://fix-buildscripts.patch \
+    file://tweak-app-defaults.patch \
+"
 
 DEPENDS = "intltool-native libx11 libxext libxt libxft glib-2.0-native bc-native"
 # These are only needed as part of the stopgap screensaver implementation:
-- 
2.17.1


