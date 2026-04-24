Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05AC4FE5213
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 11:53:37 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.7])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19122.1777031611813295784
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Apr 2026 04:53:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=HX9gDQlJ;
 spf=pass (domain: ericsson.com, ip: 52.101.72.7, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OvQw9ke64YIiWZkiOZkeXcQL8pUfnjBkUVL84iej98ntrHbOYEStSJYJkNmZ18+M5/20G/j7oFNN3mwYuxX/ozG6FzR9vIp4eY30QCv0+5+89vSsj7e2MFOmzLI1UpKo7M4grRCkeItpiGXZntKfyHscxubDlKPwty3ByBGwIwAoEb9zDOTxrS1AbkEAYqWkQKaMvC5J7i+reiv9T99MbiEaRA9C0H/PVR//VP5a1AwBPJuUJuQU+nGeaXysUFL/GQfO0BeAlY0I3rwQHrXcLv4WD8sV3kglEAz/1whRyx0FOG0XIMvuIBRhVv3Kn02hb9ef9rjUqgeWUMbTqrZhjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cbvkeUDCRk8qRLU/HxMWlN5GpY9d9N1ksZf+52G7Pj0=;
 b=BI1b5nZpckn3ERWeVRXc37KZkBaskpZmwRyR++aKNczpCUyc4PKYjoIgM1X7Av0xVLUKG2ETQfEplU0PRWGmyMdj37klhoDVD/aWFRqs6BfdxsGA3K2EESNHknZPvQnSOcRaVPaHeD+CP5rxTjkguCBgZ+1jyx0Uu83gNE14YTy9x1vD17E5nnVj9FfHgEVHJud9DspHP7sfiPB2DmkAmn96odst+MT37lZGwkN9UAvy67zqfmQZlGYyJgvYQvBw+p3xrJl62hn36X6e4iglAgt0N49/RuE1hAyBiHuBkGgPrpabJKfaWtoF/dZwzf9T06xP67LjuRHOVBgvdfvEHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cbvkeUDCRk8qRLU/HxMWlN5GpY9d9N1ksZf+52G7Pj0=;
 b=HX9gDQlJh7jW+iMOcWu/rePCpKJOZcPDpDUJyknZSv1VkFjYARb+EAnutYu+f7NsbOYEFhNHmFmOHz/ZWnXgd5HG8HJI1ygWEnAp/7CthA+Gu8MOo7Ke8Mgxi5rN3TWV5ivUWHqJ1Z7xo+q1UuoxFqlaCndAadHsde8J9OxzfilysOfba3eQae4TqBGZPygQQeHCbXai81Hs8F2sTz/YaB401aD3NJgS3QoVtDtq8M+gfMlVsRHJBpKynQyLTzfIISD9gC0ALHtad7z/VzXRiUlI3CnpvDXeUjdUvdg9v/R4CnU/EzzjPDIUD3BigxjMeYjXW3yXz05PgmJR03pvAw==
Received: from CWLP265CA0402.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d6::12)
 by GVUPR07MB11969.eurprd07.prod.outlook.com (2603:10a6:150:360::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 11:53:25 +0000
Received: from DU6PEPF0000B61C.eurprd02.prod.outlook.com
 (2603:10a6:400:1d6:cafe::56) by CWLP265CA0402.outlook.office365.com
 (2603:10a6:400:1d6::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.22 via Frontend Transport; Fri,
 24 Apr 2026 11:53:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DU6PEPF0000B61C.mail.protection.outlook.com (10.167.8.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Fri, 24 Apr 2026 11:53:25 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.69) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 24 Apr 2026 13:53:24 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id B32314021D84;
	Fri, 24 Apr 2026 13:53:16 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 98529700CF09; Fri, 24 Apr 2026 13:53:16 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [meta-oe][scarthgap][PATCH] jq: fix CVE-2026-40164
Date: Fri, 24 Apr 2026 13:53:11 +0200
Message-ID: <20260424115311.2457611-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B61C:EE_|GVUPR07MB11969:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a3e4f31-1f96-4616-da4c-08dea1f817b0
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|18002099003|56012099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	dPQMv9F7BPEGZi7qvOLIsEboDheYQ7l96qJ8fBX0V4BlK2mAw+DQ1QrXIyjAMD1sXqsjFoWKL+F/IBy1MI/gN27jA7zM/YN5oLzy5Se7Xbnddby4zMB2xGctJOYITVzwsEyK1B+rw1DE5IcfVv8XIwWMRrPSKdstAbFCzbb6XA3W+IIya9N1pjO66R0XFM6h+Lx5pGJ9HwAfW62DTCEFFKVr37uNhUu0aYyZk20wvV+ttbK/8kqgVi+r6yLmBC7AvvyeB0sRjCEJI6llXca6qVZKlw4bD2iUXjyVhxmHkEj1O0qVAYjs/urMR7AXJVwa1mvhrCzfX5W0pNPJA1/AI26il5fZRtyaXu8ukkMHpRrzi/iyuCivnoo9D6gDcdJ+3iTFpFF3gjR4h8G+gH2tLplcYCs3r0IbCKlpzK9jsZXZBP8MGPmHszRGlmhwXLZ3nd9lJzbR0ItngrYaH56Vpb05imTEkBBCemeQsp1xJXJxqs7F+8FofMi0ZLq6OFXLvk5qJGmK/QwTdXmjAeFWQOcOQypFNwwnkByq7NKXX83+bW98hFlv2+5f2gP/rpJtQCqBsb1+eqCDbPJqSUxmidyxh9o+D0m9mIOS9NF4AH8v3SzhbOEr7Bd4rYDwY1F0YXBMBUUhikG15pO3HJAjNoPKTT9nUiH0y5ZcQDfZSa7HJ8hQJzz2lhndZ8UwQ3++PEzluq95X4Iq41qzFfpEDc8z/FL9ApclcKki71am1sk=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(18002099003)(56012099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	7MZ9z0VrnDLUO/Dl2RhpFR39CaDEFyZnYKOrTrDmMo2puSbbEJhMrE4hPDydQmoevbi/fy0J3T38VeLiVlW0uszEljsJfHx1usQ4IusEJUDELcSDu7P63jJAbqS2wAV8oNPZ6ro1Dz0VcnmhF7ObvDNtOsxWxeBfaqa6YLbml0AprWsNwPuV9rCjbbKmVx4OiffvuMNy3gJA2FvhnAk/rowETvobv9H7Cbuix01YGFRbAvP93IS7D52ufjavs6ejPAz5eWBz++7SXeNURzrJKEW//OD7MCdIMuEZSvAQLtZRs3I5Q2AwLFlA/VQT4ZAOfOb7hI6/jklgWy6jA4aa078Ispd58Bb/JrY2qLgGm2xoeBwxAcv/+axF1u5x6ODKST3W4WyKETTG9JI0gtHtx5bLcIF78T6mZ+9893bdyg/20/YbUjtpkLWgITSG5nCk
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 11:53:25.3816
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a3e4f31-1f96-4616-da4c-08dea1f817b0
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVUPR07MB11969
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Apr 2026 11:53:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126605

From: Daniel Turull <daniel.turull@ericsson.com>

Backport patch to fix CVE-2026-40164.

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 .../jq/jq/CVE-2026-40164.patch                | 92 +++++++++++++++++++
 meta-oe/recipes-devtools/jq/jq_1.7.1.bb       |  1 +
 2 files changed, 93 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-40164.patch

diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2026-40164.patch b/meta-oe/=
recipes-devtools/jq/jq/CVE-2026-40164.patch
new file mode 100644
index 0000000000..91b778a6b4
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2026-40164.patch
@@ -0,0 +1,92 @@
+From 5077fc0780810ba556518ff3ae34df0832a469d4 Mon Sep 17 00:00:00 2001
+From: itchyny <itchyny@cybozu.co.jp>
+Date: Mon, 13 Apr 2026 08:53:26 +0900
+Subject: [PATCH] Randomize hash seed to mitigate hash collision DoS attack=
s
+
+The hash function used a fixed seed, allowing attackers to craft colliding=
 keys
+and cause O(n^2) object parsing performance. Initialize the seed from a ra=
ndom
+source at process startup to prevent the attack. This fixes CVE-2026-40164=
.
+
+Co-authored-by: Asaf Meizner <asafmeizner@gmail.com>
+
+CVE: CVE-2026-40164
+Upstream-Status: Backport [https://github.com/jqlang/jq/commit/0c7d133c3c7=
e37c00b6d46b658a02244fdd3c784]
+
+Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
+---
+ configure.ac |  2 ++
+ src/jv.c     | 34 ++++++++++++++++++++++++++++++++--
+ 2 files changed, 34 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 118e084..7f12b52 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -149,6 +149,8 @@ AC_CHECK_MEMBER([struct tm.tm_gmtoff], [AC_DEFINE([HAV=
E_TM_TM_GMT_OFF],1,[Define
+ AC_CHECK_MEMBER([struct tm.__tm_gmtoff], [AC_DEFINE([HAVE_TM___TM_GMT_OFF=
],1,[Define to 1 if the system has the __tm_gmt_off field in struct tm])],
+                 [], [[#include <time.h>]])
+ AC_FIND_FUNC([setlocale], [c], [#include <locale.h>], [0,0])
++AC_FIND_FUNC([arc4random], [c], [#include <stdlib.h>], [])
++AC_FIND_FUNC([getentropy], [c], [#include <unistd.h>], [0, 0])
+=20
+ dnl Figure out if we have the pthread functions we actually need
+ AC_FIND_FUNC_NO_LIBS([pthread_key_create], [], [#include <pthread.h>], [N=
ULL, NULL])
+diff --git a/src/jv.c b/src/jv.c
+index 18dbb54..27cc2a4 100644
+--- a/src/jv.c
++++ b/src/jv.c
+@@ -40,6 +40,10 @@
+ #include <limits.h>
+ #include <math.h>
+ #include <float.h>
++#include <time.h>
++#include <unistd.h>
++#include <fcntl.h>
++#include <pthread.h>
+=20
+ #include "jv_alloc.h"
+ #include "jv.h"
+@@ -1174,7 +1178,33 @@ static jv jvp_string_append(jv string, const char* =
data, uint32_t len) {
+   }
+ }
+=20
+-static const uint32_t HASH_SEED =3D 0x432A9843;
++static uint32_t hash_seed;
++static pthread_once_t hash_seed_once =3D PTHREAD_ONCE_INIT;
++
++static void jvp_hash_seed_init(void) {
++  uint32_t seed;
++#if defined(HAVE_ARC4RANDOM)
++  seed =3D arc4random();
++#elif defined(HAVE_GETENTROPY)
++  if (getentropy(&seed, sizeof(seed)) !=3D 0)
++    seed =3D (uint32_t)getpid() ^ (uint32_t)time(NULL);
++#else
++  int fd =3D open("/dev/urandom", O_RDONLY);
++  if (fd >=3D 0) {
++    if (read(fd, &seed, sizeof(seed)) !=3D 4)
++      seed =3D (uint32_t)getpid() ^ (uint32_t)time(NULL);
++    close(fd);
++  } else {
++    seed =3D (uint32_t)getpid() ^ (uint32_t)time(NULL);
++  }
++#endif
++  hash_seed =3D seed;
++}
++
++static uint32_t jvp_hash_seed(void) {
++  pthread_once(&hash_seed_once, jvp_hash_seed_init);
++  return hash_seed;
++}
+=20
+ static uint32_t rotl32 (uint32_t x, int8_t r){
+   return (x << r) | (x >> (32 - r));
+@@ -1193,7 +1223,7 @@ static uint32_t jvp_string_hash(jv jstr) {
+   int len =3D (int)jvp_string_length(str);
+   const int nblocks =3D len / 4;
+=20
+-  uint32_t h1 =3D HASH_SEED;
++  uint32_t h1 =3D jvp_hash_seed();
+=20
+   const uint32_t c1 =3D 0xcc9e2d51;
+   const uint32_t c2 =3D 0x1b873593;
diff --git a/meta-oe/recipes-devtools/jq/jq_1.7.1.bb b/meta-oe/recipes-devt=
ools/jq/jq_1.7.1.bb
index dfc8dda7ee..566e8017dc 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
@@ -15,6 +15,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/${BPN}-${PV}/${B=
PN}-${PV}.tar.gz \
     file://CVE-2024-53427.patch \
     file://CVE-2025-48060.patch \
     file://CVE-2025-9403.patch \
+    file://CVE-2026-40164.patch \
     "
 SRC_URI[sha256sum] =3D "478c9ca129fd2e3443fe27314b455e211e0d8c60bc8ff7df70=
3873deeee580c2"
=20

