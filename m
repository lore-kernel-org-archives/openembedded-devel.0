Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4BDFCD37B5
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 10:50:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47174.1778496641032914337
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 May 2026 03:50:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=E28v1umy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=95919e6e32=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B5U2Fd3062461
	for <openembedded-devel@lists.openembedded.org>; Mon, 11 May 2026 10:50:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=NmWolN0k2K+smuFV7ddx
	QKGC650B1pThRaHu+UHAmCw=; b=E28v1umy+iV/nbhnpaEA5rRo+5ICIczSvCtf
	pf44HW5LQwPHngMV9Uxn1nyxu7xYBWQyhJs8FsCWRDdmr7FqpCjo+r+Ny0aGgqzI
	3xNDYsJWGtBYmSL5Gr+RIRjt8rkC2xU17RqJDZZ/ZpraCIZf6i+kqw/JclZvWKzt
	YVHmvOu19NdwLK2nd12vZnjlID+wEJzpveZMWKZIWUJa52SBsHAM9z9j5aBjurvX
	1t/ELztWSmD6PuIBF9EQOnMEQXGeSrAXN9JuHVr7zI0v9Cjy8YkCP6KpikTdDOZU
	ytOrBFn2+keedaAZufaB8lkevLJKwFfi5p78Fp/y7hQMRxBGSA==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010053.outbound.protection.outlook.com [52.101.56.53])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e1uw6hvva-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 11 May 2026 10:50:39 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PosPO+3kaDwcKDnArMRiZ4a9W7zfu9CNVOJoOxyORREMU+vIkvUZMq5n/YjKxhmfXI3RQjP8wVRUeZ7/g9uQpuix0dI6oa8bpx6Epv5iz+/IxvI8p/qEaImJCgwITrVWAuqpPtTV32pw5YYxZ0C0nE8VR6YKT4KdGIZbA7LC7JfwnhAptvU/6FRSzl8b4+G7pZ4s9mmh/b671xY4NCQU+cSC4vZhas2Avoh059MdMe1CNfQ/3ppIr4xL71rvD3nIdDXEeCSuRCt+1iSpgqEgtt7Sh7bdxOgGuEpdoRpkewi4hssEpVNUHGHlMZO9u8Z9e/1oR8olbtR+mmlXVYXvlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NmWolN0k2K+smuFV7ddxQKGC650B1pThRaHu+UHAmCw=;
 b=oZEI00MTxCSlXlDuuBJku4ZGKSMKNPoCbdK9EBTEItM/F4Qco1TxT3AEK97VemPAjtQvKklHGCNzsEfzNdYPPBnfp2hn6XBThZYDJX2kKiOJvn/+XUTBWYWEzgaWSTAXs/p4woFTIzzU4jALXao/TRRj9OTl22t4v4byaQT3t4zRsrOmj5QgADkTsXY6Dye/9p/JD69LC/3PaSZt0RC7GEQbxktcbEgavgvBHqnW/2ctbJFDF80NUIfZ6kP+AGjNIA9209hGGdAyct60rCDVdzQMWBjg0r0YAvK5cOUZQZzXOEGRzCE3mM9VdhRwqg+BoOhL8Gm3YHQw7W60sCoRag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 BL1PR11MB5954.namprd11.prod.outlook.com (2603:10b6:208:385::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.18; Mon, 11 May
 2026 10:50:37 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%4]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 10:50:37 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] jemalloc: upgrade 5.3.0 -> 5.3.1
Date: Mon, 11 May 2026 18:50:22 +0800
Message-Id: <20260511105022.4148673-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0120.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c9::7) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|BL1PR11MB5954:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b2ea0f1-20e8-4d5f-34d0-08deaf4b22b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014|56012099003|18002099003|3023799003;
X-Microsoft-Antispam-Message-Info: 
	/URwOXh041TzOzYEFzOUiRsT4wYapx+9oatdKw6uNKXt3uoqD03x+kx7BnVRv8aQB3kL+LWpwM/EUYXwEAh+annCen/2yVZ2ouxTEaOp9KN7uKgfvKkC9lYARn4GkNQks2ElINYJJKEMVgNb81ZSz1BCKjgtvDF4TMDdQHFgG2WXZMvWzaz33iiZW4X4W3rgewA5C0Hp2CFi5npjPzuIdnQTMMmpFmwfAFpc0+osv/htgCeTzbTFIja/Wjg05IGwr/1RG00pdmxWnE401g0nUDofcpEPKtjm7Xn+dbvf1hoHI7IDamUj8FO0oG/qOMZ+6QfgkEVorECGXxHUWMTDAJH7trixz8OSBoCzI0hbj9QMZaD/mYXVgD3D0eIbWUU1FiBnlRj4/FBB/Xx+4Ya2J6R7L/vzoY/ZabqHBBd7Ckxs9Kj/WczHTiNZ2MgjJz2dcdHW+JGLZitq3x7f2GjgOKQeyNCQc9hbXTyg7CnXO0wXaDFIbPLHo9yCzk67RcviBQrEdVON1v5epOEQvEYRQwBbVrhWnRIO+IPjkOmmoW5s9REaLw6EyBPsM+zxbhmu+i3tVh3yFhAbM/8n/oMslZomrP5A8kH/d0yEojLvU2SfpZqVqShEEtkc+rcOVMAO0eCBT9w61Xq/JpAn3YC04UrpHRkE4h/wp+ntcqLkpgTGl0eJJF5l3Ksz6C68KNEI9qift5+YVM8LU9eo2bcE0hq3BObQVs5SvAv6nZ0RKbGjyTDBEBo8Uf/reaGSy7rb
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014)(56012099003)(18002099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?I+e7X8Mzb48rllY/99hx5x3tsbcpDsBf4j8aXmQh/OSr6IMA41Ps3wdTalZA?=
 =?us-ascii?Q?PmF3eu9zCdWAsuanNz/ojCTO7lD3SMfiW/pDcWDA+uIiBGZEvEDYbVK13HKS?=
 =?us-ascii?Q?ZJ/Gb/T6H16Bv95hP14Lyguza3ewaqratef5fo2rxc2XWgBVT/6qP8aPGuDb?=
 =?us-ascii?Q?rLVYJGK9eoMX6R1od9/r66BLW1tTtdru0oLJ6qlpzg1NnkvV5Pv3mP5CV5mC?=
 =?us-ascii?Q?Oh7EkFgHBfm5pwT/gYtNUGF+vMm8LR4pQ2YmameL1wyXMXetB45g0XeSeDob?=
 =?us-ascii?Q?MYICwd2r3mQcRcCfPYHKfVO8Z9wIKJC0tplzGaInag2TU+PWe0VwXxmmSSFd?=
 =?us-ascii?Q?UvlLTrtlM2TkYs++xkxJyFvAeknq5wpepHdkCqhyLRojWDLIOxoohI8Dh9gh?=
 =?us-ascii?Q?e8LEPVu9ViWACe/Ox1XMjOTIEi8ewveCCa29JoN6P2ZcfEm6YjKAJIv7MscN?=
 =?us-ascii?Q?nTgBfmbfpS8ghnxAGwBbSzRxr+62FBZ0fMIPc9Bgm7Dm8FVNb/UJHvGgVo2W?=
 =?us-ascii?Q?p0bSbDZn7DtaF8hWiZ9FtSpWADirhFmm+VKorDhKEO6q3iPLrEbs4U75QYyp?=
 =?us-ascii?Q?YvqfUeO256AMb+0qs+m715OoA/E2esezQdFEUjkt6FH2F0SArXIPzhI52Awa?=
 =?us-ascii?Q?KRv/4+JESg5+l2hDa6gqk9+pkHdFTV/mZLavf/Wktf0qBe/hmerKOR7HdVVv?=
 =?us-ascii?Q?6UhEOrR3jRfRnWero1j705s/36n8h9SpIHp5/lmBRcPFSZhaS7/5h1MQTWF4?=
 =?us-ascii?Q?AdKde+1PVSN1xVhUssJHEMSoTwzsP+44ALoDMoDgnQYqJZuVjz4qGqlRh9GC?=
 =?us-ascii?Q?qhPvZETGKerc1nKwhX9ngrsoZ5D2AQw9lfKHg3XNjvFycTOo2JoP0eL6jDD3?=
 =?us-ascii?Q?0aEmRoS1yJ8x/CxgJdU3GppNadAk6QeIJOX5eQPa+PC+WtP3CcKcjEybMV5V?=
 =?us-ascii?Q?x6mkxxCjwFv/OQrdHGK1Y6ZCecooCF5CL3pu8UkcwHt24c91Vntp24sFLx/G?=
 =?us-ascii?Q?ZKsit2/s+8u//zKQMWD2KvIwYgdeUAhz/bfGqqwDX+PmE9iU90whAKLkTtFc?=
 =?us-ascii?Q?p2HgNo3YV7PjRiRntwtp6Af81VM406XeJKcHAxAKwBBrnblGXovKuhVMle2I?=
 =?us-ascii?Q?8ujBg5lQm5vh+OgkxTkJr1PzhhVccv596+CyK4kdumqHHrZCWgyx2Z/wbM95?=
 =?us-ascii?Q?l1V79c46RTLzduJREGWMdD0vijBllsYlvJlAcf79niMVNK5D4Tvn/BPkJ0z3?=
 =?us-ascii?Q?PHF2J4lR8PyMkpooC1l5x8oK5Kst2elG66JQVdoCTM/La5HAzoQb++HNDXLh?=
 =?us-ascii?Q?U3frymWdUFZJ3WVZsYKns+4heQd35nvyWO79iT/0XYMRwawT+T3mtLLVGpzP?=
 =?us-ascii?Q?Lk9Mb0Nf8dihFEqkEZrJARxpLr0DcP/BA0oO3HyunTpKx/RVrOeG/9tpvXlK?=
 =?us-ascii?Q?j/4GUh0GDfmvRQOG5NuPVXiVuMxa/r0OGDTxU43MWiWD2H9GYfG0AzrmvEoD?=
 =?us-ascii?Q?pIxsexvTbcTPiLt12HWbEB6E4S9MzUs+6Aidfl/a/64KWexDc/NoZJRHFBKf?=
 =?us-ascii?Q?4TsbHzbbKBxk73YqmboVSKLeoKWaTXL3BwLBASBJOdPd/00bLyXMh5Znfh8c?=
 =?us-ascii?Q?ODd4nb/OQPzJsGZW9CrydyCqZcOqVCNty8HHN2OctW/CwasV3D3mg9wOWg1G?=
 =?us-ascii?Q?kACanb+aCQ+DgHzOrYWYIIAoAJ2OnhWCfFbcp4oNVEs6eQf5zgbkXVB6TAu6?=
 =?us-ascii?Q?ZXc6fQxMFw=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	a2xjLmI3IGgEyp4nNmVo7P5S3AoBjM4/NM8juAFGt/q/edH4KKmxbDaQPwmoSCOscAkbUVXrP/rzPu9eaMjanVD1mrlLyIF/fN/m6mP5xTTnfAbdp7MD37DYf3hEsWV2l3Ma7lpOD4eH8ies+xM8NtifD8ksA4ShmeFern39ZhNYK7Sg/aIu89JNaNr9Bfn3kCJKBCxHJbU937BT3fWEVz6Re1ieUDPMGen/IF0033Ktdjg+PgC9IVrYzwS627UoXh5UNNbm31w5jubEVA4yjGmTKgJ35R/Axgyk1KFmu/kgbmxlUI1Xkn+Zjv6Xtw2cLos7QTF3mHWPzCF48wWpCA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b2ea0f1-20e8-4d5f-34d0-08deaf4b22b9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 10:50:37.5879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /JP1dEuUQl02cUQxJwHgy7jQBFysQ3ta7zTXArkfesGo84s2Pq+Pij7nFNv1yC3sHm9ugUOvCqEkGXa/Z+yXvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5954
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDExOSBTYWx0ZWRfX7roT3x9wkCuj
 jPjnbC249IfzBGXaUrskAO53nktIX5ukZMbTA13bedU+sfAIpM066mdzCIeOcGhzS3iiANeE4W6
 vd9dH9pO1zPgD6OssxwYTw+mXQvLFZNo42h+DhHK3xqO+x7NTV1j7g2PGeJ17bdB21+Zc23tpdW
 f3WJ1XqhWigp/SKWoS7EIY2impsS2/ml3CIH6Y0ZXyYwKEbsyjOKFtKd73LMtjfSlSVbjwYWrjY
 KpL17hOta57JsTzr4ZlCe2VqxioG1YCLjcO9jzf/768o8su/TXSmUsz4Yys88qYWXuhRQ5JYHF5
 nN2yLiEH+JCMOIWfZPdpbG0rRq050L8mHa5mP46agG9mIn4e0nHtJS2Il4J/Ov0AhKao39YMRmT
 Oq3KsNIKH2G8JkgdZFZLur88BB/z28F24rilGLlpDM/FnwrGyZmrAV6rXir3d97z3yDj9arudPI
 EM1Ok/YovFoYq6MlnTw==
X-Authority-Analysis: v=2.4 cv=d6nFDxjE c=1 sm=1 tr=0 ts=6a01b47f cx=c_pps
 a=PQms4psfS+nBHIg3Mxsk7g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=vMG9LKhgAAAA:20
 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=E74jMpV7rmDprupyKIAA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: e10EMlA9jzV2UxaIYXOYPqN1ez6ZhHRo
X-Proofpoint-ORIG-GUID: e10EMlA9jzV2UxaIYXOYPqN1ez6ZhHRo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605110119
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 May 2026 10:50:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126845

ChangeLog:
https://github.com/jemalloc/jemalloc/releases/tag/5.3.1

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../jemalloc/{jemalloc_5.3.0.bb => jemalloc_5.3.1.bb}     | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-devtools/jemalloc/{jemalloc_5.3.0.bb => jemalloc_5.3.1.bb} (93%)

diff --git a/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb b/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.1.bb
similarity index 93%
rename from meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb
rename to meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.1.bb
index edaaea26b6..ddcaa1c351 100644
--- a/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb
+++ b/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.1.bb
@@ -13,13 +13,11 @@ SECTION = "libs"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=ea061f8731d5e6a5761dfad951ef5f5f"
 
-SRC_URI = "git://github.com/jemalloc/jemalloc.git;branch=dev;protocol=https \
+SRC_URI = "git://github.com/jemalloc/jemalloc.git;branch=dev;protocol=https;tag=${PV} \
            file://run-ptest \
            "
-SRCREV = "630434bb0ac619f7beec927569782d924c459385"
-PV_LONG := "${PV}-171-g${SRCREV}"
-PV .= "+git"
-
+SRCREV = "81034ce1f1373e37dc865038e1bc8eeecf559ce8"
+PV_LONG := "${PV}-0-g${SRCREV}"
 
 inherit autotools ptest
 
-- 
2.34.1


