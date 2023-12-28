Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26414C3DA6E
	for <webhook@archiver.kernel.org>; Thu, 28 Dec 2023 14:02:59 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.75])
 by mx.groups.io with SMTP id smtpd.web10.123266.1703772169565244975
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Dec 2023 06:02:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=R/LCJsy3;
 spf=pass (domain: navimatix.de, ip: 40.107.21.75, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IwftnWR3lAobCLARcRyHUYrma++/71yghFxyC5ATZkrBM3w7DRfNZLPUM81fOizm+Wc1P5EA2HvmreUJfeDZ00T7T2ooLWKGjakQYYMSYjpPGS8qXZnF3uDbAkqjyfmUb5mkxrTDVL4FfeoRrq+2Fdo7xhyrXD0cmdGYek8GwIp+zJA0epyqH2CAXDzvnuWEvdRbQ96afFWgoLMkAPI/XpUMQealiu1b09W+rKsdT6/s6AFbbYsGqHwsnSc1xVDSvxewuhg6iXoFP3l+zyzhZ7HuhnTezYg0c0ZPqsI//T14h71ceOu/K2wfs+dlNTozkoJV/AVtU6o5dcGzjGayVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IAdYorB2DQgAUQ/RU8BfPqk20xMgCLkntA5skoWWmWs=;
 b=DFTG6B4cO9n/0jnMN5gL/S+a0uUtFCdqt7YB2s3nBSqB9B2K1EWyc94/vCl450w3cSdrmq5Q9jSd6QcBvFJHMK4cjOYbhT2ZlHK0CvheCY3qxV71/3gXh47m7f3CjRl+Aup558TRhK1AXFLgVQ27WpWEKUw8hTCM5Uj/xXZ75fA+Bn9eM+8QKlGLkL1Qs6269Ll6kqVwnsSvA3EWh4mfscjmPkm7xs9ClNSVMhH9WPU6Rom+isZ3Kk4mxQll46gchTBwxJuP8G83Xyg39bfL2xRewZbd6WctdGl+Meh9o+tB+pItQDkueD0BKKKqZi5qdmHP8Ir0DAJehOL+M0hhsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IAdYorB2DQgAUQ/RU8BfPqk20xMgCLkntA5skoWWmWs=;
 b=R/LCJsy34C+MXTUzqN1qv4yQoTPRaEsd4VNbz48c1Xdux7OakEH475pjuO2+inG7OwVYckXIiIKI3c5ganh3MiBrNfxGusDaXLXWOfXIngGC9Dj3n/HX1QzTxV4POa7Zrlba41qU9v5BtkoT8Cyd6VbceRNzhMCKIxYvd/q8ipc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8592.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2f7::22) by AS8PR01MB8777.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:40c::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.20; Thu, 28 Dec
 2023 14:02:44 +0000
Received: from DU2PR01MB8592.eurprd01.prod.exchangelabs.com
 ([fe80::ccd0:21d8:8742:ee1f]) by DU2PR01MB8592.eurprd01.prod.exchangelabs.com
 ([fe80::ccd0:21d8:8742:ee1f%4]) with mapi id 15.20.7135.019; Thu, 28 Dec 2023
 14:02:44 +0000
From: joerg.sommer@navimatix.de
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>
Subject: [meta-oe][PATCH] bonnie++: New recipe for version 2.0
Date: Thu, 28 Dec 2023 15:02:30 +0100
Message-ID: <8701b8118a57fad2921655c82cea20dcbf92c12d.1703772150.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0497.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7e::20) To DU2PR01MB8592.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2f7::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8592:EE_|AS8PR01MB8777:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b08d4f1-68a6-425b-8bb3-08dc07adaa13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	M9JvaccAG/B71XPehq9qYVpfwP5YCw1iiXtrWBGW4An+xSS3/u3WPFX0UlXiXXkdBAGMbFUFuZzXRALzUwwtyluPRon50EgD/d1BQlwvKMkMHueM5pFuRtNNeEzzW8LYTjfh313E4+VVQqZtXhM685VsvKUCpQ4xiUi8sdSCZoZtuMN3twP8BtoKLm4fmUnDymByTdgI8n122FYm9EAIn44MKBQ06Y/XlnUq6BzY10P+mXAxUXdR3NJUDYS3mewY96FMxh5QEMPvliovONOFeX0fHRg1d8MlAXgOGp1k3hEGDfht2mu5v+A/D1PBOVOPt3PhtbPkmBWTgwtlR/D8YMgSsuNRDVfTfTn3lKd9z5onIkX/gGOZu6oJgVfjqu0miYnBWmkX7J825SblPsfO1N4hute4Lnsh30YCnRz7KdOPTVSMb5LGHFLHhiysubLcXWZcpXk8NKCH13gcHMAfPdX17lYpzCpVT58Yopom6Y/aCklLuLjvnUzJ08mSeYvcZ5YA2Dy1XpnYfulXwgc2co2hj0IuSFCa1l2yIPiFVQXRBnCrAyI2tbNdZsYkcAD2r5rKoAyRG+gUuSHQYtM2YJMFUQA0E6/lzUmXgrkVN88=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8592.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39830400003)(376002)(346002)(366004)(136003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(38100700002)(38350700005)(36756003)(86362001)(107886003)(26005)(66574015)(83380400001)(9686003)(6512007)(52116002)(6506007)(6916009)(478600001)(966005)(316002)(6486002)(6666004)(2616005)(8936002)(66556008)(66476007)(66946007)(8676002)(41300700001)(4326008)(2906002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ddMUrtZXHip2O9dFooLpIKvKZXTac00MX5VtOcb8Sg2z0Q2dIwVojB7Fti1w?=
 =?us-ascii?Q?D9f7Lkq1LhBgou1Ehen7/SeGZfXmJo4sZsHdhK/ukVCtnve+F2IclbO1AqYQ?=
 =?us-ascii?Q?kFvZH2eV7XLBzM/6OhSTDmAJXiFiGGtMKYNvMcnVJ+oUOFhzlJ74kuCD1zVz?=
 =?us-ascii?Q?krYJtqwQyAM6y4JNWNpv6Msd/aA40yy79ESGTAyiDr6qf+Bgb/o5TmYlRqT/?=
 =?us-ascii?Q?DMvx4JjayROMrM8prGC6WB78AKobYRlXVzDaDvGlmzaGS3pa7VuMlEApD9PC?=
 =?us-ascii?Q?TvFabSpXmVhyo6C5O+NyRohHGV5LN0XPba7ClMdaXLn8xpoJA/FXRGvnz7At?=
 =?us-ascii?Q?kHu7quFVjmyru0hsyyROUueI1imvH32CGGptTOUaS4f0xKYVuNY8P9XR/X7W?=
 =?us-ascii?Q?d3MXtRXjv8dyxkOjqaXCq0XXlRaYrdW1FPkrxeKipkKh5Ksm3du2fHp7hJh7?=
 =?us-ascii?Q?7765PUIdLG09ySkYvgpbgFBWGcFUbBdS8Uif+eFpX95FIzNNWTB7YQHFnN6M?=
 =?us-ascii?Q?2+6IvCh7AWsRVbLLZYMV0fyV+9daB5bYT3jHnYBYFfl3EpGZDIHHxJATCZid?=
 =?us-ascii?Q?ZrtnW3cqFfhTpYhL6WBnemjcNRafg5c9Bpbt4PMiLaBJv4oF2x5NvMqAJQBa?=
 =?us-ascii?Q?/ncNRtz/2QKcZsjY5NeUZiZsfKYHWrnfd19QrEzcYubzfxLZKmM++4w0Kgs0?=
 =?us-ascii?Q?3zvaPqHF5KReYHjJIfcBesOYUFzK29sIr/yTftSNM4pbZANyTaWmgsZgB+6C?=
 =?us-ascii?Q?tFb+cIcgz6KT+crmQHWONs7M5Kf/Ue85mGBfbHfkjMrpyYOHo18LjHGvUTjg?=
 =?us-ascii?Q?nVgDMLTYvaVn5S/npGwMIO/+rtdktjlixpL9MZI5d5kze9WkdYFR24YQYCbo?=
 =?us-ascii?Q?5KMPTQFnYdmPlZmXbfJCQ5ji55EUaVVcnE75Z2vcXpqL7kqjrLzCTYoeRneL?=
 =?us-ascii?Q?weys/tnX1URuD5jWCIhQt6VfyxTHqrxi53tBZfpupPINdr4EsZhE2EQAPr0W?=
 =?us-ascii?Q?P5I4NJJYO2jbKnbDZgji1cYFycgpKliNWOlYEOqa5IStX4Yk2LWch47+Y7ee?=
 =?us-ascii?Q?CtxHoVmwHK1Roy5s04s8HLKQ3jcLZuXVtgCeW03DwHs8O6GuhBLTNSWm5uJL?=
 =?us-ascii?Q?xMlAgXnTUZ7Zn54LWsdFwnLnYhIlEag3hrWoGvg8PWvWc5y/vg0g0gQ1b9Qk?=
 =?us-ascii?Q?QnLMG58JJAEyJUOHhk2v7LdwaLXKw7CVZD2UFwr8OhNOFYIpmeBXS3NPPfs3?=
 =?us-ascii?Q?IL4g5yL5df4TtZ9M8EhG8ZLwuDsXnho1CY05rmTduMJnOnqWH7trJRGJlDxf?=
 =?us-ascii?Q?okzePezHY5qBwHuHDSfy6IjCJdJCIxkQf7MLe0f7MZDU5dOY0TT6sKvR7lsE?=
 =?us-ascii?Q?+TIypZwV6T1yJYUFt0hSbzgGgzh3BUM+Qm/ApWLINHVSIuGB3iTKZBtgt2JQ?=
 =?us-ascii?Q?z7/vB2dXfiySwSpVxJv1gtLm23ITcexe/5ZRBW3bZifivhqJ7NmsbgpT3ymi?=
 =?us-ascii?Q?KF2qVDzbjfQLy92eJyEr609HgZZKYnXuU7EJFukHpQzeYzhQDrd+bDtssjpu?=
 =?us-ascii?Q?sNZ/L+aM2LHhA+hAnLfTvOc37Rf7sU3mAtFBU0Pss/fp7UqEt//YMfJpHgUy?=
 =?us-ascii?Q?BQ=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b08d4f1-68a6-425b-8bb3-08dc07adaa13
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8592.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2023 14:02:44.5206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: znSaN9aKsxL5yzVtb6/VsXz3zPnhS7aYJOxfIvfeSGXHmWaDuPkstjwVh8mcIIRTgPQn6GQkcAdjr3vaRyRgENsmFzPyeKisAwBHaR/3DsQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR01MB8777
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Dec 2023 14:02:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107874

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
 .../bonnie/bonnie++_2.00a.bb                  |  33 ++++
 3 files changed, 255 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/bonnie/bonnie++/fix-configure=
-lfs.patch
 create mode 100644 meta-oe/recipes-benchmark/bonnie/bonnie++/fix-csv2html-=
data.patch
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
diff --git a/meta-oe/recipes-benchmark/bonnie/bonnie++_2.00a.bb b/meta-oe/r=
ecipes-benchmark/bonnie/bonnie++_2.00a.bb
new file mode 100644
index 000000000..f31fd09fc
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
+SRC_URI =3D "http://www.coker.com.au/bonnie++/${BPN}-${PV}.tgz \
+    file://fix-configure-lfs.patch \
+    file://fix-csv2html-data.patch \
+"
+SRC_URI[md5sum] =3D "3a16b3a91b1d38b6f5561e197f81d870"
+SRC_URI[sha256sum] =3D "a8d33bbd81bc7eb559ce5bf6e584b9b53faea39ccfb4ae92e5=
8f27257e468f0e"
+
+SCRIPTS =3D "bon_csv2html bon_csv2txt"
+EXES =3D "bonnie++ zcav"
+
+TARGET_CC_ARCH +=3D "${LDFLAGS}"
+# force lfs to skip configure's check, because we are cross-building
+EXTRA_OECONF:append=3D"--enable-lfs"
+
+do_install () {
+    install -d ${D}/${bindir}
+    install -d ${D}/${sbindir}
+    install -m 0755 ${EXES} ${D}/${sbindir}
+    install -m 0755 ${SCRIPTS} ${D}/${bindir}
+}
+
+PACKAGES =3D+ "bonnie-scripts"
+
+FILES:${PN} =3D "${sbindir}"
+FILES:bonnie-scripts =3D "${bindir}"
+
+RDEPENDS:bonnie-scripts +=3D "perl"
--=20
2.34.1


