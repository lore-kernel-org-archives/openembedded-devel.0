Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28BB4EB64D9
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 14:38:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9075.1689172701922783668
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jul 2023 07:38:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=LVikXkdG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6557c938ed=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36CCrDSo026148
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 14:38:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=LU55x56wYCaXdsJCe9j
	3pi/6YwuIHQOI528+8I8A84w=; b=LVikXkdGy7qtpncOg/E/vHR3WaP8MFwAOqI
	je4qHNezX1j0gPPle0RIRHpkIjslrm7mStJQuL/6XJMUSdTlYHDiVdDQiFVW6W1U
	USb8MzWx04gyKy9XqBBrBtBzVO9DwsIS4L/Qm464fnylQ6Jaci0CJZxg1JaNcjgG
	6bgK+BPzbfDZX99XqMZWDg3+JrkZN+2f7B84ozN9QIwk5rZjwrM6/vasLX4zw8Fy
	r0jmvDzJqm2oiUBbh1f9MdG/afTph+qv302eztStMThNYbK4O86jM1PK97/2iR/5
	hRC+NP0rt+z/bM82A3ty9mxvC2iDGxN61G/F2jBduMvwFUYkQqA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rpw0wkqch-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 14:38:20 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 36CEcKnT027817;
	Wed, 12 Jul 2023 14:38:20 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rpw0wkqcg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jul 2023 14:38:20 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NmHNyaxzNtBYwB+uuo6BZX5DbzGZLbiSi1YDnEqaX+N6vv4ME1ROAwtGoCCksbL/4tJR/FSRqMzu2T23RQbBZPagx780b71Uz5S59Ang9Zk0hDEJKjUU5Rq0UIrkF0RjEKEhNbLLDpkWZkugTIELSFncnvWBG12wucKh5LOWrZHQo6Kicai1wdJbJkmU6Z3XPQnemgxxveu/7S95DTvLSB4WMuYzr67dYG03XlZZAV4z2uIj3MHcqzvFGy9Q3TvfIPLY7R3V8PPcdWCIBSXOJnKYY7wfhh9IorGJDP6zXSsfd1m5NapPgWuDW/rqwUYxi1W6Wp+c86LL7IS5vcJCTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LU55x56wYCaXdsJCe9j3pi/6YwuIHQOI528+8I8A84w=;
 b=DAosC8pbvtaQMauJftiKVa5zjG+FKejJdOyPBMC2PFh9OZ5s4xDBg5BzYDX79KzNdhKXaNR4syRKpl6SJDpjFQ+RC6JbR/SCmDwqiySpeANBNA5QOq5mNVuOPcLIEiw7KwsaVUIYUv6ahjEMYUB4nAL0jVNG8bOXinaLzReUp2CAU/3G4u6MUYrbCvRQWfpfY0mxSjQjE4c7HEfjrH9g1FmV+Kc6UE2AFoh3mXGjOAABk5DXPPKciS+2XHihHKtammzHYOP1sfhs1/L4P1c14SLzB6rRxeFmxPqtQOYCrHSoeOj9HLquVKFB4SJBaAlkrR3KdPJoWta57WcxT2wRAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by MW6PR11MB8392.namprd11.prod.outlook.com (2603:10b6:303:23a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 14:38:14 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::20ff:3f23:8d9c:a181]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::20ff:3f23:8d9c:a181%6]) with mapi id 15.20.6588.017; Wed, 12 Jul 2023
 14:38:09 +0000
Content-Type: multipart/alternative;
 boundary="------------Q8SFvY2l21szqnfP02qZYH6Q"
Message-ID: <441bc7b1-8aca-e043-f39d-b62e6a250481@windriver.com>
Date: Wed, 12 Jul 2023 10:38:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [oe] [meta-networking][kirkstone][PATCH v2] mbedtls: add support
 for v3.x
Content-Language: en-CA
To: beniaminsandu@gmail.com, Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-devel@lists.openembedded.org
References: <20230628184046.121775-1-beniaminsandu@gmail.com>
 <CABQJdOFSBfwwKh9dcMuTnrKdTpjc+cXo5q5N0iD_Q-Gx6o0QMg@mail.gmail.com>
 <20230706213623.GG1518@denix.org>
 <CABQJdOG1FmeJ8oQVdx+76FpLrP5CrYbFhxRicUhxmdZ8pWXqWA@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CABQJdOG1FmeJ8oQVdx+76FpLrP5CrYbFhxRicUhxmdZ8pWXqWA@mail.gmail.com>
X-ClientProxiedBy: BYAPR05CA0099.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::40) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|MW6PR11MB8392:EE_
X-MS-Office365-Filtering-Correlation-Id: 7052a444-21ac-4a56-5974-08db82e59c91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hdtZkef43gmg9/1D2n9+h3lsNvvzhRQMiB18HT3/wK9vEVLq1fsn3TfsIDEtI4dBj/B3H2UN0+cePOb7VnRzmeZa354YvFtI444iGIP6ZD/C6d264WOt41m456erJCZlnUlnkaI9rfJYEEtenoDw1rBS6blccEHciSnZV8o5Aoblm/QJS0D7CqtN4Hr3pnXF6doWlY/Ecg/HQ1Cf76QL+LMKpSf0KPEcV4Dhv38YkRxbQodVObmaLCGxJs163FrWoV4xyT+I9EirEblX1SoK/rWZY/xB/DCovU15FwdpB+WdlYC7DroXUi7PRnq7e5X9yXauA3cIOfj4cqYJj6wMbKbVbg5FQSQFcFzcTFt7d9kUmtu1AW36sHraAY+PpkgIi1XJt4dZzv7kHOX2sJ5Ddo6UQ2s8MeA1qFULPX89ml04L3txsWblFsePWz/E0ms39XNbb2zulMmfhFr7+E02Rj4WwzngXE9K1pb205qNcdANFlWG6ffz5Iyrzbca1EvtC2QrP5tqniPz5bN7W0wew2aA+1zZ1BhFeAxuYgm3RjuWB+U6Oea0b+DGG2pDRAAp/G4FZPbAFs+aZnnVgWEs1wv6zEEfmn2KPEON2wEzO4tMEVidKkS/Pm+6jXX5TLLxVPnAVwn19pCsYA+SD1wBvNb9ywXNVtO16YT7mI0mG8HcdYDW7uz8CiWooHkBKvKJ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(376002)(396003)(366004)(136003)(346002)(451199021)(41300700001)(8676002)(8936002)(6486002)(6666004)(30864003)(2906002)(31686004)(316002)(5660300002)(66899021)(6916009)(4326008)(66476007)(66556008)(66946007)(6512007)(966005)(33964004)(36756003)(478600001)(31696002)(186003)(86362001)(38100700002)(83380400001)(166002)(6506007)(53546011)(2616005)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OEtFUzJYNDg3YXRPdlNFdyt5bWhDdE9BTFArY3BUWHNMZFk5ZU4wNUdmK0to?=
 =?utf-8?B?V3VUc1pWYjAzNCtKR3FWZlRUQzlFd2hiRnpVMHJFa0hrWUJJZ0QxWXFHbDlY?=
 =?utf-8?B?anBCV2tQcGVGSEhRVk53K1lnUU9rbDBIUGtndzVHNTdRdDRBK3daSXhmbzQ5?=
 =?utf-8?B?SnFldmNzVGlqYmsxeHdoZlU1RU55QWV5bnprbTlPTlcwc3VWa2hBLzJJWC9i?=
 =?utf-8?B?Yi9MU1JlTlpNdCs2TlRjYVVnNHJzVWdDd0pab1N2VFoyZUk4L2dkektGRjZ1?=
 =?utf-8?B?Mi9RNUJuRXV4RksvVWl1UUtxUmlQM3JNV05PNW4zM1ZVZVQ2K3RQdHA2L2JN?=
 =?utf-8?B?Szkrd1ZzL09NSkRjU04zUlM0ZVdGZ2ltTTNyU2lFLzIySVBoZ1h0YlltZlhy?=
 =?utf-8?B?b005c2E2SzBMSzF5dFdzT0c3RzVQOTFJbnIra1d4NHIvZzdOdHVxWmZxSmJS?=
 =?utf-8?B?UXRWdmFpVURnSjlydDRqUGE1VFhWR1Rpd05zMFBhLzJhQkpPSmgrZk4wVStn?=
 =?utf-8?B?NTF6dmtoQzIrZTIrd0FISUNFQUtmOTRNKzY3KzhNTFRtL1U3bGZRYzcxVWU3?=
 =?utf-8?B?ckVaNnFsYzBzMWRBRVp4Tm5yVDRSU3hEcGNJVUhKRTM5ck9xSTkvenp2a2o3?=
 =?utf-8?B?aTluVDVsWldRb2ZVaU9hdThGNGxMSVkxM0VEanR4cWhGM29hL0xCN09JZU9k?=
 =?utf-8?B?ZGZrZkVMaWJzY083UjJQZTQ2UDM4ZjlIZ0NjMTdDS1ZoZWdXdjdQTXpCVGMr?=
 =?utf-8?B?SzE5RWYvc205d3VWcjlLRmFqeUwvRDNGY3IwK1J6bFZyTVIvZWV1Q2prQnlr?=
 =?utf-8?B?WEljSWFGNWpHR2ZTZVJab2ZQTURzSWlwTGlteDFpbktyUjlFR0xMVEhaWGlQ?=
 =?utf-8?B?OGFNYUNJVDl5RzFDMk93bVdBMHlTYjRJcE52am02L05CeERwNmFCODNlR0k3?=
 =?utf-8?B?c3N4MUM3UUNXUzliRHBqb2J1Qm51OW15Z2Z5RVJOdVJmc3orUFZrd25FVERw?=
 =?utf-8?B?NVFlVi8xaFI1YlFHWXVvWmFoVTdPQWtpSFRRT2FzUjgvTHJoZFEvWjFhZDhO?=
 =?utf-8?B?VzNnaVFDVzN4b0FtZEdjS1p6YzdSVVEyeGNpN1BzTlB4L2YxQmVaN3ZNU2s1?=
 =?utf-8?B?aWZBenFIWmk2QVBQUXJwRGphaXpyV1ZXWW80dzFkTXB6blJROGNsN09ZbGV5?=
 =?utf-8?B?Rjh0K0t2R0IvQmczb0dxWTlGSVR2T0RldlVPYkNORWgwMEo5SXpMaFozMndR?=
 =?utf-8?B?ekYxMDJZcVhvNUVQSW5zMStpYUdQRzF0NUw0K1VIWlk3c3EvMUZMTnlJUkFI?=
 =?utf-8?B?QXpqNnA2SlloUTlZeElhcEtwVzRVTlFSL3ExbjR3ME5PS2w3N0ZOMHJ6ZUJz?=
 =?utf-8?B?eU1iVWptWXFNRGNSVlk4SWhqNFJNRENyeDI0dnkvRytpbzdHb1JQdWNTckpM?=
 =?utf-8?B?UTBzTGdBbFpUMG0wek9NZXI2MHBvWkNmbWNwMW85c2RZVklzeVpobkhUcmpZ?=
 =?utf-8?B?Zk80UHVsSEhHQUNKMkNrYmJoMlFsTVZzbnBxMXppeklDM0t4Znc4MFRvS1Ay?=
 =?utf-8?B?RW81OWI3UXNtZFBVcFF1Q3o5VEJibjdpV1JnSWVvYmZIRmFkVUpORm12eGhj?=
 =?utf-8?B?NlVuMm1BSTRaSHVzNnpZem51L2w4U1BvcFdTMFRHMGR2MlYwR21XSjVhRXVx?=
 =?utf-8?B?dFp6TDJ3UENFRlo5bTZBU2tOdXJCd2R3Q2VYSlN2QUZjWEJQR3dyUDNYQnVU?=
 =?utf-8?B?ZWtIU2lTNHB5Vk1BTWRwdzVtM3lCTUh2SzdOM3RVYjJTQTUrOG5JSldhb0R4?=
 =?utf-8?B?SGszZ2NjVTMvbENhTXNVRXd6OEgrMTAzT3hMWmZad1l3R0kxTlB0YklBRmVJ?=
 =?utf-8?B?Q0hzVUVNVHd4NE5NOStkNncwN3F5R3JGQ0VtTGdvTWpNYmxWYlljdU9pTEVa?=
 =?utf-8?B?TUpyQVNCRVJnMWk5eThvaTJVS2E1b3llZzlRK1h0dGFaUFZoZWxBSS84clFo?=
 =?utf-8?B?UUFQTjZBNTQ0ZmtYWGpXemdJbUFqa2M4MWp5Nmo3QXc4NVpRbFFYeEs5dVJx?=
 =?utf-8?B?WmQyYUVNamQxVEJEcjlteGVLeDNNV29mc2tmeXVUS3YySTNQRjBDMUY5OGdp?=
 =?utf-8?B?ZU8wRHliaUFrUUhBeUhCeDR5L2tFNmRObjNqWHNVWFF5aENCL0hUWTFFV0tQ?=
 =?utf-8?B?Snc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7052a444-21ac-4a56-5974-08db82e59c91
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 14:38:09.0404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RUGJLx5psMTStEur9CoKy4701/P21/TG9DNHG3N1B1qeJ0dKgiN7dgOVoEJv7u8ErQftjxOf1QgXnR4hYprp5k6K1ahgOspZGyklZoYp1Aw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8392
X-Proofpoint-ORIG-GUID: 1qVhrT1x-ZhMLuW0GKymLk_ByUhJcTC3
X-Proofpoint-GUID: 3Ev7zH24PziqHBPFj8BbIHfUwDIIdPdP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-12_09,2023-07-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 suspectscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 adultscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2307120132
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 14:38:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103840

--------------Q8SFvY2l21szqnfP02qZYH6Q
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 36CCrDSo026148

On 2023-07-06 20:12, Beniamin Sandu via lists.openembedded.org wrote:
> Hi Denys,
>
> I was thinking that since it is not replacing the old version but just
> providing the v3 one as an extra option, it is not really an upgrade.
> While there are noticeable differences between the versions, both of
> them are still available for building.
>
> Isn't PREFERRED_VERSION a simple and convenient way to select the
> desired one? I don't know if there is a better way to handle this
> scenario, but did not consider this to be too much of a hassle, it's
> just one variable and its use is quite straightforward.
>
> Cheers,
> Beni

Hi Beni,

Each small hassle is a paper cut, one isn't that bad but 10s or 100s and=20
you might bleed to death! ;-)


Could you please send a patch for kirkstone (and mickledore) to add :

DEFAULT_PREFERENCE =3D "-1"

to the v3.x recipe?

There are a few other examples but that's what we did
on dunfell when adding a newer version of nodejs:

commit 116bfe8d5e5851e7fc5424f40da8691a19c5b5ee
Author: Narpat Mali <narpat.mali@windriver.com>
Date:=C2=A0=C2=A0 Thu May 11 12:37:58 2023

 =C2=A0=C2=A0=C2=A0 nodejs: make 14.18.1 available but not default

Thanks,

../Randy


>
> On Fri, 7 Jul 2023 at 00:36, Denys Dmytriyenko<denis@denix.org>  wrote:
>> On Wed, Jun 28, 2023 at 09:46:22PM +0300, Beniamin Sandu wrote:
>>> Hey Armin,
>>>
>>> This is the same recipe from master, which now has support for both v=
2
>>> and v3 mbedtls. Since both versions would be supported and it's not a
>>> major package upgrade, we should not be breaking policy.
>> Well, it is actually a *major* upgrade and there are some incompatible=
 API
>> changes in v3 vs v2! E.g. entropy_poll.h is no longer provided among o=
thers.
>>
>> With this backport one needs to scramble and set PREFERRED_VERSION to =
v2
>> explicitly, which is not nice. This is exactly why there's a policy fo=
r not
>> allowing major version backports to stable releases w/o a strong reaso=
n!
>>
>> --
>> Denys
>>
>>
>>> This is also not an isolated case from a quick look, since there are
>>> other packages that do this (e.g. redis), so it would be great to get
>>> it on kirkstone too.
>>>
>>> Thanks,
>>> Beni
>>>
>>> On Wed, 28 Jun 2023 at 21:41, Beniamin Sandu<beniaminsandu@gmail.com>=
  wrote:
>>>> Version 3.4.0 adds a lot of improvements and fixes (a notable one
>>>> being initial support for PKCS7 CMS), but since this is a pretty
>>>> big jump, let's keep both versions for a while, so the v2.x users
>>>> can upgrade to 3.x in a timely manner if needed.
>>>>
>>>> Signed-off-by: Beniamin Sandu<beniaminsandu@gmail.com>
>>>> ---
>>>>   ...cify-an-arch-version-when-enabling-c.patch | 33 ++++++++
>>>>   ...t-target-attribute-when-building-wit.patch | 34 ++++++++
>>>>   .../mbedtls/mbedtls/run-ptest                 | 17 ++++
>>>>   .../mbedtls/mbedtls_3.4.0.bb                  | 83 +++++++++++++++=
++++
>>>>   4 files changed, 167 insertions(+)
>>>>   create mode 100644 meta-networking/recipes-connectivity/mbedtls/mb=
edtls/0001-aesce-do-not-specify-an-arch-version-when-enabling-c.patch
>>>>   create mode 100644 meta-networking/recipes-connectivity/mbedtls/mb=
edtls/0002-aesce-use-correct-target-attribute-when-building-wit.patch
>>>>   create mode 100644 meta-networking/recipes-connectivity/mbedtls/mb=
edtls/run-ptest
>>>>   create mode 100644 meta-networking/recipes-connectivity/mbedtls/mb=
edtls_3.4.0.bb
>>>>
>>>> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls/00=
01-aesce-do-not-specify-an-arch-version-when-enabling-c.patch b/meta-netw=
orking/recipes-connectivity/mbedtls/mbedtls/0001-aesce-do-not-specify-an-=
arch-version-when-enabling-c.patch
>>>> new file mode 100644
>>>> index 000000000..d98d8fa57
>>>> --- /dev/null
>>>> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-aesc=
e-do-not-specify-an-arch-version-when-enabling-c.patch
>>>> @@ -0,0 +1,33 @@
>>>> +From 2246925e3cb16183e25d4e2cfd13fb800df86270 Mon Sep 17 00:00:00 2=
001
>>>> +From: Beniamin Sandu<beniaminsandu@gmail.com>
>>>> +Date: Sun, 25 Jun 2023 19:58:08 +0300
>>>> +Subject: [PATCH] aesce: do not specify an arch version when enablin=
g crypto
>>>> + instructions
>>>> +
>>>> +Building mbedtls with different aarch64 tuning variations revealed
>>>> +that we should use the crypto extensions without forcing a particul=
ar
>>>> +architecture version or core, as that can create issues.
>>>> +
>>>> +Upstream-Status: Submitted [https://github.com/Mbed-TLS/mbedtls/pul=
l/7834]
>>>> +
>>>> +Signed-off-by: Beniamin Sandu<beniaminsandu@gmail.com>
>>>> +---
>>>> + library/aesce.c | 2 +-
>>>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>>>> +
>>>> +diff --git a/library/aesce.c b/library/aesce.c
>>>> +index fe056dc4c..843de3973 100644
>>>> +--- a/library/aesce.c
>>>> ++++ b/library/aesce.c
>>>> +@@ -60,7 +60,7 @@
>>>> + #           error "A more recent GCC is required for MBEDTLS_AESCE=
_C"
>>>> + #       endif
>>>> + #       pragma GCC push_options
>>>> +-#       pragma GCC target ("arch=3Darmv8-a+crypto")
>>>> ++#       pragma GCC target ("+crypto")
>>>> + #       define MBEDTLS_POP_TARGET_PRAGMA
>>>> + #   else
>>>> + #       error "Only GCC and Clang supported for MBEDTLS_AESCE_C"
>>>> +--
>>>> +2.25.1
>>>> +
>>>> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls/00=
02-aesce-use-correct-target-attribute-when-building-wit.patch b/meta-netw=
orking/recipes-connectivity/mbedtls/mbedtls/0002-aesce-use-correct-target=
-attribute-when-building-wit.patch
>>>> new file mode 100644
>>>> index 000000000..4775c8ddb
>>>> --- /dev/null
>>>> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0002-aesc=
e-use-correct-target-attribute-when-building-wit.patch
>>>> @@ -0,0 +1,34 @@
>>>> +From 03d3523f974536f2358047382aadb0d4cc762f8a Mon Sep 17 00:00:00 2=
001
>>>> +From: Beniamin Sandu<beniaminsandu@gmail.com>
>>>> +Date: Mon, 26 Jun 2023 12:07:21 +0300
>>>> +Subject: [PATCH] aesce: use correct target attribute when building =
with clang
>>>> +
>>>> +Seems clang has its own issues when it comes to crypto extensions,
>>>> +and right now the best way to avoid them is to accurately enable
>>>> +the needed instructions instead of the broad crypto feature.
>>>> +
>>>> +E.g.:https://github.com/llvm/llvm-project/issues/61645
>>>> +
>>>> +Upstream-Status: Pending
>>>> +
>>>> +Signed-off-by: Beniamin Sandu<beniaminsandu@gmail.com>
>>>> +---
>>>> + library/aesce.c | 2 +-
>>>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>>>> +
>>>> +diff --git a/library/aesce.c b/library/aesce.c
>>>> +index 843de3973..7bea088ba 100644
>>>> +--- a/library/aesce.c
>>>> ++++ b/library/aesce.c
>>>> +@@ -53,7 +53,7 @@
>>>> + #       if __clang_major__ < 4
>>>> + #           error "A more recent Clang is required for MBEDTLS_AES=
CE_C"
>>>> + #       endif
>>>> +-#       pragma clang attribute push (__attribute__((target("crypto=
"))), apply_to=3Dfunction)
>>>> ++#       pragma clang attribute push (__attribute__((target("aes"))=
), apply_to=3Dfunction)
>>>> + #       define MBEDTLS_POP_TARGET_PRAGMA
>>>> + #   elif defined(__GNUC__)
>>>> + #       if __GNUC__ < 6
>>>> +--
>>>> +2.25.1
>>>> +
>>>> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls/ru=
n-ptest b/meta-networking/recipes-connectivity/mbedtls/mbedtls/run-ptest
>>>> new file mode 100644
>>>> index 000000000..059ab4ecb
>>>> --- /dev/null
>>>> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls/run-ptest
>>>> @@ -0,0 +1,17 @@
>>>> +#!/bin/sh
>>>> +
>>>> +ptestdir=3D$(dirname "$(readlink -f "$0")")
>>>> +cd "$ptestdir"/tests || exit
>>>> +
>>>> +tests=3D$(find * -type f -name 'test_suite_*')
>>>> +
>>>> +for f in $tests
>>>> +do
>>>> +    if test -x ./"$f"; then
>>>> +        if ./"$f" > ./"$f".out 2> ./"$f".err; then
>>>> +            echo "PASS: $f"
>>>> +        else
>>>> +            echo "FAIL: $f"
>>>> +        fi
>>>> +    fi
>>>> +done
>>>> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.=
4.0.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb
>>>> new file mode 100644
>>>> index 000000000..b8c9662de
>>>> --- /dev/null
>>>> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb
>>>> @@ -0,0 +1,83 @@
>>>> +SUMMARY =3D "Lightweight crypto and SSL/TLS library"
>>>> +DESCRIPTION =3D "mbedtls is a lean open source crypto library      =
    \
>>>> +for providing SSL and TLS support in your programs. It offers      =
  \
>>>> +an intuitive API and documented header files, so you can actually  =
  \
>>>> +understand what the code does. It features:                        =
  \
>>>> +                                                                   =
  \
>>>> + - Symmetric algorithms, like AES, Blowfish, Triple-DES, DES, ARC4,=
  \
>>>> +   Camellia and XTEA                                               =
  \
>>>> + - Hash algorithms, like SHA-1, SHA-2, RIPEMD-160 and MD5          =
  \
>>>> + - Entropy pool and random generators, like CTR-DRBG and HMAC-DRBG =
  \
>>>> + - Public key algorithms, like RSA, Elliptic Curves, Diffie-Hellman=
, \
>>>> +   ECDSA and ECDH                                                  =
  \
>>>> + - SSL v3 and TLS 1.0, 1.1 and 1.2                                 =
  \
>>>> + - Abstraction layers for ciphers, hashes, public key operations,  =
  \
>>>> +   platform abstraction and threading                              =
  \
>>>> +"
>>>> +
>>>> +HOMEPAGE =3D"https://tls.mbed.org/"
>>>> +
>>>> +LICENSE =3D "Apache-2.0"
>>>> +LIC_FILES_CHKSUM =3D"file://LICENSE;md5=3D3b83ef96387f14655fc854ddc=
3c6bd57"
>>>> +
>>>> +SECTION =3D "libs"
>>>> +
>>>> +S =3D "${WORKDIR}/git"
>>>> +SRCREV =3D "1873d3bfc2da771672bd8e7e8f41f57e0af77f33"
>>>> +SRC_URI =3D "git://github.com/ARMmbed/mbedtls.git;protocol=3Dhttps;=
branch=3Dmaster \
>>>> +file://0001-aesce-do-not-specify-an-arch-version-when-enabling-c.pa=
tch  \
>>>> +file://0002-aesce-use-correct-target-attribute-when-building-wit.pa=
tch  \
>>>> +file://run-ptest"
>>>> +
>>>> +inherit cmake update-alternatives ptest
>>>> +
>>>> +PACKAGECONFIG ??=3D "shared-libs programs ${@bb.utils.contains('PTE=
ST_ENABLED', '1', 'tests', '', d)}"
>>>> +PACKAGECONFIG[shared-libs] =3D "-DUSE_SHARED_MBEDTLS_LIBRARY=3DON,-=
DUSE_SHARED_MBEDTLS_LIBRARY=3DOFF"
>>>> +PACKAGECONFIG[programs] =3D "-DENABLE_PROGRAMS=3DON,-DENABLE_PROGRA=
MS=3DOFF"
>>>> +PACKAGECONFIG[werror] =3D "-DMBEDTLS_FATAL_WARNINGS=3DON,-DMBEDTLS_=
FATAL_WARNINGS=3DOFF"
>>>> +# Make X.509 and TLS calls use PSA
>>>> +#https://github.com/Mbed-TLS/mbedtls/blob/development/docs/use-psa-=
crypto.md
>>>> +PACKAGECONFIG[psa] =3D ""
>>>> +PACKAGECONFIG[tests] =3D "-DENABLE_TESTING=3DON,-DENABLE_TESTING=3D=
OFF"
>>>> +
>>>> +EXTRA_OECMAKE =3D "-DLIB_INSTALL_DIR:STRING=3D${libdir}"
>>>> +
>>>> +# For now the only way to enable PSA is to explicitly pass a -D via=
 CFLAGS
>>>> +CFLAGS:append =3D"${@bb.utils.contains('PACKAGECONFIG', 'psa', '=20
>>>> -DMBEDTLS_USE_PSA_CRYPTO', '', d)}"
>>>> +
>>>> +PROVIDES +=3D "polarssl"
>>>> +RPROVIDES:${PN} =3D "polarssl"
>>>> +
>>>> +PACKAGES =3D+ "${PN}-programs"
>>>> +FILES:${PN}-programs =3D "${bindir}/"
>>>> +
>>>> +ALTERNATIVE:${PN}-programs =3D "hello"
>>>> +ALTERNATIVE_LINK_NAME[hello] =3D "${bindir}/hello"
>>>> +
>>>> +BBCLASSEXTEND =3D "native nativesdk"
>>>> +
>>>> +CVE_PRODUCT =3D "mbed_tls"
>>>> +
>>>> +# Fix merged upstreamhttps://github.com/Mbed-TLS/mbedtls/pull/5310
>>>> +CVE_CHECK_IGNORE +=3D "CVE-2021-43666"
>>>> +# Fix merged upstreamhttps://github.com/Mbed-TLS/mbedtls/commit/9a4=
a9c66a48edfe9ece03c7e4a53310adf73a86c
>>>> +CVE_CHECK_IGNORE +=3D "CVE-2021-45451"
>>>> +
>>>> +# Strip host paths from autogenerated test files
>>>> +do_compile:append() {
>>>> +       sed -i 's+${S}/++g' ${B}/tests/*.c 2>/dev/null || :
>>>> +       sed -i 's+${B}/++g' ${B}/tests/*.c 2>/dev/null || :
>>>> +}
>>>> +
>>>> +# Export source files/headers needed by Arm Trusted Firmware
>>>> +sysroot_stage_all:append() {
>>>> +       sysroot_stage_dir "${S}/library" "${SYSROOT_DESTDIR}/usr/sha=
re/mbedtls-source/library"
>>>> +       sysroot_stage_dir "${S}/include" "${SYSROOT_DESTDIR}/usr/sha=
re/mbedtls-source/include"
>>>> +}
>>>> +
>>>> +do_install_ptest () {
>>>> +       install -d ${D}${PTEST_PATH}/tests
>>>> +       cp -f ${B}/tests/test_suite_* ${D}${PTEST_PATH}/tests/
>>>> +       find ${D}${PTEST_PATH}/tests/ -type f -name "*.c" -delete
>>>> +       cp -fR ${S}/tests/data_files ${D}${PTEST_PATH}/tests/
>>>> +}
>>>> --
>>>> 2.25.1
>>>>
>>>>
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online (#103685):https://lists.openembedded.org/g/openemb=
edded-devel/message/103685
>>>> Mute This Topic:https://lists.openembedded.org/mt/99836968/3616765
>>>> Group Owner:openembedded-devel+owner@lists.openembedded.org
>>>> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsu=
b  [randy.macleod@windriver.com]
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>

--=20
# Randy MacLeod
# Wind River Linux

--------------Q8SFvY2l21szqnfP02qZYH6Q
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2023-07-06 20:12, Beniamin Sandu via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CABQJdOG1FmeJ8oQVdx+76FpLrP5CrYbFhxRicUhxmdZ8pWXqWA@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">Hi Denys,

I was thinking that since it is not replacing the old version but just
providing the v3 one as an extra option, it is not really an upgrade.
While there are noticeable differences between the versions, both of
them are still available for building.

Isn't PREFERRED_VERSION a simple and convenient way to select the
desired one? I don't know if there is a better way to handle this
scenario, but did not consider this to be too much of a hassle, it's
just one variable and its use is quite straightforward.

Cheers,
Beni</pre>
    </blockquote>
    <p>Hi Beni,</p>
    <p>Each small hassle is a paper cut, one isn't that bad but 10s or
      100s and you might bleed to death! ;-)</p>
    <p><br>
    </p>
    <p>Could you please send a patch for kirkstone (and mickledore) to
      add :<br>
      <br>
      DEFAULT_PREFERENCE = &quot;-1&quot;<br>
    </p>
    <p>to the v3.x recipe?<br>
    </p>
    <p>There are a few other examples but that's what we did<br>
      on dunfell when adding a newer version of nodejs:</p>
    <p>commit 116bfe8d5e5851e7fc5424f40da8691a19c5b5ee<br>
      Author: Narpat Mali <a class="moz-txt-link-rfc2396E" href="mailto:narpat.mali@windriver.com">&lt;narpat.mali@windriver.com&gt;</a><br>
      Date:&nbsp;&nbsp; Thu May 11 12:37:58 2023<br>
      <br>
      &nbsp;&nbsp;&nbsp; nodejs: make 14.18.1 available but not default<br>
      &nbsp;&nbsp;&nbsp; <br>
    </p>
    <p>Thanks,<br>
    </p>
    <p>../Randy<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:CABQJdOG1FmeJ8oQVdx+76FpLrP5CrYbFhxRicUhxmdZ8pWXqWA@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

On Fri, 7 Jul 2023 at 00:36, Denys Dmytriyenko <a class="moz-txt-link-rfc2396E" href="mailto:denis@denix.org">&lt;denis@denix.org&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On Wed, Jun 28, 2023 at 09:46:22PM +0300, Beniamin Sandu wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Hey Armin,

This is the same recipe from master, which now has support for both v2
and v3 mbedtls. Since both versions would be supported and it's not a
major package upgrade, we should not be breaking policy.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Well, it is actually a *major* upgrade and there are some incompatible API
changes in v3 vs v2! E.g. entropy_poll.h is no longer provided among others.

With this backport one needs to scramble and set PREFERRED_VERSION to v2
explicitly, which is not nice. This is exactly why there's a policy for not
allowing major version backports to stable releases w/o a strong reason!

--
Denys


</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">This is also not an isolated case from a quick look, since there are
other packages that do this (e.g. redis), so it would be great to get
it on kirkstone too.

Thanks,
Beni

On Wed, 28 Jun 2023 at 21:41, Beniamin Sandu <a class="moz-txt-link-rfc2396E" href="mailto:beniaminsandu@gmail.com">&lt;beniaminsandu@gmail.com&gt;</a> wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Version 3.4.0 adds a lot of improvements and fixes (a notable one
being initial support for PKCS7 CMS), but since this is a pretty
big jump, let's keep both versions for a while, so the v2.x users
can upgrade to 3.x in a timely manner if needed.

Signed-off-by: Beniamin Sandu <a class="moz-txt-link-rfc2396E" href="mailto:beniaminsandu@gmail.com">&lt;beniaminsandu@gmail.com&gt;</a>
---
 ...cify-an-arch-version-when-enabling-c.patch | 33 ++++++++
 ...t-target-attribute-when-building-wit.patch | 34 ++++++++
 .../mbedtls/mbedtls/run-ptest                 | 17 ++++
 .../mbedtls/mbedtls_3.4.0.bb                  | 83 +++++++++++++++++++
 4 files changed, 167 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-aesce-do-not-specify-an-arch-version-when-enabling-c.patch
 create mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls/0002-aesce-use-correct-target-attribute-when-building-wit.patch
 create mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls/run-ptest
 create mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-aesce-do-not-specify-an-arch-version-when-enabling-c.patch b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-aesce-do-not-specify-an-arch-version-when-enabling-c.patch
new file mode 100644
index 000000000..d98d8fa57
--- /dev/null
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-aesce-do-not-specify-an-arch-version-when-enabling-c.patch
@@ -0,0 +1,33 @@
+From 2246925e3cb16183e25d4e2cfd13fb800df86270 Mon Sep 17 00:00:00 2001
+From: Beniamin Sandu <a class="moz-txt-link-rfc2396E" href="mailto:beniaminsandu@gmail.com">&lt;beniaminsandu@gmail.com&gt;</a>
+Date: Sun, 25 Jun 2023 19:58:08 +0300
+Subject: [PATCH] aesce: do not specify an arch version when enabling crypto
+ instructions
+
+Building mbedtls with different aarch64 tuning variations revealed
+that we should use the crypto extensions without forcing a particular
+architecture version or core, as that can create issues.
+
+Upstream-Status: Submitted [<a class="moz-txt-link-freetext" href="https://github.com/Mbed-TLS/mbedtls/pull/7834">https://github.com/Mbed-TLS/mbedtls/pull/7834</a>]
+
+Signed-off-by: Beniamin Sandu <a class="moz-txt-link-rfc2396E" href="mailto:beniaminsandu@gmail.com">&lt;beniaminsandu@gmail.com&gt;</a>
+---
+ library/aesce.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/library/aesce.c b/library/aesce.c
+index fe056dc4c..843de3973 100644
+--- a/library/aesce.c
++++ b/library/aesce.c
+@@ -60,7 +60,7 @@
+ #           error &quot;A more recent GCC is required for MBEDTLS_AESCE_C&quot;
+ #       endif
+ #       pragma GCC push_options
+-#       pragma GCC target (&quot;arch=armv8-a+crypto&quot;)
++#       pragma GCC target (&quot;+crypto&quot;)
+ #       define MBEDTLS_POP_TARGET_PRAGMA
+ #   else
+ #       error &quot;Only GCC and Clang supported for MBEDTLS_AESCE_C&quot;
+--
+2.25.1
+
diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls/0002-aesce-use-correct-target-attribute-when-building-wit.patch b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0002-aesce-use-correct-target-attribute-when-building-wit.patch
new file mode 100644
index 000000000..4775c8ddb
--- /dev/null
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0002-aesce-use-correct-target-attribute-when-building-wit.patch
@@ -0,0 +1,34 @@
+From 03d3523f974536f2358047382aadb0d4cc762f8a Mon Sep 17 00:00:00 2001
+From: Beniamin Sandu <a class="moz-txt-link-rfc2396E" href="mailto:beniaminsandu@gmail.com">&lt;beniaminsandu@gmail.com&gt;</a>
+Date: Mon, 26 Jun 2023 12:07:21 +0300
+Subject: [PATCH] aesce: use correct target attribute when building with clang
+
+Seems clang has its own issues when it comes to crypto extensions,
+and right now the best way to avoid them is to accurately enable
+the needed instructions instead of the broad crypto feature.
+
+E.g.: <a class="moz-txt-link-freetext" href="https://github.com/llvm/llvm-project/issues/61645">https://github.com/llvm/llvm-project/issues/61645</a>
+
+Upstream-Status: Pending
+
+Signed-off-by: Beniamin Sandu <a class="moz-txt-link-rfc2396E" href="mailto:beniaminsandu@gmail.com">&lt;beniaminsandu@gmail.com&gt;</a>
+---
+ library/aesce.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/library/aesce.c b/library/aesce.c
+index 843de3973..7bea088ba 100644
+--- a/library/aesce.c
++++ b/library/aesce.c
+@@ -53,7 +53,7 @@
+ #       if __clang_major__ &lt; 4
+ #           error &quot;A more recent Clang is required for MBEDTLS_AESCE_C&quot;
+ #       endif
+-#       pragma clang attribute push (__attribute__((target(&quot;crypto&quot;))), apply_to=function)
++#       pragma clang attribute push (__attribute__((target(&quot;aes&quot;))), apply_to=function)
+ #       define MBEDTLS_POP_TARGET_PRAGMA
+ #   elif defined(__GNUC__)
+ #       if __GNUC__ &lt; 6
+--
+2.25.1
+
diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls/run-ptest b/meta-networking/recipes-connectivity/mbedtls/mbedtls/run-ptest
new file mode 100644
index 000000000..059ab4ecb
--- /dev/null
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls/run-ptest
@@ -0,0 +1,17 @@
+#!/bin/sh
+
+ptestdir=$(dirname &quot;$(readlink -f &quot;$0&quot;)&quot;)
+cd &quot;$ptestdir&quot;/tests || exit
+
+tests=$(find * -type f -name 'test_suite_*')
+
+for f in $tests
+do
+    if test -x ./&quot;$f&quot;; then
+        if ./&quot;$f&quot; &gt; ./&quot;$f&quot;.out 2&gt; ./&quot;$f&quot;.err; then
+            echo &quot;PASS: $f&quot;
+        else
+            echo &quot;FAIL: $f&quot;
+        fi
+    fi
+done
diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb
new file mode 100644
index 000000000..b8c9662de
--- /dev/null
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb
@@ -0,0 +1,83 @@
+SUMMARY = &quot;Lightweight crypto and SSL/TLS library&quot;
+DESCRIPTION = &quot;mbedtls is a lean open source crypto library          \
+for providing SSL and TLS support in your programs. It offers        \
+an intuitive API and documented header files, so you can actually    \
+understand what the code does. It features:                          \
+                                                                     \
+ - Symmetric algorithms, like AES, Blowfish, Triple-DES, DES, ARC4,  \
+   Camellia and XTEA                                                 \
+ - Hash algorithms, like SHA-1, SHA-2, RIPEMD-160 and MD5            \
+ - Entropy pool and random generators, like CTR-DRBG and HMAC-DRBG   \
+ - Public key algorithms, like RSA, Elliptic Curves, Diffie-Hellman, \
+   ECDSA and ECDH                                                    \
+ - SSL v3 and TLS 1.0, 1.1 and 1.2                                   \
+ - Abstraction layers for ciphers, hashes, public key operations,    \
+   platform abstraction and threading                                \
+&quot;
+
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://tls.mbed.org/">&quot;https://tls.mbed.org/&quot;</a>
+
+LICENSE = &quot;Apache-2.0&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57">&quot;file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57&quot;</a>
+
+SECTION = &quot;libs&quot;
+
+S = &quot;${WORKDIR}/git&quot;
+SRCREV = &quot;1873d3bfc2da771672bd8e7e8f41f57e0af77f33&quot;
+SRC_URI = &quot;git://github.com/ARMmbed/mbedtls.git;protocol=https;branch=master \
+       <a class="moz-txt-link-freetext" href="file://0001-aesce-do-not-specify-an-arch-version-when-enabling-c.patch">file://0001-aesce-do-not-specify-an-arch-version-when-enabling-c.patch</a> \
+       <a class="moz-txt-link-freetext" href="file://0002-aesce-use-correct-target-attribute-when-building-wit.patch">file://0002-aesce-use-correct-target-attribute-when-building-wit.patch</a> \
+       <a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a>&quot;
+
+inherit cmake update-alternatives ptest
+
+PACKAGECONFIG ??= &quot;shared-libs programs ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}&quot;
+PACKAGECONFIG[shared-libs] = &quot;-DUSE_SHARED_MBEDTLS_LIBRARY=ON,-DUSE_SHARED_MBEDTLS_LIBRARY=OFF&quot;
+PACKAGECONFIG[programs] = &quot;-DENABLE_PROGRAMS=ON,-DENABLE_PROGRAMS=OFF&quot;
+PACKAGECONFIG[werror] = &quot;-DMBEDTLS_FATAL_WARNINGS=ON,-DMBEDTLS_FATAL_WARNINGS=OFF&quot;
+# Make X.509 and TLS calls use PSA
+# <a class="moz-txt-link-freetext" href="https://github.com/Mbed-TLS/mbedtls/blob/development/docs/use-psa-crypto.md">https://github.com/Mbed-TLS/mbedtls/blob/development/docs/use-psa-crypto.md</a>
+PACKAGECONFIG[psa] = &quot;&quot;
+PACKAGECONFIG[tests] = &quot;-DENABLE_TESTING=ON,-DENABLE_TESTING=OFF&quot;
+
+EXTRA_OECMAKE = &quot;-DLIB_INSTALL_DIR:STRING=${libdir}&quot;
+
+# For now the only way to enable PSA is to explicitly pass a -D via CFLAGS
+CFLAGS:append = <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.contains('PACKAGECONFIG','psa','-DMBEDTLS_USE_PSA_CRYPTO','',d)}">&quot;${@bb.utils.contains('PACKAGECONFIG', 'psa', ' -DMBEDTLS_USE_PSA_CRYPTO', '', d)}&quot;</a>
+
+PROVIDES += &quot;polarssl&quot;
+RPROVIDES:${PN} = &quot;polarssl&quot;
+
+PACKAGES =+ &quot;${PN}-programs&quot;
+FILES:${PN}-programs = &quot;${bindir}/&quot;
+
+ALTERNATIVE:${PN}-programs = &quot;hello&quot;
+ALTERNATIVE_LINK_NAME[hello] = &quot;${bindir}/hello&quot;
+
+BBCLASSEXTEND = &quot;native nativesdk&quot;
+
+CVE_PRODUCT = &quot;mbed_tls&quot;
+
+# Fix merged upstream <a class="moz-txt-link-freetext" href="https://github.com/Mbed-TLS/mbedtls/pull/5310">https://github.com/Mbed-TLS/mbedtls/pull/5310</a>
+CVE_CHECK_IGNORE += &quot;CVE-2021-43666&quot;
+# Fix merged upstream <a class="moz-txt-link-freetext" href="https://github.com/Mbed-TLS/mbedtls/commit/9a4a9c66a48edfe9ece03c7e4a53310adf73a86c">https://github.com/Mbed-TLS/mbedtls/commit/9a4a9c66a48edfe9ece03c7e4a53310adf73a86c</a>
+CVE_CHECK_IGNORE += &quot;CVE-2021-45451&quot;
+
+# Strip host paths from autogenerated test files
+do_compile:append() {
+       sed -i 's+${S}/++g' ${B}/tests/*.c 2&gt;/dev/null || :
+       sed -i 's+${B}/++g' ${B}/tests/*.c 2&gt;/dev/null || :
+}
+
+# Export source files/headers needed by Arm Trusted Firmware
+sysroot_stage_all:append() {
+       sysroot_stage_dir &quot;${S}/library&quot; &quot;${SYSROOT_DESTDIR}/usr/share/mbedtls-source/library&quot;
+       sysroot_stage_dir &quot;${S}/include&quot; &quot;${SYSROOT_DESTDIR}/usr/share/mbedtls-source/include&quot;
+}
+
+do_install_ptest () {
+       install -d ${D}${PTEST_PATH}/tests
+       cp -f ${B}/tests/test_suite_* ${D}${PTEST_PATH}/tests/
+       find ${D}${PTEST_PATH}/tests/ -type f -name &quot;*.c&quot; -delete
+       cp -fR ${S}/tests/data_files ${D}${PTEST_PATH}/tests/
+}
--
2.25.1

</pre>
            <br>
            <fieldset class="moz-mime-attachment-header"></fieldset>
            <pre class="moz-quote-pre" wrap="">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#103685): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/message/103685">https://lists.openembedded.org/g/openembedded-devel/message/103685</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/99836968/3616765">https://lists.openembedded.org/mt/99836968/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
          </blockquote>
        </blockquote>
      </blockquote>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------Q8SFvY2l21szqnfP02qZYH6Q--

