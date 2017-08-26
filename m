Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2AFA778227
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Aug 2017 18:35:27 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id 83so3179475pgb.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Aug 2017 11:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=oEK1bOB21+ujAWlaP5um2bPinDGF/3UAb2b4WyxwPnc=;
	b=cj8vrR06Hu7Cne/hA/uNHELO6fa81MlbEzQfRqQqYIt9wKmyGKgFSNKtXLe69RUAKq
	iisTxf0WQeMFE6/O+J1U7DCKq456Ucf1zGT0L9MlwEeIaIHHxvD2sWMVjFL3Dz8rLvqi
	p4cARxxplMcUI84xunmJ1CYDE8PmyPo7Iskfo5pXlXlYO+kLW47XmqSHzeZbpu7RvMAl
	mJKsD+4KvtGyjIZ+sJEVuzNynd93C3huTtXMOOCx4oYuAA8FQG0CPEFEmwYPuHG741jI
	TwlXChSE/zKQ2z4OvzmNsL0IwSV3I/zrCINSSiHt+8Ieu7ZdlnFh8C92TUOkHTBkw6Og
	Sdrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=oEK1bOB21+ujAWlaP5um2bPinDGF/3UAb2b4WyxwPnc=;
	b=rDOJq/znU8Tm3ScDRCiZxte1F9huWdy6QW6UJThNTOQNcSFjeurEDzwTi9LbpWM8Lv
	hBtsGMYq+yRJBCyc6uuoiTlt9AxO/He83x+reFXAoA2m3F8qxwSD6ibMco96KlY6vScV
	YogH4c7R7T121Ruw0ukAKbefEJeJFpXMhV/HcnmL6EZsOtJkIBkFQhxj2PANmcp3hFxA
	TP0iepR3z1gsu/c0AjVanh0xQFsnA1ARIPG/ZAdCeoFON5JuP13XRrqc5wlWoRXl17fX
	jDOsYyEB2j1KNcO7sh/9w4tRfnT86EheebTEYXAQCECRoGb6Bdmj8LdZ4G0TQSmerw7B
	7FWA==
X-Gm-Message-State: AHYfb5j1uzImuRtQLeKRgKyReoQ2v1HSKNY+SnnF3jtnN2dQyfp6a5eF
	ZN8Ilop/D77LUcgY
X-Received: by 10.98.79.136 with SMTP id f8mr2446049pfj.24.1503772528964;
	Sat, 26 Aug 2017 11:35:28 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::79ab])
	by smtp.gmail.com with ESMTPSA id
	m2sm15240546pgs.72.2017.08.26.11.35.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 26 Aug 2017 11:35:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Aug 2017 11:35:15 -0700
Message-Id: <20170826183521.34294-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [meta-networking][PATCH 1/7] ippool: Fix build errors found by clang
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
X-List-Received-Date: Sat, 26 Aug 2017 18:35:28 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ippool/ippool/0001-read-returns-ssize_t.patch  | 31 ++++++++++++
 ...02-Mark-first-element-of-a-string-as-null.patch | 31 ++++++++++++
 ...003-cli-Mark-return-of-strtol-as-long-int.patch | 58 ++++++++++++++++++++++
 .../recipes-daemons/ippool/ippool_1.3.bb           |  5 +-
 4 files changed, 124 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-daemons/ippool/ippool/0001-read-returns-ssize_t.patch
 create mode 100644 meta-networking/recipes-daemons/ippool/ippool/0002-Mark-first-element-of-a-string-as-null.patch
 create mode 100644 meta-networking/recipes-daemons/ippool/ippool/0003-cli-Mark-return-of-strtol-as-long-int.patch

diff --git a/meta-networking/recipes-daemons/ippool/ippool/0001-read-returns-ssize_t.patch b/meta-networking/recipes-daemons/ippool/ippool/0001-read-returns-ssize_t.patch
new file mode 100644
index 000000000..7d3f9acb6
--- /dev/null
+++ b/meta-networking/recipes-daemons/ippool/ippool/0001-read-returns-ssize_t.patch
@@ -0,0 +1,31 @@
+From e4e0aae139b6489dc582fd14e54e562126482ce2 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 26 Aug 2017 07:23:53 -0700
+Subject: [PATCH 1/3] read() returns ssize_t
+
+Fixes
+usl_fd.c:284:10: error: comparison of unsigned expression < 0 is always false [-Werror,-Wtautological-compare]
+                if (nb < 0) {
+                    ~~ ^ ~
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ usl/usl_fd.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/usl/usl_fd.c b/usl/usl_fd.c
+index 3b7a813..04ba48c 100644
+--- a/usl/usl_fd.c
++++ b/usl/usl_fd.c
+@@ -280,7 +280,7 @@ size_t usl_fd_read(int fd, void *buf, size_t count)
+ 	char *ptr = buf;
+ 
+ 	for (chars_read = 0; chars_read < count; ) {
+-		size_t nb = read(fd, ptr, count - chars_read);
++		ssize_t nb = read(fd, ptr, count - chars_read);
+ 		if (nb < 0) {
+ 			if (errno == EINTR)
+ 				continue;
+-- 
+2.14.1
+
diff --git a/meta-networking/recipes-daemons/ippool/ippool/0002-Mark-first-element-of-a-string-as-null.patch b/meta-networking/recipes-daemons/ippool/ippool/0002-Mark-first-element-of-a-string-as-null.patch
new file mode 100644
index 000000000..6e2bd523d
--- /dev/null
+++ b/meta-networking/recipes-daemons/ippool/ippool/0002-Mark-first-element-of-a-string-as-null.patch
@@ -0,0 +1,31 @@
+From cf25576428903168cd41b183fb1ca9c2b7e2666e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 26 Aug 2017 07:28:10 -0700
+Subject: [PATCH 2/3] Mark first element of a string as null
+
+Fixes
+cli_lib.c:427:20: error: expression which evaluates to zero treated as a null pointer constant of type 'char *' [-Werror,-Wnon-literal-null-conversion]
+                                        values[arg] = '\0';
+                                                      ^~~~
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ cli/cli_lib.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cli/cli_lib.c b/cli/cli_lib.c
+index 41a0b06..e4d2fd5 100644
+--- a/cli/cli_lib.c
++++ b/cli/cli_lib.c
+@@ -424,7 +424,7 @@ int cli_find_args(int argc, char *argv[], struct cli_node *cmd, struct cli_node
+ 			if (arg_string[1] == '\0') {
+ 				/* no arg value - only allowed for string args */
+ 				if (node->arg->parser == cli_arg_parse_string) {
+-					values[arg] = '\0';
++					*values[arg] = '\0';
+ 				} else {
+ 					result = -EINVAL;
+ 					break;
+-- 
+2.14.1
+
diff --git a/meta-networking/recipes-daemons/ippool/ippool/0003-cli-Mark-return-of-strtol-as-long-int.patch b/meta-networking/recipes-daemons/ippool/ippool/0003-cli-Mark-return-of-strtol-as-long-int.patch
new file mode 100644
index 000000000..3854b1133
--- /dev/null
+++ b/meta-networking/recipes-daemons/ippool/ippool/0003-cli-Mark-return-of-strtol-as-long-int.patch
@@ -0,0 +1,58 @@
+From 994d9575374d3cdb34b1b0f70c3c53ae76fe578e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 26 Aug 2017 07:41:05 -0700
+Subject: [PATCH 3/3] cli: Mark return of strtol as long int
+
+strtol does not return unsigned long
+
+error: taking the absolute value of unsigned type 'unsigned long' has no effect [-Werror,-Wabsolute-value]
+        if ((*endp == '\0') && (labs(tmp) < 32768)) {
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ cli/cli_lib.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/cli/cli_lib.c b/cli/cli_lib.c
+index e4d2fd5..5f487dc 100644
+--- a/cli/cli_lib.c
++++ b/cli/cli_lib.c
+@@ -522,7 +522,7 @@ int cli_arg_parse_int32(struct cli_node *arg, const char *val, void *result)
+ int cli_arg_parse_int16(struct cli_node *arg, const char *val, void *result)
+ {
+ 	int16_t *intval = result;
+-	unsigned long tmp;
++	long tmp;
+ 	char *endp;
+ 	int ret = 0;
+ 
+@@ -539,7 +539,7 @@ int cli_arg_parse_int16(struct cli_node *arg, const char *val, void *result)
+ int cli_arg_parse_int8(struct cli_node *arg, const char *val, void *result)
+ {
+ 	int8_t *intval = result;
+-	unsigned long tmp;
++	long tmp;
+ 	char *endp;
+ 	int ret = 0;
+ 
+@@ -573,7 +573,7 @@ int cli_arg_parse_uint32(struct cli_node *arg, const char *val, void *result)
+ int cli_arg_parse_uint16(struct cli_node *arg, const char *val, void *result)
+ {
+ 	uint16_t *intval = result;
+-	unsigned long tmp;
++	long tmp;
+ 	char *endp;
+ 	int ret = 0;
+ 
+@@ -590,7 +590,7 @@ int cli_arg_parse_uint16(struct cli_node *arg, const char *val, void *result)
+ int cli_arg_parse_uint8(struct cli_node *arg, const char *val, void *result)
+ {
+ 	uint8_t *intval = result;
+-	unsigned long tmp;
++	long tmp;
+ 	char *endp;
+ 	int ret = 0;
+ 
+-- 
+2.14.1
+
diff --git a/meta-networking/recipes-daemons/ippool/ippool_1.3.bb b/meta-networking/recipes-daemons/ippool/ippool_1.3.bb
index 05921d536..6e4748357 100644
--- a/meta-networking/recipes-daemons/ippool/ippool_1.3.bb
+++ b/meta-networking/recipes-daemons/ippool/ippool_1.3.bb
@@ -21,7 +21,10 @@ SRC_URI = "https://sourceforge.net/projects/openl2tp/files/${BPN}/${PV}/${BPN}-$
            file://makefile-add-ldflags.patch \
            file://0001-usl_timer-Check-for-return-value-of-write-API.patch \
            file://0001-Respect-flags-from-env.patch \
-"
+           file://0001-read-returns-ssize_t.patch \
+           file://0002-Mark-first-element-of-a-string-as-null.patch \
+           file://0003-cli-Mark-return-of-strtol-as-long-int.patch \
+           "
 SRC_URI_append_libc-musl = "\
            file://0002-link-with-libtirpc.patch \
            file://0003-musl-fixes.patch \
-- 
2.14.1


