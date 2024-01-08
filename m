Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3176EC3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 13:35:25 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.60])
 by mx.groups.io with SMTP id smtpd.web10.6653.1704720917801411050
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jan 2024 05:35:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=sCg7cTJ5;
 spf=pass (domain: navimatix.de, ip: 40.107.21.60, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xw08z9FFhY2rl0ZaKtJfshoxD+pk9Z9v0N0K/Idp9gzDHLatK5JeX+XfH1uaGLJDVeLVKjho07VkQsD4abs+/nSeFxhsi3XBDmrGa9ArXEQojCC9mKvUl8r6yZVo7bbWMsLzcHn21xwc/mPhLRLmBqpirOlbHNDsFU+BWHeTARApTyap0uM3oPcK2soVZET27tUsuVYDCfrB7VhjIbZQVpErcpLqdXA7keNhCV+3otR6v/x6GCUcRjxGqLP9JZHTgjdu4mqdR99kz35wu7ek+lxBlEWed2MMn7hEm77O/spoEStYoTTYVs/TVub2d20QvWg+PPZHvSEOMGUnT93EbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qgv64lbxC3KKkgQaJG+Va0PGRWw+/dBqvFcRiViOpWs=;
 b=iK5LZLFNNk6EWnHPN1eahHoECV2Sv5jfp1WPtK4GN1ouOHJ+c3EbstkxkVVyumPYgdNEhSPhVRlGEdUShm+asaejivRehZFTTZmqvVBfI8XkjzycQTj8pfFcIxcLs4bRmX/eticsUN9aULIjPJXo7W+kTbiSfDyldwQEgKX5qJ9Xtdj6CEY9rG2fQhMyexuIUNCCjq0OVCDqGJ/tQC9yJwxFTJcSWNNYh34Z/l8H0+KK5k2lC7O14YT0TZjeZHTx6EUq5hWlEawwS79zB3qnHPCAEBncfvNCjgADjgYBCqxoDeQPRTLgxXU7TxbGpiT6v7jgZGpcW3Gd/VUdOfoAtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qgv64lbxC3KKkgQaJG+Va0PGRWw+/dBqvFcRiViOpWs=;
 b=sCg7cTJ5X1So4Bh0foQoZ55Vxl5y9dTjYUwcO7ZMg2jO821DYJXozpg2iwkwq0Z5YicdZP+nbJVnSYYZr1XrGUbUhwsAUJlKotuAQxVu2VUgt3JQ+XYz7qvD6b3ge9apPSLeEmDkVnUBVrfPY49m5w1HsBmPa48j7AacgRtqBLE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8592.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2f7::22) by DBAPR01MB6712.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:18a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Mon, 8 Jan
 2024 13:35:12 +0000
Received: from DU2PR01MB8592.eurprd01.prod.exchangelabs.com
 ([fe80::ccd0:21d8:8742:ee1f]) by DU2PR01MB8592.eurprd01.prod.exchangelabs.com
 ([fe80::ccd0:21d8:8742:ee1f%5]) with mapi id 15.20.7159.020; Mon, 8 Jan 2024
 13:35:12 +0000
From: joerg.sommer@navimatix.de
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>
Subject: [meta-oe][PATCH v3] bonnie++: New recipe for version 2.0
Date: Mon,  8 Jan 2024 14:34:54 +0100
Message-ID: <8556b77bc3e4daef16a8c0dc34ca153c4fe6791f.1704720894.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0284.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:84::8) To DU2PR01MB8592.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2f7::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8592:EE_|DBAPR01MB6712:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b443777-97ce-499d-2dd8-08dc104ea3b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8u2DmNgO8Jd8Pfyg9qhZb2MYTYbgSzjq7UsW8LMRnazcMUjHNcdZqevRu7gWmxZxYNbW6/8suQU3IKOJha3p9mF7ObBEvWPz3QZv/yktvnK43uz2b5YkyqYg3g4S0ifPW7lb50xmBKB8B/rgH6iF1Y9MlSfrPSlSI17pX+uUPg6gH8c4URXItTtqNBdiNeNujCU0ewG0acOcptQYOqCplsSmm41oVUcnLZhfVIbt42q3P+TNlORmFRAgkXllgInSN1DS7dy2Fw7bCasbzS4FLj7mjpTQVPwhiDJCyfgr2jg6Ayd7/roefPzbRXZMK1wh4ljfQ6F4iZvdajGe7dGYBYhuDrr8Aq0Mdq8mhFcRNqjyFCtqBiHzlJi1EGS9kmhFc3vWyJs2HJbFhwPu8lPEJ9xlqOVQlR5wuPdu8b+3D99D7pmEW0badpzuFNi/pijd/7x4mWOZDQtwo9BQJCU8z8j9Gor6p+4hu9qiLoXRp64O2YbIqs5kw+Dat98lwREo616eAtCImeyj0Ilqag32WuucTAGoinXLCaFl5521YoEiqpD/qb7HLzKndk5cxg6IaTl6LcLnH5A67JyKh3SIIM+T0wCBUkHO9cQETA0rMs60G/8UN6KwshSO4rrddzWGhA6ZX0a54BfPDM4bL4Em4Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8592.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(39830400003)(396003)(136003)(366004)(230173577357003)(230273577357003)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(66946007)(66556008)(66476007)(316002)(8936002)(8676002)(26005)(478600001)(107886003)(2616005)(83380400001)(66574015)(966005)(6916009)(2906002)(52116002)(5660300002)(38350700005)(41300700001)(38100700002)(30864003)(4326008)(86362001)(6666004)(6512007)(6506007)(9686003)(6486002)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3hFN3BDCVPM1VNd2awdFI47Hv3oh9kGHw1J4HqG1J+oyXPVF2gb9yyICM/NX?=
 =?us-ascii?Q?OXoOHO5efnSRtTLiCGeUGvfd2qRZVcO0LfGIy7fhomI+qR7AocXUY0ZT+ROY?=
 =?us-ascii?Q?Wya5XCK3y5OniSW2k56CDG/T+gWNJvRE2G90ElaoD6RP3oxgU3GmYqxp9upJ?=
 =?us-ascii?Q?w0k9vT8VUcFk/GrC8CcdeVylww2RjkiojTMNXJTCEFKGwG8hkboAQyaESdBZ?=
 =?us-ascii?Q?fa8iaRGBzjn1cyvG3Fssc6J5kpXs7L+N02oFasNyqFd3Cpfr8GZsKfvlap5I?=
 =?us-ascii?Q?NVr8Y1vmIA2GHS6SkjZ9aKC31DibNTR6JC7gdIEx8ZqeqFMdPInF8WFZR0pi?=
 =?us-ascii?Q?YyAtkdA2EgGdZjxUpKGEoEpe6HlHh/Dbun+FgvYvzPeWTWgREaEQ16S9jez5?=
 =?us-ascii?Q?wnquq+od3bOiGcOL3SOFbZA9d31RZaVDO3TCqQoY0R4nihhi53Lp4sfVOHJr?=
 =?us-ascii?Q?urVi19ZmXmSIF+kFVeuq0ueKE8RhduWwrdYBwwoKa9TGibFbTHt/Z+fjQpA6?=
 =?us-ascii?Q?yhd2WCdW5VQcX5UGh7TuRlZKUVcSjEHgUgmixvthOay3QwgtpZoQ6WE3q6mN?=
 =?us-ascii?Q?EmWcyMT4FhaLXKp1pu9tkG5fXQN2HSEdRYEFQhlg3mAU1WWz0OU1376anNj6?=
 =?us-ascii?Q?e5My/rwJETM3pVjKTToNEtpx+rySKdsGRUjjRd0uVyL+6FcxX1qNadl3YxDg?=
 =?us-ascii?Q?t1AraTV57QUnhSo6VJIGhW8DoVolsyeR+WDKqmL/oeXG1F1Odt/rDHWGETVV?=
 =?us-ascii?Q?g3t17epM6fNd3XcMqrGoWsUlEQYIgtkmHrtt7Cr57XvhV12JXXD5y8KJZrRI?=
 =?us-ascii?Q?B8CJMAcoABBLmK3mKoIDzZHOWe5Ap1Dz0/EGSqAis0x0PJJ3hVDWXSkmThT8?=
 =?us-ascii?Q?3vktiYWhQgue6Y9EDp4F2tYWMLyVUrddjVT3oug+cQVCUsJ9sS4nkkO6y7BZ?=
 =?us-ascii?Q?l34/w+1mA8en7veDifwVkiO75R7bTDamynn2B7zS3rD38Qz8j6Py+fGpL5DK?=
 =?us-ascii?Q?pCWwsWddyzJx6b8DYilwVT3oTWTbooYGLpZ1RVdGKKWNp7SDehoZXRhGFbtA?=
 =?us-ascii?Q?iriIQq3vIx3bImRDF7x0oOdc4AXghwnVveDgwZ+Qer610rgqH/8Wy+hGYLXG?=
 =?us-ascii?Q?X+cye3IIPqqUwvqsJiaz1SDKIDLTz3e/x/PKqggZ/j3w8Fg7ug3Nr1fmOKDx?=
 =?us-ascii?Q?3KmvVpi9iwtde2FBwa+6IBL9JrePAogjScqYBQL2IdEXDYbvRr5xBTNcpv9w?=
 =?us-ascii?Q?umtEFV+rjOVt2N+ea+mP63wy641rOxA4uNhPLJJ8/aV3YTLjLMIG303N/N3f?=
 =?us-ascii?Q?Hp0/QNvYR9vYruhVCl44OoA3PA9dr8y60Omn4vgNsY4Dco31C/kejYJFdUu3?=
 =?us-ascii?Q?qc9gN6y/52MgCmbdZFSxBFIhMvVSf/ZHCTT8lHLv3twWx9WQRSIYhvmWPHzs?=
 =?us-ascii?Q?9I7dU8q1wM0UYKEQKAqWRdUGC7u+ZJlLuBZyexbNz1X46erlTgbxglCBEJ/n?=
 =?us-ascii?Q?BOU1+FmoBRmTA85qDW/MeDg4uwyfuURd45gRHlxWT+itYLl1FQZ5cHt2uvLQ?=
 =?us-ascii?Q?sMgh7JdVNgzKdXnoNQlYj7k9eprvQ62/0J+7Wlq7gl8YSxy5ivafggt6cviI?=
 =?us-ascii?Q?6Q=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b443777-97ce-499d-2dd8-08dc104ea3b1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8592.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2024 13:35:12.0641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FLOu0ArFR/eHPIe+R4DJe5al8NBog1JOudVOW9EkQrH83YB1Q0yECQETiLhcF4MVvU3OjFnYEf3WYNkp2lj/iv4OPIaFmZc4nhX5VqFWrtk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR01MB6712
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 13:35:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108144

From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>

Newer versions of bonnie get published on
<https://doc.coker.com.au/projects/bonnie/>. Unfortunately, the new version
doesn't compile with g++=C2=A011 which requires *fix-csv2html-data.patch* a=
nd
configure fails due to cross compilation which gets fixed
with *fix-configure-lfs.patch*

Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
---
 .../bonnie/bonnie++/fix-configure-lfs.patch   |  39 ++++
 .../bonnie/bonnie++/fix-csv2html-data.patch   | 183 ++++++++++++++++++
 .../makefile-use-link-for-helper.patch        |  24 +++
 .../bonnie/bonnie++_2.00a.bb                  |  33 ++++
 4 files changed, 279 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/bonnie/bonnie++/fix-configure=
-lfs.patch
 create mode 100644 meta-oe/recipes-benchmark/bonnie/bonnie++/fix-csv2html-=
data.patch
 create mode 100644 meta-oe/recipes-benchmark/bonnie/bonnie++/makefile-use-=
link-for-helper.patch
 create mode 100644 meta-oe/recipes-benchmark/bonnie/bonnie++_2.00a.bb

diff --git a/meta-oe/recipes-benchmark/bonnie/bonnie++/fix-configure-lfs.pa=
tch b/meta-oe/recipes-benchmark/bonnie/bonnie++/fix-configure-lfs.patch
new file mode 100644
index 000000000..af20acdcd
--- /dev/null
+++ b/meta-oe/recipes-benchmark/bonnie/bonnie++/fix-configure-lfs.patch
@@ -0,0 +1,39 @@
+Upstream-Status: Submitted [https://salsa.debian.org/etbe/bonnie/-/merge_r=
equests/3/diffs?commit_id=3D4ffece51791ba75ddca2e664cdce726cc40c92d3]
+
+diff --git i/configure.in w/configure.in
+index 080e40c..f2a2bbe 100644
+--- i/configure.in
++++ w/configure.in
+@@ -82,8 +82,15 @@ void * thread_func(void * param) { return NULL; }
+   , thread_ldflags=3D"-lpthread"
+   , thread_ldflags=3D"-pthread")
+=20
+-AC_SUBST(large_file)
+-AC_TRY_RUN([#ifndef _LARGEFILE64_SOURCE
++AC_ARG_ENABLE(lfs,
++      [  --disable-lfs  disable large file support],
++      LFS_CHOICE=3D$enableval, LFS_CHOICE=3Dcheck)
++
++if test "$LFS_CHOICE" =3D yes; then
++   bonniepp_cv_large_file=3Dyes
++elif test "$LFS_CHOICE" =3D check; then
++   AC_CACHE_CHECK([whether to enable -D_LARGEFILE64_SOURCE], bonniepp_cv_=
large_file,
++      AC_TRY_RUN([#ifndef _LARGEFILE64_SOURCE
+ #define _LARGEFILE64_SOURCE
+ #endif
+ #include <stdio.h>
+@@ -118,8 +125,12 @@ int main () {
+   }
+   close(fd);
+   return 0;
+-}], large_file=3D"yes")
+-if [[ -n "$large_file" ]]; then
++}], bonniepp_cv_large_file=3D"yes"))
++fi
++
++AC_SUBST(large_file)
++
++if [[ -n "$bonniepp_cv_large_file" ]]; then
+    large_file=3D"#define _LARGEFILE64_SOURCE"
+ fi
+=20
diff --git a/meta-oe/recipes-benchmark/bonnie/bonnie++/fix-csv2html-data.pa=
tch b/meta-oe/recipes-benchmark/bonnie/bonnie++/fix-csv2html-data.patch
new file mode 100644
index 000000000..4b37b8d65
--- /dev/null
+++ b/meta-oe/recipes-benchmark/bonnie/bonnie++/fix-csv2html-data.patch
@@ -0,0 +1,183 @@
+commit 7e9433a56f22426b11cbc9bd80e0debca67c893b
+Author: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
+Date:   Mon Jun 26 12:38:30 2023 +0200
+
+    csv2html: Explicitly reference data in top level
+   =20
+    With g++ 11 *data* became ambiguous with [std::data][1]. Therefore it'=
s
+    needed to explicitly address the variable from the top level scope.
+   =20
+    [1]=C2=A0https://en.cppreference.com/w/cpp/iterator/data
+
+Upstream-Status: Submitted [https://salsa.debian.org/etbe/bonnie/-/merge_r=
equests/3/diffs?commit_id=3Dfb13a71d56dab8aaa39233fcaaedfb0ba4ad647d]
+
+diff --git a/bon_csv2html.cpp b/bon_csv2html.cpp
+index e9d9c50..652e330 100644
+--- a/bon_csv2html.cpp
++++ b/bon_csv2html.cpp
+@@ -87,8 +87,8 @@ int main(int argc, char **argv)
+     read_in(buf);
+   }
+=20
+-  props =3D new PPCCHAR[data.size()];
+-  for(i =3D 0; i < data.size(); i++)
++  props =3D new PPCCHAR[::data.size()];
++  for(i =3D 0; i < ::data.size(); i++)
+   {
+     props[i] =3D new PCCHAR[MAX_ITEMS];
+     props[i][0] =3D NULL;
+@@ -109,7 +109,7 @@ int main(int argc, char **argv)
+   }
+   calc_vals();
+   int mid_width =3D header();
+-  for(i =3D 0; i < data.size(); i++)
++  for(i =3D 0; i < ::data.size(); i++)
+   {
+ // First print the average speed line
+     printf("<tr>");
+@@ -171,23 +171,23 @@ int compar(const void *a, const void *b)
+=20
+ void calc_vals()
+ {
+-  ITEM *arr =3D new ITEM[data.size()];
++  ITEM *arr =3D new ITEM[::data.size()];
+   for(unsigned int column_ind =3D 0; column_ind < MAX_ITEMS; column_ind++=
)
+   {
+     switch(vals[column_ind])
+     {
+     case eNoCols:
+     {
+-      for(unsigned int row_ind =3D 0; row_ind < data.size(); row_ind++)
++      for(unsigned int row_ind =3D 0; row_ind < ::data.size(); row_ind++)
+       {
+         if(column_ind =3D=3D COL_CONCURRENCY)
+         {
+-          if(data[row_ind][column_ind] && strcmp("1", data[row_ind][colum=
n_ind]))
++          if(::data[row_ind][column_ind] && strcmp("1", ::data[row_ind][c=
olumn_ind]))
+             col_used[column_ind] =3D true;
+         }
+         else
+         {
+-          if(data[row_ind][column_ind] && strlen(data[row_ind][column_ind=
]))
++          if(::data[row_ind][column_ind] && strlen(::data[row_ind][column=
_ind]))
+             col_used[column_ind] =3D true;
+         }
+       }
+@@ -195,22 +195,22 @@ void calc_vals()
+     break;
+     case eCPU:
+     {
+-      for(unsigned int row_ind =3D 0; row_ind < data.size(); row_ind++)
++      for(unsigned int row_ind =3D 0; row_ind < ::data.size(); row_ind++)
+       {
+         double work, cpu;
+         arr[row_ind].val =3D 0.0;
+-        if(data[row_ind].size() > column_ind
+-         && sscanf(data[row_ind][column_ind - 1], "%lf", &work) =3D=3D 1
+-         && sscanf(data[row_ind][column_ind], "%lf", &cpu) =3D=3D 1)
++        if(::data[row_ind].size() > column_ind
++         && sscanf(::data[row_ind][column_ind - 1], "%lf", &work) =3D=3D =
1
++         && sscanf(::data[row_ind][column_ind], "%lf", &cpu) =3D=3D 1)
+         {
+           arr[row_ind].val =3D cpu / work;
+         }
+         arr[row_ind].pos =3D row_ind;
+       }
+-      qsort(arr, data.size(), sizeof(ITEM), compar);
++      qsort(arr, ::data.size(), sizeof(ITEM), compar);
+       int col_count =3D -1;
+       double min_col =3D -1.0, max_col =3D -1.0;
+-      for(unsigned int sort_ind =3D 0; sort_ind < data.size(); sort_ind++=
)
++      for(unsigned int sort_ind =3D 0; sort_ind < ::data.size(); sort_ind=
++)
+       {
+         // if item is different from previous or if the first row
+         // (sort_ind =3D=3D 0) then increment col count
+@@ -239,7 +239,7 @@ void calc_vals()
+           min_col /=3D mult;
+         }
+         double range_col =3D max_col - min_col;
+-        for(unsigned int sort_ind =3D 0; sort_ind < data.size(); sort_ind=
++)
++        for(unsigned int sort_ind =3D 0; sort_ind < ::data.size(); sort_i=
nd++)
+         {
+           if(arr[sort_ind].col_ind > -1)
+           {
+@@ -250,7 +250,7 @@ void calc_vals()
+       }
+       else
+       {
+-        for(unsigned int sort_ind =3D 0; sort_ind < data.size(); sort_ind=
++)
++        for(unsigned int sort_ind =3D 0; sort_ind < ::data.size(); sort_i=
nd++)
+         {
+           if(vals[column_ind] =3D=3D eLatency)
+           {
+@@ -263,25 +263,25 @@ void calc_vals()
+     case eSpeed:
+     case eLatency:
+     {
+-      for(unsigned int row_ind =3D 0; row_ind < data.size(); row_ind++)
++      for(unsigned int row_ind =3D 0; row_ind < ::data.size(); row_ind++)
+       {
+         arr[row_ind].val =3D 0.0;
+-        if(data[row_ind].size() <=3D column_ind
+-         || sscanf(data[row_ind][column_ind], "%lf", &arr[row_ind].val) =
=3D=3D 0)
++        if(::data[row_ind].size() <=3D column_ind
++         || sscanf(::data[row_ind][column_ind], "%lf", &arr[row_ind].val)=
 =3D=3D 0)
+           arr[row_ind].val =3D 0.0;
+         if(vals[column_ind] =3D=3D eLatency && arr[row_ind].val !=3D 0.0)
+         {
+-          if(strstr(data[row_ind][column_ind], "ms"))
++          if(strstr(::data[row_ind][column_ind], "ms"))
+             arr[row_ind].val *=3D 1000.0;
+-          else if(!strstr(data[row_ind][column_ind], "us"))
++          else if(!strstr(::data[row_ind][column_ind], "us"))
+             arr[row_ind].val *=3D 1000000.0; // is !us && !ms then secs!
+         }
+         arr[row_ind].pos =3D row_ind;
+       }
+-      qsort(arr, data.size(), sizeof(ITEM), compar);
++      qsort(arr, ::data.size(), sizeof(ITEM), compar);
+       int col_count =3D -1;
+       double min_col =3D -1.0, max_col =3D -1.0;
+-      for(unsigned int sort_ind =3D 0; sort_ind < data.size(); sort_ind++=
)
++      for(unsigned int sort_ind =3D 0; sort_ind < ::data.size(); sort_ind=
++)
+       {
+         // if item is different from previous or if the first row
+         // (sort_ind =3D=3D 0) then increment col count
+@@ -310,7 +310,7 @@ void calc_vals()
+           min_col /=3D mult;
+         }
+         double range_col =3D max_col - min_col;
+-        for(unsigned int sort_ind =3D 0; sort_ind < data.size(); sort_ind=
++)
++        for(unsigned int sort_ind =3D 0; sort_ind < ::data.size(); sort_i=
nd++)
+         {
+           if(arr[sort_ind].col_ind > -1)
+           {
+@@ -332,7 +332,7 @@ void calc_vals()
+       }
+       else
+       {
+-        for(unsigned int sort_ind =3D 0; sort_ind < data.size(); sort_ind=
++)
++        for(unsigned int sort_ind =3D 0; sort_ind < ::data.size(); sort_i=
nd++)
+         {
+           if(vals[column_ind] =3D=3D eLatency)
+           {
+@@ -481,16 +481,16 @@ void read_in(CPCCHAR buf)
+     free((void *)arr[0]);
+     return;
+   }
+-  data.push_back(arr);
++  ::data.push_back(arr);
+ }
+=20
+ void print_item(int num, int item, CPCCHAR extra)
+ {
+   PCCHAR line_data;
+   char buf[1024];
+-  if(int(data[num].size()) > item)
++  if(int(::data[num].size()) > item)
+   {
+-    line_data =3D data[num][item];
++    line_data =3D ::data[num][item];
+     switch(item)
+     {
+     case COL_PUT_BLOCK:
diff --git a/meta-oe/recipes-benchmark/bonnie/bonnie++/makefile-use-link-fo=
r-helper.patch b/meta-oe/recipes-benchmark/bonnie/bonnie++/makefile-use-lin=
k-for-helper.patch
new file mode 100644
index 000000000..3a646486c
--- /dev/null
+++ b/meta-oe/recipes-benchmark/bonnie/bonnie++/makefile-use-link-for-helpe=
r.patch
@@ -0,0 +1,24 @@
+Upstream-Status: Submitted [https://salsa.debian.org/etbe/bonnie/-/merge_r=
equests/3/diffs?commit_id=3Df6ce71d9f97316697c55d0fb3c756becdee04c5c]
+
+diff --git i/Makefile.in w/Makefile.in
+index 6dfdb75..87a5fb1 100644
+--- i/Makefile.in
++++ w/Makefile.in
+@@ -10,7 +10,7 @@ eprefix=3D@exec_prefix@
+ WFLAGS=3D-Wall -W -Wshadow -Wpointer-arith -Wwrite-strings -pedantic -Wca=
st-align -Wsign-compare -Wpointer-arith -Wwrite-strings -Wformat-security -=
Wswitch-enum -Winit-self $(MORE_WARNINGS)
+ CFLAGS=3D-O2 @debug@ -DNDEBUG $(WFLAGS) $(MORECFLAGS)
+ CXX=3D@CXX@ $(CFLAGS)
+-LINK=3D@CXX@
++LINK=3D$(LINK.cc)
+ THREAD_LFLAGS=3D@thread_ldflags@
+=20
+ INSTALL=3D@INSTALL@
+@@ -43,7 +43,7 @@ getc_putc: $(GETCOBJS) getc_putc_helper
+ 	$(LINK) -o getc_putc $(GETCOBJS) $(THREAD_LFLAGS)
+=20
+ getc_putc_helper: $(GETCHOBJS)
+-	$(CXX) -o getc_putc_helper $(GETCHOBJS)
++	$(LINK) -o getc_putc_helper $(GETCHOBJS)
+=20
+ bon_csv2html: bon_csv2html.o
+ 	$(LINK) bon_csv2html.o -o bon_csv2html
diff --git a/meta-oe/recipes-benchmark/bonnie/bonnie++_2.00a.bb b/meta-oe/r=
ecipes-benchmark/bonnie/bonnie++_2.00a.bb
new file mode 100644
index 000000000..29590bfe8
--- /dev/null
+++ b/meta-oe/recipes-benchmark/bonnie/bonnie++_2.00a.bb
@@ -0,0 +1,33 @@
+SUMMARY =3D "Tests large file IO and creation/deletion of small files"
+HOMEPAGE =3D "https://doc.coker.com.au/projects/bonnie/"
+SECTION =3D "benchmark/tests"
+LICENSE =3D "GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://copyright.txt;md5=3Dcd4dde95a6b9d122f0a9150ae=
9cc3ee0"
+
+SRC_URI =3D "\
+    http://www.coker.com.au/bonnie++/${BPN}-${PV}.tgz \
+    file://fix-configure-lfs.patch \
+    file://fix-csv2html-data.patch \
+    file://makefile-use-link-for-helper.patch \
+"
+SRC_URI[sha256sum] =3D "a8d33bbd81bc7eb559ce5bf6e584b9b53faea39ccfb4ae92e5=
8f27257e468f0e"
+
+# force lfs to skip configure's check, because we are cross-building
+PACKAGECONFIG ?=3D "lfs"
+PACKAGECONFIG[lfs] =3D "--enable-lfs,--disable-lfs"
+
+inherit autotools
+
+EXTRA_OECONF +=3D "--disable-stripping"
+EXTRA_OEMAKE +=3D "-I ${S} VPATH=3D${S}"
+CXXFLAGS +=3D "-I ${S}"
+
+do_install() {
+    oe_runmake eprefix=3D'${D}${exec_prefix}' install-bin
+}
+
+PACKAGE_BEFORE_PN +=3D "${PN}-scripts"
+
+FILES:${PN}-scripts =3D "${bindir}/bon_csv2*"
+
+RDEPENDS:${PN}-scripts +=3D "perl"
--=20
2.34.1


