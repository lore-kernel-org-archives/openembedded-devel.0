Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D752EC30632
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 14:55:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.189553.1692284148272521303
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Aug 2023 07:55:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=XzJrg8Mm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75930fb0fb=narpat.mali@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37HAkAkI026232;
	Thu, 17 Aug 2023 14:55:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=GwDU7
	zP1k9Wo8KgpIGx/ZtAL+vdoIH+qc4QJaUFAd1Y=; b=XzJrg8MmsjSOhP2+oBPYL
	wS4Ov1su3P2+QFITPjECo2/qAZ34fh/dikj1siKnm3QrUT05YiFEu22rPywvnaCQ
	gYRpwqyNkQlHltgYGDpOzxs/GnU/JEf8xwQcWZzDr4jhDX9aHujjX1VsmmKaolhz
	p7lZjzMX8nCsjj/vvpi/4fCfOdvRKJliRiuo3R2haX0gVJW9s0ZQu/5KNiBZeYLm
	YbgagA+sqXAjSSgAcvJ0msWOmuL7AMwc4tGv81wACX6rXQtKrbB+89i/rt7uRcOL
	985XcWhr5EUO9xCIWUtdpXDTPT88ZB+DmQbSY2FhQsJbEHSeoScTeBsH+Jyzv+aL
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3se125w1d4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 17 Aug 2023 14:55:46 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 17 Aug 2023 07:55:44 -0700
From: nmali <narpat.mali@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <akuster808@gmail.com>
Subject: [meta-oe][kirkstone][PATCH 1/1] libqb: upgrade 2.0.6 -> 2.0.8
Date: Thu, 17 Aug 2023 14:55:24 +0000
Message-ID: <20230817145524.1042930-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: GbSD0NVI85cwsHn5P2v-4Ntd4AianFOm
X-Proofpoint-ORIG-GUID: GbSD0NVI85cwsHn5P2v-4Ntd4AianFOm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-17_09,2023-08-17_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 mlxlogscore=999 spamscore=0 clxscore=1011 impostorscore=0
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2306200000 definitions=main-2308170132
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Aug 2023 14:55:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104464

From: Narpat Mali <narpat.mali@windriver.com>

The delta between 2.0.6 and 2.0.8 contains the CVE-2023-39976 fix
and other bugfixes. git log --oneline shows:

002171b (HEAD, tag: v2.0.8, origin/main, origin/HEAD, main) Update library version for 2.0.8
1bbaa92 log: fix potential overflow with long log messages (#490)
92ddd7c test - fix test dependancies (#489)
06c8641 (tag: v2.0.7) Update -version info for 2.0.7
0665086 spec: Migrate to SPDX license (#487)
5862acb blackbox: fix potential overlow/memory corruption (#486)
a3aedbc tests: allow -j to work (#485)
335dbb6 test: Remove gnu/lib-names.h from libstat_wrapper.c (#482)
4dcdfe9 strlcpy: avoid compiler warning from strncpy (#473)
1a32a60 Add --disable-tests option (#475)
10b0623 m4/ax_pthread.m4: update to latest upstream version (serial 31) (#472)
e038f59 tests: Close race condition in check_loop (#480)
fde729e timer: Move state check to before time check (#479)
5594d37 ipc: Retry receiving credentials if the the message is short (#476)
e8129a3 add simplified chinese readme (#474)
eaa95ec lib: Fix some small bugs spotted by newest covscan (#471)
14507d5 configure: Modernize configure.ac a bit (#470)
8325d84 tests: Fix tests on FreeBSD-devel (#469)
e407874 doxygen2man: Fix function parameter alignment (#468)
0eb0991 tests: cleanup the last of the empty directories (#467)
44a4cb2 tests: Make ipc test more portable (#466)
758044b (tag: v2.0.6) test: Include ipc_sock.test in the libqb-tests rpm (#463)

Release Notes: https://github.com/ClusterLabs/libqb/releases

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 .../recipes-extended/libqb/{libqb_2.0.6.bb => libqb_2.0.8.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/libqb/{libqb_2.0.6.bb => libqb_2.0.8.bb} (93%)

diff --git a/meta-oe/recipes-extended/libqb/libqb_2.0.6.bb b/meta-oe/recipes-extended/libqb/libqb_2.0.8.bb
similarity index 93%
rename from meta-oe/recipes-extended/libqb/libqb_2.0.6.bb
rename to meta-oe/recipes-extended/libqb/libqb_2.0.8.bb
index ce3606d777..3db9e2e66f 100644
--- a/meta-oe/recipes-extended/libqb/libqb_2.0.6.bb
+++ b/meta-oe/recipes-extended/libqb/libqb_2.0.8.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=321bf41f280cf805086dd5a720b37785"
 
 inherit autotools pkgconfig
 
-SRCREV = "758044bed5f615c90818aa5431d00303288888e5"
+SRCREV = "002171bbcf4bc4728da56c1538afd9e9d814ecaf"
 SRC_URI = "git://github.com/ClusterLabs/${BPN}.git;branch=main;protocol=https \
           "
 S = "${WORKDIR}/git"
-- 
2.40.0


