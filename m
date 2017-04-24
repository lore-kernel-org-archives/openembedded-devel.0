Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 1475971D8C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 05:21:14 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id a103so178090897ioj.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Apr 2017 22:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=unCkJlscsKvxVGKLdp90nvmgEOhLlnV0v4Y45/JD2TE=;
	b=qsDuASNTGxmMcbRNG1ZWnawwYrP920E0Rj7TKjiHrda6KNuYTkxJOTacxLkPPccy8z
	C5Yhy+WUXWZXqJdtatAvzPS9ayaEJnvCp4FGbYfnug84HtSH9KNRuuKUjTaLXNuwSJ7g
	qoJcYrUFmUXXts5HYf0K6KyZAkS+/68a8q0ArSVTAJiqS+QAlNjwSDzAsh87FX5DExnZ
	P6F28dmrZUNgsddIy2aKDy1RXCtn0T1r5LYn+Qm8KyCBKp40cbx/dqqZjNTxAtsRnjyh
	KwDiuJh66FKQggJxkG1uPjNg6z1QHcvJYNd4uQJrOzmtKPXTEgCRKEOhPkx2fig1CElP
	Isqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=unCkJlscsKvxVGKLdp90nvmgEOhLlnV0v4Y45/JD2TE=;
	b=rESa++920xoamGnXpwj1x75/sIz4ltuwHUhdosuh3UN9ayJLfcuXtg2QWf3/0yKqF3
	Wtqvc4wVYfwTIxxJk/ptu7r3hzMHuuThCMBYSKR9RVetD1ky1FhMmSdFAB7LYQpc/4/A
	Iv9XKtYXWu7MeRKhKCIBwyncZ+OYQAmGgfdedoO+0n/umoj3piihwi6KY/gEK59G5bv9
	64iL1O3Trhg5Yv9Omd2339p0FhrhGH4vldOAe1zKwfj/HwZEX0Cw+ZX0KRd4mXPI7cyt
	XeKH2g0REbjLvjdGW70jjxLha7BnUHh3iXrTc5/DkjJtdDZJPics4cLTkhUQ4Yja41Lh
	vGaw==
X-Gm-Message-State: AN3rC/6hNmbLZQBDBWppqEpyw01Y6y9awd+syUK0dU/y1yVSofASnPbe
	N9kvfAqe7rA4Bg==
X-Received: by 10.98.152.215 with SMTP id d84mr22764165pfk.7.1493011275270;
	Sun, 23 Apr 2017 22:21:15 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	v13sm24001176pgo.44.2017.04.23.22.21.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 23 Apr 2017 22:21:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Apr 2017 22:20:43 -0700
Message-Id: <20170424052058.4952-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170424052058.4952-1-raj.khem@gmail.com>
References: <20170424052058.4952-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 02/17] ltrace: Fix FTBFS due to invalid code in ARM support
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
X-List-Received-Date: Mon, 24 Apr 2017 05:21:16 -0000

Found with gcc7

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...s-unreachable-code-after-switch-statement.patch | 40 ++++++++++++++++++++++
 meta-oe/recipes-devtools/ltrace/ltrace_git.bb      |  3 +-
 2 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/ltrace/ltrace/0001-ARM-code-has-unreachable-code-after-switch-statement.patch

diff --git a/meta-oe/recipes-devtools/ltrace/ltrace/0001-ARM-code-has-unreachable-code-after-switch-statement.patch b/meta-oe/recipes-devtools/ltrace/ltrace/0001-ARM-code-has-unreachable-code-after-switch-statement.patch
new file mode 100644
index 000000000..4d0e0392f
--- /dev/null
+++ b/meta-oe/recipes-devtools/ltrace/ltrace/0001-ARM-code-has-unreachable-code-after-switch-statement.patch
@@ -0,0 +1,40 @@
+From 95ff340a74af16cca89fd5c5ca99890821053209 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 22 Apr 2017 00:47:16 -0700
+Subject: [PATCH] ARM code has unreachable code after switch statement move
+ initialization
+
+Fixed
+sysdeps/linux-gnu/arm/trace.c:173:33: error: statement will never be executed [-Werror=switch-unreachable]
+    uint32_t operand1, operand2, result = 0;
+                                 ^~~~~~
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ sysdeps/linux-gnu/arm/trace.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/sysdeps/linux-gnu/arm/trace.c b/sysdeps/linux-gnu/arm/trace.c
+index 5e51e91..f974d1f 100644
+--- a/sysdeps/linux-gnu/arm/trace.c
++++ b/sysdeps/linux-gnu/arm/trace.c
+@@ -155,6 +155,8 @@ arm_get_next_pcs(struct process *proc,
+ 	const unsigned cond = BITS(this_instr, 28, 31);
+ 	const unsigned opcode = BITS(this_instr, 24, 27);
+ 
++	uint32_t operand1, operand2, result = 0;
++
+ 	if (cond == COND_NV)
+ 		switch (opcode) {
+ 			arch_addr_t addr;
+@@ -170,7 +172,6 @@ arm_get_next_pcs(struct process *proc,
+ 		}
+ 	else
+ 		switch (opcode) {
+-			uint32_t operand1, operand2, result = 0;
+ 		case 0x0:
+ 		case 0x1:			/* data processing */
+ 		case 0x2:
+-- 
+2.12.2
+
diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
index a5960f5b0..60af5425e 100644
--- a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
+++ b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
@@ -20,7 +20,8 @@ SRC_URI = "git://anonscm.debian.org/collab-maint/ltrace.git;branch=master \
            file://0001-replace-readdir_r-with-readdir.patch \
            file://0001-Use-correct-enum-type.patch \
            file://0002-Fix-const-qualifier-error.patch \
-          "
+           file://0001-ARM-code-has-unreachable-code-after-switch-statement.patch \
+           "
 S = "${WORKDIR}/git"
 
 inherit autotools
-- 
2.12.2


