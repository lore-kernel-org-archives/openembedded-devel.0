Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02857C27C79
	for <webhook@archiver.kernel.org>; Tue, 18 Jun 2024 01:25:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.75594.1718673907572339116
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jun 2024 18:25:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6899ef744a=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45HN0FeH026948
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jun 2024 01:25:06 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ys1x6jc5c-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jun 2024 01:25:06 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 17 Jun 2024 18:25:03 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Mon, 17 Jun 2024 18:25:02 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [scarthgap][meta-networking][PATCH] daq: fix incompatible pointer type error
Date: Tue, 18 Jun 2024 09:25:02 +0800
Message-ID: <20240618012502.1871197-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: OIyIbHq5RZ1U690kdahm7XCNackEXbSU
X-Proofpoint-ORIG-GUID: OIyIbHq5RZ1U690kdahm7XCNackEXbSU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_14,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015 mlxlogscore=999
 suspectscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.21.0-2405170001
 definitions=main-2406180009
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jun 2024 01:25:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110948

From: Kai Kang <kai.kang@windriver.com>

Fix incompatible pointer type error for daq:

| ../../daq-2.0.7/os-daq-modules/daq_nfq.c: In function 'SetPktHdr':
| ../../daq-2.0.7/os-daq-modules/daq_nfq.c:394:37: error: passing argument 2
   of 'nfq_get_payload' from incompatible pointer type [-Wincompatible-pointer-types]
|   394 |     int len = nfq_get_payload(nfad, (char**)pkt);
|       |                                     ^~~~~~~~~~~
|       |                                     |
|       |                                     char **

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>

backport for build on host with gcc 14
Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../recipes-connectivity/daq/daq_2.0.7.bb     |  1 +
 ...-fix-incompatible-pointer-type-error.patch | 31 +++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/daq/files/daq-fix-incompatible-pointer-type-error.patch

diff --git a/meta-networking/recipes-connectivity/daq/daq_2.0.7.bb b/meta-networking/recipes-connectivity/daq/daq_2.0.7.bb
index 66ad83f71..8cb4c04fa 100644
--- a/meta-networking/recipes-connectivity/daq/daq_2.0.7.bb
+++ b/meta-networking/recipes-connectivity/daq/daq_2.0.7.bb
@@ -11,6 +11,7 @@ DEPENDS = "libpcap libpcre libdnet bison-native libnetfilter-queue"
 SRC_URI = "http://fossies.org/linux/misc/daq-${PV}.tar.gz \
            file://disable-run-test-program-while-cross-compiling.patch \
            file://0001-correct-the-location-of-unistd.h.patch \
+           file://daq-fix-incompatible-pointer-type-error.patch \
            "
 SRC_URI[sha256sum] = "bdc4e5a24d1ea492c39ee213a63c55466a2e8114b6a9abed609927ae13a7705e"
 # these 2 create undeclared dependency on libdnet and libnetfilter-queue from meta-networking
diff --git a/meta-networking/recipes-connectivity/daq/files/daq-fix-incompatible-pointer-type-error.patch b/meta-networking/recipes-connectivity/daq/files/daq-fix-incompatible-pointer-type-error.patch
new file mode 100644
index 000000000..ade3ec686
--- /dev/null
+++ b/meta-networking/recipes-connectivity/daq/files/daq-fix-incompatible-pointer-type-error.patch
@@ -0,0 +1,31 @@
+Fix daq incompatible pointer type error when gcc option
+'-Wincompatible-pointer-types is set:
+
+| ../../daq-2.0.7/os-daq-modules/daq_nfq.c: In function 'SetPktHdr':
+| ../../daq-2.0.7/os-daq-modules/daq_nfq.c:394:37: error: passing argument 2
+   of 'nfq_get_payload' from incompatible pointer type [-Wincompatible-pointer-types]
+|   394 |     int len = nfq_get_payload(nfad, (char**)pkt);
+|       |                                     ^~~~~~~~~~~
+|       |                                     |
+|       |                                     char **
+
+Upstream-Status: Inactive-Upstream [lastrelease: 2019-03-09]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ os-daq-modules/daq_nfq.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/os-daq-modules/daq_nfq.c b/os-daq-modules/daq_nfq.c
+index 4de94b6..a6de2f3 100644
+--- a/os-daq-modules/daq_nfq.c
++++ b/os-daq-modules/daq_nfq.c
+@@ -391,7 +391,7 @@ static inline int SetPktHdr (
+     DAQ_PktHdr_t* hdr,
+     uint8_t** pkt
+ ) {
+-    int len = nfq_get_payload(nfad, (char**)pkt);
++    int len = nfq_get_payload(nfad, (unsigned char**)pkt);
+ 
+     if ( len <= 0 )
+         return -1;
-- 
2.25.1


