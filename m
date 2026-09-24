Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFCACC98304
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 05:09:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.839.1790224966044816437
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 21:42:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=QQlQ8Hb5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3727adf27c=himaniramesh.barde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O4U941041446
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Sep 2026 04:30:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=flQEhf9khuGRSqweMeu+X0
	6s+fxucF8OSto6BNc9WbU=; b=QQlQ8Hb5Huq0DUsxk0rxOB0bhE5hNlfs1idYXK
	9jmjAmxi53HPBBGuqlSrjmFhurEFqyHK2wjgqhKvylvUTUWHQTZdYForJ+JMiMEE
	3CGORlETlPwLfFQ60BhvL08/9tpr8UkcCzFtsPrsj+A+FuJPzF6zRdOA9IxWWCqw
	OXhAKaMDw9ET7sSt2UY6uahgbF1h3p/+PS/Nc7AowYjcymdcPE/fJ0mClyfX0x7D
	gB/Mv4xOlb7UuHiV1N0mDneu48Deoq6sAXZrvxdkFQIQ06MQILqHV8uqJKNTom3Q
	uqzV7r7MgFse+AHX3EItltRGU4J9igyn4NKSvI+F+qYJ5HDA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021101.outbound.protection.outlook.com [40.107.208.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gup35m13r-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Sep 2026 04:30:28 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JRqxoPA9ZShRoYE2ykDbxmi/prd0zfdPqE0j9+z/FXHuVpGmnNhrPdoCO1rx/VF9tGtfdRHwYk1IoS5XDrPnIvPwYbIWwEGHUyWC0hok5dduwbFPG33Ng9yE8dADgULgG5Qsre821TdF1K+Tq9Y9pkshBP8WWivVwdsLtWUv0ubPu8FiXKmcElsfhsFXFGRdC1yQ2nUe8GuSpkpqb6KZ6ElW2Uf+YATemyFptH0e5QxGaPPMqi1QDDsGSLGVErQ4n9+wevdyap8nvZWTOUxPk818SJlaMNChl2NkQVoLIfwjOWmcSqLUcUtB74I0rB1WJxRfcCYMbcIMRE6EG3R+zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=flQEhf9khuGRSqweMeu+X06s+fxucF8OSto6BNc9WbU=;
 b=LMtsmaUAnmuGJ4EoeVfjCrEeN2tr9jrt2U3Um900GhIUws1zzDMfGkJovaQO/4UQurUaVVhrAZV9QH8bTqFhaqi6ob8TzlSxsvhXiBt3BsbPm5e0Uqj1dTXMrb+lJWF9W6UsBviqHpGB/0MEM0lFLUgn10ym9ofARR9o6b0WswFKPkOecKKYUxHyBJkPI/QBNwhyMNLyyBnQMDd+xvBBs7xpEQ2BNoS2kEhJRgd5wtfQIjY6gOCCV9+hGCdRzuBFdPV5lLYTaBfLmFsjmt4Y3WkdvE1G+gSJ+JibdNjCKJS2/GPYRfVwA18vHPeOJ3DfhQ38v+As3ZKuuYbiFVWCxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8774.namprd11.prod.outlook.com (2603:10b6:610:1cd::15)
 by MW4PR11MB5799.namprd11.prod.outlook.com (2603:10b6:303:181::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Thu, 24 Sep
 2026 04:29:01 +0000
Received: from CH3PR11MB8774.namprd11.prod.outlook.com
 ([fe80::8925:311f:7018:b3ec]) by CH3PR11MB8774.namprd11.prod.outlook.com
 ([fe80::8925:311f:7018:b3ec%6]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 04:29:01 +0000
From: "Barde, Himani Ramesh" <HimaniRamesh.Barde@windriver.com>
To: "MacLeod, Randy" <Randy.MacLeod@windriver.com>,
        "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][scarthgap][PATCH] postfix: fix build on hosts with Linux 7.x kernel
Thread-Topic: [meta-oe][scarthgap][PATCH] postfix: fix build on hosts with
 Linux 7.x kernel
Thread-Index: AQHdSyjeMENYwg+kj0SSYHs/j7DDibbcIIEAgAECxcY=
Date: Thu, 24 Sep 2026 04:29:00 +0000
Message-ID: 
 <CH3PR11MB877402A1FF9C57F85AE9FFA78F812@CH3PR11MB8774.namprd11.prod.outlook.com>
References: <20260923065746.2542154-1-HimaniRamesh.Barde@windriver.com>
 <95aa82fb-9bae-4d4c-b244-7b0e44b9fcec@windriver.com>
In-Reply-To: <95aa82fb-9bae-4d4c-b244-7b0e44b9fcec@windriver.com>
Accept-Language: en-US
X-Mentions: Randy.MacLeod@windriver.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=True;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-09-24T04:29:02.231Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=1;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8774:EE_|MW4PR11MB5799:EE_
x-ms-office365-filtering-correlation-id: 72b81fa6-a048-42a0-4ddb-08df19f45b9f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|10067099003|56012099006|22082099003|18002099003|8096899003|11063799006|4143699003|13003099007|38070700021;
x-microsoft-antispam-message-info: 
 ropisSBKMzL1Z+lBYtEJCzXGb65MfCtv+uG035xstnEr2H6xJttjYpahRlA0AK6kx+D9vOpmTLeo80hwEy0MNv1WmBCyuDdAtccpXLIUxR5lS2fFxRWmBKfzSJW+Cxbtf0fS9syQJ//7NeekSrGwcoBaVYojU5/zYG9Fix31MOev2fjdNMubktO3MPUaV0Mf+i3Oa54D6LR1JZPFEPqMO7Pt9dPb1Ssu8Seb+++FrruWHpRBcrhaPBGeAvzYlrRKTuvVHo125A3XFOvZh0BxYG7nMbmwhlT+ONC7lJsyuZpB2hSOgB1+X9ufbYPOYgcIKMimcuAuobnr9OIL3WjMUK/yb9seRcdQSoxTvqNF6EOJX2GZkvrbQoDuaA0EIv48sEomzeih7td8tJuJWX2sPfGhQj9QziOjf+5rYrFVH6+yU0ovoPk6A8cUIoSl2S32dVt4oXpb65FvxktrX1+yUu+RRczECoiYGlB2wegn2zLalSpFrSg5AMNR7IMUHvtjJA2tAoKMJeyNNzsU/Zm24mh1qqePRdFwf5CIEMAXzPLFLQnMP2ZzxANmzDNhY8aP9mE7ZEEwO7rIe5P2DXfiIjsgZ6eyBKUPPDXmNo7/NrQdF8WdyxvpkkCx2lo36h/mVnDZSYmi3wr4YDJfL9BH+XJCnu2eKwcICXS1q7K7n9w=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8774.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(56012099006)(22082099003)(18002099003)(8096899003)(11063799006)(4143699003)(13003099007)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?S2Kl2DPr6RRIZDmq7+I/dRRa7mLbElloqIyW4XDYhYfW7LT86+9H29L4kP0g?=
 =?us-ascii?Q?GT3HfWTRTMITZ07O+j7Xz8s9jLMgeaVsnaJQtBYRwiCha943BCPkCe7fzM77?=
 =?us-ascii?Q?6SygKR2hUZDizcjIlx6DCwSgYXTqDB0GfwLSe3N2TKIPcgcteKxmvEd5suWw?=
 =?us-ascii?Q?+Jrz3rOwkzC4hIBrxKlrzeDGcsS3KmSWZG0kgsyJ4CagPK1CAN2Vcr/HDp1n?=
 =?us-ascii?Q?GSO5JftStFzYU1MgrVcMmoxCxC0Sq2Z+303IQf+nO4lQ17w7lWldTyM6UGrW?=
 =?us-ascii?Q?HWz+MQxllfFhCxFdWSgZU0Y3i21UchGNnbCTAROEN1+7VBpoo9b1sep43QyL?=
 =?us-ascii?Q?UJ2Tj82TPYnSuYgV5RLQyuOsf65f5Zu8X+L4Jjq3fkU7GBmR8Bh/qdHzsQqx?=
 =?us-ascii?Q?bpP3dR9OgJoZJVK/T7jODIkN0kWYwNjiYihYp4WCAF7qXcSc/RCPskhohezh?=
 =?us-ascii?Q?aL6yswkJmacxpnAeLl27oyF08CC/qoC5hkoLPlRUS+s7H05cfpk2wPW8HGAa?=
 =?us-ascii?Q?yDdJTl4JZstAP86884nNwDZ6jZBGLdVWsCUUUNGN9JedWgWgBmkFI2yPGJYB?=
 =?us-ascii?Q?rSAjlXd1RC9vTEIbIDI2ZrKb2n584kxeJyGFBvTIkAQ/cC2S+xWkDQTSgGSN?=
 =?us-ascii?Q?jzM3BVmahB/NWUiZBLWLG3LVa1OZNr/Iiov1g2jjbYIjGBdCZLPRS3OKRPzA?=
 =?us-ascii?Q?gANq6bVTb56FuAcCev/pc7yYnaI9bH7sLwVQ7UXtmEqIs/fViIIBMjYuf4GP?=
 =?us-ascii?Q?nUNBv243WsacyQ7tT7nSTXXmAq8riM2It3ZHB/7P5jmRyskWe/+Tvc2kRlmU?=
 =?us-ascii?Q?l46TrSnjEwUZwqat36WgxWwS4QWXSiE75YNM7FoLBiXFFfE0GSfWw4dWxRWX?=
 =?us-ascii?Q?zd0EQlh0Pemp/Azfjf1EXt8k7boFrb8Zpr+t7rGsJnCuumYYriCZZHAUjvqp?=
 =?us-ascii?Q?/fUhdXeENhjq7v5ZCwl+TtW5LnoZfvrgEOEjZ8SJbZRt85ccCd6N9NR2VnX5?=
 =?us-ascii?Q?1nYyRKBLYLyh+4ciQnZGrO3kQWs7hYC8oazZhHNtSLu/wcL1HFICImYWw3bp?=
 =?us-ascii?Q?b5GGit5IlCAF+oJ47OtvvYbnr8ebJiEEKodTtLXXg5wdZVg/ik3vT2497MAG?=
 =?us-ascii?Q?FF59gb/EqQJ5gObGVX/4dnhi4Vrhemx+IdrqUKIPZUCiFLicIwhbn/cCRZg3?=
 =?us-ascii?Q?Ff8me7Wb6snXOi5iia0JZ1gggcww79gyVLoj+iGvLno+0ZCikqCgJQQqp/s/?=
 =?us-ascii?Q?04uHuLbJnABCv7eMwBJq7uyaBboHuAUh7HVcywlI0k03r9RzjzKPOQdb2Tip?=
 =?us-ascii?Q?09/eqJgNrXZQb2b3LSPkHxCjMJ0r4lmvwYVvI/S50Apzv+z0oOO3358IuU3m?=
 =?us-ascii?Q?VMWw+9ovTMJCQ3QFcwDERIgRPm6LFaHLjYlJYaFf34A+e6mxB3x4IiLqi1af?=
 =?us-ascii?Q?ob+4ST5M6sZUK9QaV/oxpjYJ5bk4HZ9AJ+vcLFykWlPy2fYEPgNf0XjKrAOJ?=
 =?us-ascii?Q?xOdDOPRvj/v7VNDFXG4Wg1QvJ1mjkjunB42TjT3qpkzuokO0Eh9ptKgrFOPi?=
 =?us-ascii?Q?5HbyKdRMN5zgtyIH6HCTgCQPzCMxujr2XGTGjjtEh3rgT0S3vnEvPllABfTn?=
 =?us-ascii?Q?69S0UQqL2TiKFw3ZKkeGknR2uyVrENFtropvPJGSQ1APe8D0i3xMmlnILySo?=
 =?us-ascii?Q?Drbw0qENFthdzGznMGfuljj2KUkY4blp8U8iR1YQKzGIu9x5FsOYFiwF+1hi?=
 =?us-ascii?Q?iBFB/d/EukfSzbgdZ/m8ga4E9ne+m3c=3D?=
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	A+bOcmjHNZrU3LtdHBzTYQ8zTv7D/49dPSP1UW5k8uHi6khuuPIhx2cLnIYARHpD8LyumKt2z3pQTjdyKPK//tG2u1Enb91lmlPw5PexLgVnbAdOwzjj5mOsHTo4+otSB+fjLXWaaqghk7EFt+Q+9o0gJD5weFGD/ob+c3g92NTXMAcknNTn1Yo8j0a6ATNWF3VinmuLNT/RcqM5p8GPITtAh4XMVWmRnMmfXoAzkHeI1aAT7q9MQWTRFT6Zar80jjbRBBYtAcS3Dzqv8ECEidfwhCbeKBEQNWEvYF9QrkvsthMdHwNWbT4qbTYiLgEM8wxGG89IguCgH4yGCrUunw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8774.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72b81fa6-a048-42a0-4ddb-08df19f45b9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2026 04:29:00.9630
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dmTVytoS8EGHwwKpWIKJMyNjzLhXDOQxVfDu58hzBRNd0p4tCqL/OXYoYE2DKqZmCBdXIC/o++oZk6MBkX80pzu4OFrEl6g8oF0x/72flgi6W8wZ/8HgPKMXXbEUJfno
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5799
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAxOSBTYWx0ZWRfX0DNw4+KtfIvR
 f8vL7t48GS1a/VE9v5MB5aDfT42GZM1YvniRZrENFxHp9cV18B7pVwi93t6wvqkzKhynZDqAksz
 UYLgtgaS2e4cZ2+GfqOdX4FQLhB44/6jBUr18TfVmOBxTWLDPx1L
X-Proofpoint-ORIG-GUID: reIXGdNSbga_kpz0JqaErrXIXnqB20zi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAxOSBTYWx0ZWRfX1nNZQnPMBIZ6
 qy6f24/cQ6VBJFau9jv5lB407GDDMqbbOtFIczd2MxCsHY0Vcb4OQROuzb+P8+htJynrvibx6Tq
 x5CmkSH4HL9r5vChqLylaKQ14zTWrW8LKYWAmg909Ea/M1gbaxu4YCKtITn+pTlEfKyeuJLO1Wc
 +6HN7Y4nhcHIGhPPggJ3/Swaw49eHW8cYAGvs78NuhQCURv9RnPLx/N1Hk6BURmtFX/Y0TzI8HL
 9GL2sP8sBrcF7lo644p+zIjYF4D1VpPX1CH5x5n+dzj9mQzNLRcVgyGOEpRcxCqdXJg6GDIL09m
 Ko0kPpqyGvIfYmp9ndjSzRs2yrbcfy12Sb3v1mBamq/wtYCneFw84TkMVzvbMtb0umCJmNSA0dA
 PtVE05QJ9lVNInXSIQKQI0fbHk6l4RVuufRNp3kesHpBbMcK+ETzvGR0QkQ9bmfOQ1fmEYHhETO
 yb4CJ9QeCtIsZFGtIxg==
X-Proofpoint-GUID: reIXGdNSbga_kpz0JqaErrXIXnqB20zi
X-Authority-Analysis: v=2.4 cv=DKMacCNb c=1 sm=1 tr=0 ts=6ab4a764 cx=c_pps
 a=y0MURNDS5CvtOemsVNO2Rg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8 a=VJYubktbAAAA:8 a=e1GkridNAAAA:8
 a=xFqJ81N7J6HzUrvyHbUA:9 a=lqcHg5cX4UMA:10 a=CjuIK1q_8ugA:10
 a=fmFwp709OShXR98OT6IA:9 a=EXXdPIk_Xu97-mXH:21 a=frz4AuCg-hUA:10
 a=_W_S_7VecoQA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=OqWDEjY5HwswFcA5adJo:22 a=6ft9yNkZjdd813gQxDxM:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0 phishscore=0
 adultscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240019
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CH3PR11MB877402A1FF9C57F85AE9FFA78F812CH3PR11MB8774namp_"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Sep 2026 05:09:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130273

--_000_CH3PR11MB877402A1FF9C57F85AE9FFA78F812CH3PR11MB8774namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello @MacLeod, Randy<mailto:Randy.MacLeod@windriver.com>

wrynose already has it - Changqing Li's "postfix: make it can compile with =
linux 7.x" landed there on May 15 (postfix 3.10.x).

This patch backports the same change to scarthgap's 3.8.19.

Thanks,
Himani


________________________________
From: MacLeod, Randy <Randy.MacLeod@windriver.com>
Sent: Wednesday, September 23, 2026 6:29 PM
To: Barde, Himani Ramesh <HimaniRamesh.Barde@windriver.com>; openembedded-d=
evel@lists.openembedded.org <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][scarthgap][PATCH] postfix: fix build on hosts with L=
inux 7.x kernel

On 2026-09-23 02:57, Himani Ramesh Barde wrote:

makedefs only recognizes kernel majors 3-6. Hosts running a 7.x
kernel get "Unknown system type: Linux 7.0.0-..." and the native
build fails. Add 7 to the version match in makedefs and sys_defs.h.

Already fixed in postfix 3.11.

What about wrynose which has postfix 3.10.x?
  https://layers.openembedded.org/layerindex/branch/wrynose/recipes/?q=3Dpo=
stfix

../Randy



Upstream-Status: Backport [postfix 3.11]
Signed-off-by: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com><mailt=
o:HimaniRamesh.Barde@windriver.com>
---
 ...kedefs-Account-for-linux-7.x-version.patch | 47 +++++++++++++++++++
 .../recipes-daemons/postfix/postfix_3.8.19.bb |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/postfix/files/0001-make=
defs-Account-for-linux-7.x-version.patch

diff --git a/meta-networking/recipes-daemons/postfix/files/0001-makedefs-Ac=
count-for-linux-7.x-version.patch b/meta-networking/recipes-daemons/postfix=
/files/0001-makedefs-Account-for-linux-7.x-version.patch
new file mode 100644
index 0000000000..4bc59ace7d
--- /dev/null
+++ b/meta-networking/recipes-daemons/postfix/files/0001-makedefs-Account-f=
or-linux-7.x-version.patch
@@ -0,0 +1,47 @@
+From 5466d510dfbc2b7a81dcf766f83d2c89066c0446 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com><mailto:changqing.li@windri=
ver.com>
+Date: Mon, 11 May 2026 18:16:07 +0000
+Subject: [PATCH] makedefs: Account for linux 7.x version
+
+Major version has bumped to 7, update the scripts
+
+Upstream-Status: Backport [The latest stable version 3.11 already fixed]
+
+Refer:
+https://www.ftp.saix.net/MTA/postfix/index.html
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com><mailto:changqing.=
li@windriver.com>
+---
+ makedefs            | 2 +-
+ src/util/sys_defs.h | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/makedefs b/makedefs
+index 74b103d..fe8c618 100644
+--- a/makedefs
++++ b/makedefs
+@@ -625,7 +625,7 @@ EOF
+               : ${SHLIB_ENV=3D"LD_LIBRARY_PATH=3D`pwd`/lib"}
+               : ${PLUGIN_LD=3D"${CC-gcc} -shared"}
+               ;;
+-    Linux.[3456].*)
++    Linux.[34567].*)
+               SYSTYPE=3DLINUX$RELEASE_MAJOR
+               case "$CCARGS" in
+                *-DNO_DB*) ;;
+diff --git a/src/util/sys_defs.h b/src/util/sys_defs.h
+index 70aab23..c5472eb 100644
+--- a/src/util/sys_defs.h
++++ b/src/util/sys_defs.h
+@@ -763,7 +763,7 @@ extern int initgroups(const char *, int);
+   * LINUX.
+   */
+ #if defined(LINUX2) || defined(LINUX3) || defined(LINUX4) || defined(LINU=
X5) \
+-      || defined(LINUX6)
++      || defined(LINUX6) || defined(LINUX7)
+ #define SUPPORTED
+ #define UINT32_TYPE   unsigned int
+ #define UINT16_TYPE   unsigned short
+--
+2.53.0
+
diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.8.19.bb b/me=
ta-networking/recipes-daemons/postfix/postfix_3.8.19.bb
index 018e8d89bb..ad770651d8 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.8.19.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.8.19.bb
@@ -26,6 +26,7 @@ SRC_URI =3D "http://ftp.porcupine.org/mirrors/postfix-rel=
ease/official/postfix-${P
            file://0003-makedefs-Use-native-compiler-to-build-makedefs.test=
.patch \
            file://0004-Fix-icu-config.patch \
            file://0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default=
.patch \
+           file://0001-makedefs-Account-for-linux-7.x-version.patch \
            "<http://ftp.porcupine.org/mirrors/postfix-release/official/pos=
tfix-${Pfile://0003-makedefs-Use-native-compiler-to-build-makedefs.test.pat=
ch\file://0004-Fix-icu-config.patch\file://0005-makedefs-add-lnsl-and-lreso=
lv-to-SYSLIBS-by-default.patch\+file://0001-makedefs-Account-for-linux-7.x-=
version.patch\>

 SRC_URI[sha256sum] =3D "1ebaec340fea1b80a9c88d276f07bed0886cc4f000753cf310=
223affb427754b"



--
# Randy MacLeod
# Wind River Linux

--_000_CH3PR11MB877402A1FF9C57F85AE9FFA78F812CH3PR11MB8774namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hello <a href=3D"mailto:Randy.MacLeod@windriver.com" id=3D"OWAAM310536" cla=
ss=3D"tWKOu mention ms-bgc-nlr ms-fcl-b">
@MacLeod, Randy</a></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
wrynose already has it - Changqing Li's &quot;postfix: make it can compile =
with linux 7.x&quot; landed there on May 15 (postfix 3.10.x).</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
This patch backports the same change to scarthgap's 3.8.19.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Himani</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> MacLeod, Randy &lt;Ra=
ndy.MacLeod@windriver.com&gt;<br>
<b>Sent:</b> Wednesday, September 23, 2026 6:29 PM<br>
<b>To:</b> Barde, Himani Ramesh &lt;HimaniRamesh.Barde@windriver.com&gt;; o=
penembedded-devel@lists.openembedded.org &lt;openembedded-devel@lists.opene=
mbedded.org&gt;<br>
<b>Subject:</b> Re: [meta-oe][scarthgap][PATCH] postfix: fix build on hosts=
 with Linux 7.x kernel</font>
<div>&nbsp;</div>
</div>
<div>
<div class=3D"x_moz-cite-prefix">On 2026-09-23 02:57, Himani Ramesh Barde w=
rote:<br>
</div>
<blockquote type=3D"cite">
<pre class=3D"x_moz-quote-pre">makedefs only recognizes kernel majors 3-6. =
Hosts running a 7.x
kernel get &quot;Unknown system type: Linux 7.0.0-...&quot; and the native
build fails. Add 7 to the version match in makedefs and sys_defs.h.

Already fixed in postfix 3.11.</pre>
</blockquote>
What about wrynose which has postfix 3.10.x?<br>
&nbsp; <a class=3D"x_moz-txt-link-freetext" href=3D"https://layers.openembe=
dded.org/layerindex/branch/wrynose/recipes/?q=3Dpostfix">
https://layers.openembedded.org/layerindex/branch/wrynose/recipes/?q=3Dpost=
fix</a><br>
<br>
../Randy
<blockquote type=3D"cite">
<pre class=3D"x_moz-quote-pre">

Upstream-Status: Backport [postfix 3.11]
Signed-off-by: Himani Ramesh Barde <a class=3D"x_moz-txt-link-rfc2396E" hre=
f=3D"mailto:HimaniRamesh.Barde@windriver.com">&lt;HimaniRamesh.Barde@windri=
ver.com&gt;</a>
---
 ...kedefs-Account-for-linux-7.x-version.patch | 47 +++++++++++++++++++
 .../recipes-daemons/postfix/postfix_3.8.19.bb |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/postfix/files/0001-make=
defs-Account-for-linux-7.x-version.patch

diff --git a/meta-networking/recipes-daemons/postfix/files/0001-makedefs-Ac=
count-for-linux-7.x-version.patch b/meta-networking/recipes-daemons/postfix=
/files/0001-makedefs-Account-for-linux-7.x-version.patch
new file mode 100644
index 0000000000..4bc59ace7d
--- /dev/null
+++ b/meta-networking/recipes-daemons/postfix/files/0001-makedefs-Account-f=
or-linux-7.x-version.patch
@@ -0,0 +1,47 @@
+From 5466d510dfbc2b7a81dcf766f83d2c89066c0446 Mon Sep 17 00:00:00 2001
+From: Changqing Li <a class=3D"x_moz-txt-link-rfc2396E" href=3D"mailto:cha=
ngqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
+Date: Mon, 11 May 2026 18:16:07 +0000
+Subject: [PATCH] makedefs: Account for linux 7.x version
+
+Major version has bumped to 7, update the scripts
+
+Upstream-Status: Backport [The latest stable version 3.11 already fixed]
+
+Refer:
+https://www.ftp.saix.net/MTA/postfix/index.html
+
+Signed-off-by: Changqing Li <a class=3D"x_moz-txt-link-rfc2396E" href=3D"m=
ailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
+---
+ makedefs            | 2 +-
+ src/util/sys_defs.h | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/makedefs b/makedefs
+index 74b103d..fe8c618 100644
+--- a/makedefs
++++ b/makedefs
+@@ -625,7 +625,7 @@ EOF
+ 		: ${SHLIB_ENV=3D&quot;LD_LIBRARY_PATH=3D`pwd`/lib&quot;}
+ 		: ${PLUGIN_LD=3D&quot;${CC-gcc} -shared&quot;}
+ 		;;
+-    Linux.[3456].*)
++    Linux.[34567].*)
+ 		SYSTYPE=3DLINUX$RELEASE_MAJOR
+ 		case &quot;$CCARGS&quot; in
+ 		 *-DNO_DB*) ;;
+diff --git a/src/util/sys_defs.h b/src/util/sys_defs.h
+index 70aab23..c5472eb 100644
+--- a/src/util/sys_defs.h
++++ b/src/util/sys_defs.h
+@@ -763,7 +763,7 @@ extern int initgroups(const char *, int);
+   * LINUX.
+   */
+ #if defined(LINUX2) || defined(LINUX3) || defined(LINUX4) || defined(LINU=
X5) \
+-	|| defined(LINUX6)
++	|| defined(LINUX6) || defined(LINUX7)
+ #define SUPPORTED
+ #define UINT32_TYPE	unsigned int
+ #define UINT16_TYPE	unsigned short
+--=20
+2.53.0
+
diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.8.19.bb b/me=
ta-networking/recipes-daemons/postfix/postfix_3.8.19.bb
index 018e8d89bb..ad770651d8 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.8.19.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.8.19.bb
@@ -26,6 +26,7 @@ SRC_URI =3D <a class=3D"x_moz-txt-link-rfc2396E" href=3D"=
http://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${Pfile:/=
/0003-makedefs-Use-native-compiler-to-build-makedefs.test.patch\file://0004=
-Fix-icu-config.patch\file://0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-=
by-default.patch\+file://0001-makedefs-Account-for-linux-7.x-version.patch\=
">&quot;http://ftp.porcupine.org/mirrors/postfix-release/official/postfix-$=
{P
            file://0003-makedefs-Use-native-compiler-to-build-makedefs.test=
.patch \
            file://0004-Fix-icu-config.patch \
            file://0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default=
.patch \
+           file://0001-makedefs-Account-for-linux-7.x-version.patch \
            &quot;</a>
=20
 SRC_URI[sha256sum] =3D &quot;1ebaec340fea1b80a9c88d276f07bed0886cc4f000753=
cf310223affb427754b&quot;
</pre>
</blockquote>
<p><br>
</p>
<pre class=3D"x_moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
</div>
</body>
</html>

--_000_CH3PR11MB877402A1FF9C57F85AE9FFA78F812CH3PR11MB8774namp_--

