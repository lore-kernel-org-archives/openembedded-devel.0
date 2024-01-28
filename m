Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AF6BC47258
	for <webhook@archiver.kernel.org>; Sun, 28 Jan 2024 18:22:01 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.56])
 by mx.groups.io with SMTP id smtpd.web11.45027.1706466115453983773
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jan 2024 10:21:56 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=g0qD/h+O;
 spf=pass (domain: navimatix.de, ip: 40.107.20.56, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VQ6XsOO7ddKmEF94Zk7xrsPfMdc7zIas0Ci0PdieJAoWigSZH3fRa1V9iCA3sf0ZeUiJQ6qJyxuR5CBL7SNhYbrN4Gkavf0qBXVss0MkodSTkuMp/q5mwFtvKPrT1taBD11duZoIhMlDXDtptYPyLhqq5MjVBUga6OBr1Q/h8LJTle1Zxjt5vH+DkH3MGMsENWXBYQBkDb0fWj/lqB13JE3TAQBQplvW1TK32hLm3be3oFLUFTIXJCfWCetcCIWVY1dvV5cKcWFnX9MHj4c2JcFaCz14LiN2BcnUrbAGY0NvFYE9SpJtyum347blIdq/jsXpMu20B59B3/SsMp1utA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M6KW7cZSPP0u+xbguqvirBkuRv1sNUv5sYpQl+qQ29A=;
 b=GdiEZPwbrGBu4K892MsccrgBxyF+TsxGY7R6zIB9b68ND9yTet2N7tKjfpr1BThtU/EbvZHiNPMtRXB9mUcBdIU04QU98uYJisoL9J7zeoGU1pz7ipQDnBY0lGgdJa7cM68npDA8RuVumBKr/LUkJ/XWQxqeykVaQnO24skhclFnVoRJuIK1wxDI2BofGjRx/vvERAl5lECc3r4GLHrLH26VKHnb11k8WlQRKtHdCIhbnHEAUBRLIEC38SOP3gNNxHus+PIhX3X9lHkuS2hGnrzT2IUSGEwpY2QpY1zIZwlz33d5t1HFaZOR9Jdu6uM+qghb3RykOqVmTFl3r5nv+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M6KW7cZSPP0u+xbguqvirBkuRv1sNUv5sYpQl+qQ29A=;
 b=g0qD/h+OP4tltRWyCcfLmuzX6/KP9kQxL0cKm40mWVl7fbfBAgZB8WPX7DoYGhXAz7EZ2s1kGCU+dmQp02R/dfbQ04hpd0Glr2VUibdU9nubRt+zIXTbAJA9VvWYvK6nxGjWSDHTyXw7ZHCRzC7JDp7hbyJdm63NJLVVq8pFffE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from AM0PR01MB4627.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:ed::32) by DB9PR01MB7289.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:21b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.37; Sun, 28 Jan
 2024 18:21:51 +0000
Received: from AM0PR01MB4627.eurprd01.prod.exchangelabs.com
 ([fe80::ae81:b0ad:f122:4d00]) by AM0PR01MB4627.eurprd01.prod.exchangelabs.com
 ([fe80::ae81:b0ad:f122:4d00%4]) with mapi id 15.20.7228.029; Sun, 28 Jan 2024
 18:21:51 +0000
From: joerg.sommer@navimatix.de
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>
Subject: [meta-oe][PATCH v5] bonnie++: New recipe for version 2.0
Date: Sun, 28 Jan 2024 19:20:58 +0100
Message-ID: <42276a3a2b29194fb5ff686a23423781c325e160.1706466058.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0406.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:83::7) To AM0PR01MB4627.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:ed::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR01MB4627:EE_|DB9PR01MB7289:EE_
X-MS-Office365-Filtering-Correlation-Id: 415e6b03-c9c8-4c06-3e2b-08dc202dffb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vs25c3zT2iyP4YLSfnof8XuBt5NOW7tnTLk4fH9UqOdOj6t85aF6yv9iHsTlT+j6OQhd9b+beAnxJ5QCV2rBtwXTywjtmIi0ZG0yljeaXGDN5ijQoBiLJwb1ed9HhyiVHhiCPayhP+bWdbwIVO+lBOcVJKA9YKppz2GVALj/IUXLXie4vOqDiX9F7ddqdd8KSF+DMyEHg/facjqOr7JwMwMokZcvpnpe/e+FEVs05nQGDopHX28FvO7jTwTCu2I99QPJf4hQRpmrkirubJgZC9UafrKw1QTdj8eWA4YHcm51PHfoayrPFInrwWdu5f6v6eASPg94Trc2KY5Qhb6FqHuVWoK+Vd9ZqbdJE/BQU98jbknIHuTJL5nIEqEJuN/ZHFp3YmNce0ditImqfx8QB+7w3wxo86emFWHFcIcRKR/dDRtSGKXIoohnidsZXpeTYLrF006JYF9SRZ0xRN5WuN0iX34+TBRmAvceJChSE6e6bJaGcR+FZ6ppneiAsLC6QGzBRdpxdvkHlklxrzHRdSofIiPHbDZR1k3ipn/LOn9iejGR6NSBxAM1+B0nUJVwMOe+0A4msiJoNN8AHbgo5tJt1Vyb03nadLpKM43Q+aqxq1HeqQF+pWBMIWCsoumvDQNDbetMyPI0TxlkGTCP2Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR01MB4627.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(39830400003)(376002)(346002)(396003)(136003)(366004)(230173577357003)(230922051799003)(230273577357003)(451199024)(64100799003)(1800799012)(186009)(38350700005)(41300700001)(316002)(66946007)(30864003)(5660300002)(2906002)(36756003)(66556008)(6916009)(86362001)(66476007)(26005)(6512007)(9686003)(478600001)(52116002)(2616005)(6506007)(8936002)(83380400001)(966005)(6486002)(107886003)(66574015)(4326008)(8676002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2lTf8i3E+Vblh6hdRVsnm04bVS0MD5/0pqMi8NazlvLjGLs16ZkiTG5qgQTg?=
 =?us-ascii?Q?WTLZlrbV2T4cjAkDSx3luC2uFqyY53gjhzSX9jl8n46kFBe8XWiFsls12kEY?=
 =?us-ascii?Q?XyxiKiDNvfqGTn2iT4Sp/7HH3EhW2k1nP+YV5vRSbrgZemorxDTLX1FZeLCC?=
 =?us-ascii?Q?kfBTzoMcyqc52MW+f4gdN0bzhxiZ5TofkaLZQ5su67hpfcrTT3t/E7ks6Oim?=
 =?us-ascii?Q?jdLBEnPURfHdnpvUXYlYQFaL/wpGqfbMTkAyd+e5880KGt/BVNxVVR7W9Zgc?=
 =?us-ascii?Q?h5ZySFXmZ9PAQlyNKrFM/6JQZIHynznI7Av88Mi4zw59KkIzeINOCSMAzlSA?=
 =?us-ascii?Q?IfhK5e4BiktnKq2FEGFsI3h6+Vnxh3UxVl4dmCEdBxdUfP0QRaaCai1zTfbn?=
 =?us-ascii?Q?UEa8iLITiP6i4CBM7qlN4WjU6MMDR+MKJmJBEAhZlNr4eInIwYGczmPHvO2z?=
 =?us-ascii?Q?fvlXvcNcEyBVQzpsTF192oCXKlr0bIaYAa/euiuRzXVasoTDRwtXWg0FX3Li?=
 =?us-ascii?Q?BNNLnn3sQRAS1v1Zvp9qHGrJ1XFzUtoAXZt08rpG5o3fBtuK270wawmylnaf?=
 =?us-ascii?Q?ocwX2zIKUqwWGOFThA/CmXXZvrs2dHrBA/7L8Q3KcZA5rOh6Qs0n6O2AMSKD?=
 =?us-ascii?Q?jCs0wSZDLkTk4eV9k1X9mvdEwu3z/uxyy2R3kBN8pfHvwI8UZ51YCb4/YWNj?=
 =?us-ascii?Q?N4IsjAgemx5tkVH1hotEURPSrsBvyW6zT2qPkiCHXJfE8BPMdiZPH1+s+QRj?=
 =?us-ascii?Q?UDPn8340xqKHHYOQr8mZiL1zhV3/eDXn6vH1y6SnEudcxAVolME3B7+USaim?=
 =?us-ascii?Q?UpjH436KrTqjzKtxaRMtgFOqpnKGTDkd/Wd69KAqH6dbX2XODZ1SD6JW3SOJ?=
 =?us-ascii?Q?Ah33UCSx6iOMOcU5NRyX84UlL0MMlrOxy0cMzatXHCkVrm2UXyTVGTq7l16x?=
 =?us-ascii?Q?aHQKgxDlFtRRE5M98HpZIjU7y29fyTsbiP02gjM4gOA0YIgbGEKgzn4HuJZw?=
 =?us-ascii?Q?AlPHJBIUquyBU5T87MvoVpzV8ygGt9IzZ2JRyScP7xWEsheytru5shVNKKAU?=
 =?us-ascii?Q?t4lipMcGtAJBehPnhw2/vZn2I23dMi3xd+qbTgs4Rb8MVzoT1DLEbVgPtnGf?=
 =?us-ascii?Q?z/opXPfqao1yoI/qVnFBjYpEF86q73zN6vZjMDGRsTv39Fb7MXwjRWozSghw?=
 =?us-ascii?Q?t+opqEXtpsU3znsexRkhyBiLoOZAaVf0YMB1H/5HfNBGFPmsrz7SpUZXFE0Q?=
 =?us-ascii?Q?JfBt7C+ObHX8fE6DlVTOYUvMfel1y92ewPB+lPWbm7CIAFTtmGxeDL1b4ROW?=
 =?us-ascii?Q?5/oTxWFvfiXD0Y215Qp5Um4DPaNIR7Q3R77BieXa4xl2jS408yQIec+scGo/?=
 =?us-ascii?Q?HuOsPyFOq6JtHXavfcKt5l8NfumDNOMiAqTdass3b66IyqPkbeWGRp7NWiQG?=
 =?us-ascii?Q?kuHvyX+Br/p9BaF4JV3mmVUtJzzdmzWWNyrMz5ZjddZ337xfO6GSmxS9AMjt?=
 =?us-ascii?Q?4QTsqITyEhWFmUXHGZYwv93a90/jrNRnPXKdxIIFJc0thVvfqIOHCSEoAQoP?=
 =?us-ascii?Q?8DlSTckLEpe0DZSVzh7XhKML0USVclfahlE9PMSNCGSGRpDWqX8ZzNu/zpTb?=
 =?us-ascii?Q?eg=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 415e6b03-c9c8-4c06-3e2b-08dc202dffb4
X-MS-Exchange-CrossTenant-AuthSource: AM0PR01MB4627.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2024 18:21:51.7091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gvjRo55upuKJ7tvKVBLS+pejr0TNl0lv49VazINxvcxTAne+YzbVJuRaj3NwguS3yshqxe9H6wihaBggW6/pYG/4n9PaivOJmFYIs+PFSjk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR01MB7289
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jan 2024 18:22:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108479

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
index 000000000..21565977a
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
+ WFLAGS=3D-Wall -W -Wshadow -Wpointer-arith -Wwrite-strings -pedantic -ffo=
r-scope -Wcast-align -Wsign-compare -Wpointer-arith -Wwrite-strings -Wforma=
t-security -Wswitch-enum -Winit-self $(MORE_WARNINGS)
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


