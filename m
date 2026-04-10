Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77C4AE9904A
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 07:05:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.150889.1775804723598013049
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Apr 2026 00:05:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=cGRFaGV+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8560f54642=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A4uSWm1889323
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 07:05:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=LFCobzcU3Zxx1N7Oca2Wn0Wtti5vq2dhMIBGbgmOhKs=; b=cGRFaGV+5E79
	xAc/t9ENZgizVQ7i0r0WOUBfk83gW8JFlhY5xGYU+I6xYPZ6/AkfgEfYtcoaS57U
	CGZ71aTQ134eXv7XnEqm447+k8S/5aIXgjNEw381X9Tn0CfyI5zkfBMqYhcJluTn
	JmOO858jG/dRe2xpjZn4jDqmnbjQfsMh5dTTf51TH+yygvO04tqKGrfyAPrivhvu
	f7+9wl19060cRBWu3jnG4ZyP+e6JjUcT5p69uind+Rxo4Y1iJ0aJfhE7RV/Qif0r
	WDv/utc4WCLWW8Es7i8ShWG3g9KHWNLTEzUG3VaU5qse5fa30gtFgSo3dclGoLm9
	6zMnvwj4pg==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dcmrqn78a-7
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 07:05:22 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Fri, 10 Apr 2026 00:05:20 -0700
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Fri, 10 Apr 2026 00:05:19 -0700
From: <jinfeng.wang.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][scarthgap][PATCH v2 11/11] nmap: rename enum PCAP_SOCKET
Date: Fri, 10 Apr 2026 15:05:08 +0800
Message-ID: <20260410070508.1104455-12-jinfeng.wang.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260410070508.1104455-1-jinfeng.wang.cn@windriver.com>
References: <20260410070508.1104455-1-jinfeng.wang.cn@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=RPCD2Yi+ c=1 sm=1 tr=0 ts=69d8a132 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=auHYCxwYAAAA:8 a=t7CeM3EgAAAA:8
 a=KyFNLv5clugHamg7ulAA:9 a=67XU6oJk2Lrwzah0vfu5:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: TYKHmNFRba3OwS2ekVBrAQ-od1gBPj75
X-Proofpoint-GUID: TYKHmNFRba3OwS2ekVBrAQ-od1gBPj75
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA2MyBTYWx0ZWRfX9Th9Hp5rJJWH
 chOeBP8u/okzIzW1IFu9txp4dSdIMEzLGUbUOTGUmrT/B3rna9i+PwCYOmjsou4RUpjD+5oTPbD
 7eFR9jKcOfEpU7iO/+It25Ss/6FusCDNf3gpWXQQdTLESAwa6NYX3EXgjU3wHYduGO3W/ULh10h
 JLwUP/pz8CWdU0qxsoGCCsk9DxadUaBCXGk3lt9zagUOa6byb7dS5T46VzN951qhBRfUGTEeWXs
 MfxMUTmL0SS8G30GqI6rsNJcaRuAz2P+h1ASV/fM1sXycGonKPWta31Z/PC4uhLMmdbP8z9gMeG
 oj0ZY9dKTYUzqPraORCknvjyR2Wg1i2bu8ORIzFmc7kpd5hpar5cRqC+iu9cjlSITzygYIoRdFA
 RtbP+gwBgwM24I74xulmksYAmuogtNSvVqz+qakHTOObHRrbrrexe3DIK5nJ+ThZb/YABHuFXnT
 3oazYgiBltZqiMvTlOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100063
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 07:05:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126233

From: Jinfeng Wang <jinfeng.wang.cn@windriver.com>

The enum PCAP_SOCKET conflicts with the PCAP_SOCKET macro introduced in
libpcap 1.10.5. Use ifdefs to handle both old and new libpcap versions,
renaming the enum to NM_PCAP_SOCKET when the PCAP_SOCKET macro is defined.

Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
---
 .../files/nmap-rename-enum-PCAP_SOCKET.patch  | 81 +++++++++++++++++++
 meta-oe/recipes-security/nmap/nmap_7.80.bb    |  1 +
 2 files changed, 82 insertions(+)
 create mode 100644 meta-oe/recipes-security/nmap/files/nmap-rename-enum-PCAP_SOCKET.patch

diff --git a/meta-oe/recipes-security/nmap/files/nmap-rename-enum-PCAP_SOCKET.patch b/meta-oe/recipes-security/nmap/files/nmap-rename-enum-PCAP_SOCKET.patch
new file mode 100644
index 0000000000..fd10f21a8f
--- /dev/null
+++ b/meta-oe/recipes-security/nmap/files/nmap-rename-enum-PCAP_SOCKET.patch
@@ -0,0 +1,81 @@
+From 4b0a7a2ca9fb9019327f61da1e0ca5e72aec89e4 Mon Sep 17 00:00:00 2001
+From: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
+Date: Fri, 10 Apr 2026 11:08:48 +0800
+Subject: [PATCH] nmap: fix PCAP_SOCKET enum conflict with libpcap >= 1.10.5
+
+The enum PCAP_SOCKET conflicts with the PCAP_SOCKET macro introduced in
+libpcap 1.10.5 and fails to compile:
+
+In file included from /path_to/tmp-glibc/work/corei7-64-wrs-linux/nmap/7.80/recipe-sysroot/usr/include/pcap/pcap.h:130,
+                 from /path_to/tmp-glibc/work/corei7-64-wrs-linux/nmap/7.80/recipe-sysroot/usr/include/pcap.h:43,
+                 from tcpip.h:140,
+                 from nse_nsock.cc:4:
+nse_nsock.cc:36:3: error: expected identifier before 'int'
+   36 |   PCAP_SOCKET = lua_upvalueindex(3), /* pcap socket metatable */
+      |   ^~~~~~~~~~~
+
+The enum PCAP_SOCKET is removed in nmap later version. But the removal commit
+involves extra logic change, so just rename the enum PCAP_SOCKET to
+NM_PCAP_SOCKET to make it work with libpcap >= 1.10.5.
+
+Upstream-Status: Inappropriate [fix to work with libpcap >= 1.10.5]
+
+Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
+---
+ nse_nsock.cc | 14 +++++++++++---
+ 1 file changed, 11 insertions(+), 3 deletions(-)
+
+diff --git a/nse_nsock.cc b/nse_nsock.cc
+index df98666..db942e1 100644
+--- a/nse_nsock.cc
++++ b/nse_nsock.cc
+@@ -33,7 +33,11 @@
+ enum {
+   NSOCK_POOL = lua_upvalueindex(1),
+   NSOCK_SOCKET = lua_upvalueindex(2), /* nsock socket metatable */
++#ifdef PCAP_SOCKET
++  NM_PCAP_SOCKET = lua_upvalueindex(3), /* pcap socket metatable */
++#else
+   PCAP_SOCKET = lua_upvalueindex(3), /* pcap socket metatable */
++#endif
+   THREAD_SOCKETS = lua_upvalueindex(4), /* <Thread, Table of Sockets (keys)> */
+   CONNECT_WAITING = lua_upvalueindex(5), /* Threads waiting to lock */
+   KEY_PCAP = lua_upvalueindex(6) /* Keys to pcap sockets */
+@@ -1026,7 +1030,11 @@ static int l_pcap_open (lua_State *L)
+       nsock_iod_delete(*nsiod, NSOCK_PENDING_ERROR);
+       luaL_error(L, "can't open pcap reader on %s", device);
+     }
++#ifdef PCAP_SOCKET
++    lua_pushvalue(L, NM_PCAP_SOCKET);
++#else
+     lua_pushvalue(L, PCAP_SOCKET);
++#endif
+     lua_setmetatable(L, -2);
+     lua_pushvalue(L, 7); /* the pcap socket key */
+     lua_pushvalue(L, -2); /* the pcap socket nsiod */
+@@ -1134,7 +1142,7 @@ LUALIB_API int luaopen_nsock (lua_State *L)
+   /* library upvalues */
+   nsock_pool nsp = new_pool(L); /* NSOCK_POOL */
+   lua_newtable(L); /* NSOCK_SOCKET */
+-  lua_newtable(L); /* PCAP_SOCKET */
++  lua_newtable(L); /* NM_PCAP_SOCKET or PCAP_SOCKET depending on libpcap version */
+   nseU_weaktable(L, 0, MAX_PARALLELISM, "k"); /* THREAD_SOCKETS */
+   nseU_weaktable(L, 0, 1000, "k"); /* CONNECT_WAITING */
+   nseU_weaktable(L, 0, 0, "v"); /* KEY_PCAP */
+@@ -1154,11 +1162,11 @@ LUALIB_API int luaopen_nsock (lua_State *L)
+   lua_pop(L, 1); /* NSOCK_SOCKET */
+ 
+   /* Create the nsock pcap metatable */
+-  lua_pushvalue(L, top+3); /* PCAP_SOCKET */
++  lua_pushvalue(L, top+3); /* NM_PCAP_SOCKET or PCAP_SOCKET depending on libpcap version */
+   for (i = top+1; i <= top+nupvals; i++) lua_pushvalue(L, i);
+   lua_pushcclosure(L, pcap_gc, nupvals);
+   lua_setfield(L, top+3, "__gc");
+-  lua_pop(L, 1); /* PCAP_SOCKET */
++  lua_pop(L, 1); /* NM_PCAP_SOCKET or PCAP_SOCKET depending on libpcap version */
+ 
+ #if HAVE_OPENSSL
+   /* Set up the SSL certificate userdata code in nse_ssl_cert.cc. */
+-- 
+2.34.1
+
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


