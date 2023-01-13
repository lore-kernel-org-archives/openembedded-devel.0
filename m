Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EAA4C54EBD
	for <webhook@archiver.kernel.org>; Fri, 13 Jan 2023 08:39:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.81617.1673599137826580965
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Jan 2023 00:38:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=gqljMLqB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0377797581=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30D8PQIT006397;
	Fri, 13 Jan 2023 00:38:56 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-type; s=PPS06212021;
 bh=2RB3KoGImmJK5Igoilg8EvX9f7CxOinZ4y/JOV7DHLU=;
 b=gqljMLqB6f9Nu51YQKUoeQ1VOLlH3XmbDwtSym/30xz2DIEUM2rBFfi7BQdz59WBAYJB
 AdKJr3Ez769+1JUJYF4H/bLqJt+1zgo+7zkD95lAqJwIoN6kOons5rGZ1kJZWR882CEE
 yL4OHQ7p9ZqtB5AuAqww8Fw8YVQEVUUH+hBb4HFZKgfXZFWliARngE984NIoG0NooJvF
 BJY+wFq9OxSyz2nurBoBlfF0XIQOwDOnfwNTKOh9wasRiSmlsDFsG2KPbeRSsZhNvKmK
 3DN7sFxTs4kxTkT9G29gQ2xNW52D5oIpxD1n4dlgfyaF/MNXStB5T6Di+KOBvrnpuYe/ CQ== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n1k5tje0e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 13 Jan 2023 00:38:56 -0800
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 13 Jan 2023 00:38:55 -0800
Received: from pek-lpg-core1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Fri, 13 Jan 2023 00:38:54 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <akuster808@gmail.com>, <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] tftpy: Add it for python tftp server and client
Date: Fri, 13 Jan 2023 16:48:56 +0800
Message-ID: <20230113084856.37771-1-liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: aCdgh0suljFnL0pneDMSfW_ez7Coj7qi
X-Proofpoint-ORIG-GUID: aCdgh0suljFnL0pneDMSfW_ez7Coj7qi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-13_03,2023-01-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 mlxscore=0 clxscore=1011 adultscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301130060
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Jan 2023 08:39:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100561

Tftpy is a TFTP library for the Python programming language. It includes client
and server classes, with sample implementations. Hooks are included for easy
inclusion in a UI for populating progress indicators. It supports RFCs 1350,
2347, 2348 and the tsize option from RFC 2349.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-python/recipes-devtools/python/tftpy_0.8.2.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/tftpy_0.8.2.bb

diff --git a/meta-python/recipes-devtools/python/tftpy_0.8.2.bb b/meta-python/recipes-devtools/python/tftpy_0.8.2.bb
new file mode 100644
index 000000000..c1b3234f7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/tftpy_0.8.2.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Tftpy is a TFTP library for the Python programming language. It includes client and server classes, with sample implementations."
+DESCRIPTION = "Tftpy is a TFTP library for the Python programming language. It \
+includes client and server classes, with sample implementations. Hooks are \
+included for easy inclusion in a UI for populating progress indicators. It \
+supports RFCs 1350, 2347, 2348 and the tsize option from RFC 2349."
+
+HOMEPAGE = "https://github.com/msoulier/tftpy"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=22770e72ae03c61f5bcc4e333b61368d"
+
+SRC_URI[sha256sum] = "e1d1a680efd88eba176b351175844253067392a9b0f8b81588e3ff2b9e7bbb5b"
+
+inherit pypi setuptools3
-- 
2.17.1


