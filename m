Return-Path: <abhishek.bachiphale@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7FB8CD4F50
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 17:14:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2388.1779124455907972973
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2026 10:14:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qENG2ylv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=95986d85e0=abhishek.bachiphale@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IEGJlQ1524251
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2026 10:14:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=u5iiyX5RHpJqqZ9rNiNb4LBGRO8I0biEc9Imqr3BBs4=; b=qENG2ylvg5Uo
	CWvIlp4FlIX1SBnlb5hUQnijV5A4SdfMQHuQd/TwhD6pQBtBXbAL5yXckZSB1rWO
	C/0etC2lIWwokxZ+rP45/XY35fUkGlZj5DM8mV5ZnFxwOzBzv5hhj47wk93yFd3k
	GuYtEJmN2cSMH8OYxLU1apDGrXSlTcW9eeXI9Qouux8WAUZhXPf6BzVN1RgKmVus
	wcwFOr5wljlBI5gLDDYQom2rkUpGFMOAetWcqHzHFPENAaglQS4GK3K5QcLsRIbU
	WkkQPvtGTZtoMyBj8UUe68m/fx5HF3Cj5X+4ouGGztMC2K8S6Ct0ugynM+ZN+Diw
	DI/PVkmo+w==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010064.outbound.protection.outlook.com [52.101.61.64])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6r3ga5js-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2026 10:14:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VWkSYcX4BpsscC1/i3o9rhdiSrBnOMw0ef2QtvRT/chy9O1Rb7srXSqNlUt+boLHiXxzqivjflmbduIYkoXmhzRsu04JBuHgzTXTOEWDPV009ov6FjMrOCquQ7FLoAtoCvHDaWK4YMKU/ZJMVMWZQwJzBuks/9eAvdWYcrcnYNRrvhk/26UOqmdjmXKKB6m+3j/wcL+JfXG0GDOLPG6nUAYZAAT3iVUhAZeWx7JgFeMz6ZJxoeWrrL2xlre+NeqfHKlEyHLyz/alTgH3J7MjUBUo4FNbnXi22XcHqWEF/w2ZhvUCai4Z4ZUTdPGeXHj2ZFcPAHWINdaZRDubwNOe9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u5iiyX5RHpJqqZ9rNiNb4LBGRO8I0biEc9Imqr3BBs4=;
 b=aPS6VZqDlJPR7awRE9plYMIKLoXhztNLgoaoneRYWDe58HBTZtmwCIlpXkvZaIAy+yGYik0Y2dckP12zo8G1KrK0TobLHp5cUQO5TKCg5l/+ppfZrNfyHi5EhuEQg+q3WGGqq2KbfiiwlvCBHYo+4jGu57UJ9NEZd+IugWpOlPFbiPS3xxq94/jHK0bSXtDmlmPe8k0ppVo8uEYolbJusWFLD+llH5ptbjhcZ7mc/fhXuD85ZxoXyvlOPfR8xPRb24IhWbw1b39Ob/EulVQVXYRd2L02pI0gis2NIool6r8VTZbzgrNi96ZuVKi3ILw9EUUMbpiiVIyZfu61g3MetA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA0PR11MB8399.namprd11.prod.outlook.com (2603:10b6:208:48d::9)
 by PH0PR11MB4840.namprd11.prod.outlook.com (2603:10b6:510:43::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Mon, 18 May
 2026 17:14:10 +0000
Received: from IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c]) by IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c%6]) with mapi id 15.21.0025.020; Mon, 18 May 2026
 17:14:09 +0000
From: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 4/6] dnsmasq: fix CVE-2026-4892
Date: Mon, 18 May 2026 22:43:34 +0530
Message-Id: <20260518171336.470608-5-Abhishek.Bachiphale@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20260518171336.470608-1-Abhishek.Bachiphale@windriver.com>
References: <20260518171336.470608-1-Abhishek.Bachiphale@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6P286CA0001.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b8::18) To IA0PR11MB8399.namprd11.prod.outlook.com
 (2603:10b6:208:48d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB8399:EE_|PH0PR11MB4840:EE_
X-MS-Office365-Filtering-Correlation-Id: ce15b133-a324-4236-bb4f-08deb500e00b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|56012099003|22082099003|18002099003|11063799003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	XDieTH/vaXpbpx4P35doytZsRYzwTOQt1D7sku378Mx5KVON4WqROPb+/ac4o9R520TMtpEBjNwyuLquHXhhxlDUXAyo82pWWwODsnO+7LODLqIJlsDwR7gW0UNjJvw/8wmqg4LHw/5QPlpNsyi71Hb8/57QG1TbJGHttRg4DCm1G8wHuCTleOs678QJSItzHRj/dgXI9d1w3kfzrhR4LU+x9wfqZPZmXSDn3Q5RMZxYys+XC45UeoORWEcDWQn+wc88AzK9fsqaXPKK5nE3sV3RJhMI+ViEwU/pv2fo0v1if3+Ol2qIKfASfz4tvCtPmQQRYhxUSYpofibn/nHcWiS06UxEyz0w4WBBNQFk+td4ktBxqN5On6L8+XalBJ6e03sb9GIIZsjKMAvTf2Zkb5tr1BVuIeCG8Rp30HGLFJ0GO6HqefiZ+/Tk7DcwFi53Q0xOx5TW48LGyQvoLBx8rBPA2VbnHK4X5mLb3JKds7/1MNxUdU7rqz36Sxt6rN1vjAFhEtZNYK9mQJ4N4unwCNJArCSsH4ZSuPLGX5NbnV8yNKTz4zrumSG3L5Tg3O0xRiGHa6TsgWm3nZIsDWbZRlwz8WWbfVHxNwLgG34EupHfx3LbQLekyHkz012wr+qy2hzG3fChAfagd+VulFDH5kTFzBxL/sG0umD+ClUEwLz/2+rEBEOKw/4lAuMFSQqeH/woHxfUuoo3GRXqRwjLSw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB8399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(56012099003)(22082099003)(18002099003)(11063799003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?o6uGyKsVgFbul9QhDyr8TfhINInMK/vR18hjvZjpVV15X+Ev0GEzHHcud3Hc?=
 =?us-ascii?Q?Xeg7+mAwVsgjIJF4/F89HOiRvofPAwJH++axFVxz49xpKDizQRff5vtOZk76?=
 =?us-ascii?Q?EMrjwyxsCwpstsTAzHsIk9FKXlAPFQ3VHEQzuc86jAwTrvGItoWABGG4cNtt?=
 =?us-ascii?Q?NerWJqXdYqW5NHSva9hag31+fCsrJZxCYDz1VTQQIqWvJUF35gKjYzfjb9nu?=
 =?us-ascii?Q?yKNkziP/rx/f1YtBE53HIbhPu58T+dgCX5jzTGWc7lQU/OMhix2ylyClKSQQ?=
 =?us-ascii?Q?ab8o5TqS6NfBen8qrBsreM+rnms2x5pjXAoUzHVCk/afH6DIbcWUlRIHpJoi?=
 =?us-ascii?Q?KcrZBhTcipRrwLzH24su/K6yG3gIt3KkP7T0stC2F3hl0NScM8iAHpx4XOVd?=
 =?us-ascii?Q?nBUJvkuQKAEDciSepk5dN60dfIGjFOuq4ye+mSSwgICz/Ku5tAVabCW49Xqw?=
 =?us-ascii?Q?2JKYrrLXdYiPtjhj5KQ6qVImzbcA4sIeAP3xV+G5L+e9fxfyiceiRBW21tzP?=
 =?us-ascii?Q?76LAhkIdYx8N7EHS4pqGEVRQS0cYfcAi0X1SnJ8/neWE9B6tG8mToo+0HeFt?=
 =?us-ascii?Q?2H4JZjfCWdMy0wLjC7NTT1dAap2qHDYsIaqhDOeHtv26Jg34JdNSyfCyLIPb?=
 =?us-ascii?Q?syT4A95TW6Nsxbdt12Er1YrXi8R49KE2IYyEylFM1wPtEAFx8zcp6TiM0rTP?=
 =?us-ascii?Q?5WhUVLyEPoGF2vRWo/xopJQyE75Os2Zns3JjGSEelAyCHzpfNyX0pwfBVenP?=
 =?us-ascii?Q?IKijTcPiRJdDd+o/qdf9x1sali/IwuHqKgPaDUmk9eLkQibkquIH3WK1dxXB?=
 =?us-ascii?Q?9xQb3znzrqWEKjX3BUhebD/w+OfXqFMkkoXaTW2Xwis7jJ0SixYVts6JCFCi?=
 =?us-ascii?Q?L3qD81OvwobRUJMNzKKSTbUmlgaCP8iQRXdbcy69GnxteJhGV9UBtEgQnhKZ?=
 =?us-ascii?Q?2oi6L4IokpQ0EQBKnJjL9vDhRUckV6vQWInIigsGbf/NGRaGljukjYzHpBub?=
 =?us-ascii?Q?YuEdZrlLiLHdH3fjS2oMBn43lKOEnqR/sjvZn8NzGylUzEN+HkNNPzzDj8XD?=
 =?us-ascii?Q?92Bck3fSDuCsY4bXr64OCgVnxGdD9QrvYZwBMrlZ8rhTtMiZnxHXH3u6VlKf?=
 =?us-ascii?Q?vYFL0lOWtSj7qn/IBxQ40ujSrxRQa+5vHMga124CoEXx2tsgx1jWUdhiYMnB?=
 =?us-ascii?Q?GmHEEUaumbkwvs36yJXa0Aalvkz4qZEHIXQVjty7vTIgMXQPtOKTrejoRt5H?=
 =?us-ascii?Q?CX0BGmKKh0AfZQxMznn9RuBtLsCB7CUy800NkQvTNpATb4Vf4CO2mlzCMC/3?=
 =?us-ascii?Q?6lF6VpqlEhGHOS4zKfwp978TEx2V0v7vxOVyV3B59dWd/xlTomteDRuhGsdg?=
 =?us-ascii?Q?g5RYRv+vgdK2zguF0x1ofI+BeIGVYQOehptit2mnFD1gMBj0iWgTzMgEtrJU?=
 =?us-ascii?Q?aYvClrFUEaOFJSd0MqgMD5q5OpwlRBxeK4meyZ3bxEZTCcWtMlrjPQzjT5Tf?=
 =?us-ascii?Q?oXXaZmXEgoQylQ88J0NBJvgVR68Qv3mMamiV/4BCoB5/X+Xz65jqEF0Knupv?=
 =?us-ascii?Q?VaAJWiuCMhc/5qXgMkUEfO2CVjDu+EhjiLowp0FzwjkzdNKLDSBPfH4EiDWH?=
 =?us-ascii?Q?Qwc/7Qf3t80w5gTrBxZJlDiy8ubbthJEQsDf8xHeVvymjciK3tJwDQDw7Ggo?=
 =?us-ascii?Q?dfCNUBxtEsflZKjn5EJivUDTj4FMWsJXYEK6MHuEPCCRUVw3VPZsBKN/lrPE?=
 =?us-ascii?Q?+3o98oBzUTtJtOedEjznHXiF8h05A8+pOLp/m5Dp+atwpBZjcUis?=
X-Exchange-RoutingPolicyChecked: 
	QcH/xIKAUP+eW/cPEB/PqNqBEGfQabjhnA2rRdKsJrRcDenzPfzNRe8do6q6G0gJ2WFEjSizzymK3q80DdtPcwR5DTJF78ciA7IbrRAEfGTzJlHTjUDkOS9dUIpbEWd3dmU998pFmPeQXSLaOzMLyo7WJiaak3SB+78+PHoV02rqilQ9jNMvw0LqDl0tycLtq8MY/wJ3PWv6SwIWx4MLhEJFp2QJaUAsMWOigKeL+r7TCmSIbVhvp5HGuPvXUYLgG88gzDlKhcC1LJYmZA2NUP1isotqK8CULFebYazRHLw7kaOFNQMVFvpnCgkAf4IXhXJS00rmKEBVS0aSZflxlQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce15b133-a324-4236-bb4f-08deb500e00b
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB8399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 17:14:09.8538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6RmVIygIj8VudhRhTWhHpQl5P9HLRhOuHoZ/1bWjLHv7+9huE0Lts+g/b7KnUEK/d6fb/TflE7ZtkGkO8wZ/GxzOxFo1m/XVixgFKia0nRmlJbAFlT+j6rezornsTsJM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4840
X-Proofpoint-GUID: -FHb-Th_QxqcSbhq6dF2Jf8P974dD0vl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE2OSBTYWx0ZWRfX8DPBWdwCLrh3
 grNJdltmEhFEvrrx3eUlF/dq1E8NhcoTbbwk6RarOeXVmVNPciLwqWsFyTqxONlDOBbOqopa/7F
 BYHuG/n5FSXmkBxpNvkHzpQplVBcMD+V0WFYpHD6wLodMtJTd1MK747XTfM3aSRDkya3X9/UN4y
 GB+ckb861uiE3h0yO3hZ27VPFc/qLgZhpnzOaXsJchbF47swc4UTSQZLH3gkBYKQMk8kyei0tiD
 t1VH0jfsJsJdq7rPDsnWwU3lUpZmbrUD51aU/UMEu+AzQ4YuJfdNeYaBBNsiqzdM5+dYJaPDOph
 +G44s1Vkg/ZA7rVnlf4gbNiDY6kGnPZtnwECl0sr7GjGQ0ziRh5pNRCRp0Fnj+kMdXOb6UWsaO/
 PvuwqjoGyMvIe8WEUSZhG8BIs6mZRvd6iFEBhLRtjjsPg+jmLRPxKyZ+wbymYXH1MOos+J1/lSY
 qoAcpuue2qn+EowsO4A==
X-Authority-Analysis: v=2.4 cv=I45Vgtgg c=1 sm=1 tr=0 ts=6a0b48e7 cx=c_pps
 a=0b+utHCzfji0ILmZHHcyhA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=PYnjg3YJAAAA:8
 a=omqxvBYPAAAA:8 a=t7CeM3EgAAAA:8 a=VBowi81kAAAA:8 a=Sskled2yJNmGPm9A-zkA:9
 a=LHRESdT2jHCYgTnjdhDM:22 a=FdTzh2GWekK77mhwV6Dw:22 a=uoxt2CKr5i4t67rzx1zf:22
X-Proofpoint-ORIG-GUID: -FHb-Th_QxqcSbhq6dF2Jf8P974dD0vl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1011 spamscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180169
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2026 17:14:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127055

A heap-based out-of-bounds write vulnerability in the DHCPv6
implementation of dnsmasq allows local attackers to execute
arbitrary code with root privileges via a crafted DHCPv6 packet.

Reference:
[ https://nvd.nist.gov/vuln/detail/CVE-2026-4892 ]

Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
---
 .../recipes-support/dnsmasq/dnsmasq_2.92.bb   |  1 +
 .../dnsmasq/files/CVE-2026-4892.patch         | 36 +++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2026-4892.patch

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb
index 850bfd2657..cf900328ed 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb
@@ -18,6 +18,7 @@ SRC_URI = "http://www.thekelleys.org.uk/dnsmasq/${@['archive/', ''][float(d.getV
            file://CVE-2026-2291.patch \
            file://CVE-2026-4890.patch \
            file://CVE-2026-4891.patch \
+           file://CVE-2026-4892.patch \
 "
 SRC_URI[sha256sum] = "fd908e79ff37f73234afcb6d3363f78353e768703d92abd8e3220ade6819b1e1"
 
diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4892.patch b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4892.patch
new file mode 100644
index 0000000000..01637601a3
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4892.patch
@@ -0,0 +1,36 @@
+commit 011a36c51438c986535a7248ed2e7f424f8e1078
+Author: Simon Kelley <simon@thekelleys.org.uk>
+Date:   Wed Mar 25 23:16:35 2026 +0000
+
+Fix buffer overflow in helper.c with large CLIDs. CVE-2026-4892
+    
+Bug reported bt Royce M <royce@xchglabs.com>
+    
+Location: helper.c:265-270
+DHCPv6 CLIDs can be up to 65535 bytes. When --dhcp-script is configured,
+the helper hex-encodes raw CLID bytes via sprintf("%.2x") into daemon->packet (5131 bytes).
+A 1000-byte CLID writes ~3000 bytes. The helper process retains root privileges.
+    
+Note: log6_packet() correctly caps CLID to 100 bytes for logging, but the helper code path was missed.
+
+CVE: CVE-2026-4892
+
+Upstream-Status: Backport [ https://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=10e6b5b83e80749cba7b090d7780b29f908f0571 ]
+
+Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
+
+diff --git a/src/helper.c b/src/helper.c
+index 72f81fe..2c12801 100644
+--- a/src/helper.c
++++ b/src/helper.c
+@@ -261,8 +261,8 @@ int create_helper(int event_fd, int err_fd, uid_t uid, gid_t gid, long max_fd)
+ 		      data.hostname_len + data.ed_len + data.clid_len, RW_READ))
+ 	continue;
+ 
+-      /* CLID into packet */
+-      for (p = daemon->packet, i = 0; i < data.clid_len; i++)
++      /* CLID into packet: limit to 100 bytes to avoid overflowing buffer. */
++      for (p = daemon->packet, i = 0; i < data.clid_len && i < 100; i++)
+ 	{
+ 	  p += sprintf(p, "%.2x", buf[i]);
+ 	  if (i != data.clid_len - 1) 
-- 
2.40.0


