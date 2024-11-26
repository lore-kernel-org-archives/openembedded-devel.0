Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 386CAD5A6F7
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 08:11:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.41206.1732608691628838136
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Nov 2024 00:11:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1060a1ab4c=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQ52WdD005193
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Nov 2024 08:11:30 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 433618aya9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Nov 2024 08:11:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W7PUY8XzTJdsU057HaN1L03YahNcWzKepW4YEsQpHM7o8Eo56QXZmHUuPCkLtKi3rxP8t/YFT+i0eK3/LpdUG9zqlDEPvlZKRm/77KyHfufEi8xwX5szoCbsnrqhqTx6o3JvuvA5QAWT356/EmKokyH+ULwiiOLJ5XqfOLxzxqsA6TIQ0AW5sFtoSwIFpGVHHziroVsrScU3GeWcGaMkM4W82Yvd4FrW5ipM1PXRkojPB95oCbusAT6d02TX6ZQcWNKlEFUpMXbnaAGs2fI6TSuPOToS0iwnWlvRtMaZleHDBl4v9jORh6CvwWQjAzuGqNqYJYL/3HTHUc09vh7mFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JJ/7c6lWQyo+B10J00z2cdxwPa6CvWsVdHT44a+JD8w=;
 b=hB/KhF7JNhsqWWU0t7ULbK0rTJD1apDMKda7uNZB9UnYpDMN1UoPMVEFulHx+wxYGRKHpN4nqVt5XNIMiLXM+nTqW1Cb2ni3SMBVrhtXfrOo/Ag+2RYbnU92e8Un3QbDsbEyzbnSJu0Dd+eKavMpTyhHgSv/ufCgMnwwSQxhbxufANia2Vytoa2UpnKuvRPGM8TGDF40FMB5Y7nqttlUw5VUw69PozVJaVS1ssQ2u6/ETdhzLjUFJK65v55rbfimJ8mHmMtTUR3u9kPcuGoSbLbU62bSHlmHp6NnvSkP9S1YFpoTUMgYgYxpIDzl5SaNvmZ39/cpieo6SNgaCR0j3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Tue, 26 Nov
 2024 08:11:27 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%6]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 08:11:27 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][scarthgap][PATCH 1/5] frr: fix CVE-2024-34088
Date: Tue, 26 Nov 2024 16:11:12 +0800
Message-Id: <20241126081116.2535308-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0066.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::10) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|CYYPR11MB8430:EE_
X-MS-Office365-Filtering-Correlation-Id: b08d9cb4-d221-4213-15fa-08dd0df1ece2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?wap+Z981xHH4BeyVQwMVBkaZDmPo/zAVqILC8kjtpDhAPCauZzzVEFdtSMPX?=
 =?us-ascii?Q?wIqYUpTbVVGosmzyBb2odY3j1WHuDz0f+NxaUIffO87kQu7iTNHav3MtVmk6?=
 =?us-ascii?Q?MSxZEt4l8NYHuIIShcugrur0rx3haDJkgwVe/TrlTEx7enFtPbaWLsBSR5ys?=
 =?us-ascii?Q?XoJbCFl/jDVhZuYJT/G3ULaLNBACulsWOvlJXqy7bBoIa7AsM7f0dh4AwG6W?=
 =?us-ascii?Q?4iRob01qSQS7lsv6znQMfOiEkoDrqKb/98YESQrBw4OdHwKbzYKIarj+OmZa?=
 =?us-ascii?Q?bJ9HaTpIWWJDbKgQophUGwLMomjtVUU24GIfMf09nNiuAXxFRG8gU42oB9Hv?=
 =?us-ascii?Q?/Uz2PjHhjFnAUJ98+FiP3kEqlx9sWJyLT7/yATrzrO2XqtLcLyEIDovO2J9P?=
 =?us-ascii?Q?vhB9YzV0Udvb56sMDd5dpHGV7q6hAD6gKJaB9UjuCs3pB8ftqw4a7SOof+51?=
 =?us-ascii?Q?sr72LMde7Bi5cRa8KuuHhlqrVmZyMpHjupE6gatFyhN7RdUtsR35VwtnmisV?=
 =?us-ascii?Q?QK1T+QEjyk3WXZ0KaUtLK0u/C6m0Gkdq/2/nOBvMVyCnl+SCp8gDfpcIiolE?=
 =?us-ascii?Q?jpuMRvIYdgAl9x3LKH+XwjUGOWqDI2yRIufwY53LDSwEn61xXIpDX8o5Ca1U?=
 =?us-ascii?Q?jo3YPYuDuLr7Lz41mTgQ8xfzuLqVuYpnX0yUU6BZqf/4carxbW3//iEes273?=
 =?us-ascii?Q?gezvTVDmH9oYMf4Schpwsr3XcTZPu1tdr+NCBczeX0u7vmgkJy/eihbRoAuE?=
 =?us-ascii?Q?Ay+mIgB2haA+Op7U1knAGEQ7Hmv809yfVM2zU8Ct4ARhqwtRqgf+qniGHvHH?=
 =?us-ascii?Q?HiQRfUOK3Mo0CdKVOIbkjPOW3h141i0f1LmZDasdU6EkK4riwZc7iFQZd6m1?=
 =?us-ascii?Q?+i4E3VFZkcsaxkPBWwk/XhTBVm8usavRlNXm3QRtRIazKw3mHIRo6xYZvlW0?=
 =?us-ascii?Q?YHZF3t/Ge+N9X9R2GftpWVH5LUYoLKxLLD8hzrvceJ+b9TsxoGUokNSzNM1k?=
 =?us-ascii?Q?C5zd2agkQN/LbizXQWoH/qOcjLiRX1lh8wPYoHQB2JeXzonckKb79n75Jou2?=
 =?us-ascii?Q?0omz4i3jEhxq5DxkUYIpXk2X4fo26IELcjctdoVXK3e8BDQkzil9Yh4B1LCb?=
 =?us-ascii?Q?U47GNW4PNlgrGTXFIalFi7oFI3KNxW3I/pvT2jvV+PRTK7YGlyl35Q+GS1sb?=
 =?us-ascii?Q?/b8NSLNWr37IrH/H2BB3+/Gjw+Z20+IASDiW/e5aLGHwaJOGrrDh3nMLQTus?=
 =?us-ascii?Q?i/29BUSUhnkMJlViXa5jiMIuaCvfrs8egHgMqdpVOy026aXD0tKt10sbCvqM?=
 =?us-ascii?Q?bPIEKPhQgWH0FuICOTOCdwaYP/OXnb9RpQepFEhMzzVP8HmMDMOwxhiZgr6l?=
 =?us-ascii?Q?X+pTC6E=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4IBqeVAKzPfEV6EboLokhXapHGg0KuMlOO7mtyk9P5A587BjoR5M1+FcTKyO?=
 =?us-ascii?Q?4phMvmGzUPWu278KiS9ywXlKpmj4WzAV8kGotlTGsCm/Cp33MK0RkUrIJp7u?=
 =?us-ascii?Q?7TNVlxr4ncMsCIhC4b4PAuOyw6GzeaNqp2D9YnqgvWkhd3FAFdqUC3wsYUue?=
 =?us-ascii?Q?jjqnYMntd8VRr/pNRjsAF5y4voKuc+H8cWHW8z96ZuzDCpp+q/tQiRTr7igs?=
 =?us-ascii?Q?irIAxbzt5iXiYwnZKDt+eYHJl7+af02U67M3WRYzjGBWrGbZvWIJ4p25Pliy?=
 =?us-ascii?Q?3TpYcPrFKJQivNt+aazJTRG+BUXQbgGnZbvMCfPPnYrfZztOdy5pYn2xMPub?=
 =?us-ascii?Q?aBQJrTSBirAT7N3JRJhobK9GE42pop51DI6G/BhNaHapuzzZnN1Ax49wNHIt?=
 =?us-ascii?Q?xqoKfLq7UWWMlWEvRTqQRKfAqVfOTc9Agde+VUlrY722/rua8FybtoU5WDa5?=
 =?us-ascii?Q?CGU5sLMt7C7Hk/yUNVS+G3BDmsby1kTA+ywkp5xnb+VlU5eoSsg8LQ4XyBal?=
 =?us-ascii?Q?XxSnnphjVH1vAIC1b2uKkgiL3jyk9uP0jtqlkFJJrkp2HzrhaMSg6o8E+U6L?=
 =?us-ascii?Q?QBlcNgLr4nrmq2dwHH/LhwhOpoWmEZ+QMWxWzLr6gjnuIq8w70BgeHUteAuf?=
 =?us-ascii?Q?E29jdZqWOiN0VyhYsnsbnluJU/iYMac8spZbX4Ex6ZM/Xq4T7Q9SNmJeQc8r?=
 =?us-ascii?Q?Dm0abg475mFcRolQKePdhYq6EDy8BNln/4pt0Q9FgAI2jwf+UQgUpxMd8Oc9?=
 =?us-ascii?Q?D8VAMNVYDkt/GPY2laU1cAKd6ig2Ev7uxT20cK/pRVmZvmIloFfRVobv1TF4?=
 =?us-ascii?Q?G6FDTZU/slOBhcsRKBd5FYEnszAgf8N/4YFiZmkBH/V9P4BdndtsjvgW0Mio?=
 =?us-ascii?Q?TDUDFJX/oRUSXaGOxTZPHaxCeHnuTvVW2gmtY3+tFLks+4grbgXqfLflhudT?=
 =?us-ascii?Q?e2xCRNWf6HaDeA7mTaAalKdwng9kt7NQmG/+lmBbnKuip9s2V3qDpbm3Q/Rx?=
 =?us-ascii?Q?fm8aXfG2aOlYVqueQjJ5Zd9VzqtqkGg7rI7FkecAmZXkK26w0xaImwoNmqvn?=
 =?us-ascii?Q?ik2dDCo4N1ct29IBl4R2pRBGpYq6Iv+dBt+yQzfXPsQKrmZHTZfCl+fRP7PO?=
 =?us-ascii?Q?v6MokyeAHd0Dc17PpC1uBZiUOiRcozuSYeetiFDBEAbTC4vKOIuM0Z8dA3eT?=
 =?us-ascii?Q?Wnj/zOgd4HNACURGm5xaF7qi4npq+ONLwRb9ZnKiuSS6xUZNhIdEZMDYvE+L?=
 =?us-ascii?Q?i60JFNH5za7qfhnbwBeIHF0J5LTCYvSajCf9X6IoumdqxdR32zK269wgKlSk?=
 =?us-ascii?Q?BG0TBpVa2X1y4eqfPgInO2DbfdNpfANxMSZ1btX+Jr6cd/l5qXQ+VUwYecOF?=
 =?us-ascii?Q?22rNky/1EYiOwDoWLZ3X4uXBxU2bsUDu/RGuFpsSBbD12/3nUO5/hDO+vPa7?=
 =?us-ascii?Q?SgrNs0WYsG+UrO4fXh7/+27BSO/+h70bzA0jiqTCH0WcAf7+z8R3flw2tij5?=
 =?us-ascii?Q?a4kuffOePw9ldWXiqWHqOl55Xlkn/XNw8oiY114yPpzaRtzbkbyKovbHi83Q?=
 =?us-ascii?Q?GjXLF+DwKDZ4/Hz5r5yEcHw1yUKLaO8DwxpVW7j5z1tl8WWLUIBrHkUQdLr+?=
 =?us-ascii?Q?0A=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b08d9cb4-d221-4213-15fa-08dd0df1ece2
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 08:11:27.0880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t78aP0GteWI6eHwa+QZM0z+eaW3IDx6MCS7nPe3Fr3iPoMUY3HXNXdM8blm2mq7GF2QUwpEVOQFR/1CFi+Ykp4qdSmY2oKYoVyzLijrwijA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8430
X-Proofpoint-ORIG-GUID: BimMPPQ8szRJgdqDEKSx6tQ1h-rZr40V
X-Proofpoint-GUID: BimMPPQ8szRJgdqDEKSx6tQ1h-rZr40V
X-Authority-Analysis: v=2.4 cv=O65rvw9W c=1 sm=1 tr=0 ts=674582b2 cx=c_pps a=AVVanhwSUc+LQPSikfBlbg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=PYnjg3YJAAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=z9tbli-vAAAA:8 a=vggBfdFIAAAA:8 a=5GRdTUugMrekBrTu13IA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=RmrFvp9qXTL7MAzcxlte:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-11-26_06,2024-11-25_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 bulkscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2411260065
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Nov 2024 08:11:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114063

From: Zhang Peng <peng.zhang1.cn@windriver.com>

CVE-2024-34088:
In FRRouting (FRR) through 9.1, it is possible for the get_edge() function in ospf_te.c
in the OSPF daemon to return a NULL pointer. In cases where calling functions do not
handle the returned NULL value, the OSPF daemon crashes, leading to denial of service.

Reference:
[https://nvd.nist.gov/vuln/detail/CVE-2024-34088]

Upstream patches:
[https://github.com/FRRouting/frr/commit/8c177d69e32b91b45bda5fc5da6511fa03dc11ca]

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../frr/frr/CVE-2024-34088.patch              | 83 +++++++++++++++++++
 .../recipes-protocols/frr/frr_9.1.bb          |  1 +
 2 files changed, 84 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2024-34088.patch

diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2024-34088.patch b/meta-networking/recipes-protocols/frr/frr/CVE-2024-34088.patch
new file mode 100644
index 0000000000..72dffb1328
--- /dev/null
+++ b/meta-networking/recipes-protocols/frr/frr/CVE-2024-34088.patch
@@ -0,0 +1,83 @@
+From 8c177d69e32b91b45bda5fc5da6511fa03dc11ca Mon Sep 17 00:00:00 2001
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
+index e68f9444f512..d57990e1a174 100644
+--- a/ospfd/ospf_te.c
++++ b/ospfd/ospf_te.c
+@@ -1670,6 +1670,11 @@ static struct ls_edge *get_edge(struct ls_ted *ted, struct ls_node_id adv,
+ 	struct ls_edge *edge;
+ 	struct ls_attributes *attr;
+ 
++	/* Check that Link ID and Node ID are valid */
++	if (IPV4_NET0(link_id.s_addr) || IPV4_NET0(adv.id.ip.addr.s_addr) ||
++	    adv.origin != OSPFv2)
++		return NULL;
++
+ 	/* Search Edge that corresponds to the Link ID */
+ 	key.family = AF_INET;
+ 	IPV4_ADDR_COPY(&key.k.addr, &link_id);
+@@ -1743,6 +1748,10 @@ static void ospf_te_update_link(struct ls_ted *ted, struct ls_vertex *vertex,
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
+@@ -2246,11 +2255,11 @@ static int ospf_te_parse_te(struct ls_ted *ted, struct ospf_lsa *lsa)
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
+@@ -2759,6 +2768,10 @@ static int ospf_te_parse_ext_link(struct ls_ted *ted, struct ospf_lsa *lsa)
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
+2.34.1
\ No newline at end of file
diff --git a/meta-networking/recipes-protocols/frr/frr_9.1.bb b/meta-networking/recipes-protocols/frr/frr_9.1.bb
index eea6d62f5f..a172a4c6d3 100644
--- a/meta-networking/recipes-protocols/frr/frr_9.1.bb
+++ b/meta-networking/recipes-protocols/frr/frr_9.1.bb
@@ -13,6 +13,7 @@ LIC_FILES_CHKSUM = "file://doc/licenses/GPL-2.0;md5=b234ee4d69f5fce4486a80fdaf4a
 SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/9.1 \
            file://frr.pam \
            file://0001-zebra-Mimic-GNU-basename-API-for-non-glibc-library-e.patch \
+           file://CVE-2024-34088.patch \
            "
 
 SRCREV = "ca2d6f0f1e000951224a18973cc1827f7f5215b5"
-- 
2.34.1


