Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 43D4D77E49
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 16:43:15 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id 81so18580842pgh.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 09:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=zv8DXtLYCW01ehzrZ2z06VsUK/rbDfBB9crvcDPgkm0=;
	b=SHLQUHKZd+pPo0V4lSKYsclWrYXZ7f7xRJ7GbCJ1qs2kzD4tIIXnOalKCgH3+VrzdI
	ZOKZl395ifl0ciuEcFAAShgMNNcIHikCMnzK2NMRWgWRZAPM4XmM16ftXzi0ZLZ0m6U8
	l2ng9lbMPUKlnmmUqGfMg3f3RRgUrOawHcibOvMX53gdhE3iHlHMH2fZzPJA6J+zNvuV
	1LuroU6BkLl6XKe6dHZ+oONW1I9dng+BNplmcu4pbfcgtoHuAagCEIHm3/sp0IKnyvpF
	arCkmQ7Fi+BJQCnXHlYQeZrnAMCD069QzOv+Sk6eNxUMBDJMzMCV4MfRq3GF0yi5Z3Yp
	3dLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=zv8DXtLYCW01ehzrZ2z06VsUK/rbDfBB9crvcDPgkm0=;
	b=Myv+vnkUPIt/2aua3fLCitJcUDNL+cVZ8jJdXQJ5acPIXM08nfcj74C6NHerzj1pKQ
	dvRwyt5QcZQoXDvXi6Y1pwJ3DdEfeUX7adPfZ+1No1BdqmzZVC8t6NMEnTgBXlPoPZ6+
	NSw7B6uNfQO/YG3JLrZCbizeaxga7ow1oiKYIlf8nKxH2w7+/3jz4uwl5Vf7QIuawgi9
	+mzZEXOHF1phA5lPMUZ0/G40nkSmkYi4HdzVXctPOV1eP2bNRshhZAmSA3CMMALVfW3J
	HYS9W0mCzUQmIyK2t/Hm5G4o7roLrq5i1wKHyGuQeixHwbkQwdsI0s3idDuqn7yqotpN
	PBxQ==
X-Gm-Message-State: AFeK/H1NHLqgo7iOeYxEXhMeoS3Fdt7RJngmPJZzD90E+n/cxk/taxC0tBJ0bTtoQn5MuQ==
X-Received: by 10.84.174.4 with SMTP id q4mr4482258plb.35.1490978596545;
	Fri, 31 Mar 2017 09:43:16 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm11569706pfh.124.2017.03.31.09.43.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 09:43:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Mar 2017 09:42:19 -0700
Message-Id: <20170331164247.5052-15-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.1
In-Reply-To: <20170331164247.5052-1-raj.khem@gmail.com>
References: <20170331164247.5052-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 15/43] lowpan-tools: Fix build with musl
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
X-List-Received-Date: Fri, 31 Mar 2017 16:43:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...d-config-parse.y-add-missing-time.h-inclu.patch | 44 ++++++++++++++++++++++
 .../lowpan-tools/lowpan-tools_git.bb               |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-addrdb-coord-config-parse.y-add-missing-time.h-inclu.patch

diff --git a/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-addrdb-coord-config-parse.y-add-missing-time.h-inclu.patch b/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-addrdb-coord-config-parse.y-add-missing-time.h-inclu.patch
new file mode 100644
index 000000000..0a81a2252
--- /dev/null
+++ b/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-addrdb-coord-config-parse.y-add-missing-time.h-inclu.patch
@@ -0,0 +1,44 @@
+From ab725a3faaeead90ae3c63cbcd370af087c413a5 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Mon, 27 Mar 2017 17:55:06 -0700
+Subject: [PATCH] addrdb/coord-config-parse.y: add missing <time.h> include
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The %union definition uses the time_t structure. In order to use this
+structure, the <time.h> header has to be included. Otherwise, the build
+breaks with some C libraries, such as musl:
+
+In file included from coord-config-lex.l:23:0:
+coord-config-parse.y:107:2: error: unknown type name ‘time_t’
+  time_t timestamp;
+  ^
+
+This patch includes <time.h> using the '%code requires' directive of
+Yacc.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ addrdb/coord-config-parse.y | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/addrdb/coord-config-parse.y b/addrdb/coord-config-parse.y
+index 2e10a88..85ee058 100644
+--- a/addrdb/coord-config-parse.y
++++ b/addrdb/coord-config-parse.y
+@@ -102,6 +102,10 @@
+ 
+ %}
+ 
++%code requires {
++#include <time.h>
++}
++
+ %union {
+ 	unsigned long number;
+ 	time_t timestamp;
+-- 
+2.12.1
+
diff --git a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
index 8c7dbc09a..139eb788f 100644
--- a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
+++ b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
@@ -11,6 +11,7 @@ PV = "0.3.1+git${SRCPV}"
 SRC_URI = "git://git.code.sf.net/p/linux-zigbee/linux-zigbee \
            file://no-help2man.patch \
            file://0001-Fix-build-errors-with-clang.patch \
+           file://0001-addrdb-coord-config-parse.y-add-missing-time.h-inclu.patch \
            "
 SRCREV = "38f42dbfce9e13629263db3bd3b81f14c69bb733"
 
-- 
2.12.1


