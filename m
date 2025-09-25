Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D8C2CAC5A7
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 09:17:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.7105.1758791859413747768
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Sep 2025 02:17:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Cm6nTDJJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1363c4b735=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58P5obTE3019915
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 09:17:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=S1cEag0cCtq6GVfNOgQY74cik+P9DQhDYQE+T5n8X4E=; b=Cm6nTDJJofgp
	tEEO/7N0ItAA09iAyZpvU5fAvU5AP0NiFIYYZbKYu5X7RLQUvgVweOJPWKDE0Mc0
	d+jWAiov0qAmDQDa6exIKQE5kUA1iGM9DboE7H5KjLbn53n0D3dQmK4MUN1Qscxx
	MMYZOYYjL06YZI4H1L+ezCyE/8YCzP13PVRfwjjLU/WNiDlv1+diI+fvt8qpt10A
	zczaMqa2Uzovx7kl43tBQb8NL6AeIusOw+ruOpGeA03b9Xe/oTLSOHlJJPiM6WGf
	2oPsCYSk5arHPr3t6wD4m4KoFFP8piiN/ZyOXu0PTxjsHcULx0EPZ39P9W+1TZs3
	70cSmWFC/g==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 499k89e1bm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 09:17:38 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Thu, 25 Sep 2025 02:16:57 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Thu, 25 Sep 2025 02:16:55 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH 2/2] tcpreplay: fix CVE-2025-9157
Date: Thu, 25 Sep 2025 14:47:30 +0530
Message-ID: <20250925091730.3926288-2-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250925091730.3926288-1-archana.polampalli@windriver.com>
References: <20250925091730.3926288-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDA4NyBTYWx0ZWRfX9ZdjNBN78gNe
 x25IvoSAW4oOhl4KgeXnK3zYP1Xqsm7Qi7pNgXYba0F/KtEiqW8dF8ULjBMxjgFapx/35MO9Tf7
 i3aXBMNzAGNyV9Ij2cly7fHnDLIjtlzWnI0bXJn6uatmPEXeAoveuk9RYdlJ7lZK8zjfD5KMFdH
 tIDkiIwEcfwYFcWqyKo4JVArmOM716HwH+sen5h9YW1lyK5GRVqnjqmFj5CliQLhcZFt3wZFzos
 eH1gMRaFLG7Uv/Fs2WE7jlGEgcd/ija/50NazAwhKeyFj+08yoFXxEEVqE1imxPmrqkoARcVtt1
 dHy0t0Wtc3nzoe5HPx7eC3ssj0MjCTmhl4v4fUCcHRc4IP5aU7eB/N0CUw2+Yc=
X-Authority-Analysis: v=2.4 cv=YZS95xRf c=1 sm=1 tr=0 ts=68d508b2 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=Q-fNiiVtAAAA:8
 a=9_6wg6XftkMaMleYhaQA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: wijKOLDXtmRozvSc0dSho2H3FCie7utW
X-Proofpoint-ORIG-GUID: wijKOLDXtmRozvSc0dSho2H3FCie7utW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 09:17:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119855

From: Archana Polampalli <archana.polampalli@windriver.com>

A vulnerability was determined in appneta tcpreplay up to 4.5.2-beta2.
The impacted element is the function untrunc_packet of the file src/tcpedit/edit_packet.c
of the component tcprewrite. Executing manipulation can lead to use after free.
It is possible to launch the attack on the local host. The exploit has been publicly
disclosed and may be utilized. This patch is called 73008f261f1cdf7a1087dc8759115242696d35da.
Applying a patch is advised to resolve this issue.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../tcpreplay/tcpreplay/CVE-2025-9157.patch   | 44 +++++++++++++++++++
 .../tcpreplay/tcpreplay_4.4.4.bb              |  1 +
 2 files changed, 45 insertions(+)
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
index 04f3ee1c2d..008b385851 100644
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
@@ -16,6 +16,7 @@ SRC_URI = "https://github.com/appneta/${BPN}/releases/download/v${PV}/${BP}.tar.
     file://CVE-2024-22654-0001.patch \
     file://CVE-2024-22654-0002.patch \
     file://CVE-2025-51006.patch \
+    file://CVE-2025-9157.patch \
 "
 
 SRC_URI[sha256sum] = "44f18fb6d3470ecaf77a51b901a119dae16da5be4d4140ffbb2785e37ad6d4bf"
-- 
2.40.0


