Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id 542B9799D7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Sep 2018 16:46:46 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id t25-v6so2614209wmi.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Sep 2018 09:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=k22BfI1R8d7xviqx4wBMPcgbNRU+PqEaNNa/1w2ZKTw=;
	b=hvb7sGbX+Z5nsc+EYotA+iAoceyy0udRJ1iU1LIWszyd7pMT85PXy9b8ljFujhI0eO
	8xidajFGh+FH6pbOUo5c7FCQcoYzBmAzxuusHgE6RM9g7DxK4YlKcs01FSG0807/cixi
	ZX/+t+T2n7B9yaXvmbKCiovbrHkbLcccusDQhuRdDnRD3gbZPlSdUe8OB4HPLMDTY6+d
	DiyLfYVZlRs3lrD15LJX7pivaJA7tH1TfE+NIPoynZ/l521VCJdoJiKNuyzQa42tcdEG
	I1os8HzqWTkyuxcH+mpdSV9weSPF9ny7OAh6epIAoUbkOSEca2uNVQZFsLwpJbAkGow3
	LBkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=k22BfI1R8d7xviqx4wBMPcgbNRU+PqEaNNa/1w2ZKTw=;
	b=OtJkZ+5uA1RqjCnjyT7Zy+xxZnrDhN7zoISAIrRAQbht3cXvXcALH6lLElMvcnL5jV
	FCCaGhBA3M0GY8cH58Bv4x6hLjFSuqETuvue/UylDY5rnsgaMyaWuRRPl2GvTeM6p2zF
	5og9EbUTktoSYRZTETiYMSEDdWf4Fj0gr+JVOi1S8dlFt6qIhtOsaD7tabJ6z7NpdR+y
	p78QQ4QYHlqyPWcyTWcEP6a9duix50JtXBPiGZEB9X0Fs9BMhfdowYpjTe48tM7KhKJq
	uz1yTTdu84o4ic0OB62yKmI/45yTIu4/8ZSSv9aklYpprFUo30o/5T3XVZ5pTjXlLiHu
	t3rA==
X-Gm-Message-State: APzg51CKoxBoW49HN3jj7r0aFCEUSRLgPDQZ4N6X4EyWdpbwrd4BM3E6
	JdZNq70wD07CrykPPz/62/qWy1oI
X-Google-Smtp-Source: ANB0VdbILF0mCmO4toKcqRqMM5x2v/yb67BA95UBI91/QBrzqUI06pfI2Vau5EGRBQbuHV/RybsiZg==
X-Received: by 2002:a1c:545d:: with SMTP id
	p29-v6mr3096403wmi.94.1536943606826; 
	Fri, 14 Sep 2018 09:46:46 -0700 (PDT)
Received: from localhost.localdomain
	(host215-117-dynamic.54-82-r.retail.telecomitalia.it.
	[82.54.117.215]) by smtp.gmail.com with ESMTPSA id
	o6-v6sm1472205wmc.15.2018.09.14.09.46.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 14 Sep 2018 09:46:45 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Sep 2018 18:46:41 +0200
Message-Id: <1536943601-20427-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-initramfs][PATCH] klibc: fix build on i386 with GCC and security flags enabled
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
X-List-Received-Date: Fri, 14 Sep 2018 16:46:47 -0000

Disable pie for powerpc as in security_flags.inc.
Fix on i386: ld: discarded output section: `.got.plt'

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-devtools/klibc/klibc.inc | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index 3d25e96..b3d1568 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -47,7 +47,8 @@ EXTRA_OEMAKE = "'KLIBCARCH=${KLIBC_ARCH}' \
                 'KLIBCOPTFLAGS=${TUNE_CCARGS}' \
                  V=1 \
                 "
-EXTRA_OEMAKE += 'EXTRA_KLIBCAFLAGS="-Wa,--noexecstack" EXTRA_KLIBCLDFLAGS="-z noexecstack"'
+EXTRA_OEMAKE += "'EXTRA_KLIBCAFLAGS=${SECURITY_CFLAGS} -Wa,--noexecstack' \
+                 'EXTRA_KLIBCLDFLAGS=${SECURITY_LDFLAGS}'"
 
 export FIX_ARMV4_EABI_BX = "${FIX_V4BX}"
 KLIBCTHUMB = "${@['CONFIG_KLIBC_THUMB=n', 'CONFIG_KLIBC_THUMB=y'][(d.getVar('ARM_INSTRUCTION_SET') == 'thumb')]}"
@@ -74,5 +75,8 @@ KLIBC_ARCH_powerpc = "ppc"
 KLIBC_ARCH_powerpc64 = "ppc64"
 THIS_LIBKLIBC = "libklibc (= ${PV}-${PR})"
 
-SECURITY_CFLAGS = "-fno-PIE -no-pie"
-SECURITY_LDFLAGS = "-no-pie"
+SECURITY_LDFLAGS = "${@ '-z relro -z now -z noexecstack -pie' if '${GCCPIE}' \
+			else '-z relro -z now -z noexecstack' }"
+
+# SECURITY_CFLAGS for powerpc are disabled in security_flags.inc
+SECURITY_LDFLAGS_powerpc = "-z relro -z now -z noexecstack"
-- 
2.7.4


