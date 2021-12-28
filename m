Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A29D7C433F5
	for <webhook@archiver.kernel.org>; Tue, 28 Dec 2021 22:19:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.43829.1640729986061278874
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Dec 2021 14:19:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=jyykH1VC;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=8996d33521=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BSMAHCT018642
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Dec 2021 14:19:45 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=+mfwnahBQJtF4IJMB9P3q/BoRQVK7Ryuc3LVEsI32WY=;
 b=jyykH1VCRNuVZyos1al6Fk99wvUh4YFZibdCMwlZuutt14CYjKU0SrtcLf0duWOS9RZs
 O7C2uYbirM2ghHmGN9RAWBRqhpMtt5WS9vEcev4nKlqfI+rrsJlrg89dttExY0wumbaB
 dkJdKyM+jskHZLDOWpig1KGZ/ND5PSnQufnaH6DXS2i5J3WzFyGyZLJh17JjJ9WWkT3v
 LWTIaI1MIGMUydmi6qFHZ0Lkmzv9jM9Do2lbof4QQmW+WnJtOrGP77aIHx4sLjuWxOko
 JBowGovfe3vQoqFMnfDw+2Xe4MHjcWZaK+17uz2w93N58vTa37hZvGm1nHVl/+a8jM96 rw==
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d7m0c0nhg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Dec 2021 14:19:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OHYfY/SiMs5hX5BRQqgPBAntoPSnj1b4ijbNVLvLGeD0EHw2zxhi31K5D4sDgerlGFdhvauC9lD5GPKTGUvjotfuk3y88gtFqMLT/R0OoFpVUS80Y6GT39CEVsEd2BsS3fxHtRAlyNSolfa82XHv0MEthXzLcfrOP18Ab6QtIgDYi2Zevr9F7gJfVZJLS+pvsw09krh835Dgc8FOyNrwT4oE4Pz2Cmt/7VPBgKifAi2T2qxiJBTLymx3PNXVWZuDTfS9NNBj4HPvxTgsVmWLSJiV8FWE/K5b/DeO/N5unJi0lz/WTglB2BTSzec3vZxOT7d01vXyFDaxK7uu+Pc+Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+mfwnahBQJtF4IJMB9P3q/BoRQVK7Ryuc3LVEsI32WY=;
 b=oIMFLjazgFxALmGKIHK1aiv8VC42KwxvYUQEzPG9Jf1VbEDC67PDit8svhUfYCUbUpSUClomPoKzFFI3YtaFa9jUZ40HSh8r2x9E09oO6isVlNxiH0DPD7pxTVOGTZW3AWcZvgoOVJQ9R9pWaxKZbXnQaNTtUDIM9p6cHWocZxb+milkRCiD/K5W/xr38uhZt3iuQAZYgBAo2ZbLQWHg61kEdlpiylSlUiy9F54OoCpqnhJqGVxq/hWv5+gF95439cacCLux6hUuGMd39sRB/m/7gGVgHtjLBRs8hSc4gmA8Ad0uHUQj8IpuFAWP+2Nt6Irz+Htq40YZ47LRGQbaVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB2859.namprd11.prod.outlook.com (2603:10b6:5:c9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.21; Tue, 28 Dec
 2021 22:19:43 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::2df5:9c7b:a045:37d8]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::2df5:9c7b:a045:37d8%5]) with mapi id 15.20.4823.023; Tue, 28 Dec 2021
 22:19:43 +0000
Subject: Re: [oe] [hardknott][PATCH 0/4] Fix CVEs of xserver-xorg
To: kai <kai.kang@windriver.com>, openembedded-devel@lists.openembedded.org
References: <20211228092914.26470-1-kai.kang@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <fd12d906-d5a8-a42f-0462-ed4a96f56d2e@windriver.com>
Date: Tue, 28 Dec 2021 17:19:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211228092914.26470-1-kai.kang@windriver.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::29) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 433a577b-60a4-4a5c-b2fd-08d9ca5025af
X-MS-TrafficTypeDiagnostic: DM6PR11MB2859:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB2859D993076097F4316A1539F8439@DM6PR11MB2859.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:747;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SvB0A8PRDVVCKYo2y+/Tmw/W9aW9Qr2dkkuwLeU9gokDUxBtYo1dQxMmu84dE0Od/6U6tcoOv3ghwe37+NZhL2jVKhQsTdGGnN2mV7fU0x73PUfsgewBrOcjORtc0WUGM34TyE1J5q1OInU5dIxPib9EiKn1uhApUn3gRi1Qz2z1g9jLtQraobfybPo2DKFuq3+3uBchjjG8g9VWyxc99i6iCLfJ0fhd58A18GxpJxE7RIXxASO9DBObLfOrr8SJw/uYSGJCIfZDt/42bozXIfpSJIGzYulrRcWjppqhAg5Lg8SV8aNPnFkFg4pgWw4MNazralxDV/sCRrSo5M9TE7f5KpDchrFGTInMGrNelU7S5LLdfeFFgNRsoa7AN5yuKMF6u6wpRWlNYlrENbQs/eegKAo/2tQLMguZvBMJZYtdbIrYvqxPFK5JhSFm39SeSPQ2N5fNXgNT3NUbF0j+RqK2t8ZtuDcDlIRHX3ELofJCEAmmztpi6zcvbUMRe7vCZkK4vz+BDOTinQaufWXeA0nDfOSmN0Cg/pxUqgh+8Ugu2s31MRaiVbYSCwsggZ56F7fzKopsfkEhEBQeby4xETB/5X4OCSwenlNFLTLgZVjyFlkj05VwVfDiwaniQ9kBnqA2wBOdGK+XPNt5y365O7N4kHE5B63AXPs1qB+VArHcjduKNlgrx078RBf+fRZIF9qAVVJkC/JeIXFZuv4/8UuykmO9y4zO86VYOfsijYmcaDS9az3fkJuyp59IfgSJRUcDsGh93HTMAoiFyo/mRtt3hvt8nr2LbWkV+PZ8vRw81LZRmpwIg7EFRkwJxefBPgiztLRXLe+l0fofwtcjbj8tyytbt6EINpWzWJEJfD6XyeHxlsYpRqOdb59S/n8+glUa67TyFdzwuRO5b/d6sQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6512007)(966005)(6666004)(52116002)(508600001)(31696002)(186003)(31686004)(86362001)(36756003)(38350700002)(38100700002)(2616005)(26005)(2906002)(66946007)(66476007)(316002)(66556008)(8936002)(5660300002)(4001150100001)(6506007)(53546011)(8676002)(83380400001)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WUljczN2TVJrU2JyRGVYeGdXK1dQMUZQUHFKMmVSZXJub2tKVStlZjRwcitI?=
 =?utf-8?B?OXl5MWJQcEVWYzB6WUpQMmR1dHdUc1RvOXFEWVpTZDFsV052SGhZN0VQajJT?=
 =?utf-8?B?WEN3OXhBd2tRRWREV0NTckt3Q1NIMVdTZE44M1lrVHJiZ1FUOFlOOGNBRCtZ?=
 =?utf-8?B?aVRSUTJ5aGNmalNveDRCNWhWTTkrQmg3cXFneXlFQmFjT2M5QVdkVHh0eGQv?=
 =?utf-8?B?dU4zWlFMdEpZajdsYWNPa2dmZ1lNK3BWdEZQcG82R216MVJCYWdYTjFCdGJm?=
 =?utf-8?B?aFVmTk9VNHhXeTVoTDY0U2dZRjBqOXV6Q2psNkxBWjV4QllHeFV0WXdMNlRp?=
 =?utf-8?B?cmNDM2dTb1pqYkxFWjNkdyt5Yy9yRVFGbkJzREZUOGRFY1h3Q1EvaFdBWUNu?=
 =?utf-8?B?MXhrcnl3SExoU3lRZEhieDZSLzcwUnhzRGFNeE51UmEvS1FQNG9WS1RGeS9S?=
 =?utf-8?B?a0RZQVNhTlRDODV3ZjljbzhyaEtKalZUc25yVndHNW1oajNNSjIvK3NqR1Qr?=
 =?utf-8?B?NHRibTQ2bjEzZnBlMTNXTHBpbUs1ckh5R2Y0SmFOZ3FiNm9BSmY5STJjbFNX?=
 =?utf-8?B?aWlxSnltaGJuKzRqSG9kT09oZXVrVFQ1dXh3NTlPQnI3ZUw1Tjg5NW80MzlJ?=
 =?utf-8?B?dFQ5S0lVTHQ5WWY0Tm4rK1dDQWtkUEZQR0IxUitjSzVJeWJ5VjFQNXZJZEVJ?=
 =?utf-8?B?Y2hKem1xNXNuSHVTNCtldDdsSzdwenBVSmhNTDI3dTBySmRuTVpwbXVRU005?=
 =?utf-8?B?ODYrck0raXBYaHd4VjN1ZlNiZytmT2VacjJadWt2L3ZuV2RTcWtzRnRTWkZC?=
 =?utf-8?B?MUo1R3lRYXZUd2xwL3NSOW15bkpGakFZTUJrMUxTSXd4M0JQdGFnY2J1TEFE?=
 =?utf-8?B?NzV1WFJLWXdsbC9MWlNGVWduWkxhMVBqWGJ0L3YrRnJoVDNPbFJud1Y2R2lm?=
 =?utf-8?B?VnJGMFFMY09RVTkrUHdWNnQvOFBlUzhLelBvdy9TY3pNMEpic2Rpa1dhWEo2?=
 =?utf-8?B?UnRSdlNUUm96bmtsdzR2c20zUjY2NU9qNTdza3BPeXYvMnZMd3dGU0MvbE81?=
 =?utf-8?B?M2crRkoyRTZFUkQ1cFZhb2hOeFZRbzFBK0lRaHZ3OFlxZ2ZSbCtod0tRejBq?=
 =?utf-8?B?ZkI1K0FUUzVlS3Z2MUUrakpKejFURWRseWVFbkd6MWRWQ3lWV1VrWUxDMEN1?=
 =?utf-8?B?eG5jZTFZcWRWY2JEbGZWWE9rellMNW9QWXJ5OXZUVzZrUTRlc3dvQTFzcnU1?=
 =?utf-8?B?SEpmNDdnUnNOSHQwVkQ5MWJtNWdZUklhQUIxZUFpTUpJTzRuSGUzMVMzSk1N?=
 =?utf-8?B?OFRhUFpUSFZqd2huWEJjZ0V1WHdZeFIrNTFkdWJMY2tOTmFhZ2hKL2JMT0Rk?=
 =?utf-8?B?MW1LekVUU0c3RWF5TjZhdkVnSS83WU0zK0R2amNwMU9ybHduQUhCMFJzanFH?=
 =?utf-8?B?WVVtTnFGVVYvSzNnZWpUcUt6N1JQQ1IvL1pqcDQ5NmxoZlFLVWVZMFVubE5D?=
 =?utf-8?B?MnpWakg2WE1BOFZuTmlaaWdmWlRzVEFRU0ZITkpQN0xONHVQVXZpTWlBUTRL?=
 =?utf-8?B?cURhcG00MDFTajRLeHRDQzUwSHBCUHNsNFVLUCt5eXlYSWU1VVA5dVRvU0NU?=
 =?utf-8?B?RUVkRzhXSlNmTzJ5cHVEczhkek5JKzZ4WkFqc24rZkJmTXdXSERRUWoxTXdr?=
 =?utf-8?B?WW8yNllJWUk1c090bytGMnhFdXRORFEyUW4wMVZBdWNYaklOY0NTZXBZTllT?=
 =?utf-8?B?T0ZoWDJkUnZtaDhlV3lWRWwzdmJVdC9QMi9NU0IxbVdaL2liMEVLNzgyMkFU?=
 =?utf-8?B?RkxFU3ZkTmNpZFVGSnhmYzRjbFlZdUlOSklmb2ZzUGgxM284dmFMVDEvc0o5?=
 =?utf-8?B?Y2x4emxBYkx5czdZVU9wWkZCVFhoVndKTVM2Zm5RL1gxSFBHVERxMWh2SVVV?=
 =?utf-8?B?NkZUYVcyQzE3akZDK0hPZ00xb2lDcXkrYVd1aG9LdkpDUnhRWERsbVVFZHpp?=
 =?utf-8?B?V0sxeEhLaldVRG0wOEwxbTNtZlhQZUpmRGU3OEQ4WnJSNGk4c0Z2NFBaVEc0?=
 =?utf-8?B?RlhwZXVVajNuTnFvRzBQSVY4bWtldGlPRUJpdGhEY09Sekp4N1ZOZzRjUXh1?=
 =?utf-8?B?QWppUVFYOW9BZjVXZ2R0STdjVFVNYlpzcWErZ1ovakNwcmJ0UG55UEwvZ3k1?=
 =?utf-8?B?R3ZJRkliN2tRamJSR0ZvSFlMa2NBNUk3UC9oZ1FyNWlRY0lHNEJ1c0RxZnJ4?=
 =?utf-8?B?bkVXNlBLOXg0TXR5dEZ4RmlMNEVRPT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 433a577b-60a4-4a5c-b2fd-08d9ca5025af
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2021 22:19:43.1070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 PVdDUJo+Asn7jq/+uUXDjRk+ou3507sMDGv+CGIfPWyLSG7yeDqs2yV7U/aPfF5beOQO/4Yw1nWt+3mn/AN3QpGmxkfA/5kw3oF4K+nDUso=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2859
X-Proofpoint-GUID: PiooBaHOqE50vPJXUzyeU8xHRwAchmOo
X-Proofpoint-ORIG-GUID: PiooBaHOqE50vPJXUzyeU8xHRwAchmOo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-28_12,2021-12-28_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 phishscore=0 clxscore=1011 priorityscore=1501 spamscore=0
 malwarescore=0 mlxscore=0 impostorscore=0 suspectscore=0 mlxlogscore=547
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112280097
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Dec 2021 22:19:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94557

On 2021-12-28 4:29 a.m., kai wrote:
> From: Kai Kang <kai.kang@windriver.com>
> 
> 
> Kai Kang (4):
>    xserver-xorg: fix CVE-2021-4008
>    xserver-xorg: fix CVE-2021-4009
>    xserver-xorg: fix CVE-2021-4010
>    xserver-xorg: fix CVE-2021-4011
> 
>   .../xserver-xorg/CVE-2021-4008.patch          | 59 +++++++++++++++++++
>   .../xserver-xorg/CVE-2021-4009.patch          | 50 ++++++++++++++++
>   .../xserver-xorg/CVE-2021-4010.patch          | 39 ++++++++++++
>   .../xserver-xorg/CVE-2021-4011.patch          | 40 +++++++++++++
>   .../xorg-xserver/xserver-xorg_1.20.10.bb      |  4 ++
>   5 files changed, 192 insertions(+)
>   create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2021-4008.patch

Oops, wrong list, please re-send to:
openembedded-core@lists.openembedded.org

../Randy

>   create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2021-4009.patch
>   create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2021-4010.patch
>   create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2021-4011.patch
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94549): https://lists.openembedded.org/g/openembedded-devel/message/94549
> Mute This Topic: https://lists.openembedded.org/mt/87992955/3616765
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
# Randy MacLeod
# Wind River Linux


