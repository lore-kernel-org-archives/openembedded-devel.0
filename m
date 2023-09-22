Return-Path: <jonas.gorski@bisdn.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD353E6FE22
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 12:40:42 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.20559.1695386440372999498
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Sep 2023 05:40:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bisdn-de.20230601.gappssmtp.com header.s=20230601 header.b=EsuhvADs;
 spf=none, err=SPF record not found (domain: bisdn.de, ip: 209.85.128.51, mailfrom: jonas.gorski@bisdn.de)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-405361bb949so17488065e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 05:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bisdn-de.20230601.gappssmtp.com; s=20230601; t=1695386439; x=1695991239; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EQSfgqxpSdLHX6NShUGzgxUGqyvaizR248R3o6oSECA=;
        b=EsuhvADsIWOSAhwCXTGh+VpMqaocrcWA2XNBFDxwsdnC6+EdCHMFc4c2NXhVPUkfOX
         g270j/Or0l1OFgqShosHISLdXORnkrqyNUNniP6ADfn5xZbUHaxU/sw/8KsUg/4eFdBp
         NfzegsmC2BfvMtXXyESmyM2734mWJt1gt/tP4Ibl/txWuO89nqN9MCwLOzyFRAc6r+XK
         JKSg4GGzAlgT4CXNg8ILXz+0bI3wxUvdUU31RVqDdGrO6skYVIJvyHfqxLLXLLiTyGaS
         nhh758CP7XneBLuqG00297ZHqe9pkUObUYlEgNCCF49kriNWO3qk4Unt5dlD3FqP6O9f
         J/4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695386439; x=1695991239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EQSfgqxpSdLHX6NShUGzgxUGqyvaizR248R3o6oSECA=;
        b=J4MwZRX8QkosFdHHWD7jzifXUXHIJL09XjynrGq/Oc9fkLJXamgPThMrZNFgJrtuot
         MWmV7zpL3dneo1hbU+P5oYJ4V0K6R9/ZO+J4rMC6iNiCol3R0JTJUwcJiWHs3rR3LqOW
         o9U4lkD5yTl+bWrZDSEUvl0qVOvrSpNg1wMueb5B+Yr6MceJH0THXoDyc6PUG6OZ2Gck
         LXpz9Q9syJMdqTCrKsudW2wfe+wz8ocEb315jnSjq/CNOotfiijFVE+GaYcuzGqHNSL0
         wqQ7z2mSZC5w+aarsOtAgQV38BjmbNYzya+cx7GIUtla7UtFQEySMTSa4hnUO7yo7TIW
         DE8w==
X-Gm-Message-State: AOJu0YzB4Y4iRmNuGLrjwKUIWOrwrUtjoSi1fKxeIpFlZmXZ7nyPJ0c9
	1pPDbbcbz0M0F72U82jdQXnRGuqoX+4VQs0CGG2iFOlTaSYsnkvPtUeLT28Jdfrq4iQ3B6GgKIc
	kE1B//y6ubGu+Fn1JpLpH14OMx6biXC69bU8KHX2wtugXyio8
X-Google-Smtp-Source: AGHT+IFj2MRaQDyyl9ICpNaZ/Ow+4RQ+dkGL8d2Yp5wgvKAM106u9ftktjwZKq/nujb5IblU+pTcBQ==
X-Received: by 2002:a05:600c:3151:b0:405:3dee:3515 with SMTP id h17-20020a05600c315100b004053dee3515mr1556139wmo.27.1695386438640;
        Fri, 22 Sep 2023 05:40:38 -0700 (PDT)
Received: from localhost (dslb-002-205-020-122.002.205.pools.vodafone-ip.de. [2.205.20.122])
        by smtp.gmail.com with ESMTPSA id n6-20020a1c7206000000b003fe4ca8decdsm7432761wmc.31.2023.09.22.05.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 05:40:37 -0700 (PDT)
From: Jonas Gorski <jonas.gorski@bisdn.de>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH v3] frr: upgrade 8.4.4 -> 9.0.1
Date: Fri, 22 Sep 2023 14:40:34 +0200
Message-ID: <20230922124034.672823-1-jonas.gorski@bisdn.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="ISO-8859-1"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 12:40:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105065

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
v2 -> v3:
 * disable -fcanon-prefix-map as it breaks compilation

v1 -> v2:
 * actually include the new patch

 ...check-for-python-x.y-emded.pc-not-py.patch |  33 ------
 ...-make-quiet-actually-suppress-output.patch |  58 ++++++++++
 .../frr/frr/CVE-2023-3748.patch               |  54 ---------
 .../frr/frr/CVE-2023-41358.patch              | 106 ------------------
 .../frr/frr/CVE-2023-41360.patch              |  35 ------
 .../frr/{frr_8.4.4.bb =3D> frr_9.0.1.bb}        |  18 +--
 6 files changed, 67 insertions(+), 237 deletions(-)
 delete mode 100644 meta-networking/recipes-protocols/frr/frr/0001-m4-ax_py=
thon.m4-check-for-python-x.y-emded.pc-not-py.patch
 create mode 100644 meta-networking/recipes-protocols/frr/frr/0001-tools-ma=
ke-quiet-actually-suppress-output.patch
 delete mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2023-3748=
.patch
 delete mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2023-4135=
8.patch
 delete mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2023-4136=
0.patch
 rename meta-networking/recipes-protocols/frr/{frr_8.4.4.bb =3D> frr_9.0.1.=
bb} (90%)

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
diff --git a/meta-networking/recipes-protocols/frr/frr/0001-tools-make-quie=
t-actually-suppress-output.patch b/meta-networking/recipes-protocols/frr/fr=
r/0001-tools-make-quiet-actually-suppress-output.patch
new file mode 100644
index 000000000000..3e93cf3c474c
--- /dev/null
+++ b/meta-networking/recipes-protocols/frr/frr/0001-tools-make-quiet-actua=
lly-suppress-output.patch
@@ -0,0 +1,58 @@
+From 312d5ee1592f8c5b616d330233d1de2643f759e2 Mon Sep 17 00:00:00 2001
+From: Jonas Gorski <jonas.gorski@bisdn.de>
+Date: Thu, 14 Sep 2023 17:04:16 +0200
+Subject: [PATCH] tools: make --quiet actually suppress output
+
+When calling daemon_stop() with --quiet and e.g. the pidfile is empty,
+it won't return early since while "$fail" is set, "$2" is "--quiet", so
+the if condition isn't met and it will continue executing, resulting
+in error messages in the log:
+
+> Sep 14 14:48:33 localhost watchfrr[2085]: [YFT0P-5Q5YX] Forked backgroun=
d command [pid 2086]: /usr/lib/frr/watchfrr.sh restart all
+> Sep 14 14:48:33 localhost frrinit.sh[2075]: /usr/lib/frr/frrcommon.sh: l=
ine 216: kill: `': not a pid or valid job spec
+> Sep 14 14:48:33 localhost frrinit.sh[2075]: /usr/lib/frr/frrcommon.sh: l=
ine 216: kill: `': not a pid or valid job spec
+> Sep 14 14:48:33 localhost frrinit.sh[2075]: /usr/lib/frr/frrcommon.sh: l=
ine 216: kill: `': not a pid or valid job spec
+
+Fix this by moving the --quiet check into the block to log_failure_msg(),
+and also add the check to all other invocations of log_*_msg() to make
+--quiet properly suppress output.
+
+Fixes: 19a99d89f088 ("tools: suppress unuseful warnings during restarting =
frr")
+Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
+Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/312d5ee=
1592f8c5b616d330233d1de2643f759e2]
+---
+ tools/frrcommon.sh.in | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/tools/frrcommon.sh.in b/tools/frrcommon.sh.in
+index f1f70119097e..00b63a78e2bc 100755
+--- a/tools/frrcommon.sh.in
++++ b/tools/frrcommon.sh.in
+@@ -207,8 +207,8 @@ daemon_stop() {
+ 	[ -z "$fail" -a -z "$pid" ] && fail=3D"pid file is empty"
+ 	[ -n "$fail" ] || kill -0 "$pid" 2>/dev/null || fail=3D"pid $pid not run=
ning"
+=20
+-	if [ -n "$fail" ] && [ "$2" !=3D "--quiet" ]; then
+-		log_failure_msg "Cannot stop $dmninst: $fail"
++	if [ -n "$fail" ]; then
++		[ "$2" =3D "--quiet" ] || log_failure_msg "Cannot stop $dmninst: $fail"
+ 		return 1
+ 	fi
+=20
+@@ -220,11 +220,11 @@ daemon_stop() {
+ 		[ $(( cnt -=3D 1 )) -gt 0 ] || break
+ 	done
+ 	if kill -0 "$pid" 2>/dev/null; then
+-		log_failure_msg "Failed to stop $dmninst, pid $pid still running"
++		[ "$2" =3D "--quiet" ] || log_failure_msg "Failed to stop $dmninst, pid=
 $pid still running"
+ 		still_running=3D1
+ 		return 1
+ 	else
+-		log_success_msg "Stopped $dmninst"
++		[ "$2" =3D "--quiet" ] || log_success_msg "Stopped $dmninst"
+ 		rm -f "$pidfile"
+ 		return 0
+ 	fi
+--=20
+2.42.0
+
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
similarity index 90%
rename from meta-networking/recipes-protocols/frr/frr_8.4.4.bb
rename to meta-networking/recipes-protocols/frr/frr_9.0.1.bb
index 826b6878065c..bddc08aebbaa 100644
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
@@ -64,6 +61,9 @@ EXTRA_OECONF:class-target =3D "--sbindir=3D${libdir}/frr =
\
=20
 CACHED_CONFIGUREVARS +=3D "ac_cv_path_PERL=3D'/usr/bin/env perl'"
=20
+# https://github.com/FRRouting/frr/issues/14469
+DEBUG_PREFIX_MAP:remove =3D "-fcanon-prefix-map"
+
 LDFLAGS:append:mips =3D " -latomic"
 LDFLAGS:append:mipsel =3D " -latomic"
 LDFLAGS:append:powerpc =3D " -latomic"
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


