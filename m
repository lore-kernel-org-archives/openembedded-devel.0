Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id 2A3E4799BF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Sep 2018 18:02:19 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id r1-v6so1021084wmh.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Sep 2018 11:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=rQk5iSPs2eL6LjJ6OIzK9ERKz3RLRhJbrjl+48hYlV0=;
	b=uc2HCkomXzfARGmYx7tykAY+HJJetqz5xaY6+9BUZ2xAbhLpUXS0yEnoNbfEUkfQ+G
	oPpSb1of7pKJiWSXW2+4NB1BXjJCSVYgafDxutKIGdmTr6FoCAeWuK+TfXhbyTxgNPEq
	tw63FYHVgQ7m5Lo1M52PN3kwBIXZKKqgbFkQyYrSfsxguW6Rg1wOsBMN+oFaBOEmj9px
	ZOsc9mCGjIgSIDZ4+8KzwLd/tJperB9n8e5D8sFhMUaj8EfpRX9231cbTu9WbTm1gxka
	qv/vw4uyS9B0EEYZLd1qRt3taEXpo3yioORFZtzWMzR+pmbrOmNxUVWccjn2mYypH0OR
	Cbsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=rQk5iSPs2eL6LjJ6OIzK9ERKz3RLRhJbrjl+48hYlV0=;
	b=NS+LEO+5wCNNoA+WDzoBRrIE4oyj3eO72lh8eAh4adU8DHsSyjZBwnDBOK3e6HNGbh
	SGG845a15ZxTP7FjwN1TxjnWnotAyDvo0n7edbRThBA5TTZaiVQ8Meila+iPVHvs0VpN
	rfGbyYNnB0Com5vNiMhlqRLEWS+x6w2NND1KDYRYaQ4pNttWiprv3ljX5TOStd2u0v1g
	LpZl/9Fohxm8+5cyE5ZKL3ApKmQ+muUtpesRtyQxqHWEQ00hrcrUY+PWy+pkg2IB23Ht
	svrdwd29FQhSuIL2HLvK72vaCyvENyTLnhrwHtuD2nb96XIL/b5EGwPJposqBjj04ILT
	o5qA==
X-Gm-Message-State: APzg51AUBWkXFimIKGoDn2/NZyqFgDuGbP0Qth0Adb15TReGFTC2RLG0
	A5IAuAm5RLwxM/m7eOI9zSw09mvL
X-Google-Smtp-Source: ANB0VdaXsiaPHK/EA5ohk1GWx+l6hKd5Vzw8/lDgJ5+aU6iZrtZEJdYZrmBhvHCIeyvTgafumccTsw==
X-Received: by 2002:a1c:1252:: with SMTP id 79-v6mr3212782wms.70.1536948139485;
	Fri, 14 Sep 2018 11:02:19 -0700 (PDT)
Received: from localhost.localdomain
	(host215-117-dynamic.54-82-r.retail.telecomitalia.it.
	[82.54.117.215]) by smtp.gmail.com with ESMTPSA id
	a9-v6sm3516997wmf.28.2018.09.14.11.02.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 14 Sep 2018 11:02:18 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Sep 2018 20:02:15 +0200
Message-Id: <1536948135-11493-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-initramfs][PATCH v2] klibc: fix build on i386 with GCC and security flags enabled
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
X-List-Received-Date: Fri, 14 Sep 2018 18:02:19 -0000

ld fails if distro's security-flags are enabled:
Inject the SECURITY_XFLAGS if security_flags.inc was included.

Fix on i386: ld: discarded output section: `.got.plt'

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-devtools/klibc/klibc.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index 3d25e96..837b026 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -47,7 +47,8 @@ EXTRA_OEMAKE = "'KLIBCARCH=${KLIBC_ARCH}' \
                 'KLIBCOPTFLAGS=${TUNE_CCARGS}' \
                  V=1 \
                 "
-EXTRA_OEMAKE += 'EXTRA_KLIBCAFLAGS="-Wa,--noexecstack" EXTRA_KLIBCLDFLAGS="-z noexecstack"'
+EXTRA_OEMAKE += "'EXTRA_KLIBCAFLAGS=${SECURITY_CFLAGS} -Wa,--noexecstack' \
+                 'EXTRA_KLIBCLDFLAGS=${SECURITY_LDFLAGS} -z noexecstack'"
 
 export FIX_ARMV4_EABI_BX = "${FIX_V4BX}"
 KLIBCTHUMB = "${@['CONFIG_KLIBC_THUMB=n', 'CONFIG_KLIBC_THUMB=y'][(d.getVar('ARM_INSTRUCTION_SET') == 'thumb')]}"
@@ -74,5 +75,4 @@ KLIBC_ARCH_powerpc = "ppc"
 KLIBC_ARCH_powerpc64 = "ppc64"
 THIS_LIBKLIBC = "libklibc (= ${PV}-${PR})"
 
-SECURITY_CFLAGS = "-fno-PIE -no-pie"
-SECURITY_LDFLAGS = "-no-pie"
+SECURITY_LDFLAGS = "${@'-z relro -z now -pie' if '${GCCPIE}' else ''}"
-- 
2.7.4


