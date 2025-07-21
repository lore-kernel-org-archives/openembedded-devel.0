Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45CFCC83F1A
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 07:24:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.34917.1753082682379314613
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Jul 2025 00:24:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9297ef113c=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56L6t20b1250193
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Jul 2025 00:24:42 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2088.outbound.protection.outlook.com [40.107.243.88])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4806n0sffg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Jul 2025 00:24:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oq19FXfOyXo0udEJZZAGp3eF1+lq6Eg4p2QWcYdfV38xUPQuaZlwA6710UGSB56lLttHn5LvVGDi8+XGDh0js/YUDeWAzv70nSQobWJ0bbOZdpQH+8vP0XeoTfWrr94SLrwPdI3k6Qj+xuRzMadSX0AAjIOtimMK9aHz6PoH5LIOIe3VgRtwQn0CVx3IKQJSg9ey/mG1E+v+thcHT0FrDZEVnN+VMdS9bX5FqjzI1FgegK3WOEYm4rrMJjdFYdErNcA8b2DiMczf5AlglWC3mQ6vDg2so2sftHhkIX4Eseuuh0qvmKRujRliuisVVWM4PeS0rW+wfQTs0XHt7UczfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/V7xS9URoe7ivIdEPSdH8xROEncLgGTx5RuS+hyGqgo=;
 b=SfduzQwPfCqXDiz30yHqYBNtffR1+L7LtBSjZrPXg7Kgm5UX8TpAjEqHc236CB1vYUe04HOeWs7bqBkMDegt0oeFpqZxRoGcRxQEomgSu5DI5KGsxqMM6S6HeClxjw35nSFpk5yw79paX+FsDyHsL5sLy5y0gJ99T2kmzDvNrl9n6axUzToZUWGE6Lr8VA3GDoLtKwvFZeKMWqm+uEUBXVGGqN+x/+EyHZrC2X3QsGm2He11JPtTt4hbsCid2FKMca5VPj48cAUyJgVWoccWbhaiDfs4iJkFkbZQnHmTW2js4rXAezj1M/H/gXxdlLJOQQ1ep1BRjV0MpP6y0SKRrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SN7PR11MB7466.namprd11.prod.outlook.com (2603:10b6:806:34c::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.37; Mon, 21 Jul 2025 07:24:39 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 07:24:38 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][walnascar][PATCH] valkey: upgrade 8.1.1 -> 8.1.3
Date: Mon, 21 Jul 2025 15:24:13 +0800
Message-Id: <20250721072413.2291668-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0109.KORP216.PROD.OUTLOOK.COM (2603:1096:101::6)
 To DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SN7PR11MB7466:EE_
X-MS-Office365-Filtering-Correlation-Id: acfc327c-b61d-4cee-78f0-08ddc827a707
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?bz2G12eZ5oSH3J3LVlIEKU1dTFtCmcFE57xfNVn4jsNH7E7+rJk9zr21ZjND?=
 =?us-ascii?Q?t8B0nJYgBlJLCwgRe1KaahhCaiZzuGTBQIgogvc2renyTzqVQjv36Kc724qv?=
 =?us-ascii?Q?2p8EJZJXPcMfbSsPHpoW7xC6FFJHYWg2ITzeTojPUwqcnfE5sFgLYtaSqo8n?=
 =?us-ascii?Q?jeX+1Hb1jGDeeZi8MijhokuEXjARkAw17gQSqnxsAkZO7BPohn/ScePt31fv?=
 =?us-ascii?Q?FX3wkXb3UDmcjJK4RPWvuLLxMdxwjE+ObJpV+maOydlhBeK6JTC2GD1B5hv0?=
 =?us-ascii?Q?FCUM1z9rp/CD3NHKKwl7yioX7kQ7QPjj6HG0Rl0FqoOgA5l4sX+n3heHXbDl?=
 =?us-ascii?Q?6ZOMMRFnrj3ZfcxVim8tfy6gue2BVx9b1/NYNCMUMU1UY0HHpqsSgwADrSXj?=
 =?us-ascii?Q?m4MKwBYpYeNL+baftvhhFtSkLsE1UUQgh07pffxjrT6QSPHbVanMvCmbSE/6?=
 =?us-ascii?Q?o3Mj21hjSEP62Cq3bBrSmpf4Q5O5N7ze/FUlUdbAjS53wPSQophdgdAVeq67?=
 =?us-ascii?Q?kB62MSfUaVngTOpem9pBXU2gaErzuKkDvDb7tu9UaqKLU+RibM2OaWZGtwSL?=
 =?us-ascii?Q?am1QynBjP7UpXl5E7XmgNEiVGdXoUt3pueM5aDa/nv9VKOSVAYIrLuelw7Lx?=
 =?us-ascii?Q?HLe3dpTzydR6/aSLIIDixoA1KWYG9fUR2cn7+ZHMlunshvytPphEzHtcCXfb?=
 =?us-ascii?Q?86441yXZD8Ogprwjr+EgyDspb2K3md0LQKForpJHv6zWU3y4AkklRNbJNcw8?=
 =?us-ascii?Q?i+5nY6YpPAv+S2Yo9lBFXgL83vCPbtTCFx7FRvJPdhSJBvWq4IVWXUNlyM97?=
 =?us-ascii?Q?VceeihZyMf4d5gghvNJlHEjZUQZC2reSu7ci7In+2CkfM/ZNhj0L2O2qzicu?=
 =?us-ascii?Q?WxRAHblVOaC4ZtbRkNvCVnEqHaS8MJ8xagSKFEqACXx2hXiDMgxfrIdgvnfk?=
 =?us-ascii?Q?yLGBmo3VywBPi70s9T3knJ+q8hDJ+udNXUlL0+8ZKNECjUrB1zmQsf21Oncp?=
 =?us-ascii?Q?Cq5ZVqA9ysIOnEd+YlQg0klINqJA98YS0CYr9BCkXbAuD7j02w+h3Nf4Ts7R?=
 =?us-ascii?Q?qzcySCk3bok3dTNvmfi2tfZGpV4nGVVQX5VEzgriWOlYkicw3HcjQLWckkJn?=
 =?us-ascii?Q?JkWKlvaMYTmKuHy5XjFgKpZ7hOc+RkbM3GcWxfdPYdE/UNSzlr+D157GT2sj?=
 =?us-ascii?Q?hOW56/su/olE4Xkb48HBNJhHtVe8rqlYBOiZ0fgIUUGt4mJryy6xTvANU1rO?=
 =?us-ascii?Q?2kYV1ZJpyDJmEAvRgju/Fitk/tzeZ+ax0xYPeDJgumE9SxMcQLTiBypG6FKb?=
 =?us-ascii?Q?KsQ4AKC0Pw0EdwZ0lZk+YDfaVc5cgR3HjIdqoY07qH/rmZCVBDs6/0MraeKv?=
 =?us-ascii?Q?N7fOuVLah5QMn5GmJOsye3SmSqzeXHQl3U4hIV6JvgMA5kQAd5RzpXhbxp3E?=
 =?us-ascii?Q?il9JvIavajVXi1xpWLPMpvDE0XeoX/TUrwaVD7n/E+Bk+VBT92KdofSQPrFv?=
 =?us-ascii?Q?aE5t52UeY37Bzxo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+oDm8PCNF/gEJmVX4iZyZOYZsVSg3uBAxs0XCTomA/ykGRapMJi9l4sTSHRF?=
 =?us-ascii?Q?Zlk7/Rxw0JyxfisQvHoDxzWakxaoY7MsgPvecbhtHQJonhMrtRC907SFkJcB?=
 =?us-ascii?Q?WIVAAsStrOOkI9mA7S+vsBbm3s9DmWmjZ7wmJONp3OVMn7kv5/zTKXN263Wy?=
 =?us-ascii?Q?XQgcKYRQyNS5Sp7BcHZKEFMifcotC7/CWKRnQQ3YxeUnBkHDj6d9ZWojlrHo?=
 =?us-ascii?Q?G5bmy3JHa0H+lg01xq5NGTQ45djxtvtAxSHWXpljlFvhJhHboWWcgcMKZhRM?=
 =?us-ascii?Q?VyYxNEcspHgxpKDSfG9Q3gqknaHufZAVhyL1/28BKGASN55Dp2CDtFMQ7bma?=
 =?us-ascii?Q?MYvTYsLK80+0SVLoVhPT7Q8Zr1jwqRvUvuLOGm7rxSEratu69mIWjD6+HG3Z?=
 =?us-ascii?Q?rKzPEI3YGs2cPhR7hImfyykOtJMk5dUOUXkSYL6LjSuivMHU8uWfsfRj7j8/?=
 =?us-ascii?Q?e/8wqod8W7nr4F7UlJsNzCQWVk2F7wex92aTetizK6eLusZlIq4CcQNTQeJH?=
 =?us-ascii?Q?gg98SYhh3Q/weD5yHRpd861axJXka7yKIe51geb/Iq462JNSihIJZdBLzPNd?=
 =?us-ascii?Q?Kb0eQuNRYudh8dNajhSkuwGsx5t/auxXfzKVhibX6bTUN7DcuL6U5ed/o+4O?=
 =?us-ascii?Q?kJB4KBAEiYLVGX17j41S+zB7hQ1SGxb8JoxqfxPNc8XqfssnmFAaJOZJqfYS?=
 =?us-ascii?Q?u9odXV6siHSKjjQngwZuvfDmDw1Ukw962CN7r9yFekGDlq1Kg+BRM/iNHgBB?=
 =?us-ascii?Q?qcT+R1Qn9z+4h5QOx9yaDRJ2ido3s5dlkB07sBz7u5+R3xzg3w0BDo/2z+PL?=
 =?us-ascii?Q?3qwMQlLSphDusjAPLNULQcfAxpJkVDxK9L7/04y3IlciMcROAV/1wc9lP7Fx?=
 =?us-ascii?Q?HcynMc9p6kA3yRyc4WfvXiXVfGX39TXgSOMPDMfHNjP/VumU+x0KTYG+lSWd?=
 =?us-ascii?Q?G6yEKQCP8or9mLfmCY0m32ewphNlpuNDG0Br8I5rOpnLI9WNSSGItbqo1jGQ?=
 =?us-ascii?Q?tC8p44NClqdxbvh1Fksw99ueS9hMdxKWM6TUjyTWqOChEk2+WIUrckIftX86?=
 =?us-ascii?Q?LxdELQ7hz3r5kHMhxSPj3F2pEpg1ne0C+g4GDkWcX9TKH+OtB45Qx/xWlrL9?=
 =?us-ascii?Q?ATl0qY1woeNQYD2aB16uFCkplmPwc/rZcPeJVmCyRPJTKSsIJ+IKLUxXH92s?=
 =?us-ascii?Q?fZcJyA+waB1dHqublOAF5bWQHkSq/fNe0LqOXlOg4RDD1F7Q6FkpbY9MBDmU?=
 =?us-ascii?Q?o3vmg/6Xq3+144gRdHGaKlSNxufj9RP0NeZzHzk8WeQUMs9Cd7wpNugOBY1K?=
 =?us-ascii?Q?601dV8NFXyzReXKHcsPyND9mJJnRbsRNNbS7uIu0DsrfJjOf7gxiZP7WRoX2?=
 =?us-ascii?Q?OQWSWcG/NDuhA1ygJwnOhJQG1SlkYcS23Fe2LiY+hpj2GbzWsZIfVfURgFLH?=
 =?us-ascii?Q?PGPaVTfbZ8+0WDkBus2CtSQFO17Ea8GihwjViL09HSy18SDHRNYGFTKrP/cx?=
 =?us-ascii?Q?6HTjdnjq58EQtP2xGWcXQe9ems7Zfkb22z+VUesCQpmHJJTNZgTJ9WPHGhmY?=
 =?us-ascii?Q?8W9M9US+KbOn3E1dCeNCBe1f1qLMx+hHEmRPU2QY?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acfc327c-b61d-4cee-78f0-08ddc827a707
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 07:24:38.9627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lqow1TkUJt0df/MZSlgt1z5igt0nPghCENRKHw/UtgQmQ6wUdE2rY7a/fM8CSOViu/IlE6TuMpwyAaBG7/LKKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7466
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE5MDA2OCBTYWx0ZWRfX7itkoJGqeDK2
 YYGZjK1UcCvHDoi0xKLnkbCgQN9+yK2AOk4hPCqPvaejZBM2YYLH505y795FE+UY6Yq7M64r7Hh
 BAKlzvNIXvSduJTP3pc724dF7IoHJROPlKAqM5Gtp2VIpdw/ITCZWfP/X6UTzSqFB5qTaw7EqGa
 zdIvSBZaowmdK/YCOl+iGC0RsFv0vW3s2nHJ/RksfG950R4aDpJumuGiF/jQAKcNP2we2yBj5uE
 2y2INj727GZX4WDnd/gqBQcw7nBB4Wzlano9/B2FktjIHyZ4QgsVVhw3RR6q+uPrnxmEbeowI/W
 4PB7RGbxeV2ESIQDqQqc2wyaxXFHsb2eS3iqsisbOGFlnev3QxDVHEtKWNY0MbUJQkg31Tx+H+a
 /+YBcOaU
X-Proofpoint-ORIG-GUID: 20kptS6zxlpsj5EQIcruWib43NKZ7t_q
X-Proofpoint-GUID: 20kptS6zxlpsj5EQIcruWib43NKZ7t_q
X-Authority-Analysis: v=2.4 cv=W4g4VQWk c=1 sm=1 tr=0 ts=687deb39 cx=c_pps
 a=syx2/ttNfA1aKFKOgUl8fw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=A1h8ctYM7AAxWu_-aYAA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_02,2025-07-21_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 clxscore=1015 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507190068
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Jul 2025 07:24:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118652

ChangeLog:
https://github.com/valkey-io/valkey/releases/tag/8.1.2
https://github.com/valkey-io/valkey/releases/tag/8.1.3

Security fixes:
CVE-2025-27151
CVE-2025-32023
CVE-2025-48367

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-extended/valkey/valkey/init-valkey-server     | 0
 .../valkey/{valkey_8.1.1.bb => valkey_8.1.3.bb}               | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 mode change 100755 => 100644 meta-oe/recipes-extended/valkey/valkey/init-valkey-server
 rename meta-oe/recipes-extended/valkey/{valkey_8.1.1.bb => valkey_8.1.3.bb} (96%)

diff --git a/meta-oe/recipes-extended/valkey/valkey/init-valkey-server b/meta-oe/recipes-extended/valkey/valkey/init-valkey-server
old mode 100755
new mode 100644
diff --git a/meta-oe/recipes-extended/valkey/valkey_8.1.1.bb b/meta-oe/recipes-extended/valkey/valkey_8.1.3.bb
similarity index 96%
rename from meta-oe/recipes-extended/valkey/valkey_8.1.1.bb
rename to meta-oe/recipes-extended/valkey/valkey_8.1.3.bb
index 1686e533af..b5de7ed7e2 100644
--- a/meta-oe/recipes-extended/valkey/valkey_8.1.1.bb
+++ b/meta-oe/recipes-extended/valkey/valkey_8.1.3.bb
@@ -17,7 +17,7 @@ SRC_URI = " \
 	file://0001-src-Do-not-reset-FINAL_LIBS.patch \
 	file://GNU_SOURCE-7.patch \
 "
-SRCREV = "fcd8bc3ee40f5d7841b7d5a8f3cd12252fec14e4"
+SRCREV = "d063dff523340e5a075f7ddc436e0c2a43d04061"
 
 S = "${WORKDIR}/git"
 
@@ -26,7 +26,7 @@ RPROVIDES:${PN} = "virtual-redis"
 inherit pkgconfig update-rc.d systemd useradd
 
 FINAL_LIBS:x86:toolchain-clang = "-latomic"
-FINAL_LIBS:riscv32:toolchain-clang = "-latomic"
+FINAL_LIBS:riscv32 = "-latomic"
 FINAL_LIBS:mips = "-latomic"
 FINAL_LIBS:arm = "-latomic"
 FINAL_LIBS:powerpc = "-latomic"
-- 
2.34.1


