Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id BDDAD71ADA
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Jul 2017 19:55:11 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id j186so18878028pge.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 01 Jul 2017 12:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=89ow62FB2IFaKZNAOogaOYwDMULRZnvViyal0DL4lKw=;
	b=RJDwQhgzfV/eXbbnncU1X92sQiYBMYhKF1BzkWQ5LzCLHG82ovnXFlmPeo+u67Ga4h
	dKJtzy0kWbLUUbnefN6Nwgn5Cz27pS1J0iicwIkJ4zDAF4G4/HLKqAxAQ9LPRHg8y0fe
	U17qDDAQUcknAviYs28WcVRhLpuL0+c/pcwxB2ZuHUcS+B5tpDfREcJ+bIRZ/nPvu3xE
	3hjZGCUKgzZSLBT4Nl1xVLs9MJGIe5ltLt9zflzWBgCVan8ekJUZjrzV98vlB8G7TQvS
	pp6R4GdEae/U/dD87NI4PQe7XCt7kOE7EnO0gsCijYwIOlwQEklTlA3+AcklwF/0l4pa
	hDkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=89ow62FB2IFaKZNAOogaOYwDMULRZnvViyal0DL4lKw=;
	b=sM2hX/gqjU2gBJjhju0PZMvAlnmPgPjSkEv+fPqEwt9L7yTyJniFVxoS58L7L40ahE
	SmzWoWd4XwZWMLAYPhvuE/ger61qz0JgC0hFoAnj2azO1x8d6Gd2nvVB3W/iKRmTwlXM
	LI/ZtBPA0HF0422epwD+0kwYw5YFX3m/w2r/it4w/meGaNH+CgzV+J5k3Ryafi6mZyKn
	F+j5xqtHaXBM79G1IgMCbYBMRfemZKaw7jKfuzS7KgOLEHBm3aad9nEqCVWGH40acvja
	/yfQr6U0MTCgdqzIwJz8KmTsvDc7jMN448TTa7Mhq0zr06jYrfMM6/Q0Dq0Z1TGl4an9
	S1YQ==
X-Gm-Message-State: AIVw1100fflhfEzTKnVRCfypqlBp/XJ0mj9m5zw+ElXFQeeLh3R8uTbA
	JdiLjSFiRH6akajI
X-Received: by 10.99.116.84 with SMTP id e20mr2089067pgn.225.1498938912369;
	Sat, 01 Jul 2017 12:55:12 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	22sm24048243pgb.23.2017.07.01.12.55.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 01 Jul 2017 12:55:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 Jul 2017 12:54:54 -0700
Message-Id: <20170701195455.36140-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
Subject: [meta-oe][PATCH 1/2] tinymembench: Disable on mips64
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
X-List-Received-Date: Sat, 01 Jul 2017 19:55:11 -0000

Not yet supported

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb b/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
index 5968d8213..8cb59da73 100644
--- a/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
+++ b/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
@@ -27,3 +27,7 @@ do_install() {
 #| {standard input}:82: Error: selected processor does not support Thumb mode `mla r3,r4,r3,r5'
 #| {standard input}:82: Error: unshifted register required -- `and r8,r7,r3,lsr#16'
 ARM_INSTRUCTION_SET = "arm"
+#
+# Does not work for 64bit mips.
+#
+COMPATIBLE_HOST = "^(?!mips64).*"
-- 
2.13.2


