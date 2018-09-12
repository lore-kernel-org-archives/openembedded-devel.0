Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1C85579498
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Sep 2018 04:59:36 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id u11-v6so370197plq.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Sep 2018 21:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=e3R+93W1uk8L/IoxxjsdEpXAxiOzNJuaZWFu+77yIw0=;
	b=DzVob/smy46m+qBLHvcAAC6hLnz08sZSu2L1sm9zZNXmWCBO1qbtr2rx8pWkJCXsyw
	qbbG1iS5nrY9Evnc+RNK7TQyIUpySfjtDoP0m5LoJwyedwonHcf5MRJfG4V+vnxZKzq6
	pY6sCDFgkJpgAGfr9nyGPYYMg1lpvquf8DHrF7e4S3hPnY3x34/o+5lwtAdxFUTIjiNh
	fBT6XLb1XundAwnH1mJQIDxmqfupxZup/EECKnhUAgJ6pN9nIlic07nZBav6XW2Y3jVL
	w6Wf6uOnKW9iDr2SyREPLgMMM0UlfXyFD57GTzLdvliE+pitN4ksY7roeWr4LfGWuZLv
	BMlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=e3R+93W1uk8L/IoxxjsdEpXAxiOzNJuaZWFu+77yIw0=;
	b=TRYwDgkt6RWUJtx3sAyYrxeiBjzzHtYa23AR4rZzRt2qkHOjOAWovLlDGK8wAVT9M9
	DRYsvDVyUN6HUtRX8xa/fVQOhn2XZkV1sehx4E6gcL8X7KWrxJAl/OuFpAvYzzMFXcgb
	C2KxJMjCMw5ir2fPvgsy9uF+GLgYnzl+YKdnTzD0iZOJZ6zWkf05+S5OdMVhWQOC68u0
	pu7jwRRvmzwtjeCyd5aN/Hx7R2Jj9X4LJIlqaKt6Rdz6ZSjYpY8XybBuUi+E3PH+9fwx
	081gXsQj+ESuQice2Vt7HMF/DYiV4PIhTo9/od2hPiRuFBkTHZ9t/hBhsMiBZshomo62
	s5dw==
X-Gm-Message-State: APzg51DxjY6bGeXqJItVy6CxYut3/LAyw9wFM8rpQTOw/EMoAcJwXpUZ
	PsfDYLKPIL5DcvYPpen2D7d0pPro
X-Google-Smtp-Source: ANB0VdZQMLKNokzknFrO8N73noS2vVaFwByKtCa4Ddw7xpgXjyHH0AgwWT17CvzuyQUgqitF7v7NGw==
X-Received: by 2002:a17:902:7798:: with SMTP id
	o24-v6mr95348pll.93.1536728376836; 
	Tue, 11 Sep 2018 21:59:36 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::2887])
	by smtp.gmail.com with ESMTPSA id
	d12-v6sm25927706pfn.118.2018.09.11.21.59.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Sep 2018 21:59:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Sep 2018 21:59:27 -0700
Message-Id: <20180912045927.23092-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20180912045927.23092-1-raj.khem@gmail.com>
References: <20180912045927.23092-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/2] lcdproc: Update to master tip
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
X-List-Received-Date: Wed, 12 Sep 2018 04:59:36 -0000
Content-Transfer-Encoding: 8bit

* Do not build on musl/arm since it does not build due to musl not
implementing ioperm() function on ARM

Drop 0001-include-asm-ioctl.h-explicitly.patch its fixed differently
upstream already

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-include-asm-ioctl.h-explicitly.patch | 43 -------------------
 .../recipes-extended/lcdproc/lcdproc_git.bb   |  7 +--
 2 files changed, 4 insertions(+), 46 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/lcdproc/lcdproc/0001-include-asm-ioctl.h-explicitly.patch

diff --git a/meta-oe/recipes-extended/lcdproc/lcdproc/0001-include-asm-ioctl.h-explicitly.patch b/meta-oe/recipes-extended/lcdproc/lcdproc/0001-include-asm-ioctl.h-explicitly.patch
deleted file mode 100644
index abdedad5d6..0000000000
--- a/meta-oe/recipes-extended/lcdproc/lcdproc/0001-include-asm-ioctl.h-explicitly.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From b5ca64c7398d516e9845d849e8306df7ac024bc4 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 11 Apr 2017 13:59:34 -0700
-Subject: [PATCH] include asm/ioctl.h explicitly
-
-Needed for _IOC* defines
-
-helps compiling with musl where this file is
-not included indirectly
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- server/drivers/hd44780-pifacecad.c | 1 +
- server/drivers/hd44780-spi.c       | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/server/drivers/hd44780-pifacecad.c b/server/drivers/hd44780-pifacecad.c
-index 43db19c..e2798ad 100644
---- a/server/drivers/hd44780-pifacecad.c
-+++ b/server/drivers/hd44780-pifacecad.c
-@@ -54,6 +54,7 @@
- #include <unistd.h>
- #include <fcntl.h>
- #include <sys/ioctl.h>
-+#include <asm/ioctl.h>
- #include <stdint.h>
- #include <linux/spi/spidev.h>
- 
-diff --git a/server/drivers/hd44780-spi.c b/server/drivers/hd44780-spi.c
-index 5f94333..8a4015b 100644
---- a/server/drivers/hd44780-spi.c
-+++ b/server/drivers/hd44780-spi.c
-@@ -29,6 +29,7 @@
- #include <unistd.h>
- #include <fcntl.h>
- #include <sys/ioctl.h>
-+#include <asm/ioctl.h>
- #include <stdint.h>
- #include <linux/spi/spidev.h>
- 
--- 
-2.12.2
-
diff --git a/meta-oe/recipes-extended/lcdproc/lcdproc_git.bb b/meta-oe/recipes-extended/lcdproc/lcdproc_git.bb
index fad1d616c3..93a09f28a0 100644
--- a/meta-oe/recipes-extended/lcdproc/lcdproc_git.bb
+++ b/meta-oe/recipes-extended/lcdproc/lcdproc_git.bb
@@ -11,15 +11,16 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760 \
 
 BASEPV = "0.5.9"
 PV = "${BASEPV}+git${SRCPV}"
-SRCREV = "79fa538647c3e09a87ecc86aae1abbb82e0a25c5"
-SRC_URI = "git://github.com/lcdproc/lcdproc;branch=lcdproc-${BASEPV} \
-           file://0001-include-asm-ioctl.h-explicitly.patch \
+SRCREV = "a4b5a7e058fdd0d914a61138748b589c0128b45b"
+SRC_URI = "git://github.com/lcdproc/lcdproc \
            "
 
 S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig update-rc.d
 
+COMPATIBLE_HOST_arm_libc-musl = "null"
+
 LCD_DRIVERS ?= "all,!irman,!svga"
 LCD_DEFAULT_DRIVER ?= "curses"
 
-- 
2.19.0


