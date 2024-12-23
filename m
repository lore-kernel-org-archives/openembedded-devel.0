Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B306E7718B
	for <webhook@archiver.kernel.org>; Mon, 23 Dec 2024 15:41:55 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.15403.1734968514657407596
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Dec 2024 07:41:54 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=208786e404=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BNDhPbV023080
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Dec 2024 07:41:54 -0800
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43nsub1q97-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Dec 2024 07:41:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BjIqEujwrA8q11E5RMRgjX50FWb9Pva2fxh8o/8QjnJ0yNn0VItN7771ulIT48SYh7G+tINRA+Ar3IijPU4zK2ia8vEwQX7P7/JLClhzZdmf3tMTd3bZcZFKRThrvVL6y/SrHpgYFZIXSgI/AP+JtMeKYuYmUw1YfJaWC+XHmyEshHJ1hvOp+dQ1/uCDfNhIwUUKYI2/S8b1PZmPKbAK6Nm5Sr02Tq7VEcFZcBbLiysGQagBv5wOUxOYZQqCpefTIEP/D5vEHESPcj3Z8k1TamVwLEya2/TfYd9NoMu55YhXf9nHXdq9T1Ei1/5+eRJAQmsW8BP6hgAzygctaC3ylQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sEdzaEEzSfeZKk28m9OGDqC6dgoB7UZlp+DPftZ47d0=;
 b=T6TwsmQDCKQXxjsQIc12HnaATzQ6Zm7Y8IsbuPTbF5YOAL89dWslqRcVSHWpwRCoY+9J+LBOGpX6BMRDIf6BvdPqyMd4eNS1vX9Am9wB60G44zSTskGLbaJNExe+fdNwikWxQDXy+EeAB3NBFPu+GpkLlWyCsrcN4lzq9V9pv1cEYEAQjG8ebhI0BnAQI9ENxmxfOuxHByfxCaFHFUKswvZ/DrVZb9uZ62rQJYvMqNwLcoGROMcXYZKTTjaqokipVmHh6hFslWN+1k9wFH9KjnDeKV/oQLxXwOTYqwh/JtHtqMdz1gRZCaP5ZKE6hkS/PSHkytUT/m/RQ4BWt/0ptg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DM4PR11MB8203.namprd11.prod.outlook.com (2603:10b6:8:187::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8272.13; Mon, 23 Dec 2024 15:41:52 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%7]) with mapi id 15.20.8272.013; Mon, 23 Dec 2024
 15:41:52 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 2/2] python3-pyproj: cleanup dependencies
Date: Mon, 23 Dec 2024 23:41:33 +0800
Message-Id: <20241223154133.2955396-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241223154133.2955396-1-yi.zhao@windriver.com>
References: <20241223154133.2955396-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0059.apcprd02.prod.outlook.com
 (2603:1096:4:54::23) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DM4PR11MB8203:EE_
X-MS-Office365-Filtering-Correlation-Id: 23ff8e42-8457-468a-2f4b-08dd23685223
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?BO63KwzJUerHDq56WrsvXtG+pGYQivvS6W6yXtcE3voH6Z5mMRqQjWAdsZ34?=
 =?us-ascii?Q?Nw3OeCnvWHIDgqI7BOhs+3EhnkUZ1E9IKUXeAM6xjlwyQ8W4cJebZ6iKlG9q?=
 =?us-ascii?Q?nH07ypXScoQE1q9+f3hbvWBVJO1SPT8GZTNSCFBLV57a290KQ1KwpVzuBGEd?=
 =?us-ascii?Q?cZC1vEXZWATLXRIuIuNt9vlJW4Zv2ktFj5VIHV9oK2HUH4t9lTukrlvpi69k?=
 =?us-ascii?Q?q5/6ooK4CEc1j/VEC+z7B+BCCMw/bB/JLHf6CUgtecYx7RydcAHL3D63stcQ?=
 =?us-ascii?Q?uXaNXx8eHVzyFlfGFDwDOy7nTyFQzUuE2yG9xqfvSxefiS/OST/F4aH3s7YW?=
 =?us-ascii?Q?Qa8kW002ExO9d4S/v7VfibSrx6xefvZeDYmBbbJeGun+fTFUiTZWMZ7twzBm?=
 =?us-ascii?Q?uFc+xZkYX2+ngS1GnPzH9pTTruwSX1I1NjeC4zx8k45NTmBN4o9Tg+bXkg6A?=
 =?us-ascii?Q?vzsHypvodOcnUPGagnt6BuPUnDLGA6ZDjxp5VAukovk0PheD8iAZT3oItqbN?=
 =?us-ascii?Q?KLa+njY3Ql3Q3l7lR/5oRjSAjs20p3sIMmxZ0YJ35bNi4GkEGAx4Bakqxp51?=
 =?us-ascii?Q?wiHiwqr0IlzsZumFNuQCim3Nv1ssOKtR/A30F8kddQzQHJAE5E+XE5VlsH/J?=
 =?us-ascii?Q?zOObQUGq0llylWb+Bk+foJ967F3KJEn1FC3Lat9vvZLbcfd2iFguydUH9z7S?=
 =?us-ascii?Q?Gmb9v4BLTcYi5NgoKdv6Y6auBex3iv/qkeBRRXyQYHKb1kUZSMdhmxKEIwc3?=
 =?us-ascii?Q?wAxtHOHcIilH+oxAx3WGrORNf88xbP/s8Sh7xEHKLPcmM25etce4UGjYQYGJ?=
 =?us-ascii?Q?DvNmyKH9KBU2WS7wzxLoSqd3jfnQsZnnEH29H893OafQLbVTnWIEJUcmQCaQ?=
 =?us-ascii?Q?JDOtkvjlmg9PkUoC1pF49u3lpMhNMxkQhyvChwDddPp53jsN9feXg079I+oL?=
 =?us-ascii?Q?P2QUHKHkGIn02TJK2rfFZittDjuFH7NUljOK7CfBpF6VuGIdyNdkgAulZbGf?=
 =?us-ascii?Q?W6Yx+O/iGrkmDnMprSLLsDzyYoyrtkpWmuAWhhfgSY1GQHaRjJLsiN1DenFm?=
 =?us-ascii?Q?QTfqjr+zlQj8cD+yGzvQcSobCjtA3wvNExaD8N9hWu6FvUW5XlmT4kpW6Kml?=
 =?us-ascii?Q?h+G/IT+t7WY0xYY4Ykv+rf1P/4xIjTdjmxczfMnUWLHAvnXnTKtLdZ3G4W4L?=
 =?us-ascii?Q?yS0PncpcPwIacQqrtg3ciWuxMObrflnRgHlML5i/q9cQRftqlX3FDsxnKBdu?=
 =?us-ascii?Q?DmUT/yI/tLqa+Qg7QMojf9plnUfdRF5t6WMrphqG97BP98leS+bzC0wvvfhA?=
 =?us-ascii?Q?9D1Izl1qaQ7I9rpFwMZzw5z7aVYx2u4cfoi5GK7bKj5pPkpwAug9LNn6Yeq5?=
 =?us-ascii?Q?CWDyh6/i+75aXPvW1FeAJLP61DqjxOD/m0dxn7Ip0wFoF6rfknkxKyJi1ts9?=
 =?us-ascii?Q?3ziMFxYV0czcdRpqLz/XtuDFkQxRwJFn?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uVRAh50OL+xRJjgBinafjlA1AW2r4HtTLwdE64t8/2MATuJPleUUFHX14eaZ?=
 =?us-ascii?Q?xjR3DrWZ3GUTiboAVKlnl96xlNx45AODk1i974xeZ4D3z/4yylHaXw9u8UDg?=
 =?us-ascii?Q?4R2RK5wqstaDOKDCxmms5jPXjgWLg5uBEuJ8u3yz51NzizwyytdTy+Mx0imp?=
 =?us-ascii?Q?MzOuK3eMxA5xPGMNwIvhwqAdBfV7QWCY9r06Ao9sQIYx4olKwGTVmZs/F8fR?=
 =?us-ascii?Q?l6JL0+Ng+XfPJ+xuVUzoi7erqzAcgWx4jXG8FPFK5lJeng/CwaE8nb27eBC+?=
 =?us-ascii?Q?dL3/2H0+mm4KLwndnORTuV11aX+T3O0WdGbUOzmE108W2un3dPaP0+m/1NKG?=
 =?us-ascii?Q?rV5u+fc+jAB+5gIG1Z2PT3m1VwBuWasQu6GmToOWrVgv7vair+maRyfRJVM0?=
 =?us-ascii?Q?et5pOhsnW3y2jttxqZZjvqRyVOnOLhxWT7hDVA8+lKqsbyd/1TthqKd5VJjr?=
 =?us-ascii?Q?taF2iU9j1COjbhPM8dFpvIwi8bKEPBQ9Ny/pHgOVUs1WHuSBUsC5RbiHCcnp?=
 =?us-ascii?Q?dQJ8tcneRkA+4eLhNnFC9CunSxuxOe4AzjYmM31gQSHNjH5xERIGwvClKGiV?=
 =?us-ascii?Q?kLzIJJMcSDlF3hZz9CHPU/1qDUUiZGF4J5W+9QLdwo9HGqmuZH13AQmbQW/O?=
 =?us-ascii?Q?nKieC4NPWVgnHWjRe6S5t/jmVkunLZXTW9bMbuZO6zNhqOsRdaX5Dx7stSUq?=
 =?us-ascii?Q?NAH815RXtMzH6j/r60a/i+DkpsHroF1jpZOSUXlBDe0izwdKuYl0SkMKJbig?=
 =?us-ascii?Q?fjdJyVOLDntLup/8e5qlURntB4YjxKGIEDktMDZ1U32dlu/GJE5KqOtBoLzI?=
 =?us-ascii?Q?iDH/fhc2+o92kXn6cQ4XaUU/E+ggduFZDhj7zKFmR1vEsbF+si/LKCgkoMoF?=
 =?us-ascii?Q?zz36gnmaLSjnTEIohAoPN/b38KC/UnV/atPGgpjPnuH98dre7xPfdTXvGFGm?=
 =?us-ascii?Q?7U2GOidXz8Il08E5qfzFilZLioR0/nCTHsBuO6IDj3WDwWwvq5fTn1febbPI?=
 =?us-ascii?Q?VnuSiukEtcpy1Ho1LT6ccIbm/v+Ot8CpT/ZDvHM40lbeLi4azAySQWJcPBQY?=
 =?us-ascii?Q?sVUvT+3vCMJ0SOXhJKXe0YBjshh1M7y5vioj5x5EDMLVFbsvP97VCqvRcsai?=
 =?us-ascii?Q?IsK64eM1b8KrqvUjnDHoEVb2QV7SqGq9tGsGaMktshI1nijNmv4KmNTTOMrf?=
 =?us-ascii?Q?L3h+LHn11cBHmOrFal0SGPCIYDWgQ1Ntn5DMyBl0eEzbpAKXLLkyfeS+D5Ou?=
 =?us-ascii?Q?7E+1j0BCm7jPmPLAQSx9JKkDyuihRL4f3zhWj2FvEt9UWhuE5iZmDSuwQxK+?=
 =?us-ascii?Q?MB45zUfsXPO1dAvVL/f0LU98Bc6OpwfVO5hlT7S8djkQ+iyHf5dUcJlG0jYW?=
 =?us-ascii?Q?7rmtnQPVAicTxoS36VSRNwQg5a3bAKY8TRP7ToISmfxYtKcwOa737HHp2Bpw?=
 =?us-ascii?Q?wzUgpOyh56I2pKM87jZhcqhIZuklJN6G2KRUVwfBmuJhhDjByIoKnP9BMUEW?=
 =?us-ascii?Q?qcHwuSiqS295e9jhFBt74dchROD5re46hRtA4K22aUInXmvrY0DbcYMj0ONz?=
 =?us-ascii?Q?iCWF4yhkL4i1PQSZErOiSS6+kWNY9J/ncMBw4Ehf?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23ff8e42-8457-468a-2f4b-08dd23685223
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2024 15:41:52.1727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3dUakgEQhzDC7UYrFrsUVL7hLsXZNIP7izwtz+7Lk0w+KPnNmpM9kdslYXfp/EtGqp4VoyVUthwejNdOOF8fyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8203
X-Authority-Analysis: v=2.4 cv=Ns8rc9dJ c=1 sm=1 tr=0 ts=676984c2 cx=c_pps a=ynuEE1Gfdg78pLiovR0MAg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=ff16M2iUCvOqWDa7kUEA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: gYujHSJQ8dNUTn5hYSZraLF0Qaza-NAP
X-Proofpoint-ORIG-GUID: gYujHSJQ8dNUTn5hYSZraLF0Qaza-NAP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-23_06,2024-12-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 mlxscore=0 clxscore=1015 mlxlogscore=837
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412230140
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Dec 2024 15:41:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114470

Drop python3-cython-native from DEPENDS since we already inherit cython
bbclass.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-python/recipes-devtools/python/python3-pyproj_3.7.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyproj_3.7.0.bb b/meta-python/recipes-devtools/python/python3-pyproj_3.7.0.bb
index 70bc3b76a3..0143943e89 100644
--- a/meta-python/recipes-devtools/python/python3-pyproj_3.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyproj_3.7.0.bb
@@ -1,8 +1,6 @@
 SUMMARY = "Python interface to PROJ (cartographic projections and coordinate transformations library)"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3f3574263859ef2dc9bd7817d51adbaa"
-DEPENDS = "python3-cython proj"
-DEPENDS:append:class-target = " python3-cython-native proj-native"
 
 inherit pypi python_setuptools_build_meta cython
 
@@ -10,6 +8,8 @@ SRC_URI += "file://rpath.patch"
 
 SRC_URI[sha256sum] = "bf658f4aaf815d9d03c8121650b6f0b8067265c36e31bc6660b98ef144d81813"
 
+DEPENDS = "proj proj-native"
+
 RDEPENDS:${PN} = " \
     python3-certifi \
     python3-compression \
-- 
2.25.1


