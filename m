Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.56])
 by mx.groups.io with SMTP id smtpd.web10.5960.1613724364662073908
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Feb 2021 00:46:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=SM7pteDc;
 spf=pass (domain: windriver.com, ip: 40.107.236.56, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RWjhYMeb5C44w96HNxY+Obi9vrILnK0R31Wg2hWIlSyCf/hoJ6HtGO9K7CYPICYm6bo8ws2Abi1wZRxx8SV3+nFsQas7YURBwNuqQh+kJJl6IXujr9byFxuZq6cyD52QGU/8Hyt68PDJculsDumMgUbbluRweIJddL0c9Qg804PnXVs9wuTkkwDJW8DJhia44atnfFT8UEB3CldIecFwzHiTNUCPqP2kJ1V5AVFfBG1sRc88SoLdSrKz0XNMK8elHf/Nt9Y/ZWPg0vxU1zm8TfWoW+jSLoR+s/s4iU/idDx/K7TM6kMSpdP1TqRKU88mzqVkmkr856hZ6q+aNEScCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BxsKVTKky6vvB/BWF2TKdg/H68tkZ23wASdji1hi6Sg=;
 b=BR1Yyn9LGRyk0FmSJJL4ZS8xjysXpKxPS15+kXEsblmJbXnOcN0HAkg/iQ8A840dGL/XwG0VD2xt0InHeC0iMsoqcqHMt87J4TP8HKkLP4B6tU1inIwdGVt7mYoC57eN+eszrKPE/5vrT9lLF3fJ//zZyZ9WfJRHYpCWVjFM8HOxqkcN70q26bnc35EslvIejza0axCrMYodY7JMbqUiPWwuPr2+5rENcSEGhWhxIQcycZOovt61RotVdxFKu2q2E9g7YFNziUZzSdJ8BEAl8S9PRBLBNMxc3lUbugpJ8n3cqFGrG4qD3mqjMhpQrfCZ+s49LKgd1gcSaRsh5VhiUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BxsKVTKky6vvB/BWF2TKdg/H68tkZ23wASdji1hi6Sg=;
 b=SM7pteDcS1yobqNRU7EksH4ckXcNbjKi+hMeHrJJPRVEkjkxQWAaPIwEkFkynk6RDADEpTE4IPhF/XnrlxzBfNBW1UG9BnwBBr4X7e5uHVxhxuRlK4+1vQay6LWi4kxTTiolb8Da9bMgAQ6peqZYwdk9hbgwNVwOEY36sSoXmSE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by CO1PR11MB4914.namprd11.prod.outlook.com (2603:10b6:303:90::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Fri, 19 Feb
 2021 08:46:03 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::45:697c:a699:df64]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::45:697c:a699:df64%7]) with mapi id 15.20.3846.042; Fri, 19 Feb 2021
 08:46:02 +0000
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] crash: add support for lockless ringbuffer
Date: Fri, 19 Feb 2021 16:45:02 +0800
Message-Id: <20210219084502.37201-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0129.apcprd02.prod.outlook.com
 (2603:1096:202:16::13) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by HK2PR02CA0129.apcprd02.prod.outlook.com (2603:1096:202:16::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend Transport; Fri, 19 Feb 2021 08:46:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86148c8b-623a-48a0-e357-08d8d4b2c99d
X-MS-TrafficTypeDiagnostic: CO1PR11MB4914:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB4914EDF21672DB050CFD8903F1849@CO1PR11MB4914.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:65;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ABHJA+HOF+znHJxV/deskqfomiQ8++7MLtX57VicnQSD9MDpmwEViYyB38wrgiawF8ilMfUFR1RzTNNCTO64j13NQP4uukXdo3MkviuF+zQH17EdOg+X409FNL8m11ZJxZlqDwR70skiCCAz0cQIc7SRaCfyXMIsAdDHTPwjzKxRbBdPeCwTL663JwUQCsa1hOa+ayfrg2bAK8PvzTiMUaJLx+iLDV6KMWxXMhNm24sH7CWjWJjTGUjjIiEQ60cUx2Y6Kuumx6N+3pVfzwF0QbnoBXiaC1MI36jXno7FHHctiQjVbXAYLpY8koO/yYiC+E3sQqnQ2GiBIusRnCdRIUORAZhuQGbMZtHMHrTHDORBO3TcWTNqdWuuV1+RgYkIWtmKfQs1pA+wCiAWZum6+/fEreRIIPJ5T3WMUo0hQJeOZ5pY7Wy4LaTCFq6os+T+PndWxWiIkO0/nFt+LgFJnTK0xsdQ09eF3BBNC5SNUT2RdJK33qJhPA/ZeAKfXtUao4IX7YigRmNyJplZ2IoAFtY2lahJWRKfE8xdbNZwaW7bA7klYadwzbhBxN2+EtakHV8ipAwRI27rVLFmY9kLyKROGdV9o3V26NMpYmwhzkY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(366004)(376002)(136003)(39850400004)(2906002)(83380400001)(316002)(36756003)(5660300002)(6486002)(8676002)(30864003)(66946007)(2616005)(6916009)(956004)(86362001)(186003)(26005)(966005)(6512007)(9686003)(8936002)(1076003)(52116002)(66476007)(478600001)(66556008)(6506007)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?iod8atFAoxb8qCaTDGWWmzs2TKYAxgcRdmdD+pGeEYTjoGONqTyOVPDAGTDS?=
 =?us-ascii?Q?ff/RLfMXEhyoOnY5uwFto6v3EgxXwT/bwFkrQ/X3Lqo6ao+NRoRo2HLmxCW5?=
 =?us-ascii?Q?Z9QyCJkzL1fH3o1ZJbxoGtPBXAIZgPNdrbmNnsIWZLpIx7A9Kd4JpF1oPEsh?=
 =?us-ascii?Q?NaAdwQ30KAAV+bPcbEFAjGPqVuHJrOPiWHgeKIT3l5Lk3GuK+Sr/B+quTHN9?=
 =?us-ascii?Q?nWcZQNcuLG9PCSi1NB1xn7UlVO2qsXTea4wvbB+VxjthCt9WKpnlYpSmj76G?=
 =?us-ascii?Q?QKjFayttTKmsn+HKCmBzzy5fLcf78d7bfEhuc47oWCFinKDwiiIMPjCIdbnG?=
 =?us-ascii?Q?6PuVoMYYLAUWBW7u1fx9Vl/lFOygc78aytwBbIdVt4sXuBn017agBeknWj4M?=
 =?us-ascii?Q?kifF42Ve+7STaG/3xamAACdYw5FJlWSBR/QEfeBniyaaA4SYPxX8MJUKZ61U?=
 =?us-ascii?Q?Jgd3LwVv0vbd2HyF/PdlV1edSe5ZJi1qiY7epPdUDx4TV4y11KZHTiDXpXOt?=
 =?us-ascii?Q?O6jkFKtI1JLC4WDGcUFUCQx2OXaY2kep7nRZ/WAxxuFyO8FWfvBA01PxFeyP?=
 =?us-ascii?Q?PH3eFmVwpTllkHxGaxbamRQTPt6KLGvn6du/yY97348nh3lzZAleMq0CKNo4?=
 =?us-ascii?Q?/hqxQVKOp4AQYKgoJESgBxD25dijBG/wVH8cf1fnqPfY8/LAdnOpab220YlE?=
 =?us-ascii?Q?b3VWxswkCURja+jfGF28reE8/eG847ivUL67vbZuBr6ipkag9T8pQlC77p76?=
 =?us-ascii?Q?etYyDRxD7BV1OMhTVbXQxf2CLVc39dQdbw3s3OE1NHk5OclCuNrrsWOo1CTd?=
 =?us-ascii?Q?xIZ4DMEC4ZFNxstfMNW+YVIRnD+VYbxbOgmT8DSc+cw09eh2Dvfupddyhopm?=
 =?us-ascii?Q?NOMb9BN2HMRrQnqVdTZmJdQ/v8K9CA+Rmo092Cd2q2bGfbHlXknHpiWJoiSt?=
 =?us-ascii?Q?RoaxahTYhFSrj5NNdsfoVPPVWjOhbxVXzfs/ZTJV+2T8V1cdI6f2/14icRPT?=
 =?us-ascii?Q?H+T5naZQV3YId9MBEGtvbPuwGPWogNWVei6eHrVR1r85TNJwP1zhEIiTSyj/?=
 =?us-ascii?Q?ahXJeBMeHqYMi4Fwh/zHLMj/2CrRK2acUxa+KrnqP6MScuB9cv1ktV7u7t3X?=
 =?us-ascii?Q?XO9JHWeSOulrwuEmUm2M38whHD+q1Szzyw226L5w1Vr9W0ZV3E/9Iht4jNhb?=
 =?us-ascii?Q?MjUwOdibdVGVI8tLtwwZRZkWppMIlyJVIp5UbcFomL8W9ifAmNdMJZ63WCd2?=
 =?us-ascii?Q?Zj6kjWXlNky2q90UWLoicKIEgNFlvM0tSC44olK64JJegs6lgyAohLBuf9+s?=
 =?us-ascii?Q?AqAKk4if/XhcHt++JUntC0XM?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86148c8b-623a-48a0-e357-08d8d4b2c99d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2021 08:46:02.8533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YbtfeMORpZeMhgvakVWOZ2JNQ2uBcXTu3djpH2pV31yid94x3GtmCWzQv96tfGvMaIjtKDeB5PZVBh/rHwJkQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4914
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Backport 2 patches to add support for lockless ringbuffer to fix
below issue:
crash: cannot determine length of symbol: log_end

Reference: https://github.com/crash-utility/crash/issues/74

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...-add-support-for-lockless-ringbuffer.patch | 445 ++++++++++++++++++
 ...use-committed-finalized-state-values.patch | 103 ++++
 meta-oe/recipes-kernel/crash/crash_7.2.9.bb   |   2 +
 3 files changed, 550 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/crash/crash/0001-printk-add-support-for-lockless-ringbuffer.patch
 create mode 100644 meta-oe/recipes-kernel/crash/crash/0002-printk-use-committed-finalized-state-values.patch

diff --git a/meta-oe/recipes-kernel/crash/crash/0001-printk-add-support-for-lockless-ringbuffer.patch b/meta-oe/recipes-kernel/crash/crash/0001-printk-add-support-for-lockless-ringbuffer.patch
new file mode 100644
index 000000000..1aaf1e6b0
--- /dev/null
+++ b/meta-oe/recipes-kernel/crash/crash/0001-printk-add-support-for-lockless-ringbuffer.patch
@@ -0,0 +1,445 @@
+From a5531b24750e7949c35640d996ea14c0587938bc Mon Sep 17 00:00:00 2001
+From: John Ogness <john.ogness@linutronix.de>
+Date: Fri, 20 Nov 2020 05:56:59 +0000
+Subject: [PATCH 1/2] printk: add support for lockless ringbuffer
+
+Linux 5.10 introduces a new lockless ringbuffer. The new ringbuffer
+is structured completely different to the previous iterations.
+Add support for dumping the ringbuffer with the "log" command.
+The new ringbuffer is detected based on the availability of
+the "prb" symbol.
+
+Upstream-Status: Backport [https://github.com/crash-utility/crash/commit/a5531b24750e7949c35640d996ea14c0587938bc]
+
+Signed-off-by: John Ogness <john.ogness@linutronix.de>
+Signed-off-by: Kazuhito Hagio <k-hagio-ab@nec.com>
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com> 
+---
+ Makefile  |   5 ++
+ defs.h    |  30 +++++++
+ kernel.c  |   7 +-
+ printk.c  | 256 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ symbols.c |  27 ++++++
+ 5 files changed, 324 insertions(+), 1 deletion(-)
+ create mode 100644 printk.c
+
+diff --git a/Makefile b/Makefile
+index d185719..f66eba7 100644
+--- a/Makefile
++++ b/Makefile
+@@ -61,6 +61,7 @@ VMWARE_HFILES=vmware_vmss.h
+ 
+ CFILES=main.c tools.c global_data.c memory.c filesys.c help.c task.c \
+ 	kernel.c test.c gdb_interface.c configure.c net.c dev.c bpf.c \
++	printk.c \
+ 	alpha.c x86.c ppc.c ia64.c s390.c s390x.c s390dbf.c ppc64.c x86_64.c \
+ 	arm.c arm64.c mips.c sparc64.c \
+ 	extensions.c remote.c va_server.c va_server_v1.c symbols.c cmdline.c \
+@@ -80,6 +81,7 @@ SOURCE_FILES=${CFILES} ${GENERIC_HFILES} ${MCORE_HFILES} \
+ 
+ OBJECT_FILES=main.o tools.o global_data.o memory.o filesys.o help.o task.o \
+ 	build_data.o kernel.o test.o gdb_interface.o net.o dev.o bpf.o \
++	printk.o \
+ 	alpha.o x86.o ppc.o ia64.o s390.o s390x.o s390dbf.o ppc64.o x86_64.o \
+ 	arm.o arm64.o mips.o sparc64.o \
+ 	extensions.o remote.o va_server.o va_server_v1.o symbols.o cmdline.o \
+@@ -363,6 +365,9 @@ task.o: ${GENERIC_HFILES} task.c
+ kernel.o: ${GENERIC_HFILES} kernel.c
+ 	${CC} -c ${CRASH_CFLAGS} kernel.c ${WARNING_OPTIONS} ${WARNING_ERROR}
+ 
++printk.o: ${GENERIC_HFILES} printk.c
++	${CC} -c ${CRASH_CFLAGS} printk.c ${WARNING_OPTIONS} ${WARNING_ERROR}
++
+ gdb_interface.o: ${GENERIC_HFILES} gdb_interface.c
+ 	${CC} -c ${CRASH_CFLAGS} gdb_interface.c ${WARNING_OPTIONS} ${WARNING_ERROR}
+ 
+diff --git a/defs.h b/defs.h
+index 9594950..e1a18e9 100644
+--- a/defs.h
++++ b/defs.h
+@@ -2106,6 +2106,28 @@ struct offset_table {                    /* stash of commonly-used offsets */
+ 	long irq_common_data_affinity;
+ 	long irq_desc_irq_common_data;
+ 	long uts_namespace_name;
++	long printk_info_seq;
++	long printk_info_ts_nsec;
++	long printk_info_text_len;
++	long printk_info_level;
++	long printk_info_caller_id;
++	long printk_info_dev_info;
++	long dev_printk_info_subsystem;
++	long dev_printk_info_device;
++	long prb_desc_ring;
++	long prb_text_data_ring;
++	long prb_desc_ring_count_bits;
++	long prb_desc_ring_descs;
++	long prb_desc_ring_infos;
++	long prb_desc_ring_head_id;
++	long prb_desc_ring_tail_id;
++	long prb_desc_state_var;
++	long prb_desc_text_blk_lpos;
++	long prb_data_blk_lpos_begin;
++	long prb_data_blk_lpos_next;
++	long prb_data_ring_size_bits;
++	long prb_data_ring_data;
++	long atomic_long_t_counter;
+ };
+ 
+ struct size_table {         /* stash of commonly-used sizes */
+@@ -2265,6 +2287,9 @@ struct size_table {         /* stash of commonly-used sizes */
+ 	long xa_node;
+ 	long zram_table_entry;
+ 	long irq_common_data;
++	long printk_info;
++	long printk_ringbuffer;
++	long prb_desc;
+ };
+ 
+ struct array_table {
+@@ -6696,6 +6721,11 @@ int vmware_guestdump_memory_dump(FILE *);
+  */
+ int calc_kaslr_offset(ulong *, ulong *);
+ 
++/*
++ * printk.c
++ */
++void dump_lockless_record_log(int);
++
+ /*
+  *  gnu_binutils.c
+  */
+diff --git a/kernel.c b/kernel.c
+index 9871637..e722ff9 100644
+--- a/kernel.c
++++ b/kernel.c
+@@ -5042,6 +5042,11 @@ dump_log(int msg_flags)
+ 	struct syment *nsp;
+ 	int log_wrap, loglevel, log_buf_len;
+ 
++	if (kernel_symbol_exists("prb")) {
++		dump_lockless_record_log(msg_flags);
++		return;
++	}
++
+ 	if (kernel_symbol_exists("log_first_idx") && 
+ 	    kernel_symbol_exists("log_next_idx")) {
+ 		dump_variable_length_record_log(msg_flags);
+@@ -5289,7 +5294,7 @@ dump_log_entry(char *logptr, int msg_flags)
+ }
+ 
+ /* 
+- *  Handle the new variable-length-record log_buf.
++ *  Handle the variable-length-record log_buf.
+  */
+ static void
+ dump_variable_length_record_log(int msg_flags)
+diff --git a/printk.c b/printk.c
+new file mode 100644
+index 0000000..f6d54ce
+--- /dev/null
++++ b/printk.c
+@@ -0,0 +1,256 @@
++#include "defs.h"
++#include <ctype.h>
++
++#define DESC_SV_BITS		(sizeof(unsigned long) * 8)
++#define DESC_COMMITTED_MASK	(1UL << (DESC_SV_BITS - 1))
++#define DESC_REUSE_MASK		(1UL << (DESC_SV_BITS - 2))
++#define DESC_FLAGS_MASK		(DESC_COMMITTED_MASK | DESC_REUSE_MASK)
++#define DESC_ID_MASK		(~DESC_FLAGS_MASK)
++
++/* convenience struct for passing many values to helper functions */
++struct prb_map {
++	char *prb;
++
++	char *desc_ring;
++	unsigned long desc_ring_count;
++	char *descs;
++	char *infos;
++
++	char *text_data_ring;
++	unsigned long text_data_ring_size;
++	char *text_data;
++};
++
++static void
++init_offsets(void)
++{
++	char *n;
++
++	n = "printk_info";
++	STRUCT_SIZE_INIT(printk_info, n);
++	MEMBER_OFFSET_INIT(printk_info_seq, n, "seq");
++	MEMBER_OFFSET_INIT(printk_info_ts_nsec, n, "ts_nsec");
++	MEMBER_OFFSET_INIT(printk_info_text_len, n, "text_len");
++	MEMBER_OFFSET_INIT(printk_info_level, n, "level");
++	MEMBER_OFFSET_INIT(printk_info_caller_id, n, "caller_id");
++	MEMBER_OFFSET_INIT(printk_info_dev_info, n, "dev_info");
++
++	n = "dev_printk_info";
++	MEMBER_OFFSET_INIT(dev_printk_info_subsystem, n, "subsystem");
++	MEMBER_OFFSET_INIT(dev_printk_info_device, n, "device");
++
++	n = "printk_ringbuffer";
++	STRUCT_SIZE_INIT(printk_ringbuffer, n);
++	MEMBER_OFFSET_INIT(prb_desc_ring, n, "desc_ring");
++	MEMBER_OFFSET_INIT(prb_text_data_ring, n, "text_data_ring");
++
++	n = "prb_desc_ring";
++	MEMBER_OFFSET_INIT(prb_desc_ring_count_bits, n, "count_bits");
++	MEMBER_OFFSET_INIT(prb_desc_ring_descs, n, "descs");
++	MEMBER_OFFSET_INIT(prb_desc_ring_infos, n, "infos");
++	MEMBER_OFFSET_INIT(prb_desc_ring_head_id, n, "head_id");
++	MEMBER_OFFSET_INIT(prb_desc_ring_tail_id, n, "tail_id");
++
++	n = "prb_desc";
++	STRUCT_SIZE_INIT(prb_desc, n);
++	MEMBER_OFFSET_INIT(prb_desc_state_var, n, "state_var");
++	MEMBER_OFFSET_INIT(prb_desc_text_blk_lpos, n, "text_blk_lpos");
++
++	n = "prb_data_blk_lpos";
++	MEMBER_OFFSET_INIT(prb_data_blk_lpos_begin, n, "begin");
++	MEMBER_OFFSET_INIT(prb_data_blk_lpos_next, n, "next");
++
++	n = "prb_data_ring";
++	MEMBER_OFFSET_INIT(prb_data_ring_size_bits, n, "size_bits");
++	MEMBER_OFFSET_INIT(prb_data_ring_data, n, "data");
++
++	n = "atomic_long_t";
++	MEMBER_OFFSET_INIT(atomic_long_t_counter, n, "counter");
++}
++
++static void
++dump_record(struct prb_map *m, unsigned long id, int msg_flags)
++{
++	unsigned short text_len;
++	unsigned long state_var;
++	unsigned int caller_id;
++	unsigned char level;
++	unsigned long begin;
++	unsigned long next;
++	char buf[BUFSIZE];
++	uint64_t ts_nsec;
++	ulonglong nanos;
++	ulonglong seq;
++	int ilen = 0, i;
++	char *desc, *info, *text, *p;
++	ulong rem;
++
++	desc = m->descs + ((id % m->desc_ring_count) * SIZE(prb_desc));
++
++	/* skip non-committed record */
++	state_var = ULONG(desc + OFFSET(prb_desc_state_var) +
++			OFFSET(atomic_long_t_counter));
++	if ((state_var & DESC_FLAGS_MASK) != DESC_COMMITTED_MASK)
++		return;
++
++	info = m->infos + ((id % m->desc_ring_count) * SIZE(printk_info));
++
++	seq = ULONGLONG(info + OFFSET(printk_info_seq));
++	caller_id = UINT(info + OFFSET(printk_info_caller_id));
++	if (CRASHDEBUG(1))
++		fprintf(fp, "seq: %llu caller_id: %x (%s: %u)\n", seq, caller_id,
++			caller_id & 0x80000000 ? "cpu" : "pid", caller_id & ~0x80000000);
++
++	text_len = USHORT(info + OFFSET(printk_info_text_len));
++
++	begin = ULONG(desc + OFFSET(prb_desc_text_blk_lpos) +
++		      OFFSET(prb_data_blk_lpos_begin)) %
++			m->text_data_ring_size;
++	next = ULONG(desc + OFFSET(prb_desc_text_blk_lpos) +
++		     OFFSET(prb_data_blk_lpos_next)) %
++			m->text_data_ring_size;
++
++	/* skip data-less text blocks */
++	if (begin == next)
++		goto out;
++
++	if ((msg_flags & SHOW_LOG_TEXT) == 0) {
++		ts_nsec = ULONGLONG(info + OFFSET(printk_info_ts_nsec));
++		nanos = (ulonglong)ts_nsec / (ulonglong)1000000000;
++		rem = (ulonglong)ts_nsec % (ulonglong)1000000000;
++		if (msg_flags & SHOW_LOG_CTIME) {
++			time_t t = kt->boot_date.tv_sec + nanos;
++			sprintf(buf, "[%s] ", ctime_tz(&t));
++		} else
++			sprintf(buf, "[%5lld.%06ld] ", nanos, rem/1000);
++
++		ilen += strlen(buf);
++		fprintf(fp, "%s", buf);
++	}
++
++	if (msg_flags & SHOW_LOG_LEVEL) {
++		level = UCHAR(info + OFFSET(printk_info_level)) >> 5;
++		sprintf(buf, "<%x>", level);
++		ilen += strlen(buf);
++		fprintf(fp, "%s", buf);
++	}
++
++	/* handle wrapping data block */
++	if (begin > next)
++		begin = 0;
++
++	/* skip over descriptor ID */
++	begin += sizeof(unsigned long);
++
++	/* handle truncated messages */
++	if (next - begin < text_len)
++		text_len = next - begin;
++
++	text = m->text_data + begin;
++
++	for (i = 0, p = text; i < text_len; i++, p++) {
++		if (*p == '\n')
++			fprintf(fp, "\n%s", space(ilen));
++		else if (isprint(*p) || isspace(*p))
++			fputc(*p, fp);
++		else
++			fputc('.', fp);
++	}
++
++	if (msg_flags & SHOW_LOG_DICT) {
++		text = info + OFFSET(printk_info_dev_info) +
++				OFFSET(dev_printk_info_subsystem);
++		if (strlen(text))
++			fprintf(fp, "\n%sSUBSYSTEM=%s", space(ilen), text);
++
++		text = info + OFFSET(printk_info_dev_info) +
++				OFFSET(dev_printk_info_device);
++		if (strlen(text))
++			fprintf(fp, "\n%sDEVICE=%s", space(ilen), text);
++	}
++out:
++	fprintf(fp, "\n");
++}
++
++/*
++ *  Handle the lockless printk_ringbuffer.
++ */
++void
++dump_lockless_record_log(int msg_flags)
++{
++	unsigned long head_id;
++	unsigned long tail_id;
++	unsigned long kaddr;
++	unsigned long id;
++	struct prb_map m;
++
++	if (INVALID_SIZE(printk_info))
++		init_offsets();
++
++	/* setup printk_ringbuffer */
++	get_symbol_data("prb", sizeof(char *), &kaddr);
++	m.prb = GETBUF(SIZE(printk_ringbuffer));
++	if (!readmem(kaddr, KVADDR, m.prb, SIZE(printk_ringbuffer),
++		     "printk_ringbuffer contents", RETURN_ON_ERROR|QUIET)) {
++		error(WARNING, "\ncannot read printk_ringbuffer contents\n");
++		goto out_prb;
++	}
++
++	/* setup descriptor ring */
++	m.desc_ring = m.prb + OFFSET(prb_desc_ring);
++	m.desc_ring_count = 1 << UINT(m.desc_ring + OFFSET(prb_desc_ring_count_bits));
++
++	kaddr = ULONG(m.desc_ring + OFFSET(prb_desc_ring_descs));
++	m.descs = GETBUF(SIZE(prb_desc) * m.desc_ring_count);
++	if (!readmem(kaddr, KVADDR, m.descs, SIZE(prb_desc) * m.desc_ring_count,
++		     "prb_desc_ring contents", RETURN_ON_ERROR|QUIET)) {
++		error(WARNING, "\ncannot read prb_desc_ring contents\n");
++		goto out_descs;
++	}
++
++	kaddr = ULONG(m.desc_ring + OFFSET(prb_desc_ring_infos));
++	m.infos = GETBUF(SIZE(printk_info) * m.desc_ring_count);
++	if (!readmem(kaddr, KVADDR, m.infos, SIZE(printk_info) * m.desc_ring_count,
++		     "prb_info_ring contents", RETURN_ON_ERROR|QUIET)) {
++		error(WARNING, "\ncannot read prb_info_ring contents\n");
++		goto out_infos;
++	}
++
++	/* setup text data ring */
++	m.text_data_ring = m.prb + OFFSET(prb_text_data_ring);
++	m.text_data_ring_size = 1 << UINT(m.text_data_ring + OFFSET(prb_data_ring_size_bits));
++
++	kaddr = ULONG(m.text_data_ring + OFFSET(prb_data_ring_data));
++	m.text_data = GETBUF(m.text_data_ring_size);
++	if (!readmem(kaddr, KVADDR, m.text_data, m.text_data_ring_size,
++		     "prb_text_data_ring contents", RETURN_ON_ERROR|QUIET)) {
++		error(WARNING, "\ncannot read prb_text_data_ring contents\n");
++		goto out_text_data;
++	}
++
++	/* ready to go */
++
++	tail_id = ULONG(m.desc_ring + OFFSET(prb_desc_ring_tail_id) +
++			OFFSET(atomic_long_t_counter));
++	head_id = ULONG(m.desc_ring + OFFSET(prb_desc_ring_head_id) +
++			OFFSET(atomic_long_t_counter));
++
++	hq_open();
++
++	for (id = tail_id; id != head_id; id = (id + 1) & DESC_ID_MASK)
++		dump_record(&m, id, msg_flags);
++
++	/* dump head record */
++	dump_record(&m, id, msg_flags);
++
++	hq_close();
++
++out_text_data:
++	FREEBUF(m.text_data);
++out_infos:
++	FREEBUF(m.infos);
++out_descs:
++	FREEBUF(m.descs);
++out_prb:
++	FREEBUF(m.prb);
++}
+diff --git a/symbols.c b/symbols.c
+index b2f4eb5..a51078d 100644
+--- a/symbols.c
++++ b/symbols.c
+@@ -10426,6 +10426,30 @@ dump_offset_table(char *spec, ulong makestruct)
+ 		OFFSET(log_level));
+ 	fprintf(fp, "               log_flags_level: %ld\n",
+ 		OFFSET(log_flags_level));
++
++	fprintf(fp, "               printk_info_seq: %ld\n", OFFSET(printk_info_seq));
++	fprintf(fp, "           printk_info_ts_nseq: %ld\n", OFFSET(printk_info_ts_nsec));
++	fprintf(fp, "          printk_info_text_len: %ld\n", OFFSET(printk_info_text_len));
++	fprintf(fp, "             printk_info_level: %ld\n", OFFSET(printk_info_level));
++	fprintf(fp, "         printk_info_caller_id: %ld\n", OFFSET(printk_info_caller_id));
++	fprintf(fp, "          printk_info_dev_info: %ld\n", OFFSET(printk_info_dev_info));
++	fprintf(fp, "     dev_printk_info_subsystem: %ld\n", OFFSET(dev_printk_info_subsystem));
++	fprintf(fp, "        dev_printk_info_device: %ld\n", OFFSET(dev_printk_info_device));
++	fprintf(fp, "                 prb_desc_ring: %ld\n", OFFSET(prb_desc_ring));
++	fprintf(fp, "            prb_text_data_ring: %ld\n", OFFSET(prb_text_data_ring));
++	fprintf(fp, "      prb_desc_ring_count_bits: %ld\n", OFFSET(prb_desc_ring_count_bits));
++	fprintf(fp, "           prb_desc_ring_descs: %ld\n", OFFSET(prb_desc_ring_descs));
++	fprintf(fp, "           prb_desc_ring_infos: %ld\n", OFFSET(prb_desc_ring_infos));
++	fprintf(fp, "         prb_desc_ring_head_id: %ld\n", OFFSET(prb_desc_ring_head_id));
++	fprintf(fp, "         prb_desc_ring_tail_id: %ld\n", OFFSET(prb_desc_ring_tail_id));
++	fprintf(fp, "            prb_desc_state_var: %ld\n", OFFSET(prb_desc_state_var));
++	fprintf(fp, "        prb_desc_text_blk_lpos: %ld\n", OFFSET(prb_desc_text_blk_lpos));
++	fprintf(fp, "       prb_data_blk_lpos_begin: %ld\n", OFFSET(prb_data_blk_lpos_begin));
++	fprintf(fp, "        prb_data_blk_lpos_next: %ld\n", OFFSET(prb_data_blk_lpos_next));
++	fprintf(fp, "       prb_data_ring_size_bits: %ld\n", OFFSET(prb_data_ring_size_bits));
++	fprintf(fp, "            prb_data_ring_data: %ld\n", OFFSET(prb_data_ring_data));
++	fprintf(fp, "         atomit_long_t_counter: %ld\n", OFFSET(atomic_long_t_counter));
++
+ 	fprintf(fp, "          sched_rt_entity_my_q: %ld\n",
+ 		OFFSET(sched_rt_entity_my_q));
+ 	fprintf(fp, "             task_group_parent: %ld\n",
+@@ -10850,6 +10874,9 @@ dump_offset_table(char *spec, ulong makestruct)
+ 		SIZE(xarray));
+ 	fprintf(fp, "                       xa_node: %ld\n",
+ 		SIZE(xa_node));
++	fprintf(fp, "                   printk_info: %ld\n", SIZE(printk_info));
++	fprintf(fp, "             printk_ringbuffer: %ld\n", SIZE(printk_ringbuffer));
++	fprintf(fp, "                      prb_desc: %ld\n", SIZE(prb_desc));
+ 
+ 
+         fprintf(fp, "\n                   array_table:\n");
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-kernel/crash/crash/0002-printk-use-committed-finalized-state-values.patch b/meta-oe/recipes-kernel/crash/crash/0002-printk-use-committed-finalized-state-values.patch
new file mode 100644
index 000000000..5213195c7
--- /dev/null
+++ b/meta-oe/recipes-kernel/crash/crash/0002-printk-use-committed-finalized-state-values.patch
@@ -0,0 +1,103 @@
+From 71e159c64000467e94e08aefc144f5e1cdaa4aa0 Mon Sep 17 00:00:00 2001
+From: John Ogness <john.ogness@linutronix.de>
+Date: Wed, 25 Nov 2020 05:27:53 +0106
+Subject: [PATCH 2/2] printk: use committed/finalized state values
+
+An addendum to the previous crash commit a5531b24750e.
+The ringbuffer entries use 2 state values (committed and finalized)
+rather than a single flag to represent being available for reading.
+Copy the definitions and state lookup function directly from the
+kernel source and use the new states.
+
+Upstream-Status: Backport [https://github.com/crash-utility/crash/commit/71e159c64000467e94e08aefc144f5e1cdaa4aa0]
+
+Signed-off-by: John Ogness <john.ogness@linutronix.de>
+Signed-off-by: Nikolay Borisov <nborisov@suse.com>
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com> 
+---
+ printk.c | 48 +++++++++++++++++++++++++++++++++++++++++-------
+ 1 file changed, 41 insertions(+), 7 deletions(-)
+
+diff --git a/printk.c b/printk.c
+index f6d54ce..8658016 100644
+--- a/printk.c
++++ b/printk.c
+@@ -1,12 +1,6 @@
+ #include "defs.h"
+ #include <ctype.h>
+ 
+-#define DESC_SV_BITS		(sizeof(unsigned long) * 8)
+-#define DESC_COMMITTED_MASK	(1UL << (DESC_SV_BITS - 1))
+-#define DESC_REUSE_MASK		(1UL << (DESC_SV_BITS - 2))
+-#define DESC_FLAGS_MASK		(DESC_COMMITTED_MASK | DESC_REUSE_MASK)
+-#define DESC_ID_MASK		(~DESC_FLAGS_MASK)
+-
+ /* convenience struct for passing many values to helper functions */
+ struct prb_map {
+ 	char *prb;
+@@ -21,6 +15,44 @@ struct prb_map {
+ 	char *text_data;
+ };
+ 
++/*
++ * desc_state and DESC_* definitions taken from kernel source:
++ *
++ * kernel/printk/printk_ringbuffer.h
++ */
++
++/* The possible responses of a descriptor state-query. */
++enum desc_state {
++	desc_miss	=  -1,	/* ID mismatch (pseudo state) */
++	desc_reserved	= 0x0,	/* reserved, in use by writer */
++	desc_committed	= 0x1,	/* committed by writer, could get reopened */
++	desc_finalized	= 0x2,	/* committed, no further modification allowed */
++	desc_reusable	= 0x3,	/* free, not yet used by any writer */
++};
++
++#define DESC_SV_BITS		(sizeof(unsigned long) * 8)
++#define DESC_FLAGS_SHIFT	(DESC_SV_BITS - 2)
++#define DESC_FLAGS_MASK		(3UL << DESC_FLAGS_SHIFT)
++#define DESC_STATE(sv)		(3UL & (sv >> DESC_FLAGS_SHIFT))
++#define DESC_ID_MASK		(~DESC_FLAGS_MASK)
++#define DESC_ID(sv)		((sv) & DESC_ID_MASK)
++
++/*
++ * get_desc_state() taken from kernel source:
++ *
++ * kernel/printk/printk_ringbuffer.c
++ */
++
++/* Query the state of a descriptor. */
++static enum desc_state get_desc_state(unsigned long id,
++				      unsigned long state_val)
++{
++	if (id != DESC_ID(state_val))
++		return desc_miss;
++
++	return DESC_STATE(state_val);
++}
++
+ static void
+ init_offsets(void)
+ {
+@@ -74,6 +106,7 @@ dump_record(struct prb_map *m, unsigned long id, int msg_flags)
+ 	unsigned short text_len;
+ 	unsigned long state_var;
+ 	unsigned int caller_id;
++	enum desc_state state;
+ 	unsigned char level;
+ 	unsigned long begin;
+ 	unsigned long next;
+@@ -90,7 +123,8 @@ dump_record(struct prb_map *m, unsigned long id, int msg_flags)
+ 	/* skip non-committed record */
+ 	state_var = ULONG(desc + OFFSET(prb_desc_state_var) +
+ 			OFFSET(atomic_long_t_counter));
+-	if ((state_var & DESC_FLAGS_MASK) != DESC_COMMITTED_MASK)
++	state = get_desc_state(id, state_var);
++	if (state != desc_committed && state != desc_finalized)
+ 		return;
+ 
+ 	info = m->infos + ((id % m->desc_ring_count) * SIZE(printk_info));
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-kernel/crash/crash_7.2.9.bb b/meta-oe/recipes-kernel/crash/crash_7.2.9.bb
index 4394b6fc6..0b6883a49 100644
--- a/meta-oe/recipes-kernel/crash/crash_7.2.9.bb
+++ b/meta-oe/recipes-kernel/crash/crash_7.2.9.bb
@@ -25,6 +25,8 @@ SRC_URI = "git://github.com/crash-utility/${BPN}.git \
            file://remove-unrecognized-gcc-option-m32-for-mips.patch \
            file://0002-crash-fix-build-error-unknown-type-name-gdb_fpregset.patch \
            file://0003-crash-detect-the-sysroot-s-glibc-header-file.patch \
+           file://0001-printk-add-support-for-lockless-ringbuffer.patch \
+           file://0002-printk-use-committed-finalized-state-values.patch \
            "
 SRCREV = "a25aa4b649d339dd25c20d5413d81b851a77e0b2"
 
-- 
2.17.1

