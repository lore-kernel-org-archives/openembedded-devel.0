Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 2CBBF7DF61
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  5 Oct 2019 16:55:17 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id z12so5535350pgp.9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Oct 2019 09:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=atTOWQ9GWeYgNtl2YS3CrbZxyiBz5MTH7KM6faX0Di8=;
	b=f8YQuDUwVZ2MYqZDR6v5gULlEu2x/rqeC9q/UHvUfr4BA6TJ0GgBhl4onBSfKMJass
	x2V9/ewn9JPgEAH9F9nuU8O9xPovqE3z5GvPpcR+Hj6SR7f5Ju7R9P/LoTcIIjN3JUG7
	NamdjxZXCCFoBp111dkXTzXXpjZz4xM/qWaC+/dnPvjfC68J5nu6LY8gu848LI5eUMgV
	c9O+UaV/ccoII+ixBn3KapBdvV+go4QTUOxzM6eHEEIyTe68W2OwUviHwgtNX4WhauoB
	ZgXWQnqKTQk37dJma98bgP9cW7gFU5Xk1K9REVgtsC1G6Jji+AYiKMjx2AUTLBrUY41a
	c8TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=atTOWQ9GWeYgNtl2YS3CrbZxyiBz5MTH7KM6faX0Di8=;
	b=SuCzufwELptO1GY35lHbL0FHyt1cwBUGGiFclyXA1tlKV44+SE1iwCQFZWLtNbpu6a
	/O9F0yKb2bNam7ynXyf8bg0jPcgALBkotWgqgAbH3s3aX7lpiVRQw0Eu92CHu5LorjPA
	KX4oUFI03RhKY3vJLOJ59iLaqpZQlneCq0waCd3mSmkpgd855LnsiK3OeYuWrF9Ml7Ju
	57MevPq+IMf24uIefWt9ssb+t/ChrtAWty/3lu3q4moMZGzCJlNGIHSyri6bIj8V0OFy
	LJKRy0Yt270uDoaT6dl1xhf6o+rGA6Yk41dOES3gjkZeLFMfF1ZxBUex3RfygOzv4SQ7
	OBCg==
X-Gm-Message-State: APjAAAX4Smqj2nTkWLVEUhkhZoNQlLqTe1yDJUw5Jw8DxzlZCniS0qNd
	VS+vPW5MpQwjsQun5fr4CvyCtZDMZNw=
X-Google-Smtp-Source: APXvYqxMoTAvzNBAmKzDc9ht5O8xxDqCcrndP2yeJgJos4zUmWg1gFP3H/QE0Cqpb2UACona33MIlQ==
X-Received: by 2002:a63:40c7:: with SMTP id
	n190mr21533909pga.446.1570294517605; 
	Sat, 05 Oct 2019 09:55:17 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::7275])
	by smtp.gmail.com with ESMTPSA id
	c64sm10648338pfc.19.2019.10.05.09.55.16
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 05 Oct 2019 09:55:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  5 Oct 2019 09:54:59 -0700
Message-Id: <20191005165459.1363427-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191005165459.1363427-1-raj.khem@gmail.com>
References: <20191005165459.1363427-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/3] fio: Fix build when march is armv7ve
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
X-List-Received-Date: Sat, 05 Oct 2019 16:55:17 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ch-arm-Consider-armv7ve-arch-as-well.patch | 28 +++++++++++++++++++
 meta-oe/recipes-benchmark/fio/fio_3.16.bb     |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/fio/files/0001-arch-arm-Consider-armv7ve-arch-as-well.patch

diff --git a/meta-oe/recipes-benchmark/fio/files/0001-arch-arm-Consider-armv7ve-arch-as-well.patch b/meta-oe/recipes-benchmark/fio/files/0001-arch-arm-Consider-armv7ve-arch-as-well.patch
new file mode 100644
index 0000000000..983a76fb6d
--- /dev/null
+++ b/meta-oe/recipes-benchmark/fio/files/0001-arch-arm-Consider-armv7ve-arch-as-well.patch
@@ -0,0 +1,28 @@
+From 2af58909cd9f2862d1dc07836e201361a2cd8d5d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 5 Oct 2019 08:53:22 -0700
+Subject: [PATCH] arch-arm: Consider armv7ve arch as well
+
+Upstream-Status: Submitted []
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ arch/arch-arm.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/arch/arch-arm.h b/arch/arch-arm.h
+index 78cb2ebe..4f722967 100644
+--- a/arch/arch-arm.h
++++ b/arch/arch-arm.h
+@@ -11,7 +11,7 @@
+ #define nop             __asm__ __volatile__("mov\tr0,r0\t@ nop\n\t")
+ #define read_barrier()	__asm__ __volatile__ ("" : : : "memory")
+ #define write_barrier()	__asm__ __volatile__ ("" : : : "memory")
+-#elif defined(__ARM_ARCH_7A__) || defined(__ARM_ARCH_8A__)
++#elif defined(__ARM_ARCH_7A__) || defined(__ARM_ARCH_8A__) || defined(__ARM_ARCH_7VE__)
+ #define	nop		__asm__ __volatile__ ("nop")
+ #define read_barrier()	__sync_synchronize()
+ #define write_barrier()	__sync_synchronize()
+-- 
+2.23.0
+
diff --git a/meta-oe/recipes-benchmark/fio/fio_3.16.bb b/meta-oe/recipes-benchmark/fio/fio_3.16.bb
index 0db4a2e878..adab618780 100644
--- a/meta-oe/recipes-benchmark/fio/fio_3.16.bb
+++ b/meta-oe/recipes-benchmark/fio/fio_3.16.bb
@@ -24,6 +24,7 @@ PACKAGECONFIG[numa] = ",--disable-numa,numactl"
 SRCREV = "92f75708b530989fdb13b50be6604f44b80d038d"
 SRC_URI = "git://git.kernel.dk/fio.git \
           file://0001-update-the-interpreter-paths.patch \
+          file://0001-arch-arm-Consider-armv7ve-arch-as-well.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.23.0


