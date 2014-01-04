Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 6862260D27
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  4 Jan 2014 11:14:03 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id b57so7058775eek.17
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Jan 2014 03:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=RNpcQe775cF9MnoFjcsx6zS7dpbq/ZjzjpQMixbeBMY=;
	b=hqeX6M3pzTLvyGmYqVMalubxkCkff2+nakCzq1BYbR2VZgPbNynekuljnGWOl6juF9
	ZXZ/dKpuPICSLjyIuAwwSHjBqBL+8TN503q9SIr1snvbsKv55AcUMS5Lu+t1JPpM3gm1
	Qu3yE07CXw3S80meOpcuJxo/WYlSfR3UykPpiAqrvg3oJC1DxNlO4RnrZbYt3RNSSE/+
	45BDaal4KUWsN1kcOxUpMPrTlpHVEr1/8oMomu2oGEq7fDB5QNaWzKVDrg1nE5cZ7CCx
	RASCn8Hvm0h2nW8DIW1dGPc/OWHYFigiJ9K3iF10EFcg/qNr1781AXRB3Vg8dttgd2ME
	eEnw==
X-Received: by 10.15.86.75 with SMTP id h51mr25499029eez.44.1388834044083;
	Sat, 04 Jan 2014 03:14:04 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	a51sm152656650eeh.8.2014.01.04.03.14.03 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 04 Jan 2014 03:14:03 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  4 Jan 2014 12:13:57 +0100
Message-Id: <f3dd547aff38e952213392b2176e980dd7d76d95.1388833883.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
In-Reply-To: <cover.1388833883.git.Martin.Jansa@gmail.com>
References: <cover.1388833883.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1388833883.git.Martin.Jansa@gmail.com>
References: <cover.1388833883.git.Martin.Jansa@gmail.com>
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-oe][for-dylan][PATCH 1/9] tbb: Disable thumb
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
X-List-Received-Date: Sat, 04 Jan 2014 11:14:03 -0000

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


