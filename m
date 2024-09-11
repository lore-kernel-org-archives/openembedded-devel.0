Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D67DEEE01FF
	for <webhook@archiver.kernel.org>; Wed, 11 Sep 2024 02:55:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.13578.1726023337358290014
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Sep 2024 19:55:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=99845107e5=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48B0fjHc008723
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Sep 2024 02:55:36 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41gc213ww0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Sep 2024 02:55:36 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PlaIiz5BR1PJgDACSrc0+1GmJZ2It3gwSUuYLrQ6R1QMSp8LsU4b1EDdZVLoVLPrXfEGWVuMsuHgn8P4LtyHC3PUbTFK+GrfaQv2Z4IVLrcCKSoXhj9YX297025X76oTT4NPiiDteiTzihIvV5KByJaGdLRlPp0JSwmFt80yR3bTgwiWDlFT4CxiUUGFUx9cnmpamYeFg09RP4QgsaE5XMGkMRfTL3V3dOxhCZqB4nI5b554x7RAxE0PlSa+YF0DZeIkdHcIxE9YAZL4nWTpHwbVb4LZMoSNKCQL+gM8vJfkO/Hc/niC+W/QVSiTRWcU4AQ+j892Ic1fVwXpITOFwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ylZ+cRerYcx49wrQGPcYpxCc+NWuMSXiiiVN6fNEt1o=;
 b=YbRc4fN6h4hCbnxujVNMS0oVSYY1j+LHtYcv0hOpGZQoKtebiVrF284IcpDBKHH6xx/BiiewRlHiWQBv2KZTCW1prTKnJ9CS3f67vNZ5xTSAM8haaLB/aFqiYvGsUpdsQDV/6N4J+RCJqbfN3jzaCiQ3/+GMmYszoeCNa1/3nOSpZvZUO/VOz6xyzY+RAbspArMg1k8RY2dQHX922ngBH55e9CELtlwDO0kjBJDmrB43KjKRkGibe5/V7juS7FSPV8ZaWA7txUbgcMcbeXCRCQqfl1pFnWa4G2MgRK9vxtO7/WUNsYBB3sViu6C2lreAyqYhbUGa/+xNHsFGd7yL2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 PH0PR11MB4952.namprd11.prod.outlook.com (2603:10b6:510:40::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7962.17; Wed, 11 Sep 2024 02:55:34 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.7918.024; Wed, 11 Sep 2024
 02:55:34 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] freeradius: upgrade 3.2.3 -> 3.2.5
Date: Wed, 11 Sep 2024 10:54:01 +0800
Message-Id: <20240911025401.2671942-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0135.apcprd02.prod.outlook.com
 (2603:1096:4:188::23) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|PH0PR11MB4952:EE_
X-MS-Office365-Filtering-Correlation-Id: 00c7424c-c5bb-4375-d830-08dcd20d04d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?SDTOA6YAzXKCvgp7FK+0TI3gnElyShPupI5FmBlJmKj7bNeeD6EDqjFRA4El?=
 =?us-ascii?Q?XV5RApf31IXv74rYfXmAfDqgvjuP4+Ce7q2zaaiDMejGbrVvl5jJN/aXgHW1?=
 =?us-ascii?Q?hQ+qgCV+j+yKqr9MMgLc1pngo4iehiPy80xjUisnGQBDs6VnjFrOlc5pdt4P?=
 =?us-ascii?Q?C0j5epKhgPkwrJ3NrvlhjawXikjGSV+S+4n5v64hiB29O69MtQ42HBTZL4XF?=
 =?us-ascii?Q?9vMPJgbJT+R4oXWMpMiutGBvKhBt97Ps0x/7xYtHOABWRxv1BPL8fzj1uHhK?=
 =?us-ascii?Q?n9wFk94yf+SFPNDjbKLhXe8BDnmnLdkOmEoZoZQRReBqN53IgMtZt03nPiRZ?=
 =?us-ascii?Q?DjneEfv3eAXsaGIAFdXCH9FjUP1o9isK27S+zf784KwVSJ8hLrW1JJsqSwOC?=
 =?us-ascii?Q?dSHERqV+zDYDrOSYK+CBdEJcdawglyvOezFC2WNLTlJVyLkN6CvPfW3orqOQ?=
 =?us-ascii?Q?FlTWsxCIol72pzK0akfsE04OcvsEoVexphG/6WeAK/GI/JaTAIPBaF467Gk9?=
 =?us-ascii?Q?XL9zyqAbBBkLwdsfiddICEbjVM/ccSSO/Sqg559p5IEJBZufK9x2KgR59I7r?=
 =?us-ascii?Q?aVrR/RCVo7NRfL0BdLUmcFJqAVggnwB4RCxoVj0FXiDAmRX4Ibmioj2WWwju?=
 =?us-ascii?Q?QqYT2O+xxK3pnsUlqORAk4KmFrIeTA9KEjt97rplUiDE3DIReN0Fbb1UpPWQ?=
 =?us-ascii?Q?0VSjjarTTy+UFTEa287ct6MdA00IL+3CUYwJD1cV6yc9kqr/1mAz8v3xDEil?=
 =?us-ascii?Q?7MdomF8YKvWtcf5lF5z0Llb573Fvb3xcJlNgWvARAhObJYPc2pWHvqRbSyqr?=
 =?us-ascii?Q?Emj2+aHSGX+mBjHxN1tg+RKzLllGjVRXlg+KiewBnjdvlKmNHLpQVJ48MZ1L?=
 =?us-ascii?Q?o2bOQmpdS/LvMLlCBVeVfuvoGTZhWVFFRTA/MI/KzjYANw3y3uL4esVUHAm6?=
 =?us-ascii?Q?xiTUN686OBhOSI/Wub2YmPJX+mC/1XxPAFxzzdIVOd70R4OV9LhwoRC2a6f9?=
 =?us-ascii?Q?6Tj+6ruSCx4mB4mQT9ZzmG8hF8qBvGIsc/xdJJvRZ8IFN/1Mtlhxwg6gG7na?=
 =?us-ascii?Q?Cwm3Bh5ms3YVWXuI5AeArdOx7V0/17lZgF9SAWHou7HxenflmWVknN4w+zpr?=
 =?us-ascii?Q?W2qmZ5BEcJzs/VuI0DVQcVx0GMBxr/ggGjQE7yIBoxpJ3vn2mp4606XBovzd?=
 =?us-ascii?Q?HtjZkLrtxDPuWGHhZLmlsLG+sG+S3do8r6doIZBt5PmX6Gw1lc0vODxbaLi3?=
 =?us-ascii?Q?xQWcYhTRI3G1l512HFHq4KumEGKRbVQAoN71SC77vcxuTVsyKm0d//UEL/P8?=
 =?us-ascii?Q?YCLGvKzJlIOeVKRKD7P1zlEhe/5Y5wRsUr2FM/3F9y2j/VnYSL3LB3GTkfar?=
 =?us-ascii?Q?L7vUO8/qB78lYS+qpSXmneD+o4ai6j1THwzlmQUypc+9e9qHYOkydhb1b/sT?=
 =?us-ascii?Q?rCFQTpyWK64=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:id;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8wj8e1F98yMztBV7GVJbf2rLSYM0+NrE1+vLfDIS8v7WX26R1uXFfUUTS9t6?=
 =?us-ascii?Q?CG8l0tkEYAtc/OI3QH5jt18gr69MqCHT2Rj7qWBwpmRCLtuYHDixzevCilsl?=
 =?us-ascii?Q?zKQXvBUH+e8e1aV8dRxFOyCyXPDB7WfMqOVaRZ0XeHd2UJHEOsqC9p4lbh+E?=
 =?us-ascii?Q?VlZ6BM2mfEvVNQbvAnCPr3yz2dpVTt1Nx18rvs/QFmyFTFn1tVRA73UB5l7I?=
 =?us-ascii?Q?pl4lUDoIM4wKr87OT7+R96ajvYg7OqISHF02T3f8YmiogBF/Q7mvp+RPplxo?=
 =?us-ascii?Q?8TL1ZPurbfAVVo7ngFHHjedjKDwpPWEb0D2NInBYNzZw8bkXGeBMmbnGgDXp?=
 =?us-ascii?Q?z0WcWYR7SJLQeyi3Ek1GLjE5p5n3ZIxf7gV+ppSIsOj4+2MDi2umLFkOh7BS?=
 =?us-ascii?Q?tfZZAmZQMDXr+3rKYkkK2nSTjAldqmrT5hgqlv1MqO9RNv1Z+BCoNbs2iV+R?=
 =?us-ascii?Q?08/LchI2NQge/cHqbK8M84adA97Fh49PnI/ysKOE4L4of4j2skHh4du8ZmTr?=
 =?us-ascii?Q?t808fvPyf20tWjrREdxolLyfydA2OFTsKsT19F34KTisycQ+Y706KKzjNsPo?=
 =?us-ascii?Q?01JI03AdnLotuPe3iVJzuma65hsnwAgrq+fWhgTgcPq/5WhTHV2Vi9nf93+m?=
 =?us-ascii?Q?j2vt7eIk0MMVv7m/BYnj2RPCfORvYXf8rtAKlXvoaFNS+Xy4wRoey0LD0Y/p?=
 =?us-ascii?Q?mfswMQQtPHarNz/lg5LdOvjGeWufQAzksgIZVWIGx/o/lpBDNfc1GSJr/wo2?=
 =?us-ascii?Q?v8HUCZPrLF1bJGGtpeRXCv9VXMHf9T6IeNXa60LnErk2e9Kf3Gyk3jjAxox3?=
 =?us-ascii?Q?mOvq/YO5Y9dZrcYPwg2NIO8ngT8beg0c+mfnUN5GlXibcAUkiS2K3nmGH19p?=
 =?us-ascii?Q?akrew3xn+lwJb5zBMk5yxMiGMRDPeIQ66kubibbN4SXxbQ3n4Jv9l0qg9Tl7?=
 =?us-ascii?Q?bTMmbUeIV2ggAIZjtlyRzKIRxWvd98oJG/QqrWOLkDSsVmjMhp5xmlQwoPZf?=
 =?us-ascii?Q?o4JI8luAeGbT5s7tkXNrpzA/wAH1QFDDdSIZffhCt6hqUv3JUKgeb/7segPf?=
 =?us-ascii?Q?tr9e2c8cd75Q1YOlTxezZsSQH73lUaPtchWbhAkaqO1wUBVZx+F72Ue+4hy7?=
 =?us-ascii?Q?L+4uhXTdVpQ/P2grKgMIuijeqv56cdj4iGX9E7ksixam3HGwh9x0xrTmWH7b?=
 =?us-ascii?Q?3S1g0Vz+pqE1IjX45IDxbJgOGy0aPR9CLioIL3sH+CNmjKv2OOo7nRPqDCVB?=
 =?us-ascii?Q?KylNBxChqY2iGOS9v7oVrV9fmSObGTZSIC1EWG4Mt4y8QHNxoqZFNPKioMiC?=
 =?us-ascii?Q?BjUjqJIUQvWQpf6IQ6xUbuKgpu7Kz4mOTTnJcCLS59SEp8QTAL4s/kL502dr?=
 =?us-ascii?Q?j4ijwPik4R7QaqUZsFoddoH5hop1UMM6kb+lx8D1xg74dUHfcuDjFbpivlM7?=
 =?us-ascii?Q?JBSPbIdEXRC7oxthCvHYGo/F+trfc7wwRhvl5jJWMfTLfwlegGxxoYp3QCdK?=
 =?us-ascii?Q?Vwgy1D0G3hO2gwVVqN7XHZCoZ6L5sTvazt65/xvwQ1XhL2iMw+k0D0GRPS8o?=
 =?us-ascii?Q?0tjyYtjic6PeWzokefvCnDaNY6OqktNPGKcM5lMD?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00c7424c-c5bb-4375-d830-08dcd20d04d6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 02:55:34.4641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8D7rO0FnA/IhXgzyiqVEbktmJ0EIS1Iv3GeMbT7sARLCLHxmUsvEt08YzVvnBUZd4j4M4o6IVjmh9PAgu0YPpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4952
X-Proofpoint-ORIG-GUID: nMb_ZNgHrxW3EBe6hrVlcr4sUOmwLeNn
X-Authority-Analysis: v=2.4 cv=PvDBbBM3 c=1 sm=1 tr=0 ts=66e106a8 cx=c_pps a=ynuEE1Gfdg78pLiovR0MAg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=E_kSSbXFy7IY67NIZnoA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: nMb_ZNgHrxW3EBe6hrVlcr4sUOmwLeNn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-10_12,2024-09-09_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409110021
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Sep 2024 02:55:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112237

ChangeLog:
https://github.com/FreeRADIUS/freeradius-server/releases/tag/release_3_2_4
https://github.com/FreeRADIUS/freeradius-server/releases/tag/release_3_2_5

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../freeradius/{freeradius_3.2.3.bb => freeradius_3.2.5.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/freeradius/{freeradius_3.2.3.bb => freeradius_3.2.5.bb} (99%)

diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.3.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.5.bb
similarity index 99%
rename from meta-networking/recipes-connectivity/freeradius/freeradius_3.2.3.bb
rename to meta-networking/recipes-connectivity/freeradius/freeradius_3.2.5.bb
index 8397380c1..ec68c1d92 100644
--- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.3.bb
+++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.5.bb
@@ -39,7 +39,7 @@ SRC_URI = "git://github.com/FreeRADIUS/freeradius-server.git;branch=v3.2.x;lfs=0
 
 raddbdir = "${sysconfdir}/${MLPREFIX}raddb"
 
-SRCREV = "db3d1924d9a2e8d37c43872932621f69cfdbb099"
+SRCREV = "a7acce80f5ba2271d9aeb737a4a91a5bf8317f31"
 
 UPSTREAM_CHECK_GITTAGREGEX = "release_(?P<pver>\d+(\_\d+)+)"
 
-- 
2.25.1


