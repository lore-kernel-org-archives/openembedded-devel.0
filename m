Return-Path: <andrea.adami@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id AD15D79567
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Aug 2018 13:40:59 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id o37-v6so11261476wrf.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Aug 2018 06:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=82hhTKox/aTtZYtjxFPnkFf6PZKCF6bro4D0pQuy4ZQ=;
	b=Zk2taHjlO9JG996QZMZrCOdRSA9TGwhhQjVN152E8LqaO1iqPLf5w0S1lyCPuqAINC
	wZiUBmYiE23c3CLLHGK7upnON9nF0XOf23V5YFRMV8X++HffZC+Leu9b5b6WcK2h3Cpd
	hThWrX9fbP9Fg0ZODRZgKMrWG4oA8sIF9JwZb8uxTyKv8bhgy1MsEG+JuQprZslb/zqH
	jEWUWPUUeC9gxgc+D9W8QxCPaGMkTNohDYM2HGMnJBZOSiGkpNVjVDr08bCdnt/osvO5
	qmz/n+Rg2sWJA50Dq3vzAJURAuCaok3eIz/CUwxQ9/y04Yu3mKGFcUrzFxNaMNduF4ee
	hNsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=82hhTKox/aTtZYtjxFPnkFf6PZKCF6bro4D0pQuy4ZQ=;
	b=eTzAsnMjVWR1ngU7u1ITbdedRHyagzlGA0izKvBK5ZkltaNKb7KSrbcn4zLW2+tZyw
	bj2ii7wcUxnkF0PaoBSyykaEvztCzgeHYDDBvj9QtL7RtgyNfpq3WwluTyrTgWbIhdi9
	CiRgzqZebsL7FzDZVIQYTaTllKlsRJA74coByb0eQjgryT/Ct7XNCE4xG2p8tQswPTON
	+9XE7VZZARVq8MhCT23N/4ZA9YsuRMiPDnz5SWBP1XXmt1+lVuXknBJM1GmAlzWg++d9
	GyunXEMAucclQbJxbw1gHp388LtQ9Atgfp+YSk2BInM7smhbTgXkxH2TJcFurAYLd8cE
	fj9A==
X-Gm-Message-State: APzg51CGlmJllXdobDTOG5Pe/vIOlZY7UJVgzWxriR+K2UAYGZ6dX+I4
	YfzcSNwtwCqSYKGwheqTF5O2zwzf
X-Google-Smtp-Source: ANB0VdZxmcDLtLAK3enY2XFbqYUPF0zd9/p3zCToItuBJUo1BYdKOi291OnSSq5TW8pm3jXdo/Fxqg==
X-Received: by 2002:adf:e846:: with SMTP id
	d6-v6mr10438828wrn.269.1535722860027; 
	Fri, 31 Aug 2018 06:41:00 -0700 (PDT)
Received: from andrea-ThinkPad-T520.homenet.telecomitalia.it
	(host63-251-dynamic.54-79-r.retail.telecomitalia.it. [79.54.251.63])
	by smtp.gmail.com with ESMTPSA id
	k5-v6sm14939052wrm.96.2018.08.31.06.40.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 31 Aug 2018 06:40:59 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Aug 2018 15:40:54 +0200
Message-Id: <1535722854-31672-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-initramfs][PATCH] kexec-tools-klibc: fix kexec_load() syscall workaround
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
X-List-Received-Date: Fri, 31 Aug 2018 13:40:59 -0000

As soon as klibc adds kexec_file_load() syscall we can rework this patch.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 ...all.h-work-around-missing-syscall-wrapper.patch | 25 +++++++++++++---------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0006-kexec-syscall.h-work-around-missing-syscall-wrapper.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0006-kexec-syscall.h-work-around-missing-syscall-wrapper.patch
index 4a8968b..e0ba9b4 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0006-kexec-syscall.h-work-around-missing-syscall-wrapper.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0006-kexec-syscall.h-work-around-missing-syscall-wrapper.patch
@@ -1,6 +1,6 @@
-From e6aa1f18dc44dc71be3ceada2a96383d22454399 Mon Sep 17 00:00:00 2001
+From 45a80fe7d247898d83edfeabe32b9de80a50a6be Mon Sep 17 00:00:00 2001
 From: Andrea Adami <andrea.adami@gmail.com>
-Date: Thu, 19 Apr 2018 00:25:01 +0200
+Date: Fri, 31 Aug 2018 11:33:51 +0200
 Subject: [PATCH] kexec-syscall.h: work around missing syscall() wrapper
 
 Fix
@@ -12,26 +12,31 @@ Upstream-Status: Inappropriate [klibc specific]
 Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
 
 ---
- kexec/kexec-syscall.h | 8 ++++++++
- 1 file changed, 8 insertions(+)
+ kexec/kexec-syscall.h | 9 +++++++++
+ 1 file changed, 9 insertions(+)
 
 diff --git a/kexec/kexec-syscall.h b/kexec/kexec-syscall.h
-index 33638c2..6b633e4 100644
+index 33638c2..b4bd63c 100644
 --- a/kexec/kexec-syscall.h
 +++ b/kexec/kexec-syscall.h
-@@ -77,7 +77,11 @@ struct kexec_segment;
+@@ -74,11 +74,16 @@
+ 
+ struct kexec_segment;
+ 
++#ifndef __KLIBC__
  static inline long kexec_load(void *entry, unsigned long nr_segments,
  			struct kexec_segment *segments, unsigned long flags)
  {
-+#ifndef __KLIBC__
  	return (long) syscall(__NR_kexec_load, entry, nr_segments, segments, flags);
+ }
 +#else
-+	return (long) kexec_load(entry, nr_segments, segments, flags);
++extern long kexec_load(void *entry, unsigned long nr_segments,
++			struct kexec_segment *segments, unsigned long flags);
 +#endif
- }
  
  static inline int is_kexec_file_load_implemented(void) {
-@@ -90,8 +94,12 @@ static inline long kexec_file_load(int kernel_fd, int initrd_fd,
+ 	if (__NR_kexec_file_load != 0xffffffff)
+@@ -90,8 +95,12 @@ static inline long kexec_file_load(int kernel_fd, int initrd_fd,
  			unsigned long cmdline_len, const char *cmdline_ptr,
  			unsigned long flags)
  {
-- 
2.7.4


