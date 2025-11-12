Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEA85CCF9F8
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 13:44:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13529.1762955085199507360
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 05:44:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=YdRmUTX2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3411d85ce0=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC53dVK3492130
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 13:44:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=JNTDYMEKoQLKMcqT88/aXuWEvBtblcVu+ZNBcLMEjSo=; b=YdRmUTX215xp
	qdeP0NrP0NtICvpOrrA1ZH9pzQVdWhoNSekrTT+Ev9N6dc0TJozgG3u0RElY+xWN
	QL3DxNYtuwXSw24ZiG56sopi8HruIMrcgaGYFrV+D9yV29WU+ALVL57nwHwFykSl
	n2VrFnzrapAsEkWEb5/Arf4LuOP48/0LsTsavfu0DsZhkqNOTIxUvsKfc6A3pcsC
	sJHhUXzYpxSJTGQKTVpIkZPgKfKUyFHyIQXnGWBwJMImYMgzxUdsxsd9IqGxNTnH
	go11Y5U+wdqX/yW4K76JJXBSVQh9BqQEHBlny0nm0POiw0zxE93G1NY/OlTIIuq7
	GN6XXJ3YYQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012069.outbound.protection.outlook.com [52.101.53.69])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a9u2x5bn3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 13:44:44 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VdjSUL1WQ1sONBeonz8i46CtAojqmewM2XGeopWxiPziQIqyTYYbtJZaAI28L0FHx5VlF5KRr8L5zHr1aDkSRgLgFPXtWho4KQ4ZXMENw02+DDvg5Jh9siqYOztfxshmJ8K0STlQ7viRAOSg+DfBk/yXy9vhtEYcOidg0Qam6Eh40uBn6kTU0CILelFRNvk9cGMc6stVc7tkjYUFmXJwpJCbzF7PEmdpP7g8WjpAYLHrbobUtvyXYa+TPgmA5kc5po927h2GB9jez3UJJ8eBxo329KYKmrdwhe6RPL96ot8BO/BItHDBuDMtpGq+EeBGd2Xe8k64Fmi3S8BxJxh0kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JNTDYMEKoQLKMcqT88/aXuWEvBtblcVu+ZNBcLMEjSo=;
 b=HHBL00qtWPHtotlME2MufPGPb+LVTJCd8QRhI42tiJJH9UNfVJ8HVXT9dMI+4yYya/4fIlSQp/figEEW1d0AoHjMdpygF+8xrvhEhWlJvFDfEe1ck40k7IRfNhKQf0Z9Wvul5Efwz57lud6tC27T8/dYlIZZ6CyAXGXeQkpQp1eyk51Y52+i4DrdkH0rIlFmGDuSQK1G7pM0j5eQ+5HtT+WxGg2fINwboqBAKa+0QnEKGxGr8ZOVTMv0JcEcmHi4iawHbfiHZLFMKUSI9Z6Rz/+cnVzt5dOiVZxdFd3/yMaF9npmD0t5DvmxJW2YMpbbxKPZEY8zbAvK2J2TmjIAQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DS4PPFABF58482A.namprd11.prod.outlook.com (2603:10b6:f:fc02::45) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 13:44:43 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 13:44:43 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 14/19] nano: update UPSTREAM_CHECK_URI
Date: Wed, 12 Nov 2025 21:44:00 +0800
Message-Id: <20251112134405.3706508-14-yi.zhao@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 315c2cbe-655d-4a8b-7166-08de21f1a244
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8/NNGHewPesVKfMcY67vUk/r7f6gRE+wgtdSI3pkaSaRp/oCsId7LKW7Hyi0?=
 =?us-ascii?Q?gQwXeq+FHgMEkbmVNCvlK9kuVfrQOxJHTXGNvEK5+xhkLS0d7BKXk1IOAtuT?=
 =?us-ascii?Q?5HAj/dztENAaiVMi+T9ZYRXb4/dGWo8uX65GZw8pY6mwiYyzQEbdDLdvDrf3?=
 =?us-ascii?Q?ZJ9TX2zupJNzoCVu1i70aSF2cOT9sC15swWP7pDG/2jNlRQzu+u2dPlS25r+?=
 =?us-ascii?Q?LM6FabbJiZugYLiDJtfjDbYxD9wztTf39qdP9HQIaePv6w4FbWaDyI6t+PDu?=
 =?us-ascii?Q?+8h5zwoCaiWwf4ARxWNSvAgnpXdxRIfY1qZNc1oTy5LOTwTv3B59mO2qBDgM?=
 =?us-ascii?Q?y2Qsb6JXwmCRLrnYshOnzEo/NPpEEMNxlVp6gyt0wFY1SZtZrfrwzlrHOwa1?=
 =?us-ascii?Q?L4GNGzx/5eVd+0ZBWaVA/a7z0uu+nMBVydeTH2lg81aHcEhsD3yJYChDE0qQ?=
 =?us-ascii?Q?1UhFZheFHx9H1V1Q/Cw952FgMyBufwwxp0um77PeHpxD5xfKH/iGNWgvo+kS?=
 =?us-ascii?Q?ns5inCkmWpJQm4fPryDdTRPUmWBucPrHhF8j0QCHWOg/zpVjieoZLryAbD85?=
 =?us-ascii?Q?DKiBkBQGJmWI5jRfSSWj02DVAwjP4KZaOxCaL9fETMIV4YTudkmv8c29cYtt?=
 =?us-ascii?Q?CO6BEGQMSrqtKitbHFzrLxQ2J6muNttTNExO4R+cosrjjfs7CK4nCRGdrOaL?=
 =?us-ascii?Q?0Ff7BeS/4o4UdTFkh0RH6FxMwq7/ny04BrBcbVVdFZC804N+CAyi0F9NPkMU?=
 =?us-ascii?Q?JAQTcjpDJ2zmnUEfs4f+ijP1vd/fyi6jL21xPbZcEVYvjq645rlxe7jKwAXP?=
 =?us-ascii?Q?hyqFU9c2S2I1ysolfe7G/2FBk+3prHO0YVnNh+1XZ3ImnLojZ1JW3YhFBDMO?=
 =?us-ascii?Q?p/F+HCzIAACJiZie8rv8mFygcz9LglL3ihw28py5IO+Qdx0oLaT8Z6ZL8n7q?=
 =?us-ascii?Q?7IAdV/k+WUEDCkkJE0GXvu+XGnRetYmgTT6GyyVB6H6n7YgerKpPchh4h3kh?=
 =?us-ascii?Q?uKocKDPcdJaSHSdSjIIprVMITEtgFoU1mQWKDKv4+Nsf87IMVQ2f726kT03T?=
 =?us-ascii?Q?7ToiYSJHFJNbnPqCiZJ57WcDWkLtODFlBRUHs4acA9PwuNKhuzaK+TosovCH?=
 =?us-ascii?Q?ZULdpsTW/GTrR0Z9RO4rgIbfKQPSaMlYoEPBbejBWMLZQ7ZKHU+0M0McMtgY?=
 =?us-ascii?Q?c/ankTG6eCpTFa8ShbvsESeKUbrCdPQ1DMAEL4Jk6a0QAYbJOM5y+NEh4gUA?=
 =?us-ascii?Q?OibgHJjVJxxgsRh0vQEmuzTQ26iJX9sRRV03GsfCepSXsTYEWSitWAFnmDtI?=
 =?us-ascii?Q?MyE9ebjQrhan5p9IIycOF8Mw1IeFRWPLjhv185PC23Kx0eMhxtRFIhE13XUm?=
 =?us-ascii?Q?B13i/kEufyHLHF3Czw1kJV//PEDN7UDsDCgtUZ0mtJg6I28Lho3uIud3f34w?=
 =?us-ascii?Q?2lbPPKtYDKTIxmST8t37TqFkjZ4TZ86b+EeRTObO17r93nqnuyfpLw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EXvEJ6BEufS5sbQvOFXNMGKBBD8R8Av/pmkTZWGsztr/Ev6E7jKHNJqVGtcV?=
 =?us-ascii?Q?6Ple6hl7SQnU2JNcO/veoO5qJK3xPdOXrS11FScq1HVHZxcJKV93y/5zzEuw?=
 =?us-ascii?Q?9DQjAMYtdSZS3hCIwlj08UXU+3OpEoeTLDSF5IjnesQai2NQILANDwlPWxwP?=
 =?us-ascii?Q?k/AMbMu/dF2cwLL4eeIZpUakAWlIzSl4epWTJhm/fdEAK6AP7eCWf/1QIpPp?=
 =?us-ascii?Q?tEX5lKuErXkE9ojYhJCLTTepAyxcnSd7c0TvxLomCaL9Y6+0jAmg1XKHhbHj?=
 =?us-ascii?Q?Gm11GnzdokTK2khcEbMTNSSs+WCKNyjZDuHMJlO+ySaWkPelAUoDbuBYd3gU?=
 =?us-ascii?Q?xNLJfhCXz+iPT5SjNGzknY42529ZjceJrvvL3IbrVX4Gwaaql193g/YADy4O?=
 =?us-ascii?Q?AnRc40Vb3t/UkRI9VQ1QQPHICZa/JxdUxspUWlo8rP3Zl2079I8ZkTkJ00R7?=
 =?us-ascii?Q?YyoeOXrgAPg264bXT5MwMCRSqUShU3fPy6dusK/oGSCvtFT8k+Ny7UXGz8G0?=
 =?us-ascii?Q?dc7R3DqjzNfX+b//L1pOiM+INcbj0hZbQFseN8FmeXtJiK9umEM/HLHGk9BS?=
 =?us-ascii?Q?eTzh3+bpimUYLoPRnJMpcZ/ub5wKl1rMy+tgrpHrW7cuBwSRNjqO0BAc1mrz?=
 =?us-ascii?Q?ZMDt2AX498+/DjDl/I7UB5+qYEq033bpV+fYtNeF6rLXfih0lNwTjyPMm8oR?=
 =?us-ascii?Q?ypbmzdJSZJscWBUvKEagMcHXzXTjOJqUFBGoiiMXa/rcgzGIUu4y4OHBo/ue?=
 =?us-ascii?Q?YJ6VV6QjhPseowRF/3ytAJaQYlGIkd8mXG/jYY/vJTpWNIORlSeJDHjn9OpA?=
 =?us-ascii?Q?ybOiiuGOKtwEjC8RDCrSp723yC/w7Q/3sinxspxZaXkG8tGxxBvA/qgPndkO?=
 =?us-ascii?Q?7oKJXlXt/BOc/3im0cfJpNK5TwkiDRd7DulrfJc8/Cpifo91KWDurdYe0CV7?=
 =?us-ascii?Q?ZtKAJxjkU/WUXX0UsMyPprf0o/K1iryvQhFSg4vl3Pr6WRYYfbidqOwBggQl?=
 =?us-ascii?Q?2x9iMvS6/sfqQ8bzonvLbi8zByXCUK+espRgIZ+n3jWwWJa3clZCm3TRjhCG?=
 =?us-ascii?Q?OaUyFQx6/OgEAMyTxFDCGbK1J5O52i5hhUxnpW66vIlbnDespvqz7pCV/Gew?=
 =?us-ascii?Q?mCN8JkR/DNo50zz+BS3KkvhpBIG4p6zai32weBr9SOUM8mfnFY4WP1YpMFSu?=
 =?us-ascii?Q?NrNU6J9zsXtX9iZ547ybLQiDb4EgqaY72hi5VXA27zqnkGmGO5lLGSoaNfCK?=
 =?us-ascii?Q?jkzZ+BPUMZIn94iKddEx/YnpRbpO1uG1zjumwk+2s+L4HkHCwU8GomyWUVHh?=
 =?us-ascii?Q?ugcZOGQp8pFFjFa8KC1hLc5lcVOjwpv0r82BwDOCod2powK5ETqDwOZi1Mfi?=
 =?us-ascii?Q?diUz0EILs4zorFVW3Kw8Upb7SbSzaYnrAw3e2nyPVVIUyHOsHiatrD3z6uUa?=
 =?us-ascii?Q?LxyNYDA2XrNSi5N7TIs6vgCNPWJJm03AsZ9vvJAWVovKhGaX/3yxmTPjUQ7L?=
 =?us-ascii?Q?hzLiAIzbMV34OQwfpILxwEIswTbr9v2zSZDE27AkpTp/Bh7L4in9HgJCxCb+?=
 =?us-ascii?Q?7gMSfrxEv6LGJWRgrU2kkUhgTywPQZhPau3l8PO6?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 315c2cbe-655d-4a8b-7166-08de21f1a244
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 13:44:42.9611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gj8z1UP8F+aLnT36GuHraPLcNZ/t5kA70Tg3TfZHN+M5iUQCtnsCpAAz0Yx5iMgjWRubN+eFWeU+aZ+fiHqN0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFABF58482A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDExMSBTYWx0ZWRfX5ahWMJ6DtDm9
 +N2qG1hPa3ZNPD6mV6w4gSf/A/14/+wnbvHTeJ4hXZfvqnrnaN0F7ughmnSJrjdv3Eufz9pEMxn
 O4N2if1kxIfrEbATZEPrlEx7ef+uNDnT3rSXB8t9tb9aoX9nG4lXOLZVazw0lFyU6/modjuhPtp
 KZCeE67ZWpkvSx3ydKITDTo9n4fUay+PNu+2KG+rCgN8F+1V2jJCeRBcZv3aJp9NROj34s1n7ZV
 trOdTbt3/swCPkN+QklWXqLTlQXTwws1lpXRROKUnUZH8RUYwFXOOkECxnVGm6QZ2tyaTZ5gatr
 ZQHDyW4LVHEecfW1DiDLXcrYg0iUlOQmgjr2Q/sLy4sez0QhiXyv04BsrRcD5yNs7MOMaPYOPRy
 JRsXE79IQcfbe8s4ev0/tlXyESSEug==
X-Proofpoint-GUID: idLzGZhvivBqBf7MeJlZrq0g6OEt9cLq
X-Authority-Analysis: v=2.4 cv=Uvpu9uwB c=1 sm=1 tr=0 ts=69148f4c cx=c_pps
 a=XnoXs6g8SJkBXVwgXvPJGw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=BjMif5yZAAAA:8 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=meVGifdiRfK-yEOmZ9QA:9
 a=ftVT4cx30j6SLCxtN1ED:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: idLzGZhvivBqBf7MeJlZrq0g6OEt9cLq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120111
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 13:44:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121543

Update UPSTREAM_CHECK_URI to check the correct latest stable verison.

Before the patch:
$ devtool latest-version nano
INFO: Current version: 8.6
INFO: Latest version:

After the patch:
$ devtool latest-version nano
INFO: Current version: 8.6
INFO: Latest version: 8.6

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-support/nano/nano_8.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/nano/nano_8.6.bb b/meta-oe/recipes-support/nano/nano_8.6.bb
index 8056456a0f..e45c6df757 100644
--- a/meta-oe/recipes-support/nano/nano_8.6.bb
+++ b/meta-oe/recipes-support/nano/nano_8.6.bb
@@ -15,7 +15,7 @@ PV_MAJOR = "${@d.getVar('PV').split('.')[0]}"
 SRC_URI = "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz"
 SRC_URI[sha256sum] = "f7abfbf0eed5f573ab51bd77a458f32d82f9859c55e9689f819d96fe1437a619"
 
-UPSTREAM_CHECK_URI = "https://ftp.gnu.org/gnu/nano"
+UPSTREAM_CHECK_URI = "${GNU_MIRROR}/nano"
 
 inherit autotools gettext pkgconfig
 
-- 
2.34.1


