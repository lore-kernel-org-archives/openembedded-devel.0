Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36FA6C636CC
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 13:12:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.7950.1675861936499437105
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Feb 2023 05:12:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=LF0UrwNg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1403f2a2ad=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 318CkdWB030253
	for <openembedded-devel@lists.openembedded.org>; Wed, 8 Feb 2023 05:12:16 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=hUhWXBdOh6Hr40BfzGS9KGn4qeENpTIWC3CtMpxHLTs=;
 b=LF0UrwNgxWKlmOYAg+HhQhhLtN1AQ40BZIcGalD70N4pJDBYLqfm99RvqSO57lcTy7ew
 FJ36RmxLv211h4aaAEqSYeVC9w2Z4+h70NlD65bWbEJ/PXn3EExCLEJrvp8Nwvyjhbcq
 ZakI/LZJZV7Oh2BAwFXIn8Um7aEWnQR7Du4n2DAH1hl0bEqp2U4GwgPPm789cVeD9ZIp
 M2eZDFbJAgEOnuo9681zkqLWvYMnGFg/sQLNVsOxZU5/946WgntjuiBH3nIAq7Z/uJia
 JgVNORBEMBly/DNGCDUAacddqR1hOdJrj23/LD8y1Q76SMsCcGvlna+NJb3n+vH5e9Ef iQ== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nhkh9bygf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 08 Feb 2023 05:12:16 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Wed, 8 Feb 2023 05:12:13 -0800
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>
Subject: [oe][meta-oe][PATCH 1/1] Nodejs: fix buildpaths warning
Date: Wed, 8 Feb 2023 13:11:57 +0000
Message-ID: <20230208131157.2564692-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: w2AqCOgFnewe_l9kiIQIH_i9A4k5m6wH
X-Proofpoint-ORIG-GUID: w2AqCOgFnewe_l9kiIQIH_i9A4k5m6wH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-08_04,2023-02-08_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1011 suspectscore=0
 phishscore=0 bulkscore=0 impostorscore=0 adultscore=0 mlxscore=0
 spamscore=0 mlxlogscore=915 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302080117
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Feb 2023 13:12:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100995

Correct libdir used at configure time to avoid packaging warnings
WARNING: nodejs-18.12.1-r0 do_package_qa: QA Issue:
File /usr/bin/node in package nodejs contains reference to TMPDIR [buildpaths]
File /usr/bin/.debug/node in package nodejs-dbg contains reference to TMPDIR
File /usr/lib64/nodejs/ptest/.debug/cctest in package nodejs-dbg contains reference to TMPDIR [buildpaths]
File /usr/lib64/nodejs/ptest/cctest in package nodejs-ptest contains reference to TMPDIR [buildpaths]
File /usr/include/node/config.gypi in package nodejs-dev contains reference to TMPDIR [buildpaths]

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb
index e96913e56..04a80a6b8 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb
@@ -145,7 +145,7 @@ do_configure () {
                --without-etw \
                --dest-cpu="${@map_nodejs_arch(d.getVar('TARGET_ARCH'), d)}" \
                --dest-os=linux \
-               --libdir=${D}${libdir} \
+               --libdir=${libdir} \
                ${ARCHFLAGS} \
                ${PACKAGECONFIG_CONFARGS}
 }
-- 
2.34.1


