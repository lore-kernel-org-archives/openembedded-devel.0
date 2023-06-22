Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22B33EB64D8
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 10:24:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.8019.1687429458744368707
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Jun 2023 03:24:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=qJ/ZEdNM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=55378c4034=narpat.mali@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 35MADjKb021442
	for <openembedded-devel@lists.openembedded.org>; Thu, 22 Jun 2023 10:24:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=d20ba
	r7XOwgUIdUDjtCgHqlOEH5d84bPAg/oO60ECqk=; b=qJ/ZEdNMPIc/EwL+yKtow
	rD7BvPhzKsLxlltFFEtLm2GLJcqSwA8zu9w+r4gRVVutrApwqWYoCi9+MKqko8/s
	sOlK9qJN6xqGXWKR4MUrc/rIaV7SAcKzk3y8MvteNNOiPpKQnvc6VaBbGtz4cvSe
	CSoSf/jQ69aawzWB0UToSoSC3EF2ZqdPgZF1WmJUMU4Syp3PI0CLhqdhuNoyqstG
	yn2RbBZtmOZPLemJ9Ftefur8N/3qRZcBuC4ZWggpwUk/RxfSHMTYM5A0eCDDDwxf
	CIUw1KHzi/7d04dlprOMPjCJMojLp3mPNG0ipO+Zqvm0TNz/qO+e7v56UakXfiUY
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rce0g88nb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 22 Jun 2023 10:24:17 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 22 Jun 2023 03:24:11 -0700
From: nmali <narpat.mali@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <hari.gpillai@windriver.com>
Subject: [PATCH] frr: fix for CVE-2023-31490
Date: Thu, 22 Jun 2023 10:23:45 +0000
Message-ID: <20230622102345.2296870-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: S22GERwELEgjwXB6f1dbd3Vt4L8sbVxI
X-Proofpoint-GUID: S22GERwELEgjwXB6f1dbd3Vt4L8sbVxI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-22_06,2023-06-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 adultscore=0 mlxlogscore=999 impostorscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2306220086
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Jun 2023 10:24:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103485

From: Narpat Mali <narpat.mali@windriver.com>

An issue found in Frrouting bgpd v.8.4.2 allows a remote attacker to
cause a denial of service via the bgp_attr_psid_sub() function.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-31490
https://github.com/FRRouting/frr/issues/13099

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 .../frr/frr/CVE-2023-31490.patch              | 160 ++++++++++++++++++
 .../recipes-protocols/frr/frr_8.2.2.bb        |   1 +
 2 files changed, 161 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2023-31490.patch

diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2023-31490.patch b/meta-networking/recipes-protocols/frr/frr/CVE-2023-31490.patch
new file mode 100644
index 0000000000..d7b341d769
--- /dev/null
+++ b/meta-networking/recipes-protocols/frr/frr/CVE-2023-31490.patch
@@ -0,0 +1,160 @@
+From 72c13aac2eb7c8f3a10ad806d80ab635c28f4c04 Mon Sep 17 00:00:00 2001
+From: Narpat Mali <narpat.mali@windriver.com>
+Date: Wed, 21 Jun 2023 15:24:50 +0000
+Subject: [PATCH] bgpd: Ensure stream received has enough data
+
+BGP_PREFIX_SID_SRV6_L3_SERVICE attributes must not
+fully trust the length value specified in the nlri.
+Always ensure that the amount of data we need to read
+can be fullfilled.
+
+Reported-by: Iggy Frankovic <iggyfran@amazon.com>
+Signed-off-by: Donald Sharp <sharpd@nvidia.com>
+
+CVE: CVE-2023-31490
+
+Upstream-Status: Backport [https://github.com/FRRouting/frr/pull/12454/commits/06431bfa7570f169637ebb5898f0b0cc3b010802]
+
+Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
+---
+ bgpd/bgp_attr.c | 79 ++++++++++++++++---------------------------------
+ 1 file changed, 25 insertions(+), 54 deletions(-)
+
+diff --git a/bgpd/bgp_attr.c b/bgpd/bgp_attr.c
+index 2154baf4e..5d06991e2 100644
+--- a/bgpd/bgp_attr.c
++++ b/bgpd/bgp_attr.c
+@@ -2722,9 +2722,21 @@ static bgp_attr_parse_ret_t bgp_attr_psid_sub(uint8_t type, uint16_t length,
+	uint8_t sid_type, sid_flags;
+	char buf[BUFSIZ];
+
++	/*
++	 * Check that we actually have at least as much data as
++	 * specified by the length field
++	 */
++	if (STREAM_READABLE(peer->curr) < length) {
++		flog_err(
++			EC_BGP_ATTR_LEN,
++			"Prefix SID specifies length %hu, but only %zu bytes remain",
++			length, STREAM_READABLE(peer->curr));
++		return bgp_attr_malformed(args, BGP_NOTIFY_UPDATE_ATTR_LENG_ERR,
++					  args->total);
++	}
++
+	if (type == BGP_PREFIX_SID_LABEL_INDEX) {
+-		if (STREAM_READABLE(peer->curr) < length
+-		    || length != BGP_PREFIX_SID_LABEL_INDEX_LENGTH) {
++		if (length != BGP_PREFIX_SID_LABEL_INDEX_LENGTH) {
+			flog_err(EC_BGP_ATTR_LEN,
+				 "Prefix SID label index length is %hu instead of %u",
+				 length, BGP_PREFIX_SID_LABEL_INDEX_LENGTH);
+@@ -2746,12 +2758,8 @@ static bgp_attr_parse_ret_t bgp_attr_psid_sub(uint8_t type, uint16_t length,
+		/* Store label index; subsequently, we'll check on
+		 * address-family */
+		attr->label_index = label_index;
+-	}
+-
+-	/* Placeholder code for the IPv6 SID type */
+-	else if (type == BGP_PREFIX_SID_IPV6) {
+-		if (STREAM_READABLE(peer->curr) < length
+-		    || length != BGP_PREFIX_SID_IPV6_LENGTH) {
++	} else if (type == BGP_PREFIX_SID_IPV6) {
++		if (length != BGP_PREFIX_SID_IPV6_LENGTH) {
+			flog_err(EC_BGP_ATTR_LEN,
+				 "Prefix SID IPv6 length is %hu instead of %u",
+				 length, BGP_PREFIX_SID_IPV6_LENGTH);
+@@ -2765,10 +2773,7 @@ static bgp_attr_parse_ret_t bgp_attr_psid_sub(uint8_t type, uint16_t length,
+		stream_getw(peer->curr);
+
+		stream_get(&ipv6_sid, peer->curr, 16);
+-	}
+-
+-	/* Placeholder code for the Originator SRGB type */
+-	else if (type == BGP_PREFIX_SID_ORIGINATOR_SRGB) {
++	} else if (type == BGP_PREFIX_SID_ORIGINATOR_SRGB) {
+		/*
+		 * ietf-idr-bgp-prefix-sid-05:
+		 *     Length is the total length of the value portion of the
+@@ -2793,19 +2798,6 @@ static bgp_attr_parse_ret_t bgp_attr_psid_sub(uint8_t type, uint16_t length,
+				args->total);
+		}
+
+-		/*
+-		 * Check that we actually have at least as much data as
+-		 * specified by the length field
+-		 */
+-		if (STREAM_READABLE(peer->curr) < length) {
+-			flog_err(EC_BGP_ATTR_LEN,
+-				 "Prefix SID Originator SRGB specifies length %hu, but only %zu bytes remain",
+-				 length, STREAM_READABLE(peer->curr));
+-			return bgp_attr_malformed(
+-				args, BGP_NOTIFY_UPDATE_ATTR_LENG_ERR,
+-				args->total);
+-		}
+-
+		/*
+		 * Check that the portion of the TLV containing the sequence of
+		 * SRGBs corresponds to a multiple of the SRGB size; to get
+@@ -2829,12 +2821,8 @@ static bgp_attr_parse_ret_t bgp_attr_psid_sub(uint8_t type, uint16_t length,
+			stream_get(&srgb_base, peer->curr, 3);
+			stream_get(&srgb_range, peer->curr, 3);
+		}
+-	}
+-
+-	/* Placeholder code for the VPN-SID Service type */
+-	else if (type == BGP_PREFIX_SID_VPN_SID) {
+-		if (STREAM_READABLE(peer->curr) < length
+-		    || length != BGP_PREFIX_SID_VPN_SID_LENGTH) {
++	} else if (type == BGP_PREFIX_SID_VPN_SID) {
++		if (length != BGP_PREFIX_SID_VPN_SID_LENGTH) {
+			flog_err(EC_BGP_ATTR_LEN,
+				 "Prefix SID VPN SID length is %hu instead of %u",
+				 length, BGP_PREFIX_SID_VPN_SID_LENGTH);
+@@ -2870,39 +2858,22 @@ static bgp_attr_parse_ret_t bgp_attr_psid_sub(uint8_t type, uint16_t length,
+		attr->srv6_vpn->sid_flags = sid_flags;
+		sid_copy(&attr->srv6_vpn->sid, &ipv6_sid);
+		attr->srv6_vpn = srv6_vpn_intern(attr->srv6_vpn);
+-	}
+-
+-	/* Placeholder code for the SRv6 L3 Service type */
+-	else if (type == BGP_PREFIX_SID_SRV6_L3_SERVICE) {
+-		if (STREAM_READABLE(peer->curr) < length) {
++	} else if (type == BGP_PREFIX_SID_SRV6_L3_SERVICE) {
++		if (STREAM_READABLE(peer->curr) < 1) {
+			flog_err(
+				EC_BGP_ATTR_LEN,
+-				"Prefix SID SRv6 L3-Service length is %hu, but only %zu bytes remain",
+-				length, STREAM_READABLE(peer->curr));
+-			return bgp_attr_malformed(args,
+-				 BGP_NOTIFY_UPDATE_ATTR_LENG_ERR,
+-				 args->total);
++				"Prefix SID SRV6 L3 Service not enough data left, it must be at least 1 byte");
++			return bgp_attr_malformed(
++				args, BGP_NOTIFY_UPDATE_ATTR_LENG_ERR,
++				args->total);
+		}
+-
+		/* ignore reserved */
+		stream_getc(peer->curr);
+
+		return bgp_attr_srv6_service(args);
+	}
+-
+	/* Placeholder code for Unsupported TLV */
+	else {
+-
+-		if (STREAM_READABLE(peer->curr) < length) {
+-			flog_err(
+-				EC_BGP_ATTR_LEN,
+-				"Prefix SID SRv6 length is %hu - too long, only %zu remaining in this UPDATE",
+-				length, STREAM_READABLE(peer->curr));
+-			return bgp_attr_malformed(
+-				args, BGP_NOTIFY_UPDATE_ATTR_LENG_ERR,
+-				args->total);
+-		}
+-
+		if (bgp_debug_update(peer, NULL, NULL, 1))
+			zlog_debug(
+				"%s attr Prefix-SID sub-type=%u is not supported, skipped",
+--
+2.40.0
diff --git a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb b/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
index 80f4729e1f..073657b652 100644
--- a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
+++ b/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
@@ -13,6 +13,7 @@ SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/8.2 \
            file://CVE-2022-37035.patch \
            file://CVE-2022-37032.patch \
            file://CVE-2022-42917.patch \
+           file://CVE-2023-31490.patch \
            file://frr.pam \
 	      "
 
-- 
2.40.0


