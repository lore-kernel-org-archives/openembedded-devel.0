Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A1BFC5AD49
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 15:51:37 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.53263.1748879492042491135
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Jun 2025 08:51:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=82488074cc=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5527ZWYY031622
	for <openembedded-devel@lists.openembedded.org>; Mon, 2 Jun 2025 08:51:31 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47019m1vhh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 02 Jun 2025 08:51:31 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 2 Jun 2025 08:51:07 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 2 Jun 2025 08:51:06 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][scarthgap][PATCH  1/2] tftpy: fix CVE-2023-46566
Date: Mon, 2 Jun 2025 21:21:25 +0530
Message-ID: <20250602155126.1197444-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: _TTLsOs2vv7OKRiMrazmkR7u1vZWrkKQ
X-Authority-Analysis: v=2.4 cv=SpqQ6OO0 c=1 sm=1 tr=0 ts=683dc883 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=AUd_NHdVAAAA:8 a=NeKOnoxPV5cGKiNFdNkA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: _TTLsOs2vv7OKRiMrazmkR7u1vZWrkKQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAyMDEyOSBTYWx0ZWRfX2jHHDVH0xW5Y i1yHFDNoP3FDQvs8ZkU7W7GnNHVBYMxiJMzCvDKZKL6B00zfGCaqPCinDDY8pF7lb8yiC2W2YRv CSBQvTUY2i4fb7tKRCTijBi10jdjaCD4IEWbGC8YvmbSW/0bgtkk7DAjcRXpeehR0r805/6iS43
 YHcC4fPGwA20yQG/YX1L7F2AVBnVvkFUyA4D+aLhpHrqsXzcvV3VkfL/wk0iEw2LRjDlZVVpa+0 YrqZXK5902GYKWibAiA/MIZ1WjA2yj6rY/VWIzBJ9OqBzodRW1jEgeugwerUC5ryWmDkkhdrcp4 2bFyKCUv5vKKbmbxUSooQpHnkQXHL621JS+23Sbosf82Q6+CytSm3XFb6onyvkUFj5c/i/sl46K
 vWKlQ2+hKBlIc+HkX1nnzK5k08UaZmuMtH9F6gSRAcVjf8U6kuIrpWdJldXWfl5C3x7i79JG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_06,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2506020129
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Jun 2025 15:51:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117712

From: Archana Polampalli <archana.polampalli@windriver.com>

Buffer Overflow vulnerability in msoulier tftpy commit 467017b844bf6e31745138a30e2509145b0c529c
allows a remote attacker to cause a denial of service via the parse function in the TftpPacketFactory class.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../python/tftpy/CVE-2023-46566.patch         | 26 +++++++++++++++++++
 .../recipes-devtools/python/tftpy_0.8.2.bb    |  2 ++
 2 files changed, 28 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/tftpy/CVE-2023-46566.patch

diff --git a/meta-python/recipes-devtools/python/tftpy/CVE-2023-46566.patch b/meta-python/recipes-devtools/python/tftpy/CVE-2023-46566.patch
new file mode 100644
index 0000000000..0131dedb1c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/tftpy/CVE-2023-46566.patch
@@ -0,0 +1,26 @@
+From 5b4dcbe1c8fb178e4d31b9a9e63e603b73e8fb2f Mon Sep 17 00:00:00 2001
+From: Dave Wapstra <dwapstra@cisco.com>
+Date: Wed, 3 Jul 2024 14:32:58 +1200
+Subject: [PATCH] Add packet size check
+
+CVE: CVE-2023-46566
+
+Upstream-Status: Backport [https://github.com/msoulier/tftpy/commit/5b4dcbe1c8fb178e4d31b9a9e63e603b73e8fb2f]
+---
+ tftpy/TftpPacketFactory.py | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tftpy/TftpPacketFactory.py b/tftpy/TftpPacketFactory.py
+index 41f39a9..a8c9cd0 100644
+--- a/tftpy/TftpPacketFactory.py
++++ b/tftpy/TftpPacketFactory.py
+@@ -29,6 +29,7 @@ class TftpPacketFactory(object):
+         """This method is used to parse an existing datagram into its
+         corresponding TftpPacket object. The buffer is the raw bytes off of
+         the network."""
++        tftpassert(len(buffer) > 2, 'Invalid packet size')
+         log.debug("parsing a %d byte packet" % len(buffer))
+         (opcode,) = struct.unpack(str("!H"), buffer[:2])
+         log.debug("opcode is %d" % opcode)
+--
+2.40.0
diff --git a/meta-python/recipes-devtools/python/tftpy_0.8.2.bb b/meta-python/recipes-devtools/python/tftpy_0.8.2.bb
index c1b3234f72..c169916845 100644
--- a/meta-python/recipes-devtools/python/tftpy_0.8.2.bb
+++ b/meta-python/recipes-devtools/python/tftpy_0.8.2.bb
@@ -11,3 +11,5 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=22770e72ae03c61f5bcc4e333b61368d"
 SRC_URI[sha256sum] = "e1d1a680efd88eba176b351175844253067392a9b0f8b81588e3ff2b9e7bbb5b"
 
 inherit pypi setuptools3
+
+SRC_URI += "file://CVE-2023-46566.patch"
-- 
2.40.0


