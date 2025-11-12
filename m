Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C28FACD1297
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 13:44:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13704.1762955080373587826
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 05:44:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=MegUoGWr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3411d85ce0=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC3a6EB2219128
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 13:44:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=UOh2pfj6SaT9gpEVToK2/5+cgSc69nhml95JFR9Ab3I=; b=MegUoGWrCsVe
	yl08Wr8lGwrD7LEW1Qk3PH1Qn0L847P7qZNCWZC/KDqguf0CLPoYhy5vnRHtdW2x
	3grUIyuQE4pUPmYxyxDovsPT7DxwlXcwth9+Tmu1tyT/iSkJIwZeuOyi0BNSTxL1
	5VIbNOGrQmsg9v2X4e1Vz1r+nAdtAUysj6039xuPRMRB0TnJRNZS7jzWIFLUh/RT
	VtaDrjL3ObhIqohRw5VQNV+MrVEtYg8p38GGwxJ/TpQ97GiMar9M6ajQfUx00v0C
	3nVe+xGOun/ShkD08hCfMY2tURNNToXZllYQEatIdOQ3BXRD3bvHJqM4h/KuiW0s
	dxdmhiKauA==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012004.outbound.protection.outlook.com [52.101.53.4])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a9vu958yb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 13:44:38 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PkCJ9Jy7ub4ia3yr51IIcZVe/R1Rv02keCcDsJ3pRCyMHucgx2MqF9QCSy0mhb2MMpX++PKvS0GxNArzARZunC9Zli6my/qYIm+/ywk+q5Gvv7g75/uG/sDYTjxQ58mpCvainu+6rXrc8nNCnoZn6Ualy3FoanJV10zbHQoNaIqH0+0zSNu+GYm+9/8FIySt0OPuTkjPzGHKNwC/aUFCNdKdK3vCvgx6Z4buFRNOpn8g6Agx6c4AW3ZCY/yqzSJ90Skd9NwzgASTV6ZPf8hamYAEnmlA2MRkDCmDCGDvRWEGGGoF37GaapRbxRw+HtObcSjwg5UvjQ6WzZ2IHznorg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UOh2pfj6SaT9gpEVToK2/5+cgSc69nhml95JFR9Ab3I=;
 b=ob6ppGcGiqlJtjLg/Mcw6LhzAD5UliiptJ/ZeoYdehUdgWUeER6d9NIueCexZVkB0qe0+5hA22LvteAOew3BrLOoMM5r4HbGqcZuPbRcPPAAIujUVPOkqMMpKpI2S3Ynm3Oz6CrO/GC+y7/HkXDSAUa1evya/HSuUbxUC4I1RNOPZpvJTFDghHRI5/BKrljiytG9os9zBH+Nl7bKsVibulFFnTTf9+ROYo7Mp4B8uzexD3uDJq77u7AEmX55zuuDFyQA1CLC4kPXpudYNq8NSpBnDB6adaiqWOfF2MJUcwgUG4DlbmvQtMSFHVx856/HuoPnREGcvQl9ryqx31TCYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DS4PPFABF58482A.namprd11.prod.outlook.com (2603:10b6:f:fc02::45) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 13:44:37 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 13:44:37 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 11/19] libmms: inherit sourceforge-releases class
Date: Wed, 12 Nov 2025 21:43:57 +0800
Message-Id: <20251112134405.3706508-11-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251112134405.3706508-1-yi.zhao@windriver.com>
References: <20251112134405.3706508-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0125.apcprd03.prod.outlook.com
 (2603:1096:4:91::29) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DS4PPFABF58482A:EE_
X-MS-Office365-Filtering-Correlation-Id: af188d57-125a-4358-1144-08de21f19f07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8ho2LR+lcTXXSmk8ki0Joln46CRT+4AlwB/cnqux89zIX1B7W9XhrxEg2QHp?=
 =?us-ascii?Q?zIFK5FHae0LXfJLELCXsrvltreGf/APIWkd+IfGfPIpa0HEuYHCEt4osI5bS?=
 =?us-ascii?Q?nwafWG09+fHspZcz0sgPjGIBR8xptQaYJOyNrYqrk838yMWcQC3nMhfjE5Ad?=
 =?us-ascii?Q?R1/ZgcKo0zxTPuA4qtT1YQ2UdxX/XvGlSK3nHvTCZff1BjlkJxme7c0Do47l?=
 =?us-ascii?Q?TbMm2Le2q6aH28v/bECzZB1K/Dykiuc5QR6jbiSRbn1JeX75s7ZICNCHaFwL?=
 =?us-ascii?Q?IcAYBiMKLCKPuecUi7XeHZ9iLBhi/9j8O0h3eKVVi9JFSysbfn/PoKgTukqM?=
 =?us-ascii?Q?LDZSpZpyC4MTBSTPliV3stT3q3R0HgyJsMTuwnw4/N5VoQXA+EFyOnXD456w?=
 =?us-ascii?Q?K4Fb4pH8ofEL+TjqAkVIqTBIVxmUq8cU1NBGHWWtwrCNoDOWpyNAFTjKvms0?=
 =?us-ascii?Q?NJqsh0ZyICBbcAsrGFvsI7KYUW7mUyLM7XWlYycAt9Zn1/bN0sfImfVO6Iqf?=
 =?us-ascii?Q?5uhBtj9fj57tJoi3+98p8TP530BDrTUVOE+CWACexL3ivaJ6GMiQYJpBgzlG?=
 =?us-ascii?Q?SfuibTALmdsqZG364oEl51pchCduTvLAQWqc5grP/v0/VBFEUVQoGmW2oKjp?=
 =?us-ascii?Q?VqjQ0oZ8Z/84jo2NfJVh0iq209DERPqZHc9vU3gsQWzJL/QDFtbBOM4s+zmL?=
 =?us-ascii?Q?jFcRsDMeOP8XVrZaHbqpBDpYukXLgZRRpYbhrvt9QdzsVLfgPK5DqS4YviVt?=
 =?us-ascii?Q?Oj8PfTbdo6iAuBVHDksp34Dt8bNINjVzcxxukjNBQldEmf8RRPFu8sbn1M0o?=
 =?us-ascii?Q?LcIr3eII5VsVsZeC/w8ssXwvX2G5eTJl1s6LZ7rsqQXxIF05u4MI5bH6TIe6?=
 =?us-ascii?Q?xYrHgmU+PLygaeCYmBORnzrtDN6Tq2nRAvu78KbLz8lm1CNwn/xD9NM+ZlZx?=
 =?us-ascii?Q?GXiUw1Q88TyeCC3pPzxRf2yNe9zASEFzL4A6tLBh0nG6ZKsrYgN7lqZ7244h?=
 =?us-ascii?Q?MCvVwAMlrorzv07GJn3SCEmKLKWZJ2iBclB3CnBf6Lv2V6GSZhgD8nGqLsLA?=
 =?us-ascii?Q?RSfns3UICYyBRYEu2n8YGZpqW+pK0wudDjivccpryP56TZ5Ed7ZxZHX7zlSL?=
 =?us-ascii?Q?siYuVzRE0LFLjblqEpvup7bT+DbOJaExkm+b2EYZ0JCiY+SU+WE2W4jBnLTM?=
 =?us-ascii?Q?dnJCVM4ixzGNxi2GKlKF/GvygkIbAc3xoZ8Nk88193/DqLv7FycpLr1DGwNY?=
 =?us-ascii?Q?kzTnwBTvm35mFuPEblXYOh4PtgFTovbUokXRJN0KkKZQdFOHjtdH/SuL21H0?=
 =?us-ascii?Q?ECpILISlT864c3+oJRekum0owptHMDlrmOG2LV0zKkMkG7LB9XwlL6JyoUL9?=
 =?us-ascii?Q?3AXtghAET2XdtEDX8D0ItqFc16xjhY0LKUSqfd8BeNNQ87B0gqvZ1N34lgaj?=
 =?us-ascii?Q?8pCwuzxo3p6lRKcvhw1ywjB4kOt4QKWulCe/A9QpS0I4mHXm/TviA2I1fCiw?=
 =?us-ascii?Q?KgbuF8OMiurjQWbVabapU7PVII6lm3stHqCS?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?F/HvOK9g578rvYN8ooU7zvf6UZCrwJ3GrS+zLVUKellcnoNT76pZBdUKsoQi?=
 =?us-ascii?Q?AteeHkh5nv3y+ctt0y2+qkkzCMfhKYevckGlzhKgkFgihgA9v1q5fqZoMuE2?=
 =?us-ascii?Q?ZFqI9gPa6i0oQBpWg5yLX1QfrIqw9sFqWFopGHOOUn3duBnBLwYnYuhqaNSi?=
 =?us-ascii?Q?zOx9ZL592VgjLXDuOmO2oR/hMPFtt9cMsHjbXtKWy+jbXC0912AhXVT58S8Y?=
 =?us-ascii?Q?YHtUrgJ1dJXJKH/WffNoVLHTFFGpNb+ps/13IRpRzUGBEnKXefUqMyOCVBwR?=
 =?us-ascii?Q?KxOvWpdrBtSVEjfTrvxYD1IsFR3dB7QMLMMs1ZfCvM6q74cDj/nnX/dCukyS?=
 =?us-ascii?Q?VkbHD3iSQjMHs8pCjtcJoyeqVXRFY+QdH5weI/XZ514iRT/OBhkprGlLrj1k?=
 =?us-ascii?Q?2izrh67PfoDqgw8eus0rihSA8JzSyh1L1+PCSox6rryZLfZ9OKtSi9VyKdKH?=
 =?us-ascii?Q?HlFkgB1LAKyfO7KvchLbY8x/N9CE8tXYhVJCqObusD2WILB5tdIWT8NuL+ZE?=
 =?us-ascii?Q?5AVnAJA0dlBEKpBrnHqjIouqFZa9bdDCQQgv5GMhokGt6m0EmmxmERjsET01?=
 =?us-ascii?Q?gL0h6gHW9R2IVXcYetn5nlWyMLDvvTFdAF2jHi0mh+jD5A8a3v81oJSZTrbz?=
 =?us-ascii?Q?kJlujXQdrnT6CC7JRv/z6bXxvKNeaDEViPxZdX4aMiQA4CLQpAXPlPZSycYd?=
 =?us-ascii?Q?DM+eaKEGkX9UfP5l2gOBemas34hKm9DFX320Iyv50dhYFJS0Fu2Unuy9dscQ?=
 =?us-ascii?Q?ogto1HyZNKsya1N7//B3NMvKUZD6mUueHcjRJjdYSEI+Xk5FzPXfFOPs+Ytv?=
 =?us-ascii?Q?lVjREBURco/dPoM7s+nVB9/4Vsw83Bx+txQLPvuG5xg6S5BWYvNBwHXB8aBW?=
 =?us-ascii?Q?XZxekkVMObC860NuJ+7e+ilJqjukYuSYiUIaCGJ7RBRheLKIfRol6M1d2WDb?=
 =?us-ascii?Q?csCekjEYIi2Ly8uzLjwW6H01AT155fECxrdZEhKzpyhXSibLiXtaOK6BuIob?=
 =?us-ascii?Q?hlUFXQXW82NB8aUGygn6fKR9A7kCE5GiM1hYNevsdi5AVPuf6mD7zzcC7/+k?=
 =?us-ascii?Q?uWaFTny9u43PYLPW4ZwaQbMMWr047/M/BldV+z6hgdc6+YaN9f6VcmGSxU+T?=
 =?us-ascii?Q?8iCqVBKEI4MwvgZ8Bq4H4NGU2Tb2FbRuZUgEiOmTsdJIUxNYFHmYqw5V2FIG?=
 =?us-ascii?Q?Imneh9ryiJMIJBffyyjCFTi/T/7Q22ukzQi5LFa7V3XBFdDr50jRq5wdC1CY?=
 =?us-ascii?Q?zlnXttLaRW7HoP71yDouUKB0FbfFPlPGCQs51+VZ/IAu90L1V1sry/h6ctc1?=
 =?us-ascii?Q?D7B2EOwG8+23UaYnKYiBS3E/S8xzUkpbbXtKIL5mTn0ytheN61nI4epOdM6H?=
 =?us-ascii?Q?ZBFr2V/12eY6N2wG+d99ABD6qbaeyfW7PbgPnTbSzUk+snA23eknZJfouqYX?=
 =?us-ascii?Q?c4ZZ2+dJd3c6COE3GzA2FC4dzKuxCRINcmVkeCpWbLSvJeq/P/YV98X1XjGS?=
 =?us-ascii?Q?331og6Y6Gzci0JhNYePHCJWVjfrRPP1DmYHo8B5vBL5P7qTubgK9yNpt5XQU?=
 =?us-ascii?Q?gYmIu7AbJvXnGvchjDJWwVOyAd3oW17g3uiOq7d8?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af188d57-125a-4358-1144-08de21f19f07
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 13:44:37.6298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DAEX+UiI7NNShLd1Oi2ECQuzE6egGAcZ/bFC0LSqHua8PC5Y6UOsEiJogxLPWoAjCo+4yxMYRCIGrP4r7hW24Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFABF58482A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDExMSBTYWx0ZWRfX1hIBBg9yDwio
 C/RgBPcm+iuoX2i5cGXQZDflRHkF43B/ueKlcloeGC6WAJM5Qfs8uzAJEUY54EbOYg9p577AclW
 MF4miy0ASmTkudbcLQDUl3CkNebAWMz+iDuKsdKvbbYaEEcL1+H9t0MddYWDDSJssyeYY6r+nAj
 IZ9OITjdBkqNPOV25yY0idoXp9rn8SuV9Pk6wpMvqJd5SvjVrHPEA1NoSsF2zNW2ReScEPOxc7q
 W56/zV/q5qVs9hsCK6Sr6aYPvIRTl2TkEa8ZCYz+PcF1ukSn37lLUTmmnSPY5BH4ybslgc+x38T
 NtoI1Kx1qt1VxMIy9a2yJvnBCMa4o/OU+aYByN50SfTmhWP8NEfPlsiD3znESV+vfKa6+kbTqGG
 5jZ6RBr3QYPPYjNpuIyySeZGyBZK1g==
X-Proofpoint-GUID: unWUsfdC_raYNzvnS4CW6XJY6nF9wsHk
X-Proofpoint-ORIG-GUID: unWUsfdC_raYNzvnS4CW6XJY6nF9wsHk
X-Authority-Analysis: v=2.4 cv=CMknnBrD c=1 sm=1 tr=0 ts=69148f47 cx=c_pps
 a=1kzZLs4G264k5kMmJ/E+Xg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=3n1MrVETIjiz0KkJbxsA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120111
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 13:44:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121540

Inherit sourceforge-releases class to check the correct latest stable
verison.

Before the patch:
$ devtool latest-version libmms
INFO: Current version: 0.6.4
INFO: Latest version:

After the patch:
$ devtool latest-version libmms
INFO: Current version: 0.6.4
INFO: Latest version: 0.6.4

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-multimedia/libmms/libmms_0.6.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/libmms/libmms_0.6.4.bb b/meta-oe/recipes-multimedia/libmms/libmms_0.6.4.bb
index 9fcb8a1dc0..4e65e3cea4 100644
--- a/meta-oe/recipes-multimedia/libmms/libmms_0.6.4.bb
+++ b/meta-oe/recipes-multimedia/libmms/libmms_0.6.4.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=fad9b3332be894bab9bc501572864b29"
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${PV}/${BP}.tar.gz"
 SRC_URI[sha256sum] = "3c05e05aebcbfcc044d9e8c2d4646cd8359be39a3f0ba8ce4e72a9094bee704f"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig sourceforge-releases
 
 do_install:append() {
     # The GLib dependency was removed in libmms 0.6.3, but the
-- 
2.34.1


