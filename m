Return-Path: <trevor.gamblin@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D5D1C433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 13:14:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.11373.1635340494108187874
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Oct 2021 06:14:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=f5fexo8T;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=59349ae857=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19RCEnFJ020166
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Oct 2021 13:14:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=content-type :
 message-id : date : subject : to : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=HYSR3rLSiUNiCFmyBP8iFnKjVfQLVVAHz+MQ1sQ5UnU=;
 b=f5fexo8TlVCHZPgE14NPe0LS2BopMALV1qaLqi55MnUTSOjgYAjCzwSk0FZ5I/rLd/yz
 uWrpnnYWoWIhsf5DSr7oY5bN/9OY9x5PsIRKX+SzgeHlJI8VGcMaqvSgVIwuEn9fxNrM
 ztnPnLMYNI12TRUQNDzdnTf4Z6iKtvyRlg1QrKIyt/SDuyu/z75KcnkR8ci8MZzRmY5b
 Oq5H3w4Qbw8KzLefHhO9esl7Le3uWGFiN88I456AotodWzIpnTxG6z21C+mnOcC270/a
 EOccavvYh83Ss9QdwQ1Dujn/+8/zqu0zPYD5bXuo34vnS00w5grUTWCCFceTqaxZDsmN Pw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bx4egsj97-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Oct 2021 13:14:52 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19RDEqbw027764
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Oct 2021 13:14:52 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bx4egsj95-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Oct 2021 13:14:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OrNG9WATzG4xtFKydSEiAa0L/MZLm+lTH0Liq/5toaaxLgFz8iOWdjLHiNO/AqiI+gvDK5saCiCqAgmfFgZRkS/EsE/8yRmAPl7vFnwUf8huOJy5cZCIHXcn5k+sLFDLgfl1O+MrK2iHXsXDLv5kvQJhcXT/L+dRhbCKGm3BdNsjZZtImbHPHpio7VQw3pZrjdcrPseupZGUVCvwYgsTSq/kPXhHZoRhN7YKkFI26fjyTUhGtehpj6FO6zg9jlVnTnWENqkyNkg4nHEiEZdLZFXmzCFAgW25vQyPXsYyjU3XCTW6ggeA329ShyWNUrZLGpm+GhGBT8vPJJhBOkJeWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HYSR3rLSiUNiCFmyBP8iFnKjVfQLVVAHz+MQ1sQ5UnU=;
 b=kh3ekE7w2cLwvIdBO6SvOK8PeKVlivzy57lJP0uexDZM8ModCeA5ue/XPOHM6BwfIEe6HYS3Y9zGtlIySP6TEkvD02p9eOPbMWsYbG2Ku3Gx8AmjtVhoj1MR7VzQNxpUSrZCzR4Pt9BKpC16CuGkDEtJUQnc5iJan1dMJC9Lz/mV07u8ntnKCX6osi+kxesSOJ9qKTP6JoUZ4U8NUIqEO6VWCu3NoOcvO3mKHFLua0CPCsnnSuHE10t8r8apGjQzRpbNP3qCT5uLvCv1+xFZ/S87+36UjE+j0WIhq2dCyy9FZLViNFCAczjsd8BpusK+Hs9JTtRJKUfjoXV5qZaC9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: fujitsu.com; dkim=none (message not signed)
 header.d=none;fujitsu.com; dmarc=none action=none header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB5134.namprd11.prod.outlook.com (2603:10b6:a03:2de::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Wed, 27 Oct
 2021 13:14:49 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::ccb2:28ab:f000:8440]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::ccb2:28ab:f000:8440%3]) with mapi id 15.20.4649.015; Wed, 27 Oct 2021
 13:14:49 +0000
Content-Type: multipart/alternative;
 boundary="------------6Azl3P413IOXW9N3vp7FoTAk"
Message-ID: <42091199-14ed-d977-8554-ecb4bdc8a6a7@windriver.com>
Date: Wed, 27 Oct 2021 09:14:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [oe] [meta-python] [PATCH] python3-smpplib: upgrade 2.1.0 ->
 2.2.0
Content-Language: en-US
To: zangrc <zangrc.fnst@fujitsu.com>,
        openembedded-devel@lists.openembedded.org
References: <1635355510-112311-1-git-send-email-zangrc.fnst@fujitsu.com>
From: Trevor Gamblin <trevor.gamblin@windriver.com>
In-Reply-To: <1635355510-112311-1-git-send-email-zangrc.fnst@fujitsu.com>
X-ClientProxiedBy: BN0PR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:408:e6::10) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
Received: from [IPV6:2607:fea8:c29d:d7c0::60cb] (2607:fea8:c29d:d7c0::60cb) by
 BN0PR03CA0005.namprd03.prod.outlook.com (2603:10b6:408:e6::10) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18 via Frontend
 Transport; Wed, 27 Oct 2021 13:14:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e99e0516-8e39-496c-e1b9-08d9994bc0f9
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5134:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB5134B4E238C31AA360DF88669F859@SJ0PR11MB5134.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yFl0MFwVAn40rxoJcFkzqmvIsWg78N5G27rCS4OGWAKdldmNnTWcwCt+1IVvqqkNS7aEYyTmveISCDoFs5VzKoz0iaUIAo7Aa9YhUGAxyGT5u+J8IEzWwNxtX1GhNDGkURFKQtRc6dYacDKuOrj1mrcZL1Iw6uQZQ62+5jeFWcnazBPNLiys3sz/GpIGxXfm5mJjRRlurOykPy1K9t5/v6cEReNezIqPJJ7LDzuKdA+SYEYRzHV3TAXLPmLYEoFVFurjIJdnj1HuF4wvtZb9qDNyKb6cHnIZkfuJ96AKWbR1KgnBJr++llbwEFxT33Kei6zbwN1YboJOeJPSJ9Abt5KEnjcr5Tx34iR97eGfxvEUaxR4GRArwW/zQQ1PE7ln5uQqgWqJk0whNc+Q1SVVBhMJmEwbrHIm4MIfrbyi46Ec13Oz1I0NAK+C/VsS85VLV9Wq6VZSD1ON2JwXK/R+e3kBh++wKZFg3eHhbOZxSukbVQO4sr0UnFZoC5EsZK/Y6noGAUC/lm7F9/KUuXNKEQ4mxXKNztQFH2ZJs3Fil0jMTh2wB87+fX6UwmeDiH/9NJalv6BbhN5iIAL5tEHWtys5q6bFfKmtoBPMyBnA+Mxrc6dWRVo7/lXcw9RgjvTWCXAtabAzr2kZAHs6oQyohKp9e84IUVjsQNPRAMrPTc5miwgXVXeWK9O//MSYL9vCZWso3T+jWIfIwJzhCuQWOVEIxKGAIzXqjYfwxi0QI508B1C52zOM2PWJFgY5nR9rNAca4UBbZcRQOYGLTo4O2S7ob5TfRGVdEmB5x9B/m1n+o7q4wfWMHYptmkGpgCaqtkT4L9Bv/Bo/s7i181p1g7YtcgYbRf5LrgVeb5sKWaYMCqFbc5UX5/00PMILGSsr
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(33964004)(2906002)(2616005)(508600001)(966005)(53546011)(38100700002)(66476007)(66556008)(166002)(66946007)(4001150100001)(36756003)(83380400001)(86362001)(31686004)(5660300002)(186003)(8936002)(44832011)(8676002)(6486002)(31696002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cTVRb3RIbWFVUnZYdFdQUnNwcDBQWVVLRG9GM0Q0U0VuRVU0ZEtrVWRGRGJG?=
 =?utf-8?B?T21pUS8yekJ3Q09Dc1NpQmI5NEQvTGc5aWRUcGRSMnp6Vmd0bjlIZjdCWFUv?=
 =?utf-8?B?VFVsVWxCZVh2eHU1SHhoR3hrSHVwUWZwci9jUmpYMlhvUlQ5V3pTTnU2ejNj?=
 =?utf-8?B?dHNNcnpIRGc0cmJSUi9iL09tK1RRU3h1eWRUb0ZybGUvUDRCZSsyRXhSNUVE?=
 =?utf-8?B?a2lzeGtkcVNCVVZNb09DWDZXQy9xa2xxUnFDSVF0WllWdk5WcVk5WDdvL1ls?=
 =?utf-8?B?Um83ZERIOHJydDRWT1FFNDFCazR6a1l0VGMwUk1MUSsydU10TVFjVi9MTjhE?=
 =?utf-8?B?bElrRFlMMStrTHYrRnpmaGVBcktURGZXOGR2NU5MdXNGNEVxRUlXVjdPL3ZF?=
 =?utf-8?B?YjlURkl0MTRnbytTOW9KNThiRDRPdHgxcllnTlJFaDRmZERZY1Nyc01PMU04?=
 =?utf-8?B?M1Y5WkNGeWROeS9UNnNpdGNUSC85amh5bmh3ZnlSSnYwOU5GL3NXU0FRdXBn?=
 =?utf-8?B?NVZFd3BKWmxNTDZqS0laWUZXSVliWkNldGo4cWJTck5yNDRSbWJQQThRaDBX?=
 =?utf-8?B?L1YvdFEvd3Jxbmhha0FkRTNkMCtGbWZCZWRQWk85dG9lZmVJQjdXdkxLTWlL?=
 =?utf-8?B?Y2g1WHU1MS91UkxyUy9tREk3bWowRDdHTWNJVVoxaW1zTkt4b1AzcU14TTMy?=
 =?utf-8?B?cGpQZlJvMnpqYUNtdmdTdVZSQ0ZBZUhOL3g0Vk9DU21rQ3JHWjRNNlF4WVFI?=
 =?utf-8?B?QUtKU29SK1JPVW9JYW5GTWlCS3hoRFNYMFVHT1RRZE0xLzZTa21QM3FaVWFt?=
 =?utf-8?B?Vld3Q09ycUwzRUtvSGRhTzFwS09nUVJIL3Z2UnZ2Sktua0gxQVQxaDZ6VzZH?=
 =?utf-8?B?N2ljZGxyd1pMQSttZjFzakZXOW4vSXRnbS9ydFI3TDJIcTErU0ttN3JFM2VT?=
 =?utf-8?B?TXM5TWpCQmQrbXBTd2sxMWliWjJwTEc3R2duUExlNG8xL0FYQko0WHE3dEho?=
 =?utf-8?B?MmJlZHpDK0x2aEJadnJrYnd5bjVqZTFzclZJZXJmekM4NVVjcWpXUk50dnIw?=
 =?utf-8?B?aVlkbWh1bC9Sc00rVi9vVUFRYWJWN0puUjFUdjBjekdGUXd2TThtSEc0K0NQ?=
 =?utf-8?B?UzdWZEFRMCtHOENLWC9tNGZ2N0huZGNFSTdsRHNJNkR4N0ZVWU55OFlxSWNq?=
 =?utf-8?B?T2pmeVNtNXE0THd4U0ZBTmkrSTY3OENhWUhxRjBxNGxCWEZVeWpkZWJMYTB5?=
 =?utf-8?B?VFNuY2pUZkhMYTB0dzBreWpPOHpqcjlMd3V0aXQrTXlUNnhPVWJUZ2s3SW5D?=
 =?utf-8?B?N3dKSzYvM3NPMXF3bVp6MmlneFhGYTFqNWNLaEljY0h5ZmVENHMyNGxYZDEv?=
 =?utf-8?B?OGJxOFM2NS92dWxiSUtucnpOeEVvZkhaQ29UVXoxUHlncGVMdkFtazBsb0Mv?=
 =?utf-8?B?eWFQVlZ4YTlUa3UrQUFYU1pBWUsxVE15dytsY05OYTM5U2tIa1RJeURKUElR?=
 =?utf-8?B?MmdHUXE5R1NjcUhhNnpIYWR6Nk5YZnJiNTFTdFd0OTNOb0hvdUowWndkazk4?=
 =?utf-8?B?M0NDaEdFV2w5UDJGRVRoclBwbHNPSTJYSURnL1dORGZ1R2VDVXJaOTMvZE5O?=
 =?utf-8?B?ZmNaeEdJQWVoYXhzYVBkUkpSTzJpR0NxTWJpOGNQWGNmV0lXTW5BV0pVVFE2?=
 =?utf-8?B?clJlOFhRMWRZU2tWbWlaZW5GbXFWTjRjNHdja280UmRhdElVeFEyYjhtNnFT?=
 =?utf-8?B?d0xMYmY4L2IrbytCUUo0dCt6SFUvblBtQjhyUTd2QlRMY2FqdTBKVjFRU2p6?=
 =?utf-8?B?SGdnZi9RQ0YxdTMxclFodmpYSXIzMEhwRG14dWJKSTdRenlYNDJsNXhKVDFl?=
 =?utf-8?B?dU1oN2dZMHVqQUxGS3VuSG9QbE82bm1WQTBkVFAraWJOdlVoY2ZDNm1jL2FT?=
 =?utf-8?B?QnIrc1RETDlFM3ZZbXRscHU4MXVjNjdUYmwxWTNJdyt4Y3lDN1ZIWjkveitW?=
 =?utf-8?B?WDZIWmE4WWQ5VURMZ3dpelUvelJyS2xxZVo2MUZKWmQvVTVwTEg5Y1hJNnFi?=
 =?utf-8?B?T3ZwRUthU1FYQmhLNTBtcFFOcmg5TE04dkVabDRDOU9GeUx5ZFFIRVkyLzQ2?=
 =?utf-8?B?UEthMnF2aXNxc1JMcjFFSnFlbWlDbUl1bG5oZWk0bnRMdTB3dGRzT1RNOGF3?=
 =?utf-8?B?aldJMmF6alN2eXZXVDlJVkM1QTRudzhUZnFTNC9hTjEwOHdxL0RKRmJSRFls?=
 =?utf-8?B?bi9rOCtkdkcrWmdWQmI1dFpzbHNGTGZZaFI5cnd3WlYyYzNNa2lqUWV0eFdP?=
 =?utf-8?Q?TP7EEmn71QaYfK8isb?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e99e0516-8e39-496c-e1b9-08d9994bc0f9
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2021 13:14:49.0893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Jb6hfygj1zB3zgD2ngfhRTMaIhhavmJqz5TdW/CAMJCV0U453ySbFzPE2Zp4o365PZPgzOnV1Oh7ei+HpuZ7QuSd1qb3f7LUxr8w0RrUbr4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5134
X-Proofpoint-GUID: irb0xL7XZO3vyeTH-UeHt4memmbjBuX4
X-Proofpoint-ORIG-GUID: IU4UseqCXhlsp_D8I-D7_P0DtmU-_cwU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-27_04,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 suspectscore=0 clxscore=1015 phishscore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2110270081
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Oct 2021 13:14:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93630

--------------6Azl3P413IOXW9N3vp7FoTAk
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-10-27 13:25, zangrc wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> License-Update: README.md is modified as follows
> - client = smpplib.client.Client('example.com', SOMEPORTNUMBER)
> + client = smpplib.client.Client('example.com', SOMEPORTNUMBER, allow_unknown_opt_params=True)
>
> Signed-off-by: Zang Ruochen<zangrc.fnst@fujitsu.com>

This fails on the do_install_ptest_base step:

ERROR: python3-smpplib-2.2.0-r0 do_install_ptest_base: 
ExecutionError('/home/tgamblin/yocto/master/poky/build/tmp/work/core2-64-poky-linux/python3-smpplib/2.2.0-r0/temp/run.do_install_ptest_base.1725908', 
1, None, None)
ERROR: Logfile of failure stored in: 
/home/tgamblin/yocto/master/poky/build/tmp/work/core2-64-poky-linux/python3-smpplib/2.2.0-r0/temp/log.do_install_ptest_base.1725908
Log data follows:
| DEBUG: Executing shell function do_install_ptest_base
| grep: Makefile: No such file or directory
| cp: cannot stat 
'/home/tgamblin/yocto/master/poky/build/tmp/work/core2-64-poky-linux/python3-smpplib/2.2.0-r0/smpplib-2.2.0/tests/*': 
No such file or directory


Can you investigate and submit a new version?

> ---
>   ...python3-smpplib_2.1.0.bb => python3-smpplib_2.2.0.bb} | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-smpplib_2.1.0.bb => python3-smpplib_2.2.0.bb} (64%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-smpplib_2.1.0.bb b/meta-python/recipes-devtools/python/python3-smpplib_2.2.0.bb
> similarity index 64%
> rename from meta-python/recipes-devtools/python/python3-smpplib_2.1.0.bb
> rename to meta-python/recipes-devtools/python/python3-smpplib_2.2.0.bb
> index 56d8f9eea..ac7945f4e 100644
> --- a/meta-python/recipes-devtools/python/python3-smpplib_2.1.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-smpplib_2.2.0.bb
> @@ -1,10 +1,10 @@
>   SUMMARY = "SMPP library for python"
>   SECTION = "devel/python"
>   LICENSE = "GPLv3.0"
> -LIC_FILES_CHKSUM ="file://README.md;md5=56a03d0ce7e492d4b9487b8aae957efe"
> +LIC_FILES_CHKSUM ="file://README.md;md5=8b4e2ac8cf248f7b991784f88b630852"
>
>   PYPI_PACKAGE = "smpplib"
> -SRC_URI[sha256sum] = "df4139a279b35fbb42a58f2a254a9c6daf362b04a7f94e208dc120e0b8a3fd4b"
> +SRC_URI[sha256sum] = "3d513178a35573f66faac4ef2127c4bd73307ddb463d145b17b013cf709d9ddd"
>
>   inherit pypi setuptools3 ptest
>
> @@ -12,6 +12,11 @@ SRC_URI += " \
>           file://run-ptest  \
>   "
>
> +RDEPENDS:${PN} += " \
> +        ${PYTHON_PN}-logging \
> +        ${PYTHON_PN}-six \
> +"
> +
>   RDEPENDS:${PN}-ptest += " \
>           ${PYTHON_PN}-pytest \
>           ${PYTHON_PN}-unittest \
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93620):https://lists.openembedded.org/g/openembedded-devel/message/93620
> Mute This Topic:https://lists.openembedded.org/mt/86621585/3616776
> Group Owner:openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub  [trevor.gamblin@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------6Azl3P413IOXW9N3vp7FoTAk
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-10-27 13:25, zangrc wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1635355510-112311-1-git-send-email-zangrc.fnst@fujitsu.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

License-Update: README.md is modified as follows
- client = smpplib.client.Client('example.com', SOMEPORTNUMBER)
+ client = smpplib.client.Client('example.com', SOMEPORTNUMBER, allow_unknown_opt_params=True)

Signed-off-by: Zang Ruochen <a class="moz-txt-link-rfc2396E" href="mailto:zangrc.fnst@fujitsu.com">&lt;zangrc.fnst@fujitsu.com&gt;</a></pre>
    </blockquote>
    <p>This fails on the do_install_ptest_base step:</p>
    <p>ERROR: python3-smpplib-2.2.0-r0 do_install_ptest_base:
ExecutionError('/home/tgamblin/yocto/master/poky/build/tmp/work/core2-64-poky-linux/python3-smpplib/2.2.0-r0/temp/run.do_install_ptest_base.1725908',
      1, None, None)<br>
      ERROR: Logfile of failure stored in:
/home/tgamblin/yocto/master/poky/build/tmp/work/core2-64-poky-linux/python3-smpplib/2.2.0-r0/temp/log.do_install_ptest_base.1725908<br>
      Log data follows:<br>
      | DEBUG: Executing shell function do_install_ptest_base<br>
      | grep: Makefile: No such file or directory<br>
      | cp: cannot stat
'/home/tgamblin/yocto/master/poky/build/tmp/work/core2-64-poky-linux/python3-smpplib/2.2.0-r0/smpplib-2.2.0/tests/*':
      No such file or directory</p>
    <p><br>
    </p>
    <p>Can you investigate and submit a new version?<br>
    </p>
    <blockquote type="cite" cite="mid:1635355510-112311-1-git-send-email-zangrc.fnst@fujitsu.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...python3-smpplib_2.1.0.bb =&gt; python3-smpplib_2.2.0.bb} | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-smpplib_2.1.0.bb =&gt; python3-smpplib_2.2.0.bb} (64%)

diff --git a/meta-python/recipes-devtools/python/python3-smpplib_2.1.0.bb b/meta-python/recipes-devtools/python/python3-smpplib_2.2.0.bb
similarity index 64%
rename from meta-python/recipes-devtools/python/python3-smpplib_2.1.0.bb
rename to meta-python/recipes-devtools/python/python3-smpplib_2.2.0.bb
index 56d8f9eea..ac7945f4e 100644
--- a/meta-python/recipes-devtools/python/python3-smpplib_2.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-smpplib_2.2.0.bb
@@ -1,10 +1,10 @@
 SUMMARY = &quot;SMPP library for python&quot;
 SECTION = &quot;devel/python&quot;
 LICENSE = &quot;GPLv3.0&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://README.md;md5=56a03d0ce7e492d4b9487b8aae957efe">&quot;file://README.md;md5=56a03d0ce7e492d4b9487b8aae957efe&quot;</a>
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://README.md;md5=8b4e2ac8cf248f7b991784f88b630852">&quot;file://README.md;md5=8b4e2ac8cf248f7b991784f88b630852&quot;</a>

 PYPI_PACKAGE = &quot;smpplib&quot;
-SRC_URI[sha256sum] = &quot;df4139a279b35fbb42a58f2a254a9c6daf362b04a7f94e208dc120e0b8a3fd4b&quot;
+SRC_URI[sha256sum] = &quot;3d513178a35573f66faac4ef2127c4bd73307ddb463d145b17b013cf709d9ddd&quot;

 inherit pypi setuptools3 ptest

@@ -12,6 +12,11 @@ SRC_URI += &quot; \
         <a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
 &quot;

+RDEPENDS:${PN} += &quot; \
+        ${PYTHON_PN}-logging \
+        ${PYTHON_PN}-six \
+&quot;
+
 RDEPENDS:${PN}-ptest += &quot; \
         ${PYTHON_PN}-pytest \
         ${PYTHON_PN}-unittest \
--
2.25.1

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#93620): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/message/93620">https://lists.openembedded.org/g/openembedded-devel/message/93620</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/86621585/3616776">https://lists.openembedded.org/mt/86621585/3616776</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:trevor.gamblin@windriver.com">trevor.gamblin@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>
--------------6Azl3P413IOXW9N3vp7FoTAk--

