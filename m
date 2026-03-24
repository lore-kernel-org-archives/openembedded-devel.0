Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EEAEF54AAA
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 13:00:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19084.1774357211119101132
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2026 06:00:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=fOZqu25t;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7543866fef=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O4uHJo1918188
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 06:00:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=v4AzM8tV6CPfTtlxrfCS3QfF+lB7e0iZg/+Lt6evu0g=; b=fOZqu25txFSH
	nw4J9pcvl3Bvu2uxUKnB2x0ITB/1BFm6pbK/0xdBpYnsjjyK+661F34QEeyZ/sRR
	+B6WhA1+CvzwcOd2MezfJC4711nIkUVCk1KE3VvluMQhON/MJt13i4VNku5f7Rd7
	bG0kzCcQrvRjRvmHMmLa3OK6A5I9NR2nYZW7vnGRaJG8KF17yW4ZKo6s6FuN/ZLw
	r7WyTbc+JsBJZ4OlRPpvw15pHQRfEjT6dSw89lwP52CY9TFaO6+gyLmM5GtFt29e
	C+T4lq2ZZuZLQtQ5cHjvAGHPzX+lLva19P1YO40jTcVCYnnG58i9gN5WXhTFSQ1a
	08plcRNBzA==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010000.outbound.protection.outlook.com [52.101.61.0])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1pkyb5rc-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 06:00:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bXy2DYEOc4OL+HEOkdaykdM5ztecaI6NjRP/QOIkIM1JDhoo3/h7JrVOyxXNp8E+1u/iVzw52792LbE7tHGEOgiNxpkaOz3H03MqIqtbWH7F5KZ82uPIwVCzGLFeS33kbEYsZaqNUFI6wI7kOPlGB2CLh/HUxVAClZOR4Se8PQOwN5Qr4VMHr/z+KENA1k0Z8Har73OlWdJglxBcF+N8u4EYfifHqBKL3YMZa6YegMiW9vKF0PYxByy88w/o3Yf28tCNpy3wO3v1m2BHTt8ta17NxGSu3CuFLaYdramQTIXM+S0zYs/i+GNtdTvOocQFFLuCIKIz5GaEhJnQpF8m+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v4AzM8tV6CPfTtlxrfCS3QfF+lB7e0iZg/+Lt6evu0g=;
 b=gy0L8SySNlYAx2V/wrwzKrKRuYCO5IMdkb6BsTxO04erehC6E8LEq3UpeqfJSxvt7Pv+phPgdIQXXew/si72yUGfxJahaQjiHOhWJ1WU1S3+7tBPSMi/CkkSJnWwKAn98j2myINDHvFVsplYdD46w3Fcv+BPic4vR9SRI4bAk67/dTDauXyKm1CVvobJlBelOWgttTB7aFvzGNoxYLrH6UhlWIzdjgrjvo9e5KvEWzqez+C0lmKS2QwUkdJVDwcdcMhcZW0A3LrJllhVYa8hxv6lR7KZ4l93N0M/ITSA/8j/5mEUKs4K4S2r3DKWLfGYHigCzkW3cBNSJX6IJolATQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by DS7PR11MB6128.namprd11.prod.outlook.com (2603:10b6:8:9c::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.20; Tue, 24 Mar 2026 13:00:06 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9745.007; Tue, 24 Mar 2026
 13:00:05 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH v2 15/15] xfce-polkit: fix link failure by adding missing gtk+-3.0 dependency
Date: Tue, 24 Mar 2026 20:59:27 +0800
Message-Id: <20260324125927.1070644-16-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260324125927.1070644-1-peng.zhang1.cn@windriver.com>
References: <20260324125927.1070644-1-peng.zhang1.cn@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0114.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::18) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|DS7PR11MB6128:EE_
X-MS-Office365-Filtering-Correlation-Id: 65f75d67-7992-47a0-1298-08de89a54387
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	XLi5iN1RuFJ/cTn8n+8e98XDybVWGrwW9t4t0zr5eBvFQk5DnzXTx1bPa2UEKYUqrl/C5y4WnZlSJln0T8X/Qf9BApvrem5bKoT1hqpKpRUDNZyrF8hLKaCBj/e+MMTHUrar93JAb9yFJTcmqgE4tnqMcqslNMs7MKdD+MCYfzOtXLsMULfkna9Rk+aJMuurJECJ9uglvywYABk7Wmb4MnVydja6MvmeJTAWY6KZrqPTbk3jcV0WmwkYQhVklSjBKDJmCw/SuYkG7rsPOAa0vLpn3aETbgG/FNYY7rEDOh5mY9JzSn+r3xGe5bk+X3re8RFl6HpFvENeiqMIjmfIsPOiLXQqygwhYUG2RhUGC37pTUDkFkduHszB62MfM99webUcJV4TcVL6uc1ANyAdT1u61ajYvyqJgb8I2UYokwJqJS6wZsUZolJEvdShQVUjyIjBZYe6vkhGbktyX3HgwA8OKt8zwv7Aj45JMz9jctjCezpx4czHY/bs5OZbRas8+U5etAWZq8WrakivjpxazwUhR2+QbMqKnEi4WQzNcFkSNWRlLOzYTMbnkGg/HdR8q6FU1PJKQ42uf41hNc0Vu3pI7eZ6hG51JBukLX3sNqEve5JBDk923RDWIPXIM1N6iOC5dm9EOzEXgtyKmi9R0AAhROeBdV2OFw3a0F7esRR4ucp7I5trK/q2VBBHHWC5bav0nVqGPoFj81IxicuEuUYMJ0EkKLv9QcBNtyRVG8pqHPYWfqTgfFaQnsrSfA8X
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RM4f9gniqEfoN+XVdP+KMuDMhH2WV4oraQ4RkYdfQDngK039WSoNP9nK2cRv?=
 =?us-ascii?Q?x7tXjveghXu+KzhTYOd+lUSCIziqrKBRxOUKK2EvU3FxSQSG/ZaijwGqZgD8?=
 =?us-ascii?Q?qpwyn9rwaeek68/E97zwo56XqmTMA7jOuLgGn02xblUZ0o5Z/gUI3UELEUsi?=
 =?us-ascii?Q?5fRNRS0+GDqE4rrFs7SO9UvHVgs42+q/xTa+WC893Qc+AGXu8g1KMGwiBDID?=
 =?us-ascii?Q?9DRQX24iCBVV9cEiQGqUWQmFlkGG3DKVumio8lAVOEtjHq8UkSHzh0QSwELH?=
 =?us-ascii?Q?zEk5KP/0PA+z6GQLYAsvJpIyTrDcT1783AAtNAN9o1dicDfrrsZMwYlKjNoP?=
 =?us-ascii?Q?Ru09r+70RNOWd4hw3WYjtQ0jtjSVFczjTl2TOT/0P+c0aWepZlG7wnjGvgae?=
 =?us-ascii?Q?5bOKqPwl2t8GC95Z9uCB25AWSVN6i4BRZJtyQDuk197SpV7hWTwx9uhs7VSH?=
 =?us-ascii?Q?uVcnCqPINKam9Lw5IdHgkJS4yKkxbGBOQMttpvkbV03prldQPT5SNePdbdXs?=
 =?us-ascii?Q?udqNP5O32J0vHlsiDa8NQGeYOIgTLTlB8x7f3PWWnjyKqshsQMHPFbOTmT8C?=
 =?us-ascii?Q?+vwd1OCL780UnJDT6wNG9S6cDXnG0GHXF/ct5V9FUTsIVTOjjWZjUkCV1n7n?=
 =?us-ascii?Q?ed+8za//U0XK8RH2fdxbocVzFZl0JjxFqZF7SoHbTRmWkD01HNIOeNuHyxjL?=
 =?us-ascii?Q?3xrwKXAhuRoo56t6brwOvwOuviisBCuIuq20YisKoCSm/AvYrBK1zMd2X2Cp?=
 =?us-ascii?Q?4WMCCpnA9j91EPxTS3faresARfPPZHV2sMI3EQ7yy3eDCqG1+8lNcv+pKnc+?=
 =?us-ascii?Q?3SzPRN075Gnw+XaxOjxlYFF1N8B07TD22VuAIcVqfNXRqaeIu30v+FURq9Yy?=
 =?us-ascii?Q?xK5BsXItDSXfN4SgKK0vk6gAplA6UaFb86WFP5MOOc6mOCpNPe3dPuWjDcrX?=
 =?us-ascii?Q?hujwW+UdEdAk4fit+tOMU4HjGVBUtKHqCy+L+y/aTjXvuuHo6e2ZtTmKMCXI?=
 =?us-ascii?Q?0+fCSL301x/JWXo4nNW1WqWxzqIjMOOq60pxYAMDJyy22SJRXimC2Xhf6tPD?=
 =?us-ascii?Q?9qGiUth7zRFylA/Aq9pEkunG2xyL+WQnmlRkBdDT6VaZhWibsGXDHnfc7Im9?=
 =?us-ascii?Q?92dE9DZckxElt+XZuCneuBWpkaKoocp/4Me6pcVWsCO9Hv201uTwGg5ZMLrM?=
 =?us-ascii?Q?EimNSgsfOCjj36mjMi2OiAwXxN0yvjnzBD3RPM+vXh7QZgu3P7PtAMueyIOu?=
 =?us-ascii?Q?JIhlJPSuJB0BzuBOZenOE1nye1UAwPNTe7nlBvNYQuPSOFoOWCPOR5h9bXXl?=
 =?us-ascii?Q?B6cmJQ+vto3Ok4L+Sfxj93/zC2FDIR0ZzkHaaQJcM4WjFyqT/G/qI4dt1KUS?=
 =?us-ascii?Q?xnecWy/CA/4iE6xvWIkY4HHARrnUOiazEw9jWNBfVP2klqjt8ynxLw2yyPnD?=
 =?us-ascii?Q?ztgDXFsuJ0c2V1TZt3gvN35bhWrZ+clt5gCPSsE6sC0CrGX2tJPxgTMrlfgK?=
 =?us-ascii?Q?urgpdnhyH/njp2C80f2DYiBTE29nzzeE+rydT4HAWBS0BAo9DQYVBFlYCmkj?=
 =?us-ascii?Q?ws3L3qKQ2MHBoaajQqNP2hfyxNYZzgsOyPIzC0jL9cBG8wNQmEw73awOxdME?=
 =?us-ascii?Q?1V9BvnEV01oM5+UIU4f+KV5wzs9S7HXQSW26TryJtr7UuFyrgM8sOIPq4k4k?=
 =?us-ascii?Q?YbkLrvTLSgzeOESNNnmsl4wjKDXBIyvCq1lNQuc+egjGTVnaLcMdkqjj8cvp?=
 =?us-ascii?Q?C9vJf0/P54dHiGBkyKxX04WsGv76KqY=3D?=
X-Exchange-RoutingPolicyChecked: 
	RC5na1L+CjQ9FaCfkjr2UzWmOgqGESYgcjv05aeW0aXcuOwxugenmC5SP1BdnMcnKn8L1LE6MUns0RGF6kZFluWgAE+pH6o2iyfStpbgJwFADkU5/BNjsGpy1oCoYIjesLTUZR+mnNm/wYyNs8VgAKLSK8mi7IYeM0owX5/UjTUGeRUE15Ig9U1KHzU8Epqg0cumSDdIDxOmqzfEy9Omnx1c3hK/Cu/2+vjgQNwZsyP6hp18sOa4Z3bJY7W177vWisUhGAKcktb9E4rXlhSN01IiApTYx/UhLwfipXF7RdbYbgHPg2Hk5dSIQINzI6lGvIBZOG9RzDD4ZnIrb+yJ7g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65f75d67-7992-47a0-1298-08de89a54387
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 13:00:03.0769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: svQfuZMFwEsepn+1B6hMe1LrwxpDldqM0nTyjoCICGBtWNKpvC0NmjVCMRSH45K1RW7zzTU53rike7Dn6AiOUjSILhHd7lDWFfytqUx3peo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6128
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEwMyBTYWx0ZWRfXw8iiR1C9odFu
 wvaYUIbD1eSsjDMcyipNpa4Dr/hi9izt4s9/erH4xsSS5/deCyK2iuuC5zapjm+rRIRymyOOvfh
 NaSHsygLnEWCdGnb6y7YPydkn6nasmgjepPBTBv2NK9nBjEDDQJ8IPZJR1r/Ad39sr8FWI8alLk
 2hX5mhBd7S4fUTkfueowi6+wqSZpzby7cpaNn6a+g6J2PsodV43cv0acgooGgSea9xIX8Cc1hSu
 dEl2sXiYziSJpNNKeeLBkXvVg/QTjirtav65h6KnGanVAda1cpqQpmuTBu9DE3A8qyH3Yw29ntC
 pJLaSHD40EhjRr/bG1CZV26CrSL4xXi7VbCyPENUH9FWTXUoezCbpefTLqKEDSG50I/sLFSX6WK
 3VnCbw/uj0tBBX9EQaB8p/IvavONvRSyenqF4eifYILfqkeysBM9QEVMgfGIaWQWGDUQtRdDTzR
 XbOLMQfN5hOJY+mptDQ==
X-Proofpoint-ORIG-GUID: oQu37MWVcVw5GvpaNJTmuqCXqVU8ZAf-
X-Authority-Analysis: v=2.4 cv=Scr6t/Ru c=1 sm=1 tr=0 ts=69c28ada cx=c_pps
 a=QHQ/c+VJRs0sJIezHEQ2hg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=e5mUnYsNAAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=7sqpSKcsBsmI2gz2FRAA:9
 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: oQu37MWVcVw5GvpaNJTmuqCXqVU8ZAf-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240103
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 13:00:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125574

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


