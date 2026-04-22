Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DCBCF94CB7
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 01:39:39 +0000 (UTC)
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.61779.1776821968903710742
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Apr 2026 18:39:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NP1sOfNC;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2b6b0500e06so7904900eec.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Apr 2026 18:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776821968; x=1777426768; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hjNr2s58/2TgZJjf/IgBzFpSckXXgenJaMXtAKz/sIQ=;
        b=NP1sOfNCslJ5USyc/yZs7AWgvgjKxLxJEQvpVgID6A+b8CJJFwv5S8gbtu4Q+bsFns
         hAQXGiyQ5iYoUNsGsnQoPha/0CAR9hY4dsRdEmHOYUgTvY9UovAup7dah17slMyQ9TAY
         /pzM1TBEWPX1vt5C5+vasSYKU9OmFNSQzAbezVR8gi53wZBdP7vkeAlR1Pu8u7qcRRsu
         47jvfZLbzCbRL7H2s27qYEFlt89ExUZXCIrl4js4Tx8KaF2SU/FoUabmeKeW8otWaNNj
         +uUb0ASPyVnmeBcTXC04fvdtzJ6Xf2SOeQNpuNEWYUwN29dPO/rPOktt6Nc/HYiH0Nsi
         Q7RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776821968; x=1777426768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hjNr2s58/2TgZJjf/IgBzFpSckXXgenJaMXtAKz/sIQ=;
        b=ZRnodHCj9oZB0sXFFNZekur9ismf0pstn0VtgB3LPSW0Pa6xRHO5gIrGh1q1Tkw/9g
         rA5SaeXXTAdd6NH+cua3Skl31bd5maXdwSa85j8N/ihTgj7jsed9/XTx9xrtUJT/ytv1
         HIOgk1WBTk1/qHcsKg3BMBFLij4W8udiITEqycOlkOgI9+1O9oLJ85C1QuLgrxeHHJWc
         GmTNKNX0g1bcHc8yVYep12yzb+GqCA8QhBVpdTmK4qqR/9R0crN7cwCt85ZVr+UFRgQj
         oStRQ9ngbF6NG524QKaWdh4iMHQTxYS+4Lic+TSfvCbOzt8/9KdJlAg3+mmHfOOT9cH1
         sETA==
X-Gm-Message-State: AOJu0Yz67JnqKkVd1B1nAWKu1b5CvID6jCW3chks3EcsmXFJlbce/318
	xcfSqbtY3GYAYia05PdTh1u6eRte4mK6zUBOMhJijJkuho6fIUrDF5vB3UL1+Yxh
X-Gm-Gg: AeBDietoO9+21YGetZfO5H0TK317K8rFbhdXx7pqqYCI51KXnHubYJKjWMHt+wh7FuF
	Iz/aJJE1SSbwccPYlzdiWfH0ENlS45w0PDs74C+44TIZcI79dwtJpekbs+NrQHrELK8zgplS6ed
	IPAXnw2fvjyeqObOB+n6R0Vx1tBn/oPnviETCY0QFCWB+is6zemug6hIiQR4R1SuQR5Rqspq3KE
	uThUDTA5qbfkRiQAgsPQIqU3Ixcn6BE5TCfhUkGbOd4Y2FNJXNxOq2oc3RFicm1fpKNO6kf0BS8
	gIcJKqIWtpKHtoTY8TlOvfW0sohpUfYA6IBAi0+4bJQUfig7PBLg4/s+lMN9hDXcW+RxVJDosxk
	pFfFtNJtnFFP+zbogchNk4ZmIaaDP3g6emf07A2c5F1UsjNR2H8rKCsI6Hp7k2u6xSJk4NBfZZc
	YcccavC/8SNA/G2bCBfzDcPUyjGreU38vgSw2ZykJHb1a5c6bh0pAzSA5cEY4zQfJ0AvVXOBu6X
	mwNVX164tTVFwdrO7KCSvtyQr2QaguqI4rtmfW+pFztq8Pu3eera9p57vczYeXJ708G9NPLYH2E
	lB8VbxGlwvSY9zODLtN7PxqYHK+vyxRJsKp64F/QwvL/YKxF7nQ=
X-Received: by 2002:a05:7300:80c5:b0:2df:7882:1ce0 with SMTP id 5a478bee46e88-2e479618a50mr12229055eec.29.1776821967901;
        Tue, 21 Apr 2026 18:39:27 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e539fa6134sm21940549eec.3.2026.04.21.18.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 18:39:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH] gphoto2: Fix build with clang-22
Date: Tue, 21 Apr 2026 18:39:24 -0700
Message-ID: <20260422013925.1791148-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2026 01:39:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126539

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...hoto2-fix-const-qualifier-violations.patch | 73 +++++++++++++++++++
 .../gphoto2/gphoto2_2.5.32.bb                 |  1 +
 2 files changed, 74 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/gphoto2/gphoto2/0001-gphoto2-fix-const-qualifier-violations.patch

diff --git a/meta-oe/recipes-graphics/gphoto2/gphoto2/0001-gphoto2-fix-const-qualifier-violations.patch b/meta-oe/recipes-graphics/gphoto2/gphoto2/0001-gphoto2-fix-const-qualifier-violations.patch
new file mode 100644
index 0000000000..a8f85d034c
--- /dev/null
+++ b/meta-oe/recipes-graphics/gphoto2/gphoto2/0001-gphoto2-fix-const-qualifier-violations.patch
@@ -0,0 +1,73 @@
+From 55edc241e9b61b14153c61fd0baaefac927ad89f Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Tue, 21 Apr 2026 17:39:43 -0700
+Subject: [PATCH] gphoto2: fix const qualifier violations
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+No logic is changed. The patch is a pure
+type-correctness fix that makes the variable
+declarations match the actual semantics —
+const char * for pointers into string literals
+or function parameters that must not be mutated,
+and char * only for owned heap memory. This
+satisfies Clang's strict qualifier checking without
+needing any casts or warning suppressions.
+
+Fixes errors seen on clang with
+  -Werror,-Wincompatible-pointer-types-discards-qualifiers
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ gphoto2/main.c | 14 ++++++++------
+ 1 file changed, 8 insertions(+), 6 deletions(-)
+
+diff --git a/gphoto2/main.c b/gphoto2/main.c
+index 5a3c5c1..086f9df 100644
+--- a/gphoto2/main.c
++++ b/gphoto2/main.c
+@@ -146,7 +146,8 @@ static int
+ get_path_for_file (const char *folder, const char *name, CameraFileType type, CameraFile *file, char **path)
+ {
+ 	unsigned int i, l;
+-	char *s = NULL, b[1024];
++	const char *s = NULL;
++	char *p = NULL; char b[1024];
+ 	time_t t = 0;
+ 	struct tm *tm;
+ 	int hour12;
+@@ -339,18 +340,18 @@ get_path_for_file (const char *folder, const char *name, CameraFileType type, Ca
+ 			b[1] = '\0';
+ 		}
+
+-		s = *path ? realloc (*path, strlen (*path) + strlen (b) + 1) :
++		p = *path ? realloc (*path, strlen (*path) + strlen (b) + 1) :
+ 			    malloc (strlen (b) + 1);
+-		if (!s) {
++		if (!p) {
+ 			free (*path);
+ 			*path = NULL;
+ 			return (GP_ERROR_NO_MEMORY);
+ 		}
+ 		if (*path) {
+-			*path = s;
++			*path = p;
+ 			strcat (*path, b);
+ 		} else {
+-			*path = s;
++			*path = p;
+ 			strcpy (*path, b);
+ 		}
+ 	}
+@@ -696,7 +697,8 @@ dissolve_filename (
+ 	const char *folder, const char *filename,
+ 	char **newfolder, char **newfilename
+ ) {
+-	char *nfolder, *s;
++	char *nfolder;
++	const char *s;
+
+ 	s = strrchr (filename, '/');
+ 	if (!s) {
diff --git a/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.32.bb b/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.32.bb
index e5e7c6926f..dbd2b0e748 100644
--- a/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.32.bb
+++ b/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.32.bb
@@ -9,6 +9,7 @@ RDEPENDS:gphoto2 = "libgphoto2"
 SRC_URI = "${SOURCEFORGE_MIRROR}/gphoto/${BP}.tar.bz2;name=gphoto2 \
            file://0001-configure.ac-remove-AM_PO_SUBDIRS.patch \
            file://0001-configure-Filter-out-buildpaths-from-CC.patch \
+           file://0001-gphoto2-fix-const-qualifier-violations.patch \
 "
 SRC_URI[gphoto2.sha256sum] = "4e379a0f12f72b49ee5ee2283ffd806b5d12d099939d75197a3f4bbc7f27a1a1"


