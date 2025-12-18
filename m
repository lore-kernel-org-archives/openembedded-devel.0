Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16EBAD68BCC
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 02:44:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32518.1766025832104590041
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Dec 2025 18:43:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Y0CjhyPV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4447e4ef9f=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1wDYN4012484
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Dec 2025 18:43:51 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=BjxnpjQCjR/xUDsyd7SH
	JzDTAxMt8P3s3aMGnQrA0uU=; b=Y0CjhyPVUV/je/38cKnOLCWNwcYl38v0RIF5
	nsgDvpc5ZJI20N1de7Pwh4tC2p7X8zhhI1Crx1akQu/NP9vz3cxW5JZ9Ga+l6+3S
	nCPyn1y0CXKgXF6IV6OzVVSkQWQ6Szr/fHJ+3P9EQbTF/BK17R9QWDVctO49PGud
	zMMupMSJmPas/FIT+Tqq06cDnvyg9CsM0WS/74zY2PDFOxW7Tkn/2u4+hYRfPeoO
	bywE1q0lOhdh3FL8xXwlAg9nfnUc5JJ8MB8MS1JSgRDcG+Sm8Nv1eSsSwZPQqm9i
	xvQN6NapADxF2U56/nVLj/yv3ZHRqvuXWfeXNWu2zHo/msSEFw==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013018.outbound.protection.outlook.com [40.93.201.18])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b3k0shcuy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Dec 2025 18:43:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KQTT+UlXtoeCqdPqxQZLtoT6dh50JJ6FY2c+wwe8ucGSHqDeV/qEQBOzTTGllYOhwmFsws1VChoC3ybn6sD/t6m6x6QUn5w/m6dAwizzVFrn/FGlX/B/HMN6oiChOwJ4icZyunfcatiya3NAkmRNsBORw07L7DWr1c6WA7ljh7jSWN7dW8w+qGafF8AECfDgqbE4Thl0btt2VLomuIigp9/zXwQSLD4G25o23xpBH0hPUybEznreTDppZ0eeJKPLUeWuEF5WMbB9g013AfEY/aBfFB82zp2VEsQ2KPrOs2bcmOH1bSemStGclHmNAQsToizujEOMng1qIUCoicuC6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BjxnpjQCjR/xUDsyd7SHJzDTAxMt8P3s3aMGnQrA0uU=;
 b=O4k4EySXqhd43sbsjKECPW3MhvSg2r+zv/xCttYlvM6d1uU2i3CIEsSvWtUZaryvAnLl6BrTPsj3pwr84dyoyIU4SOpo+OyYkPK9b4V0CSeeM8kfbrU5JZZZ9o8+jb5vDTpqmJs5+VdL2BMXyQ84XR5a7MIcB241gHuVtJ9fpC4e7lulBBcljLiv1qvAI8fSjlILVYfUbZCKnnVBcXmw+xLLevy0MNzB4IcxkBvRakO275PeGTDV4Mb9TVz1GRHneyzm0pgjjoqy7J6ouE0r6GHIYL0zPt55QZ9I86+EDo3fZLR3USNoPnr03Yoye7Gj1FL+BgxX2mILikeAhcO0Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by DM3PR11MB8733.namprd11.prod.outlook.com (2603:10b6:0:40::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6; Thu, 18 Dec 2025 02:43:48 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%3]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 02:43:48 +0000
From: haixiao.yan.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][krikstone][PATCH v2] python3-django: fix CVE-2025-64459
Date: Thu, 18 Dec 2025 10:43:31 +0800
Message-Id: <20251218024331.3104286-1-haixiao.yan.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0155.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::35) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|DM3PR11MB8733:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ebcc72a-e6a5-4bf5-630b-08de3ddf456d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?pH53Mj9pD8ltG6sVfVpTVlMF0wHxelJCKhoI2YGbIKZL+62RbTSndS1Q9kja?=
 =?us-ascii?Q?BkFQ2PSVQgOAojqGs0t7KClvbvtEk6ZChb6unzWNzEKHu9UhK7DoKQbvdcxe?=
 =?us-ascii?Q?9GWAhl+tnbuxR9bHPnWuyEGaQNN9CHokggo03dIWCaFClGX6Y1r1f7N8HTW6?=
 =?us-ascii?Q?bUOLikvLwwn8pi7iyc+erR0TMiCJt97zLJ3WnMc86g2wP0AwZne6XtF6bayM?=
 =?us-ascii?Q?G+OEJu6+VrPAFaH9eu2ukAdJtNduyxl//mzlr3sGtfGBDzkHvEnXfg5YwCAQ?=
 =?us-ascii?Q?BEiNoTit0w8sr6tfrF7yMIMrQbwX4eKjk4LZos2wRbbwmJ9zebe/rnKP+G5V?=
 =?us-ascii?Q?0nV9QR/TpJpEE921Y76IPX4er1A1aeZmpgeOu7e/Ewu2d7mQTgYvHo95zW0R?=
 =?us-ascii?Q?EEAtoIjC3ncE6erI9EFHIqVtVf05IVCalI6TdrlTrAkIcw7jM6Gg6URiedbo?=
 =?us-ascii?Q?lFenYWgBMuxNxHXCRlfS404e9nFphkL2BJjiG1W8ZaIcDRe7ShiphDH6qknz?=
 =?us-ascii?Q?m683DuQ1DFacbmL7Pg+pro7IJ7Xns2xGx4Z8o7jNojCMvVS0BhvVH6iDceez?=
 =?us-ascii?Q?Du/Y+pfeay9igkF/zpe+/Fn3ekVwkGk3iHW7aEV2y2WdJhIoVeDaiGaoyBcu?=
 =?us-ascii?Q?3ZNRpqAGa/VWPu59GT/JR719LMrPv4ym+J/O9RIAXuj7dMqVRRtVzKw9xBmg?=
 =?us-ascii?Q?JDz5gzQQh9C3z+BWp62a9tJVUDISW3AUfuCyICr9CTxUBbhRrst3tMW/lrhk?=
 =?us-ascii?Q?ym3iD4DLIbAMRx4MFef0A0ojd3EeoD87fy/0CysJCVdjNnVYe5fQtB90vezP?=
 =?us-ascii?Q?K38sfVPNsk76k2BDgx6JrTIeOFM1RdEAImvJBfDRnahfCVR5yruGVAEVrG6Q?=
 =?us-ascii?Q?Yr52/9tVTy63AlMc7ze8cvKCGc7nQJCHV02Of3NyvWsbC6FZfO/zEnhYEgtJ?=
 =?us-ascii?Q?Df7svkYUoBIr40eWk/gOXOM70joro7YhvE5JK8vNdnjRAkZgm96ZgyozvWVC?=
 =?us-ascii?Q?qobrMzZZR/rnlBXsAhJ7EgVv7dWMHHqScF3t543gkNR5Y9qGyuHrlXvlPFRt?=
 =?us-ascii?Q?RuGwcfqxL9i1BfMziJ6FDqbnF7oU0IdD7FLJqXoE6+oy9u4CuZcIph7GQo8k?=
 =?us-ascii?Q?tHCBoHzCTCZ8yqZ5NGI0reYmsaBzRCMSIdIFS4ojB106CDvCGX5c6gW9aN1L?=
 =?us-ascii?Q?QwB/rRoWLlbpJ2RB4r7iPC0CaKdsY/flu1uRmRgFQUEJk2IZ68qB8fxSy9o9?=
 =?us-ascii?Q?iIY2tB4EsW7Yy/fAPxp/R6aOk/9cUdYnjv+chsLdeXVGS1rY7KXd3K8W9XsW?=
 =?us-ascii?Q?C+epUszPPZtzCbhrq78bWGoAtXvL7NbmFZCr2bK6tUxxa9VMGALz4fGW2EEP?=
 =?us-ascii?Q?+ZbBYGYmtJ+lfgzi5H1BxFMxRWLAThg8UDUASjeask9bC2CBuCLvZPjO84V6?=
 =?us-ascii?Q?74qYk005DMJyvy48uhoLWsFwRSmUndrF14yyIlrkZEjF/LnM7i8TrR/Dz07R?=
 =?us-ascii?Q?jWHzwoX4lOWBfwFkwnya/gk2f+eWf3UtSmqR?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HbKbVL9pkCnTIGhZq/iEZWBgfOZDJ29+Nn67r0eNVBzch0A0WAS2ZSWhitpv?=
 =?us-ascii?Q?9qwy1jCMf3gll443eq6zuB5EEZSiOH9sdmdVzsobXemVsFfq9ZV59bANJa/T?=
 =?us-ascii?Q?n6h4wI+NVt1CIdXy/33BUOCmajmwzOCPlaCbdhE7pOr1XDRt4lwf+2HhqngG?=
 =?us-ascii?Q?e4tlmc+bE4HJytM5oz+SucAJSPr+k/U0EV4SAAmzV347ZybRVXLs81BAHBu7?=
 =?us-ascii?Q?NzrmVMGYr2O2qaOqxyksfLiJmHuEoQ9FuJXFPdB8SW/Lnxafvd6Z4zDi8dUm?=
 =?us-ascii?Q?4yIZpj5IYhOYcCg7B7rCW7jS/PpSHIGgTsoeXMJ/JzT+MUbQONg81wNyNebp?=
 =?us-ascii?Q?rzZzpTeuehi+2GX/BMfBO0moE4rrptqBgQ3eVkqaE2Tmv2mzbX7OGxxI7GzI?=
 =?us-ascii?Q?VDZqzgO/wBCbjAmQzBvX7TSKyvkZdys83nnzfA4BfWrpzhpc/ey6UaM8otSE?=
 =?us-ascii?Q?70Vk+Nepa/Vqr7cHenEA53ZxI65UWBsR39bMJhIPQfq9xsR85xSHQnmFTMVn?=
 =?us-ascii?Q?WJGR6ROgPo1VGFGLfzxYZ51ZlTlekJLXsJHi0QkOj1x4zB6Qe67dbOpcJLrb?=
 =?us-ascii?Q?eXZDfldAC/4lXaqYy+L2GKNyELZYq07wI3oFslWuF7hEsVz/vijGmgnxGvmD?=
 =?us-ascii?Q?9+FO7HeiUz3sVZQ9tggeOaj4R47GW2dD5aHYZi4ZtENT+OyJjV687qhrvVFR?=
 =?us-ascii?Q?5doIvBSIjR8UGiwEzi7YHRYNKrTLL8OPnES+mJLXSLgA498VtR2pRzZlx1GT?=
 =?us-ascii?Q?ZT3p3tp+Q+3DufsjXetRq+hssaYbY8oByOGZG+ZgApl4XW2ThzSgS5Qvi3Ka?=
 =?us-ascii?Q?Qcl77AbHJk8ZOheqAam7FrXeQJB/+TMJl+QXlmT3iPR1hw4hfs9zcKgR3LGn?=
 =?us-ascii?Q?KqpKuRMtEJLX71/l9+6Oc5OmCH0Lm52ApQD8EKCvNM/YlucQdZ+5/qamPaGK?=
 =?us-ascii?Q?RP6m5xEHYZug3W/3UAh4aedhsvcdM+wUfvVVYbG34dIKH/7fDV6M0h+Pp+D4?=
 =?us-ascii?Q?FALy53OUhLNMRF8ZpuyhQXp0dEu/TNRGZYkuilzf6vXKaHuyDKv5ltSMzGML?=
 =?us-ascii?Q?SiHyG/a0dX+4ZDXVP7m2ZdNCAPbfmuwteTAKbCwIBaI2RwNdFSg+XDDhdk6F?=
 =?us-ascii?Q?vU2MWxxXpsbItvDXrq44smg0nyqT8s4HAt7hpzq/U76yfSyplJ9gbZqTqKXO?=
 =?us-ascii?Q?yQ4XFenr1M4NwWpLFfB18wqf+5n6NvCAW4nFdRSu/tYVi6CttajlZ0Xu1FjM?=
 =?us-ascii?Q?/+auKKm17S7c2T8+GbmhVmxFWZCmwHvcHYFZrIlk883XIKwwTL6VmJOT2CE9?=
 =?us-ascii?Q?nd1PRDxr4gtPe1HLqmtt7ZzeEn5wbKu5EMwh1ey1RkBlarh9+Z3Zh6kEg/Lw?=
 =?us-ascii?Q?BO3CiOyYkA4kvXVe1B/ol8yze/Ug9lcuk+Lg6Numwmsqk2NHrzsLo4dRPVdY?=
 =?us-ascii?Q?R9TdwZuHtg4FbHhHbpG2Gbc4lyYb6IGdnEYYR/r6DgR1Q30kD0hSRWvsnBga?=
 =?us-ascii?Q?e6hroRDCA+cJpT5k9y+syaXDK0Tc+23wv3J1NMo0Vaei+PbVCPwfYCgGT0zq?=
 =?us-ascii?Q?d2UHb94WPhMRnPirR6+CU6UC/LmYt/t+mT0LCb9u3Nl9fmT0yt48tRk+luKq?=
 =?us-ascii?Q?pA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ebcc72a-e6a5-4bf5-630b-08de3ddf456d
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 02:43:48.6650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eq66YFQup01tGe8wo9K5PtbN/knCY6pAZYQK3mDGqUpXI3uy+cMaL4Nx4ffVy0XqoxsfTaR978QywmALXlOkea9MC4cS++cMiEj7f3GGKA4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8733
X-Proofpoint-GUID: 3ltDDsDCJIYAYYESTczXNuMNeMCaRloh
X-Proofpoint-ORIG-GUID: 3ltDDsDCJIYAYYESTczXNuMNeMCaRloh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDAyMCBTYWx0ZWRfX9racwTxHSjKv
 9stWn5tz98nF03mL6SXF/2Q4wHeJ75jPgnYkj3qrbUx5cHdK0M7Bk+URxf8CB67lsKWy6ofIcdb
 nYN/waNstgkG0KD/THsZ1eWL8gc+5r2MIngsw5F4yPWMKITEGBZNe/8M1pwM46Gf3NR5oyupFsM
 lRilv0QlVfVPg42B7O85uSOPTX4cUKaO8Sc7EeQ3Clc0UiNUgld6pJIUgiBdPgdjzBbLaKxVKmf
 vXFAhqYn+63Hum/8NtCNw48WgRV87zCsBVl05BMyyt81HUrxeAnIy3F0jDDzFV3g4vFZULURe9K
 B2Joj6uePjD7sIA458JNmoDbe5oFjVJXkK5gHB8rlFVmq6SQjKRfP09pXy1ep75F5r6CPhvNWGB
 cKmTga6QBAqdWBo0ZWdGtSaeiEYsvg==
X-Authority-Analysis: v=2.4 cv=PqeergM3 c=1 sm=1 tr=0 ts=69436a67 cx=c_pps
 a=bOzAxYZ/tHfqF28wl7V57Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=CW2ILakhmGEA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=PYnjg3YJAAAA:8 a=is1M7v0WAAAA:8 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=Jj5Fn1E4Iy_87x9mk7sA:9 a=2cHV6Nbp_IEA:10
 a=43mYI5ShwYkO3IWxqTDg:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 spamscore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512180020
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 02:44:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122733

From: Haixiao Yan <haixiao.yan.cn@windriver.com>

The methods QuerySet.filter(), QuerySet.exclude(), and QuerySet.get(), and the
class Q() were subject to SQL injection when using a suitably crafted
dictionary, with dictionary expansion, as the _connector argument.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-64459
https://shivasurya.me/security/django/2025/11/07/django-sql-injection-CVE-2025-64459.html

Upstream-patch:
https://github.com/django/django/commit/98e642c69181c942d60a10ca0085d48c6b3068bb

Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
v2: Remove XOR, which was introduced in v4.1, and omit this operator from this version.

 .../python3-django/CVE-2025-64459.patch       | 60 +++++++++++++++++++
 .../python/python3-django_2.2.28.bb           |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-django/CVE-2025-64459.patch

diff --git a/meta-python/recipes-devtools/python/python3-django/CVE-2025-64459.patch b/meta-python/recipes-devtools/python/python3-django/CVE-2025-64459.patch
new file mode 100644
index 000000000000..3f906ad54fb0
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django/CVE-2025-64459.patch
@@ -0,0 +1,60 @@
+From b8db807fc4a287d80e37e0786bf054db8016721d Mon Sep 17 00:00:00 2001
+From: Jacob Walls <jacobtylerwalls@gmail.com>
+Date: Wed, 24 Sep 2025 15:54:51 -0400
+Subject: [PATCH] Fixed CVE-2025-64459 -- Prevented SQL injections in
+ Q/QuerySet via the _connector kwarg.
+
+Thanks cyberstan for the report, Sarah Boyce, Adam Johnson, Simon
+Charette, and Jake Howard for the reviews.
+
+CVE: CVE-2025-64459
+
+Upstream-Status: Backport [https://github.com/django/django/commit/98e642c]
+Remove XOR, which was introduced in v4.1, and omit this operator from this version.
+
+Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
+---
+ django/db/models/query_utils.py | 10 +++++++++-
+ tests/queries/test_q.py         |  6 ++++++
+ 2 files changed, 15 insertions(+), 1 deletion(-)
+
+diff --git a/django/db/models/query_utils.py b/django/db/models/query_utils.py
+index f6bc0bd030de..eb62df83dac7 100644
+--- a/django/db/models/query_utils.py
++++ b/django/db/models/query_utils.py
+@@ -54,9 +54,17 @@ class Q(tree.Node):
+     OR = 'OR'
+     default = AND
+     conditional = True
++    connectors = (None, AND, OR)
+ 
+     def __init__(self, *args, _connector=None, _negated=False, **kwargs):
+-        super().__init__(children=[*args, *sorted(kwargs.items())], connector=_connector, negated=_negated)
++        if _connector not in self.connectors:
++            connector_reprs = ", ".join(f"{conn!r}" for conn in self.connectors[1:])
++            raise ValueError(f"_connector must be one of {connector_reprs}, or None.")
++        super().__init__(
++            children=[*args, *sorted(kwargs.items())],
++            connector=_connector,
++            negated=_negated,
++        )
+ 
+     def _combine(self, other, conn):
+         if not isinstance(other, Q):
+diff --git a/tests/queries/test_q.py b/tests/queries/test_q.py
+index 9adff07ef2f3..765715961bf3 100644
+--- a/tests/queries/test_q.py
++++ b/tests/queries/test_q.py
+@@ -103,3 +103,9 @@ class QTests(SimpleTestCase):
+         q = q1 & q2
+         path, args, kwargs = q.deconstruct()
+         self.assertEqual(Q(*args, **kwargs), q)
++
++    def test_connector_validation(self):
++        msg = f"_connector must be one of {Q.AND!r}, {Q.OR!r}, or None."
++        with self.assertRaisesMessage(ValueError, msg):
++            Q(_connector="evil")
++
+-- 
+2.34.1
+
diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
index 0478fd3883fa..71186203e17a 100644
--- a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
+++ b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
@@ -24,6 +24,7 @@ SRC_URI += "file://CVE-2023-31047.patch \
             file://CVE-2024-45230.patch \
             file://CVE-2024-45231.patch \
             file://CVE-2024-53907.patch \
+            file://CVE-2025-64459.patch \
            "
 
 SRC_URI[sha256sum] = "0200b657afbf1bc08003845ddda053c7641b9b24951e52acd51f6abda33a7413"
-- 
2.34.1


