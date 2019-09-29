Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8C6917F281
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Sep 2019 23:55:22 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id q7so4495097pfh.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Sep 2019 16:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ObP6cnjm3WasINurilKzWRcavrYn46HbOvg//zwK4+0=;
	b=BCZ//APGPevN3ikhH/EuaZjSCalAlWsHZYQYwD3kq5y7K6bbZGtP3OxluSyI2B0C2T
	c9jhQoXnaI/6FIBtzqmCZ1kwIIHyD71SmINo0rhkvGvP4c43PYjtTqmB3YH6EtfAdxKJ
	qBJdhlUInfg+twSPr2xyfniKviuX01TQwmQrkCjw7t6kxGfdVxZGEeIa2FfCyUDurRSs
	Ra9rLu0NsmhclT4xXdprruLgNLktGkLnfzzayRrNm7BGgi69WcnasZm4qNDpOeYn25fR
	VoshalCBnR+cDKu8rb2G0DLz0MC8jNRfOtOBLtUHtFJwxa2O05eljzjn8E04jeQ5lozW
	lyQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ObP6cnjm3WasINurilKzWRcavrYn46HbOvg//zwK4+0=;
	b=lBY0KcamXDW5g2BywbAaHlPFiNtsipONahsP07jF+cnhjmaGaA3ObK9K8ub/JpRRBc
	+gUhjxxhq7sl/PNaXtRbIg7ztqV62WJJiUb2hOHa+L81lX5fpe5/HjLIvhPfovoE3TV5
	GsXKkD3D5hrQ06qUY2ePNAdjE8+ZCV+gwQz0c4YeisvhZVYXFzn1OTf9/tf7RUViJVzK
	+4Si0BI17hpKEN2imZ9XZOsT183s5WrpYjMXoiaUXQiDW0+xaJ92rTBUYK67U0Qi8s3Q
	GMUjQbceDAknrSIVwD23vJidBQPKJr/r3nmSzc0kg+0ZIJBOTiFj9F1wtWTY/+Jxqmac
	1hYQ==
X-Gm-Message-State: APjAAAV8KYBdMI8KR8jMGVo6dWeM9RDjg+Sg5DBNFxoBg23PC63vseS8
	ArDSCw5kYrkzhPFu3+KytJOn6zNvLJ4=
X-Google-Smtp-Source: APXvYqwlMvTnRh/tYtFVwA0MtLvgqiY/ktbMMub3endQ/crky/HzeCdyhYh9bLiPtwLKLgz32QvSxw==
X-Received: by 2002:a65:6102:: with SMTP id z2mr21156396pgu.391.1569801323370; 
	Sun, 29 Sep 2019 16:55:23 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:edf9:811d:ad92:85c2])
	by smtp.gmail.com with ESMTPSA id
	p190sm14474778pfb.160.2019.09.29.16.55.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 29 Sep 2019 16:55:22 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 Sep 2019 16:55:04 -0700
Message-Id: <6748bb66d50cab6acb56a0c4596d9d3c7650e4fb.1569801183.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569801183.git.akuster808@gmail.com>
References: <cover.1569801183.git.akuster808@gmail.com>
Subject: [warrior-next 06/10] klibc: Fix build with 5.2+ kernel headers
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
X-List-Received-Date: Sun, 29 Sep 2019 23:55:22 -0000

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit ab3072ee4cf555eb5eb8b6200fd0ffb3eab3f947)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../0001-Fix-missing-include-in-sys-mman.h.patch   | 36 ++++++++++++++++++++++
 meta-initramfs/recipes-devtools/klibc/klibc.inc    |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-initramfs/recipes-devtools/klibc/files/0001-Fix-missing-include-in-sys-mman.h.patch

diff --git a/meta-initramfs/recipes-devtools/klibc/files/0001-Fix-missing-include-in-sys-mman.h.patch b/meta-initramfs/recipes-devtools/klibc/files/0001-Fix-missing-include-in-sys-mman.h.patch
new file mode 100644
index 0000000..4bedef8
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/klibc/files/0001-Fix-missing-include-in-sys-mman.h.patch
@@ -0,0 +1,36 @@
+From 36360b16833400de7818151be5588b16ac4fd5bc Mon Sep 17 00:00:00 2001
+From: Barret Rhoden <brho@google.com>
+Date: Thu, 14 Mar 2019 17:30:38 -0400
+Subject: [PATCH] Fix missing include in sys/mman.h
+
+Linux commit 746c9398f5ac ("arch: move common mmap flags to
+linux/mman.h") moved a few mmap flags, particularly MAP_PRIVATE, from
+asm/mman.h to linux/mman.h.  This broke klibc's build, which uses
+MAP_PRIVATE.
+
+linux/mman.h includes asm/mman.h, so this commit merely includes
+linux/mman.h instead of asm/mman.h.
+
+Signed-off-by: Barret Rhoden <brho@google.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/libs/klibc/klibc.git/commit/?id=d4853d030639cf3542ae39129c18b654d8d4f020]
+ usr/include/sys/mman.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/usr/include/sys/mman.h b/usr/include/sys/mman.h
+index 56f0b65c..3fd626e7 100644
+--- a/usr/include/sys/mman.h
++++ b/usr/include/sys/mman.h
+@@ -7,7 +7,7 @@
+ 
+ #include <klibc/extern.h>
+ #include <sys/types.h>
+-#include <asm/mman.h>
++#include <linux/mman.h>
+ 
+ #define MAP_FAILED ((void *)-1)
+ 
+-- 
+2.23.0
+
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index 86aae33..26689f8 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -23,6 +23,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/libs/klibc/klibc.git \
            file://0001-klibc-add-getrandom-syscall.patch \
            file://0001-klibc-Kbuild-Accept-EXTRA_KLIBCAFLAGS.patch \
            file://0001-Define-ulocked_-fgets-fread-fwrite-aliases.patch \
+           file://0001-Fix-missing-include-in-sys-mman.h.patch \
            "
 
 ARMPATCHES ?= ""
-- 
2.7.4


