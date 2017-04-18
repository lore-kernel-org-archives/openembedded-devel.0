Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f49.google.com (mail-pg0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id C35D371B50
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 18:22:20 +0000 (UTC)
Received: by mail-pg0-f49.google.com with SMTP id 72so493843pge.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 11:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9WDauMw7pcKwXeZkjwbNT2B/wxbtXpz+H15EJo3OoFY=;
	b=TVFFijz4DgLQYF9mS1BZB+kZrhG8oQnRNu8eKL9o33cIeIvwujilQQKgdhRfpZomua
	qqZAcwv1+GtY1fA/qZ2OgrFZOatcSdy2mq4Bpw3SAbkJSfZkx1a6g8qwU3k0bFROtkEA
	UsjQMYQEvpiRC3oSUC/oaeQGAtPJY0mkII+VbJ45FVFFs8d95NBf9OgxfioZ8FPrdOXI
	RJSn6LiZMck448psL63D6F92DgIeXD8d+jqtO1w68ZsC+/Cl0A+mdfhaBLhpOyTYe67Z
	wHBrZtpLLZVpY9YbeMnxHynW5Xxx1VGBI4NO9IAP0eoJIaen9zrucPQnskqAeG6AcqVB
	omYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9WDauMw7pcKwXeZkjwbNT2B/wxbtXpz+H15EJo3OoFY=;
	b=apoztG7kB+WM7f5iWei90fwo3XdvWi+P6Z8MCswDHMpd7TPsijkCIlhtiPgfZTLkmO
	GdEtc0odTAZQtyRYTygq2akCS4uN69baqxCCcO3SMhOGpPF++jIxiI1E/KRfuI0hfd6Z
	7xO7L4hIcFiQeO5188bXr4k0ZK64raCCKrrmq7AMXVKhnT79XkOdv8ltNnqnXmyq5rAG
	NiF4fEiQQE7PN/E5djzeFW3CmyYhmBeXIGCJlVFw//K/xPtM6mFfLzmVRWbOgFDqzwmW
	vPa8D8mOjkruevgQ0mdXnx3BCtClD/HrOeiV6wo/bmsdZmx1grL20UAtvoWM6g8VTcD/
	o0QA==
X-Gm-Message-State: AN3rC/5GgDH+QAqS9d7VnVvNEfduqOymn+UO4xUvMhpEg2T7h/RQZYzs
	El4BpqMUz6r8Ow==
X-Received: by 10.99.36.194 with SMTP id k185mr19338700pgk.201.1492539741804; 
	Tue, 18 Apr 2017 11:22:21 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	m29sm25402101pfj.32.2017.04.18.11.22.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Apr 2017 11:22:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Apr 2017 11:21:29 -0700
Message-Id: <20170418182142.27253-19-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170418182142.27253-1-raj.khem@gmail.com>
References: <20170418182142.27253-1-raj.khem@gmail.com>
Subject: [meta-oe][ 19/32] dash: Fix build with clang
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
X-List-Received-Date: Tue, 18 Apr 2017 18:22:20 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Fix-printf-format-errors-with-clang.patch | 28 ++++++++++++++++++++++
 meta-oe/recipes-extended/dash/dash_0.5.8.bb        |  4 +++-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/dash/dash/0001-Fix-printf-format-errors-with-clang.patch

diff --git a/meta-oe/recipes-extended/dash/dash/0001-Fix-printf-format-errors-with-clang.patch b/meta-oe/recipes-extended/dash/dash/0001-Fix-printf-format-errors-with-clang.patch
new file mode 100644
index 000000000..b3991faa8
--- /dev/null
+++ b/meta-oe/recipes-extended/dash/dash/0001-Fix-printf-format-errors-with-clang.patch
@@ -0,0 +1,28 @@
+From 3ddf397febf47f8de9ca2805e92355ecb3ba0e9f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 8 Apr 2017 12:37:54 -0700
+Subject: [PATCH] Fix printf format errors with clang
+
+error: format string is not a string literal (potentially insecure)
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/jobs.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/jobs.c b/src/jobs.c
+index c2c2332..dcb81c1 100644
+--- a/src/jobs.c
++++ b/src/jobs.c
+@@ -427,7 +427,7 @@ sprint_status(char *s, int status, int sigonly)
+ 				goto out;
+ #endif
+ 		}
+-		col = fmtstr(s, 32, strsignal(st));
++		col = fmtstr(s, 32, "%s", strsignal(st));
+ #ifdef WCOREDUMP
+ 		if (WCOREDUMP(status)) {
+ 			col += fmtstr(s + col, 16, " (core dumped)");
+-- 
+2.12.2
+
diff --git a/meta-oe/recipes-extended/dash/dash_0.5.8.bb b/meta-oe/recipes-extended/dash/dash_0.5.8.bb
index 4961d7b83..78ca60d6f 100644
--- a/meta-oe/recipes-extended/dash/dash_0.5.8.bb
+++ b/meta-oe/recipes-extended/dash/dash_0.5.8.bb
@@ -7,7 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b5262b4a1a1bff72b48e935531976d2e"
 
 inherit autotools update-alternatives
 
-SRC_URI = "http://gondor.apana.org.au/~herbert/${BPN}/files/${BP}.tar.gz"
+SRC_URI = "http://gondor.apana.org.au/~herbert/${BPN}/files/${BP}.tar.gz \
+           file://0001-Fix-printf-format-errors-with-clang.patch \
+           "
 SRC_URI[md5sum] = "5c152209680dab3c319e8923f6c51378"
 SRC_URI[sha256sum] = "c6db3a237747b02d20382a761397563d813b306c020ae28ce25a1c3915fac60f"
 
-- 
2.12.2


