Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09954CD37AC
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 02:07:45 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26366.1778810860946043007
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 May 2026 19:07:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=AiXjVNv3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=95954df25a=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F1F7sp782576
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 May 2026 02:07:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=6cirZhlk1SHZBRpifHBKd0
	Rzpu96DTUBg5pDSW3bc2M=; b=AiXjVNv3x0I5hlbbz09bB+Er228l32CAXGFZCi
	bLYuCPuf+V4RMkLHOCnadehljVhmBSKWmC/bJGD9mzXDeHdYRD5PdMpDsoiencu3
	vrn0L7q5hfeH/j8zEz54KoN5DMQ0siy5FUq/MEkyev4xU2xmaEAZk58NVhJvaiZI
	AwOYXvDoT5xSC2kcNKsOQFCZfF6c9wdYkErsh07U6by8HBdt6vhylmZolZWIsclR
	EUtcz090jKQkpPjpIiqEgferVa+Ly3XtxQnDkxd6yv3h3wTMKGxlj1iwXQfdHZ1K
	6RhXkqA/TnJ3L2UAfSQRSXjQ5tXDlnbeTKa7LYQ+VJKKL5zw==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010070.outbound.protection.outlook.com [52.101.46.70])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e5m6b0auh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 15 May 2026 02:07:38 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h3p8v504ZVUgnpxyvz1iu9F+ENBjObNaXi28NRenkZCJCGFn1ooOg21utfNlLju2a0cpNxNX6l+/mRU25nFZvcNRoWUcLb4bhnLXLD029onaBnaPonLNbzBrz14ZSNp6+WHWqmyLlW4R+aqVaogE9wkOr2QBJ+GnU2jt0DtouH0ZI2sfLwTxjH1DC5HzghRYf36Yz3ANwA+EESixkXF/u3SyFkc5/xLy8Q4hIi2Bve6assDktgZhvJrHtV4UM2QJG0BO8tSTMcUcbLwKlerTNQmpVFU+Dfw/eqHxrwEhZakQUG3zholgxZSXrwO6LliaIkAMRvrMp9ws6+qk9IfAng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6cirZhlk1SHZBRpifHBKd0Rzpu96DTUBg5pDSW3bc2M=;
 b=MqPu4GzCHyumTH9xHIdiM9+z0DB+T+ILmYh9K0nvW3w5CNcfY7VYVES1ui19yt9LtMFSEmpvM1g3WI4esOsXfSanRiAv4BVUCxo2tyuuz6svq+hve31mlxUD7Ie404hvOZvlF+iMeFXzr3SNy0krzQS2Rwj+uO4XEtnLOOQ5UEnAD+R4QKRXFuA34LW0njQC5oi0WUsZAna/tW3NhC7oy/3hvHjXqhlC5wiEfn0lbNI/YlPWc+aB/chMSCBMYd8DP4oW2UpaJiKvA3tFKcy2qb5Laee7JXvGyJTq/FkaksZUiQqdGnK3JNLp+DCX5lef43sF20Rzos5pO2nUYTyBXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by IA1PR11MB9470.namprd11.prod.outlook.com (2603:10b6:208:5af::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 02:07:35 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 02:07:34 +0000
Content-Type: multipart/alternative;
 boundary="------------CKwJDZ2VPjqyxLTyb0AJ669Z"
Message-ID: <0da732da-7102-4f9c-8791-9cdcff182b4d@windriver.com>
Date: Fri, 15 May 2026 10:07:28 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking][PATCH V2] postfix: upgrade 3.10.9 ->
 3.11.2
To: raj.khem@gmail.com
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
References: <CAMKF1sr-mFccrpOTJ3yVitujsrkCCJyS+SFdPyki8Wo0vk+TCA@mail.gmail.com>
 <18AF5238DBAFD59C.2716283@lists.openembedded.org>
 <40b403e9-44ef-4caf-89cb-47f22f7ce820@windriver.com>
 <CAMKF1spT9ZLkuMxF1bQo+ntCQZcE6NrNRnoQW7B6ji-=k1eXxg@mail.gmail.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <CAMKF1spT9ZLkuMxF1bQo+ntCQZcE6NrNRnoQW7B6ji-=k1eXxg@mail.gmail.com>
X-ClientProxiedBy: SG2P153CA0027.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::14)
 To DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|IA1PR11MB9470:EE_
X-MS-Office365-Filtering-Correlation-Id: cfa3702b-fa06-491b-6cb6-08deb226bab4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|4022899009|13003099007|56012099003|8096899003|4143699003|22082099003|18002099003|11063799003|3023799003;
X-Microsoft-Antispam-Message-Info: 
	F2YIq39q5wPZBNrAnhT8eDi8BfHRypMLsUa0/XJ36cT+KTxm5b68+We99Ck7GSwiFJrR6sOUsEZMlp1z8SJCbkjtSE800KjOsIy5AoiCm1DWFb/SAMFhOp6ma5ROfG/RFBnb2XugbJ1MnOiUBIGPnZ4CHZ+TtzUisWJq+CdOn+SOwstDh+XK2HWmKv3wOb7PWiC6Gwat3CNZTbEfjYJLPWv6cXcBQfZskyCvRYqRsdv23DXtcdDLuzPll40Ny+UB7yPZRi4M/GE24CqLcQtzNir9vboTa0dMctEbYNCGVzgSpdqtrgdEmJRGuTK/jS6oJ0YBng7X1QxLhg5Dv04u1bQjXb9rx4WbJS/ruAIK3GvRblDFQM+QPrkGrr6SUGfxTC5pZGp9M/rx8rA/Z/LK3v13X46ONVnZOJtFCHvjkQKTpVfTdMcMFAPjNKP20jw9vvlGM+Ln94iLuZHfGs3TesE+PGc0/STIEHTxcTp3mQR1T7FpDxhlMJbWFyxKHQLqhBXlARyeYwfI379uJlbTXxeOyxKKTxsjRu78Db8jnAjXcjiLxql3Zm2Ox3d1IUvbAKdKxXGwX7GXwlx/nyUPt5XOWJIwQOqAPRvCkSe4yI8VALovWjuPvKPJUeK2959H8LZKoUUJi1M5hS47KkDzrg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(4022899009)(13003099007)(56012099003)(8096899003)(4143699003)(22082099003)(18002099003)(11063799003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MzVYUGsyRVpIdURoUDZGdFA0ZVBwa2hQUVlqdUpvaWw2aVdYbGZMZ0laeW5n?=
 =?utf-8?B?WDRjdW02V3N0R0Zvd0FlTU42OXJjQVZ2T1RvV01JUE05aGI1ajVxeGloTitn?=
 =?utf-8?B?TE1BZENteTlaL3k5RjlXWnA4N1dFREdDQ1BicTBHL0d4QU91NlB5RjJIc2ZC?=
 =?utf-8?B?RENxSEdjNWQvK0tGOHJXejR4YTI1UTUvSFVUL2w0OTRoNmd6ZG1idkxoUzJy?=
 =?utf-8?B?VDBHMjQ0clFHMkF4Qmx4TFFCYkxkNytzN2hseHp0VEsyc3M0WVZ6QyttY2x2?=
 =?utf-8?B?SXh4YnF6Vzd4TG56bWFlcW5STzJ3NTJScWxxZC9idTVGaG1Yb0VRbVByNFdv?=
 =?utf-8?B?SmI4MWxhZ0s4MUhYY2VrVVVVZnoxU2xjWnoxYmVJeHFiVzVjM24velBvQ1hP?=
 =?utf-8?B?K3JRNkNkRGdzdkhkTUVjZS93TlQzRTd4TERNRWlQMWdMcHZoUWNPUVprLzZo?=
 =?utf-8?B?N2t1WDZaVm9FSFNYVjczU1pLQXdBS1IrakcyU0FsTVM3MFp4T005amZMUitR?=
 =?utf-8?B?dmpoM2FERnBiSVR6SDFrRUxFK25LK0VTREEyUTliODd4QWZURkpwZGMvUmd4?=
 =?utf-8?B?a3o0SWM5TzlUeWJVOVlmSmdvL2JYd1I4cmJURnUrY3NBbThPR0Z2cFpaSWR5?=
 =?utf-8?B?NnZrR3h4YlFBTXUzUDY1S1Yyc25jSFM1MzNIUDAxSzByOGorKzQvMTJKS1hJ?=
 =?utf-8?B?aDh0ZkhieVEwbDg4YWJjeDJhdVNva3M3dWd6a2cwY3VhVGdsL0ZsQUxuMlE2?=
 =?utf-8?B?bnlJeEtJSlBhZWtEellvNWtOTlJkR0JqODVEY3UwSllZcVozUHE2RGNPa0tq?=
 =?utf-8?B?MENNUVNuNk5PNVJIQTBWMHk5S0REY094aGQyY29ZOVo3MlZRRjFYb0U1WWRy?=
 =?utf-8?B?Ui9KOU5mejBETExpTUd6N1c0enZZTWE5U3pGSnRnY3hqOC9ZSnYvZ2E0Zk9a?=
 =?utf-8?B?RGVsbWVSdE5MWWRTY1k2OWNydHNLUE1pbkRpNjUzQ2NzRFVmY0tKVWE2YTdP?=
 =?utf-8?B?YVV3YU1ydEF4ZStrdTErOVFiNWxzZTBBSU5EODJsQktWN3VSdDUwRXh0RUl3?=
 =?utf-8?B?OTU0Q1NucFhKbXo4RThaaE9CU0YxWjdERXB5U0gyeVVuYzRDYkVmRTFXUWZx?=
 =?utf-8?B?OWRaRWJQZEliUjVLVk40Qjg1QXArc0lRUEJiU0I5dHgyRE1YamRpbjFyd3k0?=
 =?utf-8?B?Q0U4TTRsVE5sODUxNVZJVHdhQlRZZmJwS2lRUjh4V0ZJOGNoZHVnS3lESWda?=
 =?utf-8?B?Y0R6ZzZWM2xMMVdGYUpLMm1Ia3BPdXNYUXk5dzN0aHRHaThNVHVOSGVtVmxs?=
 =?utf-8?B?Y05XNWJzdEoveGJsWTNEUVpOU2E3cUVPckpmTHVpTm5VanFpQktyMHBpOUVG?=
 =?utf-8?B?elhpU2wxYkhURTNkUnFuNmNFZGlhQ1pmd0d6QXJ1SzFtaHNnLzlzdTdaZDRp?=
 =?utf-8?B?RFVTYVpPV1VUYXhndUVCRkRUWWhHS0x3Z2VkOEEraUozbkVkcUtHRVg1S3VN?=
 =?utf-8?B?TFJVTGh6cFBoMm1IZnF3U3dUbTdaZUF6WksvTkkxOEh1VWd3OGZFTmJMWUFG?=
 =?utf-8?B?RXdtNjRWSUozRkFPNkVQQ0VrSzZoNVN3dC8xUXFKdGdzdTA5bWpNY05hUUww?=
 =?utf-8?B?QTNPSENoTVh2T0FxTVJpa2FOWHpsL2lqeFFtekxZcE5LL2dpZ3hzRXRMeWo5?=
 =?utf-8?B?dDRpaGhURnhwZ1RDNnlWbjNBY2dyWkJ3cDVMWjcxTnk0SE0vN01uVktqMTFy?=
 =?utf-8?B?RmFFM3pqWXgwUUVtUlhjeW83YWkvbk4vMHpEZGJsZXNhc2JqZDRCMTJQK2Z2?=
 =?utf-8?B?NnZLQlZ3KytzMlE0dFVPeGxnS1Q2eURQN0NNVGpjSG1DS2FWYWY2eXVnRkpR?=
 =?utf-8?B?N2NReFVidnhMUU8vcmJBeVhJUjloanFQQ0orYXZ5c3NhN2d1V1Y4ODV2eG1V?=
 =?utf-8?B?ZlV5M3V4U0VJOCt0TCtVczlDUk02VnowcmpFbVV1TnlZOVVsTmNpWWE5d0lC?=
 =?utf-8?B?NGE3OXN0ODdOSUlzVVFjUWRGOE1nc2xldnVSbmlQdFJsbmxzT0ZjajMwQ3NW?=
 =?utf-8?B?djFFd2ZYRFZHUVhhc0FubkZKZlFReVhrbDdJcmNVdjUyUmROTGJRWnd2VERj?=
 =?utf-8?B?ZUtsZ1dERCtzYnJrTFBnemtLbXh0QTRGWDhmR3YxUlROa0xIV1JSQ0ZhdzhQ?=
 =?utf-8?B?R1FqRktHQVZ6Rm1WaGVDN2V2OERyeG5NQzVkK0IzMTFpaWFBTmRIUzQzWnhJ?=
 =?utf-8?B?SE1YSnJ1ejBUQmwwUnN1TUluQXM3b1BsRzFzZnRndWw3ZGZiNWwyNFhLdXBF?=
 =?utf-8?B?U0xDbC9DYk43d3Fja29lTW1PTUp4S3k1d0hRanhkdDlOUlNZWVlwby9MdWVX?=
 =?utf-8?Q?nt2HyoTk4l3ZXewI=3D?=
X-Exchange-RoutingPolicyChecked: 
	Bp+Ajya0P63R7/nUnxJIEbcT201gVOftHvE/hyvkfPSJbNxVwxigkvaG7i/gFSMIyjhLaRW0aCGD/24FKjQlHrEFjJXdZhtRYXRRRwnnf6DCCLTTL6WXGkaLkSMEsabs/N9t2gWL9IMwFMghYDSm/r+k/EiG1P/SxHf6v5LcZs3g8UB/H77wpsse/Nn14FJlpWrk+WL9FfH0XTFmKbTqo2XoP6cFzFNK1Wh/qDAZ2b900i90vNQygCdeSdptU6C5TpNXW4ICIMz8C6whlL5dQATwV0GPCAEShexEfFVYqbGCgeErplLtLqqHeKPn8+97xxNA/6PEmLlHo/1DTeDhRA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfa3702b-fa06-491b-6cb6-08deb226bab4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 02:07:34.7572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5byrlejig0dViKdDR5P+EQJVHoYjq9cYnmoCdsAu47TOGYcK+3XbNW02Ynnu0hVDb80IiBSqlPuxNBQZLV11dWu3fRkIgdgbJCkcf32sLoQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB9470
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDAxOCBTYWx0ZWRfX6HxH9G7SunVg
 0t0108OqBEIz9YAgwW8Ww00tpxnbnji0VPi/t/mYKrg/eBlfFvTLxLoHkQJ2p+Gdx2WN65pxEa6
 JIG1wydbfBUxoutZgKk8jC1FnA9yGPdMdqSKh1mb2KhFWso6iX9TSbYpJdQQzi9TTA6B8Z972Lz
 2NSwY3iwfL5mSOXuIkDSLoBr95tW1JEGspQmfVrqr2UJSX6JqqfnGYBDe+4D+FG50sCLA2ZPUTv
 UwHrg6P6cg3p+mnS/f0nmgJU2l85cnowV9d5cw5EP6xScbVH/mRkFNtscJyBC8R6C/kZql3zekU
 43QmrxNDmtMbGVE7gwJDSJQHVyBIfVQK/kCycwqbfHaAUoNu99DykloLEWHkQ+J9Ea2qRvRsvA4
 OKwzwbq8OJIpauOStpFFqgC6vWTZXmPHefZBGKqbvDH6wBpm9HSQjK/4yn5Fs4BovrEu+Crkbbq
 ySGOCo/6wgKLJB45OZg==
X-Proofpoint-GUID: LdmkeFekBm37yrsO3z7tFeaQTNty8ThJ
X-Proofpoint-ORIG-GUID: uTxKVr71xW1lI2CGFBPDQlk3jTDZMucs
X-Authority-Analysis: v=2.4 cv=PN0/P/qC c=1 sm=1 tr=0 ts=6a067fea cx=c_pps
 a=DyUboiW8/Fjv5kZUpInndg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=Q4-j1AaZAAAA:8
 a=VJYubktbAAAA:8 a=cUW-zQj0AAAA:8 a=ygfikJQSAAAA:8 a=gmDo1nssAAAA:8
 a=e1GkridNAAAA:8 a=t7CeM3EgAAAA:8 a=omOdbC7AAAAA:8 a=pGLkceISAAAA:8
 a=XQ1-I8ZNkhLacLzmrHAA:9 a=PRpDppDLrCsA:10 a=O9Trw71uoXUA:10
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=QpNa0mjLMvlPy-wwAcoA:9
 a=FbjG3KOWu2XMiIWv:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=OqWDEjY5HwswFcA5adJo:22 a=2fd0wjtG6IkNllS7Rezt:22
 a=rfsfOhzgo-V0TFs3tIRs:22 a=DmCNEmdWNTAeIjfGWauO:22 a=6ft9yNkZjdd813gQxDxM:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_06,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150018
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 May 2026 02:07:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126996

--------------CKwJDZ2VPjqyxLTyb0AJ669Z
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 64F1F7sp782576

OK.=C2=A0 I will resend with V3.

Thanks

Changqing

On 5/15/26 09:58, Khem Raj via lists.openembedded.org wrote:
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
> Ok send a v3 to make it clear
>
> On Thu, May 14, 2026, 6:44=E2=80=AFPM Changqing Li=20
> <changqing.li@windriver.com> wrote:
>
>     Hi, Khem
>
>     This is a kind remind.=C2=A0 This is the patch rebased on latest ma=
ster
>     branch,=C2=A0 and sorry this actually should be V3.
>
>     but I noticed the old V2 patch is on the master-next:
>
>     https://git.openembedded.org/meta-openembedded/commit/?h=3Dmaster-n=
ext&id=3D537241aa1fd027a1ab946955d78b68a56e8896c8
>     <https://git.openembedded.org/meta-openembedded/commit/?h=3Dmaster-=
next&id=3D537241aa1fd027a1ab946955d78b68a56e8896c8>
>
>     Regards
>
>     Changqing
>
>     On 5/14/26 11:51, Changqing Li via lists.openembedded.org
>     <http://lists.openembedded.org> wrote:
>     >=C2=A0 =C2=A0* Refresh patch to mute patch-fuzz
>     > * Remove 0001-makedefs-Account-for-linux-7.x-version.patch
>     > * This upgrade include the following commit, which make postfix c=
an
>     >=C2=A0 =C2=A0 compile on latest stable ubuntu 26.04, which have Li=
nux 7.x
>     kernel
>     >
>     >=C2=A0 =C2=A0 Postfix works on Linux 7.x kernels. Frank Scheiner. =
Files:
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 makedefs, util/sys_defs.h.
>     >
>     > Changes:
>     > https://www.ftp.saix.net/MTA/postfix/official/postfix-3.11.2.HIST=
ORY
>     >
>     > Signed-off-by: Changqing Li <changqing.li@windriver.com>
>     > ---
>     >=C2=A0 =C2=A0.../postfix/files/0001-Fix-makedefs.patch=C2=A0 =C2=A0=
 =C2=A0| 25
>     ++++++++-----------
>     >=C2=A0 =C2=A0...tconf-to-a-variable-for-cross-compil.patch |=C2=A0=
 9 +++----
>     >=C2=A0 =C2=A0...tive-compiler-to-build-makedefs.test.patch | 17 ++=
++++-------
>     >=C2=A0 =C2=A0.../postfix/files/0004-Fix-icu-config.patch=C2=A0 =C2=
=A0|=C2=A0 9 +++----
>     >=C2=A0 =C2=A0...sl-and-lresolv-to-SYSLIBS-by-default.patch | 11 ++=
+-----
>     >=C2=A0 =C2=A0.../{postfix_3.10.9.bb <http://postfix_3.10.9.bb> =3D=
>
>     postfix_3.11.2.bb <http://postfix_3.11.2.bb>}=C2=A0 |=C2=A0 3 +--
>     >=C2=A0 =C2=A06 files changed, 29 insertions(+), 45 deletions(-)
>     >=C2=A0 =C2=A0rename
>     meta-networking/recipes-daemons/postfix/{postfix_3.10.9.bb
>     <http://postfix_3.10.9.bb> =3D> postfix_3.11.2.bb
>     <http://postfix_3.11.2.bb>} (98%)
>     >
>     > diff --git
>     a/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.p=
atch
>     b/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.p=
atch
>     > index 785fe87452..4e187849dc 100644
>     > ---
>     a/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.p=
atch
>     > +++
>     b/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.p=
atch
>     > @@ -1,4 +1,4 @@
>     > -From e4197bc1f431fd7e555a31e6f7f1e020b4ec8f4c Mon Sep 17
>     00:00:00 2001
>     > +From 51e29c0a1d98948118e5135bb817a96811105d39 Mon Sep 17
>     00:00:00 2001
>     >=C2=A0 =C2=A0From: Li xin <lixin.fnst@cn.fujitsu.com>
>     >=C2=A0 =C2=A0Date: Fri, 19 Jun 2015 16:45:54 +0900
>     >=C2=A0 =C2=A0Subject: [PATCH] Fix makedefs
>     > @@ -19,10 +19,10 @@ Signed-off-by: Yao Zhao <yao.zhao@windriver.c=
om>
>     >=C2=A0 =C2=A0 1 file changed, 11 insertions(+), 16 deletions(-)
>     >
>     >=C2=A0 =C2=A0diff --git a/makedefs b/makedefs
>     > -index a740e41..28fb128 100644
>     > +index d5103ce..9713327 100644
>     >=C2=A0 =C2=A0--- a/makedefs
>     >=C2=A0 =C2=A0+++ b/makedefs
>     > -@@ -230,9 +230,6 @@ echo "# pie=3D$pie"
>     > +@@ -232,9 +232,6 @@ echo "# pie=3D$pie"
>     >
>     >=C2=A0 =C2=A0 # Defaults for most sane systems
>     >
>     > @@ -32,7 +32,7 @@ index a740e41..28fb128 100644
>     >=C2=A0 =C2=A0 ARFL=3Drv
>     >
>     >=C2=A0 =C2=A0 # Ugly function to make our error message more visib=
le among the
>     > -@@ -563,12 +560,12 @@ case "$SYSTEM.$RELEASE" in
>     > +@@ -608,12 +605,12 @@ case "$SYSTEM.$RELEASE" in
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case "$CCAR=
GS" in
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *-DNO_DB*)=
 ;;
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *-DHAS_DB*=
) ;;
>     > @@ -48,8 +48,8 @@ index a740e41..28fb128 100644
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0else
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0# No, we're not going to try db1 db2 db3 etc.
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0# On a properly installed system, Postfix
>     builds
>     > -@@ -577,12 +574,12 @@ case "$SYSTEM.$RELEASE" in
>     > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0echo "Install the appropriate db*-devel
>     package first." 1>&2
>     > +@@ -623,12 +620,12 @@ case "$SYSTEM.$RELEASE" in
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0echo "Alternatively, build with
>     CCARGS=3D\"-NO_DB ...\"" 1>&2
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0exit 1
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0fi
>     >=C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0SYSLIBS=3D"-ldb"
>     > @@ -63,7 +63,7 @@ index a740e41..28fb128 100644
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0do
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0test -e $lib/lib$name.a -o -e
>     $lib/lib$name.so && {
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SYSLIBS=3D"$SYSLIBS -l$name"
>     > -@@ -602,7 +599,7 @@ case "$SYSTEM.$RELEASE" in
>     > +@@ -648,7 +645,7 @@ case "$SYSTEM.$RELEASE" in
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if [ `expr "X$CCARGS" : "X.*-DNO_EPOLL"`
>     -gt 0 ]
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 then
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 :
>     > @@ -72,7 +72,7 @@ index a740e41..28fb128 100644
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 then
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 echo CCARGS=3D"$CCARGS -DNO_EPOLL"
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 else
>     > -@@ -626,8 +623,6 @@ int=C2=A0 =C2=A0 =C2=A0main(int argc, char *=
*argv)
>     > +@@ -672,8 +669,6 @@ int=C2=A0 =C2=A0 =C2=A0main(int argc, char *=
*argv)
>     >=C2=A0 =C2=A0 }
>     >=C2=A0 =C2=A0 EOF
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ${CC-gcc} -o makedefs.test
>     makedefs.test.c || exit 1
>     > @@ -81,7 +81,7 @@ index a740e41..28fb128 100644
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 rm -f makedefs.test makedefs.test.[co]
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 fi;;
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0esac
>     > -@@ -644,12 +639,12 @@ EOF
>     > +@@ -690,12 +685,12 @@ EOF
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case "$CCAR=
GS" in
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *-DNO_DB*)=
 ;;
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *-DHAS_DB*=
) ;;
>     > @@ -97,8 +97,8 @@ index a740e41..28fb128 100644
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0else
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0# On a properly installed system, Postfix
>     builds
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0# by including <db.h> and by linking with -ldb
>     > -@@ -657,12 +652,12 @@ EOF
>     > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0echo "Install the appropriate db*-devel
>     package first." 1>&2
>     > +@@ -705,12 +700,12 @@ EOF
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0echo "See:
>     https://www.postfix.org/NON_BERKELEYDB_README.html#build-conf" 1>&2
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0exit 1
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0fi
>     >=C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0SYSLIBS=3D"-ldb"
>     > @@ -112,6 +112,3 @@ index a740e41..28fb128 100644
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0do
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0test -e $lib/lib$name.a -o -e
>     $lib/lib$name.so && {
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SYSLIBS=3D"$SYSLIBS -l$name"
>     > ---
>     > -2.25.1
>     > -
>     > diff --git
>     a/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-p=
ostconf-to-a-variable-for-cross-compil.patch
>     b/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-p=
ostconf-to-a-variable-for-cross-compil.patch
>     > index d46efb95cb..a74c46fa92 100644
>     > ---
>     a/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-p=
ostconf-to-a-variable-for-cross-compil.patch
>     > +++
>     b/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-p=
ostconf-to-a-variable-for-cross-compil.patch
>     > @@ -1,4 +1,4 @@
>     > -From 953719878466c55572294f42e85127bda5d34999 Mon Sep 17
>     00:00:00 2001
>     > +From ce8deeaac8ca5d7329e1923790a1f35798953799 Mon Sep 17
>     00:00:00 2001
>     >=C2=A0 =C2=A0From: Li xin <lixin.fnst@cn.fujitsu.com>
>     >=C2=A0 =C2=A0Date: Fri, 19 Jun 2015 17:14:58 +0900
>     >=C2=A0 =C2=A0Subject: [PATCH] Change fixed postconf to a variable =
for
>     cross-compiling
>     > @@ -12,10 +12,10 @@ Signed-off-by: Yao Zhao <yao.zhao@windriver.c=
om>
>     >=C2=A0 =C2=A0 2 files changed, 11 insertions(+), 9 deletions(-)
>     >
>     >=C2=A0 =C2=A0diff --git a/Makefile.in b/Makefile.in
>     > -index a37f89f..17cb64b 100644
>     > +index 8d7501a..d2a85e8 100644
>     >=C2=A0 =C2=A0--- a/Makefile.in
>     >=C2=A0 =C2=A0+++ b/Makefile.in
>     > -@@ -22,7 +22,7 @@ META=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D meta/main.c=
f.proto
>     meta/master.cf.proto meta/postfix-files \
>     > +@@ -23,7 +23,7 @@ META=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D meta/main.c=
f.proto
>     meta/master.cf.proto meta/postfix-files \
>     >=C2=A0 =C2=A0 EXPAND=C2=A0 =C2=A0 =C2=A0=3D sed -e "s;\$${LIB_PREF=
IX};$(LIB_PREFIX);" \
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e "s;\$${LIB_SUFFIX};$(L=
IB_SUFFIX);"
>     >=C2=A0 =C2=A0 SHLIB_DIR_OVERRIDE =3D \
>     > @@ -102,6 +102,3 @@ index 563ee27..00d4651 100644
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 "daemon_directory =3D $daemon_director=
y" \
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 "data_directory =3D $data_directory" \
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 "command_directory =3D $command_direct=
ory" \
>     > ---
>     > -2.25.1
>     > -
>     > diff --git
>     a/meta-networking/recipes-daemons/postfix/files/0003-makedefs-Use-n=
ative-compiler-to-build-makedefs.test.patch
>     b/meta-networking/recipes-daemons/postfix/files/0003-makedefs-Use-n=
ative-compiler-to-build-makedefs.test.patch
>     > index 6f8e3e84da..201b4741de 100644
>     > ---
>     a/meta-networking/recipes-daemons/postfix/files/0003-makedefs-Use-n=
ative-compiler-to-build-makedefs.test.patch
>     > +++
>     b/meta-networking/recipes-daemons/postfix/files/0003-makedefs-Use-n=
ative-compiler-to-build-makedefs.test.patch
>     > @@ -1,4 +1,4 @@
>     > -From a8ec63a71361ccd3f6d2959c4c87b7824282b291 Mon Sep 17
>     00:00:00 2001
>     > +From fc51d9145210350577fdb29a9b0680df779ae347 Mon Sep 17
>     00:00:00 2001
>     >=C2=A0 =C2=A0From: Khem Raj <raj.khem@gmail.com>
>     >=C2=A0 =C2=A0Date: Sat, 26 Aug 2017 10:29:37 -0700
>     >=C2=A0 =C2=A0Subject: [PATCH] makedefs: Use native compiler to bui=
ld
>     makedefs.test
>     > @@ -13,10 +13,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>     >=C2=A0 =C2=A0 1 file changed, 5 insertions(+), 5 deletions(-)
>     >
>     >=C2=A0 =C2=A0diff --git a/makedefs b/makedefs
>     > -index 28fb128..313b401 100644
>     > +index 9713327..e879832 100644
>     >=C2=A0 =C2=A0--- a/makedefs
>     >=C2=A0 =C2=A0+++ b/makedefs
>     > -@@ -622,7 +622,7 @@ int=C2=A0 =C2=A0 =C2=A0main(int argc, char *=
*argv)
>     > +@@ -668,7 +668,7 @@ int=C2=A0 =C2=A0 =C2=A0main(int argc, char *=
*argv)
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(0);
>     >=C2=A0 =C2=A0 }
>     >=C2=A0 =C2=A0 EOF
>     > @@ -25,7 +25,7 @@ index 28fb128..313b401 100644
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 rm -f makedefs.test makedefs.test.[co]
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 fi;;
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0esac
>     > -@@ -865,7 +865,7 @@ int=C2=A0 =C2=A0 =C2=A0main(int argc, char *=
*argv)
>     > +@@ -914,7 +914,7 @@ int=C2=A0 =C2=A0 =C2=A0main(int argc, char *=
*argv)
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(0);
>     >=C2=A0 =C2=A0 }
>     >=C2=A0 =C2=A0 EOF
>     > @@ -34,7 +34,7 @@ index 28fb128..313b401 100644
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./m=
akedefs.test 2>/dev/null ||
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0CCARGS=3D"$CCARGS -DNO_SIGSETJMP"
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm =
-f makedefs.test makedefs.test.[co]
>     > -@@ -903,7 +903,7 @@ int main(int argc, char **argv)
>     > +@@ -952,7 +952,7 @@ int main(int argc, char **argv)
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&error) !=3D 14);
>     >=C2=A0 =C2=A0 }
>     >=C2=A0 =C2=A0 EOF
>     > @@ -43,7 +43,7 @@ index 28fb128..313b401 100644
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0$icu_ldflags >/dev/null 2>&1
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0if ./makedefs.test 2>/dev/null ; then
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0CCARGS=3D"$CCARGS $icu_cppflags"
>     > -@@ -1024,7 +1024,7 @@ int=C2=A0 =C2=A0 =C2=A0main(void)
>     > +@@ -1088,7 +1088,7 @@ int=C2=A0 =C2=A0 =C2=A0main(void)
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(ferror(stdout) ? 1 : 0);
>     >=C2=A0 =C2=A0 }
>     >=C2=A0 =C2=A0 EOF
>     > @@ -52,7 +52,7 @@ index 28fb128..313b401 100644
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 ./makedefs.test || exit 1
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f makedefs.test makedefs.test.[co]
>     >=C2=A0 =C2=A0 }
>     > -@@ -1180,7 +1180,7 @@ int=C2=A0 =C2=A0 =C2=A0main(void)
>     > +@@ -1245,7 +1245,7 @@ int=C2=A0 =C2=A0 =C2=A0main(void)
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(ferror(stdout) ? 1 : 0);
>     >=C2=A0 =C2=A0 }
>     >=C2=A0 =C2=A0 EOF
>     > @@ -61,6 +61,3 @@ index 28fb128..313b401 100644
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0parm_val=3D`./makedefs.test` || exit 1
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f makedefs.test makedefs.test.[co]
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0eval ${parm_name}=3D\""\$parm_val"\"
>     > ---
>     > -2.25.1
>     > -
>     > diff --git
>     a/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu-config=
.patch
>     b/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu-config=
.patch
>     > index 0660ee098e..daf5c7089e 100644
>     > ---
>     a/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu-config=
.patch
>     > +++
>     b/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu-config=
.patch
>     > @@ -1,4 +1,4 @@
>     > -From 404150f53bb49af987d7338a808f47fdbd50ba7f Mon Sep 17
>     00:00:00 2001
>     > +From b63facf538af99e7c79ebee8d41abd52e7d5ee5e Mon Sep 17
>     00:00:00 2001
>     >=C2=A0 =C2=A0From: Khem Raj <raj.khem@gmail.com>
>     >=C2=A0 =C2=A0Date: Sun, 16 Jan 2022 11:21:54 +0800
>     >=C2=A0 =C2=A0Subject: [PATCH] Fix icu config
>     > @@ -18,10 +18,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>     >=C2=A0 =C2=A0 1 file changed, 1 deletion(-)
>     >
>     >=C2=A0 =C2=A0diff --git a/makedefs b/makedefs
>     > -index 313b401..e5db212 100644
>     > +index e879832..f9c132e 100644
>     >=C2=A0 =C2=A0--- a/makedefs
>     >=C2=A0 =C2=A0+++ b/makedefs
>     > -@@ -906,7 +906,6 @@ EOF
>     > +@@ -955,7 +955,6 @@ EOF
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0${BUILD_CC-gcc} -o makedefs.test
>     makedefs.test.c $icu_cppflags \
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0$icu_ldflags >/dev/null 2>&1
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0if ./makedefs.test 2>/dev/null ; then
>     > @@ -29,6 +29,3 @@ index 313b401..e5db212 100644
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0SYSLIBS=3D"$SYSLIBS $icu_ldflags"
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0else
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0CCARGS=3D"$CCARGS -DNO_EAI"
>     > ---
>     > -2.25.1
>     > -
>     > diff --git
>     a/meta-networking/recipes-daemons/postfix/files/0005-makedefs-add-l=
nsl-and-lresolv-to-SYSLIBS-by-default.patch
>     b/meta-networking/recipes-daemons/postfix/files/0005-makedefs-add-l=
nsl-and-lresolv-to-SYSLIBS-by-default.patch
>     > index 1571aa844d..c2e640d6ff 100644
>     > ---
>     a/meta-networking/recipes-daemons/postfix/files/0005-makedefs-add-l=
nsl-and-lresolv-to-SYSLIBS-by-default.patch
>     > +++
>     b/meta-networking/recipes-daemons/postfix/files/0005-makedefs-add-l=
nsl-and-lresolv-to-SYSLIBS-by-default.patch
>     > @@ -1,4 +1,4 @@
>     > -From 25e7d1a9bc64f39666eb0e2b9b175773615e28d2 Mon Sep 17
>     00:00:00 2001
>     > +From fb5b16db0282b5d80edb0ccc6f0f197a7f663610 Mon Sep 17
>     00:00:00 2001
>     >=C2=A0 =C2=A0From: Yi Zhao <yi.zhao@windriver.com>
>     >=C2=A0 =C2=A0Date: Fri, 12 Oct 2018 12:38:02 +0800
>     >=C2=A0 =C2=A0Subject: [PATCH] makedefs: add -lnsl and -lresolv to =
SYSLIBS
>     by default
>     > @@ -14,10 +14,10 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com=
>
>     >=C2=A0 =C2=A0 1 file changed, 2 insertions(+), 20 deletions(-)
>     >
>     >=C2=A0 =C2=A0diff --git a/makedefs b/makedefs
>     > -index e5db212..b00049b 100644
>     > +index f9c132e..5ebef5b 100644
>     >=C2=A0 =C2=A0--- a/makedefs
>     >=C2=A0 =C2=A0+++ b/makedefs
>     > -@@ -577,16 +577,7 @@ case "$SYSTEM.$RELEASE" in
>     > +@@ -623,16 +623,7 @@ case "$SYSTEM.$RELEASE" in
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0SYSLIBS=3D"$SYSLIBS -ldb"
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0;;
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0esac
>     > @@ -35,7 +35,7 @@ index e5db212..b00049b 100644
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Kernel 2.=
4 added IPv6
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case "$RELE=
ASE" in
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02.[0-3].*) =
CCARGS=3D"$CCARGS -DNO_IPV6";;
>     > -@@ -655,16 +646,7 @@ EOF
>     > +@@ -703,16 +694,7 @@ EOF
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0SYSLIBS=3D"$SYSLIBS -ldb"
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0;;
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0esac
>     > @@ -53,6 +53,3 @@ index e5db212..b00049b 100644
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SYSLIBS=3D"=
$SYSLIBS -ldl"
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: ${SHLIB_S=
UFFIX=3D.so}
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: ${SHLIB_C=
FLAGS=3D-fPIC}
>     > ---
>     > -2.25.1
>     > -
>     > diff --git
>     a/meta-networking/recipes-daemons/postfix/postfix_3.10.9.bb
>     <http://postfix_3.10.9.bb>
>     b/meta-networking/recipes-daemons/postfix/postfix_3.11.2.bb
>     <http://postfix_3.11.2.bb>
>     > similarity index 98%
>     > rename from
>     meta-networking/recipes-daemons/postfix/postfix_3.10.9.bb
>     <http://postfix_3.10.9.bb>
>     > rename to
>     meta-networking/recipes-daemons/postfix/postfix_3.11.2.bb
>     <http://postfix_3.11.2.bb>
>     > index 633e4a7a0d..894e58261b 100644
>     > --- a/meta-networking/recipes-daemons/postfix/postfix_3.10.9.bb
>     <http://postfix_3.10.9.bb>
>     > +++ b/meta-networking/recipes-daemons/postfix/postfix_3.11.2.bb
>     <http://postfix_3.11.2.bb>
>     > @@ -26,11 +26,10 @@ SRC_URI =3D
>     "http://ftp.porcupine.org/mirrors/postfix-release/official/postfix-=
${P
>     <http://ftp.porcupine.org/mirrors/postfix-release/official/postfix-=
$%7BP>
>     >
>     file://0003-makedefs-Use-native-compiler-to-build-makedefs.test.pat=
ch
>     \
>     > file://0004-Fix-icu-config.patch \
>     >
>     file://0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.pat=
ch
>     \
>     > - file://0001-makedefs-Account-for-linux-7.x-version.patch \
>     > file://0001-Fix-build-with-musl.patch \
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
>     >
>     > -SRC_URI[sha256sum] =3D
>     "d4b4daab0af2e0c16c0d2d5ac3c7680d5ebd2001ea054f7f2a601c759801bc13"
>     > +SRC_URI[sha256sum] =3D
>     "daed65b08c9288cdb386a914f3e52cdddd44935407b5ce5aee8bcc3aa4207778"
>     >
>     >=C2=A0 =C2=A0UPSTREAM_CHECK_URI =3D "https://www.postfix.org/annou=
ncements.html"
>     >=C2=A0 =C2=A0UPSTREAM_CHECK_REGEX =3D "postfix-(?P<pver>\d+(\.\d+)=
+)"
>     >
>     >
>     >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126995):https://lists.openembedded.org/g/openembedd=
ed-devel/message/126995
> Mute This Topic:https://lists.openembedded.org/mt/119323966/3616873
> Group Owner:openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub [=
changqing.li@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------CKwJDZ2VPjqyxLTyb0AJ669Z
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 64F1F7sp782576

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#ffffff">
    <p>OK.&nbsp; I will resend with V3.&nbsp;</p>
    <p>Thanks</p>
    <p>Changqing</p>
    <div class=3D"moz-cite-prefix">On 5/15/26 09:58, Khem Raj via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1spT9ZLkuMxF1bQo+ntCQZcE6N=
rNRnoQW7B6ji-=3Dk1eXxg@mail.gmail.com">
     =20
      <strong>
      </strong>
      <div style=3D"border:solid #9c6500 1pt;padding:2pt;background:#fcfc=
03"><strong><class=3D"msonormal" style=3D"line-height:11pt"><span style=3D=
"font-size:11pt;color:#000">CAUTION: This email
              comes from a non Wind River email account!</span></class=3D=
"msonormal"></strong><br>
        <class=3D"msonormal" style=3D"line-height:10pt3"><span style=3D"f=
ont-size:10pt;color:#000">Do not click links or open
            attachments unless you recognize the sender and know the
            content is safe.</span><br>
        </class=3D"msonormal"></div>
      <div>
        <div dir=3D"auto">Ok send a v3 to make it clear&nbsp;</div>
        <br>
        <div class=3D"gmail_quote gmail_quote_container">
          <div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 14, 2026,
            6:44=E2=80=AFPM Changqing Li &lt;<a href=3D"mailto:changqing.=
li@windriver.com" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext=
">changqing.li@windriver.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            Hi, Khem<br>
            <br>
            This is a kind remind.&nbsp; This is the patch rebased on lat=
est
            master <br>
            branch,&nbsp; and sorry this actually should be V3.<br>
            <br>
            but I noticed the old V2 patch is on the master-next:<br>
            <br>
            <a href=3D"https://git.openembedded.org/meta-openembedded/com=
mit/?h=3Dmaster-next&amp;id=3D537241aa1fd027a1ab946955d78b68a56e8896c8" r=
el=3D"noreferrer noreferrer" target=3D"_blank" moz-do-not-send=3D"true">h=
ttps://git.openembedded.org/meta-openembedded/commit/?h=3Dmaster-next&amp=
;id=3D537241aa1fd027a1ab946955d78b68a56e8896c8</a><br>
            <br>
            Regards<br>
            <br>
            Changqing<br>
            <br>
            On 5/14/26 11:51, Changqing Li via <a href=3D"http://lists.op=
enembedded.org" rel=3D"noreferrer noreferrer" target=3D"_blank" moz-do-no=
t-send=3D"true">
              lists.openembedded.org</a> wrote:<br>
            &gt;&nbsp; &nbsp;* Refresh patch to mute patch-fuzz<br>
            &gt; * Remove
            0001-makedefs-Account-for-linux-7.x-version.patch<br>
            &gt; * This upgrade include the following commit, which make
            postfix can<br>
            &gt;&nbsp; &nbsp; compile on latest stable ubuntu 26.04, whic=
h have
            Linux 7.x kernel<br>
            &gt;<br>
            &gt;&nbsp; &nbsp; Postfix works on Linux 7.x kernels. Frank S=
cheiner.
            Files:<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; makedefs, util/sys_def=
s.h.<br>
            &gt;<br>
            &gt; Changes:<br>
            &gt; <a href=3D"https://www.ftp.saix.net/MTA/postfix/official=
/postfix-3.11.2.HISTORY" rel=3D"noreferrer noreferrer" target=3D"_blank" =
moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">
https://www.ftp.saix.net/MTA/postfix/official/postfix-3.11.2.HISTORY</a><=
br>
            &gt;<br>
            &gt; Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changq=
ing.li@windriver.com" target=3D"_blank" rel=3D"noreferrer" moz-do-not-sen=
d=3D"true" class=3D"moz-txt-link-freetext">changqing.li@windriver.com</a>=
&gt;<br>
            &gt; ---<br>
            &gt;&nbsp; &nbsp;.../postfix/files/0001-Fix-makedefs.patch&nb=
sp; &nbsp; &nbsp;| 25
            ++++++++-----------<br>
            &gt;&nbsp; &nbsp;...tconf-to-a-variable-for-cross-compil.patc=
h |&nbsp; 9
            +++----<br>
            &gt;&nbsp; &nbsp;...tive-compiler-to-build-makedefs.test.patc=
h | 17
            ++++++-------<br>
            &gt;&nbsp; &nbsp;.../postfix/files/0004-Fix-icu-config.patch&=
nbsp; &nbsp;|&nbsp; 9
            +++----<br>
            &gt;&nbsp; &nbsp;...sl-and-lresolv-to-SYSLIBS-by-default.patc=
h | 11
            +++-----<br>
            &gt;&nbsp; &nbsp;.../{<a href=3D"http://postfix_3.10.9.bb" re=
l=3D"noreferrer noreferrer" target=3D"_blank" moz-do-not-send=3D"true">po=
stfix_3.10.9.bb</a> =3D&gt;
            <a href=3D"http://postfix_3.11.2.bb" rel=3D"noreferrer norefe=
rrer" target=3D"_blank" moz-do-not-send=3D"true">postfix_3.11.2.bb</a>}&n=
bsp; |&nbsp; 3 +--<br>
            &gt;&nbsp; &nbsp;6 files changed, 29 insertions(+), 45 deleti=
ons(-)<br>
            &gt;&nbsp; &nbsp;rename meta-networking/recipes-daemons/postf=
ix/{<a href=3D"http://postfix_3.10.9.bb" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank" moz-do-not-send=3D"true">postfix_3.10.9.bb</a> =3D&gt;
            <a href=3D"http://postfix_3.11.2.bb" rel=3D"noreferrer norefe=
rrer" target=3D"_blank" moz-do-not-send=3D"true">postfix_3.11.2.bb</a>} (=
98%)<br>
            &gt;<br>
            &gt; diff --git
            a/meta-networking/recipes-daemons/postfix/files/0001-Fix-make=
defs.patch
b/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.patch<b=
r>
            &gt; index 785fe87452..4e187849dc 100644<br>
            &gt; ---
            a/meta-networking/recipes-daemons/postfix/files/0001-Fix-make=
defs.patch<br>
            &gt; +++
            b/meta-networking/recipes-daemons/postfix/files/0001-Fix-make=
defs.patch<br>
            &gt; @@ -1,4 +1,4 @@<br>
            &gt; -From e4197bc1f431fd7e555a31e6f7f1e020b4ec8f4c Mon Sep
            17 00:00:00 2001<br>
            &gt; +From 51e29c0a1d98948118e5135bb817a96811105d39 Mon Sep
            17 00:00:00 2001<br>
            &gt;&nbsp; &nbsp;From: Li xin &lt;<a href=3D"mailto:lixin.fns=
t@cn.fujitsu.com" target=3D"_blank" rel=3D"noreferrer" moz-do-not-send=3D=
"true" class=3D"moz-txt-link-freetext">lixin.fnst@cn.fujitsu.com</a>&gt;<=
br>
            &gt;&nbsp; &nbsp;Date: Fri, 19 Jun 2015 16:45:54 +0900<br>
            &gt;&nbsp; &nbsp;Subject: [PATCH] Fix makedefs<br>
            &gt; @@ -19,10 +19,10 @@ Signed-off-by: Yao Zhao &lt;<a href=3D=
"mailto:yao.zhao@windriver.com" target=3D"_blank" rel=3D"noreferrer" moz-=
do-not-send=3D"true" class=3D"moz-txt-link-freetext">yao.zhao@windriver.c=
om</a>&gt;<br>
            &gt;&nbsp; &nbsp; 1 file changed, 11 insertions(+), 16 deleti=
ons(-)<br>
            &gt;&nbsp; &nbsp;<br>
            &gt;&nbsp; &nbsp;diff --git a/makedefs b/makedefs<br>
            &gt; -index a740e41..28fb128 100644<br>
            &gt; +index d5103ce..9713327 100644<br>
            &gt;&nbsp; &nbsp;--- a/makedefs<br>
            &gt;&nbsp; &nbsp;+++ b/makedefs<br>
            &gt; -@@ -230,9 +230,6 @@ echo &quot;# pie=3D$pie&quot;<br>
            &gt; +@@ -232,9 +232,6 @@ echo &quot;# pie=3D$pie&quot;<br>
            &gt;&nbsp; &nbsp; <br>
            &gt;&nbsp; &nbsp; # Defaults for most sane systems<br>
            &gt;&nbsp; &nbsp; <br>
            &gt; @@ -32,7 +32,7 @@ index a740e41..28fb128 100644<br>
            &gt;&nbsp; &nbsp; ARFL=3Drv<br>
            &gt;&nbsp; &nbsp; <br>
            &gt;&nbsp; &nbsp; # Ugly function to make our error message m=
ore
            visible among the<br>
            &gt; -@@ -563,12 +560,12 @@ case &quot;$SYSTEM.$RELEASE&quot;=
 in<br>
            &gt; +@@ -608,12 +605,12 @@ case &quot;$SYSTEM.$RELEASE&quot;=
 in<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ca=
se &quot;$CCARGS&quot; in<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; *=
-DNO_DB*) ;;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; *=
-DHAS_DB*) ;;<br>
            &gt; @@ -48,8 +48,8 @@ index a740e41..28fb128 100644<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;else<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;# No, we're not going to try db1
            db2 db3 etc.<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;# On a properly installed system,
            Postfix builds<br>
            &gt; -@@ -577,12 +574,12 @@ case &quot;$SYSTEM.$RELEASE&quot;=
 in<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;echo &quot;Install the appropriate
            db*-devel package first.&quot; 1&gt;&amp;2<br>
            &gt; +@@ -623,12 +620,12 @@ case &quot;$SYSTEM.$RELEASE&quot;=
 in<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;echo &quot;Alternatively, build with
            CCARGS=3D\&quot;-NO_DB ...\&quot;&quot; 1&gt;&amp;2<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;exit 1<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;fi<br>
            &gt;&nbsp; &nbsp;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;SYSLIBS=3D&quot;-ldb&quot;<br>
            &gt; @@ -63,7 +63,7 @@ index a740e41..28fb128 100644<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;do<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;test -e $lib/lib$name.a -o -e
            $lib/lib$name.so &amp;&amp; {<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;SYSLIBS=3D&quot;$SYSLIBS -l$name&=
quot;<br>
            &gt; -@@ -602,7 +599,7 @@ case &quot;$SYSTEM.$RELEASE&quot; i=
n<br>
            &gt; +@@ -648,7 +645,7 @@ case &quot;$SYSTEM.$RELEASE&quot; i=
n<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; if [ `expr &quot;X$CCARGS&quot; :
            &quot;X.*-DNO_EPOLL&quot;` -gt 0 ]<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; then<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; :<br>
            &gt; @@ -72,7 +72,7 @@ index a740e41..28fb128 100644<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; then<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; echo CCARGS=3D&quot;$CCARGS
            -DNO_EPOLL&quot;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; else<br>
            &gt; -@@ -626,8 +623,6 @@ int&nbsp; &nbsp; &nbsp;main(int arg=
c, char
            **argv)<br>
            &gt; +@@ -672,8 +669,6 @@ int&nbsp; &nbsp; &nbsp;main(int arg=
c, char
            **argv)<br>
            &gt;&nbsp; &nbsp; }<br>
            &gt;&nbsp; &nbsp; EOF<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ${CC-gcc} -o makedefs.test
            makedefs.test.c || exit 1<br>
            &gt; @@ -81,7 +81,7 @@ index a740e41..28fb128 100644<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; rm -f makedefs.test
            makedefs.test.[co]<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; fi;;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;es=
ac<br>
            &gt; -@@ -644,12 +639,12 @@ EOF<br>
            &gt; +@@ -690,12 +685,12 @@ EOF<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ca=
se &quot;$CCARGS&quot; in<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; *=
-DNO_DB*) ;;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; *=
-DHAS_DB*) ;;<br>
            &gt; @@ -97,8 +97,8 @@ index a740e41..28fb128 100644<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;else<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;# On a properly installed system,
            Postfix builds<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;# by including &lt;db.h&gt; and
            by linking with -ldb<br>
            &gt; -@@ -657,12 +652,12 @@ EOF<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;echo &quot;Install the appropriate
            db*-devel package first.&quot; 1&gt;&amp;2<br>
            &gt; +@@ -705,12 +700,12 @@ EOF<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;echo &quot;See: <a href=3D"https://www.postfix.org/N=
ON_BERKELEYDB_README.html#build-conf" rel=3D"noreferrer noreferrer" targe=
t=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">
https://www.postfix.org/NON_BERKELEYDB_README.html#build-conf</a>&quot;
            1&gt;&amp;2<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;exit 1<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;fi<br>
            &gt;&nbsp; &nbsp;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;SYSLIBS=3D&quot;-ldb&quot;<br>
            &gt; @@ -112,6 +112,3 @@ index a740e41..28fb128 100644<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;do<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;test -e $lib/lib$name.a -o -e
            $lib/lib$name.so &amp;&amp; {<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;SYSLIBS=3D&quot;$SYSLIBS -l$name&=
quot;<br>
            &gt; ---<br>
            &gt; -2.25.1<br>
            &gt; -<br>
            &gt; diff --git
a/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-postcon=
f-to-a-variable-for-cross-compil.patch
b/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-postcon=
f-to-a-variable-for-cross-compil.patch<br>
            &gt; index d46efb95cb..a74c46fa92 100644<br>
            &gt; ---
a/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-postcon=
f-to-a-variable-for-cross-compil.patch<br>
            &gt; +++
b/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-postcon=
f-to-a-variable-for-cross-compil.patch<br>
            &gt; @@ -1,4 +1,4 @@<br>
            &gt; -From 953719878466c55572294f42e85127bda5d34999 Mon Sep
            17 00:00:00 2001<br>
            &gt; +From ce8deeaac8ca5d7329e1923790a1f35798953799 Mon Sep
            17 00:00:00 2001<br>
            &gt;&nbsp; &nbsp;From: Li xin &lt;<a href=3D"mailto:lixin.fns=
t@cn.fujitsu.com" target=3D"_blank" rel=3D"noreferrer" moz-do-not-send=3D=
"true" class=3D"moz-txt-link-freetext">lixin.fnst@cn.fujitsu.com</a>&gt;<=
br>
            &gt;&nbsp; &nbsp;Date: Fri, 19 Jun 2015 17:14:58 +0900<br>
            &gt;&nbsp; &nbsp;Subject: [PATCH] Change fixed postconf to a =
variable
            for cross-compiling<br>
            &gt; @@ -12,10 +12,10 @@ Signed-off-by: Yao Zhao &lt;<a href=3D=
"mailto:yao.zhao@windriver.com" target=3D"_blank" rel=3D"noreferrer" moz-=
do-not-send=3D"true" class=3D"moz-txt-link-freetext">yao.zhao@windriver.c=
om</a>&gt;<br>
            &gt;&nbsp; &nbsp; 2 files changed, 11 insertions(+), 9 deleti=
ons(-)<br>
            &gt;&nbsp; &nbsp;<br>
            &gt;&nbsp; &nbsp;diff --git a/Makefile.in b/Makefile.in<br>
            &gt; -index a37f89f..17cb64b 100644<br>
            &gt; +index 8d7501a..d2a85e8 100644<br>
            &gt;&nbsp; &nbsp;--- a/Makefile.in<br>
            &gt;&nbsp; &nbsp;+++ b/Makefile.in<br>
            &gt; -@@ -22,7 +22,7 @@ META&nbsp; &nbsp; &nbsp; &nbsp;=3D me=
ta/main.cf.proto
            meta/master.cf.proto meta/postfix-files \<br>
            &gt; +@@ -23,7 +23,7 @@ META&nbsp; &nbsp; &nbsp; &nbsp;=3D me=
ta/main.cf.proto
            meta/master.cf.proto meta/postfix-files \<br>
            &gt;&nbsp; &nbsp; EXPAND&nbsp; &nbsp; &nbsp;=3D sed -e
            &quot;s;\$${LIB_PREFIX};$(LIB_PREFIX);&quot; \<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;-e &quot;s;\$${L=
IB_SUFFIX};$(LIB_SUFFIX);&quot;<br>
            &gt;&nbsp; &nbsp; SHLIB_DIR_OVERRIDE =3D \<br>
            &gt; @@ -102,6 +102,3 @@ index 563ee27..00d4651 100644<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &quot;daemon_directory =3D $d=
aemon_directory&quot; \<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &quot;data_directory =3D $dat=
a_directory&quot; \<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &quot;command_directory =3D $=
command_directory&quot; \<br>
            &gt; ---<br>
            &gt; -2.25.1<br>
            &gt; -<br>
            &gt; diff --git
a/meta-networking/recipes-daemons/postfix/files/0003-makedefs-Use-native-=
compiler-to-build-makedefs.test.patch
b/meta-networking/recipes-daemons/postfix/files/0003-makedefs-Use-native-=
compiler-to-build-makedefs.test.patch<br>
            &gt; index 6f8e3e84da..201b4741de 100644<br>
            &gt; ---
a/meta-networking/recipes-daemons/postfix/files/0003-makedefs-Use-native-=
compiler-to-build-makedefs.test.patch<br>
            &gt; +++
b/meta-networking/recipes-daemons/postfix/files/0003-makedefs-Use-native-=
compiler-to-build-makedefs.test.patch<br>
            &gt; @@ -1,4 +1,4 @@<br>
            &gt; -From a8ec63a71361ccd3f6d2959c4c87b7824282b291 Mon Sep
            17 00:00:00 2001<br>
            &gt; +From fc51d9145210350577fdb29a9b0680df779ae347 Mon Sep
            17 00:00:00 2001<br>
            &gt;&nbsp; &nbsp;From: Khem Raj &lt;<a href=3D"mailto:raj.khe=
m@gmail.com" target=3D"_blank" rel=3D"noreferrer" moz-do-not-send=3D"true=
" class=3D"moz-txt-link-freetext">raj.khem@gmail.com</a>&gt;<br>
            &gt;&nbsp; &nbsp;Date: Sat, 26 Aug 2017 10:29:37 -0700<br>
            &gt;&nbsp; &nbsp;Subject: [PATCH] makedefs: Use native compil=
er to
            build makedefs.test<br>
            &gt; @@ -13,10 +13,10 @@ Signed-off-by: Khem Raj &lt;<a href=3D=
"mailto:raj.khem@gmail.com" target=3D"_blank" rel=3D"noreferrer" moz-do-n=
ot-send=3D"true" class=3D"moz-txt-link-freetext">raj.khem@gmail.com</a>&g=
t;<br>
            &gt;&nbsp; &nbsp; 1 file changed, 5 insertions(+), 5 deletion=
s(-)<br>
            &gt;&nbsp; &nbsp;<br>
            &gt;&nbsp; &nbsp;diff --git a/makedefs b/makedefs<br>
            &gt; -index 28fb128..313b401 100644<br>
            &gt; +index 9713327..e879832 100644<br>
            &gt;&nbsp; &nbsp;--- a/makedefs<br>
            &gt;&nbsp; &nbsp;+++ b/makedefs<br>
            &gt; -@@ -622,7 +622,7 @@ int&nbsp; &nbsp; &nbsp;main(int arg=
c, char
            **argv)<br>
            &gt; +@@ -668,7 +668,7 @@ int&nbsp; &nbsp; &nbsp;main(int arg=
c, char
            **argv)<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; exit(0);<br>
            &gt;&nbsp; &nbsp; }<br>
            &gt;&nbsp; &nbsp; EOF<br>
            &gt; @@ -25,7 +25,7 @@ index 28fb128..313b401 100644<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; rm -f makedefs.test
            makedefs.test.[co]<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; fi;;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;es=
ac<br>
            &gt; -@@ -865,7 +865,7 @@ int&nbsp; &nbsp; &nbsp;main(int arg=
c, char
            **argv)<br>
            &gt; +@@ -914,7 +914,7 @@ int&nbsp; &nbsp; &nbsp;main(int arg=
c, char
            **argv)<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; exit(0);<br>
            &gt;&nbsp; &nbsp; }<br>
            &gt;&nbsp; &nbsp; EOF<br>
            &gt; @@ -34,7 +34,7 @@ index 28fb128..313b401 100644<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; ./makedefs.test 2&gt;/dev/null ||<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;CCARGS=3D&quot;$CCARGS -DNO_SIGSETJMP&quot;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; rm -f makedefs.test makedefs.test.[co]<br>
            &gt; -@@ -903,7 +903,7 @@ int main(int argc, char **argv)<br>
            &gt; +@@ -952,7 +952,7 @@ int main(int argc, char **argv)<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&amp;error) =
!=3D 14);<br>
            &gt;&nbsp; &nbsp; }<br>
            &gt;&nbsp; &nbsp; EOF<br>
            &gt; @@ -43,7 +43,7 @@ index 28fb128..313b401 100644<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;$icu_ldflags &gt;/dev/null
            2&gt;&amp;1<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;if ./makedefs.test 2&gt;/dev/null ;
            then<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;CCARGS=3D&quot;$CCARGS $icu_cppflags&quot;<br>
            &gt; -@@ -1024,7 +1024,7 @@ int&nbsp; &nbsp; &nbsp;main(void)=
<br>
            &gt; +@@ -1088,7 +1088,7 @@ int&nbsp; &nbsp; &nbsp;main(void)=
<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; exit(ferror(stdout) ? 1 : 0);=
<br>
            &gt;&nbsp; &nbsp; }<br>
            &gt;&nbsp; &nbsp; EOF<br>
            &gt; @@ -52,7 +52,7 @@ index 28fb128..313b401 100644<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; ./makedefs.test || exit 1<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; rm -f makedefs.test makedefs.=
test.[co]<br>
            &gt;&nbsp; &nbsp; }<br>
            &gt; -@@ -1180,7 +1180,7 @@ int&nbsp; &nbsp; &nbsp;main(void)=
<br>
            &gt; +@@ -1245,7 +1245,7 @@ int&nbsp; &nbsp; &nbsp;main(void)=
<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; exit(ferror(stdout) ? 1 : 0);=
<br>
            &gt;&nbsp; &nbsp; }<br>
            &gt;&nbsp; &nbsp; EOF<br>
            &gt; @@ -61,6 +61,3 @@ index 28fb128..313b401 100644<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;parm_val=3D`./makedefs.test` |=
| exit 1<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;rm -f makedefs.test makedefs.t=
est.[co]<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;eval ${parm_name}=3D\&quot;&qu=
ot;\$parm_val&quot;\&quot;<br>
            &gt; ---<br>
            &gt; -2.25.1<br>
            &gt; -<br>
            &gt; diff --git
a/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu-config.patch
b/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu-config.patch=
<br>
            &gt; index 0660ee098e..daf5c7089e 100644<br>
            &gt; ---
a/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu-config.patch=
<br>
            &gt; +++
b/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu-config.patch=
<br>
            &gt; @@ -1,4 +1,4 @@<br>
            &gt; -From 404150f53bb49af987d7338a808f47fdbd50ba7f Mon Sep
            17 00:00:00 2001<br>
            &gt; +From b63facf538af99e7c79ebee8d41abd52e7d5ee5e Mon Sep
            17 00:00:00 2001<br>
            &gt;&nbsp; &nbsp;From: Khem Raj &lt;<a href=3D"mailto:raj.khe=
m@gmail.com" target=3D"_blank" rel=3D"noreferrer" moz-do-not-send=3D"true=
" class=3D"moz-txt-link-freetext">raj.khem@gmail.com</a>&gt;<br>
            &gt;&nbsp; &nbsp;Date: Sun, 16 Jan 2022 11:21:54 +0800<br>
            &gt;&nbsp; &nbsp;Subject: [PATCH] Fix icu config<br>
            &gt; @@ -18,10 +18,10 @@ Signed-off-by: Khem Raj &lt;<a href=3D=
"mailto:raj.khem@gmail.com" target=3D"_blank" rel=3D"noreferrer" moz-do-n=
ot-send=3D"true" class=3D"moz-txt-link-freetext">raj.khem@gmail.com</a>&g=
t;<br>
            &gt;&nbsp; &nbsp; 1 file changed, 1 deletion(-)<br>
            &gt;&nbsp; &nbsp;<br>
            &gt;&nbsp; &nbsp;diff --git a/makedefs b/makedefs<br>
            &gt; -index 313b401..e5db212 100644<br>
            &gt; +index e879832..f9c132e 100644<br>
            &gt;&nbsp; &nbsp;--- a/makedefs<br>
            &gt;&nbsp; &nbsp;+++ b/makedefs<br>
            &gt; -@@ -906,7 +906,6 @@ EOF<br>
            &gt; +@@ -955,7 +955,6 @@ EOF<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;${BUILD_CC-gcc} -o makedefs.test
            makedefs.test.c $icu_cppflags \<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;$icu_ldflags &gt;/dev/null
            2&gt;&amp;1<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;if ./makedefs.test 2&gt;/dev/null ;
            then<br>
            &gt; @@ -29,6 +29,3 @@ index 313b401..e5db212 100644<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;SYSLIBS=3D&quot;$SYSLIBS $icu_ldflags&quot;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;else<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;CCARGS=3D&quot;$CCARGS -DNO_EAI&quot;<br>
            &gt; ---<br>
            &gt; -2.25.1<br>
            &gt; -<br>
            &gt; diff --git
a/meta-networking/recipes-daemons/postfix/files/0005-makedefs-add-lnsl-an=
d-lresolv-to-SYSLIBS-by-default.patch
b/meta-networking/recipes-daemons/postfix/files/0005-makedefs-add-lnsl-an=
d-lresolv-to-SYSLIBS-by-default.patch<br>
            &gt; index 1571aa844d..c2e640d6ff 100644<br>
            &gt; ---
a/meta-networking/recipes-daemons/postfix/files/0005-makedefs-add-lnsl-an=
d-lresolv-to-SYSLIBS-by-default.patch<br>
            &gt; +++
b/meta-networking/recipes-daemons/postfix/files/0005-makedefs-add-lnsl-an=
d-lresolv-to-SYSLIBS-by-default.patch<br>
            &gt; @@ -1,4 +1,4 @@<br>
            &gt; -From 25e7d1a9bc64f39666eb0e2b9b175773615e28d2 Mon Sep
            17 00:00:00 2001<br>
            &gt; +From fb5b16db0282b5d80edb0ccc6f0f197a7f663610 Mon Sep
            17 00:00:00 2001<br>
            &gt;&nbsp; &nbsp;From: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@=
windriver.com" target=3D"_blank" rel=3D"noreferrer" moz-do-not-send=3D"tr=
ue" class=3D"moz-txt-link-freetext">yi.zhao@windriver.com</a>&gt;<br>
            &gt;&nbsp; &nbsp;Date: Fri, 12 Oct 2018 12:38:02 +0800<br>
            &gt;&nbsp; &nbsp;Subject: [PATCH] makedefs: add -lnsl and -lr=
esolv to
            SYSLIBS by default<br>
            &gt; @@ -14,10 +14,10 @@ Signed-off-by: Yi Zhao &lt;<a href=3D=
"mailto:yi.zhao@windriver.com" target=3D"_blank" rel=3D"noreferrer" moz-d=
o-not-send=3D"true" class=3D"moz-txt-link-freetext">yi.zhao@windriver.com=
</a>&gt;<br>
            &gt;&nbsp; &nbsp; 1 file changed, 2 insertions(+), 20 deletio=
ns(-)<br>
            &gt;&nbsp; &nbsp;<br>
            &gt;&nbsp; &nbsp;diff --git a/makedefs b/makedefs<br>
            &gt; -index e5db212..b00049b 100644<br>
            &gt; +index f9c132e..5ebef5b 100644<br>
            &gt;&nbsp; &nbsp;--- a/makedefs<br>
            &gt;&nbsp; &nbsp;+++ b/makedefs<br>
            &gt; -@@ -577,16 +577,7 @@ case &quot;$SYSTEM.$RELEASE&quot; =
in<br>
            &gt; +@@ -623,16 +623,7 @@ case &quot;$SYSTEM.$RELEASE&quot; =
in<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;SYSLIBS=3D&quot;$SYSLIBS -ldb&quot;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;;;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;es=
ac<br>
            &gt; @@ -35,7 +35,7 @@ index e5db212..b00049b 100644<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;# =
Kernel 2.4 added IPv6<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ca=
se &quot;$RELEASE&quot; in<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;2.=
[0-3].*) CCARGS=3D&quot;$CCARGS -DNO_IPV6&quot;;;<br>
            &gt; -@@ -655,16 +646,7 @@ EOF<br>
            &gt; +@@ -703,16 +694,7 @@ EOF<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;SYSLIBS=3D&quot;$SYSLIBS -ldb&quot;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;;;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;es=
ac<br>
            &gt; @@ -53,6 +53,3 @@ index e5db212..b00049b 100644<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;SY=
SLIBS=3D&quot;$SYSLIBS -ldl&quot;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;: =
${SHLIB_SUFFIX=3D.so}<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;: =
${SHLIB_CFLAGS=3D-fPIC}<br>
            &gt; ---<br>
            &gt; -2.25.1<br>
            &gt; -<br>
            &gt; diff --git a/meta-networking/recipes-daemons/postfix/<a =
href=3D"http://postfix_3.10.9.bb" rel=3D"noreferrer noreferrer" target=3D=
"_blank" moz-do-not-send=3D"true">postfix_3.10.9.bb</a>
            b/meta-networking/recipes-daemons/postfix/<a href=3D"http://p=
ostfix_3.11.2.bb" rel=3D"noreferrer noreferrer" target=3D"_blank" moz-do-=
not-send=3D"true">postfix_3.11.2.bb</a><br>
            &gt; similarity index 98%<br>
            &gt; rename from meta-networking/recipes-daemons/postfix/<a h=
ref=3D"http://postfix_3.10.9.bb" rel=3D"noreferrer noreferrer" target=3D"=
_blank" moz-do-not-send=3D"true">postfix_3.10.9.bb</a><br>
            &gt; rename to meta-networking/recipes-daemons/postfix/<a hre=
f=3D"http://postfix_3.11.2.bb" rel=3D"noreferrer noreferrer" target=3D"_b=
lank" moz-do-not-send=3D"true">postfix_3.11.2.bb</a><br>
            &gt; index 633e4a7a0d..894e58261b 100644<br>
            &gt; --- a/meta-networking/recipes-daemons/postfix/<a href=3D=
"http://postfix_3.10.9.bb" rel=3D"noreferrer noreferrer" target=3D"_blank=
" moz-do-not-send=3D"true">postfix_3.10.9.bb</a><br>
            &gt; +++ b/meta-networking/recipes-daemons/postfix/<a href=3D=
"http://postfix_3.11.2.bb" rel=3D"noreferrer noreferrer" target=3D"_blank=
" moz-do-not-send=3D"true">postfix_3.11.2.bb</a><br>
            &gt; @@ -26,11 +26,10 @@ SRC_URI =3D &quot;<a href=3D"http://=
ftp.porcupine.org/mirrors/postfix-release/official/postfix-$%7BP" rel=3D"=
noreferrer noreferrer" target=3D"_blank" moz-do-not-send=3D"true">http://=
ftp.porcupine.org/mirrors/postfix-release/official/postfix-${P</a><br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            <a class=3D"moz-txt-link-freetext" href=3D"file://0003-makede=
fs-Use-native-compiler-to-build-makedefs.test.patch">file://0003-makedefs=
-Use-native-compiler-to-build-makedefs.test.patch</a>
            \<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <a class=
=3D"moz-txt-link-freetext" href=3D"file://0004-Fix-icu-config.patch">file=
://0004-Fix-icu-config.patch</a> \<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            <a class=3D"moz-txt-link-freetext" href=3D"file://0005-makede=
fs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch">file://0005-makedefs=
-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch</a>
            \<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp;<a class=3D"moz-txt-link-freetext" href=3D"file://0001-=
makedefs-Account-for-linux-7.x-version.patch">file://0001-makedefs-Accoun=
t-for-linux-7.x-version.patch</a> \<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <a class=
=3D"moz-txt-link-freetext" href=3D"file://0001-Fix-build-with-musl.patch"=
>file://0001-Fix-build-with-musl.patch</a> \<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;<b=
r>
            &gt;&nbsp; &nbsp;<br>
            &gt; -SRC_URI[sha256sum] =3D
            &quot;d4b4daab0af2e0c16c0d2d5ac3c7680d5ebd2001ea054f7f2a601c7=
59801bc13&quot;<br>
            &gt; +SRC_URI[sha256sum] =3D
            &quot;daed65b08c9288cdb386a914f3e52cdddd44935407b5ce5aee8bcc3=
aa4207778&quot;<br>
            &gt;&nbsp; &nbsp;<br>
            &gt;&nbsp; &nbsp;UPSTREAM_CHECK_URI =3D &quot;<a href=3D"http=
s://www.postfix.org/announcements.html" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">h=
ttps://www.postfix.org/announcements.html</a>&quot;<br>
            &gt;&nbsp; &nbsp;UPSTREAM_CHECK_REGEX =3D
            &quot;postfix-(?P&lt;pver&gt;\d+(\.\d+)+)&quot;<br>
            &gt;<br>
            &gt; <br>
            &gt;<br>
          </blockquote>
        </div>
      </div>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre wrap=3D"" class=3D"moz-quote-pre">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#126995): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-devel/message/126995">https:=
//lists.openembedded.org/g/openembedded-devel/message/126995</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/119323966/3616873">https://lists.openembedded.org/mt=
/119323966/3616873</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.=
openembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/=
g/openembedded-devel/unsub</a> [<a class=3D"moz-txt-link-abbreviated" hre=
f=3D"mailto:changqing.li@windriver.com">changqing.li@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
  </body>
</html>

--------------CKwJDZ2VPjqyxLTyb0AJ669Z--

