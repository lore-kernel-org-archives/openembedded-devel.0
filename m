Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id A7E277016E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2016 14:09:42 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id l68so118978154wml.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2016 07:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=62E47TwCC0g5c1bOQGZl4NJN6JAnMV1R1GTxd+yNtWI=;
	b=YS81Ktkls7oxsmmkYoNH0PJoWVBsHcsEWsWCoFbfreyCFFDhnLe70hiU/XZVNwI7J7
	7oAstvAigsyF6D9+t5KH5zvX/6H0CKFK231qq6vAt5VZBIDN5czhQLtYwJdX6vsxPYhJ
	JtQGagfVfrA59okJXi/ly/BN0+E+vUOud+e1FQ8mjMdUWbJTLN/ZRDdMmwxs4j1nOJWE
	qVUBKglqx95WCSfYjNrTrpI05nH+9Fd6f+TNnI1/0uhKGvIijVoeAn0/HSYGdC0jwmdo
	FduBv20rfQPnxzpK+/iCQaz1nvU5GuiGwA7C1IHqgWTCl7EbkAV95wB+n/BLVPhicRnv
	xF0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=62E47TwCC0g5c1bOQGZl4NJN6JAnMV1R1GTxd+yNtWI=;
	b=NEHEM7uqOBsVZPzWZXtyzW/MQl1tyt/+AB7BpMyw1mYt1OiHHHXbPlDvqMB9JrytHc
	00x/nNOeTCza+NbvHily7g0tQDFYghzgdbw2+foWfdku1BKepDcJnjlls/evIkXOjwU7
	q/9qgo6m3kR8TXZimJd5EngrIIOhF3iniSXS7sbwKXI6bUZuqrZHpexeno+qB7/uzDaB
	ET7kVsPetHvuadDDYHxKuZE3pNKgniz/WjthpYSgu3Vp7dU9C9ETVcG72pgNHO79rvnL
	hj38JOQJKYWYuEz5mdOsf/I4jLu/tjYQhNQ+1oonMJHdR4Kt1Ntpe6Ypz5FLPl/mt9hG
	ELwg==
X-Gm-Message-State: AD7BkJIZ6HwZ2tIq7jQyzAESjwL/PLqJGj08i+7VVyrkcuJrX4ow5LqydDBg/EkC1PLEYA==
X-Received: by 10.194.58.234 with SMTP id u10mr10307638wjq.174.1458223782806; 
	Thu, 17 Mar 2016 07:09:42 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id v82sm8312137wmv.6.2016.03.17.07.09.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Mar 2016 07:09:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Mar 2016 15:13:24 +0100
Message-Id: <1458224004-3050-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.3
Subject: [PATCH][RFC][meta-oe] luajit: fix build II
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
X-List-Received-Date: Thu, 17 Mar 2016 14:09:45 -0000

* previous fix didn't work very well, because host version really needs
  to use the same pointer size, so it's better to disable native builds
  completely and let HOST_LUA to be compiled in target build with
  correct params
* EXTRA_OEMAKE_append_mips64 = ' HOST_CC="${BUILD_CC} -m32"'
  looks like mistake, is mips64 using 32bit pointers?

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb | 32 +++++++++++++------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb b/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
index 9609469..4f1345d 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
@@ -13,26 +13,28 @@ S = "${WORKDIR}/LuaJIT-${PV}"
 
 inherit pkgconfig binconfig
 
-BBCLASSEXTEND = "native"
-
 do_configure_prepend() {
     sed -i 's:PREFIX= /usr/local:PREFIX= ${prefix}:g' ${S}/Makefile
     sed -i 's:MULTILIB= lib:MULTILIB= ${baselib}:g' ${S}/Makefile
 }
 
-EXTRA_OEMAKE = 'CROSS=${HOST_PREFIX} \
-                TARGET_CFLAGS="${TOOLCHAIN_OPTIONS} ${HOST_CC_ARCH}" \
-                TARGET_LDFLAGS="${TOOLCHAIN_OPTIONS}" \
-                TARGET_SHLDFLAGS="${TOOLCHAIN_OPTIONS}"'
-EXTRA_OEMAKE_append_powerpc = ' HOST_CC="${BUILD_CC} -m32"'
-EXTRA_OEMAKE_append_x86 = ' HOST_CC="${BUILD_CC} -m32"'
-EXTRA_OEMAKE_append_x86-64 = ' HOST_CC="${BUILD_CC}"'
-EXTRA_OEMAKE_append_powerpc64 = ' HOST_CC="${BUILD_CC}"'
-EXTRA_OEMAKE_append_arm = ' HOST_CC="${BUILD_CC} -m32"'
-EXTRA_OEMAKE_append_mips64 = ' HOST_CC="${BUILD_CC} -m32"'
-
-DEPENDS_append_class_target = " luajit-native"
-EXTRA_OEMAKE_append_class_target = " HOST_LUA=luajit"
+# http://luajit.org/install.html#cross
+# Host luajit needs to be compiled with the same pointer size
+# If you want to cross-compile to any 32 bit target on an x64 OS,
+# you need to install the multilib development package (e.g.
+# libc6-dev-i386 on Debian/Ubuntu) and build a 32 bit host part
+# (HOST_CC="gcc -m32").
+BUILD_CC_ARCH_append_powerpc = ' -m32'
+BUILD_CC_ARCH_append_x86 = ' -m32'
+BUILD_CC_ARCH_append_arm = ' -m32'
+
+EXTRA_OEMAKE_append_class-target = '\
+    CROSS=${HOST_PREFIX} \
+    HOST_CC="${BUILD_CC} ${BUILD_CC_ARCH}" \
+    TARGET_CFLAGS="${TOOLCHAIN_OPTIONS} ${TARGET_CC_ARCH}" \
+    TARGET_LDFLAGS="${TOOLCHAIN_OPTIONS}" \
+    TARGET_SHLDFLAGS="${TOOLCHAIN_OPTIONS}" \
+'
 
 do_compile () {
     oe_runmake
-- 
2.7.3


