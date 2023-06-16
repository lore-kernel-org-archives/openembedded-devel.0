Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F821EB64DB
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 10:28:42 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.5234.1686911312050837613
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Jun 2023 03:28:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=L8NSON5x;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5531bc8c46=narpat.mali@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35G9eeUe003264
	for <openembedded-devel@lists.openembedded.org>; Fri, 16 Jun 2023 03:28:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=xta/rPPLHrKxfRm66kmDrlEVJxRKpgFT9XipGuXJj18=;
 b=L8NSON5xM8uDkvPdpeBE9RgR/EcrqJ495w2URujrqDEL1iMFne1YrcUz3PY+ArGFvNx/
 fWLH1aUFlkpvlUcKsjbzPzoKHiIwg0ff6M2ch2vT03frfkOP+HMgZeNOrRzhQeTo+phw
 YC6qMni71xzDBlQqqcrENS84R+nFBQ3Jg35YRgJX4bQKTIAQRt3+6rhLeGxFkNjAqxNH
 uugn18QDxUEA4d4NCsY5Zh/msUhnivmUVco73QWUBaSmsTC2XFh+lwNXBMvvhTrCd2Bl
 oEJbjaEhCsTpYS75e6GLLq9c+uoZ86zwHHb+TflxfgZ4tGPmPDGE81NIUWpAIvtZCsOn Hg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r4rphnqjg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 16 Jun 2023 03:28:31 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35GAL9Bp015555
	for <openembedded-devel@lists.openembedded.org>; Fri, 16 Jun 2023 03:28:30 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2102.outbound.protection.outlook.com [104.47.70.102])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r4rphnqje-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 03:28:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CMXZKRqmuvbLNzbbrE9iuGUlPzAc09CzecXAb9KHWJLZKInX4AMTHQpQ8hFeHOqfka36cH2bB+dbraDfIauX2PHNwU1+ajoA/1BK27bA12n068OCSF048OHg5wyoniwJrKEuXMPLiHvpfQ0cRB695r2mP4AQVN91vG0tUhb/nplje48SOJcZ0SlpmWHklSflAzzEOsMoVZIWpxi1pkmXtMzwSVFthSdDbFDJjIfBrMGN09RzEGs4Vlf9ZpSVIrK5Wmus9vmU58sDIjtyK2rBxLFj4TcNIyragdhcyxoizGiKFIpptQmxywejisD/xmwXfjdVtj44VI3TilG0/MB09Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xta/rPPLHrKxfRm66kmDrlEVJxRKpgFT9XipGuXJj18=;
 b=BC4NSoE0cSox98T22rbq/JTjXhH/4gKZbGHcExyY+EIqTcoKhLy2F5pBVDSLaWPVOHt6Q7Pdpda1d6EwApO+NGLM+NiqtlQe331K/2NSHLhtf/nAIQm9hy/Ws2gAkQnjn/BQ9BJ0/REYZWBlx0+1sm0OExyEZr0id4p9GuL0qLRels/FGA7lh3M/hENeEk25NMiGp3UKVxmmOdNDmqT5piMqA2IPxzlB5me1jUNM/EIWXmztxkkzf/5JmLcmy5xs/ciledoJEDrcOUFa8b2jT56iwP7ISHRz6Y2c204nEehyurf7MU58M6l06L6pG0tLltpq0c72zuKfNllS6bCokg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5550.namprd11.prod.outlook.com (2603:10b6:5:38b::24)
 by CY8PR11MB7746.namprd11.prod.outlook.com (2603:10b6:930:86::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.29; Fri, 16 Jun
 2023 10:28:27 +0000
Received: from DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::deef:c312:c6d2:187e]) by DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::deef:c312:c6d2:187e%6]) with mapi id 15.20.6500.025; Fri, 16 Jun 2023
 10:28:27 +0000
Message-ID: <dadc87ef-e15a-444e-6a32-b4fa85be7313@windriver.com>
Date: Fri, 16 Jun 2023 15:56:02 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [oe] [meta-python][kirkstone][PATCH 1/1] python3-django: fix for
 CVE-2023-31047
Content-Language: en-US
To: "Sanjaykumar kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at Cisco)"
 <schitrod@cisco.com>,
        "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
Cc: "hari.gpillai@windriver.com" <hari.gpillai@windriver.com>,
        "akuster808@gmail.com" <akuster808@gmail.com>
References: <1762B546620A9F5C.16338@lists.openembedded.org>
 <9f56042a-37ef-79d1-e3ad-9e9f6a784663@windriver.com>
 <SJ0PR11MB6717E86F1C01BB5C94039FE2DC5BA@SJ0PR11MB6717.namprd11.prod.outlook.com>
From: "Mali, Narpat" <narpat.mali@windriver.com>
In-Reply-To: <SJ0PR11MB6717E86F1C01BB5C94039FE2DC5BA@SJ0PR11MB6717.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: PN0PR01CA0025.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4e::13) To DM4PR11MB5550.namprd11.prod.outlook.com
 (2603:10b6:5:38b::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5550:EE_|CY8PR11MB7746:EE_
X-MS-Office365-Filtering-Correlation-Id: 86928d77-c27a-48dc-2e25-08db6e546bfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	s8t9X+68N9iYaJ2fq4QRkTCaFyx+9KCNes0D8AEbd0J7OPCBfgpbaxjOOFp4WyS05aaqBFPes8d5vgAd/1vFdG6FE/iLFelYTMdqH8vC8BIWhkoIm2WjKEHwlcT2jKj41XXbcO0kZ8M9Eg8/Z96aGr3HquhhOdjg92XT/CkQS44//eJeGKsVR2f3CeENes7d+IPqcvMHab+GHt2dsIGZIYpdYFoCWtkImFWlCXgSVHG6om6TQS9RPRRR04Bivk9dCAwQJgIYC076zbyk04dbbxg2wHc49yjWVCViff74ougdjO/5hGiqgJv+o0vlyUtOYuH1gnvSdfvqZ3WLmlPZQRMC3j0KXm9YlZbJWV8GDE7TIOJfYtw6AMF+p/2tNAnKZ4NapR854Tuumu0iqBm3V0kztT45hvpSLodqrxezAokU/J2gItXpEffQsBS4wkQc9OZta7q+nagVSz3/PRrB2iIyZcLllkMdJSSAYx3vRUwkzODeR5O8pSrmPngAGxcE3aCvKAEotBeSuKzd7RigJyrNO39eYYc+90MyAylwPtUdfo0cFDy/xcnpyP9I/jz3XUAKgBiHbBI8qJbclD/d+xWsIH3aop38GdteoskEMx1ZXdaG3Zi+U9pMF9A7OxObkF9srtkVii62/6iZd4IyRT0XAHRf4cj13R0uaY+6vaSbVJYFO4q/740M3DAbS+Xi
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5550.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(366004)(136003)(396003)(376002)(346002)(451199021)(83380400001)(66476007)(66556008)(66946007)(6512007)(53546011)(6506007)(6486002)(6666004)(966005)(478600001)(2906002)(2616005)(110136005)(186003)(54906003)(86362001)(4326008)(30864003)(8936002)(8676002)(31696002)(36756003)(5660300002)(41300700001)(38100700002)(316002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MjFhdHRrNEtoSVprSE9STU5XaGZlZTFBOGpBU3BkQThGak0yckdiQXVYSTdS?=
 =?utf-8?B?RDZmVzR2ZVhQaUN1RVZwbVgwQ1dSdG5tU1JZTHo2b1JESi9HZElhUFpFR3pR?=
 =?utf-8?B?blhYZkcwdEZOck9HK1U2alFnKzI0VndlRVZtbXRORlI2TlN1Q2ZIRGY3dk9W?=
 =?utf-8?B?MXF5LzhXdHQrZFNETmJlYVlDYi9CelMrNnhmN1VNNThMckhtMU9NbzgwQTBm?=
 =?utf-8?B?elgzVm95L3lMNmExSGRhTkZmV3pySFhkdEN4c2lTOUtDTWpoVGc5bEVjOTlk?=
 =?utf-8?B?QU8xZ3dmVERIaVhreHczMWVpTnVseVFzYzlPdGp2aWt2NmwzNE9mOXJIeWpN?=
 =?utf-8?B?UHdZV3ZKelFtN2NiRDZCU0pjWEQwR2pHa1lRMGtMS3hXcncyaW9mMGNoK2hu?=
 =?utf-8?B?MVhQMkhTU1RJNzRyTW90V0UyOTNaMFR3MTRJWTRlNGZ3Z1NuT0JGY2srYjFx?=
 =?utf-8?B?c2U5bHNZV2lLTGkxMllQOXdWMGJzenJ2VFMzWDRIazI3NjJNSVhNbmdnbTQr?=
 =?utf-8?B?NkpJUGRkbzk5bU5XOUhRYVJMRVBNMmQwOVhIamRxVGF6NUVMcCtQMk1oY25C?=
 =?utf-8?B?bnBSRFJBTEZjZHZ5L1lHSzk2RWM3TjZDSjJmN3N0OFdLZ2ZPTTZYZVZkeDRx?=
 =?utf-8?B?bFZ5ME5neXkxU20vN3ZydTZhNFVadnRFalpPWElzWU5MREFuejdGQnZONUpC?=
 =?utf-8?B?SktRQlRYR3JvckVXSjc4QWFLZnc5QVN6U0VHUm5DQW4vQmdyNDNWcHVqS0lj?=
 =?utf-8?B?YmVPdy9WZ1hiOG1vMXZkMzFXMWRYZUVjYytRU2pkSmQyNVpZL3BTWFZMeEJU?=
 =?utf-8?B?UWJ0dE9DNjFFbWh4N1phSE5iZXRIaEVKem10eVVuT1Vlcm5KQS82cFpaYkhy?=
 =?utf-8?B?SVhMS3JobkY4dy9jTzBrTC8rQnR4ck1icUFlVFZIMzg3OTgzU2Z4Sm5oWmZJ?=
 =?utf-8?B?WEF1NzI3N2NTaTI5L0d6RHdNNkxPZ0QweHVkQnBLMnVncDFzR1daKzM2UFN1?=
 =?utf-8?B?TS9WSFV0bTNTSVFYY3Q3MEhVME9UVzkyU081VjJDVUt3aWIwbnF0OHAwbTZY?=
 =?utf-8?B?QnM2b1ZuTUZBa2NjWFB3TWZpczJVTDBUQVdQL2UvTHZQa0RxUnV2ZGlydy9M?=
 =?utf-8?B?N3FoTGg5ZFY0bndkci94dC9jcnQvV3cwUlREcG1uVzlNUG9xYmovaHI0emhx?=
 =?utf-8?B?MlRoNHNqT0Fua2UwbDBFenFYTGorZFFvUnh6eHJHUGZmRjNOYXphLzMzd1dJ?=
 =?utf-8?B?eXhabm91TjQzNk9qUzlES2Rra3FJSjgreWZxb3V1dVVtd1I2YkQ5dTVUdnMv?=
 =?utf-8?B?TU1ZSHNSWFd3Z29ObldNcWxDU2FSK2JFWUxnMnZUbjNjSGp5Y1BCUUh6MTdF?=
 =?utf-8?B?S29zK3ZPYmpkbDNOcGE1ZC9UcFFJazQ3QzdWdVpkRiswWDNIbks4dmszbEhN?=
 =?utf-8?B?Tnk0ZSthTzRNTzhSOGEyblg3bjBxSVVUSFdyMTN5OUZmeWRTWTVOOUxISDQ1?=
 =?utf-8?B?WWQ5NWtYK0djUEw4eGs5WlB3eHVxVHBmOXdZU1p6djIxNlJZeXhRQmg4RDBv?=
 =?utf-8?B?QnNKYk8waGRsUTlOOFlHQWowUUE4YUZpeS9aZjdyK3VmL2pqekRMK00rOHJr?=
 =?utf-8?B?VTMyeEpCOXBpY0QrZkdBcjBvaEJGRFdGN2g0UithTWpYTm94MXhVTkV0aG14?=
 =?utf-8?B?VzlFU25iSTFYMHF2VjRpcmtCalR2bWd2dmVZb29zaUFaV0NEdE9JczBiT0Zq?=
 =?utf-8?B?RkgzUVIydFRidmE5ekZmeDQraGozd3Z5Z0dvUGlMT2JEb0hscnJsTisyM1RK?=
 =?utf-8?B?Sm4rS3RoK0Z5bkhWaGpTcW8xVFppa2FsVzRjc2lGTFBDa0R2WFgzR2tiWVM1?=
 =?utf-8?B?ZFRjS3RKZWhaeEVWZGJiWnArb1NTNzVvN3lLZGZweTltSzZqUjlLNHNVcmph?=
 =?utf-8?B?QW5ab0JnL2QrUHlUcks3bzRwOFljK29NdU9VNTdxejZHVm03TUQyYW5hU2dr?=
 =?utf-8?B?clFrY084Y3Q1STRTdk11WkQ3NmlqWUMvQ29uZXZra2JvcUZIcE1OSndQeElz?=
 =?utf-8?B?Ty9UcWNNVU5zS3ZkbFZPY2hUYzNEbDNmU2N4VVl3RDVuRklrbGJBKzN6bGtC?=
 =?utf-8?B?RmxadU5ndnR6cTJjRDdsbmt4clExTHlsekw4U0l3ZFJwVk1zYmpVM09ydkpM?=
 =?utf-8?B?OTN6d1k0VDIzakxBNkdIY29lZHk2c0Z0OEpORUgyZGFuQVJEb3FkbGI3dTdm?=
 =?utf-8?B?M2hncU5wdE5IYStEUXlwNzF2TjBnPT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86928d77-c27a-48dc-2e25-08db6e546bfa
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5550.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 10:28:27.2623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 84MFsZ4xeDB3AA2TcX4/JhP7Dpom2EyJj1rHlLuZ2JTBPQU8i/qhbDqEcgmJeRmLsVEwGeVlYoo1f8vC5HdUKKqfpLarOrVN8BLKlIUwPME=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7746
X-Proofpoint-ORIG-GUID: nj28dkBcoOAniO8u5oKDNCfCiaErkn_g
X-Proofpoint-GUID: Fgm6QAqQkmwU-T6E2_YF1iNEvOOc2irR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-16_06,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306160094
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 35G9eeUe003264
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Jun 2023 10:28:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103337

On 16-06-2023 00:55, Sanjaykumar kantibhai Chitroda -X (schitrod -=20
E-INFO CHIPS INC at Cisco) wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> ++ Armin
>
> Hi Narpat,
>
> FYI,
>
> meta-oe layer kirkstone branch python3-django package is already bump t=
o 4.2.1 version with following commit:
> https://github.com/openembedded/meta-openembedded/commit/84782522d145f5=
5e4076699c4bb00bcb4cec98da
>
> python3-django version 4.2.1 https://github.com/django/django/commits/4=
.2.1
> has fix available for CVE-2023-31047: https://github.com/django/django/=
commit/21b1b1fc03e5f9e9f8c977ee6e35618dd3b353dd

Hi Sanjay,

Thank you for your time but, I am already aware about this above version=20
upgrade since, myself only have sent this upgrade request.

FYI,

There are 3 versions of python3-django recipe in meta-oe/kirkstone.

=E2=9D=AF fd django_
meta-python/recipes-devtools/python/python3-django_2.2.28.bb
meta-python/recipes-devtools/python/python3-django_3.2.12.bb
meta-python/recipes-devtools/python/python3-django_4.0.2.bb

The python3-django_2.2.28.bb is the default version out of these and=20
python3-django_3.2.12.bb & python3-django_4.0.2.bb are also available=20
which can be used with PREFERRED_VERSION variable in conf/local.conf.

The CVE-2023-31047 can be fixed with the below options in all these=20
above versions.

1. Backport the fix on python3-django_2.2.28.bb --> Patch sent as=20
"python3-django: fix for CVE-2023-31047"

2. Upgrade the python3-django_3.2.12.bb to python3-django_3.2.19.bb -->=20
Patch sent as "python3-django: upgrade 3.2.12 -> 3.2.19"

3. Upgrade the python3-django_4.0.2.bb to python3-django_4.2.1.bb --> Don=
e.

Please let me know, If you still have any query for the same.

Best Regards,

Narpat

>
> If you still have any query for the same: you can connect with Armin (a=
kuster808@gmail.com).
>
> Thanks,
> Sanjay
>
> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lis=
ts.openembedded.org> On Behalf Of Narpat Mali via lists.openembedded.org
> Sent: Thursday, June 15, 2023 8:29 PM
> To: openembedded-devel@lists.openembedded.org
> Cc: hari.gpillai@windriver.com
> Subject: Re: [oe] [meta-python][kirkstone][PATCH 1/1] python3-django: f=
ix for CVE-2023-31047
>
> Reminder.
>
> On 26-05-2023 19:11, Narpat Mali via lists.openembedded.org wrote:
>> From: Narpat Mali <narpat.mali@windriver.com>
>>
>> In Django 3.2 before 3.2.19, 4.x before 4.1.9, and 4.2 before 4.2.1,
>> it was possible to bypass validation when using one form field to
>> upload multiple files. This multiple upload has never been supported
>> by forms.FileField or forms.ImageField (only the last uploaded file
>> was validated). However, Django's "Uploading multiple files"
>> documentation suggested otherwise.
>>
>> Since, there is no ptest available for python3-django so have not
>> tested the patch changes at runtime.
>>
>> Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
>> ---
>>    .../python3-django/CVE-2023-31047.patch       | 352 +++++++++++++++=
+++
>>    .../python/python3-django_2.2.28.bb           |   2 +
>>    2 files changed, 354 insertions(+)
>>    create mode 100644
>> meta-python/recipes-devtools/python/python3-django/CVE-2023-31047.patc
>> h
>>
>> diff --git
>> a/meta-python/recipes-devtools/python/python3-django/CVE-2023-31047.pa
>> tch
>> b/meta-python/recipes-devtools/python/python3-django/CVE-2023-31047.pa
>> tch
>> new file mode 100644
>> index 0000000000..ab29a2ed97
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python3-django/CVE-2023-3104
>> +++ 7.patch
>> @@ -0,0 +1,352 @@
>> +From fd3215dec5d50aa1f09cb1f8eba193524e7379f3 Mon Sep 17 00:00:00
>> +2001
>> +From: Mariusz Felisiak <felisiak.mariusz@gmail.com>
>> +Date: Thu, 25 May 2023 14:49:15 +0000
>> +Subject: [PATCH] Fixed CVE-2023-31047, Fixed #31710
>> +
>> +-- Prevented potential bypass of validation when uploading multiple f=
iles using one form field.
>> +
>> +Thanks Moataz Al-Sharida and nawaik for reports.
>> +
>> +Co-authored-by: Shai Berger <shai@platonix.com>
>> +Co-authored-by: nessita <124304+nessita@users.noreply.github.com>
>> +
>> +CVE: CVE-2023-31047
>> +
>> +Upstream-Status: Backport
>> +[https://github.com/django/django/commit/fb4c55d9ec4bb812a7fb91fa2051
>> +0d91645e411b]
>> +
>> +Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
>> +---
>> + django/forms/widgets.py                       | 26 ++++++-
>> + docs/releases/2.2.28.txt                      | 18 +++++
>> + docs/topics/http/file-uploads.txt             | 65 ++++++++++++++++-=
-
>> + .../forms_tests/field_tests/test_filefield.py | 68 +++++++++++++++++=
+-
>> + .../widget_tests/test_clearablefileinput.py   |  5 ++
>> + .../widget_tests/test_fileinput.py            | 44 ++++++++++++
>> + 6 files changed, 218 insertions(+), 8 deletions(-)
>> +
>> +diff --git a/django/forms/widgets.py b/django/forms/widgets.py index
>> +e37036c..d0cc131 100644
>> +--- a/django/forms/widgets.py
>> ++++ b/django/forms/widgets.py
>> +@@ -372,17 +372,41 @@ class MultipleHiddenInput(HiddenInput):
>> +
>> +
>> + class FileInput(Input):
>> ++    allow_multiple_selected =3D False
>> +     input_type =3D 'file'
>> +     needs_multipart_form =3D True
>> +     template_name =3D 'django/forms/widgets/file.html'
>> +
>> ++    def __init__(self, attrs=3DNone):
>> ++        if (
>> ++            attrs is not None
>> ++            and not self.allow_multiple_selected
>> ++            and attrs.get("multiple", False)
>> ++        ):
>> ++            raise ValueError(
>> ++                "%s doesn't support uploading multiple files."
>> ++                % self.__class__.__qualname__
>> ++            )
>> ++        if self.allow_multiple_selected:
>> ++            if attrs is None:
>> ++                attrs =3D {"multiple": True}
>> ++            else:
>> ++                attrs.setdefault("multiple", True)
>> ++        super().__init__(attrs)
>> ++
>> +     def format_value(self, value):
>> +         """File input never renders a value."""
>> +         return
>> +
>> +     def value_from_datadict(self, data, files, name):
>> +         "File widgets take data from FILES, not POST"
>> +-        return files.get(name)
>> ++        getter =3D files.get
>> ++        if self.allow_multiple_selected:
>> ++            try:
>> ++                getter =3D files.getlist
>> ++            except AttributeError:
>> ++                pass
>> ++        return getter(name)
>> +
>> +     def value_omitted_from_data(self, data, files, name):
>> +         return name not in files
>> +diff --git a/docs/releases/2.2.28.txt b/docs/releases/2.2.28.txt
>> +index 43270fc..854c6b0 100644
>> +--- a/docs/releases/2.2.28.txt
>> ++++ b/docs/releases/2.2.28.txt
>> +@@ -20,3 +20,21 @@ CVE-2022-28347: Potential SQL injection via
>> +``QuerySet.explain(**options)`` on P  :meth:`.QuerySet.explain`
>> +method was subject to SQL injection in option names,  using a
>> +suitably crafted dictionary, with dictionary expansion, as the  ``**o=
ptions`` argument.
>> ++
>> ++Backporting the CVE-2023-31047 fix on Django 2.2.28.
>> ++
>> ++CVE-2023-31047: Potential bypass of validation when uploading
>> ++multiple files using one form field
>> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
>> ++
>> ++Uploading multiple files using one form field has never been
>> ++supported by :class:`.forms.FileField` or :class:`.forms.ImageField`
>> ++as only the last uploaded file was validated. Unfortunately,
>> ++:ref:`uploading_multiple_files` topic suggested otherwise.
>> ++
>> ++In order to avoid the vulnerability,
>> ++:class:`~django.forms.ClearableFileInput`
>> ++and :class:`~django.forms.FileInput` form widgets now raise
>> ++``ValueError`` when the ``multiple`` HTML attribute is set on them.
>> ++To prevent the exception and keep the old behavior, set ``allow_mult=
iple_selected`` to ``True``.
>> ++
>> ++For more details on using the new attribute and handling of multiple
>> ++files through a single field, see :ref:`uploading_multiple_files`.
>> +diff --git a/docs/topics/http/file-uploads.txt
>> +b/docs/topics/http/file-uploads.txt
>> +index 21a6f06..c1ffb80 100644
>> +--- a/docs/topics/http/file-uploads.txt
>> ++++ b/docs/topics/http/file-uploads.txt
>> +@@ -127,19 +127,54 @@ field in the model::
>> +             form =3D UploadFileForm()
>> +         return render(request, 'upload.html', {'form': form})
>> +
>> ++.. _uploading_multiple_files:
>> ++
>> + Uploading multiple files
>> + ------------------------
>> +
>> +-If you want to upload multiple files using one form field, set the
>> +``multiple`` -HTML attribute of field's widget:
>> ++..
>> ++    Tests in tests.forms_tests.field_tests.test_filefield.MultipleFi=
leFieldTest
>> ++    should be updated after any changes in the following snippets.
>> ++
>> ++If you want to upload multiple files using one form field, create a
>> ++subclass of the field's widget and set the
>> ++``allow_multiple_selected`` attribute on it to ``True``.
>> ++
>> ++In order for such files to be all validated by your form (and have
>> ++the value of the field include them all), you will also have to
>> ++subclass ``FileField``. See below for an example.
>> ++
>> ++.. admonition:: Multiple file field
>> ++
>> ++    Django is likely to have a proper multiple file field support at=
 some point
>> ++    in the future.
>> +
>> + .. code-block:: python
>> +     :caption: forms.py
>> +
>> +     from django import forms
>> +
>> ++
>> ++    class MultipleFileInput(forms.ClearableFileInput):
>> ++        allow_multiple_selected =3D True
>> ++
>> ++
>> ++    class MultipleFileField(forms.FileField):
>> ++        def __init__(self, *args, **kwargs):
>> ++            kwargs.setdefault("widget", MultipleFileInput())
>> ++            super().__init__(*args, **kwargs)
>> ++
>> ++        def clean(self, data, initial=3DNone):
>> ++            single_file_clean =3D super().clean
>> ++            if isinstance(data, (list, tuple)):
>> ++                result =3D [single_file_clean(d, initial) for d in d=
ata]
>> ++            else:
>> ++                result =3D single_file_clean(data, initial)
>> ++            return result
>> ++
>> ++
>> +     class FileFieldForm(forms.Form):
>> +-        file_field =3D forms.FileField(widget=3Dforms.ClearableFileI=
nput(attrs=3D{'multiple': True}))
>> ++        file_field =3D MultipleFileField()
>> +
>> + Then override the ``post`` method of your
>> +:class:`~django.views.generic.edit.FormView` subclass to handle
>> +multiple file @@ -159,14 +194,32 @@ uploads:
>> +         def post(self, request, *args, **kwargs):
>> +             form_class =3D self.get_form_class()
>> +             form =3D self.get_form(form_class)
>> +-            files =3D request.FILES.getlist('file_field')
>> +             if form.is_valid():
>> +-                for f in files:
>> +-                    ...  # Do something with each file.
>> +                 return self.form_valid(form)
>> +             else:
>> +                 return self.form_invalid(form)
>> +
>> ++        def form_valid(self, form):
>> ++            files =3D form.cleaned_data["file_field"]
>> ++            for f in files:
>> ++                ...  # Do something with each file.
>> ++            return super().form_valid()
>> ++
>> ++.. warning::
>> ++
>> ++   This will allow you to handle multiple files at the form level on=
ly. Be
>> ++   aware that you cannot use it to put multiple files on a single mo=
del
>> ++   instance (in a single field), for example, even if the custom wid=
get is used
>> ++   with a form field related to a model ``FileField``.
>> ++
>> ++.. backportedfix:: 2.2.28
>> ++
>> ++   In previous versions, there was no support for the ``allow_multip=
le_selected``
>> ++   class attribute, and users were advised to create the widget with=
 the HTML
>> ++   attribute ``multiple`` set through the ``attrs`` argument. Howeve=
r, this
>> ++   caused validation of the form field to be applied only to the las=
t file
>> ++   submitted, which could have adverse security implications.
>> ++
>> + Upload Handlers
>> + =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +diff --git a/tests/forms_tests/field_tests/test_filefield.py
>> +b/tests/forms_tests/field_tests/test_filefield.py
>> +index 3357444..ba559ee 100644
>> +--- a/tests/forms_tests/field_tests/test_filefield.py
>> ++++ b/tests/forms_tests/field_tests/test_filefield.py
>> +@@ -1,7 +1,8 @@
>> + import pickle
>> +
>> + from django.core.files.uploadedfile import SimpleUploadedFile -from
>> +django.forms import FileField, ValidationError
>> ++from django.core.validators import validate_image_file_extension
>> ++from django.forms import FileField, FileInput, ValidationError
>> + from django.test import SimpleTestCase
>> +
>> +
>> +@@ -82,3 +83,68 @@ class FileFieldTest(SimpleTestCase):
>> +
>> +     def test_file_picklable(self):
>> +
>> + self.assertIsInstance(pickle.loads(pickle.dumps(FileField())),
>> + FileField)
>> ++
>> ++
>> ++class MultipleFileInput(FileInput):
>> ++    allow_multiple_selected =3D True
>> ++
>> ++
>> ++class MultipleFileField(FileField):
>> ++    def __init__(self, *args, **kwargs):
>> ++        kwargs.setdefault("widget", MultipleFileInput())
>> ++        super().__init__(*args, **kwargs)
>> ++
>> ++    def clean(self, data, initial=3DNone):
>> ++        single_file_clean =3D super().clean
>> ++        if isinstance(data, (list, tuple)):
>> ++            result =3D [single_file_clean(d, initial) for d in data]
>> ++        else:
>> ++            result =3D single_file_clean(data, initial)
>> ++        return result
>> ++
>> ++
>> ++class MultipleFileFieldTest(SimpleTestCase):
>> ++    def test_file_multiple(self):
>> ++        f =3D MultipleFileField()
>> ++        files =3D [
>> ++            SimpleUploadedFile("name1", b"Content 1"),
>> ++            SimpleUploadedFile("name2", b"Content 2"),
>> ++        ]
>> ++        self.assertEqual(f.clean(files), files)
>> ++
>> ++    def test_file_multiple_empty(self):
>> ++        f =3D MultipleFileField()
>> ++        files =3D [
>> ++            SimpleUploadedFile("empty", b""),
>> ++            SimpleUploadedFile("nonempty", b"Some Content"),
>> ++        ]
>> ++        msg =3D "'The submitted file is empty.'"
>> ++        with self.assertRaisesMessage(ValidationError, msg):
>> ++            f.clean(files)
>> ++        with self.assertRaisesMessage(ValidationError, msg):
>> ++            f.clean(files[::-1])
>> ++
>> ++    def test_file_multiple_validation(self):
>> ++        f =3D
>> ++ MultipleFileField(validators=3D[validate_image_file_extension])
>> ++
>> ++        good_files =3D [
>> ++            SimpleUploadedFile("image1.jpg", b"fake JPEG"),
>> ++            SimpleUploadedFile("image2.png", b"faux image"),
>> ++            SimpleUploadedFile("image3.bmp", b"fraudulent bitmap"),
>> ++        ]
>> ++        self.assertEqual(f.clean(good_files), good_files)
>> ++
>> ++        evil_files =3D [
>> ++            SimpleUploadedFile("image1.sh", b"#!/bin/bash -c 'echo p=
wned!'\n"),
>> ++            SimpleUploadedFile("image2.png", b"faux image"),
>> ++            SimpleUploadedFile("image3.jpg", b"fake JPEG"),
>> ++        ]
>> ++
>> ++        evil_rotations =3D (
>> ++            evil_files[i:] + evil_files[:i]  # Rotate by i.
>> ++            for i in range(len(evil_files))
>> ++        )
>> ++        msg =3D "File extension =E2=80=9Csh=E2=80=9D is not allowed.=
 Allowed extensions are: "
>> ++        for rotated_evil_files in evil_rotations:
>> ++            with self.assertRaisesMessage(ValidationError, msg):
>> ++                f.clean(rotated_evil_files)
>> +diff --git
>> +a/tests/forms_tests/widget_tests/test_clearablefileinput.py
>> +b/tests/forms_tests/widget_tests/test_clearablefileinput.py
>> +index 2ba376d..8d9e38a 100644
>> +--- a/tests/forms_tests/widget_tests/test_clearablefileinput.py
>> ++++ b/tests/forms_tests/widget_tests/test_clearablefileinput.py
>> +@@ -161,3 +161,8 @@ class ClearableFileInputTest(WidgetTest):
>> +         self.assertIs(widget.value_omitted_from_data({}, {}, 'field'=
), True)
>> +         self.assertIs(widget.value_omitted_from_data({}, {'field': '=
x'}, 'field'), False)
>> +         self.assertIs(widget.value_omitted_from_data({'field-clear':
>> +'y'}, {}, 'field'), False)
>> ++
>> ++    def test_multiple_error(self):
>> ++        msg =3D "ClearableFileInput doesn't support uploading multip=
le files."
>> ++        with self.assertRaisesMessage(ValueError, msg):
>> ++            ClearableFileInput(attrs=3D{"multiple": True})
>> +diff --git a/tests/forms_tests/widget_tests/test_fileinput.py
>> +b/tests/forms_tests/widget_tests/test_fileinput.py
>> +index bbd7c7f..24daf5d 100644
>> +--- a/tests/forms_tests/widget_tests/test_fileinput.py
>> ++++ b/tests/forms_tests/widget_tests/test_fileinput.py
>> +@@ -1,4 +1,6 @@
>> ++from django.core.files.uploadedfile import SimpleUploadedFile
>> + from django.forms import FileInput
>> ++from django.utils.datastructures import MultiValueDict
>> +
>> + from .base import WidgetTest
>> +
>> +@@ -18,3 +20,45 @@ class FileInputTest(WidgetTest):
>> +     def test_value_omitted_from_data(self):
>> +         self.assertIs(self.widget.value_omitted_from_data({}, {}, 'f=
ield'), True)
>> +         self.assertIs(self.widget.value_omitted_from_data({},
>> +{'field': 'value'}, 'field'), False)
>> ++
>> ++    def test_multiple_error(self):
>> ++        msg =3D "FileInput doesn't support uploading multiple files.=
"
>> ++        with self.assertRaisesMessage(ValueError, msg):
>> ++            FileInput(attrs=3D{"multiple": True})
>> ++
>> ++    def test_value_from_datadict_multiple(self):
>> ++        class MultipleFileInput(FileInput):
>> ++            allow_multiple_selected =3D True
>> ++
>> ++        file_1 =3D SimpleUploadedFile("something1.txt", b"content 1"=
)
>> ++        file_2 =3D SimpleUploadedFile("something2.txt", b"content 2"=
)
>> ++        # Uploading multiple files is allowed.
>> ++        widget =3D MultipleFileInput(attrs=3D{"multiple": True})
>> ++        value =3D widget.value_from_datadict(
>> ++            data=3D{"name": "Test name"},
>> ++            files=3DMultiValueDict({"myfile": [file_1, file_2]}),
>> ++            name=3D"myfile",
>> ++        )
>> ++        self.assertEqual(value, [file_1, file_2])
>> ++        # Uploading multiple files is not allowed.
>> ++        widget =3D FileInput()
>> ++        value =3D widget.value_from_datadict(
>> ++            data=3D{"name": "Test name"},
>> ++            files=3DMultiValueDict({"myfile": [file_1, file_2]}),
>> ++            name=3D"myfile",
>> ++        )
>> ++        self.assertEqual(value, file_2)
>> ++
>> ++    def test_multiple_default(self):
>> ++        class MultipleFileInput(FileInput):
>> ++            allow_multiple_selected =3D True
>> ++
>> ++        tests =3D [
>> ++            (None, True),
>> ++            ({"class": "myclass"}, True),
>> ++            ({"multiple": False}, False),
>> ++        ]
>> ++        for attrs, expected in tests:
>> ++            with self.subTest(attrs=3Dattrs):
>> ++                widget =3D MultipleFileInput(attrs=3Dattrs)
>> ++                self.assertIs(widget.attrs["multiple"], expected)
>> +--
>> +2.40.0
>> diff --git
>> a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
>> b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
>> index 9ef988176e..77a1a2a740 100644
>> --- a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
>> +++ b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
>> @@ -5,6 +5,8 @@ UPSTREAM_CHECK_REGEX =3D "/${PYPI_PACKAGE}/(?P<pver>(2=
\.2\.\d*)+)/"
>>
>>    inherit setuptools3
>>
>> +SRC_URI +=3D "file://CVE-2023-31047.patch"
>> +
>>    SRC_URI[sha256sum] =3D "0200b657afbf1bc08003845ddda053c7641b9b24951=
e52acd51f6abda33a7413"
>>
>>    RDEPENDS:${PN} +=3D "\
>>
>>
>>

