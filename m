Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C51F4C433F5
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 01:30:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.3617.1635816619100937525
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Nov 2021 18:30:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=QdzI2gAR;
 spf=pass (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=694066fcf6=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1A21SbNe016988
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 1 Nov 2021 18:30:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=e9ofCEnSFeP+7zmzo5dmLTfvgqhkaze+vSHEaE6aK9c=;
 b=QdzI2gAR7iUvvC4wQptW0fNw4aGpv0+5rq1GmRwuTVLPskasG5b3FslFm63RtK4b9sYl
 nQZHlDGJgPn1e0go2Fa/afgaftOeJR6lT9Gde1RHAGB6YcqdyGyiflh1dblWC/aktVvX
 WDwAxUP1HJm3ZV695InN3lRfH/NmTuy441gbwLf7qvxe/h+5rtewWYKdlYWmfhMsQXe2
 RedPLXfed2C+GBva0RRXG+rzPVxFz4tdB3lI5jNvvWAtujmX5sYiCumIoNa43L1ri35l
 +R5MBMi1pTO9AKiTEEfNgc99/dDjwWtbKOckkUod+fhtUPWWj7hhXVavzLMKA3HTGcoM LA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3c2asc0s6j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Nov 2021 18:30:17 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.16.1.2/8.16.1.2) with ESMTP id 1A21UHXR023314
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 1 Nov 2021 18:30:17 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3c2asc0s6g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Nov 2021 18:30:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SgdnrNoYVnu+zZHG50D7fi4OcBhkQZMxGXVi4b9e6EEQ+ro8sa0owUY/iMYYtjIROeSnDc+dWP08LWtraduT4FUZMqAm/fC8nhMsn9ZtZQ7I1BRdnIx9wQupIVHNhYiecxbK80G1vzkIg0uXB1f2lzfLvKdsq41qbEnlZu1XcyOUeXzOw74HkYcUkKipwVoDtzFcC1cM29gxVQOIqBr8WKAIzE92VPyLyvBZqSQ2J6zimVAvTJ8/FZZvYOnrdw89Awz6TxuYxs02gHGsg63qUiPVqpLB0O1Myc6PYl385AnShdNjSVZUVM6phQ/bxWEK2p1mLWA4RvGxKKKMPV3/hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e9ofCEnSFeP+7zmzo5dmLTfvgqhkaze+vSHEaE6aK9c=;
 b=PiBNKk3D5n2lMTkcoTp9PLcYOzcjPItAeM3j9iWjzZIA31FxuO2m+HfGytHtwfoCGnR43u6+SM9VSZEPaooVCuRM4wfZHKJ58lVtAPiK0KoHtuLcffE2dkS8wKf2hL5ShqypnuBY2VrkvxjF7u8TxlV+pPhKdiaMk8y+H2mHOIJpzNb/yMb21WPzt2ClcDdr8H7tEWnH/5T83WyzNKhupOXULQIH5Nnthw1wkWGsu6LilAmQndmWk52QT+sDJJjBq825tg0pZEUkr+ndNYGMPkl/p+XAN0t3R2d9DcPhXqojqdBmqZGxMduBjxMFLDfJ5qPeWXRLSt1eQvRIz+oZcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SN6PR11MB3311.namprd11.prod.outlook.com (2603:10b6:805:c1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.20; Tue, 2 Nov
 2021 01:30:12 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::a544:19b6:196b:f339]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::a544:19b6:196b:f339%5]) with mapi id 15.20.4649.019; Tue, 2 Nov 2021
 01:30:11 +0000
Subject: Re: [oe] [meta-oe][PATCH] mozjs: fix powerpc compile failure
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20211102005253.38996-1-changqing.li@windriver.com>
 <CAMKF1sp-ds+shTRHyeS3aeNFiwZyOwqWcq+q4ayxQ_jdZYg55w@mail.gmail.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <ff85a590-7076-a1e6-3123-72d4f6727bd1@windriver.com>
Date: Tue, 2 Nov 2021 09:30:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: 
 <CAMKF1sp-ds+shTRHyeS3aeNFiwZyOwqWcq+q4ayxQ_jdZYg55w@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------705E467B72D2F0AA95549EC5"
Content-Language: en-US
X-ClientProxiedBy: HK2PR03CA0056.apcprd03.prod.outlook.com
 (2603:1096:202:17::26) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
MIME-Version: 1.0
Received: from [128.224.162.189] (60.247.85.82) by
 HK2PR03CA0056.apcprd03.prod.outlook.com (2603:1096:202:17::26) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.6 via Frontend
 Transport; Tue, 2 Nov 2021 01:30:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7998bc43-15e7-4812-b787-08d99da05043
X-MS-TrafficTypeDiagnostic: SN6PR11MB3311:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB3311D07A654184177C443B1C828B9@SN6PR11MB3311.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:854;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/nblw5x6S773MDmahwgXEwnVpdwPmxSUYZ0WPQcON+/Rl7odq4Jsj2oMXh01Iejw6UJrQ+ZTm0hwLJ6bHVvD2NJy+l+HF4DGa0txFaTyEvt5guAmn9eaMHKPS+HicMAdIR624V6IQxuBS/ANE6ECsEk5MK5t5ig8YljR01SWa24AAEA53shB+8w8ogjo28OYen/G1EymHw9qSTD/8DQVsI3ncubIaWNwY6E+UjtULWVoOVHpNPsGHtOAUgWzUU8NQ5oYF1HKO+963pRjLjtc8+MYJ5MicocNYTv8fnh2FBsw7hI4r1pCaxIoGgkOceXESU2zdx33Ft3WBaePCiXLeCGsphONQCBf2d+f0p/wQmIqf7lPJrv1APyJwfRV0Hv1X6CHefMrKVmnjzYhF0tKEIKCUPDXXc+Nw78fkH1j+fyEPF5JASN3zQHgaxp+GxSRNsI5V+U65UK+pYT0oPGleElj4+jKTxGE00LjkTmneceTWPsbE+Z9k5fML5qbmTUWInUtQQOsiiq9DIEc40LMt3pA84ucVyys4GBvFIw+rNlKvBhapl9tlfH3q37h/3kucnAZKT45BW7Iyae7GUo5xAefZ8u578aMW9q+udOy2xq0NM9llIKNOGpyabE/R0HUTgOWTmK3lH9qEeyIvF6aMiwMKQQ7n7/TLrWHkUMcurAnVcHNfjVdC/E1p4XYD+Mr3pgMO2SyxCzIc223ZEaDy0XZsnXmWkGFwfXqfj/30Kb6RczhF1x2wxWKNXujWJw3cO3m6y9nciYhM63Zzl5lJGt1hsKWdp29TE33LI7wg8YhXVEMIVpxz3SjtJuoH6nRFM9pdroWGoVPr0w/cl06K+YFtDFuqzNl8c86SMiW39jOp+K2mh00SDIbwsyZpZ5WBQrSSHTIAruitRaT0Dsegq4GI/ix/oKFC+YzaEYN7Kw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(2906002)(44832011)(8676002)(66946007)(38350700002)(31686004)(6916009)(966005)(5660300002)(2616005)(66476007)(26005)(8936002)(6706004)(66556008)(186003)(38100700002)(166002)(33964004)(956004)(86362001)(316002)(508600001)(36756003)(6666004)(6486002)(16576012)(52116002)(4326008)(53546011)(31696002)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Z0E5Yk1FOFR3RXlHbW9GUnpWemo5emQ0dk5rY05mNzhOZ3ZBdXc4U1ZDdUUw?=
 =?utf-8?B?T0pNTUxUQng0Q3BlL1FyQW9hN1o3aG1oeHp1enErekFKYVh2eUMvMVFnc2tl?=
 =?utf-8?B?WnNxenpyWHVVTDhoVXRsd2dkS3JrdkJPTUdwMjJzN1RHZjg3cnpQcHc0azBh?=
 =?utf-8?B?VzBFZ2tPMmdwaS9OakFMd0xFZ2xibFY0Q2ppcVo1TmRJc0gvNHh3N2d6VnZi?=
 =?utf-8?B?K3dpRWEycnhHMzBCbW9Dcno5OHIza2pEYVVmMFBwSTJueElwdVJJUVEzWHpY?=
 =?utf-8?B?cDQrQ3hCVVBYaUNjeU5zOHpYbVQrcUpsR3FKQVB0MHU1L3Y3eTY3RWJZZnFC?=
 =?utf-8?B?ZWVEeCs3K09EaWxHcjI0a0YvQTFxOGZhVDBwVHlDRjNScW9ScVJMTkIzZTJP?=
 =?utf-8?B?bEJpSS81TE1hMTZnaXFPd3J1WlBJaGw4eVRKbVFuTXpnRmhUTGFCWkU3WWVD?=
 =?utf-8?B?VjZSQ1BqbWk1SzJFSWt5QzFNQTRVQUVmUGs2NGM2VmpKalRFRVM2bGlKU1N5?=
 =?utf-8?B?UzVVQWlTbnVTa1Q5eE5wR1BmNWkwNkFuUW9jcW9FSHVtRzczbUdCYytLbno4?=
 =?utf-8?B?WDBvRU42WmNQdklXWUc2ekVMdG51NTJTaXRSZlhFeTJ1VkdxQ0JIUEJMdzZF?=
 =?utf-8?B?Q2pFVlVJUTU3b3VoVk00ck5BYm5mbjBtcWt6dU5EZGlmQnRncytjcW1jN3Fu?=
 =?utf-8?B?UU82emh5cWNKUC9RUVRjeGI5R0NlWVhJc3ZCdEFMNWlJTkNoaDkyVmNIWHJ5?=
 =?utf-8?B?MGlGbWJrMno5VDZOc09WSjM1UlRuRTRjTVMvVVlId0ZENlFkOXpwQ1Q3RW9s?=
 =?utf-8?B?dlUwMm5pbkFhWVVadDFHTVU1b2NkQy9LZU5vSzV6UDdDeVkvUHZrSVNQVm82?=
 =?utf-8?B?aTlSUnlkL1ZQWENuRUVWUk1rYnpsV1N3QUNNSDVQZGwzdEFzTEVBY0RuVWJx?=
 =?utf-8?B?eG1sUHNKVWx2dkV2SjhaRmVjVFRLaVMwdTBlNjhOREk5NW42UGZBTTB5b2VX?=
 =?utf-8?B?czA0TXU5clQ4aDJJQnQ4SXJKajVtR1FSckMrblFoaVd4RUx4R3pkaEhqU2tm?=
 =?utf-8?B?NVExd1p3QkI2ek9ETEFVK3hQRm5zT0E5SU5HODlaZVd1QUhuQUZ6bHZ3S2Rx?=
 =?utf-8?B?K3krdzdlZHlqYjZDR1FKQjZWY1B1Q1JxR2RYVXN5UWZid0RRa3ZzVHRySWN0?=
 =?utf-8?B?OXNRWmpoMFNJUlJjQVVOY2pzSGo0MDd4eXU5eTNERG5FZCtvSUNSeSt4Q3lB?=
 =?utf-8?B?aWZaWmZYdi93VEg3WlN2bGQ3dEdXUnl2RHZpZDJoV3VJdFJZNXBodll3MEhK?=
 =?utf-8?B?RDhTbm1RakVjRVByQ3E5YTlGUE95U1FISTFmNVI1UkZ2Y25uWDBhK0krbkp1?=
 =?utf-8?B?Wi9GNy8zVmRIYmdZRzBCcmJKTG03TkpMbTc2RzE4TGR0QnIyVHpiQis4OXlL?=
 =?utf-8?B?cVd0OFJYZFhPVjhENUl6Sm1VZHZsYWErNWp5Y2U5amVLMEROakxseUFWcUpG?=
 =?utf-8?B?NFNhY2tMZkNXVXFQSzNjTEFQdkhlRHpUTlZJUlo4cmF2SU1ZUDFYbjVhRXBX?=
 =?utf-8?B?elNCRE1kZ2t4Z1RBdEdOQ2FKNnNuQmlwcFFxRCt4cnFPNkFhKzZOOW5oa3Nr?=
 =?utf-8?B?ZE5jdGxPN05udzlpeldWSjhHUnkvRklHYzVWUHhFT2RHU2MyWUE1cSt0NjlL?=
 =?utf-8?B?dVZVaVhMU2ZwbFlYaFh1MDltdjl2d3J0YTZsQ0h3QjdZb3pMM2txak5IMjNn?=
 =?utf-8?B?RC9jRGdtUzJsUXpZVzdHUzZIczhWMVQ2K1luREplZkZuYjlaYzgvNHA5WmhT?=
 =?utf-8?B?VHV6VzhpVUJGcExldmFNK3NZTHIzN01keUtmanRtVVZ5dTU3MmNVSVU4eUVn?=
 =?utf-8?B?eSt3M01zSElaZ2xwd3U0NVI4RHNOY2N3bVNtMXhCaVc5eWExanZiellxZXVK?=
 =?utf-8?B?Q3FES3pqMzVyeG5xTEI2UThGNkZiWjFqT2FNakNML3Fid1pSSGkzWjkvRlZx?=
 =?utf-8?B?V2FtYWFEdytUZEgwTHVwUWxvdWhPNWdxTmhsK3NXZU9mWExobXEwUDZZRnc4?=
 =?utf-8?B?MmlqZ0dnY1EyUnJpTExQSHE3QjZuSnIxdFNxdThxclFFeEE5TUpWMXMzQ2tM?=
 =?utf-8?B?cW91ZGdCdzJ6cmIyZ0ZTRDI2VWpQQVE5S09iZ09QUEtHbllDM0JqZzk4a2RK?=
 =?utf-8?B?WGlka3phaHhVT0Y1QUFPMTlFbGtzLzFFMzNybzVyQm4xNVlHYnBkYmVXTTlr?=
 =?utf-8?B?K3lzY2VWNlJYTEl6L21nT3BCRDBBPT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7998bc43-15e7-4812-b787-08d99da05043
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 01:30:11.8608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 SD8PMN7V3hXxFOT9Q7EqjJY2/LOoQ9wTpliYG6VXN3ywVHt8uQojpT5cA7gIBNFqLd9PHoiG79N7vdgFHSQcA75W4GiGuWb5E1JM+f6boig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3311
X-Proofpoint-ORIG-GUID: J-XrxmS3q3k6_AwYzuKHaFUVWDI6BBMu
X-Proofpoint-GUID: 4Mxk_XnJy4jIm73dHZnqMKjY97y3MHpX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-01_08,2021-11-01_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=776 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111020006
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Nov 2021 01:30:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93763

--------------705E467B72D2F0AA95549EC5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 1A21SbNe016988

On 11/2/21 9:01 AM, Khem Raj wrote:
>
> **[Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Can you rebase it on top of master-next and resend please
OK
>
> On Mon, Nov 1, 2021 at 5:54 PM Changqing Li=20
> <changqing.li@windriver.com <mailto:changqing.li@windriver.com>> wrote:
>
>     From: Changqing Li <changqing.li@windriver.com
>     <mailto:changqing.li@windriver.com>>
>
>     powerpc disable jit by default and also have compile failure:
>     WasmFrame.cpp:57:76: error: static assertion failed: Aligned after
>     pushing DebugFrame
>
>     Signed-off-by: Changqing Li <changqing.li@windriver.com
>     <mailto:changqing.li@windriver.com>>
>     ---
>     =C2=A0.../recipes-extended/mozjs/mozjs/nojit-32bit-arch-fix.patch=C2=
=A0 =C2=A0 =C2=A0|
>     2 +-
>     =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>
>     diff --git
>     a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/n=
ojit-32bit-arch-fix.patch
>     b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/n=
ojit-32bit-arch-fix.patch
>     index f308b4863..cc2673e74 100644
>     ---
>     a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/n=
ojit-32bit-arch-fix.patch
>     +++
>     b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/n=
ojit-32bit-arch-fix.patch
>     @@ -15,7 +15,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>>
>     =C2=A0 =C2=A0protected:
>     =C2=A0 #if defined(JS_CODEGEN_MIPS32) || defined(JS_CODEGEN_ARM) ||=
 \
>     =C2=A0+=C2=A0 =C2=A0 (defined(JS_CODEGEN_NONE) && \
>     -+=C2=A0 =C2=A0 =C2=A0(defined(__riscv) && __riscv_xlen =3D=3D 32) =
||
>     defined(__mips__)) || \
>     ++=C2=A0 =C2=A0 =C2=A0(defined(__riscv) && __riscv_xlen =3D=3D 32) =
||
>     defined(__mips__) || defined(__powerpc__)) || \
>     =C2=A0 =C2=A0 =C2=A0 defined(JS_CODEGEN_X86) || defined(__wasi__)
>     =C2=A0 =C2=A0 // See alignmentStaticAsserts().=C2=A0 For MIPS32, AR=
M32 and X86
>     DebugFrame is only
>     =C2=A0 =C2=A0 // 4-byte aligned, so we add another word to get up t=
o 8-byte
>     --=20
>     2.17.1
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#93761):
>     https://lists.openembedded.org/g/openembedded-devel/message/93761
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-devel/message/93761__;!!AjveYdw8EvQ!NiRsOPLw04xoyb1GnwAGI71nxf0Bo=
uxYWeC06ggHQqeyQ9484jDSMX9G6aIO9WN7gSIkyA$>
>     Mute This Topic:
>     https://lists.openembedded.org/mt/86756698/1997914
>     <https://urldefense.com/v3/__https://lists.openembedded.org/mt/8675=
6698/1997914__;!!AjveYdw8EvQ!NiRsOPLw04xoyb1GnwAGI71nxf0BouxYWeC06ggHQqey=
Q9484jDSMX9G6aIO9WNP7I312g$>
>     Group Owner: openembedded-devel+owner@lists.openembedded.org
>     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-devel/unsub
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-devel/unsub__;!!AjveYdw8EvQ!NiRsOPLw04xoyb1GnwAGI71nxf0BouxYWeC06=
ggHQqeyQ9484jDSMX9G6aIO9WP2-2Nt_A$>
>     [raj.khem@gmail.com <mailto:raj.khem@gmail.com>]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--------------705E467B72D2F0AA95549EC5
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 11/2/21 9:01 AM, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CAMKF1sp-ds+shTRHyeS3aeNFiwZyOwqWcq+q4ayxQ_jdZYg55w@mail.gmail.com">
      
      <div style="border:solid #9C6500 1.0pt;padding:2.0pt 2.0pt 2.0pt
        2.0pt">
        <p class="MsoNormal" style="line-height:12.0pt;background:#FFEB9C"><b><span style="font-size:10.0pt;color:#9C6500"></span></b><span style="font-size:10.0pt;color:red">[Please note: This e-mail
            is from an EXTERNAL e-mail address]<o:p></o:p></span></p>
      </div>
      <div>
        <div dir="auto">Can you rebase it on top of master-next and
          resend please <br>
        </div>
      </div>
    </blockquote>
    OK<br>
    <blockquote type="cite" cite="mid:CAMKF1sp-ds+shTRHyeS3aeNFiwZyOwqWcq+q4ayxQ_jdZYg55w@mail.gmail.com">
      <div>
        <div><br>
          <div class="gmail_quote">
            <div dir="ltr" class="gmail_attr">On Mon, Nov 1, 2021 at
              5:54 PM Changqing Li &lt;<a href="mailto:changqing.li@windriver.com" moz-do-not-send="true">changqing.li@windriver.com</a>&gt;
              wrote:<br>
            </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              From: Changqing Li &lt;<a href="mailto:changqing.li@windriver.com" target="_blank" moz-do-not-send="true">changqing.li@windriver.com</a>&gt;<br>
              <br>
              powerpc disable jit by default and also have compile
              failure:<br>
              WasmFrame.cpp:57:76: error: static assertion failed:
              Aligned after pushing DebugFrame<br>
              <br>
              Signed-off-by: Changqing Li &lt;<a href="mailto:changqing.li@windriver.com" target="_blank" moz-do-not-send="true">changqing.li@windriver.com</a>&gt;<br>
              ---<br>
&nbsp;.../recipes-extended/mozjs/mozjs/nojit-32bit-arch-fix.patch&nbsp; &nbsp; &nbsp;| 2 +-<br>
              &nbsp;1 file changed, 1 insertion(+), 1 deletion(-)<br>
              <br>
              diff --git
a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/nojit-32bit-arch-fix.patch
b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/nojit-32bit-arch-fix.patch<br>
              index f308b4863..cc2673e74 100644<br>
              ---
a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/nojit-32bit-arch-fix.patch<br>
              +++
b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/nojit-32bit-arch-fix.patch<br>
              @@ -15,7 +15,7 @@ Signed-off-by: Khem Raj &lt;<a href="mailto:raj.khem@gmail.com" target="_blank" moz-do-not-send="true">raj.khem@gmail.com</a>&gt;<br>
              &nbsp; &nbsp;protected:<br>
              &nbsp; #if defined(JS_CODEGEN_MIPS32) ||
              defined(JS_CODEGEN_ARM) || \<br>
              &nbsp;+&nbsp; &nbsp; (defined(JS_CODEGEN_NONE) &amp;&amp; \<br>
              -+&nbsp; &nbsp; &nbsp;(defined(__riscv) &amp;&amp; __riscv_xlen == 32) ||
              defined(__mips__)) || \<br>
              ++&nbsp; &nbsp; &nbsp;(defined(__riscv) &amp;&amp; __riscv_xlen == 32) ||
              defined(__mips__) || defined(__powerpc__)) || \<br>
              &nbsp; &nbsp; &nbsp; defined(JS_CODEGEN_X86) || defined(__wasi__)<br>
              &nbsp; &nbsp; // See alignmentStaticAsserts().&nbsp; For MIPS32, ARM32
              and X86 DebugFrame is only<br>
              &nbsp; &nbsp; // 4-byte aligned, so we add another word to get up to
              8-byte<br>
              -- <br>
              2.17.1<br>
              <br>
              <br>
              -=-=-=-=-=-=-=-=-=-=-=-<br>
              Links: You receive all messages sent to this group.<br>
              View/Reply Online (#93761): <a href="https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-devel/message/93761__;!!AjveYdw8EvQ!NiRsOPLw04xoyb1GnwAGI71nxf0BouxYWeC06ggHQqeyQ9484jDSMX9G6aIO9WN7gSIkyA$" rel="noreferrer" target="_blank" moz-do-not-send="true">
https://lists.openembedded.org/g/openembedded-devel/message/93761</a><br>
              Mute This Topic: <a href="https://urldefense.com/v3/__https://lists.openembedded.org/mt/86756698/1997914__;!!AjveYdw8EvQ!NiRsOPLw04xoyb1GnwAGI71nxf0BouxYWeC06ggHQqeyQ9484jDSMX9G6aIO9WNP7I312g$" rel="noreferrer" target="_blank" moz-do-not-send="true">
                https://lists.openembedded.org/mt/86756698/1997914</a><br>
              Group Owner: <a href="mailto:openembedded-devel%2Bowner@lists.openembedded.org" target="_blank" moz-do-not-send="true">
                openembedded-devel+owner@lists.openembedded.org</a><br>
              Unsubscribe: <a href="https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-devel/unsub__;!!AjveYdw8EvQ!NiRsOPLw04xoyb1GnwAGI71nxf0BouxYWeC06ggHQqeyQ9484jDSMX9G6aIO9WP2-2Nt_A$" rel="noreferrer" target="_blank" moz-do-not-send="true">
https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:raj.khem@gmail.com" target="_blank" moz-do-not-send="true">raj.khem@gmail.com</a>]<br>
              -=-=-=-=-=-=-=-=-=-=-=-<br>
              <br>
            </blockquote>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------705E467B72D2F0AA95549EC5--

