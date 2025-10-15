Return-Path: <saravanan.kadambathursubramaniyam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA792CCD18E
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 06:30:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.9480.1760509799312378819
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 23:29:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Pht3gDJs;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2383617b70=saravanan.kadambathursubramaniyam@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59F5wHVs1952958
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 06:29:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=RUmls5t29vcZOVWbT2Pk
	xKGBw7gZFA86K0YGy7eN4hQ=; b=Pht3gDJsbzx+NH5ie+YBBs4qSRdLUYAKVmTH
	MlFgJ/+0UX4uLtLSy5ThCS2Ady8nEk+NFROZBqr2GHxooEvfV1BNYuylxJUgJSzM
	MQ0+b3Pulci6PsgT6je8mCShiqdPv/jh6hStulyWrTmJmFb+I5i7Ho13hJ34jNEm
	VF+Xnl0gt2fqnNLgaC3Ea9PbzcSH4UP9wbAG2eHUAfCQDRdpJk6ZDCTq+R9oKVEQ
	gvNUlmXQrh/4n/lfPV3CtVrMx7WZ90XBt5c+gTaUrc1C3L06DShC9R7r+ERP73Q9
	Nqr4HTlePYYb+LMdsRCFdQEAII6ZAysNnfA1gzNqwNVJ005v2Q==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49qcewmhpb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 06:29:58 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Tue, 14 Oct 2025 23:29:56 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Tue, 14 Oct 2025 23:29:55 -0700
From: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][Kirkstone][PATCH 1/1] fix CVE-2025-10823
Date: Wed, 15 Oct 2025 11:59:54 +0530
Message-ID: <20251015062954.3576297-1-saravanan.kadambathursubramaniyam@windriver.com>
X-Mailer: git-send-email 2.35.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: BWDCkEY4EpyqoLbBaXC8ECQa-7FOfcKB
X-Proofpoint-ORIG-GUID: BWDCkEY4EpyqoLbBaXC8ECQa-7FOfcKB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE1MDA0NyBTYWx0ZWRfX0yXAD76vYgrK
 oSB3aaIMLVlTqsX9pXH1Y5fcis1i9Zv/rVvCrOci+oPwY+B3izzzg2tbKn+mZ2MNOUzCxOZWuby
 1W8NxmOJb9WBEu85XoC3K3xO/VfbaI72NvhmGh5W0fGh+9y1fr5ZMfln72B5RE1V+DlMK2J2NtH
 lybpfgCW4yC/dEc2D/5KVqDblcZRiCg2MGhhSdjQSOONn1I3Z8MaXQgb5rniyk3dOdEhtl2t914
 pBjaSBHxmCL3udw6mMBesuuBstqXHU6QywDFip61ykTW2zDhxHb32lwBqMwESu+h5dD71qFHjUE
 +ZW9FnJmAmC+ZvrW8+nFiVvqvG6L0rT+GBwF7YYFEv2lPXfasCEzwohi3Yz1mS0oTfem4KZncpm
 oAK3I3UuImc8w4Fb2UpZQkuWakOM9w==
X-Authority-Analysis: v=2.4 cv=M+xA6iws c=1 sm=1 tr=0 ts=68ef3f66 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=TMfnrczGkKk6NYCjjYcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510150047
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 06:30:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120689

Reference:
	https://nvd.nist.gov/vuln/detail/CVE-2025-10823
	https://github.com/axboe/fio/issues/1982

Upstream-patch:
	https://github.com/axboe/fio/commit/6a39dfaffdb8a6c2080eec0dc7fb1ee532d54025

Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
---
 .../fio/fio/CVE-2025-10823.patch              | 37 +++++++++++++++++++
 meta-oe/recipes-benchmark/fio/fio_3.30.bb     |  2 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/fio/fio/CVE-2025-10823.patch

diff --git a/meta-oe/recipes-benchmark/fio/fio/CVE-2025-10823.patch b/meta-oe/recipes-benchmark/fio/fio/CVE-2025-10823.patch
new file mode 100644
index 0000000000..fc6b290a80
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
+index e06d9b66..533d7145 100644
+--- a/options.c
++++ b/options.c
+@@ -1487,6 +1487,9 @@ static int str_buffer_pattern_cb(void *data, const char *input)
+ 	struct thread_data *td = cb_data_to_td(data);
+ 	int ret;
+ 
++	if (!input)
++		return 1;
++
+ 	/* FIXME: for now buffer pattern does not support formats */
+ 	ret = parse_and_fill_pattern(input, strlen(input), td->o.buffer_pattern,
+ 				     MAX_PATTERN_SIZE, NULL, NULL, NULL);
+-- 
+2.35.5
+
diff --git a/meta-oe/recipes-benchmark/fio/fio_3.30.bb b/meta-oe/recipes-benchmark/fio/fio_3.30.bb
index f97a1b899d..62b21339d0 100644
--- a/meta-oe/recipes-benchmark/fio/fio_3.30.bb
+++ b/meta-oe/recipes-benchmark/fio/fio_3.30.bb
@@ -26,6 +26,8 @@ SRCREV = "a3e48f483db27d20e02cbd81e3a8f18c6c5c50f5"
 SRC_URI = "git://git.kernel.dk/fio.git;branch=master \
 "
 
+SRC_URI += "file://CVE-2025-10823.patch"
+
 S = "${WORKDIR}/git"
 
 # avoids build breaks when using no-static-libs.inc
-- 
2.35.5


