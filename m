Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A051C77B60
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 11:29:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.22454.1680175748697098591
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Mar 2023 04:29:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=By5b+xxX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=345388676c=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32UA0qpK013407
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Mar 2023 11:29:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=fDxs5m4myMAv4An0lol7tx0LdKgNAanj4fOCzBLFPuA=;
 b=By5b+xxXGRri9zLCVe6aPHuxF6VHIoCI2644odbfnUOx3ttRw+aJG6bu/078U4bo+g8w
 k3bKyeiF84jzNIki7ut9BJgLCmXRBrgBcIKslVo9bVOJgpNn1x1DiZ2FBf4Nn/L3DRU5
 vwhbUuy7kXJVr4Ixqb45EizdFlVW3JMmdd+7AmfeIWm5UKiHU/A5GtqPQLDtjaOqtRy6
 yM6NG3Gy6dMOXydOtCX+nPZmPm/AsbTmxftCDgHdNQxo2WrEDwJUsBvPIRbSa54TX+An
 EVJoYSUVHSkxMom8GDXoD3ALItuQLSZG/IB3e52VyPv/2M2v17zPL9zrQsoaMOqHjDQx Ug== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3php64676m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Mar 2023 11:29:07 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32UBT5kA005712
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Mar 2023 11:29:06 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3php64676k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Mar 2023 11:29:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iur3/2uEryToybmuHZLj1yksR1IEeFhGE62443Rh2iCm0JMimYJjbUY4nPiT7eeha51eh16D+0isNUfvPPveMGXaUrbrYw68vjRMfU1xjtB4gMzVSF6gai73RFuVXF/SmHQ1SBewQ76S6Q8bqMWNyykvCoCZjpBaeIVuaxpa9zR8cH9bcPBKtYTgx8kJ2Mjs6tiNsoANluas/v62kBEaA4xEhw6K+fmSMaASCXwYE3I7w61j44SiZ33IY8wJkxxWOgT2/3q7uhwYIQJ2tPOkiLj9Etdxb/4/M+MghpdD89yXZZT4Yibr44XYC4/z886Bpfl5INhU8/ncULnZ4NPL6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fDxs5m4myMAv4An0lol7tx0LdKgNAanj4fOCzBLFPuA=;
 b=J1GG6bt4m5Tm43OQ3LXWyg+BG/E6oXD/1WsvlajcZM7HD1HguDss/D+vGI4UOhg3/h8k65Z3gwm8v+8c7VHsyR3VhV07A3tY5yxA7XQsBe6w0ElPcnngBP7ULvXJIRRZGN7l5nYg9hbmaqVvngS4/ygSUgJb1b/ZXok1nXvA+vbE19Cj3T1b5TugBRRFJdn4N5OgJQ5dJmcNf+X8PqhsrZqOVdF4J+10XRODKlNgdVBgdt3WVKxA/TgkBFXR0LuUCRT1js8+/ZMA/Y6yZj5qOgbMIG/59qsMzA7gEJZUHB+YbkKZaCeF9JgN4rWr3nM4BLO9OYDxTY23Gq5ldooP4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by SA1PR11MB7086.namprd11.prod.outlook.com (2603:10b6:806:2b3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Thu, 30 Mar
 2023 11:29:00 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::ceb7:f166:2f0f:4f67]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::ceb7:f166:2f0f:4f67%6]) with mapi id 15.20.6222.033; Thu, 30 Mar 2023
 11:28:59 +0000
Content-Type: multipart/alternative;
 boundary="------------9wj1URS8G8rglgEmfFAfb7JK"
Message-ID: <45e8c265-6907-df73-70a1-a21052f2fe80@windriver.com>
Date: Thu, 30 Mar 2023 07:28:55 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [meta-oe][PATCH v2] librelp: fix function inline errors in debug
 build
Content-Language: en-CA
To: Yash Shinde <yashinde145@gmail.com>,
        openembedded-devel@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Yash.Shinde@windriver.com
References: <20230330054414.15931-1-yashinde145@gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20230330054414.15931-1-yashinde145@gmail.com>
X-ClientProxiedBy: BY3PR05CA0030.namprd05.prod.outlook.com
 (2603:10b6:a03:254::35) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|SA1PR11MB7086:EE_
X-MS-Office365-Filtering-Correlation-Id: c6ee5226-1bdd-4d81-5bd6-08db3111f4e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xpvNwUE74b/gjXzvJ4GT1gqt45s31sa9+zN/JtFNei9nK0z6XqrcEEbHZLkONGfpaLxuEPsu9gDEuKd9R8PgsMG3K6VZrpX1Jsg01NOBLi0++CS+Ng41FHHNL+ycALZkqart/b9x90EE7Kx1wBfiL8jq7l3aR4uRH2EDpOjx+jCU9KyRUrArJ8fO6QZNd0U8TV8ToNAyy+Qj8jhoxoegPdtcZeNYbjh96OTKt27WkeJ7bBfKXVlZL3bLgRDCLxYDlbG1VoECBjzBTd9yT6Ko25iXUh6ylHN+l63vFxeLZWc2avWvYJu5bfmJ9f+yWE8U9YiU0T8qWt3HCrLZXtHlEeoG5H6i9TbjanduRgExL/Co8GUyjh3Ps8KvzhBteCsqiqytnJzBxnzw2YGo8HOyRxRLNnYWkrGwPk52a1obZavB0GZnufVfNGWou5Nb/dNYpLDMwy/bfn960o4ClOSYWoDZrwqoWqEPIcyPqDNcXbNqahDyWJnwckrB/QteKpNlKscZQZyBthVaTTQAW9T/lTRRB0dYK9RJh3h59OKtbXsQZ5GGhYIgNMOdiLVFdythH+UEx7Yse6M7uRsQZbTbFROkox/N9WnhTr9fP+PICHGV40XLB5yxo216DTZfwnPuMMGWs/l7pSfgLukhxsG4iQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(366004)(39850400004)(136003)(376002)(451199021)(107886003)(6486002)(478600001)(6666004)(6506007)(53546011)(26005)(966005)(6512007)(31686004)(316002)(166002)(186003)(66946007)(66476007)(83380400001)(8676002)(66556008)(33964004)(2616005)(4326008)(41300700001)(5660300002)(38100700002)(2906002)(8936002)(31696002)(86362001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UzJKRy9wdWNNRDRNdXMvcm96ZjVnOTVlSGZEc0ZxUUdPNm9VMTNhTzJHNC9B?=
 =?utf-8?B?QXVkdGJNUHpRYmRodFd5RFM2OGdQaDBobVFZZCtzQmZQTmVObkRCbWxVQkVQ?=
 =?utf-8?B?dnNsQXZtc1hOVnowYU54K3FuTzRSMnZTenpQcWNiSk1ZK3B2dzI2Z2kzMmJr?=
 =?utf-8?B?Q1hwbWpsZTMrcE51ZW44ZUI4SXJaNnMxWVlqcGRvRjM2Y1RsVkwyd1VlQ2FG?=
 =?utf-8?B?M2k3UGhhS1VjZnl5eVEzeWJIK3Q2Y1FteGwxTDA0eUVySHdXRmVVbW5QT1Y3?=
 =?utf-8?B?NGFYYTFsMkR6MnFvTCtHM3FkTC9jdjM5bFJqL29PMGJyY3hJZU1LSU9MYmh1?=
 =?utf-8?B?UEVlQnBjaHpxblYxLy90cHdPbEJXVTdTVGRZVTRjRW5pY2pualdaNnhSMitH?=
 =?utf-8?B?Sml5a0tQWTROM29JRWl3STdoVnJuaGh2NTluOEtSSmI5M0JXVGo4ZWIxUjBp?=
 =?utf-8?B?VVl6VVVUMVlrVFJ1VlVwbGU0VEkzcEM1Y2Y1UDhwc3RRZFlyakNMNS85QkNk?=
 =?utf-8?B?Q29DZm8rbm5Rc01Pd0h4eUkrNnlTNEVTQTQyWWtHYXZQWXgweDROSXlQL3VO?=
 =?utf-8?B?dkFhdjB5UnNwSGtqbTUra3FOM2F1c1I4bXhpdjN2QTdSeEtva1JiWTFXWWsy?=
 =?utf-8?B?cHR4d0g3WVZIc3F5MHdSSjlGa3BHMnVqZzFnYTVSTCtYZmtnL2tWMnVBaXRJ?=
 =?utf-8?B?R3l6eU1RTDlkYTY4bmJHMkloMmlhQTVST3NRWm9SV0k5UjFXczZMOGREOS9Y?=
 =?utf-8?B?eTVXMm10ZC9mRmFEbEcyb0FvQkNnMXh5YjIvVWt0cFhPdUdqQWFRWWh2MklG?=
 =?utf-8?B?NXFWOS8vZ2N5cTRFZkxEU0d6TzczMmtLMnhhMzltSTlKU3pMOFVUY3Q2dDQw?=
 =?utf-8?B?SVlldFEvMlY3THgwNHJIM0I3Wk1TWjI0YW9xZGRyaGNwZ2FvVFVJSDF4bTRN?=
 =?utf-8?B?d0dMZ1gxUEE4bXZXNmtiL2hJZ0NnS0p2d0dheVhtWnU1OU5mR3NFdWtFYWtj?=
 =?utf-8?B?N1k2RC9jRXhrUzVabVloQm9VY0pWVU9BY013dFpNdWJnazZTMkVEaVFYZHFP?=
 =?utf-8?B?UGs2ZEREVHpocjJXaWpoVkQyTlZteWF6ZjZxZE1Yd0tvYWdrR0RyNXlSb1pT?=
 =?utf-8?B?RzZxUGdEVXhDbmF5SFpVVlhPblQ0RVA5eUZhaTZKMW0yektaOVlwMHM0Zisz?=
 =?utf-8?B?enMrWkR6bWhONEtZdU1aOFkrdGlOdGRibGJYSjNON3E1OWN6RzV2RW83SFVC?=
 =?utf-8?B?Wis3cy84dnNwbzdoekl4WnRLSDFCY0wrSWJ6aTRLK1hYeE5hbHdaV1FzM2lw?=
 =?utf-8?B?TXVXRnFNcG1QUUprd005ejVtUVloYWpoTFVjMjFQZmdkKzEzRURIMWwrZWRD?=
 =?utf-8?B?YkhuaXFhTDgvd0cyL3pLZ041eXA3UHIrZ0lTWHFVMjMva1BEZ2RoanVlaWha?=
 =?utf-8?B?bVYxZTVDY3RKQUk0NTZXVUNvZC9pY0duYUpFam5aT3YwbWR4b1NwWnIvR3lN?=
 =?utf-8?B?S04xRHdxd0lvbGgwdFZiZ2pDUVpraEJUV0lWRTZmeU5SZGJpN2E1WXNxL0t6?=
 =?utf-8?B?bUdpZ0tmM1BOUzVBbmh0MjhXK25yUUVRZ2toZFo1T09pWUhHRzAxcjZVdTY1?=
 =?utf-8?B?cFd1VlFqNlpZaXU4SHNnN2lHcCtiWG1EeEllRUZwSnB1U3ZtRkpMZWN1SlZP?=
 =?utf-8?B?L2I4Njg0U1hzL3hucTNSRFloKzEwdG44RzdPbTVTaUtYcGlwNUY5M2g4Ymtq?=
 =?utf-8?B?VFhKTnAxRzJvT0FjeFZnSUYvU3V3QXFUTHhyWHNGdEhOaTlGR1JJSk5PRlA2?=
 =?utf-8?B?Z0dteGFxQVQ5Q0pxMDZta2RiZlJNeUZjY2tDbXRxVDNwR2k5VEN3U05OdkF1?=
 =?utf-8?B?bzdPbkEwQ3ZManlLTi83dXJCOEFqdVFGWjBPckI1TXNuQ0x3ZmU0N3ArbUky?=
 =?utf-8?B?SUsyN3l5K2pWdTc2WkRnYXBlclFramlwTFpKYTNMQ2ZhdUxTUm1yRU0va3dq?=
 =?utf-8?B?MVBSUkIxT0x6UzJjdVVId3RsNklla3hZT0FKeEFzTUQ5bjZzWkJscWNFbE1J?=
 =?utf-8?B?a1IvR01aaFNrdWhiZVI2NGl5SFhUbUU3THhRVU1wT0FZV3ZNUUNEb3o2WU56?=
 =?utf-8?B?d2Zyck1qcXdkL2lsdXlzYnIwdEgzN1R0VFBFUXYxcWVRVGZlRVpsdThPbnJl?=
 =?utf-8?B?T1E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6ee5226-1bdd-4d81-5bd6-08db3111f4e2
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 11:28:59.7577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NpMloOHmMdo3dXy5H10Stx4qjUg0utO3Ys2i7D2S2/nZ4mNJ0T77m2rfDH+QiYwrP+43MRfxweQZeNn+fhBskM+d/iKLMFSal+8kqrtGxmY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7086
X-Proofpoint-ORIG-GUID: NE8KB7ytmuFAX-buIUAaOjM00Up3xP4L
X-Proofpoint-GUID: Yruks8TY_fbOfmSiZ6AWcpd-DdUjdG0d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-30_07,2023-03-30_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 mlxlogscore=911 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 adultscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303300094
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Mar 2023 11:29:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101831

--------------9wj1URS8G8rglgEmfFAfb7JK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 32UA0qpK013407

On 2023-03-30 01:44, Yash Shinde wrote:
> With DEBUG_BUILD =3D "1", the following errors occur:
>
>     src/relpsess.c:95:1: error:
>        inlining failed in call to 'relpSessFreePermittedPeers': functio=
n not considered for inlining [-Werror=3Dinline]
>
>     src/tcp.c:146:1: error:
>        inlining failed in call to 'relpTcpFreePermittedPeers': function=
 not considered for inlining [-Werror=3Dinline]
>
>     src/tcp.c:158:1: error:
>        inlining failed in call to 'callOnAuthErr': function not conside=
red for inlining [-Werror=3Dinline]
>
> Compiler does not inline any functions when not optimizing unless you s=
pecify the =E2=80=98always_inline=E2=80=99 attribute for the function.
> Add "__attribute__((always_inline))" to avoid these function inline err=
ors.
>
> Also revert the work-around made earlier in librelp_1.11.0.bb.
>
> Upstream-Status: Tracked by upstream bug:https://github.com/rsyslog/lib=
relp/issues/256
This is a less instrusive work-around.

Please create a gcc bug to track the compiler regression and reply here
with the ID. As well, note the gcc bug id in the librelp issue. Once the
compiler is fixed, we can close the librelp bug.


../Randy

>
> Signed-off-by: Yash Shinde<Yash.Shinde@windriver.com>
> ---
>   ...01-librelp-fix-function-inline-error.patch | 58 ++++++++++++++++++=
+
>   .../rsyslog/librelp_1.11.0.bb                 |  2 +-
>   2 files changed, 59 insertions(+), 1 deletion(-)
>   create mode 100644 meta-oe/recipes-extended/rsyslog/librelp/0001-libr=
elp-fix-function-inline-error.patch
>
> diff --git a/meta-oe/recipes-extended/rsyslog/librelp/0001-librelp-fix-=
function-inline-error.patch b/meta-oe/recipes-extended/rsyslog/librelp/00=
01-librelp-fix-function-inline-error.patch
> new file mode 100644
> index 000000000..523a8991f
> --- /dev/null
> +++ b/meta-oe/recipes-extended/rsyslog/librelp/0001-librelp-fix-functio=
n-inline-error.patch
> @@ -0,0 +1,58 @@
> +From dc841f01fb6167ec9a80e373c5f4d2f5e3222ed6 Mon Sep 17 00:00:00 2001
> +From: Yash Shinde<Yash.Shinde@...>
> +Date: Tue, 28 Mar 2023 04:06:58 +0000
> +Subject: librelp: fix function inline errors in debug build
> +
> +With DEBUG_BUILD =3D "1", the following errors occur:
> +
> +   src/relpsess.c:95:1: error:
> +      inlining failed in call to 'relpSessFreePermittedPeers': functio=
n not considered for inlining [-Werror=3Dinline]
> +
> +   src/tcp.c:146:1: error:
> +      inlining failed in call to 'relpTcpFreePermittedPeers': function=
 not considered for inlining [-Werror=3Dinline]
> +
> +   src/tcp.c:158:1: error:
> +      inlining failed in call to 'callOnAuthErr': function not conside=
red for inlining [-Werror=3Dinline]
> +
> +Compiler does not inline any functions when not optimizing unless you =
specify the =E2=80=98always_inline=E2=80=99 attribute for the function. A=
dd "__attribute__((always_inline))" to avoid these function inline errors.
> +
> +Upstream-Status: Tracked by upstream bug:https://github.com/rsyslog/li=
brelp/issues/256
> +
> +Signed-off-by: Yash Shinde<Yash.Shinde@...>
> +---
> +
> +diff --git a/src/relpsess.c b/src/relpsess.c
> +index ee7b595..aa52b71 100644
> +--- a/src/relpsess.c
> ++++ b/src/relpsess.c
> +@@ -91,7 +91,7 @@ callOnErr(const relpSess_t *__restrict__ const pThis=
,
> +
> +
> + /* helper to free permittedPeer structure */
> +-static inline void
> ++__attribute__((always_inline)) static inline void
> + relpSessFreePermittedPeers(relpSess_t *const pThis)
> + {
> +        int i;
> +diff --git a/src/tcp.c b/src/tcp.c
> +index 7a75cc4..f4088c0 100644
> +--- a/src/tcp.c
> ++++ b/src/tcp.c
> +@@ -142,7 +142,7 @@ static int relpTcpChkPeerName(relpTcp_t *const pTh=
is, void* cert);
> +
> +
> + /* helper to free permittedPeer structure */
> +-static inline void
> ++__attribute__((always_inline)) static inline void
> + relpTcpFreePermittedPeers(relpTcp_t *const pThis)
> + {
> +        int i;
> +@@ -154,7 +154,7 @@ relpTcpFreePermittedPeers(relpTcp_t *const pThis)
> + }
> +
> + /* helper to call onAuthErr if set */
> +-static inline void
> ++__attribute__((always_inline)) static inline void
> + callOnAuthErr(relpTcp_t *const pThis, const char *authdata, const cha=
r *emsg, relpRetVal ecode)
> + {
> +        pThis->pEngine->dbgprint((char*)"librelp: auth error: authdata=
:'%s', ecode %d, "
> diff --git a/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb b/meta-=
oe/recipes-extended/rsyslog/librelp_1.11.0.bb
> index e7b79ad03..a41b05a35 100644
> --- a/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
> +++ b/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
> @@ -7,6 +7,7 @@ LIC_FILES_CHKSUM =3D"file://COPYING;md5=3D1fb9c10ed9fd6=
826757615455ca893a9"
>   DEPENDS =3D "gmp nettle libidn zlib gnutls openssl"
>  =20
>   SRC_URI =3D "git://github.com/rsyslog/librelp.git;protocol=3Dhttps;br=
anch=3Dstable \
> +file://0001-librelp-fix-function-inline-error.patch  \
>   "
>  =20
>   SRCREV =3D "b421f56d9ee31a966058d23bd23c966221c91396"
> @@ -15,6 +16,5 @@ S =3D "${WORKDIR}/git"
>  =20
>   inherit autotools pkgconfig
>  =20
> -DEBUG_OPTIMIZATION:append =3D " -Wno-error=3Dinline"
>  =20
>  =20


--=20
# Randy MacLeod
# Wind River Linux

--------------9wj1URS8G8rglgEmfFAfb7JK
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 32UA0qpK013407

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2023-03-30 01:44, Yash Shinde wrote=
:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20230330054414.15931-1-yashinde=
145@gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">With DEBUG_BUILD =3D &quot;1=
&quot;, the following errors occur:

   src/relpsess.c:95:1: error:
      inlining failed in call to 'relpSessFreePermittedPeers': function n=
ot considered for inlining [-Werror=3Dinline]

   src/tcp.c:146:1: error:
      inlining failed in call to 'relpTcpFreePermittedPeers': function no=
t considered for inlining [-Werror=3Dinline]

   src/tcp.c:158:1: error:
      inlining failed in call to 'callOnAuthErr': function not considered=
 for inlining [-Werror=3Dinline]

Compiler does not inline any functions when not optimizing unless you spe=
cify the =E2=80=98always_inline=E2=80=99 attribute for the function.
Add &quot;__attribute__((always_inline))&quot; to avoid these function in=
line errors.

Also revert the work-around made earlier in librelp_1.11.0.bb.

Upstream-Status: Tracked by upstream bug: <a class=3D"moz-txt-link-freete=
xt" href=3D"https://github.com/rsyslog/librelp/issues/256">https://github=
.com/rsyslog/librelp/issues/256</a></pre>
    </blockquote>
    This is a less instrusive work-around.<br>
    <p>Please create a gcc bug to track the compiler regression and
      reply here<br>
      with the ID. As well, note the gcc bug id in the librelp issue.
      Once the <br>
      compiler is fixed, we can close the librelp bug.<br>
    </p>
    <p><br>
    </p>
    <p>../Randy<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:20230330054414.15931-1-yashinde=
145@gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

Signed-off-by: Yash Shinde <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:Yash.Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a>
---
 ...01-librelp-fix-function-inline-error.patch | 58 +++++++++++++++++++
 .../rsyslog/librelp_1.11.0.bb                 |  2 +-
 2 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/rsyslog/librelp/0001-librelp=
-fix-function-inline-error.patch

diff --git a/meta-oe/recipes-extended/rsyslog/librelp/0001-librelp-fix-fu=
nction-inline-error.patch b/meta-oe/recipes-extended/rsyslog/librelp/0001=
-librelp-fix-function-inline-error.patch
new file mode 100644
index 000000000..523a8991f
--- /dev/null
+++ b/meta-oe/recipes-extended/rsyslog/librelp/0001-librelp-fix-function-=
inline-error.patch
@@ -0,0 +1,58 @@
+From dc841f01fb6167ec9a80e373c5f4d2f5e3222ed6 Mon Sep 17 00:00:00 2001
+From: Yash Shinde <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:Yash=
.Shinde@...">&lt;Yash.Shinde@...&gt;</a>
+Date: Tue, 28 Mar 2023 04:06:58 +0000
+Subject: librelp: fix function inline errors in debug build
+
+With DEBUG_BUILD =3D &quot;1&quot;, the following errors occur:
+
+   src/relpsess.c:95:1: error:
+      inlining failed in call to 'relpSessFreePermittedPeers': function =
not considered for inlining [-Werror=3Dinline]
+
+   src/tcp.c:146:1: error:
+      inlining failed in call to 'relpTcpFreePermittedPeers': function n=
ot considered for inlining [-Werror=3Dinline]
+
+   src/tcp.c:158:1: error:
+      inlining failed in call to 'callOnAuthErr': function not considere=
d for inlining [-Werror=3Dinline]
+
+Compiler does not inline any functions when not optimizing unless you sp=
ecify the =E2=80=98always_inline=E2=80=99 attribute for the function. Add=
 &quot;__attribute__((always_inline))&quot; to avoid these function inlin=
e errors.
+
+Upstream-Status: Tracked by upstream bug: <a class=3D"moz-txt-link-freet=
ext" href=3D"https://github.com/rsyslog/librelp/issues/256">https://githu=
b.com/rsyslog/librelp/issues/256</a>
+
+Signed-off-by: Yash Shinde <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:Yash.Shinde@...">&lt;Yash.Shinde@...&gt;</a>
+---
+
+diff --git a/src/relpsess.c b/src/relpsess.c
+index ee7b595..aa52b71 100644
+--- a/src/relpsess.c
++++ b/src/relpsess.c
+@@ -91,7 +91,7 @@ callOnErr(const relpSess_t *__restrict__ const pThis,
+
+
+ /* helper to free permittedPeer structure */
+-static inline void
++__attribute__((always_inline)) static inline void
+ relpSessFreePermittedPeers(relpSess_t *const pThis)
+ {
+        int i;
+diff --git a/src/tcp.c b/src/tcp.c
+index 7a75cc4..f4088c0 100644
+--- a/src/tcp.c
++++ b/src/tcp.c
+@@ -142,7 +142,7 @@ static int relpTcpChkPeerName(relpTcp_t *const pThis=
, void* cert);
+
+
+ /* helper to free permittedPeer structure */
+-static inline void
++__attribute__((always_inline)) static inline void
+ relpTcpFreePermittedPeers(relpTcp_t *const pThis)
+ {
+        int i;
+@@ -154,7 +154,7 @@ relpTcpFreePermittedPeers(relpTcp_t *const pThis)
+ }
+
+ /* helper to call onAuthErr if set */
+-static inline void
++__attribute__((always_inline)) static inline void
+ callOnAuthErr(relpTcp_t *const pThis, const char *authdata, const char =
*emsg, relpRetVal ecode)
+ {
+        pThis-&gt;pEngine-&gt;dbgprint((char*)&quot;librelp: auth error:=
 authdata:'%s', ecode %d, &quot;
diff --git a/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb b/meta-oe=
/recipes-extended/rsyslog/librelp_1.11.0.bb
index e7b79ad03..a41b05a35 100644
--- a/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM =3D <a class=3D"moz-txt-link-rfc2396E" h=
ref=3D"file://COPYING;md5=3D1fb9c10ed9fd6826757615455ca893a9">&quot;file:=
//COPYING;md5=3D1fb9c10ed9fd6826757615455ca893a9&quot;</a>
 DEPENDS =3D &quot;gmp nettle libidn zlib gnutls openssl&quot;
=20
 SRC_URI =3D &quot;git://github.com/rsyslog/librelp.git;protocol=3Dhttps;=
branch=3Dstable \
+           <a class=3D"moz-txt-link-freetext" href=3D"file://0001-librel=
p-fix-function-inline-error.patch">file://0001-librelp-fix-function-inlin=
e-error.patch</a> \
 &quot;
=20
 SRCREV =3D &quot;b421f56d9ee31a966058d23bd23c966221c91396&quot;
@@ -15,6 +16,5 @@ S =3D &quot;${WORKDIR}/git&quot;
=20
 inherit autotools pkgconfig
=20
-DEBUG_OPTIMIZATION:append =3D &quot; -Wno-error=3Dinline&quot;
=20
=20
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------9wj1URS8G8rglgEmfFAfb7JK--

