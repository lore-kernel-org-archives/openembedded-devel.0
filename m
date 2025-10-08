Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBAF9CAC5BB
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 10:48:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.12733.1759920514582007606
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 03:48:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=tJoVNNyk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2376c8384e=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 598743JB1213964
	for <openembedded-devel@lists.openembedded.org>; Wed, 8 Oct 2025 03:48:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=2XIQff66j4rFWIhDYqa2
	HAwS2/as4BF2Aw0+mcCnaM8=; b=tJoVNNyk3mHKxa+gBaCJ7hSV/U1O4PxKWwQR
	/TQj57TVtOW3M8Xy2sE04YVx/B8XhmGc57heZm7nnCfYj5E4o/zpMFA/CEtwTA8v
	1E7oFZdul0BQbSaefx8jAnXcXe4EfhBe1uyNNcdrvIGy5pboFg0XDoF0InSywadd
	1skz24KVpcLTDxjCq/k9z2mMJrnBa5o9OeNhQvDtEhequhTjaTxGRsPH3kRoGkBb
	1a28T0PLig+rCfPBKaX9Mj5Brf8KM1F9Cypbl+h3MY5l7EShO2hfo2aTLhaI1MML
	eVa2Y61HJYqGXzWn1OV1zDvzOUW2FkQ3LZWbf192Pdbq+66AFw==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49jxuwm6u9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 03:48:34 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Wed, 8 Oct 2025 03:48:33 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Wed, 8 Oct 2025 03:48:32 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-networking][kirkstone][PATCH 1/2] tcpreplay: fix CVE-2025-9157
Date: Wed, 8 Oct 2025 16:18:29 +0530
Message-ID: <20251008104830.3386465-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=UMLQ3Sfy c=1 sm=1 tr=0 ts=68e64182 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=yU_jQ1hFIRIA:10 a=x6icFKpwvdMA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=Q-fNiiVtAAAA:8 a=WMhP2GBcfH-h0f0TsrQA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=6_D5ljFcL1GZDUJyZucp:22
X-Proofpoint-ORIG-GUID: IO3aOipOCcW21bb9lEL-ki-8hxD0-XRl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDA3NCBTYWx0ZWRfXxY/mYypP4i6t
 Cd+Bg/idI+Nt2A5BiAtCGfpx3htua0gyFJyetfm/uK8xeOrAG45geWnO4gROSIe7s8BJ89ZW2d5
 Sm6EFW8dtTUIdCuqgI1lowIpxMpS+hlC8uZZuq1aDOmjM8bCmb0ujTWfhXnLam3ujzMNiRSCwbr
 d1QYe2OKOLu75DuhBaOwOQvpzqF00fDqVa4rKHKiMxERQqf8wiJ2URsZt1Ivf3QkN5geWZD73id
 ulU2LxQPdjV2raO0v3tVN87T/g9MgO4QPQ0FJdFSkeMUch9yfcKmgIps0h8vs7W6Ew2RH2WcGdF
 JN0ix9oqK+UHmH+gHnl37o/gGOz89TBMDl1+gGo2rP2WIK4POvDevIowJkS5dosqPCK6olbCBxL
 uuBgPIaIeZLcj5aSM8M2yTfYCrAxGQ==
X-Proofpoint-GUID: IO3aOipOCcW21bb9lEL-ki-8hxD0-XRl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2509150000
 definitions=main-2510080074
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 10:48:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120361

From: Archana Polampalli <archana.polampalli@windriver.com>

A vulnerability was determined in appneta tcpreplay up to 4.5.2-beta2.
The impacted element is the function untrunc_packet of the file
src/tcpedit/edit_packet.c of the component tcprewrite. Executing
manipulation can lead to use after free. It is possible to launch
the attack on the local host. The exploit has been publicly disclosed
and may be utilized. This patch is called 73008f261f1cdf7a1087dc8759115242696d35da.
Applying a patch is advised to resolve this issue.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../tcpreplay/tcpreplay/CVE-2025-9157.patch   | 44 +++++++++++++++++++
 .../tcpreplay/tcpreplay_4.4.4.bb              |  3 +-
 2 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2025-9157.patch

diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2025-9157.patch b/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2025-9157.patch
new file mode 100644
index 0000000000..e52ec0dffc
--- /dev/null
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2025-9157.patch
@@ -0,0 +1,44 @@
+From 73008f261f1cdf7a1087dc8759115242696d35da Mon Sep 17 00:00:00 2001
+From: Fred Klassen <fred.klassen@broadcom.com>
+Date: Mon, 18 Aug 2025 18:35:16 -0700
+Subject: [PATCH] Bug #970 tcprewrite: --fixlen: do not use realloc
+
+No need to realloc if buffer is already proven to be big enough.
+
+CVE: CVE-2025-9157
+
+Upstream-Status: Backport [https://github.com/appneta/tcpreplay/commit/73008f261f1cdf7a1087dc8759115242696d35da]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ src/tcpedit/edit_packet.c | 1 -
+ src/tcprewrite.c          | 2 ++
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/tcpedit/edit_packet.c b/src/tcpedit/edit_packet.c
+index 1025ff9..f9ade8f 100644
+--- a/src/tcpedit/edit_packet.c
++++ b/src/tcpedit/edit_packet.c
+@@ -558,7 +558,6 @@ untrunc_packet(tcpedit_t *tcpedit,
+          * which seems like a corrupted pcap
+          */
+         if (pkthdr->len > pkthdr->caplen) {
+-            packet = safe_realloc(packet, pkthdr->len + PACKET_HEADROOM);
+             memset(packet + pkthdr->caplen, '\0', pkthdr->len - pkthdr->caplen);
+             pkthdr->caplen = pkthdr->len;
+         } else if (pkthdr->len < pkthdr->caplen) {
+diff --git a/src/tcprewrite.c b/src/tcprewrite.c
+index c9aa52c..ee05a26 100644
+--- a/src/tcprewrite.c
++++ b/src/tcprewrite.c
+@@ -270,6 +270,8 @@ rewrite_packets(tcpedit_t *tcpedit_ctx, pcap_t *pin, pcap_dumper_t *pout)
+
+         if (pkthdr.caplen > MAX_SNAPLEN)
+             errx(-1, "Frame too big, caplen %d exceeds %d", pkthdr.caplen, MAX_SNAPLEN);
++        if (pkthdr.len > MAX_SNAPLEN)
++            errx(-1, "Frame too big, len %d exceeds %d", pkthdr.len, MAX_SNAPLEN);
+         /*
+          * copy over the packet so we can pad it out if necessary and
+          * because pcap_next() returns a const ptr
+--
+2.40.0
diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
index 064a60fccc..c2edd29524 100644
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
@@ -8,11 +8,12 @@ LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=10f0474a2f0e5dccfca20f69d6598ad8"
 
 SRC_URI = "https://github.com/appneta/tcpreplay/releases/download/v${PV}/tcpreplay-${PV}.tar.gz \
+           file://0001-configure.ac-do-not-run-conftest-in-case-of-cross-co.patch \
            file://CVE-2023-4256.patch \
            file://CVE-2024-22654-0001.patch \
            file://CVE-2024-22654-0002.patch \
            file://CVE-2023-43279.patch \
-           file://0001-configure.ac-do-not-run-conftest-in-case-of-cross-co.patch \
+           file://CVE-2025-9157.patch \
 "
 
 SRC_URI[sha256sum] = "44f18fb6d3470ecaf77a51b901a119dae16da5be4d4140ffbb2785e37ad6d4bf"
-- 
2.40.0


