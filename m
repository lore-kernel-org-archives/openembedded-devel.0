Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3C7CC369C2
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 15:24:45 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.589.1745508284438956632
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Apr 2025 08:24:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6209e62087=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O5xkEj006323
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Apr 2025 08:24:44 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 466jhd2ga5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Apr 2025 08:24:43 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 24 Apr 2025 08:24:43 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 24 Apr 2025 08:24:41 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][scarthgap][PATCH  1/1] tftpy: fix CVE-2023-46566
Date: Thu, 24 Apr 2025 15:24:40 +0000
Message-ID: <20250424152440.2427997-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=ZNDXmW7b c=1 sm=1 tr=0 ts=680a57bb cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=AUd_NHdVAAAA:8 a=NeKOnoxPV5cGKiNFdNkA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: OtQ-cVt1VrJIXP71mwuXIKL990p9f8vt
X-Proofpoint-GUID: OtQ-cVt1VrJIXP71mwuXIKL990p9f8vt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDEwNSBTYWx0ZWRfX5FZCnrnG9Tiu TkutdoMcoJxFW3k52FG0IFitAapIy3ITUFy8uhiYtS0Yco/nV4JW8mASueH9hfRkFaxKS94DBMW 2tyabyj3vzHxflHE1qcvHqrsHJGsmIHUO1zXvDYkPMWaNW5EocSOvn3ceAeArHC0sH1M5iY5k8n
 lEHwB2jf6gBea+O43SgWqZySoM1uJl4QkOMi5DrWfjLTXNj/MBDu2uHxqfyJ9ZwD+RytwCdlR4N CtxL90+3vieTpHygMOCiFeFyXFMW6GTDmsEvkO88pvIUA0TjyUs21Pif/L7f4920Uvbq3xHxX98 7g8ETSV114FG1d6DiJ/oQBstoCO6dCZGwHrb6H/P2obFMWWrO5Y7sMDfFA8bwkXhbfPJL/0tAUE
 gCCt05v6/Z12/6TSrpGmZQD+W3bfoagwZUS1xVVJJ3veY/8tuqepiWdt/voPPYuo2bNEWZDQ
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_06,2025-04-24_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 spamscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504240105
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Apr 2025 15:24:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117095

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


