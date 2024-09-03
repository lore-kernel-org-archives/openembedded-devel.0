Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26755CA101E
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 04:52:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.15989.1725339171462854556
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Sep 2024 21:52:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=99768ab3d4=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4834GCng005630
	for <openembedded-devel@lists.openembedded.org>; Tue, 3 Sep 2024 04:52:50 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41bt59ah64-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 03 Sep 2024 04:52:50 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 2 Sep 2024 21:52:49 -0700
Received: from pek-lpg-core2.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Mon, 2 Sep 2024 21:52:48 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [scarthgap][PATCH] mariadb: fix runtime failure on riscv
Date: Tue, 3 Sep 2024 12:52:47 +0800
Message-ID: <20240903045247.275642-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: tNgo2IZ5pCc9YR0fiyiEi_jCIjhYzK4c
X-Authority-Analysis: v=2.4 cv=DN/d4DNb c=1 sm=1 tr=0 ts=66d69622 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=EaEq8P2WXUwA:10 a=t7CeM3EgAAAA:8 a=hkEv4HZQAAAA:8 a=hXZgYZo4AAAA:8 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8
 a=YYDuY_6nrHK9ruza0PMA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=NA03pvyaApPJG5valX87:22 a=37BJPeUnzxYkbV1yBC-1:22
X-Proofpoint-GUID: tNgo2IZ5pCc9YR0fiyiEi_jCIjhYzK4c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-02_06,2024-09-02_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 adultscore=0 mlxscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2409030035
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Sep 2024 04:52:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112078

From: Changqing Li <changqing.li@windriver.com>

Starting with Linux 6.6, RDCYCLE is a privileged instruction on RISC-V
and can't be used directly from userland. This causes 'systemctl start
mysqld.service' failed with error:
[ 1456.918172] mariadbd[12115]: unhandled signal 4 code 0x1 at 0x000055558689d134 in mariadbd[555585bfa000+14a7000]
[ 1456.921772] CPU: 1 PID: 12115 Comm: mariadbd Not tainted 6.6.43-yocto-standard #1
[ 1456.922327] Hardware name: riscv-virtio,qemu (DT)
[ 1456.923045] epc : 000055558689d134 ra : 000055558620ea48 sp : 00007fffdc487770
[ 1456.923525]  gp : 00005555872ec400 tp : 00007fff89560780 t0 : 0000555587be32e8
[ 1456.923951]  t1 : 0000555586886042 t2 : 000000002d6a89f0 s0 : 00007fffdc4877b0

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  1 +
 ...RISC-V-use-RDTIME-instead-of-RDCYCLE.patch | 66 +++++++++++++++++++
 2 files changed, 67 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-RISC-V-use-RDTIME-instead-of-RDCYCLE.patch

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 33da32fb2..124a49ff9 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -25,6 +25,7 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://0001-Add-missing-includes-cstdint-and-cstdio.patch \
            file://0001-Remove-the-compile_time_assert-lines.patch \
            file://0001-MDEV-33439-Fix-build-with-libxml2-2.12.patch \
+           file://0001-RISC-V-use-RDTIME-instead-of-RDCYCLE.patch \
           "
 SRC_URI:append:libc-musl = " file://ppc-remove-glibc-dep.patch"
 SRC_URI[sha256sum] = "5239a245ed90517e96396605cd01ccd8f73cd7442d1b3076b6ffe258110e5157"
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-RISC-V-use-RDTIME-instead-of-RDCYCLE.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-RISC-V-use-RDTIME-instead-of-RDCYCLE.patch
new file mode 100644
index 000000000..25a2c399c
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-RISC-V-use-RDTIME-instead-of-RDCYCLE.patch
@@ -0,0 +1,66 @@
+From 342f0dd9b4f9fc49dcb589cd98933ea330de55d8 Mon Sep 17 00:00:00 2001
+From: Aurelien Jarno <aurelien@aurel32.net>
+Date: Thu, 4 Jan 2024 11:30:34 +0100
+Subject: [PATCH] RISC-V: use RDTIME instead of RDCYCLE
+
+Starting with Linux 6.6 [1], RDCYCLE is a privileged instruction on
+RISC-V and can't be used directly from userland. There is a sysctl
+option to change that as a transition period, but it will eventually
+disappear.
+
+Use RDTIME instead, which while less accurate has the advantage of being
+synchronized between CPU (and thus monotonic) and of constant frequency.
+
+[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=cc4c07c89aada16229084eeb93895c95b7eabaa3
+
+Upstream-Status: Backport [https://github.com/MariaDB/server/commit/656f8867720efc1b4dd0969319f35a3e1a2a005e]
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ include/my_rdtsc.h | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/include/my_rdtsc.h b/include/my_rdtsc.h
+index 8b9b0046bc0..21e44847d9a 100644
+--- a/include/my_rdtsc.h
++++ b/include/my_rdtsc.h
+@@ -111,7 +111,7 @@ C_MODE_START
+   On AARCH64, we use the generic timer base register. We override clang
+   implementation for aarch64 as it access a PMU register which is not
+   guaranteed to be active.
+-  On RISC-V, we use the rdcycle instruction to read from mcycle register.
++  On RISC-V, we use the rdtime instruction to read from mtime register.
+ 
+   Sadly, we have nothing for the Digital Alpha, MIPS, Motorola m68k,
+   HP PA-RISC or other non-mainstream (or obsolete) processors.
+@@ -211,15 +211,15 @@ static inline ulonglong my_timer_cycles(void)
+   }
+ #elif defined(__riscv)
+   #define MY_TIMER_ROUTINE_CYCLES MY_TIMER_ROUTINE_RISCV
+-  /* Use RDCYCLE (and RDCYCLEH on riscv32) */
++  /* Use RDTIME (and RDTIMEH on riscv32) */
+   {
+ # if __riscv_xlen == 32
+     ulong result_lo, result_hi0, result_hi1;
+     /* Implemented in assembly because Clang insisted on branching. */
+     __asm __volatile__(
+-        "rdcycleh %0\n"
+-        "rdcycle %1\n"
+-        "rdcycleh %2\n"
++        "rdtimeh %0\n"
++        "rdtime %1\n"
++        "rdtimeh %2\n"
+         "sub %0, %0, %2\n"
+         "seqz %0, %0\n"
+         "sub %0, zero, %0\n"
+@@ -228,7 +228,7 @@ static inline ulonglong my_timer_cycles(void)
+     return (static_cast<ulonglong>(result_hi1) << 32) | result_lo;
+ # else
+     ulonglong result;
+-    __asm __volatile__("rdcycle %0" : "=r"(result));
++    __asm __volatile__("rdtime %0" : "=r"(result));
+     return result;
+   }
+ # endif
+-- 
+2.25.1
+
-- 
2.46.0


