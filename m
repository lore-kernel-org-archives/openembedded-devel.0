Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 74F977F2E2
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2019 23:01:31 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id n190so10059795pgn.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Sep 2019 16:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=a7E5rvQmq2Afbu1OBtfnBIG3mezIvst1YizrMJQhPcY=;
	b=eu/OOZYNugd9B9zeEiP8QmZTrYO2TI3aM0EnaTDbZFK1KHnxQ5yLGzDQ6+M0lTfOd/
	h+gBnMGvQud6sw5gU9rZasxktU0aViXIDMi0/KqZAo1zaBT/JU/eEcsuH23uJMVRWNIg
	OKqd4AwTg6MGkQtIIF9C2CB4bWs9ZBOTcKZ8/4gP2ICZL8wXQB8fWvKRG6uzp2J8uN/c
	DdPiF+GOX+GDQICgEffVkr3tJkW5oOad3XsS7KGAfmQWLhKM1pZK4WrM5pF2ZH6VojpZ
	HOJl+hYjVMqUDytnC2trrXfwcKKgo9PwWNYri81ZqGCwXEJRjW3COV7SRfbzoUu1HRpW
	QJkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=a7E5rvQmq2Afbu1OBtfnBIG3mezIvst1YizrMJQhPcY=;
	b=DUIanqPiaIFNe0qlLuDBIH8gA5oWeEBPpSDcBmEwo1oQofWzG08KQetNxuRAOFHkmd
	dax3Khxplg6GpvNk1FEwtaBtB/QAHOFOOEdr7//QIPIaVzngdZp0QA5TthQeTNQ/bVas
	V5Vyu/zlItCncVH4gZZ+01QiKjwolk/sylivqEHox2YtYfU4a6+g/8+x5aMdGuD0XwZL
	WZDWJpMKbYvI0x4kh3z2tJbq6XZRiJAO87PnqlReopBYO/JDaobtkVltbXB/+GbTrFel
	oZL7FE9Eg9NT1zw7l0bKIpnS39wcCHdRV1W+lrj+IpSrG3ms2kO8kgOJdSMloe31TRhB
	rzMg==
X-Gm-Message-State: APjAAAUO2MhRVwxE7mr393hIhQ376kd/x+BtVVYVh5qjtPr24vuenRUe
	Pg/2gbtlHzznLqURT4CtWfki8T2cHh8=
X-Google-Smtp-Source: APXvYqzTk5hAM6bowbwVFhf5SdApUAgoCO07EfvsCZT8QqyfiQQYIOCVWnkCkQbG7g5mRrso/JegkQ==
X-Received: by 2002:a17:90a:c70e:: with SMTP id
	o14mr1832472pjt.56.1567551692118; 
	Tue, 03 Sep 2019 16:01:32 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	z25sm19314164pfa.91.2019.09.03.16.01.31
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Sep 2019 16:01:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Sep 2019 16:01:23 -0700
Message-Id: <20190903230123.37609-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190903230123.37609-1-raj.khem@gmail.com>
References: <20190903230123.37609-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-initramfs][PATCH 2/2] klibc: Fix build with 5.2+ kernel headers
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
X-List-Received-Date: Tue, 03 Sep 2019 23:01:31 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...01-Fix-missing-include-in-sys-mman.h.patch | 36 +++++++++++++++++++
 .../recipes-devtools/klibc/klibc.inc          |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-initramfs/recipes-devtools/klibc/files/0001-Fix-missing-include-in-sys-mman.h.patch

diff --git a/meta-initramfs/recipes-devtools/klibc/files/0001-Fix-missing-include-in-sys-mman.h.patch b/meta-initramfs/recipes-devtools/klibc/files/0001-Fix-missing-include-in-sys-mman.h.patch
new file mode 100644
index 0000000000..4bedef8052
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
index 86aae33407..26689f87e7 100644
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
2.23.0


