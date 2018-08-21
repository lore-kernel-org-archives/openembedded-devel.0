Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B18A279019
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Aug 2018 07:57:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7L7vhZl008393
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 21 Aug 2018 00:57:43 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Tue, 21 Aug 2018 00:57:42 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
Date: Tue, 21 Aug 2018 15:57:39 +0800
Message-ID: <1534838259-403454-2-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534838259-403454-1-git-send-email-mingli.yu@windriver.com>
References: <1534838259-403454-1-git-send-email-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2 2/2] fio: disable compiler optimizations
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
X-List-Received-Date: Tue, 21 Aug 2018 07:57:42 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

Pass parameter "--disable-optimizations" to
configure script to disable compiler optimizations
to fix below issue:
$ gdb /usr/bin/fio
(gdb) r -h
Starting program: /usr/bin/fio -h
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib64/libthread_db.so.1".

Program received signal SIGILL, Illegal instruction.
0x0000000000407220 in prio_tree_init () at lib/prio_tree.c:61
 61	index_bits_to_maxindex[i] = (1UL << (i + 1)) - 1;
(gdb) bt
 #0 0x0000000000407220 in prio_tree_init () at lib/prio_tree.c:61
 #1 0x0000000000482208 in __libc_csu_init (argc=argc@entry=2,
    argv=argv@entry=0x7fffffffecc8, envp=0x7fffffffece0)
    at /usr/src/debug/glibc/2.26-r0/git/csu/elf-init.c:88
 #2 0x00000031c742095e in __libc_start_main (main=0x407700 <main>, argc=2,
    argv=0x7fffffffecc8, init=0x4821b6 <__libc_csu_init>,
    fini=<optimized out>, rtld_fini=<optimized out>, stack_end=0x7fffffffecb8)
    at /usr/src/debug/glibc/2.26-r0/git/csu/libc-start.c:264
 #3 0x00000000004077ea in _start () at ../sysdeps/x86_64/start.S:120

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta-oe/recipes-benchmark/fio/fio_3.8.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-benchmark/fio/fio_3.8.bb b/meta-oe/recipes-benchmark/fio/fio_3.8.bb
index eb517c3..5bc48b0 100644
--- a/meta-oe/recipes-benchmark/fio/fio_3.8.bb
+++ b/meta-oe/recipes-benchmark/fio/fio_3.8.bb
@@ -32,6 +32,7 @@ S = "${WORKDIR}/git"
 DISABLE_STATIC = ""
 
 EXTRA_OEMAKE = "CC='${CC}' LDFLAGS='${LDFLAGS}'"
+EXTRA_OECONF = "--disable-optimizations"
 
 do_configure() {
     ./configure ${EXTRA_OECONF}
-- 
2.7.4


