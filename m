Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D38DCFD31C
	for <webhook@archiver.kernel.org>; Mon, 24 Nov 2025 09:36:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12947.1763976959060141854
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Nov 2025 01:35:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=a6D10oeW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3423b2b4bb=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AO8FXrZ2083734
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Nov 2025 09:35:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=JZbvIyfmIosj3i34fvTP
	4e0TQeSX2mWPlbkYy7SHV+E=; b=a6D10oeWAoFI6NL+Hdr2EHI0nABTtejqd3qW
	66Veb323QXonzcFYYy/kWzZFS1HY6zEuRz8Z7+eU4JMzupUoLlNTkvlIw0kyxudv
	xk6Ia9gFpak5ZuzksBKiQMgne2bvYr/PsX5rEEQfiflT9NDBszzWmnOlVBQKf/Db
	k06nQ0TgE+iFNZ0SpDppdtK3OoEYY2GR+mvebA7tWcyM1iKdlqKLdOC44OhcTZB1
	M5ekmct0UWQhpGJxHOmxywiEtTyHYQIb5hSm6WzMWrwXYh1SkaJWhkipNnBdSjEz
	1/S2sszirMeFJPj1FS1ZsxfgjUQbC112LGlJCv0RwOeUc7Lfew==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ak455hr86-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Nov 2025 09:35:49 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 24 Nov 2025 01:35:49 -0800
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 24 Nov 2025 01:35:48 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] mariadb: Upgrade 11.4.8 -> 11.4.9
Date: Mon, 24 Nov 2025 17:35:45 +0800
Message-ID: <20251124093545.3217845-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: fyS7MvCsq6HJX33ZzeumlR_nhoLUbBjV
X-Proofpoint-GUID: fyS7MvCsq6HJX33ZzeumlR_nhoLUbBjV
X-Authority-Analysis: v=2.4 cv=T6eBjvKQ c=1 sm=1 tr=0 ts=692426f6 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jpp-Wi3FAAAA:8 a=NEAV23lmAAAA:8
 a=hkEv4HZQAAAA:8 a=t7CeM3EgAAAA:8 a=qK8EfE0Hi3_JzoGgzOgA:9
 a=3HWhRrkoiJongTt84g_J:22 a=NA03pvyaApPJG5valX87:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDA4NCBTYWx0ZWRfX1U1IQn1d9bLr
 L6Ay+vmTrv6Puu6BK0MQaFXJLhAb1MpQt05yItP42lGbSVvHyAv3jvF1Fi51BfzZ6UA3gtxJri3
 lUbTz3ZuN8SIa8Oopef5PuPEBLsQHaUFrZiwquwWbGzVMd8T6aaiPMFGDpz3loKfQGbBofL0Vay
 mU2zIAsDoBA3L44QCRx2g7RhYJ2Sw6Nl2PWYuVaz9dBQDrr+wkChuC54tDvX9mGXNkOVqJcnfbl
 D1E8lQAUGxuXjDAD76CgKv+3wXgqRCn4lzeFMnyzuZ64MGfSHJU/S/Q61YpnzrWZ4wrOHHpmiS9
 1r/mUhHhcJFMUCOLNwDl77f+Srv3dIabpdLq1Jy4oBfHy+pjUKj5giE/7KnUPCpGfywadVwD/pw
 HtlkYoPTpzO4YBHxLzh3mip6OU/6Cw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_04,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240084
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Nov 2025 09:36:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122006

From: Mingli Yu <mingli.yu@windriver.com>

Remove the 0001-Ensure-compatibility-with-ARMv9-by-updating-.arch-di.patch
patch as its logic included in new version [1].

Release notes: https://mariadb.com/docs/release-notes/community-server/11.4/11.4.9

[1] https://github.com/MariaDB/server/commit/e8026a50197cbfccd70a2072cbc0ae4728a4ab40

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...ive_11.4.8.bb => mariadb-native_11.4.9.bb} |  0
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  3 +-
 ...lity-with-ARMv9-by-updating-.arch-di.patch | 41 -------------------
 .../{mariadb_11.4.8.bb => mariadb_11.4.9.bb}  |  0
 4 files changed, 1 insertion(+), 43 deletions(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_11.4.8.bb => mariadb-native_11.4.9.bb} (100%)
 delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-Ensure-compatibility-with-ARMv9-by-updating-.arch-di.patch
 rename meta-oe/recipes-dbs/mysql/{mariadb_11.4.8.bb => mariadb_11.4.9.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_11.4.8.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_11.4.9.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_11.4.8.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_11.4.9.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 82479c248f..4fcb5a1e40 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -22,14 +22,13 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch \
            file://lfs64.patch \
            file://0001-Add-missing-includes-cstdint-and-cstdio.patch \
-           file://0001-Ensure-compatibility-with-ARMv9-by-updating-.arch-di.patch \
            file://riscv32.patch \
            file://0001-Remove-x86-specific-loop-in-my_convert.patch \
            file://0001-support-reproducible-builds.patch \
            file://0001-storage-mroonga-CMakeLists.txt-fix-reproducible-buil.patch \
            file://0001-MDEV-38029-my_tzinfo-t-fails-for-certain-TZ-values-o.patch \
           "
-SRC_URI[sha256sum] = "52fa4dca2c5f80afc1667d523a27c06176d98532298a6b0c31ed73505f49e15c"
+SRC_URI[sha256sum] = "8e481ca29b5a740444d45451c8ea2d93711cf525d6fa5d27bc9512cf8973b075"
 
 UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/tags"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-Ensure-compatibility-with-ARMv9-by-updating-.arch-di.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-Ensure-compatibility-with-ARMv9-by-updating-.arch-di.patch
deleted file mode 100644
index 2a1c74a68c..0000000000
--- a/meta-oe/recipes-dbs/mysql/mariadb/0001-Ensure-compatibility-with-ARMv9-by-updating-.arch-di.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 0b1ba174bd5148c0675b335fcebde767a56e10bb Mon Sep 17 00:00:00 2001
-From: Ruiqiang Hao <Ruiqiang.Hao@windriver.com>
-Date: Mon, 2 Dec 2024 02:18:46 +0000
-Subject: [PATCH] Ensure compatibility with ARMv9 by updating .arch directive
-
-The pmem_cvap() function currently uses the '.arch armv8.2-a' directive
-for the 'dc cvap' instruction. This will cause build errors below when
-compiling for ARMv9 systems. Update the '.arch' directive to 'armv9.4-a'
-to ensure compatibility with ARMv9 architectures.
-
-{standard input}: Assembler messages:
-{standard input}:169: Error: selected processor does not support `retaa'
-{standard input}:286: Error: selected processor does not support `retaa'
-make[2]: *** [storage/innobase/CMakeFiles/innobase_embedded.dir/build.make:
-1644: storage/innobase/CMakeFiles/innobase_embedded.dir/sync/cache.cc.o]
-Error 1
-
-Upstream-Status: Submitted
-
-Signed-off-by: Ruiqiang Hao <Ruiqiang.Hao@windriver.com>
----
- storage/innobase/sync/cache.cc | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/storage/innobase/sync/cache.cc b/storage/innobase/sync/cache.cc
-index 43d642d0..c5e67709 100644
---- a/storage/innobase/sync/cache.cc
-+++ b/storage/innobase/sync/cache.cc
-@@ -82,7 +82,12 @@ static void pmem_cvap(const void* buf, size_t size)
-   for (uintptr_t u= uintptr_t(buf) & ~(CPU_LEVEL1_DCACHE_LINESIZE),
-          end= uintptr_t(buf) + size;
-        u < end; u+= CPU_LEVEL1_DCACHE_LINESIZE)
-+#if defined __ARM_ARCH && __ARM_ARCH == 9
-+    __asm__ __volatile__(".arch armv9.4-a\n dc cvap, %0" :: "r"(u) : "memory");
-+#else
-     __asm__ __volatile__(".arch armv8.2-a\n dc cvap, %0" :: "r"(u) : "memory");
-+#endif
-+
-   __asm__ __volatile__("dmb ishst" ::: "memory");
- }
- 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_11.4.8.bb b/meta-oe/recipes-dbs/mysql/mariadb_11.4.9.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_11.4.8.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_11.4.9.bb
-- 
2.34.1


