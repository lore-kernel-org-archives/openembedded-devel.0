Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6E89965CBF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jul 2016 13:54:22 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id x83so2547500wma.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jul 2016 06:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Aap55YgG7O2jdFm6ItjHsSYLmzKiWSGzUClv3px1qzc=;
	b=HdCgi399wYsbkpY18fBltd2y0ydvE3lQfNY9Vx+jaot5woJZ3tmOBzqXwdiGtp1pDA
	Qw+ZP1SjUvxRW4HHE7RM27JppE4HGduoiu1dNzVkIJ2eFQjBdVaMHwDaEVsZs4m34gTZ
	AH4g5caO+FZV94TSGVcKNaclSkm1cmk47Hze5gZIc4OWgz0Hvj02ncmf9MLsQiT7s8RS
	ocjM5pgC7dg8qzFNXtaW73I7HoW0AET/kdkM9IJEpwUA+VoaE3rfOjP6Sn2CXRiaMps+
	+fImUv1molCrf+IWJo/pME4st/HY+Hya4sfcHtpDpJJJU+G2KQ7E2XZcp8I7aoqxdHvS
	T+8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Aap55YgG7O2jdFm6ItjHsSYLmzKiWSGzUClv3px1qzc=;
	b=QW4VC9b31BN/t7Tbgfv5YPZmgRSZs2k1SSdkDQnAOCDGFcRAsQKSZG6IgPPqWjwh5T
	NVMwqHivEIWCL+0YFy8WlaZzplnT3NzAFeDL170j9B8Jm+dsfUYwRqMDBepGgAZjmPLd
	M4ICfOS3MX+qVnuCmH/TKSbOOalyWXAE5ZNB2nfaX9PsH2lWnhkvSTE0f3ZyZgXltmsc
	PYfMO5d13V4yrgt8o+FNsUUWE0ICEAO+smLJo/htKIitU08haL51qITpHZrgPI4Uk7BX
	lp5JkSuoJfqE9H1Voymsf9Q2tf82lqbDmHsVezmrDvid+5yj/Eo+oMUju1V++luxQr5O
	MAyQ==
X-Gm-Message-State: ALyK8tIOKkj9jZYsUJBA/IhTYkaCtwuq0EnFmbk6/p89Asfb/ZVje4eX6pJ5LyKnCC4yQw==
X-Received: by 10.28.26.69 with SMTP id a66mr17033807wma.8.1469109263301;
	Thu, 21 Jul 2016 06:54:23 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	v203sm4300180wmv.2.2016.07.21.06.54.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Jul 2016 06:54:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Jul 2016 15:54:28 +0200
Message-Id: <20160721135428.6275-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.9.2
Subject: [meta-networking][PATCH] meta_networking_security_flags.inc: add weak assignment for lcl_maybe_fortify
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
X-List-Received-Date: Thu, 21 Jul 2016 13:54:26 -0000

Without this it breaks builds which don't include
conf/distro/include/security_flags.inc
with:
lcl_maybe_fortify = "${@base_conditional('DEBUG_BUILD','1','','-D_FORTIFY_SOURCE=2',d)}"

because then lcl_maybe_fortify isn't defined and gcc in c-ares
do_configure gets it unexpaned and fails:

configure:3926: checking whether the C compiler works
configure:3948: arm-oe-linux-gnueabi-gcc -march=armv7-a -mthumb -mfpu=neon -mfloat-abi=softfp -mcpu=cortex-a9 -mtune=cortex-a9 -funwind-tables -rdynamic -Os
--sysroot=/OE/sysroots/MACHINE -O2 -pipe -g -feliminate-unused-debug-types
-fdebug-prefix-map=/OE/work/MACHINE-oe-linux-gnueabi/c-ares/1.10.0-r0=/usr/src/debug/c-ares/1.10.0-r0 -fdebug-prefix-map=/OE/sysroots/x86_64-linux=
-fdebug-prefix-map=/OE/sysroots/MACHINE= -Os ${lcl_maybe_fortify} -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed conftest.c  >&5
arm-oe-linux-gnueabi-gcc: error: ${lcl_maybe_fortify}: No such file or directory

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../conf/distro/include/meta_networking_security_flags.inc            | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/conf/distro/include/meta_networking_security_flags.inc b/meta-networking/conf/distro/include/meta_networking_security_flags.inc
index 06802d6..19e13ea 100644
--- a/meta-networking/conf/distro/include/meta_networking_security_flags.inc
+++ b/meta-networking/conf/distro/include/meta_networking_security_flags.inc
@@ -2,5 +2,9 @@
 # | configure:3479: using CFLAGS:  -O2 -pipe -g -feliminate-unused-debug-types -fstack-protector-strong -pie -fpie -D_FORTIFY_SOURCE=2
 # | configure:3485: CFLAGS error: CFLAGS may only be used to specify C compiler flags, not macro definitions. Use CPPFLAGS for: -D_FORTIFY_SOURCE=2
 # | configure:3516: error: Can not continue. Fix errors mentioned immediately above this line.
+
+# Make sure it's at least empty in builds which don't include
+# conf/distro/include/security_flags.inc
+lcl_maybe_fortify ?= ""
 TARGET_CFLAGS_remove_pn-c-ares = "${lcl_maybe_fortify}"
 TARGET_CPPFLAGS_append_pn-c-ares = "${lcl_maybe_fortify}"
-- 
2.9.2


