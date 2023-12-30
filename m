Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 743C7C4706F
	for <webhook@archiver.kernel.org>; Sat, 30 Dec 2023 17:11:46 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.83])
 by mx.groups.io with SMTP id smtpd.web11.188343.1703956301010354065
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Dec 2023 09:11:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=tr3a+TG6;
 spf=pass (domain: navimatix.de, ip: 40.107.7.83, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MPRqDP3mQZdR6KFoW5epbl4Y+p6ohJwp7R6c9utkE8VdO29p1O9OKTDaqxnCnaHU1aRTzA8OpJ7nSJxtrNNM7+9/V8d5KxDUQMJLKEnbGdRq34ViS9JLm2Ii4NSHb9tx/lD34lQZDrBai5/6OvSrwBTKxkgxmHAxuvmAqdu2aVZowCRlVpuyz5UProGYW6LmUMaSuUiM+pyX2GC5mXcVuEKBsPBvyewkv3XoaxgrAuQ7ibyuJnzrAGklTQvdV/18skDeKGi7gE1lbGLe71+/Wbjl6EFarkaOL7WLgMy8PA0XaTUMZ4eWb1bVenzPlSSc9v2vA6LwQ0DOoYN3EhFWmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qgv64lbxC3KKkgQaJG+Va0PGRWw+/dBqvFcRiViOpWs=;
 b=b1nYxGhy3hEvQvzye8s9VkHwy9PG5KmHsmy+haNiuw6PrjmW+LY/NtquY2xy14zmtsdbajrysDZ+SksrLaV9P+6aO69PypJd53OttU03ko78bOlqKUVQ5vQrewuSbUTQA1j5cyDMga8vNklF29j+DTvG1BQfCwnQC4TuujH81zstmiF1Kb+2gigQspMgR9Qu5nPk5niay2rNrJF8NtRm+gtVB2yx27f7Z66kJ8oNvCdgp8HfhxM8c1Gt3iJiOLrxmYhSMNUNr1MVylq30D36+kcgNwOBzCyEFevoVLffpI6tBC4HjKMyA30ft6Ux/U6b/96bXUZY+1CYa28c8jq1zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qgv64lbxC3KKkgQaJG+Va0PGRWw+/dBqvFcRiViOpWs=;
 b=tr3a+TG6qZHgW4mcnw3UPYiZ2q3wk93NfF8gp9jKrjs+cjOYXq0fsUfCfaITwX3zVe0VpYQ2+rkpu7WQSYC0Ko9t8O7pAQnlovWZ0Is2iHXaMoLYlYVFHJSTcAOnJLQUrbYP/hfjeD8XncWlAjMonJU64TaiQpCgQgygFCI8Xnc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8592.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2f7::22) by GV1PR01MB8498.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:21::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.22; Sat, 30 Dec
 2023 17:11:35 +0000
Received: from DU2PR01MB8592.eurprd01.prod.exchangelabs.com
 ([fe80::ccd0:21d8:8742:ee1f]) by DU2PR01MB8592.eurprd01.prod.exchangelabs.com
 ([fe80::ccd0:21d8:8742:ee1f%4]) with mapi id 15.20.7135.022; Sat, 30 Dec 2023
 17:11:35 +0000
From: joerg.sommer@navimatix.de
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>
Subject: [meta-oe][PATCH v3] bonnie++: New recipe for version 2.0
Date: Sat, 30 Dec 2023 18:11:16 +0100
Message-ID: <ef6ca57a6b751c8ad5cbdf2efed91ab584cf5096.1703956276.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:66::8) To DU2PR01MB8592.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2f7::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8592:EE_|GV1PR01MB8498:EE_
X-MS-Office365-Filtering-Correlation-Id: b1af555e-baf8-4e56-9990-08dc095a6076
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	38Awv8pYa8iNXaRx/VotpPttoBwPUtQb1fdfGQjLAjHD/naXxhZlzrfcGMDg/PnMzkguRzb9YzY/l+sScpoh8hKmsDposjtl+Pw0Wium6dbMz1T8qRS5QSbmy/Pf/hlH/b2M5tgWbpO/LDZpHIIplR+f56AhCMVdwFHIR0qom13L+ex4FFLwl45700NCORtnfzotGgZ5Hwj4iMn6qqaYjDQh5c5QIhObh6NfCBsxieIm5Dpvtt/ZlVf0zAbeJqpnPXBS/K3LlX965xdBkMxtBg/wbKT/gz17829dFKV23ju1YcbAq7kpQ9vv+8uf+Gd8BZ/137hghNS56NjVk9KzQ1zMH9NhYeCv++o8+CRAUD8muFXJKCnCCVSKdl7zCX831mDFDfa1Z61O2DOhdmyEyDS49MuA5x2aInll66xP2m80A2Ukv0uA6gsRMZU5juGwZaCxwVwuZT03UH90SpClxR56HYkOx2nBnKgdvJpEtxw/IWXRZyvEgZpYSFxwDkK7U8psnBiyUTVPeGS4KHomxd3aS9V7HUf3aPQtZNGmYnqDJt/baiL00Ps1Dw3LI1X0vyHtJhkt2yKm7qKR2dAoOs+kCPWtF3m7w+XU+pLPoEfRpGsRlWNUfhiAHH7rU1JgdotBply9tqAThQYz7FFLOw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8592.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(396003)(376002)(39830400003)(346002)(230922051799003)(230173577357003)(230273577357003)(186009)(1800799012)(64100799003)(451199024)(6486002)(966005)(38100700002)(478600001)(107886003)(41300700001)(66476007)(6916009)(36756003)(4326008)(86362001)(316002)(66946007)(66556008)(6512007)(6506007)(52116002)(9686003)(6666004)(66574015)(26005)(83380400001)(8676002)(8936002)(2616005)(2906002)(5660300002)(30864003)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?I+MM8OC/ekeId/dFgBmAv+tgqpzpi21AzR03tTn/zP9uCMI7KJzOgsdybXWZ?=
 =?us-ascii?Q?AiLszUM5rANdIGr6Quooazj+6rWfhVYf/28IN9OCmjJsGwhTIEqIxZcSwFas?=
 =?us-ascii?Q?YA4AsCo47aDQLlYGQpFBsDc4WQAe0wRirlv1BlkcdHo8EQUSiT8gu8m2Icrx?=
 =?us-ascii?Q?AVE6BXsSPwDr3bHg8D0P+7We0EaqzePbXNL6utbEGaDE+9MR8KBosgD6Tn30?=
 =?us-ascii?Q?3RukagTflbSc51rvLvIzD9Rw2KfhY32PqGK12lJSAiZ5AQK3RXGO++9KGeFw?=
 =?us-ascii?Q?3n/gEqhmMw2NFcYk4FC3AwLyjcCtEcjSNiyCz2FTKgWlibQpMqHLlN2gyI86?=
 =?us-ascii?Q?sD7R+HSt/fjmrmfpfKTYwoMoZybPzHgIjvfJGg4s1nvpwn2HBXptD/1g/sS1?=
 =?us-ascii?Q?IyxBYmwczjkgtbt4iAr90FY0NN+6Lt1PbVybFlhI/VuNEaNqMDZ/HSZE+Zjl?=
 =?us-ascii?Q?8tfeNHcZq1Xnf2XRJbArqpQQxuS+AM9tpXmzV1+N6Pv5v0a7gbfiTfQgT5dj?=
 =?us-ascii?Q?WGVZ/bjbfWABJxxM4KoRS+7r4TD5WdZNaejge5VeYYg2gcmMM0Lxq6GnGesi?=
 =?us-ascii?Q?++6pafBfStb2D38Ot7ouYo/neXKPO+XGC18oGHeI4szoUrnG+WI/ETbBhlue?=
 =?us-ascii?Q?Ku3lXrz3L1GSxo9tp7wzbONPFCKhHhH1OXDW7jrzlFP5ovJ6h+xQ0CIRwPzR?=
 =?us-ascii?Q?oaNMUR1UiV4fsLH53jPjmJMYDvdDxH8SGzwuCDf59nA/JK5/DAGTlqxJG8Il?=
 =?us-ascii?Q?FqdeHmjn4BQdxDKNXRQfms++XllexTuKFZtZlgzPqVhXnI7cruhbtG9bUqyh?=
 =?us-ascii?Q?ky3IgbXi/iu5+0vJbL7FOmpmstQxFKtCpetI9Iy3Q1mt0+Exln84yEQbrHvG?=
 =?us-ascii?Q?MyWSSG+UI8o0eCdORjX6sxx5MdRb3X3u0cithcIaaXbKaRoiUhcoawnlcMjJ?=
 =?us-ascii?Q?v1m9TSqTQFc27O/Q9JCI/dgKy0j2M9dB5CPm1Rm9tZRA8yrsatHoylztLpG1?=
 =?us-ascii?Q?kWd2Sk+3xcf2A7FTmbEenPH/qPcwYoKjPjQqr7xecpcu+ATYB1NFdun2GC28?=
 =?us-ascii?Q?WLq6HnBt+BtmdW67h0bLyu6eVyVbhzDk7sDNFnNbWpPkLn6j7NResj8X8CsA?=
 =?us-ascii?Q?z0LlMrp2krgMeZ1kfZN+iMZ3at9//mu1ALZVZpmM1m86a4GKK22EhwE786Iy?=
 =?us-ascii?Q?dR6vZWMaDuQjrwEZHsgbzeTugPnZbtr2tV8h4TUguAaMFf4EIT8oaDY3TM6f?=
 =?us-ascii?Q?o+Xew4x9n+scDYv7X4lxKTKljWxuCeuSQc2wiv+KdhRgZYog/kN2WJQjiyVO?=
 =?us-ascii?Q?fec65XBgsuNF5CAIoexT9wBjk5WQfpHYc4HqSMeVyb821NNzWA3nSoinLbCc?=
 =?us-ascii?Q?roCN8a1cVo65cgfXcegrSEzWd95Aec24wm2101zJUEmAYkabMc2CXoHoJIyc?=
 =?us-ascii?Q?zw2q7M+Dm85S7o/KdNUyk307mY8AKXHI/lCjYP5sO9eqbqN94UNaad9hJaMl?=
 =?us-ascii?Q?aUlbswPmX74SGnQ/VL8zEt6WMPrC+tvnWisVo5zltIY2xIKdE7p7eq2D3w+f?=
 =?us-ascii?Q?mUaaJBo/XvkCWGVBZClU1JTE2ER+YIwdfd5PPbufxnd9DeolF0pOduZHynvX?=
 =?us-ascii?Q?tA=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b1af555e-baf8-4e56-9990-08dc095a6076
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8592.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2023 17:11:35.0834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QbhKRE4tC1dX4oad551Vs71Nsjlk4jtLhOmrXfQs5vU6ZNgHs8wUHW/3TloPCPZalALXBOmS+LJzcPOPS4sk227qomKOA6QbSiCoQdY8LMc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR01MB8498
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Dec 2023 17:11:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107909

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


