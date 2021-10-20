Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 398CAC433F5
	for <webhook@archiver.kernel.org>; Wed, 20 Oct 2021 02:08:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.2611.1634695709522576621
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Oct 2021 19:08:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=cFkteppq;
 spf=pass (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=59272ead14=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19K1h7Nl006471
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Oct 2021 19:08:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : from :
 to : references : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=o4EZAnETcjLUHFhgm8/+Wx8aNB0B0UdOOjNjfcPDxlo=;
 b=cFkteppqvjf2Xxy7+wZ3lJoKzccNoBhjwYjBnujsKyDOgqp3f5TEulmEJX1+WMGd8PLk
 1tWWeFw7QcGvRDJ1TpRBFupbynbku/5zzGLnTdKunYV/dJQ/mMVnue0d08e06EnDD9in
 a8Fk792csd+yi7AvBghCTZgOqu7LK7N+7uRuHLwnlB6t3CYFlyJov9Y7mAb4k1B6h3kO
 6JHVx/i/qDvFXKJYe/oNn3lo1rGYiJStTtyG/eAa80diae446dXphu6/m5afM3H7aPDZ
 8wt/WzVZkHwmxHEIVhW5N/deo1/T4SjMj8pYcV8TLh8UXZoMWjk3dWJNgE1vdTzW0FE6 zA==
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2040.outbound.protection.outlook.com [104.47.51.40])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bt7up82gs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Oct 2021 19:08:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gyj3dqg5eRQc6UfDWPcs0oTViTs7kUca0oRbYf3liZXPqEoBIRW644HpLvXfUsE4Ef4guz2kYSPgWX7EPcV4yy+0T7FMiXQ6LYKOVrMpi6cJdTSMKvOPqnGL4fcWF33LaTOs1T0pC6Pd9XseekyDAGdtxDC6uNLpxWVE76H6OXxD5AL0TvHWxaplSCOvdEwKwRI80YlANeAjQDQ8Nv0RIm2RK6nQgaQDLel/6xdzFiuiicU2DMZf5+1F3qcGs+dRBp2eR8H1frtt9Owi7Jd9vUU2IXl7e4rRm6XUW16pmrinjefjnwxKiDhICOikCTUin/UV1PzWNZeIHbAKJFyI8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o4EZAnETcjLUHFhgm8/+Wx8aNB0B0UdOOjNjfcPDxlo=;
 b=I9DBxapr7V0FzpA9dKH76JPrvYZoo1vSuc296wUMMguWnhb9Zmxj5JhhFPfD4PxOsh6oFg7cHu0h0ASVmIC4lSCXeDxtobOaiC5m+fPO+144gDTg0+Evg0uOicIORuMB97OzOLtq3fh0XqqLbhqPVeVrfpyWpk2VDIvqW5hFUgqkdkJbEPpOcpkXMaAh1s5rgG7AZHpqvxUWZwOGRFzlDT45n1SPUq+66wWCWBs3IIXmtgqYKC6aNzGhk7ko7fDfE6UfbOfrx9FhHsOj1GTH24T9YM2b6YApd38LgTWGVd8GZ8rb/QmLAtWL1d68qGH079gstZlsZD3XqV5CMoMa8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SN6PR11MB2896.namprd11.prod.outlook.com (2603:10b6:805:d9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Wed, 20 Oct
 2021 02:08:26 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::a544:19b6:196b:f339]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::a544:19b6:196b:f339%5]) with mapi id 15.20.4608.018; Wed, 20 Oct 2021
 02:08:25 +0000
Subject: Re: [oe] [PATCH 1/2] vsftpd: Upgrade to 3.0.5
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-devel@lists.openembedded.org
References: <20211011033745.32284-1-changqing.li@windriver.com>
 <16ACDCD61DE3AF4D.10559@lists.openembedded.org>
Message-ID: <83779856-f538-d182-7067-73d38f53fc28@windriver.com>
Date: Wed, 20 Oct 2021 10:08:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <16ACDCD61DE3AF4D.10559@lists.openembedded.org>
Content-Type: multipart/alternative;
 boundary="------------DAF47DC88F6DDD624B3AE4B4"
Content-Language: en-US
X-ClientProxiedBy: HK2PR06CA0001.apcprd06.prod.outlook.com
 (2603:1096:202:2e::13) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
MIME-Version: 1.0
Received: from [128.224.162.189] (60.247.85.82) by
 HK2PR06CA0001.apcprd06.prod.outlook.com (2603:1096:202:2e::13) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18 via Frontend
 Transport; Wed, 20 Oct 2021 02:08:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aead94db-8b0c-4481-ca9c-08d9936e800a
X-MS-TrafficTypeDiagnostic: SN6PR11MB2896:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB289655D712D43D41E84A9C0682BE9@SN6PR11MB2896.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MCGwst8fNowCCqiQrNWGEGxcip75ip01YHtXBSr06PxQMpeaycs4q8PXMa/xg4aORaLMEvlNjWVp8uvWNLCvWSW14RLKYhEabY5Enu52tArtVHolFrYjnSzxUKrQeebtCagYxmnTUYHSpCOJMgxHxCDiakEJlS+unPLmWd/Gq19k28GSNrMHwHMgW6u14v2oqxay0Iy5k+pa16nMbLoXirSXzZ5wWvNvD+jBEWVaUujKM7MdwsI0HJQusfJ3B1LM4XfNlZlYLn99gT7Z55FCw4URsamT4rfpkH4hO1JeXKKCFQablZMGTQZS0WGrsr3oq8G8iFetvVSnonkHQAFUszZd03fXMT2NMXADhKRngsf2KUXamd5RAPX+p3nmy1G9dXvlDKeYeL05HP538iMP4EIlv5nAVM1/u9ml0ePG2M5nTiYlNBnJ5B/eyz2++TOFAM2mMsqKIh7xI7EG+OIeg/+TJLjFDuKVUG9jBMLHuqb6R9CAJUX7DcF3c/uknCY7jCqVLTiHENihKF3MSVuOeHbOdkla6CfR74+sxGEaOFHP9j+HxOiWs25A09zFBd/+gnY42gSGalSGrnGORmpEgZxCCiTvpZ7i+UUaA2zCTChS06pJueX122r5lpUozskAGRSuV8FxFHAwPbP/tctUnuuIsx77gV/YQHgn3Pa25ee16mEI8Jq7tV3K63fjGq/l97BqZvyolDgTc/bBnTQwUJ6tYmomuTbuJzgEdSO92WEpREYhFC9aMtlmTdvoiVKuMOKRvnpAA8P/lkcorQyqQNLZ8AyhDaJeQuB5SOMCpblJjPKnxr6aRHpH9bz8eNBxXKIHmltq+0B0R4DfqBx5qYWdKbfhiJXIJL9ZU9CUkkmDhfkFIcstakn9KGfJB5b2D8cXRRRbt887VpejgU6PUB/MHoYeGf/yT8si696vXfdjMv8XLcGVkLE1O2EwBNys
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(26005)(52116002)(6706004)(6666004)(66476007)(33964004)(38350700002)(44832011)(6916009)(8936002)(31686004)(83380400001)(966005)(66946007)(316002)(16576012)(956004)(36756003)(508600001)(30864003)(53546011)(6486002)(86362001)(166002)(38100700002)(8676002)(5660300002)(2616005)(66556008)(2906002)(31696002)(99710200001)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MUp0b0ZWblFVeUdBUURDKzluWVdxSnJTc0pLbUMzQWFaODVDQmlFdDlUWmFx?=
 =?utf-8?B?UytkR2U5Q2QwUnJkdHQ5LzVHUm1mVkUra0FFemY4dTl1VUJ1aUxBQktxZjZr?=
 =?utf-8?B?Wlh1cWxMUVJhMmtBdXpqRTlteDFoVjJkeXF6elNQL3dFMzFtZG9vV0w0ZkQ2?=
 =?utf-8?B?NmNoSW1acDRHY0VldVhESGoybWxyUGN0QUlmRytHRkE2MXVZejA0WjlhUVRW?=
 =?utf-8?B?b21wTnNldjR0Q0ltaFBoOEN5SnJ1eHNtR3pxSkl0a3RjN1RRSkJDMDNBYkZM?=
 =?utf-8?B?TEN2cGhsaUxYYjNKUHRWNWR5UWZCdlNBVzZnMlZKeTJmNjh3Wmdsb2I0M3gx?=
 =?utf-8?B?djNKQlprNVBqejB6NmxCVXoxRHg5VHZ1Z244QnFEa1JoSTNCY2dJQ3d2OXlS?=
 =?utf-8?B?R3pFeEtINXgrd0xZVGtJKzZzekg3czJsNE85MTNqZmFUcWsyK0h2dmFRdWNH?=
 =?utf-8?B?SWxsRVNxRitOZzVYdXNFTks2Tm85cC9IZ3Z3bXRGb244NUd0NlNiL3FVSTY1?=
 =?utf-8?B?OG1oUmxrRW9LTmhIbk5nQ2ZJc3dVM1BGWWJORDhkMVBYVHhrZWpObjYwcXIr?=
 =?utf-8?B?cERWN1o1UTVJdGlvRzZRa2F2RWZFVUQwUGc0MmpZUXYxZVNHWEFGaG44Qlp6?=
 =?utf-8?B?eUJCK0Q3eXlyOS9Rci9ZQXhpdVNFbHB4cWJHN1haeGRRM29FdndmOThxNE1i?=
 =?utf-8?B?WUc4Z3hkeU9WampCWXBJZUlyQ2dtK1FyakR4S0ZuQjBLVkRnUWJwSDBEVmc2?=
 =?utf-8?B?VDZRb0NmQ2g5ZFRYWkkzZWptNEJrUW4xWkNIRW9pcitjL0hsVVI4Tmppdi9k?=
 =?utf-8?B?Y1hNNmtQN2QxNVVteG1uTXN0cExBYTI3TlFQamlJc0Z6YmdNTWZidC9XZWdF?=
 =?utf-8?B?d0pWUjUxcnpRWnVJYmJ1NlJ0bGtDOTFXL0FLZ1ZKM2lTWnplQzlBWEV1T2FS?=
 =?utf-8?B?VkJKRVF3UENLekpaa1hSQ3cvUWtTbDVmbWE5aHRMOGlDZ0dGNUdFbFh4T21K?=
 =?utf-8?B?RGNOb1RISmFiQzV1M3A0b1M2S0JGNXJUcXkwTFVRLzNYcmxXbG10TThzbnJz?=
 =?utf-8?B?SHJiZloxc1J6cEtyanFQRnZWRzZqdzF5cElqNjJIaWdOZCtoYlNFcWdqbDNr?=
 =?utf-8?B?UGdqUmxGSnVoY015Ylo0ZG9hTEVLMmFTb3R2YTNTNW8xUTY0SHpLWDBBUTkx?=
 =?utf-8?B?Q0h0NHVmYXErVkxtdEFaR1UwLzBDS3VaU0dROVRRTmpqTHN3cGJLRlpRU3cw?=
 =?utf-8?B?OVRkZDE4aHFlalFQdm5Ib1VSWDJaNkJ2aGZwVEl3a1RzU1d1ZjlEUFAzWndF?=
 =?utf-8?B?UEptV0YwREs5TEhWbTNJbVliRHdLa1dPY09mZ0ZLdkdNbXdsVTlXZGJsWUtm?=
 =?utf-8?B?R2hSVm0zeEE1ZlJISHQyS0lRMEtRQkszN0lacDE3SklWRm03ZitNVTVPR1NV?=
 =?utf-8?B?Mkl3cFRKTTA1N2NZa1NmT3BBeUVFNVJrdnVXdTVoYVc0djBuaWpSKzF4cmt0?=
 =?utf-8?B?MWJuaEwyaFp6TGhudDBDOSs0em5RMUtPODJWMmFibHk1emFDNjJmVWt2eGZL?=
 =?utf-8?B?dUZ4M1ZKd1l5VEhXQUJ5YnBkRUJadWZWS2hDdmxLUTE0R2NUS2V3VU9hM2kz?=
 =?utf-8?B?ajkrSjRvdGE4REpKNWcrUlBWVUNkaWN0cE43WWlwZTBVeGxmdlYra1dabkRM?=
 =?utf-8?B?WWNLS2M2SlNtTThjT0ovSHNsTWNPbTVnRXlkNWoxanpBOGtJcE9kTFVlUzZ5?=
 =?utf-8?Q?AOMMtA/x1+BSazP1cNREEc+NaK3D5sx7kne8t+A?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 aead94db-8b0c-4481-ca9c-08d9936e800a
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 02:08:25.7330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 BCR6EL75NNGlnNyvZn/fBPs2ajyogj2kb2w5eA5rpVjdBOBWZvc7P99J/JJqIFG4a4gYPSxv2QgG+lEinlpDSvuspvVHBshazvQp4g2tyS0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2896
X-Proofpoint-GUID: 3Il7qH90NSTyakqac3gZao2Svz9_3FCB
X-Proofpoint-ORIG-GUID: 3Il7qH90NSTyakqac3gZao2Svz9_3FCB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-19_02,2021-10-19_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 mlxlogscore=999 priorityscore=1501 phishscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2109230001 definitions=main-2110200007
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Oct 2021 02:08:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93475

--------------DAF47DC88F6DDD624B3AE4B4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

ping

On 10/11/21 11:37 AM, Changqing Li wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
>
> Drop 2 seccomp patches as seccomp sandbox policy tweaks in new version [1].
>
> [1] https://security.appspot.com/vsftpd/Changelog.txt
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   ...-allow-newfstatat-and-pselect6-sysca.patch | 51 -------------------
>   ...llow-syscalls-in-the-seccomp-sandbox.patch | 46 -----------------
>   ...-with-musl-which-does-not-have-utmpx.patch |  0
>   .../makefile-destdir.patch                    |  0
>   .../makefile-libs.patch                       |  0
>   .../makefile-strip.patch                      |  0
>   .../nopam-with-tcp_wrappers.patch             |  0
>   .../nopam.patch                               |  0
>   .../vsftpd-2.1.0-filter.patch                 |  0
>   .../vsftpd-tcp_wrappers-support.patch         |  0
>   .../{vsftpd_3.0.3.bb => vsftpd_3.0.5.bb}      |  5 +-
>   11 files changed, 1 insertion(+), 101 deletions(-)
>   delete mode 100644 meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/0001-seccompsandbox.c-allow-newfstatat-and-pselect6-sysca.patch
>   delete mode 100644 meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/0001-vsftpd-allow-syscalls-in-the-seccomp-sandbox.patch
>   rename meta-networking/recipes-daemons/vsftpd/{vsftpd-3.0.3 => vsftpd-3.0.5}/0001-sysdeputil.c-Fix-with-musl-which-does-not-have-utmpx.patch (100%)
>   rename meta-networking/recipes-daemons/vsftpd/{vsftpd-3.0.3 => vsftpd-3.0.5}/makefile-destdir.patch (100%)
>   rename meta-networking/recipes-daemons/vsftpd/{vsftpd-3.0.3 => vsftpd-3.0.5}/makefile-libs.patch (100%)
>   rename meta-networking/recipes-daemons/vsftpd/{vsftpd-3.0.3 => vsftpd-3.0.5}/makefile-strip.patch (100%)
>   rename meta-networking/recipes-daemons/vsftpd/{vsftpd-3.0.3 => vsftpd-3.0.5}/nopam-with-tcp_wrappers.patch (100%)
>   rename meta-networking/recipes-daemons/vsftpd/{vsftpd-3.0.3 => vsftpd-3.0.5}/nopam.patch (100%)
>   rename meta-networking/recipes-daemons/vsftpd/{vsftpd-3.0.3 => vsftpd-3.0.5}/vsftpd-2.1.0-filter.patch (100%)
>   rename meta-networking/recipes-daemons/vsftpd/{vsftpd-3.0.3 => vsftpd-3.0.5}/vsftpd-tcp_wrappers-support.patch (100%)
>   rename meta-networking/recipes-daemons/vsftpd/{vsftpd_3.0.3.bb => vsftpd_3.0.5.bb} (93%)
>
> diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/0001-seccompsandbox.c-allow-newfstatat-and-pselect6-sysca.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/0001-seccompsandbox.c-allow-newfstatat-and-pselect6-sysca.patch
> deleted file mode 100644
> index 29ce85cc1..000000000
> --- a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/0001-seccompsandbox.c-allow-newfstatat-and-pselect6-sysca.patch
> +++ /dev/null
> @@ -1,51 +0,0 @@
> -From 7bc261076ec94efa3197beaca39eba095d162b5e Mon Sep 17 00:00:00 2001
> -From: Yi Zhao <yi.zhao@windriver.com>
> -Date: Fri, 26 Feb 2021 16:32:27 +0800
> -Subject: [PATCH] seccompsandbox.c: allow newfstatat and pselect6 syscalls in
> - the seccomp sandbox
> -
> -Allow newfstatat and pselect6 in the seccomp sanbox for glibc 2.33.
> -
> -Fixes the following OOPS error:
> -root@qemux86-64:~# tnftp 192.168.1.1
> -Connected to 192.168.1.1.
> -220 (vsFTPd 3.0.3)
> -Name (192.168.1.1:root): anonymous
> -331 Please specify the password.
> -Password:
> -230 Login successful.
> -Remote system type is UNIX.
> -Using binary mode to transfer files.
> -ftp> ls
> -OOPS: priv_sock_get_cmd
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ----
> - seccompsandbox.c | 2 ++
> - 1 file changed, 2 insertions(+)
> -
> -diff --git a/seccompsandbox.c b/seccompsandbox.c
> -index 377c50e..f601241 100644
> ---- a/seccompsandbox.c
> -+++ b/seccompsandbox.c
> -@@ -267,6 +267,7 @@ seccomp_sandbox_setup_data_connections()
> -                        3, IPPROTO_TCP);
> -   allow_nr(__NR_bind);
> -   allow_nr(__NR_select);
> -+  allow_nr(__NR_pselect6);
> -   if (tunable_port_enable)
> -   {
> -     allow_nr(__NR_connect);
> -@@ -411,6 +412,7 @@ seccomp_sandbox_setup_postlogin(const struct vsf_session* p_sess)
> -   allow_nr(__NR_getdents);
> -   allow_nr(__NR_getdents64);
> -   allow_nr(__NR_sysinfo);
> -+  allow_nr(__NR_newfstatat);
> -   /* Misc */
> -   allow_nr(__NR_umask);
> -
> ---
> -2.17.1
> -
> diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/0001-vsftpd-allow-syscalls-in-the-seccomp-sandbox.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/0001-vsftpd-allow-syscalls-in-the-seccomp-sandbox.patch
> deleted file mode 100644
> index 7573c967f..000000000
> --- a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/0001-vsftpd-allow-syscalls-in-the-seccomp-sandbox.patch
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -From dd353303f62d1dfe32cb000e482616b021708fbe Mon Sep 17 00:00:00 2001
> -From: Mingli Yu <mingli.yu@windriver.com>
> -Date: Thu, 29 Nov 2018 00:47:34 -0800
> -Subject: [PATCH] vsftpd: allow syscalls in the seccomp sandbox
> -
> -* Allow sysinfo() and getdents64 in the seccomp
> -  sandbox otherwise comes below OOPS: priv_sock_get_cmd
> -  as the syscall sysinfo() and getdents64 not allowed
> -
> -root@qemux86-64:~# tnftp 192.168.1.1
> -Connected to 192.168.1.1.
> -220 (vsFTPd 3.0.3)
> -Name (192.168.1.1:root): anonymous
> -331 Please specify the password.
> -Password:
> -230 Login successful.
> -Remote system type is UNIX.
> -Using binary mode to transfer files.
> -ftp> prompt
> -Interactive mode off.
> -ftp> mget small*
> -OOPS: priv_sock_get_cmd
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ----
> - seccompsandbox.c | 2 ++
> - 1 file changed, 2 insertions(+)
> -
> -diff --git a/seccompsandbox.c b/seccompsandbox.c
> -index 2c350a9..377c50e 100644
> ---- a/seccompsandbox.c
> -+++ b/seccompsandbox.c
> -@@ -409,6 +409,8 @@ seccomp_sandbox_setup_postlogin(const struct vsf_session* p_sess)
> -   allow_nr(__NR_getcwd);
> -   allow_nr(__NR_chdir);
> -   allow_nr(__NR_getdents);
> -+  allow_nr(__NR_getdents64);
> -+  allow_nr(__NR_sysinfo);
> -   /* Misc */
> -   allow_nr(__NR_umask);
> -
> ---
> -2.17.1
> -
> diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/0001-sysdeputil.c-Fix-with-musl-which-does-not-have-utmpx.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.5/0001-sysdeputil.c-Fix-with-musl-which-does-not-have-utmpx.patch
> similarity index 100%
> rename from meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/0001-sysdeputil.c-Fix-with-musl-which-does-not-have-utmpx.patch
> rename to meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.5/0001-sysdeputil.c-Fix-with-musl-which-does-not-have-utmpx.patch
> diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/makefile-destdir.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.5/makefile-destdir.patch
> similarity index 100%
> rename from meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/makefile-destdir.patch
> rename to meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.5/makefile-destdir.patch
> diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/makefile-libs.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.5/makefile-libs.patch
> similarity index 100%
> rename from meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/makefile-libs.patch
> rename to meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.5/makefile-libs.patch
> diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/makefile-strip.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.5/makefile-strip.patch
> similarity index 100%
> rename from meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/makefile-strip.patch
> rename to meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.5/makefile-strip.patch
> diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/nopam-with-tcp_wrappers.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.5/nopam-with-tcp_wrappers.patch
> similarity index 100%
> rename from meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/nopam-with-tcp_wrappers.patch
> rename to meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.5/nopam-with-tcp_wrappers.patch
> diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/nopam.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.5/nopam.patch
> similarity index 100%
> rename from meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/nopam.patch
> rename to meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.5/nopam.patch
> diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/vsftpd-2.1.0-filter.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.5/vsftpd-2.1.0-filter.patch
> similarity index 100%
> rename from meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/vsftpd-2.1.0-filter.patch
> rename to meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.5/vsftpd-2.1.0-filter.patch
> diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/vsftpd-tcp_wrappers-support.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.5/vsftpd-tcp_wrappers-support.patch
> similarity index 100%
> rename from meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/vsftpd-tcp_wrappers-support.patch
> rename to meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.5/vsftpd-tcp_wrappers-support.patch
> diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.5.bb
> similarity index 93%
> rename from meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb
> rename to meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.5.bb
> index 024b776de..192f8de33 100644
> --- a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb
> +++ b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.5.bb
> @@ -18,11 +18,9 @@ SRC_URI = "https://security.appspot.com/downloads/vsftpd-${PV}.tar.gz \
>              file://volatiles.99_vsftpd \
>              file://vsftpd.service \
>              file://vsftpd-2.1.0-filter.patch \
> -           file://0001-vsftpd-allow-syscalls-in-the-seccomp-sandbox.patch \
>              ${@bb.utils.contains('PACKAGECONFIG', 'tcp-wrappers', 'file://vsftpd-tcp_wrappers-support.patch', '', d)} \
>              ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '', '${NOPAM_SRC}', d)} \
>              file://0001-sysdeputil.c-Fix-with-musl-which-does-not-have-utmpx.patch \
> -           file://0001-seccompsandbox.c-allow-newfstatat-and-pselect6-sysca.patch \
>              "
>   
>   UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/v/vsftpd/"
> @@ -31,8 +29,7 @@ UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.orig\.tar"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=a6067ad950b28336613aed9dd47b1271 \
>                           file://COPYRIGHT;md5=04251b2eb0f298dae376d92454f6f72e \
>                           file://LICENSE;md5=654df2042d44b8cac8a5654fc5be63eb"
> -SRC_URI[md5sum] = "da119d084bd3f98664636ea05b5bb398"
> -SRC_URI[sha256sum] = "9d4d2bf6e6e2884852ba4e69e157a2cecd68c5a7635d66a3a8cf8d898c955ef7"
> +SRC_URI[sha256sum] = "26b602ae454b0ba6d99ef44a09b6b9e0dfa7f67228106736df1f278c70bc91d3"
>   
>   
>   PACKAGECONFIG ??= "tcp-wrappers"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93213): https://lists.openembedded.org/g/openembedded-devel/message/93213
> Mute This Topic: https://lists.openembedded.org/mt/86229292/3616873
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [changqing.li@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

--------------DAF47DC88F6DDD624B3AE4B4
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>ping<br>
    </p>
    <div class="moz-cite-prefix">On 10/11/21 11:37 AM, Changqing Li
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:16ACDCD61DE3AF4D.10559@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">From: Mingli Yu <a class="moz-txt-link-rfc2396E" href="mailto:mingli.yu@windriver.com">&lt;mingli.yu@windriver.com&gt;</a>

Drop 2 seccomp patches as seccomp sandbox policy tweaks in new version [1].

[1] <a class="moz-txt-link-freetext" href="https://security.appspot.com/vsftpd/Changelog.txt">https://security.appspot.com/vsftpd/Changelog.txt</a>

Signed-off-by: Mingli Yu <a class="moz-txt-link-rfc2396E" href="mailto:mingli.yu@windriver.com">&lt;mingli.yu@windriver.com&gt;</a>
Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
---
 ...-allow-newfstatat-and-pselect6-sysca.patch | 51 -------------------
 ...llow-syscalls-in-the-seccomp-sandbox.patch | 46 -----------------
 ...-with-musl-which-does-not-have-utmpx.patch |  0
 .../makefile-destdir.patch                    |  0
 .../makefile-libs.patch                       |  0
 .../makefile-strip.patch                      |  0
 .../nopam-with-tcp_wrappers.patch             |  0
 .../nopam.patch                               |  0
 .../vsftpd-2.1.0-filter.patch                 |  0
 .../vsftpd-tcp_wrappers-support.patch         |  0
 .../{vsftpd_3.0.3.bb =&gt; vsftpd_3.0.5.bb}      |  5 +-
 11 files changed, 1 insertion(+), 101 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/0001-seccompsandbox.c-allow-newfstatat-and-pselect6-sysca.patch
 delete mode 100644 meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/0001-vsftpd-allow-syscalls-in-the-seccomp-sandbox.patch
 rename meta-networking/recipes-daemons/vsftpd/{vsftpd-3.0.3 =&gt; vsftpd-3.0.5}/0001-sysdeputil.c-Fix-with-musl-which-does-not-have-utmpx.patch (100%)
 rename meta-networking/recipes-daemons/vsftpd/{vsftpd-3.0.3 =&gt; vsftpd-3.0.5}/makefile-destdir.patch (100%)
 rename meta-networking/recipes-daemons/vsftpd/{vsftpd-3.0.3 =&gt; vsftpd-3.0.5}/makefile-libs.patch (100%)
 rename meta-networking/recipes-daemons/vsftpd/{vsftpd-3.0.3 =&gt; vsftpd-3.0.5}/makefile-strip.patch (100%)
 rename meta-networking/recipes-daemons/vsftpd/{vsftpd-3.0.3 =&gt; vsftpd-3.0.5}/nopam-with-tcp_wrappers.patch (100%)
 rename meta-networking/recipes-daemons/vsftpd/{vsftpd-3.0.3 =&gt; vsftpd-3.0.5}/nopam.patch (100%)
 rename meta-networking/recipes-daemons/vsftpd/{vsftpd-3.0.3 =&gt; vsftpd-3.0.5}/vsftpd-2.1.0-filter.patch (100%)
 rename meta-networking/recipes-daemons/vsftpd/{vsftpd-3.0.3 =&gt; vsftpd-3.0.5}/vsftpd-tcp_wrappers-support.patch (100%)
 rename meta-networking/recipes-daemons/vsftpd/{vsftpd_3.0.3.bb =&gt; vsftpd_3.0.5.bb} (93%)

diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/0001-seccompsandbox.c-allow-newfstatat-and-pselect6-sysca.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/0001-seccompsandbox.c-allow-newfstatat-and-pselect6-sysca.patch
deleted file mode 100644
index 29ce85cc1..000000000
--- a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/0001-seccompsandbox.c-allow-newfstatat-and-pselect6-sysca.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 7bc261076ec94efa3197beaca39eba095d162b5e Mon Sep 17 00:00:00 2001
-From: Yi Zhao <a class="moz-txt-link-rfc2396E" href="mailto:yi.zhao@windriver.com">&lt;yi.zhao@windriver.com&gt;</a>
-Date: Fri, 26 Feb 2021 16:32:27 +0800
-Subject: [PATCH] seccompsandbox.c: allow newfstatat and pselect6 syscalls in
- the seccomp sandbox
-
-Allow newfstatat and pselect6 in the seccomp sanbox for glibc 2.33.
-
-Fixes the following OOPS error:
-root@qemux86-64:~# tnftp 192.168.1.1
-Connected to 192.168.1.1.
-220 (vsFTPd 3.0.3)
-Name (192.168.1.1:root): anonymous
-331 Please specify the password.
-Password:
-230 Login successful.
-Remote system type is UNIX.
-Using binary mode to transfer files.
-ftp&gt; ls
-OOPS: priv_sock_get_cmd
-
-Upstream-Status: Pending
-
-Signed-off-by: Yi Zhao <a class="moz-txt-link-rfc2396E" href="mailto:yi.zhao@windriver.com">&lt;yi.zhao@windriver.com&gt;</a>
----
- seccompsandbox.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/seccompsandbox.c b/seccompsandbox.c
-index 377c50e..f601241 100644
---- a/seccompsandbox.c
-+++ b/seccompsandbox.c
-@@ -267,6 +267,7 @@ seccomp_sandbox_setup_data_connections()
-                        3, IPPROTO_TCP);
-   allow_nr(__NR_bind);
-   allow_nr(__NR_select);
-+  allow_nr(__NR_pselect6);
-   if (tunable_port_enable)
-   {
-     allow_nr(__NR_connect);
-@@ -411,6 +412,7 @@ seccomp_sandbox_setup_postlogin(const struct vsf_session* p_sess)
-   allow_nr(__NR_getdents);
-   allow_nr(__NR_getdents64);
-   allow_nr(__NR_sysinfo);
-+  allow_nr(__NR_newfstatat);
-   /* Misc */
-   allow_nr(__NR_umask);
- 
--- 
-2.17.1
-
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/0001-vsftpd-allow-syscalls-in-the-seccomp-sandbox.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/0001-vsftpd-allow-syscalls-in-the-seccomp-sandbox.patch
deleted file mode 100644
index 7573c967f..000000000
--- a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/0001-vsftpd-allow-syscalls-in-the-seccomp-sandbox.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From dd353303f62d1dfe32cb000e482616b021708fbe Mon Sep 17 00:00:00 2001
-From: Mingli Yu <a class="moz-txt-link-rfc2396E" href="mailto:mingli.yu@windriver.com">&lt;mingli.yu@windriver.com&gt;</a>
-Date: Thu, 29 Nov 2018 00:47:34 -0800
-Subject: [PATCH] vsftpd: allow syscalls in the seccomp sandbox
-
-* Allow sysinfo() and getdents64 in the seccomp
-  sandbox otherwise comes below OOPS: priv_sock_get_cmd
-  as the syscall sysinfo() and getdents64 not allowed
-
-root@qemux86-64:~# tnftp 192.168.1.1
-Connected to 192.168.1.1.
-220 (vsFTPd 3.0.3)
-Name (192.168.1.1:root): anonymous
-331 Please specify the password.
-Password:
-230 Login successful.
-Remote system type is UNIX.
-Using binary mode to transfer files.
-ftp&gt; prompt
-Interactive mode off.
-ftp&gt; mget small*
-OOPS: priv_sock_get_cmd
-
-Upstream-Status: Pending
-
-Signed-off-by: Mingli Yu <a class="moz-txt-link-rfc2396E" href="mailto:mingli.yu@windriver.com">&lt;mingli.yu@windriver.com&gt;</a>
----
- seccompsandbox.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/seccompsandbox.c b/seccompsandbox.c
-index 2c350a9..377c50e 100644
---- a/seccompsandbox.c
-+++ b/seccompsandbox.c
-@@ -409,6 +409,8 @@ seccomp_sandbox_setup_postlogin(const struct vsf_session* p_sess)
-   allow_nr(__NR_getcwd);
-   allow_nr(__NR_chdir);
-   allow_nr(__NR_getdents);
-+  allow_nr(__NR_getdents64);
-+  allow_nr(__NR_sysinfo);
-   /* Misc */
-   allow_nr(__NR_umask);
- 
--- 
-2.17.1
-
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/0001-sysdeputil.c-Fix-with-musl-which-does-not-have-utmpx.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.5/0001-sysdeputil.c-Fix-with-musl-which-does-not-have-utmpx.patch
similarity index 100%
rename from meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/0001-sysdeputil.c-Fix-with-musl-which-does-not-have-utmpx.patch
rename to meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.5/0001-sysdeputil.c-Fix-with-musl-which-does-not-have-utmpx.patch
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/makefile-destdir.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.5/makefile-destdir.patch
similarity index 100%
rename from meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/makefile-destdir.patch
rename to meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.5/makefile-destdir.patch
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/makefile-libs.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.5/makefile-libs.patch
similarity index 100%
rename from meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/makefile-libs.patch
rename to meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.5/makefile-libs.patch
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/makefile-strip.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.5/makefile-strip.patch
similarity index 100%
rename from meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/makefile-strip.patch
rename to meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.5/makefile-strip.patch
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/nopam-with-tcp_wrappers.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.5/nopam-with-tcp_wrappers.patch
similarity index 100%
rename from meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/nopam-with-tcp_wrappers.patch
rename to meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.5/nopam-with-tcp_wrappers.patch
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/nopam.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.5/nopam.patch
similarity index 100%
rename from meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/nopam.patch
rename to meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.5/nopam.patch
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/vsftpd-2.1.0-filter.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.5/vsftpd-2.1.0-filter.patch
similarity index 100%
rename from meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/vsftpd-2.1.0-filter.patch
rename to meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.5/vsftpd-2.1.0-filter.patch
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/vsftpd-tcp_wrappers-support.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.5/vsftpd-tcp_wrappers-support.patch
similarity index 100%
rename from meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/vsftpd-tcp_wrappers-support.patch
rename to meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.5/vsftpd-tcp_wrappers-support.patch
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.5.bb
similarity index 93%
rename from meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb
rename to meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.5.bb
index 024b776de..192f8de33 100644
--- a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb
+++ b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.5.bb
@@ -18,11 +18,9 @@ SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://security.appspot.com/downloads/vsftpd-${PV}.tar.gz\file://volatiles.99_vsftpd\file://vsftpd.service\file://vsftpd-2.1.0-filter.patch\-file://0001-vsftpd-allow-syscalls-in-the-seccomp-sandbox.patch\${@bb.utils.contains('PACKAGECONFIG','tcp-wrappers','file://vsftpd-tcp_wrappers-support.patch','',d)}\${@bb.utils.contains('DISTRO_FEATURES','pam','','${NOPAM_SRC}',d)}\file://0001-sysdeputil.c-Fix-with-musl-which-does-not-have-utmpx.patch\-file://0001-seccompsandbox.c-allow-newfstatat-and-pselect6-sysca.patch\">&quot;https://security.appspot.com/downloads/vsftpd-${PV}.tar.gz \
            file://volatiles.99_vsftpd \
            file://vsftpd.service \
            file://vsftpd-2.1.0-filter.patch \
-           file://0001-vsftpd-allow-syscalls-in-the-seccomp-sandbox.patch \
            ${@bb.utils.contains('PACKAGECONFIG', 'tcp-wrappers', 'file://vsftpd-tcp_wrappers-support.patch', '', d)} \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '', '${NOPAM_SRC}', d)} \
            file://0001-sysdeputil.c-Fix-with-musl-which-does-not-have-utmpx.patch \
-           file://0001-seccompsandbox.c-allow-newfstatat-and-pselect6-sysca.patch \
            &quot;</a>
 
 UPSTREAM_CHECK_URI = &quot;${DEBIAN_MIRROR}/main/v/vsftpd/&quot;
@@ -31,8 +29,7 @@ UPSTREAM_CHECK_REGEX = &quot;(?P&lt;pver&gt;\d+(\.\d+)+)\.orig\.tar&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=a6067ad950b28336613aed9dd47b1271\file://COPYRIGHT;md5=04251b2eb0f298dae376d92454f6f72e\file://LICENSE;md5=654df2042d44b8cac8a5654fc5be63eb">&quot;file://COPYING;md5=a6067ad950b28336613aed9dd47b1271 \
                         file://COPYRIGHT;md5=04251b2eb0f298dae376d92454f6f72e \
                         file://LICENSE;md5=654df2042d44b8cac8a5654fc5be63eb&quot;</a>
-SRC_URI[md5sum] = &quot;da119d084bd3f98664636ea05b5bb398&quot;
-SRC_URI[sha256sum] = &quot;9d4d2bf6e6e2884852ba4e69e157a2cecd68c5a7635d66a3a8cf8d898c955ef7&quot;
+SRC_URI[sha256sum] = &quot;26b602ae454b0ba6d99ef44a09b6b9e0dfa7f67228106736df1f278c70bc91d3&quot;
 
 
 PACKAGECONFIG ??= &quot;tcp-wrappers&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#93213): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/message/93213">https://lists.openembedded.org/g/openembedded-devel/message/93213</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/86229292/3616873">https://lists.openembedded.org/mt/86229292/3616873</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:changqing.li@windriver.com">changqing.li@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------DAF47DC88F6DDD624B3AE4B4--

