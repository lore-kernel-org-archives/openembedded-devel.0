Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4359BCAC5B5
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 10:27:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.50427.1759141648070397576
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Sep 2025 03:27:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Ej+e6T67;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=23676e31a5=divya.chellam@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58T3invY3797487
	for <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 10:27:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=4OKCRkFHvu3hdQNPfP2b
	pcVR0v1h3SipydZIp3eoHjc=; b=Ej+e6T670QyTUCvahG/ZcLguzUwXYgOVCi6P
	228OlgKUfblXDnt38F4Ln4O0Fm+OnjNyzwvqQIsrSrUfEMSGISAIT6m2ufeeGO/w
	LEMqY5gjoc1KEh6tr3vaubzZYMkOxh6RxszCwFvO9D73dh7HGPaOQbT51687F3BX
	gVRYvvvZjvsd6ci8fdMomvK55SWZflDOpk/+fGEqTOO5q9ULwPU0fZ+Vpzp8XCPc
	0lNSkkAZX8xpUs6C1Z0tuZY44VlghTJQZptTqgZBbCjFZL48FzNKHLwGkvnqpDOT
	QDNp1Fn6cRmXHFVkHwH+4zedFWtx1L7fLw6KW9eiGI5cIRwtKg==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49e6w7hste-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 10:27:27 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Mon, 29 Sep 2025 03:27:25 -0700
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][walnascar][PATCH 1/1] libssh: upgrade 0.11.2 -> 0.11.3
Date: Mon, 29 Sep 2025 15:56:56 +0530
Message-ID: <20250929102656.152693-1-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (10.11.224.121) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDEwMSBTYWx0ZWRfX32pkh6aGwTrO
 i3w4s+9Mv8utbDHRPTqvuRX7rAxhqguulbQm877lwRzARLEUlzQsFx2luyd8S1gy1mbxpbWt6V1
 7sgGwcqAgBG82AiYwGH/7zCPrRnUpusslKbQjA03aG6nmIcGb9HAPJNo0ekNNA1i/XxAsNWkZ5C
 a/293SjZXtYb9dRUkRIP2AexlULC0k4YQM6LlNDVQpXKDl639JmYkqjjtErLVDsSxi/f7D9ApsY
 IrKNYRwIE/2y1DWWXo5WVel+DSjp9mu11tH1d5ncOcKKbD2pxrk4+yWXVoXSJmUY3HY1qCmdwry
 5pCUxqF5CByePoHnoupWxDb8Fes2FQ7DsLn/z7/Kbyne7Cu1qU7K+dpvIxy3jilLN3tu6EntrQB
 C3OAEvmjQ1xvBf46MBfxkroKEU0uZg==
X-Authority-Analysis: v=2.4 cv=Lc0xKzfi c=1 sm=1 tr=0 ts=68da5f0f cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=gmxlzscTznEA:10 a=yJojWOMRYYMA:10 a=omOdbC7AAAAA:8 a=pGLkceISAAAA:8
 a=t7CeM3EgAAAA:8 a=nar8ntqeAAAA:8 a=225xbqsVfsR3lOmwoz4A:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=RptMqvEBejqe73AKBt4K:22
X-Proofpoint-ORIG-GUID: bVlYj-Oa3awtXyYiFaptdE9Jh45Tp3Qp
X-Proofpoint-GUID: bVlYj-Oa3awtXyYiFaptdE9Jh45Tp3Qp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_04,2025-09-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2509150000 definitions=main-2509290101
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 10:27:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120012

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 .../libssh/{libssh_0.11.2.bb => libssh_0.11.3.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libssh/{libssh_0.11.2.bb => libssh_0.11.3.bb} (96%)

diff --git a/meta-oe/recipes-support/libssh/libssh_0.11.2.bb b/meta-oe/recipes-support/libssh/libssh_0.11.3.bb
similarity index 96%
rename from meta-oe/recipes-support/libssh/libssh_0.11.2.bb
rename to meta-oe/recipes-support/libssh/libssh_0.11.3.bb
index 5baaa49949..13533082e8 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.11.2.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.11.3.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable
 
 SRC_URI:append:toolchain-clang = " file://0001-CompilerChecks.cmake-drop-Wunused-variable-flag.patch"
 
-SRCREV = "dff6c0821ed54f6fbf5b755af43f54cbb723b1b1"
+SRCREV = "301d0e16dfa8a5cac1cff956b6880ca90eb82864"
 
 S = "${WORKDIR}/git"
 
-- 
2.40.0


