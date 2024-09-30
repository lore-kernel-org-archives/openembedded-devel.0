Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8892ECF6491
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 05:02:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.47483.1727672571900160610
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Sep 2024 22:02:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0003229e10=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48U4qlMA016965
	for <openembedded-devel@lists.openembedded.org>; Sun, 29 Sep 2024 22:02:51 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41xd33skp4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 29 Sep 2024 22:02:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UL9+hzKtn1tOWh87IWoBxXzhZcLIpL4lyQfUc1uDNmqdzpJevC++v57cLwfxLFHm+O7AitX/zxPz19SWM9NL6OgEHVq5CfKpAHWbJ4a13REmFDybGZHTnqhNBisES8irWF9FnqSnpORrynARia2sJeeMLcxUGw8yXuJg+TRDX8puVwB4VodcbvMyiBZFemo92wq07U9Jrfs0gRBpMi+mE89199PvYPpAJRNyD1dvCkXt8VGwv0cE41ZfwnXmEGHDjS01FB8x5geH9KQIp0xEAipnI2IpEBIL6H+HCHLonYz+dNMWnDtQrAgH0RyCeMfNxX0zKokhkS8L++Zxh9HA6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GnLM6XPJaYKBjzc2ZtYKiXYdX+uuW7vf38pCwEUX5+E=;
 b=dTcA30kbk9WlFi1gTk8bbZb8nBHKkVZ1TxkWOEnZ288KJYjQImxl+mvlUbZlA7upOP1Pe2F6zYioMggH3Agoo/yF78x4Jt/46XWiFc4Rbogi1RDXs5G/xK+YbNJQYcLKyYGCcnoCFPmAjs9bVQtRplNp7ele7bqtkskAmtGLrdzWK03Xr69QMdKTuh0cxD2R/oCnJithNgEEusJqOyFp1B+llHmh4mxn20q4D9tqvCP2+USRqtSBnWvXY6FqRU5OzJ67AUOmYvaVzVgz0gKGvBPG1q9SIQgI26Tgbfv/0PpY4DjqV2CucJwuRvMfYpA1hrg/4I221FQBZec3fuumww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 CY5PR11MB6509.namprd11.prod.outlook.com (2603:10b6:930:43::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8005.26; Mon, 30 Sep 2024 05:02:48 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 05:02:47 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] pahole: upgrade 1.25 -> 1.27
Date: Mon, 30 Sep 2024 13:02:32 +0800
Message-Id: <20240930050232.1702649-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYBP286CA0023.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::35) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|CY5PR11MB6509:EE_
X-MS-Office365-Filtering-Correlation-Id: defc5084-b1ed-4ce6-a6b3-08dce10d204f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?+y/itw4lfX5G0Ue5LRj7OvH7Y0Qm3BXW5HEi8pd2/Mi5lfuPxIc4yARpwEEZ?=
 =?us-ascii?Q?+1lcwR1vGtVpGyKufJ5+XSMyow7bceGTmU8PMGgwRVXJ951iRGd/On3y2RUV?=
 =?us-ascii?Q?8PeGoUvDhuJVTdxehcSPmm/vzgHRphVnZpaWgW93LsrtG0XmI9XAfb1JdRkp?=
 =?us-ascii?Q?I9gW6AbQUrEquvak2U6aiDakRTO2SCZz2EXrGR2m8b/6ZAySMyGskQwXTyNu?=
 =?us-ascii?Q?J0uKapCvJPTGwdUGwQSiVYFOX26mjoWeWKBHqPznL0XHA7/pEVDFJQGwoxjh?=
 =?us-ascii?Q?7F/Y7uuBEBqBf3wJMIBqIH+/zLHNaOI/WyvLtrWjPXke92JAYM9iEXLe3qhT?=
 =?us-ascii?Q?HX0MlE6kctW3ldo/TZNdB54Z+sDkQOtZOz9RT522Lr/EyDFs1xKt7IjmmXxX?=
 =?us-ascii?Q?f/rqyDlUwM2e/HlrbEKqDtGCuK2sVjtdKL6e0ygCdJi2tBj/fzCIdclsSm/Z?=
 =?us-ascii?Q?9nl5vPFtO1iEioxsgP2HGN59JrKgW0PG6b3DzqVqE0UDFCVs0PPNFNpjB40q?=
 =?us-ascii?Q?+bJIlNzUcxpMsTKir5Mo79WEGYj+W3ST2KQey9NEtTTT6wrBFNU/0Go55VSu?=
 =?us-ascii?Q?Lkm3KUAz/X6f1GTHyV5FPYG1u3A+lNepdZx8J/Updjla2a9h5sQYWT+eJPhG?=
 =?us-ascii?Q?QQ8W8OIIuujERjtDYDXQu57919MoS7NF8S2C4FISQQXuII5iCIJ7mi3olEoU?=
 =?us-ascii?Q?pw/W0ih+z8JG6JZQ19J3+Uo/2N2eGeLeQyAN5QUtS0G0iROlwwTbmiTyK/5G?=
 =?us-ascii?Q?RJ3ivsjx2wF/EPo+X6NwXS/ttg1wPicLozRUqlghkMdupqi59NsKwq5m3UGx?=
 =?us-ascii?Q?5294IQ76T9e8Kgn9KyTXr/mSlYOxpytshKwz6+DKe4cXX+MvO/V5aMf4P4jA?=
 =?us-ascii?Q?JCZdJeaeYlUDb8WPFvtyMs5M3/AHsMU8hyKPGnQOLGxyR968IWQRo8D7Fpib?=
 =?us-ascii?Q?o2wWnhT7waKmDyYclWxi+TYy5eMO/O7KnCiU0hupJyEBXzPc9uKjBHoClr+L?=
 =?us-ascii?Q?cM2GxvaLyoz/PQsusdbbVx/33tOc1s97a78/W7srKqe+cLPP1CmMumiAJKZt?=
 =?us-ascii?Q?h4knA6Dfze5KzewMleKdFmtkYkpCVx4EzoQRMj/tm8hMvwj/O9l5pW5bClph?=
 =?us-ascii?Q?Jc6KBW3aRDryTG88D5ew6lbwijGF/N1PBQ3UnoxNAu2JCzowbW85exK45Mhi?=
 =?us-ascii?Q?ErWIcY+QnuMLGQwejb6HW9tuPrc05/ZDV7Yo9GnEfU4/V8EmwUC4B/wm35y/?=
 =?us-ascii?Q?CHpbZfoaDnoakkA4Mevxr+PVx/I5uKngij2+xqE4Z7JpJOIjOcSNlJ9a5ndq?=
 =?us-ascii?Q?myRjJinihgWOyiKDss2DrBe6mnjMU91BE4B23O0HAZ5yjQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ux67roImKowqffGCO2BDqAoiA2XA7/dkOkZy8FelF0k9aw3Jjc/dsRkDgIiX?=
 =?us-ascii?Q?YZSR2kYxmk4yS04YxD4iLOwDAkT+avloODb52mS89TN8zmNPF8kwWwgbaPsP?=
 =?us-ascii?Q?RxXNXw//XEIlTegXqKQMWnrAC6+nmFyNFFXspwFbQlXa+aqa/bkr7Hb0PFTc?=
 =?us-ascii?Q?ABu2YXkr9SDGtxO4r+bWPKfCW78Hs32vlADB4Wsr9xQ0Ws02qXklxv5HVxbQ?=
 =?us-ascii?Q?z4Tv9qSFUX/SF1qgBHQ4/2UlzQev4VM0Tv4B4Z6b57qaebmpCBP0AVwWwKu8?=
 =?us-ascii?Q?ocim3TPAav3pXYIAuonnai6g8TQ3V/iYDzyjFGqFRMYuU63wqs0UdtzVTANv?=
 =?us-ascii?Q?WSg0Hs77c+/nNqAl3eqeg2Qlb6w+exfbQzExXqBIONsV4wurkj2iCVR+Nlqg?=
 =?us-ascii?Q?RXeX76ppX13YSCN9UxxtrQ16kEkWR/T7y3ENcjyTi00h52EB/THoAFr5h4qm?=
 =?us-ascii?Q?VaPk+/96TY+m0ZFxo9fH0/ce3JhrBLByPoXYfMiccART40c4DiWR9y/Ov+wT?=
 =?us-ascii?Q?s/GJsfhrvrmEvkORKN4FFidx2EYfzyBkazde+MUGz0ZV+xdCrQR/kQmF7Zrk?=
 =?us-ascii?Q?N57W4aXthLbaNPs3zAIqMvmYAHPwvs7qNElykG91qehXEklg8FgOgJEz25DW?=
 =?us-ascii?Q?kNsFlEE6NlUKTvE20y25uJevJdwtyg5EJgUqN3q7+kA9cqy7hEu1nX4yijs/?=
 =?us-ascii?Q?olU4l0aVzoG4n9BktEgtNnBB5GIYANVJAxwtCinYp5wbbDksqjOpdkGLoI05?=
 =?us-ascii?Q?CiKvqrLPkbjirN9B128OlMhf36W1yLACwkzKvh7t0mDrMJVT7IkQne+maV2T?=
 =?us-ascii?Q?4dEQQhFmT+bADro8DhZrEvGpp/m1rDXa0sC5Jm3H80hAfWXsks7Dz13aQ7b6?=
 =?us-ascii?Q?7wS9wD+1S9JWFc20BsMgLfZ0Ss+4JNxBcVA0eGSC3s95U+/Sm5b4yuzhqrTC?=
 =?us-ascii?Q?45K772LQpuo3zXBxFLrzC5QFXM1S+gO7RHLadBDo5RfUM57xHOQfm2o+Pfv9?=
 =?us-ascii?Q?bPizU9DFpvUu0oFmkArSBNLvA7T2ctzxkOtsZ+0NKV6kuCgcuzHSrSgpIuyb?=
 =?us-ascii?Q?dq9p0bKF2w079JTdtA6EiknDewXHf21vcziyuqM7DciHgWCWepkhnRFavbn0?=
 =?us-ascii?Q?vyoMMoR+zAHQ9XjFVCeCmtXMcsK4J4JH4+LyJgFfxef+LHHxZ16RF9KQt0jg?=
 =?us-ascii?Q?b15uPaiIAPK+8ZH53m7jkrque39AyRxJEgk22Ymw9tB2mK7+wIl77/woRBPr?=
 =?us-ascii?Q?SxJhMoBxqTOrya1byNEtVKQdi+urLZla4CqPa7x1k6zio7ai6KMZUzbJcfAf?=
 =?us-ascii?Q?nTIDHsasbN8vB8uBqYMu03KrVY0W5eLEMRM/5OqduVtv8HSbl8to4GxGfIyZ?=
 =?us-ascii?Q?J50GXi2c29bXdfdu9Cb96x4cnlQ6DNXTWDcnwPPw2yUjloab/EGokdqyT7hB?=
 =?us-ascii?Q?6uPSuIjf3Pi+VT1upVShIsF47DU0IBh8DAiVSioTCjPLoj4oAv4OYF+RXzj6?=
 =?us-ascii?Q?o/3rzhB5aZwO6UelxaxhZhCXguyLTAXitRcJrtPlH7AhrcHxfjBp/luS+/7g?=
 =?us-ascii?Q?3zmv2TS26Qfwy1FsVIPvR+dGr5dRh8LNSZ+IMNC0?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: defc5084-b1ed-4ce6-a6b3-08dce10d204f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 05:02:47.4455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SP8JfRU1aSOwhV+nL0aDXajFMKxMIIkaUQKu0s1ori/6VdcgNIHP1LK59i8h/4sBzymVz8JF5oqMez/xEZHQ5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6509
X-Authority-Analysis: v=2.4 cv=deDS3mXe c=1 sm=1 tr=0 ts=66fa30fb cx=c_pps a=gIIqiywzzXYl0XjYY6oQCA==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=VwQbUJbxAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=1P9CV7W3nvdAgWqK8eQA:9 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: dlgCbVgHTvmUfb__UUxiBhtdicFMBNsf
X-Proofpoint-ORIG-GUID: dlgCbVgHTvmUfb__UUxiBhtdicFMBNsf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-30_04,2024-09-27_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0 mlxscore=0
 bulkscore=0 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2408220000 definitions=main-2409300034
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 05:02:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112558

ChangeLog:
https://git.kernel.org/pub/scm/devel/pahole/pahole.git/tree/changes-v1.26?h=v1.27
https://git.kernel.org/pub/scm/devel/pahole/pahole.git/tree/changes-v1.27?h=v1.27

Add more architectures to COMPATIBLE_HOST, as libbpf is now allowed to
be built on more architectures[1].

[1] https://git.openembedded.org/meta-openembedded/commit/?id=bb8049afe96db57707afc259743e288bec456117

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...-usr-bin-env-python3-instead-of-just-usr-bin-pyth.patch} | 1 -
 .../pahole/{pahole_1.25.bb => pahole_1.27.bb}               | 6 +++---
 2 files changed, 3 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-devtools/pahole/files/{0002-Use-usr-bin-env-python3-instead-of-just-usr-bin-pyth.patch => 0001-Use-usr-bin-env-python3-instead-of-just-usr-bin-pyth.patch} (99%)
 rename meta-oe/recipes-devtools/pahole/{pahole_1.25.bb => pahole_1.27.bb} (81%)

diff --git a/meta-oe/recipes-devtools/pahole/files/0002-Use-usr-bin-env-python3-instead-of-just-usr-bin-pyth.patch b/meta-oe/recipes-devtools/pahole/files/0001-Use-usr-bin-env-python3-instead-of-just-usr-bin-pyth.patch
similarity index 99%
rename from meta-oe/recipes-devtools/pahole/files/0002-Use-usr-bin-env-python3-instead-of-just-usr-bin-pyth.patch
rename to meta-oe/recipes-devtools/pahole/files/0001-Use-usr-bin-env-python3-instead-of-just-usr-bin-pyth.patch
index 4f7dfd4cc..7dc18d7aa 100644
--- a/meta-oe/recipes-devtools/pahole/files/0002-Use-usr-bin-env-python3-instead-of-just-usr-bin-pyth.patch
+++ b/meta-oe/recipes-devtools/pahole/files/0001-Use-usr-bin-env-python3-instead-of-just-usr-bin-pyth.patch
@@ -4,7 +4,6 @@ Date: Wed, 15 Sep 2021 17:54:01 +0200
 Subject: [PATCH] Use /usr/bin/env python3 instead of just /usr/bin/python3
 
 Upstream-Status: Inappropriate [OE specific]
-
 ---
  ostra/ostra-cg        | 2 +-
  ostra/python/ostra.py | 2 +-
diff --git a/meta-oe/recipes-devtools/pahole/pahole_1.25.bb b/meta-oe/recipes-devtools/pahole/pahole_1.27.bb
similarity index 81%
rename from meta-oe/recipes-devtools/pahole/pahole_1.25.bb
rename to meta-oe/recipes-devtools/pahole/pahole_1.27.bb
index 1334c850e..902b0e61b 100644
--- a/meta-oe/recipes-devtools/pahole/pahole_1.25.bb
+++ b/meta-oe/recipes-devtools/pahole/pahole_1.27.bb
@@ -7,11 +7,11 @@ DEPENDS = "elfutils zlib libbpf"
 
 # Depends on MACHINE_ARCH libbpf
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-COMPATIBLE_HOST = "(x86_64|i.86|aarch64).*-linux"
+COMPATIBLE_HOST = "(x86_64|i.86|arm|aarch64|riscv64|powerpc|powerpc64|mips64).*-linux"
 
-SRCREV = "81558a5a996005df0d607dd33f74ec5b7bdb619d"
+SRCREV = "3e265dac5ec85b956c664464072196c37d2af4f3"
 SRC_URI = "git://git.kernel.org/pub/scm/devel/pahole/pahole.git;branch=master \
-           file://0002-Use-usr-bin-env-python3-instead-of-just-usr-bin-pyth.patch"
+           file://0001-Use-usr-bin-env-python3-instead-of-just-usr-bin-pyth.patch"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


