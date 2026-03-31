Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DF66FF60C9
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 05:55:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13991.1774936541754412898
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Mar 2026 22:55:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=pTTJcoB0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8550d9304b=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V4OXZe1999440
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2026 05:55:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=qdFwi04PkyB2OA0f++ENBKKi4tDGxfB2RwTPzUmFyeE=; b=pTTJcoB0b/HK
	xcZBB59hvirEPP21TcrIDjbF4IelD4KSFygej5Q8iQ61jRe3HEo/V7JaMBTeIq9S
	No/SOhffwjYVzFhThw54PLgRlp57ONg4RY76MC7qkbCHVSMjXthCvUFySRjJrubl
	M+USRCW734vuMBWh7uTu4AaQfUxLqP005MKPldL+tgcl6xVlNcMTkrHdz8ZANh0k
	0zyy9jtubU7yvZF3Hc4YtJU63TIxQI7BSDJe/37VoSxk5QldG4Ik7vXMuGBcSVpB
	Af+1mPJFczEJzGXyAN8jxl7JgvPhlM2e50xQZj7OEgMxFGREy1IgY8iBSFFLFWDc
	XJ30ywU2pA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011000.outbound.protection.outlook.com [40.93.194.0])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d646vu76c-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2026 05:55:40 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zhash7rwg/fq5FhmaxLVRgMf05FFJxErCc1DnWk5jWb5p4cv/hP77T69IIl1BP0kAAFRZw2QrnJvmGxlhUt5IQQDrxDvz7GpnvkbfmFk9UZlMz54FgqoJhbCQRKQXuE7tVsrOwOyA+lVpDDjADR60gmjbjj5WYJw/QC75NwcomP/1bO4i446nEyLOcb3dHNiJTSJwEm0W0+fLDMRXMTm5VsA6E9JQQUvJcepl2ATyKfv5mTfEzHQ82Nmozgw+YUIY9Bzm9AiEH69ZNBosFJVNWrr6wzL73jCFTFdlx2uvRqfZW4D2OCVxvrOdkm5eda6tvbhLu0Ez+0CxugPL92ZGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qdFwi04PkyB2OA0f++ENBKKi4tDGxfB2RwTPzUmFyeE=;
 b=aBUAga34sUtu0GJucmzQUTiyrmVjTB6nsWPyOmaZDvhMIA1HvFv0sbbPwB3YflrhEOJh4n6DjNDy/5NUwc3a74zGFjUN5iH+4boQHOTL071VddyOr/3n9QK3rvDIndaDGDVJ5p4bHdFcITPyl2LqVgf30obfD3s0XYmKNvc9HMVhoGoUYJLw6VJo4RwcMmRC9J3LCou5SxAHoZTkWVSYjDcLcdmQAd+MaPjSnwk/8+0HKKsyTdkzBxCW+QC/ofwHwB60l1L0UpifYSL9MiHJlAjLKhWLWQ9NHpDgCK71uQS3KjcCCTXX6eyTKRibWe3HfDDrjRZVIggs9eUh9ErESQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by PH7PR11MB6748.namprd11.prod.outlook.com (2603:10b6:510:1b6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 05:55:38 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9769.014; Tue, 31 Mar 2026
 05:55:38 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/4] gvfs: drop google option
Date: Tue, 31 Mar 2026 13:55:18 +0800
Message-Id: <20260331055520.444552-2-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260331055520.444552-1-changqing.li@windriver.com>
References: <20260331055520.444552-1-changqing.li@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: IA4P221CA0002.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:559::8) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|PH7PR11MB6748:EE_
X-MS-Office365-Filtering-Correlation-Id: bd51f6be-f2d6-438b-496f-08de8eea2207
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	WPazzJkACLkJEJG6ClbgQFqmPohwE4DMW4JrrUwGj6T3R6sbLJ7jB18YH+efSYf6PZhDGXzOnt1axlCWEblKCG88lYGxlQcX3j8M/wClKcOOwLbBLRgb0fNPi99/pVOIY4XVU+MyG27UFUx9m/ox7z+cyXgwfnnSZNG5ppp/Lgh7QY5GtApsSqx/ByWXiU5lvbgXLlEYO9i7a82o+zzsZ5pRDW0avSSAFh7czucHB3YieYxLH5qVCLrojPFZO/ndaCdw/BVuGcdrCxFnx6ps5k1RyTNl+9P+yVERvw1hZyxF0azUL+GyyZPwDFc1+7jUjM2bQwKI619ZMjWf1Lp0Y1yeOpTX7e5EWm1FRLjz3RFuQrYFeeimWgpzaeM+5ILtcAszS3JlE2yXt7QH4Ay1fbNsos7UxGKBsnkPRfIw0dOMY+uDsIngm6gv9pIYfBbilAdCknZ+SqbkiIbkLPAcFs+releOKGWdFaijyfmlX3hR+0GaQEAfqVz+dGUXen7fZv8NYDrISrXCUDFRiK2lZ0y/hr1giOXOQz70ifp2bRPYYqf3JBynSp8hrhd4sEltp/AUztV8z+8MqTH/gFC/Dauc0w4b3x6fpcHfxTqPIdABw4h91XnjoaMWMrqAX958CaXZda+nd5lxoMS6pkjrpgCmuCv+TxCRBkoG+GDQmrvmk2oaho2IJIeA3VsrLtNKXQgzs30QVQSXDTY/1W0amtDc8B9vw2tlfY7V+euqQZlvhUw8vvZBQQDjEyTaTLUTfyzLIK+eKmezbjAoFTIpKgRJFWnAHeWHRfJLQPezphpQp+3swLpY+BItUT0WVw8I
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Uiivyy8L8oJDxTJo2R2DDjvJF0IYNwkb1yPtU9Zvf1NR96KJYL96f3EtsGTU?=
 =?us-ascii?Q?vyqm/K0VkV32+AHNoBPwUYZ0nDYb12vK2dlt+Ura+Ql2jJ+tu8eNyDtG/kgY?=
 =?us-ascii?Q?wQ0udfVSPaxGDVSJBXPRrxC4lmLxtTOKyehoFkMacd2AbzpmHjlE13UVjY+b?=
 =?us-ascii?Q?0iDGRLRFVvyGG/0ieu+ZOYz4V+R7m7bq0HqF/+LiJLvI00SBQAc+SFVqrQkA?=
 =?us-ascii?Q?EKZEPlX6OiJcaH7mVwN9Xj3Z/62RB5/lQ83Ne4022BE5pJbCYarT6/LZceHx?=
 =?us-ascii?Q?dev2+oOVSyKeas6BYiaKwQdw9HePOLoUYYkheE9sD8MnwrLDT/dQCYYaSiGR?=
 =?us-ascii?Q?VnFO3qZQg/I/55cfBYjflEH9OSbLLJCZ9fnzjdLc+Zwb10gM2obKAod3HusA?=
 =?us-ascii?Q?tV9kS/9x0rjF30NvQpZ+DStCqo37MV7me+Cr4RV168FtuSJzQ4gh8aiUC9ly?=
 =?us-ascii?Q?C4xhtpYDZyEy3KK7nMHjLobjz2oOanpqHTHq3IG1w7SM+fBS6MKcWmDZex3a?=
 =?us-ascii?Q?t9832ViZG82kYsgofw/ExwD5qaV/NzRXZnGgS04ojV941epqlh/ipNLlu8th?=
 =?us-ascii?Q?R4n0OF0AcESeGqupyEXQrt3kGQNcIVt9i61i2KYOY5CLpYsv3mBrfJK+l2tw?=
 =?us-ascii?Q?sX7aYr5qdPOTUU9xwHUkFSRaM6xsqrRNRjKOH7dvcgi9gg1Rzz8ayA0S29tY?=
 =?us-ascii?Q?yLoBV6YFLYaEINBHRK0x5Vz/0ys6tjRXNpTifpmQ6gB+EwT6GrUGwqDWDcQL?=
 =?us-ascii?Q?42M0LjqpiasnXwoS1drNx049ty996NjQohvxUc4u8bPhSaJNQP9UCxQsHMSb?=
 =?us-ascii?Q?X+dp2GokDjna5kSBEmxfEzCgsW+Z7fUqZJwDeqr23iNZ2bVzqGq9oJMNgX3D?=
 =?us-ascii?Q?4nmbqrm2IY/5X5Gv3u7fqYLvGWZjIXkJOUBN7elx/VGzmq7Fcs4gptQBcPTa?=
 =?us-ascii?Q?BDTfX/LA4dO/xYkYX7aZnSTr2+0AUiKTb0NTtTQ0cTC5xz+CXeGZlFb+dVz0?=
 =?us-ascii?Q?5a6xfYl4PB5u91YBQMDpnaMquM4AviIoVqbsiO2Ix07yPPBV9lHQliqLMsvB?=
 =?us-ascii?Q?1+1dLA0QSlvMDZIfToJne8+G4F9BIJacBqCmjqN3JTQv+vIdKtoM/5FeZjcr?=
 =?us-ascii?Q?oIunEXaPGjcWwdV/mdxaGSSBfPBZJ99W0HNYXUYp0vqz3cZBSh/KigvWmEtv?=
 =?us-ascii?Q?TjH8Mx3xePo5tkm2eY3SvV4f87ot51iZwbcCW8wrytvNGn76wYuZeBoyyI/0?=
 =?us-ascii?Q?pARRRMC9t6Mp1xh5XJ/IgPes8VqLaE4X8idWo+71ia++SyFmerhuNqb46gQZ?=
 =?us-ascii?Q?OZu6NpRWLk7wH6a93fb0W9LXB2cS6QfA2OrdpAkh731r3EEzfuKmI4y3F+A0?=
 =?us-ascii?Q?NkOGfj2fAK5N6uxVf37+gHkTDMt946kqNPmtynzey/27pMa40VzN3QHxhhIC?=
 =?us-ascii?Q?apEOfeUrid9LlnfAZxkxa18nImeG54YX4D1kLqv5oZe46md5/BqlK8Ic+Uci?=
 =?us-ascii?Q?6e5oFOjuhG1tr+w+qQcZCJe5AvAh+qW8hrbGbLegKxsZLdFGuthm5g71t4pE?=
 =?us-ascii?Q?uuN00yBbi91o++eQwRkW37kxqnxnLE9mXi2x0owzK5lER6YDD2Dk3mZ12/Gf?=
 =?us-ascii?Q?DfLLK5bVmwBI3qbQpfmxRJIQOEsKxxj2EILQcc3xoGzwS01TzeZh2OJDTXHM?=
 =?us-ascii?Q?Yr1qhFcQ0iWmdZQla4URPVX5ixafDn3WYkePz140Hh18kg+2l6rZX8y7dXtM?=
 =?us-ascii?Q?WYh4O3ntxRYBpJenmkWnDbbz/XdhxMs=3D?=
X-Exchange-RoutingPolicyChecked: 
	NDnLCTD7Mq3EoDQH4d6ttcqr/8fLJgnl+ijrgyadgSHxnY/zGiSPm/YPfK2ufI7U0KMdRy1jWrbLpvvREix30WU8tMtBnWzYMAPVNyISCwqaB/qGG7weeq4sgoqGtANj8fbVsqMslYA7ODS/aoqxiEJsWc0jQh41jBN6cHH11p5uB7OlRzCbtcfzkVh3D8Yo3Blp0x5s3dIvCGMCE0GUqMhWRVIY527Dx6HjHZIau6EPH40iNuefEKe0HqcHClAXS8+OyC9xnGUWIQxoctsiY3ta0+Srz2YxQH7EjICtWLvlOntZg7XEu743qICc2IaPqtbfZ6bEgVkHVAOZ5EhwOQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd51f6be-f2d6-438b-496f-08de8eea2207
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 05:55:38.0667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QsA5BvitVFuI6N50Ju8SM5E8wlzKJKSoYhJJ96JaJuNgrhe8IaRmZFQgJCXxuP3sTN7Q4iLEKAQuuVoi47Xh1j5P97Grd72ehrI5bFxyP/o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6748
X-Authority-Analysis: v=2.4 cv=Zqjg6t7G c=1 sm=1 tr=0 ts=69cb61dc cx=c_pps
 a=QnZ2uEdZlRAtgHxfLCbJPw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=GHR8O2WEAAAA:20
 a=SFbbONLXAAAA:20 a=t7CeM3EgAAAA:8 a=6VkjH54F1Yo8vJXnF-MA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: YXrV_j9MQrG9EhcKq4RdCGNgVPx3MmRU
X-Proofpoint-GUID: YXrV_j9MQrG9EhcKq4RdCGNgVPx3MmRU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA1MyBTYWx0ZWRfX41a6cVk/PwhT
 /TBNcO163aNjd/td0Q9i53+bUi03Id5uDTw16QqehFcNky8lYlCmShX7vxF7VFX2IqkKw9A04Gp
 jCVuPt0YGx8IbueyKzFnBecuel6eknZ/4ap1MMRXuGgC6kBFyTFWGNvYUi4GHAHprpEIkliPL+Z
 4iKix5Ad0kxWljJ0cGMzVw2i02aNYM3XInxQMxG3UvjyeWwMw5aw+c3t+pP/MsA36ST49ixyPYw
 xRB8lj6a27wxZqfxgzk20//rLaUzbxGR7jqgqeY8rs4Z0n/OkBhte+XO7QDvmxpRB/vtsYpcLoo
 eEcbe0r9ZVJ9Fr7I3fWSJfSleoxhox0bY1fNqCQXvtN4/1XDFqFQYLDlyZ9VYvyywYFWHWJplca
 NghsreWDDb3nCThj6XNBHaeUM5bpizEnAXJSgYqM361aMzLDVAT8m9njpJJIVyCvQk4RSUbxkSd
 ECeE9j9VPp71OrJTeGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 suspectscore=0 phishscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310053
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2026 05:55:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125874

drop google option to remove dependency on libsoup-2.4, refer upstream
commit [1], and disable google option explicitly

[1] https://gitlab.gnome.org/GNOME/gvfs/-/merge_requests/266
[2] https://gitlab.gnome.org/Archive/libgdata/-/merge_requests/49

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-gnome/recipes-gnome/gvfs/gvfs_1.60.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.60.0.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.60.0.bb
index 434002e440..2fda7cff75 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.60.0.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.60.0.bb
@@ -24,6 +24,7 @@ ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
 EXTRA_OEMESON = " \
     -Dbluray=false \
+    -Dgoogle=false \
 "
 
 PACKAGES =+ "gvfsd-ftp gvfsd-sftp gvfsd-trash"
@@ -60,7 +61,6 @@ PACKAGECONFIG[dnssd] = "-Ddnssd=true, -Ddnssd=false, avahi"
 PACKAGECONFIG[gcr] = "-Dgcr=true, -Dgcr=false, gcr"
 PACKAGECONFIG[gcrypt] = "-Dgcrypt=true, -Dgcrypt=false, libgcrypt"
 PACKAGECONFIG[goa] = "-Dgoa=true, -Dgoa=false, gnome-online-accounts"
-PACKAGECONFIG[google] = "-Dgoogle=true, -Dgoogle=false, libgdata"
 PACKAGECONFIG[http] = "-Dhttp=true, -Dhttp=false, libsoup-3.0"
 PACKAGECONFIG[libmtp] = "-Dmtp=true, -Dmtp=false, libmtp"
 PACKAGECONFIG[logind] = "-Dlogind=true, -Dlogind=false, systemd"
-- 
2.34.1


