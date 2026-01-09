Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A7A3D232ED
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 08:08:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5985.1767946122897440601
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Jan 2026 00:08:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Lv67dwhL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5469f735bb=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6096j3kV1146946
	for <openembedded-devel@lists.openembedded.org>; Fri, 9 Jan 2026 08:08:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=gyAxus78f3tPrmKmLEUj
	lml1CRCw0bXVOSvAkLBzaog=; b=Lv67dwhLtvDdA0dZ1jU83u7Tm/PKT3OLLci/
	/LpH4AEqQG7KFBNrV+EGmIGNZopJ0EphfoReRvuX9LkQ++4XHR0KqYxfXULsHSW3
	0RrRaA2b6IIzUyiOd60OsW16grAplzCN+kRuaa7bxn61OfZ37ZNj9kUAGXX4ky0j
	hy3IkOIxNgovVGajDCSAKxyGVYqTDGKyGsmqSchAfY3yybqfHyZYdkPYvt+Xs2sM
	owWtp8ANlMH0b/hSdIgT/t2awT52K/OpL7y7cuUGXT8kK/a3vavxc/fyuNe+Ue1y
	irBmElatCTf/bJ69Q+c8ktnTzZq4HMKMLr4YX4qi4nnzTfcTyA==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4beravepbn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 08:08:41 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Fri, 9 Jan 2026 00:08:40 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Fri, 9 Jan 2026 00:08:40 -0800
From: <jiaying.song.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-aiohttp: upgrade 3.13.2 -> 3.13.3
Date: Fri, 9 Jan 2026 16:08:39 +0800
Message-ID: <20260109080839.2227339-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA1NiBTYWx0ZWRfX/XezaM4d6jYA
 OZBYVvsV3hvXQMw1BzGRpLyGT+/TFgYyY0GcSIbf8hdR+5GcThHEXxKrkT1OR/VfDtSMysHPOgo
 Sy/MjUZMUqUxk19H0KuWQW1xUVsjnK+R0pdHJDQ0S8cX6HVuu8eU1EoGIXCgdJVO1MJYi5DRuC6
 Nf2RUcaRiZ5YTmgYQ1CVyTvqUJdHe0NM8C+cSrNiNu5Q4ZBMpFo0A+YFJuwIH7gPIZiiC8D2Kef
 Vhysit5z4KY7mMzBS5BQUSrT+kbfW3mxUGdvGePFjwifDSvHcigNodeQbYS+H2VbZYKq9Pc9zSg
 pPICzuq9RgQg0ldfWCOEwSxCEKYmvnXekUsmkMXaDgvmq0sjr1XpTWImXSZkLWd0CYDHkE+pBH3
 isZbsScwo47zqPioUXDW5JhEEmFKPsN1anzdl/6mxUKrKRbydcaB9veTWiu3+8nof3mZWcFsngH
 fSclfcYVbamQct3eQUA==
X-Proofpoint-GUID: xuwVl44QZPoj0qn2w8CnqEE5LIb-11SL
X-Proofpoint-ORIG-GUID: xuwVl44QZPoj0qn2w8CnqEE5LIb-11SL
X-Authority-Analysis: v=2.4 cv=PZjyRyhd c=1 sm=1 tr=0 ts=6960b789 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=V1LfHgqHAAAA:8 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=C6Ak7O3ccKA5C-KzILkA:9 a=J8ZlggKA02cA:10
 a=CJpS4NIzfxg6RkAR5Huo:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090056
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 08:08:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123278

From: Jiaying Song <jiaying.song.cn@windriver.com>

Changelog:https://docs.aiohttp.org/en/stable/changes.html

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 .../{python3-aiohttp_3.13.2.bb => python3-aiohttp_3.13.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohttp_3.13.2.bb => python3-aiohttp_3.13.3.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.2.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.3.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-aiohttp_3.13.2.bb
rename to meta-python/recipes-devtools/python/python3-aiohttp_3.13.3.bb
index df5d674a3d..00758a7546 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.2.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.3.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/aiohttp"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=748073912af33aa59430d3702aa32d41"
 
-SRC_URI[sha256sum] = "40176a52c186aefef6eb3cad2cdd30cd06e3afbe88fe8ab2af9c0b90f228daca"
+SRC_URI[sha256sum] = "a949eee43d3782f2daae4f4a2819b2cb9b0c5d3b7f7a927067cc84dafdbb9f88"
 
 CVE_PRODUCT = "aiohttp"
 
-- 
2.34.1


