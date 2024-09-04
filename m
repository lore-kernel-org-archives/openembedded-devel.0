Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93375CA0ED3
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 08:10:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.44983.1725437444853088478
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Sep 2024 01:10:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=99776febe4=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4845OUJH018588
	for <openembedded-devel@lists.openembedded.org>; Wed, 4 Sep 2024 01:10:44 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41edyd09hp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 04 Sep 2024 01:10:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ei/HpipS6g+YaFzRzUXKbe83+myA+O55w2yThxJiiNYRxe4RRSXt5lLYjZTNIFcK8GKIW+tYxAP4uc4rB1c+YBg2SdltNNwF6AvQ1FJuzo1PoOUNNSbIOOKhVOHae8C5D08TYOjvja6xb5fMbewLt1ZmDSZKsjcr0h7wmnDduj7v2RJ6Rd8SfKwllfIOkX5tiDSBPrjMKZf7or2xrF2Fuy73v7NeXJm+KgOh0PSezQd2G7CgEEWMEUSuj6o/jYXuEXWpUfiumaLcERTUpRJbs+jqjPNpOXIZzzO2VpvU12j7DGDo4Pj7FPNEPFKmgSVPDi4dQKTir3PmyzdkxvAtEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lrx9wXo+kubZuhY5JGjzqkeUsjFImeLqABx3aR+M1uM=;
 b=qBiR7vos75NTyNuqhl6+DTnL5f6i81I5p65SFPiuEAGk691aFKPmDgs9ulaueWWp5uW7Ye1giin1SVX2SvH9o9pcQRuFhcD3GCXkMuJ+2HeAqghcSeaSgIVmrEE083J6cZJCEqrT+U/fcJq5IlfPE7//Nd+TZeO4b4FHQIyL+eSjWYD5LZsHsWqXX33n4azjhzHCM6UJMtHD0hKjMlv+RhU7OjLmdeldkryJAcryKBqX/kcfZ555lme35mzghrZkW8oA0FstUXaFrEHKfXjGtQx1I/f1ph9jI6uYnfxRqJobytf6d3LaGQD/DCVd3LeIOJdwEcSxhNfJ6HbLq/RSog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 MW4PR11MB5933.namprd11.prod.outlook.com (2603:10b6:303:16a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Wed, 4 Sep
 2024 08:10:42 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 08:10:42 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] cryptsetup: upgrade 2.7.4 -> 2.7.5
Date: Wed,  4 Sep 2024 16:10:26 +0800
Message-Id: <20240904081026.243214-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0004.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::16)
 To DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|MW4PR11MB5933:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a8b2788-63a0-4a17-8470-08dcccb91200
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?m/l7R3BSrm0ja9I95xwgpSQdE+Vp/Fk1xpV4ErrTK+BLzocBbJgQWqVD41Yl?=
 =?us-ascii?Q?lRj0knxrQMzNUpYh0CJP0sYdrYikSzoAE6kXQcEB3ixkYkI7QNuKsglGwjur?=
 =?us-ascii?Q?F2uI/IQURUMNYWsEUTthTKxqeiWYJWoNRuX0Xt5LMITWUaHDp/xgP/JB1nO4?=
 =?us-ascii?Q?uQlfEcTlMtNdpvBYW9m5ffsV24xQz6vy2mpdOT4GclOV9cSBAFd2ClZimukw?=
 =?us-ascii?Q?qmaQ03BAs64mhPUkMcJhunxSnmlw85TM7atz7SZ6G1ssVdFTRbvst+vKkB/s?=
 =?us-ascii?Q?7YIWinGEk6Y3nR4cxEEFNUk8/K0JLgtiIwrAvl2HbPeZ3dX+tzQBUwUg1w/O?=
 =?us-ascii?Q?ZFJ+DxIm+R0jR8iL6roioPwW4lk5Va+x5vSJk1HQo1yA5sSANxiHg2Bv981i?=
 =?us-ascii?Q?NU0w37QyQti+HGmnxN41tge4wrH8A6XlCI3HOdp/A5d6Co/BNuqDY/9MKH7R?=
 =?us-ascii?Q?5jAkmKV6MYhOGbIX4zuYJwfvl+3EjkNLPOYtSj5Z1NphKB/t7odFR/impgNC?=
 =?us-ascii?Q?4wbxOzeyamMdnJ32XZeHflsg7wfkN40j3k8W6RaFSu1vJq/dnzEycjhpfbtK?=
 =?us-ascii?Q?mdbVELp/AKO4SRk0xxujmIh794YJGEexmVOxpDWZM2HrLirHChNFt/JfrZVQ?=
 =?us-ascii?Q?GMp1ipnA0YgHo31nUq3xAFZDsBcUmsxvNTmKKYFJMHz8FWqI8ulyNUWuVnh0?=
 =?us-ascii?Q?Yxb8hGHXzpJTKaDRWXL9VbLEZ6A6uOq3K15BG90ChD4rD5bz9DD5pr16WacH?=
 =?us-ascii?Q?trIqDinWVYLhibbYRySx/04R74TfweYkIG2CD3E313GB3wwc5tt0Kip9CUNU?=
 =?us-ascii?Q?zqpkcj8ybfhTveTeJ87LCk5/PbqCz/5QZQ7gsXNL5P/nLcL5XSq9swb9YYTf?=
 =?us-ascii?Q?L5Ya218RKxAJMxaxljJrU07W76Um/jezErD1cZuDQR8C7hRfLvq0VRcuSkN5?=
 =?us-ascii?Q?Uq5UZa7DWZumzHzb9G8AXfzloNXenBtTT0AA3k1R7K6BMFlC24JeIErdj8eh?=
 =?us-ascii?Q?/vIj/lp3euZAnLmrt3P5cFCLF4hjvV2OVWW5qcwX9RJf9n+JOlK1y0rZXCq3?=
 =?us-ascii?Q?8sd873dTu8vn7pGCinBHpYBI8Yl+65ew1IXytU6VtUc9ihNLTAfLkmfOKS6k?=
 =?us-ascii?Q?juL9B9DEu8X5T4KuYwrFAEfDuq81xnKm88cDFizbSDphkmMsLO77jV8nLC9x?=
 =?us-ascii?Q?TDFwRP4IO6L23Y61gLxF+QyH1UTwD6F/P77uP8sbZ/UVcTr7PPeofJsZYt9N?=
 =?us-ascii?Q?/vuwj80MDIK9ElzdoLHVy8ljYA/NFuxkin3PDfK0udTk2pzAznWJQs/04OXm?=
 =?us-ascii?Q?FhMcOK7+iPSy/4YSPcEwIzQgqhkgQTQC+qrM03Oix86PN0jBTZwtiCdhjSRM?=
 =?us-ascii?Q?y8s/4vnUqjyLiYTX/DgVbFD5LA3cnFvDJByZaBD5udp+leUMZA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zNFyJ1FJgfAPc11nwHr4CAgX6wYMrlff1w5KgZMg3reg9neHpvxEXKVF+3sl?=
 =?us-ascii?Q?pooHi2bD68LgCJj7BiCIRJdeH3ecCeX/fkoEf4OX3qqZfJTmX1XYLrFpgVwt?=
 =?us-ascii?Q?KHIKctkKfR/mcl28FhH6tguz+1PYSOyX1uG8XIP2wFhj8YWNRAnCS3xwnGY4?=
 =?us-ascii?Q?uo9zrLQqTi4AqKndWyD7Y8qU2/0ZzIQOliDLHUlY7cUHpdoEwZgMSxUzZTHZ?=
 =?us-ascii?Q?4Yo3pAgevqoxvp2d4OR6CW9mZQhd3LnQzfltcvJWDvVCFIpvoWWge1Dv2iLy?=
 =?us-ascii?Q?7/73VgftNa58ewP4thjuKy/NM8LOHv1L6Ig8KmcVDnv6QOumZHachvfklZxi?=
 =?us-ascii?Q?HxIGzxTx1PfTyDLEpcHAHFbmT4mvuVFfimjms6MIrGmcu6gyoCYZyZ92G9c3?=
 =?us-ascii?Q?MloKnJDftX3DLo13S+j5Jo87UffGm/cMe8BVMHeXOyFkbXv38ILiu/F2NPdM?=
 =?us-ascii?Q?eglKKhehlUzaDceUFuFCFjfvPByBCowS2/t26ZHEIdg7v6+zBJ84Jt4zZvRL?=
 =?us-ascii?Q?vL3UFbXuIS/a77tpAcgMe5cOTRGyfF+Fq1LR5mVBlGR0Mn6PcgG/AGPWQ8Q+?=
 =?us-ascii?Q?+PHz6ruq3PI1CJPLOwg2C7OlYcb/J2aIF2VWCGq8jtKRQSra0cngbNoC4phA?=
 =?us-ascii?Q?vHdH3D/nejW8H8HVT610AHFFmTQs63XrflqtQDM8fpNDkX26tLHY6GvkfdTN?=
 =?us-ascii?Q?DJIWTsX+y7JiQEZcYTjhJAm4Bvaq2UDqR/eautTTb/DyNGNgdfZhNuRYk3hc?=
 =?us-ascii?Q?xkJvVEHx5d7mvpH8P7E55+31Legf4jqs+7plgqo0KvWxHvDKDf6FdsYHntFM?=
 =?us-ascii?Q?BgEofMLsoB+APxhEV7+av3Os3qWsisUnEhoqMdj8dok7/qZzHyUWmfQa9uzp?=
 =?us-ascii?Q?ekcu5C2Kv9cq3SRF35VOlJJoGApj195CIx1UvrkxagPpp92WYRXd+z8VDGq4?=
 =?us-ascii?Q?ApkrrxzkAazmjUOkdehMNC0B5ES3shjtG36ibOqcz+ahATt0Nzm3d1vB8DT7?=
 =?us-ascii?Q?LzK4y639bQoD2lP2+gIyW5RKzypPSX7xKCwbDAtyX0fxR6MBKuhK1D5+m9ee?=
 =?us-ascii?Q?4p9TO/cK1UB3QIjUPwebn6PResR9CgrwSyL3PfO9Fa4MlnJIGyluwl4GB44Z?=
 =?us-ascii?Q?dn5FizDI+eIHmroobiqi/sxmeHgsRC0SUoPRWh3d79B47fClTv63wsuZ7r1M?=
 =?us-ascii?Q?FNNOJ2Trp8fezKcJfHyYzQFS0fTD5ZmxTtvQ9Ei+OxAe+zZvlsPxSaYcdJRr?=
 =?us-ascii?Q?xH9Y/QdlQQSaq3WwnkEot4GxREyh3pbLCsfQ7RK30rwBppbKlzWk2Vf/SCyb?=
 =?us-ascii?Q?UjjLfqJZizHYw/6xQaFZEB3+LtY79ApkGIWiQuY4COsxFEbdck6U9KWJki+q?=
 =?us-ascii?Q?nBcZOLOD3Sbn8VW9zlUKL7dySn47IFvooyO2bZNBKwZgCgA+FYtxj7Pc+PD6?=
 =?us-ascii?Q?h8eb969PAjpglDM9ovJXroQXX8lGsPoZzyoVOZt0BblZJ6Q5wSWOyMtFbpxf?=
 =?us-ascii?Q?5e3WKMx6mdhoYzQEdrxe+yUJlou7HMNxhb8ptZbXdtmkdp+i4bv8Uv3ErM+L?=
 =?us-ascii?Q?VWs+hIq5O1/Evw/TIM2BQmnBgoS3ChpRWrDM+m7Z?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a8b2788-63a0-4a17-8470-08dcccb91200
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 08:10:42.5891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nVhqaLpxVNUpeBCb6wuuIH0uE9CsKz6XGQIrgvlBetS4r1z3nfu8Vh5Tpwce7Ykme8BKBx6n8b0nNSTFg6MICg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5933
X-Authority-Analysis: v=2.4 cv=af0zngot c=1 sm=1 tr=0 ts=66d81604 cx=c_pps a=CSNy8/ODUcREoDexjutt+g==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=kp7mXeQ4n6ICpEZK7dAA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: EPEp26O8ixMzxlfsdK3k4TNxQ-6GQlMe
X-Proofpoint-GUID: EPEp26O8ixMzxlfsdK3k4TNxQ-6GQlMe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-04_05,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2409040062
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Sep 2024 08:10:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112090

Release Notes:
https://www.kernel.org/pub/linux/utils/cryptsetup/v2.7/v2.7.5-ReleaseNotes

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../cryptsetup/{cryptsetup_2.7.4.bb => cryptsetup_2.7.5.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_2.7.4.bb => cryptsetup_2.7.5.bb} (98%)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.4.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.5.bb
similarity index 98%
rename from meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.4.bb
rename to meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.5.bb
index a57d79d6f..54b47ea3f 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.4.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.5.bb
@@ -20,7 +20,7 @@ DEPENDS:append:libc-musl = " argp-standalone"
 LDFLAGS:append:libc-musl = " -largp"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "dce29903a58f7b774fe61191e7e6de955de0f40d9e27b0028ffcf3438c0e9480"
+SRC_URI[sha256sum] = "d2be4395b8f503b0ebf4b2d81db90c35a97050a358ee21fe62a0dfb66e5d5522"
 
 inherit autotools gettext pkgconfig
 
-- 
2.25.1


