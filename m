Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BA51C636CC
	for <webhook@archiver.kernel.org>; Sun,  5 Feb 2023 00:59:34 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.20548.1675558766967969695
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Feb 2023 16:59:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZwPTmMUF;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id e19so939488plc.9
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Feb 2023 16:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5vJVQFhFJv33ojtyqUFe97Gvj23m6ihuNie+7LNis8A=;
        b=ZwPTmMUFOlUEx5yDu5eflBw75K6/GB06PFAUDvsPraJOvpWCyl61yJpBN4ZCtEaGld
         3ErS4ehn8PFMAE2qoWel6xBOXIpu2wgqQWv9aRiID6ilOZWu20YtYsFmQzFlB42CzMKv
         YWZn6BgKscPlnhhrnzff8Pd7dhZjArHWCHoLMKRTEgiLgW+tjMw5GEawvh+xkeRgICbg
         Cmes7qcclNCehYfRUvHfP8MOqXXRqmnrScK3xqvVRCghyMCwqJpLZh0tM8YNu+RM0h3M
         58a+fd4A4oFI0iFRN93e5XNOAlg8aMRi3fSnzdR2VI1Dqs8weNpQeseHajxs9AAEoiMG
         j8OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5vJVQFhFJv33ojtyqUFe97Gvj23m6ihuNie+7LNis8A=;
        b=t0ekYy5iEfOpVFFUiwjJvJVhhMANXZCXVF24Pj04CoXNHhp16Fsd5YVWLj5QVXzpPI
         YrXdGscczpN9ddRC7BB5ANRVv0wv9fH9P4F0nPoByjV6zl8Sz+DfMb+S6QU+e4fQaWa4
         e9eKpxp4juIkbMTNZ2tU+v5byWrua8A1wakpoODo4LY8KVUuYZj2RueKyO/C25/40U0V
         wI//rEcGMx8klpiTSh5fyvXu4islFbS1xbWjdbolp8QI660A3sXmW3gYwUxwk1ik9s8r
         UufK8y9JT0QCE9rPHppxPJYrzzoykgmqtq+qNv64I0yjrCWutDVjnQrQjhzIqW9W9BTi
         PLvg==
X-Gm-Message-State: AO0yUKV47Jcv1cVa5jV2jxijODUaqr9x5UEr//aAHUFH5Ch6tcf9PD29
	6LWkuXL3M2kbgSswMYm5xTGLYTyHddU=
X-Google-Smtp-Source: AK7set9a7kU/bER0+AWuq5b4FpmpsMWkjoCu8KczuL26j+fkd+KoBPZWYNS0qT2K/snshxI1XKttBg==
X-Received: by 2002:a17:902:c40f:b0:191:7d3:7fdd with SMTP id k15-20020a170902c40f00b0019107d37fddmr9292762plk.60.1675558765969;
        Sat, 04 Feb 2023 16:59:25 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::868f])
        by smtp.gmail.com with ESMTPSA id k9-20020a170902ba8900b00198e4f48425sm3335842pls.6.2023.02.04.16.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Feb 2023 16:59:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] minicoredumper: Upgrade to 2.0.2 release
Date: Sat,  4 Feb 2023 16:59:23 -0800
Message-Id: <20230205005923.2559620-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Feb 2023 00:59:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100933

Drop patches already upstreamed.
Add patch to fix tests with clang compiler

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-retry-elf-parsing-as-long-as-needed.patch | 128 ------------------
 ...emo-Use-optnone-attribute-with-clang.patch |  37 +++++
 ...mutexattr_setrobust_np-with-pthread_.patch |  33 -----
 ...umper_2.0.1.bb => minicoredumper_2.0.2.bb} |   7 +-
 4 files changed, 39 insertions(+), 166 deletions(-)
 delete mode 100644 meta-oe/recipes-kernel/minicoredumper/files/0001-minicoredumper-retry-elf-parsing-as-long-as-needed.patch
 create mode 100644 meta-oe/recipes-kernel/minicoredumper/files/0001-minicoredumper_demo-Use-optnone-attribute-with-clang.patch
 delete mode 100644 meta-oe/recipes-kernel/minicoredumper/files/0001-replace-pthread_mutexattr_setrobust_np-with-pthread_.patch
 rename meta-oe/recipes-kernel/minicoredumper/{minicoredumper_2.0.1.bb => minicoredumper_2.0.2.bb} (88%)

diff --git a/meta-oe/recipes-kernel/minicoredumper/files/0001-minicoredumper-retry-elf-parsing-as-long-as-needed.patch b/meta-oe/recipes-kernel/minicoredumper/files/0001-minicoredumper-retry-elf-parsing-as-long-as-needed.patch
deleted file mode 100644
index 8d5b8b6cbb..0000000000
--- a/meta-oe/recipes-kernel/minicoredumper/files/0001-minicoredumper-retry-elf-parsing-as-long-as-needed.patch
+++ /dev/null
@@ -1,128 +0,0 @@
-From 7a8c6a06c86e133e4346b1dc66483bd8d0d3c716 Mon Sep 17 00:00:00 2001
-From: John Ogness <john.ogness@linutronix.de>
-Date: Tue, 24 Aug 2021 21:10:43 +0200
-Subject: [PATCH] minicoredumper: retry elf parsing as long as needed
-
-As was reported in github issue #2 ("maximum number of tries
-insufficient, in rare cases, for elf parse"), the number of retries
-for parsing a process may be insufficient. Rather than setting an
-upper limit on the maximum number of retries, track the number of
-headers seen. As long as the number of seen headers is greater than
-the previous try, try again.
-
-In order to avoid introducing any new issues, preserve the behavior
-of retrying at least 10 times, even if no new headers are seen.
-
-Reported-by: github.com/ssajal-wr
-Signed-off-by: John Ogness <john.ogness@linutronix.de>
-
-Upstream-Status: Backport [7a8c6a06c86e133e4346b1dc66483bd8d0d3c716]
-
-Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
----
- src/minicoredumper/corestripper.c | 30 +++++++++++++++++++++++-------
- 1 file changed, 23 insertions(+), 7 deletions(-)
-
-diff --git a/src/minicoredumper/corestripper.c b/src/minicoredumper/corestripper.c
-index d96d1df..c96b350 100644
---- a/src/minicoredumper/corestripper.c
-+++ b/src/minicoredumper/corestripper.c
-@@ -761,7 +761,7 @@ static int init_log(struct dump_info *di)
- typedef int elf_parse_cb(struct dump_info *di, Elf *elf, GElf_Phdr *phdr);
- 
- static int do_elf_ph_parse(struct dump_info *di, GElf_Phdr *type,
--			   elf_parse_cb *callback)
-+			   elf_parse_cb *callback, size_t *phnum_found)
- {
- 	GElf_Ehdr ehdr_mem;
- 	GElf_Ehdr *ehdr;
-@@ -770,6 +770,9 @@ static int do_elf_ph_parse(struct dump_info *di, GElf_Phdr *type,
- 	size_t phnum;
- 	size_t cnt;
- 
-+	if (phnum_found)
-+		*phnum_found = 0;
-+
- 	/* start from beginning of core */
- 	if (lseek64(di->elf_fd, 0, SEEK_SET) == -1) {
- 		info("lseek failed: %s", strerror(errno));
-@@ -809,6 +812,9 @@ static int do_elf_ph_parse(struct dump_info *di, GElf_Phdr *type,
- 		goto out;
- 	}
- 
-+	if (phnum_found)
-+		*phnum_found = phnum;
-+
- 	for (cnt = 0; cnt < phnum; cnt++) {
- 		GElf_Phdr phdr_mem;
- 		GElf_Phdr *phdr;
-@@ -891,7 +897,7 @@ static int vma_cb(struct dump_info *di, Elf *elf, GElf_Phdr *phdr)
- /*
-  * Tries to parse the found ELF headers and reads all vmas from it.
-  */
--static int parse_vma_info(struct dump_info *di)
-+static int parse_vma_info(struct dump_info *di, size_t *phnum_found)
- {
- 	unsigned long min_off = ULONG_MAX;
- 	unsigned long max_len = 0;
-@@ -911,7 +917,7 @@ static int parse_vma_info(struct dump_info *di)
- 	memset(&type, 0, sizeof(type));
- 	type.p_type = PT_LOAD;
- 	type.p_flags = PF_R;
--	if (do_elf_ph_parse(di, &type, vma_cb) != 0)
-+	if (do_elf_ph_parse(di, &type, vma_cb, phnum_found) != 0)
- 		return -1;
- 
- 	for (v = di->vma; v; v = v->next) {
-@@ -1614,8 +1620,10 @@ int add_core_data(struct dump_info *di, off64_t dest_offset, size_t len,
-  */
- static int init_src_core(struct dump_info *di, int src)
- {
-+	size_t last_phnum = 0;
- 	int tries = 0;
- 	int ret = -1;
-+	size_t phnum;
- 	size_t len;
- 	char *buf;
- 	long pos;
-@@ -1642,7 +1650,7 @@ again:
- 		goto out;
- 
- 	/* try to elf-parse the core to read vma info */
--	ret = parse_vma_info(di);
-+	ret = parse_vma_info(di, &phnum);
- 
- 	/* restore our position */
- 	if (lseek64(di->elf_fd, pos, SEEK_SET) == -1)
-@@ -1653,9 +1661,17 @@ again:
- 
- 		tries++;
- 
--		/* maybe try again */
--		if (tries < 10)
-+		if (phnum > last_phnum) {
-+			/* new headers found, keep trying */
-+			last_phnum = phnum;
- 			goto again;
-+		} else if (tries < 10) {
-+			/*
-+			 * even if no new headers are found,
-+			 * retry at least 10 times
-+			 */
-+			goto again;
-+		}
- 
- 		goto out;
- 	}
-@@ -2106,7 +2122,7 @@ static int dump_stacks(struct dump_info *di)
- 		/* find and set the first task */
- 		memset(&type, 0, sizeof(type));
- 		type.p_type = PT_NOTE;
--		do_elf_ph_parse(di, &type, note_cb);
-+		do_elf_ph_parse(di, &type, note_cb, NULL);
- 	}
- 
- 	if (di->first_pid)
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-kernel/minicoredumper/files/0001-minicoredumper_demo-Use-optnone-attribute-with-clang.patch b/meta-oe/recipes-kernel/minicoredumper/files/0001-minicoredumper_demo-Use-optnone-attribute-with-clang.patch
new file mode 100644
index 0000000000..05371e5cd6
--- /dev/null
+++ b/meta-oe/recipes-kernel/minicoredumper/files/0001-minicoredumper_demo-Use-optnone-attribute-with-clang.patch
@@ -0,0 +1,37 @@
+From abaac31d1cb4d0ba0e8e9ef7f344e62de3b150de Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 4 Feb 2023 16:50:46 -0800
+Subject: [PATCH] minicoredumper_demo: Use 'optnone' attribute with clang
+
+clang does not support optimize("On") yet, therefore use optnone which
+should give intended results with clang compiler
+
+Upstream-Status: Submitted [https://github.com/diamon/minicoredumper/pull/7]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/minicoredumper_demo/main.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/src/minicoredumper_demo/main.c b/src/minicoredumper_demo/main.c
+index 65aac46..e60eb82 100644
+--- a/src/minicoredumper_demo/main.c
++++ b/src/minicoredumper_demo/main.c
+@@ -11,8 +11,13 @@
+ #include <sys/types.h>
+ 
+ #include "minicoredumper.h"
+-
+-int __attribute__((optimize("O0"))) main(int argc, char *argv[])
++int
++#ifdef __clang__
++__attribute__((optnone))
++#else
++__attribute__((optimize("O0")))
++#endif
++main(int argc, char *argv[])
+ {
+ 	char *str1 = "This is string 1.";
+ 	unsigned long val1 = 0x1abc123f;
+-- 
+2.39.1
+
diff --git a/meta-oe/recipes-kernel/minicoredumper/files/0001-replace-pthread_mutexattr_setrobust_np-with-pthread_.patch b/meta-oe/recipes-kernel/minicoredumper/files/0001-replace-pthread_mutexattr_setrobust_np-with-pthread_.patch
deleted file mode 100644
index 455e6f3181..0000000000
--- a/meta-oe/recipes-kernel/minicoredumper/files/0001-replace-pthread_mutexattr_setrobust_np-with-pthread_.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 5895caba6573e84f73f159d9e84cd1aa7e969f18 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 9 May 2021 14:37:00 -0700
-Subject: [PATCH] replace pthread_mutexattr_setrobust_np with
- pthread_mutexattr_setrobust
-
-This is now part of standard POSIX function [1]
-
-Upstream-Status: Submitted [https://github.com/diamon/minicoredumper/pull/3]
-
-[1] https://man7.org/linux/man-pages/man3/pthread_mutexattr_setrobust_np.3.html
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/minicoredumper_regd/daemon.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/minicoredumper_regd/daemon.c b/src/minicoredumper_regd/daemon.c
-index 115ec92..b9ad1ea 100644
---- a/src/minicoredumper_regd/daemon.c
-+++ b/src/minicoredumper_regd/daemon.c
-@@ -224,7 +224,7 @@ static int setup_shm(void)
- 
- 	pthread_mutexattr_init(&attr);
- 	pthread_mutexattr_setprotocol(&attr, PTHREAD_PRIO_INHERIT);
--	pthread_mutexattr_setrobust_np(&attr, PTHREAD_MUTEX_ROBUST_NP);
-+	pthread_mutexattr_setrobust(&attr, PTHREAD_MUTEX_ROBUST);
- 	pthread_mutexattr_setpshared(&attr, PTHREAD_PROCESS_SHARED);
- 	pthread_mutex_init(&sh->m, &attr);
- 
--- 
-2.31.1
-
diff --git a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.2.bb
similarity index 88%
rename from meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb
rename to meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.2.bb
index 992de014f4..5763f845a6 100644
--- a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb
+++ b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.2.bb
@@ -9,15 +9,12 @@ DEPENDS = "elfutils dbus dbus-glib-native glib-2.0 dbus-glib util-linux json-c"
 
 inherit autotools pkgconfig ptest systemd update-rc.d
 
-SRCREV = "16a0d44f1725eaa93096eaa0e086f42ef4c2712c"
-
-PR .= "+git${SRCPV}"
+SRCREV = "0bed11b3d69877ce59b1a71359349af60f2009ff"
 
 SRC_URI = "git://github.com/diamon/minicoredumper;protocol=https;branch=master \
-           file://0001-replace-pthread_mutexattr_setrobust_np-with-pthread_.patch \
+           file://0001-minicoredumper_demo-Use-optnone-attribute-with-clang.patch \
            file://minicoredumper.service \
            file://minicoredumper.init \
-           file://0001-minicoredumper-retry-elf-parsing-as-long-as-needed.patch \
            file://run-ptest \
            "
 
-- 
2.39.1


