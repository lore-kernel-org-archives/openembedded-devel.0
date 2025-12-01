Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9FF8D116F1
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 09:00:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17137.1764579619349051761
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Dec 2025 01:00:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=RSOOLObX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4430d93b62=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B18o1Dg2347630
	for <openembedded-devel@lists.openembedded.org>; Mon, 1 Dec 2025 09:00:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=21NPI9rPjzKzk3BChkUL4yzGkZO+IimzgFdSzpmPo1g=; b=RSOOLObXNbkn
	M1VsbtFq2W1Shfe/xyQfXLY4SKIJGl1pntjnScq+3mjmvX/p0En/kBNLg/mjJGqz
	DsJLT1NgTW3O8nM9CEQkU8rUca1CBjy1c627e2pwHExkKiokzAC20pX6ltfixMLo
	LvnPDxifLavrE4kAffPKjJ9Ywxkw7YGQQ9aYE1KxozKgon/UyL9ZS7JgldpmFeCK
	Gyha2eFw9VhV5IANv8uI6ernB2f384K1QqcBsjfyi5o8cuj5WzUOAiGPZhGPGxYV
	myQc121m0TyNFNKYSuv3iHYlDwr++M9DEAacEc14iiW1PHyixK4P7UDmN1Dp8Ibb
	bXUjqROgWA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqqt69kq6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 01 Dec 2025 09:00:18 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 1 Dec 2025 01:00:17 -0800
Received: from pek-lpg-core1.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 1 Dec 2025 01:00:16 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH 3/4] python3-cssselect2: Add it for python3-svglib
Date: Mon, 1 Dec 2025 17:00:11 +0800
Message-ID: <d57d06747318e09f7b7f000351122f18dfb12f00.1764579434.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.44.3
In-Reply-To: <cover.1764579434.git.liezhi.yang@windriver.com>
References: <cover.1764579434.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDA3MSBTYWx0ZWRfX7RqIDZT057QF
 xNu8sENMHwtVqRQZ6eJGzr73Q86oYqD+w/IhAYyALaTtTvXJU7P9avmA/DNRnx41nHRDLe1Yyup
 iLKGefQN3hI/V12uZsKUJb6MKvI0ynaFAZAUPYvEVY2TXo+AWbcXxOZYdIUOnw70sWH7xTsOPX0
 O9Ogc0n207TMuf+F6vqVovfF94XlipqS1LF74AFpVFrE9P6/i3o3fhwDM5Hq/W5YDiQzheLTCf2
 Ud+cGVZlVN+JYWqt0ACakXiLBL1G7y+XSfZUp2tINuQu+C9Or1mjpZl3Evif5vop1Ueqy9kSuMb
 jZhGiLy70cYrMPpFekJbixRJp2y5JsNuz89QkB6QIoJ4loyZyNf2Mx/I0fsJzkBwtPaO72/7uEe
 djvJMhM1/nqbzj9cjsXL0/2s/StOhg==
X-Authority-Analysis: v=2.4 cv=Adq83nXG c=1 sm=1 tr=0 ts=692d5922 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=yz2hTSVKaBVJvNmHRf0A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 3mCZ--hafUXUNoTmpDvZ-tIHKv9n8TZ4
X-Proofpoint-GUID: 3mCZ--hafUXUNoTmpDvZ-tIHKv9n8TZ4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010071
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Dec 2025 09:00:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122199

From: Robert Yang <liezhi.yang@windriver.com>

Cssselect2 is a straightforward implementation of CSS4 Selectors
for markup documents (HTML, XML, etc.) that can be read by ElementTree-like
parsers (including cElementTree, lxml, html5lib, etc.)"

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../python/python3-cssselect2_0.8.0.bb            | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-cssselect2_0.8.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-cssselect2_0.8.0.bb b/meta-python/recipes-devtools/python/python3-cssselect2_0.8.0.bb
new file mode 100644
index 0000000000..20165a098c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cssselect2_0.8.0.bb
@@ -0,0 +1,15 @@
+SUMMARY = "CSS selectors for Python ElementTree."
+DESCRIPTION = "cssselect2 is a straightforward implementation of CSS4 Selectors \
+    for markup documents (HTML, XML, etc.) that can be read by ElementTree-like \
+    parsers (including cElementTree, lxml, html5lib, etc.)"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=aa7228954285c7398bb6711fee73b4ac"
+
+SRC_URI[sha256sum] = "7674ffb954a3b46162392aee2a3a0aedb2e14ecf99fcc28644900f4e6e3e9d3a"
+
+inherit pypi python_setuptools_build_meta
+
+BBCLASSEXTEND = "native nativesdk"
+
+RDEPENDS:${PN} = "python3-tinycss2"
-- 
2.44.3


