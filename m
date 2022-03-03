Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2164DC433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 22:03:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.223.1646345026271960507
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Mar 2022 14:03:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=U8DSTqYa;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=0061b402b8=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 223Ldh2s030896
	for <openembedded-devel@lists.openembedded.org>; Thu, 3 Mar 2022 22:03:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=Ox6VHn4Q3grgcdkTnUsbbbKXzuiyUEdSlRP75WTsS1M=;
 b=U8DSTqYa4VGuaggX5bDsmOuvSt0go33eAXsGgwzagj1caG0v4Dc3ZvQXGDMcAhMWCuxc
 FLwAh+jXI7DlzqyqGB1IjrXut3wbBpYCGLFeDT+MTSkjpXJrSYRhJ6ONggVLCG524Kgp
 tI0UVLk3iAoj5OCec7j1NEy/betpQGvcN2KohUHQz7iAJcFvG53KGZBLMCRV5DFyzgds
 1LJ9n8csCpFaIPutjcCie4LmzID2jOMBf81RMfF7pg88iJ1Gr2Hvzp2yQQ7/BD2kkosC
 TnWLykyMLqTnbnYzZ/xbRkfrPm77gWaZdymmyDs6e8u5f5flQfH1z/q9vTX0g38jSeD4 Lg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ek4jn02kc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Mar 2022 22:03:45 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 223M3iga021390
	for <openembedded-devel@lists.openembedded.org>; Thu, 3 Mar 2022 22:03:44 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2043.outbound.protection.outlook.com [104.47.73.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ek4jn02ka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Mar 2022 22:03:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M5nKIdxzr6y/qcJk//R5JE71YhvD5pjtYbkjjbnOsB+UKEeav+YBnBSiIG4fuFIw+db2X+KRJLESi1sFbBBHD+JwE458Lz4xqBFfYJdy6DZ2z9jbOP6eZ4eJCtV8SXC5auoSj6+JwmvzigOc+ii2UfGKkdc5xwb9z4BzkiqmkqEkMljh9ga67T7V4vh0V6eGN0Cl+uBX0SpP6fWVZbQ/qiuAWeXfYsLljrjjd5Jk1fwMF1muQT3CEdL52/VaCHgdDYp/8Xr482u1S8gKg8+OxvQHecJ8ZYRvYwDAloSQzqf7jimDBc3Gfrz6/aT0GwePBg+oWAXRYXOhf98ctaY8Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ox6VHn4Q3grgcdkTnUsbbbKXzuiyUEdSlRP75WTsS1M=;
 b=ZSfIbxIH4eJWYlQ1rsSLjeBLXv/PHubrNgzEf7mbaMUvA1dXOZpbC0/rJYi0YHaIUezGxou/J4tII35pNpUF69+8TDvxsnRzpqzDdZ7uZnmIdorl7MRGMqufCxZ556oHcwB8o8vBdhsdD/1La+WXXOfaQEhQerSW7+CDiZlaa0U/LGQ5gVevLREGF+I9YWvU36lBpDYmIkl2H531eg/BV0j6oRH8oumj6pec1a4PSyNNNaDOStWD8ax8/SpJKtFEqqpufngkg3BaRi7wX0TZCIf2/l9JkN6JJ3EtZNSKeYp6MEekagjUf87ls5/ysxZJEZQZow3f4jJZyhsLIAtkOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4851.namprd11.prod.outlook.com (2603:10b6:303:9b::13)
 by BN6PR11MB4178.namprd11.prod.outlook.com (2603:10b6:405:84::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 3 Mar
 2022 22:03:42 +0000
Received: from CO1PR11MB4851.namprd11.prod.outlook.com
 ([fe80::5d2f:3638:aae8:1f80]) by CO1PR11MB4851.namprd11.prod.outlook.com
 ([fe80::5d2f:3638:aae8:1f80%6]) with mapi id 15.20.5038.015; Thu, 3 Mar 2022
 22:03:42 +0000
Subject: Re: [oe] [PATCH 1/2] python3-pyparsing: add recipe
To: Tim Orling <ticotimo@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20220303140833.5374-1-kai.kang@windriver.com>
 <20220303140833.5374-2-kai.kang@windriver.com>
 <CANx9H-CRb+TrzJCA5_8RF7TfxWi0L2tLVg63_-bZ1A84LL=ybQ@mail.gmail.com>
From: Kai <kai.kang@windriver.com>
Message-ID: <52101804-8224-1a65-c004-8eb15edbbd8a@windriver.com>
Date: Fri, 4 Mar 2022 06:03:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: 
 <CANx9H-CRb+TrzJCA5_8RF7TfxWi0L2tLVg63_-bZ1A84LL=ybQ@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------7CA60C6DAF0627B828EE02DB"
Content-Language: en-US
X-ClientProxiedBy: YQBPR0101CA0319.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6c::19) To CO1PR11MB4851.namprd11.prod.outlook.com
 (2603:10b6:303:9b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e8e4436-8993-4b7d-af87-08d9fd61adcc
X-MS-TrafficTypeDiagnostic: BN6PR11MB4178:EE_
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB4178B10DAF816E1264BE1CCA95049@BN6PR11MB4178.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nv2py9I+vsArzQ39TejkWvh5AqxHAqpHusrFMYabLg8//sDCx/GCxijftD+kkDYcnRxZ/Pm1FwWA9SsZhf3NhcJJ2ZE82ivEZuVPSU5PS7dYJqjwTaD2uh/6uPfsBa1wW+TdxpCEedcEoizCam+39MZs0nrKzA3jeunwe6gDo3AQs4bzEF++iFYlrdnBUipp/1neRjYK68XEwrweuEbt3ChXtfYRrj5i1mw/J9uopIlJbrfZvPRCSJCxHC72Dx4v6OQBoLkmvn7HXxhtco9PTH7zKxrmZNUIjE4EPYWIUy7MSAP8O+KaWC+wvpkiv7WRsN1fsoXrp/E2KJaWiExzd/AXlH3HX2uIK4uvU/xsh8Nlx0P+kUHp40pFUZH0B/1jA+huBXb7EiOoP99shRXs+vK5cMdk9U0jyxjbZXM6k2ZyXvHTU5Phzmk1nE/MWvxis59Lqc/gtuQ7r+aApobe+Y8y6ebdRuW82wAZOBF7yZCI2Q5aNuzYIIPe5OnlMGzjaOmN9/o97tUpfO83zkza1qyYLLgwIXrzHu6DJLIAK08Hh9Z8OU+KFOvQpZ4u6Mbc6IUBbcR8xe4NXXmcZlJtu4l45XEIaDG8H1IA3tUAc2U3f8nfKfp0TvMFuC33LMWqR4T8j0oSCz0jQlusy9j/goJ24/yPH5bKwxDn3tcgxfaGCvdtGOWv8iO7qeEPkqjnV7TAx2Ov1r+S3/bdy8fAC4eav7O+V3+4yZSEBMSNatDdizhN+b4cpKQqEEFnEUiG2tNfVQUYMX1m2tQKcZFPxLDhK6VMebf09EeA41Xmra7B2vQc49nV7hY9jK5dKYiCjxo3gfUqXz2hk414YFa5oA4+8c8Q5IgRuAKNGFC74AW3oqobKmwzqob6/dufXc2l
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4851.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(186003)(31686004)(26005)(6916009)(4326008)(316002)(8676002)(66556008)(66476007)(66946007)(36756003)(166002)(86362001)(508600001)(966005)(2906002)(83380400001)(6486002)(5660300002)(8936002)(33964004)(52116002)(38350700002)(38100700002)(53546011)(6666004)(6506007)(6512007)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?L1cva2JwanU3eDV4cGVIOUFoWFRSNmNXMEdrZEJxMloySGprZGFOSFRBUkht?=
 =?utf-8?B?WHFQclJMTzNIZWtxL01lMEV0WmxVL3ZhdHdtQVowMDJNVmxCUG9FVEtOdTZh?=
 =?utf-8?B?TlQ3Rm9BMzVVUkxtbW4rdGxMWTl5QTFZUy8rY0M3SDhQYnYzaEZNbDM4SXdD?=
 =?utf-8?B?UytxbjNCamJEQysrTjVmSlQ3eDVpWTNraXR3b3d6TFQ1UDVGc0RXL0lFdUtm?=
 =?utf-8?B?TW1BYm5nUlk0M0tJbzk5Q1BnVEVSbk0zMTMwZktkTVFOenFYcDVNN2VvVVRa?=
 =?utf-8?B?TGRNVmw3akRod0VDZUZLK2Zwak92QWo4YmhLSkpKWTlHbElGVUxwdG5DdlJC?=
 =?utf-8?B?MWxDR2pqejlVeXpxUTlWTHMzTkhCa3luUlZQTFZYSEJrcjByQWlCSFZxYXFD?=
 =?utf-8?B?aUxSVzZhcnhUbkw1bkVLTHE5R3dnaEJaenVvb2pRZEliN2lFTW5wQlpWQ1VO?=
 =?utf-8?B?ZnFIYUYwZHRlbTR0TEFqN3lHYTk0cHh2RUVQM2VqbytpSzBhZ2U4N280cnor?=
 =?utf-8?B?YmNRZEcwLzBsc2drK0ZBbld3WHM5ZjRWdER1WmVxcmJ4YkJOTDNqQTkzS2Ev?=
 =?utf-8?B?eVpUeUZUTktNUXFoN2orUG5KeGtmREZsWEpFcVBEL3JxOENSM091WUpxVmhU?=
 =?utf-8?B?THVQMU80S0ZRM0VURjBxbkhNeGVpRC9wUENEVFlYMDJDWWNSMnJYRFR2NS9m?=
 =?utf-8?B?am5XVHdHazJGRXZsZ1Y0QzVHYkdyVVpGTlZEQ1dINUNDSFJtci9FQ3VVK3Fq?=
 =?utf-8?B?T3BFRnYzQUpXU2crUVByb21Bemx3Nm54SzhpZ090Y1pXdGFsblZIWTR4ZGU5?=
 =?utf-8?B?L0UyR213d1VCNGNUSzVjOFVQTU15aUtDQnc2UURlQXJEaUdKcFVSd3ZkbHJj?=
 =?utf-8?B?QS9GcDJvajk4bGxYVUtlWXlFN3NEa0VxT0FsMnFIR25EdmtqcUovVkJHT0N3?=
 =?utf-8?B?UUk3WVkxYTlJRDdWZFZtNlNJVXR0SUVHRjZtZVp1eUEybWNCR0tNWVduZTN1?=
 =?utf-8?B?SzA4M0xsdmtDa3JlUUxsREZzWnR1eW9mYk95bEhvQkZCZ2N3eWNzd1hjWFpH?=
 =?utf-8?B?K1djSzZYMDJ0TVU0TEdhWGJtZVF6SnBJL1cxWkl6M09QUzRYVFY4KytnSG1o?=
 =?utf-8?B?aCt3Ukd4cDVkeXZhdkNGWlR1ajlKZDJ1RG55MlpHNWNRZ1FuOWlkVW5ub1Ra?=
 =?utf-8?B?bjNVUlBxQTV5RW5BNXdwMDcyeWNTVkFGNENHaWhkY2ZqOU5GWDRFcExxa04v?=
 =?utf-8?B?S1oxc2JkZjBweVVXUTNQbFdNWDk4bFJaaTNwTFQ1RXBWeXhXUUhya2JtZ2Rv?=
 =?utf-8?B?NkZZbnJEZWswU24vSVVvR0tLVS9Id0dIUkZtUTdpaFdyYk9RWFpYVWM3eGxV?=
 =?utf-8?B?V09MWHBmL2l1Nk1Qb24wb2FzZE9Gd1doOGJzWGF2M0dscndjRzRrWUduaytH?=
 =?utf-8?B?aDRST1BJdFk5VlRuMXpvNG9wU3BFa3MwY0d0WXhrUks3QXN6c3ZTajYwZ3ZN?=
 =?utf-8?B?bDFPcmJhSFVnTXpBRkovWFE1djRSRlhlTDJDUHlFdk84bWNMeklqRTVoUkNh?=
 =?utf-8?B?ck9Zak43N2Nhd0pnRW1JdlBTZlpZb1V5c0hxQ1RqeDV6ejlIaWsxQml4MkVt?=
 =?utf-8?B?MGpYaHduZVlwVGFzQXpiOE1GNEtHdE9abWZCTnprRGk1ZzZWVDlOSzk0R3hX?=
 =?utf-8?B?NWJXMkFrOVcyRlZ1b1NKcm5Pb0xhTDNZakRzVDN5UG9XQzZGWWcyejhNeGtB?=
 =?utf-8?B?Vm1GQVRHUzJ0L3hOSStyRFp1ZmhCclBkNkNrSVRnaUlaaHNpQStaSElZM3lZ?=
 =?utf-8?B?Y2Z0YWRwSUQvalp6WWZPN1pyWlZFQTNLT09SRkROcGZUZ2JnYk1xeDJwOC9t?=
 =?utf-8?B?V1huTWVYQnNDcmt4SE9xWU9KZEhhbWlFWFJDK1BCdGp5Qmw2ZDN4c0xCd3R2?=
 =?utf-8?B?V2ZmeFZKbEllT1YrZnJFcVJmVjJVZnlxYm9UeVlqNFRYZkl1SnFwM2NBNEVj?=
 =?utf-8?B?WURSbjc2enhkOGp1K0U3NW1ZYVZzNXJiL0RkQVlhUnJFbHBQUFMzL1RVcjhU?=
 =?utf-8?B?L3lISGNBSDJ5SjRaejN0dUhtWHVubXFmemljVkdJNzliVk5wRXBMa3NYUEM5?=
 =?utf-8?B?Z2pML09EaUV1QnVQMnNYdUpwZUdDV2F5WTBueXF5NHNKeXRtRk5oUzNRR2Mv?=
 =?utf-8?Q?0I/d54ix3MOHZlocpITDzAw=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3e8e4436-8993-4b7d-af87-08d9fd61adcc
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4851.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 22:03:42.1038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 9oXHIqX2H1gClK+jmoDGFZp22THvTkN7eq9gght3gZPE1pFK5gAdRnIoH9JLORx8z6NUf/g8iGUOxDozC9i/KQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4178
X-Proofpoint-GUID: HZNvkVCv9isF7MlE3aVTMJbxHQXCaXe6
X-Proofpoint-ORIG-GUID: gO0QCwDj9RNB0S6rIRR8kBnXC8uNJeqM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-03_09,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 lowpriorityscore=0 mlxscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
 clxscore=1015 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2203030100
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Mar 2022 22:03:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95762

--------------7CA60C6DAF0627B828EE02DB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 223Ldh2s030896

On 3/3/22 11:07 PM, Tim Orling wrote:
>
>
> On Thu, Mar 3, 2022 at 6:08 AM kai <kai.kang@windriver.com=20
> <mailto:kai.kang@windriver.com>> wrote:
>
>     From: Kai Kang <kai.kang@windriver.com
>     <mailto:kai.kang@windriver.com>>
>
>     Signed-off-by: Kai Kang <kai.kang@windriver.com
>     <mailto:kai.kang@windriver.com>>
>     ---
>     =C2=A0.../python3-pyparsing/python3-pyparsing_3.0.7.bb
>     <https://urldefense.com/v3/__http://python3-pyparsing_3.0.7.bb__;!!=
AjveYdw8EvQ!Ii96tzniLq4xpKdjf-0h11X9TRWDyDdi3CXCOQcl2NzXCjwFq-oh6qCZqpJEV=
Z1GWQ$>
>     =C2=A0 =C2=A0 | 11 +++++++++++
>     =C2=A01 file changed, 11 insertions(+)
>     =C2=A0create mode 100644
>     meta-python/recipes-extended/python3-pyparsing/python3-pyparsing_3.=
0.7.bb
>     <https://urldefense.com/v3/__http://python3-pyparsing_3.0.7.bb__;!!=
AjveYdw8EvQ!Ii96tzniLq4xpKdjf-0h11X9TRWDyDdi3CXCOQcl2NzXCjwFq-oh6qCZqpJEV=
Z1GWQ$>
>
>
> python3-pyparsing is in oe-core
> https://git.yoctoproject.org/poky/tree/meta/recipes-devtools/python/pyt=
hon3-pyparsing_3.0.7.bb=20
> <https://urldefense.com/v3/__https://git.yoctoproject.org/poky/tree/met=
a/recipes-devtools/python/python3-pyparsing_3.0.7.bb__;!!AjveYdw8EvQ!Ii96=
tzniLq4xpKdjf-0h11X9TRWDyDdi3CXCOQcl2NzXCjwFq-oh6qCZqpKqUDxp6w$>

Thanks a lot. I didn't notice it.

Regards,
Kai

>
>
>     diff --git
>     a/meta-python/recipes-extended/python3-pyparsing/python3-pyparsing_=
3.0.7.bb
>     <https://urldefense.com/v3/__http://python3-pyparsing_3.0.7.bb__;!!=
AjveYdw8EvQ!Ii96tzniLq4xpKdjf-0h11X9TRWDyDdi3CXCOQcl2NzXCjwFq-oh6qCZqpJEV=
Z1GWQ$>
>     b/meta-python/recipes-extended/python3-pyparsing/python3-pyparsing_=
3.0.7.bb
>     <https://urldefense.com/v3/__http://python3-pyparsing_3.0.7.bb__;!!=
AjveYdw8EvQ!Ii96tzniLq4xpKdjf-0h11X9TRWDyDdi3CXCOQcl2NzXCjwFq-oh6qCZqpJEV=
Z1GWQ$>
>     new file mode 100644
>     index 000000000..30db080e8
>     --- /dev/null
>     +++
>     b/meta-python/recipes-extended/python3-pyparsing/python3-pyparsing_=
3.0.7.bb
>     <https://urldefense.com/v3/__http://python3-pyparsing_3.0.7.bb__;!!=
AjveYdw8EvQ!Ii96tzniLq4xpKdjf-0h11X9TRWDyDdi3CXCOQcl2NzXCjwFq-oh6qCZqpJEV=
Z1GWQ$>
>     @@ -0,0 +1,11 @@
>     +SUMMARY =3D "The pyparsing module is an alternative approach to
>     creating and executing simple grammars."
>     +HOMEPAGE =3D "https://github.com/pyparsing/pyparsing/
>     <https://urldefense.com/v3/__https://github.com/pyparsing/pyparsing=
/__;!!AjveYdw8EvQ!Ii96tzniLq4xpKdjf-0h11X9TRWDyDdi3CXCOQcl2NzXCjwFq-oh6qC=
ZqpJgDUfgdg$>"
>     +
>     +LICENSE =3D "MIT"
>     +LIC_FILES_CHKSUM =3D
>     "file://LICENSE;md5=3D657a566233888513e1f07ba13e2f47f1"
>     +
>     +SRC_URI[sha256sum] =3D
>     "18ee9022775d270c55187733956460083db60b37d0d0fb357445f3094eed3eea"
>     +
>     +inherit pypi setuptools3
>     +
>     +RDEPENDS:${PN} =3D "python3-pprint"
>     --=20
>     2.17.1
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#95747):
>     https://lists.openembedded.org/g/openembedded-devel/message/95747
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-devel/message/95747__;!!AjveYdw8EvQ!Ii96tzniLq4xpKdjf-0h11X9TRWDy=
Ddi3CXCOQcl2NzXCjwFq-oh6qCZqpIOtHRD2g$>
>     Mute This Topic: https://lists.openembedded.org/mt/89525383/924729
>     <https://urldefense.com/v3/__https://lists.openembedded.org/mt/8952=
5383/924729__;!!AjveYdw8EvQ!Ii96tzniLq4xpKdjf-0h11X9TRWDyDdi3CXCOQcl2NzXC=
jwFq-oh6qCZqpJBh8c8Qw$>
>     Group Owner: openembedded-devel+owner@lists.openembedded.org
>     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-devel/unsub
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-devel/unsub__;!!AjveYdw8EvQ!Ii96tzniLq4xpKdjf-0h11X9TRWDyDdi3CXCO=
Qcl2NzXCjwFq-oh6qCZqpKu20Q_7w$>
>     [ticotimo@gmail.com <mailto:ticotimo@gmail.com>]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
Kai Kang
Wind River Linux


--------------7CA60C6DAF0627B828EE02DB
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 3/3/22 11:07 PM, Tim Orling wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANx9H-CRb+TrzJCA5_8RF7TfxWi0L2tLVg63_-bZ1A84LL=ybQ@mail.gmail.com">
      
      <div><br>
      </div>
      <div><br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Thu, Mar 3, 2022 at 6:08
            AM kai &lt;<a href="mailto:kai.kang@windriver.com" moz-do-not-send="true">kai.kang@windriver.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">From:
            Kai Kang &lt;<a href="mailto:kai.kang@windriver.com" target="_blank" moz-do-not-send="true">kai.kang@windriver.com</a>&gt;<br>
            <br>
            Signed-off-by: Kai Kang &lt;<a href="mailto:kai.kang@windriver.com" target="_blank" moz-do-not-send="true">kai.kang@windriver.com</a>&gt;<br>
            ---<br>
            &nbsp;.../python3-pyparsing/<a href="https://urldefense.com/v3/__http://python3-pyparsing_3.0.7.bb__;!!AjveYdw8EvQ!Ii96tzniLq4xpKdjf-0h11X9TRWDyDdi3CXCOQcl2NzXCjwFq-oh6qCZqpJEVZ1GWQ$" rel="noreferrer" target="_blank" moz-do-not-send="true">python3-pyparsing_3.0.7.bb</a>&nbsp;
            &nbsp; &nbsp; | 11 +++++++++++<br>
            &nbsp;1 file changed, 11 insertions(+)<br>
            &nbsp;create mode 100644
            meta-python/recipes-extended/python3-pyparsing/<a href="https://urldefense.com/v3/__http://python3-pyparsing_3.0.7.bb__;!!AjveYdw8EvQ!Ii96tzniLq4xpKdjf-0h11X9TRWDyDdi3CXCOQcl2NzXCjwFq-oh6qCZqpJEVZ1GWQ$" rel="noreferrer" target="_blank" moz-do-not-send="true">python3-pyparsing_3.0.7.bb</a><br>
          </blockquote>
          <div dir="auto"><br>
          </div>
          <div dir="auto">python3-pyparsing is in oe-core</div>
          <div dir="auto">
            <div><a href="https://urldefense.com/v3/__https://git.yoctoproject.org/poky/tree/meta/recipes-devtools/python/python3-pyparsing_3.0.7.bb__;!!AjveYdw8EvQ!Ii96tzniLq4xpKdjf-0h11X9TRWDyDdi3CXCOQcl2NzXCjwFq-oh6qCZqpKqUDxp6w$" moz-do-not-send="true">https://git.yoctoproject.org/poky/tree/meta/recipes-devtools/python/python3-pyparsing_3.0.7.bb</a></div>
          </div>
        </div>
      </div>
    </blockquote>
    <p>Thanks a lot. I didn't notice it.</p>
    <p>Regards,<br>
      Kai<br>
    </p>
    <blockquote type="cite" cite="mid:CANx9H-CRb+TrzJCA5_8RF7TfxWi0L2tLVg63_-bZ1A84LL=ybQ@mail.gmail.com">
      <div>
        <div class="gmail_quote">
          <div dir="auto"><br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)"><br>
            diff --git a/meta-python/recipes-extended/python3-pyparsing/<a href="https://urldefense.com/v3/__http://python3-pyparsing_3.0.7.bb__;!!AjveYdw8EvQ!Ii96tzniLq4xpKdjf-0h11X9TRWDyDdi3CXCOQcl2NzXCjwFq-oh6qCZqpJEVZ1GWQ$" rel="noreferrer" target="_blank" moz-do-not-send="true">python3-pyparsing_3.0.7.bb</a>
            b/meta-python/recipes-extended/python3-pyparsing/<a href="https://urldefense.com/v3/__http://python3-pyparsing_3.0.7.bb__;!!AjveYdw8EvQ!Ii96tzniLq4xpKdjf-0h11X9TRWDyDdi3CXCOQcl2NzXCjwFq-oh6qCZqpJEVZ1GWQ$" rel="noreferrer" target="_blank" moz-do-not-send="true">python3-pyparsing_3.0.7.bb</a><br>
            new file mode 100644<br>
            index 000000000..30db080e8<br>
            --- /dev/null<br>
            +++ b/meta-python/recipes-extended/python3-pyparsing/<a href="https://urldefense.com/v3/__http://python3-pyparsing_3.0.7.bb__;!!AjveYdw8EvQ!Ii96tzniLq4xpKdjf-0h11X9TRWDyDdi3CXCOQcl2NzXCjwFq-oh6qCZqpJEVZ1GWQ$" rel="noreferrer" target="_blank" moz-do-not-send="true">python3-pyparsing_3.0.7.bb</a><br>
            @@ -0,0 +1,11 @@<br>
            +SUMMARY = &quot;The pyparsing module is an alternative approach
            to creating and executing simple grammars.&quot;<br>
            +HOMEPAGE = &quot;<a href="https://urldefense.com/v3/__https://github.com/pyparsing/pyparsing/__;!!AjveYdw8EvQ!Ii96tzniLq4xpKdjf-0h11X9TRWDyDdi3CXCOQcl2NzXCjwFq-oh6qCZqpJgDUfgdg$" rel="noreferrer" target="_blank" moz-do-not-send="true">https://github.com/pyparsing/pyparsing/</a>&quot;<br>
            +<br>
            +LICENSE = &quot;MIT&quot;<br>
            +LIC_FILES_CHKSUM =
            <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=657a566233888513e1f07ba13e2f47f1">&quot;file://LICENSE;md5=657a566233888513e1f07ba13e2f47f1&quot;</a><br>
            +<br>
            +SRC_URI[sha256sum] =
            &quot;18ee9022775d270c55187733956460083db60b37d0d0fb357445f3094eed3eea&quot;<br>
            +<br>
            +inherit pypi setuptools3<br>
            +<br>
            +RDEPENDS:${PN} = &quot;python3-pprint&quot;<br>
            -- <br>
            2.17.1<br>
            <br>
            <br>
            -=-=-=-=-=-=-=-=-=-=-=-<br>
            Links: You receive all messages sent to this group.<br>
            View/Reply Online (#95747): <a href="https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-devel/message/95747__;!!AjveYdw8EvQ!Ii96tzniLq4xpKdjf-0h11X9TRWDyDdi3CXCOQcl2NzXCjwFq-oh6qCZqpIOtHRD2g$" rel="noreferrer" target="_blank" moz-do-not-send="true">https://lists.openembedded.org/g/openembedded-devel/message/95747</a><br>
            Mute This Topic: <a href="https://urldefense.com/v3/__https://lists.openembedded.org/mt/89525383/924729__;!!AjveYdw8EvQ!Ii96tzniLq4xpKdjf-0h11X9TRWDyDdi3CXCOQcl2NzXCjwFq-oh6qCZqpJBh8c8Qw$" rel="noreferrer" target="_blank" moz-do-not-send="true">https://lists.openembedded.org/mt/89525383/924729</a><br>
            Group Owner: <a href="mailto:openembedded-devel%2Bowner@lists.openembedded.org" target="_blank" moz-do-not-send="true">openembedded-devel+owner@lists.openembedded.org</a><br>
            Unsubscribe: <a href="https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-devel/unsub__;!!AjveYdw8EvQ!Ii96tzniLq4xpKdjf-0h11X9TRWDyDdi3CXCOQcl2NzXCjwFq-oh6qCZqpKu20Q_7w$" rel="noreferrer" target="_blank" moz-do-not-send="true">https://lists.openembedded.org/g/openembedded-devel/unsub</a>
            [<a href="mailto:ticotimo@gmail.com" target="_blank" moz-do-not-send="true">ticotimo@gmail.com</a>]<br>
            -=-=-=-=-=-=-=-=-=-=-=-<br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
Kai Kang
Wind River Linux</pre>
  </body>
</html>

--------------7CA60C6DAF0627B828EE02DB--

