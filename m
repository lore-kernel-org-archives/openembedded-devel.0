Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF584F013EA
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 08:39:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46073.1773650355105510372
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Mar 2026 01:39:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=KXt3SZp+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=753566c020=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G6wM2p3323798
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 01:39:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=xKWd/7bYf5/sEHr+LDNl2LFJK8qFmcJdfHSJ8BWsYWA=; b=KXt3SZp+YM6L
	8ro0SFMfahxyk6yfhVfVk6BRTZnDULPQ/pycRWeuSEP4HdujoP1Kblybz3YnKN12
	Ag5D7rRo5jTgDtMwd00f/kKh40sc2MKNEztEU7SrMfTWe9ZjVHepe83e6Z0CXX/P
	oOefaa2cMbpLN55BPSYGIn/YOTaBIxotdem8w/cwY9z+TgM6GMYDNycji7Bygk2R
	wGsjbWRH+EvmvP+0L6xClTx+MBtsZuV7icgzwpwxONewQrZxQEOXltGe7CRKIC/v
	MhfQpCsU0JXaUpGCsn5xx8Dqe2L0HNq7yDhISh5bxGO5H5saJmg+HevRNdQCcmWt
	oCgoKS845w==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013056.outbound.protection.outlook.com [40.107.201.56])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cw76dsec5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 01:39:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aM2adhvHwHmnXUdOA9zS81sucL4f2V3VVq/8DbA3ftcDi0P7MwaAOjgP2tjKHDo+wgdTcHP7SLHe8fLjnyjgk7sp4EYsklmjU/Jzy+6XKyNtQJwhub4kghoVAATvGTRHX+yO3MH4xUuLz1ZEaE6MGSjzSaqUYlXr7uGuVAKXR9YyzHrq861xNRlfY15h+EWGvF6+7n1s3uHr9RomlgaK/FGsIK4Ra7TIlWeIZvHegQUpv5gIlbRQtPyYoSwdD1/i25rHJxtF7A3iNuja4w2G6QfGHSTWRYlfzpWAIbl5yB6kfQCz8g+PAdh7wlQd77nOsTQfLWPQL6F14zdAJ7QrXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xKWd/7bYf5/sEHr+LDNl2LFJK8qFmcJdfHSJ8BWsYWA=;
 b=HLp3dRbsALhDP1am3Mz8oEa1oKJbfwr+a/A0iSyZC4TPvNWT81Rt2pWdQq2wYSrTlQbrHxbdSG0/MsidhccjLWPueLpCYvVbD52W60oNQnhW4WyAjea8tttdTiaq26EBM6tY8CCnbJA/J/Cj0K2Q7Gm81f0rOJy2MZnzwIlzKkjZCD+k0C0OyYkTvVlpGBKwOXsb6kHDX3KiktsOeOhmj01iyvBCuvNjkvmJEseV4hSUnn8RuXGQA6K69EzGF5YntJ79HTtn9zT2rip2LiuXZlNQvh3kHK5QGm00Ih0/uSRRV/CHfTPxI+lzsoFO34PSB0Uou41X6MWtwHL3xwJcYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by MW4PR11MB7149.namprd11.prod.outlook.com (2603:10b6:303:221::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Mon, 16 Mar
 2026 08:39:12 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9723.013; Mon, 16 Mar 2026
 08:39:12 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] dlt-daemon: upgrade 2.18.10 to 3.0.0
Date: Mon, 16 Mar 2026 16:38:26 +0800
Message-Id: <20260316083826.1550599-6-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260316083826.1550599-1-changqing.li@windriver.com>
References: <20260316083826.1550599-1-changqing.li@windriver.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SI2PR06CA0016.apcprd06.prod.outlook.com
 (2603:1096:4:186::22) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|MW4PR11MB7149:EE_
X-MS-Office365-Filtering-Correlation-Id: 61e55f64-4498-4f8c-3462-08de83377f4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|13003099007|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	EBMGzRourFE5fl3nSA88oHoC/RF1I5lTHXndCng3BvRAMphX43uDEEuMVeXros3oQEQ2P5YLuj0lXkGr9ci8rXnfaLK55Zv6Z4fsQvCqkNt1xBJfnxsm3a4yJc4FJwKTNqtPKt2DuIB8AHunIyECn1yrvSRqoWohhe5oZ4po5LcB6SrSoZkDQFiTgNeHpJTzsWqkvK37CRr4IKsf4xZpkCa8ZQqcwuCL3ZpPSGXwJbNvkkHSScgQSxqqwHhME6Zr31tPWOiBZ63uwbYLd6+4wA69lIEZ683zkxOvpCQvZxE5Ne6F4HG+cnnd9sMzkG891StwUm7UiElYVTZSbeXgqMpkMH0BHC3uAYU/HBZjo4f9HVSl9zK/K+1lPZP5uqls7sKSQhV1dxRsDtQxOvppgH7crZw8jpjmOONPYFEXJpftnIcirOdEZP3mWZzBolZ3yeY6GYs7x+QBeamxdcFbyble5HRrCz15p6uh7SvlLtgDBbPCK2FlwzMSRs+mxn8F579gxnhrw9EAGlAoDbYsdhsxocyWJzaOBFi9eqAASoPXrYfRXM+QBMjkfM5/h1Bkvr6ovurtlDyoR7xW3lAiZmz3rtn12HQ1gfrc85lWGivZeuda4WykMrKWtXaxk0viVMFK4zCJBGlJi7exiuo7C4sfVO+tIDOMohtCNNw522n0afYTm6/iPMewLVT1o2RNTh8r4/vj1EDI1+kNPkc0dyuf22U2+OLePJ5kOHSP5H+bN7Wkdl8Oqmzxwr6buhSI
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(13003099007)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Z0hmdlFORW1NaHdncml0MklKTm1aOVNSalRWRHF0bnBGOXZUdWZadHRCM29R?=
 =?utf-8?B?RmJvTjFudVlOTmxhUEJQTE81WjlRL3NRV2NGUGhybTBwQmZsV1NhTjFWcU8y?=
 =?utf-8?B?TU9YdTlRRFhyZ1JOYm45Y3pmUTdiR1JvUE9LYXdjd3Yra3I4cm8weksreW90?=
 =?utf-8?B?Wjl4Qkg5dHhqNWc2ZThaSjV5a204V01kSzJBRk1PcXJ0MGE3dnl5aXZVSTgy?=
 =?utf-8?B?dkF3bFpMZWdQdlFoZWEyYW5LTjZjYWdXWXhkMmh1LzVrd2cyYlRsNEp4c2o2?=
 =?utf-8?B?VktNOEdqMk5raFozaUZVMDE4NkZGOUNubEQvWDdyTFBsTGMrekc0dG5xbkU3?=
 =?utf-8?B?SmpZYnlZNzhnTngzYWo5MG1rbC8zcGNGZVY0elNwRGJ6N2pnUlZnb0l3aEVI?=
 =?utf-8?B?U1pvWEUzWkwzZHprblJoY01ESUxkVTllWEtkbTkvZGFscllxenpVeFk2OUxo?=
 =?utf-8?B?OUVVTERENVBaYkVNUUZTcEI1NWlMZ1N4V0xHZjM0aHFQNDFLaThua2cvcmZj?=
 =?utf-8?B?TVZlWnBxczMrNEdlclgxVVZCSEc4dTM4RkZGZW5kQ2RxaFNsRm5rYVg0UVR3?=
 =?utf-8?B?MjhzSEdNYjZhb0JMWkcvci9wdmN4N2k4T1QwY0d3OHdsSHM1QmpiY2lYSS9M?=
 =?utf-8?B?VldxWkE5dVd4d0VWdks5bmR0RW5aRVdQU0Znb1N5OGVZQzUzSWlwdGJwTzhM?=
 =?utf-8?B?SWdMZGM5enFGVmtkNThNUG0zYVRQYlphaCszS0orNDRETlJFdm9iaFZ4Q2VW?=
 =?utf-8?B?a1FkRWVvSG80VEs2T0dsSlRFaE1CUER2S0lnOGU0QTM1OUtQOXpVY3hEVVN0?=
 =?utf-8?B?M2lKWENFS2ZQbGNuR3NNNU9QUlBrS2J4QktEeGRwU21BRDEzczZYLzV6c2FX?=
 =?utf-8?B?azNENXV6QThudlJaeWwxOUt4N0k4TXgvUVk1QkhzRkh1T1VUOGdtTGNWWUhw?=
 =?utf-8?B?dTM4TzE5NWtmalhzcVhQSUVoRlJzelZGR0FxdUJieURER0pNL2pDamJ1ZWRD?=
 =?utf-8?B?TFBlZmVWWG9ubElXSnd5SUp6QnJFWGVFbHl2K0NyeVJHdm4xSmxybDhpZ0Iw?=
 =?utf-8?B?dWRyNHZUU2g2RUo5UmF1K2Q0ZDdHQzRKUXJnNk5wSmFvazgzS3U5S1J1ZDlp?=
 =?utf-8?B?czNRc2FQWmUwL2htTE9WQ1VybUJSczI2dmpiWnJ6dVlTSHo0eHdTZHBUKzVD?=
 =?utf-8?B?YjJXaFZLNytJemFsL3FGSlpNUE5sMzlDWjJIUVV1dVNaVTVDOUE1MGxQVnhz?=
 =?utf-8?B?eXpzU2hpK0pkbWZucTFyV1RzTHZFUW4xUmJUTXVyYmpVM2pMcHdQUVluampo?=
 =?utf-8?B?U0xPYm1wZXNzTDJ5Rm02KzhxQm5tRktXbXp4cmpkcXl2QzFET3R6ZmNpQ3RZ?=
 =?utf-8?B?cW55a2k5V0dNelFwUXkwcDBrV3BkcVBpRFc4QWRGeU9HSlVkMjF3Q2VtaUR4?=
 =?utf-8?B?WHNwN3BuVFo4YVp6eHltbm8ya2Z3Snk3UUlyRDNNWXU3MmpSTkZPYnVJS1JE?=
 =?utf-8?B?ZEdQZDFDYmt3aWY2cHRkVkxVYm1FKzl5MXUvMTRuVzdWZEFXMHgrY2IzR3VT?=
 =?utf-8?B?SnRFWnB3QXNZTWpCMTJzMlZYNkdoWi82dzQ1bEl2YWVRSjdIOW8rNWZDeGwz?=
 =?utf-8?B?L2RGdW1oUm14MkdkWVZwcEJFZDA0OFdpYTc3TjBUd1dCN0xOSnd6cmRMdzZN?=
 =?utf-8?B?bUtQNlNmS2FJQ3ZscXdoTklRbUd5cHRkYUFMSjV3QVdYQnJCSmc5SHlOZ0ZQ?=
 =?utf-8?B?SlFOTEswWmhnNjIreFpOTE9JNDlLUC83VXhyemxsUExxMHRUcWVSTm5TRFJ4?=
 =?utf-8?B?ei9tdVBoVVdYbWhrcW1CMWExaTdEV3MyYTZtcUlMbVM3N0dqemJUREx0eEJS?=
 =?utf-8?B?d1JqSEx5NzAzdTlqVzFBeHlVNnk2OGFocTlNY3JCR2lKTm95L1M4ODREbUR5?=
 =?utf-8?B?RGhEUERpRkFXUGpIbmFVdmFMbWdXNWcyQlNIU085dXAwR1VoK204Y3Q2YVdh?=
 =?utf-8?B?Q2o5cEMwaVRXa0t1OUVXSTBJalhZR0NtbTlwYXFJai81aXR2Rnp4cjZmcHI1?=
 =?utf-8?B?VEFMUHRtNE9FMkRxYzB1VHNSKzVTQ3ZxNU54ZG1LQWsycEo5UXpXQzFwNkZJ?=
 =?utf-8?B?eEZuQUJ0a1J5WVZGRkp4SEhCOUp1ZVBMUE5BaE9yN0tlRTlkR2N2Z1BhQ0VR?=
 =?utf-8?B?OFJBL1loL0FhcWl4QlJyU056Y3FWNjVVNXV4TW9DN2VQMHRlT1gwYXlxL2lO?=
 =?utf-8?B?K1IvQWtZMzBuVVhZWHpxREtnMHVnMWxsMXN5Y0V3d095S0pWbFlrdXAwbnVU?=
 =?utf-8?B?eUM0VkdEelltMUYyZ0NJdjB6a3l2V3hGQUp4elh4enBRZkRiQk12elBnSTFH?=
 =?utf-8?Q?PxjpYMo8GQGjShJs=3D?=
X-Exchange-RoutingPolicyChecked: 
	IgDdd+wZgbol7+yoDYenNhWG+icJPOWp5SfPXn7b53iK/iXCWPUEd4B/vxWDi0eVB4jL4jBnU3bvCGgPKr3rhKaJAhdy//39rt12plGqNPRk4v1XMveTP4txy74W8FYVNoPL2sBZxTKgeHusHHg6UYgR5miRg1otkiZlkYX8DTLlZzIozlBDdKhWTLz0dpvo6O7lZbgy7CVLapxX8q20FIYpn2SFlRbAWgH9CX4BlAAXNt4eIP4QLGhHDQQejZvuAD33maXQVxgIHnDQmoz0M0vwB2eKLG7warO27qalMgcB3Ee63xjKRoDcKDN4LXtYj5Mf5sMWbBnIx5zYBj0cLQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61e55f64-4498-4f8c-3462-08de83377f4f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 08:39:11.9367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9LMEGOVyK9eMTRsmWSeC5s/BWok/cdcVmHaOwssFxGrppuO7tmZijPqYQHpgsSRizroGpt8fWQYvCaqBq+X0NZ5tRQ/+APRotgPV0Gtxjsc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7149
X-Authority-Analysis: v=2.4 cv=S9nUAYsP c=1 sm=1 tr=0 ts=69b7c1b2 cx=c_pps
 a=NVF+LlzI6OJHpaJcpVMg1w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=XMC4lU5bAAAA:20 a=BiqsqxNzAAAA:8 a=NEAV23lmAAAA:8 a=pQs5aej7AAAA:8
 a=rPClnSe_AAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=xNf9USuDAAAA:8
 a=jcO_gBKa51TTM8tieqwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3c_bh9JCJ1R8RpoZksgJ:22 a=npGTQlmte4lqeLD-QWPy:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA2NSBTYWx0ZWRfX1+D293QXUZt7
 1xANi/TC1qzFwo44p59dnm5Fch5bomiIzx/U8sV7sbAj0Wb46ToVp9HHWlDMEQLcBCDCkyoNpdd
 VbtVBNdIJPDEKgBkNDOQCrx1EowtLKN7aJQEkTraStt+G2ZMsO85wxgwDcxERLDLef1ykDP7q+M
 qThFxlfTtqotIVCfceFQceYs5qSH52In2mgO26U/1Va54E9f9UqortHCEI8Xw1IOv/JnUAsFbtR
 poz9k+yPwDxjd/ce3u6ACS+T36+rkobnKU/P4iHtH7siYdM+UV4umMCF5chqLJvlvWNr1aSJgj6
 PkMc1RFMLCkAQndOvyqUpvetpB1mcI3vMWwCnkCOnAS71cKZacKahJG25jhIeFj+RRmR5BcsSh2
 J5TeoJjYzryD4320JywABCUkKNUyvQHuL6e1tm4UA3x6nNQc6Y/GEqrRvlgahKBh9UpbuDuPJ+u
 idN4pnpcuC+uHs4dGCQ==
X-Proofpoint-ORIG-GUID: k7K9WXKK0BbjRuia6fDtfOTWTktVkMTM
X-Proofpoint-GUID: k7K9WXKK0BbjRuia6fDtfOTWTktVkMTM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160065
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62G6wM2p3323798
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 08:39:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125263

Changes:
https://github.com/COVESA/dlt-daemon/releases

Remove patches already in 3.0.0:
544.patch
567.patch
0001-CMakeLists-txt-make-DLT_WatchdogSec-can-be-set-by-user.patch
0003-allow-build-with-cmake-4.patch

Add 3 patches to fix build failures
0001-Fix-compile-failure-related-to-gzlog.patch
0001-Fix-kinds-of-build-failure.patch
0001-Fix-build-failures.patch

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../glib-2.0/glibmm-2.68_2.86.0.bb            |   4 +-
 ...e-DLT_WatchdogSec-can-be-set-by-user.patch |  40 --
 .../dlt-daemon/0001-Fix-build-failures.patch  | 360 ++++++++++++++++++
 ...Fix-compile-failure-related-to-gzlog.patch |  69 ++++
 .../0001-Fix-kinds-of-build-failure.patch     | 174 +++++++++
 .../0003-allow-build-with-cmake-4.patch       |  99 -----
 .../dlt-daemon/dlt-daemon/544.patch           |  80 ----
 .../dlt-daemon/dlt-daemon/567.patch           |  36 --
 ...-daemon_2.18.10.bb =3D> dlt-daemon_3.0.0.bb} |  10 +-
 9 files changed, 610 insertions(+), 262 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-C=
MakeLists-txt-make-DLT_WatchdogSec-can-be-set-by-user.patch
 create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-F=
ix-build-failures.patch
 create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-F=
ix-compile-failure-related-to-gzlog.patch
 create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-F=
ix-kinds-of-build-failure.patch
 delete mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0003-a=
llow-build-with-cmake-4.patch
 delete mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.pa=
tch
 delete mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/567.pa=
tch
 rename meta-oe/recipes-extended/dlt-daemon/{dlt-daemon_2.18.10.bb =3D> d=
lt-daemon_3.0.0.bb} (91%)

diff --git a/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.86.0.bb b/meta-o=
e/recipes-core/glib-2.0/glibmm-2.68_2.86.0.bb
index 621a85456d..b0c83f7eba 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.86.0.bb
+++ b/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.86.0.bb
@@ -2,8 +2,8 @@ SUMMARY =3D "C++ bindings for the glib library"
 HOMEPAGE =3D "http://www.gtkmm.org/"
 SECTION =3D "libs"
 LICENSE =3D "LGPL-2.1-only & GPL-2.0-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D42dfffebc56fec7527aac53b7a89d=
1d8 \
-                    file://COPYING.tools;md5=3D751419260aa954499f7abaaba=
a882bbe"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4bf661c1e3793e55c8d1051bc5e0a=
e21 \
+                    file://COPYING.tools;md5=3D570a9b3749dd0463a1778803b=
12a6dce"
=20
 DEPENDS =3D "mm-common glib-2.0 libsigc++-3 glib-2.0-native"
=20
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-CMakeLis=
ts-txt-make-DLT_WatchdogSec-can-be-set-by-user.patch b/meta-oe/recipes-ex=
tended/dlt-daemon/dlt-daemon/0001-CMakeLists-txt-make-DLT_WatchdogSec-can=
-be-set-by-user.patch
deleted file mode 100644
index 335872c40f..0000000000
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-CMakeLists-txt-=
make-DLT_WatchdogSec-can-be-set-by-user.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From bc03f142507da92add8ba325fdf8187d47a7d719 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Fri, 13 Dec 2024 16:37:24 +0800
-Subject: [PATCH] CMakeLists.txt: make DLT_WatchdogSec can be set by user
-
-In my test env, WatchdogSec default value 2 is not enough, manually
-changed to 3 is ok. This makes dlt.service/dlt-system.service start
-failed during boot time. So, make DLT_WatchdogSec can be set by user, so
-user can set them to proper value at build time, then service can start
-successfully in boot time.
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
-
-Upstream-Status: Backport [https://github.com/COVESA/dlt-daemon/pull/720=
/commits/bc03f142507da92add8ba325fdf8187d47a7d719]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- systemd/CMakeLists.txt | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/systemd/CMakeLists.txt b/systemd/CMakeLists.txt
-index 16cbe86b5..659378d16 100644
---- a/systemd/CMakeLists.txt
-+++ b/systemd/CMakeLists.txt
-@@ -18,10 +18,14 @@ if(WITH_SYSTEMD)
-     set(SYSTEMD_CONFIGURATIONS_FILES_DIR ${SYSTEMD_UNITDIR} )
-=20
-     if(WITH_SYSTEMD_WATCHDOG)
--        set( DLT_WatchdogSec 2 )
-+        if(NOT DEFINED DLT_WatchdogSec)
-+            set(DLT_WatchdogSec 2 CACHE STRING "Watchdog timeout in sec=
onds")
-+        endif()
-         message( STATUS "The systemd watchdog is enabled - timeout is s=
et to ${DLT_WatchdogSec} seconds")
-     else(WITH_SYSTEMD_WATCHDOG)
--        set( DLT_WatchdogSec 0 )
-+        if(NOT DEFINED DLT_WatchdogSec)
-+             set(DLT_WatchdogSec 0 CACHE STRING "Watchdog timeout in se=
conds")
-+        endif()
-         message( STATUS "The systemd watchdog is disabled")
-     endif(WITH_SYSTEMD_WATCHDOG)
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-buil=
d-failures.patch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fi=
x-build-failures.patch
new file mode 100644
index 0000000000..6cfa3a5482
--- /dev/null
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-build-failu=
res.patch
@@ -0,0 +1,360 @@
+From 4813b72cfe82062db41dd1d8cfa7069634d78d9e Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Mon, 16 Mar 2026 13:28:40 +0800
+Subject: [PATCH] Fix build failures
+
+Fix the following similar build failures, some of the build failure
+reproduced with arm64/riscv64, some of the build reproduced with 32bit
+x86/arm.
+
+dlt_daemon_common.c:2785:26: error: conversion to 'int8_t' {aka 'signed =
char'} from 'char' may change the sign of the result [-Werror=3Dsign-conv=
ersion]
+
+src/tests/dlt-test-multi-process-client-v2.c:302:49: error: format '%lld=
' expects argument of type 'long long int', but argument 2 has type 'time=
_t' {aka 'long int'} [-Werror=3Dformat=3D]
+  302 |     printf(" Time running (seconds)        : %lld\n", time(NULL)=
 - stats.first_message_time);
+      |                                              ~~~^     ~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~
+      |                                                 |               =
 |
+      |                                                 long long int   =
 time_t {aka long int}
+      |                                              %ld
+
+src/lib/dlt_user.c:5109:60: error: format '%lld' expects argument of typ=
e 'long long int', but argument 4 has type '__off_t' {aka 'long int'} [-W=
error=3Dformat=3D]
+ 5109 |             dlt_vlog(LOG_DEBUG, "%s: Current file size=3D[%lld]\=
n", __func__,
+      |                                                         ~~~^
+      |                                                            |
+      |                                                            long =
long int
+      |                                                         %ld
+ 5110 |                      st.st_size);
+      |                      ~~~~~~~~~~
+      |                        |
+      |                        __off_t {aka long int}
+
+Upstream-Status: Submitted [https://github.com/COVESA/dlt-daemon/pull/82=
7]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ src/daemon/dlt-daemon.c                      |  8 ++---
+ src/daemon/dlt_daemon_client.c               | 32 ++++++++++----------
+ src/daemon/dlt_daemon_common.c               |  4 +--
+ src/lib/dlt_user.c                           | 18 +++++------
+ src/shared/dlt_common.c                      |  2 +-
+ src/shared/dlt_multiple_files.c              |  2 +-
+ src/tests/dlt-test-multi-process-client-v2.c |  8 ++---
+ src/tests/dlt-test-multi-process-v2.c        |  2 +-
+ src/tests/dlt-test-multi-process.c           |  2 +-
+ 9 files changed, 39 insertions(+), 39 deletions(-)
+
+diff --git a/src/daemon/dlt-daemon.c b/src/daemon/dlt-daemon.c
+index 523bf33..2ae5bc9 100644
+--- a/src/daemon/dlt-daemon.c
++++ b/src/daemon/dlt-daemon.c
+@@ -457,7 +457,7 @@ int option_file_parser(DltDaemonLocal *daemon_local)
+=20
+     if (n < 0 || (size_t)n > sizeof(daemon_local->flags.loggingFilename=
)) {
+         dlt_vlog(LOG_WARNING, "%s: snprintf truncation/error(%ld) %s\n"=
,
+-                __func__, n, daemon_local->flags.loggingFilename);
++                __func__, (long int)n, daemon_local->flags.loggingFilen=
ame);
+     }
+     daemon_local->flags.enableLoggingFileLimit =3D false;
+     daemon_local->flags.loggingFileSize =3D 250000;
+@@ -2501,7 +2501,7 @@ void dlt_daemon_exit_trigger()
+     n =3D snprintf(tmp, DLT_PATH_MAX, "%s/dlt", dltFifoBaseDir);
+     if (n < 0 || (size_t)n > DLT_PATH_MAX) {
+         dlt_vlog(LOG_WARNING, "%s: snprintf truncation/error(%ld) %s\n"=
,
+-                __func__, n, tmp);
++                __func__, (long int)n, tmp);
+     }
+=20
+     (void)unlink(tmp);
+@@ -2878,8 +2878,8 @@ int dlt_daemon_log_internal(DltDaemon *daemon, Dlt=
DaemonLocal *daemon_local,
+         dlt_daemon_client_send(DLT_DAEMON_SEND_TO_ALL, daemon,daemon_lo=
cal,
+                             msg.headerbuffer, sizeof(DltStorageHeader),
+                             msg.headerbuffer + sizeof(DltStorageHeader)=
,
+-                            (size_t)(msg.headersize - (int32_t)sizeof(D=
ltStorageHeader)),
+-                            msg.databuffer, (size_t)msg.datasize, verbo=
se);
++                            (int)(msg.headersize - (int32_t)sizeof(DltS=
torageHeader)),
++                            msg.databuffer, (int)msg.datasize, verbose)=
;
+=20
+         free(msg.databuffer);
+     }else {
+diff --git a/src/daemon/dlt_daemon_client.c b/src/daemon/dlt_daemon_clie=
nt.c
+index 50d8f19..20a512b 100644
+--- a/src/daemon/dlt_daemon_client.c
++++ b/src/daemon/dlt_daemon_client.c
+@@ -551,8 +551,8 @@ int dlt_daemon_client_send_message_to_all_client(Dlt=
Daemon *daemon,
+     return dlt_daemon_client_send(DLT_DAEMON_SEND_TO_ALL, daemon, daemo=
n_local,
+                 daemon_local->msg.headerbuffer, sizeof(DltStorageHeader=
),
+                 daemon_local->msg.headerbuffer + sizeof(DltStorageHeade=
r),
+-                (size_t)(daemon_local->msg.headersize - (int32_t)sizeof=
(DltStorageHeader)),
+-                daemon_local->msg.databuffer, (size_t)daemon_local->msg=
.datasize, verbose);
++                (int)(daemon_local->msg.headersize - (int32_t)sizeof(Dl=
tStorageHeader)),
++                daemon_local->msg.databuffer, (int)daemon_local->msg.da=
tasize, verbose);
+=20
+ }
+=20
+@@ -771,8 +771,8 @@ int dlt_daemon_client_send_control_message(int sock,
+     if ((ret =3D
+              dlt_daemon_client_send(sock, daemon, daemon_local, msg->he=
aderbuffer, sizeof(DltStorageHeader),
+                                     msg->headerbuffer + sizeof(DltStora=
geHeader),
+-                                    (size_t)(msg->headersize - (int32_t=
)sizeof(DltStorageHeader)),
+-                                    msg->databuffer, (size_t)msg->datas=
ize, verbose))) {
++                                    (int)(msg->headersize - (int32_t)si=
zeof(DltStorageHeader)),
++                                    msg->databuffer, (int)msg->datasize=
, verbose))) {
+         dlt_log(LOG_DEBUG, "dlt_daemon_control_send_control_message: DL=
T message send to all failed!.\n");
+         return ret;
+     }
+@@ -1919,7 +1919,7 @@ void dlt_daemon_control_get_log_info(int sock,
+=20
+     /* Allocate buffer for response message */
+     resp.databuffer =3D (uint8_t *)malloc((size_t)resp.datasize);
+-    resp.databuffersize =3D (size_t)resp.datasize;
++    resp.databuffersize =3D resp.datasize;
+=20
+     if (resp.databuffer =3D=3D 0) {
+         dlt_daemon_control_service_response(sock,
+@@ -2572,7 +2572,7 @@ int dlt_daemon_control_message_buffer_overflow(int=
 sock,
+=20
+     if (msg.databuffer =3D=3D 0) {
+         msg.databuffer =3D (uint8_t *)malloc((size_t)msg.datasize);
+-        msg.databuffersize =3D (size_t)msg.datasize;
++        msg.databuffersize =3D msg.datasize;
+     }
+=20
+     if (msg.databuffer =3D=3D 0)
+@@ -2633,7 +2633,7 @@ int dlt_daemon_control_message_buffer_overflow_v2(=
int sock,
+=20
+     if (msg.databuffer =3D=3D 0) {
+         msg.databuffer =3D (uint8_t *)malloc((size_t)msg.datasize);
+-        msg.databuffersize =3D (size_t)msg.datasize;
++        msg.databuffersize =3D msg.datasize;
+     }
+=20
+     if (msg.databuffer =3D=3D 0)
+@@ -2686,7 +2686,7 @@ void dlt_daemon_control_service_response(int sock,
+=20
+     if (msg.databuffer =3D=3D 0) {
+         msg.databuffer =3D (uint8_t *)malloc((size_t)msg.datasize);
+-        msg.databuffersize =3D (size_t)msg.datasize;
++        msg.databuffersize =3D msg.datasize;
+     }
+=20
+     if (msg.databuffer =3D=3D 0)
+@@ -2732,7 +2732,7 @@ void dlt_daemon_control_service_response_v2(int so=
ck,
+=20
+     if (msg.databuffer =3D=3D 0) {
+         msg.databuffer =3D (uint8_t *)malloc((size_t)msg.datasize);
+-        msg.databuffersize =3D (size_t)msg.datasize;
++        msg.databuffersize =3D msg.datasize;
+     }
+=20
+     if (msg.databuffer =3D=3D 0)
+@@ -2779,7 +2779,7 @@ int dlt_daemon_control_message_unregister_context(=
int sock,
+=20
+     if (msg.databuffer =3D=3D 0) {
+         msg.databuffer =3D (uint8_t *)malloc((size_t)msg.datasize);
+-        msg.databuffersize =3D (size_t)msg.datasize;
++        msg.databuffersize =3D msg.datasize;
+     }
+=20
+     if (msg.databuffer =3D=3D 0)
+@@ -2842,7 +2842,7 @@ int dlt_daemon_control_message_unregister_context_=
v2(int sock,
+=20
+     if (msg.databuffer =3D=3D 0) {
+         msg.databuffer =3D (uint8_t *)malloc((size_t)msg.datasize);
+-        msg.databuffersize =3D (size_t)msg.datasize;
++        msg.databuffersize =3D msg.datasize;
+     }
+=20
+     if (msg.databuffer =3D=3D 0)
+@@ -2909,7 +2909,7 @@ int dlt_daemon_control_message_connection_info(int=
 sock,
+=20
+     if (msg.databuffer =3D=3D 0) {
+         msg.databuffer =3D (uint8_t *)malloc((size_t)msg.datasize);
+-        msg.databuffersize =3D (size_t)msg.datasize;
++        msg.databuffersize =3D msg.datasize;
+     }
+=20
+     if (msg.databuffer =3D=3D 0)
+@@ -2962,7 +2962,7 @@ int dlt_daemon_control_message_connection_info_v2(=
int sock,
+=20
+     if (msg.databuffer =3D=3D 0) {
+         msg.databuffer =3D (uint8_t *)malloc((size_t)msg.datasize);
+-        msg.databuffersize =3D (size_t)msg.datasize;
++        msg.databuffersize =3D msg.datasize;
+     }
+=20
+     if (msg.databuffer =3D=3D 0)
+@@ -3010,7 +3010,7 @@ int dlt_daemon_control_message_timezone(int sock, =
DltDaemon *daemon, DltDaemonLo
+=20
+     if (msg.databuffer =3D=3D 0) {
+         msg.databuffer =3D (uint8_t *)malloc((size_t)msg.datasize);
+-        msg.databuffersize =3D (size_t)msg.datasize;
++        msg.databuffersize =3D msg.datasize;
+     }
+=20
+     if (msg.databuffer =3D=3D 0)
+@@ -3072,7 +3072,7 @@ int dlt_daemon_control_message_timezone_v2(int soc=
k, DltDaemon *daemon, DltDaemo
+=20
+     if (msg.databuffer =3D=3D 0) {
+         msg.databuffer =3D (uint8_t *)malloc((size_t)msg.datasize);
+-        msg.databuffersize =3D (size_t)msg.datasize;
++        msg.databuffersize =3D msg.datasize;
+     }
+=20
+     if (msg.databuffer =3D=3D 0)
+@@ -3127,7 +3127,7 @@ int dlt_daemon_control_message_marker(int sock, Dl=
tDaemon *daemon, DltDaemonLoca
+=20
+     if (msg.databuffer =3D=3D 0) {
+         msg.databuffer =3D (uint8_t *)malloc((size_t)msg.datasize);
+-        msg.databuffersize =3D (size_t)msg.datasize;
++        msg.databuffersize =3D msg.datasize;
+     }
+=20
+     if (msg.databuffer =3D=3D 0)
+diff --git a/src/daemon/dlt_daemon_common.c b/src/daemon/dlt_daemon_comm=
on.c
+index 2f08c6a..65b264a 100644
+--- a/src/daemon/dlt_daemon_common.c
++++ b/src/daemon/dlt_daemon_common.c
+@@ -2782,7 +2782,7 @@ int dlt_daemon_user_send_log_state(DltDaemon *daem=
on, DltDaemonApplication *app,
+     if (dlt_user_set_userheader(&userheader, DLT_USER_MESSAGE_LOG_STATE=
) < DLT_RETURN_OK)
+         return -1;
+=20
+-    logstate.log_state =3D daemon->connectionState;
++    logstate.log_state =3D (int8_t)daemon->connectionState;
+=20
+     /* log to FIFO */
+     ret =3D dlt_user_log_out2_with_timeout(app->user_handle,
+@@ -2811,7 +2811,7 @@ int dlt_daemon_user_send_log_state_v2(DltDaemon *d=
aemon, DltDaemonApplication *a
+     if (dlt_user_set_userheader_v2(&userheader, DLT_USER_MESSAGE_LOG_ST=
ATE) < DLT_RETURN_OK)
+         return -1;
+=20
+-    logstate.log_state =3D daemon->connectionState;
++    logstate.log_state =3D (int8_t)daemon->connectionState;
+=20
+     /* log to FIFO */
+     ret =3D dlt_user_log_out2_with_timeout(app->user_handle,
+diff --git a/src/lib/dlt_user.c b/src/lib/dlt_user.c
+index 6d0098d..e432e26 100644
+--- a/src/lib/dlt_user.c
++++ b/src/lib/dlt_user.c
+@@ -5106,8 +5106,8 @@ DltReturnValue dlt_user_log_send_log(DltContextDat=
a *log, const int mtype, int *
+                 return DLT_RETURN_ERROR;
+             }
+=20
+-            dlt_vlog(LOG_DEBUG, "%s: Current file size=3D[%ld]\n", __fu=
nc__,
+-                     st.st_size);
++            dlt_vlog(LOG_DEBUG, "%s: Current file size=3D[%lld]\n", __f=
unc__,
++                     (long long int)st.st_size);
+             /* Check filesize */
+             /* Return error if the file size has reached to maximum */
+             unsigned int msg_size =3D (unsigned int)st.st_size + (unsig=
ned int)msg.headersize +
+@@ -5115,8 +5115,8 @@ DltReturnValue dlt_user_log_send_log(DltContextDat=
a *log, const int mtype, int *
+             if (msg_size > dlt_user.filesize_max) {
+                 dlt_user_file_reach_max =3D true;
+                 dlt_vlog(LOG_ERR,
+-                         "%s: File size (%ld bytes) reached to defined =
maximum size (%d bytes)\n",
+-                         __func__, st.st_size, dlt_user.filesize_max);
++                         "%s: File size (%lld bytes) reached to defined=
 maximum size (%d bytes)\n",
++                         __func__, (long long int)st.st_size, dlt_user.=
filesize_max);
+                 dlt_mutex_unlock();
+                 return DLT_RETURN_FILESZERR;
+             }
+@@ -5612,21 +5612,21 @@ DltReturnValue dlt_user_log_send_log_v2(DltConte=
xtData *log, const int mtype, Dl
+                 return DLT_RETURN_ERROR;
+             }
+=20
+-            dlt_vlog(LOG_DEBUG, "%s: Current file size=3D[%ld]\n", __fu=
nc__,
+-                     st.st_size);
++            dlt_vlog(LOG_DEBUG, "%s: Current file size=3D[%lld]\n", __f=
unc__,
++                     (long long int)st.st_size);
+             /* Check filesize */
+             /* Return error if the file size has reached to maximum */
+             unsigned int msg_size =3D 0;
+             if (st.st_size < 0 || st.st_size > UINT_MAX) {
+-                dlt_vlog(LOG_ERR, "%s: File size (%ld bytes) is invalid=
 or too large for unsigned int\n", __func__, st.st_size);
++                dlt_vlog(LOG_ERR, "%s: File size (%lld bytes) is invali=
d or too large for unsigned int\n", __func__, (long long int)st.st_size);
+                 return DLT_RETURN_FILESZERR;
+             }
+             msg_size =3D (unsigned int)st.st_size + (unsigned int) msg.=
headersizev2 + (unsigned int) log->size;
+             if (msg_size > dlt_user.filesize_max) {
+                 dlt_user_file_reach_max =3D true;
+                 dlt_vlog(LOG_ERR,
+-                         "%s: File size (%ld bytes) reached to defined =
maximum size (%d bytes)\n",
+-                         __func__, st.st_size, dlt_user.filesize_max);
++                         "%s: File size (%lld bytes) reached to defined=
 maximum size (%d bytes)\n",
++                         __func__, (long long int)st.st_size, dlt_user.=
filesize_max);
+                 return DLT_RETURN_FILESZERR;
+             }
+             else {
+diff --git a/src/shared/dlt_common.c b/src/shared/dlt_common.c
+index 6ad354b..aa0aaaa 100644
+--- a/src/shared/dlt_common.c
++++ b/src/shared/dlt_common.c
+@@ -1220,7 +1220,7 @@ DltReturnValue dlt_message_header_flags_v2(DltMess=
ageV2 *msg, char *text, size_t
+             for (int i =3D 0; i<5; ++i){
+                 tt =3D (tt << 8) | msg->headerextrav2.seconds[i];
+             }
+-            snprintf(text + strlen(text), textlength - strlen(text), "%=
ld.%.9u ", tt, msg->headerextrav2.nanoseconds);
++            snprintf(text + strlen(text), textlength - strlen(text), "%=
lld.%.9u ", (long long int)tt, msg->headerextrav2.nanoseconds);
+         }
+         else
+             snprintf(text + strlen(text), textlength - strlen(text), "-=
--------- ");
+diff --git a/src/shared/dlt_multiple_files.c b/src/shared/dlt_multiple_f=
iles.c
+index c4019e5..65529ff 100644
+--- a/src/shared/dlt_multiple_files.c
++++ b/src/shared/dlt_multiple_files.c
+@@ -257,7 +257,7 @@ ssize_t multiple_files_buffer_get_total_size(const M=
ultipleFilesRingBuffer *file
+             if (((unsigned int)res < sizeof(filename)) && (res > 0)) {
+                 errno =3D 0;
+                 if (0 =3D=3D stat(filename, &status))
+-                    size +=3D status.st_size;
++                    size +=3D (ssize_t)status.st_size;
+                 else
+                     fprintf(stderr, "file %s cannot be stat-ed, error=3D=
%s\n", filename, strerror(errno));
+             }
+diff --git a/src/tests/dlt-test-multi-process-client-v2.c b/src/tests/dl=
t-test-multi-process-client-v2.c
+index 2bb1158..ec99720 100644
+--- a/src/tests/dlt-test-multi-process-client-v2.c
++++ b/src/tests/dlt-test-multi-process-client-v2.c
+@@ -299,10 +299,10 @@ void print_stats(s_statistics stats, s_parameters =
params)
+     printf(" Messages received             : %d\n", stats.messages_rece=
ived);
+     printf(" Broken messages received      : %d\n", stats.broken_messag=
es_received);
+     printf(" Bytes received                : %d\n", stats.bytes_receive=
d);
+-    printf(" Time running (seconds)        : %ld\n", time(NULL) - stats=
.first_message_time);
+-    printf(" Throughput (msgs/sec)/(B/sec) : %ld/%ld\n",
+-           stats.messages_received / ((time(NULL) - stats.first_message=
_time) + 1),
+-           (stats.bytes_received) / ((time(NULL) - stats.first_message_=
time) + 1));
++    printf(" Time running (seconds)        : %lld\n", (long long int)(t=
ime(NULL) - stats.first_message_time));
++    printf(" Throughput (msgs/sec)/(B/sec) : %lld/%lld\n",
++           (long long int)(stats.messages_received / ((time(NULL) - sta=
ts.first_message_time) + 1)),
++           (long long int)((stats.bytes_received) / ((time(NULL) - stat=
s.first_message_time) + 1)));
+=20
+     if (params.messages_left =3D=3D 0) {
+         if (stats.broken_messages_received =3D=3D 0)
+diff --git a/src/tests/dlt-test-multi-process-v2.c b/src/tests/dlt-test-=
multi-process-v2.c
+index 44a8622..1d3a54a 100644
+--- a/src/tests/dlt-test-multi-process-v2.c
++++ b/src/tests/dlt-test-multi-process-v2.c
+@@ -393,7 +393,7 @@ void *do_logging(void *arg)
+=20
+         sleep_time =3D mksleep_time(data->params.delay, data->params.de=
lay_fudge);
+         ts.tv_sec =3D sleep_time / 1000000000;
+-        ts.tv_nsec =3D sleep_time % 1000000000;
++        ts.tv_nsec =3D (long int)(sleep_time % 1000000000);
+         nanosleep(&ts, NULL);
+     }
+=20
+diff --git a/src/tests/dlt-test-multi-process.c b/src/tests/dlt-test-mul=
ti-process.c
+index 016c8b4..00fb11c 100644
+--- a/src/tests/dlt-test-multi-process.c
++++ b/src/tests/dlt-test-multi-process.c
+@@ -370,7 +370,7 @@ void *do_logging(void *arg)
+=20
+         sleep_time =3D mksleep_time(data->params.delay, data->params.de=
lay_fudge);
+         ts.tv_sec =3D sleep_time / 1000000000;
+-        ts.tv_nsec =3D sleep_time % 1000000000;
++        ts.tv_nsec =3D (long int)(sleep_time % 1000000000);
+         nanosleep(&ts, NULL);
+     }
+=20
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-comp=
ile-failure-related-to-gzlog.patch b/meta-oe/recipes-extended/dlt-daemon/=
dlt-daemon/0001-Fix-compile-failure-related-to-gzlog.patch
new file mode 100644
index 0000000000..f9692d9f4d
--- /dev/null
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-compile-fai=
lure-related-to-gzlog.patch
@@ -0,0 +1,69 @@
+From bee9bce043c72de1d27a4251333ace9fe66bcc74 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 12 Mar 2026 19:37:11 +0800
+Subject: [PATCH] Fix compile failure related to gzlog
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+* In commit [1], gzlog is changed from gzFile to gzFile*, this cause
+  failure:
+/dlt-daemon/src/offlinelogstorage/dlt_offline_logstorage.c:88:21: error:=
 passing argument 1 of =E2=80=98gzclose=E2=80=99 from incompatible pointe=
r type [-Werror=3Dincompatible-pointer-types]
+   88 |         gzclose(data->gzlog);
+      |                 ~~~~^~~~~~~
+      |                     |
+      |                     struct gzFile_s **
+compilation terminated due to -Wfatal-errors.
+
+so change gzlog back to gzFile, so that all the gzxxx function can work
+well.
+
+* Change to gzFile causes the following failure, since fileno need
+  FILE*, according to code "config->gzlog =3D gzdopen(config->fd, mode)"=
,
+  seems we don't need to use fileno, just use config->fd is ok.
+/dlt-daemon/src/offlinelogstorage/dlt_offline_logstorage_behavior.c:1133=
:48: error: passing argument 1 of =E2=80=98fileno=E2=80=99 from incompati=
ble pointer type [-Werror=3Dincompatible-pointer-types]
+ 1133 |                         if (fsync(fileno(config->gzlog)) !=3D 0)=
 {
+      |                                          ~~~~~~^~~~~~~
+      |                                                |
+      |                                                gzFile {aka struc=
t gzFile_s *}
+compilation terminated due to -Wfatal-errors.
+
+[1] https://github.com/COVESA/dlt-daemon/commit/543087ba98c103dc576edade=
ccf614c9dab1b9b3
+
+Upstream-Status: Submitted [https://github.com/COVESA/dlt-daemon/pull/82=
6]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ src/offlinelogstorage/dlt_offline_logstorage.h          | 2 +-
+ src/offlinelogstorage/dlt_offline_logstorage_behavior.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/offlinelogstorage/dlt_offline_logstorage.h b/src/offlin=
elogstorage/dlt_offline_logstorage.h
+index fe38687..09ea5ce 100644
+--- a/src/offlinelogstorage/dlt_offline_logstorage.h
++++ b/src/offlinelogstorage/dlt_offline_logstorage.h
+@@ -217,7 +217,7 @@ struct DltLogStorageFilterConfig
+     FILE *log;                      /* current open log file */
+     int fd;                         /* The file descriptor for the acti=
ve log file */
+ #ifdef DLT_LOGSTORAGE_USE_GZIP
+-    gzFile *gzlog;                  /* current open gz log file */
++    gzFile gzlog;                   /* current open gz log file */
+ #endif
+     void *cache;                    /* log data cache */
+     unsigned int specific_size;     /* cache size used for specific_siz=
e sync strategy */
+diff --git a/src/offlinelogstorage/dlt_offline_logstorage_behavior.c b/s=
rc/offlinelogstorage/dlt_offline_logstorage_behavior.c
+index f17fbb2..ff09c9e 100644
+--- a/src/offlinelogstorage/dlt_offline_logstorage_behavior.c
++++ b/src/offlinelogstorage/dlt_offline_logstorage_behavior.c
+@@ -1130,7 +1130,7 @@ int dlt_logstorage_prepare_on_msg(DltLogStorageFil=
terConfig *config,
+                     (config->sync =3D=3D DLT_LOGSTORAGE_SYNC_UNSET)) {
+ #ifdef DLT_LOGSTORAGE_USE_GZIP
+                     if (config->gzip_compression =3D=3D DLT_LOGSTORAGE_=
GZIP_ON) {
+-                        if (fsync(fileno(config->gzlog)) !=3D 0) {
++                        if (fsync(config->fd) !=3D 0) {
+                             if (errno !=3D ENOSYS) {
+                                 dlt_vlog(LOG_ERR, "%s: failed to sync g=
zip log file\n", __func__);
+                             }
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-kind=
s-of-build-failure.patch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon=
/0001-Fix-kinds-of-build-failure.patch
new file mode 100644
index 0000000000..403d1089e2
--- /dev/null
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-kinds-of-bu=
ild-failure.patch
@@ -0,0 +1,174 @@
+From 3d713358fe19ce02e7c580d26222ec2386c94bc9 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 12 Mar 2026 20:06:34 +0800
+Subject: [PATCH] Fix kinds of build failure
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Fix kinds of build failures caused by -Werror=3Dsign-conversion,
+-Werror=3Dcast-qual, -Werror=3Dconversion etc.
+Eg:
+src/offlinelogstorage/dlt_offline_logstorage.h:129:49: error: unsigned c=
onversion from =E2=80=98int=E2=80=99 to =E2=80=98unsigned int=E2=80=99 ch=
anges value from =E2=80=98-1=E2=80=99 to =E2=80=984294967295=E2=80=99 [-W=
error=3Dsign-conversion]
+  129 | #define DLT_LOGSTORAGE_GZIP_ERROR               -1 /* error case=
 */
+      |                                                 ^
+/dlt-daemon/src/offlinelogstorage/dlt_offline_logstorage.c:1303:36: note=
: in expansion of macro =E2=80=98DLT_LOGSTORAGE_GZIP_ERROR=E2=80=99
+ 1303 |         config->gzip_compression =3D DLT_LOGSTORAGE_GZIP_ERROR;
+
+      |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
+
+src/offlinelogstorage/dlt_offline_logstorage_behavior.c:851:16: error: c=
onversion from =E2=80=98z_size_t=E2=80=99 {aka =E2=80=98long unsigned int=
=E2=80=99} to =E2=80=98int=E2=80=99 may change value [-Werror=3Dconversio=
n]
+  851 |         return gzfwrite(ptr, size, nmemb, config->gzlog);
+      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+src/console/dlt-control-common.c:922:25: error: cast discards 'const' qu=
alifier from pointer target type [-Werror=3Dcast-qual]
+  922 |     json_object_to_file((char*)filename, json_filter_obj);
+      |
+
+Use explicit type conversion to make the build can pass
+
+Upstream-Status: Submitted [https://github.com/COVESA/dlt-daemon/pull/82=
6]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ src/console/dlt-control-common.c                       |  2 +-
+ src/daemon/dlt-daemon.c                                |  4 ++--
+ src/daemon/udp_connection/dlt_daemon_udp_socket.c      | 10 +++++-----
+ src/examples/dlt-example-multicast-clientmsg-view.c    |  8 ++++----
+ src/offlinelogstorage/dlt_offline_logstorage.h         |  2 +-
+ .../dlt_offline_logstorage_behavior.c                  |  4 ++--
+ 6 files changed, 15 insertions(+), 15 deletions(-)
+
+diff --git a/src/console/dlt-control-common.c b/src/console/dlt-control-=
common.c
+index 2aeea280..4f9e95b4 100644
+--- a/src/console/dlt-control-common.c
++++ b/src/console/dlt-control-common.c
+@@ -919,7 +919,7 @@ DltReturnValue dlt_json_filter_save(DltFilter *filte=
r, const char *filename, int
+     }
+=20
+     printf("Saving current filter into '%s'\n", filename);
+-    json_object_to_file((char*)filename, json_filter_obj);
++    json_object_to_file(filename, json_filter_obj);
+=20
+     return DLT_RETURN_OK;
+ }
+diff --git a/src/daemon/dlt-daemon.c b/src/daemon/dlt-daemon.c
+index 97af1cd9..94024eb4 100644
+--- a/src/daemon/dlt-daemon.c
++++ b/src/daemon/dlt-daemon.c
+@@ -867,7 +867,7 @@ int option_file_parser(DltDaemonLocal *daemon_local)
+=20
+                         if ((longval =3D=3D MULTICAST_CONNECTION_DISABL=
ED)
+                             || (longval =3D=3D MULTICAST_CONNECTION_ENA=
BLED)) {
+-                            daemon_local->UDPConnectionSetup =3D longva=
l;
++                            daemon_local->UDPConnectionSetup =3D (int)l=
ongval;
+                             printf("Option: %s=3D%s\n", token, value);
+                         }
+                         else {
+@@ -884,7 +884,7 @@ int option_file_parser(DltDaemonLocal *daemon_local)
+                     }
+                     else if (strcmp(token, "UDPMulticastIPPort") =3D=3D=
 0)
+                     {
+-                        daemon_local->UDPMulticastIPPort =3D strtol(val=
ue, NULL, 10);
++                        daemon_local->UDPMulticastIPPort =3D (int)strto=
l(value, NULL, 10);
+                     }
+ #endif
+                     else if (strcmp(token, "BindAddress") =3D=3D 0)
+diff --git a/src/daemon/udp_connection/dlt_daemon_udp_socket.c b/src/dae=
mon/udp_connection/dlt_daemon_udp_socket.c
+index 4c40cda8..b3408773 100644
+--- a/src/daemon/udp_connection/dlt_daemon_udp_socket.c
++++ b/src/daemon/udp_connection/dlt_daemon_udp_socket.c
+@@ -66,7 +66,7 @@ void dlt_daemon_udp_setmulticast_addr(DltDaemonLocal *=
daemon_local)
+     struct sockaddr_in clientaddr;
+     clientaddr.sin_family =3D AF_INET;
+     inet_pton(AF_INET, daemon_local->UDPMulticastIPAddress, &clientaddr=
.sin_addr);
+-    clientaddr.sin_port =3D htons(daemon_local->UDPMulticastIPPort);
++    clientaddr.sin_port =3D htons((uint16_t)daemon_local->UDPMulticastI=
PPort);
+     memcpy(&g_udpmulticast_addr.clientaddr, &clientaddr, sizeof(struct =
sockaddr_in));
+     g_udpmulticast_addr.clientaddr_size =3D sizeof(g_udpmulticast_addr.=
clientaddr);
+     g_udpmulticast_addr.isvalidflag =3D ADDRESS_VALID;
+@@ -224,17 +224,17 @@ void dlt_daemon_udp_clientmsg_send(DltDaemonClient=
SockInfo *clientinfo,
+=20
+     if ((clientinfo->isvalidflag =3D=3D ADDRESS_VALID) &&
+         (size1 > 0) && (size2 > 0)) {
+-        void *data =3D (void *)calloc(size1 + size2, sizeof(char));
++        void *data =3D (void *)calloc((size_t)(size1 + size2), sizeof(c=
har));
+=20
+         if (data =3D=3D NULL) {
+             dlt_vlog(LOG_ERR, "%s: calloc failure\n", __func__);
+             return;
+         }
+=20
+-        memcpy(data, data1, size1);
+-        memcpy(data + size1, data2, size2);
++        memcpy(data, data1, (size_t)size1);
++        memcpy((int*)data + size1, data2, (size_t)size2);
+=20
+-        if (sendto(g_udp_sock_fd, data, size1 + size2, 0, (struct socka=
ddr *)&clientinfo->clientaddr,
++        if (sendto(g_udp_sock_fd, data, (size_t)(size1 + size2), 0, (st=
ruct sockaddr *)&clientinfo->clientaddr,
+                    clientinfo->clientaddr_size) < 0)
+             dlt_vlog(LOG_ERR, "%s: Send UDP Packet Data failed\n", __fu=
nc__);
+=20
+diff --git a/src/examples/dlt-example-multicast-clientmsg-view.c b/src/e=
xamples/dlt-example-multicast-clientmsg-view.c
+index c00537e5..f8920453 100644
+--- a/src/examples/dlt-example-multicast-clientmsg-view.c
++++ b/src/examples/dlt-example-multicast-clientmsg-view.c
+@@ -74,9 +74,9 @@ int dlt_receiver_receive_socket_udp(struct clientinfos=
truct *clientinfo, DltRece
+     /* wait for data from socket */
+     unsigned int addrlen =3D sizeof(clientinfo->addr);
+=20
+-    if ((receiver->bytesRcvd =3D recvfrom(clientinfo->fd,
++    if ((receiver->bytesRcvd =3D (int32_t)recvfrom(clientinfo->fd,
+                                         receiver->buf + receiver->lastB=
ytesRcvd,
+-                                        receiver->buffersize - receiver=
->lastBytesRcvd,
++                                        (size_t)(receiver->buffersize -=
 receiver->lastBytesRcvd),
+                                         0,
+                                         (struct sockaddr *)&(clientinfo=
->addr), &addrlen))
+         <=3D 0) {
+@@ -177,11 +177,11 @@ int main()
+         dlt_receiver_receive_socket_udp(&clientinfo, &(clientinfo.recei=
ver));
+=20
+         while (dlt_message_read(&msg, (unsigned char *)(clientinfo.rece=
iver.buf),
+-                                clientinfo.receiver.bytesRcvd, 0, 0) =3D=
=3D DLT_MESSAGE_ERROR_OK) {
++                                (unsigned int)clientinfo.receiver.bytes=
Rcvd, 0, 0) =3D=3D DLT_MESSAGE_ERROR_OK) {
+             dlt_receive_message_callback_udp(&msg);
+=20
+             if (dlt_receiver_remove(&(clientinfo.receiver),
+-                                    msg.headersize + msg.datasize - siz=
eof(DltStorageHeader))
++                                    msg.headersize + msg.datasize - ((i=
nt32_t)(sizeof(DltStorageHeader))))
+                 =3D=3D DLT_RETURN_ERROR) {
+                 /* Return value ignored */
+                 dlt_message_free(&msg, 0);
+diff --git a/src/offlinelogstorage/dlt_offline_logstorage.h b/src/offlin=
elogstorage/dlt_offline_logstorage.h
+index 09ea5ce4..cfb70f33 100644
+--- a/src/offlinelogstorage/dlt_offline_logstorage.h
++++ b/src/offlinelogstorage/dlt_offline_logstorage.h
+@@ -192,7 +192,7 @@ struct DltLogStorageFilterConfig
+     int overwrite;                  /* Overwrite strategy */
+     int skip;                       /* Flag to skip file logging if DIS=
CARD_NEW */
+     char *ecuid;                    /* ECU identifier */
+-    unsigned int gzip_compression;  /* Toggle if log files should be gz=
ip compressed */
++    int gzip_compression;           /* Toggle if log files should be gz=
ip compressed */
+     /* callback function for filter configurations */
+     int (*dlt_logstorage_prepare)(DltLogStorageFilterConfig *config,
+                                   DltLogStorageUserConfig *file_config,
+diff --git a/src/offlinelogstorage/dlt_offline_logstorage_behavior.c b/s=
rc/offlinelogstorage/dlt_offline_logstorage_behavior.c
+index ff09c9eb..ae8f4442 100644
+--- a/src/offlinelogstorage/dlt_offline_logstorage_behavior.c
++++ b/src/offlinelogstorage/dlt_offline_logstorage_behavior.c
+@@ -848,10 +848,10 @@ DLT_STATIC int dlt_logstorage_write_to_log(void *p=
tr, size_t size, size_t nmemb,
+ {
+ #ifdef DLT_LOGSTORAGE_USE_GZIP
+     if (config->gzip_compression =3D=3D DLT_LOGSTORAGE_GZIP_ON) {
+-        return gzfwrite(ptr, size, nmemb, config->gzlog);
++        return (int)gzfwrite(ptr, size, nmemb, config->gzlog);
+     }
+     else {
+-        return fwrite(ptr, size, nmemb, config->log);
++        return (int)fwrite(ptr, size, nmemb, config->log);
+     }
+ #else
+     return (int)fwrite(ptr, size, nmemb, config->log);
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0003-allow-bu=
ild-with-cmake-4.patch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0=
003-allow-build-with-cmake-4.patch
deleted file mode 100644
index ac5fec5684..0000000000
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0003-allow-build-wit=
h-cmake-4.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-From ae23f2cccc169874d89903cad24bf36e19bef659 Mon Sep 17 00:00:00 2001
-From: Alper Ak <alperyasinak1@gmail.com>
-Date: Wed, 9 Jul 2025 18:18:33 +0300
-Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
- compatibility
-
-Fix:
-
-| CMake Error at CMakeLists.txt:17 (cmake_minimum_required):
-|   Compatibility with CMake < 3.5 has been removed from CMake.
-|
-|   Update the VERSION argument <min> value.  Or, use the <min>...<max> =
syntax
-|   to tell CMake that the project requires at least <min> but has been =
updated
-|   to work with policies introduced by <max> or earlier.
-|
-|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3D3.5 to try configuring anyw=
ay.
-|
-|
-| -- Configuring incomplete, errors occurred!
-
-Upstream-Status: Submitted [https://github.com/COVESA/dlt-daemon/pull/75=
5]
-
-Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
----
- CMakeLists.txt                   | 2 +-
- examples/example1/CMakeLists.txt | 2 +-
- examples/example2/CMakeLists.txt | 2 +-
- examples/example3/CMakeLists.txt | 2 +-
- examples/example4/CMakeLists.txt | 2 +-
- 5 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 94185b8..2a0f619 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -14,7 +14,7 @@
- #######
-=20
- # Set minimum Cmake version and setup policy behavior
--cmake_minimum_required(VERSION 3.3)
-+cmake_minimum_required(VERSION 3.5)
-=20
- if(${CMAKE_VERSION} VERSION_GREATER "3.20" OR ${CMAKE_VERSION} VERSION_=
EQUAL "3.20")
-     cmake_policy(SET CMP0115 OLD)
-diff --git a/examples/example1/CMakeLists.txt b/examples/example1/CMakeL=
ists.txt
-index 60644a1..44cd053 100644
---- a/examples/example1/CMakeLists.txt
-+++ b/examples/example1/CMakeLists.txt
-@@ -17,7 +17,7 @@
- # DLT example implementation
- #
-=20
--cmake_minimum_required( VERSION 2.6 )
-+cmake_minimum_required( VERSION 3.5 )
- project( automotive-dlt-example1 )
-=20
- #
-diff --git a/examples/example2/CMakeLists.txt b/examples/example2/CMakeL=
ists.txt
-index 66a4f24..a8efbcf 100644
---- a/examples/example2/CMakeLists.txt
-+++ b/examples/example2/CMakeLists.txt
-@@ -17,7 +17,7 @@
- # DLT example implementation
- #
-=20
--cmake_minimum_required( VERSION 2.6 )
-+cmake_minimum_required( VERSION 3.5 )
- project( automotive-dlt-example2 )
-=20
- #
-diff --git a/examples/example3/CMakeLists.txt b/examples/example3/CMakeL=
ists.txt
-index 45b7467..4d4958d 100644
---- a/examples/example3/CMakeLists.txt
-+++ b/examples/example3/CMakeLists.txt
-@@ -17,7 +17,7 @@
- # DLT example implementation
- #
-=20
--cmake_minimum_required( VERSION 2.6 )
-+cmake_minimum_required( VERSION 3.5 )
- project( automotive-dlt-example3 )
-=20
- #
-diff --git a/examples/example4/CMakeLists.txt b/examples/example4/CMakeL=
ists.txt
-index 53a4fad..161c333 100644
---- a/examples/example4/CMakeLists.txt
-+++ b/examples/example4/CMakeLists.txt
-@@ -17,7 +17,7 @@
- # DLT example implementation
- #
-=20
--cmake_minimum_required( VERSION 2.6 )
-+cmake_minimum_required( VERSION 3.5 )
- project( automotive-dlt-example4 )
-=20
- #
---=20
-2.43.0
-
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.patch b/m=
eta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.patch
deleted file mode 100644
index 3699b8c83a..0000000000
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-Upstream-Status: Submitted [https://github.com/COVESA/dlt-daemon/pull/54=
4]
-
-From 8121a979026d5fcb05bd4e5d3a0647f321b56106 Mon Sep 17 00:00:00 2001
-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
-Date: Thu, 28 Sep 2023 12:54:23 +0200
-Subject: [PATCH] Add common dlt_cdh_cpuinfo.c to unblock build on non am=
d64
- and i386 arcs
-
----
- src/core_dump_handler/dlt_cdh.h         |  2 ++
- src/core_dump_handler/dlt_cdh_cpuinfo.c | 33 +++++++++++++++++++++++++
- src/core_dump_handler/dlt_cdh_crashid.c |  2 +-
- 3 files changed, 36 insertions(+), 1 deletion(-)
- create mode 100644 src/core_dump_handler/dlt_cdh_cpuinfo.c
-
-diff --git a/src/core_dump_handler/dlt_cdh.h b/src/core_dump_handler/dlt=
_cdh.h
-index d572ecf3..8608c6c4 100644
---- a/src/core_dump_handler/dlt_cdh.h
-+++ b/src/core_dump_handler/dlt_cdh.h
-@@ -55,6 +55,8 @@ typedef struct
-     uint64_t pc;
-     uint64_t ip;
-     uint64_t lr;
-+    uint64_t sp;
-+    uint64_t fp;
-=20
- } cdh_registers_t;
-=20
-diff --git a/src/core_dump_handler/dlt_cdh_cpuinfo.c b/src/core_dump_han=
dler/dlt_cdh_cpuinfo.c
-new file mode 100644
-index 00000000..03509fda
---- /dev/null
-+++ b/src/core_dump_handler/dlt_cdh_cpuinfo.c
-@@ -0,0 +1,33 @@
-+/*
-+ * SPDX license identifier: MPL-2.0
-+ *
-+ * Copyright (C) 2011-2015, BMW AG
-+ *
-+ * This file is part of COVESA Project DLT - Diagnostic Log and Trace.
-+ *
-+ * This Source Code Form is subject to the terms of the
-+ * Mozilla Public License (MPL), v. 2.0.
-+ * If a copy of the MPL was not distributed with this file,
-+ * You can obtain one at http://mozilla.org/MPL/2.0/.
-+ *
-+ * For further information see http://www.covesa.org/.
-+ */
-+
-+/*!
-+ * \author Gianfranco Costamagna <locutusofborg@debian.org>
-+ *
-+ * \copyright Copyright =C2=A9 2011-2015 BMW AG. \n
-+ * License MPL-2.0: Mozilla Public License version 2.0 http://mozilla.o=
rg/MPL/2.0/.
-+ *
-+ * \file dlt_cdh_cpuinfo.c
-+ */
-+
-+#include "dlt_cdh_cpuinfo.h"
-+
-+void get_registers(prstatus_t *prstatus, cdh_registers_t *registers)
-+{
-+/*    struct user_regs_struct *ptr_reg =3D (struct user_regs_struct *)p=
rstatus->pr_reg;
-+
-+    registers->pc =3D ptr_reg->pc;*/ /* [REG_PROC_COUNTER]; */
-+
-+}
-diff --git a/src/core_dump_handler/dlt_cdh_crashid.c b/src/core_dump_han=
dler/dlt_cdh_crashid.c
-index bca44e0e..8dd98d70 100644
---- a/src/core_dump_handler/dlt_cdh_crashid.c
-+++ b/src/core_dump_handler/dlt_cdh_crashid.c
-@@ -30,7 +30,7 @@
- #include <stdio.h>
- #include <string.h>
- #include <errno.h>
--#include <asm/prctl.h>
-+#include <sys/prctl.h>
- #include <inttypes.h>
-=20
- #include "dlt_cdh.h"
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/567.patch b/m=
eta-oe/recipes-extended/dlt-daemon/dlt-daemon/567.patch
deleted file mode 100644
index fd36480456..0000000000
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/567.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Upstream-Status: Submitted [https://github.com/COVESA/dlt-daemon/pull/56=
7]
-
-From c84e48f6986054cf8b9459e608235b7bd1635746 Mon Sep 17 00:00:00 2001
-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
-Date: Mon, 13 Nov 2023 12:37:23 +0100
-Subject: [PATCH] dlt_cdh:
-
-Make sure on 64 bit we read an ELF64 structure.
-Otherwise we get a read error, and the context file is missing some good
-to know information
----
- src/core_dump_handler/dlt_cdh.h | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/src/core_dump_handler/dlt_cdh.h b/src/core_dump_handler/dlt=
_cdh.h
-index 8608c6c4..3dac480a 100644
---- a/src/core_dump_handler/dlt_cdh.h
-+++ b/src/core_dump_handler/dlt_cdh.h
-@@ -45,10 +45,17 @@
- #define CORE_FILE_PATTERN           "%s/core.%d.%s.%d.gz"
- #define CONTEXT_FILE_PATTERN        "%s/context.%d.%s.%d.txt"
-=20
-+#if ((__SIZEOF_POINTER) =3D=3D 4)
- #define ELF_Ehdr    Elf32_Ehdr
- #define ELF_Phdr    Elf32_Phdr
- #define ELF_Shdr    Elf32_Shdr
- #define ELF_Nhdr    Elf32_Nhdr
-+#else
-+#define ELF_Ehdr    Elf64_Ehdr
-+#define ELF_Phdr    Elf64_Phdr
-+#define ELF_Shdr    Elf64_Shdr
-+#define ELF_Nhdr    Elf64_Nhdr
-+#endif
-=20
- typedef struct
- {
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb b/=
meta-oe/recipes-extended/dlt-daemon/dlt-daemon_3.0.0.bb
similarity index 91%
rename from meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
rename to meta-oe/recipes-extended/dlt-daemon/dlt-daemon_3.0.0.bb
index 82edde6c9d..838a619a42 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_3.0.0.bb
@@ -17,12 +17,11 @@ DEPENDS =3D "zlib gzip-native json-c"
 SRC_URI =3D "git://github.com/COVESA/${BPN}.git;protocol=3Dhttps;branch=3D=
master \
            file://0002-Don-t-execute-processes-as-a-specific-user.patch =
\
            file://0004-Modify-systemd-config-directory.patch \
-           file://544.patch \
-           file://567.patch \
-           file://0001-CMakeLists-txt-make-DLT_WatchdogSec-can-be-set-by=
-user.patch \
-           file://0003-allow-build-with-cmake-4.patch \
+           file://0001-Fix-compile-failure-related-to-gzlog.patch \
+           file://0001-Fix-kinds-of-build-failure.patch \
+           file://0001-Fix-build-failures.patch \
            "
-SRCREV =3D "0f2d4cfffada6f8448a2cb27995b38eb4271044f"
+SRCREV =3D "f595ea29d1007ca1c3b2d1fd3a88adf7d3db6320"
=20
=20
 PACKAGECONFIG ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '=
 systemd systemd-watchdog systemd-journal ', '', d)} \
@@ -71,4 +70,5 @@ FILES:${PN}-doc +=3D "${datadir}/dlt-filetransfer"
=20
 do_install:append() {
     rm -f ${D}${bindir}/dlt-test-*
+    sed -i -e 's:${RECIPE_SYSROOT}::g' ${D}/usr/lib/pkgconfig/automotive=
-dlt.pc
 }
--=20
2.34.1


