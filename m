Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7F5D5753D7
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Sep 2018 23:58:44 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id n11-v6so5860897wmc.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Sep 2018 16:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=5cZuyN7VWmwXJc6aqZGZUSwSO8C8KU7gr4b/mn/Qj3M=;
	b=rtsU1KI6LlLZRxFV0NLTJlvQor+ac/FZaibugbMeVG6noCFANO45M2qqT/C40/wKSW
	qC6TJ/5GK/fHovIi4qUSVU8C5KHOuieAsmrc6AjPuI8QqJHNGxU0m/3N7hhHk2kNKHcq
	eym02IEV0VFNCr2AqzqkCpazK8YYAZz22fhqOKhWXna7fvN5UYuOSLM7RVH+37SrlcDS
	s5hT+Kz1GQkNeRYcI2PD3yGD4HOFbsYrxs8yznrr7VjKYPtTZhMMKJy/VH3li5g5rhI1
	owBeKLqYsruJkx7zjGH+ONSJvCWxQ4On6nLCf6gloy5a5dpHjGv9PrZZxZo7/0KpzzjA
	mrBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5cZuyN7VWmwXJc6aqZGZUSwSO8C8KU7gr4b/mn/Qj3M=;
	b=p59/cAXbn79u9I7lI4uohKgBndRF6uJTtahwXJa3/Hom5GclLIIpf43iFKWGZ3MOJv
	vp7rcY8krcefpvDnL/NxuubnwfMLuSnxbhkENjC8U/X9g7ZvP0Hcw5YhN54dX08j6+yk
	MIpvtedmC9HrQ/i+90BMH83+p/h2Qo+VycYIFytPsRE2eua0gpBcvGyq05LriuX2Qazz
	5y6q8NteTfBwnmBs1aG3cVyYG1wriyNtLhAzSGEQUcXJI+9gQhzg3lP0zSlxeRi9CYYO
	KtGI8OtprVovTg1cg6yr0vrjSpoM7nhQzulIxms2lwM7q6ltb0Lym5qVeGAvLMyiOZ/F
	CdJg==
X-Gm-Message-State: APzg51DiIuRoKYtIQKAgcA2DZxcgQvR2yHYRik+db/6NNAkvhsGSLzss
	VrC1u56L2OE6W8KXhurIcyM+tlSH
X-Google-Smtp-Source: ANB0VdYaRLwOv8JqU8iF/BnVO+cAXYZW9OcNb9R9/e9c60WW7xCRErIhzk0FRd/1QJ5mTLqYWHoS3Q==
X-Received: by 2002:a1c:d946:: with SMTP id
	q67-v6mr9261520wmg.156.1536105524940; 
	Tue, 04 Sep 2018 16:58:44 -0700 (PDT)
Received: from localhost.localdomain
	(host205-252-dynamic.245-95-r.retail.telecomitalia.it.
	[95.245.252.205]) by smtp.gmail.com with ESMTPSA id
	q135-v6sm1209083wmd.4.2018.09.04.16.58.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 04 Sep 2018 16:58:44 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Sep 2018 01:58:41 +0200
Message-Id: <1536105521-32396-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-initramfs][PATCH] kexec-tools-klibc: rebase x86-64 patch to remove -mcmodel=large
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
X-List-Received-Date: Tue, 04 Sep 2018 23:58:44 -0000

Patch did not apply after upgrade to latest master.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../x86-64-purgatory-Makefile-remove-unknown-flags.patch     | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/x86-64-purgatory-Makefile-remove-unknown-flags.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/x86-64-purgatory-Makefile-remove-unknown-flags.patch
index f1db757..0ec880c 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/x86-64-purgatory-Makefile-remove-unknown-flags.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/x86-64-purgatory-Makefile-remove-unknown-flags.patch
@@ -19,15 +19,17 @@ Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/purgatory/arch/x86_64/Makefile b/purgatory/arch/x86_64/Makefile
-index 7300937..38f0bf3 100644
+index 7300937..73f6932 100644
 --- a/purgatory/arch/x86_64/Makefile
 +++ b/purgatory/arch/x86_64/Makefile
-@@ -23,4 +23,4 @@ x86_64_PURGATORY_SRCS += purgatory/arch/i386/console-x86.c
- x86_64_PURGATORY_SRCS += purgatory/arch/i386/vga.c
+@@ -24,5 +24,5 @@ x86_64_PURGATORY_SRCS += purgatory/arch/i386/console-x86.c
  x86_64_PURGATORY_SRCS += purgatory/arch/i386/pic.c
  
--x86_64_PURGATORY_EXTRA_CFLAGS = -mcmodel=large
-+#x86_64_PURGATORY_EXTRA_CFLAGS = -mcmodel=large
+ ifeq ($(SUBARCH),64)
+-        x86_64_PURGATORY_EXTRA_CFLAGS = -mcmodel=large
++#        x86_64_PURGATORY_EXTRA_CFLAGS = -mcmodel=large
+ endif
+
 -- 
 2.7.4
 
-- 
2.7.4


