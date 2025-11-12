Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ED09CCF9F8
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 13:44:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13700.1762955075909759467
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 05:44:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=lP6JwJ44;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3411d85ce0=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC67cZt1782935
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 05:44:35 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=6DdKsa48KChpZNh9Fg+3Np4QWP/gO83UpYEsBip6YGE=; b=lP6JwJ44p58B
	5KXbTjcHcwfwpWmzm1PeNx/sd+R0lf+ZbS17jdCCyy+kGkEFd2U1H26wVtY1/7VW
	bcQ+ssICm2NvyBulfbNRvg9aMzLxWsptkVo+9rucoy+qybNYbS5QGSCmOQQAPzSg
	te3nbTYgQfm5uSoiIPabviZiG/YEuZYHBhnr8qOH62nVw9rDhDoZeFc7rEETAG0Z
	ZPRO36AiG0Rvl5sLjMJcVemZRVn4E+xbLe3nnZJkKTlbNdDJzofhymlF/yeGJV6I
	WWuIwnC0qtPz2onE19HpF+wiN9gY7pQCqeu+XZsWuhZ2DgrxLxaEFT/ltpZ7zNIc
	cVQ6dmdfsA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011009.outbound.protection.outlook.com [40.107.208.9])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aa213546r-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 05:44:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=occUKLi8KAt8esLw7Ily+J/211VZfnpqrf/CUPSks9PeniKVGMzXA7ozsNWrdHoP6LCyml5JMEuAUaMI614HRnosv865dMAVuJwW37htZqHt1n+0dGXcO4D4lk7r7D6FoGr13TbqqARSkAFJLe8o52uDckaJ00pHyXbknBmM1KNu+Km6L1s9mkCeAlr28krfYrOkgVXjUAPQHFRkvIh4bda4Epb7Ey6peFwWhpf63ow1+NsZjggxxBoyh365ueE7fVrucQ7ESajDEtJ/0Jn9SpXudFzv4lxRDmr+orjMHC6uQhUXJCcTbi/GHXieSAvsF9FAVz07P3tl5uP/3ETW9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6DdKsa48KChpZNh9Fg+3Np4QWP/gO83UpYEsBip6YGE=;
 b=sLaY7vHbNadR9d4YjK0niAqtivy45qnAeX3+lGyDQ22U72IoVqEV5VFSCCZRKJNoMmx79JM+eXLHGAYvfVS5MvuBmG2TXjTSVsjmU57qbaN14pM1/5I/JHVD0cVGmKobggMhCmDAPoeoYPZ9F8ZBITqpf0CUCKvBqKaBiTxGwTzhdK69PRDFk7DP/tv15mgk8X9YjO/+KssmsE7BULhFCuie7lBfQVimviiAonLuni0qERKLTxpn86wipU7v0TMnbolo6hKFgA7NY/licZpSrW0R6azwo9v9xzX9YIYLpXHE08dVH7FVmR8uEE/aeGUM9XwuDghyi7hCZGJCHcYGGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DS4PPFABF58482A.namprd11.prod.outlook.com (2603:10b6:f:fc02::45) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 13:44:34 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 13:44:34 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 09/19] lcms: inherit sourceforge-releases class
Date: Wed, 12 Nov 2025 21:43:55 +0800
Message-Id: <20251112134405.3706508-9-yi.zhao@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 89f64220-1e23-47b8-541b-08de21f19d2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?+bpig9uphKsCgIviAb2JMbxLwi0V1sK5vHoFvZKhe5iKlYMk4Yx8qxjRFM7t?=
 =?us-ascii?Q?lAbkFDZpn1sKrasZRMByoei4p/eXPTJnUttRFlZwZ8WHPER6Wu2wE8l9drOi?=
 =?us-ascii?Q?KDBPxR7agC8br0fdzv3emuS4uUe0XDcjR4xqUNCdArhM9I7mpZqTWHcGAhf0?=
 =?us-ascii?Q?93w73FmaLadC5Fq7q5/MGBd1Mjk8H7SN3ewHWNb6NSEF3SUrcW5bbLcTGIQm?=
 =?us-ascii?Q?h5jzu5ktocqUGSVxTFKDKMRaIpap99S5zgkb/lEkLNNOEZRiPmUnMt374Zfm?=
 =?us-ascii?Q?8ZoYvZr9l7A6rC0wMSYDuVMG4ss2OyClxf1F7q3HWVGl8RsNp6f1LrPh9qfA?=
 =?us-ascii?Q?zZQBPMvqaxmFumpMlTmxcU8p7y3jqF8iU/soP+TtJ5XNz1wgOahgEnO6tP1g?=
 =?us-ascii?Q?XB7JKugu6+Xp6MOCeUcPuCSc0OSyKWFc1wsuhbEcwM+t9Nrk66Xe80KWxweW?=
 =?us-ascii?Q?T7YCogX36mnEIn1SCMqalWo6UqEXpYqUcydp5nSznmB1QCR6oYhpjrMMS8ae?=
 =?us-ascii?Q?Yld9ceIkzp4AsfR81qymfPc0wO3UDh91iAoJPdnqtAOzlLBKIROWXgFJhD2X?=
 =?us-ascii?Q?M+U+PCnkRLPIJ2OORCVaZapVvW/OC9JiZtwqo5wEIjA52ntCSrb2YwDfAxiw?=
 =?us-ascii?Q?MwcFttXU0Ylm2izf6N6Dm3I3h5n0T3IZR8AD/iWWer2YybaqgbLx/HkH8Ro5?=
 =?us-ascii?Q?gfDZosUAKlP/auJcHjdIdIyT16C3XhPQN2N8oLdYRaK15IgJakpT6dwdPAH0?=
 =?us-ascii?Q?2Dt5qmEz9Hv8bNuwzmbl71NCnN1Q8qjgUV/jBrznBAXBmw2zOwBqZX3eHrYS?=
 =?us-ascii?Q?l81YoYTXrWdC1eA+hGhoOFGzTlt4hviZHqYTADyWp9bP61lDdXOhNxL38+I0?=
 =?us-ascii?Q?asp5ckgAFA881bFW7nM/QkncKlveuCZPu9e+YPc8oq8BycpfBOIhoZj0S2pd?=
 =?us-ascii?Q?pvecVEW6kWixQH2YqHhDeaAD11rXYIWCKhwJSSSd8yGWDB5zJvTXXsqZvCww?=
 =?us-ascii?Q?vrTKiBEBfP/bCJt7fV90rcE79Oc6hH2Op2GK9FyWajjyS9QCbcNTr8xi6BMq?=
 =?us-ascii?Q?OY+OrInwey9agos/pSdcUm7CDGJiSbeZKdZ1/Xaxcizx7LJE7LPRh/Y6xtQV?=
 =?us-ascii?Q?oK0KNDDU3RMivKPpU8HXjzziCsUcvaPRO3X53GKllXVtpZw8swsIoKZCQGcw?=
 =?us-ascii?Q?jCzxGaAJk9/HdBqwA6+8Q/NbdnMxlbI6N7rvwoDTersAmgg0boK0xy9kGAU7?=
 =?us-ascii?Q?zI7VX3DueyUvTqmcuQ+KaWRq5xhZmhBcwxJz8etxO2aQe8cNPRsR/ejpc8Va?=
 =?us-ascii?Q?qmUiz9S6SLVmAdyKsyMypDSnZW0VJNRmKg3R8m7PyvgqOC/7EVgdvG2uPomv?=
 =?us-ascii?Q?fKIJVIGXkKyB5qHqiPJsh/2X6Y8aZYZ+2Gflh4Wa7HsYAhkHvmZMslr2jb8p?=
 =?us-ascii?Q?gOrOI7tw7RkyrZFFbKC+qS/iehzn+pFdN+WOpAHKGayIV/VWXSpV/1r69o0N?=
 =?us-ascii?Q?oq5UyDLAdImsD8bF+i8X7MoGwihKNOj9cFWH?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lqIOaKzjkeGQig+8qds9EMIC84Pn9MLQg2wmZusbVchH0FsFbeXbeIny/09F?=
 =?us-ascii?Q?9QU9/vPoFSGwIxXKiH6C/Pa3mGMa26YD/pqQfy4S5pEKouLJxtIWg5AwQWys?=
 =?us-ascii?Q?N5Eo/eAjVnqSgd7d+gHQlrYXn4wiJvqKYG3k4hmCsx9n6FqvekVBGw/WTJai?=
 =?us-ascii?Q?mrxVFZzwniPThel7NuKmbiEtmvGxRyZlC/Mp4XzHsWDQTzoTLCwN5Xy3TGl7?=
 =?us-ascii?Q?pifRi5lW/SO2bFnrlqvMG7GgV9ry+8W51txUSeyLJQMcj1gKQ6muCym37rcV?=
 =?us-ascii?Q?GUc2v5RYA5xg4vmHCfTL8D+1ASlZKO8Lmo0NY8iXq4cLMkOjoSF57IDMZNtw?=
 =?us-ascii?Q?wpodo8wRVK2zSzT5gaTmZOdHYJOJtVIQgJYyBIUxY46t5jC2KnAO0Skp6eb3?=
 =?us-ascii?Q?FMJPLmII1juzhKjd6lP5tiMg7bo1Rg5tSvNAvKqvPLPSZNx0sk7+GlRN14tY?=
 =?us-ascii?Q?2nXgreslif9/+Uvd9dQrSazjxPVlFwtFQaNpxGDjrl5nrdX1nw/6zSJWCSIE?=
 =?us-ascii?Q?9dXezTVFFO3AGhmHsTDDn3r3Qg7QY3M1VwDEqQW/+ti5hL5/imkP/zm/MAX8?=
 =?us-ascii?Q?eNpIJYVejYBkjJdLQPVkACR6taC9pCGQ6nqRYJOSU4H+iae7omc1kP5F0tzu?=
 =?us-ascii?Q?jci/CNgMAiSxr2nrjYY4rWO1FMvamE3uxXYBO+aVT4/Cl+IZ/MnKYqoSS+Qh?=
 =?us-ascii?Q?eZCv/f3svsmuy3kl7apl3bNxjh1RYTKC+dRHFm6Wlk3bV0oyqbZCwiNhpJN/?=
 =?us-ascii?Q?AkHYEGWtXJO3fZxap0ipeHBYpdygwHddZi2Q9vFkT0NSHVcwmL3nwAjsOO1Q?=
 =?us-ascii?Q?V1qengUO7DLEgFKB97VjNzhM6SLLjz4z7eEpZMc06yzVGoNDzgUKz5ujwLFU?=
 =?us-ascii?Q?QVtoBNCGuVgv0ecRxjpsQVz6Qe6XbVJmI+bnrzz1L1nqzvPP2HKM1ieQI/vm?=
 =?us-ascii?Q?m4iSuJiC1anbrkkBgrv6ezUHRer90HSjTsmQXpkTjf3/iI2/WM8LjcepVU78?=
 =?us-ascii?Q?Lm884dlnsW1J5DEkANM6kWb8onmniB1OdSilYnpatlgK99nbY5PUN6D0rlX2?=
 =?us-ascii?Q?zc5Q4VHLwiJTbBVoAHBvPsU4Cg3X0fAOMlYoSfGL2SXBCmOjLU5iCL5oVycp?=
 =?us-ascii?Q?OeTB/yxpXG1uvPr/CIlqdnwvufSCZ8MiQFAKB7OHxUq6SO0eGdZCaTGHwnyH?=
 =?us-ascii?Q?0gGk+ujniX3uBG4pYwpZv81jV64UkfvrlIsK7UOnyW4Cur3wGRa9b6uoPfYK?=
 =?us-ascii?Q?1+Juf/EeOs/IHwrDh+xQzcEq/CAP+O26P/CDDkVx3lL0pheSO8SWEqPqPMCO?=
 =?us-ascii?Q?dPolsqiOAwDIrvy2yQ5IlMomtfAblE9BiLew06np1XD4nj8jnbU0DXx73b20?=
 =?us-ascii?Q?EYe8P4AsSA54TpDlvxubAYNZUN8iybQ/ztBj9XpaTlhNaOCz/3tpysrMmtD3?=
 =?us-ascii?Q?FwCqmbszg5U3OqOA25dF5Uv7dJDDCow/6QKfbO1uKgV9h8fVvv2Mn1Xl3pl1?=
 =?us-ascii?Q?Vu6ExVXSgD3UujJSlJPbW/QQ49HNHKmKUO27Dbccmq93RaY8oA+2rj+FBS0L?=
 =?us-ascii?Q?1V3BMAhpQOTAl8lCM6R2walKmaFGuRkKPQaQD91f?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89f64220-1e23-47b8-541b-08de21f19d2c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 13:44:34.4629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ishsEZ9kK6iQLUFOMEjo0EbOa/aa4LtntXj1BDH1lUe/lk9/+3HoFMkWpUI25Il+KXbVk/JjY4i7mq4MkQH12Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFABF58482A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDExMSBTYWx0ZWRfX2RfN+9Yj4Ua1
 em36JRG1uwsm+FsZT/7/6LzDfvz94aVrDfxqneXLkK4R+0M7316TSVezw6TFf8j2qwgSohgHsP9
 ONOxAya6ClrgYiLfqiQWQGdSVXbL97rVZgAjSONLQGNliyZW4DEIG8/vqp06vVCnI6Hyzaia8FQ
 tASG8rKadgVUKI4szdNXV8/SLXtXOerg5gfxlWYo4nmQOKLPhVNV9zwx23wI/C+/tM+LXxA99j6
 Cib33h4OujU/nhI3IT/dcxzEmub9mlrBVfKvDcd7fMPp1Yz/HE3RbemE4GDIIIQkVhBx1rwbeku
 VWeWNgEBH8d5lZ5VEEGcM91Cvrcmk2Fl8QKkIetDxopwPEXRF/cTTbD4pL2hw1XlcIUaUs5aviW
 DGJQg3NszAqttSWwVlK2eYJiMnqAHw==
X-Proofpoint-ORIG-GUID: RTN1_ptOo_kQVtIFa-0X8n9z8iFmr_fk
X-Authority-Analysis: v=2.4 cv=XPA9iAhE c=1 sm=1 tr=0 ts=69148f43 cx=c_pps
 a=8LlSNZ/L86USH+wcAhsXzg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=bE5lmaMOTslLASF-FEMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: RTN1_ptOo_kQVtIFa-0X8n9z8iFmr_fk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0 bulkscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120111
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 13:44:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121538

Inherit sourceforge-releases class to check the correct latest stable
verison.

Before the patch:
$ devtool latest-version lcms
INFO: Current version: 2.16
INFO: Latest version:

After the patch:
$ devtool latest-version lcms
INFO: Current version: 2.16
INFO: Latest version: 2.17

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-support/lcms/lcms_2.16.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/lcms/lcms_2.16.bb b/meta-oe/recipes-support/lcms/lcms_2.16.bb
index 87b0979200..9422c7330b 100644
--- a/meta-oe/recipes-support/lcms/lcms_2.16.bb
+++ b/meta-oe/recipes-support/lcms/lcms_2.16.bb
@@ -12,6 +12,6 @@ BBCLASSEXTEND = "native nativesdk"
 
 S = "${UNPACKDIR}/lcms2-${PV}"
 
-inherit autotools
+inherit autotools sourceforge-releases
 
 CVE_PRODUCT += "littlecms:little_cms_color_engine"
-- 
2.34.1


