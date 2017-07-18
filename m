Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 636F878075
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jul 2017 03:10:42 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id z1so1060074pgs.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jul 2017 20:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wJwLV3JJRITdVgWXacnPfiphMJeaWy0zEF8uFIak3sg=;
	b=YNp3gBE8ZVNUjyc4rWEgpuPWfRcM3EYOUke40Afo90xgorreSu+cabGxX6RbVrKRb+
	eqjG0i0uwnA58VghTdoONebE6NHFqOEiirRKUAucxQwF3A/BJmnVBmoC4LQwpDMcaG8Y
	61xpaky0dVuSvMHFnjfsd6fXwQpYcGzpLWEHQPqxphqj6FFCbXlt6UiTKcDSPD26dFkh
	j5Awjjb0FMirGnjhrODvBMchWvJKRJDX8E0dmvFRXUAXjxCvoqiRXdAes3wH63J6SesF
	xhlfj2XcE7iT9NIn9gQi0t8WjoJVJw5joCkRhsx4c1THt+JDWrpwfAapCCeQMQsvCOKj
	XD4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wJwLV3JJRITdVgWXacnPfiphMJeaWy0zEF8uFIak3sg=;
	b=OmyAQpiI2lSvlD28YQFKB3sM8pVkqs4/GUFsmWWY8gKlAMFCeFKIGnzUY3XHlqye2v
	WmkV1o9xLmXXjEQo6T/sCseM6v45oiKfDl7Pk111FVvd3+XGg3OwGDSDGVzvLcnzOG39
	lIC2dniRtkD6KatX5kmiZ0YuYQwiYPaSO0cbvqMveYUkwKuZZSowqInEHgTRq4f81Pbs
	vH+JZ2LjO8x4UKnduz9e/8wyuL3/3WIChyzadIUwHKR3OKCel0s3EyYiZ8gDqXgl/WXb
	FWnzfkGI8STAon09dJAwQYeDksjTW2wQFQrj8YQI7ula+5/mFvwhtejJpOKQI1pu7igS
	qELA==
X-Gm-Message-State: AIVw112J3Np5XrobYMDlbWZXqjniJaENuvrsS9CQhuYIxU0pa/OzlftT
	chpZRdLSZftBrYUs
X-Received: by 10.98.28.71 with SMTP id c68mr827379pfc.116.1500347443736;
	Mon, 17 Jul 2017 20:10:43 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	w85sm1086674pfj.115.2017.07.17.20.10.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Jul 2017 20:10:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Jul 2017 20:10:10 -0700
Message-Id: <20170718031013.44536-14-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170718031013.44536-1-raj.khem@gmail.com>
References: <20170718031013.44536-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 14/17] nicstat: Fix build on musl/x86_64
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
X-List-Received-Date: Tue, 18 Jul 2017 03:10:42 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...tat.c-Do-not-define-uint64_t-and-uint32_t.patch | 37 ++++++++++++++++++++++
 meta-oe/recipes-extended/nicstat/nicstat_1.95.bb   |  4 ++-
 2 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/nicstat/nicstat/0001-nicstat.c-Do-not-define-uint64_t-and-uint32_t.patch

diff --git a/meta-oe/recipes-extended/nicstat/nicstat/0001-nicstat.c-Do-not-define-uint64_t-and-uint32_t.patch b/meta-oe/recipes-extended/nicstat/nicstat/0001-nicstat.c-Do-not-define-uint64_t-and-uint32_t.patch
new file mode 100644
index 000000000..a208f97eb
--- /dev/null
+++ b/meta-oe/recipes-extended/nicstat/nicstat/0001-nicstat.c-Do-not-define-uint64_t-and-uint32_t.patch
@@ -0,0 +1,37 @@
+From 52590fbf735cef3fec85a042458aa89a02c52b57 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 15 Jul 2017 11:33:12 -0700
+Subject: [PATCH] nicstat.c: Do not define uint64_t and uint32_t
+
+Use the defines from platform
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+---
+ nicstat.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/nicstat.c b/nicstat.c
+index 83ad557..2a6e0c1 100644
+--- a/nicstat.c
++++ b/nicstat.c
+@@ -32,6 +32,7 @@
+ 
+ #include <stdio.h>
+ #include <stdlib.h>
++#include <stdint.h>
+ #include <unistd.h>
+ #include <string.h>
+ #include <ctype.h>
+@@ -88,8 +89,6 @@
+ #define	PROC_NET_BUFSIZ		(128 * 1024)
+ #define	PROC_UPTIME		"/proc/uptime"
+ /* Needs to be fixed if not built under ILP32 */
+-typedef unsigned long long	uint64_t;
+-typedef unsigned int		uint32_t;
+ extern char *optarg;
+ extern int optind, opterr, optopt;
+ #endif /* OS_LINUX */
+-- 
+2.13.3
+
diff --git a/meta-oe/recipes-extended/nicstat/nicstat_1.95.bb b/meta-oe/recipes-extended/nicstat/nicstat_1.95.bb
index 5126a31cd..3875f0f60 100644
--- a/meta-oe/recipes-extended/nicstat/nicstat_1.95.bb
+++ b/meta-oe/recipes-extended/nicstat/nicstat_1.95.bb
@@ -5,7 +5,9 @@ HOMEPAGE = "http://nicstat.sourceforge.net"
 LICENSE = "Artistic-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b4a94da2a1f918b217ef5156634fc9e0"
 
-SRC_URI = "http://softlayer-sng.dl.sourceforge.net/project/${BPN}/${BP}.tar.gz"
+SRC_URI = "http://softlayer-sng.dl.sourceforge.net/project/${BPN}/${BP}.tar.gz \
+           file://0001-nicstat.c-Do-not-define-uint64_t-and-uint32_t.patch \
+           "
 SRC_URI[md5sum] = "9a0b87bbc670c1e738e5b40c7afd184d"
 SRC_URI[sha256sum] = "c4cc33f8838f4523f27c3d7584eedbe59f4c587f0821612f5ac2201adc18b367"
 
-- 
2.13.3


