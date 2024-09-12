Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 229FCEE642A
	for <webhook@archiver.kernel.org>; Thu, 12 Sep 2024 02:46:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.38552.1726109171909319755
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Sep 2024 19:46:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=998582a7bf=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48C00xV1015368
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Sep 2024 19:46:11 -0700
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41gj44da1w-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Sep 2024 19:46:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BtghvHnxjEvYkjxEiiRN9yXqMmxt+/4GP17iHiLTszPKdz8TOdYZqAw7t/H4ts6tjFp2pftOZ087ltw4Mr+b8fkp20wPFINoP1yKX5MZ6prIC3Xpsm5Qa/+bfEu7fE1efz/5Mg5ZSkiryJ1i04L1OoOri+e0+b1uyzzOvfMx25xx7s2I2TnEs5G8vkp9NyeKy0WKthOj+eZfkSevh7bePnzjyC+kB0ffMChprUaD+0QrmM3fc8rksbt9UwVH02N4ao+aUsle+VArIlnSMcTsjFiQRDr1aRmgt3YW5hAR9QplwchUGgyrdtfDpt4tbHcsH8tCKxZ9HrA6GiXGOrL89Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r4ILedcgqlWSYD2qZ6/yia8qa5DOGMKfaLJBYjadbYQ=;
 b=eIJrs7cA+ubjpdF/RMMjb+WMd4PbA/F6sS0eIEa89YTrkUGdw9XLx/7A3ibDW+YCKfxRATp6WYCNG3IYE0ypX7MrhopHzd7KASd2D49gyY8kcaLmfelWub2FafAsUHM159PzSxB1QGIcRC4+53FOMPOpU/XJ0YEvKmw/A8QPLEq2+NKGIXL79G82baSJb0bXQsHofhAo9W1e+F3/namoQeGbA35dXuBfE9oa6kVHVX0oHtFhZoEShdpjGcBKeR82cWFH12r20qSAjthdn9x5DrvkElWMmPAWRwCcvs1hNXIixeWgoTN/SJxkPK2qdiCSs0L4W1vSLaP2Ayj6TIADuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DM4PR11MB7303.namprd11.prod.outlook.com (2603:10b6:8:108::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7939.25; Thu, 12 Sep 2024 02:46:10 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.7962.017; Thu, 12 Sep 2024
 02:46:10 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 3/7] geoclue: upgrade 2.7.1 -> 2.7.2
Date: Thu, 12 Sep 2024 10:45:54 +0800
Message-Id: <20240912024558.3998529-3-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240912024558.3998529-1-yi.zhao@windriver.com>
References: <20240912024558.3998529-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0304.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::12) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DM4PR11MB7303:EE_
X-MS-Office365-Filtering-Correlation-Id: 980a327d-8f37-434c-800d-08dcd2d50ef7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?SnG07Ce3lXGNHbm2TN7LDf9toomhaPNeRaNbfuwApdMWYpbJuz69hZv23RZR?=
 =?us-ascii?Q?Sl2XbyUtKZPyV0DGccMjy6DF44vERBqbr2/XJeHiErXkCA8gmn77RBpxSCDK?=
 =?us-ascii?Q?y9a3mCper9oInWsBZPRU4kOUqQSWLti8Sh+AcYLa4dnZb58b62iXeWgriXlM?=
 =?us-ascii?Q?NfLktV7qxqjjMpmyQBvkvFuVk37FqriOakwpu9N3/9sOT8/6eFAyvdWAJIGf?=
 =?us-ascii?Q?7UxR3EYZFlTClMBoZ/hnJxxdjSfJYTwvp1FW++860u977thyjB29CquBfb61?=
 =?us-ascii?Q?WlNMqSwCt2WI8/Qk6t1PsVhut7qz8A5tCgAGGKEAZox3xj/Y3MthHQJiAJ8Z?=
 =?us-ascii?Q?iJPWxGA+AWz3eERrbv51xdQoKE09OoKOmEeTeP/jkJFSbSBOcJAQbL7fE5Jw?=
 =?us-ascii?Q?j8LXqnOcIEuYygLhU5ir0DfBcbaoot0UxUvUo+s912zMV72EONEKIT25Oj4e?=
 =?us-ascii?Q?BGvblr/FmmJPWkeCtJjB2dGMTksetLJp1FQ7fwyTK4jdIoZ/vzZ7X+P8amXE?=
 =?us-ascii?Q?nbE4osoaIchA33/y8kWESaVrN1L+Pyf3F81S73hPutybChJuv0fpZXzzp0Zw?=
 =?us-ascii?Q?TAg5zS6UmFnAfDp4pxB/mb1Ys4HxiqvQzeQaPxYQ6/wWUdNFYQ86cbb26lQE?=
 =?us-ascii?Q?LPxQw0TiuMyXUDNa6A5x4XJlmoz4Cbe0k0EM2zcrz9HQWT7XS0f/jWOO+k+P?=
 =?us-ascii?Q?BGOl/BlV3xn0oglUNYgOtzhCc4SefefFTpd2JuU4JLj9ayh8+JblYbxiAN/8?=
 =?us-ascii?Q?m5mnQVWffuayf2vtJrZ30GxAyeJ7EvB1p70oNSZ/N0E4umE776r0lv9e+m0h?=
 =?us-ascii?Q?A+BEsMzTLaoJDbOu6v4YMqVnQJaHO6d4RMJzEFMcqRKvpTUU1rfmtBkXc3qk?=
 =?us-ascii?Q?gzSeqUbUfTr2V/qQquxjfVas/TvFq3sHMsPYJRW7MOPXyKH8oiv6ZDZ/GV56?=
 =?us-ascii?Q?OqByS2IMjnrqx8kTOhCjBGJcvOsEWAoeKA6hPiWppkKX8lPWK8Ki49qJ55gR?=
 =?us-ascii?Q?arDq61GgAWGuqFlaj+ECMT7zlXoWagHDyAfGRhS8+7J2Eega0AkMgons32kC?=
 =?us-ascii?Q?8KoL3dJBrL1esgs1HhAQTLDv/lQgQLrU2chhPmK/grGCSd1fqaq0eChBJrHQ?=
 =?us-ascii?Q?ecxbePKaH2qz9t3D5t3rNIsq/Qf+J5E+DN0MsLCn2fchcMjqmTdqSn7/nMi1?=
 =?us-ascii?Q?mNhWpFs+MuKYdaetDuyyhSiaGNr/9GRrPl/gNdpspkyW8Vv1uz3LBIMwvF0P?=
 =?us-ascii?Q?4SVJGIDAt9jfxYcsihLJCxx1is8ZqU4OkcnLShM52gpL3BHcmW6FDABlx/d7?=
 =?us-ascii?Q?An4Dpt3t5x/slGzc6a5hQv9i2Yrkq2+ZcJRuRQztI7gMRw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?skN/KVmCQNII6Y0ywxpHpoOV0QqmTdNCv2y+hxnqJSkVEHiD7BwU/KBkMwLF?=
 =?us-ascii?Q?YkoGzcnY9MM85YjMAhiIdVkG/Mur1FGv6Bc2DSRPhCs5lNmMppz/mcqZagcY?=
 =?us-ascii?Q?1TMX2a0Qw4KhaRttfA6ixVOIOVHRjWe+OoL/6VI68RPF0xkJtsmXKG0kgp/B?=
 =?us-ascii?Q?rGp7dfA3kzGxdQLnsswEhPf6eblYwz0xG2AOwpIbMnNg0iqCOeNYWnj+3J9L?=
 =?us-ascii?Q?n2RO8Iadi+xrOs/0T30+v45i/3gEM/zSKD/R8v4lKSo7jRYeu+szOLBnZstv?=
 =?us-ascii?Q?fD2S7yf8klg+ROO48GR7tPFgh1d6jJh31g43xquSRgx+bnqmfCUuY9fGkKQ8?=
 =?us-ascii?Q?H+T02wBAyFi8pHST7xUdPPBy2KTGEEWtqsYMoJmi9KiUUR/nbKaiAyYkq+sT?=
 =?us-ascii?Q?tNydA6fMrrRCveCJlkh8iWujo46AJqfSKAr2jt+BvTqYJmZ1+a21DM8BGLjZ?=
 =?us-ascii?Q?J9ob3XYnhHAxBO667sCpsSYEA8h0mz/bopjNAsJo+HmE+9Ka2vsPTnK4UBlj?=
 =?us-ascii?Q?taneLMWW6hPqc3iKn/9HfruZ4vH4UDKa1muYXzVNNb6Fs86+GNeVrpRKyzUB?=
 =?us-ascii?Q?7W4KqSxdMJq8DXpu2alYlBzsBQ9TZzaBDZjgOXT/XWCNs16veBXkF5W+b3aK?=
 =?us-ascii?Q?PweywLfnq++OX5Yp5aFw4gYvwln8is15W9uTkksmsFNxs36IGR6+ZhpND75X?=
 =?us-ascii?Q?/GXeW9mGhB2bw/TSS+zJspCIjvpg/jPsvvr80P+GnXkgrXZlaP4STt7HNHYY?=
 =?us-ascii?Q?6P92aKmSyeCVfpi9NYeYA8xFFpSCS/W6Ez8D4PukPSvUAJ6Jw0+WqT4Dtypg?=
 =?us-ascii?Q?QLfaxsUwHpSgBVsJ6b8ODPTCmlFl+z5BAIpSZDiG6rT41yhFKolm3Ixo/kkn?=
 =?us-ascii?Q?6JlVFKvB1wjcZAq26gsU45KeArkMz/yGmtNv0vqpgCOWlOMk8PKZkXTN35C4?=
 =?us-ascii?Q?57L8KFYI8og8QN9iA1Q127MSJJTKWylRCZcfBlWX8DFANwtcKwiiG66CBu0v?=
 =?us-ascii?Q?1rFNS9UPOo7KFAF2zIX1bCePGF9J9N/WQBrqWwPl+Tt2VbaQDK9yPOEZS3a3?=
 =?us-ascii?Q?sTPfh7/t5rXePHevHQlfhV/lqrNfBUt5ijRl6iuhXSBvMw20XJCGZ1XiXJ1O?=
 =?us-ascii?Q?kCtQa0QnmDe7RXXEsSA0SPt3nXL6sEtgX9T7B/FYEpq/ISB2npawpHpy3uv6?=
 =?us-ascii?Q?nJX+nOhUh3LB6ZX+nWroUg+nrliOnMMqcHT8ek8mTZxn73BkO0IiQzrSc7TD?=
 =?us-ascii?Q?CDzHlrz9u0TO3X1Dwkz/6ScAiwnTUpMsC4CeqkFfTHGojBMB7tXa/PJdN0Le?=
 =?us-ascii?Q?1eFQX0x46gX+NngujQgSDwNW7KlKy7/6eTRHIl99yWXlrwkfjmyT7TmGTKo4?=
 =?us-ascii?Q?StKbtRgCrvsHHeG6wqAdVzZktJ02sksTGrWsjtX3/mh8YW4Rl16T5zkidjOG?=
 =?us-ascii?Q?iIrwDxY6xLuwluVAAaw5gnMwFs7rLJbiM/V7BPFCOGkYgNS+aFJbZahp1YWe?=
 =?us-ascii?Q?sihEjkanMlEQAhI2DcoGOVEqMyR7FAlIHGAFbW3mUgJdFZ3HztvLqhnbezv4?=
 =?us-ascii?Q?PWtWqHbcfkOusdO6/Y+Sgmsh5hQ8VSRgqVcVOMuM?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 980a327d-8f37-434c-800d-08dcd2d50ef7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 02:46:10.2334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 11+48Ga7KXEOk8dTRDMRHH02GhQpYthRy/don42XfeLbl+7zxAgj4rTHjxvApJHpAPbDTtvjdIn7TcN3YAybwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7303
X-Proofpoint-GUID: t7hxlfZ-vhgyoau_Ii2anZYOLtjYBJ1c
X-Authority-Analysis: v=2.4 cv=DZxFqetW c=1 sm=1 tr=0 ts=66e255f3 cx=c_pps a=6DIaztarb0XTwjBPIWoXxQ==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=e5mUnYsNAAAA:8 a=t7CeM3EgAAAA:8 a=iGHA9ds3AAAA:8
 a=pGLkceISAAAA:8 a=dMwT5sllLacJIGOFIaAA:9 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: t7hxlfZ-vhgyoau_Ii2anZYOLtjYBJ1c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-11_02,2024-09-09_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409120020
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Sep 2024 02:46:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112249

ChangeLog:
https://gitlab.freedesktop.org/geoclue/geoclue/-/releases/2.7.2

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...libgeoclue-don-t-try-to-use-g-ir-scanner-when-intros.patch | 4 ++--
 .../geoclue/{geoclue_2.7.1.bb => geoclue_2.7.2.bb}            | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-navigation/geoclue/{geoclue_2.7.1.bb => geoclue_2.7.2.bb} (97%)

diff --git a/meta-oe/recipes-navigation/geoclue/geoclue/0001-libgeoclue-don-t-try-to-use-g-ir-scanner-when-intros.patch b/meta-oe/recipes-navigation/geoclue/geoclue/0001-libgeoclue-don-t-try-to-use-g-ir-scanner-when-intros.patch
index 18e718564..d2c0e4df6 100644
--- a/meta-oe/recipes-navigation/geoclue/geoclue/0001-libgeoclue-don-t-try-to-use-g-ir-scanner-when-intros.patch
+++ b/meta-oe/recipes-navigation/geoclue/geoclue/0001-libgeoclue-don-t-try-to-use-g-ir-scanner-when-intros.patch
@@ -8,10 +8,10 @@ Subject: [PATCH] libgeoclue: don't try to use g-ir-scanner when introspection
   http://errors.yoctoproject.org/Errors/Details/702778/
   geoclue/2.7.0-r0/recipe-sysroot/usr/bin/g-ir-scanner-wrapper: line 5: g-ir-scanner: command not found
 
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
 Upstream-Status: Pending
 
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
  libgeoclue/meson.build | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-navigation/geoclue/geoclue_2.7.1.bb b/meta-oe/recipes-navigation/geoclue/geoclue_2.7.2.bb
similarity index 97%
rename from meta-oe/recipes-navigation/geoclue/geoclue_2.7.1.bb
rename to meta-oe/recipes-navigation/geoclue/geoclue_2.7.2.bb
index 5d247fb9c..db0142502 100644
--- a/meta-oe/recipes-navigation/geoclue/geoclue_2.7.1.bb
+++ b/meta-oe/recipes-navigation/geoclue/geoclue_2.7.2.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 dbus json-glib libsoup-3.0 intltool-native"
 
 inherit meson pkgconfig gtk-doc gobject-introspection vala
 
-SRCREV = "8a24f60969d4c235d9918796c38a6a9c42e10131"
+SRCREV = "ab0a7a447ac037d5043aa04df3030796bf47d94d"
 SRC_URI = "git://gitlab.freedesktop.org/geoclue/geoclue.git;protocol=https;branch=master \
     file://0001-libgeoclue-don-t-try-to-use-g-ir-scanner-when-intros.patch \
 "
-- 
2.25.1


