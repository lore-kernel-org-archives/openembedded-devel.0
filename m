Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id CF98677BF4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jul 2017 05:40:24 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id d193so9391849pgc.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jul 2017 22:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=zKCstCNPQfXk4QD4gP2l5n9pGnSZRyU9CadeAMl9v6A=;
	b=pc7HBmetDnX2Ouu0RJajg556UC2Sycte7BqNDBD76nocoyNji+2NQ11H9R8xeCFl23
	iuYR4hW/D8ljWbUZi2BQHv4V5sWxa6djNw4qwVAG5tZoEzu2Y0M78Ga9tcDMV72FnDAL
	1dl5OamTV1rEHfw7IBRa3kgjmpQSt79J/JbP5SzTmLf5J1uEwIh4OUv9TY45imYeaZZk
	vFbe4wzT4ultdnu5sAf8AgMVQYq8fkS3gmxrAS/EwTt1dzvoK3hoDqOEmteyimzGBuzK
	ihfeHEWNfOe7Z2i4cpqT5EMkYWj/VSEm725faDGzO9fE+sTB/lFdYLeAJjL/1Aka4Cum
	mm8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zKCstCNPQfXk4QD4gP2l5n9pGnSZRyU9CadeAMl9v6A=;
	b=WCK9YCTsn9ZZblD3m1ggSr4jrnjBZ4BKE8tiF1335iAkA8+p+uaDunD8BKayoi51Kd
	s4trN1wqDFFZ3UQYPajAqONL2cSpAGekjDV9uVoXEcI1kGxziPwrkljKpRJu0pSs6eER
	uoj8KPPavYSHyoZXBz4NAd0Q6r2d4xfG+ATx27qBQPVD7mwxjxZKe/A3LDY2KRSwobge
	vX/EfFH/NH914OnTQW6lWeGJMOomo+vrF21chcD3CRLbAWpHc1sKYPat8jhtT+agozN+
	VX1ouL3lVHin9HjGTv+q7S5GcYK2XGfk6Sit7UOzjSzW5p0g9wIQK7a1/LJJevW55+sF
	R1eg==
X-Gm-Message-State: AIVw111OXSR1rryC7/LntPRMGb3OweiAp+4E7Rf+ZUFFacq82D4FrwsE
	3TXNPtNiXQLwE/NQ
X-Received: by 10.99.67.68 with SMTP id q65mr12655856pga.260.1500010825448;
	Thu, 13 Jul 2017 22:40:25 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id
	z86sm17519420pfl.40.2017.07.13.22.40.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Jul 2017 22:40:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Jul 2017 22:39:56 -0700
Message-Id: <20170714054013.34458-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
Subject: [meta-initramfs][PATCH 01/18] klibc: Fix build issue when default ISA is not thumb
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
X-List-Received-Date: Fri, 14 Jul 2017 05:40:25 -0000

We were passing empty string '' to make as option when
ISA was not thumb this breaks build for machines/distros
which do not use ARM_INSTRUCTION_SET = thumb

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-initramfs/recipes-devtools/klibc/klibc.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index c4c3e00b8..cd3f39808 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -42,7 +42,7 @@ EXTRA_OEMAKE = "'KLIBCARCH=${KLIBC_ARCH}' \
                 "
 
 export FIX_ARMV4_EABI_BX = "${FIX_V4BX}"
-KLIBCTHUMB = "${@['', 'CONFIG_KLIBC_THUMB=y'][(d.getVar('ARM_INSTRUCTION_SET') == 'thumb')]}"
+KLIBCTHUMB = "${@['CONFIG_KLIBC_THUMB=n', 'CONFIG_KLIBC_THUMB=y'][(d.getVar('ARM_INSTRUCTION_SET') == 'thumb')]}"
 
 do_configure () {
     ln -sf "${STAGING_DIR_TARGET}${exec_prefix}" linux
-- 
2.13.2


