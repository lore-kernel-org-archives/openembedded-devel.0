Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 016B0C47086
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 15:41:15 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.56])
 by mx.groups.io with SMTP id smtpd.web12.5511.1649331879515772647
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Apr 2022 04:44:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=J/cosqB8;
 spf=pass (domain: weidmueller.com, ip: 40.107.6.56,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hG/ESB1pCYhP+1/kSEtnuS/FjB1000ORC89xPex/pBYGGwyCtnPlbNfLno10jgDH2maU/MF7Rp6hgQBweymVB9sLyArPqXdpiamMBIHAfM7iZ1dWdTtx7FzPCpkpQ9wbSScMu6B0u3q99UdhKfWNu7ojztBaZY/BR3/EeoE142zM2PSs2SUWVR9p0UocrzfPoG7cL8VfbaJ96boXBSKfXspIJRyqojylPETsKs2vCYTLXjiZrPcg7hb+XWUIugqT9Z6j7enbrwtYqHTaqH+xwxk3XpuLM+Ccw28XdgTCBQG50EMnkXzTWf1uI605w3LVNUsfHg5N2XAvlS4dn1Vtrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pft5rRUSKV4F9qk+K/NGCCM0J6CjpEd5YShuAuKav+s=;
 b=ePkLh3eLEDaqjWeg0RT2CFgZqzIkmnIgi0e8tbbhLi1/kcsWAYpEoD7u+u6PUtfrknYQbRWHntL8UO+Mqbv2gN91ti1HHCFnesok9WnRlj+oFkOIjOnBuzBp9bQNJf7UYECSLVf92COUaYItS55W/d31z5DG3IsafeSk7rmKbHwsR+Iep6fGV183Cx3tFfyepkJ3f3NzSfnWOW3fkzdrkDiET0d5Zzva8uYD0suzAv79VNzo9HGehrU3eFncvwvdg/XB240z047rxNFCL0ljbMYhLzDz57KFcQeD1sEKlWe0lve5iOdYQGBSc6tgZsTulhO1WMruO5R+1NIgFqLfpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pft5rRUSKV4F9qk+K/NGCCM0J6CjpEd5YShuAuKav+s=;
 b=J/cosqB8mD4y9beZ4UgGQFeAN+N9XM/1u7cBxAEW5rR/IkVB1XJZaUrGRfzcS3b/PlVdN2UXWLAdaD1xfHB83b7hLkRMLdVhjYvd7Mxno9HT8soM+vFePYmIs72h8Ms7RG4jKspRXPMQeo8RU/GijTBQOCgi5VFv+4FBjgkL9kU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by AS8PR08MB6230.eurprd08.prod.outlook.com (2603:10a6:20b:29d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Thu, 7 Apr
 2022 11:44:35 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::c53d:64fa:866b:b512]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::c53d:64fa:866b:b512%7]) with mapi id 15.20.5123.031; Thu, 7 Apr 2022
 11:44:35 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-devel@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [meta-oe][ PATCH 2/2] grpc: remove useless link with libatomic append
Date: Thu,  7 Apr 2022 13:44:06 +0200
Message-ID: <20220407114406.6828-2-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: 
 <20220407114406.6828-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: <20220407114406.6828-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS9PR05CA0016.eurprd05.prod.outlook.com
 (2603:10a6:20b:488::7) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96c05e4f-16ed-41e6-9304-08da188bfc9d
X-MS-TrafficTypeDiagnostic: AS8PR08MB6230:EE_
X-Microsoft-Antispam-PRVS: 
	<AS8PR08MB62304302ECCCFA3132CFDBCED7E69@AS8PR08MB6230.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8ZYd1gY76yUwAgxnpYQxfZlAYjMeiS8HR88gQRTv1O8uRCky2adrDKOPrqDmTKuqNLIERHQd2Cj9+fD+fz2Q8sivNNAZvtCVRMFeA33Dcz7fWqrHSJJe4v1hPXS1tF1w4TKiYT5aglRIouz2MXeghes6e3rWjJKM8qBqGBZA7aeo8d7e+Rnupxeh/6T9O4BKpnW1zKlh4+IouBCUbVYLDtO3AqX31f5LDSDlZvAcIn25pXxWJfYCP6bLsbgcGt1nxnoiERxLnu5jKYso5V1ih0AI/lCat0YfndbHaKAL+axOpo+kRYu5oOGp0awIXWK2iSTfr9acTkvCvxd6+sOa3uzcC9WvKf1rnwPbj2VLyuGZZqcn2Ybr8GKwCZG+0tRCKlz9UAJeNWQn/fsRK/G3ukR/SgSjgayZmtWka5Z6G7AM+3KRRtHsz9Jo/t6fzodhaZu+WVkBzLYTLK5y9Ksd65NRxavEzrhg8BGtstNC29A2gap5dy4ydmtvBmu4Ak3Bi0NESgXi2V5DxyfkI1hqdalwlbjUI/OoY4jXq0Gwe6Md/D9y5MWgRuQreVqx1VEvAYS8DX0eQX/oDi7e1NbnUhpt+kn7FNmkAO1LEwCdWHKEz+ebWhYXQpjxmFr8o3WUxFgq+SfA/p32GCZFn84pdj2eIzcMEcyFGDUjBZnGGOx/uHZzt9MYHumwtnuIzafJ7hqMZKZ5oxKUXZ76DGEWFQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(5660300002)(52116002)(8936002)(6666004)(36756003)(1076003)(107886003)(2616005)(186003)(26005)(86362001)(508600001)(2906002)(6486002)(83380400001)(38100700002)(38350700002)(6916009)(316002)(66556008)(4326008)(8676002)(66476007)(6512007)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?384cevGAN5Q+og21rXP+ETKKST60vkHE0gxmnqJ2EBGYOufX/ED1smog1Tu7?=
 =?us-ascii?Q?On/dk+rCOghX9J3FI7232ioVcFuhyvglcZ+do3Eq3gOnhqbIr2yw36DxQWl5?=
 =?us-ascii?Q?fffa/f5vZ2gLwdiB7/kNmU58FSe7yjUV/KLsrZx7iPkqAjbfVy3Et8eqOqKa?=
 =?us-ascii?Q?d78uyZuMjZyqVe3ia5l2Mhbc8pfVU5jAstoG1C0NBUUgBZomcu7lLYi5oYGO?=
 =?us-ascii?Q?Dp/IOuOmQ6zarssRyT7/n+5NeBNK43nlCJIUsuCzmiUtqmbcv2uCk+Nzwpbt?=
 =?us-ascii?Q?nGwc01dvQDTh9C43GyxF7saxQrGZouSvlz7RGYk5ZOuit96WLATU1kjXW3Ko?=
 =?us-ascii?Q?19hZ9GWwwbUKhCC+jtuppYb8Ti8iOzIe4R+HHCqV63Wsh/Mc7PGRl3q4Bd47?=
 =?us-ascii?Q?Gxbkm1S6tJgAbsbjJaESk2CF9FSkUp1rU3930aJcBp0nUgilRYYFjnxAMXs8?=
 =?us-ascii?Q?nVdOaMoFm6ucYruvjO04PUB9D5U5rQoI4nl5+Vxoi25RjerKIGl2miiWDmaD?=
 =?us-ascii?Q?zqzO1Je3gAYolx5TYEhYaE/+XgMLOCjgfQuzQUf8ikruNU6I7omqLcQpoajb?=
 =?us-ascii?Q?p3K2fM+n+ALpG3aj85EmAPUlxWFaf07k/EUYz4jWxkTlHT2H+tJ1lIisG3+x?=
 =?us-ascii?Q?lXXKCacN8CRex9rGddA6JVRwabZJTYCYQK4srfJwXyYuUqo1UOhSYxpKsi3R?=
 =?us-ascii?Q?o3/NI31Upxj8tEwRCMm98V97jYcFe6Lxsfzjpl6SVwAuQ38qtBRFUGWdRweY?=
 =?us-ascii?Q?3jk6BbJsFZg15Ifc3ukcJr45Umn4C1j7jFwbM1lD1oMF3Hl0ZS3E9+6R1VEZ?=
 =?us-ascii?Q?risbdFqG8MaU83hCH77XQE8e07l0Fd+YjAN+nTIDSS5IAGS1l84xtM6t7Vuk?=
 =?us-ascii?Q?qWNrkP+r86bigueUG239/qoEWneJ+0MVqvaoUyZg5Y5CO8/zK4YsIhbX2T2O?=
 =?us-ascii?Q?IHY81mUgf5tRzJTUSJy71fWA15j0jQIMmbzOKFeCYj7Z+nlgW3WVel6glhcN?=
 =?us-ascii?Q?sHQXxjnOYlN/6rW6LsHv5/okQ6CXmtdR/4dIdI34G1bOK1vN0dTBynPbwjCy?=
 =?us-ascii?Q?GS01oW310g0rg59NkKDna6akM+5nHKt3KCcyAbc/adif3Af1/4zvnM3xY3BD?=
 =?us-ascii?Q?TqR6w/hpMQ7cbS87mGDebCEAYJHP+Q5tlaw9wAiP8B/f0y+RBzm57wMJJeV0?=
 =?us-ascii?Q?FyqAJ8EP5IagKlf/IHVViNPg1vhfEdXMxPQ42PYnZ7bMJI2tedMj0Dl/Y+Rk?=
 =?us-ascii?Q?rIblOzK56yCBaQx7QqZHUQJSQ7NB5U/bo2mVFEBkwyBY5JVJjARu/YS/NP7m?=
 =?us-ascii?Q?WuiqeHhXjxI9mnG+8dtzUXU/2DHbWFFqD0TcycMewkFDwiErl0gBgUgPvg/9?=
 =?us-ascii?Q?DA1u7bQlgogz0IZg4iiyMhC3n7DXNU2H01va4cTAp1hx5aktJ+EHSLs/GiQ8?=
 =?us-ascii?Q?o8pGBfK0WP+uRRXPjYEbA7XGuMFu/BlopLn351PREPPHZ6k/3PiKQQ6bntea?=
 =?us-ascii?Q?gj3l911q0paLz9FRo1PTAhAvzHyC75k91+q2fyV45xOxffhDAfzQ8DDYSbnu?=
 =?us-ascii?Q?a+ZfwQnxUJ+zdXB9D1eVQ8qEDSSuUFUjncprDlHf54qO0lHSfGiPqm/YybMe?=
 =?us-ascii?Q?IKPH5zcLECLiqMsqQW1yL/KycI8iaVpLnoH1D5e82cznVIA+OfFiIQR5jGTO?=
 =?us-ascii?Q?NlRq23Lj3QSiC2ndwmbu7NRM9ojw8zbEUqDuBSH/JEXqP+nG8EUlbIx/hd3p?=
 =?us-ascii?Q?9pAh5HXPZuQ3eyBegKTqe39mO5BawYo=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 96c05e4f-16ed-41e6-9304-08da188bfc9d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 11:44:34.7958
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 qw4FYN4jV2iXIgeS3K52kdNFqta9ceqPXdOhv3Zi691g8/QxhlfHy6EpI2czVyCdY6gdtZIDvs9Gw6kvGw7yEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6230
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Apr 2022 15:41:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96450

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

The sed commands to link with libatomic don't match and is therefore
useless. If they are really needed the problem should be fixed in the
code for example with CHECK_LIBRARY_EXISTS.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>

---

 meta-oe/recipes-devtools/grpc/grpc_1.45.0.bb | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.45.0.bb b/meta-oe/recipes=
-devtools/grpc/grpc_1.45.0.bb
index d50fd2727..2fe7a9a8a 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.45.0.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.45.0.bb
@@ -59,26 +59,6 @@ do_configure:prepend() {
     sed -i -e "s#lib/pkgconfig/#${baselib}/pkgconfig/#g" ${S}/CMakeLists.t=
xt
 }
=20
-do_configure:prepend:mipsarch() {
-    sed -i -e "s/set(_gRPC_ALLTARGETS_LIBRARIES \${CMAKE_DL_LIBS} rt m pth=
read)/set(_gRPC_ALLTARGETS_LIBRARIES \${CMAKE_DL_LIBS} atomic rt m pthread)=
/g" ${S}/CMakeLists.txt
-}
-
-do_configure:prepend:powerpc() {
-    sed -i -e "s/set(_gRPC_ALLTARGETS_LIBRARIES \${CMAKE_DL_LIBS} rt m pth=
read)/set(_gRPC_ALLTARGETS_LIBRARIES \${CMAKE_DL_LIBS} atomic rt m pthread)=
/g" ${S}/CMakeLists.txt
-}
-
-do_configure:prepend:riscv64() {
-    sed -i -e "s/set(_gRPC_ALLTARGETS_LIBRARIES \${CMAKE_DL_LIBS} rt m pth=
read)/set(_gRPC_ALLTARGETS_LIBRARIES \${CMAKE_DL_LIBS} atomic rt m pthread)=
/g" ${S}/CMakeLists.txt
-}
-
-do_configure:prepend:riscv32() {
-    sed -i -e "s/set(_gRPC_ALLTARGETS_LIBRARIES \${CMAKE_DL_LIBS} rt m pth=
read)/set(_gRPC_ALLTARGETS_LIBRARIES \${CMAKE_DL_LIBS} atomic rt m pthread)=
/g" ${S}/CMakeLists.txt
-}
-
-do_configure:prepend:toolchain-clang:x86() {
-    sed -i -e "s/set(_gRPC_ALLTARGETS_LIBRARIES \${CMAKE_DL_LIBS} rt m pth=
read)/set(_gRPC_ALLTARGETS_LIBRARIES \${CMAKE_DL_LIBS} atomic rt m pthread)=
/g" ${S}/CMakeLists.txt
-}
-
 BBCLASSEXTEND =3D "native nativesdk"
=20
 FILES:${PN}-compiler +=3D " \
--=20
2.30.2


