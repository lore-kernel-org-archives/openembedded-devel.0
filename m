Return-Path: <jonas.gorski@bisdn.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDA6EC61D9C
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 09:39:46 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.15700.1700645981311659295
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Nov 2023 01:39:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bisdn-de.20230601.gappssmtp.com header.s=20230601 header.b=h9VnS++n;
 spf=none, err=SPF record not found (domain: bisdn.de, ip: 209.85.167.47, mailfrom: jonas.gorski@bisdn.de)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5079f6efd64so8616113e87.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 01:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bisdn-de.20230601.gappssmtp.com; s=20230601; t=1700645979; x=1701250779; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=G/fxqf6OasAYLN3i8Yol5dWj320ps3B+1f1zanX4R7E=;
        b=h9VnS++nTmKcxcAhW1fHziDZzF09kCX6wevSEzb/UsvJvMxMe/+MrSURc0cRJD8T7W
         dyxnd+y/L4hllrj5XjYCAdFlFvX+gY8++KI7Ps0UYEm4Vorf3PNndx68apOE+2Zv4r1G
         uyUSFaClx0qNzwCX+ZESQtft85kMy4/8KyPkb8VMdVgeFW3bBIoqi395jhKENIcevAQN
         Z30yHTtIR/aNooGTyjlAGvniwv96wi4GfVpMrIl3UPID7rvRKS+K14wUrd9JNm0idE+H
         fSpRh6Y4a+moM7+LiCyVsRShvv8e9dxA9QvlbLVbk2K4g8ut9EoROYyiN6Sx5DWOwBfn
         EkZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700645979; x=1701250779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G/fxqf6OasAYLN3i8Yol5dWj320ps3B+1f1zanX4R7E=;
        b=Qx2b/4OAuUVgjuJy8kThD8fxpnW/NVcDsp3KbX5Sr7uczVhTNFeljd+RsdYy87y13Y
         amsBde+YrOoO5Tug7OJ9Ophuqt43krPRbE7DiAz5D4aPjfPyZYAg/7DEplrOxSzC+YlN
         z+aSFWk2uniJ2jfmsh3KZvfsJdwccEKa1UciIanERzcN9CCjqshDUuavCr9TeW0dlOja
         AxUF3DHHQFSyJp8Taf0mqMWEabn5/uCNfk6AVzswvkTo2R8zACsIcub+N0oxibsamuGp
         16VU2eLfQ/EzTFKBVYmBpLU7UO0NSakLGaIBgdy5tjxGCKvi1Tna9ZzWsCjITlHJY3ZY
         RHOA==
X-Gm-Message-State: AOJu0Yyf9IoENKkAW5IL3EBsPLYt5k4F1NOY8UjJgO74ikRuXX4FtiKG
	jv0oz3Z8/LMYovm1APeMa8ndz3g34JhT8nvS12MxvsJbZeiEooCDc63byCqsIw98n61CKvDQa4W
	o76tzgV7SUVZogMX2mvzd41g3bmZ1pTKY/X8TPu+sMubU6pRf
X-Google-Smtp-Source: AGHT+IGTrnEH5N4wQM6tXSXXvE5CHqh9SttO03vHupWTEqlpt55WGc9gTNpf++t45DMa59ZKYB6n4w==
X-Received: by 2002:a19:911a:0:b0:500:b53f:fbc2 with SMTP id t26-20020a19911a000000b00500b53ffbc2mr1258434lfd.26.1700645978563;
        Wed, 22 Nov 2023 01:39:38 -0800 (PST)
Received: from localhost (dslb-002-205-020-122.002.205.pools.vodafone-ip.de. [2.205.20.122])
        by smtp.gmail.com with ESMTPSA id hn34-20020a05600ca3a200b00405959bbf4fsm1588095wmb.19.2023.11.22.01.39.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 01:39:37 -0800 (PST)
From: Jonas Gorski <jonas.gorski@bisdn.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] frr: fix CVEs CVE-2023-4675{2,3} and CVE-2023-4723{4,5}
Date: Wed, 22 Nov 2023 10:39:34 +0100
Message-ID: <20231122093934.117102-1-jonas.gorski@bisdn.de>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="ISO-8859-1"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 09:39:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107008

Add patches fixing CVE CVE-2023-46752, CVE-2023-46753, CVE-2023-47234,
and CVE-2023-47235 to FRR 9.0.

Patch order is commit order, not CVE numerical order, to avoid fuzz /
need for rebasing of the patches.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-46752
https://nvd.nist.gov/vuln/detail/CVE-2023-46753
https://nvd.nist.gov/vuln/detail/CVE-2023-47234
https://nvd.nist.gov/vuln/detail/CVE-2023-47235

Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
---
 .../frr/frr/CVE-2023-46752.patch              | 125 ++++++++++++++++++
 .../frr/frr/CVE-2023-46753.patch              | 117 ++++++++++++++++
 .../frr/frr/CVE-2023-47234.patch              |  95 +++++++++++++
 .../frr/frr/CVE-2023-47235.patch              | 112 ++++++++++++++++
 .../recipes-protocols/frr/frr_9.0.1.bb        |   6 +
 5 files changed, 455 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2023-4675=
2.patch
 create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2023-4675=
3.patch
 create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2023-4723=
4.patch
 create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2023-4723=
5.patch

diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2023-46752.patch=
 b/meta-networking/recipes-protocols/frr/frr/CVE-2023-46752.patch
new file mode 100644
index 000000000000..e1f30248caab
--- /dev/null
+++ b/meta-networking/recipes-protocols/frr/frr/CVE-2023-46752.patch
@@ -0,0 +1,125 @@
+From b08afc81c60607a4f736f418f2e3eb06087f1a35 Mon Sep 17 00:00:00 2001
+From: Donatas Abraitis <donatas@opensourcerouting.org>
+Date: Fri, 20 Oct 2023 17:49:18 +0300
+Subject: [PATCH] bgpd: Handle MP_REACH_NLRI malformed packets with session
+ reset
+
+Avoid crashing bgpd.
+
+```
+(gdb)
+bgp_mp_reach_parse (args=3D<optimized out>, mp_update=3D0x7fffffffe140) at=
 bgpd/bgp_attr.c:2341
+2341			stream_get(&attr->mp_nexthop_global, s, IPV6_MAX_BYTELEN);
+(gdb)
+stream_get (dst=3D0x7fffffffe1ac, s=3D0x7ffff0006e80, size=3D16) at lib/st=
ream.c:320
+320	{
+(gdb)
+321		STREAM_VERIFY_SANE(s);
+(gdb)
+323		if (STREAM_READABLE(s) < size) {
+(gdb)
+34	  return __builtin___memcpy_chk (__dest, __src, __len, __bos0 (__dest))=
;
+(gdb)
+
+Thread 1 "bgpd" received signal SIGSEGV, Segmentation fault.
+0x00005555556e37be in route_set_aspath_prepend (rule=3D0x555555aac0d0, pre=
fix=3D0x7fffffffe050,
+    object=3D0x7fffffffdb00) at bgpd/bgp_routemap.c:2282
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
+Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/b08afc8=
1c60607a4f736f418f2e3eb06087f1a35]
+CVE: CVE-2023-46752
+Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
+---
+ bgpd/bgp_attr.c   | 6 +-----
+ bgpd/bgp_attr.h   | 1 -
+ bgpd/bgp_packet.c | 6 +-----
+ 3 files changed, 2 insertions(+), 11 deletions(-)
+
+diff --git a/bgpd/bgp_attr.c b/bgpd/bgp_attr.c
+index 6925aff727e2..e7bb42a5d989 100644
+--- a/bgpd/bgp_attr.c
++++ b/bgpd/bgp_attr.c
+@@ -2421,7 +2421,7 @@ int bgp_mp_reach_parse(struct bgp_attr_parser_args *=
args,
+=20
+ 		mp_update->afi =3D afi;
+ 		mp_update->safi =3D safi;
+-		return BGP_ATTR_PARSE_EOR;
++		return bgp_attr_malformed(args, BGP_NOTIFY_UPDATE_MAL_ATTR, 0);
+ 	}
+=20
+ 	mp_update->afi =3D afi;
+@@ -3759,10 +3759,6 @@ enum bgp_attr_parse_ret bgp_attr_parse(struct peer =
*peer, struct attr *attr,
+ 			goto done;
+ 		}
+=20
+-		if (ret =3D=3D BGP_ATTR_PARSE_EOR) {
+-			goto done;
+-		}
+-
+ 		if (ret =3D=3D BGP_ATTR_PARSE_ERROR) {
+ 			flog_warn(EC_BGP_ATTRIBUTE_PARSE_ERROR,
+ 				  "%s: Attribute %s, parse error", peer->host,
+diff --git a/bgpd/bgp_attr.h b/bgpd/bgp_attr.h
+index 961e5f122470..fc347e7a1b4b 100644
+--- a/bgpd/bgp_attr.h
++++ b/bgpd/bgp_attr.h
+@@ -364,7 +364,6 @@ enum bgp_attr_parse_ret {
+ 	/* only used internally, send notify + convert to BGP_ATTR_PARSE_ERROR
+ 	 */
+ 	BGP_ATTR_PARSE_ERROR_NOTIFYPLS =3D -3,
+-	BGP_ATTR_PARSE_EOR =3D -4,
+ };
+=20
+ struct bpacket_attr_vec_arr;
+diff --git a/bgpd/bgp_packet.c b/bgpd/bgp_packet.c
+index b585591e2f69..5ecf343b6657 100644
+--- a/bgpd/bgp_packet.c
++++ b/bgpd/bgp_packet.c
+@@ -2397,8 +2397,7 @@ static int bgp_update_receive(struct peer_connection=
 *connection,
+ 	 * Non-MP IPv4/Unicast EoR is a completely empty UPDATE
+ 	 * and MP EoR should have only an empty MP_UNREACH
+ 	 */
+-	if ((!update_len && !withdraw_len && nlris[NLRI_MP_UPDATE].length =3D=3D=
 0)
+-	    || (attr_parse_ret =3D=3D BGP_ATTR_PARSE_EOR)) {
++	if (!update_len && !withdraw_len && nlris[NLRI_MP_UPDATE].length =3D=3D =
0) {
+ 		afi_t afi =3D 0;
+ 		safi_t safi;
+ 		struct graceful_restart_info *gr_info;
+@@ -2419,9 +2418,6 @@ static int bgp_update_receive(struct peer_connection=
 *connection,
+ 			   && nlris[NLRI_MP_WITHDRAW].length =3D=3D 0) {
+ 			afi =3D nlris[NLRI_MP_WITHDRAW].afi;
+ 			safi =3D nlris[NLRI_MP_WITHDRAW].safi;
+-		} else if (attr_parse_ret =3D=3D BGP_ATTR_PARSE_EOR) {
+-			afi =3D nlris[NLRI_MP_UPDATE].afi;
+-			safi =3D nlris[NLRI_MP_UPDATE].safi;
+ 		}
+=20
+ 		if (afi && peer->afc[afi][safi]) {
+--=20
+2.42.1
+
diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2023-46753.patch=
 b/meta-networking/recipes-protocols/frr/frr/CVE-2023-46753.patch
new file mode 100644
index 000000000000..6bf159aba8d0
--- /dev/null
+++ b/meta-networking/recipes-protocols/frr/frr/CVE-2023-46753.patch
@@ -0,0 +1,117 @@
+From d8482bf011cb2b173e85b65b4bf3d5061250cdb9 Mon Sep 17 00:00:00 2001
+From: Donatas Abraitis <donatas@opensourcerouting.org>
+Date: Mon, 23 Oct 2023 23:34:10 +0300
+Subject: [PATCH] bgpd: Check mandatory attributes more carefully for UPDAT=
E
+ message
+
+If we send a crafted BGP UPDATE message without mandatory attributes, we d=
o
+not check if the length of the path attributes is zero or not. We only che=
ck
+if attr->flag is at least set or not. Imagine we send only unknown transit
+attribute, then attr->flag is always 0. Also, this is true only if gracefu=
l-restart
+capability is received.
+
+A crash:
+
+```
+bgpd[7834]: [TJ23Y-GY0RH] 127.0.0.1 Unknown attribute is received (type 31=
, length 16)
+bgpd[7834]: [PCFFM-WMARW] 127.0.0.1(donatas-pc) rcvd UPDATE wlen 0 attrlen=
 20 alen 17
+BGP[7834]: Received signal 11 at 1698089639 (si_addr 0x0, PC 0x55eefd375b4=
a); aborting...
+BGP[7834]: /usr/local/lib/libfrr.so.0(zlog_backtrace_sigsafe+0x6d) [0x7f32=
05ca939d]
+BGP[7834]: /usr/local/lib/libfrr.so.0(zlog_signal+0xf3) [0x7f3205ca9593]
+BGP[7834]: /usr/local/lib/libfrr.so.0(+0xf5181) [0x7f3205cdd181]
+BGP[7834]: /lib/x86_64-linux-gnu/libpthread.so.0(+0x12980) [0x7f3204ff3980=
]
+BGP[7834]: /usr/lib/frr/bgpd(+0x18ab4a) [0x55eefd375b4a]
+BGP[7834]: /usr/local/lib/libfrr.so.0(route_map_apply_ext+0x310) [0x7f3205=
cd1290]
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
+OPEN =3D (b"\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff"
+b"\xff\xff\x00\x62\x01\x04\xfd\xea\x00\x5a\x0a\x00\x00\x01\x45\x02"
+b"\x06\x01\x04\x00\x01\x00\x01\x02\x02\x02\x00\x02\x02\x46\x00\x02"
+b"\x06\x41\x04\x00\x00\xfd\xea\x02\x02\x06\x00\x02\x06\x45\x04\x00"
+b"\x01\x01\x03\x02\x0e\x49\x0c\x0a\x64\x6f\x6e\x61\x74\x61\x73\x2d"
+b"\x70\x63\x00\x02\x04\x40\x02\x00\x78\x02\x09\x47\x07\x00\x01\x01"
+b"\x80\x00\x00\x00")
+
+KEEPALIVE =3D (b"\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff"
+b"\xff\xff\xff\xff\xff\xff\x00\x13\x04")
+
+UPDATE =3D bytearray.fromhex("ffffffffffffffffffffffffffffffff003c02000000=
14ff1f001000040146464646460004464646464646664646f50d05800100010200ffff00000=
0")
+
+s =3D socket.socket(socket.AF_INET, socket.SOCK_STREAM)
+s.connect(('127.0.0.2', 179))
+s.send(OPEN)
+data =3D s.recv(1024)
+s.send(KEEPALIVE)
+data =3D s.recv(1024)
+s.send(UPDATE)
+data =3D s.recv(1024)
+time.sleep(1000)
+s.close()
+```
+
+Reported-by: Iggy Frankovic <iggyfran@amazon.com>
+Signed-off-by: Donatas Abraitis <donatas@opensourcerouting.org>
+Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/d8482bf=
011cb2b173e85b65b4bf3d5061250cdb9]
+CVE: CVE-2023-46753
+Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
+---
+ bgpd/bgp_attr.c | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/bgpd/bgp_attr.c b/bgpd/bgp_attr.c
+index e7bb42a5d989..cf2dbe65b805 100644
+--- a/bgpd/bgp_attr.c
++++ b/bgpd/bgp_attr.c
+@@ -3385,13 +3385,15 @@ bgp_attr_unknown(struct bgp_attr_parser_args *args=
)
+ }
+=20
+ /* Well-known attribute check. */
+-static int bgp_attr_check(struct peer *peer, struct attr *attr)
++static int bgp_attr_check(struct peer *peer, struct attr *attr,
++			  bgp_size_t length)
+ {
+ 	uint8_t type =3D 0;
+=20
+ 	/* BGP Graceful-Restart End-of-RIB for IPv4 unicast is signaled as an
+ 	 * empty UPDATE.  */
+-	if (CHECK_FLAG(peer->cap, PEER_CAP_RESTART_RCV) && !attr->flag)
++	if (CHECK_FLAG(peer->cap, PEER_CAP_RESTART_RCV) && !attr->flag &&
++	    !length)
+ 		return BGP_ATTR_PARSE_PROCEED;
+=20
+ 	/* "An UPDATE message that contains the MP_UNREACH_NLRI is not required
+@@ -3443,7 +3445,7 @@ enum bgp_attr_parse_ret bgp_attr_parse(struct peer *=
peer, struct attr *attr,
+ 	enum bgp_attr_parse_ret ret;
+ 	uint8_t flag =3D 0;
+ 	uint8_t type =3D 0;
+-	bgp_size_t length;
++	bgp_size_t length =3D 0;
+ 	uint8_t *startp, *endp;
+ 	uint8_t *attr_endp;
+ 	uint8_t seen[BGP_ATTR_BITMAP_SIZE];
+@@ -3831,7 +3833,7 @@ enum bgp_attr_parse_ret bgp_attr_parse(struct peer *=
peer, struct attr *attr,
+ 	}
+=20
+ 	/* Check all mandatory well-known attributes are present */
+-	ret =3D bgp_attr_check(peer, attr);
++	ret =3D bgp_attr_check(peer, attr, length);
+ 	if (ret < 0)
+ 		goto done;
+=20
+--=20
+2.42.1
+
diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2023-47234.patch=
 b/meta-networking/recipes-protocols/frr/frr/CVE-2023-47234.patch
new file mode 100644
index 000000000000..754f9345a024
--- /dev/null
+++ b/meta-networking/recipes-protocols/frr/frr/CVE-2023-47234.patch
@@ -0,0 +1,95 @@
+From c37119df45bbf4ef713bc10475af2ee06e12f3bf Mon Sep 17 00:00:00 2001
+From: Donatas Abraitis <donatas@opensourcerouting.org>
+Date: Sun, 29 Oct 2023 22:44:45 +0200
+Subject: [PATCH] bgpd: Ignore handling NLRIs if we received MP_UNREACH_NLR=
I
+
+If we receive MP_UNREACH_NLRI, we should stop handling remaining NLRIs if
+no mandatory path attributes received.
+
+In other words, if MP_UNREACH_NLRI received, the remaining NLRIs should be=
 handled
+as a new data, but without mandatory attributes, it's a malformed packet.
+
+In normal case, this MUST not happen at all, but to avoid crashing bgpd, w=
e MUST
+handle that.
+
+Reported-by: Iggy Frankovic <iggyfran@amazon.com>
+Signed-off-by: Donatas Abraitis <donatas@opensourcerouting.org>
+Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/c37119d=
f45bbf4ef713bc10475af2ee06e12f3bf]
+CVE: CVE-2023-47234
+Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
+---
+ bgpd/bgp_attr.c   | 19 ++++++++++---------
+ bgpd/bgp_attr.h   |  1 +
+ bgpd/bgp_packet.c |  7 ++++++-
+ 3 files changed, 17 insertions(+), 10 deletions(-)
+
+diff --git a/bgpd/bgp_attr.c b/bgpd/bgp_attr.c
+index 1473dc772502..75aa2ac7cce6 100644
+--- a/bgpd/bgp_attr.c
++++ b/bgpd/bgp_attr.c
+@@ -3399,15 +3399,6 @@ static int bgp_attr_check(struct peer *peer, struct=
 attr *attr,
+ 	    !length)
+ 		return BGP_ATTR_PARSE_WITHDRAW;
+=20
+-	/* "An UPDATE message that contains the MP_UNREACH_NLRI is not required
+-	   to carry any other path attributes.", though if MP_REACH_NLRI or NLRI
+-	   are present, it should.  Check for any other attribute being present
+-	   instead.
+-	 */
+-	if ((!CHECK_FLAG(attr->flag, ATTR_FLAG_BIT(BGP_ATTR_MP_REACH_NLRI)) &&
+-	     CHECK_FLAG(attr->flag, ATTR_FLAG_BIT(BGP_ATTR_MP_UNREACH_NLRI))))
+-		return BGP_ATTR_PARSE_PROCEED;
+-
+ 	if (!CHECK_FLAG(attr->flag, ATTR_FLAG_BIT(BGP_ATTR_ORIGIN)))
+ 		type =3D BGP_ATTR_ORIGIN;
+=20
+@@ -3426,6 +3417,16 @@ static int bgp_attr_check(struct peer *peer, struct=
 attr *attr,
+ 	    && !CHECK_FLAG(attr->flag, ATTR_FLAG_BIT(BGP_ATTR_LOCAL_PREF)))
+ 		type =3D BGP_ATTR_LOCAL_PREF;
+=20
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
+ 	/* If any of the well-known mandatory attributes are not present
+ 	 * in an UPDATE message, then "treat-as-withdraw" MUST be used.
+ 	 */
+diff --git a/bgpd/bgp_attr.h b/bgpd/bgp_attr.h
+index fc347e7a1b4b..d30155e6dba0 100644
+--- a/bgpd/bgp_attr.h
++++ b/bgpd/bgp_attr.h
+@@ -364,6 +364,7 @@ enum bgp_attr_parse_ret {
+ 	/* only used internally, send notify + convert to BGP_ATTR_PARSE_ERROR
+ 	 */
+ 	BGP_ATTR_PARSE_ERROR_NOTIFYPLS =3D -3,
++	BGP_ATTR_PARSE_MISSING_MANDATORY =3D -4,
+ };
+=20
+ struct bpacket_attr_vec_arr;
+diff --git a/bgpd/bgp_packet.c b/bgpd/bgp_packet.c
+index a7514a26aa64..5dc35157ebf6 100644
+--- a/bgpd/bgp_packet.c
++++ b/bgpd/bgp_packet.c
+@@ -2359,7 +2359,12 @@ static int bgp_update_receive(struct peer_connectio=
n *connection,
+ 	/* Network Layer Reachability Information. */
+ 	update_len =3D end - stream_pnt(s);
+=20
+-	if (update_len && attribute_len) {
++	/* If we received MP_UNREACH_NLRI attribute, but also NLRIs, then
++	 * NLRIs should be handled as a new data. Though, if we received
++	 * NLRIs without mandatory attributes, they should be ignored.
++	 */
++	if (update_len && attribute_len &&
++	    attr_parse_ret !=3D BGP_ATTR_PARSE_MISSING_MANDATORY) {
+ 		/* Set NLRI portion to structure. */
+ 		nlris[NLRI_UPDATE].afi =3D AFI_IP;
+ 		nlris[NLRI_UPDATE].safi =3D SAFI_UNICAST;
+--=20
+2.42.1
+
diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2023-47235.patch=
 b/meta-networking/recipes-protocols/frr/frr/CVE-2023-47235.patch
new file mode 100644
index 000000000000..b06ba94a3420
--- /dev/null
+++ b/meta-networking/recipes-protocols/frr/frr/CVE-2023-47235.patch
@@ -0,0 +1,112 @@
+From 6814f2e0138a6ea5e1f83bdd9085d9a77999900b Mon Sep 17 00:00:00 2001
+From: Donatas Abraitis <donatas@opensourcerouting.org>
+Date: Fri, 27 Oct 2023 11:56:45 +0300
+Subject: [PATCH] bgpd: Treat EOR as withdrawn to avoid unwanted handling o=
f
+ malformed attrs
+
+Treat-as-withdraw, otherwise if we just ignore it, we will pass it to be
+processed as a normal UPDATE without mandatory attributes, that could lead
+to harmful behavior. In this case, a crash for route-maps with the configu=
ration
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
+OPEN =3D (b"\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff"
+b"\xff\xff\x00\x62\x01\x04\xfd\xea\x00\x5a\x0a\x00\x00\x01\x45\x02"
+b"\x06\x01\x04\x00\x01\x00\x01\x02\x02\x02\x00\x02\x02\x46\x00\x02"
+b"\x06\x41\x04\x00\x00\xfd\xea\x02\x02\x06\x00\x02\x06\x45\x04\x00"
+b"\x01\x01\x03\x02\x0e\x49\x0c\x0a\x64\x6f\x6e\x61\x74\x61\x73\x2d"
+b"\x70\x63\x00\x02\x04\x40\x02\x00\x78\x02\x09\x47\x07\x00\x01\x01"
+b"\x80\x00\x00\x00")
+
+KEEPALIVE =3D (b"\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff"
+b"\xff\xff\xff\xff\xff\xff\x00\x13\x04")
+
+UPDATE =3D bytearray.fromhex("ffffffffffffffffffffffffffffffff002b02000000=
03c0ff00010100eb00ac100b0b001ad908ac100b0b")
+
+s =3D socket.socket(socket.AF_INET, socket.SOCK_STREAM)
+s.connect(('127.0.0.2', 179))
+s.send(OPEN)
+data =3D s.recv(1024)
+s.send(KEEPALIVE)
+data =3D s.recv(1024)
+s.send(UPDATE)
+data =3D s.recv(1024)
+time.sleep(100)
+s.close()
+```
+
+Reported-by: Iggy Frankovic <iggyfran@amazon.com>
+Signed-off-by: Donatas Abraitis <donatas@opensourcerouting.org>
+Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/6814f2e=
0138a6ea5e1f83bdd9085d9a77999900b]
+CVE: CVE-2023-47235
+Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
+---
+ bgpd/bgp_attr.c | 15 ++++++++++++---
+ 1 file changed, 12 insertions(+), 3 deletions(-)
+
+diff --git a/bgpd/bgp_attr.c b/bgpd/bgp_attr.c
+index cf2dbe65b805..1473dc772502 100644
+--- a/bgpd/bgp_attr.c
++++ b/bgpd/bgp_attr.c
+@@ -3391,10 +3391,13 @@ static int bgp_attr_check(struct peer *peer, struc=
t attr *attr,
+ 	uint8_t type =3D 0;
+=20
+ 	/* BGP Graceful-Restart End-of-RIB for IPv4 unicast is signaled as an
+-	 * empty UPDATE.  */
++	 * empty UPDATE. Treat-as-withdraw, otherwise if we just ignore it,
++	 * we will pass it to be processed as a normal UPDATE without mandatory
++	 * attributes, that could lead to harmful behavior.
++	 */
+ 	if (CHECK_FLAG(peer->cap, PEER_CAP_RESTART_RCV) && !attr->flag &&
+ 	    !length)
+-		return BGP_ATTR_PARSE_PROCEED;
++		return BGP_ATTR_PARSE_WITHDRAW;
+=20
+ 	/* "An UPDATE message that contains the MP_UNREACH_NLRI is not required
+ 	   to carry any other path attributes.", though if MP_REACH_NLRI or NLRI
+@@ -3889,7 +3892,13 @@ done:
+ 	aspath_unintern(&as4_path);
+=20
+ 	transit =3D bgp_attr_get_transit(attr);
+-	if (ret !=3D BGP_ATTR_PARSE_ERROR) {
++	/* If we received an UPDATE with mandatory attributes, then
++	 * the unrecognized transitive optional attribute of that
++	 * path MUST be passed. Otherwise, it's an error, and from
++	 * security perspective it might be very harmful if we continue
++	 * here with the unrecognized attributes.
++	 */
++	if (ret =3D=3D BGP_ATTR_PARSE_PROCEED) {
+ 		/* Finally intern unknown attribute. */
+ 		if (transit)
+ 			bgp_attr_set_transit(attr, transit_intern(transit));
+--=20
+2.42.1
+
diff --git a/meta-networking/recipes-protocols/frr/frr_9.0.1.bb b/meta-netw=
orking/recipes-protocols/frr/frr_9.0.1.bb
index bddc08aebbaa..c447df0512c5 100644
--- a/meta-networking/recipes-protocols/frr/frr_9.0.1.bb
+++ b/meta-networking/recipes-protocols/frr/frr_9.0.1.bb
@@ -9,9 +9,15 @@ LICENSE =3D "GPL-2.0-only & LGPL-2.1-only"
 LIC_FILES_CHKSUM =3D "file://doc/licenses/GPL-2.0;md5=3Db234ee4d69f5fce448=
6a80fdaf4a4263 \
                     file://doc/licenses/LGPL-2.1;md5=3D4fbd65380cdd2559510=
79008b364516c"
=20
+PR =3D "r1"
+
 SRC_URI =3D "git://github.com/FRRouting/frr.git;protocol=3Dhttps;branch=3D=
stable/9.0 \
            file://frr.pam \
            file://0001-tools-make-quiet-actually-suppress-output.patch \
+           file://CVE-2023-46752.patch \
+           file://CVE-2023-46753.patch \
+           file://CVE-2023-47235.patch \
+           file://CVE-2023-47234.patch \
            "
=20
 SRCREV =3D "31ed3dd753d62b5d8916998bc32814007e91364b"
--=20
2.42.1


--=20
BISDN GmbH
K=F6rnerstra=DFe 7-10
10785 Berlin
Germany


Phone:=20
+49-30-6108-1-6100


Managing Directors:=A0
Dr.-Ing. Hagen Woesner, Andreas=20
K=F6psel


Commercial register:=A0
Amtsgericht Berlin-Charlottenburg HRB 141569=20
B
VAT ID No:=A0DE283257294


