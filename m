Return-Path: <liu.ming50@gmail.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id E9B2871ABC
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Mar 2017 11:09:51 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id n76so153629ioe.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Mar 2017 03:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=TKZVbxu0B4QSEwUQsB1BpQE4LiboOVxGAXKZvdJInW4=;
	b=Rjns5EXqdBFjCQM2VeZ7/q3XEXsrFM/sWiz/dD6W3EcpIRoKCs4sZ9+otkM93xO3/Y
	KgYkPG44XZKJgZbGv5rKvGnedtDqK4aa6K06BNZfyRPxHsvIlHmo5ogTfFkYU3z454im
	39BfLQmMVZQYy/R337CFRTTCB7iWYmdJzTbEh8fpbDpOOmrlq1omvq0to2/7adNaW9IR
	1c5xqRUWlxQRZ3n/AWapCwCoJ3DWYLA7l3mlBlH73C2jOOlD5T2X5nUuLwMtn11UTkif
	ROaihIew/EOE/XaMhDHOfildBZMDiceZTEHG93c3lPWoIwdQNL0+k10m5MVeHHKw0KQH
	DHbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=TKZVbxu0B4QSEwUQsB1BpQE4LiboOVxGAXKZvdJInW4=;
	b=fds7PEpPN5R+dbhL6IHnB3bBRiT2h70M0HE6jYcJw2yXKuXt9/eCaLuNf2HfH03CNw
	urnGu8D0fvGXfvLXQL3mF3Rvd9O2yqHYvErap7SKKxsqXCVVQiR1ajfxfU2anlrWDIR/
	Ry0qUA+nrEMECaRdQ1wgkO38Pl3hAA9ItEdxP0YoP1PSmzTsTOspKej3WVgJuhzlyw/0
	iE0W+HpnU/3M8BiWeY9ZGIkPDmy6FjIhC0PLQcrtU6WUlIBxBjvUBK3hKdPOO7ZGjXXE
	hD0Y6peyia5QLaC4bwR502GJ7XX1/rU8JLt7buG0rgyXUZhuuMI2EeSPOUBK1HG4gGps
	MLVg==
X-Gm-Message-State: AMke39mMDTDktTQGjNksAc46MdPjSg1brPljc5M46129+yZdQXC8BKGuHLvtcGf4T4oLKQ==
X-Received: by 10.107.44.23 with SMTP id s23mr177567ios.229.1488884992778;
	Tue, 07 Mar 2017 03:09:52 -0800 (PST)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([117.136.0.138])
	by smtp.gmail.com with ESMTPSA id h12sm4311iod.57.2017.03.07.03.08.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 07 Mar 2017 03:09:51 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Mar 2017 12:08:14 +0100
Message-Id: <1488884894-30925-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [meta-oe] [PATCH] rsyslog: fixes musl libc build
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
X-List-Received-Date: Tue, 07 Mar 2017 11:09:52 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

- struct timeval is defined in sys/time.h with a musl libc.
- GLOB_BRACE is not defined in posix and thus not implemented in musl libc.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 .../rsyslog/rsyslog/0001-Include-sys-time-h.patch  | 33 ++++++++++++++++++++
 .../rsyslog/rsyslog/0001-Undefine-GLOB_BRACE.patch | 35 ++++++++++++++++++++++
 meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb |  5 ++++
 3 files changed, 73 insertions(+)
 create mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/0001-Include-sys-time-h.patch
 create mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/0001-Undefine-GLOB_BRACE.patch

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/0001-Include-sys-time-h.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-Include-sys-time-h.patch
new file mode 100644
index 0000000..23c0f25
--- /dev/null
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-Include-sys-time-h.patch
@@ -0,0 +1,33 @@
+From 3c3c21f4735eb215206273bc714c57c969926d3d Mon Sep 17 00:00:00 2001
+From: Ming Liu <peter.x.liu@external.atlascopco.com>
+Date: Sun, 26 Feb 2017 14:10:21 +0100
+Subject: [PATCH] Include sys/time.h
+
+struct timeval is defined in sys/time.h with a musl libc.
+
+Upstream-Status: Inappropriate [musl libc specific]
+
+Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
+---
+ tests/msleep.c | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/tests/msleep.c b/tests/msleep.c
+index 26a8206..ca818be 100644
+--- a/tests/msleep.c
++++ b/tests/msleep.c
+@@ -26,11 +26,7 @@
+ #include "config.h"
+ #include <stdio.h>
+ #include <stdlib.h>
+-#if defined(__FreeBSD__)
+ #include <sys/time.h>
+-#else
+-#include <time.h>
+-#endif
+ 
+ int main(int argc, char *argv[])
+ {
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/0001-Undefine-GLOB_BRACE.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-Undefine-GLOB_BRACE.patch
new file mode 100644
index 0000000..7903bb1
--- /dev/null
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-Undefine-GLOB_BRACE.patch
@@ -0,0 +1,35 @@
+From 6746e3a9615d1566bf228e9012d0841b15178810 Mon Sep 17 00:00:00 2001
+From: Ming Liu <liu.ming50@gmail.com>
+Date: Sun, 26 Feb 2017 13:50:33 +0100
+Subject: [PATCH] Undefine GLOB_BRACE
+
+GLOB_BRACE is not defined in posix and thus not implemented in musl libc.
+
+Fixed by defining it to 0 if it is undefined.
+
+Upstream-Status: Inappropriate [musl libc specific]
+
+Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
+---
+ plugins/imfile/imfile.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/plugins/imfile/imfile.c b/plugins/imfile/imfile.c
+index d20471f..f9aff81 100644
+--- a/plugins/imfile/imfile.c
++++ b/plugins/imfile/imfile.c
+@@ -85,6 +85,11 @@ static int bLegacyCnfModGlobalsPermitted;/* are legacy module-global config para
+ 
+ #define ADD_METADATA_UNSPECIFIED -1
+ 
++/* fixes build with musl libc */
++#ifndef GLOB_BRACE
++#define GLOB_BRACE 0
++#endif
++
+ /* this structure is used in pure polling mode as well one of the support
+  * structures for inotify.
+  */
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb
index 62126f8..d81117c 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb
@@ -26,6 +26,11 @@ SRC_URI = "http://www.rsyslog.com/download/files/download/rsyslog/${BPN}-${PV}.t
            file://rsyslog-fix-ptest-not-finish.patch \
 "
 
+SRC_URI_append_libc-musl = " \
+    file://0001-Undefine-GLOB_BRACE.patch \
+    file://0001-Include-sys-time-h.patch \
+"
+
 SRC_URI[md5sum] = "ad0f25f429aa2daa326732950a5eeb6c"
 SRC_URI[sha256sum] = "06e2884181333dccecceaca82827ae24ca7a258b4fbf7b1e07a80d4caae640ca"
 
-- 
1.9.1


