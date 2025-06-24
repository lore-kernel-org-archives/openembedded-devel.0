Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B6D8C7EE2A
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 03:06:25 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.265.1750734384077061850
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 20:06:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8270701add=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NKwY13016075
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 20:06:23 -0700
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02on2088.outbound.protection.outlook.com [40.107.96.88])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dr14tg0s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 20:06:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=noJZvumgDHidQ8pUivBBRZO/9TWvLd5+Z1Thal8GVXH8zkozvEuzrVlj/X+PCyeTZ/DK2tASiPktw5lv1xOIARizYLfhNDTOuUN3cNL4CSWCZu/WCmIA6s1iGOexqg/ntd9cjREzj3jU4fg2NL0rK/XNgzHbXqpAV6JDyvuAd/RcoiwxVDnmnuAJ+YDvdYGZfqaUNwLW8pyn1BM6G2Y/uPbmNOx7T1Q8sOVO9y7P5djJPDzlBqAhMaY2a0XmCV8gSFLe6cbdOspxoOLyXNFRj1oFEkCG41p6QF+OUN6fJAj7Iq5RnAmTEIX+TtoS3hzbI9gbeZmOFs2rZYmAtoMdew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VYcICnm/MUiFRnPCejhX55Bq2c5l7b6MvlA0k3WGup8=;
 b=KeNhoti0soB64xZKZ6USCJTKZgof69SfOYgzbYJFPmbH7QSdj74NcrO1LG4iVbuSlAzG7+Urw5Cal2rvRWitle/1OtxOAS9sr3oWIf6MtT/umQqeoBOBqVQTr6430Pad/pVUriqsgcYUXDg9pzDO37fgXR7PLkU7S07ZMsKoV7LZtZgi4VMR/ZADRUb/SxBdZTxgyWLHAWD3Xpsy5FTD/Z3uQbvdYlza0EulT4tU/wzsMwhbywYkhIMiPFR+EdkLZ4zLWxK9BWwuUQXalQWOSvrl97imq51jkFH4uVDOyIiHuKotKYuZIOzDwUFvsL1U781IIgE8tjtapryR9nDILA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SN7PR11MB7090.namprd11.prod.outlook.com (2603:10b6:806:299::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.22; Tue, 24 Jun
 2025 03:06:21 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 03:06:20 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][scarthgap][PATCH 2/2] python3-protobuf: upgrade from 4.25.3 to 4.25.8
Date: Tue, 24 Jun 2025 11:06:00 +0800
Message-Id: <20250624030600.986551-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624030600.986551-1-Qi.Chen@windriver.com>
References: <20250624030600.986551-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: KL1PR01CA0081.apcprd01.prod.exchangelabs.com
 (2603:1096:820:2::21) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SN7PR11MB7090:EE_
X-MS-Office365-Filtering-Correlation-Id: e5b2b637-6f2e-4d92-9541-08ddb2cc173c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ObhhxdoS1h3ElI8NF0zF45AHY2hAI8tEYciBd/ZZ+8254YDvDzmRzQxpM+xj?=
 =?us-ascii?Q?5+qMazZYjBpNPGDTtYYj1HWxpbnRpZHpT+rBJC2YXlgGFZCHD1i2T10fy/T7?=
 =?us-ascii?Q?K0p5N3ezx1/jN2TC2atUUsV/jCICsTgLUkXf+t+8/V6kmz/JmHj0kAdXpjSe?=
 =?us-ascii?Q?sJ2CFew1atS2cd35sVgNa/k1KbC/TB/UGVXAuZNBIj++bYoWcy+tqFf6YBDU?=
 =?us-ascii?Q?14j0VgV6OZHFVrTxl0UCtLmGfZcLimLXoA3bVG5T0V0B2RngPCfwvB64cIZH?=
 =?us-ascii?Q?zSQDrFLnCnCaKw4yNDqQ0+t/RmdSGB3TD7e1IR8JfL7EMAnitljaaLaXGw+p?=
 =?us-ascii?Q?rO55imz1p7gx43EVzIwZ89URZlgyM/QFEPfAPSyaf9GVO5MXjusohy9VVHo6?=
 =?us-ascii?Q?UY9gzIamxCu69RIFmzOn8igaVh/IlhSqZ3Fi1IHitOhMct4EoY2T+qEzIutM?=
 =?us-ascii?Q?UijgmtaQYeYAvJqS+EN7RPY2YKHK7e7NUpmJ8mM3qG0VxAPdPanQp54M+cgu?=
 =?us-ascii?Q?pIUjJKdY9N4rDvYtQwGSxkx3sor+xq9bwd4b/IjZ4c6zH+bCSHxZs7kHCIFm?=
 =?us-ascii?Q?7r77LXezKOfc6oMLqIQeK211+//OcxmD7o5FQbL8ZK8F/eRRXKTXWthmbUFj?=
 =?us-ascii?Q?mJjtUelW0mQ2Ikx1LvNjwPatSZm9EXkJhPOpa3yM8QTzxfjy+8EdgkXdRcVi?=
 =?us-ascii?Q?qYVwDMXfmXNtiKj9b67JpZZMY3pv9RjJmeu8HyrECDUIWmiKfrpgUXu9UXsw?=
 =?us-ascii?Q?2LvrqMSTGl2QAir0TpetVTyLkCpPyXdpMXoe6pQkOvdIY/v+nuP2JvILaJzj?=
 =?us-ascii?Q?NYK1CYsdCZ5/AI2AMvOOscj0wq/HxMaLX5up8LzieatF0x7VXqnkqW7mENl/?=
 =?us-ascii?Q?Uml7/73LEY/n3VYNbh9hBnLYfYnYibcQ1Ri9DmK7GVN2NNS0IzDXW2dYrGr2?=
 =?us-ascii?Q?DXKtCnejGo/EpmLQ07TA+HdCxOGQKvoidlTyO4fVEiTmpvCrXELmPTDqA4Jo?=
 =?us-ascii?Q?/mKhy82exarKzAOAeWBYp5sFTJRwPCA/vctIWkW9jhKCfYv47iLvyZRkrey6?=
 =?us-ascii?Q?mikP9Cf1dMymch82yZ4YezRRD78B5mZRRFKKCDnXkdS3FwMR3ivphTkIwbNO?=
 =?us-ascii?Q?WJuZo6ZFBT83A9dIPXv1ZdpWwUpxIXQCoNCfx4/aODepkEJ91z2jCCbZVqU8?=
 =?us-ascii?Q?SB0aPyTwXbVqy9kbG7A8WPWzkacDNY39mUAPWO1xGPLE5umQrKZtMugQknPd?=
 =?us-ascii?Q?kiruPBqFPD0s6/1oyMvYpLrWgI9uv9oPQGGfKwX7i4llBPVrPrJbBaBZBJkw?=
 =?us-ascii?Q?D/fa4EggHQzXsWiurnaoq3Ni8sHo5yjImLXoQizARxC5D2ybiNyP5Y70dlbb?=
 =?us-ascii?Q?/jvzkjOdKff8iDcKeBUdkcGQN+xs2Hksne6sbH8+cLv2kq1yqacVSNLEVvwl?=
 =?us-ascii?Q?Fyh5Jxayedo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5QqvR/IYxG3B4seaU33ZABM+AFyfVbcpi/qjMZTNdKPwusu8+36PrwWG4szw?=
 =?us-ascii?Q?vlDPM2TS3iUOtkIsF2sCJqZrpfsoAj/IqRdTHMnmKQXdB4rPga4Tgn5nbB0P?=
 =?us-ascii?Q?KmJiN5kR9Ns/JtnsvDsSKj96M/jGUbw38TEmcxGLd+pARjqqy2UXg0yL4V98?=
 =?us-ascii?Q?Q7L/Y5cP9piE/8GtXs+y0T+pqzCShWTJeOzR4f4pKRTAdMK1V5KIzneCEHYc?=
 =?us-ascii?Q?G6z9qW2dit/AG4LV44xsoZWhPe7QNMXxV95hfPCMn69diLKYRxLr0vTY4aE+?=
 =?us-ascii?Q?Zs5IHcZy7mfg6xuq/aupp3qUQKP8osal/YtfsLIBzj4y36Y2Z8OLMUh9ovjr?=
 =?us-ascii?Q?M5vCAg5Whbx4nzittv4Pn+3jEgJ7+YIV4Cmr13OW0aE65dzawfQQwnhLa5zt?=
 =?us-ascii?Q?m/jbOhBMouTc/kcUXYheB8P2ecBV7iFfOcvYGBj8hmpWYtFlORrTKnffBUUW?=
 =?us-ascii?Q?yx2JnkgEbJCAhqzTFyfVXNOzoQBKeH0Fmgc8O/pFjr6O7UbqqXOtqwTOKEKZ?=
 =?us-ascii?Q?h+a+iXPyyxFA7xr3NFN9POTf0z4+68+6kqQ+5X81bvsgvpCYeVNl+im6iOJD?=
 =?us-ascii?Q?Dh4aGZeW/IXoywNVHpnWjFvNoL3BKy7OglrTfFhPFdQZlTbPmBLgX719Qmnt?=
 =?us-ascii?Q?DmStxcMX8/rxudvgpg/gzGoy55OaIbWeOikW1yqm9CmjC3DXwITNVmd5Do4R?=
 =?us-ascii?Q?q5BT3PbcpXqaRXHkwH2P6j2NFpL3c0geGYLria50rsJl1eD/3o0OXzxLX9kO?=
 =?us-ascii?Q?hoK7bzGLjO8Ts5bv4cIIiFNPiAxeZL0SudCL9vZOCA3Fb4KTn2Q3z4pEmccj?=
 =?us-ascii?Q?ldwn4pVVXScPUtA1MQf5L9xODpSjVzOVDaNrrN8wJWbkgI9tsRsYiQjUIMYC?=
 =?us-ascii?Q?B1jDhTh8JXhhR77zaoGjsy2BZZtRyRVXukp3z4P/i6RI0VP6guIDTip5fmJq?=
 =?us-ascii?Q?0Kk9MS/MDV8aNHymTFQUp1ysCEjuxIwO5b4A4tdnc1jpXs1RURCF/NyLeQti?=
 =?us-ascii?Q?uE6YKt33jvHpFpUYGsmAEr9fHIxteE94SxVOiUUjBmJs+3p7DXkztIRA50k+?=
 =?us-ascii?Q?Br9uWQTxZ4FtJU9fLBSnLDBGw/9AkHIMlTWZ8B4AGzLnqyHW8izs2CXhLJcJ?=
 =?us-ascii?Q?Ixuyxnq5DnLDVErgjNsMCUrMxzhAG7MP0sT5P6EIwMqymtVqekBG4kMIq4Bx?=
 =?us-ascii?Q?lnrH/cXOMYashWEUiVN2axhK/GNELyUENUqI4Spt3muGfddOtmAOEYuRzIEk?=
 =?us-ascii?Q?L1ozwVwvZt4XDfUsb7Z5t2SJ9FLezkq32N8+UMq2o+Vxaqc5DaJMUbzRNNPV?=
 =?us-ascii?Q?dWMnhOmxOM0SiWBt4qt5tLRW6yaseoaogrobuNbiyx8qQF/cztUNVXoWNcYk?=
 =?us-ascii?Q?iukhOvOq5FzwSwA5+0Cw5PlQnMJK9GSQSOtjrXp9Plw7rshqLdYLVRFoYQp1?=
 =?us-ascii?Q?0h6KIF4di7n2/FuqRb5UV+sY3Td3bkA2vUI3KpSZGzcKSqIRcqeBsmZCnPHq?=
 =?us-ascii?Q?cMOyTQx1pFQIDVr7THLgBJVxSlR+Z4v3PAt8nR25jtJ00MIr3POdDMSBPqtS?=
 =?us-ascii?Q?hZnhm+SO0TB2UGJvE080mmhUGVXpQTS66omqVl7B?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5b2b637-6f2e-4d92-9541-08ddb2cc173c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 03:06:20.3655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M6ntFr962EGTTYGSEF5EiKEChFUqz9qGbCJ6su2lmszDGF7Kvjf/TLbptlSrxOIhD8GvkthdP4QvGTSXVGcMwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7090
X-Proofpoint-ORIG-GUID: _DrBd2Z2D4rQXRRatHjM5qPt-SKBS3Ax
X-Proofpoint-GUID: _DrBd2Z2D4rQXRRatHjM5qPt-SKBS3Ax
X-Authority-Analysis: v=2.4 cv=XYKJzJ55 c=1 sm=1 tr=0 ts=685a162f cx=c_pps a=Sw9lgjcOpp4q2uji22PKTg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=q7AoBUq9l0gA:10 a=6IFa9wvqVegA:10 a=iGHA9ds3AAAA:8 a=t7CeM3EgAAAA:8 a=gYX2SKk_Fbm7YCpTdWUA:9 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDAyNSBTYWx0ZWRfX+S4LFxADKqXZ 9aGZF7IgatpRVe0sYi4I+83CrKJJwCTawsr56Igmj2gFpdZSW76jdisar/tjHENr2A4gT3zo3Sn D3yldWUuUqzMOHhl/MP6YZTQWtP1z+xlGMMF50GsUhPE15ewFKgnmikdjKCIxrljVPgdJi3GVfA
 p8aSvBZ0uB3nF8iYneQ5/gRar+gzIIu6Vynpi3fXJpcO5zVHBXrnPpuIVnwpKNqRNhHVCUkFW3j seGp1cNqxpDnfmuMEGnRRU+05o3rmXH4JlgiujhpGAXJXAGITyj5Pwola5YnvrS67EnxGZONyAV 178xZKKYsbtbafzniNdob4X1ZJdKaunJyTXkIAsaT4BdvmFnRMMS9XLkzHzVeSRWJktfpoEZbzQ
 nPyQiCge0s07nww+OiLPuaRug5s6AldSDSfIQLRDFwNXF1RjXr3SNfcyE1JT17xlU2FYfKBs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 impostorscore=0 phishscore=0 mlxlogscore=908
 malwarescore=0 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506240025
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Jun 2025 03:06:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118094

From: Chen Qi <Qi.Chen@windriver.com>

protobuf has upgraded to 4.25.8. Sync with it.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../{python3-protobuf_4.25.3.bb => python3-protobuf_4.25.8.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_4.25.3.bb => python3-protobuf_4.25.8.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_4.25.3.bb b/meta-python/recipes-devtools/python/python3-protobuf_4.25.8.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-protobuf_4.25.3.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_4.25.8.bb
index c234ce5773..aca30efdee 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_4.25.3.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_4.25.8.bb
@@ -6,7 +6,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=53dbfa56f61b90215a9f8f0d527c043d"
 
 inherit pypi setuptools3
-SRC_URI[sha256sum] = "25b5d0b42fd000320bd7830b349e3b696435f3b329810427a6bcce6a5492cc5c"
+SRC_URI[sha256sum] = "6135cf8affe1fc6f76cced2641e4ea8d3e59518d1f24ae41ba97bcad82d397cd"
 
 # http://errors.yoctoproject.org/Errors/Details/184715/
 # Can't find required file: ../src/google/protobuf/descriptor.proto
-- 
2.34.1


