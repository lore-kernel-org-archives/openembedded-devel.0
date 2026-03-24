Return-Path: <guocai.he.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2888FF532EB
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 07:57:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14976.1774339044400695317
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2026 00:57:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=kFwFkIwY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7543dbf287=guocai.he.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O4t27U2093647
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 00:57:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=D3J3XS8dNkhj9Sgxjlm7cp2IYpJXm/JqYiZW+MjyHN0=; b=kFwFkIwYV+/T
	VHFpbjLyGJtWAFJJ+wCEr2yEGUgK8ujOQ92WpaplhuKqKCt4sAtNrjCZn/Cazii2
	zHvgo2tbYgmiJG7nSPiJuvytDNxiAeRAEcZTng71xIN/HrNkG2ZCPiOWjVgPRmRI
	Ll/rb3wNt9ipqKoDlzkKAOhcE2nEE1GuSZC/kVM8aq462DWPrF+dBD9sCva5lfUC
	ms1A+sijrE5X6YXS3v9woq6PnUqi5xMnHTRsUb+ha4yHHUSiQlgY0N3zviSiHWbB
	MriUErFOCtqrJiePpOkgNHb6Xev3tkNnqfu57/oOJJQlUW2ti9Xur3W6ea53YfFf
	qYDRH+z1/A==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010061.outbound.protection.outlook.com [52.101.56.61])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1tuctqmk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Mar 2026 00:57:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JLVauhnd15zlV0hRMpWeVMzIvk2yUMegq2I17U4mRMa4x+KW9Iuu4r+QTZwCNBC9Fb/t4OTmECQ4fKKYpXXAHIvgU3RxVi0G7i6003lMYhmXvnazJKT1IBzrBcJ8B1G1JJf5FygO0VB9/weg13AHUbeT8BqeGU9kWeEw1aL2OIe6++7WFc/HjWRUvVToaOPiNiLzV5Tx2RQxK2XC1JfjfyXdekGiSORxzNiuUvTM/gux+AWLwIBBEfd4X+tojdqFOqxqvO7OKizHbwyxDLOtYX8PdmvWz1SjH1n5/O7Ag7d5aseynnIwDvpsQ7jQM6HQkc0WrB48KXu4Gl75y8NYQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D3J3XS8dNkhj9Sgxjlm7cp2IYpJXm/JqYiZW+MjyHN0=;
 b=HKM487C30V5dwe5+4ouy47pVSYyf3wDkRlW5edmflM8ZaiFBpZL5tCZKshx5z5VdE1n7YwBk9Q8QNPUqzd4QhCR6TZEEW/jRSVeijsIj0Ez+mfXXmcBGDgAvlKv3ilL4Uv+DLK0PsVxuD/WwzFhcKg+4f5KO2svPvV40Ak4FHuwPO27liReS9lfse/Q138EttNVdS2cVHtQQ7Ei2kQejMdgiBuaQWwQfsmUDCPiwludcNf4LTDpHkZatbvn1Im2jVHgoZzN+sgiaUWAX/lKBGzVw6mKqOzpnJlpiu11n4KwSnxZKzRH7wQPR31kAmy1/VXKQ+HGbWj2tgw3Wu/qu1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5586.namprd11.prod.outlook.com (2603:10b6:5:35d::21)
 by SA2PR11MB4812.namprd11.prod.outlook.com (2603:10b6:806:f8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 07:57:19 +0000
Received: from CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::89ea:ecfa:c345:3fc6]) by CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::89ea:ecfa:c345:3fc6%4]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 07:57:19 +0000
Message-ID: <792088fc-e648-4f79-950d-d227c96942a5@windriver.com>
Date: Tue, 24 Mar 2026 15:57:12 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-oe][PATCH] postgresql: add ptest support
To: Gyorgy Sarvari <skandigraun@gmail.com>,
        openembedded-devel@lists.openembedded.org
References: <20260324071621.3104812-1-guocai.he.cn@windriver.com>
 <b5a48fa9-8a5e-4530-89d9-4c7d939c4b45@gmail.com>
Content-Language: en-US
From: "He, Guocai" <guocai.he.cn@windriver.com>
In-Reply-To: <b5a48fa9-8a5e-4530-89d9-4c7d939c4b45@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: KU0P306CA0002.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:17::20) To CO6PR11MB5586.namprd11.prod.outlook.com
 (2603:10b6:5:35d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5586:EE_|SA2PR11MB4812:EE_
X-MS-Office365-Filtering-Correlation-Id: 111d9d1b-2c19-43cb-759e-08de897af936
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|4022899009|376014|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	uyFV12Lc6f/ajywQRA2jdg8nVZsfC+tM8GFbaJLR/Y3rDYLSUJKDmKo5Hr+xyCUI1ETTPdk4lMELmlu4HBkBAUVrKem7IECQbvwL3YzMh++HYvsMAOC66gpj0AVZIuKMYEzn8if/Um2HEDfa3NJ5V/axyinF+QGWWTWXkRPdOkfcW9l+q08ferSM4d0uuEO8C21WyI0WbIKO3CPeo3iWwkCgNWLPWb1lDU9B4vXdeA615XCtLuuqtLdk3uhqYlejAyjiuf6dqmtzQYe/nq8kt0LtWLYmbufmrCjpcYJWB9mvPI1UlwQurvQI+5Ys/5SdkCEZZxCT3Wvwam9Rwnx2LGb4TbOHI32Lip/NiM+zeeUPRvX0ndYvNFYu8a1qr/3ezZL1SFxbMr5mhr0M2PaOSQGStZgaofDeB2ZczDjm+VEDvdjnLtqQ5XkIvZFKawNMBQPpQ/DSjcGCiZC/IrSAxC3oayo3jd44KWu6jvAut2RZiZn6uSJNUu0GtfMURK3eQLkne0OuRSm8iapVXg/zuOCFHjtDEZRw+3u6dL00FjTReNp5oGPaM7gJyPKZyEW/dHrSTdFt4+OWhOGQysbiHTrIGth/N1y6lVj6HylJE+rENsnDc7BRhV4ORlAD9Mcop0Qrg06RucPCo8yIVWxe4AFz1pCaQIKLBNt8C1w7kzS0M8cL4SKKaAHtK1u3pO2j
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(376014)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VXk0aVQ4K2dwZ2pMNEhvRkprYlM3emRMQlZsYW9IRFI0VktGTnhxejA0d3N0?=
 =?utf-8?B?dEdEaHA3Rm1ZbDlzZ1E2Q3FqZG01Mm5YdGwvVHhUaXQvUGRXc0FyemRPckFC?=
 =?utf-8?B?b28zNCtUelRUZFpWODBXMkxoTnVMU0szYnRIcDVKL0s4blluMEtBc24zcHZm?=
 =?utf-8?B?VXlLU21QeStocDZKOFRHQ1FqZ3V2d2pTTlVVeUZaN0g3Uk5Tb3Y2bGJaWkJJ?=
 =?utf-8?B?dWFkMkUvUUZnZ0lGOGFHT0dZTk1yZGxpaHl1YVhNb09CN2VmL0drZzduR0lI?=
 =?utf-8?B?SjhadFpFQWh5VFFTdUhQcVc0NVB6VTNCQkZGcEc2RkZUaGI0Y0JkdkNndW9P?=
 =?utf-8?B?eStncnN1L0V3UFV0MFhqSkh2UzVRSk5Ib3VjcjdSS1kxRnhpaWEzbm1Pbk0v?=
 =?utf-8?B?a3h2czVieDJBeGxwL29RN0dGaXQvdTZhVHlJUVNYZ3dzV0ZpZW5nTjM0MDFw?=
 =?utf-8?B?VExHMmp0VmxaZHVPNFNnUjVHM0FBV3ZFQWxWcXNXNzk3N2VuTHdkOWZUTWFk?=
 =?utf-8?B?ODR5Q2hab2FyREg3Uk1kVGxIMmppTm9kQmhEU1hTT2ZkaXdzcyt0Umx5R2Fj?=
 =?utf-8?B?WGVSS05FRXFHTG53enlybHJWcEtUcHlxYWJyTFEydU9ydkhQdDMwOHAxMlp6?=
 =?utf-8?B?Z2tkOFV0NUlOQ1EyVHdiOXRwYnhyam44Nk1oV2xEcnNFaFNEMzcwVmdPWXFZ?=
 =?utf-8?B?RkV3QUZzcnBsK3FxWHc0WXAvZHZ1ODZxZ3BTUkxxbUVabkxUSktxb2MvM0RD?=
 =?utf-8?B?VGhIa2JSaEFsbHhrQ1lJNklaZHgwSmI4dDNNNGJMYXlYVmFGelg4TnY5cGtv?=
 =?utf-8?B?c0RIQ0ZIY21wSXRabldIYmMwMUYwQ0h6Q044ZlBzSnFnZ2R4ZjRYWDNwdU9Q?=
 =?utf-8?B?aWxmOTBVeGg0MU5rKzhSbVlpNVVzNTZOZkpjZWZONE0rNG1CMG0xajF0TzEx?=
 =?utf-8?B?eGN4UGlTRTA4alFtYU9uZVVwSzRDcHVjSnR6YzM4RTRpNTBCZDNEa0U0QXlB?=
 =?utf-8?B?cFgzU3lHdHZVVHlRWlppWTNoM2NvbXB4d01JQ09QelMwRHRnQVN1T0Z5Y0xF?=
 =?utf-8?B?ZldiTkFVWHRvdkI4SnNxd0lXMGh6U203RzFnTWcxa0x5WmVOa240WTcreFg4?=
 =?utf-8?B?K2l3eW1ua1RGQThvSGZ5YUIzcnFCZzlTUEdKQ1crbjUzdjhncEdPQnlBcGJi?=
 =?utf-8?B?aDF0OE50NC9XZzBvQWpjQlBOUDBqYktac3dwTXVzSU83NkVSdkd0ckU2S0ti?=
 =?utf-8?B?Y0ZLdGl3Qy9qSkNGS1B6TURFQ0NsS2I0TWdZQ0ppenRsc2lHUlJYc1BSUzFY?=
 =?utf-8?B?MG5IenZtbDNqajZsVnlPcFU4UC8wWnU4UzRDdngyNlUzNnB1Nll1M2VSY2J3?=
 =?utf-8?B?YThCZFRmblNFRXZoWnhHSHBRSWt1dm9uaTAvZy9tR0d0bnZNNVhsano3YXhp?=
 =?utf-8?B?aXM0eWxwZlhCcnB1WHJ6bFlsZHNMU3BSeGt5ajMxbmRtbkRqZ3RsSjhJVXI1?=
 =?utf-8?B?a3ltVmp4TkFlUFd5bG1Hei9jNWM4a1ZZai9oNENpM0tXQ3ljMHNERW5yTGh1?=
 =?utf-8?B?RUNUa0FNZE1qQXBTS0Ridys2Y0lEU2o3TC82SHN4RXlLYlVRRDBNUXpTRXZX?=
 =?utf-8?B?MEpRbFFQbGxVY0Y1T1k0VUEzMTN5WFA5aHNQNmZwNnVDWVB5bnJ3TGtxRG02?=
 =?utf-8?B?MGVMV294am53eW93TkRJcFkveVZMODMvUnJucWd1RkNNdm9rNGVVMExjdEl1?=
 =?utf-8?B?d2FGVlVESUNLemNEcUxvMjAwOStXbzIvNExZcWo3TUQ3aEtZQkdUN1c1K2Rw?=
 =?utf-8?B?ZUd1MUZSMWN6MjhXU2svMS9oTW5oNk83NU4rS21QSEg0NWU0RWh1TE5UZ2xI?=
 =?utf-8?B?THBwaE1pTTRKajR6N3Y0N0ZUaGh3WENiVGpZZURMcWtWb1JQZlhUZ1c2aHVE?=
 =?utf-8?B?SFFlREZJSWpyS3prWVpqMmVjdFQwbUY5VFVycHJRL1QzY09BTmhONWhBamNa?=
 =?utf-8?B?OWZnNExCRHUzVGxzZEVDVWx0RXp3YzV1TytieE5PMDArRkNYVXBCTGpWZW5M?=
 =?utf-8?B?d2MyalE5b3htbnF3Qk5lbW12Q0tMOWVQbGNkREY5c2todkJtYmhjVUxyVGtr?=
 =?utf-8?B?d0dQK0Fmb2wzSHZaVXAwd1g4cVFnRXFRWldhU3FmMUVRZnRJRitRVXVaWlh1?=
 =?utf-8?B?aEw1Mm5EeTk5dUx2aVd6ejVDRUNsYll0L3RXYk5vUGFWSVZXb0lmSU8vamhp?=
 =?utf-8?B?ZnFJMVZZQ3VFeDRqK2NxamFjWjloZkpnZ0NuRjg3eW1lRDFiL21NMnBXeHdu?=
 =?utf-8?B?cjFxMVRMVUU5NXZWanZoNWpTSGprM24wU3BXendxaDNWa0xHeDJEZk5Zc3h0?=
 =?utf-8?Q?5lKKj4hean1q7Lh0=3D?=
X-Exchange-RoutingPolicyChecked: 
	OYp16eg2YDdlVHmOGR0OEn+rGDkajPQ62O5qYrn4/4xXS1Uzy2uld/nLkmxxgQvl7yDMWHQJCz/k8jqQJgbzEe8ionYHH/zi4yjS1oSaJKrpwoqHpyOSvQscagNjmA86ThITY1H9AkxlIbwZjKGtvtyUSUqTS+MfUSwRnuxM0AILOVib5hM8nS4P7b7eTyq9KUh0bd/baIs/Uotx4CcYWQlUCVjWfLswwP9Ih2Y4TxExxPQv7KthKNX5X/dn8ux/kswsct6ostLQfPyARf3bJVdtziizym9t3JU1N18V3O1V5thjoZNNavLjrqVaBji0idu07k+q0/h+iDhKczl7vA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 111d9d1b-2c19-43cb-759e-08de897af936
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 07:57:19.4661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HbJZqlhWZTtUdwEyUUiOceTYBvpvutdFw9ZoeIH6SRR/IcvRq7hqp84CGxCbFoZRAdK50xjhOjMZfAo6b0GW7zkwZXj2OeIoQzoF8u/Xkmg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4812
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: a9f4fsxBufTZOQCsKO0TUbazDStg7ZPw
X-Proofpoint-ORIG-GUID: vE-DCJqfiuY6U87DhzCcs28-6bzlJLIk
X-Authority-Analysis: v=2.4 cv=deCNHHXe c=1 sm=1 tr=0 ts=69c243e3 cx=c_pps
 a=UZSaxNdd3h1KCbY4z3Yg0Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=epTmVMiNAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=VZ57_svUBdx-htuYi0wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA2MyBTYWx0ZWRfX45KxpAqohyLj
 gmkfDm/4LgPWS3r9JwXPDsTJMjy4oZ91YzMkN9ZybCknxX7FWQVPgYT1VLCsnOAB3nG/NbXixc2
 G38z+MPaPSVu/be2JtkiUNKn6u0Wvq1Eaqo8zfuMbJUOaCi6XunsgbcYoIt96XuukgXpv1IrU2h
 Od0TKpajE6J1+M1OhFIciaoty9s84IHiOivch1OD2kbPQrD5mNXodGeiDGe6y7HH3xn2QJQu0F5
 b+k9lqMRxiXmL7nbFCcg0rkOArWImTrGBMdmweFhIqVAyv4z6msSIkeFRN6bXDwzVl8s2oaTgB3
 KGQFjiTEGYbqOTTynbXoUB+M1O0nnk7hzjmRRkZlQAZs/rh+tznmvsD9SghbwYxpMYH2sOqptIk
 sunGzuQGpy21qCj/QMztxKwJT4DGSX5timQPxYOplTsHAJWL6GB1Ls5l/+vEeOYxyQz/0nwc1zb
 I3b+Zlmp7XU3OntSg0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240063
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62O4t27U2093647
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 07:57:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125544


On 3/24/26 15:36, Gyorgy Sarvari wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On 3/24/26 08:16, guocai he via lists.openembedded.org wrote:
>> From: Guocai He <guocai.he.cn@windriver.com>
>>
>> Add ptest infrastructure to run the PostgreSQL standard regression tes=
t
>> suite (pg_regress) on the target system.
>>
>> Test logs:
>> root@qemux86-64:~# ptest-runner postgresql
>> START: ptest-runner
>> 2026-03-24T02:42
>> BEGIN: /usr/lib64/postgresql/ptest
>> ......
>> ......
>
> I'd like to ask just one confirmation question about this "....." here
>
> Is the output machine parseable, i.e. do the results have PASS:/FAIL:
> prefix, at least as a final summary?
> The run-ptest script doesn't seem to do such conversion, so I'm just
> curious if the output is usable out of the box.

logs like:

waiting for server to start..... done
server started
# using postmaster on Unix socket, default port
ok 1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- test_setup=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 11275 ms
# parallel group (20 tests):=C2=A0 int2 name text char varchar int4 oid t=
xid=20
pg_lsn regproc money boolean int8 uuid floa
t4 float8 bit enum rangetypes numeric
ok 2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+ boolean=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 4823 ms
ok 3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+ char=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A03601 ms
ok 4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+ name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A03347 ms
ok 5=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+ varchar=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 3695 ms
ok 6=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+ text=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A03364 ms
ok 7=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+ int2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A02609 ms
ok 8=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+ int4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A03636 ms
ok 9=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+ int8=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A05066 ms
ok 10=C2=A0 =C2=A0 =C2=A0 =C2=A0 + oid=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 3590 ms


ok 216=C2=A0 =C2=A0 =C2=A0 =C2=A0+ compression=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 9827 ms
ok 217=C2=A0 =C2=A0 =C2=A0 =C2=A0+ memoize=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 9233 ms
ok 218=C2=A0 =C2=A0 =C2=A0 =C2=A0+ stats=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A023898 ms
ok 219=C2=A0 =C2=A0 =C2=A0 =C2=A0+ predicate=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 3535 ms
# parallel group (2 tests):=C2=A0 oidjoins event_trigger
ok 220=C2=A0 =C2=A0 =C2=A0 =C2=A0+ oidjoins=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A07394 ms
ok 221=C2=A0 =C2=A0 =C2=A0 =C2=A0+ event_trigger=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 93=
63 ms
ok 222=C2=A0 =C2=A0 =C2=A0 =C2=A0- event_trigger_login=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2059 ms
ok 223=C2=A0 =C2=A0 =C2=A0 =C2=A0- fast_default=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A08790 ms
ok 224=C2=A0 =C2=A0 =C2=A0 =C2=A0- tablespace=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 19201 ms
1..224
# All 224 tests passed.
waiting for server to shut down.... done
server stopped
DURATION: 890
END: /usr/lib64/postgresql/ptest

>
>
>> All 224 tests passed.
>> waiting for server to shut down.... done
>> server stopped
>> DURATION: 853
>> END: /usr/lib64/postgresql/ptest
>> 2026-03-24T02:56
>> STOP: ptest-runner
>> TOTAL: 1 FAIL: 0
>>
>> Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
>> ---
>>   .../include/ptest-packagelists-meta-oe.inc    |  1 +
>>   .../recipes-dbs/postgresql/files/run-ptest    | 53 +++++++++++++++++=
++
>>   meta-oe/recipes-dbs/postgresql/postgresql.inc | 42 ++++++++++++++-
>>   3 files changed, 95 insertions(+), 1 deletion(-)
>>   create mode 100644 meta-oe/recipes-dbs/postgresql/files/run-ptest
>>
>> diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/met=
a-oe/conf/include/ptest-packagelists-meta-oe.inc
>> index 4de602ac1c..0e395db48a 100644
>> --- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
>> +++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
>> @@ -76,6 +76,7 @@ PTESTS_SLOW_META_OE =3D "\
>>       fftw \
>>       libusb-compat \
>>       mariadb \
>> +    postgresql \
>>       re2 \
>>       rocksdb \
>>   "
>> diff --git a/meta-oe/recipes-dbs/postgresql/files/run-ptest b/meta-oe/=
recipes-dbs/postgresql/files/run-ptest
>> new file mode 100644
>> index 0000000000..004cf2ba87
>> --- /dev/null
>> +++ b/meta-oe/recipes-dbs/postgresql/files/run-ptest
>> @@ -0,0 +1,53 @@
>> +#!/bin/sh
>> +#
>> +# PostgreSQL regression test runner for ptest
>> +#
>> +# This script initializes a temporary PostgreSQL database cluster,
>> +# starts a server instance, and executes the standard regression test
>> +# suite via pg_regress against the installed PostgreSQL binaries.
>> +#
>> +
>> +set -e
>> +
>> +PGDATA=3D/tmp/ptest_pgdata
>> +PTEST_PATH=3D$(dirname "$(readlink -f "$0")")
>> +TESTDIR=3D"${PTEST_PATH}/test"
>> +PGBIN=3D$(pg_config --bindir)
>> +PKGLIBDIR=3D$(pg_config --pkglibdir)
>> +
>> +cleanup() {
>> +    su - postgres -c "pg_ctl -D ${PGDATA} stop -m immediate" 2>/dev/n=
ull || true
>> +    rm -rf "${PGDATA}"
>> +}
>> +trap cleanup EXIT
>> +
>> +# Initialize the database cluster
>> +rm -rf "${PGDATA}"
>> +su - postgres -c "${PGBIN}/initdb -D ${PGDATA} --no-locale" || exit 1
>> +
>> +# Start the server
>> +su - postgres -c "pg_ctl -D ${PGDATA} -l ${PGDATA}/logfile start -w -=
t 120" || exit 1
>> +
>> +# Ensure the test directory is writable by the postgres user for
>> +# regression output files (regression.out, regression.diffs, results/=
).
>> +chown -R postgres:postgres "${TESTDIR}"
>> +
>> +# Prepare the tablespace test directory
>> +mkdir -p "${TESTDIR}/testtablespace"
>> +chmod 0700 "${TESTDIR}/testtablespace"
>> +chown postgres:postgres "${TESTDIR}/testtablespace"
>> +
>> +# Run the regression tests.
>> +# --dlpath points to the standard PostgreSQL package library director=
y
>> +# where regress.so and contrib modules (autoinc.so, refint.so, etc.)
>> +# are installed, so that CREATE FUNCTION ... AS tests can locate them.
>> +su - postgres -c "cd ${TESTDIR} && \
>> +    ${TESTDIR}/pg_regress \
>> +        --inputdir=3D. \
>> +        --bindir=3D${PGBIN} \
>> +        --dlpath=3D${PKGLIBDIR} \
>> +        --max-concurrent-tests=3D20 \
>> +        --schedule=3Dparallel_schedule"
>> +RESULT=3D$?
>> +
>> +exit ${RESULT}
>> diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/r=
ecipes-dbs/postgresql/postgresql.inc
>> index 040b3d5e34..dfc624f07e 100644
>> --- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
>> +++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
>> @@ -29,6 +29,7 @@ SRC_URI =3D "https://ftp.postgresql.org/pub/source/v=
${PV}/${BP}.tar.bz2 \
>>       file://postgresql.pam \
>>       file://postgresql-setup \
>>       file://postgresql.service \
>> +    file://run-ptest \
>>   "
>>
>>   LEAD_SONAME =3D "libpq.so"
>> @@ -37,7 +38,7 @@ LEAD_SONAME =3D "libpq.so"
>>   export LDFLAGS_SL =3D "${LDFLAGS}"
>>   export LDFLAGS_EX_BE =3D "-Wl,--export-dynamic"
>>
>> -inherit autotools pkgconfig perlnative python3native python3targetcon=
fig useradd update-rc.d systemd gettext perl-version multilib_header
>> +inherit autotools pkgconfig perlnative python3native python3targetcon=
fig useradd update-rc.d systemd gettext perl-version multilib_header ptes=
t
>>
>>   CFLAGS +=3D "-I${STAGING_INCDIR}/${PYTHON_DIR}"
>>
>> @@ -184,6 +185,45 @@ do_compile:append() {
>>       done
>>   }
>>
>> +do_compile_ptest() {
>> +    oe_runmake -C src/test/regress all
>> +}
>> +
>> +do_install_ptest() {
>> +    mkdir -p ${D}${PTEST_PATH}/test
>> +
>> +    # Install pg_regress binary
>> +    install -m 0755 ${B}/src/test/regress/pg_regress ${D}${PTEST_PATH=
}/test/
>> +
>> +    # Install test schedules and resultmap
>> +    for f in parallel_schedule serial_schedule resultmap; do
>> +        [ -f ${S}/src/test/regress/$f ] && install -m 0644 ${S}/src/t=
est/regress/$f ${D}${PTEST_PATH}/test/
>> +    done
>> +
>> +    # Install SQL, expected, input, output, and data files
>> +    for d in sql expected input output data; do
>> +        if [ -d ${S}/src/test/regress/$d ]; then
>> +            cp -r ${S}/src/test/regress/$d ${D}${PTEST_PATH}/test/
>> +        fi
>> +    done
>> +
>> +    # Install the regress test shared library into the standard Postg=
reSQL
>> +    # package library directory (PKGLIBDIR) alongside contrib modules=
 such
>> +    # as autoinc.so and refint.so. This allows pg_regress --dlpath to
>> +    # resolve all required shared libraries from a single location.
>> +    install -d ${D}${libdir}/${BPN}
>> +    install -m 0755 ${B}/src/test/regress/regress.so ${D}${libdir}/${=
BPN}/
>> +
>> +    # Install run-ptest
>> +    install -m 0755 ${UNPACKDIR}/run-ptest ${D}${PTEST_PATH}/
>> +
>> +    # Set ownership to postgres user for running tests
>> +    chown -R postgres:postgres ${D}${PTEST_PATH}
>> +}
>> +
>> +RDEPENDS:${PN}-ptest +=3D "${PN} ${PN}-client ${PN}-contrib perl"
>
> ${PN} is part of this RDEPENDS implicitly, no need to add it separately
> (granted, it also does no harm by being here)
>
>
>> +FILES:${PN}-ptest +=3D "${libdir}/${BPN}/regress.so"
>> +
>>   # server needs to configure user and group
>>   usernum =3D "28"
>>   groupnum =3D "28"
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#125542): https://lists.openembedded.org/g/openembe=
dded-devel/message/125542
>> Mute This Topic: https://lists.openembedded.org/mt/118479820/6084445
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [skandigraun@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
--=20
Thanks
Guocai


