Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08060E77188
	for <webhook@archiver.kernel.org>; Thu, 26 Dec 2024 09:31:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.19399.1735205500233846203
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Dec 2024 01:31:40 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2090c61c71=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BQ9LV8v003828
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Dec 2024 01:31:40 -0800
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2044.outbound.protection.outlook.com [104.47.51.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43nsub43qb-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Dec 2024 01:31:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jcLaF3ZFTs7ct/bqZeGJ07jsGGxUUcdWDH7yh1CYoEU//rRESmqpDdihizhqF3ZP0lLV/mIT0GEFrAOgEkGV237kyJRgyyydPXJhnMyhNUIXrF0f0PD6/j870T42sLKdyYl5++uScTOKX6+/iDxJ0y2rdxZiULEScC4fDNFoHa41kzKuwnxHWpPxGI9s63w4DO5kqWOUOJbk0Hx75BfUC+k7QwdKbVan+rqsKjkhSMp2iZjhUVpP/HtHZ9FhKjYwd3gi4+dZGLzLHPI+5Gcqiuk6i9Y0fWHZcaDMW+Lt+CdN8t35Zx+27f0h3zpF1v2uNVjvJFnb8Vapuc8ktXsYFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AXVS6VJ5iigGY6zxe+6x9d6GQPVwGWSrbgF+iHpHw/Y=;
 b=LajFLTnij4CXr9iLtL5CJCCBqtMiEebLcPqipuiccP3H1pPHZ9xI/mQZE6d33TvofeFzqFWpK5NX6w+UIgws0lyz3izi471zR/qzH5GuZIRFeJUyddJc3qUt0BLPwl8Cgu56uFA7tO9CaTBNTYZS+HmdfMUL8Xmd/jeL16QZ53zI+BZ4GjSZFAOLr93+qhlxXl49FR8gScRy+/DhO4M/Jq/YbhdKMjlKoq+Vg8DGXhjyScFQSKjwGihTU6tGSVN1M4pipdVvWC6LIZZks9XCkmCMzAZE595/RPFBIA+f4K+lhXYnpeHp9wth8BPzCnXr5VrzfA564h3BNgtwfoSc5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 MW3PR11MB4668.namprd11.prod.outlook.com (2603:10b6:303:54::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8293.16; Thu, 26 Dec 2024 09:31:34 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%7]) with mapi id 15.20.8293.000; Thu, 26 Dec 2024
 09:31:34 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 3/3] strongswan: upgrade 5.9.14 -> 6.0.0
Date: Thu, 26 Dec 2024 17:31:16 +0800
Message-Id: <20241226093116.874361-3-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241226093116.874361-1-yi.zhao@windriver.com>
References: <20241226093116.874361-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0033.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::23) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|MW3PR11MB4668:EE_
X-MS-Office365-Filtering-Correlation-Id: 87c11150-638b-4cc3-623f-08dd2590166f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?IU3TTlwBmtP4iJ1CppdTxo6Zy7smNFn196ZvG5z1M34H0NnwmbxL5ALzjcyl?=
 =?us-ascii?Q?jUavpDsynSHWpUOWpaaafGoENVgeDr3TYv4rbwuUt0LHEAC2cJlfMPGET8Cw?=
 =?us-ascii?Q?bh51iaRhcsDBcfnyGE21n3YJCUWl5a63PgSu2HLqW1WQA3yPamYdDmjdUhQy?=
 =?us-ascii?Q?nGSCgMLSt4V55xqd7oqp3WuDxKuJNSD5muN5TG4D5v1PxfkSLYmobDuFIgb6?=
 =?us-ascii?Q?F6oGF+Gda9LYzdA22ihLSHNn4KMEUOHSdSDwzsQi1rau2R4I602kDHD0czPx?=
 =?us-ascii?Q?GKqdkjlMPkep/P2k1CtsykzbGzk7FI+ZHkEbcFJYXGeEaP+ZDKBdXpzhZcMo?=
 =?us-ascii?Q?Qw5UB0wAXn77z7evMXDIrqVlAG30h2DRmBtBeD549BDOtfHb8RTGTaspTh7J?=
 =?us-ascii?Q?9kOE0e87YNTgwNc8bM9u99YjOMCXHyOB39ixXoslfn0dkX9rWfuKfinvjR2n?=
 =?us-ascii?Q?DQCLDdNo1ywdwedI35MCSZkF9tAVOhIttGDyb+k5bb/9O8FnuP9MspgRxF25?=
 =?us-ascii?Q?oc5yWAhp3Nzp5VcxJuv1qC5kP4eiKOOOQOcFeZf+TwfldNHQ858Z9gXUscH+?=
 =?us-ascii?Q?5qvtE7oTLdnCOefMLb3nU60QLYnh0bqJkQvm5annBcTCt9Jm3Cbwo6joZH4c?=
 =?us-ascii?Q?RFuMdXs2hc3vWSfSEunbMmR0DKi51L35VGyoh5wdl7TmyRv1yGUIbPe769Jr?=
 =?us-ascii?Q?M6PpFvRXtAhusAXUB4di2VWIdW0MFFXvpa1823Nbgs3MEuzLfXyaYaI8SHQZ?=
 =?us-ascii?Q?axGiAe5eH7vkTqNH0PEL2pIRZUe11YzZT01U/YLcDvprztrs3tkY+9HhP1t8?=
 =?us-ascii?Q?LWWvaQDdU6pe9GYT83PfEoure2gX3tqAVksiX1sJOSguyY3O7dROssI+/iZP?=
 =?us-ascii?Q?cyYVKG2u95LaTZmuh2yHPvndfffuqpwV9v8ZSSJUoEi8bpdOay37SpswBq7D?=
 =?us-ascii?Q?OC7/RVZPkV9LGufAa5J8JdVE/FCieeWqslNMU2OZU8qRl8h0992LdrAQywJP?=
 =?us-ascii?Q?uqR5KfD+zOsHqlJf4hYmQq7uNP2aco9pFKDEb0LljzQBd/k2WFWnOWCPeJ8i?=
 =?us-ascii?Q?Wf8CDDbi3V2hikhpXeaetmnoa0vbyto9WxwYzFX8SINWL7ibpg3CQbKdOHEM?=
 =?us-ascii?Q?0GRb4em3he65LBT+D5KdaYEwsicGqDk+yaSmadACyZRsQJaGszRp4tdBo45H?=
 =?us-ascii?Q?rvFWRcflmwWobOjJ7A00L8mnQUmuDi0agptfeACDOeVoRJZ+P7Rdf6yu41zN?=
 =?us-ascii?Q?Mg+dg5+Ly5l3sy3Ju490y/67AaAORSRT7CMvtO72MKMYfOHgtKWa+9U5B8dx?=
 =?us-ascii?Q?XQIyZMUZ0AyXmZd7KNj3jUb0EHYEkdLQzGbO3uNUoUTo3s8+UyqEFfdfELGV?=
 =?us-ascii?Q?rowtP+trbhnkAZ5z+hizv8FXIbJqXERzQdDtYyjBKrBei/zuWg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7VeafrzJGgvr+nmjcwRAeQNO46+m9vHIHSA+aGgq0hCA/BAn3YmxicUgw4W6?=
 =?us-ascii?Q?a/GcLAW29wpByoUz0tcFprQtSLiZfRNX0LEc7l82DwF+WJ6Dxz3ShOOzuPNY?=
 =?us-ascii?Q?HV7t5Rk06oi4hN/ttZNr3O38am9N3v5G8tcD06NysiWUkXhuyG9RG82Iz8Oc?=
 =?us-ascii?Q?CvY71tf5C6lopRxVocTVYtaTDpAyKsI7qD0Fyjx+DBQVuQz857GfBQElAJhq?=
 =?us-ascii?Q?uU8fe9OLe4pwGHiIKc6csSUcdvnE6UU0x4+DWmTeTdpV+T8hcUpJ5h5dV/dK?=
 =?us-ascii?Q?Ug4V/pYy/0Z28zjHsTnvOusWbnzwqqzT57IEv73gg2MdIXJd432uDaoNKyqH?=
 =?us-ascii?Q?zi3kHw7mcXffI2QFN8V+3MyoGAcHyl3M2Gxb09Xn5fuoZulaq1pYsOME99vi?=
 =?us-ascii?Q?P5wuZKkGHpcxYUSxyajxeNRnQjqt7ZmjuNlvZoxXqqnyk1ev0byBXAWrCwGg?=
 =?us-ascii?Q?u+/VXL3QU47JNBwoPEFF88CUy8lBl7hxXhrckUQBiAu0ResOYMHxQWOfKzxe?=
 =?us-ascii?Q?VLm/m+jqdK+BoUNhMkVbQTgfid5HSqAD+uFqVzWTdjXc2fr171JZ86s6C3Ha?=
 =?us-ascii?Q?teVPCnePtLxs0Hsr0cLrI/odyVEsRb/P3qSY+dQHyfs9WmuHfgc3gQZVrsxo?=
 =?us-ascii?Q?9EqwQUlncZCCXpjv70RJh4I7J999NoLBVj64U2q+e2RMp0BjVor4g0KM7sKX?=
 =?us-ascii?Q?QKM9YCV5GapRxWIlJMGUbYzoOgeBmD1WGGUv4MDBUt6EUkiFr4u9oToiQXcI?=
 =?us-ascii?Q?ky9cHaa7d8M6DkE7mwm34dAqjqS469DzJSR50BWu2tzMaRb2CNXr1LijD/fE?=
 =?us-ascii?Q?Kl9B64wNm4OoRj5WtyFpocYRCAf4ItvoVa4tuzYLZre2ZJgtaN3ywbHeybBX?=
 =?us-ascii?Q?+1jajbQbOh+puWSlV/2+MkEzS+xIufI18cDDDI9+QZts56k7hr3NgZsI8U4A?=
 =?us-ascii?Q?SrurwoHw7VU4xGeH8OaR5r1qmPNgjfC34Dhdb+t1DZW6C+xyPcKE3CrH6VvS?=
 =?us-ascii?Q?J0OT7cd4N84c0q9ba8ULtQ15Rahl2esMsHdyA51TKny+NM1O73tPjW69gGEy?=
 =?us-ascii?Q?obGV2n8UKYSDrFwQ7CD+DxY37ANoAVzt0e9semI25qr1/jhDecYhcs58Euw1?=
 =?us-ascii?Q?dFhB0ycFrHzXDmBnNRyQtapG1FpyxoOehUIyxTaN/OhQoq9IM2WkcOlXpC62?=
 =?us-ascii?Q?VnJsqsUX7CzQy0v5MKwWaP4+dKeB74p8IwCQfrXPr9jDuVAinmQga2KOekqJ?=
 =?us-ascii?Q?+SC5oaY0BH6CzwXZEPV6ssjuKNUXbIxKcVFa8/1hKA9b2fLy5mqZZMCJs1V4?=
 =?us-ascii?Q?tGlU8wdL9HzULxOwQj9rJ4exHNZFOTyTLxwH510CveHIxMCHd6U1GCuOaAdq?=
 =?us-ascii?Q?b7QWSQX3K1/iFb1P/atcRJ6ekqPuAKuZxUUjAICMCej/n6xapKsaU2kLNXZD?=
 =?us-ascii?Q?9cj9u5OwOiVLV5k7de5snLhWWIjl6hL1fULHdUvV6pPzVWKtekrRQZE8fXGh?=
 =?us-ascii?Q?mL9qYfEJ8ciuHK3g3JWlVfgO5q8tM+UoJyO3Zar5voSm3/o4sHg/6X9knySE?=
 =?us-ascii?Q?7sKA5ZYKselu6VuXPIroTzu1OEVStZWBdNFxzSAF?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87c11150-638b-4cc3-623f-08dd2590166f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2024 09:31:33.9883
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b5Jyb+aPVxW/421n0AY7iTOicbt7R7eZ1TrJNR3pxPr+I+dnWtuJIt99tcLNj+Yg2jnCPSLFlxoSorFPUYZfNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4668
X-Authority-Analysis: v=2.4 cv=Ns8rc9dJ c=1 sm=1 tr=0 ts=676d227b cx=c_pps a=E4Q64eWPmlOcdHW0GAz4hQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8
 a=KiMCiSwjAAAA:8 a=t7CeM3EgAAAA:8 a=xv_kl2JHO5KtiQJ_TkIA:9 a=sPCYT0qwnquSfqsKqTDE:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: AttM3XMVkCqv4MmCAlzXjGnCFOtI_Ecw
X-Proofpoint-ORIG-GUID: AttM3XMVkCqv4MmCAlzXjGnCFOtI_Ecw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-26_04,2024-12-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 mlxscore=0 clxscore=1015 mlxlogscore=999
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412260083
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Dec 2024 09:31:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114554

ChangeLog:
https://github.com/strongswan/strongswan/releases/tag/6.0.0

The aes, curve25519, des, fips-prf, gmp, hmac, md5, pkcs12, rc2, sha1,
sha2 plugins are not enabled by default[1]. Remove these plugins from
RDEPENDS and add PACKAGECONFIG for them.

[1] https://github.com/strongswan/strongswan/blob/6.0.0/NEWS#L38

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...rongswan_5.9.14.bb => strongswan_6.0.0.bb} | 24 +++++++++----------
 1 file changed, 11 insertions(+), 13 deletions(-)
 rename meta-networking/recipes-support/strongswan/{strongswan_5.9.14.bb => strongswan_6.0.0.bb} (91%)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb b/meta-networking/recipes-support/strongswan/strongswan_6.0.0.bb
similarity index 91%
rename from meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb
rename to meta-networking/recipes-support/strongswan/strongswan_6.0.0.bb
index 2e2da8274b..5cf456990b 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_6.0.0.bb
@@ -11,7 +11,7 @@ DEPENDS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', '  tpm2-tss',
 SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
           "
 
-SRC_URI[sha256sum] = "728027ddda4cb34c67c4cec97d3ddb8c274edfbabdaeecf7e74693b54fc33678"
+SRC_URI[sha256sum] = "72fe58b7523155703b65b08c3cc559c2c9a5c96da54afebd8136f6623e7dda82"
 
 UPSTREAM_CHECK_REGEX = "strongswan-(?P<pver>\d+(\.\d+)+)\.tar"
 
@@ -22,24 +22,33 @@ EXTRA_OECONF = " \
 
 EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
 
-PACKAGECONFIG ?= "curl gmp openssl sqlite3 swanctl curve25519\
+PACKAGECONFIG ?= "curl openssl sqlite3 swanctl \
         ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd-charon', 'charon', d)} \
         ${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', 'tpm2', '', d)} \
         ${@bb.utils.contains('DISTRO_FEATURES', 'ima', 'tnc-imc imc-hcd imc-os imc-scanner imc-attestation', '', d)} \
         ${@bb.utils.contains('DISTRO_FEATURES', 'ima', 'tnc-imv imv-hcd imv-os imv-scanner imv-attestation', '', d)} \
 "
 
+PACKAGECONFIG[aes] = "--enable-aes,--disable-aes,,${PN}-plugin-aes"
 PACKAGECONFIG[aesni] = "--enable-aesni,--disable-aesni,,${PN}-plugin-aesni"
 PACKAGECONFIG[bfd] = "--enable-bfd-backtraces,--disable-bfd-backtraces,binutils"
 PACKAGECONFIG[charon] = "--enable-charon,--disable-charon,"
 PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,curl,${PN}-plugin-curl"
+PACKAGECONFIG[des] = "--enable-des,--disable-des,,${PN}-plugin-des"
 PACKAGECONFIG[eap-identity] = "--enable-eap-identity,--disable-eap-identity,,${PN}-plugin-eap-identity"
 PACKAGECONFIG[eap-mschapv2] = "--enable-eap-mschapv2,--disable-eap-mschapv2,,${PN}-plugin-eap-mschapv2"
+PACKAGECONFIG[fips-prf] = "--enable-fips-prf,--disable-fips-prf,,${PN}-plugin-fips-prf"
 PACKAGECONFIG[gmp] = "--enable-gmp,--disable-gmp,gmp,${PN}-plugin-gmp"
+PACKAGECONFIG[hmac] = "--enable-hmac,--disable-hmac,,${PN}-plugin-hmac"
 PACKAGECONFIG[ldap] = "--enable-ldap,--disable-ldap,openldap,${PN}-plugin-ldap"
+PACKAGECONFIG[md5] = "--enable-md5,--disable-md5,,${PN}-plugin-md5"
 PACKAGECONFIG[mysql] = "--enable-mysql,--disable-mysql,mysql5,${PN}-plugin-mysql"
 PACKAGECONFIG[nm] = "--enable-nm,--disable-nm,networkmanager,${PN}-nm"
 PACKAGECONFIG[openssl] = "--enable-openssl,--disable-openssl,openssl,${PN}-plugin-openssl"
+PACKAGECONFIG[pkcs12] = "--enable-pkcs12,--disable-pkcs12,,${PN}-plugin-pkcs12"
+PACKAGECONFIG[rc2] = "--enable-rc2,--disable-rc2,,${PN}-plugin-rc2"
+PACKAGECONFIG[sha1] = "--enable-sha1,--disable-sha1,,${PN}-plugin-sha1"
+PACKAGECONFIG[sha2] = "--enable-sha2,--disable-sha2,,${PN}-plugin-sha2"
 PACKAGECONFIG[soup] = "--enable-soup,--disable-soup,libsoup-2.4,${PN}-plugin-soup"
 PACKAGECONFIG[sqlite3] = "--enable-sqlite,--disable-sqlite,sqlite3,${PN}-plugin-sqlite"
 PACKAGECONFIG[stroke] = "--enable-stroke,--disable-stroke,,${PN}-plugin-stroke"
@@ -144,34 +153,23 @@ PACKAGESPLITFUNCS:prepend = "split_strongswan_plugins "
 # Install some default plugins based on default strongSwan ./configure options
 # See https://wiki.strongswan.org/projects/strongswan/wiki/Pluginlist
 RDEPENDS:${PN} += "\
-    ${PN}-plugin-aes \
     ${PN}-plugin-attr \
     ${PN}-plugin-cmac \
     ${PN}-plugin-constraints \
-    ${PN}-plugin-des \
     ${PN}-plugin-dnskey \
     ${PN}-plugin-drbg \
-    ${PN}-plugin-fips-prf \
-    ${PN}-plugin-gcm \
-    ${PN}-plugin-hmac \
     ${PN}-plugin-kdf \
     ${PN}-plugin-kernel-netlink \
-    ${PN}-plugin-md5 \
-    ${PN}-plugin-mgf1 \
     ${PN}-plugin-nonce \
     ${PN}-plugin-pem \
     ${PN}-plugin-pgp \
     ${PN}-plugin-pkcs1 \
     ${PN}-plugin-pkcs7 \
     ${PN}-plugin-pkcs8 \
-    ${PN}-plugin-pkcs12 \
     ${PN}-plugin-pubkey \
     ${PN}-plugin-random \
-    ${PN}-plugin-rc2 \
     ${PN}-plugin-resolve \
     ${PN}-plugin-revocation \
-    ${PN}-plugin-sha1 \
-    ${PN}-plugin-sha2 \
     ${PN}-plugin-socket-default \
     ${PN}-plugin-sshkey \
     ${PN}-plugin-updown \
-- 
2.25.1


