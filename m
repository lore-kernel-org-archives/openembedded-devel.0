Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 820C0D49208
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 10:08:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.37746.1731924493013089477
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Nov 2024 02:08:13 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1052757483=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AI8oIDo032222
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 10:08:12 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2043.outbound.protection.outlook.com [104.47.73.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42xjc89kee-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 10:08:11 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B4MfMPLv25MV2XzMjCH3xcSPSHf2WxAYU8KS6jAh1WNFj6iJlEF7XuUFRtQtb/nZm7TS1i75C6yL9H/2osMxEz/iezLTs0XTFQdtMQKneADZUb3ZRHCe3iDNMSu2aDgA6sA5GC1yI+epcsPhPJoDniMfWzF2mujVMAyNq9xVV2djL2TPdpIIsA+BElWjBcjK6Kw5DaYaLmv9e6Gv/ol8D/FaouhgHYNK9VOYsiOxb4M1nJz3UyteFaPYuOpIpJNFw63JnBLDKNfvDdBvbzCgRRLIuto/C11OXth3F75iKiAXlr9aYNNmBfuTgqhd/tBJp4VftqDH8KIh1japfcWeig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7+1PT6uIxH5ptj81s9eNgGgI5ZZZuW1g+lqS6VcMEMM=;
 b=TvLcRyMAcbi8dd1K5RWSOwfggX64OqNH3+ZFMmJpYzcSr+OXVkGQLgukwpeYZS7bpfVSUBi7XXsDhBZt4xiPWLj4AbZrTnhfDWAXrxcnPecgHj/RUc45jP1mHQPge9IIilVSLcKYqbjrjyG7dOfuFamu473C0gJJleeF/f4QJTzQdDtTbkj8V9E8Wvw+qPOZmoww3H5/FzHaUh5LdAdYh4/SzRMoY9hwxi9X4mKOOS88EBDuKnw1XfuV7U/DWYVYH6vJV+lfZUSJ/z9lyRZsF15AeuFPXrRcYi4QLHuDALbwqeh7HuRqp8SZZdFZvd/ob1ZULPDcwvUcKU+p+meTOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by CH3PR11MB8413.namprd11.prod.outlook.com (2603:10b6:610:170::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Mon, 18 Nov
 2024 10:08:07 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%4]) with mapi id 15.20.8158.021; Mon, 18 Nov 2024
 10:08:07 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH] frr: fix multiple CVEs
Date: Mon, 18 Nov 2024 18:03:14 +0800
Message-Id: <20241118100314.4112226-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0022.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::34)
 To CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|CH3PR11MB8413:EE_
X-MS-Office365-Filtering-Correlation-Id: 05950c29-d22b-4826-449e-08dd07b83e1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?4Za8+aXS9YZxpISMy+K3CbWaxZ1zTwpnsZqd45eycEO2P6AebrV4Esl8nP+L?=
 =?us-ascii?Q?eZ0EGynhmeQH4BNePnRnADOHK1lqKI+Fcefmp03ihsjP20OeAPQvxkWoYSws?=
 =?us-ascii?Q?VV60AwsTivUqaGz0stVKHY2vCW/TxnQlBT3b5GvPlyfjpUfK+CyQxeG1Su6/?=
 =?us-ascii?Q?DDlT1equQVnH+t7UPvbM4gvI0TVZIQjcMGd1mh+lfChESpq5OiTdqujcTAHT?=
 =?us-ascii?Q?1EtCIzjIFk7Qanuy3onTvyGVvWimn8zhKnS7MBLNRtIywyt3twkV4LGVsDKa?=
 =?us-ascii?Q?hpDCZrPRQbEmiuq93unLD8DuFEFzWI4bpn0QBXBs/I+Vv4t6xpQXuolZPVyc?=
 =?us-ascii?Q?B+mMb+cAnHsoLs8lbDD+WFL9Hhc7MJTeN3g6GRqW7W4fVJMVN3xIotbHuQIY?=
 =?us-ascii?Q?rsQbfB22OLIe4/bfkonfDMctRDVU9Y0BaiQCTihTjT8BFfumjWkieRBTis/Y?=
 =?us-ascii?Q?s1Ax/4tgxKZEw8N4TZvNpck3wmQfKjbTZx07q+STX6RDJs43/6b+9m/Xef8e?=
 =?us-ascii?Q?tnUQAyDAJPoxDhzSzLcmGrU37hcnyk43Iru9HtAgX1sWchk3T/Y5vBRxKFv/?=
 =?us-ascii?Q?IgHv3SvWHvsl0C0uAJkXP4Q6lJz+pFuZeceOyyDO0SXNiPDDGWmOmaa5vtP4?=
 =?us-ascii?Q?FMOQcl9hCkgaHdy6DyRmUYqonl8kqtqLl1rjq0qp25+LUTLELoXVUt72Or5J?=
 =?us-ascii?Q?10737VmtLpZ1m0UL5UbM5iLAXLpE9xfN3oWjpEyu2xmSmCG1o3uGw5fCREf/?=
 =?us-ascii?Q?kDMMDd/f8JyJL0N9P9K1PjBionyxZLeMDQ2fH7r7g3pBWlu2QDzYJluYRB0W?=
 =?us-ascii?Q?TYO6K4OAl0GhwC3W5i4aiEJyjTBK5JdpS9Pzze6kcQ1ux++O+zo1j9mtxHgK?=
 =?us-ascii?Q?EMv382tDdSV4sqYDbgx6shMBoziv6Wc5jEaKthhcQx7GXt/7m69bymE1J8VT?=
 =?us-ascii?Q?/itX4GaRQmOXJT7RCt/I4dQfmZhbeU3tLKvw/megxXpqQV4kkzh2dHKQCWgo?=
 =?us-ascii?Q?TIoPPT1oa1+176vCGCSRVuzYSw6nntdkC8S82dvgCu+bcmx2BEH+aOGLv3RN?=
 =?us-ascii?Q?b/RobFe4gqTl+YtgVckAR7aWpu4eYN63/ZelDoEX/M0IWiOwptz3UBija6ll?=
 =?us-ascii?Q?F6F9xjBGbdxx3b+yT/XgG7tnGW1xW6WWPBYV2bgMRqcYCaGJ0p/JamSFg1RG?=
 =?us-ascii?Q?rmAAyP6xL20vTVZDEA99aNatjKeYJaa7Lf5YnmaZCXxW11lPT4oit2RCRUqT?=
 =?us-ascii?Q?Qp26G+j3YOVfOnyfUIhAYgBWVBYzSWHRM2lDsSLTyAAWijOLSYmVIPfUYwUr?=
 =?us-ascii?Q?JPmLdFqQXdNECQNs03fsAApMLjqxtCeVhPIHJjH9it2a3Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?28GyMJT8DwaK0lAM13ey7sDf9kVHTLv6wK/WVkBBLKKSI96WDXXpUJ4Xis8x?=
 =?us-ascii?Q?Iub7Sg6azWW8FtKp8WDPFKndKJOdAwLtO7h2kHCEOY1XAFrFoNAml3EHEZQH?=
 =?us-ascii?Q?EGl0IMV11FbaC0U8aWS/XyWg4+7ZohIc9cCbcN7BfF8MrEJDb3PdNOf6Oqlh?=
 =?us-ascii?Q?cmMxTxtZ0Q0/xfNdSBuovQo/Zjjqq1pdbcygk4v85d8Rz0+iXvh8QchjgVyI?=
 =?us-ascii?Q?RoVsM4LJd06QhhZQJUigdldgGGJfkFE1J9e/EclOmWtbvWYxG+0gcrKtiRgt?=
 =?us-ascii?Q?w05B5Nm96kvbjwfJuWM3t0oCveroEQ/ves26WfDJmKZNcEohrJzrnVCuVeQe?=
 =?us-ascii?Q?rQzwuV3h9/QaZqcPumgxrIGHDN2T4hzMLF0Nyj1i5RK9MO7d+7NiYIvDxvKZ?=
 =?us-ascii?Q?uglif7JmkkVM/qFK0pfsM0ISn4xzVxb8rQ2riDvS3nyrmDID1+m3i+g205ez?=
 =?us-ascii?Q?cEyEyvoTCyP7GhHQwBZRvrypVew54lZqNQOPeI4xjj6Ls0Z/b3uNCpNrNc3J?=
 =?us-ascii?Q?+/X+iJkCoerI7UzW50hRV7KHMHYniTiuPHZ3otriopvwODgDlSWbwq0mPW2J?=
 =?us-ascii?Q?kT8xmT2F3gUL8gwfxgS4xKtQQaRuF8YrxtwW1bLHd738fRtgsW1uyhmzU5IL?=
 =?us-ascii?Q?q+hhTbCfz2rLyHA+cGuHFA1ca8iOKNOI7oelXaQ0lktF+7dbLtiDVXIULYxC?=
 =?us-ascii?Q?jycCS2ur833UCUSCkF13QkvggtmF41j4FXaDHF10gQm6cZ80VF8PLLtf3/Og?=
 =?us-ascii?Q?A0jZBa9kDRzenJtkdsnZaqgk5nbskm8Zn/vGtTRFVrVLnaECqYZdfYzaY3Re?=
 =?us-ascii?Q?dJO2wZK4Ar/frT0QcPie5akdsBIAxAS9CG7NUcdU3wn7fBAYrEUb4eK2nSaS?=
 =?us-ascii?Q?TpvRsGnvKuWeOGgK2EnII6wI7t0piOpeHw7p/14v0uN7rwQ59tHImqdvHrQN?=
 =?us-ascii?Q?uwMy4Skn8uoIxqVbrpxJitlE61drK2nVP2Ah2hqf5qkJn/7TOzlsXxLXdIub?=
 =?us-ascii?Q?u2dwqQkuOUCHdnPe8PfcOHK8CblpoYZT8k9YlifOH1Or10WXof1kicegxbqQ?=
 =?us-ascii?Q?jFVfODOx+NqfV62qx3ZIIge3xPUlFXHswfYU8+oB1PkN8n7Dgou0/9UdVFPr?=
 =?us-ascii?Q?pj0ArhnzLkZaJL6QlithFl4QdTi+BbQcM0i57nRjQ9oeILRLwXwqiHJkQ3RO?=
 =?us-ascii?Q?xj3DUmvDTSMV2Dsa7hRMHMPUV40mVZnJkGm9fkMXLRYNEx54pTSj2FSphKym?=
 =?us-ascii?Q?1nYCupeR+aF+oZrOqC5IfSbJ2bIXnk6Gm2euaYbUUdbLJl7f10beVCRZPM5G?=
 =?us-ascii?Q?Mq5xESQxGRYp+0FWhxvuxr/uRHmaIv4AtBALTDUDlBwyaZB2zQsZ/7hq6Nh9?=
 =?us-ascii?Q?shLg4xa8WQF8zUpzDN8sy2Zfhz7ecPjVXDWYnOiBmWHRlzVrr29SxNogWT5i?=
 =?us-ascii?Q?aT+WeWL8CoOBGIVlMbh/KCUJuIas69hXkgDF9SQO5N9S6yVuWIHW3Sb2PmF/?=
 =?us-ascii?Q?scbo4rny8kylGxkagGvZ7JJvEeBm8e8Y4d1NJgSlLG/JJh4VGPeercgdbff2?=
 =?us-ascii?Q?Gz0eG22QvHlT9Jiui05stLiOv1Bsnxu0u63ZXioVKctR8N5pgU6Ubi2K8sER?=
 =?us-ascii?Q?oA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05950c29-d22b-4826-449e-08dd07b83e1c
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2024 10:08:07.3407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nJjwo5ImN0Th6dypQcFfHfWBvLsRLyyEzNk24Ns/RMXbFoXm5WHhanO8eOjwerd8gmiyKAuWiCyDngThc+O6LtbB3Sv8Jxcnmv38Iwmp+mw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8413
X-Proofpoint-GUID: G0t9sB9fySyUPbK2ekFQB8ULt-K2mAaG
X-Authority-Analysis: v=2.4 cv=R6hRGsRX c=1 sm=1 tr=0 ts=673b120b cx=c_pps a=YmitjTGdGiwdiEq1Q8pHfg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=PYnjg3YJAAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=z9tbli-vAAAA:8 a=87jn28RfAAAA:8 a=vggBfdFIAAAA:8 a=7olw6K49gnoqfw3JEuYA:9 a=LnZS2dfEeVnTxKez:21 a=FdTzh2GWekK77mhwV6Dw:22 a=RmrFvp9qXTL7MAzcxlte:22 a=aVDrfO6s1PESLM1EhDzk:22
X-Proofpoint-ORIG-GUID: G0t9sB9fySyUPbK2ekFQB8ULt-K2mAaG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-18_06,2024-11-14_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 mlxscore=0 malwarescore=0 adultscore=0 spamscore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2411180084
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 10:08:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113900

From: Zhang Peng <peng.zhang1.cn@windriver.com>

CVE-2024-27913:
ospf_te_parse_te in ospfd/ospf_te.c in FRRouting (FRR) through 9.1
allows remote attackers to cause a denial of service (ospfd daemon
 crash) via a malformed OSPF LSA packet, because of an attempted
access to a missing attribute field.

CVE-2024-34088:
In FRRouting (FRR) through 9.1, it is possible for the get_edge()
function in ospf_te.c in the OSPF daemon to return a NULL pointer.
In cases where calling functions do not handle the returned NULL
value, the OSPF daemon crashes, leading to denial of service.

CVE-2024-31950:
In FRRouting (FRR) through 9.1, there can be a buffer overflow and
daemon crash in ospf_te_parse_ri for OSPF LSA packets during an attempt
to read Segment Routing subTLVs (their size is not validated).

CVE-2024-31951:
In the Opaque LSA Extended Link parser in FRRouting (FRR) through 9.1,
there can be a buffer overflow and daemon crash in
ospf_te_parse_ext_link for OSPF LSA packets during an attempt to read
Segment Routing Adjacency SID subTLVs (lengths are not validated).

CVE-2024-31948:
In FRRouting (FRR) through 9.1, an attacker using a malformed Prefix SID
attribute in a BGP UPDATE packet can cause the bgpd daemon to crash.

Reference:
[https://nvd.nist.gov/vuln/detail/CVE-2024-27913]
[https://nvd.nist.gov/vuln/detail/CVE-2024-34088]
[https://nvd.nist.gov/vuln/detail/CVE-2024-31951]
[https://nvd.nist.gov/vuln/detail/CVE-2024-31950]
[https://nvd.nist.gov/vuln/detail/CVE-2024-31948]

Upstream patches:
[https://github.com/FRRouting/frr/commit/a73e66d07329d721f26f3f336f7735de420b0183]
[https://github.com/FRRouting/frr/commit/8c177d69e32b91b45bda5fc5da6511fa03dc11ca]
[https://github.com/FRRouting/frr/commit/5557a289acdaeec8cc63ffc97b5c2abf6dee7b3a]
[https://github.com/FRRouting/frr/commit/f69d1313b19047d3d83fc2b36a518355b861dfc4]
[https://github.com/FRRouting/frr/commit/babb23b74855e23c987a63f8256d24e28c044d07]
[https://github.com/FRRouting/frr/commit/ba6a8f1a31e1a88df2de69ea46068e8bd9b97138]

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../frr/frr/CVE-2024-27913.patch              |  43 ++++++
 .../frr/frr/CVE-2024-31948.patch              | 130 ++++++++++++++++++
 .../frr/frr/CVE-2024-31950.patch              |  69 ++++++++++
 .../frr/frr/CVE-2024-31951.patch              | 111 +++++++++++++++
 .../frr/frr/CVE-2024-34088.patch              |  84 +++++++++++
 .../recipes-protocols/frr/frr_8.2.2.bb        |   7 +-
 6 files changed, 443 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2024-27913.patch
 create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2024-31948.patch
 create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2024-31950.patch
 create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2024-31951.patch
 create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2024-34088.patch

diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2024-27913.patch b/meta-networking/recipes-protocols/frr/frr/CVE-2024-27913.patch
new file mode 100644
index 0000000000..401fcf585e
--- /dev/null
+++ b/meta-networking/recipes-protocols/frr/frr/CVE-2024-27913.patch
@@ -0,0 +1,43 @@
+From d2dda70be42402e0d456e1ead4035e196253f77f Mon Sep 17 00:00:00 2001
+From: Olivier Dugeon <olivier.dugeon@orange.com>
+Date: Mon, 26 Feb 2024 10:40:34 +0100
+Subject: [PATCH] ospfd: Solved crash in OSPF TE parsing
+
+Iggy Frankovic discovered an ospfd crash when perfomring fuzzing of OSPF LSA
+packets. The crash occurs in ospf_te_parse_te() function when attemping to
+create corresponding egde from TE Link parameters. If there is no local
+address, an edge is created but without any attributes. During parsing, the
+function try to access to this attribute fields which has not been created
+causing an ospfd crash.
+
+The patch simply check if the te parser has found a valid local address. If not
+found, we stop the parser which avoid the crash.
+
+Signed-off-by: Olivier Dugeon <olivier.dugeon@orange.com>
+
+CVE: CVE-2024-27913
+Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/a73e66d07329d721f26f3f336f7735de420b0183]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ ospfd/ospf_te.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/ospfd/ospf_te.c b/ospfd/ospf_te.c
+index 999bc49d9..5af006e54 100644
+--- a/ospfd/ospf_te.c
++++ b/ospfd/ospf_te.c
+@@ -2276,6 +2276,10 @@ static int ospf_te_parse_te(struct ls_ted *ted, struct ospf_lsa *lsa)
+ 	}
+ 
+ 	/* Get corresponding Edge from Link State Data Base */
++	if (IPV4_NET0(attr.standard.local.s_addr) && !attr.standard.local_id) {
++		ote_debug("  |- Found no TE Link local address/ID. Abort!");
++		return -1;
++	}
+ 	edge = get_edge(ted, attr.adv, attr.standard.local);
+ 	old = edge->attributes;
+ 
+-- 
+2.35.5
+
diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2024-31948.patch b/meta-networking/recipes-protocols/frr/frr/CVE-2024-31948.patch
new file mode 100644
index 0000000000..ef1d4829cf
--- /dev/null
+++ b/meta-networking/recipes-protocols/frr/frr/CVE-2024-31948.patch
@@ -0,0 +1,130 @@
+From 2bbcfeb311533ddcebb0d25a9acb4675324ab03f Mon Sep 17 00:00:00 2001
+From: Donatas Abraitis <donatas@opensourcerouting.org>
+Date: Wed, 27 Mar 2024 18:42:56 +0200
+Subject: [PATCH 1/2] bgpd: Fix error handling when receiving BGP Prefix SID
+ attribute
+
+Without this patch, we always set the BGP Prefix SID attribute flag without
+checking if it's malformed or not. RFC8669 says that this attribute MUST be discarded.
+
+Also, this fixes the bgpd crash when a malformed Prefix SID attribute is received,
+with malformed transitive flags and/or TLVs.
+
+Reported-by: Iggy Frankovic <iggyfran@amazon.com>
+Signed-off-by: Donatas Abraitis <donatas@opensourcerouting.org>
+
+CVE: CVE-2024-31948
+Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/ba6a8f1a31e1a88df2de69ea46068e8bd9b97138]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com> 
+---
+ bgpd/bgp_attr.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/bgpd/bgp_attr.c b/bgpd/bgp_attr.c
+index ef45d5c46..236def2da 100644
+--- a/bgpd/bgp_attr.c
++++ b/bgpd/bgp_attr.c
+@@ -1294,6 +1294,7 @@ bgp_attr_malformed(struct bgp_attr_parser_args *args, uint8_t subcode,
+ 	case BGP_ATTR_AS4_AGGREGATOR:
+ 	case BGP_ATTR_AGGREGATOR:
+ 	case BGP_ATTR_ATOMIC_AGGREGATE:
++	case BGP_ATTR_PREFIX_SID:
+ 		return BGP_ATTR_PARSE_PROCEED;
+ 
+ 	/* Core attributes, particularly ones which may influence route
+@@ -2892,8 +2893,6 @@ bgp_attr_parse_ret_t bgp_attr_prefix_sid(struct bgp_attr_parser_args *args)
+ 	struct attr *const attr = args->attr;
+ 	bgp_attr_parse_ret_t ret;
+ 
+-	attr->flag |= ATTR_FLAG_BIT(BGP_ATTR_PREFIX_SID);
+-
+ 	uint8_t type;
+ 	uint16_t length;
+ 	size_t headersz = sizeof(type) + sizeof(length);
+@@ -2943,6 +2942,8 @@ bgp_attr_parse_ret_t bgp_attr_prefix_sid(struct bgp_attr_parser_args *args)
+ 		}
+ 	}
+ 
++	SET_FLAG(attr->flag, ATTR_FLAG_BIT(BGP_ATTR_PREFIX_SID));
++
+ 	return BGP_ATTR_PARSE_PROCEED;
+ }
+ 
+-- 
+2.35.5
+
+From 752612019f22277c387c5711305891d0b713e6c4 Mon Sep 17 00:00:00 2001
+From: Donatas Abraitis <donatas@opensourcerouting.org>
+Date: Wed, 27 Mar 2024 19:08:38 +0200
+Subject: [PATCH 2/2] bgpd: Prevent from one more CVE triggering this place
+
+If we receive an attribute that is handled by bgp_attr_malformed(), use
+treat-as-withdraw behavior for unknown (or missing to add - if new) attributes.
+
+Signed-off-by: Donatas Abraitis <donatas@opensourcerouting.org>
+
+CVE: CVE-2024-31948
+Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/babb23b74855e23c987a63f8256d24e28c044d07]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ bgpd/bgp_attr.c | 33 ++++++++++++++++++++++-----------
+ 1 file changed, 22 insertions(+), 11 deletions(-)
+
+diff --git a/bgpd/bgp_attr.c b/bgpd/bgp_attr.c
+index 236def2da..2c4fc70c4 100644
+--- a/bgpd/bgp_attr.c
++++ b/bgpd/bgp_attr.c
+@@ -1285,6 +1285,15 @@ bgp_attr_malformed(struct bgp_attr_parser_args *args, uint8_t subcode,
+ 			(args->startp - STREAM_DATA(BGP_INPUT(peer)))
+ 				+ args->total);
+ 
++	/* Partial optional attributes that are malformed should not cause
++	 * the whole session to be reset. Instead treat it as a withdrawal
++	 * of the routes, if possible.
++	 */
++	if (CHECK_FLAG(flags, BGP_ATTR_FLAG_TRANS) &&
++	    CHECK_FLAG(flags, BGP_ATTR_FLAG_OPTIONAL) &&
++	    CHECK_FLAG(flags, BGP_ATTR_FLAG_PARTIAL))
++		return BGP_ATTR_PARSE_WITHDRAW;
++
+ 	switch (args->type) {
+ 	/* where an attribute is relatively inconsequential, e.g. it does not
+ 	 * affect route selection, and can be safely ignored, then any such
+@@ -1318,19 +1327,21 @@ bgp_attr_malformed(struct bgp_attr_parser_args *args, uint8_t subcode,
+ 		bgp_notify_send_with_data(peer, BGP_NOTIFY_UPDATE_ERR, subcode,
+ 					  notify_datap, length);
+ 		return BGP_ATTR_PARSE_ERROR;
++	default:
++		/* Unknown attributes, that are handled by this function
++		 * should be treated as withdraw, to prevent one more CVE
++		 * from being introduced.
++		 * RFC 7606 says:
++		 * The "treat-as-withdraw" approach is generally preferred
++		 * and the "session reset" approach is discouraged.
++		 */
++		flog_err(EC_BGP_ATTR_FLAG,
++			 "%s(%u) attribute received, while it is not known how to handle it, treating as withdraw",
++			 lookup_msg(attr_str, args->type, NULL), args->type);
++		break;
+ 	}
+ 
+-	/* Partial optional attributes that are malformed should not cause
+-	 * the whole session to be reset. Instead treat it as a withdrawal
+-	 * of the routes, if possible.
+-	 */
+-	if (CHECK_FLAG(flags, BGP_ATTR_FLAG_TRANS)
+-	    && CHECK_FLAG(flags, BGP_ATTR_FLAG_OPTIONAL)
+-	    && CHECK_FLAG(flags, BGP_ATTR_FLAG_PARTIAL))
+-		return BGP_ATTR_PARSE_WITHDRAW;
+-
+-	/* default to reset */
+-	return BGP_ATTR_PARSE_ERROR_NOTIFYPLS;
++	return BGP_ATTR_PARSE_WITHDRAW;
+ }
+ 
+ /* Find out what is wrong with the path attribute flag bits and log the error.
+-- 
+2.35.5
+
diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2024-31950.patch b/meta-networking/recipes-protocols/frr/frr/CVE-2024-31950.patch
new file mode 100644
index 0000000000..97e9f59472
--- /dev/null
+++ b/meta-networking/recipes-protocols/frr/frr/CVE-2024-31950.patch
@@ -0,0 +1,69 @@
+From fc1c932ba7384d69d76b3afe05eb3940ceeb6114 Mon Sep 17 00:00:00 2001
+From: Olivier Dugeon <olivier.dugeon@orange.com>
+Date: Wed, 3 Apr 2024 16:28:23 +0200
+Subject: [PATCH] ospfd: Solved crash in RI parsing with OSPF TE
+
+Iggy Frankovic discovered another ospfd crash when performing fuzzing of OSPF
+LSA packets. The crash occurs in ospf_te_parse_ri() function when attemping to
+read Segment Routing subTLVs. The original code doesn't check if the size of
+the SR subTLVs have the correct length. In presence of erronous LSA, this will
+cause a buffer overflow and ospfd crash.
+
+This patch introduces new verification of the subTLVs size for Router
+Information TLV.
+
+Co-authored-by: Iggy Frankovic <iggyfran@amazon.com>
+Signed-off-by: Olivier Dugeon <olivier.dugeon@orange.com>
+
+CVE: CVE-2024-31950
+Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/f69d1313b19047d3d83fc2b36a518355b861dfc4]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ ospfd/ospf_te.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/ospfd/ospf_te.c b/ospfd/ospf_te.c
+index 4e420edb3..8247c44a3 100644
+--- a/ospfd/ospf_te.c
++++ b/ospfd/ospf_te.c
+@@ -2492,6 +2492,9 @@ static int ospf_te_parse_ri(struct ls_ted *ted, struct ospf_lsa *lsa)
+ 
+ 		switch (ntohs(tlvh->type)) {
+ 		case RI_SR_TLV_SR_ALGORITHM:
++			if (TLV_BODY_SIZE(tlvh) < 1 ||
++			    TLV_BODY_SIZE(tlvh) > ALGORITHM_COUNT)
++				break;
+ 			algo = (struct ri_sr_tlv_sr_algorithm *)tlvh;
+ 
+ 			for (int i = 0; i < ntohs(algo->header.length); i++) {
+@@ -2516,6 +2519,8 @@ static int ospf_te_parse_ri(struct ls_ted *ted, struct ospf_lsa *lsa)
+ 			break;
+ 
+ 		case RI_SR_TLV_SRGB_LABEL_RANGE:
++			if (TLV_BODY_SIZE(tlvh) != RI_SR_TLV_LABEL_RANGE_SIZE)
++				break;
+ 			range = (struct ri_sr_tlv_sid_label_range *)tlvh;
+ 			size = GET_RANGE_SIZE(ntohl(range->size));
+ 			lower = GET_LABEL(ntohl(range->lower.value));
+@@ -2533,6 +2538,8 @@ static int ospf_te_parse_ri(struct ls_ted *ted, struct ospf_lsa *lsa)
+ 			break;
+ 
+ 		case RI_SR_TLV_SRLB_LABEL_RANGE:
++			if (TLV_BODY_SIZE(tlvh) != RI_SR_TLV_LABEL_RANGE_SIZE)
++				break;
+ 			range = (struct ri_sr_tlv_sid_label_range *)tlvh;
+ 			size = GET_RANGE_SIZE(ntohl(range->size));
+ 			lower = GET_LABEL(ntohl(range->lower.value));
+@@ -2550,6 +2557,8 @@ static int ospf_te_parse_ri(struct ls_ted *ted, struct ospf_lsa *lsa)
+ 			break;
+ 
+ 		case RI_SR_TLV_NODE_MSD:
++			if (TLV_BODY_SIZE(tlvh) < RI_SR_TLV_NODE_MSD_SIZE)
++				break;
+ 			msd = (struct ri_sr_tlv_node_msd *)tlvh;
+ 			if ((CHECK_FLAG(node->flags, LS_NODE_MSD))
+ 			    && (node->msd == msd->value))
+-- 
+2.35.5
+
diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2024-31951.patch b/meta-networking/recipes-protocols/frr/frr/CVE-2024-31951.patch
new file mode 100644
index 0000000000..966ea7a6d9
--- /dev/null
+++ b/meta-networking/recipes-protocols/frr/frr/CVE-2024-31951.patch
@@ -0,0 +1,111 @@
+From 8dd8c6343b5aa930b7844a0e481267f3e805d906 Mon Sep 17 00:00:00 2001
+From: Olivier Dugeon <olivier.dugeon@orange.com>
+Date: Fri, 5 Apr 2024 12:57:11 +0200
+Subject: [PATCH] ospfd: Correct Opaque LSA Extended parser
+
+Iggy Frankovic discovered another ospfd crash when performing fuzzing of OSPF
+LSA packets. The crash occurs in ospf_te_parse_ext_link() function when
+attemping to read Segment Routing Adjacency SID subTLVs. The original code
+doesn't check if the size of the Extended Link TLVs and subTLVs have the correct
+length. In presence of erronous LSA, this will cause a buffer overflow and ospfd
+crashes.
+
+This patch introduces new verification of the subTLVs size for Extended Link
+TLVs and subTLVs. Similar check has been also introduced for the Extended
+Prefix TLV.
+
+Co-authored-by: Iggy Frankovic <iggyfran@amazon.com>
+Signed-off-by: Olivier Dugeon <olivier.dugeon@orange.com>
+
+CVE: CVE-2024-31951
+Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/5557a289acdaeec8cc63ffc97b5c2abf6dee7b3a]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ ospfd/ospf_te.c | 35 +++++++++++++++++++++++++++++++++--
+ 1 file changed, 33 insertions(+), 2 deletions(-)
+
+diff --git a/ospfd/ospf_te.c b/ospfd/ospf_te.c
+index 8247c44a3..1404506e5 100644
+--- a/ospfd/ospf_te.c
++++ b/ospfd/ospf_te.c
+@@ -2656,6 +2656,7 @@ static int ospf_te_parse_ext_pref(struct ls_ted *ted, struct ospf_lsa *lsa)
+ 	struct ext_tlv_prefix *ext;
+ 	struct ext_subtlv_prefix_sid *pref_sid;
+ 	uint32_t label;
++	uint16_t len, size;
+ 
+ 	/* Get corresponding Subnet from Link State Data Base */
+ 	ext = (struct ext_tlv_prefix *)TLV_HDR_TOP(lsa->data);
+@@ -2677,6 +2678,18 @@ static int ospf_te_parse_ext_pref(struct ls_ted *ted, struct ospf_lsa *lsa)
+ 	ote_debug("  |- Process Extended Prefix LSA %pI4 for subnet %pFX",
+ 		  &lsa->data->id, &pref);
+ 
++	/*
++	 * Check Extended Prefix TLV size against LSA size
++	 * as only one TLV is allowed per LSA
++	 */
++	len = TLV_BODY_SIZE(&ext->header);
++	size = lsa->size - (OSPF_LSA_HEADER_SIZE + TLV_HDR_SIZE);
++	if (len != size || len <= 0) {
++		ote_debug("  |- Wrong TLV size: %u instead of %u",
++			  (uint32_t)len, (uint32_t)size);
++		return -1;
++	}
++
+ 	/* Initialize TLV browsing */
+ 	ls_pref = subnet->ls_pref;
+ 	pref_sid = (struct ext_subtlv_prefix_sid *)((char *)(ext) + TLV_HDR_SIZE
+@@ -2791,8 +2804,20 @@ static int ospf_te_parse_ext_link(struct ls_ted *ted, struct ospf_lsa *lsa)
+ 	ote_debug("  |- Process Extended Link LSA %pI4 for edge %pI4",
+ 		  &lsa->data->id, &edge->attributes->standard.local);
+ 
+-	/* Initialize TLV browsing */
+-	len = TLV_BODY_SIZE(&ext->header) - EXT_TLV_LINK_SIZE;
++	/*
++	 * Check Extended Link TLV size against LSA size
++	 * as only one TLV is allowed per LSA
++	 */
++	len = TLV_BODY_SIZE(&ext->header);
++	i = lsa->size - (OSPF_LSA_HEADER_SIZE + TLV_HDR_SIZE);
++	if (len != i || len <= 0) {
++		ote_debug("  |- Wrong TLV size: %u instead of %u",
++			  (uint32_t)len, (uint32_t)i);
++		return -1;
++	}
++
++	/* Initialize subTLVs browsing */
++	len -= EXT_TLV_LINK_SIZE;
+ 	tlvh = (struct tlv_header *)((char *)(ext) + TLV_HDR_SIZE
+ 				     + EXT_TLV_LINK_SIZE);
+ 	for (; sum < len; tlvh = TLV_HDR_NEXT(tlvh)) {
+@@ -2802,6 +2827,8 @@ static int ospf_te_parse_ext_link(struct ls_ted *ted, struct ospf_lsa *lsa)
+ 
+ 		switch (ntohs(tlvh->type)) {
+ 		case EXT_SUBTLV_ADJ_SID:
++			if (TLV_BODY_SIZE(tlvh) != EXT_SUBTLV_ADJ_SID_SIZE)
++				break;
+ 			adj = (struct ext_subtlv_adj_sid *)tlvh;
+ 			label = CHECK_FLAG(adj->flags,
+ 					   EXT_SUBTLV_LINK_ADJ_SID_VFLG)
+@@ -2828,6 +2855,8 @@ static int ospf_te_parse_ext_link(struct ls_ted *ted, struct ospf_lsa *lsa)
+ 
+ 			break;
+ 		case EXT_SUBTLV_LAN_ADJ_SID:
++			if (TLV_BODY_SIZE(tlvh) != EXT_SUBTLV_LAN_ADJ_SID_SIZE)
++				break;
+ 			ladj = (struct ext_subtlv_lan_adj_sid *)tlvh;
+ 			label = CHECK_FLAG(ladj->flags,
+ 					   EXT_SUBTLV_LINK_ADJ_SID_VFLG)
+@@ -2857,6 +2886,8 @@ static int ospf_te_parse_ext_link(struct ls_ted *ted, struct ospf_lsa *lsa)
+ 
+ 			break;
+ 		case EXT_SUBTLV_RMT_ITF_ADDR:
++			if (TLV_BODY_SIZE(tlvh) != EXT_SUBTLV_RMT_ITF_ADDR_SIZE)
++				break;
+ 			rmt = (struct ext_subtlv_rmt_itf_addr *)tlvh;
+ 			if (CHECK_FLAG(atr->flags, LS_ATTR_NEIGH_ADDR)
+ 			    && IPV4_ADDR_SAME(&atr->standard.remote,
+-- 
+2.35.5
+
diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2024-34088.patch b/meta-networking/recipes-protocols/frr/frr/CVE-2024-34088.patch
new file mode 100644
index 0000000000..59f30ed087
--- /dev/null
+++ b/meta-networking/recipes-protocols/frr/frr/CVE-2024-34088.patch
@@ -0,0 +1,84 @@
+From 10ff8433557df40c6d7e4361cc468a1192185fdd Mon Sep 17 00:00:00 2001
+From: Olivier Dugeon <olivier.dugeon@orange.com>
+Date: Tue, 16 Apr 2024 16:42:06 +0200
+Subject: [PATCH] ospfd: protect call to get_edge() in ospf_te.c
+
+During fuzzing, Iggy Frankovic discovered that get_edge() function in ospf_te.c
+could return null pointer, in particular when the link_id or advertised router
+IP addresses are fuzzed. As the null pointer returned by get_edge() function is
+not handlei by calling functions, this could cause ospfd crash.
+
+This patch introduces new verification of returned pointer by get_edge()
+function and stop the processing in case of null pointer. In addition, link ID
+and advertiser router ID are validated before calling ls_find_edge_by_key() to
+avoid the creation of a new edge with an invalid key.
+
+CVE-2024-34088
+
+Co-authored-by: Iggy Frankovic <iggyfran@amazon.com>
+Signed-off-by: Olivier Dugeon <olivier.dugeon@orange.com>
+
+CVE: CVE-2024-34088
+Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/8c177d69e32b91b45bda5fc5da6511fa03dc11ca]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ ospfd/ospf_te.c | 19 ++++++++++++++++---
+ 1 file changed, 16 insertions(+), 3 deletions(-)
+
+diff --git a/ospfd/ospf_te.c b/ospfd/ospf_te.c
+index 5af006e54..4e420edb3 100644
+--- a/ospfd/ospf_te.c
++++ b/ospfd/ospf_te.c
+@@ -1686,6 +1686,11 @@ static struct ls_edge *get_edge(struct ls_ted *ted, struct ls_node_id adv,
+ 	struct ls_edge *edge;
+ 	struct ls_attributes *attr;
+ 
++	/* Check that Link ID and Node ID are valid */
++	if (IPV4_NET0(link_id.s_addr) || IPV4_NET0(adv.id.ip.addr.s_addr) ||
++	    adv.origin != OSPFv2)
++		return NULL;
++
+ 	/* Search Edge that corresponds to the Link ID */
+ 	key = ((uint64_t)ntohl(link_id.s_addr)) & 0xffffffff;
+ 	edge = ls_find_edge_by_key(ted, key);
+@@ -1758,6 +1763,10 @@ static void ospf_te_update_link(struct ls_ted *ted, struct ls_vertex *vertex,
+ 
+ 	/* Get Corresponding Edge from Link State Data Base */
+ 	edge = get_edge(ted, vertex->node->adv, link_data);
++	if (!edge) {
++		ote_debug("  |- Found no edge from Link Data. Abort!");
++		return;
++	}
+ 	attr = edge->attributes;
+ 
+ 	/* re-attached edge to vertex if needed */
+@@ -2276,11 +2285,11 @@ static int ospf_te_parse_te(struct ls_ted *ted, struct ospf_lsa *lsa)
+ 	}
+ 
+ 	/* Get corresponding Edge from Link State Data Base */
+-	if (IPV4_NET0(attr.standard.local.s_addr) && !attr.standard.local_id) {
+-		ote_debug("  |- Found no TE Link local address/ID. Abort!");
++	edge = get_edge(ted, attr.adv, attr.standard.local);
++	if (!edge) {
++		ote_debug("  |- Found no edge from Link local add./ID. Abort!");
+ 		return -1;
+ 	}
+-	edge = get_edge(ted, attr.adv, attr.standard.local);
+ 	old = edge->attributes;
+ 
+ 	ote_debug("  |- Process Traffic Engineering LSA %pI4 for Edge %pI4",
+@@ -2764,6 +2773,10 @@ static int ospf_te_parse_ext_link(struct ls_ted *ted, struct ospf_lsa *lsa)
+ 	lnid.id.ip.area_id = lsa->area->area_id;
+ 	ext = (struct ext_tlv_link *)TLV_HDR_TOP(lsa->data);
+ 	edge = get_edge(ted, lnid, ext->link_data);
++	if (!edge) {
++		ote_debug("  |- Found no edge from Extended Link Data. Abort!");
++		return -1;
++	}
+ 	atr = edge->attributes;
+ 
+ 	ote_debug("  |- Process Extended Link LSA %pI4 for edge %pI4",
+-- 
+2.35.5
+
diff --git a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb b/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
index 0823a7bf13..facc655e29 100644
--- a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
+++ b/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
@@ -28,7 +28,12 @@ SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/8.2 \
            file://CVE-2023-47234.patch \
            file://CVE-2023-47235.patch \
            file://frr.pam \
-           file://CVE-2024-44070.patch\
+           file://CVE-2024-44070.patch \
+           file://CVE-2024-27913.patch \
+           file://CVE-2024-34088.patch \
+           file://CVE-2024-31950.patch \
+           file://CVE-2024-31951.patch \
+           file://CVE-2024-31948.patch \
 	      "
 
 SRCREV = "79188bf710e92acf42fb5b9b0a2e9593a5ee9b05"
-- 
2.34.1


