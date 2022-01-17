Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 900F4C433F5
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 03:54:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.6942.1642391682000144073
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Jan 2022 19:54:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=PsLaIdrI;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=8016305b07=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20H3kObP011296
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jan 2022 03:54:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=cvmjLEGPax6EOHKo1BqWcr7UfEYEhmOMu835rSW47DA=;
 b=PsLaIdrI9KpmG3u4+gzXhtEC0D+/jI/q2zzaBLbeRv0lmBqNlJr1NuX5dwH7DqkOVi4/
 GA1RC1U1ZT35Z0gcP2Hd3rtMkQxHMtfkEadk6j90Fpv7OpU3Yfq5C0H3p/DIj0d9wczE
 5qb0IMw8PyfgIlnJXxW7eWET55aom1nNQ17a9vBZ5b1qOvzkRFMt0ATgf5HTKKomisbd
 FuOoYa+9mxXaVaH4gzYt784mKM9h9slX52vN9AE1gXG0RiY57qleyrsrGtdig57aTb7F
 0Y/Bz6sdrzyLmdh8VPFoZKE4G9EOfIKAj/WwnsqXo9+HZoSe87/SmhdaB49UYhR2YsGs ZA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dkq7ts1wa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jan 2022 03:54:40 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 20H3seZq021465
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jan 2022 03:54:40 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dkq7ts1w8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jan 2022 03:54:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dYwakHXhYtsXrIbYJhrA37FqyPYSufaYsFsDpA88GDb6wqN//y8/eW56NCw/zxSK0TXvgKhgEsJDdFad1c0rJiAPB92gKreGYNDYMkUr1UChLjKJ7pKq3+iejqUNevH7pqVCrvcJsFUp0gMaUZjMm8XryXdsHwZx4d8xHtpIQIdR2iPAFeyoNqkJm01LzKDu0s88SSf/P1tY0/pD+gMdd3lO6wj6B2UWuOFas7SGlivwLtz+CvN4OOiUX8SFDPBTt9wqHERn/ho37nqXzjTGag9dxwNL8Am1oU1454YV3XSSG8qzhYBC7GZ2ravUc3yrD2akZQSlkO1ImpZGCNhS2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cvmjLEGPax6EOHKo1BqWcr7UfEYEhmOMu835rSW47DA=;
 b=NpcoEXNwa2JZFeC4GwAHkxAYdrtOq4FlF8iIjpUJJkG+BjkE7U9dzbe7QZm3u8DQeJ/8/TC9QhmpJC7+KNYm+tZrWEzfA5hdT8RDbWQYZZkvLmCHUVoXWSVb8YZRZksPTV9B+WMAOP5Zh9hjOpjB7Bq3hkfBNr7tcQARqKnBVnctclbV1rmMf14MThVTLlIyV0zpS62pZLs0uyZ0LMSNjYCEH03B9zpDFl3irFPL6QPPCAZwt+cVHrCUA+TXWSNcIm6dgWIyQLXrhDeCCRXedjLn6B7K+LE2xSMJEd17Szjzi9nVOdQ2fzp1MCtDeKR1HhWxQJUMGJCyA/NxsZYvtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by MN2PR11MB4304.namprd11.prod.outlook.com (2603:10b6:208:17b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12; Mon, 17 Jan
 2022 03:54:37 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::b8e4:15a2:7da4:2cc7]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::b8e4:15a2:7da4:2cc7%6]) with mapi id 15.20.4888.013; Mon, 17 Jan 2022
 03:54:37 +0000
Subject: Re: [oe] [hardknott][meta-webserver][PATCH] apache2: fix
 CVE-2021-44790,CVE-2021-44224
To: akuster808 <akuster808@gmail.com>,
        openembedded-devel@lists.openembedded.org
References: <20220113080206.25750-1-changqing.li@windriver.com>
 <a0d4cfca-7d8b-50f2-cad7-ddd93e083ecd@gmail.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <603fb8f0-9626-fcc6-4617-675a6d772a9b@windriver.com>
Date: Mon, 17 Jan 2022 11:54:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <a0d4cfca-7d8b-50f2-cad7-ddd93e083ecd@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-ClientProxiedBy: HK0PR01CA0070.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::34) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed13f050-9f9c-4892-64a6-08d9d96d1480
X-MS-TrafficTypeDiagnostic: MN2PR11MB4304:EE_
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB4304B22041083E55813FE38682579@MN2PR11MB4304.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	q2vZ9X1BL/yKKXu+zndLEiutjwL/H6e8QZfvZ+53HODmEKMVVyhmvRzWjA5k23ByqNikTi7PuIeCMhLcUM+y9pv3O9KOvN01igqD3VqouzCTG2SN/bGDVrjUn6FBClAEVNt1WuSftdA9S8TNWDAFGY32Y7oYWViaonHsvFp8mLaX5agm6d3zvchPaw7eQ9MJ7QLRBDw6YBLQ+MNjL/asFxj4SdI0IBwjCc376+8VAzNFdv3WCRuRj1V/5QbN5iVnrN2jWuob9afMcubGRQBsW2yeVmWZsXkDTNeHRrhlEePcl4PMw0saIWPCLi6REU1hW+xV/KKkQiHoR38FdTPzVZHmAI3wS2u1EdVuQvOWUwYRgAsyN0DpRQNa5bZo2RRYrUHWNylyGTe05doLU2IL5ZZYcYPyVu12FqE+IjCmsX5WIUAau9g/8fsGrZmSHiWj1WoVXhSd1RZPlNoGoPCc7sHD3TK+N8Je5vOIYwo9R/eE5ztJ1BqwlIvbOd6+gjhwQIiZNEYw9HmIptgYXELC+jPcwWhbi1ZfVWfT2h4nHi5QJca9nmEWYk+ELlqX8eLm4bg+2IkizA/ZzmXF5FoySmwGtV7hgdnEno8mpssTjKdrRTAhqcLmXgP2n5c0qtcVLIfItc4J51nfmlRCZXEHu+hE3+bQjyMcwkQSGi9l18VBUQtbxiw8GPl7YwXP2v6/WNK+APd3u+UjUQkrTUKK5fpjgZW5pmcvRXY3tViOsMiT6WK6GShqeBKzRLRISmru7BCLAwRgx/nJfypMOanVansJlfJLEic4hzj24mHJgfqG7rvC2ZppQl93GdowmnZcv0GZYFLNYli4IEyNzNH+09Fz+Ujou5Qqpj2dcwU/s41l0lvrwByufLj6Jbb5+n3R
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(52116002)(66946007)(83380400001)(8676002)(6666004)(26005)(186003)(6512007)(966005)(6506007)(53546011)(31686004)(8936002)(38100700002)(66476007)(5660300002)(6486002)(66556008)(2906002)(316002)(38350700002)(30864003)(44832011)(2616005)(86362001)(31696002)(508600001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bzBqbDhMOGJYVms2bm5uNElYWXhxUUsrM1hLWkxYRElrVVpaMDQxbE5vZUpX?=
 =?utf-8?B?Wk1JaHNyUWV5Nk9teHl6aDE2blNaaW1oUHhSdmI4UnFEOXhocDA5TWd6RFdy?=
 =?utf-8?B?eVZhTzFuSjlGVEtuTmZuMVNHMkpyRkkxZjQwY0Z2emM0bGR0RjJQek82c1oz?=
 =?utf-8?B?ek9sNFo5MG0vczRHY1FPeHQybkp3NnZlRmo0VGcrelAvUWxiam50U0Q2YTU2?=
 =?utf-8?B?c2VJdkRNWkF6TkY5WWF0ekJuZS9WdXQvcFNkSm1hSU05elI1b0swV3ZJUTk3?=
 =?utf-8?B?QWM5RUN3OGJ5ODN3Q1ZYS2o2WlJNaVpvTVZ0TGZaOERRdnloVjkxWEF3cmxK?=
 =?utf-8?B?QkRsVDVzUng2QWpPemxJalNQajg4WTR1T3RVLzVMQkszOSt1NHJuaUhzUzZR?=
 =?utf-8?B?bHAxUlRYenlDbElKLzJ4bTVKN09ZaXNTYk1Qa2QxanVQYWJlOEtQMU1FWXh1?=
 =?utf-8?B?MmFDc252SzFnYzg5RVZDRHVVV0M5c0YvTnV6ZTZMMzBBMk1TY1VGWWVuREVh?=
 =?utf-8?B?Nnh0RXgzUTlnTXlEa0RyazQwMldiODM2UENZVkw0RmQvWHg4WXZWcURQMDA2?=
 =?utf-8?B?eHB0cDNTd2UrT1B3cGpYZjFjR3ZqdDRPMlJCdkJBNFNjMzlPVU5sNmpWVU82?=
 =?utf-8?B?WjhPUUtMQTUzQVZGVGFCa2xycVlnQjNLenQxRUhIS1ZNTnhad3NYYVlRTWs0?=
 =?utf-8?B?djlTN1B2R0xhQ0ZMVkdJNXZ0WExhZWxkTFllVjhNT21sT2hGNzRDaTN6SUZR?=
 =?utf-8?B?Z09jZkRnOHBtSmMxSHlkR1dnMEt1UzZCd01aREx4TkNtR3RGNjBtUUxqUCtC?=
 =?utf-8?B?Q3V6cTV0V0FnQ25KNzB4UitvV2cwbXpSdGVEbm5CelhKRGNZM1NYWnJBVm1s?=
 =?utf-8?B?NzZpTi9pMGVhOHJwY3F6V2o3ZXhabGtHVnlRZUNFR3ZWaXBwTW9GM0dLUmxC?=
 =?utf-8?B?SnU0NjdZZ1QzZWZRVXFSVmhPV3JLOG03eHFVY0VpTlQwTmhMZTBqOVJUMlN1?=
 =?utf-8?B?dCtnRFdBVWVOelNhUDdkbnlPRTJqTFdjeERtd1RaRm9ZSFY4LzdsNEl6MUV5?=
 =?utf-8?B?ME1iWlFFN2YrZEdXZHpUSk5BR0hlMzArakZzTGhUS09mSGN2NXU2elU1VlFG?=
 =?utf-8?B?QWRJOXVwWkk4OXhIdnBYVDRaUitxbnVKenhvMWdLKytsTGVTYnFVaWRMUTdh?=
 =?utf-8?B?clF0dVVydHFnUGZmdDBLcUh4QlVCazZETUdTQ1pFU0NKbHpxMXZYKzF0M2No?=
 =?utf-8?B?QXhhWVMxWFZhL0N5NmsrN05iVTF5YnU3ZTBtcG1BZkQ4dWFFcHh4bDFJalZ0?=
 =?utf-8?B?M1BCcVBRSXZ6Ynl3VmUxUnV4VHZNMm9QS3pOVE85eEx2MVBUa2tDL0FZWjU4?=
 =?utf-8?B?Z1pHenVxRkpXQVZFcldQUWFqZjBlSUpxdzROMFdmakZ4SGJuNEF6RWM2MmMz?=
 =?utf-8?B?VkZLdGNFbGdKZyttblI5NVZoT2xQWWNMNFg0czF2eDgwZTMza01NUmk1Tmh2?=
 =?utf-8?B?ZFRheElsOHUwOHlaL0F0NDV2YTBWbTJUUGkvUTZMNWRWTkR0Z2NkeldBZ2Jv?=
 =?utf-8?B?aVZrMFRrcWE0aUo2YXJOekdMQTFNZVpjaTRoTkJwY0xwWG9waGthR1dpdGJE?=
 =?utf-8?B?dE1LY2FwVkNDd2k3VTNDRm92L0FWRGh2Nm9Fb1dSQy9pT0QwZ3IrdnNmY2I5?=
 =?utf-8?B?cktZZlN1QzhLQktuL0ErN3JBS1M0V1FMM2pvNHRldWdQcURuYndRSEh0Ykw3?=
 =?utf-8?B?QS82aXFMdlFWVURubkdmUHRsdUoxcW9oZVhzODcrRDZwbkkvbndDYVhXV3FN?=
 =?utf-8?B?VnZkd01tdlRiSUQyZFk5TjJPOTJBSkRpMW0yWHkrTWVvYW4zYnF3c0J4TDJC?=
 =?utf-8?B?WW5VdmlYQUlCSVAvZGYzT1VxNk1Ba0dFb2VwT2pMZ050SkprOUtNWHZ6WHhM?=
 =?utf-8?B?MGdYVm16Ym9HWHltRjJLZnZ4eXBtN2VBWmNVaFR1ODVaU0pYWmhEY2lTY1J6?=
 =?utf-8?B?VnRkK1dlNEhTc0FmclRsN3NSYkxmOWpvTnFIOElyZmozNk5WOGZUWDlqUjFr?=
 =?utf-8?B?citFdVVwZS9FVzhnZVFLbHZiclF0M01LQ3JsbFZnRW55ajRWOXc1SC9rc2hQ?=
 =?utf-8?B?NEhPYSt2R3U2NDVPRGFGSWk2N1VRUEsxWkNtQUEwSjJQN2U1R1lsOCt2VlhN?=
 =?utf-8?B?U2h6SDVxRnk1WEFDYXZHaWNZTFhkb21NSXJMM1c4TDZ2Sm1mQVFnbktQMUNh?=
 =?utf-8?B?eXRVWnNIN3JxUlVUaW0zRGliR2VnPT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ed13f050-9f9c-4892-64a6-08d9d96d1480
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 03:54:37.1665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 /Wk86Il+puwNSLKqRd8682rgsiidTJjsXUkp7WKYdEfcHWBpOyBnPhMjqUgWFTmck7tr2vt7LClypUmT6WKqjhZz81rNW6nugl0G+kESKzo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4304
X-Proofpoint-ORIG-GUID: FTZck68oTyHHLd9e9d0bAMiD0PthbEcL
X-Proofpoint-GUID: ByxEprOQk_AO18vEWLRapkRq39fjI6Rm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-17_01,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 clxscore=1011 adultscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201170025
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 20H3kObP011296
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Jan 2022 03:54:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94895


On 1/15/22 10:16 PM, akuster808 wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> On 1/13/22 12:02 AM, Changqing Li wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   .../apache2/apache2/CVE-2021-44224-1.patch    | 282 ++++++++++++++++=
++
>>   .../apache2/apache2/CVE-2021-44224-2.patch    | 110 +++++++
>>   .../apache2/apache2/CVE-2021-44790.patch      |  32 ++
>>   .../recipes-httpd/apache2/apache2_2.4.51.bb   |   3 +
>>   4 files changed, 427 insertions(+)
>>   create mode 100644 meta-webserver/recipes-httpd/apache2/apache2/CVE-=
2021-44224-1.patch
>>   create mode 100644 meta-webserver/recipes-httpd/apache2/apache2/CVE-=
2021-44224-2.patch
>>   create mode 100644 meta-webserver/recipes-httpd/apache2/apache2/CVE-=
2021-44790.patch
> There is an apache update siting in stable/hardknott-nut.
>
> FYI, apache 2.4.x is an LTS version so package updates are allowed as
> they only contain bug fixes
>
> -armin

OK, thanks. I cannot see branch stable/hardknott-nut=C2=A0 on=20
https://git.openembedded.org/meta-openembedded/refs/heads.

So the patches on stable/hardknott-nut will be merged to branch=20
hardknott periodly?

//chang qing

>> diff --git a/meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-442=
24-1.patch b/meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-44224-=
1.patch
>> new file mode 100644
>> index 000000000..90efafb6a
>> --- /dev/null
>> +++ b/meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-44224-1.pa=
tch
>> @@ -0,0 +1,282 @@
>> +From 14e54221476e45a6a63c7c656bf967f1fe810b3f Mon Sep 17 00:00:00 200=
1
>> +From: Changqing Li <changqing.li@windriver.com>
>> +Date: Thu, 13 Jan 2022 14:37:50 +0800
>> +Subject: [PATCH] Merge r1895914, r1895921 from trunk:
>> +
>> +  *) http: Enforce that fully qualified uri-paths not to be forward-p=
roxied
>> +     have an http(s) scheme, and that the ones to be forward proxied =
have a
>> +     hostname, per HTTP specifications.
>> +     trunk patch: http://svn.apache.org/r1895914
>> +                  http://svn.apache.org/r1895921
>> +     2.4.x patch: https://patch-diff.githubusercontent.com/raw/apache=
/httpd/pull/286.patch
>> +     backport PR: https://github.com/apache/httpd/pull/286
>> +     +1: ylavic, minfrin, gbechis
>> +
>> +mod_proxy: Detect unix: scheme syntax errors at load time.
>> +
>> +* modules/proxy/mod_proxy.c(add_pass, add_member, set_proxy_param,
>> +                            proxysection):
>> +  Check return value of ap_proxy_de_socketfy().
>> +
>> +* modules/proxy/proxy_util.c(ap_proxy_get_worker_ex):
>> +  Check return value of ap_proxy_de_socketfy().
>> +
>> +http: Enforce that fully qualified uri-paths not to be forward-proxie=
d
>> +      have an http(s) scheme, and that the ones to be forward proxied=
 have a
>> +      hostname, per HTTP specifications.
>> +
>> +The early checks avoid failing the request later on and thus save cyc=
les
>> +for those invalid cases.
>> +
>> +Submitted by: ylavic
>> +Reviewed by: ylavic, minfrin, gbechis
>> +Closes #286
>> +
>> +git-svn-id: https://svn.apache.org/repos/asf/httpd/httpd/branches/2.4=
.x@1895955 13f79535-47bb-0310-9956-ffa450edef68
>> +
>> +CVE: CVE-2021-44224
>> +Upstream-Status: Backport [https://svn.apache.org/viewvc?view=3Drevis=
ion&revision=3D1895955]
>> +
>> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> +---
>> + include/ap_mmn.h            |  2 +-
>> + include/http_protocol.h     |  7 ++++++
>> + modules/http/http_request.c |  2 +-
>> + modules/http2/h2_request.c  |  4 ++--
>> + modules/proxy/mod_proxy.c   | 45 ++++++++++++++++++++++++++---------=
--
>> + modules/proxy/proxy_util.c  |  3 +++
>> + server/protocol.c           | 23 ++++++++++++++++++-
>> + 7 files changed, 68 insertions(+), 18 deletions(-)
>> +
>> +diff --git a/include/ap_mmn.h b/include/ap_mmn.h
>> +index 942e6d4..f2eee7a 100644
>> +--- a/include/ap_mmn.h
>> ++++ b/include/ap_mmn.h
>> +@@ -589,7 +589,7 @@
>> + #ifndef MODULE_MAGIC_NUMBER_MAJOR
>> + #define MODULE_MAGIC_NUMBER_MAJOR 20120211
>> + #endif
>> +-#define MODULE_MAGIC_NUMBER_MINOR 118                 /* 0...n */
>> ++#define MODULE_MAGIC_NUMBER_MINOR 119                 /* 0...n */
>> +
>> + /**
>> +  * Determine if the server's current MODULE_MAGIC_NUMBER is at least=
 a
>> +diff --git a/include/http_protocol.h b/include/http_protocol.h
>> +index 9ccac89..20bd202 100644
>> +--- a/include/http_protocol.h
>> ++++ b/include/http_protocol.h
>> +@@ -96,6 +96,13 @@ AP_DECLARE(void) ap_get_mime_headers(request_rec *=
r);
>> + AP_DECLARE(void) ap_get_mime_headers_core(request_rec *r,
>> +                                           apr_bucket_brigade *bb);
>> +
>> ++/**
>> ++ * Run post_read_request hook and validate.
>> ++ * @param r The current request
>> ++ * @return OK or HTTP_...
>> ++ */
>> ++AP_DECLARE(int) ap_post_read_request(request_rec *r);
>> ++
>> + /* Finish up stuff after a request */
>> +
>> + /**
>> +diff --git a/modules/http/http_request.c b/modules/http/http_request.=
c
>> +index c9ae5af..d59cfe2 100644
>> +--- a/modules/http/http_request.c
>> ++++ b/modules/http/http_request.c
>> +@@ -680,7 +680,7 @@ static request_rec *internal_internal_redirect(co=
nst char *new_uri,
>> +      * to do their thing on internal redirects as well.  Perhaps thi=
s is a
>> +      * misnamed function.
>> +      */
>> +-    if ((access_status =3D ap_run_post_read_request(new))) {
>> ++    if ((access_status =3D ap_post_read_request(new))) {
>> +         ap_die(access_status, new);
>> +         return NULL;
>> +     }
>> +diff --git a/modules/http2/h2_request.c b/modules/http2/h2_request.c
>> +index 7c4fb95..900f050 100644
>> +--- a/modules/http2/h2_request.c
>> ++++ b/modules/http2/h2_request.c
>> +@@ -369,8 +369,8 @@ request_rec *h2_request_create_rec(const h2_reque=
st *req, conn_rec *c)
>> +      */
>> +     ap_add_input_filter_handle(ap_http_input_filter_handle,
>> +                                NULL, r, r->connection);
>> +-
>> +-    if ((access_status =3D ap_run_post_read_request(r))) {
>> ++
>> ++    if ((access_status =3D ap_post_read_request(r))) {
>> +         /* Request check post hooks failed. An example of this would=
 be a
>> +          * request for a vhost where h2 is disabled --> 421.
>> +          */
>> +diff --git a/modules/proxy/mod_proxy.c b/modules/proxy/mod_proxy.c
>> +index 3fb84c8..b3aafcc 100644
>> +--- a/modules/proxy/mod_proxy.c
>> ++++ b/modules/proxy/mod_proxy.c
>> +@@ -775,13 +775,13 @@ static int proxy_detect(request_rec *r)
>> +
>> +     /* Ick... msvc (perhaps others) promotes ternary short results t=
o int */
>> +
>> +-    if (conf->req && r->parsed_uri.scheme) {
>> ++    if (conf->req && r->parsed_uri.scheme && r->parsed_uri.hostname)=
 {
>> +         /* but it might be something vhosted */
>> +-        if (!(r->parsed_uri.hostname
>> +-              && !ap_cstr_casecmp(r->parsed_uri.scheme, ap_http_sche=
me(r))
>> +-              && ap_matches_request_vhost(r, r->parsed_uri.hostname,
>> +-                                          (apr_port_t)(r->parsed_uri=
.port_str ? r->parsed_uri.port
>> +-                                                       : ap_default_=
port(r))))) {
>> ++        if (ap_cstr_casecmp(r->parsed_uri.scheme, ap_http_scheme(r))=
 !=3D 0
>> ++            || !ap_matches_request_vhost(r, r->parsed_uri.hostname,
>> ++                                         (apr_port_t)(r->parsed_uri.=
port_str
>> ++                                                      ? r->parsed_ur=
i.port
>> ++                                                      : ap_default_p=
ort(r)))) {
>> +             r->proxyreq =3D PROXYREQ_PROXY;
>> +             r->uri =3D r->unparsed_uri;
>> +             r->filename =3D apr_pstrcat(r->pool, "proxy:", r->uri, N=
ULL);
>> +@@ -2007,6 +2007,7 @@ static const char *
>> +     struct proxy_alias *new;
>> +     char *f =3D cmd->path;
>> +     char *r =3D NULL;
>> ++    const char *real;
>> +     char *word;
>> +     apr_table_t *params =3D apr_table_make(cmd->pool, 5);
>> +     const apr_array_header_t *arr;
>> +@@ -2094,6 +2095,10 @@ static const char *
>> +         return "ProxyPass|ProxyPassMatch needs a path when not defin=
ed in a location";
>> +     }
>> +
>> ++    if (!(real =3D ap_proxy_de_socketfy(cmd->temp_pool, r))) {
>> ++        return "ProxyPass|ProxyPassMatch uses an invalid \"unix:\" U=
RL";
>> ++    }
>> ++
>> +     /* if per directory, save away the single alias */
>> +     if (cmd->path) {
>> +         dconf->alias =3D apr_pcalloc(cmd->pool, sizeof(struct proxy_=
alias));
>> +@@ -2109,7 +2114,7 @@ static const char *
>> +     }
>> +
>> +     new->fake =3D apr_pstrdup(cmd->pool, f);
>> +-    new->real =3D apr_pstrdup(cmd->pool, ap_proxy_de_socketfy(cmd->p=
ool, r));
>> ++    new->real =3D apr_pstrdup(cmd->pool, real);
>> +     new->flags =3D flags;
>> +     if (worker_type & AP_PROXY_WORKER_IS_MATCH) {
>> +         new->regex =3D ap_pregcomp(cmd->pool, f, AP_REG_EXTENDED);
>> +@@ -2635,6 +2640,7 @@ static const char *add_member(cmd_parms *cmd, v=
oid *dummy, const char *arg)
>> +     proxy_worker *worker;
>> +     char *path =3D cmd->path;
>> +     char *name =3D NULL;
>> ++    const char *real;
>> +     char *word;
>> +     apr_table_t *params =3D apr_table_make(cmd->pool, 5);
>> +     const apr_array_header_t *arr;
>> +@@ -2676,6 +2682,10 @@ static const char *add_member(cmd_parms *cmd, =
void *dummy, const char *arg)
>> +     if (!name)
>> +         return "BalancerMember must define remote proxy server";
>> +
>> ++    if (!(real =3D ap_proxy_de_socketfy(cmd->temp_pool, name))) {
>> ++        return "BalancerMember uses an invalid \"unix:\" URL";
>> ++    }
>> ++
>> +     ap_str_tolower(path);   /* lowercase scheme://hostname */
>> +
>> +     /* Try to find the balancer */
>> +@@ -2687,8 +2697,7 @@ static const char *add_member(cmd_parms *cmd, v=
oid *dummy, const char *arg)
>> +     }
>> +
>> +     /* Try to find existing worker */
>> +-    worker =3D ap_proxy_get_worker(cmd->temp_pool, balancer, conf,
>> +-                                 ap_proxy_de_socketfy(cmd->temp_pool=
, name));
>> ++    worker =3D ap_proxy_get_worker(cmd->temp_pool, balancer, conf, r=
eal);
>> +     if (!worker) {
>> +         ap_log_error(APLOG_MARK, APLOG_DEBUG, 0, cmd->server, APLOGN=
O(01147)
>> +                      "Defining worker '%s' for balancer '%s'",
>> +@@ -2785,9 +2794,14 @@ static const char *
>> +         }
>> +     }
>> +     else {
>> ++        const char *real;
>> ++
>> ++        if (!(real =3D ap_proxy_de_socketfy(cmd->temp_pool, name))) =
{
>> ++            return "ProxySet uses an invalid \"unix:\" URL";
>> ++        }
>> ++
>> +         worker =3D ap_proxy_get_worker_ex(cmd->temp_pool, NULL, conf=
,
>> +-                                        ap_proxy_de_socketfy(cmd->te=
mp_pool, name),
>> +-                                        worker_type);
>> ++                                        real, worker_type);
>> +         if (!worker) {
>> +             if (in_proxy_section) {
>> +                 err =3D ap_proxy_define_worker_ex(cmd->pool, &worker=
, NULL,
>> +@@ -2930,9 +2944,14 @@ static const char *proxysection(cmd_parms *cmd=
, void *mconfig, const char *arg)
>> +             }
>> +         }
>> +         else {
>> ++            const char *real;
>> ++
>> ++            if (!(real =3D ap_proxy_de_socketfy(cmd->temp_pool, conf=
->p))) {
>> ++                return "<Proxy/ProxyMatch > uses an invalid \"unix:\=
" URL";
>> ++            }
>> ++
>> +             worker =3D ap_proxy_get_worker_ex(cmd->temp_pool, NULL, =
sconf,
>> +-                                            ap_proxy_de_socketfy(cmd=
->temp_pool, conf->p),
>> +-                                            worker_type);
>> ++                                           real, worker_type);
>> +             if (!worker) {
>> +                 err =3D ap_proxy_define_worker_ex(cmd->pool, &worker=
, NULL, sconf,
>> +                                                 conf->p, worker_type=
);
>> +diff --git a/modules/proxy/proxy_util.c b/modules/proxy/proxy_util.c
>> +index f291a0d..3511688 100644
>> +--- a/modules/proxy/proxy_util.c
>> ++++ b/modules/proxy/proxy_util.c
>> +@@ -1742,6 +1742,9 @@ PROXY_DECLARE(proxy_worker *) ap_proxy_get_work=
er_ex(apr_pool_t *p,
>> +     }
>> +
>> +     url =3D ap_proxy_de_socketfy(p, url);
>> ++    if (!url) {
>> ++        return NULL;
>> ++    }
>> +
>> +     c =3D ap_strchr_c(url, ':');
>> +     if (c =3D=3D NULL || c[1] !=3D '/' || c[2] !=3D '/' || c[3] =3D=3D=
 '\0') {
>> +diff --git a/server/protocol.c b/server/protocol.c
>> +index 3d74c5b..2214f72 100644
>> +--- a/server/protocol.c
>> ++++ b/server/protocol.c
>> +@@ -1548,7 +1548,7 @@ request_rec *ap_read_request(conn_rec *conn)
>> +     /* we may have switched to another server */
>> +     apply_server_config(r);
>> +
>> +-    if ((access_status =3D ap_run_post_read_request(r))) {
>> ++    if ((access_status =3D ap_post_read_request(r))) {
>> +         goto die;
>> +     }
>> +
>> +@@ -1603,6 +1603,27 @@ ignore:
>> +     return NULL;
>> + }
>> +
>> ++AP_DECLARE(int) ap_post_read_request(request_rec *r)
>> ++{
>> ++    int status;
>> ++
>> ++    if ((status =3D ap_run_post_read_request(r))) {
>> ++        return status;
>> ++    }
>> ++
>> ++    /* Enforce http(s) only scheme for non-forward-proxy requests */
>> ++    if (!r->proxyreq
>> ++            && r->parsed_uri.scheme
>> ++            && (ap_cstr_casecmpn(r->parsed_uri.scheme, "http", 4) !=3D=
 0
>> ++                || (r->parsed_uri.scheme[4] !=3D '\0'
>> ++                    && (apr_tolower(r->parsed_uri.scheme[4]) !=3D 's=
'
>> ++                        || r->parsed_uri.scheme[5] !=3D '\0')))) {
>> ++        return HTTP_BAD_REQUEST;
>> ++    }
>> ++
>> ++    return OK;
>> ++}
>> ++
>> + /* if a request with a body creates a subrequest, remove original re=
quest's
>> +  * input headers which pertain to the body which has already been re=
ad.
>> +  * out-of-line helper function for ap_set_sub_req_protocol.
>> +--
>> +2.17.1
>> +
>> diff --git a/meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-442=
24-2.patch b/meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-44224-=
2.patch
>> new file mode 100644
>> index 000000000..b464a452b
>> --- /dev/null
>> +++ b/meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-44224-2.pa=
tch
>> @@ -0,0 +1,110 @@
>> +From 994610ea76b6e1b3f198101af31564e6c4e8fc0f Mon Sep 17 00:00:00 200=
1
>> +From: Changqing Li <changqing.li@windriver.com>
>> +Date: Thu, 13 Jan 2022 14:47:56 +0800
>> +Subject: [PATCH] Merge of r1895981,r1895986 from trunk:
>> +
>> +  *) mod_proxy: Don't prevent forwarding URIs w/ no hostname.
>> +                (fix for r1895955 already in 2.4.x)
>> +
>> +git-svn-id: https://svn.apache.org/repos/asf/httpd/httpd/branches/2.4=
.x@1896044 13f79535-47bb-0310-9956-ffa450edef68
>> +
>> +CVE: CVE-2021-44224
>> +Upstream-Status: Backport [https://svn.apache.org/viewvc?view=3Drevis=
ion&revision=3D1896044]
>> +
>> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> +---
>> + modules/proxy/mod_proxy.c  |  5 +++--
>> + modules/proxy/mod_proxy.h  |  1 +
>> + modules/proxy/proxy_util.c | 22 ++++++++++++----------
>> + 3 files changed, 16 insertions(+), 12 deletions(-)
>> +
>> +diff --git a/modules/proxy/mod_proxy.c b/modules/proxy/mod_proxy.c
>> +index b3aafcc..a28bea4 100644
>> +--- a/modules/proxy/mod_proxy.c
>> ++++ b/modules/proxy/mod_proxy.c
>> +@@ -775,9 +775,10 @@ static int proxy_detect(request_rec *r)
>> +
>> +     /* Ick... msvc (perhaps others) promotes ternary short results t=
o int */
>> +
>> +-    if (conf->req && r->parsed_uri.scheme && r->parsed_uri.hostname)=
 {
>> ++    if (conf->req && r->parsed_uri.scheme) {
>> +         /* but it might be something vhosted */
>> +-        if (ap_cstr_casecmp(r->parsed_uri.scheme, ap_http_scheme(r))=
 !=3D 0
>> ++        if (!r->parsed_uri.hostname
>> ++            || ap_cstr_casecmp(r->parsed_uri.scheme, ap_http_scheme(=
r)) !=3D 0
>> +             || !ap_matches_request_vhost(r, r->parsed_uri.hostname,
>> +                                          (apr_port_t)(r->parsed_uri.=
port_str
>> +                                                       ? r->parsed_ur=
i.port
>> +diff --git a/modules/proxy/mod_proxy.h b/modules/proxy/mod_proxy.h
>> +index 1219e9f..47899d7 100644
>> +--- a/modules/proxy/mod_proxy.h
>> ++++ b/modules/proxy/mod_proxy.h
>> +@@ -750,6 +750,7 @@ PROXY_DECLARE(int) ap_proxy_worker_can_upgrade(ap=
r_pool_t *p,
>> + #define AP_PROXY_WORKER_IS_PREFIX   (1u << 0)
>> + #define AP_PROXY_WORKER_IS_MATCH    (1u << 1)
>> + #define AP_PROXY_WORKER_IS_MALLOCED (1u << 2)
>> ++#define AP_PROXY_WORKER_NO_UDS      (1u << 3)
>> +
>> + /**
>> +  * Get the worker from proxy configuration, looking for either PREFI=
XED or
>> +diff --git a/modules/proxy/proxy_util.c b/modules/proxy/proxy_util.c
>> +index 3511688..d578452 100644
>> +--- a/modules/proxy/proxy_util.c
>> ++++ b/modules/proxy/proxy_util.c
>> +@@ -1741,9 +1741,11 @@ PROXY_DECLARE(proxy_worker *) ap_proxy_get_wor=
ker_ex(apr_pool_t *p,
>> +         return NULL;
>> +     }
>> +
>> +-    url =3D ap_proxy_de_socketfy(p, url);
>> +-    if (!url) {
>> +-        return NULL;
>> ++    if (!(mask & AP_PROXY_WORKER_NO_UDS)) {
>> ++        url =3D ap_proxy_de_socketfy(p, url);
>> ++        if (!url) {
>> ++            return NULL;
>> ++        }
>> +     }
>> +
>> +     c =3D ap_strchr_c(url, ':');
>> +@@ -2326,22 +2328,22 @@ PROXY_DECLARE(int) ap_proxy_pre_request(proxy=
_worker **worker,
>> +
>> +     access_status =3D proxy_run_pre_request(worker, balancer, r, con=
f, url);
>> +     if (access_status =3D=3D DECLINED && *balancer =3D=3D NULL) {
>> +-        *worker =3D ap_proxy_get_worker(r->pool, NULL, conf, *url);
>> ++        const int forward =3D (r->proxyreq =3D=3D PROXYREQ_PROXY);
>> ++        *worker =3D ap_proxy_get_worker_ex(r->pool, NULL, conf, *url=
,
>> ++                                         forward ? AP_PROXY_WORKER_N=
O_UDS : 0);
>> +         if (*worker) {
>> +             ap_log_rerror(APLOG_MARK, APLOG_TRACE2, 0, r,
>> +                           "%s: found worker %s for %s",
>> +                           (*worker)->s->scheme, (*worker)->s->name, =
*url);
>> +-            *balancer =3D NULL;
>> +-            if (!fix_uds_filename(r, url)) {
>> ++            if (!forward && !fix_uds_filename(r, url)) {
>> +                 return HTTP_INTERNAL_SERVER_ERROR;
>> +             }
>> +             access_status =3D OK;
>> +         }
>> +-        else if (r->proxyreq =3D=3D PROXYREQ_PROXY) {
>> ++        else if (forward) {
>> +             if (conf->forward) {
>> +                 ap_log_rerror(APLOG_MARK, APLOG_TRACE2, 0, r,
>> +                               "*: found forward proxy worker for %s"=
, *url);
>> +-                *balancer =3D NULL;
>> +                 *worker =3D conf->forward;
>> +                 access_status =3D OK;
>> +                 /*
>> +@@ -2355,8 +2357,8 @@ PROXY_DECLARE(int) ap_proxy_pre_request(proxy_w=
orker **worker,
>> +         else if (r->proxyreq =3D=3D PROXYREQ_REVERSE) {
>> +             if (conf->reverse) {
>> +                 ap_log_rerror(APLOG_MARK, APLOG_TRACE2, 0, r,
>> +-                              "*: using default reverse proxy worker=
 for %s (no keepalive)", *url);
>> +-                *balancer =3D NULL;
>> ++                              "*: using default reverse proxy worker=
 for %s "
>> ++                              "(no keepalive)", *url);
>> +                 *worker =3D conf->reverse;
>> +                 access_status =3D OK;
>> +                 /*
>> +--
>> +2.17.1
>> +
>> diff --git a/meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-447=
90.patch b/meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-44790.pa=
tch
>> new file mode 100644
>> index 000000000..4bef9519c
>> --- /dev/null
>> +++ b/meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-44790.patc=
h
>> @@ -0,0 +1,32 @@
>> +From 7e17af6bc469e9cdded01a3f076043892d9d9a58 Mon Sep 17 00:00:00 200=
1
>> +From: Changqing Li <changqing.li@windriver.com>
>> +Date: Thu, 13 Jan 2022 13:50:20 +0800
>> +Subject: [PATCH] Merge r1895970 from trunk:
>> +
>> +  *) mod_lua: Improve error handling
>> +
>> +git-svn-id: https://svn.apache.org/repos/asf/httpd/httpd/branches/2.4=
.x@1896039 13f79535-47bb-0310-9956-ffa450edef68
>> +
>> +CVE: CVE-2021-44790
>> +Upstream-Status: Backport [https://svn.apache.org/viewvc?view=3Drevis=
ion&revision=3D1896039]
>> +
>> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> +---
>> + modules/lua/lua_request.c | 1 +
>> + 1 file changed, 1 insertion(+)
>> +
>> +diff --git a/modules/lua/lua_request.c b/modules/lua/lua_request.c
>> +index 67ff432..493b2bb 100644
>> +--- a/modules/lua/lua_request.c
>> ++++ b/modules/lua/lua_request.c
>> +@@ -410,6 +410,7 @@ static int req_parsebody(lua_State *L)
>> +             if (end =3D=3D NULL) break;
>> +             key =3D (char *) apr_pcalloc(r->pool, 256);
>> +             filename =3D (char *) apr_pcalloc(r->pool, 256);
>> ++            if (end - crlf <=3D 8) break;
>> +             vlen =3D end - crlf - 8;
>> +             buffer =3D (char *) apr_pcalloc(r->pool, vlen+1);
>> +             memcpy(buffer, crlf + 4, vlen);
>> +--
>> +2.17.1
>> +
>> diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.51.bb b/=
meta-webserver/recipes-httpd/apache2/apache2_2.4.51.bb
>> index d6e736d31..233543af8 100644
>> --- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.51.bb
>> +++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.51.bb
>> @@ -15,6 +15,9 @@ SRC_URI =3D "${APACHE_MIRROR}/httpd/httpd-${PV}.tar.=
bz2 \
>>              file://0007-apache2-allow-to-disable-selinux-support.patc=
h \
>>              file://apache-configure_perlbin.patch \
>>              file://0001-support-apxs.in-force-destdir-to-be-empty-str=
ing.patch \
>> +           file://CVE-2021-44790.patch \
>> +           file://CVE-2021-44224-1.patch \
>> +           file://CVE-2021-44224-2.patch \
>>             "
>>
>>   SRC_URI_append_class-target =3D " \
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#94800): https://lists.openembedded.org/g/openembed=
ded-devel/message/94800
>> Mute This Topic: https://lists.openembedded.org/mt/88392787/3616698
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [akuster808@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

