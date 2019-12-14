Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
	[209.85.210.172])
	by mail.openembedded.org (Postfix) with ESMTP id 1DC2C7E3BC
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Dec 2019 15:56:52 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id 2so3143098pfx.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Dec 2019 07:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=F1W4pfm4j2yOZbau04azWCI6bpQxl58ooB6R2NtxI6w=;
	b=NPbCgewzIp1E9DEuuXiq7aLyw2/0s1u8N38Jf3P+fzR3wRUWIxSOQ4O3e2LkgWFn+f
	qsxpIzoc5pZnrDhVBwyllSxGvMAoGzgBL0EzpLz/BYnryX7Ng4dm1t0T38zmrZihQlt/
	mnTq3wNP0h5w7hdHeWvW4Jkz5PSw+/Tn7QbMhJHW5NTARdfNv7t58fNFu7ilQkHWGveb
	WrmmBnImqqyr1UOp45Mtao/N2PwvHQ8VNw2wT6Igtzqsd3hOm03GJoy6iTPpOHqQ3wDp
	+ZrW+qowhvcy9sP3PePF0BxPoLo5TlBQzxlZAoOBDG9x6PmY7zKK8PcTjVCCxl7Y1Kvs
	vESg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=F1W4pfm4j2yOZbau04azWCI6bpQxl58ooB6R2NtxI6w=;
	b=qIrtXNANQ50Os3b9TERpJFn/dBzwa4vADMI13qPs2EVvz6GLJjKqupwquc61lwRBY+
	M4TPm0WS8+j0tntwZvYXYW1GUeZ6HBGg6RoY9AZ/b3pocASVRgYwUvwVLR0okmZdVgtl
	BiGEci3GPLNm7c3198ix6VzNi4fYA1zMLnl+jTzto6kL+kQWfgqnowRX1bTAOzrgeSjD
	TShbp9s0CVlVFEekloTQqytEMt+GDCbXuBCVXBTpj4tv4gB/jGBqbWyufwO0H3biTsWL
	FvMHvxDyNbUX64kUPan7a4NWz9RsmwyTunGvRajEbgqx0aKevPKGB/dvHtEquNQwGAne
	wsfQ==
X-Gm-Message-State: APjAAAUXdMMzppOZvz01iKnPXVlAMcrBGnbEgQCvezfr0OZVR5cPbIbv
	+YOlxQ0etsjs1YF44v1Wu21d67vuyWk=
X-Google-Smtp-Source: APXvYqyFUhhGTO9EulhoLAqtfej5PXjE7by3mQbr9JyRe+7IxURWmRu9ObXbKb51E/EJmkAqnV0J9w==
X-Received: by 2002:a65:4206:: with SMTP id c6mr6275173pgq.46.1576339013501;
	Sat, 14 Dec 2019 07:56:53 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::6d2c])
	by smtp.gmail.com with ESMTPSA id
	f81sm16486693pfa.118.2019.12.14.07.56.52
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 14 Dec 2019 07:56:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 14 Dec 2019 07:56:40 -0800
Message-Id: <20191214155640.3091023-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [meta-initramfs][PATCH] klibc: Apply -no-integrated-as on mips/clang
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
X-List-Received-Date: Sat, 14 Dec 2019 15:56:53 -0000
Content-Transfer-Encoding: 8bit

Fixes build error

| /mnt/b/yoe/build/tmp/work/mips32r2-yoe-linux-musl/klibc/2.0.7-r0/klibc-2.0.7/usr/klibc/syscalls.pl: usr/klib
c/syscalls/typesize.bin: magic number not found

...

| usr/klibc/sigsuspend.c:8:10: fatal error: 'klibc/havesyscall.h' file not found
| #include <klibc/havesyscall.h>
|          ^~~~~~~~~~~~~~~~~~~~~
| 1 error generated.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-devtools/klibc/klibc.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index e1afe7f33e..289288d480 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -37,6 +37,7 @@ S = "${WORKDIR}/klibc-${PV}"
 
 OPTFLAGS = "${TUNE_CCARGS} -Os"
 OPTFLAGS_append_toolchain-clang = " -fno-builtin-bcmp"
+OPTFLAGS_append_toolchain-clang_mipsarch = " -no-integrated-as"
 
 PARALLEL_MAKE = ""
 EXTRA_OEMAKE = "'KLIBCARCH=${KLIBC_ARCH}' \
-- 
2.24.1


