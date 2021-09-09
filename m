Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.5345.1631181382358122517
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Sep 2021 02:56:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=T8zfCTjN;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1631181379; i=@fujitsu.com;
	bh=O9tNFShBKLRYFnBDA9ImuUS770ZFab20xm0kSk7/h/o=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=T8zfCTjNTrEuJWuZKG5d+tK9wdJp2TGAEbaS4XAoc1fO+KgB/FAFx2QdmLoQ261Ex
	 QfVMbsGJXhaAVu6EwgAn5TiR3rZ9jqWJV3xq6xKdd4SCz3rLegp0VVmhJgz4oq5Wd3
	 VyUzxSXeh5Z3MsvGGyf//hhmBUH7n17ndtrDco6zNS/GMKrUvnahZouEmXpNQp392Y
	 uauDtPink0hhVnX60yOmrWfv+uu5NkJuzWUv7YT+huAnjZNDBfUb704G0tEsvZD4ZE
	 npSqRABHqzT5MX1JlGZsSlSB8qIzr5RxLj5mRSJ2BGxrP/dN5+hpdHO0cWYhIj+bgI
	 q8RrtQe0wqKXw==
Received: from [100.113.2.26] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.symcld.net id 91/18-24763-34AD9316; Thu, 09 Sep 2021 09:56:19 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIIsWRWlGSWpSXmKPExsViZ8MRqut0yzL
  R4MZDHYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWP7z5tsBYsOM1YcO/yQqYFx8QrGLkYuDiGB
  WUwS76e/ZYVwjjNKXJmzmqWLkZODTUBHouNFN5gtIqAvsXT2HmYQW1jAVuLUzANMIDaLgKpE4
  7RpYHFeATeJF28/s4HYEgIKElMevoeKC0qcnPkEbA6zgITEwRcvmCFqFCW27zzDAmFXSLw+fI
  l5AiPPLCQts5C0LGBkWsVomVSUmZ5RkpuYmaNraGCga2horGuga2RqpJdYpZuol1qqm5yaV1K
  UCJTVSywv1iuuzE3OSdHLSy3ZxAgMp5RChj87GFe/+aB3iFGSg0lJlNfspmWiEF9SfkplRmJx
  RnxRaU5q8SFGGQ4OJQnehOtAOcGi1PTUirTMHGBow6QlOHiURHjVQNK8xQWJucWZ6RCpU4zGH
  DtPL17EzPHuJ5AUYsnLz0uVEufdcQOoVACkNKM0D24QLOYuMcpKCfMyMjAwCPEUpBblZpagyr
  9iFOdgVBLm5QW5lSczrwRu3yugU5iATvG9ZgFySkkiQkqqgWnDi49rst/OPbmPoyZS1trD2bx
  H4kUGG2uexerPl/XOHqr+utPzgP0s3s4NFy+n1c5vYPvUl5tYWjT1tsSc7Hut4o2Xi5vuaU/9
  /6XRrqTNvFLJI3zjhhdqC6yFmBZ1xW6PfrYtUi2wI/DfH2vxiT+iengmn+zflsPFzrjs1+8tW
  Zvijtxp7S3Tyj5Q+5WX2f+6tHqfkeLB5ztk7k4/MPecrHa9TfvruTpZ+7e25OZttdrbNG/3x2
  ksq44KH9y55dteT/3iLd/Wyqfcr3imfP5md3Z1+LFHc1S7XHyi57El5Ox8pREctqW4dnvd9UM
  Oqw+VKou9/FqxU/yiF2Mga1yr4a/3hTUr+R5OyHxT56vEUpyRaKjFXFScCAAVyJx7NAMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-4.tower-226.messagelabs.com!1631181378!4590!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16040 invoked from network); 9 Sep 2021 09:56:18 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-4.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 9 Sep 2021 09:56:18 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1899uCHE020175
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 9 Sep 2021 10:56:18 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Thu, 9 Sep 2021 10:56:09 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] crash: upgrade 7.2.9 -> 7.3.0
Date: Fri, 10 Sep 2021 05:56:03 +0800
Message-ID: <1631224563-4385-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Refresh the following patch:
donnot-extract-gdb-during-do-compile.patch
remove-unrecognized-gcc-option-m32-for-mips.patch

0001-printk-add-support-for-lockless-ringbuffer.patch
0002-printk-use-committed-finalized-state-values.patch
Removed since these are included in 7.3.0.

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 ...-add-support-for-lockless-ringbuffer.patch | 445 ------------------
 ...use-committed-finalized-state-values.patch | 103 ----
 ...donnot-extract-gdb-during-do-compile.patch |  19 +-
 ...unrecognized-gcc-option-m32-for-mips.patch |   6 +-
 .../crash/{crash_7.2.9.bb => crash_7.3.0.bb}  |   4 +-
 5 files changed, 14 insertions(+), 563 deletions(-)
 delete mode 100644 meta-oe/recipes-kernel/crash/crash/0001-printk-add-support-for-lockless-ringbuffer.patch
 delete mode 100644 meta-oe/recipes-kernel/crash/crash/0002-printk-use-committed-finalized-state-values.patch
 rename meta-oe/recipes-kernel/crash/{crash_7.2.9.bb => crash_7.3.0.bb} (96%)

diff --git a/meta-oe/recipes-kernel/crash/crash/0001-printk-add-support-for-lockless-ringbuffer.patch b/meta-oe/recipes-kernel/crash/crash/0001-printk-add-support-for-lockless-ringbuffer.patch
deleted file mode 100644
index 1aaf1e6b07..0000000000
--- a/meta-oe/recipes-kernel/crash/crash/0001-printk-add-support-for-lockless-ringbuffer.patch
+++ /dev/null
@@ -1,445 +0,0 @@
-From a5531b24750e7949c35640d996ea14c0587938bc Mon Sep 17 00:00:00 2001
-From: John Ogness <john.ogness@linutronix.de>
-Date: Fri, 20 Nov 2020 05:56:59 +0000
-Subject: [PATCH 1/2] printk: add support for lockless ringbuffer
-
-Linux 5.10 introduces a new lockless ringbuffer. The new ringbuffer
-is structured completely different to the previous iterations.
-Add support for dumping the ringbuffer with the "log" command.
-The new ringbuffer is detected based on the availability of
-the "prb" symbol.
-
-Upstream-Status: Backport [https://github.com/crash-utility/crash/commit/a5531b24750e7949c35640d996ea14c0587938bc]
-
-Signed-off-by: John Ogness <john.ogness@linutronix.de>
-Signed-off-by: Kazuhito Hagio <k-hagio-ab@nec.com>
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com> 
----
- Makefile  |   5 ++
- defs.h    |  30 +++++++
- kernel.c  |   7 +-
- printk.c  | 256 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
- symbols.c |  27 ++++++
- 5 files changed, 324 insertions(+), 1 deletion(-)
- create mode 100644 printk.c
-
-diff --git a/Makefile b/Makefile
-index d185719..f66eba7 100644
---- a/Makefile
-+++ b/Makefile
-@@ -61,6 +61,7 @@ VMWARE_HFILES=vmware_vmss.h
- 
- CFILES=main.c tools.c global_data.c memory.c filesys.c help.c task.c \
- 	kernel.c test.c gdb_interface.c configure.c net.c dev.c bpf.c \
-+	printk.c \
- 	alpha.c x86.c ppc.c ia64.c s390.c s390x.c s390dbf.c ppc64.c x86_64.c \
- 	arm.c arm64.c mips.c sparc64.c \
- 	extensions.c remote.c va_server.c va_server_v1.c symbols.c cmdline.c \
-@@ -80,6 +81,7 @@ SOURCE_FILES=${CFILES} ${GENERIC_HFILES} ${MCORE_HFILES} \
- 
- OBJECT_FILES=main.o tools.o global_data.o memory.o filesys.o help.o task.o \
- 	build_data.o kernel.o test.o gdb_interface.o net.o dev.o bpf.o \
-+	printk.o \
- 	alpha.o x86.o ppc.o ia64.o s390.o s390x.o s390dbf.o ppc64.o x86_64.o \
- 	arm.o arm64.o mips.o sparc64.o \
- 	extensions.o remote.o va_server.o va_server_v1.o symbols.o cmdline.o \
-@@ -363,6 +365,9 @@ task.o: ${GENERIC_HFILES} task.c
- kernel.o: ${GENERIC_HFILES} kernel.c
- 	${CC} -c ${CRASH_CFLAGS} kernel.c ${WARNING_OPTIONS} ${WARNING_ERROR}
- 
-+printk.o: ${GENERIC_HFILES} printk.c
-+	${CC} -c ${CRASH_CFLAGS} printk.c ${WARNING_OPTIONS} ${WARNING_ERROR}
-+
- gdb_interface.o: ${GENERIC_HFILES} gdb_interface.c
- 	${CC} -c ${CRASH_CFLAGS} gdb_interface.c ${WARNING_OPTIONS} ${WARNING_ERROR}
- 
-diff --git a/defs.h b/defs.h
-index 9594950..e1a18e9 100644
---- a/defs.h
-+++ b/defs.h
-@@ -2106,6 +2106,28 @@ struct offset_table {                    /* stash of commonly-used offsets */
- 	long irq_common_data_affinity;
- 	long irq_desc_irq_common_data;
- 	long uts_namespace_name;
-+	long printk_info_seq;
-+	long printk_info_ts_nsec;
-+	long printk_info_text_len;
-+	long printk_info_level;
-+	long printk_info_caller_id;
-+	long printk_info_dev_info;
-+	long dev_printk_info_subsystem;
-+	long dev_printk_info_device;
-+	long prb_desc_ring;
-+	long prb_text_data_ring;
-+	long prb_desc_ring_count_bits;
-+	long prb_desc_ring_descs;
-+	long prb_desc_ring_infos;
-+	long prb_desc_ring_head_id;
-+	long prb_desc_ring_tail_id;
-+	long prb_desc_state_var;
-+	long prb_desc_text_blk_lpos;
-+	long prb_data_blk_lpos_begin;
-+	long prb_data_blk_lpos_next;
-+	long prb_data_ring_size_bits;
-+	long prb_data_ring_data;
-+	long atomic_long_t_counter;
- };
- 
- struct size_table {         /* stash of commonly-used sizes */
-@@ -2265,6 +2287,9 @@ struct size_table {         /* stash of commonly-used sizes */
- 	long xa_node;
- 	long zram_table_entry;
- 	long irq_common_data;
-+	long printk_info;
-+	long printk_ringbuffer;
-+	long prb_desc;
- };
- 
- struct array_table {
-@@ -6696,6 +6721,11 @@ int vmware_guestdump_memory_dump(FILE *);
-  */
- int calc_kaslr_offset(ulong *, ulong *);
- 
-+/*
-+ * printk.c
-+ */
-+void dump_lockless_record_log(int);
-+
- /*
-  *  gnu_binutils.c
-  */
-diff --git a/kernel.c b/kernel.c
-index 9871637..e722ff9 100644
---- a/kernel.c
-+++ b/kernel.c
-@@ -5042,6 +5042,11 @@ dump_log(int msg_flags)
- 	struct syment *nsp;
- 	int log_wrap, loglevel, log_buf_len;
- 
-+	if (kernel_symbol_exists("prb")) {
-+		dump_lockless_record_log(msg_flags);
-+		return;
-+	}
-+
- 	if (kernel_symbol_exists("log_first_idx") && 
- 	    kernel_symbol_exists("log_next_idx")) {
- 		dump_variable_length_record_log(msg_flags);
-@@ -5289,7 +5294,7 @@ dump_log_entry(char *logptr, int msg_flags)
- }
- 
- /* 
-- *  Handle the new variable-length-record log_buf.
-+ *  Handle the variable-length-record log_buf.
-  */
- static void
- dump_variable_length_record_log(int msg_flags)
-diff --git a/printk.c b/printk.c
-new file mode 100644
-index 0000000..f6d54ce
---- /dev/null
-+++ b/printk.c
-@@ -0,0 +1,256 @@
-+#include "defs.h"
-+#include <ctype.h>
-+
-+#define DESC_SV_BITS		(sizeof(unsigned long) * 8)
-+#define DESC_COMMITTED_MASK	(1UL << (DESC_SV_BITS - 1))
-+#define DESC_REUSE_MASK		(1UL << (DESC_SV_BITS - 2))
-+#define DESC_FLAGS_MASK		(DESC_COMMITTED_MASK | DESC_REUSE_MASK)
-+#define DESC_ID_MASK		(~DESC_FLAGS_MASK)
-+
-+/* convenience struct for passing many values to helper functions */
-+struct prb_map {
-+	char *prb;
-+
-+	char *desc_ring;
-+	unsigned long desc_ring_count;
-+	char *descs;
-+	char *infos;
-+
-+	char *text_data_ring;
-+	unsigned long text_data_ring_size;
-+	char *text_data;
-+};
-+
-+static void
-+init_offsets(void)
-+{
-+	char *n;
-+
-+	n = "printk_info";
-+	STRUCT_SIZE_INIT(printk_info, n);
-+	MEMBER_OFFSET_INIT(printk_info_seq, n, "seq");
-+	MEMBER_OFFSET_INIT(printk_info_ts_nsec, n, "ts_nsec");
-+	MEMBER_OFFSET_INIT(printk_info_text_len, n, "text_len");
-+	MEMBER_OFFSET_INIT(printk_info_level, n, "level");
-+	MEMBER_OFFSET_INIT(printk_info_caller_id, n, "caller_id");
-+	MEMBER_OFFSET_INIT(printk_info_dev_info, n, "dev_info");
-+
-+	n = "dev_printk_info";
-+	MEMBER_OFFSET_INIT(dev_printk_info_subsystem, n, "subsystem");
-+	MEMBER_OFFSET_INIT(dev_printk_info_device, n, "device");
-+
-+	n = "printk_ringbuffer";
-+	STRUCT_SIZE_INIT(printk_ringbuffer, n);
-+	MEMBER_OFFSET_INIT(prb_desc_ring, n, "desc_ring");
-+	MEMBER_OFFSET_INIT(prb_text_data_ring, n, "text_data_ring");
-+
-+	n = "prb_desc_ring";
-+	MEMBER_OFFSET_INIT(prb_desc_ring_count_bits, n, "count_bits");
-+	MEMBER_OFFSET_INIT(prb_desc_ring_descs, n, "descs");
-+	MEMBER_OFFSET_INIT(prb_desc_ring_infos, n, "infos");
-+	MEMBER_OFFSET_INIT(prb_desc_ring_head_id, n, "head_id");
-+	MEMBER_OFFSET_INIT(prb_desc_ring_tail_id, n, "tail_id");
-+
-+	n = "prb_desc";
-+	STRUCT_SIZE_INIT(prb_desc, n);
-+	MEMBER_OFFSET_INIT(prb_desc_state_var, n, "state_var");
-+	MEMBER_OFFSET_INIT(prb_desc_text_blk_lpos, n, "text_blk_lpos");
-+
-+	n = "prb_data_blk_lpos";
-+	MEMBER_OFFSET_INIT(prb_data_blk_lpos_begin, n, "begin");
-+	MEMBER_OFFSET_INIT(prb_data_blk_lpos_next, n, "next");
-+
-+	n = "prb_data_ring";
-+	MEMBER_OFFSET_INIT(prb_data_ring_size_bits, n, "size_bits");
-+	MEMBER_OFFSET_INIT(prb_data_ring_data, n, "data");
-+
-+	n = "atomic_long_t";
-+	MEMBER_OFFSET_INIT(atomic_long_t_counter, n, "counter");
-+}
-+
-+static void
-+dump_record(struct prb_map *m, unsigned long id, int msg_flags)
-+{
-+	unsigned short text_len;
-+	unsigned long state_var;
-+	unsigned int caller_id;
-+	unsigned char level;
-+	unsigned long begin;
-+	unsigned long next;
-+	char buf[BUFSIZE];
-+	uint64_t ts_nsec;
-+	ulonglong nanos;
-+	ulonglong seq;
-+	int ilen = 0, i;
-+	char *desc, *info, *text, *p;
-+	ulong rem;
-+
-+	desc = m->descs + ((id % m->desc_ring_count) * SIZE(prb_desc));
-+
-+	/* skip non-committed record */
-+	state_var = ULONG(desc + OFFSET(prb_desc_state_var) +
-+			OFFSET(atomic_long_t_counter));
-+	if ((state_var & DESC_FLAGS_MASK) != DESC_COMMITTED_MASK)
-+		return;
-+
-+	info = m->infos + ((id % m->desc_ring_count) * SIZE(printk_info));
-+
-+	seq = ULONGLONG(info + OFFSET(printk_info_seq));
-+	caller_id = UINT(info + OFFSET(printk_info_caller_id));
-+	if (CRASHDEBUG(1))
-+		fprintf(fp, "seq: %llu caller_id: %x (%s: %u)\n", seq, caller_id,
-+			caller_id & 0x80000000 ? "cpu" : "pid", caller_id & ~0x80000000);
-+
-+	text_len = USHORT(info + OFFSET(printk_info_text_len));
-+
-+	begin = ULONG(desc + OFFSET(prb_desc_text_blk_lpos) +
-+		      OFFSET(prb_data_blk_lpos_begin)) %
-+			m->text_data_ring_size;
-+	next = ULONG(desc + OFFSET(prb_desc_text_blk_lpos) +
-+		     OFFSET(prb_data_blk_lpos_next)) %
-+			m->text_data_ring_size;
-+
-+	/* skip data-less text blocks */
-+	if (begin == next)
-+		goto out;
-+
-+	if ((msg_flags & SHOW_LOG_TEXT) == 0) {
-+		ts_nsec = ULONGLONG(info + OFFSET(printk_info_ts_nsec));
-+		nanos = (ulonglong)ts_nsec / (ulonglong)1000000000;
-+		rem = (ulonglong)ts_nsec % (ulonglong)1000000000;
-+		if (msg_flags & SHOW_LOG_CTIME) {
-+			time_t t = kt->boot_date.tv_sec + nanos;
-+			sprintf(buf, "[%s] ", ctime_tz(&t));
-+		} else
-+			sprintf(buf, "[%5lld.%06ld] ", nanos, rem/1000);
-+
-+		ilen += strlen(buf);
-+		fprintf(fp, "%s", buf);
-+	}
-+
-+	if (msg_flags & SHOW_LOG_LEVEL) {
-+		level = UCHAR(info + OFFSET(printk_info_level)) >> 5;
-+		sprintf(buf, "<%x>", level);
-+		ilen += strlen(buf);
-+		fprintf(fp, "%s", buf);
-+	}
-+
-+	/* handle wrapping data block */
-+	if (begin > next)
-+		begin = 0;
-+
-+	/* skip over descriptor ID */
-+	begin += sizeof(unsigned long);
-+
-+	/* handle truncated messages */
-+	if (next - begin < text_len)
-+		text_len = next - begin;
-+
-+	text = m->text_data + begin;
-+
-+	for (i = 0, p = text; i < text_len; i++, p++) {
-+		if (*p == '\n')
-+			fprintf(fp, "\n%s", space(ilen));
-+		else if (isprint(*p) || isspace(*p))
-+			fputc(*p, fp);
-+		else
-+			fputc('.', fp);
-+	}
-+
-+	if (msg_flags & SHOW_LOG_DICT) {
-+		text = info + OFFSET(printk_info_dev_info) +
-+				OFFSET(dev_printk_info_subsystem);
-+		if (strlen(text))
-+			fprintf(fp, "\n%sSUBSYSTEM=%s", space(ilen), text);
-+
-+		text = info + OFFSET(printk_info_dev_info) +
-+				OFFSET(dev_printk_info_device);
-+		if (strlen(text))
-+			fprintf(fp, "\n%sDEVICE=%s", space(ilen), text);
-+	}
-+out:
-+	fprintf(fp, "\n");
-+}
-+
-+/*
-+ *  Handle the lockless printk_ringbuffer.
-+ */
-+void
-+dump_lockless_record_log(int msg_flags)
-+{
-+	unsigned long head_id;
-+	unsigned long tail_id;
-+	unsigned long kaddr;
-+	unsigned long id;
-+	struct prb_map m;
-+
-+	if (INVALID_SIZE(printk_info))
-+		init_offsets();
-+
-+	/* setup printk_ringbuffer */
-+	get_symbol_data("prb", sizeof(char *), &kaddr);
-+	m.prb = GETBUF(SIZE(printk_ringbuffer));
-+	if (!readmem(kaddr, KVADDR, m.prb, SIZE(printk_ringbuffer),
-+		     "printk_ringbuffer contents", RETURN_ON_ERROR|QUIET)) {
-+		error(WARNING, "\ncannot read printk_ringbuffer contents\n");
-+		goto out_prb;
-+	}
-+
-+	/* setup descriptor ring */
-+	m.desc_ring = m.prb + OFFSET(prb_desc_ring);
-+	m.desc_ring_count = 1 << UINT(m.desc_ring + OFFSET(prb_desc_ring_count_bits));
-+
-+	kaddr = ULONG(m.desc_ring + OFFSET(prb_desc_ring_descs));
-+	m.descs = GETBUF(SIZE(prb_desc) * m.desc_ring_count);
-+	if (!readmem(kaddr, KVADDR, m.descs, SIZE(prb_desc) * m.desc_ring_count,
-+		     "prb_desc_ring contents", RETURN_ON_ERROR|QUIET)) {
-+		error(WARNING, "\ncannot read prb_desc_ring contents\n");
-+		goto out_descs;
-+	}
-+
-+	kaddr = ULONG(m.desc_ring + OFFSET(prb_desc_ring_infos));
-+	m.infos = GETBUF(SIZE(printk_info) * m.desc_ring_count);
-+	if (!readmem(kaddr, KVADDR, m.infos, SIZE(printk_info) * m.desc_ring_count,
-+		     "prb_info_ring contents", RETURN_ON_ERROR|QUIET)) {
-+		error(WARNING, "\ncannot read prb_info_ring contents\n");
-+		goto out_infos;
-+	}
-+
-+	/* setup text data ring */
-+	m.text_data_ring = m.prb + OFFSET(prb_text_data_ring);
-+	m.text_data_ring_size = 1 << UINT(m.text_data_ring + OFFSET(prb_data_ring_size_bits));
-+
-+	kaddr = ULONG(m.text_data_ring + OFFSET(prb_data_ring_data));
-+	m.text_data = GETBUF(m.text_data_ring_size);
-+	if (!readmem(kaddr, KVADDR, m.text_data, m.text_data_ring_size,
-+		     "prb_text_data_ring contents", RETURN_ON_ERROR|QUIET)) {
-+		error(WARNING, "\ncannot read prb_text_data_ring contents\n");
-+		goto out_text_data;
-+	}
-+
-+	/* ready to go */
-+
-+	tail_id = ULONG(m.desc_ring + OFFSET(prb_desc_ring_tail_id) +
-+			OFFSET(atomic_long_t_counter));
-+	head_id = ULONG(m.desc_ring + OFFSET(prb_desc_ring_head_id) +
-+			OFFSET(atomic_long_t_counter));
-+
-+	hq_open();
-+
-+	for (id = tail_id; id != head_id; id = (id + 1) & DESC_ID_MASK)
-+		dump_record(&m, id, msg_flags);
-+
-+	/* dump head record */
-+	dump_record(&m, id, msg_flags);
-+
-+	hq_close();
-+
-+out_text_data:
-+	FREEBUF(m.text_data);
-+out_infos:
-+	FREEBUF(m.infos);
-+out_descs:
-+	FREEBUF(m.descs);
-+out_prb:
-+	FREEBUF(m.prb);
-+}
-diff --git a/symbols.c b/symbols.c
-index b2f4eb5..a51078d 100644
---- a/symbols.c
-+++ b/symbols.c
-@@ -10426,6 +10426,30 @@ dump_offset_table(char *spec, ulong makestruct)
- 		OFFSET(log_level));
- 	fprintf(fp, "               log_flags_level: %ld\n",
- 		OFFSET(log_flags_level));
-+
-+	fprintf(fp, "               printk_info_seq: %ld\n", OFFSET(printk_info_seq));
-+	fprintf(fp, "           printk_info_ts_nseq: %ld\n", OFFSET(printk_info_ts_nsec));
-+	fprintf(fp, "          printk_info_text_len: %ld\n", OFFSET(printk_info_text_len));
-+	fprintf(fp, "             printk_info_level: %ld\n", OFFSET(printk_info_level));
-+	fprintf(fp, "         printk_info_caller_id: %ld\n", OFFSET(printk_info_caller_id));
-+	fprintf(fp, "          printk_info_dev_info: %ld\n", OFFSET(printk_info_dev_info));
-+	fprintf(fp, "     dev_printk_info_subsystem: %ld\n", OFFSET(dev_printk_info_subsystem));
-+	fprintf(fp, "        dev_printk_info_device: %ld\n", OFFSET(dev_printk_info_device));
-+	fprintf(fp, "                 prb_desc_ring: %ld\n", OFFSET(prb_desc_ring));
-+	fprintf(fp, "            prb_text_data_ring: %ld\n", OFFSET(prb_text_data_ring));
-+	fprintf(fp, "      prb_desc_ring_count_bits: %ld\n", OFFSET(prb_desc_ring_count_bits));
-+	fprintf(fp, "           prb_desc_ring_descs: %ld\n", OFFSET(prb_desc_ring_descs));
-+	fprintf(fp, "           prb_desc_ring_infos: %ld\n", OFFSET(prb_desc_ring_infos));
-+	fprintf(fp, "         prb_desc_ring_head_id: %ld\n", OFFSET(prb_desc_ring_head_id));
-+	fprintf(fp, "         prb_desc_ring_tail_id: %ld\n", OFFSET(prb_desc_ring_tail_id));
-+	fprintf(fp, "            prb_desc_state_var: %ld\n", OFFSET(prb_desc_state_var));
-+	fprintf(fp, "        prb_desc_text_blk_lpos: %ld\n", OFFSET(prb_desc_text_blk_lpos));
-+	fprintf(fp, "       prb_data_blk_lpos_begin: %ld\n", OFFSET(prb_data_blk_lpos_begin));
-+	fprintf(fp, "        prb_data_blk_lpos_next: %ld\n", OFFSET(prb_data_blk_lpos_next));
-+	fprintf(fp, "       prb_data_ring_size_bits: %ld\n", OFFSET(prb_data_ring_size_bits));
-+	fprintf(fp, "            prb_data_ring_data: %ld\n", OFFSET(prb_data_ring_data));
-+	fprintf(fp, "         atomit_long_t_counter: %ld\n", OFFSET(atomic_long_t_counter));
-+
- 	fprintf(fp, "          sched_rt_entity_my_q: %ld\n",
- 		OFFSET(sched_rt_entity_my_q));
- 	fprintf(fp, "             task_group_parent: %ld\n",
-@@ -10850,6 +10874,9 @@ dump_offset_table(char *spec, ulong makestruct)
- 		SIZE(xarray));
- 	fprintf(fp, "                       xa_node: %ld\n",
- 		SIZE(xa_node));
-+	fprintf(fp, "                   printk_info: %ld\n", SIZE(printk_info));
-+	fprintf(fp, "             printk_ringbuffer: %ld\n", SIZE(printk_ringbuffer));
-+	fprintf(fp, "                      prb_desc: %ld\n", SIZE(prb_desc));
- 
- 
-         fprintf(fp, "\n                   array_table:\n");
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-kernel/crash/crash/0002-printk-use-committed-finalized-state-values.patch b/meta-oe/recipes-kernel/crash/crash/0002-printk-use-committed-finalized-state-values.patch
deleted file mode 100644
index 5213195c7d..0000000000
--- a/meta-oe/recipes-kernel/crash/crash/0002-printk-use-committed-finalized-state-values.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-From 71e159c64000467e94e08aefc144f5e1cdaa4aa0 Mon Sep 17 00:00:00 2001
-From: John Ogness <john.ogness@linutronix.de>
-Date: Wed, 25 Nov 2020 05:27:53 +0106
-Subject: [PATCH 2/2] printk: use committed/finalized state values
-
-An addendum to the previous crash commit a5531b24750e.
-The ringbuffer entries use 2 state values (committed and finalized)
-rather than a single flag to represent being available for reading.
-Copy the definitions and state lookup function directly from the
-kernel source and use the new states.
-
-Upstream-Status: Backport [https://github.com/crash-utility/crash/commit/71e159c64000467e94e08aefc144f5e1cdaa4aa0]
-
-Signed-off-by: John Ogness <john.ogness@linutronix.de>
-Signed-off-by: Nikolay Borisov <nborisov@suse.com>
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com> 
----
- printk.c | 48 +++++++++++++++++++++++++++++++++++++++++-------
- 1 file changed, 41 insertions(+), 7 deletions(-)
-
-diff --git a/printk.c b/printk.c
-index f6d54ce..8658016 100644
---- a/printk.c
-+++ b/printk.c
-@@ -1,12 +1,6 @@
- #include "defs.h"
- #include <ctype.h>
- 
--#define DESC_SV_BITS		(sizeof(unsigned long) * 8)
--#define DESC_COMMITTED_MASK	(1UL << (DESC_SV_BITS - 1))
--#define DESC_REUSE_MASK		(1UL << (DESC_SV_BITS - 2))
--#define DESC_FLAGS_MASK		(DESC_COMMITTED_MASK | DESC_REUSE_MASK)
--#define DESC_ID_MASK		(~DESC_FLAGS_MASK)
--
- /* convenience struct for passing many values to helper functions */
- struct prb_map {
- 	char *prb;
-@@ -21,6 +15,44 @@ struct prb_map {
- 	char *text_data;
- };
- 
-+/*
-+ * desc_state and DESC_* definitions taken from kernel source:
-+ *
-+ * kernel/printk/printk_ringbuffer.h
-+ */
-+
-+/* The possible responses of a descriptor state-query. */
-+enum desc_state {
-+	desc_miss	=  -1,	/* ID mismatch (pseudo state) */
-+	desc_reserved	= 0x0,	/* reserved, in use by writer */
-+	desc_committed	= 0x1,	/* committed by writer, could get reopened */
-+	desc_finalized	= 0x2,	/* committed, no further modification allowed */
-+	desc_reusable	= 0x3,	/* free, not yet used by any writer */
-+};
-+
-+#define DESC_SV_BITS		(sizeof(unsigned long) * 8)
-+#define DESC_FLAGS_SHIFT	(DESC_SV_BITS - 2)
-+#define DESC_FLAGS_MASK		(3UL << DESC_FLAGS_SHIFT)
-+#define DESC_STATE(sv)		(3UL & (sv >> DESC_FLAGS_SHIFT))
-+#define DESC_ID_MASK		(~DESC_FLAGS_MASK)
-+#define DESC_ID(sv)		((sv) & DESC_ID_MASK)
-+
-+/*
-+ * get_desc_state() taken from kernel source:
-+ *
-+ * kernel/printk/printk_ringbuffer.c
-+ */
-+
-+/* Query the state of a descriptor. */
-+static enum desc_state get_desc_state(unsigned long id,
-+				      unsigned long state_val)
-+{
-+	if (id != DESC_ID(state_val))
-+		return desc_miss;
-+
-+	return DESC_STATE(state_val);
-+}
-+
- static void
- init_offsets(void)
- {
-@@ -74,6 +106,7 @@ dump_record(struct prb_map *m, unsigned long id, int msg_flags)
- 	unsigned short text_len;
- 	unsigned long state_var;
- 	unsigned int caller_id;
-+	enum desc_state state;
- 	unsigned char level;
- 	unsigned long begin;
- 	unsigned long next;
-@@ -90,7 +123,8 @@ dump_record(struct prb_map *m, unsigned long id, int msg_flags)
- 	/* skip non-committed record */
- 	state_var = ULONG(desc + OFFSET(prb_desc_state_var) +
- 			OFFSET(atomic_long_t_counter));
--	if ((state_var & DESC_FLAGS_MASK) != DESC_COMMITTED_MASK)
-+	state = get_desc_state(id, state_var);
-+	if (state != desc_committed && state != desc_finalized)
- 		return;
- 
- 	info = m->infos + ((id % m->desc_ring_count) * SIZE(printk_info));
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-kernel/crash/crash/donnot-extract-gdb-during-do-compile.patch b/meta-oe/recipes-kernel/crash/crash/donnot-extract-gdb-during-do-compile.patch
index e254fe8772..7133cf0aa2 100644
--- a/meta-oe/recipes-kernel/crash/crash/donnot-extract-gdb-during-do-compile.patch
+++ b/meta-oe/recipes-kernel/crash/crash/donnot-extract-gdb-during-do-compile.patch
@@ -9,7 +9,7 @@ diff --git a/Makefile b/Makefile
 index bb0a34e..5eb7604 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -226,7 +226,7 @@ all: make_configure
+@@ -228,7 +228,7 @@ all: make_configure
  #	@make --no-print-directory extensions
  
  gdb_merge: force
@@ -18,15 +18,16 @@ index bb0a34e..5eb7604 100644
  	  make --no-print-directory gdb_unzip; fi
  	@echo "${LDFLAGS} -lz -ldl -rdynamic" > ${GDB}/gdb/mergelibs
  	@echo "../../${PROGRAM} ../../${PROGRAM}lib.a" > ${GDB}/gdb/mergeobj
-@@ -253,11 +253,6 @@ gdb_unzip:
- 	@rm -f gdb.files
- 	@for FILE in ${GDB_FILES} dummy; do\
- 	  echo $$FILE >> gdb.files; done
+@@ -255,12 +255,6 @@ gdb_unzip:
+	@rm -f gdb.files
+	@for FILE in ${GDB_FILES} dummy; do\
+	  echo $$FILE >> gdb.files; done
 -	@if [ ! -f ${GDB}.tar.gz ] && [ ! -f /usr/bin/wget ]; then \
 -	  echo /usr/bin/wget is required to download ${GDB}.tar.gz; echo; exit 1; fi
 -	@if [ ! -f ${GDB}.tar.gz ] && [ -f /usr/bin/wget ]; then \
--	  wget http://ftp.gnu.org/gnu/gdb/${GDB}.tar.gz; fi
--	@tar --exclude-from gdb.files -xvzmf ${GDB}.tar.gz
- 	@make --no-print-directory gdb_patch
- 
+-	  [ ! -t 2 ] && WGET_OPTS="--progress=dot:mega"; \
+-	  wget $$WGET_OPTS http://ftp.gnu.org/gnu/gdb/${GDB}.tar.gz; fi
+-	@tar --exclude-from gdb.files -xzmf ${GDB}.tar.gz
+	@make --no-print-directory gdb_patch
+
  gdb_patch:
diff --git a/meta-oe/recipes-kernel/crash/crash/remove-unrecognized-gcc-option-m32-for-mips.patch b/meta-oe/recipes-kernel/crash/crash/remove-unrecognized-gcc-option-m32-for-mips.patch
index 905b4c2cd0..37d43b8887 100644
--- a/meta-oe/recipes-kernel/crash/crash/remove-unrecognized-gcc-option-m32-for-mips.patch
+++ b/meta-oe/recipes-kernel/crash/crash/remove-unrecognized-gcc-option-m32-for-mips.patch
@@ -13,16 +13,16 @@ diff --git a/configure.c b/configure.c
 index cf1973b..71e97b3 100644
 --- a/configure.c
 +++ b/configure.c
-@@ -151,7 +151,7 @@ void add_extra_lib(char *);
+@@ -155,7 +155,7 @@ void add_extra_lib(char *);
  #define TARGET_CFLAGS_PPC64_ON_X86_64  "TARGET_CFLAGS="
  #define TARGET_CFLAGS_MIPS            "TARGET_CFLAGS=-D_FILE_OFFSET_BITS=64"
  #define TARGET_CFLAGS_MIPS_ON_X86     "TARGET_CFLAGS=-D_FILE_OFFSET_BITS=64"
 -#define TARGET_CFLAGS_MIPS_ON_X86_64  "TARGET_CFLAGS=-m32 -D_FILE_OFFSET_BITS=64"
 +#define TARGET_CFLAGS_MIPS_ON_X86_64  "TARGET_CFLAGS=-D_FILE_OFFSET_BITS=64"
+ #define TARGET_CFLAGS_MIPS64          "TARGET_CFLAGS="
  #define TARGET_CFLAGS_SPARC64         "TARGET_CFLAGS="
  
- #define GDB_TARGET_DEFAULT        "GDB_CONF_FLAGS="
-@@ -162,7 +162,7 @@ void add_extra_lib(char *);
+@@ -167,7 +167,7 @@ void add_extra_lib(char *);
  #define GDB_TARGET_ARM64_ON_X86_64  "GDB_CONF_FLAGS=--target=aarch64-elf-linux"   /* TBD */
  #define GDB_TARGET_PPC64_ON_X86_64  "GDB_CONF_FLAGS=--target=powerpc64le-unknown-linux-gnu"
  #define GDB_TARGET_MIPS_ON_X86     "GDB_CONF_FLAGS=--target=mipsel-elf-linux"
diff --git a/meta-oe/recipes-kernel/crash/crash_7.2.9.bb b/meta-oe/recipes-kernel/crash/crash_7.3.0.bb
similarity index 96%
rename from meta-oe/recipes-kernel/crash/crash_7.2.9.bb
rename to meta-oe/recipes-kernel/crash/crash_7.3.0.bb
index c2d83cb4f0..4b228bbd9f 100644
--- a/meta-oe/recipes-kernel/crash/crash_7.2.9.bb
+++ b/meta-oe/recipes-kernel/crash/crash_7.3.0.bb
@@ -25,10 +25,8 @@ SRC_URI = "git://github.com/crash-utility/${BPN}.git \
            file://remove-unrecognized-gcc-option-m32-for-mips.patch \
            file://0002-crash-fix-build-error-unknown-type-name-gdb_fpregset.patch \
            file://0003-crash-detect-the-sysroot-s-glibc-header-file.patch \
-           file://0001-printk-add-support-for-lockless-ringbuffer.patch \
-           file://0002-printk-use-committed-finalized-state-values.patch \
            "
-SRCREV = "a25aa4b649d339dd25c20d5413d81b851a77e0b2"
+SRCREV = "2a3e546942ab560f050ab77e8c7828b06513b3f0"
 
 SRC_URI[gdb.md5sum] = "a9836707337e5f7bf76a009a8904f470"
 SRC_URI[gdb.sha256sum] = "8070389a5dcc104eb0be483d582729f98ed4d761ad19cedd3f17b5d2502faa36"
-- 
2.25.1

