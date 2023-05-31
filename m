Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FD22C7EE2F
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:55:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.9463.1685523327282920289
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:55:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=VhN9tYKR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5515c4eed5=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34V8BrS3021578
	for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:55:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=cEkcCLP0tbmH6CaUd7bcGkGPWDY1G2OyOx2p2TZMbY8=;
 b=VhN9tYKRvISKJLVum/0go6XsQFaaMpahzjZUG+L8VBDwJFEXE0Wee9whluO2kVlpg4oB
 yBz3R42cbm9EasOHGX0z2Mz8zncdIMpdxoOBVt1B481i6Dw9dBkXHjROw3E0oB0YsFF9
 qbuqydqn+zjHAJtvYbxqXtl2P7JXCjt/77qirnYZuaSXmZhiLzphM2cDF+tcT9WcmlyJ
 BDhoilIB1CEc9zVXW0yGwQR8WfpNd0bdU/40FTDhQAJODbXLv7tDasf40Pn/IcMgjeOx
 8Qe3tdr7iMHlIP2E0uXY1Suoy53v3LWzhzcZzSPZAw1BkMt0jJ/Lz//i3sVBk7th+dwG qQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qud53bbbr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:55:26 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34V8lEIh001973
	for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:55:26 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qud53bbbn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 May 2023 01:55:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ROdsJZTWlON/OWQmc+NFCnLDH1yDYvQ0Yj3u7TQmcq77EUMrukZJiG2vgteSs4fKVWxc86ka+zUPoU04ZCvMEEjjwcHK+z6fF+0xWRrS+cdb37+yLaZa0+sYVw4uszLG7iEdXeamj+lCOmr5ACag8sjLlxbg0T0nSg1FzQnkQXRX6Stgzr1G+tCsJB59APjmTXLY0SQEy9xEP6I/mfgkRbHwvw/wRc2FGLMGC6JLo4/BA5Ug5naEKu/drVM0wmZhkwDt1N2XxuRGDukGlw+xVBtXNuoKgxbnIPXPKjvt20LsIvOZlpRGpMHzvFq0myPtAzOgTTkm5Q/tQ217pNxUhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cEkcCLP0tbmH6CaUd7bcGkGPWDY1G2OyOx2p2TZMbY8=;
 b=Ca6/PLPf2/1M8zWcHzz4D+b0DhNk6Qbh6y8B5+9CxmS0UZ+0hgIWQCYcSDimK+2b1nD0afrLRc3aZgd1DQPQucZpVlJKDd2p4X9WjmhqTXwjPp8GvlwJvdrHbVO6PyCdArQa/uRptBpSdrijpNfbxRydMS9vs6I/J3mDL2ghYAoNGRjm0UaKz3RkgV5Ic60pc1UcTJ7Nx+FW2KYmNRKv1jWdMFZ1wj9nzGg0BKPyJm/E6IGj8tsQL/KjMeWSKvwNDQ8rFhk5i/Gg6TqpyAMeiCuc15a3jfgUdlYYJjUs3aEGu9NWWhd6NU6592//GDjAq8/bfKBeG/utrrZyMBP1Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by LV8PR11MB8560.namprd11.prod.outlook.com (2603:10b6:408:1e7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Wed, 31 May
 2023 08:55:23 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::b504:c7a0:9ce8:6f17]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::b504:c7a0:9ce8:6f17%3]) with mapi id 15.20.6455.020; Wed, 31 May 2023
 08:55:23 +0000
Message-ID: <45fcfa94-0f71-47af-3eb8-2091d3c8d0db@windriver.com>
Date: Wed, 31 May 2023 16:55:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [oe] [meta-python][PATCH 000/149] python3: improve run-time
 dependencies situation
Content-Language: en-US
To: Bartosz Golaszewski <brgl@bgdev.pl>, Khem Raj <raj.khem@gmail.com>,
        Bruce Ashfield <bruce.ashfield@gmail.com>,
        openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230531082437.10646-1-brgl@bgdev.pl>
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYAPR01CA0175.jpnprd01.prod.outlook.com
 (2603:1096:404:ba::19) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|LV8PR11MB8560:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b4dd2c6-abd4-42b7-1eba-08db61b4c547
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hv73xENZ+pSx6nTzWsK/ocJc/BKievGn5oDnPA0dqOL0qj5dz3epacZT59yrhzIIMOtwHbLvK9EAQQ4HRfZ0zFvw7B6719tiPwjqVKNbJhs8arciJYzmiMrdlF47oz+8dXBwto9jnHCTW0+dvCSJmCJg2q4lapCUVHNIyceB+g1W8l9SQdib0U1fLs6qqVXpgh+fEd/Z47JB1jqB9OB1g9oGwhR/2ieTQVSF4+w2NXMAdM7WaPX9IMnl8WP5js3uhSOeH7sewoST62dcAO5Mv9DOPRhdeWmxvLo0vRT+1J0PmgO2Nn/XwYMqBrf9+FSuRe24GpbW5hlp6yhjKrHnzWack+OQW9RzQWqNIriFJUrkBqtBwM7LBnuJKzzz4+lSUuZz5l0GE/H+z2huBToVTWq8up4IIo4vJ6Letv8ypvGZu4OQf3cPmMCP/MtWMZLFnaf0EkuzX7gc0oFP7c6Qx8EVQHpEJxtXd39ILLTybtK1nPVpoaYCxNNqqTDeVJDpxtA345bMLp9PCtG6/2gWy6l8AF+g5lB6vZJpL17KO7V3uwU8IJ/2hZOKh/N2kXcb1VmDulgjOnDwDHBQqCL8RAE27i5tDlGrPpfy5bTo04I9gYYGgE7cstMJmu091PwU6WDmh3p8XbZOh8a34juIetOj5h7atzOsamo49ENB9TScxhN2nzkqC99ldQmhS/pU
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(39850400004)(376002)(366004)(396003)(451199021)(186003)(966005)(2616005)(38100700002)(41300700001)(31686004)(83380400001)(26005)(6486002)(6506007)(53546011)(6512007)(6666004)(478600001)(110136005)(66899021)(4326008)(66476007)(66946007)(66556008)(316002)(31696002)(8936002)(5660300002)(8676002)(2906002)(30864003)(36756003)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Z3lwMmxCbmdERVdFRkpsa0N6eDZBT2dSeHo5YXg4VUJWa1g1WVpsa2lxSHUy?=
 =?utf-8?B?aXdsdkZlZzRIZE14d0ZXTytyN0MzeWhSR29JOGdsQXJkakkvVXE0NE9pR08w?=
 =?utf-8?B?UGZLaHBYeXYwUTZoSllHTXFzUnJuQ3R3akcvYzY3ZC9TMjJXV0FiMVpXSWlM?=
 =?utf-8?B?Z2RxODR0WTFPRDBTTUJ0MUtQMU1hN2ZQRUNKaDBUTFdGayt6MFFzUWpuaUdG?=
 =?utf-8?B?VUpkL3ZwanY3U3habkU0LzVJc05ZM3lpYlIzS2s1R2xtRVRxdmtqTWV1dEwr?=
 =?utf-8?B?UWdPT2dkOTZLbjVHTW10cHAyQTA4SHd0dGdPRUVVWVkwcGc4Z2taVnIzanN5?=
 =?utf-8?B?RUFDc3BVK2JJcUJtMlhHZ3BsTHM3YThoNjRURG5HcnBkcmNrZzdlMHB1S1dy?=
 =?utf-8?B?cjRPblFibzR2Q056RnNBbzA4cFYzUE01L2w2WjMwQUF1ZUR4NGZ4djJjM2o4?=
 =?utf-8?B?M3NSTHdOazNoakR1aCtTWUlkc2JqQU13eE5yZGdyQ1VzeVZnYTBLK0Q3aXRE?=
 =?utf-8?B?S0l0RlppNnVzOFVpa2llV3l3SEZud2hocDdrZUt1SkpsQVlrL09DTWh2Wkty?=
 =?utf-8?B?c1htQkRaTHVjWnRKVEhyZTdvZ0R4L1NLcGpuNWxNSGxJei94aHZaMk90ZHYx?=
 =?utf-8?B?YlRQaUV1MHhZUkdWMTFadUFLL080bGI4UEZ5dUpCUXEwN21yVHJiU0ZWUjBW?=
 =?utf-8?B?cDN0cW5lOHRjY3NmS0hob2pmV2xqV2ZxR2JZTkJtTTNpWEVQRHZuL3JHRjRm?=
 =?utf-8?B?SUpuRFp1ZlNnM2VRVGZVTmttU01nWUJaVldLS0k3L1BERXQvQUVwMkZmNmpW?=
 =?utf-8?B?R2pmQ2dZbFRlRmdVYlBROUJGUVBZNTJKUTJsci9SOGdOdGNseml5eVc1K1Rp?=
 =?utf-8?B?ZFI1R0I5UEdZR0o3TUx6QlpnT1llYm0rOUxBNDdGelhBalh2NVE3bDZCY2dJ?=
 =?utf-8?B?U1I4RTNRV1pmRnBndU9YbVYrbHoxd0pOaUJQMEp5UE1GYSs4cEFvUitlaExn?=
 =?utf-8?B?b052aFRJYkFjUUZaV1ZZeUYxcTVlYnNGQnpmQlZoS2RTbm1BelhYUG96enR1?=
 =?utf-8?B?K0ZTQTlnQkZDV050UGhWU2N4YkxWZWVFWGcySFFybWIzRlBEcW1KQm00VlVy?=
 =?utf-8?B?SjgzUXhrejd5MTVYN3lxMCtYZldWc3dvdXFEVWVScHRLdStoZ1ZJNDZhQ3c2?=
 =?utf-8?B?bjNvUllyVFZ3RnZBNHNxV212b29ZaGxpeDBSeFdhUVJtRXZFODZqSUpkeklO?=
 =?utf-8?B?RGprakQrSDl1WWs5ZlduTDBQQ3hWTk42MlBtWkNkdldqbkdBQ3NOUnRhaWw2?=
 =?utf-8?B?eVRseVlIZFNDUzd4S1dwNThXcytVTlA0SjN6ZThIa1NKMWNGWVc5VWI3cWlq?=
 =?utf-8?B?NzZkOVd2clJOczl6TFQwUFovcjFVU2hKbGpZTVNURXMxUmhFUVhjekxJR3ll?=
 =?utf-8?B?S1JUTHdZWEsyK1JjTlF0N2FZbGs0d2t3cnR4bCtKWWV6T1grN0thMHVKc3g1?=
 =?utf-8?B?Nnp4MzFvWFVaY1BmQjhnK3k4TVk0K21US3hBUGNlT1p5aEVPbGtuaFlnK2tF?=
 =?utf-8?B?Y3kvRHBkZng1SkcwalN4cktjZElvazVZNlVBUkQwVC9uSkRkL0tiMUZiQnk4?=
 =?utf-8?B?L1Q5RVFOSGVNY291VUd1d0ZYWUc0SWxHRnNLL295QnppN25BUFN4b3hlVVlD?=
 =?utf-8?B?YTczdkNHOExyYlRQRjRPK2FLV3J2bmtnZURReXNpTzJueHpOYTJ2OWFwYWgw?=
 =?utf-8?B?a0MxU2FaVkZDOVVpTnBBTHVMTS9kb2JqazJlMk1CT3ppS1lSTW52OHI2YVZ2?=
 =?utf-8?B?dE1TejFlb0tBTlBQZ1Zsek9PSWQzekRTM0NhZElTYU5BL2VYL3M5M2U3bkl2?=
 =?utf-8?B?SHRiQ0N0c0x3eHR6cUlyc2ZyK3I4QS9hcUJyRTVZa3dWNU1QQWZsZWp0ZEY3?=
 =?utf-8?B?Qk5oOU9lbGt6WmdjaC9kelpIdkl1dUlQcWxxeDZsWmluMnVOendBVWUwWmVj?=
 =?utf-8?B?NlloMmJ4NWNsZDNuTUI4ZjdnNDdRU2MxZjVQakhIeVo5Y0xGaVBWS0Fta0tL?=
 =?utf-8?B?amRCcFZwM0FhY2c0M0JmOGlKOXpPSUJOWmtNZ0EvdWdoYnY4Z1N4Ukg3U0Fy?=
 =?utf-8?Q?qKYK5a9f0G3WWFFwrYOY+fTGG?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b4dd2c6-abd4-42b7-1eba-08db61b4c547
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 08:55:23.6485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zGX/vYzbT9jBtyA8m7SMJOIVCZFYqhBwtQahp+EuVTrcmKZFYM8N5ggjh2PGrOlDfI8WCCTlcZ9dBXwl4+qZsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8560
X-Proofpoint-GUID: qnAk-5IFvziuYS2fqb8Dn9WI__yNBje2
X-Proofpoint-ORIG-GUID: DklQID45yLI-K9eXF8tV7CodILJTsiL7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-31_04,2023-05-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 mlxscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1011
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305310077
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:55:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103027

On 5/31/23 16:22, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> A significant number of python recipes don't specify all the run-time
> dependencies required to at least be able to import all the installed
> modules. This series is the result of a semi-automated run through all
> python recipes in meta-python, building minimal images and verifying that
> there are no import exceptions.

I checked a few changes. Why are some recipes adding 'python3-unittest' 
as a runtime dependency?

For example, python3-ldap does not seem to need it. I checked the codes, 
https://github.com/cannatag/ldap3, all unittest references reside inside 
the test/ directory.

If it's a semi-automated run, then when it fails, I think the failed 
import commands could be recorded and put in the commit message. This 
could be achieved by using a template commit file which is then 
substituted to generate the actual commit file and using '-F' option to 
commit.

Regards,

Qi

>
> Most patches just add missing RDEPENDS entries where needed. Some tweak
> the coding style if it's inconsistent. There are a few new packages on
> which existing recipes depend at run-time but which were not provided
> in meta-python previously.
>
> This probably doesn't cover all the corner cases. Ptest packages were not
> tested with the assumption that they are being run somewhere and verified
> already.
>
> There are also other run-time dependencies that may fail - like python code
> executing external programs that may be missing or ctypes opening shared
> objects at run-time later than at import-time but in general this series
> should at least improve the situation significantly.
>
> There's some space for QA improvement in OE-core - like maybe raising
> a warning if a python recipe doesn't specify any RDEPENDS which usually
> means they are missing (but the module can also be very simple so this
> cannot be a hard fail).
>
> Bartosz Golaszewski (149):
>    python3-pyparted: add missing run-time dependencies
>    python3-send2trash: add missing run-time dependencies
>    python3-pywbem: drop unneeded class from RDEPENDS
>    python3-pywbem: don't use PYTHON_PN
>    python3-pywbem: order RDEPENDS alphabetically
>    python3-pywbem: add missing run-time dependencies
>    python3-mock: cleanup RDEPENDS
>    python3-mock: add missing run-time dependencies
>    python3-cson: fix run-time dependencies
>    python3-ldap: don't use PYTHON_PN
>    python3-ldap: add missing run-time dependencies
>    python3-pyrad: add missing run-time dependencies
>    python3-html2text: add missing run-time dependencies
>    python3-parse: don't use PYTHON_PN and improve coding style
>    python3-parse: add missing run-time dependencies
>    python3-meld3: add missing run-time dependencies
>    python3-pyiface: add missing run-time dependencies
>    python3-mpmath: add missing run-time dependencies
>    python3-uswid: add missing run-time dependencies
>    python3-xmlrunner: add missing run-time dependencies
>    python3-editor: add missing run-time dependencies
>    python3-pykwalify: don't use PYTHON_PN and improve coding style
>    python3-pykwalify: add missing run-time dependencies
>    python3-iperf: add missing run-time dependencies
>    python3-sdnotify: add missing run-time dependencies
>    python3-service-identity: add missing run-time dependencies
>    python3-sqlsoup: add missing run-time dependencies
>    python3-sqlalchemy: don't use PYTHON_PN and improve coding style
>    python3-sqlalchemy: add missing run-time dependencies
>    python3-pure-eval: add missing run-time dependencies
>    python3-stack-data: fix coding style
>    python3-stack-data: add missing run-time dependencies
>    python3-sympy: add missing run-time dependencies
>    python3-thrift: don't use PYTHON_PN and improve coding style
>    python3-thrift: add missing run-time dependencies
>    python3-tomlkit: add missing run-time dependencies
>    python3-tornado: drop ${PN} from RDEPENDS
>    python3-tornado: fix coding style
>    python3-tornado: remove the testing submodule from FILES:${PN}-test
>    python3-tornado: add missing run-time dependencies
>    python3-trustme: add missing run-time dependencies
>    python3-twofish: add missing run-time dependencies
>    python3-txws: add missing run-time dependencies
>    python3-web3: add missing run-time dependencies
>    python3-uefi-firmware: add missing run-time dependencies
>    python3-websockets: fix coding style
>    python3-websockets: add missing run-time dependencies
>    python3-xlrd: fix coding style
>    python3-xlrd: add missing run-time dependencies
>    python3-versiontools: add missing run-time dependencies
>    python3-typeguard: add missing run-time dependencies
>    python3-process-tests: add missing run-time dependencies
>    python3-pyatspi: add missing run-time dependencies
>    python3-pydantic: don't use PYTHON_PN and improve coding style
>    python3-pydantic: add missing run-time dependencies
>    python3-python-vlc: add missing run-time dependencies
>    python3-redis: fix coding style
>    python3-redis: add missing run-time dependencies
>    python3-raven: add missing run-time dependencies
>    python3-pypng: new package
>    python3-qrcode: add missing run-time dependencies
>    python3-pyusb: fix run-time dependencies
>    python3-pytest-mock: add missing run-time dependencies
>    python3-pyroute2: fix coding style
>    python3-fcntl: add missing run-time dependencies
>    python3-pyproject-metadata: add missing run-time dependencies
>    python3-pyproj: don't use PYTHON_PN
>    python3-pyproj: drop unnecessary run-time dependency
>    python3-pyproj: add missing run-time dependencies
>    python3-classes: new package
>    python3-pylyrics: add missing run-time dependencies
>    python3-pyjwt: stop using PYTHON_PN
>    python3-pyjwt: add missing run-time dependencies
>    python3-javaobj-py3: add missing run-time dependencies
>    python3-pyjks: stop using PYTHON_PN
>    python3-pyjks: fix run-time dependencies
>    python3-pyexpect: add missing run-time dependencies
>    python3-pynetlinux: fix relative imports
>    python3-pynetlinux: add missing run-time dependencies
>    python3-pickleshare: add missing run-time dependencies
>    python3-petact: add missing run-time dependencies
>    python3-pefile: add missing run-time dependencies
>    python3-jsonpath-rw: add missing run-time dependencies
>    python3-jsonrpcclient: add missing run-time dependencies
>    python3-jstyleson: add missing run-time dependencies
>    python3-kconfiglib: add missing run-time dependencies
>    python3-libevdev: add missing run-time dependencies
>    python3-linux-procfs: add missing run-time dependencies
>    python3-lockfile: add missing run-time dependencies
>    python3-msm: fix coding style
>    python3-lazy: new recipe
>    python3-msm: add missing run-time dependencies
>    python3-netaddr: stop using PYTHON_PN
>    python3-netaddr: add missing run-time dependencies
>    python3-ninja-syntax: new package
>    python3-ninja: add missing run-time dependencies
>    python3-nmap: add missing run-time dependencies
>    python3-oslash: add missing run-time dependencies
>    python3-padaos: add missing run-time dependencies
>    python3-padatious: add missing run-time dependencies
>    python3-pako: add missing run-time dependencies
>    python3-paramiko: stop using PYTHON_PN
>    python3-paramiko: add missing run-time dependencies
>    python3-path: fix coding style
>    python3-path: add missing run-time dependencies
>    python3-ecdsa: don't install tests
>    python3-et-xmlfile: fix coding style
>    python3-et-xmlfile: add missing run-time dependencies
>    python3-flask-user: fix coding style
>    python3-flask-user: add missing run-time dependencies
>    python3-isort: fix coding style
>    python3-isort: add missing run-time dependencies
>    python3-isodate: stop using PYTHON_PN
>    python3-isodate: add missing run-time dependencies
>    python-idna-ssl: add missing run-time dependencies
>    python3-hpack: add missing run-time dependencies
>    python3-h11: add missing run-time dependencies
>    python3-gsocketpool: drop unneeded DEPENDS
>    python3-gsocketpool: stop using PYTHON_PN
>    python3-gsocketpool: add missing run-time dependencies
>    python3-flask-mail: stop using PYTHON_PN
>    python3-flask-mail: add missing run-time dependencies
>    python3-flask-sijax: stop using PYTHON_PN
>    python3-flask-sijax: add missing run-time dependencies
>    python3-flask-script: remove recipe
>    python3-aioserial: fix coding style
>    python3-aioserial: add missing run-time dependencies
>    python3-aspectlib: add missing run-time dependencies
>    python3-asyncio-throttle: add missing run-time dependencies
>    python3-attrdict3: add missing run-time dependencies
>    python3-betamax: add missing run-time dependencies
>    python3-binwalk: add missing run-time dependencies
>    python3-can: fix coding style
>    python3-can: add missing run-time dependencies
>    python3-click-spinner: add missing run-time dependencies
>    python3-colorlog: add missing run-time dependencies
>    python3-colorzero: add missing run-time dependencies
>    python3-configobj: fix coding style
>    python3-configobj: add missing run-time dependencies
>    python3-configshell-fb: add missing run-time dependencies
>    python3-coverage: fix coding style and RDEPENDS
>    python3-custom-inherit: add missing run-time dependencies
>    python3-dateparser: fix coding style
>    python3-dateparser: add missing run-time dependencies
>    python3-tzlocal: fix coding style
>    python3-tzlocal: add missing run-time dependencies
>    python3-dbus-next: add missing run-time dependencies
>    python3-defusedxml: add missing run-time dependencies
>    python3-setuptools-scm-git-archive: add missing run-time dependencies
>
>   meta-oe/recipes-security/nmap/nmap_7.80.bb    |  6 +-
>   .../python3-gsocketpool_0.1.6.bb              |  7 ++-
>   .../python-hpack/python3-hpack_4.0.0.bb       |  2 +
>   .../python-thrift/python3-thrift_0.16.0.bb    |  9 +--
>   .../python-txws/python3-txws_0.9.1.bb         |  5 ++
>   .../packagegroups/packagegroup-meta-python.bb |  1 -
>   .../python/python-flask-script.inc            | 12 ----
>   .../python/python-flask-sijax.inc             |  6 +-
>   .../python/python-idna-ssl.inc                |  5 ++
>   .../python/python3-aioserial_1.3.1.bb         |  6 +-
>   .../python/python3-aspectlib_2.0.0.bb         |  5 +-
>   .../python/python3-asyncio-throttle_1.0.2.bb  |  2 +
>   .../python/python3-betamax_0.8.1.bb           |  6 +-
>   .../python/python3-binwalk_2.3.3.bb           |  8 ++-
>   .../python/python3-can_4.2.1.bb               | 28 +++++----
>   .../python/python3-classes_0.4.1.bb           | 10 ++++
>   .../python/python3-click-spinner_0.1.10.bb    |  2 +
>   .../python/python3-colorlog_6.7.0.bb          |  2 +
>   .../python/python3-colorzero_2.0.bb           |  5 +-
>   .../python/python3-configobj_5.0.8.bb         |  5 +-
>   .../python/python3-configshell-fb_1.1.29.bb   |  7 ++-
>   .../python/python3-coverage_7.2.6.bb          | 19 +++---
>   .../python/python3-custom-inherit_2.3.1.bb    |  5 ++
>   .../python/python3-dateparser_1.1.8.bb        | 11 ++--
>   .../python/python3-dbus-next_0.2.3.bb         |  5 ++
>   .../python/python3-defusedxml_0.7.1.bb        |  2 +
>   .../python/python3-ecdsa_0.18.0.bb            |  4 ++
>   .../python/python3-editor_1.0.4.bb            |  5 ++
>   .../python/python3-et-xmlfile_1.1.0.bb        |  8 ++-
>   .../python/python3-flask-mail_0.9.1.bb        |  5 +-
>   .../python/python3-flask-script_2.0.6.bb      |  2 -
>   .../python/python3-flask-user_0.6.19.bb       | 13 ++--
>   .../python/python3-h11_0.14.0.bb              |  2 +
>   .../python/python3-html2text_2020.1.16.bb     |  2 +
>   .../python/python3-iperf_0.1.11.bb            |  6 ++
>   .../python/python3-isodate_0.6.1.bb           |  3 +-
>   .../python/python3-isort_5.12.0.bb            | 16 ++---
>   .../python/python3-javaobj-py3_0.4.3.bb       |  5 ++
>   .../python/python3-jsonpath-rw_1.4.0.bb       |  7 ++-
>   .../python/python3-jsonrpcclient_4.0.2.bb     |  4 +-
>   .../python/python3-jstyleson_0.0.2.bb         |  2 +
>   .../python/python3-kconfiglib_14.1.0.bb       |  6 ++
>   .../python/python3-lazy_1.5.bb                |  8 +++
>   .../python/python3-libevdev_0.11.bb           |  5 ++
>   .../python/python3-linux-procfs_0.7.1.bb      |  2 +
>   .../python/python3-lockfile_0.12.2.bb         |  5 +-
>   .../python/python3-meld3_2.0.1.bb             |  6 ++
>   .../python/python3-mock_5.0.2.bb              | 15 +++--
>   .../python/python3-mpmath_1.3.0.bb            |  5 +-
>   .../python/python3-msm_0.8.8.bb               | 14 ++++-
>   .../python/python3-netaddr_0.8.0.bb           |  5 +-
>   .../python/python3-ninja-syntax_1.7.2.bb      | 10 ++++
>   .../python/python3-ninja_1.11.1.bb            |  7 ++-
>   .../python/python3-oslash_0.6.3.bb            |  5 +-
>   .../python/python3-padaos_0.1.10.bb           |  2 +
>   .../python/python3-padatious_0.4.8.bb         |  8 +++
>   .../python/python3-pako_0.3.1.bb              |  7 +++
>   .../python/python3-paramiko_3.1.0.bb          | 11 ++--
>   .../python/python3-parse_1.19.0.bb            | 13 ++--
>   .../python/python3-path_16.6.0.bb             | 12 ++--
>   .../python/python3-pefile_2023.2.7.bb         |  6 ++
>   .../python/python3-petact_0.1.2.bb            |  6 ++
>   .../python/python3-pickleshare_0.7.5.bb       |  2 +
>   .../python/python3-process-tests_2.1.2.bb     |  6 ++
>   .../python/python3-pure-eval_0.2.2.bb         |  5 ++
>   .../python/python3-pyatspi_2.46.0.bb          |  2 +
>   .../python/python3-pydantic_1.10.7.bb         | 19 +++---
>   .../python/python3-pyexpect_1.0.22.bb         |  2 +
>   .../python/python3-pyiface_git.bb             |  6 ++
>   .../python/python3-pyjks_20.0.0.bb            | 12 ++--
>   .../python/python3-pyjwt_2.7.0.bb             |  5 +-
>   .../python/python3-pykwalify_1.8.0.bb         |  7 ++-
>   .../python/python3-pylyrics_1.1.0.bb          |  8 ++-
>   .../0002-Fixed-relative-imports.patch         | 60 +++++++++++++++++++
>   .../python/python3-pynetlinux_1.1.bb          | 11 +++-
>   .../python/python3-pypng_0.20220715.0.bb      |  8 +++
>   .../python/python3-pyproj_3.5.0.bb            |  8 ++-
>   .../python3-pyproject-metadata_0.7.1.bb       |  6 ++
>   .../python/python3-pyrad_2.4.bb               |  8 +++
>   .../python/python3-pyroute2_0.5.19.bb         | 33 +++++-----
>   .../python/python3-pytest-mock_3.10.0.bb      |  6 ++
>   .../python/python3-python-vlc_3.0.18122.bb    |  5 ++
>   .../python/python3-pyusb_1.2.1.bb             |  2 +-
>   .../python/python3-qrcode_7.4.2.bb            |  7 ++-
>   .../python/python3-raven_6.10.0.bb            |  5 ++
>   .../python/python3-redis_4.5.5.bb             | 12 ++--
>   .../python/python3-sdnotify_0.3.2.bb          |  2 +
>   .../python/python3-service-identity_21.1.0.bb |  6 ++
>   .../python3-setuptools-scm-git-archive_1.1.bb |  1 +
>   .../python/python3-sqlalchemy_2.0.15.bb       | 18 +++---
>   .../python/python3-sqlsoup_0.9.1.bb           |  2 +
>   .../python/python3-stack-data_0.6.2.bb        |  8 ++-
>   .../python/python3-sympy_1.12.bb              |  5 +-
>   .../python/python3-tomlkit_0.11.8.bb          |  6 ++
>   .../python/python3-tornado_6.3.bb             | 22 +++++--
>   .../python/python3-trustme_0.9.0.bb           |  7 +++
>   .../python/python3-twofish_0.3.0.bb           |  2 +
>   .../python/python3-typeguard_4.0.0.bb         |  5 ++
>   .../python/python3-tzlocal_5.0.1.bb           |  7 ++-
>   .../python/python3-uefi-firmware_1.10.bb      |  5 ++
>   .../python/python3-uswid_git.bb               |  6 ++
>   .../python/python3-versiontools_1.9.1.bb      |  2 +
>   .../python/python3-web3_6.3.0.bb              |  2 +
>   .../python/python3-websockets_11.0.3.bb       |  5 +-
>   .../python/python3-xlrd_2.0.1.bb              | 10 +++-
>   .../python/python3-xmlrunner_1.7.7.bb         |  2 +
>   .../python3-attrdict3_2.0.2.bb                |  2 +
>   .../python-cson/python3-cson_git.bb           |  3 +-
>   .../python3-pyparted_3.12.0.bb                |  5 +-
>   .../pywbem/python3-pywbem_1.6.1.bb            | 38 ++++++------
>   .../send2trash/python3-send2trash_1.8.0.bb    |  2 +
>   .../python/python3-ldap_3.4.3.bb              |  9 +--
>   112 files changed, 649 insertions(+), 201 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-flask-script.inc
>   create mode 100644 meta-python/recipes-devtools/python/python3-classes_0.4.1.bb
>   delete mode 100644 meta-python/recipes-devtools/python/python3-flask-script_2.0.6.bb
>   create mode 100644 meta-python/recipes-devtools/python/python3-lazy_1.5.bb
>   create mode 100644 meta-python/recipes-devtools/python/python3-ninja-syntax_1.7.2.bb
>   create mode 100644 meta-python/recipes-devtools/python/python3-pynetlinux/0002-Fixed-relative-imports.patch
>   create mode 100644 meta-python/recipes-devtools/python/python3-pypng_0.20220715.0.bb
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#102927): https://lists.openembedded.org/g/openembedded-devel/message/102927
> Mute This Topic: https://lists.openembedded.org/mt/99237903/7304865
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [Qi.Chen@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


