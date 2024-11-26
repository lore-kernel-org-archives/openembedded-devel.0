Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80040D5A6F8
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 08:22:21 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.40991.1732609336136695278
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Nov 2024 00:22:16 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=10608d989f=divya.chellam@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQ6i2ec018681
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Nov 2024 00:22:15 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 433b79asbu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Nov 2024 00:22:15 -0800 (PST)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 26 Nov 2024 00:22:13 -0800
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][scarthgap][PATCH 2/2] redis: upgrade 7.2.5 -> 7.2.6
Date: Tue, 26 Nov 2024 08:21:50 +0000
Message-ID: <20241126082150.829120-2-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20241126082150.829120-1-divya.chellam@windriver.com>
References: <20241126082150.829120-1-divya.chellam@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Authority-Analysis: v=2.4 cv=atbgCjZV c=1 sm=1 tr=0 ts=67458537 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=7UKGVgRVAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=1KubnttrAAAA:8 a=JF9118EUAAAA:8 a=szgukyCE4hRqUtCBftgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=8Ox4Rr8FuIIqx5qz5MW0:22 a=FdTzh2GWekK77mhwV6Dw:22 a=H0t3PWKhy-h45uLjrunQ:22 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-GUID: Bi3z-OXHUUWoNTne6yRnGTOj66Gefpar
X-Proofpoint-ORIG-GUID: Bi3z-OXHUUWoNTne6yRnGTOj66Gefpar
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-11-26_06,2024-11-25_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 clxscore=1011
 malwarescore=0 spamscore=0 impostorscore=0 mlxscore=0 priorityscore=1501
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411260066
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4AQ6i2ec018681
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Nov 2024 08:22:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114070

From: Yi Zhao <yi.zhao@windriver.com>

ChangeLog:

Security fixes
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
* (CVE-2024-31449) Lua library commands may lead to stack overflow and
  potential RCE.
* (CVE-2024-31227) Potential Denial-of-service due to malformed ACL
  selectors.
* (CVE-2024-31228) Potential Denial-of-service due to unbounded pattern
  matching.

Bug fixes
=3D=3D=3D=3D=3D=3D=3D=3D=3D
* Fixed crashes in cluster mode (#13315)

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 ...1-hiredis-use-default-CC-if-it-is-set.patch} |  7 +++----
 ...file-to-use-environment-build-setting.patch} |  6 +++---
 ...0003-hack-to-force-use-of-libc-malloc.patch} |  7 +++----
 .../0004-src-Do-not-reset-FINAL_LIBS.patch}     |  4 ++--
 ...URCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch} |  6 +++---
 .../0006-Define-correct-gregs-for-RISCV32.patch |  4 ++--
 .../init-redis-server                           |  0
 .../{redis-7.2.5 =3D> redis-7.2.6}/redis.conf     |  0
 .../{redis-7.2.5 =3D> redis-7.2.6}/redis.service  |  0
 .../redis/{redis_7.2.5.bb =3D> redis_7.2.6.bb}    | 17 +++++++++--------
 10 files changed, 25 insertions(+), 26 deletions(-)
 rename meta-oe/recipes-extended/redis/{redis-7.2.5/hiredis-use-default-C=
C-if-it-is-set.patch =3D> redis-7.2.6/0001-hiredis-use-default-CC-if-it-i=
s-set.patch} (95%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.5/lua-update-Makefile-t=
o-use-environment-build-setting.patch =3D> redis-7.2.6/0002-lua-update-Ma=
kefile-to-use-environment-build-setting.patch} (97%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.5/oe-use-libc-malloc.pa=
tch =3D> redis-7.2.6/0003-hack-to-force-use-of-libc-malloc.patch} (94%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.5/0001-src-Do-not-reset=
-FINAL_LIBS.patch =3D> redis-7.2.6/0004-src-Do-not-reset-FINAL_LIBS.patch=
} (92%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.5/GNU_SOURCE-7.patch =3D=
> redis-7.2.6/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.pa=
tch} (88%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.5 =3D> redis-7.2.6}/000=
6-Define-correct-gregs-for-RISCV32.patch (97%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.5 =3D> redis-7.2.6}/ini=
t-redis-server (100%)
 mode change 100755 =3D> 100644
 rename meta-oe/recipes-extended/redis/{redis-7.2.5 =3D> redis-7.2.6}/red=
is.conf (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.5 =3D> redis-7.2.6}/red=
is.service (100%)
 rename meta-oe/recipes-extended/redis/{redis_7.2.5.bb =3D> redis_7.2.6.b=
b} (81%)

diff --git a/meta-oe/recipes-extended/redis/redis-7.2.5/hiredis-use-defau=
lt-CC-if-it-is-set.patch b/meta-oe/recipes-extended/redis/redis-7.2.6/000=
1-hiredis-use-default-CC-if-it-is-set.patch
similarity index 95%
rename from meta-oe/recipes-extended/redis/redis-7.2.5/hiredis-use-defaul=
t-CC-if-it-is-set.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.6/0001-hiredis-use-def=
ault-CC-if-it-is-set.patch
index 7785acca5c..63bf403412 100644
--- a/meta-oe/recipes-extended/redis/redis-7.2.5/hiredis-use-default-CC-i=
f-it-is-set.patch
+++ b/meta-oe/recipes-extended/redis/redis-7.2.6/0001-hiredis-use-default=
-CC-if-it-is-set.patch
@@ -1,4 +1,4 @@
-From 41efa2f0cf08c91ff935bbb2d16ab233df7f5811 Mon Sep 17 00:00:00 2001
+From af4fc632c03b2a68be4206b4896f27fc4bb865ae Mon Sep 17 00:00:00 2001
 From: Venture Research <tech@ventureresearch.com>
 Date: Fri, 8 Feb 2013 17:39:52 -0600
 Subject: [PATCH] hiredis: use default CC if it is set
@@ -9,6 +9,8 @@ Content-Transfer-Encoding: 8bit
 Instead of trying to automagically figure out CC, which breaks with OE
 as CC has spaces in it, just skip it if one was already passed in.
=20
+Upstream-Status: Pending
+
 Signed-off-by: Venture Research <tech@ventureresearch.com>
=20
 Update to work with 4.0.8
@@ -16,10 +18,7 @@ Signed-off-by: Alistair Francis <alistair.francis@wdc.=
com>
=20
 Reworked for 6.0.4
 Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
-
 ---
-Upstream-Status: Pending
-
  deps/hiredis/Makefile | 2 --
  1 file changed, 2 deletions(-)
=20
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.5/lua-update-Makefi=
le-to-use-environment-build-setting.patch b/meta-oe/recipes-extended/redi=
s/redis-7.2.6/0002-lua-update-Makefile-to-use-environment-build-setting.p=
atch
similarity index 97%
rename from meta-oe/recipes-extended/redis/redis-7.2.5/lua-update-Makefil=
e-to-use-environment-build-setting.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.6/0002-lua-update-Make=
file-to-use-environment-build-setting.patch
index 20708eda1e..46330f5064 100644
--- a/meta-oe/recipes-extended/redis/redis-7.2.5/lua-update-Makefile-to-u=
se-environment-build-setting.patch
+++ b/meta-oe/recipes-extended/redis/redis-7.2.6/0002-lua-update-Makefile=
-to-use-environment-build-setting.patch
@@ -1,4 +1,4 @@
-From aa3d31355f3cc140b1dc2f4fcff8e3c0aa261549 Mon Sep 17 00:00:00 2001
+From 45ae5eb5c3482054073e06ab1a78e0aa9b96447f Mon Sep 17 00:00:00 2001
 From: Venture Research <tech@ventureresearch.com>
 Date: Fri, 8 Feb 2013 20:22:19 -0600
 Subject: [PATCH] lua: update Makefile to use environment build settings
@@ -6,6 +6,8 @@ Subject: [PATCH] lua: update Makefile to use environment =
build settings
 OE-specific parameters, instead of overriding all of these simply use
 the ones that are already passed in. Also configure for only Linux...
=20
+Upstream-Status: Pending
+
 Signed-off-by: Venture Research <tech@ventureresearch.com>
=20
 Updated to work with 3.0.x
@@ -14,8 +16,6 @@ Signed-off-by: Armin Kuster <akust808@gmail.com>
=20
 updated to work wtih 6.2.1
 Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
-
-Upstream-Status: Pending
 ---
  deps/Makefile         |  1 -
  deps/lua/Makefile     |  1 -
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.5/oe-use-libc-mallo=
c.patch b/meta-oe/recipes-extended/redis/redis-7.2.6/0003-hack-to-force-u=
se-of-libc-malloc.patch
similarity index 94%
rename from meta-oe/recipes-extended/redis/redis-7.2.5/oe-use-libc-malloc=
.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.6/0003-hack-to-force-u=
se-of-libc-malloc.patch
index 7b601e02a9..1f97f9783d 100644
--- a/meta-oe/recipes-extended/redis/redis-7.2.5/oe-use-libc-malloc.patch
+++ b/meta-oe/recipes-extended/redis/redis-7.2.6/0003-hack-to-force-use-o=
f-libc-malloc.patch
@@ -1,4 +1,4 @@
-From 38a5f403b033d03cdac3ff814687d83f61527d8e Mon Sep 17 00:00:00 2001
+From 7a98e3ac480413ce7db3a5edd5dc70458b921b29 Mon Sep 17 00:00:00 2001
 From: Venture Research <tech@ventureresearch.com>
 Date: Wed, 6 Feb 2013 20:51:02 -0600
 Subject: [PATCH] hack to force use of libc malloc
@@ -9,14 +9,13 @@ removed in favor of magic.
 Note that this of course doesn't allow tcmalloc and jemalloc, however
 jemalloc wasn't building correctly.
=20
+Upstream-Status: Pending
+
 Signed-off-by: Venture Research <tech@ventureresearch.com>
=20
 Update to work with 4.0.8
 Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
-
 ---
-Upstream-Status: Pending
-
  src/Makefile | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
=20
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.5/0001-src-Do-not-r=
eset-FINAL_LIBS.patch b/meta-oe/recipes-extended/redis/redis-7.2.6/0004-s=
rc-Do-not-reset-FINAL_LIBS.patch
similarity index 92%
rename from meta-oe/recipes-extended/redis/redis-7.2.5/0001-src-Do-not-re=
set-FINAL_LIBS.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.6/0004-src-Do-not-rese=
t-FINAL_LIBS.patch
index 01e53e3f21..974cf5169f 100644
--- a/meta-oe/recipes-extended/redis/redis-7.2.5/0001-src-Do-not-reset-FI=
NAL_LIBS.patch
+++ b/meta-oe/recipes-extended/redis/redis-7.2.6/0004-src-Do-not-reset-FI=
NAL_LIBS.patch
@@ -1,4 +1,4 @@
-From d9d1f9a501ef7caa80d1e6595218898e9989ec2b Mon Sep 17 00:00:00 2001
+From 50fc46a12f6cf97e7b927d3ea29eecc9ebdea34d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 10 Sep 2019 20:04:26 -0700
 Subject: [PATCH] src: Do not reset FINAL_LIBS
@@ -9,8 +9,8 @@ environment to get it going
 e.g. -latomic is needed on clang/x86 to provide for 64bit atomics
=20
 Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
=20
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  src/Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.5/GNU_SOURCE-7.patc=
h b/meta-oe/recipes-extended/redis/redis-7.2.6/0005-Define-_GNU_SOURCE-to=
-get-PTHREAD_MUTEX_INITIALIZER.patch
similarity index 88%
rename from meta-oe/recipes-extended/redis/redis-7.2.5/GNU_SOURCE-7.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.6/0005-Define-_GNU_SOU=
RCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
index 6e07c25c6a..8e5f30993b 100644
--- a/meta-oe/recipes-extended/redis/redis-7.2.5/GNU_SOURCE-7.patch
+++ b/meta-oe/recipes-extended/redis/redis-7.2.6/0005-Define-_GNU_SOURCE-=
to-get-PTHREAD_MUTEX_INITIALIZER.patch
@@ -1,4 +1,4 @@
-From a22512ac1cbd6de1f5646219722e49752d1f60ac Mon Sep 17 00:00:00 2001
+From acd832d76002a1916b3128ac05bc0296425aea6d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 21 Dec 2019 12:09:51 -0800
 Subject: [PATCH] Define _GNU_SOURCE to get PTHREAD_MUTEX_INITIALIZER
@@ -9,14 +9,14 @@ Fixes
 |       |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~
=20
 Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
=20
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  src/zmalloc.c | 1 +
  1 file changed, 1 insertion(+)
=20
 diff --git a/src/zmalloc.c b/src/zmalloc.c
-index ba03685..322304f 100644
+index bbfa386..93e07ff 100644
 --- a/src/zmalloc.c
 +++ b/src/zmalloc.c
 @@ -32,6 +32,7 @@
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.5/0006-Define-corre=
ct-gregs-for-RISCV32.patch b/meta-oe/recipes-extended/redis/redis-7.2.6/0=
006-Define-correct-gregs-for-RISCV32.patch
similarity index 97%
rename from meta-oe/recipes-extended/redis/redis-7.2.5/0006-Define-correc=
t-gregs-for-RISCV32.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.6/0006-Define-correct-=
gregs-for-RISCV32.patch
index 93c3595261..7009048171 100644
--- a/meta-oe/recipes-extended/redis/redis-7.2.5/0006-Define-correct-greg=
s-for-RISCV32.patch
+++ b/meta-oe/recipes-extended/redis/redis-7.2.6/0006-Define-correct-greg=
s-for-RISCV32.patch
@@ -1,14 +1,14 @@
-From 634f62be6c135ece93cb4e44a69ce3cb66f394ca Mon Sep 17 00:00:00 2001
+From dd3ecb07bbf80b986b8f2c656ea11d1346e212f6 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 26 Oct 2020 21:32:22 -0700
 Subject: [PATCH] Define correct gregs for RISCV32
=20
 Upstream-Status: Pending
+
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
=20
 Updated patch for 6.2.8
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
-
 ---
  src/debug.c | 26 ++++++++++++++++++++++++--
  1 file changed, 24 insertions(+), 2 deletions(-)
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.5/init-redis-server=
 b/meta-oe/recipes-extended/redis/redis-7.2.6/init-redis-server
old mode 100755
new mode 100644
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.5/init-redis-server
rename to meta-oe/recipes-extended/redis/redis-7.2.6/init-redis-server
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.5/redis.conf b/meta=
-oe/recipes-extended/redis/redis-7.2.6/redis.conf
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.5/redis.conf
rename to meta-oe/recipes-extended/redis/redis-7.2.6/redis.conf
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.5/redis.service b/m=
eta-oe/recipes-extended/redis/redis-7.2.6/redis.service
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.5/redis.service
rename to meta-oe/recipes-extended/redis/redis-7.2.6/redis.service
diff --git a/meta-oe/recipes-extended/redis/redis_7.2.5.bb b/meta-oe/reci=
pes-extended/redis/redis_7.2.6.bb
similarity index 81%
rename from meta-oe/recipes-extended/redis/redis_7.2.5.bb
rename to meta-oe/recipes-extended/redis/redis_7.2.6.bb
index 44fb22bc5e..6d076e3131 100644
--- a/meta-oe/recipes-extended/redis/redis_7.2.5.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.2.6.bb
@@ -10,19 +10,20 @@ SRC_URI =3D "http://download.redis.io/releases/${BP}.=
tar.gz \
            file://redis.conf \
            file://init-redis-server \
            file://redis.service \
-           file://hiredis-use-default-CC-if-it-is-set.patch \
-           file://lua-update-Makefile-to-use-environment-build-setting.p=
atch \
-           file://oe-use-libc-malloc.patch \
-           file://0001-src-Do-not-reset-FINAL_LIBS.patch \
-           file://GNU_SOURCE-7.patch \
+           file://0001-hiredis-use-default-CC-if-it-is-set.patch \
+           file://0002-lua-update-Makefile-to-use-environment-build-sett=
ing.patch \
+           file://0003-hack-to-force-use-of-libc-malloc.patch \
+           file://0004-src-Do-not-reset-FINAL_LIBS.patch \
+           file://0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZ=
ER.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
-           "
-SRC_URI[sha256sum] =3D "5981179706f8391f03be91d951acafaeda91af7fac56beff=
b2701963103e423d"
+          "
+
+SRC_URI[sha256sum] =3D "fb10d67a2fe2b4556f6cb840064dd6e6e3175ce8ca035f07=
26990ec2da9f3d0e"
=20
 inherit autotools-brokensep pkgconfig update-rc.d systemd useradd
=20
 FINAL_LIBS:x86:toolchain-clang =3D "-latomic"
-FINAL_LIBS:riscv32:toolchain-clang =3D "-latomic"
+FINAL_LIBS:riscv32 =3D "-latomic"
 FINAL_LIBS:mips =3D "-latomic"
 FINAL_LIBS:arm =3D "-latomic"
 FINAL_LIBS:powerpc =3D "-latomic"
--=20
2.40.0


