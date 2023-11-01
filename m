Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C9BAC4332F
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 02:32:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.48659.1698805936195280369
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Oct 2023 19:32:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=nvUYNpUL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9669bac9c4=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3A12LWCR027508
	for <openembedded-devel@lists.openembedded.org>; Wed, 1 Nov 2023 02:32:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=RYeuDc+GvAhAnpai3QSipe5my4gEtRmjTC5L9IasxGQ=; b=
	nvUYNpULKg70ZO494tQgj9K2dO7joF/M+OEHaXzv9H/SRWUjMxp6EQuLqfm2AUIF
	c/4+fjXYgd0Wqr713TylqApBwp/MV5C31J7YKaevDPbuLJZMVe0aFdQN9G0vFA1v
	YF1nie4dMbsQ2j6jLCoYdqSsJ7kT2bPalC1ScSxVUysi6yGlDigUtAMY6QGOLJ6A
	1mIQkaBLTN4A7klR6JyoIsfDeylnVOBa5wbeRmfZdsbUKg9Iwn8ddp4/z28oqClG
	H3xi2iSuvZEZNzXa52sJIEOosHFPxWLedBJGtBrZMcvgCQajXda0e13/2dkTByNT
	taDVnJ6i9A9zKiUuAE1ZYw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u0qgxvemh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 01 Nov 2023 02:32:14 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 3A12WEAM014911;
	Wed, 1 Nov 2023 02:32:14 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2041.outbound.protection.outlook.com [104.47.51.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u0qgxvemg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Nov 2023 02:32:14 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=igBIWQ2wD+z1bo2IvX4kqLxuhY2BqpblJvyEcZhKVf+HiYSXG0TuLYdJDPjaxkXTay7RGhukpL7EgjWeW0C4MDLiHUrT9y0CROy11erMjAf0am+7ILjflbagxIjSe9Y89ookiS4Oh2Sxnt/a/9KxN/HLK+mKK2JRFQPvJku11Q1DNNxoJ1s1S+GT2/+lvEq8CJJh3MN2bO/fIdGTknbQH5jRD93peX79dW//ALC5ZyiFCoNwktvF6/Jgmm7OQgUHnYaHKrNRAaN4FgBGFRJkPYkGr6iBCwShULBoVjN0LV+FMaPatnxqMdmf4/f1Ur8Q9NW6YMcZWfDTkBnag/18MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RYeuDc+GvAhAnpai3QSipe5my4gEtRmjTC5L9IasxGQ=;
 b=ApLQCmL7YtZGNkvAB7dLT2pS1iO71/iRr4mXMjzgzzyVTCY4WHwQqyPTDyPmP3T/BvpbSBAnWQGVbkK89qoEZSFWOdJHAC77woa1Di9SbWtGEW/21oBS+FQL6VK+1/zy4tB8ISkeuSuBMiEf3I98WpEuZtFG3LVMBPVkCAKi3treMpcX4dFMc082AkQ9L5ANGqYu9l+VkEYCFEFkWhOquyeW2LpEY4jEYJulalCaiMKGdWUKgUPMkEhG0oyLREBK+x0+SIzkAEn6pJlTR4M+HZyLCE26hISE3Q9FHY4bm5lFTH9LTTn44fBsNrfWhCZCL1npop3FAc3n1LzJN2MLqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB6064.namprd11.prod.outlook.com (2603:10b6:8:77::14) by
 CO1PR11MB5203.namprd11.prod.outlook.com (2603:10b6:303:98::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6933.29; Wed, 1 Nov 2023 02:32:10 +0000
Received: from DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::4657:c76c:d491:3c23]) by DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::4657:c76c:d491:3c23%6]) with mapi id 15.20.6907.032; Wed, 1 Nov 2023
 02:32:10 +0000
Message-ID: <9963595d-863c-bf40-4b6e-65310524e932@windriver.com>
Date: Wed, 1 Nov 2023 10:31:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [oe] [meta-python][PATCH] python3-nacl: Add recipe for the latest
 release of PyNaCl
Content-Language: en-US
To: Derek Straka <derek@asterius.io>,
        openembedded-devel@lists.openembedded.org,
        Khem Raj <raj.khem@gmail.com>
References: <20230929213521.2140103-1-derek@asterius.io>
From: Kai <kai.kang@windriver.com>
In-Reply-To: <20230929213521.2140103-1-derek@asterius.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0018.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::7) To DS7PR11MB6064.namprd11.prod.outlook.com
 (2603:10b6:8:77::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6064:EE_|CO1PR11MB5203:EE_
X-MS-Office365-Filtering-Correlation-Id: 1562ef1a-c1bc-47b6-9ced-08dbda82bfc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+f3efrs8dfoTzjqAlzAYPyuep/yS35fXtu/0bpD/7vfRLm/gvtyj+vUorVXu0IeUo01yWehDFdxZIcld3PGpXskKdMph7LVKZhEJ158Uf2qL/oeTWIDLT+ntKz/uiEhMHcYkPgF6rrDXZWFdC2TATeeFQ2gpXtg7j4KirSrFYwWayV0q66/WfswUVSFj+0e5C+NNs+DLrvsdEMAsqYXayKaK8sQCQzpIa5fWRXCKLT0iIvrbVq23eLBL5MxZoX9+pnHw3yBX//7bGvu+J4Zkk6eLJyCp8EbZEQx/4EyS9XRo5XMhGtgOs86l1DQ7auqIRriVoim5jHjLaecn9uvutDi3MYWroNk/qGwQY4UT3G8k/i9X4hbLh+L8squxw1l1m/Tq1U1/3TfHFD5/wB3wcxU2q2q80Kfu/oCTrhtkJ2Au6Rkp1QiTc2KK04z+ED9atrqr+LESJMrSWF3QbV687HF18V798b7gM9HlBdlw+7oH02XRetnEiroJueP90tj3Gf5K+tcGEUEIJXFWiK/kJWXGJYGsab4Wy8oWTZuonM1yta6ukkDCMgdeuemJMFqFpkdUcKDnlXdk79RNkJ0itBnjk/+uSF6/GwHKYwo4UmINaRsAtNxeSZVFUl6+m5/amw4cdawAbB34VXDPs7cY+w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6064.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(6029001)(376002)(396003)(136003)(366004)(39850400004)(346002)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(66946007)(66556008)(66476007)(110136005)(316002)(26005)(8676002)(8936002)(83380400001)(5660300002)(66899024)(6486002)(38100700002)(53546011)(966005)(478600001)(36756003)(6506007)(2906002)(31696002)(86362001)(6512007)(6666004)(31686004)(2616005)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?V1lLbE8wVUxKUVhqN3hGQkJ5NHVQTytLWHZKZHptMnVINmNuZExSbWovbkNK?=
 =?utf-8?B?dW5pWGxrUGhMSjhGUHZ6eThvaitTRktkV0krM253bnBaeE12THRoU0pObWtP?=
 =?utf-8?B?eUxsTGtqdkVndGxDM2krbnRwc2FJUFFjZFlrbEEycnNkaUNtS2FTazhWNldQ?=
 =?utf-8?B?eGJScXRsSTlpRTUzV1BPWnNxdmVBYTRZSTBnOGc1RFh4UnEwV3dmOURGNms0?=
 =?utf-8?B?dnIvK1JoN2hVUmRoeEQ0NEJuMHcvY3ltSWUwYk9zVTRteTd5OEVIbVVlUXpx?=
 =?utf-8?B?U2pTV2UzZVlpdHNVNHl3K0M1dmxFVjl2K090emFiVmxGTXc4dXVyZlo4YlBo?=
 =?utf-8?B?c0d0T3hQT1Q0U045QUlqS2NvL3FHS3dJeVB1cExLSGFDTjlHakJLTktTNmw0?=
 =?utf-8?B?dTJncS9ZOU5QUXJDN0hIYjlHMSszNVhxUElxTUJBOU5IRk5xN3gvZEtPZDNj?=
 =?utf-8?B?RzBwVkNld2o2MkVyQURHSVhzV1NmWE1maW9sZnFLak5XQTNrelBoMmpjamIw?=
 =?utf-8?B?ZkU5ejAvNm9SbVoxQ1NqcDFobDFGc050TkY4VzBTUTJzUWFsSHVZZzVkaWtp?=
 =?utf-8?B?SUF4MEcrUXpqNlNzQmE1MWs5N1oySitYb0pMV1lrdVpyMGhxdHpESWtmQmpl?=
 =?utf-8?B?cDdNZ091YnBXVDBVdjNSOWdTRmVOMm1TOWpxblg3L2VxNDYzT01FUTBLZG5i?=
 =?utf-8?B?TGdFRlVpMkhxN2EzQTE3TjdVOFE2VS9keU1ENzRLTi9MVkVNdmVsSlh6ZGhK?=
 =?utf-8?B?M29YSi9FeUY3U0tlemVSOFQ4djI3ay85S3c0SVVFNU9EdjRwV3FMMXN0ZUJC?=
 =?utf-8?B?ZmFyS1YxMGFVUEVFbUFuZUpQWFpxVXMyLzFDaWpCUWExN2ZCaGJvM1lqdEhO?=
 =?utf-8?B?VGJRSms0WFZ5Zk1wdDZYUzl6Wk54YTBqV2FIeDJhVEtkRTQrRzkxSzFqcHRz?=
 =?utf-8?B?OVpIUDJ0eVlyejgxTHRIUVFDZUp4VThJM0NXYjBSUVllMWJjM2dWcU1LL2gz?=
 =?utf-8?B?bjVMWmNZaGVsaytxUG5PT3BEOW9kTEdLN0hzZE1LSUlhRmMweEhiN2xvMFRR?=
 =?utf-8?B?dHkzSEd1UTZtZTJzclppMDVQd1psazYxOHd4ak13cE16UzFpOUlmWFZMSXpE?=
 =?utf-8?B?STIvS0pYL3BqZ1BjcTgxcGxDdGpaNTlwM0Y2bW9heng4dUMwcnF5Mm1pMmlU?=
 =?utf-8?B?VkVOTEk1SFBZY3RhVEJnNmhRUGJXVHRaYlRCcW9zeDQrYzdrQ0g1OHY0VjVa?=
 =?utf-8?B?QURnZVJXNXkvdkdCOXRFSFQ1U0o5RCtoUjBmNi9qRllpTGsyd0NZKy9qZHZ6?=
 =?utf-8?B?WlhLL2JITmdkUWJsRXdEemlNQytZZXY4K0Z3SGRCbzNzRTJXNlFDMGVxMTlq?=
 =?utf-8?B?T2RxRDRRRHdLKzhEM09pQm82S3hlY0JPTnJ5bkl2YjI4KzI4cFdveHVCQWIx?=
 =?utf-8?B?VWUzbGVEbW5YTW9iQVFFMUtBUW1RSmh4bS9MZzFiejNUYzJKWTdyMlBWWkJ1?=
 =?utf-8?B?MElnMk5yYXJKSHNFOUJ4cmtwK1RjVFFDNStLRCtyV0s2MVJKb0RuSnNJL2RL?=
 =?utf-8?B?WUwzcFR1dGZ0Y1ZsZjI2eWEvTWxvYUk1a0NXTEc0TGJybFdCckN3ZTVLZERt?=
 =?utf-8?B?WUhZRUgyOFFGUEFGdHFZWVFvdkthNWFWQjluSU84eTdlenJ6NHV5aUU0a2Zh?=
 =?utf-8?B?eXZFM2haenNEd1paMkdKUmNUakVBeXRSRVQ5RXBTRDBIZ2xVUG4xUElaMEsz?=
 =?utf-8?B?T2ozZ1RLdU1oTHRqT2txTnI4YzF2VktEVzJSTXNxT0JWTHlFTVBmM0hBci9D?=
 =?utf-8?B?OE5xVzV4VFRCWGlvUDFzdTZ3K3F1U2JvS2N3ZlBPM1M3VmF0TlUyQnhQazJM?=
 =?utf-8?B?RVdXbWlzNGdaK3RNd0xaZHR0M0UrMFBBaFpYZTV3RFYyK0ZjVG0vNk1ZcE5D?=
 =?utf-8?B?UVRZWHlBOGsrL0szZEdXbFFsM01GZ0cyS09rL1kwWlgva0hMcS9BNEYxNkQ1?=
 =?utf-8?B?MXRseGVGZm5VMlBhWDZZeXBLeEl2aVY4QllSZEgyNEt5OXlqb29NOFpZT2g4?=
 =?utf-8?B?bXg1czlVaktzWjFhZ2pFbUhNQzFkNVRZaDRzTmU0MDV4VFVJeUQrTXdYLzMx?=
 =?utf-8?Q?5CcfCeNfbTNIN2oV9WNERbPCk?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1562ef1a-c1bc-47b6-9ced-08dbda82bfc3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6064.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2023 02:32:10.3938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LpGSoYW8K/zg1OqkLyKmFbV0PTfG5UfyBWZJoJXMtaS9O7yKcORAln49tn9l8NEtkQPxHohrbKnHb7Y/c518SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5203
X-Proofpoint-GUID: rzJA1pnlOARjchR1BChF7eQKU15ZEkqg
X-Proofpoint-ORIG-GUID: 9D3MAsDtj3tB7eZtw15rbT6c0QZF2G-M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-31_10,2023-10-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=831 clxscore=1015 adultscore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2310240000 definitions=main-2311010020
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Nov 2023 02:32:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105809

On 9/30/23 05:35, Derek Straka wrote:
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>   .../python/python3-nacl_1.5.0.bb              | 25 +++++++++++++++++++
>   1 file changed, 25 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-nacl_1.5.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-nacl_1.5.0.bb b/meta-python/recipes-devtools/python/python3-nacl_1.5.0.bb
> new file mode 100644
> index 000000000..7d5292745
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-nacl_1.5.0.bb
> @@ -0,0 +1,25 @@
> +SUMMARY = "Python binding to the Networking and Cryptography (NaCl) library"
> +HOMEPAGE = "https://github.com/pyca/pynacl"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=8cc789b082b3d97e1ccc5261f8594d3f"
> +
> +PYPI_PACKAGE = "PyNaCl"

It is exactly the same recipe with name python3-nacl_1.5.0.bb in the 
same directory. And I suggest to
remove one of them and let the other one rprovides it if needed.

Regards,
Kai


> +
> +inherit pypi setuptools3
> +
> +SRC_URI[sha256sum] = "8ac7448f09ab85811607bdd21ec2464495ac8b7c66d146bf545b0f08fb9220ba"
> +
> +DEPENDS += "\
> +    libsodium \
> +    python3-cffi-native \
> +    python3-pip-native \
> +"
> +
> +RDEPENDS:${PN}:class-target += " \
> +    python3-cffi \
> +    python3-pycparser \
> +"
> +
> +export SODIUM_INSTALL = "system"
> +
> +BBCLASSEXTEND = "native"
> \ No newline at end of file
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105272): https://lists.openembedded.org/g/openembedded-devel/message/105272
> Mute This Topic: https://lists.openembedded.org/mt/101667089/3616933
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [kai.kang@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
Kai Kang
Wind River Linux


