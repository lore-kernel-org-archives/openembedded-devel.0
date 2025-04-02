Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20032C28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 14:24:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.9842.1743603867498934736
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Apr 2025 07:24:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=618780746e=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5323e3Bf028041
	for <openembedded-devel@lists.openembedded.org>; Wed, 2 Apr 2025 14:24:26 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45rtd4ry5g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 02 Apr 2025 14:24:26 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 2 Apr 2025 07:24:25 -0700
Received: from pop-os.wrs.com (172.25.44.6) by ala-exchng01.corp.ad.wrs.com
 (147.11.82.252) with Microsoft SMTP Server id 15.1.2507.43 via Frontend
 Transport; Wed, 2 Apr 2025 07:24:25 -0700
From: <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] valkey: update from 8.0.2 -> 8.1.0
Date: Wed, 2 Apr 2025 10:24:24 -0400
Message-ID: <20250402142424.2603060-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: gUHJk8mfTj_iat9CPmP66tbWpft5CvH-
X-Proofpoint-ORIG-GUID: gUHJk8mfTj_iat9CPmP66tbWpft5CvH-
X-Authority-Analysis: v=2.4 cv=famty1QF c=1 sm=1 tr=0 ts=67ed489a cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=gTRR15W4AAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=k-42gJp3AAAA:8
 a=1KubnttrAAAA:8 a=JF9118EUAAAA:8 a=ctMq0Hl_fjB8E81jCJcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=liMF9gaXul7mpDPLn0tx:22 a=FdTzh2GWekK77mhwV6Dw:22 a=uCSXFHLys93vLW5PjgO_:22 a=H0t3PWKhy-h45uLjrunQ:22 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_06,2025-04-02_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 mlxlogscore=999 adultscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504020091
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5323e3Bf028041
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Apr 2025 14:24:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116524

From: Randy MacLeod <Randy.MacLeod@windriver.com>

Release notes:
   https://github.com/valkey-io/valkey/releases/tag/8.1.0

The license file checksum changed because upstream added the line:
   SPDX-License-Identifier: BSD-3-Clause

Adjust the patches using devtool and manually munge the Upstream-Status-e=
s.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../valkey/0001-src-Do-not-reset-FINAL_LIBS.patch  | 13 +++++--------
 .../valkey/valkey/GNU_SOURCE-7.patch               |  4 ++--
 .../hiredis-use-default-CC-if-it-is-set.patch      |  8 +++++---
 ...Makefile-to-use-environment-build-setting.patch | 14 +++++++++-----
 .../valkey/valkey/oe-use-libc-malloc.patch         | 11 +++++++----
 .../valkey/{valkey_8.0.2.bb =3D> valkey_8.1.0.bb}    |  6 +++---
 6 files changed, 31 insertions(+), 25 deletions(-)
 rename meta-oe/recipes-extended/valkey/{valkey_8.0.2.bb =3D> valkey_8.1.=
0.bb} (92%)

diff --git a/meta-oe/recipes-extended/valkey/valkey/0001-src-Do-not-reset=
-FINAL_LIBS.patch b/meta-oe/recipes-extended/valkey/valkey/0001-src-Do-no=
t-reset-FINAL_LIBS.patch
index ab2265bdba..7dd064fc03 100644
--- a/meta-oe/recipes-extended/valkey/valkey/0001-src-Do-not-reset-FINAL_=
LIBS.patch
+++ b/meta-oe/recipes-extended/valkey/valkey/0001-src-Do-not-reset-FINAL_=
LIBS.patch
@@ -1,4 +1,4 @@
-From b4cf6e677cec75a0d2b57dcb2960ad1e16908c82 Mon Sep 17 00:00:00 2001
+From a657a3c88488e761c05011400fcee5328fc797e1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 10 Sep 2019 20:04:26 -0700
 Subject: [PATCH] src: Do not reset FINAL_LIBS
@@ -16,18 +16,15 @@ Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/src/Makefile b/src/Makefile
-index e0b1d2722..48988e271 100644
+index 5919f01e9..e95050376 100644
 --- a/src/Makefile
 +++ b/src/Makefile
-@@ -145,7 +145,7 @@ ifeq ($(SERVER_TEST),yes)
- 	FINAL_CFLAGS +=3D-DSERVER_TEST=3D1
- endif
+@@ -138,7 +138,7 @@ endif
+=20
+ FINAL_CFLAGS=3D$(STD) $(WARN) $(OPT) $(DEBUG) $(CFLAGS) $(SERVER_CFLAGS=
)
  FINAL_LDFLAGS=3D$(LDFLAGS) $(OPT) $(SERVER_LDFLAGS) $(DEBUG)
 -FINAL_LIBS=3D-lm
 +FINAL_LIBS+=3D-lm
  DEBUG=3D-g -ggdb
 =20
  # Linux ARM32 needs -latomic at linking time
---=20
-2.39.5
-
diff --git a/meta-oe/recipes-extended/valkey/valkey/GNU_SOURCE-7.patch b/=
meta-oe/recipes-extended/valkey/valkey/GNU_SOURCE-7.patch
index fa11d058ff..bf6fc9ab24 100644
--- a/meta-oe/recipes-extended/valkey/valkey/GNU_SOURCE-7.patch
+++ b/meta-oe/recipes-extended/valkey/valkey/GNU_SOURCE-7.patch
@@ -1,4 +1,4 @@
-From f3dd59789e4a8b06777be2725c6c3e36050fd6ec Mon Sep 17 00:00:00 2001
+From 6414a404c3216e654cc6583ebda0c7b3bd304ecf Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 21 Dec 2019 12:09:51 -0800
 Subject: [PATCH] Define _GNU_SOURCE to get PTHREAD_MUTEX_INITIALIZER
@@ -16,7 +16,7 @@ Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
  1 file changed, 1 insertion(+)
=20
 diff --git a/src/zmalloc.c b/src/zmalloc.c
-index 7b19107b6..bd365c11c 100644
+index 3abf9a31a..fa2f25c07 100644
 --- a/src/zmalloc.c
 +++ b/src/zmalloc.c
 @@ -33,6 +33,7 @@
diff --git a/meta-oe/recipes-extended/valkey/valkey/hiredis-use-default-C=
C-if-it-is-set.patch b/meta-oe/recipes-extended/valkey/valkey/hiredis-use=
-default-CC-if-it-is-set.patch
index 3168c5860e..ffb365f371 100644
--- a/meta-oe/recipes-extended/valkey/valkey/hiredis-use-default-CC-if-it=
-is-set.patch
+++ b/meta-oe/recipes-extended/valkey/valkey/hiredis-use-default-CC-if-it=
-is-set.patch
@@ -1,4 +1,4 @@
-From 5e6c3052930f1d831d3479cb59533c08277700ff Mon Sep 17 00:00:00 2001
+From a5bcf56630df520040076dd14c3c54fef0785ceb Mon Sep 17 00:00:00 2001
 From: Venture Research <tech@ventureresearch.com>
 Date: Fri, 8 Feb 2013 17:39:52 -0600
 Subject: [PATCH] hiredis: use default CC if it is set
@@ -20,9 +20,11 @@ Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmai=
l.com>
 Reworked for 8.0.0
 Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
=20
----
-Upstream-Status: Pending
+Reworked for 8.1.0
+Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
=20
+Upstream-Status: Inappropriate [OE-specifc]
+---
  deps/hiredis/Makefile | 2 --
  1 file changed, 2 deletions(-)
=20
diff --git a/meta-oe/recipes-extended/valkey/valkey/lua-update-Makefile-t=
o-use-environment-build-setting.patch b/meta-oe/recipes-extended/valkey/v=
alkey/lua-update-Makefile-to-use-environment-build-setting.patch
index 1c37626381..b91684afd6 100644
--- a/meta-oe/recipes-extended/valkey/valkey/lua-update-Makefile-to-use-e=
nvironment-build-setting.patch
+++ b/meta-oe/recipes-extended/valkey/valkey/lua-update-Makefile-to-use-e=
nvironment-build-setting.patch
@@ -1,4 +1,4 @@
-From 892225f5101b1131434d323c55e79a93dc189609 Mon Sep 17 00:00:00 2001
+From 60487572d23cb374f8eb6b6560c385ecf6ad417e Mon Sep 17 00:00:00 2001
 From: Venture Research <tech@ventureresearch.com>
 Date: Fri, 8 Feb 2013 20:22:19 -0600
 Subject: [PATCH] lua: update Makefile to use environment build settings
@@ -15,19 +15,23 @@ Signed-off-by: Armin Kuster <akust808@gmail.com>
 updated to work wtih 6.2.1
 Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
 Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
----
-Upstream-Status: Pending
=20
+Updated to work with 8.1.x
+Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
+
+Upstream-Status: Inappropriate [OE-specific]
+
+---
  deps/Makefile         |  1 -
  deps/lua/Makefile     |  1 -
  deps/lua/src/Makefile | 16 ++++++----------
  3 files changed, 6 insertions(+), 12 deletions(-)
=20
 diff --git a/deps/Makefile b/deps/Makefile
-index f1e4bd6ce..b9e50d049 100644
+index 72389def9..5d3ade528 100644
 --- a/deps/Makefile
 +++ b/deps/Makefile
-@@ -94,7 +94,6 @@ endif
+@@ -95,7 +95,6 @@ endif
  # lua's Makefile defines AR=3D"ar rcu", which is unusual, and makes it =
more
  # challenging to cross-compile lua (and redis).  These defines make it =
easier
  # to fit redis into cross-compilation environments, which typically set=
 AR.
diff --git a/meta-oe/recipes-extended/valkey/valkey/oe-use-libc-malloc.pa=
tch b/meta-oe/recipes-extended/valkey/valkey/oe-use-libc-malloc.patch
index 3bab01e3fb..a711830e41 100644
--- a/meta-oe/recipes-extended/valkey/valkey/oe-use-libc-malloc.patch
+++ b/meta-oe/recipes-extended/valkey/valkey/oe-use-libc-malloc.patch
@@ -1,4 +1,4 @@
-From ad79a81d6582555e580bdba42c959477e7d35ae7 Mon Sep 17 00:00:00 2001
+From 87bbb65c3c5fb7d248871d9c3bcbd3d27c781449 Mon Sep 17 00:00:00 2001
 From: Venture Research <tech@ventureresearch.com>
 Date: Wed, 6 Feb 2013 20:51:02 -0600
 Subject: [PATCH] hack to force use of libc malloc
@@ -17,14 +17,17 @@ Signed-off-by: Alistair Francis <alistair.francis@wdc=
.com>
 Update to work with 8.0.0
 Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
=20
----
-Upstream-Status: Pending
+Update to work with 8.1.0
+Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
+
+Upstream-Status: Inappropriate [Embedded specific]
=20
+---
  src/Makefile | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
=20
 diff --git a/src/Makefile b/src/Makefile
-index 13fa1c027..e0b1d2722 100644
+index 1437f41bd..5919f01e9 100644
 --- a/src/Makefile
 +++ b/src/Makefile
 @@ -13,7 +13,8 @@
diff --git a/meta-oe/recipes-extended/valkey/valkey_8.0.2.bb b/meta-oe/re=
cipes-extended/valkey/valkey_8.1.0.bb
similarity index 92%
rename from meta-oe/recipes-extended/valkey/valkey_8.0.2.bb
rename to meta-oe/recipes-extended/valkey/valkey_8.1.0.bb
index 04ed342556..8662221ca4 100644
--- a/meta-oe/recipes-extended/valkey/valkey_8.0.2.bb
+++ b/meta-oe/recipes-extended/valkey/valkey_8.1.0.bb
@@ -3,11 +3,11 @@ DESCRIPTION =3D "A flexible distributed key-value datas=
tore that supports both cac
 HOMEPAGE =3D "http://valkey.io"
 SECTION =3D "libs"
 LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df924153a31f3091d2c9c500317d53=
425"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D08b9159809d809e8aaa340a8387e6=
93e"
 DEPENDS =3D "readline lua ncurses"
=20
 SRC_URI =3D " \
-	git://github.com/valkey-io/valkey.git;branch=3D8.0;protocol=3Dhttps \
+	git://github.com/valkey-io/valkey.git;branch=3D8.1;protocol=3Dhttps \
         file://valkey.conf \
 	file://init-valkey-server \
 	file://valkey.service \
@@ -17,7 +17,7 @@ SRC_URI =3D " \
 	file://0001-src-Do-not-reset-FINAL_LIBS.patch \
 	file://GNU_SOURCE-7.patch \
 "
-SRCREV =3D "d6a2f561e2751d4ab246ad084e4fa185526fa479"
+SRCREV =3D "67c8683792fc9ab7e295f833478eca180c5e4691"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.34.1


