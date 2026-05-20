Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CB35CD4F3C
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 11:34:30 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10123.1779276863074466483
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 May 2026 04:34:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=PaYdU2Bf;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=JJq50KTy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K76lIq630202
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 May 2026 11:34:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=hf4Hs8uTe+CH46TGVYCMGtHZcTCBNUGqXIc
	qkYCipzo=; b=PaYdU2Bf4r/niE/7SBIG5LUitrdueYLBWwD0zhLoZrpfmAkhu05
	G6HTI1dysrdXabSZfMof0LcpFQN6IAtNx8sChJ0yQwQjzP9kwBOYw0MZqU99vOgo
	3QU6+kyTsqgJdlPjlFJBtXrEfAH8R8O1h0DhzZ02KBpwpT8X5owT5qTqNBD6hzlt
	fdh2FygwKsvmN+2eD2Pk8Dx3qdMM8Hboddw3I9PDOzPoSiOeLyq2Ob8GV3ur8U7W
	7LLbGr+TVrjs10Ox+JHuvB9FFMyGqcJKyuLaleqO/hKzLJ9PFDMc7fGbZX7+rklH
	Dtb4QmtjGr0luPS+0qDJIM+US35yQpnrnRg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3nvjex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 May 2026 11:34:22 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-63a6257148cso3412189137.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 May 2026 04:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779276861; x=1779881661; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=hf4Hs8uTe+CH46TGVYCMGtHZcTCBNUGqXIcqkYCipzo=;
        b=JJq50KTyAS1WJ+d2Ue8ncTn5aj7BB1PfHik32oGf+SVHARNt3d8LxqdH8cfcn+C3hN
         JCjsJhlLhU8O0QjxhI2pi/oUI3A3T62DCYTPdqYV/jEZb23FozH29p3xzsTwJIcQQXhm
         Nk2cjeyD+jm05AYkFTQ96kgek80C82SA1swOzSHPD5frh8tKHLj9WTbl35jN0Y/9Nzxa
         XNwElAyPpw/9BzKrt59fXp1KDhycYF7QOpznviOsPJIXXG5JgfVGWvBAbeldxJiOzIvE
         RhrLyn1Hk3p+E210uYmXrMLHteVswW7/Ckey8JCgpSkfIIXc0P1SSZkjqQF288LY10su
         RJ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779276861; x=1779881661;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hf4Hs8uTe+CH46TGVYCMGtHZcTCBNUGqXIcqkYCipzo=;
        b=ZR8JM069oXFpkMPMCGjLzINAxzCh7gR78lutGUktjA7+3LGqdSUambbn32i4drEjv0
         Muu3wv6d1o8NIHkH9k/q9e2oLafpx1PnE3DY1/2CREV/8TSgGtA2lN+ywEco6L9eCpAJ
         ai7yZzvVQST1091xL6agiWcVWUf4Gxn8DnHEU82WDNX4Om8xaaWfm7Y3lTgQbZ3wGzz6
         c5UdPC5PZsSWWgggSoqSPGg6jrpie2VRm8Ml3Of66PPWcdothYhYHmYMKpxAXRo82his
         C8UXbE9JLvZVhMPNxm+En0Klr+mQ9gsWYvtwdzBisBc7yBNPxnS8SqOFtKNYuacCK7rl
         F5jQ==
X-Gm-Message-State: AOJu0YzaxW2/hpBja+ykqTOhCe0ijkKJrRRhWpDwZblS0XnUNuHZbDKa
	Dn1OjbUJ092m7YFUINlZYva0Qc6tlAuEl3mqCQcbQzmq+U4AGVbqPaV4xmF6TRvC5dndRghaf42
	WQKS1aZQrWIr/6bzt2c0wunjAhpkxUCu3Gh7NxbjxQXP8A+dI3fdNTWUtV6Kmp/T470D93g1g1/
	w5Jt6mVaQdPMY7svbb
X-Gm-Gg: Acq92OFtArdUkz24lfmfXa+bjdzKdTgbzdBjfHnBZGGZyK6Srh59l2UW62mlJcuYmlU
	k6uAoadswCtPJpDM+qh9ctvgb5w0Us3XC99uBQvc4MdJE8hDa2DQ39Hlaqvl5ViJ8YNpXqj2Hly
	H+KrMCDABBB01zSm+XoJAcIPa6mbSAgulFU1F/Y7010F8n1Z5nTSdU9nL0zH0FwnV8jh0n7iasD
	3cA1Bmje5F+ZcfrqGzfAOww9I/rS1YO2CLlcYU8V3s7Y0D6LsxO7cKosGod4RSuzvPaPu2UM5/1
	0csJpDC6Irj3Q3iVeILQSbhJT2Wr/SNJaJPPuJsqYY6HyCBp8WH5CQpr3nNhVLCvfumWRWupNoE
	gxafLwZg17oJZQX3kYupNcFM/2pzdze6hvzF60lSCWLunvai/4IlPwC2IA9CxltSCPU7TTN+PDD
	yP7EEM/HHZiRQh+3Cy4/EyqKHELhvomkOwHBc=
X-Received: by 2002:a05:6102:6042:b0:631:e729:4575 with SMTP id ada2fe7eead31-63a3d219e05mr11476546137.5.1779276861107;
        Wed, 20 May 2026 04:34:21 -0700 (PDT)
X-Received: by 2002:a05:6102:6042:b0:631:e729:4575 with SMTP id ada2fe7eead31-63a3d219e05mr11476530137.5.1779276860276;
        Wed, 20 May 2026 04:34:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c8b2sm4873026e87.17.2026.05.20.04.34.19
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 04:34:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] mariadb: fix building for the ARMv8.3-A and later systems
Date: Wed, 20 May 2026 14:34:18 +0300
Message-ID: <20260520113418.2523208-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDExMSBTYWx0ZWRfX7bkVOW7B34o2
 8K8TUM1fQf159IFiQ9+ZVAVy+EWB6FcB+U+J5d0aWx2rGq/KwgH31bBTaMsicTiQdt2uDn+3IC/
 3veRi26QutlQQG3Ww9lPMA82BluhJjz8ey7ddzoV4jJypln9P6L2howmq1xW7BlCtjU2OACIsp1
 O8HUXroKiMfquRAR5AToapTyvh8JoHf9X0bxlG6IKRFZHr233w4QbJoc0UDQnQ8yXLYoIdaqFa4
 xY/adGOpQg1BAMUskR6cojaRnolhWcCei4xkHvZuxb7rFhN7IeAx288pzq85qoiJeq2Rrz7h3OY
 HFUYkimdAVe68QCvRgC/U7XhfVQCeqoYCz6Do5Aha6Qzx7NZqj0q9as4XHkaTMRJtcl9aJ9DsMJ
 GondIW2ijIwHPvo0AKR13Pogz8V2GC2z5i7nPtlPHPfDScF47YkJU3VPMpEpn+NrjO22RATTGi1
 iJVrBy8MZTsmnvqeLSg==
X-Proofpoint-GUID: blIzOmwTaULKKtiaozK1fAfjrjkQRDK-
X-Proofpoint-ORIG-GUID: blIzOmwTaULKKtiaozK1fAfjrjkQRDK-
X-Authority-Analysis: v=2.4 cv=Mr9iLWae c=1 sm=1 tr=0 ts=6a0d9c3e cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=hkEv4HZQAAAA:8 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=EAzCv-LrHoDSmWyZLzEA:9 a=-aSRE8QhW-JAV6biHavz:22 a=NA03pvyaApPJG5valX87:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200111
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 May 2026 11:34:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127108

Building mariadb for ARMv8.3-A and later, fails with:

Assembler messages:
{standard input}:169: Error: selected processor does not support `retaa'
{standard input}:271: Error: selected processor does not support `retaa'

It happens because the pmem_cvap() funciton manually inserts the `.arch
armv8-2.a` clause, making GAS believe that retaa instruction (inserted
by GCC) is invalid. Bump the manually inserted clause to armv8.3-a, to
prevent GAS from choking on the retaa instructions.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  1 +
 ...-sync-cache.cc-bump-ARMv8-arch-to-AR.patch | 35 +++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-storage-innobase-sync-cache.cc-bump-ARMv8-arch-to-AR.patch

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 9470184d3d43..456c1e1354e8 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -25,6 +25,7 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://riscv32.patch \
            file://0001-support-reproducible-builds.patch \
            file://0001-storage-mroonga-CMakeLists.txt-fix-reproducible-buil.patch \
+           file://0001-storage-innobase-sync-cache.cc-bump-ARMv8-arch-to-AR.patch \
           "
 SRC_URI[sha256sum] = "14783ddc5edd966ff05aa0efd5ed6d3d369ed5b9e4080a448f00f87a9f0a4a6b"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-storage-innobase-sync-cache.cc-bump-ARMv8-arch-to-AR.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-storage-innobase-sync-cache.cc-bump-ARMv8-arch-to-AR.patch
new file mode 100644
index 000000000000..dfb6c7795407
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-storage-innobase-sync-cache.cc-bump-ARMv8-arch-to-AR.patch
@@ -0,0 +1,35 @@
+From ac6553ff3a21eb048f623081b7b7e31e43d38d77 Mon Sep 17 00:00:00 2001
+From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+Date: Wed, 20 May 2026 14:14:02 +0300
+Subject: [PATCH] storage/innobase/sync/cache.cc: bump ARMv8 arch to ARMv8.3
+
+Building for ARMv8.3-A and later, fails with:
+
+Assembler messages:
+{standard input}:169: Error: selected processor does not support `retaa'
+{standard input}:271: Error: selected processor does not support `retaa'
+
+It happens because the pmem_cvap() funciton manually inserts the `.arch
+armv8-2.a` clause, making GAS believe that retaa instruction (inserted
+by GCC) is invalid. Bump the manually inserted clause to armv8.3-a, to
+prevent GAS from choking on the retaa instructions.
+
+Upstream-Status: Inappropriate [upstream ticket https://github.com/MariaDB/server/pull/3677#issuecomment-4497763227]
+Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+---
+ storage/innobase/sync/cache.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/storage/innobase/sync/cache.cc b/storage/innobase/sync/cache.cc
+index c5e67709e22b..104a45cee9ee 100644
+--- a/storage/innobase/sync/cache.cc
++++ b/storage/innobase/sync/cache.cc
+@@ -85,7 +85,7 @@ static void pmem_cvap(const void* buf, size_t size)
+ #if defined __ARM_ARCH && __ARM_ARCH == 9
+     __asm__ __volatile__(".arch armv9.4-a\n dc cvap, %0" :: "r"(u) : "memory");
+ #else
+-    __asm__ __volatile__(".arch armv8.2-a\n dc cvap, %0" :: "r"(u) : "memory");
++    __asm__ __volatile__(".arch armv8.3-a\n dc cvap, %0" :: "r"(u) : "memory");
+ #endif
+ 
+   __asm__ __volatile__("dmb ishst" ::: "memory");
-- 
2.47.3


