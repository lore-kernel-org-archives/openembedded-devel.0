Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7ED0C369A1
	for <webhook@archiver.kernel.org>; Sat, 12 Apr 2025 09:55:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.7821.1744451699874179111
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Apr 2025 02:55:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=61970a395c=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53C9o3R2020198
	for <openembedded-devel@lists.openembedded.org>; Sat, 12 Apr 2025 09:54:59 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45ydd1g9qk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 12 Apr 2025 09:54:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gXgWVtUiVSQd/kYqofWcg/SlwbEf4vqaBvGTnELt2aFrvk0xitwIoDy2QaCHq31vUYgFweoT8z0m2yq7lgkM9Qd8jX0Bx5MV3idWMqPeER/33yljENBESoaVLgv4bcJcRVnao7yF8ptLiCxU5feWe2F1AbiDTkCmtSzD3v5ltOR0OFJ+a8iVOYKq0askYVl2ES7DyH89nZJfifo5Jq+wMI89jqWIwBEUGBbMMXhmk97YPBmJg37s05TOF2kON6lwkBH2sPmmASqvPMfEO0vo0HgK+BDIKRIRkUCi2vp7Pp7babDqooa/yDk3P4eNboogmsfubh6ARorzJWn3hj2rBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KdR0sTb/KCvop5wbDGu58fBfEyRBCi7QzAqoQ0YKCbI=;
 b=u8pgqw8wt14Q+0/cmETYacrgItO17KRklo1EmfecbG0Mg2dYxzNPyEMC8i4LSzOjbxIwS5si62qH/dmNHf7v89DRXse5Wegana0A7gaXAEGvaaf8dmi+a55/c+kyJ2iWGhbZ6F4r0Bqss/hcpsp2gInNyCt8I0pvrKTrGbfY+M9JHWR4z91o8gA31B2FYxodhjPAdkqLaiaJ/WNBkWtHV+o9RLNpaoaCmiSc8kCh8iT0S0gvu+VJdnvk2dzlxjtfvBFVjRI+m06c9UfDJrlgOzNBN5u9Eu8W4H6zC2EftF072fvXvQEk6e7CnayXhKqjdPYWU7wc5Qu0J8AEA77mVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DS0PR11MB7926.namprd11.prod.outlook.com (2603:10b6:8:f9::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8606.35; Sat, 12 Apr 2025 09:54:54 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.8632.030; Sat, 12 Apr 2025
 09:54:54 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] nmap: set UPSTREAM_CHECK_REGEX
Date: Sat, 12 Apr 2025 17:54:38 +0800
Message-Id: <20250412095438.2633751-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0212.apcprd04.prod.outlook.com
 (2603:1096:4:187::8) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DS0PR11MB7926:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b4f5978-9bf3-470b-5dd8-08dd79a81342
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?IfemZbi0wX3VPbYO6obfAusaX8+9uHdzbYN59aWHNmfmAig5Bn+jTCNOiVfz?=
 =?us-ascii?Q?AZqSXyt18fewP7ZHBmG6yzsRrc4IkP4fWDolB+xrgXnABNqrrBmxJ+JaP+V2?=
 =?us-ascii?Q?xakFJRSLUk2NSkc3SW/nAtDYKNwOJHx5lyh/AKVDKEDPx/BfF/LEmoNAIYWo?=
 =?us-ascii?Q?fXO3sZxFbeB5wk9+QVRrXzNfFwmeI5j6FPE/9eSDVW9DC7Sv0gF0tIbeP78K?=
 =?us-ascii?Q?+enpAZohcjy/HSoQJnf72chMfDQC3A/+uRz7BYZKyiM2oJa1wOx/KSW3x5k9?=
 =?us-ascii?Q?rQ01GdwGYflyM+exCrl7IYliUWDMvbvj9ukf3qQ+XPvbubl3ggSB+pnQy8IS?=
 =?us-ascii?Q?1n5Ggy2opzT/1naMoj9w99raINVcKP3yR5F9snTN0rmPLYErL5XDGOqN271O?=
 =?us-ascii?Q?cjsURg5nPlvz0kb/dQf4WzpTPSjfDwwnE9lp49H+G/9vDCE02oUYSryaLzru?=
 =?us-ascii?Q?WdppDQ66jhuFhBeoC02W8YEP3gbDImq/qgQrjxUFLyhy6AxONwrTYLZxaYdQ?=
 =?us-ascii?Q?ZKQsJ64DnzkW5j+cbaHxJ74s9WvlgdO3fV9LnQS3uKesI49KJkFQ5IvrkZhj?=
 =?us-ascii?Q?aI6jHfAtUiCurF+XEzs2zRoSHGusA+LtReIt1QdqJq9FU+RnRpQj6+pBu+T9?=
 =?us-ascii?Q?MIurPVI5x/FqmjhA8TwkQZouULvGWKBth35Ue03M+GSqk8LID7vYUyQRxuw+?=
 =?us-ascii?Q?/cIPvPZPa/TskjpjE1R7oJRXm6ixpE2PdXpr0v9CY2JS3L65RKX/7ZTpEfRz?=
 =?us-ascii?Q?+SqtWOWud//EJrBgM4s0cYtVxnK5BpfrinTBgwe/uODMtb7pr9aW8ROCM/Cg?=
 =?us-ascii?Q?RnZ40Y27udKwuvyFNGOZOxDYRHKsdelgPn7KK3MnPf8rusaUUwoAnPKQD4bh?=
 =?us-ascii?Q?MzBt6BYNlntYICy1cX2FY2HpY8Xn+En/Y8pKyPHJXtgB8Y7aSbgUn+ud54AL?=
 =?us-ascii?Q?VPPEzPJJYpjP8KGCHm0Sw44Ogi40Pa/9XC+MVyEVFAXno2axNoZmPdKOlB3l?=
 =?us-ascii?Q?5YKOUgIQwpqv5Ou3F1d118b5MG3NW2KRL15yY2pBxpMQ5Mulwmtg3rds7cX9?=
 =?us-ascii?Q?jgGpjVhEQ3+W/6owLjH7VVK/L1Bth3Eq5FMBUJIKLfxmxegDnVnIne2EbpNm?=
 =?us-ascii?Q?wYtbGjq+5FH82OOU+z1pQ382Gjn9plfHcC6gXFBGrL8Nl/+W+10+W/eSv66h?=
 =?us-ascii?Q?fpZGuT0B/gGSS7PbE6Y1PtUT9+GtsRoOvlLTQ4C83sm//i/QQntY46/UU2Q1?=
 =?us-ascii?Q?rdGiwP3yAWWy3uclMDPHJiJQjc1afahy9OECiee6GPZKxJWZJYkPZSVBwCOq?=
 =?us-ascii?Q?K8SDoYh1XtxZbXvKJkI6ODP55smP9N5KAI4tGeaEgUIeHPHYtHRg928mcZRN?=
 =?us-ascii?Q?TwTKW/kigqRhh0cLYnKdutvJdOVDvksUfwGoMlMBXOIK0aoj7h+c9AZTAphx?=
 =?us-ascii?Q?dBvGQi2rPETFklJp7AysJxxD0tbE+9RWmQDNu60NzD5+0n5DwUWeqnO3IHRU?=
 =?us-ascii?Q?fpdW4jlYVbZIxwA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EtcyeafypIWte7iQjKja6qBX49V/4OHRqoJ+nMvow7DHgDQjKGYGSFhkT6W2?=
 =?us-ascii?Q?a20E2FSpr53lPA9LgLvWIxFSrnGfDm/95fhmnJw+wNqE3vRN8DuKnoW1I7Yc?=
 =?us-ascii?Q?KPxDlv/kbl82yZ61xErLudMqsqIK7yWM0+8EHT2x2pdH/c8GZ+BdrycdRy6w?=
 =?us-ascii?Q?mdsW0SulgxaFAJx7QnFo2lkKPZTYscy843RjPFM2Zzu5mSVXoN3dcuOlYiKA?=
 =?us-ascii?Q?0KLQNwNF4/TQRch8G85vquntliRR2cFa6rF24bopRp4TyU4EAw/a6XH34Kyv?=
 =?us-ascii?Q?5Ft5G6XP6r9HeKv+mZ9lJsmTetIjxyFg/HQyudykXvVrIilnzPV/ljSAtnQN?=
 =?us-ascii?Q?e2UId2kas6/g9Z83WlAO5SU8/nJ9MdcDvxQQJAcWSumgM3o6hb2AXR10aAZR?=
 =?us-ascii?Q?CiDg12b7coTPxmxBCxCeBLKu0zw96fythyeNj8kKIx4/FxkbjTTove/46QmR?=
 =?us-ascii?Q?iwk5CtVfApcfNJhUatjyBOmRoJaFyAmMri8RAl+ZpG9VZyoi+1OzKXLhyV9W?=
 =?us-ascii?Q?alenLzTLpr2uCcdy+bQmjz1gU/7dhTphgkQqIepFyGYpPVj6D53OP8pwAIo+?=
 =?us-ascii?Q?tiY1AgNdzDaEzs6Hr/GP252x6/1VFq+1Vij9z0o6D0J9GdDJ4QIc5gjG50D0?=
 =?us-ascii?Q?Ke86rnt6gXxTIxLjgU7fGZqjt9dwocRzVb5vuZpRrj3t1IvfvBiQzRCn6OCT?=
 =?us-ascii?Q?5HiE64gx08uBOIrke7zvmJJOsWqwS5RSQVqxHlQX5K/3xoO6pHEFkyku9B3o?=
 =?us-ascii?Q?h6VjdwKCY01jMoZEdNzFfwbwZwR5samwGQmMJJROCU5e3A5yzpVcJvY/LheO?=
 =?us-ascii?Q?wIICXaRUVMqj5HVHJEYKhfsoWDog34n3GtbxCsdRXlHshGwJQHtYh1DytsZi?=
 =?us-ascii?Q?LscHk8Rnx77MFbTw7I+hHD33NqPj//OPBDxrxMxy//4W6bMAIHe+5LCv6gi9?=
 =?us-ascii?Q?xr0+87SGpAAzrGQzjR69Ku/BVG1BGN7XwlDo5WhXq14hZgQKtjJLJ2fbb2cf?=
 =?us-ascii?Q?vuzuNlJke32iHmIMC4HzoLPlIV9roZ71KaEQ2HDYcXCoQXgLdDxyBU8omKTk?=
 =?us-ascii?Q?DtCCu4ssT+RDRGK/7V0oV8MXjf/iA0MRcWJBWEWCus5iE7oA9CptOT7SVJnx?=
 =?us-ascii?Q?KrGn5/rClA9gGJGL7Bjej5kYZ/FxYkiEWzjvLa7hii4u3byWCZZBOSugYw2L?=
 =?us-ascii?Q?Gsm6gdhB42TawQzdndhmALeEImiq96OFnKdiP1yu0KkY6ysYTR2WpoH8MbhM?=
 =?us-ascii?Q?n8k7xl/pjWm/VL2nd/MQO0M5E0yOrM3ATq7yXnpU3KxZSNu71lMngBmLvx5b?=
 =?us-ascii?Q?ESTYKSflC83oZHS4J5ZCgI6YPzLYT+Nf9crHbI94T9WtbtWGYNGuQt8A81OS?=
 =?us-ascii?Q?BoK9SPuwogn6qZ+QgRRArxUk3H+2gtB/lPwI1wAY+2sajboW0U3zY/LySagz?=
 =?us-ascii?Q?SPd4cz7VMYI6XtY9Ulmg+LYMkSB6sHIR4Z/BYD1gANdWe9AvwsZ4qVWmYMX1?=
 =?us-ascii?Q?wjDCNRzctMu88kZNC80/XBCXwTD4fr0wGj2UgZnCiqZPusHp66uH2wid9v9h?=
 =?us-ascii?Q?dunoMS9Uk6Ub8hKay0kVNpsS9KIhq7QRGbMi/TAQ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b4f5978-9bf3-470b-5dd8-08dd79a81342
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2025 09:54:54.4399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zg2P5LGyVHCRWgpCHcxwaoL+gwa9iWsixDizwH3ZDv2NXVaoxfouAiesDO571n8YgjoXnmgpiLU/d0TXR0cWFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7926
X-Proofpoint-ORIG-GUID: FgaNnzxVzDZ2ahVTmhtF628RKaJDG_qo
X-Proofpoint-GUID: FgaNnzxVzDZ2ahVTmhtF628RKaJDG_qo
X-Authority-Analysis: v=2.4 cv=HecUTjE8 c=1 sm=1 tr=0 ts=67fa3872 cx=c_pps a=XlWNgFwcAB8XWrBhwjv7Vg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=auHYCxwYAAAA:8 a=t7CeM3EgAAAA:8 a=oHvC5ASfruRaId63VZwA:9 a=67XU6oJk2Lrwzah0vfu5:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-12_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 adultscore=0 mlxlogscore=802 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504120071
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Apr 2025 09:55:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116810

Set UPSTREAM_CHECK_REGEX to check the correct latest stable verison.

Before the fix:
$ devtool latest-version nmap
INFO: Current version: 7.95
INFO: Latest version: 7.95-1

After the fix:
$ devtool latest-version nmap
INFO: Current version: 7.95
INFO: Latest version: 7.95

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-security/nmap/nmap_7.95.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-security/nmap/nmap_7.95.bb b/meta-oe/recipes-security/nmap/nmap_7.95.bb
index f3775f24b0..c410751595 100644
--- a/meta-oe/recipes-security/nmap/nmap_7.95.bb
+++ b/meta-oe/recipes-security/nmap/nmap_7.95.bb
@@ -14,6 +14,9 @@ SRC_URI = "http://nmap.org/dist/${BP}.tar.bz2 \
            file://0001-fix-racing-between-build-ncat-and-build-lua.patch \
            "
 SRC_URI[sha256sum] = "e14ab530e47b5afd88f1c8a2bac7f89cd8fe6b478e22d255c5b9bddb7a1c5778" 
+
+UPSTREAM_CHECK_REGEX = "nmap-(?P<pver>\d+(\.\d+)+)\.tar"
+
 inherit autotools-brokensep pkgconfig python3native
 
 PACKAGECONFIG ?= "pcre ncat nping pcap"
-- 
2.34.1


