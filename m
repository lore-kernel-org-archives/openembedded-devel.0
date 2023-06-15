Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23D5EEB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 15:04:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.21016.1686841461376796621
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jun 2023 08:04:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=qD3eNnrm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=55300b703e=narpat.mali@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35FApQqj025655
	for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 15:04:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=TiHJeF2SFApEoR39SFAGL1RogAZgUh2ogUqfBPYh2R4=;
 b=qD3eNnrmwL6pJetouAfX/mZ/RX2pSLOAShPJeXZeExmCZuDNbe70GiHWR7xRzak1Xxk6
 HLDswe8XPtD36qiyX+s9+9U4axoImITciBiUIGgZfEw/Mk2S1TI9gkhPTYexkRm18u4y
 mR187Q8R0e/P9SPPjlInU5gOTeOYK4XV2JBRO+9PhIQmfCAV2UitkUxepUv9sP07kxU2
 dE5tElbaNDmnqMGJVgKjz/rJJaHsz/J8GJmapMtpFKHcadc061vFhi7LJM8op364VZIM
 VVwDN5Fa8VZPO7NITkQjCw95f0EoM/BPnfxEXF/wwXPgFZqhPCbWxkuQ6pas5KUqquIb HA== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2109.outbound.protection.outlook.com [104.47.58.109])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r4ed0538e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 15:04:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GbN2rvI0tsgvryj96fXeM+KAihUvbzPJPltorVdwFuwliVML/YiUlEjnAbuZGZ6TF011FE6/cv2X8Pc6/tsJxghRBC8QaiWvQWic8jXJht6qSNiQGE4XzHyeTazauZROWpY4vFc0PDd3/sB2fpPa+Re7QhQcllVY898G3xINj76ULaEJffQG42Cf9uvBprCmptqkDZY4q3pIv/gmGYve9yCjESZoffObyNXg35+bPD7/ninZ6VXK1NjcR5DiUtP8yPtpP6Dnru5SdvxKswsLWqt8ro69CEa7YD0Oyh8q7DJpOZDKWyAG7Y3y94DKTaNetKJOXYOcGu7YgX01ajsdRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TiHJeF2SFApEoR39SFAGL1RogAZgUh2ogUqfBPYh2R4=;
 b=YFC0tiPukBVuoxIqz5QRZewlenDtg1s5lEUIV7bWCGLSD+LabPecmzQDKISbNr0//jRNrHcEKL3ZtS55zeedNeI/6mohXxlrjOgbElp6e2CY5c54P5CdHG4NlPDMQQG0Eq9CvzvMktLNjt7sh9+d6A/laiqXq4l65A5Z80JvrKjb0BWi8WbsxUoZBREmcFhwRkPfZA7fqM5vYx52Yt4XhIli80OE4SaPvbb7lbEJYG2CF23aqvCain0NpUMb+/yT5h/TfKeOhxk3j50beYlZ6rwfJmadnuAvmFjrHrio3fc9uf0eaIBF0c0bxOrBKRIa9Z1am6DSrxZlS7wtMQnusw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5550.namprd11.prod.outlook.com (2603:10b6:5:38b::24)
 by PH0PR11MB7544.namprd11.prod.outlook.com (2603:10b6:510:28d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.25; Thu, 15 Jun
 2023 15:04:17 +0000
Received: from DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::deef:c312:c6d2:187e]) by DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::deef:c312:c6d2:187e%6]) with mapi id 15.20.6500.025; Thu, 15 Jun 2023
 15:04:17 +0000
Message-ID: <49a713ba-5335-c677-6f2d-e6ee5e43c71c@windriver.com>
Date: Thu, 15 Jun 2023 20:31:56 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [oe] [meta-python][mickledore][PATCH 1/1] python3-django: upgrade
 4.1.7 -> 4.2.1
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
Cc: hari.gpillai@windriver.com
References: <1764E2D4F8CC0BEA.16620@lists.openembedded.org>
From: "Mali, Narpat" <narpat.mali@windriver.com>
In-Reply-To: <1764E2D4F8CC0BEA.16620@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0075.namprd03.prod.outlook.com
 (2603:10b6:a03:331::20) To DM4PR11MB5550.namprd11.prod.outlook.com
 (2603:10b6:5:38b::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5550:EE_|PH0PR11MB7544:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b57d627-99c9-4f3c-c175-08db6db1ca7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	s8a6yulHl4I050qGbak85ue1NnKhdesGn3O1TccUFY1yWre3Q7ueCku5mK7oti7O8ZF2QC28EAEhz0y0V33rmI0EdLnZ/FgA8dOW12D7RqqY9sUpiaNdw7sX9qT8f/zSKckOEo/qKPWE6B6T8ZZOb7WQNV74xwCEahhuSGG4DRMgSgJQpk28PvjtGGVL+Xlzkq7rhqh1U1xJZ43k5C0xFmJEaCBmg6Pfnx+9qNjneWuDEsNAKPZv/dZ+cvV+lD7eogI/Zw02+qC6t1MEP1zjQhepBZ4v8XY+OjUe+LHYfN6RUCRJsYmV5KkljFAtPfArU9xc5m9ZFtwQz26CDspbhkHJ7+YXmC6ZAUtiEXpjy/fEWO6kO1736UK+BKXWYjYTySO1cYLUtlKpnhfH3CzIcYsmVFBLNortQfCSAQqK6MDfC/Yh7AdnWqEkbYf3RJxyNYdJpWkYOaSH6lVo8pn9r/rsAFsUJ4MqKFsSu0sAFwsruwDnPmyxdSZajLBullmloPBWY1Ig/rXHEHEqDzQVQgqNH3oJGqpDKFMpwprjViFFcLjO/n+R6EbAM3PCb2HLzwEqOvcyvys192BDBwoGlexPkrW1MBxFxKXnKNkqu8noYCPmIAcP4XdCb+OyA3v2
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5550.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(39850400004)(346002)(136003)(376002)(451199021)(5660300002)(478600001)(31686004)(8936002)(41300700001)(966005)(107886003)(316002)(8676002)(6486002)(66899021)(6506007)(186003)(4326008)(6916009)(66946007)(66556008)(66476007)(6666004)(53546011)(6512007)(26005)(2616005)(2906002)(83380400001)(38100700002)(86362001)(31696002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YllWYlE3ZGJEKzZXcW1EN3kxb25XeGNnOE16L0tCbUtOanVuZnJTRmF2bjU0?=
 =?utf-8?B?aU1OR2hERU9SMEhDNkVtV0lJdG1PMWVkWEk2SzBYYWJydkR1RVdsQ1RFTUJm?=
 =?utf-8?B?M042NlZ3Ull6c3VVUDUzdURlQ1o4MmhkSFFpNGhNMVl6L3pMS3hEWUpYdUxu?=
 =?utf-8?B?QTZ6TWdOa3ovMnR2OGZZWC9aRWV0RzhmeEhsRHVnSno5dDh4ZVJOL1JMWTEw?=
 =?utf-8?B?eCtEUytjWEd1MUtraVJvS2NHa0s0THhyeFVlbGFpQzVIUjVoTWxiUUZ4QlZL?=
 =?utf-8?B?TGw5K0RZWjVoUzVwL3hiMnkvL0RHNGZyaWtseGdaQlZWY3VLR09Za0h4dW5X?=
 =?utf-8?B?RGJPRUxyNFd6TGs5Yk5oZlBEQWFqK1QraUNnR2QwWUk2UkNQaDFtSWo3V2p5?=
 =?utf-8?B?QTJRTEJRZERJcmp5MG9qV3Awb1VsTU53eGNMNjBXUDg5NGdRRlIvcDdCSDZO?=
 =?utf-8?B?RCtMOE1TTlBkNWlsYUhTaVdmSzFpWjVrSXZONGp5YldyNTNxdE40cWxEMHFF?=
 =?utf-8?B?bjhlRGdQVzNYS2tTakJzMnFGeHF2aExIS0lIeE5iNDdIeDZGSyt1em1sWldK?=
 =?utf-8?B?aGI2VXJwb21RR1M5emIvSWdmWVRIem00VzArSG9vSklCcDEyQXNVUnV4Q2Zn?=
 =?utf-8?B?MFBVaVc2TVM4U3oxazFxcDlpUHVBOGMxRzBjeERoQWdoT3hia2dROG9pcWRl?=
 =?utf-8?B?eTQ1c1grald5Si84cHNJaDNzeXd2Ti9XMktOY2hjZnhsMTVFZGZLaTV4WURr?=
 =?utf-8?B?MjFDTC9Nem1LUGQ1UnVTRWkwcFVXNUZYbCtHZ2JsOTFFem1mU1l0L21KU05C?=
 =?utf-8?B?b2FrYTdwczFWbEtvOXJtVnBkaGZ3RWE0b3pPMlkyMlIzNVh4aHp3cUhleFhV?=
 =?utf-8?B?dTFqY3FxbEEyUjU2akNTc1J0bmVHSzFtZ1FTTng1c0lDNC94a3VadUhvK0RC?=
 =?utf-8?B?czhObU0rNmM5dnJBeXBNQmV5UlI0UWdhMGJrNGRmZG5FelYrVUNXRXJBOFF5?=
 =?utf-8?B?VVRUVGpxNTMyUTdDY1JjcmZGeGlyODdqT3ZCTC9odEYwdVpxRlBHOXVMczQ3?=
 =?utf-8?B?RnJ6VzcycE1GSkFGdzFDWHhmR0JydDMvWi9hMzRieXh0dXhxSWhEcEovdkZQ?=
 =?utf-8?B?VHN0dmhXNFpJNGFSMUJIdm9RbTdKRHBERmZoSGZUZ0ZSZXlHOThiNFhMVUhY?=
 =?utf-8?B?MkpWNTcrSHpGaGR4S1FkM05UOU1Hd09reUdjeVh3bTF1S05WYjkzUmZBazd4?=
 =?utf-8?B?MDRzYTlKZFZKVFRZWC9IblFjQWIwVVZ4REFGcDV4eit2Rnh1SjMxdVJvanND?=
 =?utf-8?B?OE52ZVJucUtySTM3VXE4dnM2SktRM1FMUkczOHpDSVlVMjUzYSs4WklIeUxh?=
 =?utf-8?B?S3hsd09WZzhiRnA5MVplbW5zMVdiUFpnY003OFJrd3ZidXljdTNlN3pFNUF3?=
 =?utf-8?B?OE5aWXFKNmsyZlFwZExsOHdpVU0xMUdsWUZLNEhvTGRuY1JVL1RNSDhhNWpI?=
 =?utf-8?B?MmVkVnpKdTVTb3RZVFFHclJJM1VFMUlicVpWZlJvZHhxUW1BL01aODVIVzd5?=
 =?utf-8?B?TkV5ZFhiakpKODZtTjlraGFDUVpXTHE0MDkvZWhwVVJGUGVKMllqbUVkK3lK?=
 =?utf-8?B?b3RTQ2tyUVYrOTV2NWRLTlRFWjI2dVY0Tkxyb2NYcGpOZ0lHL2cwTEIwY2Jm?=
 =?utf-8?B?dEpoNG1PcC84WFFhdzV2RTVqcTArQTBNOGh4MG0yNkFkamRFVkg2enVKcTJE?=
 =?utf-8?B?K25aaDBZbFFLellpM04rdkNqcTZRd2RHQnduRENwTGRvL2RURHRDaWRHR1Zs?=
 =?utf-8?B?N1picXZUYXlQcWppOWFlY3IwaDR2QWMyc2NjN3dJY1EyVmtSR2tJMitVNDZs?=
 =?utf-8?B?emhUNU9ET1ZIaGcyVnNUMWRONkFNcXBldkc5TzV3SUZXSWRvNllKL1o5Y2dR?=
 =?utf-8?B?aDh2bWYrcDhTODQxN0ttLzdPTjFscmpOVzYrcEpmdjdNRytmeHVQTEVCRzY1?=
 =?utf-8?B?TUN3a1A5NnIwaUZlNk9MWjhjL1h0ZTBraDRUQk9kRHhYenllaVRlMm1DQXRH?=
 =?utf-8?B?a0JVeHV4aHJJM0VTM0I0RlNzNkIxRkwyK1p3NnRPYml4T29hTFdMM210MGdU?=
 =?utf-8?B?cnduQlFQRElIQ2pqMXIzYzZNbjFUeGdYK3BTcHhLWm9nMjJoOWRjbnVLc2tQ?=
 =?utf-8?B?VHc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b57d627-99c9-4f3c-c175-08db6db1ca7b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5550.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 15:04:17.8122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oluqStajJO1+AFGNMfQjCfXTsahUDW09x5hCVbrhBBY3PwzbutISSs/CEQF/8HuIDxRLjs+AeGWmzJX+rkG7O+tsBFDOlBV7RTt5NZpyxYY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7544
X-Proofpoint-GUID: xYaQ3uoXIAFL3t3ewrdzEgd72BrUiVOH
X-Proofpoint-ORIG-GUID: xYaQ3uoXIAFL3t3ewrdzEgd72BrUiVOH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-15_10,2023-06-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 adultscore=0 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306150131
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 15:04:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103312

Reminder.

On 02-06-2023 21:29, Narpat Mali via lists.openembedded.org wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
> https://docs.djangoproject.com/en/4.2/releases/4.2.1/
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
> ---
>   .../python/{python3-django_4.1.7.bb => python3-django_4.2.1.bb} | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-django_4.1.7.bb => python3-django_4.2.1.bb} (58%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-django_4.1.7.bb b/meta-python/recipes-devtools/python/python3-django_4.2.1.bb
> similarity index 58%
> rename from meta-python/recipes-devtools/python/python3-django_4.1.7.bb
> rename to meta-python/recipes-devtools/python/python3-django_4.2.1.bb
> index be806eefaa..b1474cf054 100644
> --- a/meta-python/recipes-devtools/python/python3-django_4.1.7.bb
> +++ b/meta-python/recipes-devtools/python/python3-django_4.2.1.bb
> @@ -1,7 +1,7 @@
>   require python-django.inc
>   inherit setuptools3
>   
> -SRC_URI[sha256sum] = "44f714b81c5f190d9d2ddad01a532fe502fa01c4cb8faf1d081f4264ed15dcd8"
> +SRC_URI[sha256sum] = "7efa6b1f781a6119a10ac94b4794ded90db8accbe7802281cd26f8664ffed59c"
>   
>   RDEPENDS:${PN} += "\
>       ${PYTHON_PN}-sqlparse \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#103102): https://lists.openembedded.org/g/openembedded-devel/message/103102
> Mute This Topic: https://lists.openembedded.org/mt/99289334/7199376
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [narpat.mali@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

