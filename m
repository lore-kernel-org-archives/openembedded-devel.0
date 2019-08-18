Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id 8D3227CF98
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Aug 2019 22:33:44 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id g17so6723348wrr.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Aug 2019 15:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=sDB4lexbQf7zSE46aAxFJG78yVky4AJ4TRTg6AVnTO8=;
	b=HUqpyqFtjKeAC0lm2GeRsGLxzDajBJbZ6ZRtSlkp/HTT1dec2o+oyA3IipoEvKuwdn
	qKu0FNKOxFGyWVC2cqrIb7hWdQ/+wQalugrSEVh40Gfay82Zo/obGyVdHT4dxSXb0d8I
	O36CS4BBCDFD5m4O8uE74jnfRpS0a7B+3xExwls2vKoxEVb8b7WWrv1NDCmVf+VN9KP7
	9dbSzx8OOT3LyPcYfB3Ngt5Zibqp1skPdIvpH8e8MUPGUjFSXFEgC9YCHXa0LVlZrbHd
	B22CWlHOuDTdoxAR2lYjXwDVjTVGCKhlLEY6K0SHCCcWVbHFS1IrgZUQDhNl0PMoDdul
	gjTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=sDB4lexbQf7zSE46aAxFJG78yVky4AJ4TRTg6AVnTO8=;
	b=sPMjN8XWzjzoXBpwspO9SSSHhuOFzrvRHVhObbUek2Rj9jERRfN/7kTd2NVeDJcRji
	DYKwTPsycCNNL4+vfVB2SB4sbgHtNN1zh7phACn3yPBEnyQVpWWWlvU/Abwc9r4bj/dK
	M4eKWVgAaZEDt93N5NdAPoT4DWrC4RtVwZg1K8EiahAq7YRhtRmtabvGAJO9oUdSxVe+
	XkpHf7Kgjhifnc1rmxOm7PvFhfeCm1DlZoMHInZrzME8zOiiFQOGZu5MWE2bSlGPAfcT
	GX9HSR8WxysBlXWjwyB0QttCLN3FQrPz9N3V58zdDKf3uJW6DnWlEzBH7iMmEalV4bZz
	oGQw==
X-Gm-Message-State: APjAAAXNQ+QNRVHa0TrKMEiR+9I0CF89IH6xZs5w3VibME3s6vi3oGEN
	eKFAtuMcLZLmoB6+Z9nsI9Ymf+SF
X-Google-Smtp-Source: APXvYqzpdhMFMZw/4EBa+4XLbGeKLvRiI/T/4niotf0VWtaWa3xR4zfFhQFBNNihyRgsq2JCnIeqXg==
X-Received: by 2002:a5d:4f91:: with SMTP id d17mr22960800wru.74.1566167625013; 
	Sun, 18 Aug 2019 15:33:45 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F2D8718C84C5511B02F056F.dip0.t-ipconnect.de.
	[2003:f0:7f2d:8718:c84c:5511:b02f:56f])
	by smtp.gmail.com with ESMTPSA id
	k124sm30390814wmk.47.2019.08.18.15.33.44
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 18 Aug 2019 15:33:44 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	kai.kang@windriver.com
Date: Mon, 19 Aug 2019 00:33:15 +0200
Message-Id: <20190818223316.19772-10-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190818223316.19772-1-schnitzeltony@gmail.com>
References: <20190818223316.19772-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [meta-xfce][PATCH 09/10] xfce4-diskperf-plugin: upgrade 2.6.1 -> 2.6.2
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
X-List-Received-Date: Sun, 18 Aug 2019 22:33:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* announcement claims this a translation update only
* they include sys/sysmacros.h at a different position ->  patch can go

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...lude-sys-sysmacros.h-for-major-minor.patch | 30 -------------------
 ....6.1.bb => xfce4-diskperf-plugin_2.6.2.bb} | 10 +++----
 2 files changed, 4 insertions(+), 36 deletions(-)
 delete mode 100644 meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin/0001-panel-plugin-Include-sys-sysmacros.h-for-major-minor.patch
 rename meta-xfce/recipes-panel-plugins/diskperf/{xfce4-diskperf-plugin_2.6.1.bb => xfce4-diskperf-plugin_2.6.2.bb} (41%)

diff --git a/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin/0001-panel-plugin-Include-sys-sysmacros.h-for-major-minor.patch b/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin/0001-panel-plugin-Include-sys-sysmacros.h-for-major-minor.patch
deleted file mode 100644
index 007d3e585..000000000
--- a/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin/0001-panel-plugin-Include-sys-sysmacros.h-for-major-minor.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From c35a8cb24e8adafb11cbc261de37d97244e55927 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 11 Aug 2018 10:08:27 -0700
-Subject: [PATCH] panel-plugin: Include sys/sysmacros.h for major/minor
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-glibc 2.28+ needs it
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Cc: Andreas Müller <schnitzeltony@googlemail.com>
----
- panel-plugin/devperf.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/panel-plugin/devperf.c b/panel-plugin/devperf.c
-index 175fd44..cb2e88a 100644
---- a/panel-plugin/devperf.c
-+++ b/panel-plugin/devperf.c
-@@ -34,6 +34,7 @@
- #include <errno.h>
- #include <sys/time.h>
- /* for major() and minor() */
-+#include <sys/sysmacros.h>
- #define _BSD_SOURCE
- #include <sys/types.h>
- 
diff --git a/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.6.1.bb b/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.6.2.bb
similarity index 41%
rename from meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.6.1.bb
rename to meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.6.2.bb
index dc7f1fcd9..04da55d61 100644
--- a/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.6.1.bb
+++ b/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.6.2.bb
@@ -1,12 +1,10 @@
 SUMMARY = "Panel plugin displaying instant disk/partition performance"
-HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-diskperf-plugin"
+HOMEPAGE = "https://goodies.xfce.org/projects/panel-plugins/xfce4-diskperf-plugin"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d3e627798d6a60bece47aa8b3532e1f1"
 
 inherit xfce-panel-plugin
 
-SRC_URI = "http://archive.xfce.org/src/panel-plugins/${BPN}/${@'${PV}'[0:3]}/${BPN}-${PV}.tar.bz2 \
-           file://0001-panel-plugin-Include-sys-sysmacros.h-for-major-minor.patch \
-           "
-SRC_URI[md5sum] = "63d5f03934c2dbddb3ad7bf7f535cc23"
-SRC_URI[sha256sum] = "212ddc742be3eecb6ad5554e1b1df03d5685cb71f48a558d5f895de37c57e4fa"
+SRC_URI = "http://archive.xfce.org/src/panel-plugins/${BPN}/${@'${PV}'[0:3]}/${BPN}-${PV}.tar.bz2"
+SRC_URI[md5sum] = "538119ea97a217695b297e2d165b305f"
+SRC_URI[sha256sum] = "fd2e9843da5822de96a7829e50ba496c34a50fb8492d5b5f792558c6b7ce9644"
-- 
2.21.0


