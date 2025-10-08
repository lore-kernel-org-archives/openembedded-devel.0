Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4E6ECCD185
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 10:48:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.12735.1759920517520065624
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 03:48:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=BYx8DJoX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2376c8384e=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5987SEbw1312790
	for <openembedded-devel@lists.openembedded.org>; Wed, 8 Oct 2025 10:48:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=KV2yB5a2fLAyD2nkL+S6Eay9f8kg7j15sTvKWP2g/pA=; b=BYx8DJoXkSDP
	epT6BMQEfnMc8PHuS5KfTlfYbtkCBZFBhi7gkla5314dnxTEE1QtKoMu6Xz/6IvO
	JSCRbUjxeFI/vdDI1dDSWYuItRmaN1FAt10M7eXVIuTTp5hUHBvDY7yQFu1/aPL7
	UPRgfzfAFCdRhAtu6FAI3RmKW0yIKhpmXIMOf89jvuYfqrf7uUQy+E7yORGITwCt
	7J67oGHl0IfJb+qtReHgAqnzqz8ji7lQLOWoX4JR/byb5W410dASsxQPAvlRrJnB
	LkXLVII17deK38BHt0hRgfYtXyMu7MXhwRYR88gFa6bdS4BAlSD2I+lh1eog/Kt3
	cjDtP9YZKg==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49jrxgvd1r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 10:48:36 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Wed, 8 Oct 2025 03:48:35 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Wed, 8 Oct 2025 03:48:34 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-networking][kirkstone][PATCH 2/2] tcpreplay: fix CVE-2025-51006
Date: Wed, 8 Oct 2025 16:18:30 +0530
Message-ID: <20251008104830.3386465-2-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20251008104830.3386465-1-archana.polampalli@windriver.com>
References: <20251008104830.3386465-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: rSA9eiHStvDwLpuWElpXEWokXXlEUUm5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDA3NCBTYWx0ZWRfX3YPGRqV98V7f
 HuZR7btY6FYX2coU0TOHHvYrLW2df3/aQPwuT7/6bSHaOvtcNghKImT6SstXlSNr2buxNZsL0XG
 jUtgrDIrdphBOoqa4NnxTbMBSWX41ATBjXm5dzvFqAX0zTNKmn/zGlHMrgL/c+pgpbBBLS3E+8R
 09R+j/E0yy6ewAMUBpBWrqd9SMRBtYyeAl6dcS6k2tEYPwoZaie9O1R0nAWB5h7mrhIflep8XZM
 uZh/E5LcW7G4HkD7sP9yMFwWUx4XAOCJQNCdxojF1KFeohIyPKMeKRdb8bwZLJ/qbNnFsnyCjnr
 3K/ChCZxxqHqwWjNQpoRB5in+EIA4V3LIMI473xWSah5L4XAzWbQXeuZbw3IPJ/TRbjwFgY3szq
 6DYbKQ+++uzNm/xGX+d993TdMThrLA==
X-Proofpoint-ORIG-GUID: rSA9eiHStvDwLpuWElpXEWokXXlEUUm5
X-Authority-Analysis: v=2.4 cv=ari/yCZV c=1 sm=1 tr=0 ts=68e64184 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=yU_jQ1hFIRIA:10 a=x6icFKpwvdMA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=Q-fNiiVtAAAA:8 a=BEuIWBp3Jfj0c-BEvK8A:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=6_D5ljFcL1GZDUJyZucp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2509150000 definitions=main-2510080074
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 10:48:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120362

From: Archana Polampalli <archana.polampalli@windriver.com>

Within tcpreplay's tcprewrite, a double free vulnerability has been identified
in the dlt_linuxsll2_cleanup() function in plugins/dlt_linuxsll2/linuxsll2.c.
This vulnerability is triggered when tcpedit_dlt_cleanup() indirectly
invokes the cleanup routine multiple times on the same memory region.
By supplying a specifically crafted pcap file to the tcprewrite binary,
a local attacker can exploit this flaw to cause a Denial of Service (DoS) via memory corruption.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../tcpreplay/tcpreplay/CVE-2025-51006.patch  | 97 +++++++++++++++++++
 .../tcpreplay/tcpreplay_4.4.4.bb              |  1 +
 2 files changed, 98 insertions(+)
 create mode 100644 meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2025-51006.patch

diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2025-51006.patch b/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2025-51006.patch
new file mode 100644
index 0000000000..a55ac8c314
--- /dev/null
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2025-51006.patch
@@ -0,0 +1,97 @@
+From 868db118535a646a8a48c957f1e6367069be1aa7 Mon Sep 17 00:00:00 2001
+From: Fred Klassen <fred.klassen@broadcom.com>
+Date: Wed, 9 Jul 2025 21:01:12 -0700
+Subject: [PATCH] Bug #902 juniper: added safeguards Protect against invalid or
+ unsupported Juniper packets.
+
+Notes:
+
+- only Ethernet packets are currently supported
+- was unable to recreate the original bug, but areas where hardening was required
+
+CVE: CVE-2025-51006
+
+Upstream-Status: Backport [https://github.com/appneta/tcpreplay/commit/868db118535a646a8a48c957f1e6367069be1aa7]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ .../plugins/dlt_jnpr_ether/jnpr_ether.c       | 33 +++++++++++++++++--
+ .../plugins/dlt_jnpr_ether/jnpr_ether.h       |  2 ++
+ 2 files changed, 33 insertions(+), 2 deletions(-)
+
+diff --git a/src/tcpedit/plugins/dlt_jnpr_ether/jnpr_ether.c b/src/tcpedit/plugins/dlt_jnpr_ether/jnpr_ether.c
+index 9642a2c..671d5c0 100644
+--- a/src/tcpedit/plugins/dlt_jnpr_ether/jnpr_ether.c
++++ b/src/tcpedit/plugins/dlt_jnpr_ether/jnpr_ether.c
+@@ -202,8 +202,12 @@ dlt_jnpr_ether_parse_opts(tcpeditdlt_t *ctx)
+ int
+ dlt_jnpr_ether_decode(tcpeditdlt_t *ctx, const u_char *packet, int pktlen)
+ {
++    int extensions_len = 0;
+     int jnpr_header_len = 0;
+     const u_char *ethernet = NULL;
++    const u_char *extension;
++    u_char dlt = 0;
++    u_char encapsulation = 0;
+     jnpr_ether_config_t *config;
+
+     assert(ctx);
+@@ -228,9 +232,10 @@ dlt_jnpr_ether_decode(tcpeditdlt_t *ctx, const u_char *packet, int pktlen)
+     }
+
+     /* then get the Juniper header length */
+-    memcpy(&jnpr_header_len, &packet[JUNIPER_ETHER_EXTLEN_OFFSET], 2);
++    memcpy(&extensions_len, &packet[JUNIPER_ETHER_EXTLEN_OFFSET], 2);
+
+-    jnpr_header_len = ntohs(jnpr_header_len) + JUNIPER_ETHER_HEADER_LEN;
++    extensions_len = ntohs(extensions_len);
++    jnpr_header_len = extensions_len + JUNIPER_ETHER_HEADER_LEN;
+
+     dbgx(1, "jnpr header len: %d", jnpr_header_len);
+     /* make sure the packet is big enough to find the Ethernet Header */
+@@ -245,6 +250,30 @@ dlt_jnpr_ether_decode(tcpeditdlt_t *ctx, const u_char *packet, int pktlen)
+     /* jump to the appropriate offset */
+     ethernet = packet + jnpr_header_len;
+
++    /* parse the extension header to ensure this is Ethernet - the only DLT we currently support */
++    extension = packet + JUNIPER_ETHER_HEADER_LEN;
++    while (extension  < ethernet - 2) {
++        u_char ext_len = extension[1];
++        if (extension[0] == JUNIPER_ETHER_EXT_MEDIA_TYPE)
++            dlt = extension[2];
++        else if (extension[0] == JUNIPER_ETHER_EXT_ENCAPSULATION)
++            encapsulation = extension[2];
++        if (dlt != 0 && encapsulation != 0)
++            break;
++        extension += ext_len + 2;
++    }
++
++    if (extension > ethernet) {
++        tcpedit_seterr(ctx->tcpedit, "Extension to long! %d", extension - ethernet);
++        return TCPEDIT_ERROR;
++    }
++
++    if (dlt != DLT_EN10MB || encapsulation != 14) {
++        tcpedit_setwarn(ctx->tcpedit, "packet DLT %d and extension type %d not supported",
++            dlt, extension);
++        return TCPEDIT_WARN;
++    }
++
+     /* let the en10mb plugin decode the rest */
+     if (tcpedit_dlt_decode(config->subctx, ethernet, (pktlen - jnpr_header_len)) == TCPEDIT_ERROR)
+         return TCPEDIT_ERROR;
+diff --git a/src/tcpedit/plugins/dlt_jnpr_ether/jnpr_ether.h b/src/tcpedit/plugins/dlt_jnpr_ether/jnpr_ether.h
+index 4875350..90c12b4 100644
+--- a/src/tcpedit/plugins/dlt_jnpr_ether/jnpr_ether.h
++++ b/src/tcpedit/plugins/dlt_jnpr_ether/jnpr_ether.h
+@@ -33,6 +33,8 @@ extern "C" {
+ #define JUNIPER_ETHER_L2PRESENT 0x80
+ #define JUNIPER_ETHER_DIRECTION 0x01
+ #define JUNIPER_ETHER_EXTLEN_OFFSET 4
++#define JUNIPER_ETHER_EXT_MEDIA_TYPE 3
++#define JUNIPER_ETHER_EXT_ENCAPSULATION 6
+
+ int dlt_jnpr_ether_register(tcpeditdlt_t *ctx);
+ int dlt_jnpr_ether_init(tcpeditdlt_t *ctx);
+--
+2.40.0
diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
index c2edd29524..29207bc89f 100644
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
@@ -14,6 +14,7 @@ SRC_URI = "https://github.com/appneta/tcpreplay/releases/download/v${PV}/tcprepl
            file://CVE-2024-22654-0002.patch \
            file://CVE-2023-43279.patch \
            file://CVE-2025-9157.patch \
+           file://CVE-2025-51006.patch \
 "
 
 SRC_URI[sha256sum] = "44f18fb6d3470ecaf77a51b901a119dae16da5be4d4140ffbb2785e37ad6d4bf"
-- 
2.40.0


