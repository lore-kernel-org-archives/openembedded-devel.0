Return-Path: <guocai.he.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3167C83030
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 02:56:59 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.1044.1751338613251572480
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Jun 2025 19:56:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9277c6e2cf=guocai.he.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5611SZCW015148
	for <openembedded-devel@lists.openembedded.org>; Tue, 1 Jul 2025 02:56:51 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2041.outbound.protection.outlook.com [40.107.220.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47j5m1ajw4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 01 Jul 2025 02:56:51 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n9bxiVigIW8f2mAZEBnyf4IVrZ0qFkNddgrVRD9ZQ4UfQQqt4PD2J2FVePLLSUA/4iGRFIcflBU1ZLV78B9d4vMYgeEJxvJWBvmiYTtkRUG4+sfJMCQHhxDnSP1/1dhE0zb35mUAv9/EfuxJyZ8uYBEjyRPwIaoBZXcDwV65Ak5DBKoEOBq2ZXx5d4O7psjrbgothXzfEuTYveZ8jLhgHU6dXbx7vdEej2nJjGxWKQzhLacvAJddaSPjP+RpgY1y7CeiFtCvZ5jXpJr3ChybMotBXVa60EkoFKELrCi9RrKrCvD9rKf6TaiT4NuNpav0ddAzL6FfVQt+ioF0snluVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3GEYmlBbUt4B9GdWskc9MnRIyXIjQjRjkXiKcHJnO58=;
 b=CUyJ7GOrOt2yqcjdkw1JlzPcOD+TjGp5oav67vzBpNR67ioqPvXKxvB1iC1KcmkbNkAl2JDXXBfqU+RHtijM4VtgDxDfqts2BRs/txCYwYQVJa+dcoXVp+cdMHC/Qj338d9ZvvpUGzI1Jzq1TkYRXlWCUOdwb/HcfnGj9IPQYHozTgChhWU5nT4vmsvzo6ebEBzBFY3hd6OXmI46EKrUWr9oFN7qsamCUKlffL9MQDKA06jq1u1OHJKKcPM/bOF++dXutEmuvhA4r+ZSNS/go25B0dB80tWhlHLPDkfbszsh0D+sgH+4O4BnSABcQnomn8F6hZ/CX3RzKj4kjEbJ0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5593.namprd11.prod.outlook.com (2603:10b6:510:e0::15)
 by SJ2PR11MB7519.namprd11.prod.outlook.com (2603:10b6:a03:4c0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.24; Tue, 1 Jul
 2025 02:56:47 +0000
Received: from PH0PR11MB5593.namprd11.prod.outlook.com
 ([fe80::b1e8:19fe:3f39:1bed]) by PH0PR11MB5593.namprd11.prod.outlook.com
 ([fe80::b1e8:19fe:3f39:1bed%4]) with mapi id 15.20.8880.029; Tue, 1 Jul 2025
 02:56:47 +0000
From: guocai.he.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][scarthgap][PATCH] python3-pylint: correct the SRC_URI
Date: Tue,  1 Jul 2025 10:56:16 +0800
Message-ID: <20250701025616.340007-1-guocai.he.cn@windriver.com>
X-Mailer: git-send-email 2.44.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0115.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b9::7) To DM8PR11MB5590.namprd11.prod.outlook.com
 (2603:10b6:8:32::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5593:EE_|SJ2PR11MB7519:EE_
X-MS-Office365-Filtering-Correlation-Id: 414a520a-e294-46b1-6729-08ddb84ae989
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Hm6r6AblXnLG7b8yPaYxEo0+k1fNrr6D8YjmIsJMOmvKy3G4J7gngv3fzoKB?=
 =?us-ascii?Q?HRb9cd4Tde5nv9KC0AxT4Pe+8pR+jsbeurvOpmbR6fp8+iv6XHoY7/85aSR4?=
 =?us-ascii?Q?suy6cLiVUhQMxYY0hQlEzQWMFUeJaXJqhXZFpMoeByNWUGsr1GHGnqHJ/Tbe?=
 =?us-ascii?Q?ZugafPoQ55+SGulDq94yfn15TE9z4iapIzcNpLa+go15llnLNS2mleNow6vK?=
 =?us-ascii?Q?i9ZhINsj4RQj2g/hsTI9FlfdtHeGjF7S2TQAzM+mBp4v3nhXWJsahYEExxHH?=
 =?us-ascii?Q?FHWgLSNlZ9bPhVRE1dF67YLp2Kc7dpoasJCNxlBMcyZz0wcGF0rpyMDfCZOO?=
 =?us-ascii?Q?sMC25q/Vq+iuncZQflBHu+SN7Zsdc1vJNFPoqD47j9co7aG3ssLuCPXVte0o?=
 =?us-ascii?Q?8iGVTUMz7wX7dofFg6pc4MbYf7OqBXYuSg5SsVpTAApKUd/Skb+zjwCIFO03?=
 =?us-ascii?Q?nD+Wk/Uyo4e5D9zNbDV5lBvdg2keGE+4zrXDkenFox9kWD5fGzzwlV+7k0a4?=
 =?us-ascii?Q?jaOgYnIzcyEQLz0Krsnf22SJryzQnBPp6O605ynbFsg49cnaPtmUE9XslzI6?=
 =?us-ascii?Q?McfbCaYkT06W7yM/qj42ZQcaNlXvNqRGu3ToxXCEMMc3XbrkEJtMVJhGuYe8?=
 =?us-ascii?Q?wNQuRQIy7G5RO47bQT95IV9yPbs9LYUnFskZplAVrCh/S7AUYGpe3rIAXj+Q?=
 =?us-ascii?Q?kOF+vYJfjai1RfD9dKxEfzRLnuEdLuFOiDd1XQonWGW3Uqrcn4VfyDGwM1qy?=
 =?us-ascii?Q?3qotD9otiiZqCXAon4YKseawFm54XTAWJymSaRbKEkDkB1hys6H+D+SFgLRR?=
 =?us-ascii?Q?ccVkhnEwfikrVnGYdVNJWCBLBgK7Hu6LPzuM7S/6Zd5bz6qacmWUW31BycxG?=
 =?us-ascii?Q?M1/5WEQbYMxII8XSqqHtKr6dmHHo9G36NLKldz30QGfh22xJ/0rc1xQM2i0s?=
 =?us-ascii?Q?lO3ZLu3iTWNpXHRlAjC3euwKbhNHvfaeB/VNJ6i8N5DWgRZHPXvhW7LMCaXs?=
 =?us-ascii?Q?E6I7qFnMz3h9oAn4epH/hW+vDBH/IwHnpXiXOAo0nzPwOhv9Zyr6HhYCWXT9?=
 =?us-ascii?Q?V4b11kv1RzU3nVmCyYNZP2q8gp8X2iq+5+S0+c9HzlDv9wWkQpC3zDfGSkCY?=
 =?us-ascii?Q?ZGsiok0qYvxj59ebAXvk+PqmL/+qN+aujbIBB8lqQSfYEOpf6WcaPCbb5pti?=
 =?us-ascii?Q?5EDvBAOE6S8gdrYj/RbfneHt4UqiuZH1GxN7TZIaY8IF1bLAC1c2YV5KtF7j?=
 =?us-ascii?Q?pgZO0AtSe4Uuhlyx/eA6/q7pgV46JdtvmMAX4G7YJ75jIXj/brgOlK+zGP2B?=
 =?us-ascii?Q?n4Vuhfa0zkKFQnFb01SAHbHM7weenjsfzruU/anVLIMbTLoHCKMKBR+oX0gs?=
 =?us-ascii?Q?g3avIQdJsnVGEX9MEDltY/t8XK8IeY6wcNZQ/yCrZA8pdyQUcsmFMTpV8VCU?=
 =?us-ascii?Q?+h1f+fPTpmM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3ENgcCYyFMqA338DfDXoW6s6UJVMExhP0PBxQfQtXVevpbOGN3YkBaNa1Gex?=
 =?us-ascii?Q?2UTn3e/L74kFqZDh2uLQurBY++UcjJtskseFX8d2Sfcme6zBHF3Eyc+loUqG?=
 =?us-ascii?Q?zLsZprN+z+35BwKoMY1mc2SwBU9cCxU0psBHmtTCRW+nh1bFixSW44KC4SL3?=
 =?us-ascii?Q?WUGUYoZxd+OT3WcVBYfYwE1vX9YNEVkMD/dTL+VomQy29rpBEtlFhJsmXO9P?=
 =?us-ascii?Q?H7ffscb6e9SvNYm/B1Ssh+CRJubMRqLEaXze5+SYq+0QEkDsEapa4T8JwhLB?=
 =?us-ascii?Q?6lVfLI0UGFNEuUk3/mQYCk9gQgyyq3KBmKdBGNrIedYfh7E5vTP5ohDlpLic?=
 =?us-ascii?Q?vibMxNnp1Ea4g8SpW1Iy+s7KThqLVzGY/+YZXKp9SIRtAWGP+F9rN6GYRVSr?=
 =?us-ascii?Q?W0Hu7SyrIbAioGyF7m9VjoYm/jiEG5eoAY1l3JzTXFanHSFK7OVjpY9hFF6a?=
 =?us-ascii?Q?lghqz0kTFgEa0GxSDr6nKy85rO1e36YBSJMG75JvrdDnmz6DC0eWl+kWW0w+?=
 =?us-ascii?Q?vTs/KMF/zjhErxBFOEZrmDBADIlBBiDHRqcV6Tg5l2ZnEihsCqiDnbLvewy8?=
 =?us-ascii?Q?68CgSp7mR220rRhGRrpgecTGrxUVRK7lZDe2RYnXLSMwFOU7J52l8GXyVO4Z?=
 =?us-ascii?Q?6jlFSvaE6Btmy9h0O+ix5kHAlPlzmvjMFQWv5it5dADYIZTj9iykhECrroH4?=
 =?us-ascii?Q?qOPeHRTmCzl7F6FCgfPqJReRTRvJ1RTQ0nBEZpUGeqiYlZjg2z1IzeDfpJq1?=
 =?us-ascii?Q?xc4mcp2+1cQO5CkVd/FSs72ko1xa+i94KaRpb0o2f7ENHFYVYy91lSqym4OY?=
 =?us-ascii?Q?sO43n42aHGmsGe9grMzrEeCVpnppeMIDF5CWb14vM1wR5Ip44s3ZkcrnCjIG?=
 =?us-ascii?Q?Rz3RCMVoU/1ZHQUBmYayC8oP+T3+9N7RScQ48LQJOWVUOFDbOh71BBJA8Oxe?=
 =?us-ascii?Q?zKVLjNrKMsR9vef53RH4EBAXh5ZvrXvy10sTyhZ7VqaQhseLhyme3ip2qEsa?=
 =?us-ascii?Q?dFHNhM1oEFx/cqO9k8/KDveCYyaduuk1H/BOm7bIW54Cnpaj+x//bdozcBcc?=
 =?us-ascii?Q?ZQ73lPR9sExKnsotcuo0uoXlQVq/4FTO05DM14m2WXi6ch2a/j178/GMao4w?=
 =?us-ascii?Q?A4oQeuCHDjbnQUX+sypanKB0WjvmYW6niyUFAAsGYmuhosWUXuUz74dbhmx4?=
 =?us-ascii?Q?PR8YqBhQt24hg9mh5WbkAzhmrcZ/JLCiJTDv2F9Xt7ZKRWXYsvLjywCIaUw9?=
 =?us-ascii?Q?FKWbIRTLgRM/mYtia+B1TV8Dbg93+2zByJQ91a/MvSieLSXfQt7KGJvkm7wy?=
 =?us-ascii?Q?NBFH/0ICHKOyu+b4yZ8tYRClLGK99dnDU06CM/Plhck9m9SsxXCQSr3zip7q?=
 =?us-ascii?Q?uNfO40kjXEcrBjCkIPFLdAr01N70xDILJq0cqvKJF+PFNyuEr08K3Ofm0d0v?=
 =?us-ascii?Q?7F6EhsF9En997XyhmoW8YH7ISdur0NWzMESpbN3Y2hEH1fjPbrAKtf6X0+jz?=
 =?us-ascii?Q?qIvxfZnTVIiQgmPAfyliHkXcf7Tjtvk24ax74jLhV2YSqeYm41ggjSDtIDkU?=
 =?us-ascii?Q?OWlrSaD4CWUPBivm96o7sKK4GF8NXTHL0bf7/6wgT6QPCi78fLWYm/W77PIR?=
 =?us-ascii?Q?7w=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 414a520a-e294-46b1-6729-08ddb84ae989
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5590.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 02:56:47.1703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HKSUOfOPHGDXYr/V8oH4/EjpmWVedZx7MyxdiRCShh20XQDXgwK2UVHBQ8Y3h/Xp8BKMLkaAqJSfmhxaPUGPu/xrKPultlwHrrHajHt6r2Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7519
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDAxMiBTYWx0ZWRfXzb5G8s6Ul+w3 w/ZLmR46a6rrTUJJvO5BL9TE/ARw9q3DVtJO8sqta6nzOkmZh+AnJxW39YtBCopLygi8cKn8g2I EuOfh+maOSfrL9LMcS58FCsS+MiYq6WNHStl9mHlIgXyvS5YNznkM18Ge6mHU9fq4PzWo8dAule
 U50mh7B50ywYLUDyhZ4zD/qcnxMCgtXISoi1lQUafo3GKNK2qsIT0RGAX5U6W31S+7MtiSG21R4 ybJrvwKg8advanrQA2nLgq2xnGscxgun7QmrZb2c3yj10X7wHHHgH6Mpd6eE0bF2IfTppnm+0dA gfEHZpfByypinSQ8Gv52WkrYTy4AcC3w1v4GSjLgy3TksEGDl6DMF29RNP0uGeIR1C0HF0yBWgG
 eo1q9i2mbgXqcpxLaxcD9IAT/4fpNeRVSUBC5pONtSdxPuENa3t4+SsySg+YG5Qw1vD+QPlk
X-Authority-Analysis: v=2.4 cv=IOsCChvG c=1 sm=1 tr=0 ts=68634e73 cx=c_pps a=N9KS/dcAZwVXz0yLw5z2sA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=q7AoBUq9l0gA:10 a=Wb1JkmetP80A:10 a=XHfBerL2AAAA:8 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=pDsAOem4OLdlRpO1htMA:9 a=qb9JOAHM4hE5jB-puYrx:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: N-3kwUn2QX1vkIbsbJlXiVDf0XzLss5H
X-Proofpoint-ORIG-GUID: N-3kwUn2QX1vkIbsbJlXiVDf0XzLss5H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=941 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507010012
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Jul 2025 02:56:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118185

From: Guocai He <guocai.he.cn@windriver.com>

In the SRC_URI, the branch of maintenance/3.1.x has been reomved,
which will cause do fetch error. So update as "branch=main"

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
---
 meta-python/recipes-devtools/python/python3-pylint_3.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pylint_3.1.0.bb b/meta-python/recipes-devtools/python/python3-pylint_3.1.0.bb
index 12f4f908af..4c49acaf1e 100644
--- a/meta-python/recipes-devtools/python/python3-pylint_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pylint_3.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE= "http://www.pylint.org/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c107cf754550e65755c42985a5d4e9c9"
 
-SRC_URI += "git://github.com/pylint-dev/pylint;branch=maintenance/3.1.x;protocol=https \
+SRC_URI += "git://github.com/pylint-dev/pylint;branch=main;protocol=https \
            file://0001-Adjust-test-expectations-for-ptest.patch \
            file://run-ptest \
            "
-- 
2.44.3


