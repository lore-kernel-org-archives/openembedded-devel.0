Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D3A0103A99C
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 02:20:49 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13968.1774405241945117625
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2026 19:20:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jsHHIhHM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7544ec598e=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O4Jt9v1856584;
	Tue, 24 Mar 2026 19:20:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=5XWy8ExOm
	2MH1iFoWxQZOJMEVjj4rtT8C3hIg864tr0=; b=jsHHIhHM4DsrVQ/WsU5RS44kw
	ps5+pPGDpvcL2vvVc5BgWr0pMCzzGVuOGOVhHr9o6qu+q1lXhPM2RCjwunM3vWzo
	+6rkTd0KnFYMjNxMoOk1ee1NHeY1yad6SHEZkjGrFd0qrRWlpr11Q3pLS3V1oh6a
	iLqJBr0dwaqAXNBJENTLNd0HW06L+R6IxoSotOgwp0ENW6ZT+3TugmGXRx1n6dyc
	cBtkUsTKkr/lILGjG1TKCtAu6xLACFiH/RuGsE8h55xfnZvf/+ps9JZ1ZvbIzzCn
	GYe94M5cQUFkaRQcdYcf9RJ0DBK9gjkn6YiFNnEzkz1uvcFi5PbmvBpB3MxjA==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1pkyc6xj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 24 Mar 2026 19:20:37 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 24 Mar 2026 19:20:36 -0700
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 24 Mar 2026 19:20:35 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <jinoabraham26@gmail.com>
Subject: [meat-oe][PATCH 1/2] bpftrace: remove ptest subpackage for powerpc64
Date: Wed, 25 Mar 2026 10:20:30 +0800
Message-ID: <20260325022031.2902555-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDAxNSBTYWx0ZWRfX62537warZ+v1
 +HKTCsPy/17ooM/EHjNpfz0URWS8FoFWKUuxYeaAjYycpX3QFfNy6ner3YdfMi0nuhzo8G6i9vu
 DNsU4dyttf20icHd2QiR5qVpsjZ4g+pS8om58AW8ZQ/QLVuDY80I8foU4UVU+qY+W7DnshXTyfI
 i0D5TlFHxzBdwfzOzvrDeICseE63wt7DgEPG4P0NrVuzJ6T2CbXHA0d3l/L6hsLsmkPNlo0C8bW
 JwsQ/F9k46ftituaYCGyJQHXrLGay52eNLR1CSq1T4b8EXlG/whq4XkI2Zoet5sIw5/obbpVxC+
 W9wqgzqj4kElsHES/qLvTl8wnsGJA9fSderkKo9JmVX9pMWZ4AKT+iIa+7eupCQXzy7kiIKycX7
 pOS/0DHvPFjs25jVYIp/D1vDRFcI9lSRpQn+Vmf+KnaRqGzMvccW7ouVzaiWY0LG7oT1FYbUiUs
 mABDi9oqH6Qsvrx9rqw==
X-Proofpoint-ORIG-GUID: OAgwydIchDI8EvJSMwwvLD26ou2rnd0H
X-Authority-Analysis: v=2.4 cv=Scr6t/Ru c=1 sm=1 tr=0 ts=69c34675 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8 a=om9Yg2D3EL44AZhh5WAA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: OAgwydIchDI8EvJSMwwvLD26ou2rnd0H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250015
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 02:20:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125598

From: Kai Kang <kai.kang@windriver.com>

bpftrace-ptest requires bpftool which is not compatible with powerpc64.
So remove sub-package bpftrace-ptest for powerpc64 & powerpc64le.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../recipes-devtools/bpftrace/bpftrace_0.24.1.bb         | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.24.1.bb b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.24.1.bb
index 33de2f4054..37e088590f 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.24.1.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.24.1.bb
@@ -48,6 +48,12 @@ do_install_ptest() {
     done
 }
 
+do_install_ptest:powerpc64() {
+}
+
+do_install_ptest:powerpc64le() {
+}
+
 EXTRA_OECMAKE = " \
     -DCMAKE_ENABLE_EXPORTS=1 \
     -DCMAKE_BUILD_TYPE=Release \
@@ -56,6 +62,9 @@ EXTRA_OECMAKE = " \
     -DBISON_FLAGS='--file-prefix-map=${WORKDIR}=' \
 "
 
+PACKAGES:remove:powerpc64 = "${PN}-ptest"
+PACKAGES:remove:powerpc64le = "${PN}-ptest"
+
 RDEPENDS:${PN}-ptest += "bash bpftool python3"
 
 COMPATIBLE_HOST = "(x86_64.*|aarch64.*|powerpc64.*|riscv64.*)-linux"
-- 
2.34.1


