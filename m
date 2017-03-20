Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2130172F18
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Mar 2017 05:32:25 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id 81so9910377pgh.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Mar 2017 22:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jfZkHZ+aP4MqCJbOK0LYHeu5FoWIFx8+ky9CuHoaY3Y=;
	b=ZqDND4wWdFTGqtTbElUeLOPumgV47h/5v+tJvIu0jT4Agg01Z1XlRqAHt3MYCfWU/b
	rs4keko5bMp0+StJzs3HwryOC7d8CXZ35UV7Uff6jAlyTWPq0JlOs5kMFa1iIFu3uDAD
	idPGoARDbfDhdDolfR2U4RRRGkSxYlZ7ARcyMYceccYm/PuMM/m4uizP8P470Xy8QEDr
	uxqmgzkMCwqul+56IEKXGRoOykDNMRSjG5WJEX8+0criEBpI5vOxAWHTilzRQ9ZTynlj
	v90LlUdvp+8EAES5bmnmoO2RkePSVHQbKz28LT7OSh3l6aky6qdbcFdtbQ2xhKyQZPYk
	qEcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=jfZkHZ+aP4MqCJbOK0LYHeu5FoWIFx8+ky9CuHoaY3Y=;
	b=bivMd4SaAWzTqExGaPMkVXm3mX6QhbFdJfAfIdhkyuoB8uxjIAIRPkmrJG5ZHxtHhZ
	Vk+JSdmMyd6dlNxw1lsBOlBv53bhjD5gtZzUnz+afgf+w6DZ9RiliU/S1UGryQosFb5o
	ghK5vamw09gdssZ5/cbCto+rFBL3UmJE3IulxWAQbjz7JGFNO+Buh9jPctlLpfBPyIHq
	IJy7p51PsopIA2QhdYx17/0K2IaAw4dI6dIAPN+6bg1Ul2TYunOrgcgVBVhvjSI+tPUx
	zUq4+WPgZKZtd0GRqmdPhZ5XKPMyJsAtsabQ9OtGvITBtkOmfJame8BMSLMsRNZLbRQ+
	lkdw==
X-Gm-Message-State: AFeK/H0Yx4CXF6/BzTpqzlpZ0FKDXTFPMo6fBHra1JUc/6XT37DKviobkeIrwRJfdhgxaw==
X-Received: by 10.99.39.194 with SMTP id n185mr28914060pgn.24.1489987947316;
	Sun, 19 Mar 2017 22:32:27 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	o189sm30203934pga.12.2017.03.19.22.32.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 Mar 2017 22:32:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 Mar 2017 22:31:51 -0700
Message-Id: <20170320053152.29352-15-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170320053152.29352-1-raj.khem@gmail.com>
References: <20170320053152.29352-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 15/16] memstat: Fix build with musl
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
X-List-Received-Date: Mon, 20 Mar 2017 05:32:26 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-Include-limits.h-for-PATH_MAX-definition.patch | 29 ++++++++++++++++++++++
 meta-oe/recipes-devtools/memstat/memstat_1.0.bb    |  3 ++-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/memstat/memstat/0001-Include-limits.h-for-PATH_MAX-definition.patch

diff --git a/meta-oe/recipes-devtools/memstat/memstat/0001-Include-limits.h-for-PATH_MAX-definition.patch b/meta-oe/recipes-devtools/memstat/memstat/0001-Include-limits.h-for-PATH_MAX-definition.patch
new file mode 100644
index 000000000..9a0a17e0e
--- /dev/null
+++ b/meta-oe/recipes-devtools/memstat/memstat/0001-Include-limits.h-for-PATH_MAX-definition.patch
@@ -0,0 +1,29 @@
+From 4b6c957372314562bf7b9117103e3a08643eb7b8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 18 Mar 2017 17:47:28 -0700
+Subject: [PATCH] Include limits.h for PATH_MAX definition
+
+Fixes
+
+error: use of undeclared identifier 'PATH_MAX'
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ memstat.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/memstat.c b/memstat.c
+index 5039fb0..3ff6ee4 100644
+--- a/memstat.c
++++ b/memstat.c
+@@ -19,6 +19,7 @@
+ #include <unistd.h>
+ #include <getopt.h>
+ #include <errno.h>
++#include <limits.h>
+ 
+ /* blacklist devices that just map physical memory */
+ char *blacklist[] = {
+-- 
+2.12.0
+
diff --git a/meta-oe/recipes-devtools/memstat/memstat_1.0.bb b/meta-oe/recipes-devtools/memstat/memstat_1.0.bb
index 825215372..91a9200c3 100644
--- a/meta-oe/recipes-devtools/memstat/memstat_1.0.bb
+++ b/meta-oe/recipes-devtools/memstat/memstat_1.0.bb
@@ -13,7 +13,8 @@ S = "${WORKDIR}/memstattool"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=87be186443b1ac2cfa466f475e1ee0cb"
 
 SRC_URI = "http://sourceforge.net/projects/memstattool/files/memstat_${PV}.tar.gz \
-          "
+           file://0001-Include-limits.h-for-PATH_MAX-definition.patch \
+           "
 
 SRC_URI[md5sum] = "2c3acc0c62b2a18f6601b84e54aa7462"
 SRC_URI[sha256sum] = "245d5fc7fb87bcfd14486cd34917cae2856e799559ac568434af12c4852bce94"
-- 
2.12.0


