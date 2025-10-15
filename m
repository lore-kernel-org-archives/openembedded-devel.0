Return-Path: <saravanan.kadambathursubramaniyam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70563CCD18E
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 06:07:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.9220.1760508443098140603
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 23:07:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=HHD/z1lt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2383617b70=saravanan.kadambathursubramaniyam@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59F5KDtV1892037
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 06:07:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=fDURtCnbLBs6ARwi/6/U
	gkrxX2ZW4zG6BtToNu+bZbY=; b=HHD/z1ltAZxcZW62aGWNgULhi7C7d3Vhggb5
	DMd935V6J6Z7yXcumayD/yvAJA8TMnRnSdwQRwBzJE1EvjT5Vi4I3S4Oqzm8ZdrQ
	wTUp7Qm9v9SIH+m/+7s2yc5sg4+3SoFETqx31OqNctnDlIWmHDNyL9Ky+8cmvC3T
	o3+USu6vzGYZ1HYf8Kgm6WmRbRayFROCcyuyohzEPMeDsCHIm5UqW9YCEyG8nyzJ
	dylyOnIiY33YMGkEAm8DMs05Ee2b/xG3424zguI/VEgXXBmLTKW/6kY8jfGtRlaj
	JkdvEh9hdnn7Kferj1lad9eSCRyQVa4w34Yv8y7ZJbmOhV1zqw==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49qcewmgwd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 06:07:21 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Tue, 14 Oct 2025 23:07:20 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Tue, 14 Oct 2025 23:07:19 -0700
From: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][master][PATCH 1/1] fio: fix CVE-2025-10823
Date: Wed, 15 Oct 2025 11:37:17 +0530
Message-ID: <20251015060717.3551149-1-saravanan.kadambathursubramaniyam@windriver.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 9jmAMBSHdX4J1n2X0hqPijSVrRbrXAIp
X-Proofpoint-ORIG-GUID: 9jmAMBSHdX4J1n2X0hqPijSVrRbrXAIp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE1MDA0NCBTYWx0ZWRfX+PPtR3vWaQQE
 bDH1isx6JabQQsOf8zbDvUwagVL1F/WTZBNoxuBKTcJA+LfTXsRI7L1hRYdTJL09Ytj44ouAW2n
 hlCDopghXEY/zscg1P1kFJCXD6F2G2d+eK6xGQOaSmLzUPgyx+oN9f4KrY+XCMWY6p4Pz16zgR8
 oX9dyEyijK/3r6CimiiQLmvnUIEdhEjdQYXo1YAikRduJ2r9KgzP0MUFjpG0EImUVbUCchHz9/t
 H9L2KxgnNHCobViAb7exAW4T9By7bZHPwklP3xRzpqMab943zSmlU7a5SIIYxJFBrUFQvHfSBG3
 c41hAus8zNHk5U0PtHIKpK6A+FMGNYvLHKlpAoXG2NzWm6t6uRQJ4fOYv+5Nka9mfob+xatT7tD
 811TfQ3pK8+22XvyfQBOqGLIjKFxlw==
X-Authority-Analysis: v=2.4 cv=M+xA6iws c=1 sm=1 tr=0 ts=68ef3a19 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=WJFcN7_6Vwe0J8X5Sr0A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510150044
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 06:07:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120686

Reference:
	https://nvd.nist.gov/vuln/detail/CVE-2025-10823
	https://github.com/axboe/fio/issues/1982

Upstream-patch:
	https://github.com/axboe/fio/commit/6a39dfaffdb8a6c2080eec0dc7fb1ee532d54025

Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
---
 .../fio/fio/CVE-2025-10823.patch              | 37 +++++++++++++++++++
 meta-oe/recipes-benchmark/fio/fio_3.39.bb     |  2 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/fio/fio/CVE-2025-10823.patch

diff --git a/meta-oe/recipes-benchmark/fio/fio/CVE-2025-10823.patch b/meta-oe/recipes-benchmark/fio/fio/CVE-2025-10823.patch
new file mode 100644
index 0000000000..c5813273c7
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
+index c35878f..562c5bc 100644
+--- a/options.c
++++ b/options.c
+@@ -1616,6 +1616,9 @@ static int str_buffer_pattern_cb(void *data, const char *input)
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
+2.48.1
+
diff --git a/meta-oe/recipes-benchmark/fio/fio_3.39.bb b/meta-oe/recipes-benchmark/fio/fio_3.39.bb
index 345c7f08e7..4a94aadf42 100644
--- a/meta-oe/recipes-benchmark/fio/fio_3.39.bb
+++ b/meta-oe/recipes-benchmark/fio/fio_3.39.bb
@@ -25,6 +25,8 @@ PACKAGECONFIG[numa] = ",--disable-numa,numactl"
 SRC_URI = "git://git.kernel.dk/fio.git;branch=master"
 SRCREV = "a6e474c9e896e4ba1eb40066a03402afb040710a"
 
+SRC_URI += "file://CVE-2025-10823.patch"
+
 UPSTREAM_CHECK_GITTAGREGEX = "fio-(?P<pver>\d+(\.\d+)+)"
 
 
-- 
2.48.1


