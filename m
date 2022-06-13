Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B666C43334
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 06:49:45 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.2908.1655102980106567560
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jun 2022 23:49:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=abdYipZU;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=3163934f72=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 25D6mj4U009187
	for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jun 2022 23:49:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=1fUyhDEm1N4kS+v/2QcXSzsnWIc+H8uHibj2wASvwmk=;
 b=abdYipZUtYfXKIjrIiz/sE2dMczzeQUIo+guPOrg1Ptyu69hc4pPMJ1LEZ4cH5ZvckNi
 DpEDKUwCrw/bF6OrFRBdj4PuIt/wJeXLMFLR/TUVI6069rlL1joO2Eh1efp6fT4LDwGh
 eOGomo50VCjK8o0CQpQ0ey/725LXvnW8KYpZ5V4/hhYFlH2ODdA2z9Bz1PW7dadmR9J9
 +y/h3SEYG5caQb0M0IJaRQCKJmD1qBjCDdXdzBDZHFTl2q24gSObAVwr1WP/TvYDfWaE
 CDRfQ2xfCaD2ORvRrK6vHScW5LRP3dBIJmjGoK9HUcUM9a6TH8bAqvXiXDWgwaxSCwNH jg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gmpb594uc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jun 2022 23:49:39 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25D6ncfn011383
	for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jun 2022 23:49:38 -0700
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2049.outbound.protection.outlook.com [104.47.74.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gmpb594ub-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Jun 2022 23:49:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jVSSeIMI4CLdmArwjThdwOdf9ELtm63ZcSd5/9wnUiHx0QBl6RrHF1aBw72n4f7gwwaWQAMBHvQv/1pG5C/eC1vxV9/CCKdsfgP6pq/h8ZBpyI4AaN/ecX+TwQJptmKyGMxyM/UWdPl1nIHWL/ZpGpFOdgggtdkyDaqhVymZHcaujWZMVV3uZe80VRNIchxOaot/vJ6upOtOXZNHfwX6LHoIAb5v0GuWZ+cVXoOdKhAu8E8fUMT9mQyy8QCEOIyYBn89EqKuBerV/d7RBD9QEKXYeNFuwgna0lO0XxMsNMkbaC5s1UJ3U3C6XnMWgWtaEF8/Arg0ZyReKtb8BV8wtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1fUyhDEm1N4kS+v/2QcXSzsnWIc+H8uHibj2wASvwmk=;
 b=ei2c/H+2KtOlXq+cMgqRdFr4QSl62WzHvUU3ZHc0ZdTUg158HxmWIBxzRrGYdtPm4seKGFoIc+v+bmmG1cx2jSR/Pk/kUw+HCHim+S0lmrbwANHPF6GZAtpfNHhUXjBtOXoW5BTcasRCavUtcdeUUsPvthcwSq500KwfY0CkIpzn6K/V6CIuEftCFNwapWf+OsXi7gC2IjL7nLmEIsZWydKiHleCSJzrl7UXtUNxGcUpQmb8OHBTIrZtRn8yuuQOeWqmuGQ2Xy0AVZYp30J66oSQdMpCKCy4wgAbhPvVM7+gGvpuSw4RNk/uoZNhkkv9US60DfHtYqvun5gd/9rwtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA2PR11MB4875.namprd11.prod.outlook.com (2603:10b6:806:11a::6)
 by SA0PR11MB4637.namprd11.prod.outlook.com (2603:10b6:806:97::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Mon, 13 Jun
 2022 06:49:36 +0000
Received: from SA2PR11MB4875.namprd11.prod.outlook.com
 ([fe80::a8e3:9407:2650:5a17]) by SA2PR11MB4875.namprd11.prod.outlook.com
 ([fe80::a8e3:9407:2650:5a17%5]) with mapi id 15.20.5332.020; Mon, 13 Jun 2022
 06:49:36 +0000
Message-ID: <8ca17d02-b444-6f7e-6075-a67eae224c03@windriver.com>
Date: Mon, 13 Jun 2022 14:49:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [oe] [meta-oe][PATCH] openldap: pass correct URANDOM_DEVICE to
 CPPFLAGS
Content-Language: en-US
To: Armin Kuster <akuster808@gmail.com>,
        openembedded-devel@lists.openembedded.org
References: <20220611132312.4070200-1-yi.zhao@windriver.com>
 <2ac0195d-dfd9-da2d-628a-fad632a5476c@gmail.com>
From: Yi Zhao <yi.zhao@windriver.com>
In-Reply-To: <2ac0195d-dfd9-da2d-628a-fad632a5476c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SGBP274CA0015.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::27)
 To SA2PR11MB4875.namprd11.prod.outlook.com (2603:10b6:806:11a::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b8dd1d2-fe27-44a9-6ecf-08da4d08e134
X-MS-TrafficTypeDiagnostic: SA0PR11MB4637:EE_
X-Microsoft-Antispam-PRVS: 
	<SA0PR11MB4637F032D76EFFA879A85208F9AB9@SA0PR11MB4637.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Nr/V7Tt30fqQ7mExxPThbgyEmRR8w4FMO7pQLEpJ0tO9/EwECInQJm1q8Lgzwu+QJZMxuGmYt3PhUcy5fdQ9dHIuqp6+SyzHqRfXEQeHdk/WL/Lnq0lq8cbO4FEGib1vNpCFTiRyFLCRIDTJOiK8Gn4vcYtuvm4wnKv/O3x2qmXLYlUCdPEsQ3UscjvchAp9d2Je8dOX3dnphmY9nYUGIZt5fag70b1RL7ej51zoQeJ62n2JNLOGGM7E4X0ab7E9Noh39kn6zFs2LHLc1950vlVgz+Pvi5Yp0IyuSWCwDsgcROnYAHT4Fj9OdRVddw9i1Yh39vPy897JsNU0NinELof81ifHIxm+vlkQnnNKoUOThGHTba4HYevzvEc0kC2vI4QsieDd3VnzOsOmBB5mv4vNGD0HcY+EcktOr919+ZZHbrieTlLX7sNSEZ1AUWkkKsXqnhRTvhZX7x8utR/pbJmMS5F8Gh29FL8xxqd9pgEvr2Nmz5x5U2elMX3Q91LPyyMupb0Dq89KE68+j67MfUMB/tBz9V+bEEIEfUu5AYmWkoC40a5A73HQdM1T5deGl8Kbw8qotVOg7qYinASkw+ElHq8Y2oOC9qBZmLk1L6D3B762EyprA8251qW4OLWoavgDMPfXYh3JNVNT/eAkO7bnGxy8w1lJ93ornOpjfdU5Ce24aE9jtNeOEl07Wp0iLKRi7tTgIYShEntBkpQP7bQs/b9oRxSKtz3yOkTuVHm3dELsfxNDXOU/goxP5LcfSig4lpoPRID3WjDjC983BB7mHEpQCUzbVp0Burc9h6DnlSoC+2jojDyGaLSOv4lX537SXYMYP3vI5mAh0Upn1/A5pZZoMgBFUn5PUx6bSW5Mc+AP6F5pYf5pgJeBA80M
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR11MB4875.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(316002)(36756003)(83380400001)(38100700002)(38350700002)(186003)(31686004)(2616005)(2906002)(8936002)(966005)(508600001)(44832011)(6486002)(66946007)(8676002)(66476007)(6666004)(66556008)(52116002)(6506007)(26005)(53546011)(31696002)(86362001)(6512007)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZlFEdWdrL2lsL0E5UnM4cldsS3p2UjlXalRsODV4TXVnOVFZMFVNczJ3eHNW?=
 =?utf-8?B?dm0zZWVkSlFnT1Y2MFRsVDVjSC9mbXhtLzF1QVRNWmVvSEhNeXZhcGg0MEdN?=
 =?utf-8?B?SEsrbm5JZ0VKenREQTFIUXFxUkswYzMzNXlrdk0rWjhZRFJENGIxZDNJSXha?=
 =?utf-8?B?Y1VObDdhNUk1b3VqcEdXaEFwbXAxZ2h2SXk0RStYMWtLcncyWGlrTlQ3V1Az?=
 =?utf-8?B?RmpPUXIxNWxZa2pFaUxVU3BQb3gzMlI1NzZmNWxHZ1hyQVRqWE13eDBPNWlO?=
 =?utf-8?B?cVJDTnNZeTZ1RnVodFprakdFMmxsQjQydnRUdDNMOTFpZU9OaWhiMy9BdGZm?=
 =?utf-8?B?NUZQMFJrWW0reFN0NTNHaDA4RXVvSDNaVkVkMThKUXR1YnRLcXlMRHR2SGJn?=
 =?utf-8?B?dVNaaWZuZlNKV3NYRGUvc0VqZU5RY09hTjBhM3lCbkdENjRZYko2bmxsNmpy?=
 =?utf-8?B?ay9LNm5pSWxRMjJadkFNZXhsZG5BVDVNQTVrZlFqRnB3YlppWTc3L0JoQnA3?=
 =?utf-8?B?SmVhQVZwUGdBN0RXZG1zRkZsYXVTNFFOeTh3Zk1FVnQ2RVVQb0JXbERDZVYw?=
 =?utf-8?B?RW05Si9SOGM3UkJHV1c4MFpUd2s1b3VUWWxtcnMxYUZFdXFSUjFZV2lFd2VM?=
 =?utf-8?B?ek0zSVVmdHhCV0w2SmtPbWxaR1J3ZXgxcDVqM2NVd29SRzA0V0tCc3VTaWtx?=
 =?utf-8?B?QVlQUXc2U25adjdwVjc1ZmR2WGdOUWo1M2JIbGNPbEVOWWpLZlFFaTBkL21r?=
 =?utf-8?B?QSthS2xlY1J6UWgwbFBSZEtvenFzSXFpd05EYjZPZGZHbHpZV2VmZktpMlJT?=
 =?utf-8?B?L3gxL1pRemx5bHUvTWM3dU5ZZ0FpL29CZzBzb20rQ2lrT0szU0dLUUJvYk5z?=
 =?utf-8?B?R2ZrS2RueHhCMXZHUDAvOHV6TVdDOEYxYWt4UnNQSFg5WkJOb0VsWkJEeGRK?=
 =?utf-8?B?MEZRWFFIQjk0MVFwMERZVUhaQkJIb3RXeFUzdlBGa0Y1RDUyOXJLcExpZmJN?=
 =?utf-8?B?THZISkZaWTFJVTdrNUdSYTRwcmp3R3lNdkEzVE5mdVRHTTlHYWFXSVhOL0h3?=
 =?utf-8?B?cHI5d1A1Z2QrSzNkMGFycWRZRGwyNE4rN09vd1Q1U05qcDIwWkZCS2xhbTVP?=
 =?utf-8?B?ajRXNE1TcXc4YzZCZHFiMC9VTCsyVU9DS1dUZlZjZFBEVElDUTM0VjFsQWdJ?=
 =?utf-8?B?cjFML1QwODA4YXpQbHdYQkNBUGVUTTRuWnlFRkF1ci9lRzViNTE5N24wekNL?=
 =?utf-8?B?Ymh3dGVxOHJ5OTYwRjh0UlVzcWtIMDBId2d1TEZaMTU1bGdnbmpFZ2lMTG9z?=
 =?utf-8?B?eURUZHRWdlhtelUxTVZCWDZjN0hoWmM0WW5ydTZtMW9nRXBmN2cvZ3VvQVVT?=
 =?utf-8?B?UkUrd2d2SFRweHdMWVhhRFB6TDR4ODRlN1kzL0tkUlFzRWM3MU9MaDluMVpT?=
 =?utf-8?B?WmQraXNnSFZaWnMyTFBLcU4yOGJ0bHJSL3FlWjU2S0FXdzFPemVoSlBoenV0?=
 =?utf-8?B?bS9obmVhY2YzVkNlQ2lpZmNJajhOT2dkU1N6eEllUDdHM0xwcDdUaU5iWS85?=
 =?utf-8?B?cldKTkpvTUZ6RXJqdkYyUkkrZnFqSjRvckVVM2VKOWhwL05iYzZOWndWMTZR?=
 =?utf-8?B?Y2N2OWJGcGxrOE9HN2VhUVFDWGMxNVRsN0t2NlNtTkE1czRlYS91VDROa2hZ?=
 =?utf-8?B?cjl0TzcrSjl2MVpydUc4TXhsNXpqRjF3OEYxRkM5UXh3RzBJTlpUdFpPbGJ3?=
 =?utf-8?B?WFFTTlZ2Tk5NT2xhWkZ3OXMxZDZScmxJOGEvbGl1REJsbHl1dGVkQ0dDWWZN?=
 =?utf-8?B?OUZQRjU5QWF2VlViUUFHMGJkZktRaHhiV0gzWnVFNDNzZVFBTk9ZdnVEdkdo?=
 =?utf-8?B?R0dBcGd5YnVRTWJYSENqaHVTdWd3ajVDSWk4NFpuSGhvcnNIZTZQbVlxKzJC?=
 =?utf-8?B?QkhlZXJKeDlQMDBpM0lFMFFZK0RZVG5FMytFazAzRjdRaEVac3lnM0FuTlZj?=
 =?utf-8?B?ZzRaOWtLU0p3aGlLNUYvZUQxU3FJZTlQbUdtU0d4Qm82Wm1RNTVhR3NTSkxE?=
 =?utf-8?B?Q1QzcDAwT2FOMTQ3czFlUzF5SUVFN0dHV2RQeHFqRXlPd2ZaT3Y2dlgzSndD?=
 =?utf-8?B?SXNEQWZGd3hFWUxOSFg5RFhyVmhSY1J1TVloTngySC85MGpHN2JDdUdmbWtH?=
 =?utf-8?B?d0xSSTZWY3lkNnVsSWxPVzJvUDRGeEIxd3VzOGRTbFhkalRxMG1vamgzT2lt?=
 =?utf-8?B?WkZhT1FUT0hoaE1wUVBoU0Z1VHkvSGM1ckNHK3dzQVRQdGNTVTk2QnczNjRR?=
 =?utf-8?B?RUpVbFI1b0doN0ZVeHdXN05Jd1lSZlBCMHNaQXR4ZDlrUEh4MjU3SUl2emJB?=
 =?utf-8?Q?lwGyQxUMJs/J35bE=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3b8dd1d2-fe27-44a9-6ecf-08da4d08e134
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4875.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 06:49:36.2701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 k6LeMJOIlwveSHq5cdq6SzwvKYEuinEtN3FDE/LXsOHb0tPGFmOoUES1E+BoYlT+KGxwA6xxsclLXZplG/gGpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4637
X-Proofpoint-ORIG-GUID: J5h47mTWUPOVma1rLY6HSMKgj-y_fLR3
X-Proofpoint-GUID: EsydlUzvyehy2Rkd2tnkTy3pzE29SSGg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-13_02,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 phishscore=0 spamscore=0 malwarescore=0 adultscore=0 mlxlogscore=870
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206130030
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 25D6mj4U009187
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Jun 2022 06:49:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97477


On 6/12/22 02:54, Armin Kuster wrote:
>
>
> On 6/11/22 06:23, Yi Zhao wrote:
>> We encountered a runtime error with slappasswd:
>> $ slappasswd -s foo
>> Password generation failed for scheme {SSHA}:
>>
>> This is because the URANDOM_DEVICE is not passed to CPPFLAGS correctly=
,
>> then the program can not open /dev/urandom.
>>
>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>
> backport to kirkstone?


The issue is introduced by commit=20
b2261dbb956b1124ccef8ae22fbcb6375071fffd which is not included in kirksto=
ne.


//Yi


>
> -armin
>> ---
>> =C2=A0 meta-oe/recipes-support/openldap/openldap_2.5.12.bb | 2 +-
>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-support/openldap/openldap_2.5.12.bb=20
>> b/meta-oe/recipes-support/openldap/openldap_2.5.12.bb
>> index a0ca2b5d3..c01db08e4 100644
>> --- a/meta-oe/recipes-support/openldap/openldap_2.5.12.bb
>> +++ b/meta-oe/recipes-support/openldap/openldap_2.5.12.bb
>> @@ -131,7 +131,7 @@ PACKAGES +=3D "${PN}-overlay-proxycache"
>> =C2=A0 # Append URANDOM_DEVICE=3D'/dev/urandom' to CPPFLAGS:
>> =C2=A0 # This allows tls to obtain random bits from /dev/urandom, by d=
efault
>> =C2=A0 # it was disabled for cross-compiling.
>> -CPPFLAGS:append =3D " -D_GNU_SOURCE -DURANDOM_DEVICE=3D\'/dev/urandom=
\'=20
>> -fPIC"
>> +CPPFLAGS:append =3D " -D_GNU_SOURCE=20
>> -DURANDOM_DEVICE=3D\\"/dev/urandom\\" -fPIC"
>> =C2=A0 =C2=A0 LDFLAGS:append =3D " -pthread"
>>
>>
>>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97473): https://lists.openembedded.org/g/openembedd=
ed-devel/message/97473
> Mute This Topic: https://lists.openembedded.org/mt/91688155/3616783
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[yi.zhao@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

