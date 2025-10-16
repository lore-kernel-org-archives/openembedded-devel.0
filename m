Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B7BFCCD183
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 07:28:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.2787.1760599696637649060
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Oct 2025 00:28:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=M0KQx9LJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2384574c86=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59G5hXDn3924565
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Oct 2025 00:28:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=nKLvs9Mtp3qZzQyROlEM
	dRcA/4HUcaPc7avWggxPt4E=; b=M0KQx9LJXvcu9lJ1hNhnLDlpnsJtEtiHEDpV
	SaoQ+AkD5V5T3cBONaKi65MKZkIaCai/K8LF090RU9EAE2jHqcWaC8ZtQqtdFPQz
	s9C8vdMW0SEnPNhOn7xTrXDpS7VjdYy7s13clqNmshK/Uhv8EjPackhD5p0B6u/d
	U7iTlcn+Jfb/aUQRF8cbJs1oaA6f2Af8Nel9t4whYLpugfqaR54stztof6urycEb
	MLSLS+Qu2jhBCpMkdsEoKmUHyzHiuSPW/gwGEI0w8rH9pbsx5xepXK4ID+DXDIlj
	9f8te7oQpiiMsivd2QTfjwuarSSdEfWVJamgCv9uI+Qkn9JCgA==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012045.outbound.protection.outlook.com [40.107.209.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49qjh1nreh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Oct 2025 00:28:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S0cdHg4tRfxeDp9Wpa+OgY+o6dmRcVCWHyEVPrBG+x7vE8XIc9QG5gxL5DMjywjI5PnVGajy6FVi+COl1fYZHQAr0PSt1Qsj/mMLBinUh8cGydL3gGBVyS5PboEzl7y3KBYhP3EMG4MEWmZw4/8i84uYUM91ZLr34elrykTuexpqbcZ7x0gmcKpbe1UXl1ZNPVxFDbIajIVu02F8etwIBNyLm/REDPKH7Z2GOwmw2gnvaWTnWpYJSofyYJzPw28uE7nkydEci7Rs5E5o+jbVo4LYO8/v2VeDxMUtLOk+0pr039+JiNtq/X5y+fq/ZWAbaU/Nvr3bXRNGznCrOoSxUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nKLvs9Mtp3qZzQyROlEMdRcA/4HUcaPc7avWggxPt4E=;
 b=WVkEptOhZ1a6jCAOfwyUcdGRefPbwSsuUSev0PjmUb2kLtEEqW+x9Bca0LI7HEp4THFS2AXC3M21PYBBhEg7jVa4RZobFbTYuUIYGIZO6hA4+tYoww+7qWkbAVgDAqySFFpWHbKebNzbstdR78Et0BgnQLSKUAq2jNJkmv0BdJ9Hxg9g4tQM/4c9oik1kYWXEFBfw3xY9So0I2Wbo9pVSKdo7s1lcNoHsU6XgRfqb8+s14w82Xl8Wd3UmDdFtULUCV/qdBgAqTanCfwNDXIVoZR6l1wgMG7jQSoOA3fkhmhUlH3wXzC2LM2qVYIMlMwSm2lIjMOPQh+zHSdqvmf4xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by PH7PR11MB7500.namprd11.prod.outlook.com (2603:10b6:510:275::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Thu, 16 Oct
 2025 07:28:13 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%3]) with mapi id 15.20.9228.009; Thu, 16 Oct 2025
 07:28:13 +0000
From: haixiao.yan.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] python3-m2crypto: upgrade 0.45.1 -> 0.46.2
Date: Thu, 16 Oct 2025 15:27:58 +0800
Message-Id: <20251016072758.170365-1-haixiao.yan.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0014.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::8) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|PH7PR11MB7500:EE_
X-MS-Office365-Filtering-Correlation-Id: 10919a06-534a-4fb3-156a-08de0c8590ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OtDH8ZyNtErbwWuRnZQbEcf/sPREv4AQwrHoXvoKWxgDjv9yB9fOZyn6Oucf?=
 =?us-ascii?Q?CCqrpjfKX7bGQNZ4no5RRO777mi3EpR6qoOM5rxiThazbeFJXjt3NnKnkEal?=
 =?us-ascii?Q?rIfKQmOkfbiSCvlmW0FnniToQWSkcEi0XtI5EHQs4RFyz4JxvMV/GoUXN9P+?=
 =?us-ascii?Q?1M43JATQzMcXhTaUaXaB/+N20i+w/xOWfKr7a+2Tl9alDgGvI4g2DUhjGfZR?=
 =?us-ascii?Q?2R2CqZp/ACPjnmUaKiv0PGglceiTBKXCJ2zaK8S8o7UsgK0HKVsXRNvGSWAI?=
 =?us-ascii?Q?FSiuOsx5EjNaeRKBymAO9uVw/1tOVOxtCQ5nqIwiSInJEiY3TA44GgHLyWP3?=
 =?us-ascii?Q?+ItmDQ6mDcpUpCxihR/ry0bNn29lvsp+PZoyNTlwzTDvfBt2q0aT284ygy66?=
 =?us-ascii?Q?wJTDHn5xU0vEh+q45YmKqK16XVYTee7M/OCM/G+tI4ZZ/vcc8RyKcfSPJPL8?=
 =?us-ascii?Q?7UI/O8ni6rirzsy4Ujf7+KtKTV4GPO3wnUbNZImeszoy9u7cQCRt/0hPY89W?=
 =?us-ascii?Q?eA3WOCVp9NAXCkXJGXQW+RT2FBVKYHsgxzn2HLvPXxftCTeP2xeneugS1L2y?=
 =?us-ascii?Q?30yEtJyNhb9ltvN/5gi7YB866UxpjFnNDiPC2NGQ8cvkZdsNp8IwEfI8ZJ0g?=
 =?us-ascii?Q?u9UYp0s8WcN+JBfAjW4xxMRnGUzXOBRAxjJJ69A+CcINY1aIpCuFXQRoKpvH?=
 =?us-ascii?Q?OfASZ7Iq2q89+Li+sIROgCXNkwAXg+oCdn3hceP17yUoqEHbnBw9S8SJDFOc?=
 =?us-ascii?Q?rzz2kfgD0F08hbzsGaahuEWr7EWHt84sKra9sPc1E1vCDXpyPjCu5Va4A/qr?=
 =?us-ascii?Q?FoFfY0aLKdKdfZ2+IMGUESn3MuCaFd2RuFqP6P1VOjhobg7xxZzL+wmh3f8f?=
 =?us-ascii?Q?5UYsXWrW4qlMSsFe7eoloDA7T3V2GnTd6u/e52dTHdSVmyzaDGGJH21D81Co?=
 =?us-ascii?Q?wp9jQuzdU2oQlKHBsCN92F/sKgDS9AEml1ymMpBNW+bqUR8J72tFNfhFyl79?=
 =?us-ascii?Q?5KKuoftdX0ltk6Vih3Ur8rxmvuqE8ovhQCV4cQunHmST6YsxJrXK1hEc0XJ3?=
 =?us-ascii?Q?r2Vx1SeSg1UKn5Ua4eqzqGdY/3RxWWo9JOzxi3Os2k907vun1TETg9RZhIjs?=
 =?us-ascii?Q?LXTjBtzm+ZKVNWvTjxJvTaquSMsYrS5MSem5MOmPnM9GD/Ux8UT0z0mUf8rV?=
 =?us-ascii?Q?zDbm7hl5uU3M5x6KbpsN3sZG/e5Hn37+yvH23SVmpbS62aT3hvBh6Kq241qN?=
 =?us-ascii?Q?PulEeKvbCYSpbFvz/nzFdc7r16MMjsWv1gU/MoH0SCPR/JtQ19nDEjs9v5Sp?=
 =?us-ascii?Q?JB8U1QlZyFeYJ3zJvGUBGs27g46bkkdLDvLPGTBohRK/sJC6WX7tWE4GT0M+?=
 =?us-ascii?Q?YShOkSs6VGEQHxexPorpxfj4ICS80uzoETT7wK6d9CTV2HucmexVtI2j2AJx?=
 =?us-ascii?Q?9fGlggQaEWz649IiPsOR0PDEkVNeo/eTkYAsLOOGaXhCm/HB5Y/Nig=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?q032qs3iUrMUkJ3fYE6YnIt0jN2rEeSiNumqN1NE97sfFmzXL/nYRbZKOxcO?=
 =?us-ascii?Q?96bUX4mF3L1aCbAfj3KOCsei9+L0tepX5Z4jf4cjxhvFAa7xfSUBQuT1wlDO?=
 =?us-ascii?Q?t0oQy6pwwPvMi/OzePmXaXAYEawZh9H9Cr3YvlkAeT6IInf7J8B/dIG++peb?=
 =?us-ascii?Q?ZueBfGPq44+qz7XHYghYj8KZ4BD0R0bytEq084iooUHViun5tkCRg74AGNYm?=
 =?us-ascii?Q?Rvkbp3dC+2qacj39Wg8mSl3r0jSnC3FL1umxKdyMZMpGJaOY3lUHNQGrB4hC?=
 =?us-ascii?Q?74r7o1pqVbCXlKij4el4BDnuw4K+rb5YP2DoHVimPoLh25jwqn3BOxPWeg/M?=
 =?us-ascii?Q?dvNAuVrttoLVELyT6vmMabx64ZGZd3srUkhg6sS+v5cON0CzDp9QZzxivvA5?=
 =?us-ascii?Q?m27Rm7mvNObLVGucua7LrNebgDivmavIAWNxpvSKaH8UlNPA3isPdYM6pyay?=
 =?us-ascii?Q?MeR9UFDVEtkZkCYwbfzD5jrG4+S2z2iiq/LaIAgG/O/L6e46UVEyyyRqLmzW?=
 =?us-ascii?Q?aTkZ5BrfL/WeL0CHYkD2AKNdcZJ8USyVnXaGBnpnz4ji5o5t+6UJ2qR6MaL9?=
 =?us-ascii?Q?pBKkDwb6WTJCIiBMLK9ekQUJNxz1UdnnUKYck2NvFAu7JC37fiNjsCVyP4XF?=
 =?us-ascii?Q?vTg6ZcZ9iTZTzEmkkkTNRkVyWAN2hQlRBlg1EBN4+aeywl1MMoU3nMO0dcax?=
 =?us-ascii?Q?ZSHT3lxTg6e2khxrhUeFUz9RKMSR5r/LNqdlurfizBWoA7dKeZbVBkvuzWZe?=
 =?us-ascii?Q?poHeZU+Kdy+80aZgSmc1haILjPWHrRZSwnoxTmaitiVsnDW3zZ6MS5xyaMNN?=
 =?us-ascii?Q?L2q6BnAUSkylf8H6KsnlfXTXrlF8kUccdhkSymwcfhbRcj69o3ZfsCZXbZNa?=
 =?us-ascii?Q?gAF2OnGYLtGGMTtBM219g87JQXY1kcsSqRdEwnvqnTlhTIzRXNRtJuZJFqnZ?=
 =?us-ascii?Q?mO+oU3XPs5ebwDWVIYKIKOZHLw6JWdekg4aY+xoPOhpY0dY/KUaG6K1cOYEm?=
 =?us-ascii?Q?AkHTvdbZl8UHc3OS8fxp1/mvt/WrYrAV+k5cyFaCA/IhjxS5q40XqnHHtUkL?=
 =?us-ascii?Q?0ecpxCT47SpPV7gWwfH/kH3lisoMm7hvJOFlkpf1ay/NB8Yrw+0wq51P/DJ+?=
 =?us-ascii?Q?K+4BQXnCGRV/OGOpXbZpIG7uDHpeCdWXLQgV19jh3Y3B/ivre2L1E3fKN4Lu?=
 =?us-ascii?Q?p60hZTZlr6L7XUDcm4cjz+hcjweGn8FOj9ituvg3u5bDBxkxqDN25XOqNAIm?=
 =?us-ascii?Q?mlTC+qnbcHStGXwgcmaLYv8nO+j19TnYmKTuMu9lXv1YGv+k9ySOmQ8b03OW?=
 =?us-ascii?Q?OWiVjAlxNP+wQlEEX6kGOvp9BtNkYlZgpLnQ3FCvETbcr8sAjSYgwXJT8XtK?=
 =?us-ascii?Q?OjSBnbgU5IlJ6I5bgu5Kt3MYd3arl/2hzieyewFXdfghNBUeCvdpWbVMXLQw?=
 =?us-ascii?Q?R6IyKd7JeMji9UwDAimWAHlg3NAgA9vp/MMrFH0gxPj77LU7Yfq+645loKNl?=
 =?us-ascii?Q?NM6N2GJANJt/8cycqdVRx8jhgBE4mY4CGLH03swZ/oC2KfCtcXws/d8JyOCd?=
 =?us-ascii?Q?YVZ+rVVNDYmb0T+C58N1Hcc/JCbg2nMor4xXBM9LZmW64wySoe8FS63zvxoT?=
 =?us-ascii?Q?CQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10919a06-534a-4fb3-156a-08de0c8590ae
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 07:28:13.3058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KWK6Ha0MoveBcBZFmVBSp3+MBf9XL5VKMdA3dEaj/SQlxeKtwrLusq+WqAq9XJv/Ia0bIOwlQjtzYQhIcqTdwJbLINUZ5A3w8JxWCYmZC3U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7500
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE2MDA1NyBTYWx0ZWRfX0FW4khZxcR9o
 OcZ95x2GOCoC96MXDmccywHnsK9ld0pNXzosIbPwL4whxuXvFvw7XFvcO+H/6Qyj2LExm9luvER
 bxbBKHpsYgVpgA3ZRafrAq3uYbTWQQOVL53Pe0m9NiyNROtdCUaLIVSepuksrROy+WeuIANaGk0
 tenFv0C1uOS+XdX49KebVKiDJNH/Nc72Mt6DpPAMSUHRcxYu6NWPtRRtPzHUEoKHjNH9qT2+xV/
 3IsE+bQGgrsWus91EO9age105b5Y5seQw2b6/gC8SldVh4IAlugE2BGd/U/gE23N7JUYPD+UKZc
 7VzEPaq8f318C7SOpWQahREvQ9on8fIdEEgWjJ7enU/UILlT7u4woyaYgoGyPDoD+8mh23LS32+
 B+kLKmMmiMjCqGySG+q0ye7F3gXWPQ==
X-Proofpoint-GUID: ASEESeKVVtqpMhpjX1Gn1sXLmiVrJVc1
X-Proofpoint-ORIG-GUID: ASEESeKVVtqpMhpjX1Gn1sXLmiVrJVc1
X-Authority-Analysis: v=2.4 cv=aetsXBot c=1 sm=1 tr=0 ts=68f09e8f cx=c_pps
 a=7zLNS0vNT/Ole769MsF7+w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bwGbKnmsAAAA:8 a=p0WdMEafAAAA:8 a=t7CeM3EgAAAA:8 a=LBFdHNL_yV9ayBqt-l4A:9
 a=nuVVIWbBudwLbAahYuja:22 a=FdTzh2GWekK77mhwV6Dw:22 a=poXaRoVlC6wW9_mwW8W4:22
 a=pHzHmUro8NiASowvMSCR:22 a=n87TN5wuljxrRezIQYnT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510160057
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Oct 2025 07:28:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120717

From: Haixiao Yan <haixiao.yan.cn@windriver.com>

python3-m2crypto/0001-setup.py-Make-the-cmd-available.patch
refreshed for 0.46.2
python3-m2crypto/0001-timeout.py-use-qq-format-when-time_t-is-64bit-on-32b.patch
removed, this patch doesn't work for 0.45.1 and 0.46.2.

Fix the following test hang:

test_IP_call (tests.test_ssl.HttpslibSSLSNIClientTestCase.test_IP_call)
...

Changelog:
===========
0.46.2 - 2025-10-02
-------------------

- fix[m2xmlrpclib]: make the module compatible with Python 3.6

0.46.1 - 2025-10-02
-------------------

- Correct license to BSD-2-Clause and update references
- Specify in setup.cfg that we require Python >= 3.6

0.46.0 - 2025-10-01
-------------------

(Tested on Pythons between 3.6 and 3.14.0~rc3)

- M2Crypto closes SSL connection on closing HTTPS Connection, and
  some other related issues (#203, #278)
- Modernize C API by eliminating use of deprecated
  PyBytes_AsStringAndSize and related functions with Python
  Buffer Protocol (#375)
- Whole project is completely covered with type hints and is
  checked by mypy (also while doing that, the whole project was
  blackened) (#344)
- Add logging support to C extension code sending messages to the
  Python logging
- Introducing first efforts to support Engine object (#229)
- Reworked and fixed M2Crypto.m2xmlrpclib module (#163)
- Reverted removal of demo/ subdirectory
- Improve SMIME documentation (#377)
- Some other minor bugs, improvements, and removal of dead code

Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
 ...0001-setup.py-Make-the-cmd-available.patch | 25 +++---
 ...q-format-when-time_t-is-64bit-on-32b.patch | 80 -------------------
 ...o_0.45.1.bb => python3-m2crypto_0.46.2.bb} |  9 +--
 3 files changed, 20 insertions(+), 94 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-m2crypto/0001-timeout.py-use-qq-format-when-time_t-is-64bit-on-32b.patch
 rename meta-python/recipes-devtools/python/{python3-m2crypto_0.45.1.bb => python3-m2crypto_0.46.2.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-m2crypto/0001-setup.py-Make-the-cmd-available.patch b/meta-python/recipes-devtools/python/python3-m2crypto/0001-setup.py-Make-the-cmd-available.patch
index c4262985ba0b..12216ce46a1e 100644
--- a/meta-python/recipes-devtools/python/python3-m2crypto/0001-setup.py-Make-the-cmd-available.patch
+++ b/meta-python/recipes-devtools/python/python3-m2crypto/0001-setup.py-Make-the-cmd-available.patch
@@ -1,4 +1,4 @@
-From eaeb95ec64762a58dde7cf368fc17188382e7df6 Mon Sep 17 00:00:00 2001
+From 6262f49de177a79bc17f8d583aa5a7acaf48bf9c Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Fri, 28 Mar 2025 12:13:26 +0800
 Subject: [PATCH] setup.py: Make the cmd available
@@ -19,19 +19,26 @@ Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 ---
- setup.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ setup.py | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
 
 diff --git a/setup.py b/setup.py
-index 9938e67..21e2346 100644
+index 792d7365b6ed..5b8a5d791793 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -230,7 +230,7 @@ class _M2CryptoBuildExt(build_ext.build_ext):
-             with open(
-                 "src/SWIG/x509_v_flag.h", "w", encoding="utf-8"
-             ) as x509_v_h:
--                cmd = [shutil.which(os.environ.get('CC', 'gcc'))]
+@@ -208,8 +208,10 @@ class _M2CryptoBuildExt(build_ext.build_ext):
+         if sys.platform != "win32":
+             # generate src/SWIG/x509_v_flag.h to overcome weaknesses of swig
+             # https://todo.sr.ht/~mcepl/m2crypto/298
+-            with open("src/SWIG/x509_v_flag.h", "w", encoding="utf-8") as x509_v_h:
+-                cmd = [shutil.which(os.environ.get("CC", "gcc"))]
++            with open(
++                "src/SWIG/x509_v_flag.h", "w", encoding="utf-8"
++            ) as x509_v_h:
 +                cmd = os.environ.get('CC', 'gcc').split()
                  cflags = os.environ.get("CFLAGS")
                  if cflags is not None:
                      cmd += cflags.split()
+-- 
+2.34.1
+
diff --git a/meta-python/recipes-devtools/python/python3-m2crypto/0001-timeout.py-use-qq-format-when-time_t-is-64bit-on-32b.patch b/meta-python/recipes-devtools/python/python3-m2crypto/0001-timeout.py-use-qq-format-when-time_t-is-64bit-on-32b.patch
deleted file mode 100644
index 120a67b6a205..000000000000
--- a/meta-python/recipes-devtools/python/python3-m2crypto/0001-timeout.py-use-qq-format-when-time_t-is-64bit-on-32b.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-From 7fa4f17cc183e04b10684b28219cf15780910206 Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Mon, 30 Jun 2025 16:11:16 +0800
-Subject: [PATCH] timeout.py: use qq format when time_t is 64bit on 32bit
- platform
-
-Fixes:
-   # python3
-  Python 3.13.2 (main, Feb  4 2025, 14:51:09) [GCC 14.2.0] on linux
-  Type "help", "copyright", "credits" or "license" for more information.
-  >>> import socket
-  >>> import struct
-  >>> s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
-  >>> seconds = 5
-  >>> microseconds = 0
-  >>> timeval_packed = struct.pack('ll', seconds, microseconds)
-  >>> s.setsockopt(socket.SOL_SOCKET, socket.SO_RCVTIMEO, timeval_packed)
-Traceback (most recent call last):
-  File "<python-input-6>", line 1, in <module>
-    s.setsockopt(socket.SOL_SOCKET, socket.SO_RCVTIMEO, timeval_packed)
-    ~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
-OSError: [Errno 22] Invalid argument
-
-Upstream-Status: Submitted [https://lists.sr.ht/~mcepl/m2crypto/patches/60463]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- src/M2Crypto/SSL/timeout.py | 18 ++++++++++++++----
- 1 file changed, 14 insertions(+), 4 deletions(-)
-
-diff --git a/src/M2Crypto/SSL/timeout.py b/src/M2Crypto/SSL/timeout.py
-index 298a9ca..0b38329 100644
---- a/src/M2Crypto/SSL/timeout.py
-+++ b/src/M2Crypto/SSL/timeout.py
-@@ -15,7 +15,7 @@ __all__ = [
- import sys
- import struct
- 
--from M2Crypto import m2
-+from M2Crypto import m2, util
- 
- DEFAULT_TIMEOUT: int = 600
- 
-@@ -40,7 +40,10 @@ class timeout(object):
-             if m2.time_t_bits() == 32:
-                 binstr = struct.pack('ii', self.sec, self.microsec)
-             else:
--                binstr = struct.pack('ll', self.sec, self.microsec)
-+                if util.is_32bit():
-+                    binstr = struct.pack('qq', self.sec, self.microsec)
-+                else:
-+                    binstr = struct.pack('ll', self.sec, self.microsec)
-         return binstr
- 
- 
-@@ -52,7 +55,10 @@ def struct_to_timeout(binstr: bytes) -> timeout:
-         sec = int(millisec / 1000)
-         microsec = (millisec % 1000) * 1000
-     else:
--        (sec, microsec) = struct.unpack('ll', binstr)
-+        if sys.platform == 'linux' and util.is_32bit() and m2.time_t_bits() == 64:
-+             (sec, microsec) = struct.unpack('qq', binstr)
-+        else:
-+            (sec, microsec) = struct.unpack('ll', binstr)
-     return timeout(sec, microsec)
- 
- 
-@@ -60,4 +66,8 @@ def struct_size() -> int:
-     if sys.platform == 'win32':
-         return struct.calcsize('l')
-     else:
--        return struct.calcsize('ll')
-+        if sys.platform == 'linux' and util.is_32bit() and m2.time_t_bits() == 64:
-+            return struct.calcsize('qq')
-+        else:
-+            return struct.calcsize('ll')
-+
--- 
-2.34.1
-
diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.45.1.bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.46.2.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-m2crypto_0.45.1.bb
rename to meta-python/recipes-devtools/python/python3-m2crypto_0.46.2.bb
index e0e9fdb2bbf8..0a631c7a07d5 100644
--- a/meta-python/recipes-devtools/python/python3-m2crypto_0.45.1.bb
+++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.46.2.bb
@@ -1,14 +1,13 @@
 SUMMARY = "A Python crypto and SSL toolkit"
 HOMEPAGE = "https://gitlab.com/m2crypto/m2crypto"
 
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=b0e1f0b7d0ce8a62c18b1287b991800e"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSES/BSD-2-Clause.txt;md5=8099b0e569f862ece05740aef06c82a2"
 
-SRC_URI[sha256sum] = "d0fc81a8828edbf4308432b3040bf06bb26bad95abb9e7d4690b6118551e76ec"
+SRC_URI[sha256sum] = "13c2fa89562f7b8af40cc74b55f490be5e2ab8ccfb739f11c16d3ce6221a61ba"
 
 SRC_URI += " \
-           file://0001-setup.py-Make-the-cmd-available.patch \
-           file://0001-timeout.py-use-qq-format-when-time_t-is-64bit-on-32b.patch \
+          file://0001-setup.py-Make-the-cmd-available.patch \
 "
 
 inherit pypi siteinfo python_setuptools_build_meta
-- 
2.34.1


