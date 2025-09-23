Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B59FCAC5A7
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 15:41:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.932.1758642104189000022
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 08:41:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=IAybwk6i;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1361e09881=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58NCdcCG2385987
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 15:41:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=qC9X2+xwfNXgQUhUbTPO
	RpAEZloxMCf9Zr96aHrfZPk=; b=IAybwk6iCDio664lLCIIq205XreVJUWqqCrf
	lDOH5l4VR3623KAlXhTScWeOlOxXzCTpe3z1ZVVn1a3JW77OxH+4Sey5eRcN9gXf
	527lEzaTqQGX+UHtV7rSWtlAZ+VZVCwv8j/THUULGSMvonOH+DlchvMQqQLWTOQD
	vIqjWZyqrS/XcrzSqGbh/vcRpHHyePfjxqibPyttkVsUF8DgSnS5pA4X0ZUntLRn
	kl13apJDaPEvqx6Z39OUUjVfb7QbYR+ySFcGRENuQRkqtmtZ+/sAg3nXvSg5iHXo
	HXtsuTYx7SjOMTTkg5ZcYyI8h1ISodXGdjCk0rXb4nMO69q/hw==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 499k89ba8r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 15:41:43 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Tue, 23 Sep 2025 08:41:42 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Tue, 23 Sep 2025 08:41:40 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-networking][PATCH  1/1] tcpreplay: upgrade 4.5.1 -> 4.5.2
Date: Tue, 23 Sep 2025 21:11:24 +0530
Message-ID: <20250923154124.2726663-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDE0NSBTYWx0ZWRfX72bDwFQ/Jcog
 qskYacz1A2IQ5UmNLdkGuU5icLOxqRicGGqhsacbWvfDmFoD8KsObuqJaxYR0cK4Wtku+Ar+26H
 Mg43bYCADZHxbHwmkXURPPhEWc7Q/ZPpBd+1FIufUY7PoJ2U9LgfJX52LwFFBe9Ci5nIb2Gz950
 xDqckG0IXfNfbTDhgLSknjmV8VmiKlZL6AxZxLiWAeSAvfTum+yfmFWnQOz07CkUt/T/XkEdB3q
 mQMozpMbhGmuGX9jMiwsatgr1vE3xgmOIiiVKsTCR6im4lkeosvgdHwQ9VG8D7q7aFeA9rAvp0i
 dNOatKBg0vdMvZ75oud94LYerFFRd/jnzdxDaVeCCOpEqIJi+GKyO3HJbah3kY=
X-Authority-Analysis: v=2.4 cv=YZS95xRf c=1 sm=1 tr=0 ts=68d2bfb7 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8 a=iGHA9ds3AAAA:8 a=t7CeM3EgAAAA:8
 a=57SyGIRnAAAA:8 a=dsS36Yt1pm8G_BbEj9MA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: YDvsF6wcvdm26pn6cGcgdc__88i08FLb
X-Proofpoint-ORIG-GUID: YDvsF6wcvdm26pn6cGcgdc__88i08FLb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_03,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 15:41:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119716

From: Archana Polampalli <archana.polampalli@windriver.com>

Changelog:
https://github.com/appneta/tcpreplay/releases/tag/v4.5.2

Drop patches that have been merged upstream.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../0001-Fix-linker-error-for-TX_RING.patch   | 71 -------------------
 ...mpatible-type-assignment-in-txring.c.patch | 31 --------
 ...{tcpreplay_4.5.1.bb => tcpreplay_4.5.2.bb} |  4 +-
 3 files changed, 1 insertion(+), 105 deletions(-)
 delete mode 100644 meta-networking/recipes-support/tcpreplay/tcpreplay/0001-Fix-linker-error-for-TX_RING.patch
 delete mode 100644 meta-networking/recipes-support/tcpreplay/tcpreplay/0002-fix-incompatible-type-assignment-in-txring.c.patch
 rename meta-networking/recipes-support/tcpreplay/{tcpreplay_4.5.1.bb => tcpreplay_4.5.2.bb} (75%)

diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay/0001-Fix-linker-error-for-TX_RING.patch b/meta-networking/recipes-support/tcpreplay/tcpreplay/0001-Fix-linker-error-for-TX_RING.patch
deleted file mode 100644
index d8f0ab270c..0000000000
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay/0001-Fix-linker-error-for-TX_RING.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 36e038d9e4047ae42a148f671f18971cc6a68558 Mon Sep 17 00:00:00 2001
-From: "mark.yang" <mark.yang@lge.com>
-Date: Thu, 10 Apr 2025 18:30:52 +0900
-Subject: [PATCH] Fix linker error for TX_RING
-
-Found similar issue in gcc 15 build environment.
-- See more details at: http://errors.yoctoproject.org/Errors/Details/851800/
-```
-TOPDIR/tmp/work/core2-64-oe-linux/tcpreplay/4.5.1/recipe-sysroot-native/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/15.0.1/ld: ./common/libcommon.a(sendpacket.o): in function `sendpacket':
-/usr/src/debug/tcpreplay/4.5.1/src/common/sendpacket.c:328:(.text+0x1be): undefined reference to `txring_put'
-TOPDIR/tmp/work/core2-64-oe-linux/tcpreplay/4.5.1/recipe-sysroot-native/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/15.0.1/ld: ./common/libcommon.a(sendpacket.o): in function `sendpacket_open_pf':
-/usr/src/debug/tcpreplay/4.5.1/src/common/sendpacket.c:1088:(.text+0x7ea): undefined reference to `txring_init'
-TOPDIR/tmp/work/core2-64-oe-linux/tcpreplay/4.5.1/recipe-sysroot-native/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/15.0.1/ld: ./common/libcommon.a(sendpacket.o): in function `sendpacket':
-/usr/src/debug/tcpreplay/4.5.1/src/common/sendpacket.c:328:(.text+0x1be): undefined reference to `txring_put'
-TOPDIR/tmp/work/core2-64-oe-linux/tcpreplay/4.5.1/recipe-sysroot-native/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/15.0.1/ld: ./common/libcommon.a(sendpacket.o): in function `sendpacket_open_pf':
-/usr/src/debug/tcpreplay/4.5.1/src/common/sendpacket.c:1088:(.text+0x7ea): undefined reference to `txring_init'
-TOPDIR/tmp/work/core2-64-oe-linux/tcpreplay/4.5.1/recipe-sysroot-native/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/15.0.1/ld: ./common/libcommon.a(sendpacket.o): in function `sendpacket':
-/usr/src/debug/tcpreplay/4.5.1/src/common/sendpacket.c:328:(.text+0x1be): undefined reference to `txring_put'
-TOPDIR/tmp/work/core2-64-oe-linux/tcpreplay/4.5.1/recipe-sysroot-native/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/15.0.1/ld: ./common/libcommon.a(sendpacket.o): in function `sendpacket_open_pf':
-/usr/src/debug/tcpreplay/4.5.1/src/common/sendpacket.c:1088:(.text+0x7ea): undefined reference to `txring_init'
-```
-- The result of "nm -u txring.o" shows no symbols exist.
-
-- The config.h has HAVE_TX_RING defined but txring.c is not aware of it.
-  txring.c and txring.h include config.h at the beginning.
-
-- This resulted in a successful build in my build environment.
-
-It may
-Fixes #731
-Fixes #904
-
-Upstream-Status: Submitted [https://github.com/appneta/tcpreplay/pull/924]
-Signed-off-by: mark.yang <mark.yang@lge.com>
----
- src/common/txring.c | 3 +++
- src/common/txring.h | 4 ++--
- 2 files changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/src/common/txring.c b/src/common/txring.c
-index d5768d75..f522893d 100644
---- a/src/common/txring.c
-+++ b/src/common/txring.c
-@@ -31,6 +31,9 @@
-  * ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-  */
- 
-+#include "defines.h"
-+#include "config.h"
-+
- #ifdef HAVE_TX_RING
- 
- #include "txring.h"
-diff --git a/src/common/txring.h b/src/common/txring.h
-index 309da84c..3f14cac0 100644
---- a/src/common/txring.h
-+++ b/src/common/txring.h
-@@ -33,11 +33,11 @@
- 
- #pragma once
- 
--#ifdef HAVE_TX_RING
--
- #include "defines.h"
- #include "config.h"
- 
-+#ifdef HAVE_TX_RING
-+
- #if __GLIBC__ >= 2 && __GLIBC_MINOR >= 1
- #include <net/ethernet.h> /* the L2 protocols */
- #include <netpacket/packet.h>
diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay/0002-fix-incompatible-type-assignment-in-txring.c.patch b/meta-networking/recipes-support/tcpreplay/tcpreplay/0002-fix-incompatible-type-assignment-in-txring.c.patch
deleted file mode 100644
index 906c30e147..0000000000
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay/0002-fix-incompatible-type-assignment-in-txring.c.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 5615e8f7bbf83f03acacd6d6ba9ff8dc6fdc91df Mon Sep 17 00:00:00 2001
-From: "mark.yang" <mark.yang@lge.com>
-Date: Thu, 10 Apr 2025 18:49:51 +0900
-Subject: [PATCH] fix incompatible type assignment in txring.c
-
-* There is an incompatible type assignment error in txring.c.
-  txring.c:200:12: error: incompatible types when assigning to type 'txring_t' {aka 'struct txring_s'} from type 'txring_t *' {aka 'struct txring_s *'}
-  200 |     *txp = (txring_t *)safe_malloc(sizeof(txring_t));
-      |            ^
-
-  txp is allocated as txring_t *, so I fixed it.
-
-Upstream-Status: Submitted [https://github.com/appneta/tcpreplay/pull/924]
-Signed-off-by: mark.yang <mark.yang@lge.com>
----
- src/common/txring.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/common/txring.c b/src/common/txring.c
-index f522893d..b062dac2 100644
---- a/src/common/txring.c
-+++ b/src/common/txring.c
-@@ -197,7 +197,7 @@ txring_init(int fd, unsigned int mtu)
-     txring_t *txp;
- 
-     /* allocate memory for structure and fill it with different stuff*/
--    *txp = (txring_t *)safe_malloc(sizeof(txring_t));
-+    txp = (txring_t *)safe_malloc(sizeof(txring_t));
-     txp->treq = (struct tpacket_req *)safe_malloc(sizeof(struct tpacket_req));
- 
-     txring_mkreq(txp->treq, mtu);
diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.5.1.bb b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.5.2.bb
similarity index 75%
rename from meta-networking/recipes-support/tcpreplay/tcpreplay_4.5.1.bb
rename to meta-networking/recipes-support/tcpreplay/tcpreplay_4.5.2.bb
index 46e06a928e..96a7087b0b 100644
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.5.1.bb
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.5.2.bb
@@ -9,11 +9,9 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=10f0474a2f0e5dccfca20f69d6598ad8"
 
 SRC_URI = "https://github.com/appneta/${BPN}/releases/download/v${PV}/${BP}.tar.gz \
     file://0001-libopts.m4-set-POSIX_SHELL-to-bin-sh.patch \
-    file://0001-Fix-linker-error-for-TX_RING.patch \
-    file://0002-fix-incompatible-type-assignment-in-txring.c.patch \
 "
 
-SRC_URI[sha256sum] = "2de79bfd67ec92ca9ae2ffb50456dd1d53ff40f3fa71b422c65e8062013c9e85"
+SRC_URI[sha256sum] = "ccff3bb29469a04ccc20ed0b518e3e43c4a7b5a876339d9435bfd9db7fe5d0f1"
 
 UPSTREAM_CHECK_URI = "https://github.com/appneta/tcpreplay/releases"
 
-- 
2.40.0


