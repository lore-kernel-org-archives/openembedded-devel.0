Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B05ABCA1009
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 10:02:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.8701.1756893724011627193
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 03:02:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=XclBuSAm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1341063f41=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5837jkL03674026
	for <openembedded-devel@lists.openembedded.org>; Wed, 3 Sep 2025 10:02:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=ISpEAn/SH/8WyIeUULoQ
	l9KY7cDa4ZiS1Z7VugUWQ7I=; b=XclBuSAmwBhHvq5b61qrcCnixzMfGM6lCy1x
	v5UFIp/wzJMOq2nFhDFyWgaXoZhJnh+r+3Xlja0V3v3wanhr1Whaohi2fHfZtADf
	BlwCS8e7CXVbm04dj+ymd6gm28qrAkDCTrQUZ3EVOgTc4pnPoknkwuAV0X8u5S5P
	5ktze3KGbgZG011YwgINJcWeE+UVCtpDjnWrapyIhnLVtYoWAT1YFSCYUyPUs0uL
	w+3SqfHpuBEgz0saO4j6xpJbYnwkql5n2pxgeOsGUL9hHNUhR+A6hLYHbCefaDEg
	b6/XoSaplT9s6LsUWC1ogsSAPm90XqMZ403BBeC7i5Sz5qDAJg==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48ur99ux3e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 10:02:02 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 3 Sep 2025 03:02:03 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 3 Sep 2025 03:02:02 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-networking][kirkstone][PATCH 1/1] tcpreplay: fix CVE-2023-43279
Date: Wed, 3 Sep 2025 15:31:48 +0530
Message-ID: <20250903100148.877618-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=FqYF/3rq c=1 sm=1 tr=0 ts=68b8121a cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=yU_jQ1hFIRIA:10 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=x1p9RcrOnns07AYORbwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: pc7aVw0kJ6E5fGvUOFp9CeEsPe-sjCM0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAzMDA5OSBTYWx0ZWRfX+iJ5Xp2xp3c6
 lZP/VY2+BUQ3ElGiMGYAGBTjmQ4G67qCJR9K6/d8SMvQy2cvcpHEojjp12wJCyK6Z3MKmZCDmlv
 beVXZKzQeFqSHhXnkwHNQ8SGLgKVeXIp0vDwOzn2sETBY2b8e/qO2HS9kD6ZINlgcMGUkrO8rgB
 EXFy5I2yWgpU/k4zgg5U6rTEVSKuLWy0vgbGcFjcGLKk5hY7lSrA0aFZgURPYrv+5U4zqGs3pkE
 IVB1cdJeofoAfGHimhIIoCjxYjHXSs/gB82g1NC0iwgBQmFoD2EOOY0yOa4Iokya3XcSNnR/J/J
 XP4ooIefCBCNS1Xv+fGYAodOY+rhh/uyntbsaoja++m0PMlgqVfwQbFlao1yGw=
X-Proofpoint-ORIG-GUID: pc7aVw0kJ6E5fGvUOFp9CeEsPe-sjCM0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 10:02:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119255

From: Archana Polampalli <archana.polampalli@windriver.com>

Null Pointer Dereference in mask_cidr6 component at cidr.c in Tcpreplay 4.4.4
allows attackers to crash the application via crafted tcprewrite command.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../tcpreplay/tcpreplay/CVE-2023-43279.patch  | 36 +++++++++++++++++++
 .../tcpreplay/tcpreplay_4.4.4.bb              |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2023-43279.patch

diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2023-43279.patch b/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2023-43279.patch
new file mode 100644
index 0000000000..d26700efde
--- /dev/null
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2023-43279.patch
@@ -0,0 +1,36 @@
+From 3164a75f2660a5c3537feff9fd8751346cf5ca57 Mon Sep 17 00:00:00 2001
+From: Gabriel Ganne <gabriel.ganne@gmail.com>
+Date: Sun, 21 Jan 2024 09:16:38 +0100
+Subject: [PATCH] add check for empty cidr
+
+This causes tcprewrite to exit with an error instead of crashing.
+
+Fixes: #824
+
+Upstream-Status: Backport [https://github.com/appneta/tcpreplay/commit/a0b6d847f468217b8fd675f788e6eca74a21a90c]
+
+CVE: CVE-2023-43279
+
+Signed-off-by: Gabriel Ganne <gabriel.ganne@gmail.com>
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ src/common/cidr.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/common/cidr.c b/src/common/cidr.c
+index 687fd04..9afbfec 100644
+--- a/src/common/cidr.c
++++ b/src/common/cidr.c
+@@ -249,6 +249,10 @@ parse_cidr(tcpr_cidr_t **cidrdata, char *cidrin, char *delim)
+     char *network;
+     char *token = NULL;
+
++    if (cidrin == NULL) {
++        errx(-1, "%s", "Unable to parse empty CIDR");
++    }
++
+     mask_cidr6(&cidrin, delim);
+
+     /* first iteration of input using strtok */
+--
+2.25.1
diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
index 3ece4b78c6..6895c5a539 100644
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
@@ -11,6 +11,7 @@ SRC_URI = "https://github.com/appneta/tcpreplay/releases/download/v${PV}/tcprepl
            file://CVE-2023-4256.patch \
            file://CVE-2024-22654-0001.patch \
            file://CVE-2024-22654-0002.patch \
+           file://CVE-2023-43279.patch \
 "
 
 SRC_URI[sha256sum] = "44f18fb6d3470ecaf77a51b901a119dae16da5be4d4140ffbb2785e37ad6d4bf"
-- 
2.40.0


