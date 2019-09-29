Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id A87807F273
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Sep 2019 23:55:20 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id b128so4515847pfa.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Sep 2019 16:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=zhL90kITEdvR3O8Xziu0SXEcH4fCgbnJ3ng0fWMkiX8=;
	b=RX6LsLAftDVkTVAWNY7nou2v9CiYraHQxIKADmvWmX7JIWKhw9GXBcgeqSLDVXs4kX
	+L3epV2keE2sG8FKsjHke2SuFnfrsJ4lDW42JCqDKC9X87cucR8A/sXTh4T9QWtbogQe
	EKbQ+VZWNebvbLBOXvKUbiM3Vm0tz/jAg/5gXnsj/6TAwuChOMIA4iqRMDbVYB+3niLV
	uZEA7BLUmnx/11Z6ftvSsZ/ehr0rRWVYcOwfTXE5TjiBjrFmjdHgRrKqhOHn6NGl4zmJ
	kyhgb0NDrWJvP341kax4UWgJWVwr77c566a4gDUM3fGdeXcKj/0IghLDVzZwFEnaVgcJ
	j4Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=zhL90kITEdvR3O8Xziu0SXEcH4fCgbnJ3ng0fWMkiX8=;
	b=M6Vp1H4H0t1FZy1UsXfZjwGZ8PA/Z5U9boXBsaR0W9mq3y1nuiYaAUBe0tnnvCjSnU
	1gXXyHKgG0DortR2go5Wi3sUST4FaMSZEZdHWEwZTM+g5eSVZhUvepvb9OXQJ5Flh1I2
	wSz+F8TU/z1+NHjfVsfal1l8HCIebqJeIgy3Fn+RQybFlq8GvsVUQfyRK4ZyNkPz38X/
	1xmYk4KFXvmQULdJG2/Ru9MxvuplHYX960PXtrTbnrEcIaQAhzGTupM81FlO+yRf/Rou
	FKmnCqidCzzN11wVfPf76nc0uZyu2Q8DPgIrmsiNi7ewmkxgqm5U/mpPzncCS2SHk5bq
	DY7w==
X-Gm-Message-State: APjAAAXgsRD4x64phPMRxlEmPBMTXvAgNFzXAb4p97NUD1dRzF7fby1T
	AUHWPdZko4JgymkCjyLfiag8lC14994=
X-Google-Smtp-Source: APXvYqzIFKwPAstJj2io1ixKifn9LuExRqf9PMTAByyoSZYOPP3qJBOwIq/wRQw5o6FayfQSHQFrYA==
X-Received: by 2002:a65:5043:: with SMTP id k3mr21950070pgo.406.1569801321553; 
	Sun, 29 Sep 2019 16:55:21 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:edf9:811d:ad92:85c2])
	by smtp.gmail.com with ESMTPSA id
	p190sm14474778pfb.160.2019.09.29.16.55.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 29 Sep 2019 16:55:20 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 Sep 2019 16:55:02 -0700
Message-Id: <cede91ddd57fb3ffc6212866c32dac3158c89e56.1569801183.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569801183.git.akuster808@gmail.com>
References: <cover.1569801183.git.akuster808@gmail.com>
Subject: [warrior-next 04/10] klibc: Pass -fno-builtin-bcmp with musl/clang combo
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
X-List-Received-Date: Sun, 29 Sep 2019 23:55:20 -0000

From: Khem Raj <raj.khem@gmail.com>

clang would emit bcmp built-in for musl bases system
but here we do not link in musl C library, so its best
to disable it

Fixes
git/usr/klibc/memmem.c:38: undefined reference to `bcmp'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andrea Adami <andrea.adami@gmail.com>
(cherry picked from commit 11bc2775af3e47399ac268a2e6fbd63185e478ef)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-initramfs/recipes-devtools/klibc/klibc.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index 5805448..7faf0ca 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -33,6 +33,9 @@ ARMPATCHES_arm = "file://klibc-config-eabi.patch \
 
 S = "${WORKDIR}/git"
 
+OPTFLAGS = "${TUNE_CCARGS} -Os"
+OPTFLAGS_append_libc-musl_toolchain-clang = " -fno-builtin-bcmp"
+
 PARALLEL_MAKE = ""
 EXTRA_OEMAKE = "'KLIBCARCH=${KLIBC_ARCH}' \
                 'CROSS_COMPILE=${TARGET_PREFIX}' \
@@ -43,7 +46,7 @@ EXTRA_OEMAKE = "'KLIBCARCH=${KLIBC_ARCH}' \
                 'INSTALLDIR=${libdir}/klibc' \
                 'SHLIBDIR=${libdir}' \
                 '${KLIBCTHUMB}' \
-                'KLIBCOPTFLAGS=${TUNE_CCARGS} -Os' \
+                'KLIBCOPTFLAGS=${OPTFLAGS}' \
                  V=1 \
                 "
 
-- 
2.7.4


