Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id AFE766B5D1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Dec 2013 09:49:28 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id n15so5474746ead.36
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Dec 2013 01:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RNpcQe775cF9MnoFjcsx6zS7dpbq/ZjzjpQMixbeBMY=;
	b=g1PielIIj1TBZP2THZw+xOXlM419/+d5GeYAZaQvgpG5nPQDImhgSk/4p0WXpEMc5t
	VxI6TO7hCd2693Kaq3G2ZdJAOD2cstwYPT/BdcLRp70OUDVBI81w2xe+7g1drg/1SUZ0
	pYzC64XSyfsoMEZ3ToCqDdKkY/1aqiMJA2EGfo79odyd0pJ8VbbdbaXpuTJz91DunP/x
	PDn+qYLGFQyNRIvT3gpYKNHA70P+u83Ey9HlIk64iQ1wbTmrvS4zNuiEvyA5DED8VquJ
	ju2ROvHu7vqN0GOcvBoTgLR4W/PMt4oXmB+nb1yUccuDHvEIkCk5Ni1AXJnAiUN0dVMz
	Lesg==
X-Received: by 10.14.100.4 with SMTP id y4mr5845553eef.40.1388483369496;
	Tue, 31 Dec 2013 01:49:29 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	p45sm116632261eeg.1.2013.12.31.01.49.28 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 31 Dec 2013 01:49:28 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Dec 2013 10:49:14 +0100
Message-Id: <1388483363-28575-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
In-Reply-To: <1388483363-28575-1-git-send-email-Martin.Jansa@gmail.com>
References: <1388483363-28575-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][for-dora][PATCH 02/11] tbb: Disable thumb
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
X-List-Received-Date: Tue, 31 Dec 2013 09:49:29 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/tbb/tbb_4.1.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-oe/recipes-support/tbb/tbb_4.1.bb b/meta-oe/recipes-support/tbb/tbb_4.1.bb
index 96137bc..55212dc 100644
--- a/meta-oe/recipes-support/tbb/tbb_4.1.bb
+++ b/meta-oe/recipes-support/tbb/tbb_4.1.bb
@@ -30,3 +30,11 @@ do_install() {
     install -m 0755 ${B}/build/linux_*_release/lib*.so* ${D}${libdir}
     install -m 0644 ${WORKDIR}/tbb.pc ${D}${libdir}/pkgconfig
 }
+
+# fails with thumb enabled:
+# | arm-oe-linux-gnueabi-g++  -march=armv7-a -mthumb -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a9 -mcpu=cortex-a9 -D__ARM__ -D__LINUX_ARM_ARCH__=7 -funwind-tables -mvectorize-with-neon-quad -rdynamic --sysroot=/OE/sysroots/m14tv -c -MMD -DTBB_USE_DEBUG  -g -O0 -DUSE_PTHREAD -fPIC -D__TBB_BUILD=1 -Wall -Wno-parentheses -Wno-non-virtual-dtor -O2 -pipe -g -feliminate-unused-debug-types -fpermissive -fvisibility-inlines-hidden   -I../../src -I../../src/rml/include -I../../include ../../src/tbb/concurrent_queue.cpp
+# | {standard input}: Assembler messages:
+# | {standard input}:250: Error: thumb conditional instruction should be in IT block -- `strexeq r2,r3,[r4]'
+# ...
+# | make[1]: *** [concurrent_queue.o] Error 1
+ARM_INSTRUCTION_SET = "arm"
-- 
1.8.4.3


