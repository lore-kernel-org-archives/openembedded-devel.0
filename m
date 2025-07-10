Return-Path: <guocai.he.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89FB1C83F1A
	for <webhook@archiver.kernel.org>; Thu, 10 Jul 2025 05:24:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.1326.1752125031931376046
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jul 2025 22:23:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9286ecb856=guocai.he.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A2xD8p018598
	for <openembedded-devel@lists.openembedded.org>; Wed, 9 Jul 2025 22:23:51 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2047.outbound.protection.outlook.com [40.107.237.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47pyb5mvdc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 22:23:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jFLuKO1nxcCCXi+WL6NPSTRsnWcVioInHgrGKRgosgezCg+o9phAG9cfusxijXLMnGAKz5No1rh0owXRUmn4fpb7QynGWzkOUkQEn5ry/uwwNQK5JQi6W9QMTeA2aAVTkm/lasigz6JJCpqKXlUHaHx8LuT3yhyh0Q6ISIK7SOy9lNs4nUOgjphedwCOw1OMir9JRJerR0bDlGKF4N9Dh4u0XKaH7VCfKo9SDe2Lpod2eM02rsT96hDY81Q59zv4F/EM02yBvZS+mfv93/k+UJEI9ixgz5DfPxvqKyG7qI7elDp/KbBEWARt9jhDKprwpB9QcolGgRZukLeeM5yUqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6xPgZ1IGrWupQS5heUPnN/1qeAYnXFWRcI+M4Rn93hk=;
 b=Jg0UoegXFYTBqzInV9+wvKHwHjGmWNthrbztiF+omHhsf+iPHqZ13FMstE7D36wvO0aq0xzoFHjUS5124i6+vuSoz22TaV3kthEEUo3fvfDX9W3EHI/Uf9ruqL9H6+G2yg0i7P8HjU8pajZVqUEr4HSX520z9oVylIm9OXypnUVTNR/X/RpJoHazDcP3hvmPfMDy9mR/BX640aHQf3eHuF/w/6mpjZyDC5bbKJOFg7RQMyZ9z7QwHFE/AeHCvIMDB0js04mPmNj6BOZVFos5upd1lKLSZXVN/CS/IqJocSViBL7ZWxiR9W1a5/+9EHo8dFJqjWdbQQmuDkdz0BPZZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5586.namprd11.prod.outlook.com (2603:10b6:5:35d::21)
 by SJ2PR11MB8470.namprd11.prod.outlook.com (2603:10b6:a03:56f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Thu, 10 Jul
 2025 05:23:47 +0000
Received: from CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::813a:3211:c8fd:1f86]) by CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::813a:3211:c8fd:1f86%5]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 05:23:47 +0000
From: guocai.he.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] softhsm: correct the SRC_URI
Date: Thu, 10 Jul 2025 13:23:27 +0800
Message-Id: <20250710052328.3399677-2-guocai.he.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250710052328.3399677-1-guocai.he.cn@windriver.com>
References: <20250710052328.3399677-1-guocai.he.cn@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0171.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1b::21) To CO6PR11MB5586.namprd11.prod.outlook.com
 (2603:10b6:5:35d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5586:EE_|SJ2PR11MB8470:EE_
X-MS-Office365-Filtering-Correlation-Id: 560da4ba-fdb0-4def-b0a2-08ddbf71f22b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?4NDk46H/DPCNHV7m3ugwdRSZelgerD15xIt3IJEw14Ihwtbk2npz+cLCVGLH?=
 =?us-ascii?Q?xHEiYkjEekGhl+5yLk4Dd1ZGnm7UGsiOVXaHzbZwJJ62AbTp1zJnvEIFeNcH?=
 =?us-ascii?Q?AveQU6t88rD3Eaa3dw8xSUtaJCrqZmWBL14B+G3SEzB7fnvtSsz1AI7TRU31?=
 =?us-ascii?Q?FFiC/BBUBY8z/NlvQ8NxpMM6GMhu7rY9JAr4rOevD1woi7Oq6HZqhblm5G8C?=
 =?us-ascii?Q?jp7YNWyIMbixm7PwBGHKHBuXPpx2MQ5BlTCNDqdq0ZXwr5T14U+EIUBlUn8g?=
 =?us-ascii?Q?XbfyhBtOK8R8U3RlH26nI1tYQrZ4Rl9aKLmvFMGqU+PpO28iY6izAikUW98F?=
 =?us-ascii?Q?LFSmNRmgoP+c9VtET3CVLWcItDx8o8ulfj0p8eaBwgfAsNHu3KYuUGUPbjEV?=
 =?us-ascii?Q?3bW/bxSwHgNI/GTLPhVk/zWFddDfj4UO+WJ7iUHfAvgx6P8NodXK33wyZtxy?=
 =?us-ascii?Q?j5/Ez6GZ79PX7CncDT4ptweEcd7ja+8wx0QEw7qmb3a/uQoPpNngSFoyWK5Y?=
 =?us-ascii?Q?KxhGRYIc8aIyAvIZGNGBn7MAQILOHIVu0G/YANKtJUbeLoAbxOC/iaEZFG/k?=
 =?us-ascii?Q?0W9b0DGzXoqVnzGTuYKxDysonSN515C+UUZlZRvLlZaVj2VY8ULR9OUUQDda?=
 =?us-ascii?Q?a7rQYVFNwRgSKolhYPvXxezaknCH99I/MIci8NQEmjxgnyINMvINoXPC8E3+?=
 =?us-ascii?Q?D+zhsto0TGkcfsVoZNNxvRqL4Y69J8jmf1UM9qLXVuVLMu0d+VzMjpltHbjq?=
 =?us-ascii?Q?Kudb9WGkNbflMrf5glEoCpuPqDwU3DGyK7APFJi37RCRm7E3mR1hTy+E5cmS?=
 =?us-ascii?Q?2HRVtvkk1c1R7UWow5fQLpDJDb4XEVvKZiGp6oG45ZPo5zWqs2VnBX0ACkxg?=
 =?us-ascii?Q?6rwUeeJxtcvnNwKuQxlTTol2L9Kgxf/pj2dYApjluWpR3gkVYRuxnTM6LjsB?=
 =?us-ascii?Q?imnXaitIgL0lz0VYX816N9wnlR3hVWZcqQZD+3ZkR8SRMhdt3Ps/dJ2jM0CF?=
 =?us-ascii?Q?ESX23jmTsB52XS5Pit7BA8x1Po1e147Kd5x+ghMZ5NHCnaSU9rq0JK54SGvr?=
 =?us-ascii?Q?hG6o2jbdqnWXWiioYZ6Rj9iri89LvL2nAZWrT95m5YD3sJZA6KDh8vAt3+ta?=
 =?us-ascii?Q?+YM6hlIhgNlYNqbuLu5JtSHeaRiraeS9CuAsv5iHtwu5svAEziCXeRnItJIZ?=
 =?us-ascii?Q?FosKfj8f/KeNykuAGjtoPSPrnq8+Za3MN/BFAD4Kbhrn9X1uwtSNiMA13qU1?=
 =?us-ascii?Q?NkxoyBNY33whmucebnTf+2ERdsZtnrMlTrFix9LWAMsqsjaCd15u91aJ7rpr?=
 =?us-ascii?Q?rMlosaeWkKMx8bN0kB737qHusCuCjZs7pB49flVBCPilUwaEuJi19cseh075?=
 =?us-ascii?Q?ozel3kVo5s5hCXX8Q4tR1nwgJyGjA6Qh7Boeao0W4z/2S2ig2GnsUtY+j+WQ?=
 =?us-ascii?Q?LVZKse32WyA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lcL9y0K1Xjc08J05b8BDmUfxlSKVOr5FO40SFnbNGEA26ADiyKhLfJI1nzOh?=
 =?us-ascii?Q?XJcF5yBf1j7wD57I9xhamQoc1NB9EVIASH876hqEFSii1E1DErj1+IZdDo+u?=
 =?us-ascii?Q?FTunhChrUWmdKYtozCVJab2dh8SUPpGOAtC5tbWR/prTzUaXav+5kvILFRBM?=
 =?us-ascii?Q?AGCZI5NIKlDeUyRjD+uq/2mqB6phLlUFvQNVukizN+SIuibFxLGf6uY4MB/u?=
 =?us-ascii?Q?U70GFklbLmKjRInqht+wmdSYJptDa5YM+rFvBNG1tQW/Dg3kyrEMMMuEDyEe?=
 =?us-ascii?Q?ATz8man8iX3ogt21RAimVB0itsnx8cDPUFium76R+peeG2YJBlRn4pBRv092?=
 =?us-ascii?Q?i3C3VNK9z7q5rGP4EJBnrtox11jKCPTzAGPJqNiSNDFsKUUpZpZ1PAzqQo6p?=
 =?us-ascii?Q?lSWOTPL7P07n428rTFMAmW0unDcI7EwuaTz8uJNRWJ5UtxJ00Z7AeCePzB0x?=
 =?us-ascii?Q?ZKC4QIr0PRSVy8XqLcTqL+VCGcSVw9OeLkT2lBhwNhRQagqopxxUoKpok1h/?=
 =?us-ascii?Q?S+baiEG1B0mUeVTC3ITbgFtXnRlv4QBnEt05DhZL1vQIdQSvR8uSUdo+o3ZE?=
 =?us-ascii?Q?IbsGaaBEy8NUQuY9y/0h7gJ0SqwqzxtQPwbsH/XaHlLhmXBvBB6v3fbSyrFf?=
 =?us-ascii?Q?anUWhHL8BnJl9GB1oxqF9p8jVTqSz54COelbaWmrPvuMOf7CvLdOh1Y0DKyv?=
 =?us-ascii?Q?I5a2b82gbM/mjab8ToUA+4zsz7G+b96oduo6auR/5EeYZmvVKEXUUsFW0dCz?=
 =?us-ascii?Q?jorIJkd8Kruzsi3fLm4EZeZxyB11mVySULJpUdMEj/VP3XieQlwXd5//lj0/?=
 =?us-ascii?Q?mrsgs0NeKItKKgOmAaeWu2NRKLO+tPkIoSgl9GtMNjMEXFsD3e+MNIFUGBd1?=
 =?us-ascii?Q?9pUIDdY19RmrxGg0AHGxl4lYX6EE/kP7m1iAeFo5+AqqC7nS61CuNpa7tU+h?=
 =?us-ascii?Q?5ZvbRFuf32k+fhDDfYRUUr7CtHjZWa0Y4NH1jzzDsfizn4W9DUFjnzFHG5bd?=
 =?us-ascii?Q?VVOnl8sid1aKah9HldkhvSml8QS4WQbdtXqgxtVgysmCbuoYoaHr7FNf3xAJ?=
 =?us-ascii?Q?3VvNZBX/hfx7+M9UEKhDR4ok61ygBhNWiZdqs99bsNgotYDCtNscHCSJ6GxA?=
 =?us-ascii?Q?qcAfMZA87wySuTOl7fnWEOITMDGIl671TfuoXKNVRqRhmV4+c+QppH7uOfQ+?=
 =?us-ascii?Q?NLK9yQj/OuzIAxnnGqEPLR8qTe55A0x9Ksfy7sJTJQh/kgh1VsvHqufvGOE6?=
 =?us-ascii?Q?q6IZGQ6BJ3/61ywD61DRylSbvpmGSK4Hg+MnBy0GGVSRMncPB58iOIQZuMh9?=
 =?us-ascii?Q?7Xx5tf5HarM/inMUj52DbKfw9KTNMrmoCE/t4/sgGsy1oY7zVJFj9Lx5aHcv?=
 =?us-ascii?Q?Jd/iL3rgP2M3SggVMOyaZtZy7Bq1Qw2DYynyj1wfm94qLNJ/ZLknjwkkHzzG?=
 =?us-ascii?Q?o40U+Nb+9UaW8UBdfldW/FpCM3pqTS2XODt9/uTVo9VNmvzsuAUwUJJCKkrx?=
 =?us-ascii?Q?0UvTOy0I/LH0LyheneD1d5EKn4H+mYGtIQukswSYKWe05Tznh5t98edAYOdz?=
 =?us-ascii?Q?tikot7zJvwZwwr00j0lSIo51kZrTmJjGMzeS77nYwoCkwBjM92VSVSIBM2qJ?=
 =?us-ascii?Q?iA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 560da4ba-fdb0-4def-b0a2-08ddbf71f22b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 05:23:47.4429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1pLdxoQPexFUL7+0ZXwTuBFjpsnVxIYlhTxYpJ1hOK9cbMGp8fKvFU7+rrYIY/FE1SdPAwaxfQrlhLg/G3TPPuhrIgWv2vWWBl201IhT/Tc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8470
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDE5OCBTYWx0ZWRfXz71LoOSKa1ZP EBR96bfnJ+2n4rUG35uuNfPoao8089k4kurr/JTrH7Mr2v6S1ydSvLBtRnCaHJUDBX8eTyAUcb+ grZAtTFGcFiWWKAxt2hUPYcOTPT6V1aBawnLgisj+2VmMnR+DoVVjGPM7JYNzBYMZY8BSvVCkNr
 1gOXOtvyecqNegmjvwy+VuvY1LCRKsE6Fzd9mFDAR7gxIc2NTmwiGQKM3iJ6jNctGSmBVgU+fi+ /GT8T5t6hn/KSDnG2UFCSrql2CQlu3xT+NquI1u4WzUh3KMpaz+7kaglefuU+p5Zuy9G/pnQAEy V05fRjSNsdeZz2uhA+Eimx+z0ER2qrXBi47c1yZzaVNCna/gsYM1zMn9SPLzUDUsHTnxeYE4Z5f g7E8iF03
X-Authority-Analysis: v=2.4 cv=V5590fni c=1 sm=1 tr=0 ts=686f4e67 cx=c_pps a=C121ihmqoWJLztpWA59etQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=TUjdwidjAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=qDAKQ4oUvqWMKBxwk2cA:9 a=XBCfRPmKWXHXM36ql9fg:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: OxG5-QlfN6RC_dyPS_MzDUTrYtz_k648
X-Proofpoint-GUID: OxG5-QlfN6RC_dyPS_MzDUTrYtz_k648
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_05,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 suspectscore=0 adultscore=0 bulkscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2505280000 definitions=main-2507080198
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 05:24:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118391

From: Guocai He <guocai.he.cn@windriver.com>

The old SRC_URI is not available.

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
---
https://dist.opendnssec.org/ unable to connect. the tarballs 
move to github.com
---
 meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb b/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb
index 930bca96ff..12c6947a21 100644
--- a/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb
+++ b/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ef3f77a3507c3d91e75b9f2bdaee4210"
 
 DEPENDS = "sqlite3"
 
-SRC_URI = "https://dist.opendnssec.org/source/softhsm-2.6.1.tar.gz \
+SRC_URI = "https://github.com/opendnssec/opendnssec/releases/download/2.1.14/softhsm-2.6.1.tar.gz \
            file://0001-avoid-unnecessary-check-for-sqlite3-binary.patch \
 "
 SRC_URI[sha256sum] = "61249473054bcd1811519ef9a989a880a7bdcc36d317c9c25457fc614df475f2"
-- 
2.34.1


