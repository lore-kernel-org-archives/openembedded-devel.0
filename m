Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36E12EC01DF
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 11:42:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15359.1774266145302994945
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Mar 2026 04:42:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=YtiHKSYv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7542b98c32=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N5o1iS3735900
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 04:42:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=v4AzM8tV6CPfTtlxrfCS3QfF+lB7e0iZg/+Lt6evu0g=; b=YtiHKSYv04xg
	JRWof4jmIKFMf31f2Bw0pobys26EqqVNkR5ELc2FiKeanYMFTmUga9/We7wPvavZ
	ikhQNV87XiRsZakIutT64O+v76kM+CfTwm2Wc9gWNvs/SXe0jjUZ+qTAPg/1W8wq
	UEeII7zP/WcurmrngLprHdOIOJu54ivkIltOU2ZVfjQAL+eu32enm2pQdIcbbr/I
	97eDi5Nuo7AUlPRZlKnCvy7ink5DwfCOAgxFiAifdQuzV50rb7dtkDrFH1QolPO6
	oJie8qcVSq9yKyZiK1+pAZivJEzqc33zsKKtQ2byEQ9kFK762dxYYt6T/apSVadr
	SIFykxh28w==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010026.outbound.protection.outlook.com [52.101.193.26])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1pky9k3g-4
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 04:42:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fsg23z760WfYHUF/z/s07pC0pPzmyuQuunC64+m24zG8jyJjFXSem0bnIOUVgewILhQEz+J56KaVwYRk2tyb2TbmndHaATiKQp6N/E3xJAz7prIgd+tZHDs/JCbhmqxxpHeyeh2jvUuU90KdF5EkGKGN3MJ3AFnuQt0eIQ5aqofHW03ZO5n+HcYq37po9dFq4hy+1yCYwlbSzLhulgcr0dyR7p4B1RlbzktsqQPO7ux/jsF7TXtw9VFVnT6rx9mvs5/bwHb1UpuhOjD9LvUOw/ZM82JGRfAiA47IirJiCge2Imk+SZhulx3V7CrShA92eMWia8zzEzB91vKHDuFSIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v4AzM8tV6CPfTtlxrfCS3QfF+lB7e0iZg/+Lt6evu0g=;
 b=nv4ZOVR+5wpu5XrrDJy4adga56tKnOkc9tRFBLZt0gdEd3yvgRra8SeztxGPKzwXWbJtdEFoHqbfE17AnWs92kTwh38gkXhjrOvTsFTNccA3fRQKCKaBw1ARBtk0ftW4u3zeP4jWpbRdKIPHbu07Dr+lcLK0twC1auAt4rM9RwQZYHAZiKbJ1Exa4YzT5beUSLoNNQ1abwcQXJAFVmmYWaAmb6xK2X0t2kgSlCTt0IJqF86TH7kJYKcOKudr+h2umPvgSqQnDvgPaCQeeSIWGiK8vGiIQe+sARGFPu3lv+cLJubOr5nkNz3YToGIuP0y4JOJQJ532/8otn6sxKtAbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by DS0PR11MB7441.namprd11.prod.outlook.com (2603:10b6:8:141::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Mon, 23 Mar
 2026 11:42:22 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9745.007; Mon, 23 Mar 2026
 11:42:22 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH 15/15] xfce-polkit: fix link failure by adding missing gtk+-3.0 dependency
Date: Mon, 23 Mar 2026 19:41:52 +0800
Message-Id: <20260323114152.4178269-16-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260323114152.4178269-1-peng.zhang1.cn@windriver.com>
References: <20260323114152.4178269-1-peng.zhang1.cn@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0108.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::14) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|DS0PR11MB7441:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f3cb652-7271-425a-008b-08de88d13f13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|56012099003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	aMSaHHUoxYdowqz8ZMQHDPo+OHOsis4T43xQbRxHXSY6V4cZDaCdJ+E+yobN/u7ui9Z7p8B8Kl+ey6HWdSZCkUG/Zq5Mm6vvD0Lmnxs1DZ7ILJN1toTZKgwseRFuF74vrgg8zweYiZYaDUKBnZoarEhhDO8VUB3xAhZzy0wp7ZChrsuDzIytMLb+GpCrCfe/1JPcgJh3UbrkD6zKehZskWA5ltv5YX87hE5Ac39h94uETYT/llvH6ljeIW30OC+BN7y7T1fNMg0Ayger2OVUzeeNxO78Uwz/SNJUvn6Sz3eKosVqVw+ERl0dWYqSwN7YT+T28uUAihf6F843FeWnj7zE+P7MAtPsJAHto/CH/HrKMiOhh/P330atfTMAQ9VOlZz2Qp2GuiMZlK4AhhZQwjCbjX04xTyQp8cR3SWdpSZJwA0szhu2Ct/5dFMU8NyzUFYt2N+7JsMbGkDkLd+vgiqOPLXsne/d09+VtPWAM9eTjro8MUuqUUJf+P4hFRu9edI8fsoq1kjc7UM1yik6m2mfrKZ5eWqGg98RYaOZcEdTxz8a6suMon4cjIcy1jHzOg1YBSdp/Ttloqr91QtZ0giSCjIrObwkFwcr+EJXhhzrTDb92/bJKrb2LzwgGC/HROJ44oJmZjkVuKbC4xjNTpTMOa6lmOKAdCNedkQSumbkY/hXQeg0y8BqiF+V62ZaZ/S+ijr/jNDwy/5DICQPhVczXL5JhG+6QFsBJUOYmKUnyUNHYW508fmmFpt7oYOi
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(56012099003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ahE62x4/LuLBuqhBu6RTEPkXEESREQMmsxmEh0yHdLmYsBubov8caR05k/aU?=
 =?us-ascii?Q?hHqZPBiNGooXpmvbA8isOumcZDipaQBhGLWpmiHKmfZk/ERdQI4QeIRF12w6?=
 =?us-ascii?Q?tANhlaBLvmB2AVddEOdGoe2p5NNXS644oGsIJO5Ak21eyrN4yggQSzy0cgWC?=
 =?us-ascii?Q?YEc6IqUAnQjwuKFKVubdwjGpWnNcb+bOBp29m2U/mZu8XyiIoZ1r+C/y/BLo?=
 =?us-ascii?Q?QlMtoqTmkIL95xUHwmIEb/hXVJ9ttz/PqsCufdZE2Uyrx7LjGa1wfQiO5i0L?=
 =?us-ascii?Q?GFDEZ1MfPg1l0mEP6cY5lOmThNALQ05y9RZWlQS5fdTFSOHu8ZNhRtz4Vn7Y?=
 =?us-ascii?Q?2cl+uXUwZAJ8zH86osGghL1e20kSSBpfdomKIzkZ0n663M2jeUz9opSO2zhO?=
 =?us-ascii?Q?e/mLHe/FpdJhi8V5efO0Kpf64W+qr9V470yCYXj0CVgR37xX5EBuwfXSiP5k?=
 =?us-ascii?Q?t3MdJiAudxB9iC9z2jvGXVEL1Pm2ODk1fx2NwN68zpy0PRP7GvlTyR3oa4jY?=
 =?us-ascii?Q?RSCpO+8p+jw30jzSd41gfKlEMLQ9IjZJTnhvCfX5bHBXUwDlpAhq3M2dg+tz?=
 =?us-ascii?Q?wexsOYyZcm8EPAzGZYhFICV2W7geIMn8Jy6OV1Q7cDP2H97b9qHt9iAGmQLa?=
 =?us-ascii?Q?ydmvdQGj4iRIsB4/iCleDjHglmvdpcU+qtvhRka5GGFJHMWMiPu5qG2JCOH3?=
 =?us-ascii?Q?dU4T67+HghLqnhKc+0g4sRkAnO6O434FcpSPXUm+opBpOrfzyuwaprA/8eU/?=
 =?us-ascii?Q?Ak1BNfEF8/y7ldFEtUYf6mTOrvRXZGSHHHsnqJvinMrgEhsuQp2lHbFuAG0S?=
 =?us-ascii?Q?IwPCqfnwncmeeTVigWR3wXSokTXrh/nj3pWb7ukDxh4AJu/eMzOFpb7AVWhQ?=
 =?us-ascii?Q?27gK+eSQ0Wx/dj/1qp8nGuKKjp7RzJFeBt+mIImTKKeRFQyFZcFa339krrAm?=
 =?us-ascii?Q?l4012U3Fth/X3DwG5Bugq+xiGAvZgE8AxxHIUDVrLdcHGRdRwahc7dj16z50?=
 =?us-ascii?Q?m0MxMkmVYmTeIDAuTw/oipeludnRevsoa/B33e3ypVnflxHvyRNz6wWoc53+?=
 =?us-ascii?Q?MNsi+7F9FOKtAwBy+zvcNzWQ74dkT6VHTyfgonpamOgL4EtgwJceeA3d5urI?=
 =?us-ascii?Q?L0ocd7YtMw41XfwHy9CtB+pEcl+5ztgHPc0O79dgWctVL5Wk4UNwUnDhgq0y?=
 =?us-ascii?Q?Y8f4OmbiEIjdj6lFminpqK0HqkQu8hFTqz34VTKLCK10eCBY5gl0fAK8SGzc?=
 =?us-ascii?Q?ToWHCoOxSgyLS4NGgM2DDwQk7iGEROhVSFiK6cpOYb8NIfaEFklW1easpFCU?=
 =?us-ascii?Q?Z2RSckT6vxSFB8pr5GOijBT++LMe7rA9f/rXBjP8x6/K+98ZakR7+Y6dictL?=
 =?us-ascii?Q?qEigZv2LlFOsPVqh4cRMEEjYrhfvLUdugoyZShJvWv1bpJxoLE+WR5nGfvTD?=
 =?us-ascii?Q?CasMlF+ckYTQKU/qVBfru4V/9QqiatVrKYq7SYQWlLAjV+Xz19NEa46YVkaj?=
 =?us-ascii?Q?UiApf9u5uutFscaUk2XMG5jqqI5S7yUnklNMU2NUeV84/IylPKS/A+oAlmEA?=
 =?us-ascii?Q?wGwfv8XvxYQpZpSJbH/LB/AlZ/u/v5X4ZsqrXCmo3azvu480ZhVJj/vY57zr?=
 =?us-ascii?Q?nS2PLjmQY0S/abpghVCnqFnsfaOzVBKWi9cIpsbXAq0WsSzewWt6ml2Cw4Uy?=
 =?us-ascii?Q?t56aA9vzwWGbhzrTvgLoQo/fdna/tLEBwj9fVpZygZWskQ5EgDrZWFAfehKf?=
 =?us-ascii?Q?/bwf9e3TKIuuL5TXzBRy8oOC/5iutjk=3D?=
X-Exchange-RoutingPolicyChecked: 
	g/lV6iwhNWht4PbimJbGELHF+d+JO38fw2T5VMxEwJAkE15E0qcEWEvkc7qN2EYgXNYX7ZOvOO2Ph3sRrIERWBYQixgMrOTJoQf/k6UEUG8QQzqgPV0ZMcOnkUpDXBuo9LIXFgd9ySCnYieLFjIdbbWIlUyIgexZGY7YUgEz7MWSTgu/Mkj/gOP8SPMFMOx7ZXErQMBR+ruPEoyQSjSvJKn/wueVl1yBrd4uEarTe9NMUGO0uw078y1pArUfLK8WxEYxSZd2IU5CSb7N5Yfnd6WgxbBf5D4Awaj8pclZOdB84rMF6rt6P5ypn7E8/q2XMpHO4FjHWI8/sOnbBBQ/Pg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f3cb652-7271-425a-008b-08de88d13f13
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 11:42:22.2835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w5LOFpBm8fVdSeFXPPxKt8UT9Ezrv4ZN18NTjQSppKxWrU5fMqgCnpH2zZxP/j6EcJ4coW9I1rfjIgjgVQT+XWSyPNf/I+ePeRh2+Ig3F7k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7441
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA5MSBTYWx0ZWRfX+yD/+xxFKQsF
 b84c0RbhqG2WtYru2oHbGFSvWMWaQIGkwF9ORJ0s+v0ph6PawM2TzFhs8HOdwqTalrxeFbYpYIH
 R3evSBjGOnPzcSujkMYXnRiSvk5/pncE3Q+vExYNRkvulmKindaNAE+pLBVEY8armk9pFF/+Jqy
 m7gZtnLzZO4PQmYuNOGgbfkbs/5tIXItgM4ZVTf3y2c1hJo9Yn1cuJ8EKi4GaV0opLMX/ByvnB+
 69MujrgR5IM5jSfbG/yo31Ym57eUt/orzKPLEe+PRTSbniMT+2I25o2mkbG3V/NviiEwQU8Fok3
 P/dznbQFOf0mHZQV7pBaojZMN86069vTbNVbxrXUE/S/v5IlxEUHvhr0PqbNtTv/3jC6ixe1z3d
 LhuzK/cUcD6uMx1mjlWjOp8F+gpXfFI0Cipd0lCG+Bqqmi4SRtHVMdoYgmKb3h9cd45BBUb5Nrp
 01PqYaDYcu2jNq9uT3A==
X-Proofpoint-ORIG-GUID: RwxP0CYqGfg3NwPL0el60rr-ZIkW1Nnn
X-Authority-Analysis: v=2.4 cv=Scr6t/Ru c=1 sm=1 tr=0 ts=69c12720 cx=c_pps
 a=3NFNipLq04N0pvkhkOyhzw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=e5mUnYsNAAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=7sqpSKcsBsmI2gz2FRAA:9
 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: RwxP0CYqGfg3NwPL0el60rr-ZIkW1Nnn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230091
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 11:42:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125518

From: Zhang Peng <peng.zhang1.cn@windriver.com>

After libxfce4ui upgrade to 4.21.x, its pkgconfig moves gtk+-3.0
to Requires.private, so the linker no longer automatically pulls in
libgtk-3. This causes an undefined reference to 'gtk_combo_box_set_model'
when linking xfce-polkit.

Add patch for explicit PKG_CHECK_MODULES for gtk+-3.0 in configure.ac and wire
GTK3_CFLAGS/GTK3_LIBS into src/Makefile.am.

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 ...d-missing-direct-dependency-on-gtk-3.patch | 52 +++++++++++++++++++
 .../xfce-polkit/xfce-polkit_0.3.bb            |  7 +--
 2 files changed, 56 insertions(+), 3 deletions(-)
 create mode 100644 meta-xfce/recipes-apps/xfce-polkit/files/0001-configure.ac-add-missing-direct-dependency-on-gtk-3.patch

diff --git a/meta-xfce/recipes-apps/xfce-polkit/files/0001-configure.ac-add-missing-direct-dependency-on-gtk-3.patch b/meta-xfce/recipes-apps/xfce-polkit/files/0001-configure.ac-add-missing-direct-dependency-on-gtk-3.patch
new file mode 100644
index 0000000000..bc20d2f854
--- /dev/null
+++ b/meta-xfce/recipes-apps/xfce-polkit/files/0001-configure.ac-add-missing-direct-dependency-on-gtk-3.patch
@@ -0,0 +1,52 @@
+From a89bd475c3cf7dc39618bcc9979fc618d7acd537 Mon Sep 17 00:00:00 2001
+From: Zhang Peng <peng.zhang1.cn@windriver.com>
+Date: Mon, 23 Mar 2026 16:52:58 +0800
+Subject: [PATCH] configure.ac: add missing direct dependency on gtk+-3.0
+
+xfce-polkit sources directly call GTK+ symbols (gtk_combo_box_set_model,
+gtk_widget_show, etc.), but only libxfce4ui-2 was listed as a dependency.
+Since libxfce4ui-2 correctly places gtk+-3.0 in Requires.private, the
+client must declare its own direct dependency on gtk+-3.0.
+
+See https://people.freedesktop.org/~dbn/pkg-config-guide.html#writing
+
+Upstream-Status: Submitted [https://github.com/ncopa/xfce-polkit/pull/14]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ configure.ac    | 1 +
+ src/Makefile.am | 2 ++
+ 2 files changed, 3 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 88f2432..15c09c9 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -4,6 +4,7 @@ AC_PROG_CC
+
+ PKG_CHECK_MODULES([GLIB], [glib-2.0])
+ PKG_CHECK_MODULES([LIBXFCE4UI], [libxfce4ui-2])
++PKG_CHECK_MODULES([GTK3], [gtk+-3.0])
+ PKG_CHECK_MODULES([POLKIT_AGENT], [polkit-agent-1])
+
+ AC_CONFIG_FILES([
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 514605a..f13e4cb 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -10,11 +10,13 @@ xfce_polkit_SOURCES = \
+
+ xfce_polkit_CFLAGS = @GLIB_CFLAGS@ \
+	@LIBXFCE4UI_CFLAGS@ \
++	@GTK3_CFLAGS@ \
+	@POLKIT_AGENT_CFLAGS@
+
+
+ xfce_polkit_LDADD = @GLIB_LIBS@ \
+	@LIBXFCE4UI_LIBS@ \
++	@GTK3_LIBS@ \
+	@POLKIT_AGENT_LIBS@
+
+
+--
+2.50.0
diff --git a/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.3.bb b/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.3.bb
index 880e73849c..167cc538b9 100644
--- a/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.3.bb
+++ b/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.3.bb
@@ -7,7 +7,8 @@ DEPENDS = "libxfce4ui polkit"
 inherit xfce-app features_check
 REQUIRED_DISTRO_FEATURES = "polkit"
 
-SRC_URI = " \
-    git://github.com/ncopa/${BPN}.git;branch=master;protocol=https \
-"
+SRC_URI = "\
+           git://github.com/ncopa/${BPN}.git;branch=master;protocol=https \
+           file://0001-configure.ac-add-missing-direct-dependency-on-gtk-3.patch \
+           "
 SRCREV = "6d3282cc1734c305850d48f5bf4b4d94e88885e9"
-- 
2.34.1


