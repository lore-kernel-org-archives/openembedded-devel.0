Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBE0AC83F2C
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 13:12:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.20831.1693919564882460492
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Sep 2023 06:12:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=LnSlEiDu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7612aa2b58=narpat.mali@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3857ouJ3007218;
	Tue, 5 Sep 2023 13:12:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=2BakH
	z8jR/kSUS+RvL5MGUwXVMo5Du3S8775nxX3OIM=; b=LnSlEiDuoODlYxvwkKWRO
	FTabdIClxwbh7l7MycoYRZXTlPWzwztR4ctQAM5bDOteVzNeuS54uT0pNu89C4uO
	v/yXlJVIcQCJlDt9ohmhelgPPh8pJp/sCidqYqFSNCH0x/yHl6/HhupEMMxbrCP5
	w0SjNxW23X/xtPXEI+H3dW47VEWSg62ypJMazCj5mAuNYHMmBO5JdTOSP+Fhuo7U
	cwZnGI60uLrNT98k/UwEErdulvTpxBwW7WItMymN2yAlvpmjsw0X5ip1v/RCURtY
	0NejSuSXRSDVwvh3oW3yDnbcm+5ynOYvOYEsAyLrTU0xH2vg4B4YgL64ruugl0Hd
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sw33k19rf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 05 Sep 2023 13:12:43 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 5 Sep 2023 06:12:39 -0700
From: nmali <narpat.mali@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <akuster808@gmail.com>
Subject: [meta-networking][kirkstone][PATCH 1/1] frr: Fix CVE-2023-38802 and CVE-2023-41358
Date: Tue, 5 Sep 2023 13:12:21 +0000
Message-ID: <20230905131221.2094602-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: IDID7PUvNZwCaqh9P7ygYVHzFkfUs4Di
X-Proofpoint-ORIG-GUID: IDID7PUvNZwCaqh9P7ygYVHzFkfUs4Di
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-05_10,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309050115
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Sep 2023 13:12:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104726

From: Narpat Mali <narpat.mali@windriver.com>

CVE-2023-38802:
FRRouting FRR 7.5.1 through 9.0 and Pica8 PICOS 4.3.3.2 allow a remote
attacker to cause a denial of service via a crafted BGP update with a
corrupted attribute 23 (Tunnel Encapsulation).

CVE-2023-41358:
An issue was discovered in FRRouting FRR through 9.0. bgpd/bgp_packet.c
processes NLRIs if the attribute length is zero.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-38802
https://nvd.nist.gov/vuln/detail/CVE-2023-41358

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 .../frr/frr/CVE-2023-38802.patch              | 136 ++++++++++++++++++
 .../frr/frr/CVE-2023-41358.patch              | 105 ++++++++++++++
 .../recipes-protocols/frr/frr_8.2.2.bb        |   2 +
 3 files changed, 243 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2023-38802.patch
 create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2023-41358.patch

diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2023-38802.patch b/meta-networking/recipes-protocols/frr/frr/CVE-2023-38802.patch
new file mode 100644
index 0000000000..60801bf06e
--- /dev/null
+++ b/meta-networking/recipes-protocols/frr/frr/CVE-2023-38802.patch
@@ -0,0 +1,136 @@
+From ad32e04f3db364694edc678327326ae6b771db9e Mon Sep 17 00:00:00 2001
+From: Donatas Abraitis <donatas@opensourcerouting.org>
+Date: Tue, 5 Sep 2023 11:30:53 +0000
+Subject: [PATCH 1/2] bgpd: Use treat-as-withdraw for tunnel encapsulation
+ attribute
+
+Before this path we used session reset method, which is discouraged by rfc7606.
+
+Handle this as rfc requires.
+
+Signed-off-by: Donatas Abraitis <donatas@opensourcerouting.org>
+
+CVE: CVE-2023-38802
+
+Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/bcb6b58d9530173df41d3a3cbc4c600ee0b4b186]
+
+Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
+---
+ bgpd/bgp_attr.c | 61 ++++++++++++++++++++-----------------------------
+ 1 file changed, 25 insertions(+), 36 deletions(-)
+
+diff --git a/bgpd/bgp_attr.c b/bgpd/bgp_attr.c
+index 5d06991e2..b10a60351 100644
+--- a/bgpd/bgp_attr.c
++++ b/bgpd/bgp_attr.c
+@@ -1310,6 +1310,7 @@ bgp_attr_malformed(struct bgp_attr_parser_args *args, uint8_t subcode,
+	case BGP_ATTR_LARGE_COMMUNITIES:
+	case BGP_ATTR_ORIGINATOR_ID:
+	case BGP_ATTR_CLUSTER_LIST:
++	case BGP_ATTR_ENCAP:
+		return BGP_ATTR_PARSE_WITHDRAW;
+	case BGP_ATTR_MP_REACH_NLRI:
+	case BGP_ATTR_MP_UNREACH_NLRI:
+@@ -2411,26 +2412,21 @@ bgp_attr_ipv6_ext_communities(struct bgp_attr_parser_args *args)
+ }
+
+ /* Parse Tunnel Encap attribute in an UPDATE */
+-static int bgp_attr_encap(uint8_t type, struct peer *peer, /* IN */
+-			  bgp_size_t length, /* IN: attr's length field */
+-			  struct attr *attr, /* IN: caller already allocated */
+-			  uint8_t flag,      /* IN: attr's flags field */
+-			  uint8_t *startp)
++static int bgp_attr_encap(struct bgp_attr_parser_args *args)
+ {
+-	bgp_size_t total;
+	uint16_t tunneltype = 0;
+-
+-	total = length + (CHECK_FLAG(flag, BGP_ATTR_FLAG_EXTLEN) ? 4 : 3);
++	struct peer *const peer = args->peer;
++	struct attr *const attr = args->attr;
++	bgp_size_t length = args->length;
++	uint8_t type = args->type;
++	uint8_t flag = args->flags;
+
+	if (!CHECK_FLAG(flag, BGP_ATTR_FLAG_TRANS)
+	    || !CHECK_FLAG(flag, BGP_ATTR_FLAG_OPTIONAL)) {
+-		zlog_info(
+-			"Tunnel Encap attribute flag isn't optional and transitive %d",
+-			flag);
+-		bgp_notify_send_with_data(peer, BGP_NOTIFY_UPDATE_ERR,
+-					  BGP_NOTIFY_UPDATE_ATTR_FLAG_ERR,
+-					  startp, total);
+-		return -1;
++		zlog_err("Tunnel Encap attribute flag isn't optional and transitive %d",
++			 flag);
++		return bgp_attr_malformed(args, BGP_NOTIFY_UPDATE_OPT_ATTR_ERR,
++					  args->total);
+	}
+
+	if (BGP_ATTR_ENCAP == type) {
+@@ -2438,12 +2434,11 @@ static int bgp_attr_encap(uint8_t type, struct peer *peer, /* IN */
+		uint16_t tlv_length;
+
+		if (length < 4) {
+-			zlog_info(
++			zlog_err(
+				"Tunnel Encap attribute not long enough to contain outer T,L");
+-			bgp_notify_send_with_data(
+-				peer, BGP_NOTIFY_UPDATE_ERR,
+-				BGP_NOTIFY_UPDATE_OPT_ATTR_ERR, startp, total);
+-			return -1;
++			return bgp_attr_malformed(args,
++						  BGP_NOTIFY_UPDATE_OPT_ATTR_ERR,
++						  args->total);
+		}
+		tunneltype = stream_getw(BGP_INPUT(peer));
+		tlv_length = stream_getw(BGP_INPUT(peer));
+@@ -2473,13 +2468,11 @@ static int bgp_attr_encap(uint8_t type, struct peer *peer, /* IN */
+		}
+
+		if (sublength > length) {
+-			zlog_info(
+-				"Tunnel Encap attribute sub-tlv length %d exceeds remaining length %d",
+-				sublength, length);
+-			bgp_notify_send_with_data(
+-				peer, BGP_NOTIFY_UPDATE_ERR,
+-				BGP_NOTIFY_UPDATE_OPT_ATTR_ERR, startp, total);
+-			return -1;
++			zlog_err("Tunnel Encap attribute sub-tlv length %d exceeds remaining length %d",
++				 sublength, length);
++			return bgp_attr_malformed(args,
++						  BGP_NOTIFY_UPDATE_OPT_ATTR_ERR,
++						  args->total);
+		}
+
+		/* alloc and copy sub-tlv */
+@@ -2527,13 +2520,10 @@ static int bgp_attr_encap(uint8_t type, struct peer *peer, /* IN */
+
+	if (length) {
+		/* spurious leftover data */
+-		zlog_info(
+-			"Tunnel Encap attribute length is bad: %d leftover octets",
+-			length);
+-		bgp_notify_send_with_data(peer, BGP_NOTIFY_UPDATE_ERR,
+-					  BGP_NOTIFY_UPDATE_OPT_ATTR_ERR,
+-					  startp, total);
+-		return -1;
++		zlog_err("Tunnel Encap attribute length is bad: %d leftover octets",
++			 length);
++		return bgp_attr_malformed(args, BGP_NOTIFY_UPDATE_OPT_ATTR_ERR,
++					  args->total);
+	}
+
+	return 0;
+@@ -3332,8 +3322,7 @@ bgp_attr_parse_ret_t bgp_attr_parse(struct peer *peer, struct attr *attr,
+		case BGP_ATTR_VNC:
+ #endif
+		case BGP_ATTR_ENCAP:
+-			ret = bgp_attr_encap(type, peer, length, attr, flag,
+-					     startp);
++			ret = bgp_attr_encap(&attr_args);
+			break;
+		case BGP_ATTR_PREFIX_SID:
+			ret = bgp_attr_prefix_sid(&attr_args);
+--
+2.40.0
diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2023-41358.patch b/meta-networking/recipes-protocols/frr/frr/CVE-2023-41358.patch
new file mode 100644
index 0000000000..e10d3e5267
--- /dev/null
+++ b/meta-networking/recipes-protocols/frr/frr/CVE-2023-41358.patch
@@ -0,0 +1,105 @@
+From ef9b66e742f9016b3bf283920b528cf20d2c969f Mon Sep 17 00:00:00 2001
+From: Donatas Abraitis <donatas@opensourcerouting.org>
+Date: Tue, 5 Sep 2023 11:36:13 +0000
+Subject: [PATCH 2/2] bgpd: Do not process NLRIs if the attribute length is
+ zero
+
+```
+3  0x00007f423aa42476 in __GI_raise (sig=sig@entry=11) at ../sysdeps/posix/raise.c:26
+4  0x00007f423aef9740 in core_handler (signo=11, siginfo=0x7fffc414deb0, context=<optimized out>) at lib/sigevent.c:246
+5  <signal handler called>
+6  0x0000564dea2fc71e in route_set_aspath_prepend (rule=0x564debd66d50, prefix=0x7fffc414ea30, object=0x7fffc414e400)
+    at bgpd/bgp_routemap.c:2258
+7  0x00007f423aeec7e0 in route_map_apply_ext (map=<optimized out>, prefix=prefix@entry=0x7fffc414ea30,
+    match_object=match_object@entry=0x7fffc414e400, set_object=set_object@entry=0x7fffc414e400, pref=pref@entry=0x0) at lib/routemap.c:2690
+8  0x0000564dea2d277e in bgp_input_modifier (peer=peer@entry=0x7f4238f59010, p=p@entry=0x7fffc414ea30, attr=attr@entry=0x7fffc414e770,
+    afi=afi@entry=AFI_IP, safi=safi@entry=SAFI_UNICAST, rmap_name=rmap_name@entry=0x0, label=0x0, num_labels=0, dest=0x564debdd5130)
+    at bgpd/bgp_route.c:1772
+9  0x0000564dea2df762 in bgp_update (peer=peer@entry=0x7f4238f59010, p=p@entry=0x7fffc414ea30, addpath_id=addpath_id@entry=0,
+    attr=0x7fffc414eb50, afi=afi@entry=AFI_IP, safi=<optimized out>, safi@entry=SAFI_UNICAST, type=9, sub_type=0, prd=0x0, label=0x0,
+    num_labels=0, soft_reconfig=0, evpn=0x0) at bgpd/bgp_route.c:4374
+10 0x0000564dea2e2047 in bgp_nlri_parse_ip (peer=0x7f4238f59010, attr=attr@entry=0x7fffc414eb50, packet=0x7fffc414eaf0)
+    at bgpd/bgp_route.c:6249
+11 0x0000564dea2c5a58 in bgp_nlri_parse (peer=peer@entry=0x7f4238f59010, attr=attr@entry=0x7fffc414eb50,
+    packet=packet@entry=0x7fffc414eaf0, mp_withdraw=mp_withdraw@entry=false) at bgpd/bgp_packet.c:339
+12 0x0000564dea2c5d66 in bgp_update_receive (peer=peer@entry=0x7f4238f59010, size=size@entry=109) at bgpd/bgp_packet.c:2024
+13 0x0000564dea2c901d in bgp_process_packet (thread=<optimized out>) at bgpd/bgp_packet.c:2933
+14 0x00007f423af0bf71 in event_call (thread=thread@entry=0x7fffc414ee40) at lib/event.c:1995
+15 0x00007f423aebb198 in frr_run (master=0x564deb73c670) at lib/libfrr.c:1213
+16 0x0000564dea261b83 in main (argc=<optimized out>, argv=<optimized out>) at bgpd/bgp_main.c:505
+```
+
+With the configuration:
+
+```
+frr version 9.1-dev-MyOwnFRRVersion
+frr defaults traditional
+hostname ip-172-31-13-140
+log file /tmp/debug.log
+log syslog
+service integrated-vtysh-config
+!
+debug bgp keepalives
+debug bgp neighbor-events
+debug bgp updates in
+debug bgp updates out
+!
+router bgp 100
+ bgp router-id 9.9.9.9
+ no bgp ebgp-requires-policy
+ bgp bestpath aigp
+ neighbor 172.31.2.47 remote-as 200
+ !
+ address-family ipv4 unicast
+  neighbor 172.31.2.47 default-originate
+  neighbor 172.31.2.47 route-map RM_IN in
+ exit-address-family
+exit
+!
+route-map RM_IN permit 10
+ set as-path prepend 200
+exit
+!
+```
+
+The issue is that we try to process NLRIs even if the attribute length is 0.
+
+Later bgp_update() will handle route-maps and a crash occurs because all the
+attributes are NULL, including aspath, where we dereference.
+
+According to the RFC 4271:
+
+A value of 0 indicates that neither the Network Layer
+         Reachability Information field nor the Path Attribute field is
+         present in this UPDATE message.
+
+But with a fuzzed UPDATE message this can be faked. I think it's reasonable
+to skip processing NLRIs if both update_len and attribute_len are 0.
+
+Reported-by: Iggy Frankovic <iggyfran@amazon.com>
+Signed-off-by: Donatas Abraitis <donatas@opensourcerouting.org>
+
+CVE: CVE-2023-41358
+
+Upstream-Status: Backport [https://github.com/FRRouting/frr/pull/14260/commits/28ccc24d38df1d51ed8a563507e5d6f6171fdd38]
+
+Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
+---
+ bgpd/bgp_packet.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/bgpd/bgp_packet.c b/bgpd/bgp_packet.c
+index 0166dc6a2..2fd28aae3 100644
+--- a/bgpd/bgp_packet.c
++++ b/bgpd/bgp_packet.c
+@@ -1767,7 +1767,7 @@ static int bgp_update_receive(struct peer *peer, bgp_size_t size)
+	/* Network Layer Reachability Information. */
+	update_len = end - stream_pnt(s);
+
+-	if (update_len) {
++	if (update_len && attribute_len) {
+		/* Set NLRI portion to structure. */
+		nlris[NLRI_UPDATE].afi = AFI_IP;
+		nlris[NLRI_UPDATE].safi = SAFI_UNICAST;
+--
+2.40.0
diff --git a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb b/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
index 1897eb2abd..7af584835f 100644
--- a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
+++ b/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
@@ -18,6 +18,8 @@ SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/8.2 \
            file://CVE-2022-43681.patch \
            file://CVE-2023-31489.patch \
            file://CVE-2023-31490.patch \
+           file://CVE-2023-38802.patch \
+           file://CVE-2023-41358.patch \
            file://frr.pam \
 	      "
 
-- 
2.40.0


