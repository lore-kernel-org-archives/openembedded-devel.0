Return-Path: <guocai.he.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8872DC83F09
	for <webhook@archiver.kernel.org>; Thu, 10 Jul 2025 05:24:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.1327.1752125032895587274
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jul 2025 22:23:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9286ecb856=guocai.he.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A2xD8r018598
	for <openembedded-devel@lists.openembedded.org>; Wed, 9 Jul 2025 22:23:52 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2047.outbound.protection.outlook.com [40.107.237.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47pyb5mvdc-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 22:23:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qoIr0LHRT7Q0yk1pWK5V2te+pqGwAztCNGuZgp9FUQiQm5D+VXitqe93MTchCPJmV5q4v8ANtZHsPaka1e3bTartYpX0ZFZQ1yfEMeWadmbZ/Zmydh9qVqas/mm71sfyAfodgx4nEhmSLOSJFIHIJssOvDVOUBDv8F52XM9DThXJGBrxePXkc4fnP6T3EODQRnphv9yU9M7WiuQsKhCQn06R3CcrG8MlmJXJdPgB310FAZaWEC1ple9ikvxlDiISKXxgaLNAd5K2bXQ4RKxILfjyEStMtT7P+SMtr+Ke/2+f8rS1urxPpcZpqbYMtLADe54o40irfDsyNPy0TOWmag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=55LKP/iohJ6BvsVhNAHxRFcVJTZXKLc98zNkuYKOwh0=;
 b=wJqwCBNZFiyN5EdomsE5TsmbiODEA3ZqkRBehhakkk1eVL/DsS6lgIXQZ318BkCN/dBG3cy8RVvKik5IZPmWZFV+rMaljblHluZZit8SfFk0zTpUHBeVyW+AV/8LI789U2Zx9ZipW2quMgwXZvmUym8dIdOPbPEfpaAR7dEOM7IFzhOrW7IO0nT3lPfQqs9/UpW5qIhchEfownYPNsTJJa6Dd0Jtj3RySUfaVN2ZYjVpQP9iQGcenE/tQjZbWS+uB6snkyQhhl7zLZOM24r1CgY7EGQm3se0448kgUVn9Szigw/KaX7E99WAdBUYN04Di4sPtLelBJSOrkBGRh1Q+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5586.namprd11.prod.outlook.com (2603:10b6:5:35d::21)
 by SJ2PR11MB8470.namprd11.prod.outlook.com (2603:10b6:a03:56f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Thu, 10 Jul
 2025 05:23:46 +0000
Received: from CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::813a:3211:c8fd:1f86]) by CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::813a:3211:c8fd:1f86%5]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 05:23:46 +0000
From: guocai.he.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][scarthgap][PATCH] libconfig: correct the SRC_URI
Date: Thu, 10 Jul 2025 13:23:26 +0800
Message-Id: <20250710052328.3399677-1-guocai.he.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0171.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1b::21) To CO6PR11MB5586.namprd11.prod.outlook.com
 (2603:10b6:5:35d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5586:EE_|SJ2PR11MB8470:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d7d857b-7426-4675-8402-08ddbf71f177
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?4IGid3u+Li4vCqa299hWj3uY25jTfbTk1wWIXFfSu03SLW3SE4Gk0Nza3XoB?=
 =?us-ascii?Q?xCp8uhDBCPRXlBDkNPXB+si8Aqry7DSxVyMRykBmPUPQJEmiQ5hxRvxFZ14t?=
 =?us-ascii?Q?9YlcSO1vg721St3UupdGtf/3S16SvawFSLi9AOT1+edoqrC3Bd2XwgafTuUi?=
 =?us-ascii?Q?YWwjme3ruiShuA23PvqkMCDrA7zKjp+3kaHscgxFeZQVRvjxBdy1A86SUFFX?=
 =?us-ascii?Q?TIqJJ6UASlLMMIh60TQXIiUZVsqUlqxxp5t591njHTDC/cKAtFs0NZ0d+WVf?=
 =?us-ascii?Q?foyLsQAY+WNclJRF9yRqdn2Kw9sNIOXlKSyc6xEA+GyF/CNxi3bqOmSi99Kj?=
 =?us-ascii?Q?v9vehpQS+pYOuw4W1wgDVYqG/pGXHEpILekG7VRcZskCN8Eb9xFGe8SLCGmn?=
 =?us-ascii?Q?Q0iCZ6ikHYXXtYhsN3f6yjLRym69+F6Af8iqNh2aN4fI47FDbLCRuyBZjYEv?=
 =?us-ascii?Q?nk+tqt/spGYrS9YD4j+v6G7ZXjUO4CG5/2KNYu4Sx5M56auCJ3V4uZWCMcRm?=
 =?us-ascii?Q?5rjDcK0TVsTPkPjrNH8GYSA5xkhqUw8jgw3CBe5rv7v3wAzst+Gn7uJT+Ixk?=
 =?us-ascii?Q?t7hzGQvmiPaY2r1mKway7Mc3VBYk/ToMC6Glf7LxG7CrJJ36jAtJusp0h7BP?=
 =?us-ascii?Q?aFwOazWlcZSUY0hq0u5cLS7aLnqR1KpN8ElRwHNvpylSKD1T9dFoXn1fFuiq?=
 =?us-ascii?Q?gBDCMRIg1wwa86U66VYPEidj8YWpFTj0ugjqcpWnYqLQ3tY1jlH9HWCK6rkP?=
 =?us-ascii?Q?a0bSok48z+WjIAJnJoqZ5RCrFv7a7atO3655r6GlrZGrb8ANXLjg47Rsprqk?=
 =?us-ascii?Q?ig/Wm4JYX2YromieL+lniSIPl4pPbsa28zr9q9Cd76RnHog1lfQP/wrhT0Hf?=
 =?us-ascii?Q?/k1vFhqqI0TTqK5gorMRicEtr56bNIJfBpmysIRa/JRCXjJiWV0E2p4O2x9N?=
 =?us-ascii?Q?iFfe1e01ErM1CYoqX3qJv4evUfKYHk6BWiGHd7VvQhc6n1/QomoFSIf0jrfx?=
 =?us-ascii?Q?oqMfx3LgUDZeoL5EqrXm7sXsiMyM6UDtjj545ISWQZWvPjDSzKcCJ3gK88Cz?=
 =?us-ascii?Q?1vag1hpwnk3ZhoD0ptBr/N3iSbCLjoG8r0rV80vbyadc43cKYkcI5mp59MB0?=
 =?us-ascii?Q?tp9oIZmYn5tTXDEmCP5GvWnKPmpk3w1cDTWOP0CxP+1WMKGwaYoijbVfggvb?=
 =?us-ascii?Q?z8jYSinuAcOYzWD0boei6WK0m5HLSe+u4uR8Aj7X062vpJMNLjSlVxTAn1lF?=
 =?us-ascii?Q?OHP7uoHTQjL7Oi+l0PLAMOf/iVT+XDtLy4cxxEcwR7F8w72BQX7ZR+fIEyfs?=
 =?us-ascii?Q?70gS7JdAiqjFCsSQj0vwBa9vmsrCPFZh2/flXeFp+w5QDNemMV9yUUkuHeuG?=
 =?us-ascii?Q?CG583Swk4YFmxnhu7rFluNK1ya/pp+MXFJD7gcmRLv8RMsRoHmVpdBE/abDO?=
 =?us-ascii?Q?niqT34UaqdzM1tWgc1aEO3ZtnRNJmd7k?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gVFNXlDrdm41dR9n5C6yerzTXAcwTxvWtLRfJ89ylyRTqIUb30WnRkWslbpC?=
 =?us-ascii?Q?82bIPrjJJGsIseIFwQdPC5L+4JnygfGeWsxFM0pb74O5ZHZGyY4H/ocZuOCX?=
 =?us-ascii?Q?Y8n4P2eiYsN446q7HaqwIt4cvnjgEn3yER2AQf2F9BucAxyb74TpyZFKJixC?=
 =?us-ascii?Q?N70e16PKijJS0yEopTqKo/tfH1zEx2kVqEAZqboq/68aQqcuOwIsz9o8NXuw?=
 =?us-ascii?Q?ccDm102vwujisHyq8DtPs8EfJyTgq+r16QxKpepPnOVLbuA3SPfqOnqHg90F?=
 =?us-ascii?Q?oP+WfAjHP/UsCtyGea2R10TgUdistChYnsFDqp6Li70JHNJ17kIxv7dTdkxV?=
 =?us-ascii?Q?C87I9D/KAJXdBc9MqiBTxY2pc4W4RGhjDAiAECKPNkSfaKEub+JwZ8GtBrwZ?=
 =?us-ascii?Q?0M2cLwCkVX5pYQtOo6N9HdvhHcJka90BgCiYn3OkG7WC+hlCSlgr0MFhU4zp?=
 =?us-ascii?Q?pB6LztQ7ihDTB7CIswcIRcpYrizZuVcT93LLlGNTfR8MT1hAgBKJCuqjIPbb?=
 =?us-ascii?Q?FW9aOGp9MXja9B2J4TI0/yTkz47/hizUDxLWBBHBRHRGO/PkoAzR3H3Cpaml?=
 =?us-ascii?Q?nv5wjeYKgAnUR5H1nAImam/NgRt8wbAxpgAXzPChAQWuT9rSnyenYYntG8tY?=
 =?us-ascii?Q?ag8MJcual2ubtBd6e8duvbaTd2tE+XEv4Uy8olYWQiUXW7zmVTgaBSJFuVIz?=
 =?us-ascii?Q?wTHAkbijMXU+d+McZdQ7wkjTaSm7qFz46YiBY7V9c6IwclcqXVU0z/qx8l9E?=
 =?us-ascii?Q?+bsn+LA/2Qg9mdZcpZ/Oj1RMSuy0S3O1FuL3e5XjqfynQBJp0CwddhMg3Ysz?=
 =?us-ascii?Q?GAzIv9lXIKxXNfB+1rV7M7VxXbYVy1zF6M/HEs4sC6e5el9KPwn1U1PTaZbh?=
 =?us-ascii?Q?7nHUbwzR+aaGcM0mKKOOtNHWL16MJKolg9ey7JwPuWGagoK4ASKJbLPfLunm?=
 =?us-ascii?Q?uWthYT7f2+p9A4Oz/SgY4lOpCPdQYemqv94BVr4Zcge/Ypkj9ttvItY85etZ?=
 =?us-ascii?Q?k9G/dlpeksgO0H3QHSO6StJxIdTkyq0kpZWAxIrr5/0iREcDUETC2BsfyQ4J?=
 =?us-ascii?Q?I6FcSzTwCkxiwqVtwRA9IOOngsME3wvPsB0d6bVF+DmxXQDB2sZqGHej7T3z?=
 =?us-ascii?Q?Np5v/Lcc4qiW8kd2ugQVYKGgOVJqaI12xjxOVBB4ey+E2H90O4pvyrzqPIrN?=
 =?us-ascii?Q?sW0WALPJV7LTtP1ztLN/H+aezW4pDtiPiZCTSGRUV9a4ROcVPHRf8L79vPj8?=
 =?us-ascii?Q?6WFb/t9iDSAZe+lMOOggx2qyfwdaD/ZN9xyZQeaHb+SMUBbITzBW0M864CEs?=
 =?us-ascii?Q?iqGFrzOuccVT2qT0ClcYMnt+zXVEOeXaXIDXwEF5IPo53W9nuqwuhfg0waFU?=
 =?us-ascii?Q?VGC/N+i4AYO2Z1tIZisifL0XJXOzC9c2B2/35iVZIPOXXEVqw2fteNZ6Zzwo?=
 =?us-ascii?Q?JFChirARbK9p6fza3gvbpk4kjq6XCzFarxWAEA9stxncBDBpfIGUwfIpYZEA?=
 =?us-ascii?Q?G9yHazgHxRnSI7LWYobcoh0no7sqrSITK158TTdUyWC6LqEqSCZxYCcVvpGm?=
 =?us-ascii?Q?+hxaGJT0cZjLq2U0dPaqQs5fZRQ7Qat4AeoLeD2So8SvE1nd6dhHo4PHbcnR?=
 =?us-ascii?Q?RQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d7d857b-7426-4675-8402-08ddbf71f177
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 05:23:46.2610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wyTRHPjkleMLNKyKAagdXN0uG82P9cJMC19JPul00wBMX8SJ6IOz+OawPQERf6E/NJfA4OIhzQp3jcf0z9FT8X6xZebFM/2TH3mYIPX1WW0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8470
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDE5OCBTYWx0ZWRfX5+yc65aZ4RLU RAnFAWzb8rQJjxp4Rt/3xMv6qfMVUuxG6HBv56h83CI5aCGXbDz16F96+1WsoEoo2Vdy/fW0CaL 8ZX2GjiS3WFaM1GaR7vRS92nthdDsb1DovwGFXQMl+y8kyn5Am4RlAzg4loKxoY1h1v4Sy5uGIN
 wBrglD369mef7Dn/e9U0tScfnhDxVnUcv6b6kC9DfMB//D+JhiUU4UeLSat9VhNr1KyvnCEbRLp UWHBELGJbVD6P1h1q/xdUpNELo2ppovTBlhQwqN8n0LraCp0WejRr/auTTTWe4KPw2kd9YKRQTT DOSKfxhNXSk2JHvZryL+w7F5hFeFna19Gyu5yIieSxrjLrYoLmnNFcG0+xcXJ7pmnCNLQtGjcV7 z6bqpRi1
X-Authority-Analysis: v=2.4 cv=V5590fni c=1 sm=1 tr=0 ts=686f4e68 cx=c_pps a=C121ihmqoWJLztpWA59etQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=jn5mJRsBAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=R4i1EFtukU8x-8thLnoA:9 a=0flEoihKdI8QF1_aUImP:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: FIAgDrzVWkVklYZ_h9f82T9F08lCRoJf
X-Proofpoint-GUID: FIAgDrzVWkVklYZ_h9f82T9F08lCRoJf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_05,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 suspectscore=0 adultscore=0 bulkscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2505280000 definitions=main-2507080198
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 05:24:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118393

From: Guocai He <guocai.he.cn@windriver.com>

The old SRC_URI is not available.

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
---
In https://hyperrealm.github.io/libconfig/, only
libconfig_1.8.1.tar.gz can be found.
---
 meta-oe/recipes-extended/libconfig/libconfig_1.7.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/libconfig/libconfig_1.7.3.bb b/meta-oe/recipes-extended/libconfig/libconfig_1.7.3.bb
index 6382569923..6509271076 100644
--- a/meta-oe/recipes-extended/libconfig/libconfig_1.7.3.bb
+++ b/meta-oe/recipes-extended/libconfig/libconfig_1.7.3.bb
@@ -7,7 +7,7 @@ SECTION = "libs"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=fad9b3332be894bab9bc501572864b29"
 
-SRC_URI = "https://hyperrealm.github.io/libconfig/dist/libconfig-${PV}.tar.gz"
+SRC_URI = "https://github.com/hyperrealm/libconfig/releases/download/v${PV}/libconfig-${PV}.tar.gz"
 
 UPSTREAM_CHECK_URI = "https://github.com/hyperrealm/libconfig/releases"
 UPSTREAM_CHECK_REGEX = "Version (?P<pver>\d+(\.\d+)+)"
-- 
2.34.1


