Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43BF9CCA476
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 08:26:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.13871.1759825595013610146
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Oct 2025 01:26:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=PzQF3q4K;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2375e24266=yogita.urade@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5977avht2502529
	for <openembedded-devel@lists.openembedded.org>; Tue, 7 Oct 2025 08:26:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=24lMrOW94JVtBDdD6n97
	ef9PGP4mZ3SLVxs35XdWGVU=; b=PzQF3q4KKMb/2yXMWnRQccXJBqC3GVIeQqld
	6E5SuNa/A2VgIYpmbkOtHInLol2VWBj21bIAGtxX79FASHvsANHTVl7mbc9NdgZb
	tm+f7nghfCd1oKI/a0TPr0G7GFTu+0mUi0FBbunVnLrRFLXWYi1SYnJgzAuBc3PQ
	VadomrkknOYbFhrtsfuurR3nETDpZ76cB6ReUCnGdB4008v4nByviEBGyqzgIBdx
	Dr/x3WoZ3wRBtcrGaFTTRB+yHmkQ/nXejmq+S7ei9RKMC8WMg6b2isX1tgIOsCAz
	gDnNjF0kcpKXIrJCLJwspF9sYuwGdkgUP4dOTW9QGN8ERXAkVA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49jtj3anp7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 08:26:33 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Tue, 7 Oct 2025 01:26:31 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][scarthgap][v2][PATCH 1/1] mariadb: correct STACK_DIRECTION setting
Date: Tue, 7 Oct 2025 13:56:08 +0530
Message-ID: <20251007082608.1799113-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (10.11.224.121) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Proofpoint-GUID: Ys_cprzTyggbnkVa5HcQB53S-o1km4C6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA3MDA2NiBTYWx0ZWRfXw2Vc/R1bVyW6
 HK7P0Ik1klXbEnAcu85Y3za5auyo09F6wgHO887a/Ij35QNlfxwG/vy5Q5CZqhgiHWLLqXWQmxE
 e3ZdQFchbwCSuvO5A6DqgV+iAKvhsABs0S5T4EK4edLv6GweN0KVFNN/qH5UslW6L9NRIKg6lcd
 WqgN26dHOG6qkHDPfbACn3W0cZgBvdRfYpvQ9/9OTDHUW3Dhm7D9lTEiI4zZlMmk3mMGml2ol5+
 4+D9RV2+T68YuH+bNBd/o10qtNlzgSJ7KuxVF6lEGjnVvt1CKLD14jHwrLzKMbVLb32i1mXdRmb
 ZkgwNOAt0ADFHNil/dHeqNEICW6XbpN4xcLk5ILUddCdBa1jJq8HAg8+QzvREEIl2nlN0kfsGo2
 TSZunUinbNINSQhjLIk6A0Fd8m81RA==
X-Proofpoint-ORIG-GUID: Ys_cprzTyggbnkVa5HcQB53S-o1km4C6
X-Authority-Analysis: v=2.4 cv=CqCys34D c=1 sm=1 tr=0 ts=68e4ceb9 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=Ysh-ikk37VMA:10 a=gmxlzscTznEA:10 a=x6icFKpwvdMA:10 a=NEAV23lmAAAA:8
 a=hkEv4HZQAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=3g5HAAR2qpCr_H2gY-YA:9
 a=NA03pvyaApPJG5valX87:22 a=FdTzh2GWekK77mhwV6Dw:22 a=6_D5ljFcL1GZDUJyZucp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2509150000 definitions=main-2510070066
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 08:26:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120322

From: Changqing Li <changqing.li@windriver.com>

STACK_DIRECTION = 1 means stack grow upwards
STACK_DIRECTION = -1 means stack grow downwards

In the majority of modern architectures, stack grows downwards. So set
STACK_DIRECTION = 1 is not right. But the failure is not exposed before,
mysqld can start normally, and simple runtime operation like create db,
table, select info, works well. But it is exposed after commit [1] is
merged, mysqld will start failed with error:
2025-02-12  3:18:19 0 [ERROR] Could not open mysql.plugin table: "Thread stack overrun:  16752824 bytes used of a 299008 byte stack, and 81920 bytes needed

Since commit [2], mariadb started to determine the default
STACK_DIRECTION in CMake based on the ISA, and we have set correct
CMAKE_SYSTEM_PROCESSOR in cmake.bbclass, so just don't pass it.

[1] https://github.com/MariaDB/server/commit/bddbef3573349b0565c43c27beba47c89358f39f
[2] https://github.com/MariaDB/server/commit/d0abbdf56e11ccc88447c1dc80caaf355c94be3b
[3] https://jira.mariadb.org/browse/MDEV-36051

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 6e7c01a775..f0cec75568 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -95,7 +95,6 @@ EXTRA_OECMAKE = "-DWITH_EMBEDDED_SERVER=ON \
                  -DINSTALL_SYSCONFDIR:PATH=${sysconfdir} \
                  -DMYSQL_DATADIR:PATH=/var/mysql \
                  -DCAT_EXECUTABLE=`which cat` \
-                 -DSTACK_DIRECTION=1 \
                  -DHAVE_SYSTEM_LIBFMT_EXITCODE=0 \
                  -DCMAKE_AR:FILEPATH=${AR}"
 
-- 
2.40.0


