Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30812C87FCC
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 12:31:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.34158.1753878703407381919
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Jul 2025 05:31:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0306a9768e=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56UCSbf82611733;
	Wed, 30 Jul 2025 12:31:42 GMT
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 487ke7804e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 30 Jul 2025 12:31:41 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Wed, 30 Jul 2025 05:31:39 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Wed, 30 Jul 2025 05:31:36 -0700
From: Praveen Kumar <praveen.kumar@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Gijs Peskens <gijs@peskens.net>,
        Gijs Peskens
	<gijs.peskens@munisense.com>,
        Khem Raj <raj.khem@gmail.com>,
        Praveen Kumar
	<praveen.kumar@windriver.com>
Subject: [oe][meta-oe][walnascar[PATCH 4/4] php: fix removal of --with-zlib-dir configure option
Date: Wed, 30 Jul 2025 18:01:11 +0530
Message-ID: <20250730123111.3858530-4-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250730123111.3858530-1-praveen.kumar@windriver.com>
References: <20250730123111.3858530-1-praveen.kumar@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: eq1o3Wf3dMaQTlZAgwBnxxPGkWvEj7RO
X-Authority-Analysis: v=2.4 cv=J6Wq7BnS c=1 sm=1 tr=0 ts=688a10ad cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=Wb1JkmetP80A:10 a=OP5uKSYpAAAA:8 a=D4FRcbXYAAAA:8 a=pGLkceISAAAA:8
 a=t7CeM3EgAAAA:8 a=fNeGth6tcmLdgUTrcnIA:9 a=QkOCL89WfptJwk51WFR5:22
 a=iiWfIM-muJKaQ-WMpyLy:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA4OSBTYWx0ZWRfX+gtjmp4hMsmJ
 jXm8hSzKAm04CaP4xuno2QiKFLS8xDIvS4asPqih9EUmE9IXl1vNTDXEp+jEVqlxX2663zuXx1l
 TBLUiNdThhbfCaP2dM+7KckRxdQbXl2rI7v91/6NFpTmVPUGLm0K+V6Zp9uykAF7bdVYEzcszVG
 OfCt6V2nMo86OVuUi99hDEOnyPL4+cIFDTBnEU3IAC5GGCrP8la0yThx5E7kAVCOkaGJ6cIDTW2
 vMCnUBKoHGc4TAiUtPC64VzcL5WUyYFx4LvWGtLZqKxuV16i/6vfTHI/xjKwX5+V0HHdKNBLFU4
 X1ClrvcxEUqUX8qtDHP0hUqvLMfLgqAZpO/XHOHBvRJKP/usj75jp7JM7XaLJ9odDK8Fb0pVjWf
 xRsTVmrS
X-Proofpoint-ORIG-GUID: eq1o3Wf3dMaQTlZAgwBnxxPGkWvEj7RO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_04,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 clxscore=1011 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2507300089
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 12:31:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118797

From: Gijs Peskens <gijs@peskens.net>

PHP has removed the --with-zlib-dir configure option since that is now
taken over by pkg-config, this breaks building PHP on Walnascar when zip
is enabled via PACKAGECONFIG.
So remove it.

Signed-off-by: Gijs Peskens <gijs.peskens@munisense.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 90fa225b86fa3df35b3273a5522b72e95ae258d7)

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
---
 meta-oe/recipes-devtools/php/php_8.4.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/php/php_8.4.10.bb b/meta-oe/recipes-devtools/php/php_8.4.10.bb
index 8d7a214d35..d74552d5e2 100644
--- a/meta-oe/recipes-devtools/php/php_8.4.10.bb
+++ b/meta-oe/recipes-devtools/php/php_8.4.10.bb
@@ -110,7 +110,7 @@ PACKAGECONFIG[sqlite3] = "--with-sqlite3=${STAGING_LIBDIR}/.. \
                           ,--without-sqlite3 --without-pdo-sqlite \
                           ,sqlite3"
 PACKAGECONFIG[valgrind] = "--with-valgrind=${STAGING_DIR_TARGET}/usr,--with-valgrind=no,valgrind"
-PACKAGECONFIG[zip] = "--with-zip --with-zlib-dir=${STAGING_EXECPREFIXDIR},,libzip"
+PACKAGECONFIG[zip] = "--with-zip,,libzip"
 
 export HOSTCC = "${BUILD_CC}"
 export PHP_NATIVE_DIR = "${STAGING_BINDIR_NATIVE}"
-- 
2.40.0


