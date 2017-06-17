Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 335A878372
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Jun 2017 17:21:59 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id y7so11054443pfd.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Jun 2017 10:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=I/TEG/28lrzCq+4KDovylwWlQeprOfKgMOUOFM3aPRY=;
	b=hK43TZHJn/T0Q8kcHen9gCXRe6KRKdYPvHhT6VALDFVzFYzXaMchFjYBtQjufR0rhJ
	pCavEgmCFGahsqIq4y8EcSQIpDxmrf45AKdi1TcM0/ZkNgnQZrBM4c7qPnPkFsKDgIPM
	3biAelM5n8G1C9OHF7c9aDyBHrRkg6fdM6nYkj/jOvz+jNk2wrgQ9EZa2mb0EfEXRc9z
	1FGu8ChlgqbAwMPEQZm6lhhRIEx9b1pG7dm6y4EIOrtNbsIOJbH72Wwh/jCnUsv9d0mO
	IvF+fG1A+1uz0/g0+EHjgQ5fibn6N2dOkUm81hJfgDRG5c/P4EzvzFzKNndwfgHUnBGf
	ccpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=I/TEG/28lrzCq+4KDovylwWlQeprOfKgMOUOFM3aPRY=;
	b=BabF+pUldmRO3ld4VzhUD3Xoq1jF2DdQE6eM9dmEC/OAD+dt94slmDExU+vWni84BI
	P4BshHm0m9uALzi+2Vq4qV59uKWRZyPn7ffhPonXtXrDGMtJOvLkNrvpySVDyqFoJFXI
	oF0QOJRp8Yoe9+zBRzeGa9+hpFwOmR2dMdW2jl9Xb9Ru5r/kNuzRAEeU9vLBR0bextnu
	DDWuSIRo8F8ai8+xKmeGUeC3jYf/zl/eVRT8yCom9o3xGa3JogHk87PQuzBpTIdB+KCF
	qC92amoJ4+DyDcuIHmuCA/VIt73C4i0ZrI6aizC4i/d5KwaLDZWK/noYSJeDP9B979bt
	M/NA==
X-Gm-Message-State: AKS2vOxKkEaQgjm86zQ8NYJ7niFhaKrkCigqpsNMKvO69B6bBR7e/UZo
	QVL9EpUHl5kQedvd
X-Received: by 10.84.254.11 with SMTP id b11mr19803296plm.209.1497720120964;
	Sat, 17 Jun 2017 10:22:00 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::36d3])
	by smtp.gmail.com with ESMTPSA id
	o12sm12201226pfi.9.2017.06.17.10.21.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 17 Jun 2017 10:21:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 17 Jun 2017 10:21:40 -0700
Message-Id: <20170617172142.1311-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.1
In-Reply-To: <20170617172142.1311-1-raj.khem@gmail.com>
References: <20170617172142.1311-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 7/9] tiobench: Fix build with hardening flags
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
X-List-Received-Date: Sat, 17 Jun 2017 17:22:00 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Specify-printf-formats.patch              | 49 ++++++++++++++++++++++
 .../recipes-benchmark/tiobench/tiobench_0.3.3.bb   |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/tiobench/tiobench-0.3.3/0001-Specify-printf-formats.patch

diff --git a/meta-oe/recipes-benchmark/tiobench/tiobench-0.3.3/0001-Specify-printf-formats.patch b/meta-oe/recipes-benchmark/tiobench/tiobench-0.3.3/0001-Specify-printf-formats.patch
new file mode 100644
index 000000000..cfd34f02a
--- /dev/null
+++ b/meta-oe/recipes-benchmark/tiobench/tiobench-0.3.3/0001-Specify-printf-formats.patch
@@ -0,0 +1,49 @@
+From b08e61ef64eece23ce8ffa2784cd3c4f70b6169e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 17 Jun 2017 08:08:56 -0700
+Subject: [PATCH] Specify printf formats
+
+Fixes
+tiotest.c:555:4: error: format not a string literal and no format arguments [-Werror=format-security]
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tiotest.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/tiotest.c b/tiotest.c
+index 6b3d0c3..3e6166a 100644
+--- a/tiotest.c
++++ b/tiotest.c
+@@ -91,7 +91,7 @@ inline void checkIntZero(int value, char *mess)
+ {
+ 	if (value <= 0) 
+ 	{
+-		printf(mess);
++		printf("%s",mess);
+ 		printf("Try 'tiotest -h' for more information.\n");
+ 		exit(1);
+ 	}
+@@ -101,7 +101,7 @@ inline void checkLong(long value, char *mess)
+ {
+ 	if (value < 0) 
+ 	{
+-		printf(mess);
++		printf("%s", mess);
+ 		printf("Try 'tiotest -h' for more information\n");
+ 		exit(1);
+ 	}
+@@ -552,7 +552,7 @@ void do_test( ThreadTest *test, int testCase, int sequential,
+ 		if(args.debugLevel > 4)
+ 		{
+ 			printf("Created %d threads\n", i);
+-			fprintf(stderr, debugMessage);
++			fprintf(stderr, "%s",  debugMessage);
+ 			fflush(stderr);
+ 		}
+ 	
+-- 
+2.13.1
+
diff --git a/meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb b/meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb
index 35af35fd3..427ce67d6 100644
--- a/meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb
+++ b/meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb
@@ -10,6 +10,7 @@ SRC_URI = "\
     file://tiobench-makefile.patch \
     file://avoid-glibc-clashes.patch \
     file://0001-Drop-inline-of-crc32-function-to-fix-build-using-GCC.patch \
+    file://0001-Specify-printf-formats.patch \
 "
 SRC_URI[md5sum] = "bf485bf820e693c79e6bd2a38702a128"
 SRC_URI[sha256sum] = "8ad011059a35ac70cdb5e3d3999ceee44a8e8e9078926844b0685b7ea9db2bcc"
-- 
2.13.1


