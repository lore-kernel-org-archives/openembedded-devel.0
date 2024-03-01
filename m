Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D84BC5475B
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 09:44:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.18968.1709286250728408375
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Mar 2024 01:44:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Pm9PTeuz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3790b160fd=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4218LY4V006043
	for <openembedded-devel@lists.openembedded.org>; Fri, 1 Mar 2024 01:44:10 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=5jQjFdCzNKEo5UIRln
	XeUPAvLfjFuhw6ymIGTH5N0dM=; b=Pm9PTeuzyUdb7YDMWsUVItsUaERal33S/4
	vhliq1XDZfg0D97OGjCWUT+uOTaQX/ljt5m+reTQWCHmZGLmSxRvQkW+qVbHH7+7
	oAHeIYTUiwgVIzaHMalCjhiUhv1Sr3oQz1cRVzio/QocAkes/X3KO31pHRlmQcF6
	lU6XzP7M4U4si0SIgCj2Wu5oTnv3+Z/Fj3ZV6xEPHsVlo2OJNC+tBIzkw0SwTHPd
	HWE/61eKzre+5M8Nerr5i/nDRWL3xn1L1oyG29WWiToTfMs4Pg4IonEYRJCoTAGw
	a5ziAIRyTQE3gGUIJBP62+YXciJyIDM5E4DFCulJJQXQJVBlbgvQ==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wfgump442-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 01 Mar 2024 01:44:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YqoXFH+UIJs846Pmgl2Wd9ouJD5eD8mijohSoXKTmL2ikGppredxRHz2vBydWvpEuTjOaHaj9Y7rAxxGpcB/4QorwGJH9QKlEDE9Lz0T37zGYpEywXoZ+Sint+iQpIj71j4/zdIeoCzioJMGxAHZ16u/e/zsRHSS/jiA54IYvbOi7sdLgEMEHAdXeYVtlTvoCQWcTOT4/E4t/yFc+XxaWH5UXCGHqvTcDgqHm7lLHJiw4WYWbLpuZ1VqUX8cmKXu3LFv3YMe6q7G0szXqWgpYJ2PnTI88KiwAGPcVKFTso0xtNIimxaIc/vMHGvCM8K7Z+IVYkqrUkwu3L794vKX8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5jQjFdCzNKEo5UIRlnXeUPAvLfjFuhw6ymIGTH5N0dM=;
 b=jNoG/OwXQ9KL88dNFIsna0gZpY9ved3rR2MhYEiY1A09mv4T5Zc07ZZQyPTVDdsxm4DXzFvahHx/7Q1XxkeCCUiJz3X29dSraTof9HFlr/5M/dHCuxDYmbRmGNMHHaShgNZ0hpnv0JS834T0U1gzu2tdvMw86v/cPT6l5M5ZBBuwDLxVsDjCbhcOWlWvOuTlz/LJeX2qZdclkG1wtran8/KU3P1EXaHuhyesKuJOmY/3mvxsvGLhxR0z5eyVwck34hvDiOm7I1SDnFRYCJiGoGzBfy+0qLLFv5V1eN5T3H4iAM4s+aKTR3RrZ8UY9egIeYBQFr0vWO1pflJlHbXueQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
 by MW4PR11MB5910.namprd11.prod.outlook.com (2603:10b6:303:189::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.16; Fri, 1 Mar
 2024 09:44:07 +0000
Received: from DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::97da:833f:8511:a558]) by DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::97da:833f:8511:a558%5]) with mapi id 15.20.7339.024; Fri, 1 Mar 2024
 09:44:07 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] krb5: upgrade 1.20.2 -> 1.21.2
Date: Fri,  1 Mar 2024 17:43:56 +0800
Message-Id: <20240301094356.2029724-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0009.apcprd04.prod.outlook.com
 (2603:1096:4:197::8) To DS0PR11MB7484.namprd11.prod.outlook.com
 (2603:10b6:8:14c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7484:EE_|MW4PR11MB5910:EE_
X-MS-Office365-Filtering-Correlation-Id: c89f8e08-03f4-4795-975b-08dc39d423cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uq8irO0fPxdVi8Gh+Dgvyy4ebH0Imh2EFPYWeoIurbgr+onV9NBpZ9mHtpnX+oSTu45SdA+Wngnocyt4B5QCVHZeCU1o/+KhORsK9r5n6HfJAc5PaympwK/mk95k3vXjGN0tg4/B2f1hMkMqpg9zZCfgTzP4sztrv3bJSG5hpKLiw7jGT92rtdpp+r6MHbL83zxOiDbxhEhOGxGFOBRAlD0ygPENxTTZ0B6FmdYO0pZs/Dq8EsslD92s+PXk/8LC7E6m4cubVf9gjDAWy9Z6NKOUfOdEc6asTW1dR7ZW/VBGpY/Z9iUhrMlV8XQJxmRgGpDdytKqKd9GbHXu5sRgqEaMowyI4RrHyWRnyTF2GwQY9UVFNZFRmmpf+2MRCEEpIdn3mIKDeDRlgQDZLGHmz8sP5hRbAcsQZm9UvrlNhJvoy1h9K2an2E7NtUvpN4I0b5NvJocjsKk++3qGJUKiL8LxEB16Xks2hQLBSZGtQpfIdS252dqQwWJxf7K0MHJFpr56xiRp2+5P/oRafN1kaWIZDpNWo+0znDYWEF1+iUc+3F3oNxHfwnst1YEXT1vrfpP/1czIkimJd2NH9ruMgBX3wf4faYAaL73RqQXBvKRkJVMgptbg2fSnNfJQcRRcCu6XXGeJMxhLwTsW28/G7n8dxCsybjgXOjwmP7g1+l8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7484.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zC1YkB7G6PWdd0KxbQcQi/74My4vZZdceO5qXPOHRICClRY+FYKG55TTdjn0?=
 =?us-ascii?Q?xv9ZqCJo1eeE5d+8q6L6Yb5goTLVzAdqBkqXMCnzbJ+mZ4WAAoMdZaxqBjWo?=
 =?us-ascii?Q?5bjPxoBzlr982aJFHVbCk5j8JJEwsKUQ5XrymG5I/k1GwNjUNfCTnVBGBvfJ?=
 =?us-ascii?Q?JmzRDTFF3yyBPfOkRPo3KqOsBBHSL0AQ/ainDvS9FdhtnlHv7WMkGIpV7yp7?=
 =?us-ascii?Q?7EimqcHp906eL2YJmXzDaoXIBNzkbp4thp9vAxqX07HpVOhJp4Ij3a6a8PQp?=
 =?us-ascii?Q?w4mG6WQsM0W0yWdJN7Dktp18ZiH5PRYrsPBDkLIKQebloqj7hjiNgr1OkU9M?=
 =?us-ascii?Q?0W5XkpSnGwKHSZXJTwOtiWPhj8mQik3U38vkZTsin4eH61zwzFqpHqlzpdFD?=
 =?us-ascii?Q?lRPo+zkNmKz8fn9Z6UmPljTfEsr1w864Xu9XRZB4VlO38kMOFoPhkaym7hiu?=
 =?us-ascii?Q?lUbOBonPouNSjNIVxj5YWkUSjYPQAAusXGtU12MJqb0fvSoePdlQz7TF1MoI?=
 =?us-ascii?Q?SAEDG4mmviUKl8vJ0g96MsGi9J0YbQvpQAfGb1amBbr+u9xxssalvh0Sm6Q2?=
 =?us-ascii?Q?uvsQtZP4rg1Pc/5UEXxIH37XXgdh88GkRJVgX7SmL+5DOEcVe733iN80yu8S?=
 =?us-ascii?Q?6Ad4KZBAXJUGaIU8cTH9P3xb205clyC4XDjy2i1Xmh4NdQiQY2y6lywALsva?=
 =?us-ascii?Q?zbtJyc8QN2NU7SUp+wUvJeh/+v7vdfh24lkTI+iWy4Ec8NVFVSme0ylFciwB?=
 =?us-ascii?Q?KT7Oo9YChAEmAx0uKTptwn90nKxHxxQMugOligvDQDL74JXLA6bUfW/13n2x?=
 =?us-ascii?Q?0UbPDBn3tkHdLXYfBmMRkFWYmNRO8EVJw4WFtqBYitETlCW1WvNxqscmNtHT?=
 =?us-ascii?Q?WkXCb0msMpvIWxU7n7Cv5og4UZ/64IJmJ4booAtwNxudDfMuUVJO7FAElsyg?=
 =?us-ascii?Q?D65Z1wmqybZXplFMQoIyKqpzDEIg+xejNzKEED+vCVvMxfP0Wg/7bEtn5VYO?=
 =?us-ascii?Q?eW4U/PxI2ARNFQa8v5c4g7/Xiv4ilfgrwomVkJTJUFAXtia+fngrYqnPQ5CZ?=
 =?us-ascii?Q?b0ea3808qfHKLMhWina4YWMMX1T2YRCPGFT+1n4I9br6gQkqAYnHC8+Duz46?=
 =?us-ascii?Q?/hhmZ7lv3+94jUnVYVCHlQd4i4MQ11C1XVFJKXHAnYHGGF1fUI4U1r76wW5m?=
 =?us-ascii?Q?LrvVCX2ncuzRS6sqDP29mxpKjJ9biTH+Baa7w/BZZ65NazLKraTtGOcEa42N?=
 =?us-ascii?Q?dH1hoyR1le54LJ1oZ7mdTxwk1m4QNPrsrDvIj3d/Tjb3eAllkQ72nrwndCG3?=
 =?us-ascii?Q?hu5viUVvBa3cwJ3+wabRl+nnP+rYhD/vV+WIq8ytal59W05BWISUnzGR1gfH?=
 =?us-ascii?Q?EaTwjH+RPFgQJzhcUvtIZOtV1wurvv2idzOXX7l3p4jA43+zoMRy8rCsBtQ9?=
 =?us-ascii?Q?qRGcpSMbE7hdXvYimgZJNcolRNyN6Zy6b52v26aGb7xuGOeLRgMHIunQg/pJ?=
 =?us-ascii?Q?RXfatP/jdrhsaA8yjSKNACvkm/M8S3cM3IQlPUGl0+Unt4e6rTkz4ZZbaemZ?=
 =?us-ascii?Q?HmiCVEy4f1mZcdRlV2QIsSAGNc7zeMO8KpM6ym82?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c89f8e08-03f4-4795-975b-08dc39d423cf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7484.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2024 09:44:07.8273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dbd2e1ogTThhsHyzKTf4gg6NCSGqjOM3wolSPbY+ld/r1EMA8Usk/e7UN67rl6MOnBbln+YhO+x5u0JnQEkqMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5910
X-Proofpoint-ORIG-GUID: PFeILx33zSqdJHENIcdhyMXM78tYQr3r
X-Proofpoint-GUID: PFeILx33zSqdJHENIcdhyMXM78tYQr3r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-01_05,2024-03-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 mlxscore=0 spamscore=0
 adultscore=0 malwarescore=0 bulkscore=0 mlxlogscore=969 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2402120000
 definitions=main-2403010081
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Mar 2024 09:44:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109073

License-Update: Update copyright years to 2023

Release Notes:
https://web.mit.edu/kerberos/krb5-1.21/README-1.21.2.txt

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../krb5/{krb5_1.20.2.bb => krb5_1.21.2.bb}                 | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-connectivity/krb5/{krb5_1.20.2.bb => krb5_1.21.2.bb} (97%)

diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.20.2.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.21.2.bb
similarity index 97%
rename from meta-oe/recipes-connectivity/krb5/krb5_1.20.2.bb
rename to meta-oe/recipes-connectivity/krb5/krb5_1.21.2.bb
index e1fe5e567..7af33e4e7 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.20.2.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.21.2.bb
@@ -14,7 +14,7 @@ DESCRIPTION = "Kerberos is a system for authenticating users and services on a n
 HOMEPAGE = "http://web.mit.edu/Kerberos/"
 SECTION = "console/network"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${S}/../NOTICE;md5=3c7414a99de5452b8f809ae2753b0855"
+LIC_FILES_CHKSUM = "file://${S}/../NOTICE;md5=32cb3a99207053d9f5c1ef177c4d6e34"
 
 inherit autotools-brokensep binconfig perlnative systemd update-rc.d pkgconfig
 
@@ -29,8 +29,8 @@ SRC_URI = "http://web.mit.edu/kerberos/dist/${BPN}/${SHRT_VER}/${BP}.tar.gz \
            file://krb5-kdc.service \
            file://krb5-admin-server.service \
 "
-SRC_URI[md5sum] = "7ac456e97c4959ebe5c836dc2f5aab2c"
-SRC_URI[sha256sum] = "7d8d687d42aed350c2525cb69a4fc3aa791694da6761dccc1c42c2ee7796b5dd"
+
+SRC_URI[sha256sum] = "9560941a9d843c0243a71b17a7ac6fe31c7cebb5bce3983db79e52ae7e850491"
 
 CVE_PRODUCT = "kerberos"
 CVE_VERSION = "5-${PV}"
-- 
2.25.1


