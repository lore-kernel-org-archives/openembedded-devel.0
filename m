Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 056ABCAC5A5
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 10:55:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9728.1758711309607385499
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 03:55:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=l3paTHLY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1362e8e79a=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58O5qD9O387470
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 10:55:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=ve8oJlFEt
	hi/U3XTbuY05YBQBCT8LuJKtGIzNjkOofc=; b=l3paTHLYCVBpQaraW6tqL6Coo
	ibqArhEeiA5of7ocalRBYTvzBxPN469p/2fcZy7aRkmumuj6WW+9PRvE0jZvoV5k
	QCZABXNDNBv2KnYytN3EDoFgZoAU2UqrW9Or6rR+cJ2dHiggsRnUsMtYB2DaPVR5
	J64ZJmcZLvx82vgfc1oguIf9dpLJVtn+hBmQZEtTqSeHdehIBT/YapRvRoeDT+C0
	ymCVXuXLZaig8oWiZVWxckCAWPX/cb5WMEV5XKsQPFOgHrgktlDRtk3oWURMfs8j
	zzUp2knqPcAheeOLG2pazhI32E6nh+xr9jEgfwBl1oT/4F0yEi3xtfBpCwS3Q==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012025.outbound.protection.outlook.com [40.107.209.25])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 499hg1mr37-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 24 Sep 2025 10:55:07 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DLtNyVssehCgve0PG3+nRp0NfXcjIzjGuMysy5pICw0/J1eRf5S0MDmcEu2GNkFVUOUofWQDIB7eyJbWDKr2O/Vp0yOo+nQekERhUIDRtrmnAbjHAt3z2YvoY5uUug8tEJLCZnj9LCkbtpQ6GtB8Lsv7Gs+FpJ6UHFmOyFVCxwgnbKKYxT/xw0VtNONk1xJ+DyKZG+O0vJsL5foFRlXjnef4xd0/zdnQjr0PbxZul33vgEgFi1fyvPfJdfJcx9JFSj0bsVAaIzjsEBF1ONjKHMMOp8DDHxv7lXJxM3EKC2OMEMk4TNdie4MxR9YnYiA/Ial7q6Zhh+RS8fYdiUGpYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ve8oJlFEthi/U3XTbuY05YBQBCT8LuJKtGIzNjkOofc=;
 b=M5t3Kpq+XbnY10o81jcNziwrak72N6ll/uji2/dKgVMR/DKOgVuVPkoCeyozeue4wScFTpUCwvz8KrA3HWwP3heJhSxdPr8R6VQhIoZ+UIqm5RQl1pj7JFegUp0ZpG/JIot+SWbqJFmSuKsZGUtUJZDkDhvyhT8W8r4Ot6xslBWKw+1blvojefsDXcIGW9cq2fz4jFXzBOlsVpJEdya8UPVLDorJMTYnid4xFho8uoVrvROK+njok24eKZx4J1jzI0Az7p2zX1n9YVUYfOCx/SrDsvxMQXjr3aAJN0QtbsVQ4trIyEV19knm+jJREnfC6C/LFZ/U9KKlX4rNbsxehQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 DS0PR11MB7621.namprd11.prod.outlook.com (2603:10b6:8:143::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.19; Wed, 24 Sep 2025 10:55:05 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d%7]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 10:55:05 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-devel@lists.openembedded.org
Cc: skandigraun@gmail.com, Sundeep.Kokkonda@windriver.com, raj.khem@gmail.com
Subject: [meta-oe][kirkstone][PATCH] layer.conf: add bpftrace to NON_MULTILIB_RECIPES
Date: Wed, 24 Sep 2025 03:54:47 -0700
Message-ID: <20250924105447.963430-1-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0062.namprd03.prod.outlook.com
 (2603:10b6:a03:331::7) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|DS0PR11MB7621:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ab0cfaa-af62-4b7d-b2ef-08ddfb58d195
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?wxNboqEYIWu2P9zoS5URrOheFmk9giARiC79Xn8h2tjylshRde4ovqPC1z6p?=
 =?us-ascii?Q?WcY4BPMxm0ABbpsXtsDGjwiCnHdn52h0t0sRetfgreZyJtDafwSKs5EcDDv8?=
 =?us-ascii?Q?Y2wTVeli2WSMlLswlAQwgUOdMiAezg0vhVo3IeexMwvdiYUn2Er1QWW3uDKO?=
 =?us-ascii?Q?YL/rxFXRqnRFdSvzNkDi+Q2MdXwI+wUfjb6M1/xoMC5JtmZ7HdQz5ku9qAd8?=
 =?us-ascii?Q?dUbFQPyUtWojWC+FUl61crSTqeEEEaNQffCp7T8cTMpw0jlWC2LgLNhctXyY?=
 =?us-ascii?Q?Wb+f0k3WQ9lCEWLPkKMpTPPPONzks3rIOzp23pfiAFqzsAFM/Z85cl5AsPpf?=
 =?us-ascii?Q?mWf4AsMCrK30bQKQp4zk4U0Lw3+Hk2ZU81KcVcWAxaxV59kmTwDfmRWCzrIB?=
 =?us-ascii?Q?y+FGouG9XlFGntX9L7hnyy9niYv26mgo08dmms60BoJQ4S2fJjOilN+TZ7WV?=
 =?us-ascii?Q?43/23Iu38NYrm6YYzQt1wcGdfv04sEZQvIG3WyCmzc6D1rbJp5drhZj73Wt+?=
 =?us-ascii?Q?X1Dq+agVjb/Lw4f8l06aF8VqypxZAUIjfzaK1hqvOxKEHdm9wG0NlV+BaMvv?=
 =?us-ascii?Q?KtvfNMamL7Q7Qql8tW/pyTJJPsjcswqBNLmEN8qeLo61ZTEvUxHjFbGMxCmF?=
 =?us-ascii?Q?8Xmdvi5bx9jvDsN9JdjZdCRjMenngHENFy7QrxJxCkFY5NSvqT9P1+k2Ht4w?=
 =?us-ascii?Q?xgTQquLxO1RgeNk0oEgd2fjkh337OVvVNkDBhg5Aw1JFDKuU9Qkq/lQnlLKJ?=
 =?us-ascii?Q?lEAGJt7rQqA98LHUSwK/FHBPWRSguGlbCV/y6b91m42fywuFdX+K5Bd/NAUH?=
 =?us-ascii?Q?g3nYNXPOe7ELLMepkHNQB5VssMb17Fs6eYZN4Ncne1oV3gAMdNSNt+grqPiz?=
 =?us-ascii?Q?0u6AFBny2bAQbV7Cx+Tgqy8UJTo24XkFu/S2SBnstVddnpLNbXZiRKmRGINi?=
 =?us-ascii?Q?Lb4EIFOVUuEAiWCldAmk39hq2HaSSSSWsfj5eGZmRmutj9O/9Dz38w6kyeI5?=
 =?us-ascii?Q?qkQSlEV7k7jAG9OET2hxwSc57tXEUYcEmwvFWbRU7T+EH+qflPcRbc3xH6uu?=
 =?us-ascii?Q?vFyMhPsgf6j3B+Nm76x0cRW6xJqGcHYHWZ0fRrGv3NCwt2T0EK6d4WT1UArW?=
 =?us-ascii?Q?pW7Kv3tvBnN3n8QCyVPazGCnCTVVDekgg0s8gqt3BO4Jz8qFLTysslC2Y4Xv?=
 =?us-ascii?Q?uZcXOtfmCTYwbwJX3O0XV4xyzXW3xSU4dcbiFbvEUHExgROGUwsozOFVRCnm?=
 =?us-ascii?Q?YHo8szvIO6oK2tjq3OzBRxUrbPg8KYPPkMZJblg/f6PbaoArLXz3VKcIeBDe?=
 =?us-ascii?Q?XdAOa3iF1TlU0WMbIe/cjJawN7aNNUXdkkwYk+3IFMBazqtAkUbo4ItOxZfV?=
 =?us-ascii?Q?EZH/s4aU0bIV6bk7hCo7z4TybnODYOFJONqho8zKyFr470PDTuxFPevbNCZh?=
 =?us-ascii?Q?6umkj3d0YGukzQWxjFMjkSKgbLeXAOXG59gVJqBg28KibtzHCeB61A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uxsfDqgvxUFtsn13/+Q8qd4a4wzNJ/kqcDKGfJuFG8QL+ENhYr/+QPD1Ta6l?=
 =?us-ascii?Q?/8mr7+ajZLhtrneE6pSikyM3rNNx7KbK+t8zUg74LwdIbgpKIe7R5tBM6WMf?=
 =?us-ascii?Q?WzlVZp0/9z8KBrUP5t6o6iIz1kEk1hue7XOiyMrLzf7X3z8D+4LJQL3rQsIc?=
 =?us-ascii?Q?izDRaP8DcwUIhM2SlcyUbVQT0B8+c9EpaUUIqyZmfPMNq0J5ZNkXjvierk3O?=
 =?us-ascii?Q?FSsIbefbgp6Vjp0aEqctAsAi/bgzKlv5AR2sprgLCrKb0uQx0hLsLIoiahAE?=
 =?us-ascii?Q?LSEOB78jpzCa0tOmwNtGRFhf4gKw3c4hvGrAUfQs75uc5mNk/5h5k/MT1Le/?=
 =?us-ascii?Q?tU0ejSjS+W1FfaEeD9c8ZjNOdWuez+BAKb6g0T3Y6XE8HUrjCakLEgO2hxzh?=
 =?us-ascii?Q?X/yV5iDp3zPRFXbsvqZUi6n7bPlm2dsboubetyLTkL8JCxrTNoiT3zIhWqiL?=
 =?us-ascii?Q?DN2kPtA6qGXHIrWNOZUBJ+RoVklmyL7gcSwJ/tjUJDTQKcpEj0cEb799TKkz?=
 =?us-ascii?Q?SXjyxLMownjIgoydZoEZ3m4PZUlY7x7SQDntfC6Qq0Lu9t9M62eMVP7rJxFr?=
 =?us-ascii?Q?FHc+hoRQNKQEfCL3bhhh9Q/cooRsjE7/h32lqUq/KaXZc+CCBv7AZEZLDtcl?=
 =?us-ascii?Q?z5ugeg/HKaHoVx12QuUIjPsqgXNMal49GQUIJjFbYCG3BtnqeZCh7G6pIkec?=
 =?us-ascii?Q?5INJtDiPnU66r+IsSJDqb6CNHwsr2hyMS+bL7b2jNPhr7VwXf7QK9GO4O232?=
 =?us-ascii?Q?RztObmxxggTy3mWbmVh8EIlWp+WHGTOb+Ukyv/4Egq6Vhr3GkFAtMIKefe3A?=
 =?us-ascii?Q?o7hzd52nYyk010tGQH2ZsEg4Dn+QaZzN9mHp+iKPXdXTaMOPi2KIAmXsmw/C?=
 =?us-ascii?Q?bHN4HY4sL9+xsYOaz36AqF5K8vfG89UmuHrIkNy35prvH3ZmavQ2ISOBuLt3?=
 =?us-ascii?Q?BtXJPxaTvjoIH0U2WsVpt7ZjcvFA5wO24re40iS/G3eRcUabUYHpjrhuge00?=
 =?us-ascii?Q?ldrujPO18gSNHbsNHrdFjNAO5QSi3ieuOAe8vKz8VpLg5e4UDvds79loZTcQ?=
 =?us-ascii?Q?tsCvGxLfeF9u3JD9++SfzmJsUkQ/WiAlg2P2/q4fWXebg1YuD54WDSl9D8pQ?=
 =?us-ascii?Q?9qoECJJ+WnFeJv3unfVmMPgFwsP3r/PKeM4pDcznz2yEHCzDiZslVr9bypfY?=
 =?us-ascii?Q?vzctizpKuFPAaSNTFegomncxr6rOp8bLpMw7q47X94yNU4hcTrzVGmKrrcSZ?=
 =?us-ascii?Q?pztvJAlNJ80NYvGXBkGrfwCzw6Hi+ds46DMhmNe9RNmESSzN3L6sSAJkkD32?=
 =?us-ascii?Q?HzXKEyZ9ShkIYXZyiXRhnAEV5viWwOG9LRI46Zi4LhKu9kPYJn9x8hRwsYEY?=
 =?us-ascii?Q?BwU8AiVvOhJkN9Ts3VDkkMaEzC/+WbPtkDFHOx7fJPOV9LeE6PWdyTuX9RQ/?=
 =?us-ascii?Q?qTlh9SkwkmzViZcZrhiN/l+ISk2PMMovZvz1jSaH8TYexf5DGGCalOI4MDJL?=
 =?us-ascii?Q?XPfRswM79QpPglzMl2fwSu6gyR6iGpduNQp6eG5q6gkku/cDh5TZ7Pa5vRUc?=
 =?us-ascii?Q?/O6pZ+eflc53aVy/0C2NG2OFRLfceiVnYVfEENkQANzJgjxjWJF7cF/UVJfV?=
 =?us-ascii?Q?iQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ab0cfaa-af62-4b7d-b2ef-08ddfb58d195
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 10:55:05.0227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3rL3VnELTdC2fCT+b8rRniZlCdPGJkZanGQ0mM92dRn74VbXP6TP0dScCJNfexnB7H4sZaksEwjM4T2choGf8QDUBy8bKuBuDZbAXdAHNsQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7621
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: -Kjx0GMdhaqVN3V_lMGiPmqT4Uj2_tUt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI0MDA5NCBTYWx0ZWRfX4QR4smMVBQuy
 GO/fBmbNyMxuXg6JKvHTUzdEdYYRFHdvDUTy6CmBwLpeZ6eDp78lojd27fA6GYz5G0ue4ZJwEAK
 voUOS0CP4SBML1WzU3dw3EbegMQGJxFf2gKeh+d5r5c/IN849fv8e124V35m9mkq2JJNKrKfXw3
 7zDZ4OlM+nKZop6lRFsZXpTixcR1tepjunNMEOBXOiDpAJe8Mv5/Mxx+5J1JZb8gYGgEYhzosM2
 uRSNYf4v6oLD/47V0x8TOZjSGvgrFTJTSBT+xrN1QVFvRkqcg1Tlb3QRTBih7YDu0VMnKNUd6wW
 4PLDSKOGr7BecxW6DKWlJcQm3wJ4c1CMCH+vpcPcYlC+svRr71biTF2QeLuqvU=
X-Authority-Analysis: v=2.4 cv=Yfi95xRf c=1 sm=1 tr=0 ts=68d3ce0c cx=c_pps
 a=9+FlcKToPViwBAZXYho+KA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=t7CeM3EgAAAA:8 a=Y7BqFZQdhNh1JCg1PW0A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: sFsp1WiM6XUSEXxSJMZPAqP4myIqVelb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_03,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 10:55:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119802

From: Sunil Dora <sunilkumar.dora@windriver.com>

bpftrace need line up with kernel architecture type,
so add it to NON_MULTILIB_RECIPES.

bpftrace must be built with the same architecture (32-bit/64-bit) as the kernel
to ensure compatibility when tracing kernel functions and using eBPF features.

(cherry-picked from f8498f26991fbd8ea996dcf7c63d1c79e9c034a7 in master )

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 meta-oe/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index a0c644a2f4..f0cf59e091 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -106,4 +106,4 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
 
 DEFAULT_TEST_SUITES:pn-meta-oe-ptest-image = " ${PTESTTESTSUITE}"
 
-NON_MULTILIB_RECIPES:append = " crash pahole"
+NON_MULTILIB_RECIPES:append = " crash pahole bpftrace"
-- 
2.49.0


