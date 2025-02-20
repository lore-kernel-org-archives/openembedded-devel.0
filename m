Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ED4CC021AA
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 02:27:49 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.40762.1740018461776547660
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Feb 2025 18:27:41 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=41461f232d=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51K1iIca018914
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Feb 2025 18:27:41 -0800
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2043.outbound.protection.outlook.com [104.47.58.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44w00k9u97-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Feb 2025 18:27:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DdrwMaWNzdFkqYYqR22ad6+GCjHSA4yZ32D1JnG8TGim5hd+BjHOJJGzoLBzLQ1WgB0IZkssunZ/Zj3pqPfKalLvWQ2kfX6fwdmyai/IsPCRdOEM+uTG9LYNsx1Dac9AoGy99XPLymfgOQkuo4fP/kN5FJARearfLtIdXJxeK5XRbVxx3NaE1Xjics25tyKChXNGkz3qEAohN0MHwtERzay4ozVXRQSsT5nCPuecjDD0HjTwbZpEuIu0iOa+RBjeHYpq+OfQLEha8oQhx//nYjtwKLtNq6XBtYSE+CxDnUI7aE9sBMloIkBn5fSD/Kxj+lekgiBl6KgDrxo/9+aYEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sq+Y4Ve7fG/79knfAqbomW5q5z6z4VzvzdW3X2RARaA=;
 b=v9L5k5CXDOQoy0rbuM2+ePbew/lKfLd/5L1JWXCPDKjfG1XMZ5uSszdMMl0c/gjEifhyBBX5Mv3Ypu8DgekvQM3kfyi9ta2RfFYdSvxYoAj6JLgCo1c3VU3ILN73ReqBqpN56x55/HPXSvydkL9TOqszMKi+NtpolT1VIQdgpJivlG3tFuzhBpp/x2q3m74UZHuZTdlaUx2p68ibFsnP8iTIypc+tRR3draMQ6nSsIAPOhg/q4l1BmabC9hyRrGjCmBlrNmY+IfsN8q0Vca4Lj6DCDXbq3psVvNMcz6z1mGeLFaY/fu1/Glei3QSqKi+6rannmaLJib367ZPBr6FPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5533.namprd11.prod.outlook.com (2603:10b6:5:38a::7) by
 DS7PR11MB8856.namprd11.prod.outlook.com (2603:10b6:8:253::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8466.14; Thu, 20 Feb 2025 02:27:35 +0000
Received: from DM4PR11MB5533.namprd11.prod.outlook.com
 ([fe80::8ce3:74f6:33ca:3dfd]) by DM4PR11MB5533.namprd11.prod.outlook.com
 ([fe80::8ce3:74f6:33ca:3dfd%6]) with mapi id 15.20.8445.020; Thu, 20 Feb 2025
 02:27:34 +0000
From: jinfeng.wang.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone][meta-networking][PATCH] net-snmp: fix memory leak
Date: Thu, 20 Feb 2025 10:27:18 +0800
Message-Id: <20250220022718.1648508-1-jinfeng.wang.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: TYCPR01CA0148.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::7) To DM4PR11MB5533.namprd11.prod.outlook.com
 (2603:10b6:5:38a::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5533:EE_|DS7PR11MB8856:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fff3dea-ceb3-4354-048a-08dd5156229a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZDZEcVg3aU5rNkd4WW00M1E1bklEZVJhMlAzWWlpU3RrTHJVR3dxZE5iQ0tJ?=
 =?utf-8?B?aXJ4bDJhZ2Rld3dla3BMcENUNHhtTDFPbUJNdmpORXF3RGkxaXlxUXZ2eW1L?=
 =?utf-8?B?Y3RBS0FhQ2VtT0t1WWxsR0Vra2dFaVhHN2NRNi9ZZzU1SEpzblo0MVJKMnhK?=
 =?utf-8?B?clVYWkU2NjJWSGpPM1JxZzVFZlVDRy9qUVRWUGVOeEFSRmxJanI2ZVlIOFhR?=
 =?utf-8?B?SnpyNnN3WFlTZXVmWE9Sd2lXV3J5cUhVcVIvUjhJRTB2aTZGNW13MkZxMXN2?=
 =?utf-8?B?djJRVk1nRUhWODhnSjdIOVdsNk9sWU5LR09oR1NqZ2ppVStHOWNTWnllMUM2?=
 =?utf-8?B?Z0tsanVRL0Q4M0o5TitNb1poVlkvQ1RjNU53SFpNMyt4c2RmVXBHZGljVXZ0?=
 =?utf-8?B?bUh1TWg3QkVhbWhWT25JWVJUY2ZBMHRJb2NYVGxLYjVPY0hjU0hDRjB5RlRL?=
 =?utf-8?B?eHl4WDBuaUhiVjU3b1ZlSVZGai8xY1dORjVaY2lQR3h2eWVYOElMQktBZUhn?=
 =?utf-8?B?WGNueUhaY3hIQTN5L2xTZ3JmUitUNUJRc255cjZGYW9WeHNlWm02QjVPNkVa?=
 =?utf-8?B?L2JHNVhzTWRCZmZjbGxSZTVZWFJUNmJEazk3bGIyVUtlanFTNTU3WUl4M0Jr?=
 =?utf-8?B?d2NhdmJGdE41Y1l4enRNOUtOaUppNzl4NC9QeHpSWTZ4SFUxUDFCYUd6aEgv?=
 =?utf-8?B?dXJIRGxtRkdyUUtYWWNsU0M3RTI1N1cyeXNIUFNZYlllU0tsYTdFdkZWRkV1?=
 =?utf-8?B?WGhxUjdYMHdtM0FXZnR6dW5UNXM5RzR5QTlOUjRnQ2praUhFcGkwNFhtVHUx?=
 =?utf-8?B?WG9zdG1XUmVXSGhyNUJHWXpMVlo0OXAraTlWQTJ1NExhTHpDMEpkdVlIVnhI?=
 =?utf-8?B?RjNiV3F1OEF5ZFA4Qis1QXhkOVpPZksyRTdvL1AvZlBzNFlNRDRJQUdmV2Zx?=
 =?utf-8?B?eThGSG1vNE8wYlhQdnNTL2tFOGttNVdQSUpYbWM3ZysyczBOc3hCb2duVlh0?=
 =?utf-8?B?Tm1RbzQvWnRqazVZaTF3dkVvQm1OZmswcmhTOFptZm9CYU5QLzJIcDBLcWNx?=
 =?utf-8?B?dkVPWUZYN0llR1VRYnQwRUdyUldBQUlZencwOEdNZjNIVE5kSWtYMmd6NDJa?=
 =?utf-8?B?SHZDZnRGdzJuU01meFdGb2x3VWJHazdTZzNkdWlPME9WL1ZhR1BhdXNobVor?=
 =?utf-8?B?YWgyUXpxdGhHT3p1bVV0MHJLMmxDRjQzTFNsUkMzc2k2aWhQL3MwSkY1Z25u?=
 =?utf-8?B?WUdOemMyRWQ3ZnJZUVRBakRjTXQyQU9rcjMvT0w0ZXErNGo5a2U0TG1wS3JF?=
 =?utf-8?B?RHVJZkthYmNvQUlOUUJ6cDA3ZVhQWEJwYndzWExNRUlJMkUyeDJ6UVFpM3ZT?=
 =?utf-8?B?TFNwcTRkZVF5a3JPWDBnWWpqVUh1UHpjWWUzK3ZleVdkU0Zzc0RTRlJkanR0?=
 =?utf-8?B?dmVBYlVjSTdDd3p6SzY3T05FZldJNzhUM2JBSUtiVUx3Nm96c0pSeGJPZ2Vv?=
 =?utf-8?B?VEZXUWJsQ0ZvU21pU05VUVlsTGxGTDdmc2dsMnJneWJTS3lJOVdOQ1kyM2hn?=
 =?utf-8?B?Q0NNM1BkTnNwZFY4a3Q2azErUURxalFqdktKOVF1a0ZtVm9udmU5ZkoweDNx?=
 =?utf-8?B?eU1lVXdGTlFrT2IvN2taeXlWTzY0MklNN1p5aktpRy92ZVkwRjUrQVpwVVpx?=
 =?utf-8?B?OXhpandsdXFoT3IrYm05dGVHMFd4OHMwT3JMeWVZVHFmL3FkRlB6OWlMUnRR?=
 =?utf-8?B?NzhvR0daZHBkUGtlV1pUbjMvUG5lRVNla3pQSU9qTkpWZjZKZzFZMzNQVHBD?=
 =?utf-8?B?VzRBbllZUzlLVlcyTVpUVjNXMGVKelk1bDZ1UFFOZzlUdUlnZVhZVTc5RWt5?=
 =?utf-8?B?cWJBQktsaVZJZ0ZIRHI1cldwU3lTT2I0aVdGcVdEcG8zdjhGSklGOHJKRjYr?=
 =?utf-8?Q?M80deNyD9AKHmdJ7SO9p7jEli6cCu85w?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5533.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NUF6TmZmdFlubkhmSFdoMnZKSXFlSUVreVI3ekFPNnNCeUhqQ3pQT1ZUTFAw?=
 =?utf-8?B?WGR4OHF1VWZEMG5IOVRuOTJkWm5teFNMMHlTUzRBUkZYaWEwQW9WeXBZS3Bq?=
 =?utf-8?B?SnRIdGV4SG01VGJtVE8vTzd2bVA2a3daUDhRWkVZOHFHYUJrcGtER0lVdVBY?=
 =?utf-8?B?T0tXVXNzQVdxL0gzQkxPY0IzOHRjTWtEQmhwbWdqL0JCYlkyVC9nVzhGNkxs?=
 =?utf-8?B?aFJIMy9WVHd0R2hoVlRhejRZMitQR0pXK1hQSXd6MUNjbDBndUsvMUtBNnRs?=
 =?utf-8?B?SDRTNEMyaldkRUsvUkVHR2Q0NDRVOGxRZ3lhWlF1TWF3VDhML2xJaDh2amhp?=
 =?utf-8?B?NnAxc2pFMVZ1VnlCOTBJS3lCbG5mMWlwUjBjbW5yLzhwd1hOaldpTUpyOGNR?=
 =?utf-8?B?bXV3M1puMkw5SmlhcHEzVGtZZHVIL3gxTzJob1ZubmhNMUIyaXpaamFTMVll?=
 =?utf-8?B?S2NOYUhDdmhrOTBreUVwZE83eDNtN09KYU1JY2YxYmgzN3d5Q1NzL2NsT3ov?=
 =?utf-8?B?VDZKL0dsbWltSlpCYmRURmFQbDRib3pmUUtXZTd5bUFvQkRKaEFtUWpDSlZ0?=
 =?utf-8?B?WGxNOSs0cHVHd1VVN28xNmZvVHU4YVhWblY5TlNCbG9ZcjhyZEFndkFabWlN?=
 =?utf-8?B?WWZRdVdFVnJRcXA1alBpQ0pRYnJ2NG4yRStNL0htYitzb3FyQWJwaVdhNWFE?=
 =?utf-8?B?VS9OUVJSQ0VFSWVjQ2J1blVON2hibnUwYlNadU5VYk1lQUhUK2sveFcrVzhR?=
 =?utf-8?B?eGRVYzdPaHI5U2xBczZNb2xUM1JPRXhwQ012UFoyc0FueVpaWHY1UjFoa0pO?=
 =?utf-8?B?SjhwZFVWRVMzZjFoc2h4ZmZGU25NUDZIbG00UGlPYU1tMWlNUG9oeU56OVBa?=
 =?utf-8?B?ZGlWODA0VU5IWUxwQlVTVUxsU3FkUUNUc1U2NXBNOStsYysrbUtnYVpMcTFE?=
 =?utf-8?B?RjcvMlBHRnFORW96Y29MbXdLV1hQL083MlBOditGMS8rN1RpQ1hQRHdNV002?=
 =?utf-8?B?V1BMNWd6OUx6UzljNTRQZm1DS1IwaGxMZGltTEtpcjMxS3JFRFBIdlVESEhV?=
 =?utf-8?B?bDRRc2Y4Z1J1OTBDQmNneWFBTXJMdndQTEh0Rkl0bXVsejdNSnhodXprNWF1?=
 =?utf-8?B?b1dxZCtybVkrYWFCZ3hYUnhwcStxRUdwa2cyN1gyUENLRk9OdnFFRDZkSWFa?=
 =?utf-8?B?cnJUcURWVFZKK3VNcm5hcFo2RFRWWUNnazhZS3JBNlQwZ3FVN3Nldll4dE9L?=
 =?utf-8?B?SWh6MmFOVXY5bGEyVlovMG9Rc0Z5anRaSEtIMCtnTGdLRDVHOVVMaDA4b0R2?=
 =?utf-8?B?ZWt3SW1YcUlrNW5wVXRpMlcwbjZWblJKL2x6YzFQQ3QyNUFqTEhweEdON1FU?=
 =?utf-8?B?NzYrY3NpS2VFZ2pNdFdKUG5WMURHbVgzYlk0bVVSc0xDTzNwNEYyV0s5ZlJ5?=
 =?utf-8?B?T1lZN0VrWjZva1M3dStFSFgweENqRGNZWVVUSXNoZFZ0M0hSS21Od0hHNHdh?=
 =?utf-8?B?aG9hbkNRTHBOU084RDZaVXExdlJqdHdSMllGcjNDRnU5QXZrTjI3MnJUdnZT?=
 =?utf-8?B?SFcwcFZydWU3ZThiSFMwSzRrZklQd1BnMERmeHJ3Z1c1UFN1UXUrMlM2dWRv?=
 =?utf-8?B?bStmRXc0ZmRSYlpLWC9kdXBjOGJrWU5iV1kra2phcGFSY21qYzVOckFYSlZU?=
 =?utf-8?B?Q05uUTZNZ1QrbTVjd2svN1BTN0RwQStQYWhkZjVQdWZ2bzRDdmViTXNqUm9j?=
 =?utf-8?B?QTRCeTRWWnZsaTR5Zm51WDFOQTUvM0ZiNXNURTdYemxUWWtONXl2Qnh2V3F1?=
 =?utf-8?B?SzFuYVQwQ1F3YVdKVEZNT3VYQngxOUFNdTlpYlh3MlFlenROc3VUMmNmWDRQ?=
 =?utf-8?B?bVdYa29iQi9YSVlBMFFodFA5aVBLNk1PZFc1YWFySzFqTlljWGZaQW5IK1Bh?=
 =?utf-8?B?SDB1ODF0UDZmdVRSK0hOS3hLb2pJNEM5QXVzd0RUZFBZNThZL1pTUjFWSndr?=
 =?utf-8?B?dmhTY09lSkk0MGZ0RSthWU5za1R0NXE0WmN2b1llQmh4NjA3QXBOSUZKTXNW?=
 =?utf-8?B?UXVWcXIzR0tEL0FaTGFkOHhDbHoyaW00aUcxRVB0VWFVdW12RVk4TytDYlVE?=
 =?utf-8?B?QTFJMXprN3J6OTZ3V0wyWWhHRm02TjAxTUxMSG5tN1d0eWlXZlVONXNrQk8r?=
 =?utf-8?B?M0E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fff3dea-ceb3-4354-048a-08dd5156229a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5533.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 02:27:34.7954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: clhDizt0vl5Xqb1p5mPEShngxgbENJe83TvRhI+IYxftcfbWl1MJ6ludliwCw0lfrnGb3sWaBY89BdNz4HUWZIL+E3D+rW34wX3ANrSkTm4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8856
X-Authority-Analysis: v=2.4 cv=N67TF39B c=1 sm=1 tr=0 ts=67b6931d cx=c_pps a=S2IcI55zTQM2EKrhu3zyRw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=ThMX_IV2AAAA:8 a=v1Kj5RQZ9JAl_cKxDAUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=RVmHIydaz68A:10 a=FdTzh2GWekK77mhwV6Dw:22 a=0jcnvs3wCqEDeep41k2a:22
X-Proofpoint-ORIG-GUID: atWm1jGC-3lG8IPr6Cy4ZKr1yEWtImxJ
X-Proofpoint-GUID: atWm1jGC-3lG8IPr6Cy4ZKr1yEWtImxJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_11,2025-02-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 suspectscore=0 clxscore=1011 bulkscore=0 spamscore=0 priorityscore=1501
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502200017
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 51K1iIca018914
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Feb 2025 02:27:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115527

From: Jinfeng Wang <jinfeng.wang.cn@windriver.com>

Backport patch [1] to fix memory leak by freeing tclist
[1] https://github.com/net-snmp/net-snmp/commit/4bd0d9a8a2860c2c46307aef5=
ee1ccc69f7e3b62

Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
---
 ...bs-fix-memory-leak-by-freeing-tclist.patch | 40 +++++++++++++++++++
 .../net-snmp/net-snmp_5.9.3.bb                |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0=
001-unload_all_mibs-fix-memory-leak-by-freeing-tclist.patch

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-unl=
oad_all_mibs-fix-memory-leak-by-freeing-tclist.patch b/meta-networking/re=
cipes-protocols/net-snmp/net-snmp/0001-unload_all_mibs-fix-memory-leak-by=
-freeing-tclist.patch
new file mode 100644
index 0000000000..3632881501
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-unload_all=
_mibs-fix-memory-leak-by-freeing-tclist.patch
@@ -0,0 +1,40 @@
+From 4bd0d9a8a2860c2c46307aef5ee1ccc69f7e3b62 Mon Sep 17 00:00:00 2001
+From: JanSoundhouse <jan.sondhauss@wago.com>
+Date: Mon, 5 Sep 2022 11:25:58 +0200
+Subject: [PATCH] unload_all_mibs: fix memory leak by freeing tclist
+
+tclist is always allocated in netsnmp_init_mib_internals, when doing mul=
tiple init_snmp("")/snmp_shutdown("") this memory is never free'd.
+
+Upstream-Status: Backport [https://github.com/net-snmp/net-snmp/commit/4=
bd0d9a8a2860c2c46307aef5ee1ccc69f7e3b62]
+
+Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
+---
+ snmplib/parse.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/snmplib/parse.c b/snmplib/parse.c
+index b3e2f3ae5c..71bdf75ff8 100644
+--- a/snmplib/parse.c
++++ b/snmplib/parse.c
+@@ -28,7 +28,7 @@ ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFOR=
MANCE OF THIS
+ SOFTWARE.
+ ******************************************************************/
+ /*
+- * Copyright =EF=BF=BD 2003 Sun Microsystems, Inc. All rights reserved.
++ * Copyright =C2=A9 2003 Sun Microsystems, Inc. All rights reserved.
+  * Use is subject to license terms specified in the COPYING file
+  * distributed with the Net-SNMP package.
+  */
+@@ -4215,7 +4215,8 @@ unload_all_mibs(void)
+         if (ptc->description)
+             free(ptc->description);
+     }
+-    memset(tclist, 0, tc_alloc * sizeof(struct tc));
++    SNMP_FREE(tclist);
++    tc_alloc =3D 0;
+=20
+     memset(buckets, 0, sizeof(buckets));
+     memset(nbuckets, 0, sizeof(nbuckets));
+--=20
+2.34.1
+
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb=
 b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb
index eb8e1599fb..88466c94b4 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb
@@ -27,6 +27,7 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${=
PV}.tar.gz \
            file://reproducibility-have-printcap.patch \
            file://0001-ac_add_search_path.m4-keep-consistent-between-32b=
it.patch \
            file://CVE-2022-44792-CVE-2022-44793.patch \
+           file://0001-unload_all_mibs-fix-memory-leak-by-freeing-tclist=
.patch \
            "
 SRC_URI[sha256sum] =3D "2097f29b7e1bf3f1300b4bae52fa2308d0bb8d5d3998dbe0=
2f9462a413a2ef0a"
=20
--=20
2.34.1


