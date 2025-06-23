Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DBD4C7115D
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 08:48:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.15191.1750668531852860786
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 01:48:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=82698d78b6=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N5A8AK026044
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 08:48:51 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02on2071.outbound.protection.outlook.com [40.107.96.71])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dhy2hhk2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 08:48:50 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jMipFs9nhGawZ7qLs97DYvAggRnwIu1OJkZ7jQysfL+tjesFaarWqkeQdWrxgzCG5V2YOy4vb+Hlm7qhmkUB3A/1gOl8YOIZfUL/h9Id/U3BuVax9/Ak4wHDvBoTGgYIg7kdikvZ0wzONqAdvaWAiQBWNY9JOovtovgTjBGlh50YQf0N6Y6lWLxhBeC8YrJ04UrRpK0OIQ7AbzzHizZXvkgXX5MXkTJAH4GDVZpSeUgENgFSkdR/KorkB+afRDKncf8s52AOXlP0HwCw9jTWfW+kg9XrM9kEy1DTZVJ5myk6GHnc3e+yxp8ZauSPGqoWy1UL6OxHwPEP1oOMP4bL8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cvDphGm7rm/K52NWrpoPYLLH8nyMq+p5O4zAX4jxWww=;
 b=StW/7DV6owm1FP9gH04MXmrE0y6DgUWjWnJQUq9eBOx2FBALY4VrP5TmEdJ23t/EjIwfi+sXpKaaHMa5wdEIgZK6qph5DCJZUn2DA6G4jab4Zy+kjlYg3a+vtg180viwOwfuCENH5DwpUa+JpBmsKXBzuNMHqHwTXOjyHS9YP5t/RlPrffXG/s0Pb0eZ11qcoq79cjxa1Ri3ADR9PlYJo16pflMRHjNdcHpMUnK3dpxoXIA2V0yB0soS4rTFUIq++7nl7fU56H7vFm0gTu14dc3ek8ZI6UQjKRwoN1hNhJFgG53H4Cct7X+k9BnjCv52JtVPoot5jmwoS8bIeevlfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by SJ5PPF1170C8165.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::810) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Mon, 23 Jun
 2025 08:48:49 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%3]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 08:48:49 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH 2/2] python3-protobuf: upgrade from 5.29.4 to 5.29.5
Date: Mon, 23 Jun 2025 16:47:16 +0800
Message-Id: <20250623084716.2318977-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250623084716.2318977-1-Qi.Chen@windriver.com>
References: <20250623084716.2318977-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: KUZPR02CA0013.apcprd02.prod.outlook.com
 (2603:1096:d10:33::19) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|SJ5PPF1170C8165:EE_
X-MS-Office365-Filtering-Correlation-Id: eba1d9ed-4589-44fe-571e-08ddb232c512
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?UJFU86GMhv8qrvffGgl8bnw184T9bp/iA2aV8D6qxtDYogFVYv2IIdoc26iI?=
 =?us-ascii?Q?uozpzO6K4iUHPmD0I7YfZ80Uy0/+f+VH1JfaieFk2VQqR0u5uwvuoTqZkvzR?=
 =?us-ascii?Q?OfS1d57ZeGJq8J34QGU8mlaPPw/CX9tkGQeQFKdDn04Dy/e4pLMSsTMuvtMl?=
 =?us-ascii?Q?bY6qVn/vuYL9VxBkx/Bd07AJyqKp+QH+iDhJtZMSSvQaTJbCik6G4lBckd7T?=
 =?us-ascii?Q?375HD/8eMvNYjhCIzCJHvzTF5bAc9dbQaR0OWRR7FH1obvgesdVQYymsqBV3?=
 =?us-ascii?Q?IzCGlTUsv6oY667s+XojbkLdXDHq15JMe7OVXwpQF26fWEfqYdlY7NGNRIAQ?=
 =?us-ascii?Q?Zo0h/QpClfsXa3NjRvJjdsgha+9LF/cW+UC0+SQKJQv6JBCyDnINJMLcPU6f?=
 =?us-ascii?Q?2tArEDixa9e+3QBZvbmiMs28cVgkroa9Nbg72eXiuI2azu5P66k/X/e3ZW6j?=
 =?us-ascii?Q?23xnduMIUp02sI2JuoFRN5li+6KS+pWLV0uMCtcnuuMrBKZL8q6TYnJGcAQ2?=
 =?us-ascii?Q?2FHpeHdsWiWJNSRBiMCLhIsMm2N9coCA63cJzXT25jtpiyDcUkRQS6rmuala?=
 =?us-ascii?Q?0OdmoucuwUw0pPJIUNvbVzh0s2p5Bc0qVPnFhYVfEJ9h34JWmyA5a0s5vgEO?=
 =?us-ascii?Q?zskaT9BtWqhroU83sTzt1DMkZsOSPe1k5fjmTtnqv82SNZDON4FjKZMIIGP/?=
 =?us-ascii?Q?BIEwFoFUON3p4wiwf6rcV58sFA4U7FMi6+rtjFqSDATDES7BgxfhnKh6vUMM?=
 =?us-ascii?Q?UGMK/TBHdv68nhAU42nIC/SJ3ZN2mdQbi6kYh1YJiaYLSZ+8irB4mC1ByRS8?=
 =?us-ascii?Q?kSeAnuEGBcO5As7Wnq3jLXe0soi6MgHSy6yufDOSilC2kDwyexI6943n772X?=
 =?us-ascii?Q?YInVLRFXfSeWtxs0dAyJ4NF/U/QF7acjG0tMmFGzLYjPfvEGODsEi7tBO25u?=
 =?us-ascii?Q?KpxCDrnonASUc4qplCx3sA49wZut8G7zZjO4pQ+exJEjWT79GoBkWXfy9l4m?=
 =?us-ascii?Q?zJdqw4Y5b3RxbDyBH4a3tm9I628wHLK/KyB+NUpjZb+T80vDO9qMG6CYbMlp?=
 =?us-ascii?Q?f23ZVgtswgAzTjigdY8EUodXGjv6tXEohpkRPlDS1YkKQ2zILMCpW36WQrtt?=
 =?us-ascii?Q?jAuhXvptwwx3q+213eEEH8NVmVUBfw82KsvFIhLQnI0WrRMbW40xYWg7Bs2D?=
 =?us-ascii?Q?NCXWQTgtGABuy97JRqPHbdOdnJQGuLqK7FQfj4L5Z69R6KKKpnsgYYwPT4w0?=
 =?us-ascii?Q?TEkgav8bhFv2Vb42EVDevJOwFUfkDAmCZrlFcLt0m4zOWgL65Q4DErhd5/f4?=
 =?us-ascii?Q?IeIOS2va2efDaKitRW9BYwEQB95hkf+Xmb4rZmL9cwhP9V/HEUo+L76vYvSZ?=
 =?us-ascii?Q?qB20z8UJTvEc9MTDLE3aGT1VQi0QqXlYG9G/aqOKA892o4qX0vKoCmpXfBMT?=
 =?us-ascii?Q?wUzwlgDb91+RAHwstuNrqhoRtyFxxHxwYu4VMYNXLr7Ay5vjuS3zaQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Ow0dnAigwVpRLS39yp4R9Z3iFzXA8Nw3E5bKit8iRkc20oGwRwAmhFgo83Em?=
 =?us-ascii?Q?02MGYc6v3fTVa1v7/3mww/IJxJFMa6VHtassU91D8vBi1JiywEJ8xnNG+rnW?=
 =?us-ascii?Q?ggPM8ehRC4Kqcq/9JXsKxz6uOqk3ssZy7Q+eHI9XiQti2WzHbAGNve0wsdaj?=
 =?us-ascii?Q?hx5lOW9uiIaLqfN2++ukB2oaMdPxWEKd0jsyXQEEpTZSX6FAr+r+bCuEb5r5?=
 =?us-ascii?Q?qLR1gAbOKT5HoF9aiXNmZQxvUU8ZVNVcZZSWkVosGNrsqycmFJvypPTxIhWm?=
 =?us-ascii?Q?7Ix6M3arr+AbtkHWtPp3N5bwvprdd+8pRgek23AEBAc9Ar4wvkEIYBPjmBZN?=
 =?us-ascii?Q?OZd8AijP+bboK6FId112zlaBcozV8gSpvqDJwyr1tj4U+MrlBvlCvVHh5FWj?=
 =?us-ascii?Q?PWx3WR1rf9MTRAgLzQHFt+E6RJ0BFTWcz9ynDsifnRJSx9gKbfnJW3QFDTs1?=
 =?us-ascii?Q?wJy3avZcrKadpDWvAes8sJN/aToluZKoJXFrpeXx8+l5HUnf6aDXfYOawTOG?=
 =?us-ascii?Q?1EIdDWUWMUspr0RQSYAL4xoNG4B0AH7qoMomXgfiCxaDNsm9sRxK/Jixg5fB?=
 =?us-ascii?Q?WkE94Gi+28VqZJ01x95lXRwD81Rl6Q1FI5V8TSbHmG37EDZAHSUonXsJ/kKy?=
 =?us-ascii?Q?nMttdmEyPahpTyp0dghgLIkctXKWvKvW6umcyqL1TmXmz9ypOr9OPPKR2Ant?=
 =?us-ascii?Q?I4LiHShEtBvJQAVnOwj4sdfWLpGQRB7zAYU0EZWvjR9z64eztazpImuDpOL9?=
 =?us-ascii?Q?Z0ctotHdOIDeA6utWboocLteQ0usx6/vrU3nrOw9RpT9enBMxyBtIDdqDfy2?=
 =?us-ascii?Q?78cphnlxXI9HSULHIiFJ0pmeK7iWqFdZX/jvNkQwqjFcrEbHRarMkR4wmiEK?=
 =?us-ascii?Q?KMhUh7XA6yVqVU/5vSXuyKmAFWNkRaqy3yR7jW/IlqccsHTZIx83lV4J8K0f?=
 =?us-ascii?Q?2yDDI7cdzxnS+cIggnvTENYBOTXs6q5lvGfo3DzsLHkHHr4aDANWPcOW19h6?=
 =?us-ascii?Q?nG75A1mIQTbukVKnOHFK6qvvOyCPHKmCZPSJMv0i2vyNZ531HLhXeav+mR85?=
 =?us-ascii?Q?CN5fXrazaq2gyUrVIBGk15TvjSHWRSATlFXKHd+1ybGlsge8afpb1eqdXpBo?=
 =?us-ascii?Q?Ut9+guTuQIQwBEYaH4DxVFZN73oYgrMV75sGQgTdih2p6Qma6mIfiL/fdFBz?=
 =?us-ascii?Q?y/TWK5jZ+wAThuLNaM59aotRYR8i3VluZiRQRqoPVp8ke1nty1a07e6g5COi?=
 =?us-ascii?Q?OZ21nHLcPI1DUKhOXFV2Zhs7Xeqm56tZZsAj+rURpXvAxvkH6nRy8oK3vaxQ?=
 =?us-ascii?Q?GrCDjXnxMKaSMy1W59glUs3A+XhRnwBl5Js32S35lMJEV6xlXpXk5kJYl5go?=
 =?us-ascii?Q?06kOGGtG4bpeGomt+vtUJPtInj676/MeLCX7bkPFoTkLXo6RCw6MVV4klR3o?=
 =?us-ascii?Q?mC4GAA0A97RJRM+OLMEs9T4WvFMO9am2gKLVmfQIADj4px95X9r4h07usfTU?=
 =?us-ascii?Q?ucKxOK0aFjRT0Lj74Nar+yNOolj3XVdDowQuwsZIDZ8me7cTLte/Oj8vVXYI?=
 =?us-ascii?Q?p70qKfQe8811bLA0vNBJFncZqOcP3ZhK/mkZnB6K?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eba1d9ed-4589-44fe-571e-08ddb232c512
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 08:48:49.1221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TOFlPJ6xWKO1pHx3WU0l+nFaqc5g8dcYq8vABC9fpzf+o7/vccPC4zk3ws+gL+78frQiEXzv8DTpXSSpl9N7Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF1170C8165
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA1MSBTYWx0ZWRfX8UtkGORRSi78 F0x6w6hgmzighpg9SksYvOX1TwZKaulcdNXJgR6s/2DbI1F3QS2+NUYqUQLMJ3ZKFk92I5YTzFW CcjZ8rysAQx6r29/MsHGXsYDKFshMOqGFhcp/2mn/A23BPcLscd++eHnfWEVJwHZmgGs5jB1Kei
 Tc6D7a40DOFEjiWoku3whbm3fZSfZmQ+wUZ7WkrFCyAlGjZmju37ji2Wg/hwglFFwJl4pKMxiwc 6d5pE8hAOyl852Ctzq7/XsoW2jqmf5qwhwYsQHIz+33uVCjwbDlJFBo6rm6cMjfvY0ILe8OwWQM sSSsJL8xOyq05IMMYnxd4tcBPbfwZ+3Kq7Nm4LB9996gcLNbBOctgRXFNBTJ5DFbdw9bi8waOHR
 K6D3v2+0xmCpVXa4N8eEIuWJ+3bcwaGp8AGUlY2/6k3Sxgjx1OAlciOQXidLop+raEeq3U6j
X-Authority-Analysis: v=2.4 cv=Qblmvtbv c=1 sm=1 tr=0 ts=685914f2 cx=c_pps a=ACYjI9XXP2BzzpCpjpIAbA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=t7CeM3EgAAAA:8 a=db45io-_UeDe6lnvHNUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: lFpx7wQtE2eExtUYVbN20QnQ79sMkqlc
X-Proofpoint-GUID: lFpx7wQtE2eExtUYVbN20QnQ79sMkqlc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 mlxlogscore=822 mlxscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0
 phishscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506230051
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 08:48:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118063

From: Chen Qi <Qi.Chen@windriver.com>

protobuf is upgraded from 5.29.4 to 5.29.5. Upgrade python3-protobuf
to sync.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../{python3-protobuf_5.29.4.bb => python3-protobuf_5.29.5.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_5.29.4.bb => python3-protobuf_5.29.5.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_5.29.4.bb b/meta-python/recipes-devtools/python/python3-protobuf_5.29.5.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-protobuf_5.29.4.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_5.29.5.bb
index d39c5e9790..14ab3237b9 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_5.29.4.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_5.29.5.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 inherit pypi setuptools3
-SRC_URI[sha256sum] = "4f1dfcd7997b31ef8f53ec82781ff434a28bf71d9102ddde14d076adcfc78c99"
+SRC_URI[sha256sum] = "bc1463bafd4b0929216c35f437a8e28731a2b7fe3d98bb77a600efced5a15c84"
 
 CVE_PRODUCT += "google:protobuf protobuf:protobuf google-protobuf protobuf-python"
 
-- 
2.34.1


