Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53A53C7EE24
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 15:51:59 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.17014.1685721116389133240
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Jun 2023 08:51:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=QRhd3PtL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5517cbc0f1=narpat.mali@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 352FpVO7022460
	for <openembedded-devel@lists.openembedded.org>; Fri, 2 Jun 2023 15:51:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=aax4H5C/McbepT0MqW/lR7XQTaOAPUyTpXCHL7cDddI=;
 b=QRhd3PtLny8n41u3h4nkL4V+pZoMOz5Cxx0p+R1Azjkbps6uUmH9NuWI/uFTyQzH9EUy
 Bml6VIQuhwfNTwxLpFh9SluZFNHjFPEC9Z6zV6WIHlAaIwjGn3sWU95+X4IpVNiTUGdW
 fq4zHN/y8VVQrTVy8+ldP1R7owPD4jPV3q8GCP0ebsJDxwUaCEyPypdWu16g925bkpca
 s4287ytAICnIiGDuqyRuXLDWrHvdsKyGhszyZtUtbN0K6QIxW5u2BAYJlQg9/Um+waRx
 uXEqZTyvGCKYs66wL+JtrKShaAopHO96yxxk10V3y53L1qp55Bb5xm/mAg4RpwUIRUJs 3A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qwqgj37e4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 02 Jun 2023 15:51:55 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 352Fps3X022961
	for <openembedded-devel@lists.openembedded.org>; Fri, 2 Jun 2023 15:51:54 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qwqgj37e2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Jun 2023 15:51:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S/W4VNPljn5cdRrXqRrMvYn5cJjiaH4Ra17lP/LH++M3RvXGuyrSAyUzdaDTc2ExXByW+J3ubAFnEieQ/32+Vt/sYZ+WBsku3R+AWv2pLZP/8d88rXtaPhi96PnSJSNX7Ewb6b7PMBM38N7pKYY+iICgOnIcQ7laFTo0mv+R4Iq8JlsqsgVG244LQyLsVoDeAZrqRSKP+1Hcbt+vwf9IP0arnHaMfhgKX60UcEacNVLVhfexaue1tin+vNsvL37VL2gFY4n0YZdwvxa86ZKEIecFHTwn2Tltqsy/VTyAEfXs9+EPoBSJsLPcjkAGUv5ETJIc4ITWBO8xwC2FAXqfUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aax4H5C/McbepT0MqW/lR7XQTaOAPUyTpXCHL7cDddI=;
 b=lbNArh37fLksb+dP+4YOe9LxsP2G+B4Fecv1oIbLPbKv3/u0YAWhFtIl8S+QcbZXTaLp5uNRoAANUUrbinb6rzpXNmI09pskIk4WlpeRRInacOvYbC1GghYaSDhLQIqzJ0vWUN45aYmcqpJkduDg9Jywfe+3zwVhFmKO+cHshP6B2uKP5hdiRBcbyNX3ltyLRYibrdTIuQk1s2f0kAJLeGXPEqnsE7KQgAavN/pPxWxQVmwmhrTkrSstc38yVfAOP4zFGQQuB7G3VBIDbTDfNEsfxkvqFp83ZLvhaB9Z2eKRQGAd8/qP7YpkTk6EyRRi4saljuKZ5MABuboyji0fGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5550.namprd11.prod.outlook.com (2603:10b6:5:38b::24)
 by SA3PR11MB7655.namprd11.prod.outlook.com (2603:10b6:806:307::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.26; Fri, 2 Jun
 2023 15:51:48 +0000
Received: from DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::36d0:d8e:89e0:500]) by DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::36d0:d8e:89e0:500%4]) with mapi id 15.20.6455.024; Fri, 2 Jun 2023
 15:51:48 +0000
Content-Type: multipart/alternative;
 boundary="------------2r50iUpHYx2v4MITYJNucoRD"
Message-ID: <df20b4d0-14c4-5583-0704-ce18374cf0ff@windriver.com>
Date: Fri, 2 Jun 2023 21:19:36 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [oe] [meta-python][kirkstone][PATCH 1/1] python3-django: upgrade
 4.0.2 -> 4.2.1
To: Tim Orling <ticotimo@gmail.com>, randy.macleod@windriver.com
Cc: Armin Kuster <akuster808@gmail.com>,
        "Reyna, David" <david.reyna@windriver.com>, hari.gpillai@windriver.com,
        openembedded-devel@lists.openembedded.org
References: <20230531100257.3467702-1-narpat.mali@windriver.com>
 <20054ea6-97a5-c28f-efbc-ffd862b82032@windriver.com>
 <CANx9H-Cx=P1hMNezmaH8EUvwx753egb-1Edn0FBHSb9t3G=yWA@mail.gmail.com>
Content-Language: en-US
From: "Mali, Narpat" <narpat.mali@windriver.com>
In-Reply-To: <CANx9H-Cx=P1hMNezmaH8EUvwx753egb-1Edn0FBHSb9t3G=yWA@mail.gmail.com>
X-ClientProxiedBy: FR3P281CA0015.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::13) To DM4PR11MB5550.namprd11.prod.outlook.com
 (2603:10b6:5:38b::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5550:EE_|SA3PR11MB7655:EE_
X-MS-Office365-Filtering-Correlation-Id: 89a6e38b-ac1a-41a9-8be8-08db638145e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GQRIEaTC22Ul0GtuQpk9CPyXIO53PQ53gA8QuOCcoBjBXEq835GUc0R7Gn9HRmhNdrNG8B5xWaES4r/5/3FBSLKrdHP5S5mz5QM2ZVdbJZvLiJtp22h/exIa3Ndi3Yrrn5I+3pQU+0bH84NrrWQ4/NydKr3GpvhJMr6LySuRqHMnnLAWS90pZ3JEDOehvjX1bcbiHEc3mHkPjANuaMV99q/a0oZQ7tlkBOQeeio56xjliBTK48gQ/FjoLH0U3E9t6qmsbpKT6Kqr4IMbvNBhNZ5osrwfGi/3cnRUZR7QDHRP35xy8PLxDdLJyzu2a7YNWqWSbSoBgxTEj5YZts2xfPaDkgdz3X0/osC7O7jmmEULZEpUHrd5r7yRSvqXDjjkuo9p5yY7luBG0lm702oni/37iAVTcFbttcKYexd5NRuHk9O/Fz2U8qnfwsp12Vah05kyikXr89NzBgzmYmoeuSCwIDkGvopTaxOSsaTQNq64NwzXq6Eidfz4EoEF9LMSXODNsw8xyCeu4oojXGOey49QWJBdMCvhCfGwlwDeFpo/qrpTpuKiDol3nYQRsFq43eG0vXqaBhXcVcn5vCBalHLNTFC3btCsWwoWafEWMmJ2jedKYbiwpN9Z8yzy46qsG85Zmb6JaeWhdoYEa4Km1Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5550.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(396003)(376002)(39850400004)(136003)(451199021)(5660300002)(8936002)(8676002)(478600001)(41300700001)(6486002)(33964004)(86362001)(966005)(6666004)(6636002)(4326008)(316002)(66899021)(53546011)(186003)(31686004)(66946007)(66476007)(66556008)(31696002)(6506007)(26005)(6512007)(54906003)(166002)(2616005)(2906002)(83380400001)(36756003)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bkRqcy9WRXUyRXh1SXJUd0VENGwvMWhGRjd1NEtnWGJISE9Ia1Q0ZDN3QThW?=
 =?utf-8?B?R0hrYXlKV1kwN2ZEcnliSEh1YTdjY0ExWG5ZNDk2TWwyUTdVWGVDWFNnUkRn?=
 =?utf-8?B?NEQ0bXRSaWVNN0pQTUNUWkFwclYvSzlvdldIcUZHRXlIV3B4a3NONVk4YmZZ?=
 =?utf-8?B?R3NWQ1UwUmRzd1c2eWpkcXJWK1lyczZCY05BTXJhdzNZWTBOc3VDcHNJblZi?=
 =?utf-8?B?ZG03em53WGVaVTEwK0xYUWoySGlBWGtZbmJ1WkE2MjBOQXhqbW14SUkwcW41?=
 =?utf-8?B?aXMydnd0ZUl2WlRjbTdrek9QeWVCeDgzL29zY09TZG1QSW1GNmduVzIyQVNX?=
 =?utf-8?B?UzRxSi9acGNjOFExRVJnWHhDZmFXWDUrYk8wTlBXbzZDZUJ6QnFvTXZ5K3hS?=
 =?utf-8?B?SCtoeDR4RnNuYXBUak5PR2MyelBDcnNDd3lFcnV5RkJ3WWdKbWZIeWJkeVVo?=
 =?utf-8?B?VjlLNFBLcjJ5Z0RTaTFiV1VCL0NKbjlkMTljSjFZZHE3TUdxRGE2allWT0dI?=
 =?utf-8?B?VTNsVXlmazJlM2NvL1gyais3ZG1RMU1TVDRJOXgyaWhaNWxycjF1c1NDTCtX?=
 =?utf-8?B?QlBMcTdkZHBiYTVTN2doWjlyM1A4R09zcGptcjJSSTltYUpGbVNjVmw0aXlJ?=
 =?utf-8?B?U3pZa01kTTVJR2lnUjVUeHdxRmpMbmNQd0FyOHZSVEdNc2VyL3c5VmZtMlZo?=
 =?utf-8?B?bzJlcGsrRlpaYTBPaFNGRXB6a1d2ald0blVoNzM3SkhCdDBVK1hoYVkzNXNX?=
 =?utf-8?B?TDc1R2tRbEFIL3E4ZXE5OUR0ZHg1VnRObnNyVXQ5UmxXZ0FXK3JCQmxsdVdx?=
 =?utf-8?B?R20vMkkvT2dYbHJqNTh6U2hDWkxyTWtyelRkelRLeElsMlZQUi9OWEVEU29Y?=
 =?utf-8?B?T3VvRFRXbUZrRVpUZzM4Y3ZuVk5tQVlxRi8wQVZDdjJmdnF2SzltSzFyMzlJ?=
 =?utf-8?B?eHdZU3lzTm5NblJXV2RrNzRzeUIycnVqMDdyQ0ZyRFc4d05OdUI4U2J6TW9y?=
 =?utf-8?B?bXI1Njg2VEFKd1FDNXBXN2V1c3pEeCt6U0toWGkrVyt3ZGJhRUNka0orOEk4?=
 =?utf-8?B?SGdoY2JGcm04Wm5Ua0NWVkF0ckRrMHliblV1WmN0OXl1Wk9MUTVMUTVSQlU4?=
 =?utf-8?B?ZUIwOXdQZGJQUlNGOFNZNHRLN2o2bms4eHlDYUJ6SGgranlWZnZuVzVaSXA5?=
 =?utf-8?B?TXZWeFBCTVQwcnZEOXdaS3NsbnlBVmZ5TjZLM056eDJmNUZ5QWFwWS9XRGNn?=
 =?utf-8?B?MHd0S0VOc2RmZFJOdGhyakVSK2hORjF0dXdsaWpyb2thMEtIb25RbUMvS1JM?=
 =?utf-8?B?aGRKdzUrdmtuLzZPZ1h1WEl5cUIwRG4rblFPLzdhYVUvK0pqMmJnYkorV01V?=
 =?utf-8?B?L2JVbGJDTUZwZndjTm41S1RicEV4TDd6NWZ4RWZjckZaRDI5TjAzay9NbEM5?=
 =?utf-8?B?RFdWcGZKMW1WdTlqdW9pb3MyRk0zQ3JuTEdDZHRZMFpUWExsMWt0SjR0b01Y?=
 =?utf-8?B?b2J2Y2svTE1LbWNXV1dWN3BMSzZJbkNjQlU0ZmtvYWx3bHFLS0IwZjZWV1Nw?=
 =?utf-8?B?QTRVR0RLT3BNNDdMdzhQTkNsZ0RXUUJiV2FKRWhlZXhuUUhHSWpKS3BLTzJ3?=
 =?utf-8?B?Ky9pLzR2UjYwMmpncysvS0g5dk95aDNTT0dFb1h0cmZ2VmVRNUgzallUQ0t1?=
 =?utf-8?B?UjB3UWorUDQ4MURBc2lLSis3TTdHRFIzdnVzdzBwWWRiNy9UQWF4NHh0UTZE?=
 =?utf-8?B?ZkJjWFZ3OUgwRnhIWDg0blJtR3YySW8zRkNyNmVrNytuM2dpcmdNTVY2dFF3?=
 =?utf-8?B?WWZRT1BkdWNucjkyMmI3UTc2NVVoQVY5cXp5YnJ6ektoemdsemlpS3Y4dWRV?=
 =?utf-8?B?RVAyaXRUUHJocCs5WFlESkhiL21mNUxzOHFpZGRSSnlDaGQzOGRUWjZ5Y2J5?=
 =?utf-8?B?YjJEU1VrMjBmUHU3aW42ejhRYUdQalpBd1pnUHN4TDdUTm9iT3RxM0pkQS91?=
 =?utf-8?B?RnZzVnpNR3c1WTRsR2hkYXd0eW5sMHU2TTQ0bWFnMnRzaFMvNFplcGd6NWl4?=
 =?utf-8?B?dkZmY0Z1bXhBVFZ4ZGpvU0k4ZGg1bmJaUFBNa3FDaFRXa1lYdFJhcVorSDhh?=
 =?utf-8?B?WXZSUnB0WU9zcGNXWjMxbElYZkZGMDNGWHQ4bm1qNkN5SHhUYnY3RmNLa09W?=
 =?utf-8?B?WXc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89a6e38b-ac1a-41a9-8be8-08db638145e2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5550.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 15:51:48.0896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EN+SLpcDUWZJCXODQey74DWKAMmzfkOMvcYFgRnmbDwzb8zafajEx6H/5RfhZTscZlOTAUrNKTHYtA0BbnTyRf2qaTRusG5ZhcbIU/XkZ94=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7655
X-Proofpoint-GUID: XQqU1GPtyjZMmqFqpRwJ3Nz6KXJrVhP9
X-Proofpoint-ORIG-GUID: TSBm5I28HTRPLDz8toUy8JAMxRlpK2mW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-02_12,2023-06-02_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 adultscore=0 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2306020120
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Jun 2023 15:51:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103101

--------------2r50iUpHYx2v4MITYJNucoRD
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02-06-2023 05:25, Tim Orling wrote:
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender 
> and know the content is safe.
>
>
> On Thu, Jun 1, 2023 at 8:52 AM Randy MacLeod via 
> lists.openembedded.org 
> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8EvQ!elEbPulrImg4B5zxqbHW-oHTJgJIKpck_BYvSLXIgADYR6spgHyUEZ-HFisxWVd6OWHdA3BObaRm0OWffoRJ$> 
> <randy.macleod=windriver.com@lists.openembedded.org> wrote:
>
>     On 2023-05-31 06:02, Narpat Mali via lists.openembedded.org
>     <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8EvQ!elEbPulrImg4B5zxqbHW-oHTJgJIKpck_BYvSLXIgADYR6spgHyUEZ-HFisxWVd6OWHdA3BObaRm0OWffoRJ$>
>     wrote:
>>     From: Narpat Mali<narpat.mali@windriver.com>
>>
>>     Django 4.2* is designated as a long-term support release. It will receive
>>     security updates for at least three years after its release.
>>
>>     The delta between 4.0.2 and 4.2.1 contain numerous CVEs and other
>>     bugfixes.
>
>
> Please send a v2 with a link to the changelog. We really need to make 
> it easier for reviewers and stable maintainers.
>
> Please also include the date range that 4.2 will be supported.
>
> You can look in the git history for commits from myself and Trevor 
> Gamblin for what is expected.
>
Thanks Tim, have done the changes and sent the v2.

Best Regards,

Narpat

>     Thanks Narpat.
>
>     Also I spoke with David Reyna about this and he suggested that
>     the 4.x version was added mainly for Toaster support. David
>     agreed that updating to 4.2 LTS would work for me.
>
>     Right David?
>
>     ../Randy
>
>>     Release Notes:https://docs.djangoproject.com/en/dev/releases/
>>
>>     Signed-off-by: Narpat Mali<narpat.mali@windriver.com>
>>     ---
>>       .../python/{python3-django_4.0.2.bb => python3-django_4.2.1.bb} | 2 +-
>>       1 file changed, 1 insertion(+), 1 deletion(-)
>>       rename meta-python/recipes-devtools/python/{python3-django_4.0.2.bb => python3-django_4.2.1.bb} (77%)
>>
>>     diff --git a/meta-python/recipes-devtools/python/python3-django_4.0.2.bb b/meta-python/recipes-devtools/python/python3-django_4.2.1.bb
>>     similarity index 77%
>>     rename from meta-python/recipes-devtools/python/python3-django_4.0.2.bb
>>     rename to meta-python/recipes-devtools/python/python3-django_4.2.1.bb
>>     index 690b9809dc..4daca65eb5 100644
>>     --- a/meta-python/recipes-devtools/python/python3-django_4.0.2.bb
>>     +++ b/meta-python/recipes-devtools/python/python3-django_4.2.1.bb
>>     @@ -1,7 +1,7 @@
>>       require python-django.inc
>>       inherit setuptools3
>>       
>>     -SRC_URI[sha256sum] = "110fb58fb12eca59e072ad59fc42d771cd642dd7a2f2416582aa9da7a8ef954a"
>>     +SRC_URI[sha256sum] = "7efa6b1f781a6119a10ac94b4794ded90db8accbe7802281cd26f8664ffed59c"
>>       
>>       RDEPENDS:${PN} += "\
>>           ${PYTHON_PN}-sqlparse \
>>
>
>     -- 
>     # Randy MacLeod
>     # Wind River Linux
>
>
>
>     -=-=-=-=-=-=-=-=-=-=-=-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#103080):
>     https://lists.openembedded.org/g/openembedded-devel/message/103080
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-devel/message/103080__;!!AjveYdw8EvQ!elEbPulrImg4B5zxqbHW-oHTJgJIKpck_BYvSLXIgADYR6spgHyUEZ-HFisxWVd6OWHdA3BObaRm0DcQL0F6$>
>     Mute This Topic: https://lists.openembedded.org/mt/99238868/924729
>     <https://urldefense.com/v3/__https://lists.openembedded.org/mt/99238868/924729__;!!AjveYdw8EvQ!elEbPulrImg4B5zxqbHW-oHTJgJIKpck_BYvSLXIgADYR6spgHyUEZ-HFisxWVd6OWHdA3BObaRm0BpiLkHV$>
>     Group Owner: openembedded-devel+owner@lists.openembedded.org
>     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-devel/unsub
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-devel/unsub__;!!AjveYdw8EvQ!elEbPulrImg4B5zxqbHW-oHTJgJIKpck_BYvSLXIgADYR6spgHyUEZ-HFisxWVd6OWHdA3BObaRm0M8MMp4U$>
>     [ticotimo@gmail.com]
>     -=-=-=-=-=-=-=-=-=-=-=-
>
--------------2r50iUpHYx2v4MITYJNucoRD
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 02-06-2023 05:25, Tim Orling wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANx9H-Cx=P1hMNezmaH8EUvwx753egb-1Edn0FBHSb9t3G=yWA@mail.gmail.com">
      
      <strong>
      </strong>
      <div style="border:solid #9c6500
        1pt;padding:2pt;background:#fcfc03"><strong><class="msonormal" style="line-height:11pt"><span style="font-size:11pt;color:#000">CAUTION: This email
              comes from a non Wind River email account!</span></class="msonormal"></strong><br>
        <class="msonormal" style="line-height:10pt3"><span style="font-size:10pt;color:#000">Do not click links or open
            attachments unless you recognize the sender and know the
            content is safe.</span><br>
        </class="msonormal"></div>
      <div>
        <div><br>
        </div>
        <div><br>
          <div class="gmail_quote">
            <div dir="ltr" class="gmail_attr">On Thu, Jun 1, 2023 at
              8:52 AM Randy MacLeod via
              <a href="https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8EvQ!elEbPulrImg4B5zxqbHW-oHTJgJIKpck_BYvSLXIgADYR6spgHyUEZ-HFisxWVd6OWHdA3BObaRm0OWffoRJ$" moz-do-not-send="true">
                lists.openembedded.org</a> &lt;randy.macleod=<a href="mailto:windriver.com@lists.openembedded.org" moz-do-not-send="true" class="moz-txt-link-freetext">windriver.com@lists.openembedded.org</a>&gt;
              wrote:<br>
            </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div>
                <div>On 2023-05-31 06:02, Narpat Mali via <a href="https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8EvQ!elEbPulrImg4B5zxqbHW-oHTJgJIKpck_BYvSLXIgADYR6spgHyUEZ-HFisxWVd6OWHdA3BObaRm0OWffoRJ$" target="_blank" moz-do-not-send="true">
                    lists.openembedded.org</a> wrote:<br>
                </div>
                <blockquote type="cite">
                  <pre>From: Narpat Mali <a class="moz-txt-link-rfc2396E" href="mailto:narpat.mali@windriver.com">&lt;narpat.mali@windriver.com&gt;</a>

Django 4.2* is designated as a long-term support release. It will receive
security updates for at least three years after its release.

The delta between 4.0.2 and 4.2.1 contain numerous CVEs and other
bugfixes.</pre>
                </blockquote>
              </div>
            </blockquote>
            <div dir="auto"><br>
            </div>
            <div dir="auto">Please send a v2 with a link to the
              changelog. We really need to make it easier for reviewers
              and stable maintainers.</div>
            <div dir="auto"><br>
            </div>
            <div dir="auto">Please also include the date range that 4.2
              will be supported.</div>
            <div dir="auto"><br>
            </div>
            <div dir="auto">You can look in the git history for commits
              from myself and Trevor Gamblin for what is expected.</div>
            <div dir="auto"><br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <p>Thanks Tim, have done the changes and sent the v2.</p>
    <p>Best Regards,</p>
    <p>Narpat<br>
    </p>
    <blockquote type="cite" cite="mid:CANx9H-Cx=P1hMNezmaH8EUvwx753egb-1Edn0FBHSb9t3G=yWA@mail.gmail.com">
      <div>
        <div>
          <div class="gmail_quote">
            <div dir="auto">
            </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div>
                <p dir="auto">Thanks Narpat.<br>
                </p>
                <p>Also I spoke with David Reyna about this and he
                  suggested that<br>
                  the 4.x version was added mainly for Toaster support.
                  David<br>
                  agreed that updating to 4.2 LTS would work for me.<br>
                </p>
                <p>Right David?</p>
                <p>../Randy<br>
                </p>
                <blockquote type="cite">
                  <pre>Release Notes: <a class="moz-txt-link-freetext" href="https://docs.djangoproject.com/en/dev/releases/">https://docs.djangoproject.com/en/dev/releases/</a>

Signed-off-by: Narpat Mali <a class="moz-txt-link-rfc2396E" href="mailto:narpat.mali@windriver.com">&lt;narpat.mali@windriver.com&gt;</a>
---
 .../python/{python3-django_4.0.2.bb =&gt; python3-django_4.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_4.0.2.bb =&gt; python3-django_4.2.1.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-django_4.0.2.bb b/meta-python/recipes-devtools/python/python3-django_4.2.1.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-django_4.0.2.bb
rename to meta-python/recipes-devtools/python/python3-django_4.2.1.bb
index 690b9809dc..4daca65eb5 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.1.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = &quot;110fb58fb12eca59e072ad59fc42d771cd642dd7a2f2416582aa9da7a8ef954a&quot;
+SRC_URI[sha256sum] = &quot;7efa6b1f781a6119a10ac94b4794ded90db8accbe7802281cd26f8664ffed59c&quot;
 
 RDEPENDS:${PN} += &quot;\
     ${PYTHON_PN}-sqlparse \
</pre>
                  <br>
                  <fieldset></fieldset>
                </blockquote>
                <p><br>
                </p>
                <pre cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
              </div>
              <br>
              <br>
              -=-=-=-=-=-=-=-=-=-=-=-<br>
              Links: You receive all messages sent to this group.<br>
              View/Reply Online (#103080): <a href="https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-devel/message/103080__;!!AjveYdw8EvQ!elEbPulrImg4B5zxqbHW-oHTJgJIKpck_BYvSLXIgADYR6spgHyUEZ-HFisxWVd6OWHdA3BObaRm0DcQL0F6$" rel="noreferrer" target="_blank" moz-do-not-send="true">
https://lists.openembedded.org/g/openembedded-devel/message/103080</a><br>
              Mute This Topic: <a href="https://urldefense.com/v3/__https://lists.openembedded.org/mt/99238868/924729__;!!AjveYdw8EvQ!elEbPulrImg4B5zxqbHW-oHTJgJIKpck_BYvSLXIgADYR6spgHyUEZ-HFisxWVd6OWHdA3BObaRm0BpiLkHV$" rel="noreferrer" target="_blank" moz-do-not-send="true">
                https://lists.openembedded.org/mt/99238868/924729</a><br>
              Group Owner: <a href="mailto:openembedded-devel%2Bowner@lists.openembedded.org" target="_blank" moz-do-not-send="true">
                openembedded-devel+owner@lists.openembedded.org</a><br>
              Unsubscribe: <a href="https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-devel/unsub__;!!AjveYdw8EvQ!elEbPulrImg4B5zxqbHW-oHTJgJIKpck_BYvSLXIgADYR6spgHyUEZ-HFisxWVd6OWHdA3BObaRm0M8MMp4U$" rel="noreferrer" target="_blank" moz-do-not-send="true">
https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:ticotimo@gmail.com" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">ticotimo@gmail.com</a>]<br>
              -=-=-=-=-=-=-=-=-=-=-=-<br>
              <br>
            </blockquote>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------2r50iUpHYx2v4MITYJNucoRD--

