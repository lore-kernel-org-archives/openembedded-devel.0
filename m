Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 99DDE781DC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jul 2017 22:14:24 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id d193so4508705pgc.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jul 2017 15:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=zKCstCNPQfXk4QD4gP2l5n9pGnSZRyU9CadeAMl9v6A=;
	b=A72PHyxG3adjHh69rqArIp+YKtPKw7jB9OxORjgStv22ZPEp5RPPBTYUOSENTvplh8
	XwTAxzZy00YeHtsDAfkJMMyl1XHbNatzCI5YB3+3GntmYSqiCghZ79hQOMExzU3tZbCY
	9zXEX5yxrJGCTVU+aSoNtzEUg/TQ7Cu52ThlhP5RJLF0XEKhzidQH87birdLYVkbuDG2
	CK7K/BUPQlTJhamGuKtU7nbA31wGbZx3Nk2147YoKsBtSNa/2Y0nW7ueO1tqDHWT9rs5
	5o/+GZUL25g9rqUlnYCuG582ntz2O+B+6OhQJ7+IPeJsLnYBVgufSBBMLkFu4Uu1oygz
	2m/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zKCstCNPQfXk4QD4gP2l5n9pGnSZRyU9CadeAMl9v6A=;
	b=h8B0qkEQnjFS/6Laf22yQpHyaHVxP9woYigKPIE4zYsylIQ2G4alBSRpdmvxYTrusN
	lcE/8U65Uuc6UQD/jwxyTeSuGOCrrjSezLgKoZIe0Iti5nfFxKCQru+3icDV/4EiW0bz
	E0IREQJdYo/9S4mh+Bbz8Wum3RdNkuTJA99F+jCOlPfQqx616RJ2LNcpVyEArPYB7Pz1
	ANsDtG+k8gOhAdfmRTekYgQ5PSd8hsf0CjqNDyiw8F8kJfVm4W/SuSa+tzR1AW5LYKy0
	P7xeriraUDQnnnoKd1eFVqgYpoMNkyjy8A/kk79NS86aP9/od99qEcOXHo2n/2KQW9PW
	8m4A==
X-Gm-Message-State: AIVw111OQi8Amwmks/vr5HQgr6x/bN0BZe0vyOl9byMf1bU73Ub7NgKE
	ilLBnyd70Dg9FZgn
X-Received: by 10.98.8.93 with SMTP id c90mr16808513pfd.213.1499897665256;
	Wed, 12 Jul 2017 15:14:25 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id v9sm9546510pge.26.2017.07.12.15.14.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Jul 2017 15:14:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Jul 2017 15:14:13 -0700
Message-Id: <20170712221413.21764-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
Subject: [meta-initramfs][PATCH] klibc: Fix build issue when default ISA is not thumb
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
X-List-Received-Date: Wed, 12 Jul 2017 22:14:24 -0000

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


