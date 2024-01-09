Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D9D5C47073
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 15:22:11 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.68])
 by mx.groups.io with SMTP id smtpd.web10.19325.1704813723286758012
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jan 2024 07:22:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=0w+Wuq8w;
 spf=pass (domain: navimatix.de, ip: 40.107.6.68, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H2pDf10EcErjYfnMfyY0+MttuCa5lTOJP9UMkYMzUPYvXGs3/J0wBS1vrj5bzcXC7WtxJSTETRaLqkesEudba6KQaNnnbjtZPRvfuhE0yDgjJ2toF2KAWSd8p4UITXamI2qbOd/U+nvwfetbNmy4adJp4EksmeK565IHrMgdfRdfSUKZircPjzmpgeDaNUhd0yPFQHsfGOhoJJvIcDCA6waafchHiO4GAEAufxsdIyXfpByOYz5ZJ3tWwxTVqS/j+Bx6tOxhiMwrI8XyJQE/0FlT4xDowOqvDXgYjEh9Yi6ZXgcW//6mg20JNszesWH5oitEJ3soXG8VwR/om0rw7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J+VtGMEo2GZ7m425fGdO85b/Roch/CqfQOH2Vj5bgqU=;
 b=TdChk0eK8zTd9pa8CZA0DecIf0tJ/Ti2ewJzWb2RWUjbtHWRcF6gqXlIWpzNuif6xsyFlYGHjWJoDlnJAtOAihnsr3eTQ98knV7x++iLaqDy7bnXgmhqPZePir4QRoqSbQsit9k2vMlOs6C7gdgrpinXXzRc4t6yzlZGLkukni6tfvzHHOlVujW1e3aWZTaRZoctmBGFoUU2y2K4BF6WOAhHPEMATAGFkEgjh/vL05By2Hhbv4xt3MEJsVKOc+Y/puoRLDE8HDXcwi/xtPNurMuSqtJSBkIS8yAJApLLdgOdb8j+KXLbuHucxAdtmgPmZojgz+vFUGuys5674peLkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J+VtGMEo2GZ7m425fGdO85b/Roch/CqfQOH2Vj5bgqU=;
 b=0w+Wuq8wp8XIr8ACxHYHfp4V8gHCCJBlxFpFtPaPfRn/dMQk6w5AN8+AY5/UmBVpmZyQTV8JuZj8xdVio8DuwU97KTmmUFVdCRftpEGBKFKXSDbP/+aPxNBAB1+4F5Z6+JKC1NGkTlyO4MFT9Nv66m5XjbCBe/fQJr9fKaCkqJ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8592.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2f7::22) by AS8PR01MB7701.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:2aa::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Tue, 9 Jan
 2024 15:21:58 +0000
Received: from DU2PR01MB8592.eurprd01.prod.exchangelabs.com
 ([fe80::ccd0:21d8:8742:ee1f]) by DU2PR01MB8592.eurprd01.prod.exchangelabs.com
 ([fe80::ccd0:21d8:8742:ee1f%5]) with mapi id 15.20.7159.020; Tue, 9 Jan 2024
 15:21:58 +0000
From: joerg.sommer@navimatix.de
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>
Subject: [meta-oe][PATCH v4] bonnie++: New recipe for version 2.0
Date: Tue,  9 Jan 2024 16:21:38 +0100
Message-ID: <863a4972681a395e0e73ac1081b3f065b92592d0.1704813698.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0385.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:80::21) To DU2PR01MB8592.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2f7::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8592:EE_|AS8PR01MB7701:EE_
X-MS-Office365-Filtering-Correlation-Id: c9b09019-ef94-4bf4-c120-08dc1126b899
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2z2e+5gqjD9eoAve1j6a3oKfIeVdLCrvSifw2BdYUJVNMNCtvATG0Yt/yKeS5eIwxLbntVZsYlUDE8c0cNHIiYSEyjUEZy7JVO3KWGwlnrV8FaJN2hOHBRoJXtJYKNf+7/moUozsw127VNNk84iuzVlpMo8qJf9hfvTUvbrimzqL1liUF43OZBlXAxYt/6Hz4FO+L86tTduU3hvo65NqAEPcSQMrDYMdosuVu0kTi2qEwYl+PiZGTMWQCC/miT3DgMjt5q83+v5xkvHfaWJTfocFhmgJUDLkhMBYSrsnR3OZq1CK81N6ncq7IGQXhebC3bfCBbsBfX6I41PpNqDdlCQ+t5SB/e6c98YmGIbEJyYetl2EHSS7tXbX6QrZFX2b2QsTZlf2LeNxwBvzMq8t8Pw/RyFBdWkwFH+4E0KGVnNuIZW1fRB8FRsqfUfiWWL81ZQi+1EMzzXQl+eAGk15G+X5NcmDnMJ1y7CaMkq0D33c2a5XKuxIbKgJ0+W/lmOYRmD9Q0ViZ1n1akG+3l9Vv3Ixa6z1mxuVRyWFzbMVXsvKv4zooA4nQ201X++s405CVRFIbH9pYuoHMoB+X3zcx85S1SlkKPvfvN8XmnWbMgGTPTdqnanjnIMKSK/S1bAru2XdrEtSW0neD9Bx4fz6Xw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8592.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(376002)(136003)(346002)(39840400004)(230173577357003)(230273577357003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(38350700005)(41300700001)(36756003)(86362001)(107886003)(2616005)(26005)(83380400001)(38100700002)(66574015)(5660300002)(4326008)(30864003)(2906002)(966005)(6666004)(9686003)(6512007)(52116002)(6916009)(6506007)(66946007)(66556008)(478600001)(66476007)(8936002)(8676002)(316002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?os2U2AtR1TuYkXw1qP8mlQvTyH56j0EaAMDRGAa2WeUGrqYIje83yaBha/2H?=
 =?us-ascii?Q?FFLwtKj2rqicbAAimLAnXlryEgnOfK/LwaP98wKeO5Db58GH8dEI4fe3Nhdt?=
 =?us-ascii?Q?yP227ngazG5ruXTdsK6FrPIaq3C+0rIi/+YhZ53WFAfxgE+hBKmIofiwkCIB?=
 =?us-ascii?Q?axpi8AiTdmC16wL9Dti7DpCQiSIrgR2lNIbrcTkj3BXbw/H+0lbGD32tiYPo?=
 =?us-ascii?Q?K8nt2KGVd0x+q6SjzNhQ17/TXqlap2ghZP/iaxLL8ZkYqPUiadpZO9RKmgaF?=
 =?us-ascii?Q?4CIaQQ6oqmKamQ2DY5OJFDEFDCkaJCWuBk23yEJXga1vbLIn5g+g/SQYQfkt?=
 =?us-ascii?Q?54sV8RTcP/qmhnSWzr+PGv7MQi8/f+MdDYS6Wwt/yw+jVkAUfbiwQnFDqRdV?=
 =?us-ascii?Q?fmeqiiO7l+kDEGKsBA0RAhYrXcCucMP1tjItrHvhkqObaeO7RV0dti0oTbAZ?=
 =?us-ascii?Q?iyetq3+YANkk2py3vr5rXagF1rBcXUkio+c8LLUZlx2P0NZBLcAftjKugWFH?=
 =?us-ascii?Q?yh01Im67UT2r4QcY5ntzobdwTLMY6uTd7FzbJKpjuthK0t44MopgQI6Pjmgy?=
 =?us-ascii?Q?kXlCL9h9auZZoFQLD8TXZubR5W0zg7KnFnOE+CeeBDJOoIcx4jhe+YQBR0ty?=
 =?us-ascii?Q?9XP6VjgQS2I41FPZeu6szf68vqhnK3Y7+JvRWfgNgbUQqBXXb8hbrg9cxXNn?=
 =?us-ascii?Q?efsHx/9+XK2rfUn4eTRVQMzrzJwcFuVpBkqiHfpfD2d6YWCaG/JbDoLdpMpJ?=
 =?us-ascii?Q?ZXYw/ANSkRTvkVFyhIDgNQbsVeH1E7qz3qs5zEH4eaxXCt+KstYtb7w6DS+k?=
 =?us-ascii?Q?JydCO26akVMr8DJ1Hv44+fevKeYpzuAfkSe6NMIiSljmgO2SCPePYH3Fj8VG?=
 =?us-ascii?Q?VVihM30FuH31iQRqOx+blU/jZqLoC0TY5Zr8koGtCuz94eheuCqpKPm3GBKG?=
 =?us-ascii?Q?kS3lXFS0b1CWmxhyxdp8LZry2lxiHpv66IoCTBEzrR7CL03auN+Upletiyjr?=
 =?us-ascii?Q?EUW5s0GialXehDW9UoceWsUWeNKvdpXg6s3d9c71kokUV1k8MKs3g7GJZL2j?=
 =?us-ascii?Q?96f9uoqYCKVx+3yLnmN73W57HqUUtIMCuKebFd7HcicCWUhKVSU1BaB/WUju?=
 =?us-ascii?Q?6HdHjXv8YxPnCIQL01CPMDZSqEA/sKM+kkc6hEFHFNTA4hL+YoWQFnHkcFNC?=
 =?us-ascii?Q?VzPj8G3xEaCLe1CuaasXpRjAHPeCYRHDXpPNHuQNlC1Y6f5l1m5fO1luGwwe?=
 =?us-ascii?Q?cGMJuyxYF+PmUGmKb8MCFRjTLHwyUbQqYdEGcOqgKlBMgka6Nrcn6lnJxfRJ?=
 =?us-ascii?Q?I5R5uwzP72zc2S4/TFSpLObgHVR0nzxlTLRde53/nNXnoaY5tDyJ2WRZzpB4?=
 =?us-ascii?Q?vAM7/uc0foJAFTwkCn+ZZzAznGUEtbeMd5oV0Z1vBXCZa6x/0HGkgEYbbdZU?=
 =?us-ascii?Q?7AJaohwSPNqOBayx/9ZHGbOIPXuFXXc3whGBIzqlk+i8we4WrNeq/t9eiOh7?=
 =?us-ascii?Q?5QhHg3c24V8pDnMSA8/UqIbSqkfjHZhgu/btf0vIMrvS3x49lc2iE5Zjn6Nf?=
 =?us-ascii?Q?X7XByiTk8Rl77Kqcsy356K/+++HIGqm/mPn8uFthjTjB05azBcRI6KJvmJEG?=
 =?us-ascii?Q?+w=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c9b09019-ef94-4bf4-c120-08dc1126b899
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8592.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 15:21:58.4363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NzvxZ0M69fk0SfZ+Kjz4YzaU3ZsS7fjyqeH/6fR7KJQaEJEbBASP0oDH0LXRrXrHwdO/DPhP4DN00UnwyTOXP9DQUtmWiJp1A4rmToEvWmU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR01MB7701
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jan 2024 15:22:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108199

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
index 000000000..f352fd7c0
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
+@@ -11,7 +11,7 @@ eprefix=3D@exec_prefix@
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


