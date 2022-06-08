Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44D18C433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 18:25:17 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.940.1654712712316768026
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jun 2022 11:25:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.146.13,
 mailfrom: sakib.sajal@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 258IP9N2032186
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 8 Jun 2022 11:25:09 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 258IP8SJ024099
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 8 Jun 2022 11:25:09 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 8 Jun 2022 11:25:08 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 8 Jun 2022 11:25:08 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 8 Jun 2022 11:25:08 -0700
From: Sakib Sajal <sakib.sajal@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] minicoredumper: retry elf parsing as long as needed
Date: Wed, 8 Jun 2022 14:25:07 -0400
Message-ID: <20220608182507.9479-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Jun 2022 18:25:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97445

Maximum number of tries, in rare cases, is insufficient for
elf parse. Backport patch that fixes the issue.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 ...-retry-elf-parsing-as-long-as-needed.patch | 128 ++++++++++++++++++
 .../minicoredumper/minicoredumper_2.0.1.bb    |   1 +
 2 files changed, 129 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/minicoredumper/files/0001-minicoredumper-retry-elf-parsing-as-long-as-needed.patch

diff --git a/meta-oe/recipes-kernel/minicoredumper/files/0001-minicoredumper-retry-elf-parsing-as-long-as-needed.patch b/meta-oe/recipes-kernel/minicoredumper/files/0001-minicoredumper-retry-elf-parsing-as-long-as-needed.patch
new file mode 100644
index 000000000..8d5b8b6cb
--- /dev/null
+++ b/meta-oe/recipes-kernel/minicoredumper/files/0001-minicoredumper-retry-elf-parsing-as-long-as-needed.patch
@@ -0,0 +1,128 @@
+From 7a8c6a06c86e133e4346b1dc66483bd8d0d3c716 Mon Sep 17 00:00:00 2001
+From: John Ogness <john.ogness@linutronix.de>
+Date: Tue, 24 Aug 2021 21:10:43 +0200
+Subject: [PATCH] minicoredumper: retry elf parsing as long as needed
+
+As was reported in github issue #2 ("maximum number of tries
+insufficient, in rare cases, for elf parse"), the number of retries
+for parsing a process may be insufficient. Rather than setting an
+upper limit on the maximum number of retries, track the number of
+headers seen. As long as the number of seen headers is greater than
+the previous try, try again.
+
+In order to avoid introducing any new issues, preserve the behavior
+of retrying at least 10 times, even if no new headers are seen.
+
+Reported-by: github.com/ssajal-wr
+Signed-off-by: John Ogness <john.ogness@linutronix.de>
+
+Upstream-Status: Backport [7a8c6a06c86e133e4346b1dc66483bd8d0d3c716]
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ src/minicoredumper/corestripper.c | 30 +++++++++++++++++++++++-------
+ 1 file changed, 23 insertions(+), 7 deletions(-)
+
+diff --git a/src/minicoredumper/corestripper.c b/src/minicoredumper/corestripper.c
+index d96d1df..c96b350 100644
+--- a/src/minicoredumper/corestripper.c
++++ b/src/minicoredumper/corestripper.c
+@@ -761,7 +761,7 @@ static int init_log(struct dump_info *di)
+ typedef int elf_parse_cb(struct dump_info *di, Elf *elf, GElf_Phdr *phdr);
+ 
+ static int do_elf_ph_parse(struct dump_info *di, GElf_Phdr *type,
+-			   elf_parse_cb *callback)
++			   elf_parse_cb *callback, size_t *phnum_found)
+ {
+ 	GElf_Ehdr ehdr_mem;
+ 	GElf_Ehdr *ehdr;
+@@ -770,6 +770,9 @@ static int do_elf_ph_parse(struct dump_info *di, GElf_Phdr *type,
+ 	size_t phnum;
+ 	size_t cnt;
+ 
++	if (phnum_found)
++		*phnum_found = 0;
++
+ 	/* start from beginning of core */
+ 	if (lseek64(di->elf_fd, 0, SEEK_SET) == -1) {
+ 		info("lseek failed: %s", strerror(errno));
+@@ -809,6 +812,9 @@ static int do_elf_ph_parse(struct dump_info *di, GElf_Phdr *type,
+ 		goto out;
+ 	}
+ 
++	if (phnum_found)
++		*phnum_found = phnum;
++
+ 	for (cnt = 0; cnt < phnum; cnt++) {
+ 		GElf_Phdr phdr_mem;
+ 		GElf_Phdr *phdr;
+@@ -891,7 +897,7 @@ static int vma_cb(struct dump_info *di, Elf *elf, GElf_Phdr *phdr)
+ /*
+  * Tries to parse the found ELF headers and reads all vmas from it.
+  */
+-static int parse_vma_info(struct dump_info *di)
++static int parse_vma_info(struct dump_info *di, size_t *phnum_found)
+ {
+ 	unsigned long min_off = ULONG_MAX;
+ 	unsigned long max_len = 0;
+@@ -911,7 +917,7 @@ static int parse_vma_info(struct dump_info *di)
+ 	memset(&type, 0, sizeof(type));
+ 	type.p_type = PT_LOAD;
+ 	type.p_flags = PF_R;
+-	if (do_elf_ph_parse(di, &type, vma_cb) != 0)
++	if (do_elf_ph_parse(di, &type, vma_cb, phnum_found) != 0)
+ 		return -1;
+ 
+ 	for (v = di->vma; v; v = v->next) {
+@@ -1614,8 +1620,10 @@ int add_core_data(struct dump_info *di, off64_t dest_offset, size_t len,
+  */
+ static int init_src_core(struct dump_info *di, int src)
+ {
++	size_t last_phnum = 0;
+ 	int tries = 0;
+ 	int ret = -1;
++	size_t phnum;
+ 	size_t len;
+ 	char *buf;
+ 	long pos;
+@@ -1642,7 +1650,7 @@ again:
+ 		goto out;
+ 
+ 	/* try to elf-parse the core to read vma info */
+-	ret = parse_vma_info(di);
++	ret = parse_vma_info(di, &phnum);
+ 
+ 	/* restore our position */
+ 	if (lseek64(di->elf_fd, pos, SEEK_SET) == -1)
+@@ -1653,9 +1661,17 @@ again:
+ 
+ 		tries++;
+ 
+-		/* maybe try again */
+-		if (tries < 10)
++		if (phnum > last_phnum) {
++			/* new headers found, keep trying */
++			last_phnum = phnum;
+ 			goto again;
++		} else if (tries < 10) {
++			/*
++			 * even if no new headers are found,
++			 * retry at least 10 times
++			 */
++			goto again;
++		}
+ 
+ 		goto out;
+ 	}
+@@ -2106,7 +2122,7 @@ static int dump_stacks(struct dump_info *di)
+ 		/* find and set the first task */
+ 		memset(&type, 0, sizeof(type));
+ 		type.p_type = PT_NOTE;
+-		do_elf_ph_parse(di, &type, note_cb);
++		do_elf_ph_parse(di, &type, note_cb, NULL);
+ 	}
+ 
+ 	if (di->first_pid)
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb
index bf9915294..0b934ee2d 100644
--- a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb
+++ b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb
@@ -17,6 +17,7 @@ SRC_URI = "git://github.com/diamon/minicoredumper;protocol=https;branch=master \
            file://0001-replace-pthread_mutexattr_setrobust_np-with-pthread_.patch \
            file://minicoredumper.service \
            file://minicoredumper.init \
+           file://0001-minicoredumper-retry-elf-parsing-as-long-as-needed.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.33.0


