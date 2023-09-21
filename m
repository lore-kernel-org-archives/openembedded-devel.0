Return-Path: <jonas.gorski@bisdn.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B77DCD13D3
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 07:05:23 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.10295.1695279916704848841
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Sep 2023 00:05:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bisdn-de.20230601.gappssmtp.com header.s=20230601 header.b=hRPSHWKh;
 spf=none, err=SPF record not found (domain: bisdn.de, ip: 209.85.221.47, mailfrom: jonas.gorski@bisdn.de)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-313e742a787so303735f8f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Sep 2023 00:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bisdn-de.20230601.gappssmtp.com; s=20230601; t=1695279914; x=1695884714; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=F7mhRBi0I59JExZU8rXmbjN7ZdpD4yvJQHwFz2Rnsn0=;
        b=hRPSHWKhWciKkwzYWLR+sL0jLGJdwAcJURu6kuudWw1k8Ml7jbwMAjOCKkbM1rzUiQ
         m1CjRoQ1DdM8TFhjb4aekWYXwJwJP5vlIRQRrEnLOtQI0r/1TDG63ih1vKa/antzZlMV
         1Y/lKnaFv4ifX31wmArmWX0Dl3c25u3abh7+YN9FfOMFQezBJ7jfoXW9iXOQsb8+IIPY
         QpoZr/aTs+PzxquTt9Wd7GAmna22mSaBN+0ULx1iQ3T+uyzEFS8KlOCYJOr8uC3pczwX
         +RXfOj9k2SPDiE6uq4TvJWdO6vuPvynDDmRqSVpe/VJtLGvqCQ0wd3xGsBWgn+gwiSOd
         VqPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695279914; x=1695884714;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F7mhRBi0I59JExZU8rXmbjN7ZdpD4yvJQHwFz2Rnsn0=;
        b=Xl5qNO2PaV+xcYNvKMmI0fBKV3BHglWWjo4L1LnBWE4N4zX4Kt7XA69jMUAsCoU/XG
         CHyXlc0gGr04bGYvv29KfpTVR6kSJG1cD2BZzaC//NVkkfP3kghI3r0yfCr8dHSlaWij
         1mcwiYML3N61oGpXFDqYgS+UgXBxe1MswJ9cidk8OdbZxWYMkIKdo+TTe5l+gRe7hn9C
         eVsusYJDr0ykn9vnFifnvXtvm7r8vfrLZ+HzoJhywUkeYJKVuRK0QXOCDu1PzkMcR9Os
         9GcFGzlHh/r5Bz2apzCcEVhHjZl4+uuTOa8nk7OjlAbmHGhL3pq5Z+F8VkstUMRAt79z
         R59w==
X-Gm-Message-State: AOJu0Yw5XOaXWNnja++BMYDCUou6vUDKOKJL8E/zCQ5n12pTrPW/JM4B
	pWTsoXUx7jyDIKLqFey4RTFpMyFXvM8jJYuMFRUYfSg4uaN2Y0aJsmxGXTuyS1HVmQfNmENDy0L
	vo0kre205VWuTN+n0Hz3U2xUgS1hB5oaOEUUtorG6uVfKWD5S
X-Google-Smtp-Source: AGHT+IHas6YRZD7Isomh+7hD8Ajrt8wqh44urM8Ul5/hdy6hbt7eWxhrXoFIDHcF9KIV44XDBLh1gQ==
X-Received: by 2002:adf:ef48:0:b0:319:6997:9432 with SMTP id c8-20020adfef48000000b0031969979432mr3984684wrp.1.1695279913918;
        Thu, 21 Sep 2023 00:05:13 -0700 (PDT)
Received: from localhost (dslb-002-205-020-122.002.205.pools.vodafone-ip.de. [2.205.20.122])
        by smtp.gmail.com with ESMTPSA id x4-20020a5d60c4000000b003197869bcd7sm892438wrt.13.2023.09.21.00.05.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 00:05:13 -0700 (PDT)
From: Jonas Gorski <jonas.gorski@bisdn.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] frr: upgrade 8.4.4 -> 9.0.1
Date: Thu, 21 Sep 2023 09:05:08 +0200
Message-ID: <20230921070508.103712-1-jonas.gorski@bisdn.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="ISO-8859-1"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Sep 2023 07:05:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105036

Upgrade FRR to 9.0.1:

* drop all existing patches since they are included in 9.0.1
* add a patch fixing (harmless) error messages in log
* license files moved to doc/licenses
* protobuf-c-native (for protoc) and protobuf-c are now needed

Changelogs:
https://github.com/FRRouting/frr/releases/tag/frr-9.0.1
https://github.com/FRRouting/frr/commit/31ed3dd753d62b5d8916998bc32814007e9=
1364b
https://github.com/FRRouting/frr/releases/tag/frr-9.0
https://github.com/FRRouting/frr/commit/2863e7efbcd0cbfbd41d3be04c660d77df6=
5d0ea

Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
---
Build tested and slightly runtested on x86-64
cve_check reports all CVEs as patched

 ...check-for-python-x.y-emded.pc-not-py.patch |  33 ------
 .../frr/frr/CVE-2023-3748.patch               |  54 ---------
 .../frr/frr/CVE-2023-41358.patch              | 106 ------------------
 .../frr/frr/CVE-2023-41360.patch              |  35 ------
 .../frr/{frr_8.4.4.bb =3D> frr_9.0.1.bb}        |  15 +--
 5 files changed, 6 insertions(+), 237 deletions(-)
 delete mode 100644 meta-networking/recipes-protocols/frr/frr/0001-m4-ax_py=
thon.m4-check-for-python-x.y-emded.pc-not-py.patch
 delete mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2023-3748=
.patch
 delete mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2023-4135=
8.patch
 delete mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2023-4136=
0.patch
 rename meta-networking/recipes-protocols/frr/{frr_8.4.4.bb =3D> frr_9.0.1.=
bb} (91%)

diff --git a/meta-networking/recipes-protocols/frr/frr/0001-m4-ax_python.m4=
-check-for-python-x.y-emded.pc-not-py.patch b/meta-networking/recipes-proto=
cols/frr/frr/0001-m4-ax_python.m4-check-for-python-x.y-emded.pc-not-py.patc=
h
deleted file mode 100644
index 872a67c7840b..000000000000
--- a/meta-networking/recipes-protocols/frr/frr/0001-m4-ax_python.m4-check-=
for-python-x.y-emded.pc-not-py.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From a82d704b1ec6ece47b01d12e0e067d4b62b10894 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Wed, 9 Nov 2022 20:24:45 +0100
-Subject: [PATCH] m4/ax_python.m4: check for python-x.y-emded.pc, not
- python-x.y.pc
-
-Only the embed version includes necessary linker flags to link
-with libpython.
-
-Upstream-Status: Backport
-[https://github.com/FRRouting/frr/commit/a82d704b1ec6ece47b01d12e0e067d4b6=
2b10894]
-
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- m4/ax_python.m4 | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/m4/ax_python.m4 b/m4/ax_python.m4
-index 91d12b99b..f5e603b96 100644
---- a/m4/ax_python.m4
-+++ b/m4/ax_python.m4
-@@ -206,7 +206,7 @@ AC_REQUIRE([PKG_PROG_PKG_CONFIG])dnl
-     AC_MSG_CHECKING([whether pkg-config python-${tryver} is available])
-     unset PYTHON_CFLAGS
-     unset PYTHON_LIBS
--    pkg=3D"python-${tryver}"
-+    pkg=3D"python-${tryver}-embed"
-     pkg=3D"${pkg%-}"
-     _PKG_CONFIG([PYTHON_CFLAGS], [cflags], [${pkg}])
-     _PKG_CONFIG([PYTHON_LIBS], [libs], [${pkg}])
---=20
-2.25.1
-
diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2023-3748.patch =
b/meta-networking/recipes-protocols/frr/frr/CVE-2023-3748.patch
deleted file mode 100644
index 4a8a7e1afdd8..000000000000
--- a/meta-networking/recipes-protocols/frr/frr/CVE-2023-3748.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From e61593f2ded104c4c7f01eb93e2b404e93e0c560 Mon Sep 17 00:00:00 2001
-From: harryreps <harryreps@gmail.com>
-Date: Fri, 3 Mar 2023 23:17:14 +0000
-Subject: [PATCH] babeld: fix #11808 to avoid infinite loops
-
-Replacing continue in loops to goto done so that index of packet buffer
-increases.
-
-Signed-off-by: harryreps <harryreps@gmail.com>
-
-CVE: CVE-2023-3748
-
-Upstream-Status: Backport
-[https://github.com/FRRouting/frr/commit/ae1e0e1fed77716bc06f181ad68c4433f=
b5523d0]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- babeld/message.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/babeld/message.c b/babeld/message.c
-index 7d45d91bf..2bf233796 100644
---- a/babeld/message.c
-+++ b/babeld/message.c
-@@ -439,7 +439,7 @@ parse_packet(const unsigned char *from, struct interfa=
ce *ifp,
- 			debugf(BABEL_DEBUG_COMMON,
- 			       "Received Hello from %s on %s that does not have all 0's in the=
 unused section of flags, ignoring",
- 			       format_address(from), ifp->name);
--			continue;
-+			goto done;
- 		}
-=20
- 		/*
-@@ -451,7 +451,7 @@ parse_packet(const unsigned char *from, struct interfa=
ce *ifp,
- 			debugf(BABEL_DEBUG_COMMON,
- 			       "Received Unicast Hello from %s on %s that FRR is not prepared =
to understand yet",
- 			       format_address(from), ifp->name);
--			continue;
-+			goto done;
- 		}
-=20
- 		DO_NTOHS(seqno, message + 4);
-@@ -469,7 +469,7 @@ parse_packet(const unsigned char *from, struct interfa=
ce *ifp,
- 			debugf(BABEL_DEBUG_COMMON,
- 			       "Received hello from %s on %s should be ignored as that this ve=
rsion of FRR does not know how to properly handle interval =3D=3D 0",
- 			       format_address(from), ifp->name);
--			continue;
-+			goto done;
- 		}
-=20
- 		changed =3D update_neighbour(neigh, seqno, interval);
---=20
-2.25.1
-
diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2023-41358.patch=
 b/meta-networking/recipes-protocols/frr/frr/CVE-2023-41358.patch
deleted file mode 100644
index 59633ef69911..000000000000
--- a/meta-networking/recipes-protocols/frr/frr/CVE-2023-41358.patch
+++ /dev/null
@@ -1,106 +0,0 @@
-From 9efd9a47db4f13ebf88c2ffe14301d7441bcb40d Mon Sep 17 00:00:00 2001
-From: Donatas Abraitis <donatas@opensourcerouting.org>
-Date: Tue, 22 Aug 2023 22:52:04 +0300
-Subject: [PATCH 1/2] bgpd: Do not process NLRIs if the attribute length is
- zero
-
-```
-3  0x00007f423aa42476 in __GI_raise (sig=3Dsig@entry=3D11) at ../sysdeps/p=
osix/raise.c:26
-4  0x00007f423aef9740 in core_handler (signo=3D11, siginfo=3D0x7fffc414deb=
0, context=3D<optimized out>) at lib/sigevent.c:246
-5  <signal handler called>
-6  0x0000564dea2fc71e in route_set_aspath_prepend (rule=3D0x564debd66d50, =
prefix=3D0x7fffc414ea30, object=3D0x7fffc414e400)
-    at bgpd/bgp_routemap.c:2258
-7  0x00007f423aeec7e0 in route_map_apply_ext (map=3D<optimized out>, prefi=
x=3Dprefix@entry=3D0x7fffc414ea30,
-    match_object=3Dmatch_object@entry=3D0x7fffc414e400, set_object=3Dset_o=
bject@entry=3D0x7fffc414e400, pref=3Dpref@entry=3D0x0) at lib/routemap.c:26=
90
-8  0x0000564dea2d277e in bgp_input_modifier (peer=3Dpeer@entry=3D0x7f4238f=
59010, p=3Dp@entry=3D0x7fffc414ea30, attr=3Dattr@entry=3D0x7fffc414e770,
-    afi=3Dafi@entry=3DAFI_IP, safi=3Dsafi@entry=3DSAFI_UNICAST, rmap_name=
=3Drmap_name@entry=3D0x0, label=3D0x0, num_labels=3D0, dest=3D0x564debdd513=
0)
-    at bgpd/bgp_route.c:1772
-9  0x0000564dea2df762 in bgp_update (peer=3Dpeer@entry=3D0x7f4238f59010, p=
=3Dp@entry=3D0x7fffc414ea30, addpath_id=3Daddpath_id@entry=3D0,
-    attr=3D0x7fffc414eb50, afi=3Dafi@entry=3DAFI_IP, safi=3D<optimized out=
>, safi@entry=3DSAFI_UNICAST, type=3D9, sub_type=3D0, prd=3D0x0, label=3D0x=
0,
-    num_labels=3D0, soft_reconfig=3D0, evpn=3D0x0) at bgpd/bgp_route.c:437=
4
-10 0x0000564dea2e2047 in bgp_nlri_parse_ip (peer=3D0x7f4238f59010, attr=3D=
attr@entry=3D0x7fffc414eb50, packet=3D0x7fffc414eaf0)
-    at bgpd/bgp_route.c:6249
-11 0x0000564dea2c5a58 in bgp_nlri_parse (peer=3Dpeer@entry=3D0x7f4238f5901=
0, attr=3Dattr@entry=3D0x7fffc414eb50,
-    packet=3Dpacket@entry=3D0x7fffc414eaf0, mp_withdraw=3Dmp_withdraw@entr=
y=3Dfalse) at bgpd/bgp_packet.c:339
-12 0x0000564dea2c5d66 in bgp_update_receive (peer=3Dpeer@entry=3D0x7f4238f=
59010, size=3Dsize@entry=3D109) at bgpd/bgp_packet.c:2024
-13 0x0000564dea2c901d in bgp_process_packet (thread=3D<optimized out>) at =
bgpd/bgp_packet.c:2933
-14 0x00007f423af0bf71 in event_call (thread=3Dthread@entry=3D0x7fffc414ee4=
0) at lib/event.c:1995
-15 0x00007f423aebb198 in frr_run (master=3D0x564deb73c670) at lib/libfrr.c=
:1213
-16 0x0000564dea261b83 in main (argc=3D<optimized out>, argv=3D<optimized o=
ut>) at bgpd/bgp_main.c:505
-```
-
-With the configuration:
-
-```
-frr version 9.1-dev-MyOwnFRRVersion
-frr defaults traditional
-hostname ip-172-31-13-140
-log file /tmp/debug.log
-log syslog
-service integrated-vtysh-config
-!
-debug bgp keepalives
-debug bgp neighbor-events
-debug bgp updates in
-debug bgp updates out
-!
-router bgp 100
- bgp router-id 9.9.9.9
- no bgp ebgp-requires-policy
- bgp bestpath aigp
- neighbor 172.31.2.47 remote-as 200
- !
- address-family ipv4 unicast
-  neighbor 172.31.2.47 default-originate
-  neighbor 172.31.2.47 route-map RM_IN in
- exit-address-family
-exit
-!
-route-map RM_IN permit 10
- set as-path prepend 200
-exit
-!
-```
-
-The issue is that we try to process NLRIs even if the attribute length is =
0.
-
-Later bgp_update() will handle route-maps and a crash occurs because all t=
he
-attributes are NULL, including aspath, where we dereference.
-
-According to the RFC 4271:
-
-A value of 0 indicates that neither the Network Layer
-         Reachability Information field nor the Path Attribute field is
-         present in this UPDATE message.
-
-But with a fuzzed UPDATE message this can be faked. I think it's reasonabl=
e
-to skip processing NLRIs if both update_len and attribute_len are 0.
-
-Reported-by: Iggy Frankovic <iggyfran@amazon.com>
-Signed-off-by: Donatas Abraitis <donatas@opensourcerouting.org>
-
-Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/28ccc24=
d38df1d51ed8a563507e5d6f6171fdd38]
-
-CVE: CVE-2023-41358
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- bgpd/bgp_packet.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/bgpd/bgp_packet.c b/bgpd/bgp_packet.c
-index ec54943f3..3c2e73c59 100644
---- a/bgpd/bgp_packet.c
-+++ b/bgpd/bgp_packet.c
-@@ -1951,7 +1951,7 @@ static int bgp_update_receive(struct peer *peer, bgp=
_size_t size)
- 	/* Network Layer Reachability Information. */
- 	update_len =3D end - stream_pnt(s);
-=20
--	if (update_len) {
-+	if (update_len && attribute_len) {
- 		/* Set NLRI portion to structure. */
- 		nlris[NLRI_UPDATE].afi =3D AFI_IP;
- 		nlris[NLRI_UPDATE].safi =3D SAFI_UNICAST;
---=20
-2.35.5
-
diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2023-41360.patch=
 b/meta-networking/recipes-protocols/frr/frr/CVE-2023-41360.patch
deleted file mode 100644
index 8ee3985b428b..000000000000
--- a/meta-networking/recipes-protocols/frr/frr/CVE-2023-41360.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 9ecacf2176d2bac4b90e17d49facb8712c1b467a Mon Sep 17 00:00:00 2001
-From: Donatas Abraitis <donatas@opensourcerouting.org>
-Date: Sun, 20 Aug 2023 22:15:27 +0300
-Subject: [PATCH 2/2] bgpd: Don't read the first byte of ORF header if we a=
re
- ahead of stream
-
-Reported-by: Iggy Frankovic iggyfran@amazon.com
-Signed-off-by: Donatas Abraitis <donatas@opensourcerouting.org>
-
-Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/9b855a6=
92e68e0d16467e190b466b4ecb6853702]
-
-CVE: CVE-2023-41360
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- bgpd/bgp_packet.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/bgpd/bgp_packet.c b/bgpd/bgp_packet.c
-index 3c2e73c59..f1d0e54c0 100644
---- a/bgpd/bgp_packet.c
-+++ b/bgpd/bgp_packet.c
-@@ -2375,7 +2375,8 @@ static int bgp_route_refresh_receive(struct peer *pe=
er, bgp_size_t size)
- 				 * and 7 bytes of ORF Address-filter entry from
- 				 * the stream
- 				 */
--				if (*p_pnt & ORF_COMMON_PART_REMOVE_ALL) {
-+				if (p_pnt < p_end &&
-+				    *p_pnt & ORF_COMMON_PART_REMOVE_ALL) {
- 					if (bgp_debug_neighbor_events(peer))
- 						zlog_debug(
- 							"%pBP rcvd Remove-All pfxlist ORF request",
---=20
-2.35.5
-
diff --git a/meta-networking/recipes-protocols/frr/frr_8.4.4.bb b/meta-netw=
orking/recipes-protocols/frr/frr_9.0.1.bb
similarity index 91%
rename from meta-networking/recipes-protocols/frr/frr_8.4.4.bb
rename to meta-networking/recipes-protocols/frr/frr_9.0.1.bb
index 826b6878065c..b656d91a97c0 100644
--- a/meta-networking/recipes-protocols/frr/frr_8.4.4.bb
+++ b/meta-networking/recipes-protocols/frr/frr_9.0.1.bb
@@ -6,18 +6,15 @@ HOMEPAGE =3D "https://frrouting.org/"
 SECTION =3D "net"
=20
 LICENSE =3D "GPL-2.0-only & LGPL-2.1-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a426=
3 \
-                    file://COPYING-LGPLv2.1;md5=3D4fbd65380cdd255951079008=
b364516c"
+LIC_FILES_CHKSUM =3D "file://doc/licenses/GPL-2.0;md5=3Db234ee4d69f5fce448=
6a80fdaf4a4263 \
+                    file://doc/licenses/LGPL-2.1;md5=3D4fbd65380cdd2559510=
79008b364516c"
=20
-SRC_URI =3D "git://github.com/FRRouting/frr.git;protocol=3Dhttps;branch=3D=
stable/8.4 \
+SRC_URI =3D "git://github.com/FRRouting/frr.git;protocol=3Dhttps;branch=3D=
stable/9.0 \
            file://frr.pam \
-           file://0001-m4-ax_python.m4-check-for-python-x.y-emded.pc-not-p=
y.patch \
-           file://CVE-2023-3748.patch \
-           file://CVE-2023-41358.patch \
-           file://CVE-2023-41360.patch \
+           file://0001-tools-make-quiet-actually-suppress-output.patch \
            "
=20
-SRCREV =3D "45e36c0c00a517ad1606135b18c5753e210cfc0d"
+SRCREV =3D "31ed3dd753d62b5d8916998bc32814007e91364b"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "frr-(?P<pver>\d+(\.\d+)+)$"
=20
@@ -28,7 +25,7 @@ S =3D "${WORKDIR}/git"
 inherit autotools-brokensep python3native pkgconfig useradd systemd
=20
 DEPENDS:class-native =3D "bison-native elfutils-native"
-DEPENDS:class-target =3D "bison-native json-c readline c-ares libyang frr-=
native"
+DEPENDS:class-target =3D "bison-native json-c readline c-ares libyang frr-=
native protobuf-c-native protobuf-c"
=20
 RDEPENDS:${PN}:class-target =3D "iproute2 python3-core bash"
=20
--=20
2.42.0


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


