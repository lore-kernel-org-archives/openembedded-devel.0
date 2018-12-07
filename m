Return-Path: <andrea.adami@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id CCF4971C42
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Dec 2018 23:11:05 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id z5so5207627wrt.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Dec 2018 15:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=eLT8KvR8/UfIwHbxR23rhqmxpRsN9CQQeCG4vXTCMo8=;
	b=JJ8IM+ug1k1fSCMI5FJN28D9fdu16Nxb77tAqnjH0LY1pYdxtA6CghugjfutLFxFmK
	vDzn6YPXbRPLJq0cjtxpJ8eQ9LhH8uRIwMeCCAGeycMq2htZlXFRvui7mXReUIdzG6zl
	x6Pe71P/ly4/TotZNt8N0oq6eUQk4yg3hoAiCCdiz6kZoka1aaEsYsbVofAIwfboBlV4
	husOIWWQ8Sqxb0O7oVTqJgliK4nKeoqKsB/POLrDfSqDH4O8lArlnTTEG/WSXspUeYtc
	DoYgSdqFxwysm2hibPV6NsZm/bDijSWthcHzqiltsdHBwSP4oSHOHoiPpwS/hROZca23
	E2jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=eLT8KvR8/UfIwHbxR23rhqmxpRsN9CQQeCG4vXTCMo8=;
	b=V0k5MU73dTkARZJaWsx7dhiV4MX+gbjDy4O1h5VQx2W6Lb9SRtwHWGcxYwrwiikdii
	g0wqBUTuzcQLzfUCY6k82OUs60h3IlbZnztfFFYb+ed6QB5HNu58Pv0LoKxwi24yTfcm
	p2Yu5Qq9GcXB15D7AGjNUg+iHE8vyHyBqXstZjfbPlegOPc2vdg8s9PWm+wsCb6rciqx
	fxpzQJ2G5SXjw51DRh4H55qlCe0PubXBcd5HL1HrQd+MfmkFUEir+MTDvras6YJTi3AG
	Je0xOKzqxppgn5zDveYRvPYKskqs/k9oieLn7txlUNWFUxDSoGA/8XH9T3KTfS+CFQn7
	MW/g==
X-Gm-Message-State: AA+aEWZRn3XcQCyDupv6mPjVKj4lNuxEQxnI4RWPEVfov4LYbwdkKhh1
	QnDfWD2yBjNUBD5duHnTm9jT9N/k
X-Google-Smtp-Source: AFSGD/WEnO9u0JawGaQuXjX+J7l2DLtwV4O2LAhfODce6qE59gD2Z4AYajJJn2hP1tDVna2FnzFNmA==
X-Received: by 2002:adf:dd06:: with SMTP id a6mr3512207wrm.2.1544224265957;
	Fri, 07 Dec 2018 15:11:05 -0800 (PST)
Received: from localhost.localdomain
	(host55-101-dynamic.58-82-r.retail.telecomitalia.it. [82.58.101.55])
	by smtp.gmail.com with ESMTPSA id
	x8sm12204092wmd.45.2018.12.07.15.11.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Dec 2018 15:11:05 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  8 Dec 2018 00:11:00 +0100
Message-Id: <20181207231100.3181-1-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCH] waf-cross-answers: Add cross-answers-mips64el.txt
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
X-List-Received-Date: Fri, 07 Dec 2018 23:11:06 -0000

Fix build failure on mips64el platforms (missing waf-cross-answers-mips64el).

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../cross-answers-mips64el.txt                | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 meta-networking/files/waf-cross-answers/cross-answers-mips64el.txt

diff --git a/meta-networking/files/waf-cross-answers/cross-answers-mips64el.txt b/meta-networking/files/waf-cross-answers/cross-answers-mips64el.txt
new file mode 100644
index 000000000..82e694fda
--- /dev/null
+++ b/meta-networking/files/waf-cross-answers/cross-answers-mips64el.txt
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
+Checking for HAVE_INCOHERENT_MMAP: OK
+Checking value of NSIG: "128"
+Checking value of _NSIG: "128"
+Checking value of SIGRTMAX: "127"
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
2.17.1


