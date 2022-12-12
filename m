Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E68F2C4332F
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 15:13:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.45554.1670858016977804408
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Dec 2022 07:13:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=VpT73Nbu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9345c419cd=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BCCAMTQ009852
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:13:36 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=mX6ynVv0tGYpzn9H7AoDFBK+myjuxuUi8gQkDGq90vo=;
 b=VpT73Nbua+/+msRCkzUlaTj+tUaHwq2R7M1Pj147GgBugsIfpKi8U3WWGKSSey2tntNz
 pQ2CFV9PxgMXzXgoFeDzuAQVJYw0BIenBbSG9k618NTcsf/K/+G3kPEw+Fd34SdPBjyU
 oaYMIzt592guIb1vaabpiCvLBJ8ll1mQyd0g2W9xRr+TcSzJosrks35P3CnvMDvMrwRO
 OlMGH6YXYymmXUL7UoNXA682333q8qXe4FtJnoC4Nv07Kk3h7I+vVVw+miPJCjtdEAai
 OZojwXXIWE/bE62BBru17zAGdLV2IVTkG5QDUp3Y/E9Q/LyfARhZ91bGk5wUXjX7YGRk Rg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mcp95sf1p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:13:36 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BCFDaDp023302
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:13:36 -0800
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2044.outbound.protection.outlook.com [104.47.56.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mcp95sf1n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Dec 2022 07:13:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UCftxVb7Xn1WCl9w/Ry2E6ForCBcqOfKtJ6SK35+lwKXrLevIbCDHytwgV/F9zeWfITRN/+ayFC9RLfdH35W7c/5zyqHHKBLEPzHphXw7qFH6wCDw+xgbl6F7gZ9R9sE36T0RoiTeNzyp9WFqENYGtYrqDvvSRRcTnoCfP8Ch/6VaP+c6acQnbg5bUVSUKDpM+pGaasJCcZ5s9eox9K4AMeBJPT7P4+fAiOZAEThbyI5sm3X7huWWVXWeuPZlnwTkybWvNoQDMx6yegop13S3eaH8YIqJ9QPVmTI6QUSb1var5YVN3Xtf6Uo6V9bR+dM69Z2ddD3rQXvlxIovGxEVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mX6ynVv0tGYpzn9H7AoDFBK+myjuxuUi8gQkDGq90vo=;
 b=YHFP+1Fhcp0trK/b2TTgqKaArq8f6jzqquRQm/iwhds9FmeaJ/XJs76vrwpzugzZpkFsyR5+q9xizBBLrnBMj68P/QF7oqsDJAFlqU64kRlIMwHI0UxB6UHW8uJW1+1j9efqEQwYs5qEEJHhaqlm9eKzeQI+VJNlLn5yTCa/+YVz2paM7uu6fLrE5JkGPCVSkwgUFTJvEh7wd1gD5Ukj4/XE9JyUFdnNv9BbbaEq25bOxr6PMJoA7ePOpAnn8akiRxwwAqLBr36GR/wr6WVVIG6kqaG5qVSIM3BLLI3ujhtC/qfNtKl+7I+jMStkf5o6Haoi4BvFKzI+YN/+xPsMeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by PH7PR11MB5960.namprd11.prod.outlook.com (2603:10b6:510:1e3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Mon, 12 Dec
 2022 15:13:32 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36%6]) with mapi id 15.20.5880.019; Mon, 12 Dec 2022
 15:13:32 +0000
Message-ID: <f2e1c977-547d-269b-6875-7308872dd50f@windriver.com>
Date: Mon, 12 Dec 2022 10:13:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [oe][meta-oe][kirkstone][PATCH 1/1] Nodejs - Upgrade to 16.18.1
Content-Language: en-CA
To: Martin Jansa <martin.jansa@gmail.com>, akuster808 <akuster808@gmail.com>
Cc: "Polampalli, Archana" <archana.polampalli@windriver.com>,
        openembedded-devel@lists.openembedded.org, hari.gpillai@windriver.com
References: <20221118182718.2548901-1-archana.polampalli@windriver.com>
 <CA+chaQeUgwE0kPWymzP7C4pupbOYHfKH3SG13KoaPbt8eX3KxA@mail.gmail.com>
 <f0a3b575-dfc2-829f-6100-9e1eaedf0be5@windriver.com>
 <CA+chaQcyKNdkqmBFwr15m9u+EhAKP75p56=261SL_1G-vNRbDw@mail.gmail.com>
 <b10b1591-933f-0ac3-07bb-d80a490ddd1d@gmail.com>
 <CA+chaQdaOOKGy=VpN6kR_EeJMQL=cvzrTmzBWB2tNeWfLKej_A@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CA+chaQdaOOKGy=VpN6kR_EeJMQL=cvzrTmzBWB2tNeWfLKej_A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SJ0PR03CA0126.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::11) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|PH7PR11MB5960:EE_
X-MS-Office365-Filtering-Correlation-Id: a5e20635-412f-402d-6993-08dadc536e86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	psgb0G34XF/yvJ2eJX2k/DW4iURoFNo9yvF/3DvdoBAaZ1yHzWgPmqsgRqDVXbEwGb/7N215DdTMuPg/sEEvmiIXez1V94Fy2Qia4l0mIURbOr9dwpu7/Z1Hn6SWLSJ6ET9zlznOsEgs6Az4iTIWcGbVGOrAlTsDZoalwT3rC+QfSK1EuJwFAO3BcPJECXCgQoydsr6pGwg0oqFiI9CwQ/w1Bv+sqgWyPMVfsijnE/Btywb0une2RqH8zKY2OjbaUzBwKUez3CVcLT3rNfDHmbJTuG3AunJfo5JsOhgH0THiyj5pkb6E40NZ/4ZPVxvxIo6TvH8wuU4/2czz4FG82/EkX1f0VdffoobYlDBJqe8qTl2JIRLESZ3GChKz7UzlCtH3rRdSekSg/MkcsJYx+C3IU2muw0K6YqF85cHjlHInXZ1ZBhONpCvuS4Nuuom4yOgze8gDZqAmnkSI+LKWHicc/yOyqKUW/ASMQ/3Q3F9dM7ETwUMTLW5pPE9Qv5PXNAz+XEQkGRntgztMWf6si7+BV4bHej6sCttzs80lcNMI0hxQxb3zz0KYdLhD9vixBRDEpXh56b/24OUQAicIWGPN6Vc4ZNvybx3sfuDWC77ak147nftol60PC/crKkKE8Kf1QDm1FIK8m3ATRTcIEaanselj/s+rnBWvardr/PPQRYFeHVIBESXtw2SlD3TA4mvoix8hX3DQIyFQfJnawsGI2EYxgyZQ5xOXI+AcgeihafebGlQvxDl7f6+HQ5y7
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(376002)(366004)(136003)(346002)(396003)(451199015)(478600001)(107886003)(31686004)(6666004)(966005)(6486002)(186003)(26005)(6506007)(53546011)(6512007)(66556008)(316002)(5660300002)(2906002)(4001150100001)(66946007)(36756003)(4326008)(66476007)(2616005)(110136005)(8676002)(8936002)(83380400001)(86362001)(31696002)(41300700001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dWcrdU1RNXJ3a2dZTDVIUFIzaFFGRDlGaW92QjhxblVicHhkL29hSENBclZR?=
 =?utf-8?B?YVZKOWpIdE9CSUljakxNVDEzQXVQUk1Rd2lTVVRFR25QYnRGaHVMUEtCNTRV?=
 =?utf-8?B?djFGcUxkVzdrY2VwaFhvRUdZSk1aN3pHbUp5N3h4RU9WV3psL2xkdk9BWTd2?=
 =?utf-8?B?ZzJrc05nZm5sQ3VxZWlydkNJZ1FUYnFkQ0twbTc2OCt2Y3hsS0dIdDdJdG1O?=
 =?utf-8?B?S2NoNm5yWTI1ZXF2Yk5oUFlPbC84QjNkVmtqcWFsREFXYVM2czNMaWxXSlNs?=
 =?utf-8?B?cExsNFgvajBVUGtNTXhzWkE4Z2h4TS8xRmdEaXNPYVY2QWpFbVFLZWdDWUFV?=
 =?utf-8?B?a3BhaWVTaXRxNmJSa0xDSnBUWWZBMlVwVXEvRXdwRkRVYUd4ZzhZODkrZW05?=
 =?utf-8?B?YU5VNFdRZnBGM0JBWk94MXZ0VzRMSzBsRU1Sa3JUa2Y5Wk9uTnEyeitNUnBV?=
 =?utf-8?B?by96S1lqd1hZTDdhektzNjdQTk5UUWtkMFNjMjhFSGJOdGNtMmFrR3dxQlhh?=
 =?utf-8?B?RnE2K3RQNWp5QmpNenQ3cnhPcFpYL0txYUhVVkxnTXNhZnhiNFVWcmU0bHhW?=
 =?utf-8?B?NkNsUHk0amsvZ1h0clg2TmMwNkNVZU5QMFMrdGVFOElXZVlaWkRIVlFJQVF3?=
 =?utf-8?B?YTJOUi8xZGhJZ1FhMHJ6cmk2eHJ2dG11VEFJd0pjbHJUMzIvMWZIV2RCdTd5?=
 =?utf-8?B?TUdKa0svQ2RXY1hIbVlRbENWSjBDV1pxWUlaOHNjWE9WVkIwSkM1TGJMSUJL?=
 =?utf-8?B?TlpiOUtLNEU2V3BNN3htN1lsYXZDbGZnR1hGK2xKaStodzMvNEFpcExCcTBi?=
 =?utf-8?B?MGdwZmFobjlid2UyeWtYNkE4L2ZSY2VGZ1U5NlVpa3dWNCtkRkJVTmIvK0Vs?=
 =?utf-8?B?TUJLVVE1bENVRHJRaitrL0t0OXIwc3R3ZURBbFplV3ZWVW0zc08xZVhuZVdR?=
 =?utf-8?B?bmRjZjEzQUptMXczOXRuK1YxZ3VvaUE1V3NMdWVLNmVsSEgwaDRJWlA1a2NR?=
 =?utf-8?B?Wk9FTENKZmhDK3lTbmhTYWhyRVVXRVdmRHFyNnBQbXY0OGNGNStYMjZGSVhB?=
 =?utf-8?B?N1FjS1RxbFQ1T0tKSkZRWFc4c25yWFZjVEZtRVdhczdHT2d3Tm05eUlSQWxX?=
 =?utf-8?B?RmRZRmZvUUczVlBVbWR4TVhYQnNzTmZNbldwZVBGa1JCcHkxdDM2ZmhSRDQ0?=
 =?utf-8?B?NlhkOG5nS2Q3QSttVFJUKzNjdzFSSTFBN0NpVU84Slc3T3IyR1JVUGUyRXdL?=
 =?utf-8?B?akhKRkpLRndYakdFNVloWWVzTkUyOFFJSElVNTI0T2M2UnArQSs2bzJDQno5?=
 =?utf-8?B?Q1FuTHVSa0Nxa0dxQ3pHVW1aTDZxSkFJc2FjNlVFa3d4WmRZNy8vNnEyZkQz?=
 =?utf-8?B?eVlxR2I0MzQ2TTV5cTRPalhVR2Zsay9VVUQ4QzdSa3ZGMmp1TkwzY21UY3Zn?=
 =?utf-8?B?bFcvOFQ4QkFFOUMxUW1DY1RIZlllK24zQTVVQkFiajk0TkpsQW9uODErTml0?=
 =?utf-8?B?cy9ORVE4b0RKbVAzL0lUb0JYUGhNU1BkZFFhNE5yTTAvZUpLTWZWQmdoaGs3?=
 =?utf-8?B?bFZZU1lXNnd5WWZOTFdkbUFManRISGk3NGpiUXBRQU1WRUpyNC9ZZllIUFBG?=
 =?utf-8?B?NkpZbldwOEh1MmFwM3NQd28zZi9Ca1hOS1k3VWhuaFFtY2d3TlZjRXIrY3hX?=
 =?utf-8?B?WVgrUDJDRFlGUUlTN0xTeGpGYzRHZ2hKUmI3N0JEL1FQNzdOalF1enl5azVT?=
 =?utf-8?B?UmNXT1BZWDkvZ2RKWFVKTDVpdSsxQk9QTXhUVjFUc3BRb1RhaTd6OGtETDRs?=
 =?utf-8?B?d3BtT1NvV2tqWkpZVHVLWVo2Mk9MSDViZ25NMnF3bXhyc0lyaFBRQm1NR0hJ?=
 =?utf-8?B?NEJsNW5oVXpvbXVQT1d3QmhNM1BkNEdhODBoRElIdExpYjZnODZIcC9mWEd4?=
 =?utf-8?B?NndQTStqSkE5SDRzZUFLYWpmVWlPR1FDNnM0M3BsVnczMzhkRUp5L1lHTzdR?=
 =?utf-8?B?U2czTjl4ZlJKOWZuUmp2V0VQeit2TS8zL3R0RU5WSWZJMmJ3ajJ5NGpLWWRQ?=
 =?utf-8?B?SkhEVVJRZkxkZDR1VVBCWWJaSEpNOEhVazUxUDlWZHV2MG1zaDZyT3RmUzA4?=
 =?utf-8?B?OWZzUlRPSFJUS3gyaTVubWJ3cVRBbmZPKzBuallYOXhzSFBXWDlHUll0VWZo?=
 =?utf-8?B?L1E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5e20635-412f-402d-6993-08dadc536e86
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 15:13:32.3232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 32EPceqWEW4YUR245CSqaa3u42LBfg9pVG9o0Cv7l1hzjpBoe1iOTtIvFJjbnMcXdf/kNPOFcxLDPxGZ8qs3mRu3TgpKq64Uj8rNeiQxh1c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5960
X-Proofpoint-GUID: XL2Uhv-x_dyH32J2KY3WAIyFMgSV3wtX
X-Proofpoint-ORIG-GUID: PLpy-pgOuJ8f61HoXYGbawG6cIwIuEP7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-12_02,2022-12-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 mlxscore=0 spamscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2212120139
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 2BCCAMTQ009852
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 15:13:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100062

On 2022-12-12 06:10, Martin Jansa wrote:
> On Sat, Nov 26, 2022 at 5:05 PM akuster808 <akuster808@gmail.com=20
> <mailto:akuster808@gmail.com>> wrote:
>=20
>=20
>=20
>     On 11/24/22 2:18 PM, Martin Jansa wrote:
>      > On Thu, Nov 24, 2022 at 7:06 PM Randy MacLeod
>      > <randy.macleod@windriver.com
>     <mailto:randy.macleod@windriver.com>> wrote:
>      >
>      >=C2=A0 =C2=A0 =C2=A0Add Armin to ensure he seems this once he rec=
overs from US
>      >=C2=A0 =C2=A0 =C2=A0Thanksgiving indulgences.
>      >
>      >=C2=A0 =C2=A0 =C2=A0On 2022-11-24 12:05, Martin Jansa wrote:
>      >>=C2=A0 =C2=A0 =C2=A0I see this is now queued in kirkstone-next
>      >>
>     https://git.openembedded.org/meta-openembedded/commit/?h=3Dkirkston=
e-next&id=3D08b6b6846a84d9a0459f42d1d730c9ea1d50c43f <https://git.openemb=
edded.org/meta-openembedded/commit/?h=3Dkirkstone-next&id=3D08b6b6846a84d=
9a0459f42d1d730c9ea1d50c43f>
>      >>  =20
>      =C2=A0<https://git.openembedded.org/meta-openembedded/commit/?h=3D=
kirkstone-next&id=3D08b6b6846a84d9a0459f42d1d730c9ea1d50c43f <https://git=
.openembedded.org/meta-openembedded/commit/?h=3Dkirkstone-next&id=3D08b6b=
6846a84d9a0459f42d1d730c9ea1d50c43f>>
>      >>
>      >>=C2=A0 =C2=A0 =C2=A0I see bunch of recipes failing since this up=
grade landed in
>      >>=C2=A0 =C2=A0 =C2=A0master, mostly due to npm dependency resolut=
ion being more
>     strict
>      >>=C2=A0 =C2=A0 =C2=A0now and builds failing with
>      >>
>      >>=C2=A0 =C2=A0 =C2=A0npm ERR! code ERESOLVE
>      >>=C2=A0 =C2=A0 =C2=A0npm ERR! ERESOLVE could not resolve
>      >>=C2=A0 =C2=A0 =C2=A0...
>      >>=C2=A0 =C2=A0 =C2=A0npm ERR! Fix the upstream dependency conflic=
t, or retry
>      >>=C2=A0 =C2=A0 =C2=A0npm ERR! this command with --force, or --leg=
acy-peer-deps
>      >>=C2=A0 =C2=A0 =C2=A0npm ERR! to accept an incorrect (and potenti=
ally broken)
>      >>=C2=A0 =C2=A0 =C2=A0dependency resolution.
>      >>
>      >>=C2=A0 =C2=A0 =C2=A0Can we please delay backporting to kirkstone=
 and langdale a
>     bit more?
>      >
>      >=C2=A0 =C2=A0 =C2=A0Seconded!
>      >
>=20
>     Noted. will remove from kirkstone-next
>     -armin
>=20
>=20
> I've tested my work arounds for both kinds of build failures I've=20
> mentioned here and it seems to work fine.
>=20
> Nobody else reported seeing similar failures in this thread, so it migh=
t=20
> be less wide spread than what I've seen in our internal LGE layers (or=20
> other people aren't testing their builds against master often enough,=20
> which is their problem and shouldn't block this).
>=20
> I'm no longer against getting this merged in langdale and kirkstone.

Oh good.
I missed this comment when I sent my previous reply just a few minutes ag=
o.

Armin, do you want a new patch or can you merge the one on this thread?

../Randy

--=20
# Randy MacLeod
# Wind River Linux


