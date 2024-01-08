Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D299BC47073
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 01:58:55 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.30518.1704679131188921634
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jan 2024 17:58:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=KjVUQ9Kp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=17373a0b19=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4081f88G005532
	for <openembedded-devel@lists.openembedded.org>; Sun, 7 Jan 2024 17:58:50 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=WSEUqe2Y86YAJE1YYd+MFVTfkCDEj5fD0dnuoHuCFJA=; b=
	KjVUQ9Kp8Nec5n472OEpuSGxs0zOYKPoDHQkeCl/7+QjsNFRaMw8DeVCJejBoZE5
	cWvry7LjXsDNNqA2veTaau3izSdL7hwRB101iErFTOds0t5G7doAd7Mj11s2V16A
	lJ4Mlj3Q+JHQ1oTs6nG8B8LhDWpMgRv1g5SDNfP7VGZgkb9iaFITExq01yZSP5Jr
	rcWXMNy6zHb+lhAg3GQHXvg0EQTqIDJVNW9ZTTEz87SOjjAol4IiO8B7/rR8093X
	g7rS99aU0C1N9nJ/b7moGfvHSGvwu5RRhukoKAg9gHZAHAVulZiKvtD/y3vDF6i/
	FxrSXVLPU9bJEAdeJvtlRg==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vf78m9568-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 07 Jan 2024 17:58:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H5uzvk8KrM/zLpntiXOAz+EHCyUjV6BK0MlnNQqk8h+twK2/EwBXOUUzQz9GFFgO+EHWAq9niob8cUazVnzYsQkFAyWyilnxQkaDKZqr9DGk03wc7PFZ0PrGKRBpf3KYR9xq/MHoXMGGDcIzJ67F316I3+4lh7tb0SsBIy1alVVWJ1wKA2f86OQG4tAwajS6dq0UOUTdywwZUMSIJj22U1cAQB3e8pOwTv28KIMihw3R9sjihjQOfuZ3cHQN75C9cgpn8EGWCijvh8L2AXJF9CN9imOiX1tcIwcOPAEIT21l+/CMphj4Al1o7CP/FmMO36gieHL61Wi/IB54BIBIWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WSEUqe2Y86YAJE1YYd+MFVTfkCDEj5fD0dnuoHuCFJA=;
 b=fdhssKo4tCIbb1W/d6lDz44iggRoCvJitqgB0DgYSzN7ooOvkrUQZYrm7RdNA9gRT6LI8GKgKvWnu/Fn4BpsNIdUpi+xIQWAkHQyW+/3QIJnNx2xQHf2pvl2O3Eu9wVjx4sIVkVmg1DdXvf9pPDqT7S13RkpSVFWrayOaEJcU9z6XnrZRUuC8aRx+VirkoEGKQ/9wb6KZSko3SqO5YZZgP3d+JonQXZ/dV94a/G4E8AIJ5xrsVLDNLmU8ns6bo+PRD7L0US9FdEfQ45ev4RkDlO1w1oT9PmgMuBYMxn3hgFDp4YR6ZY2aXrenFMOWoPTYrvaBcT6yKtV1JOgDX365Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
 by LV8PR11MB8699.namprd11.prod.outlook.com (2603:10b6:408:1ff::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Mon, 8 Jan
 2024 01:58:45 +0000
Received: from DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::c56:aece:e7ef:6cb3]) by DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::c56:aece:e7ef:6cb3%3]) with mapi id 15.20.7159.020; Mon, 8 Jan 2024
 01:58:45 +0000
Message-ID: <e7f974cc-a9c0-4790-b73d-245a840803f9@windriver.com>
Date: Mon, 8 Jan 2024 09:58:39 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking][PATCH 5/5] samba: upgrade 4.18.9 -> 4.19.3
To: openembedded-devel@lists.openembedded.org
References: <20240101074958.2782143-1-yi.zhao@windriver.com>
 <17A629C0E2065CDA.19587@lists.openembedded.org>
Content-Language: en-US
From: Yi Zhao <yi.zhao@windriver.com>
In-Reply-To: <17A629C0E2065CDA.19587@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYAPR01CA0084.jpnprd01.prod.outlook.com
 (2603:1096:404:2c::24) To DS0PR11MB7484.namprd11.prod.outlook.com
 (2603:10b6:8:14c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7484:EE_|LV8PR11MB8699:EE_
X-MS-Office365-Filtering-Correlation-Id: b50b3532-7ce9-4a9a-423b-08dc0fed5850
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	deYJMr1YlloT2IU1STidM5e1V5A7LKdX6aQD8UTgyl+P01RRtxLGuPZmkykvKSQjFRjkKahlXewsVBgbTd0FblJ4ZDnn/5x46NUZijyXiwk9WUrbYI0Cu8KkteDF6FKO/DL1iVJ+eLq1sX7ENL48Ql5wHZUyBPJ0AhZWT5YjSo4Aeg/LJPS6xh4RYa7Fr34QuvdcA+mTZ6bBJKwlO8lkZCpm+Hw6yvNkMTsO8RXcZ3ueWf8rmZ9fYSeTCfKG7R3eP3voH9fKBB88hY61kk9Iao9bebFe1XRoXUF+CMAQX57H1nnAZMB1+H/flQLWlkt2BDTMmAMW+KWDZouJ73icvyKQbccKMieLUrMIO+jMLesz9A45AxLdxkqtc28u+Q4WhJWiHu0R4mBeTLlU0Qb1+px1X8rciiKjjF8BVOrJOiGzzckHytguA755j1OYRyY+AEk52pOR2/QPCYJSaDCfF6rVWtyDHdKJp9g1dusquxOzjIYSzcTfPVmEddikUkWhRDiCmm+TFJN1h8Yyuzk1DWpcNKS/kOWJaVIXpN4FCfye9YcIa0Wvs+3SDu8gHZiyZLyLx4dowC/RbmRdWR6NBm8MVJ/dJ7AKPhobhuL3sD72C8tKdSXsoE/dc2SASu21
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7484.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(346002)(136003)(39840400004)(376002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(31686004)(66899024)(26005)(53546011)(2616005)(6666004)(6512007)(6506007)(478600001)(6486002)(966005)(38100700002)(86362001)(31696002)(16799955002)(36756003)(2906002)(5660300002)(30864003)(41300700001)(83380400001)(6916009)(66556008)(66476007)(66946007)(316002)(8676002)(8936002)(44832011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WHN6V1AvWXYzaVlmK21xSHl1T1pqcWduZmdxOU5XUmtPNGJqSzc5N0o0YllV?=
 =?utf-8?B?VUE4UVFkUTlTSTY4TGpPYk1wRW1tSlVVNWdZK2tET0dnMGlmVWpjREJqcEFt?=
 =?utf-8?B?VFVaS1M1QjFLTW5Sam9LLytHbFk4QlRwdGZwTUJSclh3bFdOSTAxeDlrSmxx?=
 =?utf-8?B?UzFGUmI3SVdQcCtjRXZjUmFrZHN5d2V6UVM4T2toQjRPV3ZzQjZaZkh2SHB2?=
 =?utf-8?B?WVYrRU1iR24xTUJTbk9zQjJrbitjZ29YZ0NnS0podWhicHZ1M0ZjSEVTYVox?=
 =?utf-8?B?QzBtdVlBWUx0VklFWmlyRGJPa2packtHY2kvL25wT3BOa3RPZ3VoV3FkaENH?=
 =?utf-8?B?Y1hPdkszb0owWk9naVBmeFc2d2xaMkNiVHBsNENFdDd4ZW5OcUlZZFNRZUNX?=
 =?utf-8?B?SVlXb3FSa1dlQmdaVUVINzAzMmxXaDNSM0tXV2ErcHNSd3ROL0ZZMFBrdFh3?=
 =?utf-8?B?UU9rOVBKVFpFSWtpM1hQcXNtYkFXaml0dEZTcTltMkEzbHdXSjZpQTlhaVVR?=
 =?utf-8?B?VWFiYTJYbDVabUlPZHVnT3JPRkl1a0VvdHdydTlnSHF0VXBlbFR6MXNIVmdZ?=
 =?utf-8?B?cE42ZU12WkExam9EOWpCSS93eDU2K04vSGJ0TkJ3UFl3b1QrWlRkem40cWdU?=
 =?utf-8?B?aVBDUHNhZWs5MnhleHB6RlFzTVpsOXdvQVBKcmg4c2cvR24zS2FnMmVobE5G?=
 =?utf-8?B?SVQwTFRGMEtGY1pzc0M2bFpYU1pBODRHYm1YOE9ZL24reXF1VEl5OEpLakFB?=
 =?utf-8?B?YlltN0R2YWh3N05sN3hja0F2dGxvek1tRkR3bFY1VWdZWS9UN3JzcDdlaXgr?=
 =?utf-8?B?OWMycnlyZ0hGelMxUVNWWW53T25iTGlNTnl3dG41UmtSeE1jU0tyblJKODZI?=
 =?utf-8?B?L2pLNnRDLzAvRzFCNk52VW9wWkdpWWhUWDFTZ3IyVk1iQXlZTndJTVQzS2xm?=
 =?utf-8?B?Y213SHEzS2FkL2lFS1dwSnRlMEEvQ1RZUklRRW5HNU9EclNIK2ZqWElGN0lI?=
 =?utf-8?B?Q2cydk9sYzVjMmlGejBSKzM4Y0Q5dFVCTVZNbmE3dWZUd1l2WEkzSEhPSWJF?=
 =?utf-8?B?VzNJZlRkR21ZT1Qyek9qTk1zaU9waUdRMkhJZXJvc21nTElTS3JlVG5VVytp?=
 =?utf-8?B?NTdsQVhHRXM5Y0xFOUpldUtrYnlxbnNXaDhwcm5aQkpIQnpHZ0pDL3FQd29B?=
 =?utf-8?B?RUUrcEhId0lhY2ZBZkh6dlVnTExGVVpMMUFKQTBNMFhsVDMrOW9DQW10WHF2?=
 =?utf-8?B?Y1JnOERvVHh2YlZHVmJRb2ZwTWxxVFppTU0vRE9HSllEa3N1QlF5Wi9NYWpa?=
 =?utf-8?B?NTV1eWR4b0lSNWRORVMxcWhnUFIzQWZrelI5MlU4M2MwSjRwcVU3OTB1a0JN?=
 =?utf-8?B?eDR4UkltRjYxWldmY0ZBWFdjSVNUK3BsaHdYOVdtWjhSTzFJV2pFUUNCY2Nj?=
 =?utf-8?B?S1B6SWw0YWVjQW9wd3NQMHNaQk1ac2dPbVFWekI4bzVYVlRLZU5RcHZsUjA2?=
 =?utf-8?B?VDJVL2Fmd3BYOE5nT0YvTlF1UStGM2Yzemt5YWVZZERmbzVpRThablpUTzgr?=
 =?utf-8?B?bXhxZU1yQW9vRnBxMzA0VlNpV1BRWUZ6cDNnTmRHaVhWbnB2K1kvdm5CYldz?=
 =?utf-8?B?STlZZ0FaNDdoT3hNVFgvYXYyay9pc1k3dzNHWS9NTCs4RUFPaXB0N25sb1d2?=
 =?utf-8?B?cXpXN1ZNcUdmUDZubjlDVWtuWDRjeVNkYVFzUlRjNCtyZjhJazZOYTJLbFRL?=
 =?utf-8?B?YjBwclRxSmd2MTBCTU5UdUhjc3UrcTFkS0trTmVYV0dPMVdoSGtnWWJyTmhv?=
 =?utf-8?B?OTJxN1JTOWU5K2pqTnB4cUk5d0tkaUhXOTlSZTQ3STBFMlhXK3cyTlpKb0dI?=
 =?utf-8?B?MHV2YXNGekxnckE0ZVlIRjFhSlRybVArQ2pEU05wS3pjb2lMVi96dlpQNlZV?=
 =?utf-8?B?UlFvV2x3VVAvbC96c0FraC9qY0k2ZHQ4UXRwYlEyZGJ6YVMrY1l2NjI5MzNE?=
 =?utf-8?B?ZXdVcDFIQ3JJd2hIaEtFd3phaWswV3VZRDQ3N080c0ZZRGpOMGFQNEhXR1l4?=
 =?utf-8?B?NEpIL24zcGtGRFpiZWh0RzdvbFlFRVBjbXpyZTIvQjVnZ3d1a1JHSVhXRU9O?=
 =?utf-8?Q?07rvsGlCaWGyttBH1/w0AEqI+?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b50b3532-7ce9-4a9a-423b-08dc0fed5850
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7484.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2024 01:58:45.2359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wDSFNhkrpP1yaDtnbCWLEi/K/zKlVXPDFgl6BlT4zqMxg7Mfyb+iNo6SVxvnl57NO4d0HdK9TIC9lTnE92Je2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8699
X-Proofpoint-GUID: boLp93zvxLqpbRWE_bItLicWcAorfgXY
X-Proofpoint-ORIG-GUID: boLp93zvxLqpbRWE_bItLicWcAorfgXY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0
 mlxlogscore=999 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401080012
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 01:58:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108080

Ping...


On 1/1/24 15:49, Yi Zhao wrote:
> According to samba release planning[1], 4.18 is already in maintenance
> mode and will be EOL in Sep 2024. Upgrade to current stable release
> 4.19.
>
> Release Notes
> https://www.samba.org/samba/history/samba-4.19.0.html
> https://www.samba.org/samba/history/samba-4.19.3.html
>
> [1] https://wiki.samba.org/index.php/Samba_Release_Planning
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>   .../cross-answers-aarch64.txt                 |  2 +-
>   .../cross-answers-aarch64_be.txt              |  2 +-
>   .../waf-cross-answers/cross-answers-arm.txt   |  2 +-
>   .../waf-cross-answers/cross-answers-armeb.txt |  2 +-
>   .../waf-cross-answers/cross-answers-i586.txt  |  2 +-
>   .../waf-cross-answers/cross-answers-i686.txt  |  2 +-
>   .../waf-cross-answers/cross-answers-mips.txt  |  2 +-
>   .../cross-answers-mips64.txt                  |  2 +-
>   .../cross-answers-mips64el.txt                |  2 +-
>   .../cross-answers-mipsel.txt                  |  2 +-
>   .../cross-answers-powerpc.txt                 |  2 +-
>   .../cross-answers-powerpc64.txt               |  2 +-
>   .../cross-answers-powerpc64le.txt             |  2 +-
>   .../cross-answers-riscv32.txt                 |  2 +-
>   .../cross-answers-riscv64.txt                 |  2 +-
>   .../cross-answers-x86_64.txt                  |  2 +-
>   .../0001-Don-t-check-xsltproc-manpages.patch  |  8 ++---
>   ...rt-target-module-while-cross-compile.patch | 10 +++---
>   ...3-Add-config-option-without-valgrind.patch | 34 +++++++++++--------
>   ...tions-to-configure-the-use-of-libbsd.patch |  9 ++---
>   ...-pyext_PATTERN-for-cross-compilation.patch |  6 ++--
>   ...orture-skip-test-case-tfork_cmd_send.patch |  2 +-
>   ...-of-python-to-fix-the-install-confli.patch | 11 +++---
>   .../samba/samba-4.3.9-remove-getpwent_r.patch |  8 ++---
>   .../samba/samba/samba-pam.patch               | 12 +++----
>   .../{samba_4.18.9.bb => samba_4.19.3.bb}      |  6 ++--
>   26 files changed, 73 insertions(+), 65 deletions(-)
>   rename meta-networking/recipes-connectivity/samba/{samba_4.18.9.bb => samba_4.19.3.bb} (98%)
>
> diff --git a/meta-networking/files/waf-cross-answers/cross-answers-aarch64.txt b/meta-networking/files/waf-cross-answers/cross-answers-aarch64.txt
> index fa960ea2b..ea561073e 100644
> --- a/meta-networking/files/waf-cross-answers/cross-answers-aarch64.txt
> +++ b/meta-networking/files/waf-cross-answers/cross-answers-aarch64.txt
> @@ -42,6 +42,6 @@ Checking errno of iconv for illegal multibyte sequence: NO
>   Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
>   Checking value of GNUTLS_MAC_AES_CMAC_128: OK
>   Checking whether fcntl supports flags to send direct I/O availability signals: NO
> -Checking whether fcntl supports setting/geting hints: NO
> +Checking whether fcntl supports setting/getting hints: NO
>   Checking for readlink breakage: NO
>   Checking for gnutls fips mode support: NO
> diff --git a/meta-networking/files/waf-cross-answers/cross-answers-aarch64_be.txt b/meta-networking/files/waf-cross-answers/cross-answers-aarch64_be.txt
> index fa960ea2b..ea561073e 100644
> --- a/meta-networking/files/waf-cross-answers/cross-answers-aarch64_be.txt
> +++ b/meta-networking/files/waf-cross-answers/cross-answers-aarch64_be.txt
> @@ -42,6 +42,6 @@ Checking errno of iconv for illegal multibyte sequence: NO
>   Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
>   Checking value of GNUTLS_MAC_AES_CMAC_128: OK
>   Checking whether fcntl supports flags to send direct I/O availability signals: NO
> -Checking whether fcntl supports setting/geting hints: NO
> +Checking whether fcntl supports setting/getting hints: NO
>   Checking for readlink breakage: NO
>   Checking for gnutls fips mode support: NO
> diff --git a/meta-networking/files/waf-cross-answers/cross-answers-arm.txt b/meta-networking/files/waf-cross-answers/cross-answers-arm.txt
> index 19d0b6f76..5655a6585 100644
> --- a/meta-networking/files/waf-cross-answers/cross-answers-arm.txt
> +++ b/meta-networking/files/waf-cross-answers/cross-answers-arm.txt
> @@ -43,6 +43,6 @@ Checking errno of iconv for illegal multibyte sequence: NO
>   Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
>   Checking value of GNUTLS_MAC_AES_CMAC_128: OK
>   Checking whether fcntl supports flags to send direct I/O availability signals: NO
> -Checking whether fcntl supports setting/geting hints: NO
> +Checking whether fcntl supports setting/getting hints: NO
>   Checking for readlink breakage: NO
>   Checking for gnutls fips mode support: NO
> diff --git a/meta-networking/files/waf-cross-answers/cross-answers-armeb.txt b/meta-networking/files/waf-cross-answers/cross-answers-armeb.txt
> index 19d0b6f76..5655a6585 100644
> --- a/meta-networking/files/waf-cross-answers/cross-answers-armeb.txt
> +++ b/meta-networking/files/waf-cross-answers/cross-answers-armeb.txt
> @@ -43,6 +43,6 @@ Checking errno of iconv for illegal multibyte sequence: NO
>   Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
>   Checking value of GNUTLS_MAC_AES_CMAC_128: OK
>   Checking whether fcntl supports flags to send direct I/O availability signals: NO
> -Checking whether fcntl supports setting/geting hints: NO
> +Checking whether fcntl supports setting/getting hints: NO
>   Checking for readlink breakage: NO
>   Checking for gnutls fips mode support: NO
> diff --git a/meta-networking/files/waf-cross-answers/cross-answers-i586.txt b/meta-networking/files/waf-cross-answers/cross-answers-i586.txt
> index 19d0b6f76..5655a6585 100644
> --- a/meta-networking/files/waf-cross-answers/cross-answers-i586.txt
> +++ b/meta-networking/files/waf-cross-answers/cross-answers-i586.txt
> @@ -43,6 +43,6 @@ Checking errno of iconv for illegal multibyte sequence: NO
>   Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
>   Checking value of GNUTLS_MAC_AES_CMAC_128: OK
>   Checking whether fcntl supports flags to send direct I/O availability signals: NO
> -Checking whether fcntl supports setting/geting hints: NO
> +Checking whether fcntl supports setting/getting hints: NO
>   Checking for readlink breakage: NO
>   Checking for gnutls fips mode support: NO
> diff --git a/meta-networking/files/waf-cross-answers/cross-answers-i686.txt b/meta-networking/files/waf-cross-answers/cross-answers-i686.txt
> index 19d0b6f76..5655a6585 100644
> --- a/meta-networking/files/waf-cross-answers/cross-answers-i686.txt
> +++ b/meta-networking/files/waf-cross-answers/cross-answers-i686.txt
> @@ -43,6 +43,6 @@ Checking errno of iconv for illegal multibyte sequence: NO
>   Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
>   Checking value of GNUTLS_MAC_AES_CMAC_128: OK
>   Checking whether fcntl supports flags to send direct I/O availability signals: NO
> -Checking whether fcntl supports setting/geting hints: NO
> +Checking whether fcntl supports setting/getting hints: NO
>   Checking for readlink breakage: NO
>   Checking for gnutls fips mode support: NO
> diff --git a/meta-networking/files/waf-cross-answers/cross-answers-mips.txt b/meta-networking/files/waf-cross-answers/cross-answers-mips.txt
> index aa8736880..84816e06f 100644
> --- a/meta-networking/files/waf-cross-answers/cross-answers-mips.txt
> +++ b/meta-networking/files/waf-cross-answers/cross-answers-mips.txt
> @@ -43,6 +43,6 @@ Checking errno of iconv for illegal multibyte sequence: NO
>   Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
>   Checking value of GNUTLS_MAC_AES_CMAC_128: OK
>   Checking whether fcntl supports flags to send direct I/O availability signals: NO
> -Checking whether fcntl supports setting/geting hints: NO
> +Checking whether fcntl supports setting/getting hints: NO
>   Checking for readlink breakage: NO
>   Checking for gnutls fips mode support: NO
> diff --git a/meta-networking/files/waf-cross-answers/cross-answers-mips64.txt b/meta-networking/files/waf-cross-answers/cross-answers-mips64.txt
> index 407e4154c..cdf7169cb 100644
> --- a/meta-networking/files/waf-cross-answers/cross-answers-mips64.txt
> +++ b/meta-networking/files/waf-cross-answers/cross-answers-mips64.txt
> @@ -42,6 +42,6 @@ Checking errno of iconv for illegal multibyte sequence: NO
>   Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
>   Checking value of GNUTLS_MAC_AES_CMAC_128: OK
>   Checking whether fcntl supports flags to send direct I/O availability signals: NO
> -Checking whether fcntl supports setting/geting hints: NO
> +Checking whether fcntl supports setting/getting hints: NO
>   Checking for readlink breakage: NO
>   Checking for gnutls fips mode support: NO
> diff --git a/meta-networking/files/waf-cross-answers/cross-answers-mips64el.txt b/meta-networking/files/waf-cross-answers/cross-answers-mips64el.txt
> index 407e4154c..cdf7169cb 100644
> --- a/meta-networking/files/waf-cross-answers/cross-answers-mips64el.txt
> +++ b/meta-networking/files/waf-cross-answers/cross-answers-mips64el.txt
> @@ -42,6 +42,6 @@ Checking errno of iconv for illegal multibyte sequence: NO
>   Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
>   Checking value of GNUTLS_MAC_AES_CMAC_128: OK
>   Checking whether fcntl supports flags to send direct I/O availability signals: NO
> -Checking whether fcntl supports setting/geting hints: NO
> +Checking whether fcntl supports setting/getting hints: NO
>   Checking for readlink breakage: NO
>   Checking for gnutls fips mode support: NO
> diff --git a/meta-networking/files/waf-cross-answers/cross-answers-mipsel.txt b/meta-networking/files/waf-cross-answers/cross-answers-mipsel.txt
> index aa8736880..84816e06f 100644
> --- a/meta-networking/files/waf-cross-answers/cross-answers-mipsel.txt
> +++ b/meta-networking/files/waf-cross-answers/cross-answers-mipsel.txt
> @@ -43,6 +43,6 @@ Checking errno of iconv for illegal multibyte sequence: NO
>   Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
>   Checking value of GNUTLS_MAC_AES_CMAC_128: OK
>   Checking whether fcntl supports flags to send direct I/O availability signals: NO
> -Checking whether fcntl supports setting/geting hints: NO
> +Checking whether fcntl supports setting/getting hints: NO
>   Checking for readlink breakage: NO
>   Checking for gnutls fips mode support: NO
> diff --git a/meta-networking/files/waf-cross-answers/cross-answers-powerpc.txt b/meta-networking/files/waf-cross-answers/cross-answers-powerpc.txt
> index e94a5a473..c563a2796 100644
> --- a/meta-networking/files/waf-cross-answers/cross-answers-powerpc.txt
> +++ b/meta-networking/files/waf-cross-answers/cross-answers-powerpc.txt
> @@ -43,6 +43,6 @@ Checking errno of iconv for illegal multibyte sequence: NO
>   Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
>   Checking value of GNUTLS_MAC_AES_CMAC_128: OK
>   Checking whether fcntl supports flags to send direct I/O availability signals: NO
> -Checking whether fcntl supports setting/geting hints: NO
> +Checking whether fcntl supports setting/getting hints: NO
>   Checking for readlink breakage: NO
>   Checking for gnutls fips mode support: NO
> diff --git a/meta-networking/files/waf-cross-answers/cross-answers-powerpc64.txt b/meta-networking/files/waf-cross-answers/cross-answers-powerpc64.txt
> index a5c0d0d61..31a27e246 100644
> --- a/meta-networking/files/waf-cross-answers/cross-answers-powerpc64.txt
> +++ b/meta-networking/files/waf-cross-answers/cross-answers-powerpc64.txt
> @@ -43,6 +43,6 @@ Checking errno of iconv for illegal multibyte sequence: NO
>   Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
>   Checking value of GNUTLS_MAC_AES_CMAC_128: OK
>   Checking whether fcntl supports flags to send direct I/O availability signals: NO
> -Checking whether fcntl supports setting/geting hints: NO
> +Checking whether fcntl supports setting/getting hints: NO
>   Checking for readlink breakage: NO
>   Checking for gnutls fips mode support: NO
> diff --git a/meta-networking/files/waf-cross-answers/cross-answers-powerpc64le.txt b/meta-networking/files/waf-cross-answers/cross-answers-powerpc64le.txt
> index a5c0d0d61..31a27e246 100644
> --- a/meta-networking/files/waf-cross-answers/cross-answers-powerpc64le.txt
> +++ b/meta-networking/files/waf-cross-answers/cross-answers-powerpc64le.txt
> @@ -43,6 +43,6 @@ Checking errno of iconv for illegal multibyte sequence: NO
>   Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
>   Checking value of GNUTLS_MAC_AES_CMAC_128: OK
>   Checking whether fcntl supports flags to send direct I/O availability signals: NO
> -Checking whether fcntl supports setting/geting hints: NO
> +Checking whether fcntl supports setting/getting hints: NO
>   Checking for readlink breakage: NO
>   Checking for gnutls fips mode support: NO
> diff --git a/meta-networking/files/waf-cross-answers/cross-answers-riscv32.txt b/meta-networking/files/waf-cross-answers/cross-answers-riscv32.txt
> index 19d0b6f76..5655a6585 100644
> --- a/meta-networking/files/waf-cross-answers/cross-answers-riscv32.txt
> +++ b/meta-networking/files/waf-cross-answers/cross-answers-riscv32.txt
> @@ -43,6 +43,6 @@ Checking errno of iconv for illegal multibyte sequence: NO
>   Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
>   Checking value of GNUTLS_MAC_AES_CMAC_128: OK
>   Checking whether fcntl supports flags to send direct I/O availability signals: NO
> -Checking whether fcntl supports setting/geting hints: NO
> +Checking whether fcntl supports setting/getting hints: NO
>   Checking for readlink breakage: NO
>   Checking for gnutls fips mode support: NO
> diff --git a/meta-networking/files/waf-cross-answers/cross-answers-riscv64.txt b/meta-networking/files/waf-cross-answers/cross-answers-riscv64.txt
> index fa960ea2b..ea561073e 100644
> --- a/meta-networking/files/waf-cross-answers/cross-answers-riscv64.txt
> +++ b/meta-networking/files/waf-cross-answers/cross-answers-riscv64.txt
> @@ -42,6 +42,6 @@ Checking errno of iconv for illegal multibyte sequence: NO
>   Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
>   Checking value of GNUTLS_MAC_AES_CMAC_128: OK
>   Checking whether fcntl supports flags to send direct I/O availability signals: NO
> -Checking whether fcntl supports setting/geting hints: NO
> +Checking whether fcntl supports setting/getting hints: NO
>   Checking for readlink breakage: NO
>   Checking for gnutls fips mode support: NO
> diff --git a/meta-networking/files/waf-cross-answers/cross-answers-x86_64.txt b/meta-networking/files/waf-cross-answers/cross-answers-x86_64.txt
> index fa960ea2b..ea561073e 100644
> --- a/meta-networking/files/waf-cross-answers/cross-answers-x86_64.txt
> +++ b/meta-networking/files/waf-cross-answers/cross-answers-x86_64.txt
> @@ -42,6 +42,6 @@ Checking errno of iconv for illegal multibyte sequence: NO
>   Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
>   Checking value of GNUTLS_MAC_AES_CMAC_128: OK
>   Checking whether fcntl supports flags to send direct I/O availability signals: NO
> -Checking whether fcntl supports setting/geting hints: NO
> +Checking whether fcntl supports setting/getting hints: NO
>   Checking for readlink breakage: NO
>   Checking for gnutls fips mode support: NO
> diff --git a/meta-networking/recipes-connectivity/samba/samba/0001-Don-t-check-xsltproc-manpages.patch b/meta-networking/recipes-connectivity/samba/samba/0001-Don-t-check-xsltproc-manpages.patch
> index 9f597bee2..a498348c2 100644
> --- a/meta-networking/recipes-connectivity/samba/samba/0001-Don-t-check-xsltproc-manpages.patch
> +++ b/meta-networking/recipes-connectivity/samba/samba/0001-Don-t-check-xsltproc-manpages.patch
> @@ -1,4 +1,4 @@
> -From f6fa33bfc2e1272198db6ea08910b4162b364b18 Mon Sep 17 00:00:00 2001
> +From 5c5418038e392cc00d3293e00ea0cd20b5e19c9a Mon Sep 17 00:00:00 2001
>   From: Bian Naimeng <biannm@cn.fujitsu.com>
>   Date: Mon, 18 Apr 2016 17:00:53 -0400
>   Subject: [PATCH] Don't check xsltproc manpages
> @@ -16,7 +16,7 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>    3 files changed, 3 insertions(+), 3 deletions(-)
>   
>   diff --git a/lib/ldb/wscript b/lib/ldb/wscript
> -index 60bb7cf..b7b0152 100644
> +index ed5d45f..de3c648 100644
>   --- a/lib/ldb/wscript
>   +++ b/lib/ldb/wscript
>   @@ -144,7 +144,7 @@ def configure(conf):
> @@ -29,7 +29,7 @@ index 60bb7cf..b7b0152 100644
>            # we need this for the ldap backend
>            if conf.CHECK_FUNCS_IN('ber_flush ldap_open ldap_initialize', 'lber ldap', headers='lber.h ldap.h'):
>   diff --git a/lib/talloc/wscript b/lib/talloc/wscript
> -index 3089663..76cd65e 100644
> +index 075f1ec..9bd9f73 100644
>   --- a/lib/talloc/wscript
>   +++ b/lib/talloc/wscript
>   @@ -48,7 +48,7 @@ def configure(conf):
> @@ -42,7 +42,7 @@ index 3089663..76cd65e 100644
>        conf.CHECK_HEADERS('sys/auxv.h')
>        conf.CHECK_FUNCS('getauxval')
>   diff --git a/lib/tdb/wscript b/lib/tdb/wscript
> -index 71ada31..accd474 100644
> +index 5e6a928..f13cf2a 100644
>   --- a/lib/tdb/wscript
>   +++ b/lib/tdb/wscript
>   @@ -95,7 +95,7 @@ def configure(conf):
> diff --git a/meta-networking/recipes-connectivity/samba/samba/0002-do-not-import-target-module-while-cross-compile.patch b/meta-networking/recipes-connectivity/samba/samba/0002-do-not-import-target-module-while-cross-compile.patch
> index 3b0269092..b0ad5c414 100644
> --- a/meta-networking/recipes-connectivity/samba/samba/0002-do-not-import-target-module-while-cross-compile.patch
> +++ b/meta-networking/recipes-connectivity/samba/samba/0002-do-not-import-target-module-while-cross-compile.patch
> @@ -1,4 +1,4 @@
> -From f7b8e2e149b06a8033e31f4242c392573fa9ab52 Mon Sep 17 00:00:00 2001
> +From ba492aead265edfd1da2a6c45dd7661c248309cb Mon Sep 17 00:00:00 2001
>   From: Changqing Li <changqing.li@windriver.com>
>   Date: Tue, 25 Jun 2019 14:25:08 +0800
>   Subject: [PATCH] do not import target module while cross compile
> @@ -6,18 +6,18 @@ Subject: [PATCH] do not import target module while cross compile
>   Some modules such as dynamic library maybe cann't be imported
>   while cross compile, we just check whether does the module exist.
>   
> +Upstream-Status: Pending
> +
>   Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
>   
>   update to version 4.10.5, and switch to python3
>   Signed-off-by: Changqing Li <changqing.li@windriver.com>
>   ---
> -Upstream-Status: Pending
> -
>    buildtools/wafsamba/samba_bundled.py | 27 +++++++++++++++++++--------
>    1 file changed, 19 insertions(+), 8 deletions(-)
>   
>   diff --git a/buildtools/wafsamba/samba_bundled.py b/buildtools/wafsamba/samba_bundled.py
> -index 7d2d855..01dcb56 100644
> +index 2300565..26d9e8c 100644
>   --- a/buildtools/wafsamba/samba_bundled.py
>   +++ b/buildtools/wafsamba/samba_bundled.py
>   @@ -4,6 +4,7 @@ import sys
> @@ -28,7 +28,7 @@ index 7d2d855..01dcb56 100644
>    
>    def PRIVATE_NAME(bld, name):
>        '''possibly rename a library to include a bundled extension'''
> -@@ -241,17 +242,27 @@ def CHECK_BUNDLED_SYSTEM_PYTHON(conf, libname, modulename, minversion='0.0.0'):
> +@@ -245,17 +246,27 @@ def CHECK_BUNDLED_SYSTEM_PYTHON(conf, libname, modulename, minversion='0.0.0'):
>        # versions
>        minversion = minimum_library_version(conf, libname, minversion)
>    
> diff --git a/meta-networking/recipes-connectivity/samba/samba/0003-Add-config-option-without-valgrind.patch b/meta-networking/recipes-connectivity/samba/samba/0003-Add-config-option-without-valgrind.patch
> index f2e25eb10..2c9d29c9f 100644
> --- a/meta-networking/recipes-connectivity/samba/samba/0003-Add-config-option-without-valgrind.patch
> +++ b/meta-networking/recipes-connectivity/samba/samba/0003-Add-config-option-without-valgrind.patch
> @@ -1,4 +1,4 @@
> -From 556bb3cf17ccdf0b0ee0d82801c4b20cf0990ae4 Mon Sep 17 00:00:00 2001
> +From cceee20e91af751469872b71155b23f0dec290a7 Mon Sep 17 00:00:00 2001
>   From: Changqing Li <changqing.li@windriver.com>
>   Date: Thu, 20 Jun 2019 14:11:16 +0800
>   Subject: [PATCH] Add config option without-valgrind
> @@ -9,38 +9,44 @@ Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
>   
>   Update patch to version 4.10.5
>   Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +
> +Rebase to 4.19.3
> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>   ---
>    lib/replace/wscript | 5 +++--
> - wscript             | 4 ++++
> - 2 files changed, 7 insertions(+), 2 deletions(-)
> + wscript             | 7 +++++++
> + 2 files changed, 10 insertions(+), 2 deletions(-)
>   
>   diff --git a/lib/replace/wscript b/lib/replace/wscript
> -index 2f17999..9ef9bd9 100644
> +index 37d7759..9dd9b48 100644
>   --- a/lib/replace/wscript
>   +++ b/lib/replace/wscript
> -@@ -114,8 +114,9 @@ def configure(conf):
> +@@ -113,8 +113,9 @@ def configure(conf):
>        conf.CHECK_HEADERS('sys/fileio.h sys/filesys.h sys/dustat.h sys/sysmacros.h')
>        conf.CHECK_HEADERS('xfs/libxfs.h netgroup.h')
>    
>   -    conf.CHECK_HEADERS('valgrind.h valgrind/valgrind.h')
> --    conf.CHECK_HEADERS('valgrind/memcheck.h valgrind/helgrind.h')
> -+    if not Options.options.disable_valgrind:
> +-    conf.CHECK_HEADERS('valgrind/memcheck.h valgrind/helgrind.h valgrind/callgrind.h')
> ++    if Options.options.enable_valgrind:
>   +        conf.CHECK_HEADERS('valgrind.h valgrind/valgrind.h')
> -+        conf.CHECK_HEADERS('valgrind/memcheck.h valgrind/helgrind.h')
> ++        conf.CHECK_HEADERS('valgrind/memcheck.h valgrind/helgrind.h valgrind/callgrind.h')
>        conf.CHECK_HEADERS('nss_common.h nsswitch.h ns_api.h')
>        conf.CHECK_HEADERS('sys/extattr.h sys/ea.h sys/proplist.h sys/cdefs.h')
>        conf.CHECK_HEADERS('utmp.h utmpx.h lastlog.h')
>   diff --git a/wscript b/wscript
> -index 3af4207..54d7e9e 100644
> +index 95ddd9e..6d9577a 100644
>   --- a/wscript
>   +++ b/wscript
> -@@ -116,6 +116,10 @@ def options(opt):
> -                   help=("Disable RELRO builds"),
> -                   action="store_false", dest='enable_relro')
> +@@ -123,6 +123,13 @@ def options(opt):
> +                   help=('Disable kernely keyring support for credential storage'),
> +                   action='store_false', dest='enable_keyring')
>    
> ++    opt.add_option('--with-valgrind',
> ++                   help=("Enable use of valgrind"),
> ++                   action="store_true", dest='enable_valgrind')
>   +    opt.add_option('--without-valgrind',
> -+                   help=("Disable use of the valgrind headers"),
> -+                   action="store_true", dest='disable_valgrind', default=False)
> ++                   help=("Disable use of valgrind"),
> ++                   action="store_false", dest='enable_valgrind', default=False)
>   +
>        gr = opt.option_group('developer options')
>    
> diff --git a/meta-networking/recipes-connectivity/samba/samba/0004-Add-options-to-configure-the-use-of-libbsd.patch b/meta-networking/recipes-connectivity/samba/samba/0004-Add-options-to-configure-the-use-of-libbsd.patch
> index 2b0fbff8e..c72bd133e 100644
> --- a/meta-networking/recipes-connectivity/samba/samba/0004-Add-options-to-configure-the-use-of-libbsd.patch
> +++ b/meta-networking/recipes-connectivity/samba/samba/0004-Add-options-to-configure-the-use-of-libbsd.patch
> @@ -1,9 +1,10 @@
> -From 515f2455b4b69f5fcd2c61a532663280785db737 Mon Sep 17 00:00:00 2001
> +From d302d9a4ac6eb2bbafd248064a878ba287d636b8 Mon Sep 17 00:00:00 2001
>   From: Peter Kjellerstedt <pkj@axis.com>
>   Date: Tue, 28 Apr 2020 02:05:33 +0200
>   Subject: [PATCH] Add options to configure the use of libbsd
>   
>   Upstream-Status: Inappropriate [oe deterministic build specific]
> +
>   Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
>   
>   Rebase to 4.14.4
> @@ -15,7 +16,7 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>    3 files changed, 29 insertions(+), 15 deletions(-)
>   
>   diff --git a/buildtools/wafsamba/wscript b/buildtools/wafsamba/wscript
> -index 8729b08..1c55428 100644
> +index 30cb366..d167551 100644
>   --- a/buildtools/wafsamba/wscript
>   +++ b/buildtools/wafsamba/wscript
>   @@ -145,6 +145,13 @@ Currently the only tested value is 'smbtorture,smbd/smbd' for Samba'''),
> @@ -33,10 +34,10 @@ index 8729b08..1c55428 100644
>    
>        gr.add_option('-C',
>   diff --git a/lib/replace/wscript b/lib/replace/wscript
> -index 9ef9bd9..d47de4f 100644
> +index 9dd9b48..a22ae59 100644
>   --- a/lib/replace/wscript
>   +++ b/lib/replace/wscript
> -@@ -439,20 +439,21 @@ def configure(conf):
> +@@ -444,20 +444,21 @@ def configure(conf):
>    
>        strlcpy_in_bsd = False
>    
> diff --git a/meta-networking/recipes-connectivity/samba/samba/0005-Fix-pyext_PATTERN-for-cross-compilation.patch b/meta-networking/recipes-connectivity/samba/samba/0005-Fix-pyext_PATTERN-for-cross-compilation.patch
> index e1b5fac0d..53ef21948 100644
> --- a/meta-networking/recipes-connectivity/samba/samba/0005-Fix-pyext_PATTERN-for-cross-compilation.patch
> +++ b/meta-networking/recipes-connectivity/samba/samba/0005-Fix-pyext_PATTERN-for-cross-compilation.patch
> @@ -1,4 +1,4 @@
> -From a8b4a40b535a2c69eb408f649e7169bcc1975fc1 Mon Sep 17 00:00:00 2001
> +From d2a2d0f82a37d0bf21123671774b0b03ffa976cf Mon Sep 17 00:00:00 2001
>   From: Yi Zhao <yi.zhao@windriver.com>
>   Date: Wed, 24 Nov 2021 13:33:35 +0800
>   Subject: [PATCH] Fix pyext_PATTERN for cross compilation
> @@ -46,10 +46,10 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>    1 file changed, 1 insertion(+), 1 deletion(-)
>   
>   diff --git a/third_party/waf/waflib/Tools/python.py b/third_party/waf/waflib/Tools/python.py
> -index a23bd01..af202e0 100644
> +index b2dd1a9..2bd3545 100644
>   --- a/third_party/waf/waflib/Tools/python.py
>   +++ b/third_party/waf/waflib/Tools/python.py
> -@@ -328,7 +328,7 @@ def check_python_headers(conf, features='pyembed pyext'):
> +@@ -339,7 +339,7 @@ def check_python_headers(conf, features='pyembed pyext'):
>    	x = 'MACOSX_DEPLOYMENT_TARGET'
>    	if dct[x]:
>    		env[x] = conf.environ[x] = str(dct[x])
> diff --git a/meta-networking/recipes-connectivity/samba/samba/0006-smbtorture-skip-test-case-tfork_cmd_send.patch b/meta-networking/recipes-connectivity/samba/samba/0006-smbtorture-skip-test-case-tfork_cmd_send.patch
> index cc4c15e09..13fbd3595 100644
> --- a/meta-networking/recipes-connectivity/samba/samba/0006-smbtorture-skip-test-case-tfork_cmd_send.patch
> +++ b/meta-networking/recipes-connectivity/samba/samba/0006-smbtorture-skip-test-case-tfork_cmd_send.patch
> @@ -1,4 +1,4 @@
> -From 950b5977ea7e72343067d0070cc35fb0dc5163d4 Mon Sep 17 00:00:00 2001
> +From 4fd04fc7c94d6981f3409d088ab8d32c48460010 Mon Sep 17 00:00:00 2001
>   From: Yi Zhao <yi.zhao@windriver.com>
>   Date: Thu, 25 Aug 2022 16:46:04 +0800
>   Subject: [PATCH] smbtorture: skip test case tfork_cmd_send
> diff --git a/meta-networking/recipes-connectivity/samba/samba/0007-Deleted-settiong-of-python-to-fix-the-install-confli.patch b/meta-networking/recipes-connectivity/samba/samba/0007-Deleted-settiong-of-python-to-fix-the-install-confli.patch
> index 45a7c82d8..e3506adfb 100644
> --- a/meta-networking/recipes-connectivity/samba/samba/0007-Deleted-settiong-of-python-to-fix-the-install-confli.patch
> +++ b/meta-networking/recipes-connectivity/samba/samba/0007-Deleted-settiong-of-python-to-fix-the-install-confli.patch
> @@ -1,4 +1,4 @@
> -From f783bb9c87ce11e824dfefca473d0dcf6edad238 Mon Sep 17 00:00:00 2001
> +From bf5552f937c745940081e29ef32d52ae26bfd8c1 Mon Sep 17 00:00:00 2001
>   From: Lei Maohui <leimaohui@fujitsu.com>
>   Date: Sun, 30 Oct 2022 11:59:31 +0900
>   Subject: [PATCH] Deleted settiong of python to fix the install conflict error
> @@ -22,7 +22,8 @@ sys.path.insert(0, "/usr/lib/python3.10/site-packages")
>   But this setting is for environment when running from source tree. There
>   is no necessary on target.
>   
> -Upstream-Status: Inappropriate
> +Upstream-Status: Inappropriate [embedded specific]
> +
>   Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
>   ---
>    source4/scripting/bin/samba-gpupdate     | 1 -
> @@ -47,7 +48,7 @@ index 4b3f057..08fec2d 100755
>    import optparse
>    from samba import getopt as options
>   diff --git a/source4/scripting/bin/samba-tool b/source4/scripting/bin/samba-tool
> -index f8a70a6..3c818de 100755
> +index b02ad4d..f69ae10 100755
>   --- a/source4/scripting/bin/samba-tool
>   +++ b/source4/scripting/bin/samba-tool
>   @@ -22,7 +22,6 @@
> @@ -59,7 +60,7 @@ index f8a70a6..3c818de 100755
>    # make sure the script dies immediately when hitting control-C,
>    # rather than raising KeyboardInterrupt. As we do all database
>   diff --git a/source4/scripting/bin/samba_dnsupdate b/source4/scripting/bin/samba_dnsupdate
> -index 1ce53f5..2cdfbf8 100755
> +index 69821e2..4037870 100755
>   --- a/source4/scripting/bin/samba_dnsupdate
>   +++ b/source4/scripting/bin/samba_dnsupdate
>   @@ -36,7 +36,6 @@ os.environ['PYTHONUNBUFFERED'] = '1'
> @@ -95,7 +96,7 @@ index 67d801e..2fc0d6a 100755
>    import optparse
>    import time
>   diff --git a/source4/scripting/bin/samba_spnupdate b/source4/scripting/bin/samba_spnupdate
> -index 84ff771..b6fe041 100755
> +index b421886..5e18ad9 100755
>   --- a/source4/scripting/bin/samba_spnupdate
>   +++ b/source4/scripting/bin/samba_spnupdate
>   @@ -32,7 +32,6 @@ os.environ['PYTHONUNBUFFERED'] = '1'
> diff --git a/meta-networking/recipes-connectivity/samba/samba/samba-4.3.9-remove-getpwent_r.patch b/meta-networking/recipes-connectivity/samba/samba/samba-4.3.9-remove-getpwent_r.patch
> index 9a83574e6..0c967be62 100644
> --- a/meta-networking/recipes-connectivity/samba/samba/samba-4.3.9-remove-getpwent_r.patch
> +++ b/meta-networking/recipes-connectivity/samba/samba/samba-4.3.9-remove-getpwent_r.patch
> @@ -1,4 +1,4 @@
> -From 08003ea30d86a8b983be89f6a161d3baacdaa038 Mon Sep 17 00:00:00 2001
> +From e5d9527e6b3b386229747f799c725fcd68bc5228 Mon Sep 17 00:00:00 2001
>   From: Khem Raj <raj.khem@gmail.com>
>   Date: Sun, 6 Nov 2016 23:40:54 -0800
>   Subject: [PATCH] Musl does not have _r versions of getent() and getpwent()
> @@ -7,15 +7,15 @@ Subject: [PATCH] Musl does not have _r versions of getent() and getpwent()
>   Taken from gentoo
>   http://data.gpo.zugaina.org/musl/net-fs/samba/files/samba-4.3.9-remove-getpwent_r.patch
>   
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
>   Upstream-Status: Pending
>   
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
>    source4/torture/local/nss_tests.c | 13 ++++++++-----
>    1 file changed, 8 insertions(+), 5 deletions(-)
>   
>   diff --git a/source4/torture/local/nss_tests.c b/source4/torture/local/nss_tests.c
> -index 2943122..bc185ca 100644
> +index e911aa2..2b39b74 100644
>   --- a/source4/torture/local/nss_tests.c
>   +++ b/source4/torture/local/nss_tests.c
>   @@ -247,7 +247,6 @@ static bool test_getgrnam_r(struct torture_context *tctx,
> diff --git a/meta-networking/recipes-connectivity/samba/samba/samba-pam.patch b/meta-networking/recipes-connectivity/samba/samba/samba-pam.patch
> index 9bf1f9757..4fcbb4757 100644
> --- a/meta-networking/recipes-connectivity/samba/samba/samba-pam.patch
> +++ b/meta-networking/recipes-connectivity/samba/samba/samba-pam.patch
> @@ -1,22 +1,22 @@
> -From 6822c61ade5617c9f109e32ad4cdc115fa9e12c8 Mon Sep 17 00:00:00 2001
> +From c533bdced677e2104565fc06602e7e63d9c79ac0 Mon Sep 17 00:00:00 2001
>   From: Khem Raj <raj.khem@gmail.com>
>   Date: Sun, 6 Nov 2016 23:40:54 -0800
>   Subject: [PATCH] Lifted from gentoo and ported to 4.4.5
>   
>   http://data.gpo.zugaina.org/musl/net-fs/samba/files/samba-4.2.7-pam.patch
>   
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
>   Upstream-Status: Pending
>   
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
>    source3/wscript | 13 ++++++++++++-
>    1 file changed, 12 insertions(+), 1 deletion(-)
>   
>   diff --git a/source3/wscript b/source3/wscript
> -index 22be17a..ee9ce52 100644
> +index b7f96f3..ed12b1e 100644
>   --- a/source3/wscript
>   +++ b/source3/wscript
> -@@ -862,7 +862,7 @@ msg.msg_accrightslen = sizeof(fd);
> +@@ -863,7 +863,7 @@ msg.msg_accrightslen = sizeof(fd);
>            if conf.env.with_iconv:
>                conf.DEFINE('HAVE_ICONV', 1)
>    
> @@ -25,7 +25,7 @@ index 22be17a..ee9ce52 100644
>            use_pam=True
>            conf.CHECK_HEADERS('security/pam_appl.h pam/pam_appl.h')
>            if not conf.CONFIG_SET('HAVE_SECURITY_PAM_APPL_H') and not conf.CONFIG_SET('HAVE_PAM_PAM_APPL_H'):
> -@@ -939,6 +939,17 @@ int i; i = PAM_RADIO_TYPE;
> +@@ -940,6 +940,17 @@ int i; i = PAM_RADIO_TYPE;
>                           "or headers not found. Use --without-pam to disable "
>                           "PAM support.");
>    
> diff --git a/meta-networking/recipes-connectivity/samba/samba_4.18.9.bb b/meta-networking/recipes-connectivity/samba/samba_4.19.3.bb
> similarity index 98%
> rename from meta-networking/recipes-connectivity/samba/samba_4.18.9.bb
> rename to meta-networking/recipes-connectivity/samba/samba_4.19.3.bb
> index 73ceb7b75..4828526ed 100644
> --- a/meta-networking/recipes-connectivity/samba/samba_4.18.9.bb
> +++ b/meta-networking/recipes-connectivity/samba/samba_4.19.3.bb
> @@ -31,9 +31,9 @@ SRC_URI:append:libc-musl = " \
>              file://samba-4.3.9-remove-getpwent_r.patch \
>              "
>   
> -SRC_URI[sha256sum] = "f455c1d6351ed3a36fc2cb6e8ab1bfd0effe54a56686ffd495d64ab52d50f245"
> +SRC_URI[sha256sum] = "280553b90f131b1940580df293653c9e9bd8906201f5def6e5e8c160f0bfac96"
>   
> -UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.18(\.\d+)+).tar.gz"
> +UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.19(\.\d+)+).tar.gz"
>   
>   inherit systemd waf-samba cpan-base perlnative update-rc.d perl-version pkgconfig
>   
> @@ -85,7 +85,7 @@ PACKAGECONFIG[sasl] = ",,cyrus-sasl"
>   PACKAGECONFIG[systemd] = "--with-systemd,--without-systemd,systemd"
>   PACKAGECONFIG[dmapi] = "--with-dmapi,--without-dmapi,dmapi"
>   PACKAGECONFIG[zeroconf] = "--enable-avahi,--disable-avahi,avahi"
> -PACKAGECONFIG[valgrind] = ",--without-valgrind,valgrind,"
> +PACKAGECONFIG[valgrind] = "--with-valgrind,--without-valgrind,valgrind"
>   PACKAGECONFIG[lttng] = "--with-lttng,--without-lttng,lttng-ust"
>   PACKAGECONFIG[archive] = "--with-libarchive,--without-libarchive,libarchive"
>   PACKAGECONFIG[libunwind] = "--with-libunwind,--without-libunwind,libunwind"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107982): https://lists.openembedded.org/g/openembedded-devel/message/107982
> Mute This Topic: https://lists.openembedded.org/mt/103459767/7283133
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [yi.zhao@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

