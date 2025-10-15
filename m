Return-Path: <saravanan.kadambathursubramaniyam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97BC3CCD18E
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 06:14:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.9249.1760508868465348159
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 23:14:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Gd7MLOt5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2383617b70=saravanan.kadambathursubramaniyam@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59F4uBNW1095739
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 23:14:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=22B1XSIu8GKxYhQU6vAQ
	Pb5h6i/u1tXuBN7otuLmCBs=; b=Gd7MLOt5GxlNUTLDyqzOPOgCiGp9wUrV9Wre
	N8XgQDSqJh5Gz8Nfg1Cbrjj3QwY08ajLOkTX9J9MsG9cj908nrgLrlpQvyfB+x77
	g2EawYB7Yw/o0S7yTX3G8ICOgioj0KkgzuTf1M6zO0BJLUNskQY7xpdbPd+bZ59C
	ewz6QZimR0JYOkiJ6ajHNw4Y4NctYUOQCWhGCz2tfzoaOt4ksNlBTyY914cOzgpI
	uXuCh1SMPSUhws6ET7WaFaswaeTGhbjGvdHT5mII3++UHwD09He8/llRhtDRq5QJ
	qpkpZgoumAEnsCNB6mefsmu0hPleoX6Nlkb+8/f81yugGXvwrA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49qjh1m8up-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 23:14:27 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Tue, 14 Oct 2025 23:14:27 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Tue, 14 Oct 2025 23:14:26 -0700
From: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][scarthgap][PATCH 1/1] fio: fix CVE-2025-10823
Date: Wed, 15 Oct 2025 11:44:24 +0530
Message-ID: <20251015061424.3560575-1-saravanan.kadambathursubramaniyam@windriver.com>
X-Mailer: git-send-email 2.44.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE1MDA0NSBTYWx0ZWRfX5EZ26OxKtHQQ
 8ampNoArggD++FLP4THUjOgccf804RbjXwOuTPNF+2PVSUK9CQhfWq08ui+yVjpixPQnFKzS2fr
 BSTZSHSGLbuG8/4PFBiYjj91FhDSAbRHe2N5hzpFI+SA5BV7Fz1RvKWJvoe2yo9QOE+VmAnHNru
 VEuHu07ebzMrpvRGPk2wtRDMIw8dUnxKerkj1aLKlebPc1FuqcKzW4X3SQ1DMKHKgp8DVpJgNqW
 vjd8WadD5kKFCUuv6rJ4D3h4cV75mmW13/Ml/zcNetAPa3G78lyG7akoaOrIYQQU4n2ufFA73zh
 MVqwPS9k8ZImz4th8INGT6mZ1teGFo/XbCH19CB8Izu8gIVOiTYle/ODytr504guneiCBQU+qJV
 OoNtGnWsddPezMt+0uLzfFRZ9zv3Lw==
X-Proofpoint-GUID: BY5pR-O7M7MHqWQ6yHoUwt-UszeAw0XC
X-Proofpoint-ORIG-GUID: BY5pR-O7M7MHqWQ6yHoUwt-UszeAw0XC
X-Authority-Analysis: v=2.4 cv=aetsXBot c=1 sm=1 tr=0 ts=68ef3bc4 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=uF_Gu_Z7jh35AFtZZ5UA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510150045
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 06:14:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120688

Reference:
	https://nvd.nist.gov/vuln/detail/CVE-2025-10823
	https://github.com/axboe/fio/issues/1982

Upstream-patch:
	https://github.com/axboe/fio/commit/6a39dfaffdb8a6c2080eec0dc7fb1ee532d54025

Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
---
 .../fio/fio/CVE-2025-10823.patch              | 37 +++++++++++++++++++
 meta-oe/recipes-benchmark/fio/fio_3.36.bb     |  2 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/fio/fio/CVE-2025-10823.patch

diff --git a/meta-oe/recipes-benchmark/fio/fio/CVE-2025-10823.patch b/meta-oe/recipes-benchmark/fio/fio/CVE-2025-10823.patch
new file mode 100644
index 0000000000..f5523f83e4
--- /dev/null
+++ b/meta-oe/recipes-benchmark/fio/fio/CVE-2025-10823.patch
@@ -0,0 +1,37 @@
+From 6a39dfaffdb8a6c2080eec0dc7fb1ee532d54025 Mon Sep 17 00:00:00 2001
+From: Jens Axboe <axboe@kernel.dk>
+Date: Tue, 23 Sep 2025 11:50:46 -0600
+Subject: [PATCH] options: check for NULL input string and fail
+
+Waste of time busy work.
+
+Link: https://github.com/axboe/fio/issues/1982
+
+CVE: CVE-2025-10823
+
+Upstream-Status: Backport
+https://github.com/axboe/fio/commit/6a39dfaffdb8a6c2080eec0dc7fb1ee532d54025
+
+Signed-off-by: Jens Axboe <axboe@kernel.dk>
+Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
+---
+ options.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/options.c b/options.c
+index de935ef..b38441e 100644
+--- a/options.c
++++ b/options.c
+@@ -1535,6 +1535,9 @@ static int str_buffer_pattern_cb(void *data, const char *input)
+ 	struct thread_data *td = cb_data_to_td(data);
+ 	int ret;
+ 
++	if (!input)
++		return 1;
++
+ 	/* FIXME: for now buffer pattern does not support formats */
+ 	ret = parse_and_fill_pattern_alloc(input, strlen(input),
+ 				&td->o.buffer_pattern, NULL, NULL, NULL);
+-- 
+2.44.3
+
diff --git a/meta-oe/recipes-benchmark/fio/fio_3.36.bb b/meta-oe/recipes-benchmark/fio/fio_3.36.bb
index a871ed8fe5..917a6e1456 100644
--- a/meta-oe/recipes-benchmark/fio/fio_3.36.bb
+++ b/meta-oe/recipes-benchmark/fio/fio_3.36.bb
@@ -28,6 +28,8 @@ SRC_URI = "git://git.kernel.dk/fio.git;branch=master"
 
 S = "${WORKDIR}/git"
 
+SRC_URI += "file://CVE-2025-10823.patch"
+
 # avoids build breaks when using no-static-libs.inc
 DISABLE_STATIC = ""
 
-- 
2.44.3


