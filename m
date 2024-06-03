Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFB95C27C44
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 02:05:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.73744.1717380327066819188
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Jun 2024 19:05:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6884dc6aeb=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4531qjoV024124
	for <openembedded-devel@lists.openembedded.org>; Mon, 3 Jun 2024 02:05:26 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yftm7sadj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 03 Jun 2024 02:05:26 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45325PAv009034
	for <openembedded-devel@lists.openembedded.org>; Mon, 3 Jun 2024 02:05:25 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yftm7sadg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 02:05:25 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U0W2yS+lls9WQwhhboBkS7PoHNSfHwbG4ZEwy2ZLrJ/zLWW4T65cTHunhdi/kuo93tzRzEVUcceT1dF3QYI3zeHjt0alTuE9GbY+nMhgoREU/Ga7ZlR9URZ5q3k9/NQaS8KypUO9V0W5zP49hD1y2fGXQWxLT7VE3leObVOkkKBysYdh2BQ3L6azlbNL+DEB12DiSOOq6xoJhu4wgoH15dhGXUvCXMCh/Jhdq+hGtNwlr/d6Ba8GE4CHeHp7ZdIXi1htN4N6vjIvypmEm2yY5gtPjOGLSLWVNtrlOem8P4sslUefAVEbC2N4uR02r0Qpw2mX+m8Gb++yfofTV7cAEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=weQLk5CGEXdQdnETg0+N+8VJ7PgWB99n8P1uybPiWY0=;
 b=oQ8AKopK59GhohsauxFrbm5Ie+mqinMYdO+tKgh5tDLAGFnxDf/kg+ZKHEHFbWiKSx687h7dev4AumSF4i/A7TgZLLfuH3Gn7tgypBwfzxeyWgYxsluZbD31xXAoXj4CAhxCB0U4T17kzYbRD6T0Z5zoqDE9nJ5ezwlbtSnK/DkyH+LR5/qcnEl1GeLzwoArKrGB3qfqUo8ihF4KTQdf7jSy4Mh9TfO7fYvMsA2gfKha/ZSmVB0tZfsQkX3eYVNy48Yxr58ldx94izj0lshaoeD+q199RdehLNCTeAUHduI1YXCcB+5A8n1MpcZpSexWSwTdTy3Cgr4TmuXPQ/S/mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MW3PR11MB4571.namprd11.prod.outlook.com (2603:10b6:303:59::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.24; Mon, 3 Jun
 2024 02:05:23 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b03a:b02:c24e:b976]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b03a:b02:c24e:b976%4]) with mapi id 15.20.7633.021; Mon, 3 Jun 2024
 02:05:22 +0000
Message-ID: <c4e95827-99d5-4cda-8ec8-43b07962f771@windriver.com>
Date: Mon, 3 Jun 2024 10:05:17 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][PATCH] python3-dasbus: Add ptest support
Content-Language: en-US
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>,
        openembedded-devel@lists.openembedded.org, raj.khem@gmail.com
References: <17D39E8F83C96086.24533@lists.openembedded.org>
 <17D42418D28165F9.18539@lists.openembedded.org>
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <17D42418D28165F9.18539@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCPR01CA0133.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::14) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|MW3PR11MB4571:EE_
X-MS-Office365-Filtering-Correlation-Id: 07a248a3-71b0-4130-c2bf-08dc8371a064
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cDlLZndiL0RKMzZqOHYwUElOQmpjcnFpcWp6cjcxbFhpeWxFTnkwOWlXck90?=
 =?utf-8?B?YmdQR2d0K3VpWW1qeDNZS3pJaU10TnFDZXNTY1BFYkpOSTZ0Mm9hdlRZUHVN?=
 =?utf-8?B?QUJoMGR6aWxrNlhHckp3QVJvVTIzaVZHQ01nNm1aOXZNZXJ0WUJlSGdRT2JR?=
 =?utf-8?B?MTB5TmRhVmlkekxYNWdNYUpCcXFCblh2QTljWlBYVGZzUi9ZYjhFbkNHUDA3?=
 =?utf-8?B?ZTZxQ2w3ZzFXVnNhWHpGT1lOTnZoOWJqNW5GN3hnaHZWT0dod0VaRk9MVFRW?=
 =?utf-8?B?R1lZeUJkTGtkb3J5cGRzZmo5cXgvUkxiMGdjYTRSWGUvVHltd3BCaWtLWUF4?=
 =?utf-8?B?RURpL1huY1liSW9Xc1YzL2ltNEI3VVRqZWFmTmJiK1Z1QVJMVEE0WUNyMXM1?=
 =?utf-8?B?SkdUMEw2VWNBQjR2bVB3c1J2RFhaVWlVV1hOcGcvV1VjTXdEZ05KdTAvQXFM?=
 =?utf-8?B?SkdLbnJTdnZaREt5YlgySHduUGtNaHg0cWpaZzg0MzBHb21lSG1TbXNhdlF6?=
 =?utf-8?B?NWdUS2hoS1dnK2QwMXhGOVlma25JODVva3ZhaHdBcXZXV3hYR1U5SlJickw1?=
 =?utf-8?B?SXRmaUxFRkpiNWxsaVBnOHd1ajBWMFkwa2JxMTdFeDMwUXIzM3NBRjk4bmtq?=
 =?utf-8?B?VDM4eDhuRU0wMXcrU1hHTVVqUTFQeGh1MkNPZ3NRdE1ueDhmSHl3ajdjRHpo?=
 =?utf-8?B?ZHh6KzFIanNFVlRKQmthSVVWV3ROalZ1Vkd2cHNHRHQrODZaRENIN2RvTVNT?=
 =?utf-8?B?NmZvUnFNVi80bk95V1RWdVJISU5LcVJXZFFLMndkeGd4WmhteDBWZXJ5QzZQ?=
 =?utf-8?B?L3VQNjRIVXlJblJQbnlzKzY3YlBvNE9keDZNZnRRWTkybC9qY2ErV2xHb3JS?=
 =?utf-8?B?OTlUVFdFNE5QMzZ3V202NnlNOUVFM2FOUnRYd2R0bjk4b1VISW1oWjV5YXdH?=
 =?utf-8?B?cnk2Zm5rUkRkTEpEMWZGYVpvNEpKS1cySVl3a2F1RzQzZzA3T1BoeFhqZkRw?=
 =?utf-8?B?VW5IdTcrTkp5dU1heTVxdnV5MUZiZHRnN3Z2bURtOGR1U2JJNEhoeGFuQnRJ?=
 =?utf-8?B?aTNTR2NIY3FHTlYvYXNRSmhGTXVGbVBzTlVDNU9zZDczSW1JQVRnTjFjSUNR?=
 =?utf-8?B?ZmpNczNOQTJMUFV2Z3ZyVjloVUZBRk9LZFl4YlFCRXhtQk85UWdBaCs3Y01y?=
 =?utf-8?B?TkRRRkk3RURNQnJpenpObVJGK0w5Zm5YRXFRTnMrQ3R2bnJRZStLQWxVN0Yz?=
 =?utf-8?B?NHgwSHROdlhsYWxJa05aam11YUZkQWg1WFVWT1N4TGtwV0xJcm9xV0E4a0RH?=
 =?utf-8?B?TndpUzloWU5iR0VBdDBGTXZqbXdUaGxkQk4zN25QQ29lOGtGK3dvTkVIaW52?=
 =?utf-8?B?K2t3NmhaeFZ2VE9QbXorWklqc3I1ZDhVZWdTQ0pTNVRwbFlMd002L2hWd1A3?=
 =?utf-8?B?K1NvSzNHM3dCcEZiTStkdUJSRkp3VHNEL3ZaM3F4SUJRblkyc2d5Mkc0UHBO?=
 =?utf-8?B?YUpNT25JRjJGYlg4WGFPekZjcnoyaDVVcDNyK1NiTWtYN3JjY0FuSm5xYjJC?=
 =?utf-8?B?OHZ6K1FWQ2M4WDlyOTR1L2lBV3pCQ0pWNStESVFJWGl6ME1wZkpXNEVHRTJI?=
 =?utf-8?Q?m0TI9gHtWerks3OT2pQ4g+HlGH/YlhllzP0qEzjH7kj8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dVo2aXdJK0RvMEVuL3BwNkg5Z0ErYitia05lUDZnUU1mckxrOWpuZlJoR3lt?=
 =?utf-8?B?Q0tBcG5qeUVDSVlyd2dpVUlJNnZrRk9FZmxjTFJwWk0wRzE3Rkc4YWRqNUp2?=
 =?utf-8?B?ZVJnbGw5RlBjWGEwbnRNU3A1dktacVhQV1A3L20yenJGQ29CVlllbjNSZFEx?=
 =?utf-8?B?WXIxSy9hQ1BzSGp1Mm9lbFNWRUM2UGswTDluT0lYRkVRaDdoMFhsRnhVbFBE?=
 =?utf-8?B?VVhWVDg5UWU2K0ZIMmc3c2VjMXlaZkNpaFpMYmUxbDljVlB5Z0RURGw2ZE1a?=
 =?utf-8?B?NU01WDZZREpJcWRRT0J1UjNudWwvWURZclVHUE1hdXRHdnRKVHNkMkJKUU1z?=
 =?utf-8?B?NXF5Z0lPM2pCRXUyQ3NzQ3RMYSt3SUNhb05RQjRWQVJYQ2FBVUw2dlVvN1RG?=
 =?utf-8?B?TnN3QUZOZlRUd3BWVXVGaTNHbGMyRFdUb1lMVXVDM3Nya1ROazlaWXZDMnV1?=
 =?utf-8?B?UnJDNXRtTEVXZHBYMFV4emRoWnhZeWhjck5KNlZyekEwaW9JYXlKZkZlMUE1?=
 =?utf-8?B?dFJxcC9qbmowSUp6M0ZBZmx6ZHBOZUFKVGovR1g2REczQWFwWHBkYm1wWWdU?=
 =?utf-8?B?WjVVdHVaZmxQazUrOEQ3K0k2SG0vZXJ0UzhQbWFtZEtKQ2dHVjNmc3NsdUFu?=
 =?utf-8?B?VGJKNHgwQVdqVjdBZHZsM1I2Z1lPei9oekVRbnhjaTFmWTNWcm9OK1V5Wlhm?=
 =?utf-8?B?S3NmMEh3TWRsbWRNVTNwMG9LK2VsLy9wc2tkVTlQdFpLMWVkZW4vVE1WK2M1?=
 =?utf-8?B?SFJKV25qbm9iS01xM0lVdldOUE9jTzVoNmhxdkpTQTkyU1pEZ3BsL1lQN0Vi?=
 =?utf-8?B?R29Ed3ZjZ0JMNUFTZWtZZUR4dS8zMUhWeXdNSjRrM2oySWYxV2l3TDRKNlhm?=
 =?utf-8?B?YzV6cVM4MmJsUUE0RkMvTm5hZitJcnBPZU9ydFdYSGQrd1NxZWhkLzhGOVA3?=
 =?utf-8?B?MzZJWUJHVm9GUHVqUjNwK3QzNFhYazBhdmNxcEZRTERXSzkwbzZ6R042TnJP?=
 =?utf-8?B?VVUydHFCaFo4a1l6bnMvSFl2WmlKL3RzdUZ2UTFVTUZxOUpGaFBLaElHT0pK?=
 =?utf-8?B?cW0xcVdDL29HcFZxMTh6THZaUjRBemRWWGJUQW9ka28vb1lPTktEenBWMjZ5?=
 =?utf-8?B?RjdMak9nSVkzdTVnTnRacTl6S0lpWXRQdytId1hwQ0lIcEdrdklNWll2UVQw?=
 =?utf-8?B?Vm0wZHhQNmJXdHVmcnV4dzBDRFF6K3RJYy9rVDVISS9QWnAyQnNzWStoM0ox?=
 =?utf-8?B?TU5kbEdld2dkZ1dDS0xTTGdpMDFKbW1mMFU1QVFOelJFWEJmczZKcm1HVGJp?=
 =?utf-8?B?b0lXd3l5c0FVYitXNzFKeWRVaktORjQ2SStrNFBYRmZRaDJyUnZVZWM3Tmlo?=
 =?utf-8?B?UXVMVlhneDJ5R3E3c1BTd0w5RjF5VlJxZEkzczhRenFNWTRHTmZKckp4cHk0?=
 =?utf-8?B?QmJjVHZTQmY2aXZOSXBHZG5vY1A1VlZpcFRMSXVwS1l3WFg3eS9Nc2Z0K09G?=
 =?utf-8?B?VUw5L1NMUDhEQVNXN3Q5MWpJYmk5L3VtelRTc1VoWkdPL0R0dUhPcnZ2ZnhG?=
 =?utf-8?B?VXlONFJqQVVPVUNpNzJGZmVaQlZYdG1kVkVsZmlvYUM0bUFSMzA0NzJRaXJO?=
 =?utf-8?B?d3dic3B0SzBMcmZacGlBNHZRTE5ySm54eEY5d0gyTWI3NE1pUlEvTGh6cnRi?=
 =?utf-8?B?MTBsek1KR3E3bU1abVQ1TjArbnlocUtOSWFSTi85ZmV5YWdBak1TSDVNMXhK?=
 =?utf-8?B?R3JhVUJvNk1JYksxcEtMMW44K0JFOG9pdDNHM0YrRmhiY1FlQUxJeFRXUE5F?=
 =?utf-8?B?emFFZ0Jvc29UNEl2ekxsZnlSTGFzSnZSMFJKVnZSS2tSWU04dWgvMEpWY0cy?=
 =?utf-8?B?NUxJcGVqNFR0NXNTTTdqZWJmTDVTUVh2M3grem9DcFNaWGh3YnRhZE80YzBx?=
 =?utf-8?B?OHJuRVlmMlhhUzlNeUlwSEp3N0RxSE1xODVZQm52bUZucGJvWGd0eStCcTdW?=
 =?utf-8?B?VkVlS1NPMHVpdW9IVEFOL2g3aEZ1azBOMVJBbVBLUnNtNVp5Uy9Qb0RTcGIv?=
 =?utf-8?B?UHgvQTNBTHJtM09CYWVCaWpUaGltY2ZYMmJkSE1CaVJJWWM5OVVCUCtlY3dN?=
 =?utf-8?Q?BU/8+JgE1HDQfbPgFX1QjtES/?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07a248a3-71b0-4130-c2bf-08dc8371a064
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 02:05:22.7328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: db3XFBN2ojYZIpReMnHLYyQnpO7w+Y/N1dPMC5HMtCLHmhaulFQfVFotfPMsWByPEm/JXk6xLrfHYFoIVKoB7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4571
X-Proofpoint-GUID: svqGKJ-1vy24cvHiuIqM5rXuLZw6nRMf
X-Proofpoint-ORIG-GUID: pk19PeHQ8qEHxuQrTutQqxKP9vpWf4NI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-02_15,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 phishscore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406030016
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Jun 2024 02:05:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110666

Sorry to disturb! Just a reminder in case miss this email.

Thanks,

On 5/30/24 10:44, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
> 
>   #./run-ptest
>   PASS: tests/test_client.py:DBusClientTestCase.test_async_method
>   PASS: tests/test_client.py:DBusClientTestCase.test_error
>   PASS: tests/test_client.py:DBusClientTestCase.test_interface_proxy
>   PASS: tests/test_client.py:DBusClientTestCase.test_introspect
>   PASS: tests/test_client.py:DBusClientTestCase.test_invalid_method_result
>   PASS: tests/test_client.py:DBusClientTestCase.test_method
>   PASS: tests/test_client.py:DBusClientTestCase.test_property
>   PASS: tests/test_client.py:DBusClientTestCase.test_signal
>   PASS: tests/test_client.py:DBusClientTestCase.test_variant_type_factory
>   [snip]
>   ============================================================================
>   Testsuite summary
>   # TOTAL: 162
>   # PASS: 162
>   # SKIP: 0
>   # XFAIL: 0
>   # FAIL: 0
>   # XPASS: 0
>   # ERROR: 0
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>   .../python/python3-dasbus/run-ptest           |  3 +++
>   .../python/python3-dasbus_1.7.bb              | 19 ++++++++++++++++++-
>   2 files changed, 21 insertions(+), 1 deletion(-)
>   create mode 100755 meta-python/recipes-devtools/python/python3-dasbus/run-ptest
> 
> diff --git a/meta-python/recipes-devtools/python/python3-dasbus/run-ptest b/meta-python/recipes-devtools/python/python3-dasbus/run-ptest
> new file mode 100755
> index 0000000000..8d2017d39c
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-dasbus/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +pytest --automake
> diff --git a/meta-python/recipes-devtools/python/python3-dasbus_1.7.bb b/meta-python/recipes-devtools/python/python3-dasbus_1.7.bb
> index 3efa961713..d1d294a284 100644
> --- a/meta-python/recipes-devtools/python/python3-dasbus_1.7.bb
> +++ b/meta-python/recipes-devtools/python/python3-dasbus_1.7.bb
> @@ -5,11 +5,28 @@ LICENSE = "LGPL-2.1-or-later"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=1803fa9c2c3ce8cb06b4861d75310742"
>   
>   SRC_URI = "git://github.com/dasbus-project/dasbus.git;protocol=https;branch=master \
> +           file://run-ptest \
>   "
>   SRCREV = "413cf9a0b7c231468f1d28d9a29dd8dd8bda15c5"
>   
>   S = "${WORKDIR}/git"
>   
> -inherit setuptools3
> +inherit setuptools3 ptest
> +
> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}/tests
> +    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> +
> +    # Remove the problematic cases
> +    # https://github.com/dasbus-project/dasbus/issues/128
> +    rm -rf ${D}${PTEST_PATH}/tests/lib_dbus.py
> +    rm -rf ${D}${PTEST_PATH}/tests/test_dbus.py
> +    rm -rf ${D}${PTEST_PATH}/tests/test_unix.py
> +}
>   
>   RDEPENDS:${PN} = "python3-pygobject"
> +
> +RDEPENDS:${PN}-ptest += " \
> +    python3-pytest \
> +    python3-unittest-automake-output \
> +"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110621): https://lists.openembedded.org/g/openembedded-devel/message/110621
> Mute This Topic: https://lists.openembedded.org/mt/106381958/3618448
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [mingli.yu@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

