Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CAB2E98FD1
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 06:19:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.126492.1775715558639351704
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Apr 2026 23:19:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=lNWjlAby;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8559144404=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638NUVwU1189662
	for <openembedded-devel@lists.openembedded.org>; Thu, 9 Apr 2026 06:19:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=tDnZ/ESZ0/dV3+K8Z8rWZN8IXiiNMMXTN06AKepqxVY=; b=lNWjlAbyJtGl
	musW6Qq0+2Zrft4TxO8MyrKMjF6YpKi5BTD4PNe1elMLbLrMENCw+HY10ZP+hJNc
	m4C31ur89elAQemcrXj9F9xCbdfEnMfswXtqTKfIAjQ+10vurB6y+M1n4ApCpZnz
	XORAg072tjshIIHIiWku6vC3a2yFQ0UE4xasMIDE2QFThbNzZBHkHyfBxSu3Bjd3
	Bw+UpZ8SLJ9abe74oQoJ7wvLh0TeHTpJT9GPDJOCuPmrMwj8RYoBf60SA55OyeZV
	Au9y5X+yXMZORWr5Jj1T0qh7vOYkofIydLSusux7t8EpodwJv34VZqkyNU2zYhXJ
	FY+/YN1OWQ==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dcmrybrbm-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 06:19:17 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 8 Apr 2026 23:19:16 -0700
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 8 Apr 2026 23:19:16 -0700
From: <jinfeng.wang.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][scarthgap][PATCH 11/11] nmap: rename enum PCAP_SOCKET
Date: Thu, 9 Apr 2026 14:19:04 +0800
Message-ID: <20260409061904.1694992-12-jinfeng.wang.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260409061904.1694992-1-jinfeng.wang.cn@windriver.com>
References: <20260409061904.1694992-1-jinfeng.wang.cn@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=QoduG1yd c=1 sm=1 tr=0 ts=69d744e5 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=auHYCxwYAAAA:8 a=t7CeM3EgAAAA:8
 a=z-s7J8Uy6d8aGQUi-5sA:9 a=67XU6oJk2Lrwzah0vfu5:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: kcg-B0Cdgl0sNq5mwaPfTDqFg_hfrh0a
X-Proofpoint-ORIG-GUID: kcg-B0Cdgl0sNq5mwaPfTDqFg_hfrh0a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA1NCBTYWx0ZWRfXyGP0So39i0u7
 gExwcEpvJlGTCPgwjsJjwft2JnknV7x60+mL8sjOqRehKoMdsrbUrBRTxlGpFENZPh3eye8z+kk
 1KuoAEY0qDJOTicH1GroPEgA9skzLM6EnC6iVSn0eSh7DhK16CFITWm7UnXDQz3DJmsORILJzD6
 4mf2NYz0z0CPf8cRtOdIYHJOEustGLglMGORZQqr9a4nGnO7TwCbdixRnazt/tnqaWaBCOt2Usn
 7zDL1brZ4oEhvMQ4pYUZT8eKfJQApjmjhM8b0gtzPq7nGgF1+N03i0z9zsi29FLTJOEm8Waopeq
 s1RXdhIimJRvVF/IY6Nod7R9q2GHKQhixBlp2tlR8mIDzhzLzGHTZokPzGvqEjcFWERdbnwTZ1t
 Yc4KcJ9EPtWNb3IcLQ4//igl0thOCh3TuP1fV7TUY32lsa8KwuycXxaa3ZPZ7dBLfC6eD9LcHtH
 ubIwzeqj6PR7s/l2mDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_01,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090054
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 06:19:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126122

From: Kai Kang <kai.kang@windriver.com>

It fails to build nmap after upgrade libpcap to 1.10.6 which defines the
macro PCAP_SOCKET already. Rename the enum PCAP_SOCKET to NM_PCAP_SOCKET
for nmap to make it work with libpcap 1.10.6.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
---
 .../files/nmap-rename-enum-PCAP_SOCKET.patch  | 86 +++++++++++++++++++
 meta-oe/recipes-security/nmap/nmap_7.80.bb    |  1 +
 2 files changed, 87 insertions(+)
 create mode 100644 meta-oe/recipes-security/nmap/files/nmap-rename-enum-PCAP_SOCKET.patch

diff --git a/meta-oe/recipes-security/nmap/files/nmap-rename-enum-PCAP_SOCKET.patch b/meta-oe/recipes-security/nmap/files/nmap-rename-enum-PCAP_SOCKET.patch
new file mode 100644
index 0000000000..e6bf26ebb6
--- /dev/null
+++ b/meta-oe/recipes-security/nmap/files/nmap-rename-enum-PCAP_SOCKET.patch
@@ -0,0 +1,86 @@
+The enum PCAP_SOCKET conflicts with the one from libpcap 1.10.6 and fails to
+compile:
+
+In file included from /path_to/tmp-glibc/work/corei7-64-wrs-linux/nmap/7.80/recipe-sysroot/usr/include/pcap/pcap.h:130,
+                 from /path_to/tmp-glibc/work/corei7-64-wrs-linux/nmap/7.80/recipe-sysroot/usr/include/pcap.h:43,
+                 from tcpip.h:140,
+                 from nse_nsock.cc:4:
+nse_nsock.cc:36:3: error: expected identifier before 'int'
+   36 |   PCAP_SOCKET = lua_upvalueindex(3), /* pcap socket metatable */
+      |   ^~~~~~~~~~~
+nse_nsock.cc:36:3: error: expected '}' before 'int'
+nse_nsock.cc:33:6: note: to match this '{'
+   33 | enum {
+      |      ^
+nse_nsock.cc:36:15: error: expected unqualified-id before '=' token
+   36 |   PCAP_SOCKET = lua_upvalueindex(3), /* pcap socket metatable */
+      |               ^
+nse_nsock.cc:40:1: error: expected declaration before '}' token
+   40 | };
+      | ^
+
+The enum PCAP_SOCKET is removed in nmap later version. But the removal commit
+involves extra logic change, so just rename the enum PCAP_SOCKET to
+NM_PCAP_SOCKET to make it work with libpcap 1.10.6.
+
+Upstream-Status: Inappropriate [local fix to work with libpcap 1.10.6]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ nse_nsock.cc | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/nse_nsock.cc b/nse_nsock.cc
+index df98666..9cecac6 100644
+--- a/nse_nsock.cc
++++ b/nse_nsock.cc
+@@ -33,7 +33,7 @@
+ enum {
+   NSOCK_POOL = lua_upvalueindex(1),
+   NSOCK_SOCKET = lua_upvalueindex(2), /* nsock socket metatable */
+-  PCAP_SOCKET = lua_upvalueindex(3), /* pcap socket metatable */
++  NM_PCAP_SOCKET = lua_upvalueindex(3), /* pcap socket metatable */
+   THREAD_SOCKETS = lua_upvalueindex(4), /* <Thread, Table of Sockets (keys)> */
+   CONNECT_WAITING = lua_upvalueindex(5), /* Threads waiting to lock */
+   KEY_PCAP = lua_upvalueindex(6) /* Keys to pcap sockets */
+@@ -959,7 +959,7 @@ static int nsock_gc (lua_State *L)
+ }
+ 
+ 
+-/****************** PCAP_SOCKET ***********************************************/
++/****************** NM_PCAP_SOCKET ***********************************************/
+ 
+ static void dnet_to_pcap_device_name (lua_State *L, const char *device)
+ {
+@@ -1026,7 +1026,7 @@ static int l_pcap_open (lua_State *L)
+       nsock_iod_delete(*nsiod, NSOCK_PENDING_ERROR);
+       luaL_error(L, "can't open pcap reader on %s", device);
+     }
+-    lua_pushvalue(L, PCAP_SOCKET);
++    lua_pushvalue(L, NM_PCAP_SOCKET);
+     lua_setmetatable(L, -2);
+     lua_pushvalue(L, 7); /* the pcap socket key */
+     lua_pushvalue(L, -2); /* the pcap socket nsiod */
+@@ -1134,7 +1134,7 @@ LUALIB_API int luaopen_nsock (lua_State *L)
+   /* library upvalues */
+   nsock_pool nsp = new_pool(L); /* NSOCK_POOL */
+   lua_newtable(L); /* NSOCK_SOCKET */
+-  lua_newtable(L); /* PCAP_SOCKET */
++  lua_newtable(L); /* NM_PCAP_SOCKET */
+   nseU_weaktable(L, 0, MAX_PARALLELISM, "k"); /* THREAD_SOCKETS */
+   nseU_weaktable(L, 0, 1000, "k"); /* CONNECT_WAITING */
+   nseU_weaktable(L, 0, 0, "v"); /* KEY_PCAP */
+@@ -1154,11 +1154,11 @@ LUALIB_API int luaopen_nsock (lua_State *L)
+   lua_pop(L, 1); /* NSOCK_SOCKET */
+ 
+   /* Create the nsock pcap metatable */
+-  lua_pushvalue(L, top+3); /* PCAP_SOCKET */
++  lua_pushvalue(L, top+3); /* NM_PCAP_SOCKET */
+   for (i = top+1; i <= top+nupvals; i++) lua_pushvalue(L, i);
+   lua_pushcclosure(L, pcap_gc, nupvals);
+   lua_setfield(L, top+3, "__gc");
+-  lua_pop(L, 1); /* PCAP_SOCKET */
++  lua_pop(L, 1); /* NM_PCAP_SOCKET */
+ 
+ #if HAVE_OPENSSL
+   /* Set up the SSL certificate userdata code in nse_ssl_cert.cc. */
diff --git a/meta-oe/recipes-security/nmap/nmap_7.80.bb b/meta-oe/recipes-security/nmap/nmap_7.80.bb
index f9fe82a91d..18b1a50246 100644
--- a/meta-oe/recipes-security/nmap/nmap_7.80.bb
+++ b/meta-oe/recipes-security/nmap/nmap_7.80.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://nmap.org/dist/${BP}.tar.bz2 \
            file://0002-Fix-building-with-libc.patch \
            file://0001-Make-ndiff-support-python3.patch \
            file://0001-configure.ac-make-ndiff-depend-on-python3.patch \
+           file://nmap-rename-enum-PCAP_SOCKET.patch \
            "
 
 SRC_URI[md5sum] = "d37b75b06d1d40f27b76d60db420a1f5"
-- 
2.34.1


