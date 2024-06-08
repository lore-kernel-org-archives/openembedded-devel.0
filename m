Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B59B8C27C65
	for <webhook@archiver.kernel.org>; Sat,  8 Jun 2024 12:35:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.5493.1717850124460553120
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Jun 2024 05:35:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=688978f826=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 458CO3sL015431;
	Sat, 8 Jun 2024 05:35:23 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ymjk284rh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 08 Jun 2024 05:35:23 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 8 Jun 2024 05:35:22 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Sat, 8 Jun 2024 05:35:21 -0700
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH v2 4/4] daq: fix incompatible pointer type error
Date: Sat, 8 Jun 2024 20:35:10 +0800
Message-ID: <20240608123510.1767305-4-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240608123510.1767305-1-kai.kang@windriver.com>
References: <20240608123244.1767171-1-kai.kang@windriver.com>
 <20240608123510.1767305-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: H-W0SmIRgr7uiI6eq2oydIwvUanVgGWl
X-Proofpoint-GUID: H-W0SmIRgr7uiI6eq2oydIwvUanVgGWl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-08_06,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406080093
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Jun 2024 12:35:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110778

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
2.34.1


