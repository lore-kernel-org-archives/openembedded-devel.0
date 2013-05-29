Return-Path: <net147@gmail.com>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id A3C486A4DE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 May 2013 02:56:27 +0000 (UTC)
Received: by mail-pd0-f172.google.com with SMTP id 10so8375623pdi.17
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2013 19:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=CdaPljWmk3GwmJIMMG+b5asIVkr8f3C+hBJ473JvveQ=;
	b=CLnrSFDUR/lumQlRhHdDuePD6rMFGTAHM+F8Oy5OIQTXivhBkO0OWfRKTJ36qFJ3mq
	73gtKfVfgY7LzuUjsZfvUAjhYRZsRSNjYXPJXLXh29SRuBpQLqJD7FPvMlPsLf9GzUEF
	LpLPwM6v49pz86WKAR+D2sl5DucWdIt9IoutD3bNzor0j3xn9isvy+R3+2JUUzNkKISz
	mo0jQyK/q5Mx9zrnoZmKPVBSAH9qlUBs+fqEr5DuoqWG+ehv50yaSbjuT0Bkm0etcwRm
	T0HSj28C1K0KM5CwT3SGtMFUQCDUj/r53SeBrpB8kG3lyG8k+bUFHn6koSt+gxhwuEem
	gQ7A==
X-Received: by 10.66.119.49 with SMTP id kr17mr1210567pab.149.1369796188368;
	Tue, 28 May 2013 19:56:28 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	ue8sm37740672pac.14.2013.05.28.19.56.26 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 28 May 2013 19:56:27 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 May 2013 13:09:30 +1000
Message-Id: <1369796970-8863-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
Subject: [meta-oe][PATCH] llvm2.9: allow parallel native make
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 May 2013 02:56:27 -0000

It builds fine with parallel make.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta-oe/recipes-core/llvm/llvm2.9_2.9.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-core/llvm/llvm2.9_2.9.bb b/meta-oe/recipes-core/llvm/llvm2.9_2.9.bb
index 2b46162..ee7c3a3 100644
--- a/meta-oe/recipes-core/llvm/llvm2.9_2.9.bb
+++ b/meta-oe/recipes-core/llvm/llvm2.9_2.9.bb
@@ -15,8 +15,6 @@ ARM_INSTRUCTION_SET = "arm"
 
 SRC_URI_append_libc-uclibc = " file://arm_fenv_uclibc.patch "
 
-PARALLEL_MAKE_virtclass-native = ""
-
 LLVM_EXTRA_ARCH = "X86;"
 LLVM_EXTRA_ARCH_x86 = ""
 LLVM_EXTRA_ARCH_x86-64 = ""
-- 
1.8.2.3


