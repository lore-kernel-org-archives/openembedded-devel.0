Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f54.google.com (mail-pl0-f54.google.com
	[209.85.160.54])
	by mail.openembedded.org (Postfix) with ESMTP id 4CAD5602D9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 08:17:56 +0000 (UTC)
Received: by mail-pl0-f54.google.com with SMTP id x6-v6so6601081plv.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 01:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=oUgAejVZycSDZ1vwqzuPBRZG62QIazq7MOm0nRUAUlw=;
	b=Oy7I5S4Au4LCEQ5W0tHhiE6mB586GZKBYDN7LP+baPwhrLoCmdonJvJO/XIceEiNRV
	OMntkxpVL7s7FjmpKtydrrdKXhfS6CJ1NcUvomXlS/jrq8hGrUgQfDgKP/HaoxBNVn35
	iF4ElMCipW9TwO1Z9qO1No/PpwYk14NIVtCQT594oZP+zfHg8H+eTpiNEqd/+PP7FUg5
	iGCFLXCqTB3s1iUcEjfbvOauzOj8DSl/ZEbjpJZ3L6+WdeJefhQBhjjnLBfm62si8PWI
	Wab047CfQ+CR4zhi9jhy3mty+uI3UTqrogHV66DR14aoT3+/HhQt7ZBEm1ioCKNRMqnH
	AX2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=oUgAejVZycSDZ1vwqzuPBRZG62QIazq7MOm0nRUAUlw=;
	b=HSniSHoYI673rxTDirwQzFQqf5m1At3GanA8LsP2ErmGIUaS6eqaGUukaUaz+373Vt
	nB/wBCAxDfW5PiQj2vwffINr2qXOJPef73vl9FxsELU3/hsxR2x4LjWo4Kh/Pl+CQ7Aw
	bBLOa/uyFJ8MqDuZlW9wr8MSs0Wc18KZUdkllAVzoti9M+z502DrFC+CfaJiu+27yqhk
	MAOa32TJOLWnKkjK4D7M/LcKjG9E4kuzCK8X2orvMX+xY5KGSEpCkA3tmgcZdyqQ2fQ1
	o4Cv833uGbSb1CZQ+lGkHjzNmFYBNeLL2bD7UjkyrOG5ufDM18YB6qKc+QbwXvHB3OC1
	lihw==
X-Gm-Message-State: AOUpUlH12x3rRkxC3xhgb21XHSCLZMStSa5ED9jAofASSBRkz4mf2YiF
	txatDMj0DWzKtfeSblrzm2tffI7T
X-Google-Smtp-Source: AA+uWPznwwIQE78s7Z+NIy6zVUMQBl1hPg9pNzEJeyO61vfulEEbH7V4AXqQHiuLidCx5EtGQTw5Hw==
X-Received: by 2002:a17:902:7c89:: with SMTP id
	y9-v6mr15676334pll.187.1534148276847; 
	Mon, 13 Aug 2018 01:17:56 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f217])
	by smtp.gmail.com with ESMTPSA id
	b64-v6sm23414971pfg.66.2018.08.13.01.17.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Aug 2018 01:17:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Aug 2018 01:17:26 -0700
Message-Id: <20180813081742.6961-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180813081742.6961-1-raj.khem@gmail.com>
References: <20180813081742.6961-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-xfce][PATCH 05/21] xfce4-diskperf-plugin: Fix build with glibc 2.28+
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
X-List-Received-Date: Mon, 13 Aug 2018 08:17:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...lude-sys-sysmacros.h-for-major-minor.patch | 30 +++++++++++++++++++
 .../diskperf/xfce4-diskperf-plugin_2.6.1.bb   |  3 ++
 2 files changed, 33 insertions(+)
 create mode 100644 meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin/0001-panel-plugin-Include-sys-sysmacros.h-for-major-minor.patch

diff --git a/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin/0001-panel-plugin-Include-sys-sysmacros.h-for-major-minor.patch b/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin/0001-panel-plugin-Include-sys-sysmacros.h-for-major-minor.patch
new file mode 100644
index 0000000000..007d3e5852
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin/0001-panel-plugin-Include-sys-sysmacros.h-for-major-minor.patch
@@ -0,0 +1,30 @@
+From c35a8cb24e8adafb11cbc261de37d97244e55927 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 11 Aug 2018 10:08:27 -0700
+Subject: [PATCH] panel-plugin: Include sys/sysmacros.h for major/minor
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+glibc 2.28+ needs it
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Cc: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ panel-plugin/devperf.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/panel-plugin/devperf.c b/panel-plugin/devperf.c
+index 175fd44..cb2e88a 100644
+--- a/panel-plugin/devperf.c
++++ b/panel-plugin/devperf.c
+@@ -34,6 +34,7 @@
+ #include <errno.h>
+ #include <sys/time.h>
+ /* for major() and minor() */
++#include <sys/sysmacros.h>
+ #define _BSD_SOURCE
+ #include <sys/types.h>
+ 
diff --git a/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.6.1.bb b/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.6.1.bb
index 161b2bb2b2..dc7f1fcd9a 100644
--- a/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.6.1.bb
+++ b/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.6.1.bb
@@ -5,5 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d3e627798d6a60bece47aa8b3532e1f1"
 
 inherit xfce-panel-plugin
 
+SRC_URI = "http://archive.xfce.org/src/panel-plugins/${BPN}/${@'${PV}'[0:3]}/${BPN}-${PV}.tar.bz2 \
+           file://0001-panel-plugin-Include-sys-sysmacros.h-for-major-minor.patch \
+           "
 SRC_URI[md5sum] = "63d5f03934c2dbddb3ad7bf7f535cc23"
 SRC_URI[sha256sum] = "212ddc742be3eecb6ad5554e1b1df03d5685cb71f48a558d5f895de37c57e4fa"
-- 
2.18.0


