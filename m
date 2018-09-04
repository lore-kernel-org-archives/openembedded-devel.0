Return-Path: <andrea.adami@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3073F74C97
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Sep 2018 23:37:16 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id z96-v6so5644774wrb.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Sep 2018 16:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=90XCIAKW9DUb6qXVgJLFnC7dm0Yd0RbRtjaRCwoyfLU=;
	b=LHG58fpfPqfr4O/vby5k8mzRcN2DWGaWMxfxMKota2AOq01NrdXF9NhcIxRGN7Z9lP
	zieifniE0lc8kzu5u5DUHAdYlDpYxXL2aU+BPBfXxb8uXhiWOyQ7+WLmrU0hT7wjqRVL
	em34ja8CyeLfJyIbddMu6GQiqb8n9WPm7FRvYlqx3nA8xEumpjAtu65qPoe8ZrCMIjaB
	4vLfHyxoJwOCKdYOhOa9evK1X7JUwvx3/BqINmC5sOusQxlsimh2SkvGv+4lh9yqKvQX
	AS1lZXwg9CkBL8wgQvzDxSuOCuVuhEZGle/Cy+BG0/VCW28pqMFIoCcJZ/dyqicO6c53
	Z9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=90XCIAKW9DUb6qXVgJLFnC7dm0Yd0RbRtjaRCwoyfLU=;
	b=B/jr/h4wVpzgkXfAz9HzdUKtMfnaf50PB9/D5P35yc/eL/BB5CYZtyeGn1J045RJ2P
	imQJ1cHK6qATBtxDM6koN+vF9NQplcu9zXqcBKAHQzC5G1MbTUEsRMaWYWy+ORnc+WAW
	Ke8fRc2bYgpJ02ZwpekXU1HNjDpd3N6sfKZ+UbdSF2GTLx0VcdqP3PKLAOIq7S4FSmyC
	j0voKtfKTdXWQeQN1rjHMK/Dh1DrocqcJKjAvBSTxUU2hnANNtjw9pjYMI1QEBuSLe59
	la7gc5Brtvx2kfhy/a3BdYhuxbD4SR0bP//RWfNKEZzppBzLeGwIrRv2Qg685ayURmAc
	oqOA==
X-Gm-Message-State: APzg51Aujb+DYX2aSxkU1s9Q4xUyFa66pwR3V3/MDUY93kYEEoBk+fuP
	cwLwBNYlzjr9jf8+TpOBZjVBc/TB
X-Google-Smtp-Source: ANB0VdZ5G1RK+5oyAZCuJoQmcRTF308QM7/gjQpC0WdLFHX6uguXLfO8AFVPO3Dz6MJpwOKZxNbI3g==
X-Received: by 2002:adf:ffc7:: with SMTP id
	x7-v6mr3393678wrs.137.1536104236619; 
	Tue, 04 Sep 2018 16:37:16 -0700 (PDT)
Received: from localhost.localdomain
	(host205-252-dynamic.245-95-r.retail.telecomitalia.it.
	[95.245.252.205]) by smtp.gmail.com with ESMTPSA id
	t9-v6sm15923578wmf.1.2018.09.04.16.37.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 04 Sep 2018 16:37:15 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Sep 2018 01:37:08 +0200
Message-Id: <1536104228-15823-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-initramfs][PATCH] kexec-tools-klibc: enable kexec_file_load() for supported archs
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
X-List-Received-Date: Tue, 04 Sep 2018 23:37:16 -0000

The syscall has been added to klibc.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 ...all.h-work-around-missing-syscall-wrapper.patch | 35 ++++++++++++++++------
 1 file changed, 26 insertions(+), 9 deletions(-)

diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0006-kexec-syscall.h-work-around-missing-syscall-wrapper.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0006-kexec-syscall.h-work-around-missing-syscall-wrapper.patch
index e0ba9b4..3020f76 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0006-kexec-syscall.h-work-around-missing-syscall-wrapper.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0006-kexec-syscall.h-work-around-missing-syscall-wrapper.patch
@@ -12,11 +12,11 @@ Upstream-Status: Inappropriate [klibc specific]
 Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
 
 ---
- kexec/kexec-syscall.h | 9 +++++++++
- 1 file changed, 9 insertions(+)
+ kexec/kexec-syscall.h | 21 +++++++++++++++++++++
+ 1 file changed, 21 insertions(+)
 
 diff --git a/kexec/kexec-syscall.h b/kexec/kexec-syscall.h
-index 33638c2..b4bd63c 100644
+index 33638c2..204007d 100644
 --- a/kexec/kexec-syscall.h
 +++ b/kexec/kexec-syscall.h
 @@ -74,11 +74,16 @@
@@ -36,19 +36,36 @@ index 33638c2..b4bd63c 100644
  
  static inline int is_kexec_file_load_implemented(void) {
  	if (__NR_kexec_file_load != 0xffffffff)
-@@ -90,8 +95,12 @@ static inline long kexec_file_load(int kernel_fd, int initrd_fd,
+@@ -86,6 +91,21 @@ static inline int is_kexec_file_load_implemented(void) {
+ 	return 0;
+ }
+ 
++#ifdef __KLIBC__
++/* Stub provided by klibc only for the following archs */
++#if defined (__x86_64__) || defined (__powerpc_64__) || defined (__s390x__)
++extern long kexec_file_load(int kernel_fd, int initrd_fd,
++			unsigned long cmdline_len, const char *cmdline_ptr,
++			unsigned long flags);
++#else
++static inline long kexec_file_load(int kernel_fd, int initrd_fd,
++			unsigned long cmdline_len, const char *cmdline_ptr,
++			unsigned long flags)
++{
++	return -1;
++}
++#endif
++#else
+ static inline long kexec_file_load(int kernel_fd, int initrd_fd,
  			unsigned long cmdline_len, const char *cmdline_ptr,
  			unsigned long flags)
- {
-+#ifndef __KLIBC__
+@@ -93,6 +113,7 @@ static inline long kexec_file_load(int kernel_fd, int initrd_fd,
  	return (long) syscall(__NR_kexec_file_load, kernel_fd, initrd_fd,
  				cmdline_len, cmdline_ptr, flags);
-+#else
-+	return -1;
-+#endif
  }
++#endif
  
  #define KEXEC_ON_CRASH		0x00000001
+ #define KEXEC_PRESERVE_CONTEXT	0x00000002
 -- 
 2.7.4
 
-- 
2.7.4


