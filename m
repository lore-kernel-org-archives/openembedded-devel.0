Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5072CD98C7
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 08:25:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40709.1781166300617654461
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2026 01:25:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=GATe7g2s;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=062297c20d=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B6DhXk2537251
	for <openembedded-devel@lists.openembedded.org>; Thu, 11 Jun 2026 08:24:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=66f/svI3xC07Ztb5wzOa
	NeyqSJObDrGqxJqCNZLF2Ds=; b=GATe7g2sc0nzdKqnS4A2N7ClI2lxwqcap/YX
	JvPxasZzP0EtK7NJg1LZijNMlU+XGdKNl22oiyQBCo2SgxWixZ2SyVaF/rYrIRnw
	KErsugvluuhHjCvtk0FD0u9tdpmtQRQ2vgdIjlKo6bgxRypaLK2q042Y2h8D/7Xr
	yQ3IY2wWuo0o4dhXOvd0VjPlvUmGgqHvkV27gMeHurT7OfjjQAdws+dZfLQkosy8
	rscMBbSQhSVwjNKS34egNpSa/7PgrYYuxQ5XAXE6bidMWEAGwD0IUGX9o6JZRhbb
	qrhCEfW8+SrHsgF2XQkWojyP9FzrjItl4XmW/SmfMBpLIPYYNQ==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4eqe7egqkd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 11 Jun 2026 08:24:59 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Thu, 11 Jun 2026 01:24:58 -0700
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Thu, 11 Jun 2026 01:24:57 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] mariadb: Upgrade 11.4.10 -> 11.4.12
Date: Thu, 11 Jun 2026 16:24:57 +0800
Message-ID: <20260611082457.2394855-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: FDM2lZfbp3zk2x1sKXRDFrSt7ldLotWa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA4MiBTYWx0ZWRfXynTbkeQ4Ny/Y
 vevMjkFD15mHM6Q8lGbpplLQC1PZEhrAgU6nyInwxLrSe87bT4Vfy/7UUAc9P1dEGT6Adc3AjN8
 7KT3vpYrLUPuWLvBJeYsW+XfBoMdUkSm6239iFnlVyCLVgpHfaBainJ0yPjPc7h4tYf4N0xTAJW
 iXVAxpVQRxMPhKUA3HoB7WifpPwxlW4a4+ULOyustDUjdj24EdYx5og0I4oZU56gq2pmYp65NsB
 045+fkH3a9XralE8r0Tk4m5WSFtntGpfBhf7P0F1FCs6cx9ulpCzIAEURkBRRngNFOY1e5KF79c
 l+IMk0aMDbng+mwEMUeJDe/MrTG0GrfmNtGW0UWgJnFN/+RKqsyDkfkY2ihKrT50GwRx5IDbXAI
 EQS1Fc5kFF/F2zZBhzGACjUgtzDTeX7gPwjzxBdeL5l9LWeoQJzlVCI4OnVdLVu1D5U65T5zeVK
 x3RTKui0OO1xk5VuVmQ==
X-Authority-Analysis: v=2.4 cv=cN/QdFeN c=1 sm=1 tr=0 ts=6a2a70db cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=hkEv4HZQAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=9CpNMshNuh3nkx0_9AkA:9 a=NA03pvyaApPJG5valX87:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA4MiBTYWx0ZWRfXyyQI+DX78p42
 q6qkhN6GHJbOzubxVsLi+RNqzmpQpKmn1h1UKC/MDEiFwUor66zEMGxybDkQIo6sVv21TQ8Vudz
 hsSCKKmCyuV/SDhC9KZGoBiMhbnHtoa6McC5QEx5m6H4kPlvTnN4
X-Proofpoint-GUID: FDM2lZfbp3zk2x1sKXRDFrSt7ldLotWa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110082
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Jun 2026 08:25:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127518

From: Mingli Yu <mingli.yu@windriver.com>

This release includes below security fixes:
  CVE-2026-49261
  CVE-2026-48165
  CVE-2026-48163

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../{mariadb-native_11.4.10.bb => mariadb-native_11.4.12.bb}    | 0
 meta-oe/recipes-dbs/mysql/mariadb.inc                           | 2 +-
 .../mysql/{mariadb_11.4.10.bb => mariadb_11.4.12.bb}            | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_11.4.10.bb => mariadb-native_11.4.12.bb} (100%)
 rename meta-oe/recipes-dbs/mysql/{mariadb_11.4.10.bb => mariadb_11.4.12.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_11.4.10.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_11.4.12.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_11.4.10.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_11.4.12.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 87378e27f1..c10b0ac9a5 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -27,7 +27,7 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://0001-storage-mroonga-CMakeLists.txt-fix-reproducible-buil.patch \
            file://c21bb11be28ae9b2432b2a661bf38a197cf9514d.patch \
           "
-SRC_URI[sha256sum] = "14783ddc5edd966ff05aa0efd5ed6d3d369ed5b9e4080a448f00f87a9f0a4a6b"
+SRC_URI[sha256sum] = "5ab7883db519bfcebfdd2aac09bc5544a12ce328f39edd46d0bf01690615ef6c"
 
 UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/tags"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_11.4.10.bb b/meta-oe/recipes-dbs/mysql/mariadb_11.4.12.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_11.4.10.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_11.4.12.bb
-- 
2.34.1


