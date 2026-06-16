Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C057CD98CF
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 11:11:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.151586.1781608304277396416
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jun 2026 04:11:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=RXqz3jEn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0627ac0107=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GADXOt2683725
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Jun 2026 11:11:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=Jwflb+q7h
	GjgmZCX7KvjB9lCgkSNnhPADL5X0ZHU+CU=; b=RXqz3jEnRZHD0QGSw1mLsnpXg
	V7YF7pp0TPMySLuBsnriJrCoiQfrtW+j6m37+OUDcYZLUYiTt1DvWBNN5VTwhz2m
	vWomawgVmI6w1Xy5W0zi+MKfNLTXcK5VNCobBFFTYzEUUVDzjCSKfKqQDxkpgDqT
	EpkPtUMZyGBNEYKL7Mlldq0CuLCh5fxRt0bHe30tgDyC+cIHje7Bo8GO6wkfhsue
	NE2v+/h5yU5zB9Q5Dh4HuLw088uV8TeekkIT9J/tlAs8qyuDUIC0sVw9l//UcVP1
	tEdvqxLcFUgd8wO6hKMshquiY0QUHJmoHEt7YTvI0vDcby4yjcDathOYYK2BQ==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013008.outbound.protection.outlook.com [40.93.196.8])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4erx63vmx0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 16 Jun 2026 11:11:42 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FurGu6X0YeH7EGG6RRRwEJMP1sqxpskkPlNmkym3tBlUwAwb989EM6GznfvbEHPUvqGTh93zXQDjSzHp+SG6u37jGv4JdXmjybzmLxisJWaJqCkNjmUmbGf0TsIDpLm2kpUP5IOulbiHhahsq6vQXETZvGSqOQCUQbZDm8tmDn6zi9SChmHw5IcYoOHRkqWq2PQTj5SCnP3vjb87mOl5wHbMFeAxQiLB2rme1sOxNHucUR4zC/8jh2ERjkgalxa4wCVmoNFbQSh3yHEvUec13ug3HlZ76yXzclPD+Hp0HiUTPamoS3e56j6wXe8zPjAqSTHgEta+eYHo0Gal15LxIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jwflb+q7hGjgmZCX7KvjB9lCgkSNnhPADL5X0ZHU+CU=;
 b=sVWK/zgrtAZ8LWVozGTwzKZIOZtq7sA/tttCyrl7HjbgztndA9NPYNkQbo/tM6LPEbH8cK5qW50cjaUlpKlOGrj1WLFMbCzQ+d8R+cjfHDXsFMYEmz0+qRa4qcOR7ZUTh/m6tDNe5sQR9p1bOhm4DOKf8OYgKDi9QOGh5b0+/60UN6WJFtDE0U4MoJQzqSfh9Lpmg9n30WnhtO9STtWEaFOCwnwWExMIxhmKfDzvgmYM7eAgreXEbQY8RBP5Z3MQ8L+sPiGfH9zi4ZIiz4ONwD5FUGq5PT3Bo9U8PJr01o7Ez1mtWWY4HV/j1vQW6R91SAo9L2E28n2KWNzL3UaOOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 11:11:39 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 11:11:39 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-devel@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Hemanth.KumarMD@windriver.com,
        raj.khem@gmail.com
Subject: [meta-networking][PATCH] spice: fix build failures with GCC 16
Date: Tue, 16 Jun 2026 04:11:11 -0700
Message-ID: <20260616111119.353590-1-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: DM6PR06CA0095.namprd06.prod.outlook.com
 (2603:10b6:5:336::28) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|PH7PR11MB7608:EE_
X-MS-Office365-Filtering-Correlation-Id: f0f7bc63-a5a2-45c7-6843-08decb9809be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|23010399003|1800799024|11063799006|56012099006|18002099003|3023799007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	MYKEESfd8YVR2+s+sDh8lz6m6PkquaKidSvGxGTDLXPM6JfLuy8eVTgrzQMUoJIo0gJ/RoLyYGOIa+Gtag63hnnCxRQh71xqqVr+Ac4SBMHbplsT3H1lKbrUAAASdFcRo8h80vSKwM7i0aRHYtPXeKb81FbNRSiJsEw0nlw6GWA5nneNXIy6r9wVNcCnGUETUKKjJ7He4hlt2FWo8XMjOKjaF31zmWdvd+ORnOtm5/N1qUFX5m5NSzB2I7e9byhVk2+irvGrv/MUxobTAchOHcHK5rbWv/ET0l/7KzpsydOQg2mxVSon8vhpCi+/D7sIs929oJ5z5zJ2pY+I5BzPoNvN7LtXqGsZY9Pjb34QSiyJ7zcHgGOgUURs6ptdi6sTUbJLoZeWzMtaPTOW6Kvc9dvKDg0rdPp1fU9mDeGk/Ua/NRQa2a7M7WYNgg+kTuhljgC62con3RvKW2ONEHrV5MZ+/RbARkKMBFja5lvqFb4eIi7f9vZDf/tXng6zhb4qdI2CEzGxpoQ1n6OuVjK985zuOFyo0PfKZNy7t+5Ag+OjyxitQpzpfucG2ALPU9ntVG2t30+ggmUUynezlF8wA6p35l8AtEOPgZe9LK/tvn5fTPj93GHXKwOOGVgUauz2bSX5Ho3ooNmR286fuuZqaD2AB3svhtBaNN57OtBIKreX/fheZpZbcb4HfCxNhFy6NYCkI62vUGRZQ1lKexm5pA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(23010399003)(1800799024)(11063799006)(56012099006)(18002099003)(3023799007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bXVMNUVUb1QwdXNTUDZmTmIxL2xDeWxnbk9KQ1pFUkJoK2FPMUZLMWpqcWph?=
 =?utf-8?B?NXR4enBUTTBRQzRXVHFybFFML0JKcUlhNFZmd3pubDArWVE2QktnU3JjSGpN?=
 =?utf-8?B?WWZrWml3YjUxWUpZNjJudjd3VTdiWkJiRXhzNnhpbFlJc1dYZlBOTUt3WFkv?=
 =?utf-8?B?Wm5FMU9lZkpCOFcxNG83bkJUd2ZvVzJuUytUVm1qRXU3OEFxTUZCdVlkd0dX?=
 =?utf-8?B?L241UDQ3ejRBNXErb0NTcE43UnkzK21vdkVWb0Y4YmRIUlJaV3hidWc5WGF0?=
 =?utf-8?B?YUdTeGhoeVBDenB3R3cya2hHVFNQN1ROSFhxeklGRmcwYlNacmM1cnFxRFl1?=
 =?utf-8?B?a2g1NlVYOG1GVlhuWUM0a3lpZlk2bGtzbEw1UWRuNk1MZVNkcXJjTmFRSlh4?=
 =?utf-8?B?bGlucFBoeHJTc2hHWE5pTzBzeFhJNzhYZytLaGpNWjQwRFZwTis2alhtRDJv?=
 =?utf-8?B?Z1FIM1pBSlF0OE9Gb2RYbEQyR3RaUEVGMmdyVGFLTnJSNEE4SlNsOGtlZHJo?=
 =?utf-8?B?MkhMV0RwYWMwRU1WZ3JtVXoxY1h2NWdpVmFhRFN6T1ZyRVF3UWxvWk5qWEt2?=
 =?utf-8?B?R2N3QmhYWWtJYmUvVnZORXR1WkY5WTdGUDFPY0cweHhmYXN5U3lwT2NzNGlk?=
 =?utf-8?B?ekNHdTc4K2pxUUp0cDZ0UUh1T0JpZ3M2Y0hHa1FFbG9KWVVPeFBNdXV2anVY?=
 =?utf-8?B?cFF0eUw1YjFyYjAvUWVvZ2ZIN0k5VHVRTXhWc01ibHVQbnBwSHVCZFArVXNh?=
 =?utf-8?B?MlhrK0hrSVRyakNWUzNiYnU1M1VuY3pXRFgxeXNrem15Z0k0KzFuYlMwbzZw?=
 =?utf-8?B?Y0JmUVNpcTV2TDhHZDNuWG81MTUyRG9VRUR2eXJjTnMrTFFCME9FZHY1Skds?=
 =?utf-8?B?UmwwVTQxb2huZ2J0NjRRQUNOTjFYN0hwdjUvdGYybm9YTncvamNqbit4UHVh?=
 =?utf-8?B?V2hBL2NkNjVNUHp0U2xVMUZIVm5pcFFqM3lGUFBpaURDMnRGbHp0QXRiQmlz?=
 =?utf-8?B?TEhrVC9kNHBqNEdJOUhMRVJodDZtMVMya3huN2VWclBuRExKQ1dubzl2WGtS?=
 =?utf-8?B?eWhRTjIyT3dudGFtbkx2V0Z5MXlGYzhWcksrOWhBS0ZKYjhPb0VSSisveE9S?=
 =?utf-8?B?MWRHdjdBVjltRVlibTlBVUIwRlVLZTEwa1J4OEtuUkMxb2w2YlNqTS9SQzht?=
 =?utf-8?B?NkNQbENja2Y4bktsODlpeklIMEJoQ3BDNk5QOFlyYzZ6K3NjZmI5OEFXNlp6?=
 =?utf-8?B?TFBVTlZqaFRtMURyTzAyMVErNUhRdnZQbGIvQkpsb0tMWkZqenJmOXdqckx5?=
 =?utf-8?B?eUlVekg0RG40VDdtUlJVQmlUMU9NMVN5RWlQaHl6ZG5WZlM5RVBEaHZWcmNp?=
 =?utf-8?B?bEp5MlcvT2ZNaGtQdWhRYzVWVzA5anVxbndtbU53dXkxWmhlTmk1Ui9teWJ0?=
 =?utf-8?B?RWNYQkovbkZNTGFkTHNUUEJFLzk3OUUreUh4SkFlbi9EVHpESmdEYmVmZTM0?=
 =?utf-8?B?MExrTG9oSWJ6UHV1UUQ0a1VTZVpJR29mQWlkWWp5MVBJV3M5Sk5hVTVOYXVL?=
 =?utf-8?B?a3F5eTNOZ0hzWnhLeHJwNXBmQjd1bHhpTVY3bTRHRVZiUWZ1NFdNc1lxYXBF?=
 =?utf-8?B?VjVhaU5ucjU3OVU1RjhHN243ajdvZCtjNDAyUFpqQ3V2Y2NGNC8yYXJZNy9h?=
 =?utf-8?B?blBkclhUZlk4Um9hWkk2eTNHaTRJRjZ4Z0dlRzZGbTBYRjd0dzRMKzZtaHhs?=
 =?utf-8?B?OFM4bklZeEVqNkhMVEZOcDVRVlExR212ZzRTcFNHQitWWjB6cGk3enJIaW5V?=
 =?utf-8?B?SkN0Q0EwR1B6MFNyYVBkeHJ3R2ZkenlLQXlGMCs3akJIZXhHK1htUStZK1Uw?=
 =?utf-8?B?aUwvbHd0YlVUNHZjN2RNbnpYN1NzcFZKbWVEOXFlVUNnenY0U05HYkJpNkoy?=
 =?utf-8?B?RXV1cEZhMloyczFqQngyeWEwK2U0ODF0MWdYc1JZYU5uVlc5Tjlkd3R5b0Ju?=
 =?utf-8?B?SWFWc2tlNEJ5Y0dUMFpvVVV0cVdkNTBMekRtY2xyUnRQY3d0NVdyS3ViVWFj?=
 =?utf-8?B?ZjQwa2tmMFRVOGxnTDMyMytWWElON2hTNGY1U0RhTzYzOUNybDl3ZU9IOGFq?=
 =?utf-8?B?YWQ5OElkU0tIN2NhUmNjWXEvcnZzVktUNWFxUGJ2WUR0ZmNpVFQydWl1dW8w?=
 =?utf-8?B?TzdDMXhic1hzYnpHcURoSFU2L3h2eFVoc2sycDk1OFNYVVFPMk1teVFNNzlh?=
 =?utf-8?B?Nk1nNHpZdExLUTVIR3dLOWJSQ1E2UXp6UjlKb3JPVE1CeE9EZ1lJeWUrNDZJ?=
 =?utf-8?B?dldyN2RFMFIwS01WY2sxaU50N21NdnVBT3ZCWStneVNicnlJTlppR24wTDAx?=
 =?utf-8?Q?tPDBTsa3a9R7E0vs=3D?=
X-Exchange-RoutingPolicyChecked: 
	rpMGPKjr8ByetZaTqOoaOeY2p28Uw/xXzOX9NESYFuXkUjQQ4bHvfcp/ikE+PAFo9ycWQFaLb9DJ1rd/mFHuzFl72i4Mbd4EeKCMEKhsH9eGgaEX2ADjNC/xyJTeGMuqgHTZI+KBh5WHY6E4WMqqhg1ZKOaXeq/y8Drn0RshUCZUEt5vW94cB6HQkAp1Arhg9fIpM1bZjtTLhWU42P1x0qlLyCrHNYXDW3CwGNQfVXNwP8IiKZ7sG62b73tPciSj9C6i+Q5AqA88jKU+w9IGMtfrQ7t7YOkHkYjh8X9+/y030tDNkoy5vU5oOTq2aXf7jD3f3qf1xASTm2xUbvV87A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0f7bc63-a5a2-45c7-6843-08decb9809be
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 11:11:39.3946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VLnrEtUXpKKG55OA/cVX6eFI6A5BlgnOXKIO+7KnRJrmk9bZWznYUTn70aJSj8DDCj8EqCec8LWxk/dx+CvttxLGynQrNUrdIX7kkcO/+vc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7608
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=SvmgLvO0 c=1 sm=1 tr=0 ts=6a312f6e cx=c_pps
 a=espmfoAAVKQgPoIy+vmhGg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=e5mUnYsNAAAA:8 a=Vt2AcnKqAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=TNeYYD2DdU8XiU4AbmYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Vxmtnl_E_bksehYqCbjh:22 a=v10HlyRyNeVhbzM4Lqgd:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: BlvCQo4Xw2ughLO626sfw3McXX-FGwMZ
X-Proofpoint-ORIG-GUID: TAoED-T4IAE43fQuPj5fJEtoKjvbxDCi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDExMyBTYWx0ZWRfX1Rlf+DM+geDD
 u3q8FRTyFwA+US4Q8D2pocChW5XA4EQGyxFN/AFxtbRI1X6qbwU90T51iU3XdSbidmIZIhaNhPL
 NF1SO9cmB8xIFD6ysfXvYNYiu5GLM6gyn0PT9W74mjNO8c5v1UnEv9Ctg2fjd5kbrHOPtE0ixEn
 8Ei5bxkYqIiJO1Mykd349seSmsTTHPZlDI9cEMGPRWHxtclrppyK++it0pmS2xEQiaTrNRO6+zA
 ZPyrL4VWK4ZGDiBERL58hTfFzzLMyG+xZCDJZKV/ycHx40nLPAhy157HZ1eoeqXAbRrnmB/RNPs
 hXwU2YJO93GYfwEZHAw9ZGEO42wc8MzmXYPVbKEILdBPnrLB6BxjjUjieN3h3sEW7zVDwnl0+Es
 DWnrHzp5c/IgJ69JdsP4pDXbEg+sjxpO18BQzf/JXT9UOJKyyaabjA8Quz5rRGshlD+VaxgNXj8
 IkMDhJNNQ8YE0hpJGiQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDExMyBTYWx0ZWRfX8/CjWOwnN9Md
 +viWS6c59ql0tIRs2MypOQhe6GyBN52oaGj7a1vLwz15jWPVFQB8FCymYSPRV8ZfDLJB/MeZw7i
 McDEdeLXujeL8NAI0LHCecru31CVMh9vcaU+ity58EsjIjkBksHG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160113
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 65GADXOt2683725
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Jun 2026 11:11:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127620

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

GCC 16 defaults to C++20 which enforces stricter designated
initializer rules. Add patches to fix the two affected test files.

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 .../0001-test-gst-Fix-compilation-error.patch | 48 +++++++++++++++++++
 .../spice/0002-test-display-base-fix.patch    | 34 +++++++++++++
 .../recipes-support/spice/spice_0.16.0.bb     |  6 ++-
 3 files changed, 86 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-support/spice/spice/0001-test=
-gst-Fix-compilation-error.patch
 create mode 100644 meta-networking/recipes-support/spice/spice/0002-test=
-display-base-fix.patch

diff --git a/meta-networking/recipes-support/spice/spice/0001-test-gst-Fi=
x-compilation-error.patch b/meta-networking/recipes-support/spice/spice/0=
001-test-gst-Fix-compilation-error.patch
new file mode 100644
index 0000000000..2d9e92924a
--- /dev/null
+++ b/meta-networking/recipes-support/spice/spice/0001-test-gst-Fix-compi=
lation-error.patch
@@ -0,0 +1,48 @@
+From a904cd86430aa555a50730e9389e210637a546c1 Mon Sep 17 00:00:00 2001
+From: Frediano Ziglio <freddy77@gmail.com>
+Date: Thu, 29 Jan 2026 08:28:16 +0000
+Subject: [PATCH] test-gst: Fix compilation error
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf-8
+Content-Transfer-Encoding: 8bit
+
+Specifically:
+
+../server/tests/test-gst.cpp: In function =E2=80=98TestPipeline* create_=
pipeline(const char*, SampleProc, void*)=E2=80=99:
+../server/tests/test-gst.cpp:566:41: error: either all initializer claus=
es should be designated or none of them should be
+  566 |         { NULL, NULL, new_sample, NULL, ._gst_reserved=3D{NULL} =
};
+      |                                         ^
+
+This fixes https://gitlab.freedesktop.org/spice/spice/-/issues/96.
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/spice/spice/-/=
commit/a904cd86430aa555a50730e9389e210637a546c]
+
+Signed-off-by: Frediano Ziglio <freddy77@gmail.com>
+Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
+---
+ server/tests/test-gst.cpp | 9 ++-------
+ 1 file changed, 2 insertions(+), 7 deletions(-)
+
+diff --git a/server/tests/test-gst.cpp b/server/tests/test-gst.cpp
+index 5d920d7d..19ad879b 100644
+--- a/server/tests/test-gst.cpp
++++ b/server/tests/test-gst.cpp
+@@ -561,13 +561,8 @@ create_pipeline(const char *desc, SampleProc sample=
_proc, void *param)
+         return NULL;
+     }
+=20
+-    static const GstAppSinkCallbacks appsink_cbs_template =3D
+-#if GST_CHECK_VERSION(1, 20, 0)
+-        { NULL, NULL, new_sample, NULL, ._gst_reserved=3D{NULL} };
+-#else
+-        { NULL, NULL, new_sample, ._gst_reserved=3D{NULL} };
+-#endif
+-    GstAppSinkCallbacks appsink_cbs =3D appsink_cbs_template;
++    GstAppSinkCallbacks appsink_cbs{};
++    appsink_cbs.new_sample =3D new_sample;
+     gst_app_sink_set_callbacks(pipeline->appsink, &appsink_cbs, pipelin=
e, NULL);
+=20
+     GstBus *bus =3D gst_element_get_bus(pipeline->gst_pipeline);
+--=20
+2.49.0
+
diff --git a/meta-networking/recipes-support/spice/spice/0002-test-displa=
y-base-fix.patch b/meta-networking/recipes-support/spice/spice/0002-test-=
display-base-fix.patch
new file mode 100644
index 0000000000..a0df6a430d
--- /dev/null
+++ b/meta-networking/recipes-support/spice/spice/0002-test-display-base-=
fix.patch
@@ -0,0 +1,34 @@
+From: Nicholas Vinson <nvinson234@gmail.com>
+Date: Mon, 08 Dec 2025 00:33:52 -0800
+Subject: [PATCH] test-display-base.cpp: adjust designated init for C++20
+
+Adjust designated initializer to be C++20 compliant. Starting with
+g++-16, GCC will default to the C++20 standard.
+
+Note: v3 was acked by the maintainer on the spice-devel mailing list
+in December 2025 but was never merged.
+
+Upstream-Status: Submitted [https://www.mail-archive.com/spice-devel@lis=
ts.freedesktop.org/msg53355.html]
+
+Signed-off-by: Nicholas Vinson <nvinson234@gmail.com>
+Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
+
+---
+ server/tests/test-display-base.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/server/tests/test-display-base.cpp b/server/tests/test-disp=
lay-base.cpp
+index b220b7fe..5d0404c9 100644
+--- a/server/tests/test-display-base.cpp
++++ b/server/tests/test-display-base.cpp
+@@ -806,7 +806,7 @@ static QXLInterface display_sif =3D {
+         .major_version =3D SPICE_INTERFACE_QXL_MAJOR,
+         .minor_version =3D SPICE_INTERFACE_QXL_MINOR
+     },
+-    { .attached_worker =3D attached_worker },
++    .attached_worker =3D attached_worker,
+     .set_compression_level =3D set_compression_level,
+     .set_mm_time =3D nullptr,
+     .get_init_info =3D get_init_info,
+--
+2.52.0
diff --git a/meta-networking/recipes-support/spice/spice_0.16.0.bb b/meta=
-networking/recipes-support/spice/spice_0.16.0.bb
index 6ae63091b3..3d7788f749 100644
--- a/meta-networking/recipes-support/spice/spice_0.16.0.bb
+++ b/meta-networking/recipes-support/spice/spice_0.16.0.bb
@@ -15,8 +15,10 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cd=
d255951079008b364516c"
=20
 SRCREV =3D "a6668fff651726e5d4cfd52cbf8669540970452c"
=20
-SRC_URI =3D "gitsm://gitlab.freedesktop.org/spice/spice;branch=3Dmaster;=
protocol=3Dhttps;tag=3Dv0.16.0"
-
+SRC_URI =3D "gitsm://gitlab.freedesktop.org/spice/spice;branch=3Dmaster;=
protocol=3Dhttps;tag=3Dv0.16.0 \
+           file://0001-test-gst-Fix-compilation-error.patch \ =20
+           file://0002-test-display-base-fix.patch \
+"
=20
 CVE_STATUS[CVE-2016-0749] =3D "fixed-version: patched since 0.13.2"
 CVE_STATUS[CVE-2016-2150] =3D "fixed-version: patched since 0.13.2"
--=20
2.49.0


