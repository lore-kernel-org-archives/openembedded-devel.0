Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id B086571951
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Feb 2016 00:48:42 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id g62so155037566wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Feb 2016 16:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=313qw6yeU+8bOUo/bew100btrCFzxec0+5PpnGF8Sho=;
	b=wiTQfb25VNCpU0wI2iCAGmDbnQ5wOAoVFr790yyzxUdZX0PdwZlEeRxQJR39itbk3r
	cXh8JMZrM8gDC/2FRQMRAyGg8fRzcn1tJlT9J2AEo13f/RcxfMLO57kUDUJ9sKJQ+gNA
	kKzghkWEb30T31pGZ5nRk+4ae40lsh17nJs8Ea3OvbLkjZCgGPrMtKV/MCFmFTYzl8x3
	HEOJeCyl/AAqeBZIvhXNl8tRLQxuZ6r5YiWuDFzNFZZ8eU9OGM1eclpyOCjRhn1U5aAT
	ay2vJcf+uSR0P8yoEWH9nMItBIfuvJodn8KwjYVkTq5yZOHWj7m9MQCi0luNidBBizUE
	FEPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=313qw6yeU+8bOUo/bew100btrCFzxec0+5PpnGF8Sho=;
	b=WbdV8bAQMrsaDfZ0WDJDBPT+/Dd9YG5TQef9DoTuawzBk+vzP4hMhHkTMbyaLYEELl
	V8Ss8mgpIxNaJYuc+htxf7iMXGJzMZr6ewYvHcWLWXqoQg9XGe57nRz2yPaeaMr41QLM
	B/op63eC0jLxaM8vcJw7ltpyxUzc2iVvU0R3vm1rM1MMhsDhcm3hb/GZvTG99/iCgpjK
	uQcDZzeFHO3TZWcnTaeK5oL8GpDcUy8gaTxmV7HSXzbMzv+l8Es/nBQlUmOEkY02xMV1
	XKHsK3xCVSJF/XBPq1mvI/GsDvYbYYtJxV+BaWGnO4/rOKtHtWuy5FNXhJcI641kgYkZ
	aRCQ==
X-Gm-Message-State: AG10YOSe1glqI+zHKr0fkKy98KqbkpDvJMx1jI4xGHK66Owmfy+YbcwSev90yJrbQTTpSQ==
X-Received: by 10.194.111.232 with SMTP id il8mr35675368wjb.150.1454978923570; 
	Mon, 08 Feb 2016 16:48:43 -0800 (PST)
Received: from ThinkPad-T520.homenet.telecomitalia.it ([95.236.250.222])
	by smtp.gmail.com with ESMTPSA id
	75sm14969660wmo.22.2016.02.08.16.48.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 08 Feb 2016 16:48:43 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Feb 2016 01:48:26 +0100
Message-Id: <1454978906-28102-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-initramfs][PATCH] klibc: silence QA Error about packaging
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
X-List-Received-Date: Tue, 09 Feb 2016 00:48:44 -0000

Keeping debian packaging-style we have a copy of klibc-xxx.so in libklibc-dev.
Wile there silence the warning about it being already stripped.

NOTE: klcc in OE is used as cross-compiler so the packaging is tweaked and
      there is no /bin/klcc for target (drifting from debian).

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-devtools/klibc/klibc.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index a707ed5..654d9f1 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -38,6 +38,8 @@ do_configure () {
 
 INHIBIT_PACKAGE_STRIP = "1"
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
+INSANE_SKIP_klibc += "already-stripped"
+INSANE_SKIP_libklibc-dev += "dev-elf"
 KLIBC_ARCH = "${TARGET_ARCH}"
 KLIBC_ARCH_aarch64 = "arm64"
 KLIBC_ARCH_armeb = "arm"
-- 
1.9.1


