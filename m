Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08E64C27C75
	for <webhook@archiver.kernel.org>; Sat,  8 Jun 2024 12:35:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5428.1717850124479424966
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Jun 2024 05:35:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=688978f826=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 458CA2Ao002363;
	Sat, 8 Jun 2024 12:35:22 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ymcgwra7v-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 08 Jun 2024 12:35:22 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 8 Jun 2024 05:35:21 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Sat, 8 Jun 2024 05:35:20 -0700
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH v2 3/4] recipes: disable gcc option -Wincompatible-pointer-types
Date: Sat, 8 Jun 2024 20:35:09 +0800
Message-ID: <20240608123510.1767305-3-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240608123510.1767305-1-kai.kang@windriver.com>
References: <20240608123244.1767171-1-kai.kang@windriver.com>
 <20240608123510.1767305-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: _iPSP64qlMk74tHSdhJojL6Md-5xMrRx
X-Proofpoint-ORIG-GUID: _iPSP64qlMk74tHSdhJojL6Md-5xMrRx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-08_06,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 phishscore=0 bulkscore=0 spamscore=0 mlxlogscore=854 lowpriorityscore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406080093
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Jun 2024 12:35:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110779

From: Kai Kang <kai.kang@windriver.com>

It fails to run do_compile tasks for libdbd-mysql-perl and rrdtool with gcc
option -Wincompatible-pointer-types enabled by default. Disable it as
workaround.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/recipes-devtools/perl/libdbd-mysql-perl_4.050.bb | 2 ++
 meta-oe/recipes-extended/rrdtool/rrdtool_1.8.0.bb        | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/perl/libdbd-mysql-perl_4.050.bb b/meta-oe/recipes-devtools/perl/libdbd-mysql-perl_4.050.bb
index fc505fe1e..919997914 100644
--- a/meta-oe/recipes-devtools/perl/libdbd-mysql-perl_4.050.bb
+++ b/meta-oe/recipes-devtools/perl/libdbd-mysql-perl_4.050.bb
@@ -20,3 +20,5 @@ SRC_URI = "git://github.com/perl5-dbi/DBD-mysql.git;protocol=https;branch=master
 S = "${WORKDIR}/git"
 
 inherit cpan
+
+EXTRA_OEMAKE = ' CC="${CC} -Wno-incompatible-pointer-types"'
diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.8.0.bb b/meta-oe/recipes-extended/rrdtool/rrdtool_1.8.0.bb
index cbe1af285..32ab911bc 100644
--- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.8.0.bb
+++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.8.0.bb
@@ -59,7 +59,7 @@ export STAGING_LIBDIR
 export STAGING_INCDIR
 
 # emulate cpan_do_configure
-EXTRA_OEMAKE = ' PERL5LIB="${PERL_ARCHLIB}" '
+EXTRA_OEMAKE = ' CC="${CC} -Wno-incompatible-pointer-types" PERL5LIB="${PERL_ARCHLIB}" '
 # Avoid do_configure error on some hosts
 
 do_configure() {
-- 
2.34.1


