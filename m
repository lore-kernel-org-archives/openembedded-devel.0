Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F5CDC433F5
	for <webhook@archiver.kernel.org>; Tue, 28 Dec 2021 07:38:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.35893.1640677102383849669
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Ws+um+1W;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=7996075b3e=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BS7R4Mr026596
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:22 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=TAB9pydUim6tYt2UBs9wCqs3et+8Pj6ZUOc+iyzgFRo=;
 b=Ws+um+1WzvBith6CLm5ilBuYrCBB/I+wNhi3sqYKZxCS3nXZ4AHnMu88mD2IFvD/1G7Y
 yPbpXTtXDB3o2PuTNX8FPmQc2WtjpeIc7pHMCdDsBwD1p6QE/mAlaH+D8xtUOEEucqO2
 61mcwfAC+a6zzDBiu7cI/tAO/j80W3OxiZ1VcRklFyQ5Cadm5r2Ugem8oo/YzXNXR2qV
 ftqZPb+PKn6K0z54vFQSvn4V/7kzqJyEBrrE0pG1+0gzqt4JzG+pkAQOGoVAforwiXi8
 0tY+D4/iHKNBhFDjmoKilKrwv3QyFSvAmNRD/vGQUl3Cx8qJ46XO9W+NEa4K+iGVrE+P kw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d7m0c08am-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:21 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1BS7cLds015284
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:21 -0800
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d7m0c08ag-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Dec 2021 23:38:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=auxE5eLRU95Fz9WPIGIcT/Ua3wdUDSFOPCtUF47uLS2CI4/trf/atv9/7O/Y+3ZDVCEK7JjdYBPg+6BsIoGIRL8bcEfM6dlcVDlDtkQv5p1amWnQ7hKKX3lY3eEFLoGfYzKuaUDTvW5by6SLr8u4knXi9E7Pbl2WsRhFRQetjViA0Jiy/V31itbccV3uZtx2S/HSuHT9hqrA42v0ywAqkkvE2zDQP7rca/3fsYFiKpBscpAEoieg9IATdYWc5/3wIwZl39HkUgvimNJ2pHUHf9eIWnAIWAPAQe9OLf14rWW5OzREiMDA0kQ26rEfBxRZJ3SzqvBJqML5SyXczlvesw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TAB9pydUim6tYt2UBs9wCqs3et+8Pj6ZUOc+iyzgFRo=;
 b=RDTMfiRRl3s6qy7IxQGek1RCm+oBzIcBvsm1fCvGkxwaWkSeCSh7JU8eR3m7SfZ006LS6RIX58UggJkerp93oCA0zwBO9GUCg+6do5rzP/O3cxm4LN3u/HsRqmvEntQo2Q87RZDw7t212wFtQglsSRfgWyl37HT7a5XMLGVFWccr8s+DwxpFLydZyQaSkX47W/yV+I1xn3pDnM47MMNKVcBGFXEeNzHxwofBtvfm++HQhUYF11kWxsG9VFhrjal6EdOgx+guwMQgAUe5B/1YbsBMad/kKzVDwcfAHlmo4u2Wc2nOSdGNiQ9Ee01WFqc+2kvUvxDX33zRcD8JKXD+cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MW3PR11MB4539.namprd11.prod.outlook.com (2603:10b6:303:2f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Tue, 28 Dec
 2021 07:38:20 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4%6]) with mapi id 15.20.4823.023; Tue, 28 Dec 2021
 07:38:20 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org, akuster808@gmail.com
Subject: [meta-networking][hardknott][PATCH 01/19] libldb: upgrade 1.5.8 ->
 2.3.0
Date: Tue, 28 Dec 2021 15:37:48 +0800
Message-Id: <20211228073806.868759-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211228073806.868759-1-yi.zhao@windriver.com>
References: <20211228073806.868759-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR04CA0057.apcprd04.prod.outlook.com
 (2603:1096:202:14::25) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b375ff68-d3bb-490d-6f51-08d9c9d50529
X-MS-TrafficTypeDiagnostic: MW3PR11MB4539:EE_
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB4539D9F1E869C1C38D00F5EBF9439@MW3PR11MB4539.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:155;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7hwlsaRqkSi4uIAzfSn54rTTWY2xBFiR3vdGwLe86gVD1Q8YDlCEKQt3d7zTzvPGOskwiKFT7jTRnrIL0UpnNx/0Orf8rSwKJG9STOwKg0KkDjNgT4nO5PGIyfoftXDkqtjJlEN/PUO2SrTtRY9sc92/lePGjzMJjUwzNTKuvH/4EGR9cHmoDvWu8D9o+/jTzwAVQOVmQfFVKelxwoiFzuF4bcF+WDcOp8JhM3tqgRWl5iNboSYumWBuf2K2pj4DWX8UsYj1GybeqkI6sXkWdbtzwpJMWuOIUwjnRrOA+vdVlPSnBBxVqDvUSeLEHNqWmwnxFCSZiLihqBvNFBNxX9JHxZMe6XO7bFbumJdcBCtlOYJ5A1nm2BGaQUU1FlQy917XMcNY5yfcCKFgwLVwOD+yzjAP/76MpttgrADI/jLoLtslnq2DuEmUwxH/37n0QzIaC5yJVRUDK5d6aDKyFLFAZ+rWT7e67id73jlmX4ows8k+YufdivUtnbGZJBTUiZQnXFTdGFEV399K4cF+97o/sooLBO/M5nB2nIc24k5UoP3pASMJA2YLs+CcM6bfD7XJBelf7F7B7jexZfb2F618jUm9MJuf+wkeJQ7EoTGAB/OLu/EAgp4IgI0yvCuUNKnji8Q+MHHKsvwvQm+fvyqfpe0/UM/QkXHOTINJ4t1zaMumeQMTflYTvnvXaEj5mPDw9OqT8nkWCigoo7FsKrgfJ4rsGBsTxiDMro0PDv8tV/DD6CnV0636siYLw9KqM9bD7CZrGWyfGkbFVNjlqNP4n02u6+9IFvQohsMuUgh8REyzxxK48ySOsmiuMFJuZKAMVE7QX1/lHbCbd0GJDw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(8936002)(86362001)(30864003)(36756003)(6666004)(316002)(2616005)(508600001)(5660300002)(8676002)(6486002)(44832011)(53546011)(6506007)(52116002)(66946007)(186003)(38100700002)(1076003)(26005)(38350700002)(6512007)(66476007)(66556008)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?idS1Y2un7A5/dfdp3dyKFPZ9EzQ8olgeR+iOj8yTPHNw9I8kPhcI6RxwCrjR?=
 =?us-ascii?Q?e6iYGapvBn1SKjNIK3gOrHeHrz8tmjkg4m3seX5+Pnk4NDhK2kH6NDWx94fv?=
 =?us-ascii?Q?8ISkE/Zp05C6cu6V0TIHWhUz/hnvFIkfuu+WC5eCEt66Nse9h+7LeXxU2AI2?=
 =?us-ascii?Q?pGjI031U5Qe6hYKla5ZchkAOU7+FbruYya8/x233gn4lo61TfP2tsO6+trJ0?=
 =?us-ascii?Q?Ombz0lkWxdDCwBuGmyN5vRgiapZ8+ki78CDwZAdkd8Jhog7W62VB7OybgXR1?=
 =?us-ascii?Q?oxrNmoXs7A0381vpRbYiFDG+NzQCo40c8KkhoUb9QjbHWlUGRPewe6FevoGi?=
 =?us-ascii?Q?HUC6ZOnSF97sruByhOdrNpVmOzSjRJ6bhvgJPOn7sSxCzl1OKk/DGlW4sj8N?=
 =?us-ascii?Q?mhS8AQil3c0e1Ok7L9wN8m9a7nOUUymAuwWoqY4U8BgeXwkaKwAF0bBe+lyD?=
 =?us-ascii?Q?C53IOk2NNxOpl7dXSq3MuBeW1LdaqNLk9RxqiKZ4BjUmmJk+yNnpIMk84C1Q?=
 =?us-ascii?Q?TP/0QQhD29EpoiLFIF7vtn3GW5o3MRhO1QSyC/dSNveUhgycveLy6opWxIPy?=
 =?us-ascii?Q?y2pSUnGEn5QKio2abRURNdvJWb8xKUJkKAk77PxbtouMgxcKSXhRLGF0ttPQ?=
 =?us-ascii?Q?PcBmGXDm6ReLm35t+KWNRXbegHuorx6OIl8fSMQPgQGyzWsjLQBkBi3CsU+t?=
 =?us-ascii?Q?MHmvtcR9oYIZ536i5dDne28lIHPdOYOkSCRBAoFczixw/y7dFcOqgMaU8OFd?=
 =?us-ascii?Q?BIXTohGrvosUGdzguuxM4WpCObU/rb9x3EDdL3x2Lh+Vx1E05jWfa9TH5uZR?=
 =?us-ascii?Q?fn/Sev9jLitZ6hCs/P9oAjjX7BXkFzvvyS0rPDQU9cHHdNiilloIgNMvaouU?=
 =?us-ascii?Q?GMMRydm5JpzQmQ5atssXhY15lEujzREFPF5mZ6grlh5dLe1YYPZOopKr4YaP?=
 =?us-ascii?Q?gnp7xc5PEM2Vpv7Qh47jOIwC/XwgTNl41spfg06vIn9SoY02/rl34huTxBtV?=
 =?us-ascii?Q?Q3W8t7Zir+btjUKuTK9HcwMDsqZFnF/h1LQVIjyaeWalSuDtN5ggQ/n0tTgL?=
 =?us-ascii?Q?ZlVLpD/oeVkRYLhKqJOiq5wIm0rppONJe83p3j7ycqG9cxcPZLRV6cY1Q/oG?=
 =?us-ascii?Q?MqZHYmPCe3umnOAYS3dGvJe15y6oGRgDocFhQCRwWu6c9nhAYpku6t6rDh+f?=
 =?us-ascii?Q?ivnrXPbbo3nWeamd3JH8GgLCI0IB3VoICC89Y6KudqsBuYc5eudTirdrtvka?=
 =?us-ascii?Q?uJgmuTaInNJyBaSeaMDiQdm4BIFd1NvHAbKLoEVdKzIq44xJV0TGq2JgN+xd?=
 =?us-ascii?Q?DJvMY6JoZpggVn88zVoprl/t2Cr8Ibj4RoTX1MJsZxS8CgFpGjlKtZ9bXbV9?=
 =?us-ascii?Q?i0QmXFyTzvW4nGO4at62HUNkshPx2ohkSHWpboK79TlBOd9qBE9h/PQ+stOG?=
 =?us-ascii?Q?sO6vchiVWvThwmwm9X5QPkbTTI0TKx9S1V+QeOlTzIyWa59y+uh4gZYMBLBB?=
 =?us-ascii?Q?5kwQjgVWNBOHiVVdL4ty0p/AwYnBouR55Ywm/Qe+XUk3WKTaf/6qT5SiOcu4?=
 =?us-ascii?Q?mqgKp8k5b4rh3HpQI58TWg/729tZC4N+BCjvDVAa4Q346++Lh/yU0ikDRMVo?=
 =?us-ascii?Q?OWBy5jWGhZbxJSkpUrqTVj4=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b375ff68-d3bb-490d-6f51-08d9c9d50529
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2021 07:38:20.3296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 OOnsxpyiwuRwuxNqXiSxTKB509qAlQ5uWfbsvmNcfUf4ohWa7icb8u48AjNddh25AWrNCiheEr9rO7s9Y7Ylbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4539
X-Proofpoint-GUID: dn22zgE7wP9kH5ZmAQtNAdozEM-5TNQV
X-Proofpoint-ORIG-GUID: Yl0xD1miUmFf-6e64BQG7-oR4B700F3L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-28_04,2021-12-24_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 malwarescore=0 mlxscore=0 impostorscore=0 suspectscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112280033
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Dec 2021 07:38:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94528

Refresh patches:
  do-not-import-target-module-while-cross-compile.patch
  options-1.5.4.patch
  avoid-openldap-unless-wanted.patch
  libldb-fix-musl-libc-conflict-type-error.patch

Drop patches:
  0001-waf-add-support-of-cross_compile.patch
  libldb-fix-musl-libc-unkown-type-error.patch

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...t-target-module-while-cross-compile.patch} | 12 ++--
 ...001-waf-add-support-of-cross_compile.patch | 62 -------------------
 ...-Add-configure-options-for-packages.patch} | 38 ++++++------
 ...> 0003-avoid-openldap-unless-wanted.patch} | 13 +++-
 ...bldb-fix-musl-libc-unkown-type-error.patch | 31 ----------
 .../{libldb_1.5.8.bb => libldb_2.3.0.bb}      | 12 ++--
 6 files changed, 43 insertions(+), 125 deletions(-)
 rename meta-networking/recipes-support/libldb/libldb/{do-not-import-target-module-while-cross-compile.patch => 0001-do-not-import-target-module-while-cross-compile.patch} (90%)
 delete mode 100644 meta-networking/recipes-support/libldb/libldb/0001-waf-add-support-of-cross_compile.patch
 rename meta-networking/recipes-support/libldb/libldb/{options-1.5.4.patch => 0002-ldb-Add-configure-options-for-packages.patch} (90%)
 rename meta-networking/recipes-support/libldb/libldb/{avoid-openldap-unless-wanted.patch => 0003-avoid-openldap-unless-wanted.patch} (68%)
 delete mode 100644 meta-networking/recipes-support/libldb/libldb/libldb-fix-musl-libc-unkown-type-error.patch
 rename meta-networking/recipes-support/libldb/{libldb_1.5.8.bb => libldb_2.3.0.bb} (85%)

diff --git a/meta-networking/recipes-support/libldb/libldb/do-not-import-target-module-while-cross-compile.patch b/meta-networking/recipes-support/libldb/libldb/0001-do-not-import-target-module-while-cross-compile.patch
similarity index 90%
rename from meta-networking/recipes-support/libldb/libldb/do-not-import-target-module-while-cross-compile.patch
rename to meta-networking/recipes-support/libldb/libldb/0001-do-not-import-target-module-while-cross-compile.patch
index 3f2921ed3..74f8d8ad0 100644
--- a/meta-networking/recipes-support/libldb/libldb/do-not-import-target-module-while-cross-compile.patch
+++ b/meta-networking/recipes-support/libldb/libldb/0001-do-not-import-target-module-while-cross-compile.patch
@@ -1,4 +1,4 @@
-From cc0576405803bcae45ee353c4333c449cead9207 Mon Sep 17 00:00:00 2001
+From 00500909ebb0f51dd3b4e90c665f07158e7fe255 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Tue, 25 Jun 2019 14:25:08 +0800
 Subject: [PATCH] do not import target module while cross compile
@@ -10,12 +10,16 @@ Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
 
 update to version 4.10.5, and switch to python3
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
 ---
  buildtools/wafsamba/samba_bundled.py | 27 +++++++++++++++++++--------
- 1 file changed, 18 insertions(+), 8 deletions(-)
+ 1 file changed, 19 insertions(+), 8 deletions(-)
 
 diff --git a/buildtools/wafsamba/samba_bundled.py b/buildtools/wafsamba/samba_bundled.py
-index 60ce7da..5468a36 100644
+index 5f080dd..cdc115e 100644
 --- a/buildtools/wafsamba/samba_bundled.py
 +++ b/buildtools/wafsamba/samba_bundled.py
 @@ -4,6 +4,7 @@ import sys
@@ -63,5 +67,5 @@ index 60ce7da..5468a36 100644
          Logs.error('ERROR: Python module %s of version %s not found, and bundling disabled' % (libname, minversion))
          sys.exit(1)
 -- 
-2.7.4
+2.17.1
 
diff --git a/meta-networking/recipes-support/libldb/libldb/0001-waf-add-support-of-cross_compile.patch b/meta-networking/recipes-support/libldb/libldb/0001-waf-add-support-of-cross_compile.patch
deleted file mode 100644
index 45c5acabb..000000000
--- a/meta-networking/recipes-support/libldb/libldb/0001-waf-add-support-of-cross_compile.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 4b8463ff43f8983a706b181c5292491f9f954be1 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Fri, 25 Jan 2019 15:00:59 +0800
-Subject: [PATCH] waf: add support of cross_compile
-
-After upgrade, waf build system also upgraded.
-
-on 1.5.19, for cross_compile, subprocess.Popen is set to be
-samba_cross.cross_Popen, which will not execute testprog on
-host, but only read result from cross-answers.txt which is
-passed by option --cross-answer
-
-part of old code:
-    args = Utils.to_list(kw.get('exec_args', []))
-    proc = Utils.pproc.Popen([lastprog] + args, stdout=Utils.pproc.PIPE, stderr=Utils.pproc.PIPE)
-
-but on new version, exec_args is not used and cause do_configure
-failed with Exec format error
-
-fixed by append cross anser related args to cmd
-
-Upstream-Status: Submitted [https://gitlab.com/samba-team/samba/merge_requests/211]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- third_party/waf/waflib/Tools/c_config.py | 11 ++++++-----
- 1 file changed, 6 insertions(+), 5 deletions(-)
-
-diff --git a/third_party/waf/waflib/Tools/c_config.py b/third_party/waf/waflib/Tools/c_config.py
-index 7608215..767cf33 100644
---- a/third_party/waf/waflib/Tools/c_config.py
-+++ b/third_party/waf/waflib/Tools/c_config.py
-@@ -660,20 +660,21 @@ class test_exec(Task.Task):
- 	"""
- 	color = 'PINK'
- 	def run(self):
-+		args = self.generator.bld.kw.get('exec_args', [])
- 		if getattr(self.generator, 'rpath', None):
- 			if getattr(self.generator, 'define_ret', False):
--				self.generator.bld.retval = self.generator.bld.cmd_and_log([self.inputs[0].abspath()])
--			else:
--				self.generator.bld.retval = self.generator.bld.exec_command([self.inputs[0].abspath()])
-+				self.generator.bld.retval = self.generator.bld.cmd_and_log([self.inputs[0].abspath()] + args)
-+			else: 
-+				self.generator.bld.retval = self.generator.bld.exec_command([self.inputs[0].abspath()] + args)
- 		else:
- 			env = self.env.env or {}
- 			env.update(dict(os.environ))
- 			for var in ('LD_LIBRARY_PATH', 'DYLD_LIBRARY_PATH', 'PATH'):
- 				env[var] = self.inputs[0].parent.abspath() + os.path.pathsep + env.get(var, '')
- 			if getattr(self.generator, 'define_ret', False):
--				self.generator.bld.retval = self.generator.bld.cmd_and_log([self.inputs[0].abspath()], env=env)
-+				self.generator.bld.retval = self.generator.bld.cmd_and_log([self.inputs[0].abspath()] + args, env=env)
- 			else:
--				self.generator.bld.retval = self.generator.bld.exec_command([self.inputs[0].abspath()], env=env)
-+				self.generator.bld.retval = self.generator.bld.exec_command([self.inputs[0].abspath()] + args, env=env)
- 
- @feature('test_exec')
- @after_method('apply_link')
--- 
-2.7.4
-
diff --git a/meta-networking/recipes-support/libldb/libldb/options-1.5.4.patch b/meta-networking/recipes-support/libldb/libldb/0002-ldb-Add-configure-options-for-packages.patch
similarity index 90%
rename from meta-networking/recipes-support/libldb/libldb/options-1.5.4.patch
rename to meta-networking/recipes-support/libldb/libldb/0002-ldb-Add-configure-options-for-packages.patch
index bffd0653b..a55d46bf7 100644
--- a/meta-networking/recipes-support/libldb/libldb/options-1.5.4.patch
+++ b/meta-networking/recipes-support/libldb/libldb/0002-ldb-Add-configure-options-for-packages.patch
@@ -1,4 +1,4 @@
-From 0841c3ed69c388251c1aeae63f2c3813555a54f6 Mon Sep 17 00:00:00 2001
+From 100d16aaa6fe9a28a5ba77b2de2bde81a3fa3dac Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Mon, 1 Jul 2019 16:14:16 +0800
 Subject: [PATCH] ldb: Add configure options for packages
@@ -17,20 +17,22 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
 
 upgrade to version 1.5.4
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+Rebase to 2.3.0
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
 ---
- lib/replace/wscript | 92 +++++++++++++++++++++++++++++++++++++++++------------
- wscript             |  8 +++++
- 2 files changed, 79 insertions(+), 21 deletions(-)
+ lib/replace/wscript | 90 +++++++++++++++++++++++++++++++++++----------
+ wscript             |  8 ++++
+ 2 files changed, 78 insertions(+), 20 deletions(-)
 
 diff --git a/lib/replace/wscript b/lib/replace/wscript
-index a7fd25d..ad26041 100644
+index 2c856b6..36b696d 100644
 --- a/lib/replace/wscript
 +++ b/lib/replace/wscript
-@@ -24,6 +24,41 @@ def options(opt):
-     opt.BUILTIN_DEFAULT('NONE')
+@@ -25,6 +25,41 @@ def options(opt):
      opt.PRIVATE_EXTENSION_DEFAULT('')
      opt.RECURSE('buildtools/wafsamba')
-+    
+ 
 +    opt.add_option('--with-acl',
 +                   help=("Enable use of acl"),
 +                   action="store_true", dest='enable_acl')
@@ -65,10 +67,11 @@ index a7fd25d..ad26041 100644
 +    opt.add_option('--without-libcap',
 +                   help=("Disable use of libcap"),
 +                   action="store_false", dest='enable_libcap', default=False)
- 
++
  @Utils.run_once
  def configure(conf):
-@@ -34,12 +69,25 @@ def configure(conf):
+     conf.RECURSE('buildtools/wafsamba')
+@@ -35,12 +70,25 @@ def configure(conf):
      conf.DEFINE('HAVE_LIBREPLACE', 1)
      conf.DEFINE('LIBREPLACE_NETWORK_CHECKS', 1)
  
@@ -77,10 +80,9 @@ index a7fd25d..ad26041 100644
 +    conf.CHECK_HEADERS('linux/types.h crypt.h locale.h compat.h')
 +    conf.CHECK_HEADERS('compat.h ctype.h dustat.h')
      conf.CHECK_HEADERS('fcntl.h fnmatch.h glob.h history.h krb5.h langinfo.h')
--    conf.CHECK_HEADERS('libaio.h locale.h ndir.h pwd.h')
+     conf.CHECK_HEADERS('locale.h ndir.h pwd.h')
 -    conf.CHECK_HEADERS('shadow.h sys/acl.h')
 -    conf.CHECK_HEADERS('sys/attributes.h attr/attributes.h sys/capability.h sys/dir.h sys/epoll.h')
-+    conf.CHECK_HEADERS('locale.h ndir.h pwd.h')
 +    conf.CHECK_HEADERS('shadow.h')
 +    conf.CHECK_HEADERS('sys/attributes.h sys/dir.h sys/epoll.h')
 +
@@ -97,9 +99,9 @@ index a7fd25d..ad26041 100644
 +        conf.CHECK_HEADERS('sys/capability.h')
 +
      conf.CHECK_HEADERS('port.h')
-     conf.CHECK_HEADERS('sys/fcntl.h sys/filio.h sys/filsys.h sys/fs/s5param.h sys/fs/vx/quota.h')
+     conf.CHECK_HEADERS('sys/fcntl.h sys/filio.h sys/filsys.h sys/fs/s5param.h')
      conf.CHECK_HEADERS('sys/id.h sys/ioctl.h sys/ipc.h sys/mman.h sys/mode.h sys/ndir.h sys/priv.h')
-@@ -110,8 +158,9 @@ def configure(conf):
+@@ -121,8 +169,9 @@ def configure(conf):
      conf.CHECK_HEADERS('sys/fileio.h sys/filesys.h sys/dustat.h sys/sysmacros.h')
      conf.CHECK_HEADERS('xfs/libxfs.h netgroup.h')
  
@@ -111,7 +113,7 @@ index a7fd25d..ad26041 100644
      conf.CHECK_HEADERS('nss_common.h nsswitch.h ns_api.h')
      conf.CHECK_HEADERS('sys/extattr.h sys/ea.h sys/proplist.h sys/cdefs.h')
      conf.CHECK_HEADERS('utmp.h utmpx.h lastlog.h')
-@@ -380,20 +429,21 @@ def configure(conf):
+@@ -418,20 +467,21 @@ def configure(conf):
  
      strlcpy_in_bsd = False
  
@@ -148,10 +150,10 @@ index a7fd25d..ad26041 100644
      conf.CHECK_CODE('''
                  struct ucred cred;
 diff --git a/wscript b/wscript
-index d3402a7..d4e0ce1 100644
+index bf6129b..722fdf6 100644
 --- a/wscript
 +++ b/wscript
-@@ -38,6 +38,14 @@ def options(opt):
+@@ -39,6 +39,14 @@ def options(opt):
                     help='disable new LMDB backend for LDB',
                     action='store_true', dest='without_ldb_lmdb', default=False)
  
@@ -167,5 +169,5 @@ index d3402a7..d4e0ce1 100644
  def configure(conf):
      conf.RECURSE('lib/tdb')
 -- 
-2.7.4
+2.17.1
 
diff --git a/meta-networking/recipes-support/libldb/libldb/avoid-openldap-unless-wanted.patch b/meta-networking/recipes-support/libldb/libldb/0003-avoid-openldap-unless-wanted.patch
similarity index 68%
rename from meta-networking/recipes-support/libldb/libldb/avoid-openldap-unless-wanted.patch
rename to meta-networking/recipes-support/libldb/libldb/0003-avoid-openldap-unless-wanted.patch
index b30afeee2..dd1246538 100644
--- a/meta-networking/recipes-support/libldb/libldb/avoid-openldap-unless-wanted.patch
+++ b/meta-networking/recipes-support/libldb/libldb/0003-avoid-openldap-unless-wanted.patch
@@ -1,16 +1,20 @@
-From 63570b98ef63c91d8508478fcbe6b89c90c8398f Mon Sep 17 00:00:00 2001
+From 1f24231095a59debcf25d0e3309dc5d1056a7fad Mon Sep 17 00:00:00 2001
 From: Jens Rehsack <rehsack@gmail.com>
 Date: Thu, 19 Nov 2015 20:45:56 +0100
+Subject: [PATCH] avoid openldap unless wanted
 
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
 ---
  wscript | 4 +---
  1 file changed, 1 insertion(+), 3 deletions(-)
 
 diff --git a/wscript b/wscript
-index e7c05d2..1633593 100644
+index 722fdf6..22700d5 100644
 --- a/wscript
 +++ b/wscript
-@@ -161,9 +161,7 @@ def configure(conf):
+@@ -153,9 +153,7 @@ def configure(conf):
      if conf.env.standalone_ldb:
          conf.CHECK_XSLTPROC_MANPAGES()
  
@@ -21,3 +25,6 @@ index e7c05d2..1633593 100644
  
          # we don't want any libraries or modules to rely on runtime
          # resolution of symbols
+-- 
+2.17.1
+
diff --git a/meta-networking/recipes-support/libldb/libldb/libldb-fix-musl-libc-unkown-type-error.patch b/meta-networking/recipes-support/libldb/libldb/libldb-fix-musl-libc-unkown-type-error.patch
deleted file mode 100644
index c0e7e8907..000000000
--- a/meta-networking/recipes-support/libldb/libldb/libldb-fix-musl-libc-unkown-type-error.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From d90534469c5c43bf2a97e5698a5ddb4b7471f92a Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Tue, 24 Jul 2018 10:53:16 +0800
-Subject: [PATCH] libldb: fix musl libc unkoown type error
-
-tevent.h:1440:8: error: unknown type name 'pid_t'; did you mean 'div_t'?
-        pid_t *pid,
-         ^~~~~
-         div_t
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- lib/tevent/tevent.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/lib/tevent/tevent.h b/lib/tevent/tevent.h
-index aa6fe0d..2572696 100644
---- a/lib/tevent/tevent.h
-+++ b/lib/tevent/tevent.h
-@@ -32,6 +32,8 @@
- #include <talloc.h>
- #include <sys/time.h>
- #include <stdbool.h>
-+#include <sys/stat.h>
-+#include <sys/types.h>
- 
- struct tevent_context;
- struct tevent_ops;
--- 
-2.7.4
-
diff --git a/meta-networking/recipes-support/libldb/libldb_1.5.8.bb b/meta-networking/recipes-support/libldb/libldb_2.3.0.bb
similarity index 85%
rename from meta-networking/recipes-support/libldb/libldb_1.5.8.bb
rename to meta-networking/recipes-support/libldb/libldb_2.3.0.bb
index 199db797a..3731c260b 100644
--- a/meta-networking/recipes-support/libldb/libldb_1.5.8.bb
+++ b/meta-networking/recipes-support/libldb/libldb_2.3.0.bb
@@ -7,11 +7,9 @@ DEPENDS += "libtdb libtalloc libtevent popt"
 RDEPENDS_pyldb += "python3"
 
 SRC_URI = "http://samba.org/ftp/ldb/ldb-${PV}.tar.gz \
-           file://do-not-import-target-module-while-cross-compile.patch \
-           file://libldb-fix-musl-libc-unkown-type-error.patch \
+           file://0001-do-not-import-target-module-while-cross-compile.patch \
+           file://0002-ldb-Add-configure-options-for-packages.patch \
            file://libldb-fix-musl-libc-conflict-type-error.patch \
-           file://0001-waf-add-support-of-cross_compile.patch \
-           file://options-1.5.4.patch \ 
           "
 
 PACKAGECONFIG ??= "\
@@ -27,14 +25,14 @@ PACKAGECONFIG[libcap] = "--with-libcap,--without-libcap,libcap"
 PACKAGECONFIG[valgrind] = "--with-valgrind,--without-valgrind,valgrind"
 PACKAGECONFIG[lmdb] = ",--without-ldb-lmdb,lmdb,"
 
-SRC_URI += "${@bb.utils.contains('PACKAGECONFIG', 'ldap', '', 'file://avoid-openldap-unless-wanted.patch', d)}"
+SRC_URI += "${@bb.utils.contains('PACKAGECONFIG', 'ldap', '', 'file://0003-avoid-openldap-unless-wanted.patch', d)}"
 
 LIC_FILES_CHKSUM = "file://pyldb.h;endline=24;md5=dfbd238cecad76957f7f860fbe9adade \
                     file://man/ldb.3.xml;beginline=261;endline=262;md5=137f9fd61040c1505d1aa1019663fd08 \
                     file://tools/ldbdump.c;endline=19;md5=a7d4fc5d1f75676b49df491575a86a42"
 
-SRC_URI[md5sum] = "d9b4bea8b48cd4c4d0c492e65881164b"
-SRC_URI[sha256sum] = "ddf7f770643e0a0dda60f2818913f883caeed37fa1e8d6eda0dfe9588c1e3a83"
+SRC_URI[md5sum] = "fe4b1f17f77e2ea52b4e1320d927844c"
+SRC_URI[sha256sum] = "a4d308b3d0922ef01f3661a69ebc373e772374defa76cf0979ad21b21f91922d"
 
 inherit waf-samba
 
-- 
2.25.1


