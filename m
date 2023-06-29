Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58E7AEB64D9
	for <webhook@archiver.kernel.org>; Thu, 29 Jun 2023 16:44:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.2048.1688057044359115829
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Jun 2023 09:44:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=l6zxfJWR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6544be54dc=narpat.mali@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 35TDhSdC018312
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Jun 2023 16:44:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=gtC3jHLxV6IZBkblMKh
	exX1Zq8y0CW4Kr4M4iwoODrY=; b=l6zxfJWRFNKkN2KWTeCbFZcdCo12WUz3hXi
	5qGNtpqUHe1H7ksa8OV02IZBGdH/n/oKD9OgfsfmC8I1Dlk8bF3XfNdrtPe7+qSP
	LCDTacRaeLQYiOEtyeeMSDc9ml0mZXYORwlIKcGETkjfcG+CIpk3m/VfjgWhvX46
	QmEP859lJXcfdF5bmV/y1iea0YWkeZVS4ybOn/hZkfwnvM75/nXHDGVUpPrvLV9c
	jqnguJVchCoobbsZaIOCnXeiw852WYKNmPzNwuuFwRmSvSp8TLkS257D2YngYFq6
	r3yK2BlNRSt+QtSu6tIv60gj8lQATQD8j94kysCLUyRbnkzAUTw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rdpqb521u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Jun 2023 16:44:02 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 35TGi2Q1027472;
	Thu, 29 Jun 2023 16:44:02 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rdpqb521r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Jun 2023 16:44:02 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X/vy/rWxvRItC0+xu6DNZjoO7lF7OIWenvdrGwhGH/b7C6MrE+45EsjP+pcNbmtJs91glCuPXO75n5PAbKMxNj6KC14WoQSMBehsQ0+CAmm+yDbUZclGVNJ8rpX3gz8/IdYxWcL8xEmrHkXJohafB7ntDbJvqg5BA9033/3O06ZSg/x9IwnGdiYvdA9RyY/XOK1WQ0tOo9T6YhkPJNMcnNMNNmY9xv6qR9R6vQ50nArDUeKywNKlaiC9f9j61GlNFSNFa2+vfyOpRh8jtgRe10aSuXMfBPZyTFF4HprWPvuiR47/xgoyd0TOr/sa+SPnEkcSZu2szzNBHz2ydt5ASg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gtC3jHLxV6IZBkblMKhexX1Zq8y0CW4Kr4M4iwoODrY=;
 b=XHop/c/tyTF5sLaDbJccP7uaAuHOqoA2yEJcksTaz8SirR0tAmeVSGef+g0JTv2OYc7l6KBGwYzFO0WLT2BUZ5w9aL/zRLulQaqkZxgN4GFW/9gM2sXWKRMNeDs4iQC5JzOOMAR5gEwWVY1+G4NSIiC8VAYUeO3jep4CQ18ZcYYRiCxMzXv75NISiGhOlba5nqNsYQNCyN9YEQUyCAQWEjalJ3hK2Ja463dx8Ng4Z9P9wWr3qN9R2aR/pAROK0IMMJJX/nDLvOqXCXEAz/ka6TygbC+iaoLb81w42DqOVR6LOZDLrCDeOpjsVPjqpgf+hL2Ab9RSXPGN17RZD/qpUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5550.namprd11.prod.outlook.com (2603:10b6:5:38b::24)
 by PH0PR11MB5160.namprd11.prod.outlook.com (2603:10b6:510:3e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Thu, 29 Jun
 2023 16:43:54 +0000
Received: from DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::6d5f:a33b:c280:2981]) by DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::6d5f:a33b:c280:2981%4]) with mapi id 15.20.6521.024; Thu, 29 Jun 2023
 16:43:54 +0000
Content-Type: multipart/alternative;
 boundary="------------HxU6hQSKufUKBR1iNum3nfZv"
Message-ID: <c2ad7be0-a4ab-9af4-fc10-8fae09e721d7@windriver.com>
Date: Thu, 29 Jun 2023 22:11:27 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [oe] [meta-oe][kirkstone][PATCH 1/1] python3-werkzeug: fix for
 CVE-2023-23934
To: "Sanjaykumar kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at Cisco)"
 <schitrod@cisco.com>,
        Martin Jansa <martin.jansa@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>,
        "hari.gpillai@windriver.com" <hari.gpillai@windriver.com>
References: <20230510134849.562209-1-narpat.mali@windriver.com>
 <CA+chaQe7hfFSzZHbSkhDA2qN9dSd8tdr5oAjWTJj5rZqqa1MQg@mail.gmail.com>
 <fdc9bf44-d91f-949b-ec60-38d9e07ed9d1@windriver.com>
 <SJ0PR11MB6717FDC533F2A010BA17AFFEDC25A@SJ0PR11MB6717.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Mali, Narpat" <narpat.mali@windriver.com>
In-Reply-To: <SJ0PR11MB6717FDC533F2A010BA17AFFEDC25A@SJ0PR11MB6717.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR03CA0144.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::29) To DM4PR11MB5550.namprd11.prod.outlook.com
 (2603:10b6:5:38b::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5550:EE_|PH0PR11MB5160:EE_
X-MS-Office365-Filtering-Correlation-Id: 14cb10f7-312a-4c16-1f3c-08db78c00625
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FuQpWnF5U9kDDumfOo0/WFrW3JceWzKBpBbMOxozBHNjqcnm7FWkStSxU84GS7iO21t0+7GFNIiAqlPYSCZURa/z2wbG6965//Mm4bJIXSdspDNSEqRJt9vPZH9Fp2FC8b6KwQs9uvnoYD1JA3sT6ocmk6RpWYilKVyLvow3zNjPirPU5VXLEpXIe+NqYbi3hfE04iKG5Njjtf3cYfmtjOqzZznfOQm+ktuzqFFwPierw5VGGjD3vocHnOGeLHYQUWSVqb5dMXG+kv8TmJ/42kyFlaryyXnRokbX9kxlA512B43kpke3r45bQU/US2M59iG1lZRMCfy2RkUMo3NYpIJVeuU20gyK2M3FUEcFS/kqtCG2IILr5qnOXCy1cNRkkCUyEwlvvjnuEgYkqsaj7D+uFQhZnUjEckaI9H2uE09rFOZFhKKn8xAtIKovJAZJnkFp69harn2tTGVi9xxNnshGdu4pwfCHPvW9Ddlm5qBqzzlvOXlIVcHhShCF3zWWSq+xihHA28pDT4RjFbeY4xElLLKzRJy2aNPhfKe3xbqkeVjb1epI3NXJ7C3NW3T7a0FNAQdy8FWQiEQIxHouCqR9gU4AlBJGn808TnqLPHFhfb2NUlv2JGdsA/e55lQB4oDL9jEBT7mC7EhetbvVc7vMly6i5GoW9aYghGp8XY0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5550.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(396003)(366004)(376002)(39850400004)(451199021)(26005)(66476007)(4326008)(66556008)(8936002)(33964004)(6506007)(107886003)(36756003)(110136005)(966005)(478600001)(2616005)(54906003)(186003)(2906002)(6666004)(53546011)(6486002)(83380400001)(66574015)(166002)(66946007)(30864003)(5660300002)(38100700002)(31696002)(86362001)(8676002)(316002)(41300700001)(31686004)(6512007)(45980500001)(43740500002)(559001)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Y0RITWkyR1NMOVVxeHNiSDVCb3QvU0QrRE4zbE5pUUtDc2g0dHZRZ3QvZEhq?=
 =?utf-8?B?d3JuanVVQXhxU2pXM3hqMjJ3elcxWEhoUzdmN0xsUkFtMFdVcmVzSFlDV2tS?=
 =?utf-8?B?STlPbmtrT1BFeFVuWXY0NXNtNlEvYy9aZFpLRXIySFlheU9QSzU0NzBqNExE?=
 =?utf-8?B?NTFsSm5vUUg3aGNiMkZMOWFXQVAxaDlwL2kvUVc3b0dydERJdGFheHAzay9N?=
 =?utf-8?B?Ly9QS01GdFlHZ1JqYnBCS0RPK05zNWc1SDN5b1d6VWJ6NUFjYzN5ZEM5aHdF?=
 =?utf-8?B?a3MzRWRidVVGNGxkdHprQTJnZWFqNlNWbk9XazVnYUovLzhZVk5PNU00dzdC?=
 =?utf-8?B?c01rYndyYmlWU25iOWdzRjd4TTMweEVrbTluekNOZHdDRHVhcVV2UXhNWWd0?=
 =?utf-8?B?VVQxQ0RFNFdZZVNobHRVRUVaZ3ZKeTE2bC9PaENLMnhkcjV5dEZIMjVpQkFP?=
 =?utf-8?B?eGVJaVQvV2tYc0p0cUNhLzhTb1NoMlJtYmRWNytmQjM0VWhmTDNmUkp0UFVB?=
 =?utf-8?B?VTc5NmFQNVFrV1VTVlAzNEljNW9CN0c3YXN2VE1uK1VxVUFJamI3TkxUdEJH?=
 =?utf-8?B?YzVhNERaeUdIOHRRTnp5akxzdkhhTDBDWmFsRjl3Mld2R2VGdXgyZGFYaFNL?=
 =?utf-8?B?MEZIcXVDWmFYMEZ0M3RnbFZadjhhSzZWdk5VR0U3MW5zVSt5Z010VkRTUEZw?=
 =?utf-8?B?eFJNRW5TaE9ua24vbzVkSVZuY2hnLzFIQ2JtczJ1WWdRNDMwTytVZ0tzRkFw?=
 =?utf-8?B?RSsyVlFzakt6VU1tNGRFVHFRTzhkMGdRS1pzSjQ4U3lIbS9xRjdRVjFrNUlX?=
 =?utf-8?B?QkN4dTIyNVdxdUY5cGJlY1ZFRDRqQ3diajFZNjdzK3doMW52WEhhZnZSdGtO?=
 =?utf-8?B?RW04NEx6VWJ6RVRMU1RNb2YveDhBV3YyenRKOXNLNXloa2dLTjI1NE5JNlJz?=
 =?utf-8?B?N3o3Y1N5c0x0TnljNWxGQWluOXlnMCtSRE5USXJGUTBkSWNCSmFnL0ZpMEdn?=
 =?utf-8?B?TnZpK1JWS0FSY3l6Wm9jVzNPZURGdkI4UUhrR0ZLUGJzM3BoWDVXNWxsTHkz?=
 =?utf-8?B?YkZrdW05U1Ivb1JvZW1GREVtbndiZHc1QjVUMXFkd21yeXpVNTMrQ0E0aWVN?=
 =?utf-8?B?MW1HWEIvQit6UzVJRjEwc0dOZmswQ2hHVFFGZ2cyRW5sazMyQkduLzlNZHRN?=
 =?utf-8?B?MmJSalgzaWZ2elgxQUswcUFUdDh6cHo3U0R5S1c3bGtKa1FFSUNZcEx4Y3lN?=
 =?utf-8?B?azVVeG9HSTE3ZWE2RDY3S2pKLzEyUk55dTcweUxUamJFM3lwc0daRnRwUjJY?=
 =?utf-8?B?eDNWVVIxRGFCTldQajBIb3dpY3UvQTRjczVOcDJrUFJJU1R4Tkp1K0VRV1Br?=
 =?utf-8?B?dVJDemJlWHdvZjdKaXlLbkpIV3ZkbUNva0Ruai8rQlNMdHhqSG1yU2R2VGpl?=
 =?utf-8?B?djk4WDFSWFkrUXlpY1E2QXkyaGdrNWdZaVI5cTU4NlFuREVXYmJ5bmJwOUJZ?=
 =?utf-8?B?eXpZNkNtNFJWdC9MclYwVG1keXdaZXlpcVRWK29TUjFWWUhtamVEajYwVno0?=
 =?utf-8?B?N0hMTFkvd0JKeDdXS3RYM3E2ZURmeElVblZqTERyWm5iSnlGcUtYWm0wMDhl?=
 =?utf-8?B?ZlBaYWtReFl2S0ZVeHh5RXNRWW0wWHI5ZDYyeVZGUVRVQ2xvSzJaRG1xVlVo?=
 =?utf-8?B?bjZLSkh6bVBEZ1lMc3h0Q0ErZ3J6c1diT0p2WWdTMlkyV1ZRNGQxK2NQbEpI?=
 =?utf-8?B?d1I0cGVidWZLMG0wQmlUWVMvZFdQS09sQWpjZ0I2c3JCdGdxY0V6UUR3RHdP?=
 =?utf-8?B?UjlNZjVDbUgrajhyZmJiVk94eVd5UU1uU0pieGt6eENVVSszOWF2V0ZpQlF1?=
 =?utf-8?B?a3p4QmpyVCtOTHlPdXpHRTBTNkpzekI2eHo2cXJrbE5mZDdYYWphMHFiVFUr?=
 =?utf-8?B?ZlFwSUNxMWZjK2ZVRHlKWFIrSGtMZElQRWlEQ2MwczlaK3FtN3JvSzlrQVlK?=
 =?utf-8?B?MWVLQXNycGlHdm1sQ1RWc0tVazQ5ckxRSTYyT3ZzMElYdUZRajQ5ZGx0TGhE?=
 =?utf-8?B?RG5GdmlpRjN3eXNYWGxSaS93aFgzTGwrVUo3LzAwT3RBVFE5dElVOSsxakw4?=
 =?utf-8?B?TXEvU2EweVV5U3BrSlVoZHFsakNMN2ZFQ3BIdE9Gc3ZjdHJoYVlhU1l1UnNq?=
 =?utf-8?B?L3c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14cb10f7-312a-4c16-1f3c-08db78c00625
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5550.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 16:43:54.2712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w1pJ5Qxq0wNW8brnIlV/n7RE8GxE5I4xhw1IiM6EEW5p6bpCm3r5ZupMLNHjx8XN0FpPtlc7e2i9kx8qdX8sBUMIuNvvanPd0FsSSyFpCts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5160
X-Proofpoint-ORIG-GUID: HIyfRnp6YGOKAGhzru6dMCY8oFifkdkt
X-Proofpoint-GUID: WgZadTbO1_PLK80iwAdsavIGCS2ZnSsJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-29_03,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 mlxlogscore=999 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2306290152
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 29 Jun 2023 16:44:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103642

--------------HxU6hQSKufUKBR1iNum3nfZv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 35TDhSdC018312

On 29-06-2023 07:10, Sanjaykumar kantibhai Chitroda -X (schitrod -=20
E-INFO CHIPS INC at Cisco) wrote:
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
>
> Dear Narpat,
>
> Once your python3-werkzeug package is built successfully using bitbake.
>
> You can try to check=20
> <build>/tmp/work/*/python3-werkzeug/<version>/temp/log.do_patch file.
>
> It will provide the logs specific to do_patch task, where you can=20
> confirm this HUNK information.
>
Thank you Sanjay, It helped me to confirm the HUNK information.

@Martin,

Thanks for identifying the patch-fuzz.

Have sent the patch to fix the patch-fuzz :=20
https://lore.kernel.org/openembedded-devel/20230629163608.3786099-1-narpa=
t.mali@windriver.com/

Best Regards,

Narpat

> Thanks,
>
> Sanjay
>
> *From:*openembedded-devel@lists.openembedded.org=20
> <openembedded-devel@lists.openembedded.org> *On Behalf Of *Narpat Mali=20
> via lists.openembedded.org=20
> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8=
EvQ!bNzZUbPJMjaw1YWRoQUxKvW7kTxX0XvbVNwuRxNV-k35b3IGEfWuNh3D14V-bwlmOU8km=
xirRCb1197e3RBc$>
> *Sent:* Wednesday, June 28, 2023 11:49 AM
> *To:* Martin Jansa <martin.jansa@gmail.com>
> *Cc:* openembedded-devel@lists.openembedded.org;=20
> hari.gpillai@windriver.com
> *Subject:* Re: [oe] [meta-oe][kirkstone][PATCH 1/1] python3-werkzeug:=20
> fix for CVE-2023-23934
>
> On 24-06-2023 19:41, Martin Jansa wrote:
>
>     *CAUTION: This email comes from a non Wind River email account!*
>     Do not click links or open attachments unless you recognize the
>     sender and know the content is safe.
>
>     This change is now merged in kirkstone and causes:
>
>     ERROR: python3-werkzeug-2.1.1-r0 do_patch: Fuzz detected:
>
>      =20
>
>     Applying patch CVE-2023-23934.patch
>
>     patching file CHANGES.rst
>
>     Hunk #1 succeeded at 6 with fuzz 2 (offset 5 lines).
>
>     patching file src/werkzeug/_internal.py
>
>     patching file src/werkzeug/http.py
>
>     patching file tests/test_http.py
>
>      =20
>
>      =20
>
>     The context lines in the patches can be updated with devtool:
>
>      =20
>
>      =C2=A0=C2=A0=C2=A0 devtool modify python3-werkzeug
>
>      =C2=A0=C2=A0=C2=A0 devtool finish --force-patch-refresh python3-we=
rkzeug <layer_path>
>
>      =20
>
>     Don't forget to review changes done by devtool!
>
>      =20
>
>     ERROR: python3-werkzeug-2.1.1-r0 do_patch: QA Issue: Patch log indi=
cates that patches do not apply cleanly. [patch-fuzz]
>
>     Please send follow-up patch to fix patch-fuzz.
>
> Hi Martin,
>
> Thanks for checking.
>
> Have double checked with building python3-werkzeug with poky but, I=20
> have not observed any patch-fuzz.
>
> Have followed the below steps:
>
> 1. Cloned the latest poky & meta-oe layer and switched to kirkstone=20
> branch for both of them.
>
> 2. Added latest meta-oe layer to poky build directory and built the=20
> python3-werkzeug successfully without any issue.
>
> Below are the logs in:
>
> meta-oe :
>
> $fd werkzeug
> meta-python/recipes-devtools/python/python3-werkzeug
> meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb=20
> <https://urldefense.com/v3/__http://python3-werkzeug_2.1.1.bb__;!!AjveY=
dw8EvQ!bNzZUbPJMjaw1YWRoQUxKvW7kTxX0XvbVNwuRxNV-k35b3IGEfWuNh3D14V-bwlmOU=
8kmxirRCb110cwf6ls$>
> $ls meta-python/recipes-devtools/python/python3-werkzeug
> CVE-2023-23934.patch=C2=A0 CVE-2023-25577.patch
> $vi meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb=20
> <https://urldefense.com/v3/__http://python3-werkzeug_2.1.1.bb__;!!AjveY=
dw8EvQ!bNzZUbPJMjaw1YWRoQUxKvW7kTxX0XvbVNwuRxNV-k35b3IGEfWuNh3D14V-bwlmOU=
8kmxirRCb110cwf6ls$>
> $git branch
> =C2=A0 dunfell
> * kirkstone
> =C2=A0 master
> =C2=A0 mickledore
> $
>
> Poky Build logs:
>
> $bitbake python3-werkzeug
> Loading cache: 100%=20
> |######################################################################=
####################|=20
> Time: 0:00:05
> Loaded 4328 entries from dependency cache.
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=3D "2.0.0"
> BUILD_SYS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 =3D "x86_64-linux"
> NATIVELSBSTRING=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "universal"
> TARGET_SYS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=3D "x86_64-poky-linux"
> MACHINE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =3D "qemux86-64"
> DISTRO=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 =3D "poky"
> DISTRO_VERSION=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "4.0.11"
> TUNE_FEATURES=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "m64 core2"
> TARGET_FPU=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=3D ""
> meta
> meta-poky
> meta-yocto-bsp=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=20
> "kirkstone:fc697fe87412b9b179ae3a68d266ace85bb1fcc6"
> meta-filesystems
> meta-gnome
> meta-initramfs
> meta-multimedia
> meta-networking
> meta-oe
> meta-perl
> meta-python
> meta-webserver
> meta-xfce=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 =3D=20
> "kirkstone:a82d92c8a6525da01524bf8f4a60bf6b35dcbb3d"
>
> Initialising tasks: 100%=20
> |######################################################################=
###############|=20
> Time: 0:00:02
> Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 279 (0%=20
> match, 100% complete)
> NOTE: Executing Tasks
> NOTE: Tasks Summary: Attempted 1056 tasks of which 1056 didn't need to=20
> be rerun and all succeeded.
> $ls tmp/work/core2-64-poky-linux/python3-werkzeug/2.1.1-r0/
> CVE-2023-23934.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dist packages-split=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pseudo=20
> source-date-epoch
> CVE-2023-25577.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 image pkgdata=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> python3-werkzeug.spec=C2=A0 sysroot-destdir
> deploy-rpms=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 license-destdir pkgdata-pdata-input=C2=A0=20
> recipe-sysroot=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 temp
> deploy-source-date-epoch=C2=A0 package pkgdata-sysroot=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=20
> recipe-sysroot-native=C2=A0 Werkzeug-2.1.1
> nmali@blr-linux-engg1$
>
> Best Regards,
>
> Narpat
>
>     On Wed, May 10, 2023 at 4:16=E2=80=AFPM Narpat Mali via
>     lists.openembedded.org
>     <https://urldefense.com/v3/__http:/lists.openembedded.org__;!!AjveY=
dw8EvQ!ZvOorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7PxwWGmD1tbYEb5Feqzv2UAhyU9=
W6r44OcxKB_13MA43zdPYINg$>
>     <narpat.mali=3Dwindriver.com@lists.openembedded.org> wrote:
>
>         From: Narpat Mali <narpat.mali@windriver.com>
>
>         Werkzeug is a comprehensive WSGI web application library.
>         Browsers may allow
>         "nameless" cookies that look like `=3Dvalue` instead of
>         `key=3Dvalue`. A vulnerable
>         browser may allow a compromised application on an adjacent
>         subdomain to exploit
>         this to set a cookie like `=3D__Host-test=3Dbad` for another
>         subdomain. Werkzeug
>         prior to 2.2.3 will parse the cookie `=3D__Host-test=3Dbad` as
>         __Host-test=3Dbad`.
>         If a Werkzeug application is running next to a vulnerable or
>         malicious subdomain
>         which sets such a cookie using a vulnerable browser, the
>         Werkzeug application
>         will see the bad cookie value but the valid cookie key. The
>         issue is fixed in
>         Werkzeug 2.2.3.
>
>         Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
>         ---
>         =C2=A0.../python3-werkzeug/CVE-2023-23934.patch=C2=A0 =C2=A0 =C2=
=A0| 116
>         ++++++++++++++++++
>         =C2=A0.../python/python3-werkzeug_2.1.1.bb
>         <https://urldefense.com/v3/__http:/python3-werkzeug_2.1.1.bb__;=
!!AjveYdw8EvQ!ZvOorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7PxwWGmD1tbYEb5Feqzv=
2UAhyU9W6r44OcxKB_13MA41M9C3f8A$>
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +
>         =C2=A02 files changed, 118 insertions(+)
>         =C2=A0create mode 100644
>         meta-python/recipes-devtools/python/python3-werkzeug/CVE-2023-2=
3934.patch
>
>         diff --git
>         a/meta-python/recipes-devtools/python/python3-werkzeug/CVE-2023=
-23934.patch
>         b/meta-python/recipes-devtools/python/python3-werkzeug/CVE-2023=
-23934.patch
>         new file mode 100644
>         index 0000000000..0be97d2888
>         --- /dev/null
>         +++
>         b/meta-python/recipes-devtools/python/python3-werkzeug/CVE-2023=
-23934.patch
>         @@ -0,0 +1,116 @@
>         +From b070a40ebbd89d88f4d8144a6ece017d33604d00 Mon Sep 17
>         00:00:00 2001
>         +From: David Lord <davidism@gmail.com>
>         +Date: Wed, 10 May 2023 11:33:18 +0000
>         +Subject: [PATCH] Merge pull request from GHSA-px8h-6qxv-m22q
>         +
>         +don't strip leading `=3D` when parsing cookie
>         +
>         +"src/werkzeug/sansio/http.py" file is not available in the
>         current recipe
>         +version 2.1.1 and this has been introduced from 2.2.0
>         version. Before 2.2.0
>         +version, this http.py
>         <https://urldefense.com/v3/__http:/http.py__;!!AjveYdw8EvQ!ZvOo=
rDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44OcxKB_=
13MA42CACK-xA$>
>         file was only available in the "src/werkzeug/http.py"
>         +and we could see the same functions available there which are
>         getting modified
>         +in the CVE fix commit. Hence, modifying the same at
>         "src/werkzeug/http.py" file.
>         +
>         +CVE: CVE-2023-23934
>         +
>         +Upstream-Status: Backport
>         [https://github.com/pallets/werkzeug/commit/cf275f42acad1b5950c=
50ffe8ef58fe62cdce028
>         <https://urldefense.com/v3/__https:/github.com/pallets/werkzeug=
/commit/cf275f42acad1b5950c50ffe8ef58fe62cdce028__;!!AjveYdw8EvQ!ZvOorDfO=
Q_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44OcxKB_13MA=
42AsHiz9w$>]
>         +
>         +Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
>         +---
>         + CHANGES.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 4 ++++
>         + src/werkzeug/_internal.py
>         <https://urldefense.com/v3/__http:/_internal.py__;!!AjveYdw8EvQ=
!ZvOorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44O=
cxKB_13MA41UuKh0Rw$>
>         | 13 +++++++++----
>         + src/werkzeug/http.py=C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ----
>         + tests/test_http.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +++-
>         + 4 files changed, 16 insertions(+), 9 deletions(-)
>         +
>         +diff --git a/CHANGES.rst b/CHANGES.rst
>         +index a351d7c..23505d3 100644
>         +--- a/CHANGES.rst
>         ++++ b/CHANGES.rst
>         +@@ -1,5 +1,9 @@
>         + .. currentmodule:: werkzeug
>         +
>         ++-=C2=A0 =C2=A0A cookie header that starts with ``=3D`` is tre=
ated as an
>         empty key and discarded,
>         ++=C2=A0 =C2=A0 rather than stripping the leading ``=3D=3D``.
>         ++
>         ++
>         + Version 2.1.1
>         + -------------
>         +
>         +diff --git a/src/werkzeug/_internal.py
>         <https://urldefense.com/v3/__http:/_internal.py__;!!AjveYdw8EvQ=
!ZvOorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44O=
cxKB_13MA41UuKh0Rw$>
>         b/src/werkzeug/_internal.py
>         <https://urldefense.com/v3/__http:/_internal.py__;!!AjveYdw8EvQ=
!ZvOorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44O=
cxKB_13MA41UuKh0Rw$>
>         +index a8b3523..d6290ba 100644
>         +--- a/src/werkzeug/_internal.py
>         <https://urldefense.com/v3/__http:/_internal.py__;!!AjveYdw8EvQ=
!ZvOorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44O=
cxKB_13MA41UuKh0Rw$>
>         ++++ b/src/werkzeug/_internal.py
>         <https://urldefense.com/v3/__http:/_internal.py__;!!AjveYdw8EvQ=
!ZvOorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44O=
cxKB_13MA41UuKh0Rw$>
>         +@@ -34,7 +34,7 @@ _quote_re =3D re.compile(rb"[\\].")
>         + _legal_cookie_chars_re =3D
>         rb"[\w\d!#%&\'~_`><@,:/\$\*\+\-\.\^\|\)\(\?\}\{\=3D]"
>         + _cookie_re =3D re.compile(
>         +=C2=A0 =C2=A0 =C2=A0rb"""
>         +-=C2=A0 =C2=A0 (?P<key>[^=3D;]+)
>         ++=C2=A0 =C2=A0 (?P<key>[^=3D;]*)
>         +=C2=A0 =C2=A0 =C2=A0(?:\s*=3D\s*
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(?P<val>
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"(?:[^\\"]|\\.=
)*" |
>         +@@ -382,16 +382,21 @@ def _cookie_parse_impl(b: bytes) ->
>         t.Iterator[t.Tuple[bytes, bytes]]:
>         +=C2=A0 =C2=A0 =C2=A0"""Lowlevel cookie parsing facility that o=
perates on
>         bytes."""
>         +=C2=A0 =C2=A0 =C2=A0i =3D 0
>         +=C2=A0 =C2=A0 =C2=A0n =3D len(b)
>         ++=C2=A0 =C2=A0 b +=3D b";"
>         +
>         +=C2=A0 =C2=A0 =C2=A0while i < n:
>         +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 match =3D _cookie_re.search(b + b=
";", i)
>         ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 match =3D _cookie_re.match(b, i)
>         ++
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not match:
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break
>         +
>         +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 key =3D match.group("key").strip(=
)
>         +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D match.group("val") or b=
""
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i =3D match.end(0)
>         ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 key =3D match.group("key").strip(=
)
>         ++
>         ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not key:
>         ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue
>         +
>         ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D match.group("val") or b=
""
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0yield key, _cookie_unquote(v=
alue)
>         +
>         +
>         +diff --git a/src/werkzeug/http.py
>         <https://urldefense.com/v3/__http:/http.py__;!!AjveYdw8EvQ!ZvOo=
rDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44OcxKB_=
13MA42CACK-xA$>
>         b/src/werkzeug/http.py
>         <https://urldefense.com/v3/__http:/http.py__;!!AjveYdw8EvQ!ZvOo=
rDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44OcxKB_=
13MA42CACK-xA$>
>         +index 9369900..ae133e3 100644
>         +--- a/src/werkzeug/http.py
>         <https://urldefense.com/v3/__http:/http.py__;!!AjveYdw8EvQ!ZvOo=
rDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44OcxKB_=
13MA42CACK-xA$>
>         ++++ b/src/werkzeug/http.py
>         <https://urldefense.com/v3/__http:/http.py__;!!AjveYdw8EvQ!ZvOo=
rDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44OcxKB_=
13MA42CACK-xA$>
>         +@@ -1205,10 +1205,6 @@ def parse_cookie(
>         +=C2=A0 =C2=A0 =C2=A0def _parse_pairs() -> t.Iterator[t.Tuple[s=
tr, str]]:
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for key, val in _cookie_pars=
e_impl(header):=C2=A0 # type:
>         ignore
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0key_str =3D _t=
o_str(key, charset, errors,
>         allow_none_charset=3DTrue)
>         +-
>         +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not key_str:
>         +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 conti=
nue
>         +-
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val_str =3D _t=
o_str(val, charset, errors,
>         allow_none_charset=3DTrue)
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0yield key_str,=
 val_str
>         +
>         +diff --git a/tests/test_http.py
>         <https://urldefense.com/v3/__http:/test_http.py__;!!AjveYdw8EvQ=
!ZvOorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44O=
cxKB_13MA42izb7SXw$>
>         b/tests/test_http.py
>         <https://urldefense.com/v3/__http:/test_http.py__;!!AjveYdw8EvQ=
!ZvOorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44O=
cxKB_13MA42izb7SXw$>
>         +index 5936bfa..59cc179 100644
>         +--- a/tests/test_http.py
>         <https://urldefense.com/v3/__http:/test_http.py__;!!AjveYdw8EvQ=
!ZvOorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44O=
cxKB_13MA42izb7SXw$>
>         ++++ b/tests/test_http.py
>         <https://urldefense.com/v3/__http:/test_http.py__;!!AjveYdw8EvQ=
!ZvOorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44O=
cxKB_13MA42izb7SXw$>
>         +@@ -427,7 +427,8 @@ class TestHTTPUtility:
>         +=C2=A0 =C2=A0 =C2=A0def test_parse_cookie(self):
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cookies =3D http.parse_cooki=
e(
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"dismiss-top=3D=
6; CP=3Dnull*;
>         PHPSESSID=3D0a539d42abc001cdc762809248d4beed;"
>         +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 'a=3D42; b=3D"\\";"=
; ; fo234{=3Dbar;blub=3DBlah;
>         "__Secure-c"=3Dd'
>         ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 'a=3D42; b=3D"\\";"=
; ; fo234{=3Dbar;blub=3DBlah;
>         "__Secure-c"=3Dd;'
>         ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "=3D=3D__Host-eq=3D=
bad;__Host-eq=3Dgood;"
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert cookies.to_dict() =3D=
=3D {
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"CP": "null*",
>         +@@ -438,6 +439,7 @@ class TestHTTPUtility:
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"fo234{": "bar=
",
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"blub": "Blah"=
,
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'"__Secure-c"'=
: "d",
>         ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "__Host-eq": "good"=
,
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>         +
>         +=C2=A0 =C2=A0 =C2=A0def test_dump_cookie(self):
>         +--
>         +2.40.0
>         diff --git
>         a/meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb
>         <https://urldefense.com/v3/__http:/python3-werkzeug_2.1.1.bb__;=
!!AjveYdw8EvQ!ZvOorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7PxwWGmD1tbYEb5Feqzv=
2UAhyU9W6r44OcxKB_13MA41M9C3f8A$>
>         b/meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb
>         <https://urldefense.com/v3/__http:/python3-werkzeug_2.1.1.bb__;=
!!AjveYdw8EvQ!ZvOorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7PxwWGmD1tbYEb5Feqzv=
2UAhyU9W6r44OcxKB_13MA41M9C3f8A$>
>         index 476a3a5964..ca8705146e 100644
>         ---
>         a/meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb
>         <https://urldefense.com/v3/__http:/python3-werkzeug_2.1.1.bb__;=
!!AjveYdw8EvQ!ZvOorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7PxwWGmD1tbYEb5Feqzv=
2UAhyU9W6r44OcxKB_13MA41M9C3f8A$>
>         +++
>         b/meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb
>         <https://urldefense.com/v3/__http:/python3-werkzeug_2.1.1.bb__;=
!!AjveYdw8EvQ!ZvOorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7PxwWGmD1tbYEb5Feqzv=
2UAhyU9W6r44OcxKB_13MA41M9C3f8A$>
>         @@ -12,6 +12,8 @@ LIC_FILES_CHKSUM =3D
>         "file://LICENSE.rst;md5=3D5dc88300786f1c214c1e9827a5229462"
>         <file://LICENSE.rst;md5=3D5dc88300786f1c214c1e9827a5229462>
>
>         =C2=A0PYPI_PACKAGE =3D "Werkzeug"
>
>         +SRC_URI +=3D "file://CVE-2023-23934.patch"
>         <file://CVE-2023-23934.patch>
>         +
>         =C2=A0SRC_URI[sha256sum] =3D
>         "f8e89a20aeabbe8a893c24a461d3ee5dad2123b05cc6abd73ceed01d39c3ae=
74"
>
>         =C2=A0inherit pypi setuptools3
>         --=20
>         2.40.0
>
>
>
--------------HxU6hQSKufUKBR1iNum3nfZv
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 35TDhSdC018312

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 29-06-2023 07:10, Sanjaykumar
      kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at Cisco)
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:SJ0PR11MB6717FDC533F2A010BA17AF=
FEDC25A@SJ0PR11MB6717.namprd11.prod.outlook.com">
     =20
      <meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered
        medium)">
      <style>@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0cm;
	font-size:10.0pt;
	font-family:"Courier New";}span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:Consolas;}span.EmailStyle22
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}div.WordSection1
	{page:WordSection1;}</style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
      <strong>
      </strong>
      <div style=3D"border:solid #9c6500
        1pt;padding:2pt;background:#fcfc03"><strong><class=3D"msonormal" =
style=3D"line-height:11pt"><span style=3D"font-size:11pt;color:#000">CAUT=
ION: This email
              comes from a non Wind River email account!</span></class=3D=
"msonormal"></strong><br>
        <class=3D"msonormal" style=3D"line-height:10pt3"><span style=3D"f=
ont-size:10pt;color:#000">Do not click links or open
            attachments unless you recognize the sender and know the
            content is safe.</span><br>
        </class=3D"msonormal"></div>
      <div>
        <div class=3D"WordSection1">
          <p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-U=
S">Dear
              Narpat,<o:p></o:p></span></p>
          <p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-U=
S"><o:p>&nbsp;</o:p></span></p>
          <p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-U=
S">Once
              your </span><span lang=3D"EN-US">python3-werkzeug package
              is built successfully using bitbake.</span><span style=3D"m=
so-fareast-language:EN-US"><o:p></o:p></span></p>
          <p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-U=
S">You
              can try to check &lt;build&gt;/tmp/work/*/</span><span lang=
=3D"EN-US">python3-werkzeug/&lt;version&gt;/temp/log.do_patch
              file.<o:p></o:p></span></p>
          <p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></=
span></p>
          <p class=3D"MsoNormal"><span lang=3D"EN-US">It will provide the
              logs specific to do_patch task, where you can confirm this
              HUNK information.</span></p>
        </div>
      </div>
    </blockquote>
    <p>Thank you Sanjay, It helped me to confirm the HUNK information.</p=
>
    <p>@Martin, <br>
    </p>
    <p>Thanks for identifying the patch-fuzz. <br>
    </p>
    <p>Have sent the patch to fix the patch-fuzz :
<a class=3D"moz-txt-link-freetext" href=3D"https://lore.kernel.org/openem=
bedded-devel/20230629163608.3786099-1-narpat.mali@windriver.com/">https:/=
/lore.kernel.org/openembedded-devel/20230629163608.3786099-1-narpat.mali@=
windriver.com/</a></p>
    <p>Best Regards,</p>
    <p>Narpat<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:SJ0PR11MB6717FDC533F2A010BA17AF=
FEDC25A@SJ0PR11MB6717.namprd11.prod.outlook.com">
      <div>
        <div class=3D"WordSection1">
          <p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p></o:p></span><=
/p>
          <p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></=
span></p>
          <p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks,<o:p></o:p><=
/span></p>
          <p class=3D"MsoNormal"><span lang=3D"EN-US">Sanjay</span><span =
style=3D"mso-fareast-language:EN-US"><o:p></o:p></span></p>
          <p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-U=
S"><o:p>&nbsp;</o:p></span></p>
          <div>
            <div style=3D"border:none;border-top:solid #E1E1E1
              1.0pt;padding:3.0pt 0cm 0cm 0cm">
              <p class=3D"MsoNormal"><b><span lang=3D"EN-US">From:</span>=
</b><span lang=3D"EN-US">
                  <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:op=
enembedded-devel@lists.openembedded.org">openembedded-devel@lists.openemb=
edded.org</a>
                  <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:opene=
mbedded-devel@lists.openembedded.org">&lt;openembedded-devel@lists.openem=
bedded.org&gt;</a>
                  <b>On Behalf Of </b>Narpat Mali via <a href=3D"https://=
urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8EvQ!bNzZUbP=
JMjaw1YWRoQUxKvW7kTxX0XvbVNwuRxNV-k35b3IGEfWuNh3D14V-bwlmOU8kmxirRCb1197e=
3RBc$" moz-do-not-send=3D"true">
                    lists.openembedded.org</a><br>
                  <b>Sent:</b> Wednesday, June 28, 2023 11:49 AM<br>
                  <b>To:</b> Martin Jansa <a class=3D"moz-txt-link-rfc239=
6E" href=3D"mailto:martin.jansa@gmail.com">&lt;martin.jansa@gmail.com&gt;=
</a><br>
                  <b>Cc:</b> <a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:openembedded-devel@lists.openembedded.org">openembedded-devel@lis=
ts.openembedded.org</a>;
                  <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:ha=
ri.gpillai@windriver.com">hari.gpillai@windriver.com</a><br>
                  <b>Subject:</b> Re: [oe] [meta-oe][kirkstone][PATCH
                  1/1] python3-werkzeug: fix for CVE-2023-23934<o:p></o:p=
></span></p>
            </div>
          </div>
          <p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
          <div>
            <p class=3D"MsoNormal">On 24-06-2023 19:41, Martin Jansa
              wrote:<o:p></o:p></p>
          </div>
          <blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
            <div style=3D"border:solid #9C6500 1.0pt;padding:2.0pt 2.0pt
              2.0pt 2.0pt">
              <p class=3D"MsoNormal" style=3D"background:#FCFC03"><strong=
><span style=3D"font-family:&quot;Calibri&quot;,sans-serif;color:black">C=
AUTION:
                    This email comes from a non Wind River email
                    account!</span></strong><span style=3D"color:black"><=
br>
                </span><span style=3D"font-size:10.0pt;color:black">Do no=
t
                  click links or open attachments unless you recognize
                  the sender and know the content is safe.</span><span st=
yle=3D"color:black"><br>
                  <br>
                </span><o:p></o:p></p>
            </div>
            <div>
              <div>
                <pre>This change is now merged in kirkstone and causes:</=
pre>
                <pre>ERROR: python3-werkzeug-2.1.1-r0 do_patch: Fuzz dete=
cted:</pre>
                <pre>&nbsp;</pre>
                <pre>Applying patch CVE-2023-23934.patch</pre>
                <pre>patching file CHANGES.rst</pre>
                <pre>Hunk #1 succeeded at 6 with fuzz 2 (offset 5 lines).=
</pre>
                <pre>patching file src/werkzeug/_internal.py</pre>
                <pre>patching file src/werkzeug/http.py</pre>
                <pre>patching file tests/test_http.py</pre>
                <pre>&nbsp;</pre>
                <pre>&nbsp;</pre>
                <pre>The context lines in the patches can be updated with=
 devtool:</pre>
                <pre>&nbsp;</pre>
                <pre>&nbsp;&nbsp;&nbsp; devtool modify python3-werkzeug</=
pre>
                <pre>&nbsp;&nbsp;&nbsp; devtool finish --force-patch-refr=
esh python3-werkzeug &lt;layer_path&gt;</pre>
                <pre>&nbsp;</pre>
                <pre>Don't forget to review changes done by devtool!</pre=
>
                <pre>&nbsp;</pre>
                <pre>ERROR: python3-werkzeug-2.1.1-r0 do_patch: QA Issue:=
 Patch log indicates that patches do not apply cleanly. [patch-fuzz]</pre=
>
                <pre>Please send follow-up patch to fix patch-fuzz.</pre>
              </div>
            </div>
          </blockquote>
          <p>Hi Martin,<o:p></o:p></p>
          <p>Thanks for checking.<o:p></o:p></p>
          <p>Have double checked with building python3-werkzeug with
            poky but, I have not observed any patch-fuzz.<o:p></o:p></p>
          <p>Have followed the below steps:<o:p></o:p></p>
          <p>1. Cloned the latest poky &amp; meta-oe layer and switched
            to kirkstone branch for both of them.<o:p></o:p></p>
          <p>2. Added latest meta-oe layer to poky build directory and
            built the python3-werkzeug successfully without any issue.<o:=
p></o:p></p>
          <p>Below are the logs in:<o:p></o:p></p>
          <p>meta-oe :<o:p></o:p></p>
          <p>$fd werkzeug<br>
            meta-python/recipes-devtools/python/python3-werkzeug<br>
            meta-python/recipes-devtools/python/<a href=3D"https://urldef=
ense.com/v3/__http://python3-werkzeug_2.1.1.bb__;!!AjveYdw8EvQ!bNzZUbPJMj=
aw1YWRoQUxKvW7kTxX0XvbVNwuRxNV-k35b3IGEfWuNh3D14V-bwlmOU8kmxirRCb110cwf6l=
s$" moz-do-not-send=3D"true">python3-werkzeug_2.1.1.bb</a><br>
            $ls meta-python/recipes-devtools/python/python3-werkzeug<br>
            CVE-2023-23934.patch&nbsp; CVE-2023-25577.patch<br>
            $vi meta-python/recipes-devtools/python/<a href=3D"https://ur=
ldefense.com/v3/__http://python3-werkzeug_2.1.1.bb__;!!AjveYdw8EvQ!bNzZUb=
PJMjaw1YWRoQUxKvW7kTxX0XvbVNwuRxNV-k35b3IGEfWuNh3D14V-bwlmOU8kmxirRCb110c=
wf6ls$" moz-do-not-send=3D"true">python3-werkzeug_2.1.1.bb</a><br>
            $git branch<br>
            &nbsp; dunfell<br>
            * kirkstone<br>
            &nbsp; master<br>
            &nbsp; mickledore<br>
            $<o:p></o:p></p>
          <p>Poky Build logs:<o:p></o:p></p>
          <p style=3D"margin-bottom:12.0pt">$bitbake python3-werkzeug<br>
            Loading cache: 100%
|########################################################################=
##################|
            Time: 0:00:05<br>
            Loaded 4328 entries from dependency cache.<br>
            NOTE: Resolving any missing task queue dependencies<br>
            <br>
            Build Configuration:<br>
            BB_VERSION&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; =3D &quot;2.0.0&quot;<br>
            BUILD_SYS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; =3D &quot;x86_64-linux&quot;<br>
            NATIVELSBSTRING&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;unive=
rsal&quot;<br>
            TARGET_SYS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; =3D &quot;x86_64-poky-linux&quot;<br>
            MACHINE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;qemux86-64&quot;<br>
            DISTRO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;poky&quot;<br>
            DISTRO_VERSION&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;=
4.0.11&quot;<br>
            TUNE_FEATURES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &=
quot;m64 core2&quot;<br>
            TARGET_FPU&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; =3D &quot;&quot;<br>
            meta<br>
            meta-poky<br>
            meta-yocto-bsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D
            &quot;kirkstone:fc697fe87412b9b179ae3a68d266ace85bb1fcc6&quot=
;<br>
            meta-filesystems<br>
            meta-gnome<br>
            meta-initramfs<br>
            meta-multimedia<br>
            meta-networking<br>
            meta-oe<br>
            meta-perl<br>
            meta-python<br>
            meta-webserver<br>
            meta-xfce&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; =3D
            &quot;kirkstone:a82d92c8a6525da01524bf8f4a60bf6b35dcbb3d&quot=
;<br>
            <br>
            Initialising tasks: 100%
|########################################################################=
#############|
            Time: 0:00:02<br>
            Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current
            279 (0% match, 100% complete)<br>
            NOTE: Executing Tasks<br>
            NOTE: Tasks Summary: Attempted 1056 tasks of which 1056
            didn't need to be rerun and all succeeded.<br>
            $ls tmp/work/core2-64-poky-linux/python3-werkzeug/2.1.1-r0/<b=
r>
            CVE-2023-23934.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dist&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            packages-split&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pseudo&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;
            source-date-epoch<br>
            CVE-2023-25577.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; image&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            pkgdata&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; python3-werkzeug.spec&nbsp; sysroot-destdir<br>
            deploy-rpms&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; license-destdir&nbsp;
            pkgdata-pdata-input&nbsp; recipe-sysroot&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; temp<br>
            deploy-source-date-epoch&nbsp; package&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            pkgdata-sysroot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; recipe-sysroot-=
native&nbsp; Werkzeug-2.1.1<br>
            nmali@blr-linux-engg1$<o:p></o:p></p>
          <p>Best Regards,<o:p></o:p></p>
          <p>Narpat<o:p></o:p></p>
          <blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
            <div>
              <p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
              <div>
                <div>
                  <p class=3D"MsoNormal">On Wed, May 10, 2023 at 4:16=E2=80=
=AFPM
                    Narpat Mali via <a href=3D"https://urldefense.com/v3/=
__http:/lists.openembedded.org__;!!AjveYdw8EvQ!ZvOorDfOQ_KpEJTHk_XU_lnxna=
CMh_Vx1SzdGqA7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44OcxKB_13MA43zdPYINg$" moz-do=
-not-send=3D"true">
                      lists.openembedded.org</a> &lt;narpat.mali=3D<a hre=
f=3D"mailto:windriver.com@lists.openembedded.org" moz-do-not-send=3D"true=
" class=3D"moz-txt-link-freetext">windriver.com@lists.openembedded.org</a=
>&gt;
                    wrote:<o:p></o:p></p>
                </div>
                <blockquote style=3D"border:none;border-left:solid #CCCCC=
C
                  1.0pt;padding:0cm 0cm 0cm
                  6.0pt;margin-left:4.8pt;margin-right:0cm">
                  <p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">F=
rom:
                    Narpat Mali &lt;<a href=3D"mailto:narpat.mali@windriv=
er.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-=
freetext">narpat.mali@windriver.com</a>&gt;<br>
                    <br>
                    Werkzeug is a comprehensive WSGI web application
                    library. Browsers may allow<br>
                    &quot;nameless&quot; cookies that look like `=3Dvalue=
` instead
                    of `key=3Dvalue`. A vulnerable<br>
                    browser may allow a compromised application on an
                    adjacent subdomain to exploit<br>
                    this to set a cookie like `=3D__Host-test=3Dbad` for
                    another subdomain. Werkzeug<br>
                    prior to 2.2.3 will parse the cookie
                    `=3D__Host-test=3Dbad` as __Host-test=3Dbad`.<br>
                    If a Werkzeug application is running next to a
                    vulnerable or malicious subdomain<br>
                    which sets such a cookie using a vulnerable browser,
                    the Werkzeug application<br>
                    will see the bad cookie value but the valid cookie
                    key. The issue is fixed in<br>
                    Werkzeug 2.2.3.<br>
                    <br>
                    Signed-off-by: Narpat Mali &lt;<a href=3D"mailto:narp=
at.mali@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D=
"moz-txt-link-freetext">narpat.mali@windriver.com</a>&gt;<br>
                    ---<br>
                    &nbsp;.../python3-werkzeug/CVE-2023-23934.patch&nbsp;=
 &nbsp; &nbsp;| 116
                    ++++++++++++++++++<br>
                    &nbsp;.../python/<a href=3D"https://urldefense.com/v3=
/__http:/python3-werkzeug_2.1.1.bb__;!!AjveYdw8EvQ!ZvOorDfOQ_KpEJTHk_XU_l=
nxnaCMh_Vx1SzdGqA7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44OcxKB_13MA41M9C3f8A$" ta=
rget=3D"_blank" moz-do-not-send=3D"true">python3-werkzeug_2.1.1.bb</a>&nb=
sp;
                    &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; &nbsp;2 +<br>
                    &nbsp;2 files changed, 118 insertions(+)<br>
                    &nbsp;create mode 100644
meta-python/recipes-devtools/python/python3-werkzeug/CVE-2023-23934.patch=
<br>
                    <br>
                    diff --git
a/meta-python/recipes-devtools/python/python3-werkzeug/CVE-2023-23934.pat=
ch
b/meta-python/recipes-devtools/python/python3-werkzeug/CVE-2023-23934.pat=
ch<br>
                    new file mode 100644<br>
                    index 0000000000..0be97d2888<br>
                    --- /dev/null<br>
                    +++
b/meta-python/recipes-devtools/python/python3-werkzeug/CVE-2023-23934.pat=
ch<br>
                    @@ -0,0 +1,116 @@<br>
                    +From b070a40ebbd89d88f4d8144a6ece017d33604d00 Mon
                    Sep 17 00:00:00 2001<br>
                    +From: David Lord &lt;<a href=3D"mailto:davidism@gmai=
l.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-f=
reetext">davidism@gmail.com</a>&gt;<br>
                    +Date: Wed, 10 May 2023 11:33:18 +0000<br>
                    +Subject: [PATCH] Merge pull request from
                    GHSA-px8h-6qxv-m22q<br>
                    +<br>
                    +don't strip leading `=3D` when parsing cookie<br>
                    +<br>
                    +&quot;src/werkzeug/sansio/http.py&quot; file is not =
available
                    in the current recipe<br>
                    +version 2.1.1 and this has been introduced from
                    2.2.0 version. Before 2.2.0<br>
                    +version, this <a href=3D"https://urldefense.com/v3/_=
_http:/http.py__;!!AjveYdw8EvQ!ZvOorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7Px=
wWGmD1tbYEb5Feqzv2UAhyU9W6r44OcxKB_13MA42CACK-xA$" moz-do-not-send=3D"tru=
e">
                      http.py</a> file was only available in the
                    &quot;src/werkzeug/http.py&quot;<br>
                    +and we could see the same functions available there
                    which are getting modified<br>
                    +in the CVE fix commit. Hence, modifying the same at
                    &quot;src/werkzeug/http.py&quot; file.<br>
                    +<br>
                    +CVE: CVE-2023-23934<br>
                    +<br>
                    +Upstream-Status: Backport [<a href=3D"https://urldef=
ense.com/v3/__https:/github.com/pallets/werkzeug/commit/cf275f42acad1b595=
0c50ffe8ef58fe62cdce028__;!!AjveYdw8EvQ!ZvOorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1=
SzdGqA7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44OcxKB_13MA42AsHiz9w$" target=3D"_bl=
ank" moz-do-not-send=3D"true">https://github.com/pallets/werkzeug/commit/=
cf275f42acad1b5950c50ffe8ef58fe62cdce028</a>]<br>
                    +<br>
                    +Signed-off-by: Narpat Mali &lt;<a href=3D"mailto:nar=
pat.mali@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D=
"moz-txt-link-freetext">narpat.mali@windriver.com</a>&gt;<br>
                    +---<br>
                    + CHANGES.rst&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;|&nbsp; 4 ++++<br>
                    + src/werkzeug/<a href=3D"https://urldefense.com/v3/_=
_http:/_internal.py__;!!AjveYdw8EvQ!ZvOorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdG=
qA7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44OcxKB_13MA41UuKh0Rw$" moz-do-not-send=3D=
"true">_internal.py</a> | 13
                    +++++++++----<br>
                    + src/werkzeug/http.py&nbsp; &nbsp; &nbsp; |&nbsp; 4 =
----<br>
                    + tests/test_http.py&nbsp; &nbsp; &nbsp; &nbsp; |&nbs=
p; 4 +++-<br>
                    + 4 files changed, 16 insertions(+), 9 deletions(-)<b=
r>
                    +<br>
                    +diff --git a/CHANGES.rst b/CHANGES.rst<br>
                    +index a351d7c..23505d3 100644<br>
                    +--- a/CHANGES.rst<br>
                    ++++ b/CHANGES.rst<br>
                    +@@ -1,5 +1,9 @@<br>
                    + .. currentmodule:: werkzeug<br>
                    +<br>
                    ++-&nbsp; &nbsp;A cookie header that starts with ``=3D=
`` is
                    treated as an empty key and discarded,<br>
                    ++&nbsp; &nbsp; rather than stripping the leading ``=3D=
=3D``.<br>
                    ++<br>
                    ++<br>
                    + Version 2.1.1<br>
                    + -------------<br>
                    +<br>
                    +diff --git a/src/werkzeug/<a href=3D"https://urldefe=
nse.com/v3/__http:/_internal.py__;!!AjveYdw8EvQ!ZvOorDfOQ_KpEJTHk_XU_lnxn=
aCMh_Vx1SzdGqA7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44OcxKB_13MA41UuKh0Rw$" moz-d=
o-not-send=3D"true">_internal.py</a>
                    b/src/werkzeug/<a href=3D"https://urldefense.com/v3/_=
_http:/_internal.py__;!!AjveYdw8EvQ!ZvOorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdG=
qA7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44OcxKB_13MA41UuKh0Rw$" moz-do-not-send=3D=
"true">_internal.py</a><br>
                    +index a8b3523..d6290ba 100644<br>
                    +--- a/src/werkzeug/<a href=3D"https://urldefense.com=
/v3/__http:/_internal.py__;!!AjveYdw8EvQ!ZvOorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx=
1SzdGqA7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44OcxKB_13MA41UuKh0Rw$" moz-do-not-s=
end=3D"true">_internal.py</a><br>
                    ++++ b/src/werkzeug/<a href=3D"https://urldefense.com=
/v3/__http:/_internal.py__;!!AjveYdw8EvQ!ZvOorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx=
1SzdGqA7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44OcxKB_13MA41UuKh0Rw$" moz-do-not-s=
end=3D"true">_internal.py</a><br>
                    +@@ -34,7 +34,7 @@ _quote_re =3D re.compile(rb&quot;[=
\\].&quot;)<br>
                    + _legal_cookie_chars_re =3D
                    rb&quot;[\w\d!#%&amp;\'~_`&gt;&lt;@,:/\$\*\+\-\.\^\|\=
)\(\?\}\{\=3D]&quot;<br>
                    + _cookie_re =3D re.compile(<br>
                    +&nbsp; &nbsp; &nbsp;rb&quot;&quot;&quot;<br>
                    +-&nbsp; &nbsp; (?P&lt;key&gt;[^=3D;]+)<br>
                    ++&nbsp; &nbsp; (?P&lt;key&gt;[^=3D;]*)<br>
                    +&nbsp; &nbsp; &nbsp;(?:\s*=3D\s*<br>
                    +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(?P&lt;val&gt;<br>
                    +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quo=
t;(?:[^\\&quot;]|\\.)*&quot; |<br>
                    +@@ -382,16 +382,21 @@ def _cookie_parse_impl(b:
                    bytes) -&gt; t.Iterator[t.Tuple[bytes, bytes]]:<br>
                    +&nbsp; &nbsp; &nbsp;&quot;&quot;&quot;Lowlevel cooki=
e parsing facility that
                    operates on bytes.&quot;&quot;&quot;<br>
                    +&nbsp; &nbsp; &nbsp;i =3D 0<br>
                    +&nbsp; &nbsp; &nbsp;n =3D len(b)<br>
                    ++&nbsp; &nbsp; b +=3D b&quot;;&quot;<br>
                    +<br>
                    +&nbsp; &nbsp; &nbsp;while i &lt; n:<br>
                    +-&nbsp; &nbsp; &nbsp; &nbsp; match =3D _cookie_re.se=
arch(b + b&quot;;&quot;, i)<br>
                    ++&nbsp; &nbsp; &nbsp; &nbsp; match =3D _cookie_re.ma=
tch(b, i)<br>
                    ++<br>
                    +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if not match:<br>
                    +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;brea=
k<br>
                    +<br>
                    +-&nbsp; &nbsp; &nbsp; &nbsp; key =3D match.group(&qu=
ot;key&quot;).strip()<br>
                    +-&nbsp; &nbsp; &nbsp; &nbsp; value =3D match.group(&=
quot;val&quot;) or b&quot;&quot;<br>
                    +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;i =3D match.end(0)=
<br>
                    ++&nbsp; &nbsp; &nbsp; &nbsp; key =3D match.group(&qu=
ot;key&quot;).strip()<br>
                    ++<br>
                    ++&nbsp; &nbsp; &nbsp; &nbsp; if not key:<br>
                    ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; continue<=
br>
                    +<br>
                    ++&nbsp; &nbsp; &nbsp; &nbsp; value =3D match.group(&=
quot;val&quot;) or b&quot;&quot;<br>
                    +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;yield key, _cookie=
_unquote(value)<br>
                    +<br>
                    +<br>
                    +diff --git a/src/werkzeug/<a href=3D"https://urldefe=
nse.com/v3/__http:/http.py__;!!AjveYdw8EvQ!ZvOorDfOQ_KpEJTHk_XU_lnxnaCMh_=
Vx1SzdGqA7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44OcxKB_13MA42CACK-xA$" moz-do-not=
-send=3D"true">http.py</a> b/src/werkzeug/<a href=3D"https://urldefense.c=
om/v3/__http:/http.py__;!!AjveYdw8EvQ!ZvOorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1Sz=
dGqA7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44OcxKB_13MA42CACK-xA$" moz-do-not-send=
=3D"true">http.py</a><br>
                    +index 9369900..ae133e3 100644<br>
                    +--- a/src/werkzeug/<a href=3D"https://urldefense.com=
/v3/__http:/http.py__;!!AjveYdw8EvQ!ZvOorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdG=
qA7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44OcxKB_13MA42CACK-xA$" moz-do-not-send=3D=
"true">http.py</a><br>
                    ++++ b/src/werkzeug/<a href=3D"https://urldefense.com=
/v3/__http:/http.py__;!!AjveYdw8EvQ!ZvOorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdG=
qA7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44OcxKB_13MA42CACK-xA$" moz-do-not-send=3D=
"true">http.py</a><br>
                    +@@ -1205,10 +1205,6 @@ def parse_cookie(<br>
                    +&nbsp; &nbsp; &nbsp;def _parse_pairs() -&gt;
                    t.Iterator[t.Tuple[str, str]]:<br>
                    +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;for key, val in
                    _cookie_parse_impl(header):&nbsp; # type: ignore<br>
                    +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;key_=
str =3D _to_str(key, charset,
                    errors, allow_none_charset=3DTrue)<br>
                    +-<br>
                    +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if not ke=
y_str:<br>
                    +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; continue<br>
                    +-<br>
                    +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val_=
str =3D _to_str(val, charset,
                    errors, allow_none_charset=3DTrue)<br>
                    +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;yiel=
d key_str, val_str<br>
                    +<br>
                    +diff --git a/tests/<a href=3D"https://urldefense.com=
/v3/__http:/test_http.py__;!!AjveYdw8EvQ!ZvOorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx=
1SzdGqA7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44OcxKB_13MA42izb7SXw$" moz-do-not-s=
end=3D"true">test_http.py</a> b/tests/<a href=3D"https://urldefense.com/v=
3/__http:/test_http.py__;!!AjveYdw8EvQ!ZvOorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1S=
zdGqA7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44OcxKB_13MA42izb7SXw$" moz-do-not-sen=
d=3D"true">test_http.py</a><br>
                    +index 5936bfa..59cc179 100644<br>
                    +--- a/tests/<a href=3D"https://urldefense.com/v3/__h=
ttp:/test_http.py__;!!AjveYdw8EvQ!ZvOorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA=
7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44OcxKB_13MA42izb7SXw$" moz-do-not-send=3D"=
true">test_http.py</a><br>
                    ++++ b/tests/<a href=3D"https://urldefense.com/v3/__h=
ttp:/test_http.py__;!!AjveYdw8EvQ!ZvOorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA=
7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44OcxKB_13MA42izb7SXw$" moz-do-not-send=3D"=
true">test_http.py</a><br>
                    +@@ -427,7 +427,8 @@ class TestHTTPUtility:<br>
                    +&nbsp; &nbsp; &nbsp;def test_parse_cookie(self):<br>
                    +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;cookies =3D http.p=
arse_cookie(<br>
                    +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quo=
t;dismiss-top=3D6; CP=3Dnull*;
                    PHPSESSID=3D0a539d42abc001cdc762809248d4beed;&quot;<b=
r>
                    +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 'a=3D42; =
b=3D&quot;\\&quot;;&quot;; ;
                    fo234{=3Dbar;blub=3DBlah; &quot;__Secure-c&quot;=3Dd'=
<br>
                    ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 'a=3D42; =
b=3D&quot;\\&quot;;&quot;; ;
                    fo234{=3Dbar;blub=3DBlah; &quot;__Secure-c&quot;=3Dd;=
'<br>
                    ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;=3D=
=3D__Host-eq=3Dbad;__Host-eq=3Dgood;&quot;<br>
                    +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;)<br>
                    +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;assert cookies.to_=
dict() =3D=3D {<br>
                    +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quo=
t;CP&quot;: &quot;null*&quot;,<br>
                    +@@ -438,6 +439,7 @@ class TestHTTPUtility:<br>
                    +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quo=
t;fo234{&quot;: &quot;bar&quot;,<br>
                    +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quo=
t;blub&quot;: &quot;Blah&quot;,<br>
                    +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;'&qu=
ot;__Secure-c&quot;': &quot;d&quot;,<br>
                    ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;__H=
ost-eq&quot;: &quot;good&quot;,<br>
                    +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
                    +<br>
                    +&nbsp; &nbsp; &nbsp;def test_dump_cookie(self):<br>
                    +--<br>
                    +2.40.0<br>
                    diff --git a/meta-python/recipes-devtools/python/<a h=
ref=3D"https://urldefense.com/v3/__http:/python3-werkzeug_2.1.1.bb__;!!Aj=
veYdw8EvQ!ZvOorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7PxwWGmD1tbYEb5Feqzv2UAh=
yU9W6r44OcxKB_13MA41M9C3f8A$" target=3D"_blank" moz-do-not-send=3D"true">=
python3-werkzeug_2.1.1.bb</a>
                    b/meta-python/recipes-devtools/python/<a href=3D"http=
s://urldefense.com/v3/__http:/python3-werkzeug_2.1.1.bb__;!!AjveYdw8EvQ!Z=
vOorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44Ocx=
KB_13MA41M9C3f8A$" target=3D"_blank" moz-do-not-send=3D"true">python3-wer=
kzeug_2.1.1.bb</a><br>
                    index 476a3a5964..ca8705146e 100644<br>
                    --- a/meta-python/recipes-devtools/python/<a href=3D"=
https://urldefense.com/v3/__http:/python3-werkzeug_2.1.1.bb__;!!AjveYdw8E=
vQ!ZvOorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r4=
4OcxKB_13MA41M9C3f8A$" target=3D"_blank" moz-do-not-send=3D"true">python3=
-werkzeug_2.1.1.bb</a><br>
                    +++ b/meta-python/recipes-devtools/python/<a href=3D"=
https://urldefense.com/v3/__http:/python3-werkzeug_2.1.1.bb__;!!AjveYdw8E=
vQ!ZvOorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r4=
4OcxKB_13MA41M9C3f8A$" target=3D"_blank" moz-do-not-send=3D"true">python3=
-werkzeug_2.1.1.bb</a><br>
                    @@ -12,6 +12,8 @@ LIC_FILES_CHKSUM =3D <a href=3D"fil=
e://LICENSE.rst;md5=3D5dc88300786f1c214c1e9827a5229462" moz-do-not-send=3D=
"true">
&quot;file://LICENSE.rst;md5=3D5dc88300786f1c214c1e9827a5229462&quot;</a>=
<br>
                    <br>
                    &nbsp;PYPI_PACKAGE =3D &quot;Werkzeug&quot;<br>
                    <br>
                    +SRC_URI +=3D <a href=3D"file://CVE-2023-23934.patch"=
 moz-do-not-send=3D"true">&quot;file://CVE-2023-23934.patch&quot;</a><br>
                    +<br>
                    &nbsp;SRC_URI[sha256sum] =3D
                    &quot;f8e89a20aeabbe8a893c24a461d3ee5dad2123b05cc6abd=
73ceed01d39c3ae74&quot;<br>
                    <br>
                    &nbsp;inherit pypi setuptools3<br>
                    -- <br>
                    2.40.0<br>
                    <br>
                    <br>
                    <br>
                    <o:p></o:p></p>
                </blockquote>
              </div>
            </div>
          </blockquote>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------HxU6hQSKufUKBR1iNum3nfZv--

