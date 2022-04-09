Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0578C49EA5
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:59 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.2680.1649473477121958723
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Apr 2022 20:04:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=e8wtJHGq;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=1098c8ded6=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 23934aFc020957
	for <openembedded-devel@lists.openembedded.org>; Sat, 9 Apr 2022 03:04:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=6oWS9MzsGOgWtmnmzLv0MIBpG6MFE9DczqBNJm5vMgw=;
 b=e8wtJHGqaQfrYJsYiljmEcellXr/8F4nMbtqPef5GajDSJl505hnapFp8AjNB2LtFU8U
 JaYsfcpM8S87JMJoPe67vI1TVhDbj0Bi5fKR1j1kQw+VgZ5JRN9ZKcCPON3kT5r199Gg
 gM6PrfXfdkrn3EgjT74yCqjSmaLHQ2EdLsHTU6rzMtvFX6DqkLu3rHnryjCTkq3td4GA
 Fp6L5zd+Z/e+3XEHFLWW2A8CccgHg+EGlqnRj9SUIEmInzYzoAVNJ92ffz7/8ecCwT7j
 Md9n721RyUyg1PgtqONPValOzLXJ7MjJDYsEj/nsoMgp8rh1FqC/3xFeDPajDunYNrxy Rw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fb148g0ss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 Apr 2022 03:04:36 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 23934ZJ9020950
	for <openembedded-devel@lists.openembedded.org>; Sat, 9 Apr 2022 03:04:35 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fb148g0sr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 09 Apr 2022 03:04:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RCiXVz8tvICw+HzQGoDU2gsl20CWhTVoXnKXYUr9EGt0FHF/sujVZg3y++Zbw3Qqc852Ljti5cIv35kHDeKjk/3aMK5qVroYwbY1+/OeiPmkgJBZ1OySReBgWjIU+g3EvFTG9y7Ig+wclBQ7G2ow6wg4l1VprQDNUX67UA3sO2/ax9n7pzqIKclMrO0RnVuMbdYXpIImyiXvzGK2Xi7Nvrnp9mZiMg2dQSjK6cgXWReCYatbt0cdV627SMa8Pz46VVGOiBbgovlHY1UZh53GCCPm0q/uogdNq7QIUEmxs7U/dohksNFnfzmhU0sxG9u7H9/oPFbDWfqUrJr7yuASCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6oWS9MzsGOgWtmnmzLv0MIBpG6MFE9DczqBNJm5vMgw=;
 b=To6FiExfC/0+uQB6YKJcevsvbTPg7t/8ibvbJNGrULHhDkJuWb9Mw+gCItS6/mZ8GPiTjzyn4cYjX1oY2Oft9QPcYAlkMVy0tnuvGcwPsLAYQn+wOhoDePl7mCsjtGqZKY2h/vymLEQ7dFpDYbIoBqIcHTZBqEq1O3R7u1y+8tN/q6Jc816dIbhvq/yJgx6O0rcnEQzsqbNetfwu09hLQdvoyQ9Ayendztp6aQbM25nd/srklclzC8Inb8OFZoZahY7R9nAn8OSBayJCNAEeHP4ugTuQEtj8DN9P2qUCzzNPGBPX0XPfHw7UmegRuNpHHLBBlKWTtwi39o8trJWymw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BYAPR11MB2789.namprd11.prod.outlook.com (2603:10b6:a02:cc::11)
 by BL0PR11MB3105.namprd11.prod.outlook.com (2603:10b6:208:33::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Sat, 9 Apr
 2022 03:04:31 +0000
Received: from BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::d96a:d12:74c9:6313]) by BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::d96a:d12:74c9:6313%6]) with mapi id 15.20.5144.027; Sat, 9 Apr 2022
 03:04:30 +0000
Message-ID: <7e738ea4-3272-9313-840d-d4568e83aa26@windriver.com>
Date: Sat, 9 Apr 2022 11:04:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [oe] [PATCH] wxwidgets: Fix building without x11
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>, Scott Murray <scott.murray@konsulko.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <16E3F6217A8A56EC.6461@lists.openembedded.org>
 <1ae383-3355-e547-def-e61659ebd42@spiteful.org>
 <CAMKF1srAwURgiKSrMyvJ-feu=4yCBDwzu3e_cSZK2jPh354s5g@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: 
 <CAMKF1srAwURgiKSrMyvJ-feu=4yCBDwzu3e_cSZK2jPh354s5g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HK2PR02CA0166.apcprd02.prod.outlook.com
 (2603:1096:201:1f::26) To BYAPR11MB2789.namprd11.prod.outlook.com
 (2603:10b6:a02:cc::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20986da8-b1b1-4e83-7eb4-08da19d5aa50
X-MS-TrafficTypeDiagnostic: BL0PR11MB3105:EE_
X-Microsoft-Antispam-PRVS: 
	<BL0PR11MB31055235BE65FCCD39CA7220FFE89@BL0PR11MB3105.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	x50oSalfJ2lQirGF93leUFMtKwC1XZ/2RT0NSragVolRPF975dDcqxU2K7tWpJSEJdKyP7bhk0iOy2QPnTudRMtvwtj/kE42Q9zIWvsO0s7fxcnM2mqERZlDIzMFvM//rfPgE5zk2VvFkU+GvsY5+qshwkzR2onQ0uCHoC4ur2+Jj5Guiz78h4Jo2bA/SCOA1wyS0rAb5xP+hiHb1tR4uLX9RediolWg/Qa2qszVCeUddX1uBM7ZR9ZdF+R8VMnRNuoVVsfE27NlZ4kD8hxrNUTT1bt0gRKpzekvva7BEz7Df95WMwFQfgMHeoGmmKF/syNOUIdVsgh6IMt3f+79hvxevEYy060tsO+KPSKpvkleVq1ZbR+J3Xx9sJ4GP0KcZ8QaGCwqZxanxu3oqOox7Y6/Vy70ZiQDDFEXgItSbwIucpwKSyYECejzF8gs6DR5X7U7NljX8Licga7PNvuf7FqGP0pJ02aFa/FG5R8qVP6vEums2B4lki8fqnGbrVZGvieakPcvyRD6KtdFv+Dl4oyIqmCCU7WtcEmj7cz/sdhoREE2VYkx/3m7lSv9nPxgwMJ3KaJtXKonKeaX+8IKXeAcb/XO83tq2uSgbeISUXeVqXBBmk15GHEIBhmYjExRBVPhi9xV80UyLUEejodgOHYMjUPhG3WwLjXvj0z+4SilTYwEXwiK3bfRzjbtZMuAv4Qz8IjuUOA/UTSNHfpTIPgTzTAXsfjUy7YghMQ1hCSLf4XuNT5nXhBVe8P4qFjghD9aQL+Th1DO5QLuV5WzTVGSP/ByKZi+c4gxMZx1khNH9lW1Jf/End0FfIEmDGjdMWQnIV2Cv4FupUnbwmmJWz0+MA1OgCH2wq4veN3toCDNbXDarGKFubDxIIamiS4wHkSjWbzMsy5fBCZgpMxMgu68kaWE4Y2M/zya+xWWebo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2789.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(38350700002)(4326008)(8676002)(186003)(66476007)(66946007)(5660300002)(110136005)(83380400001)(6486002)(966005)(36756003)(52116002)(53546011)(6512007)(6666004)(31686004)(6506007)(508600001)(66556008)(2906002)(2616005)(26005)(86362001)(31696002)(8936002)(316002)(9126006)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZWdGV2ZVczhDUVBZTCtZY3M5NFRHdnhSd1ZEN2F0c050SjJDQVE5VDA0VzYy?=
 =?utf-8?B?L254WTdMamNkYWt6RVo5eE1NSVhpa2VZemdJQkkzRTdIUDFYa3BucXNKQlhY?=
 =?utf-8?B?RDVISTlTV1YycVBkWDJTc1R3eTFweGVZY05HK0J1aHhLbllDR3h3Nk5qek9z?=
 =?utf-8?B?alVMMzcwc1kxNStNaWxraTF4b0lmODBscGNBK0VOOThFcDlGNzNGY3B5cUpy?=
 =?utf-8?B?bWFkZHNZbS9vSWsrS2hmcUZubU5QR2xDeHhIdWVmMjlWckpkM3NDMEtpS2Za?=
 =?utf-8?B?SEhGcnFpVzlORWlZbTBMcUFsbUtVdEp0cEFraHJqOGtjd3FIRFBkRGNtTjFL?=
 =?utf-8?B?RW1iUEp2azlsaXM0RlRYdXpSVCtMZHhmSzlZQ3R4QldUNlNEMVAyYjRmTnB2?=
 =?utf-8?B?RVp2OUZxN3cweXhrRTBzSmtuRUFqbVEzd3QyenVCU1grUjR0VERQRlg2RTJQ?=
 =?utf-8?B?MFpaRzBvVGFMVEJkeDNSckZ6N1RoOHNFRDVyY2RFNFFlS0o4VHhuTW1yZHZ5?=
 =?utf-8?B?Nk9zM1VZZU1pemNMVVFYTWZLd2Q2VnNVcWs2Q1F4SG1ncXV4TFZ4Z0Z5VzZV?=
 =?utf-8?B?Z1JTc0xmOFlZY2MxdFNiWXBvajVhazlKNU1wTkRZb3l3OUd1R0JYcXdER1FP?=
 =?utf-8?B?b05Rd0lhZUZkcnVpblliVThRRzltVVpERW8zdEtMbzUrSCtqNitLL0Vrc01O?=
 =?utf-8?B?QWMzOExuZ3FJSGlqNkNpRFZ0aXJobEVhVEF0bzNaVlFJWGJoVm1JY1liM2Fm?=
 =?utf-8?B?d0V3WllYOUF4THFHRWtBZmo3eGxkbDE3Y3dhU3A1akNvUXhnbXZaQnU2VElr?=
 =?utf-8?B?TXA1bHpoTFI2eWdaSU1sSk9xSDNJUXBQbEUyb3NWRHYwamZuekk1NnowNnNT?=
 =?utf-8?B?N0RXRk11bTRDbS8zdmp3R3dvb1FXN2dYa1VxOUVFQlplMU5hM2RKU1JCQ0RU?=
 =?utf-8?B?TWlnekFrYlZNbjVCajVxWkk1RFFlR2kxZzljYUhoQk12bWFSRlFHQUdmL3B6?=
 =?utf-8?B?dnZGUEpjSm54WGkrRDlzeUlpSzZzSHE3RmwvNmFCMktra1hvWEFiTlZtd3po?=
 =?utf-8?B?SXBOUCt5aGJKcDYzVkRrSGFXaklpVXhnMlJ0U2lFM2lPN1pJSmdSR1lyaks4?=
 =?utf-8?B?WTZIMXFRckE0QkVkOFRnK2llY0c2TTlJbEFoR2JjQjdPdHpPQ09EWU5tZU1i?=
 =?utf-8?B?d2F4OFZLZDBVczErTDd1NXVyMUMwamNiKzNXTHBNbDhoMVNIOTF5Q1BxcjhV?=
 =?utf-8?B?K3AzN2ZsY3J1Tk5Nd2hVb1lES0Fod3F0bkRXVkwzaWdSeExhUFdjOS9tM1ov?=
 =?utf-8?B?SDBYdWtuWE96VlEwRG1GQmFLQXN3T3N0cTliY0ptRGVtQ0FhMElqVXpiYU5F?=
 =?utf-8?B?Ni85V3BVVHp3MTgxUzFNdStxajI3TzEzUnpibXpMQmJXNVRBMk45ZXVPYVM4?=
 =?utf-8?B?WUpYRG1abDFVWHJVVjZ0bVg3ZU5talZsT25MYlhGWkxQdlpnREdWa3lsREd0?=
 =?utf-8?B?Y016b2poR1JlRzdrL1hYakZsSkt0U0NmVk04d0lzZHlrSzlWU0R4VTh4Tjd4?=
 =?utf-8?B?Wk9NS0Y4d2drK05RNVkwUi9BOXV2THJjRDdNNlMxMkRnYWdFd21SUWxTT0ZE?=
 =?utf-8?B?WHFwTTB2dGhwcUUxN09tTnZJRkNzK2JLRkN3UFpNaHE3djZ1RUlZMVd2UG9C?=
 =?utf-8?B?cldldjEraktreGFNWVZtVmZ0M3ZOUVpZWFZ5eDJ5b2UwUVkvdmlCYk5COFoy?=
 =?utf-8?B?U3BLUHVJMDZra2swRVdFVitUR2F3STNlMm55S1B0WXpTVy9YcTd6Ny9CaGRW?=
 =?utf-8?B?cHZmNGQ3QzBZRHZIVVRRaHgxS0w2ZGZ1ZGRUNlRwR3BKalNBQzkxeW94TjNy?=
 =?utf-8?B?OHZ1NHF0cVpSWlNFM3Y5bFhiY3ZHNzlyY3BnMnN1QjhkRlNROUdmOG9yWVVB?=
 =?utf-8?B?SHJ1eUhDVFpELzUyK2IxcGlxWHEyTGFySVZpMFNwQmZ4VWhodHJKeEhZT1kx?=
 =?utf-8?B?R0pncGpFYnlLMERFUExwWFNCYUJTQ0FyY1IwWmRIRnhqUkt5Y3poTGhjVlgr?=
 =?utf-8?B?YVdRZmpETVV4ZXIzZjdsWUx0eldXL3JoY0tpL1FaaHRhRmFYQVI3bzZYM0kz?=
 =?utf-8?B?Nmc2Mi9TM1ROb2RhMzk1YTVjaUlNNkNiQmdqd1prUVFJT1hDR1pFSk02K3Qw?=
 =?utf-8?B?WVhIeGY4M3hTTlpBY1VvQnN4eWRyK0w3dWhqeFpaRFhCc1R4SmtQTWp6K0Yx?=
 =?utf-8?B?d2tPY3g1aVpWcy9SUWlsSUlhZlN6UVVuUjVVaVJyWGZueTVxZEVSTCt3NFJX?=
 =?utf-8?B?UnFIekcxZU1WT3JwNHUzdm1qLzllZVl3RkhJL3cvMHhoZnJ5WHRiRk56MTZQ?=
 =?utf-8?Q?zCW7gozNAAFNbCBA=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 20986da8-b1b1-4e83-7eb4-08da19d5aa50
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2789.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2022 03:04:30.4508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 GYY8eNu7+k/b4Jk2Qrb3ORN9wzFtn2WOCAR/zSGfb0W2TtCAVOeZ7LQAu+w8yXT4YVerVxQitTTgYZ1pYWMpAjBBnFMO7//FGbdVI1pn4nI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3105
X-Proofpoint-GUID: kaWwyTuw6mhffd3ajWPDTKk_9crQ0t-f
X-Proofpoint-ORIG-GUID: ll0XgnVRzr6xCyACX-WoMDKszm-MlfYx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-08_09,2022-04-08_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0
 phishscore=0 mlxscore=0 mlxlogscore=616 impostorscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204090016
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96492



On 4/9/22 01:41, Khem Raj wrote:
> On Fri, Apr 8, 2022 at 10:36 AM Scott Murray <scott.murray@konsulko.com> wrote:
>>
>> On Fri, 8 Apr 2022, Scott Murray via lists.openembedded.org wrote:
>>
>>> Building with wayland and opengl in DISTRO_FEATURES without x11 as
>>> well was giving the error:
>>>
>>> wxwidgets: PACKAGECONFIG[no_gui] Conflict package config 'opengl' set in PACKAGECONFIG.
>>>
>>> Upon some investigation, it looks like wxwidgets now supports building
>>> against Gtk's Wayland support, so we can also enable it if wayland is
>>> in DISTRO_FEATURES.  For OpenGL, however, wxwidgets seems to have a
>>> dependency on libglu, so the DISTRO_FEATURES check has been changed
>>> to only enable it by default if both x11 and opengl are configured.
>>>
>>> Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>>> ---
>>>   meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb | 6 +++---
>>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> I hadn't checked the list before sending this, I'd be okay with Robert's
>> similar fix instead, though enabling building with wayland support seems
>> like it potentially could be useful to somebody.
> 
> I have taken the latter fix since it was fixing wayland too.

The fix looks good to me, thanks.

// Robert


> 
>>
>>> diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
>>> index e82143040..e7e89d64a 100644
>>> --- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
>>> +++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
>>> @@ -43,9 +43,9 @@ EXTRA_OECMAKE:append:libc-musl = " \
>>>       -DHAVE_LOCALE_T=OFF \
>>>   "
>>>
>>> -# All toolkit-configs except 'no_gui' require x11 explicitly (see toolkit.cmake)
>>> -PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk', 'no_gui', d)} \
>>> -    ${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)} \
>>> +# OpenGL support currently seems tied to using libglu, which requires x11
>>> +PACKAGECONFIG ?= "${@bb.utils.contains_any('DISTRO_FEATURES', 'x11 wayland', 'gtk', 'no_gui', d)} \
>>> +    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'opengl', '', d)} \
>>>   "
>>>
>>>   PACKAGECONFIG:remove:class-native = "opengl"
>>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#96483): https://lists.openembedded.org/g/openembedded-devel/message/96483
>> Mute This Topic: https://lists.openembedded.org/mt/90338460/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

