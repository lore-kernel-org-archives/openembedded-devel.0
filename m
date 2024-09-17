Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E615C36016
	for <webhook@archiver.kernel.org>; Tue, 17 Sep 2024 11:27:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.18698.1726572446242991774
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Sep 2024 04:27:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=99907f6d70=yogita.urade@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48H5AuWG028338
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Sep 2024 11:27:25 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41n1f9au23-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Sep 2024 11:27:25 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 17 Sep 2024 04:27:22 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] frr: fix CVE-2024-44070
Date: Tue, 17 Sep 2024 11:27:02 +0000
Message-ID: <20240917112702.3473852-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: skRoe-trUN580FtohyAH4T28wINkMvgB
X-Authority-Analysis: v=2.4 cv=afUzngot c=1 sm=1 tr=0 ts=66e9679d cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=EaEq8P2WXUwA:10 a=t7CeM3EgAAAA:8 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=87jn28RfAAAA:8 a=vggBfdFIAAAA:8
 a=7sod6t7A3auyTG_2j0oA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=aVDrfO6s1PESLM1EhDzk:22
X-Proofpoint-GUID: skRoe-trUN580FtohyAH4T28wINkMvgB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-17_02,2024-09-16_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 mlxscore=0 clxscore=1011
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409170081
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Sep 2024 11:27:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112343

From: Divya Chellam <divya.chellam@windriver.com>

An issue was discovered in FRRouting (FRR) through 10.1.
bgp_attr_encap in bgpd/bgp_attr.c does not check the actual
remaining stream length before taking the TLV value.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-44070

Upstream patch:
https://github.com/FRRouting/frr/commit/0998b38e4d61179441f90dd7e7fd6a3a8b7bd8c5

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../frr/frr/CVE-2024-44070.patch              | 69 +++++++++++++++++++
 .../recipes-protocols/frr/frr_8.2.2.bb        |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2024-44070.patch

diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2024-44070.patch b/meta-networking/recipes-protocols/frr/frr/CVE-2024-44070.patch
new file mode 100644
index 000000000..e58df44cc
--- /dev/null
+++ b/meta-networking/recipes-protocols/frr/frr/CVE-2024-44070.patch
@@ -0,0 +1,69 @@
+From 0998b38e4d61179441f90dd7e7fd6a3a8b7bd8c5 Mon Sep 17 00:00:00 2001
+From: Donatas Abraitis <donatas@opensourcerouting.org>
+Date: Wed, 31 Jul 2024 05:56:14 +0000
+Subject: [PATCH] bgpd: Check the actual remaining stream length before taking
+ TLV value ```
+
+    0 0xb50b9f898028 in __sanitizer_print_stack_trace (/home/
+ubuntu/frr-public/frr_public_private-libfuzzer/bgpd/.libs/
+bgpd+0x368028) (BuildId: 3292703ed7958b20076550c967f879db8dc27ca7)
+    1 0xb50b9f7ed8e4 in fuzzer::PrintStackTrace() (/home/ubuntu/
+frr-public/frr_public_private-libfuzzer/bgpd/.libs/bgpd+0x2bd8e4)
+(BuildId: 3292703ed7958b20076550c967f879db8dc27ca7)
+    2 0xb50b9f7d4d9c in fuzzer::Fuzzer::CrashCallback() (/home/
+ubuntu/frr-public/frr_public_private-libfuzzer/bgpd/.libs/
+bgpd+0x2a4d9c) (BuildId: 3292703ed7958b20076550c967f879db8dc27ca7)
+    3 0xe0d12d7469cc  (linux-vdso.so.1+0x9cc) (BuildId:
+1a77697e9d723fe22246cfd7641b140c427b7e11)
+    4 0xe0d12c88f1fc in __pthread_kill_implementation nptl/
+pthread_kill.c:43:17
+    5 0xe0d12c84a678 in gsignal signal/../sysdeps/posix/raise.c:26:13
+    6 0xe0d12c83712c in abort stdlib/abort.c:79:7
+    7 0xe0d12d214724 in _zlog_assert_failed /home/ubuntu/frr-public/
+frr_public_private-libfuzzer/lib/zlog.c:789:2
+    8 0xe0d12d1285e4 in stream_get /home/ubuntu/frr-public/
+frr_public_private-libfuzzer/lib/stream.c:324:3
+    9 0xb50b9f8e47c4 in bgp_attr_encap /home/ubuntu/frr-public/
+frr_public_private-libfuzzer/bgpd/bgp_attr.c:2758:3
+    10 0xb50b9f8dcd38 in bgp_attr_parse /home/ubuntu/frr-public/
+frr_public_private-libfuzzer/bgpd/bgp_attr.c:3783:10
+    11 0xb50b9faf74b4 in bgp_update_receive /home/ubuntu/frr-public/
+frr_public_private-libfuzzer/bgpd/bgp_packet.c:2383:20
+    12 0xb50b9faf1dcc in bgp_process_packet /home/ubuntu/frr-public/
+frr_public_private-libfuzzer/bgpd/bgp_packet.c:4075:11
+    13 0xb50b9f8c90d0 in LLVMFuzzerTestOneInput /home/ubuntu/frr-public/
+frr_public_private-libfuzzer/bgpd/bgp_main.c:582:3
+```
+
+Reported-by: Iggy Frankovic <iggyfran@amazon.com>
+Signed-off-by: Donatas Abraitis <donatas@opensourcerouting.org>
+
+CVE: CVE-2024-44070
+Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/0998b38e4d61179441f90dd7e7fd6a3a8b7bd8c5]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ bgpd/bgp_attr.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/bgpd/bgp_attr.c b/bgpd/bgp_attr.c
+index 1e08a218e..ef45d5c46 100644
+--- a/bgpd/bgp_attr.c
++++ b/bgpd/bgp_attr.c
+@@ -2475,6 +2475,14 @@ static int bgp_attr_encap(struct bgp_attr_parser_args *args)
+						  args->total);
+		}
+
++		if (STREAM_READABLE(BGP_INPUT(peer)) < sublength) {
++			zlog_err("Tunnel Encap attribute sub-tlv length %d exceeds remaining stream length %zu",
++				 sublength, STREAM_READABLE(BGP_INPUT(peer)));
++			return bgp_attr_malformed(args,
++						  BGP_NOTIFY_UPDATE_OPT_ATTR_ERR,
++						  args->total);
++		}
++
+		/* alloc and copy sub-tlv */
+		/* TBD make sure these are freed when attributes are released */
+		tlv = XCALLOC(MTYPE_ENCAP_TLV,
+--
+2.40.0
diff --git a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb b/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
index 03b106131..0823a7bf1 100644
--- a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
+++ b/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
@@ -28,6 +28,7 @@ SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/8.2 \
            file://CVE-2023-47234.patch \
            file://CVE-2023-47235.patch \
            file://frr.pam \
+           file://CVE-2024-44070.patch\
 	      "
 
 SRCREV = "79188bf710e92acf42fb5b9b0a2e9593a5ee9b05"
-- 
2.40.0


