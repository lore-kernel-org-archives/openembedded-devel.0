Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1506CF6495
	for <webhook@archiver.kernel.org>; Sat, 28 Sep 2024 09:34:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.10483.1727516055256048867
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Sep 2024 02:34:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=900161c346=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48S9YBxP002547
	for <openembedded-devel@lists.openembedded.org>; Sat, 28 Sep 2024 09:34:14 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41x8s889j8-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 28 Sep 2024 09:34:14 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zFr8uuzTdcTQuxkoxvDvGBIZynaiJ2swLTWFVadcKWWXeSzBtjRH/h1ZyqVR9pq4Q/EbZ0G7hpfAllhnZ5j88HoVvqeTBqdPAgPmP2N7ehhhHx9nCOAoYwq21AEsyqKfft4j+Bx1XIxfi013mtJUIV46fFp1ygYdxu3sU92pirEIbPl89KNbTO6PGpeqZyP6fRHZgf/iDh8Tdft78pAwvzY9Lue7YL7AE8TgmA5261JiXgqSNlWiD/rq7tSm9QGxvG5Smf8BxQY0q7KESyiSTHKU6K9EXaPGhGZfNjsPdZLyltuXmVR4D+VAonhZk6Zo5JwCOrPpR4UVRzt1W+PGTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wnRcuNDHgsmyBiQO70YU1011kd6RWpe/wm9IbjqzRCA=;
 b=XMoAB0tj8CwHcTdkyeP7UhC3jNrcYlQzSX+9yXclkYLl5M699aZ2OJstjPELggGHDPxKPdwNnR70pJDAXltYZSr69LR0CMai3MJdjAz8Q7AWRhVZduaimx2+Jy0XmlHMyxrCSbCW82wjHnA1wsnnhRyjmNFZUDKv5h3sDVbkNI6N3EPd9t0Rz3Gt6jZdkQ4dG1JExN/rgA6zwvd1+r/dcePTs7TeE7J9LepjpUFeba5EZ3bO3qERJMePWkaxqZN239wDLa3nL0JjGdEFnzYVlakw0gclU0GhPgXCXQidPDZ9FJK53lQRH7m3KdkRbeGIEua89xwVuhBGg73joMRewQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SA1PR11MB5876.namprd11.prod.outlook.com (2603:10b6:806:22a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.31; Sat, 28 Sep
 2024 09:34:12 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.7982.022; Sat, 28 Sep 2024
 09:34:12 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 6/6] thrift: upgrade 0.20.0 -> 0.21.0
Date: Sat, 28 Sep 2024 17:33:56 +0800
Message-Id: <20240928093356.3992191-6-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240928093356.3992191-1-yi.zhao@windriver.com>
References: <20240928093356.3992191-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWPR01CA0003.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::8) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SA1PR11MB5876:EE_
X-MS-Office365-Filtering-Correlation-Id: 0269cab7-b723-4667-bd91-08dcdfa0b60e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?x0GLegshw942bvJi63+DArYkdCsyF1XmIyuGc7lRFzktaROgmEctla3rUnIo?=
 =?us-ascii?Q?+8gAgV46f6TYi8psuOoO4mUhXYSKhHOzqBghSl+kdsyVEE5ejonwDq1i4MRK?=
 =?us-ascii?Q?R6TiCWrRkqLIN4u/Y46Tdf7xuIyzVTaRZY98Q234t6bCF+/5gKzVJqj/azHa?=
 =?us-ascii?Q?xsr8kPn7fn1ai2uW7GEzSjxjyMUdhzf55yHSM+i6QhE9aRz9GJoBzLgOhanW?=
 =?us-ascii?Q?2O6nD7IscZc3VnjNU1Uj1CXzINxiTJg7r6tjpmTpwPYU3iftGrh/172AP9z0?=
 =?us-ascii?Q?R43kr/kQyDUseCLXMxYJlku8YMpOjRouBMaGXXCds9EhmjmdiAaCSlvkEobW?=
 =?us-ascii?Q?suKN+C70a1KBd001Mj+ZC1tnSo+s76CC6y6VVqJJ5vqBbSjI59OoQMD59qMG?=
 =?us-ascii?Q?v1lZ0kX4GYT9RgEZC3BWNKyb5+HMbHxGFAcNeG+8e60X1pyRaJNk7arYJX3N?=
 =?us-ascii?Q?rZ/kH6ZBx2UuuvfJwgvhLuwpy3z2IVtonj1hXif2vZuiwyJ4TUvJ1dIa6OdG?=
 =?us-ascii?Q?kzueagUaeAoaaQmOoiqcm0uqynOyx8W5QbCv/ufR6zyCLWMJTEzPWCYm6I5X?=
 =?us-ascii?Q?TTET4Pmbs3ZX2VNamjzxG8Pgema3KMNXw7jpBmtjChhhCKevbw2+1of5HLr8?=
 =?us-ascii?Q?DS8pPoGKRUbCwz6kN/vCWyOYROgffXTl6RlnkRSwhpdp/f8HJUi0K+ZtNmvz?=
 =?us-ascii?Q?sn5cadkQLTE3DlUwPn5xjianUpv2QIJCshebQIYtYGrYzdkQ0JuZ4Zp9w/Gx?=
 =?us-ascii?Q?FC56/l6N/fGgPQVcf0Cz5vGtv+4JTfs83KRZ59Scj6wJDkVRAGerqChbFRhN?=
 =?us-ascii?Q?uXnQrxozAvwtWWkSY6J8QAHO9YVo7VcPIqfSOVE41ztE3EzogSJms3+QZRIc?=
 =?us-ascii?Q?RjSn3Lhpy8sONY8FUCP0k9fLhOYseaOQkomvDLP8U0Q+2RKooWxgmTCWY7K0?=
 =?us-ascii?Q?Dpzq2/2BmaWWvdO0Nm0DA1MaoZhFuCHYz55lQfhJKeCzmZ9ke1UfXzLEV+Wa?=
 =?us-ascii?Q?3OMrEOimKqBJV9w3V0kUAmnyQwIchUmMNZKKlsgU44A2KSgM1ADiKLQShrq0?=
 =?us-ascii?Q?LL9+XxMO6ged+dwP92HzdE0d5RMqvT0Is23wUCbSpqtqsFarXyaUT0F7vm+k?=
 =?us-ascii?Q?O+qYQ5nqRIZvuJUvK7s8Yw1DxqcXQbT4U2cldVJio3jAj2ppRIFCDbTDSQeP?=
 =?us-ascii?Q?3gbbYjeVo0Zxph7kUG9ELQXb/s9fOvV7ThgUHS3ChdngEniN9vTF/e8X7iom?=
 =?us-ascii?Q?uyNoed42BG4tB6VlE6UDaYl78Zw0w4/U8mu51s0PvzzBb+QROiJxssiaeyzP?=
 =?us-ascii?Q?9r7damXvYsAhFW5L+6Ps9pizWZfqJMG3V/efpnc+jxZJaQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1ePa0REp5z/9SBW/F5pMGGo7IPfstLawmhDjlZD1JL/7PZzMWmZz7iIVMDQ2?=
 =?us-ascii?Q?muzWCJ1fojOZak+ENbwpVnmZ70vNl5XfBaO2pDtq8ZunNJ0cIybwabUTtSNI?=
 =?us-ascii?Q?SBt7nJ7tBdCrSJM3GJOjmaz0x/iUFQ/jSpT8/5E9/Elvvf3TAOzyCYWtfs7u?=
 =?us-ascii?Q?crA1/t2EYi7+H7zvEph4ZG7y3VxTznaPdryatWvIEjS5qinHZXEXH52Kumyh?=
 =?us-ascii?Q?KZB67IBoJspsUdeaRPrQoY4QLFwl5s+P0xa1sX8O31AsSPZc2nqPAwRK4J4o?=
 =?us-ascii?Q?iQNT08Cexy+5kLHPoQh6FKjN7QxMqa8RGwhKxF5PgD01zbtNFk8PHlsQbB9F?=
 =?us-ascii?Q?TOcuOGv0opLZ7QFX8kkgWoWC77XBwuDncFuaFWF/Mve8nvmUnyb4f25o4sDm?=
 =?us-ascii?Q?XHXglFEtkkasXEdYNscZuH3T6exD2sAEbrJUp23L9BQhJkb2TXY4cdwuaaqe?=
 =?us-ascii?Q?rX4QLjHpvL0dMQw4VS/zpSD32C+3o1mU+Wa2W7JdR4XAdPB6/3qaQiFuFJWh?=
 =?us-ascii?Q?clE7IKd7KHDO1LU3lf243d9L7U1HhGqgWedN9eK4IHNKYH2LdheDULd28LL6?=
 =?us-ascii?Q?wNHWuIMlAsr3dtn1Lz7uSGOsQCKVi+n8gWqx8akrStK3iz6tuwQoFkt+4Ui3?=
 =?us-ascii?Q?HkymgAchCc7TZp/MlnPPioMfTFpoCTsHfDkmDfD3XCIaBEkCtsQKyqaA8khJ?=
 =?us-ascii?Q?eRi5MYIJ3kTRQieyMLkUPF2mYQGze73ebEFty67VcqNW5kaIY/3F2D0YEMZk?=
 =?us-ascii?Q?Vvh5QgyXUO5OzHHXFUFHAlT/+wmm/qcjHYgiPutM+NNV3EgzwzA14+MMdJzX?=
 =?us-ascii?Q?YI072cmnHs0HpJv8WrWyHpaBN0T6NKb7uZOjfw3AhwDg29kcRhkhK85GkdGN?=
 =?us-ascii?Q?+0m4aryLiwsK0omllX+3VJRG++FV4uXSO4q0Uj9gOs/FqMDsXcaqUHPPQPEU?=
 =?us-ascii?Q?ui6D9GpQY7/bpQaAVcJ+F4AwPWeQ0EZRdxtJ5LlEwOsHZ85X3lIPXLwXXlmF?=
 =?us-ascii?Q?4vANHXu0c1upDtAjYmXprOBhhXUb5cRRVxudQ9DrioF/BY1wtMd8FS7i1VzC?=
 =?us-ascii?Q?bi3ksmzoHzHEU4YYHBWbscGGwfEjJHoVSg6CFE8Cg6fYzo8Nle4hTT6weXHD?=
 =?us-ascii?Q?YXbqpbzN2qFVOqzoOXjdZxavkalZco6FnJ0Jt+J7WMngk4ZtmK9+pKICeQI6?=
 =?us-ascii?Q?R0zVUVKq+hbKhxfyNn4calT8X6cuhHl0D8D0Bn7bHJc5wwgmpZC4hd+Rn910?=
 =?us-ascii?Q?kVmlFmbAxAhiMsC4Zu7tCJmnqBmQ7NleNQ/3GJrPeKlHzO9aXlthV7xlg7pl?=
 =?us-ascii?Q?ZBSSUWlyq8mTbEW1YpvIL/g9CM8ueDg/N63ja9LdIziXOf4Y37ODed3ddvzC?=
 =?us-ascii?Q?7HUlXjS4pwFWHGaw2QgEFBnFwixFqQUXjs9LiFqrDSjYfTf5ZBEMxSBJbbJX?=
 =?us-ascii?Q?yYxJpdwhKJi095vI5Vu7nQjySs5b6PpQtoRbvkKxhToqg88mXmgO16Uejh89?=
 =?us-ascii?Q?R23v1slM0cIXZ5dndiZo3h7y4/jaFvRkSufyoWuGlM+R+l0+eoZwoAn/9zqQ?=
 =?us-ascii?Q?q9XGNrz0K58jvNcLVgtoePX1lBbum2/L5fvWwYww?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0269cab7-b723-4667-bd91-08dcdfa0b60e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2024 09:34:12.4418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2XxkZtqqnSbCH8eLwPOs1819veE2yxnllsv2SNVNrwuNgLJvDW1Yk7LU4QNnClk72PWbJ1kfA9jgjbRluRgNXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5876
X-Authority-Analysis: v=2.4 cv=VaulP0p9 c=1 sm=1 tr=0 ts=66f7cd96 cx=c_pps a=MPHjzrODTC1L994aNYq1fw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=mV9VRH-2AAAA:8
 a=_39x77Ba4WZCDshAjwgA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: Z24bnAUfkrsCDHJu4VRt5KnPMz5v3pkA
X-Proofpoint-ORIG-GUID: Z24bnAUfkrsCDHJu4VRt5KnPMz5v3pkA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-28_04,2024-09-27_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409280070
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 Sep 2024 09:34:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112539

ChangeLog:
https://github.com/apache/thrift/blob/v0.21.0/CHANGES.md

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../thrift/{thrift_0.20.0.bb => thrift_0.21.0.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/thrift/{thrift_0.20.0.bb => thrift_0.21.0.bb} (96%)

diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.20.0.bb b/meta-oe/recipes-connectivity/thrift/thrift_0.21.0.bb
similarity index 96%
rename from meta-oe/recipes-connectivity/thrift/thrift_0.20.0.bb
rename to meta-oe/recipes-connectivity/thrift/thrift_0.21.0.bb
index 23db052b9..35e55b225 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift_0.20.0.bb
+++ b/meta-oe/recipes-connectivity/thrift/thrift_0.21.0.bb
@@ -10,7 +10,7 @@ DEPENDS = "thrift-native boost flex-native bison-native openssl zlib"
 
 SRC_URI = "https://downloads.apache.org/${BPN}/${PV}/${BP}.tar.gz \
            file://0001-DefineInstallationPaths.cmake-Define-libdir-in-terms.patch"
-SRC_URI[sha256sum] = "b5d8311a779470e1502c027f428a1db542f5c051c8e1280ccd2163fa935ff2d6"
+SRC_URI[sha256sum] = "9a24f3eba9a4ca493602226c16d8c228037db3b9291c6fc4019bfe3bd39fc67c"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.25.1


