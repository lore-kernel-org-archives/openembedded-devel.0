Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6FEDB78924
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2018 04:00:12 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id g12so159079pgs.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 21:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=a62tuP3ZpS3rVTF+Mw/I4BSKzNLMUTkN0THDWOV8X+Q=;
	b=MBnbcesvy21ZS4gXMToGE0aJK+xxNwj5TQtRyeULP5430WqdxK6dgxfNstM8UlaGFj
	1yRbA4LPoClGz1VFRBWwfRQuoxUaYce779/P4d8NZxD4eHczy7AJeMKZDBTpiUw+t129
	zoMQJZnZdO5AtiSWvu6A7dSg5ewner7oBqUXcTIH05bQNE4kYJ9AtRI27UAhHNQEqGsP
	1sCRATxClZ/zPUt9AvvXSdozIFuVqGhCO46ZqNLVlMOX/JctXCD6q9bJTvShIKWiZEbv
	Yrps/+AS6xrlUbxyzqJ/jB2ZzE7sVq3Qx0rQcjpuZgrlGKNUO/4B/imAh+czGzSKaEKJ
	BciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=a62tuP3ZpS3rVTF+Mw/I4BSKzNLMUTkN0THDWOV8X+Q=;
	b=uVdScVyWWGWvzKiH9oQmVYrUf8WU5gjGj/36wZD0k2zppbP3S1Ss2KpmeOn321/bh7
	7YzJIS2FRS8+cRHE6uffPCrTYK0U3PAGjSFMbpIrbP3x/AmMHGH63wSd+ZbMGssGbf6p
	DqxO6kgSjpkzVn0k1fG3QTyIIb9VHJz73a2ULS/mv0kz7CmxJCf3m4ND8rEw/bl4oDWR
	gKOn6o0mnojsou0AFlddydGZjF03QceyVjKiW8VhJtU9LFOJk9OwAcWiZcQZkkJSoVe0
	MAIlzaPw1nhlm25bAYUNx7MuZTDS1b8CO+p2AdTaCQtpxcoA9HamHA1k+okJh9US0bFH
	8y3w==
X-Gm-Message-State: AElRT7HU7PY/TLrspvwXgy9ssEYAVgVz9GOiNivuYemrGN2WYBO7Hr2b
	o2MV8GakMWiR/QJtfCivr27wsw==
X-Google-Smtp-Source: AG47ELvU/LJb+Y7E9khdYgh0YfIX2UxrNDriShIVQooi7Sg/383Hbh0WMt7Qbb2nv9sBuOcAREQCDA==
X-Received: by 10.99.124.79 with SMTP id l15mr10921311pgn.19.1521518414323;
	Mon, 19 Mar 2018 21:00:14 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	m9sm927862pff.143.2018.03.19.21.00.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Mar 2018 21:00:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Mar 2018 20:59:58 -0700
Message-Id: <20180320040000.29408-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180320040000.29408-1-raj.khem@gmail.com>
References: <20180320040000.29408-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 4/6] waf-cross-answers: Add cross-answers-riscv64.txt
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
X-List-Received-Date: Tue, 20 Mar 2018 04:00:13 -0000

RISC-V is newly added to OE-Core, waf needs to know
about it during cross compile

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../waf-cross-answers/cross-answers-riscv64.txt    | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 meta-networking/files/waf-cross-answers/cross-answers-riscv64.txt

diff --git a/meta-networking/files/waf-cross-answers/cross-answers-riscv64.txt b/meta-networking/files/waf-cross-answers/cross-answers-riscv64.txt
new file mode 100644
index 000000000..1023f6aff
--- /dev/null
+++ b/meta-networking/files/waf-cross-answers/cross-answers-riscv64.txt
@@ -0,0 +1,39 @@
+Checking uname sysname type: "Linux"
+Checking uname version type: "# Wed May 20 10:34:39 UTC 2015"
+Checking simple C program: "hello world"
+rpath library support: OK
+-Wl,--version-script support: OK
+Checking getconf LFS_CFLAGS: NO
+Checking correct behavior of strtoll: NO
+Checking for working strptime: OK
+Checking for C99 vsnprintf: "1"
+Checking for HAVE_SHARED_MMAP: OK
+Checking for HAVE_MREMAP: OK
+Checking for HAVE_SECURE_MKSTEMP: OK
+Checking for HAVE_IFACE_GETIFADDRS: NO
+Checking for HAVE_IFACE_IFCONF: NO
+Checking for HAVE_IFACE_IFREQ: NO
+Checking for large file support without additional flags: OK
+Checking for HAVE_INCOHERENT_MMAP: NO
+Checking value of NSIG: "65"
+Checking value of _NSIG: "65"
+Checking value of SIGRTMAX: "64"
+Checking value of SIGRTMIN: "34"
+Checking whether the WRFILE -keytab is supported: OK
+Checking for kernel change notify support: OK
+Checking for Linux kernel oplocks: OK
+Checking for kernel share modes: OK
+Checking whether POSIX capabilities are available: OK
+Checking if can we convert from CP850 to UCS-2LE: OK
+Checking if can we convert from UTF-8 to UCS-2LE: OK
+vfs_fileid checking for statfs() and struct statfs.f_fsid: OK
+Checking whether we can use Linux thread-specific credentials: OK
+Checking whether fcntl locking is available: OK
+Checking for the maximum value of the 'time_t' type: OK
+Checking whether the realpath function allows a NULL argument: OK
+Checking for ftruncate extend: OK
+getcwd takes a NULL argument: OK
+Checking for small off_t: NO
+Checking whether blkcnt_t is 32 bit: NO
+Checking whether blkcnt_t is 64 bit: OK
+Checking whether fcntl lock supports open file description locks: OK
-- 
2.16.2


