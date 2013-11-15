Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f181.google.com (mail-ea0-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 11C646D742
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2013 20:58:06 +0000 (UTC)
Received: by mail-ea0-f181.google.com with SMTP id q16so1246105ead.40
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2013 12:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=AH09XnQrjWoK59mG9Oguky6rdfBgGIGsUxy2CLumJW4=;
	b=mWALlHTXBAot+/eaGcryBT7ZB+oDkn+Fe1SHGKvstqHu8P2JRvNtrZHuDwy+reKKKo
	gR+6Igmk4WYqQgVTnVWO8kOFIFhXB11+xT/3WCIN0OE3ed+mN1n58CcoLOah/cva5lBQ
	WDhRaQmrzXftLHYQncbvIIOcwJ84EZo9jIHU+OJSQ93MI1dJFSye67PleopBXu/Lx47+
	R1Dyl/6+AQSMexjERtpWaItUlXbeAt2c3BOZmCivb/oqVHmA2gUPBzt3QOc2q44mtEUJ
	pKEKcPpyZrZE7+8y2xggpusbT3p52wnHpCorOvQJmBpnk153KuCDbNGr3Mdm/ymW20HJ
	+e6A==
X-Received: by 10.14.224.132 with SMTP id x4mr5143953eep.5.1384549088602;
	Fri, 15 Nov 2013 12:58:08 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id k7sm9809087eeg.13.2013.11.15.12.58.07
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Nov 2013 12:58:08 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Nov 2013 21:58:31 +0100
Message-Id: <1384549112-5646-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
Cc: Martin Jansa <martin.jansa@lge.com>
Subject: [meta-oe][PATCH 1/2] tbb: Disable thumb
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
X-List-Received-Date: Fri, 15 Nov 2013 20:58:07 -0000

From: Martin Jansa <martin.jansa@lge.com>

Signed-off-by: Martin Jansa <martin.jansa@lge.com>
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


