Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14F2FCAC5A8
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 07:16:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.7999.1758179752849000546
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Sep 2025 00:15:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=H/Ui0NZh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=13563ce15f=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58I5cBEB2526535
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 07:15:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=+tUP6Mgk11ZpykxNddll
	oXj8SKpekeyJUR9Y14iqwbw=; b=H/Ui0NZhzzxj+/gVXtCB53IBOdynNpDe+AXl
	EMU1bjyj4LZqI5yTFOahUZMiySLSraI1sHqBNi9by7NBXJMEXrgvuVx895u9F+t5
	R4ILReA2BU75u17r1ZC+P5wyhFxGusr99JJyNsQSPtKVLc8lMeahjEfopsv8uWTd
	kPx+ZKkTX8zPUxB4oVieDhxATgn6dhhpC70u+aHuZzK+RGbu6ghNXqvkbwf+B4bC
	t8rgacTIySIgxDSpAlIMBD5rwtScB5qwrUgxY8Elt1udr4yHp/EVWMNHXX7QltHd
	wi/uxybpAHCWN+JkWWTAuUgCAk1UQ00UMkpfhboXzWQhT6A+dA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 497fwssrrn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 07:15:51 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Thu, 18 Sep 2025 00:15:50 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Thu, 18 Sep 2025 00:15:49 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH 1/4] python3-pyzmq: set cmake build dir to support reproducible
Date: Thu, 18 Sep 2025 15:15:45 +0800
Message-ID: <20250918071548.3934769-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: mBTg7BL3DCemo0SHD_cI8rqK1eCJnNfs
X-Proofpoint-ORIG-GUID: mBTg7BL3DCemo0SHD_cI8rqK1eCJnNfs
X-Authority-Analysis: v=2.4 cv=C5zpyRP+ c=1 sm=1 tr=0 ts=68cbb1a7 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=xRqmWJOQR1Mlw19Ib3UA:9 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE4MDA2NSBTYWx0ZWRfX9a38beOBuqJY
 hKdCac8e7OGdmahxlFlg+92esyrL+17a07/YZoMEbVlsztuzP8l1zHl9fSMs1aQ+wVqg63vQG5b
 sDaa2vEQJByLmbWPA6vM3AR7mT8ROSBTi2eRQP7FwqzNf7ppSKPJvkNxXDRVDSZhpEuGsir9LRX
 ho8CUr2yYadeON9l4IBln+16MsEmKj7qNktEFDCT2NT5tWkoZCS4akDnYyMgXk8DboSA6zUWjE0
 0J7dnuAs0BPtlGSfGRcHBNwyHUKMGY/BgCr9oDj7M4rFuuZi8qzctHTCStjQm0Vgmlrk3Jd/kj8
 AMF1Dp6QKK37AYpYrDbsRtJ2axE2iM4usg3FZAruCAHKya8O7Yiq9gTGtBExaA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-18_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0
 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 07:16:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119530

According to [1], set cmake build dir, otherwise a unique temporary directory
is used which caused generated library not be reproducible
...
    "build-dir": {
      "type": "string",
      "default": "",
      "description": "The CMake build directory. Defaults to a unique temporary directory."
    },
...

Note: To support reproducible, it also requires oe-core commit [2] to be merged

[1] https://github.com/scikit-build/scikit-build-core/blob/main/src/scikit_build_core/resources/scikit-build.schema.json#L487C6-L487C16
[2] https://lists.openembedded.org/g/openembedded-core/message/223604?p=%2C%2C%2C20%2C0%2C0%2C0%3A%3ACreated%2C%2C%2C20%2C2%2C0%2C115291386%2Cd%253D3&d=3

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-python/recipes-devtools/python/python3-pyzmq_27.0.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-pyzmq_27.0.2.bb b/meta-python/recipes-devtools/python/python3-pyzmq_27.0.2.bb
index 6607b7c34d..121ca322a0 100644
--- a/meta-python/recipes-devtools/python/python3-pyzmq_27.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzmq_27.0.2.bb
@@ -23,6 +23,7 @@ PEP517_BUILD_OPTS = "--skip-dependency-check \
                      -Ccmake.define.CMAKE_FIND_ROOT_PATH_MODE_INCLUDE=ONLY \
                      -Ccmake.define.CMAKE_FIND_ROOT_PATH="${STAGING_DIR_NATIVE}" \
                      -Ccmake.build-type="RelWithDebInfo" \
+                     -Cbuild-dir="${B}" \
 "
 
 SRC_URI:append = " \
-- 
2.34.1


