Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8253DC46CD3
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 10:19:35 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.87])
 by mx.groups.io with SMTP id smtpd.web10.143987.1703845169443651722
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Dec 2023 02:19:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=7TmQCM9x;
 spf=pass (domain: navimatix.de, ip: 40.107.14.87, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F9H1ULv+WfAD3fci+ZczDkbQKwclDDYcYbNINHX4XD2hubbA4kFDBsck35MCyTSyA+KaSWtHDxBFEmGmsqUu4LvdVr+dZWSuD+0zdi7d4kl1c7fEigX6HqhIBArmOf3CPrYMerbNvmd9hEyPL0wH2r8Orhus8DaJEgG4peQN1ifK2dDKORjmQd9p8bD9gEOrYXO56Fd/KXHhKq7Ox6EN2JK9yHf2dWvn9BR6cKWsxxQa62UPkzW6OWEvxaDJgp8L2rXXrFgDlyEjhxATftDMwk1ZnvA3CNlSx5PWacmeTWVN5+YCWEKBaJfS/Of2YUGXcdPFOPwU1VkGfzkGxo96xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ekSPwsqd/P4OcDUZMbf5wE4WZimQX80GnrWgVsrWjgk=;
 b=K/4Qfkdy1+Siv3XEvBABOzkP4Mv0co377BF6lkM+l6X/UozjWNtNwQlWgxSDlClNHWQKjunzVfm5ihmtifWJPT77HqJGXyo2z4C//dbyGVBqiF/XVTJkMGhf6CD22L+p51iwOkqNT5Q1/PNr99HGUC5zPext0zSqPR+vUSKhyehFnRbwqB77XC4hnOSL/ECAgVINsvET6srWU1Cg9ff+SbHY8WWk36cAymFgZeOEsPLQ5wgkoqsDDxfeTcFJW/Q0U461iuONkr2+yruKKoNf1EGVaP4BQoadbv5giLFAb5Hu1XF1vOfFH3HkY9TWf9YMfp0BPUIjg0hKDKVoTjpMLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ekSPwsqd/P4OcDUZMbf5wE4WZimQX80GnrWgVsrWjgk=;
 b=7TmQCM9xg2PQ+WubWlnRsvA3EJGdZHX62M/wNoSIIDTU0wD7B5/zh6H3omcrcAUfnUukvIJ7LV5zBYKtXR5tZVpd7w4xpTpkTL8kErVTuHhn54ni4L9e4nkf0bbO3CyQ2qteKMl5bhglbEoS8uM1V5GVGrVtDAklhQjlUwkYIVg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8592.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2f7::22) by AS1PR01MB9107.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:4d8::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.20; Fri, 29 Dec
 2023 10:19:25 +0000
Received: from DU2PR01MB8592.eurprd01.prod.exchangelabs.com
 ([fe80::ccd0:21d8:8742:ee1f]) by DU2PR01MB8592.eurprd01.prod.exchangelabs.com
 ([fe80::ccd0:21d8:8742:ee1f%4]) with mapi id 15.20.7135.019; Fri, 29 Dec 2023
 10:19:24 +0000
From: joerg.sommer@navimatix.de
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>
Subject: [meta-oe][PATCH v2] bonnie++: New recipe for version 2.0
Date: Fri, 29 Dec 2023 11:19:11 +0100
Message-ID: <c9925e3b7513843852cef0314fb2a16c962f7d3c.1703845151.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0265.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:86::19) To DU2PR01MB8592.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2f7::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8592:EE_|AS1PR01MB9107:EE_
X-MS-Office365-Filtering-Correlation-Id: aab321cd-3a0f-4f09-f8a3-08dc0857a1a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Pnj0D0jms4DNsPpcaFMzGRyj4g7vaEWQt09VGe8f169WRefZElj7nPgrjGCKWBHkg9rGnYVUYlbfuQr6HOl9mwKdYJahEFmpdY/81QTI/VxeKN6RmnX9Tkan0rR6GEJhZ8xPKbAYEQ8kaDLz8mTJGa4J4/v/0haWFf39DX4HWYGbYUbyCKb1R0+9hTuIr7unYBXq3sDunby/g5I6MEuIxSiA8pKLaiuf98yvggvtHJpeP/jjHWI00HUdclDLnRJMBXn6WAVIV8igqocYBtUyGlZXABPU6Lkw6KD8aWx7MUs588Wm5lK8/JVZESORtXM464GxQ4sefquI6KjDmN7ziOBLLTbbi3ELfnMoRtcBgm3N2F2O4lu6AlkUA0akpMbMx5mimJuAPelTsEC2JolBmf8jtK5Sh28tvmUNKIfSGZtgGhaJyt22PdZf3r7mA4PcZr5qUMq+IL+pSNDXgX8QV5mDNmhgS0BNm/NjI0ChymVgBBtxhbAHf+odvDcflAebFErjigpIlfFIpzKytaHj8c+VolyyOCC/LSQ0gS7U1KtOV6IVIhyIEY1SjEGLyNtfPX8y1nugtjxtN4CfzIPKKStPWSCBcW9xNuNOGnxCjxU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8592.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(376002)(346002)(136003)(39830400003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(6486002)(8936002)(8676002)(86362001)(6916009)(66946007)(4326008)(66556008)(66476007)(52116002)(6512007)(6506007)(9686003)(478600001)(2906002)(966005)(5660300002)(316002)(41300700001)(6666004)(107886003)(2616005)(26005)(83380400001)(36756003)(38100700002)(66574015)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1ursHq9Oh5fFxTZEOfSLfwT3yuuOYOTA0XtkpehCl75skGJNXZOuXpdQDmaO?=
 =?us-ascii?Q?QCRnh2KLc+99fCASXUnHb5/68l4MKBmnnmYi6KHG6om/j8wo9bMswQtt2h6k?=
 =?us-ascii?Q?FmjFMlBjBezvxXcPpB034bTyA8Zv3NlCTZQ2301tMb6NgYmBsp/MCyxCUxMy?=
 =?us-ascii?Q?HPRwJ+6sJfxuSVMa5Z65kZt8/YJ7MzlHuQlu9acj4ug1s5j571TeXx57Y6Kd?=
 =?us-ascii?Q?K6CUHOQKlpbjLUnG+Zqk7KeRqZzdmlEPvkFiETTBo32kf4hz5FDWWBHyF8Zq?=
 =?us-ascii?Q?FyBEa/c5DOtn5FuKlxpAFwMn1DL3Ta9XTyV/7dJGllo62kdmA7jdUjx7IedR?=
 =?us-ascii?Q?w/VkMedini76KepsGT92MKl89/bEFj0szfB3tGF1N1NvRh8D8nZ8kmPfWD1o?=
 =?us-ascii?Q?cY+03KnPDfVG0Ey20D7v9Em4Hk6orfsJdtnnAuUgwiFa/xMG2XFlm5dkYxCN?=
 =?us-ascii?Q?meLI0mIOGryEIXFR+u99d5dW4hCWbQlYZvIYMq3LoIv5pyjkjkMt8NtQ3Idj?=
 =?us-ascii?Q?DtSYaN8HPqW/ygNInANnFxRM68qAbYuEsDVVonpudAuGleHmrq11Z49zC0mJ?=
 =?us-ascii?Q?3Kau6cwE+z34LuAnHTOGUcQB8oYsYspCIux6C62hDdag1e9ijGPRuLZzjAVB?=
 =?us-ascii?Q?rvgbfChJ8bJZBWpmtjjUPmDAyp5HtphC9epg+9va7f7bFSA0xF93TkrNo17k?=
 =?us-ascii?Q?XZ+54js/1FtH+Q1xitaa+Fd9wSLX6hIxQ+XlpdTwKgxFms0Py5YF1T2gudKo?=
 =?us-ascii?Q?r+/wZY9ZJwQoU8VbHbEEt42qKnqjFdTp6HBA3HGhlZ1NumarE38Tl0MUBYw7?=
 =?us-ascii?Q?QbJMjOaZcZp42IL6blOllrpLyUCdfVE62gAQBKjIEy9XIQvopJ8OwEFZ0f43?=
 =?us-ascii?Q?2cZxhCV0XWJefmrWOi0GIblmjF2kve91jPy46xENLLI45SFRSJ2HEG+MEFmG?=
 =?us-ascii?Q?SsWVy3fIdctv/J9D+jD6c1ibEbdSf3LXzNNprdc/CM1wAnyNX4moCaaJP/FB?=
 =?us-ascii?Q?o3b2qE4qaRNnPGnjx2M+Edf2JT5wsexZCegGEcXXf8rjALzLiEsbZGv/3nYl?=
 =?us-ascii?Q?KhDzO+p2xaTAWSRYZOXU6z7U+MOCUrZxA6PNQBxRFbU8POohedeF1Mt4Z/um?=
 =?us-ascii?Q?0DlxXvcV+A7fhBPUzekuHmg2/diOeZh3p1bt4nqTWIiztRas1y6pL0M+bh+9?=
 =?us-ascii?Q?aqscBucNS4GJgdbAFgZS/PeZzjo0GZ5e1O32uXsTxy25CUozQcDhH6PxbsUs?=
 =?us-ascii?Q?9FHgpbOjKsDfQFOL9R0cRqkYgI4n2L6bmUBHNzCuHKfrUqcDDJm/6etYdi3t?=
 =?us-ascii?Q?1JR+cIWTtPYY5kY1YVRi+OOQ/Qh9MW0oumSYgHKDrBm2qkRiBX3XGHv1Qx+U?=
 =?us-ascii?Q?FQEr7wvm1Yo0aAelS4JzCj3nzpp70VeP+Fl2bcK5HUy+o46zhCGsfajWiREm?=
 =?us-ascii?Q?TgfihHGSjfnkPpNuUUzjDOu+tiLdEyExe2/CVoIP9w0Fb444O/lQ8sj7eb1s?=
 =?us-ascii?Q?l1pyBJLSTNT5r7XiX1psxMdmJChj2cOJrGMXCtPxKKrTWjtCAYb0IHdlmPNA?=
 =?us-ascii?Q?ZcJHcqAjPIMCAh1WlNoIfRyn0NIKR/aliYgJ0ldvMbRqnxFRNeBJ/SnloUDv?=
 =?us-ascii?Q?cQ=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: aab321cd-3a0f-4f09-f8a3-08dc0857a1a6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8592.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2023 10:19:24.8297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zoTHaSXcpnlLMuMocVcSFiL89kAIOE+kbJRM5jtWDZ2HSIqf4hf1rIrwwgcGW54tnu0rzV9wkKq8R3La3A74nOuYc2pbzmr/LMLqIH/avBc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR01MB9107
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Dec 2023 10:19:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107876

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
 .../bonnie/bonnie++_2.00a.bb                  |  26 +++
 3 files changed, 248 insertions(+)
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
index 000000000..839ab7759
--- /dev/null
+++ b/meta-oe/recipes-benchmark/bonnie/bonnie++_2.00a.bb
@@ -0,0 +1,26 @@
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
+"
+SRC_URI[sha256sum] =3D "a8d33bbd81bc7eb559ce5bf6e584b9b53faea39ccfb4ae92e5=
8f27257e468f0e"
+
+# force lfs to skip configure's check, because we are cross-building
+PACKAGECONFIG ?=3D "lfs"
+PACKAGECONFIG[lfs] =3D "--enable-lfs,--disable-lfs"
+
+do_install () {
+    install -m 0755 -Dt ${D}/${bindir} bonnie++ zcav bon_csv2html bon_csv2=
txt
+}
+
+PACKAGE_BEFORE_PN +=3D "${PN}-scripts"
+
+FILES:${PN}-scripts =3D "${bindir}/bon_csv2*"
+
+RDEPENDS:${PN}-scripts +=3D "perl"
--=20
2.34.1


