Return-Path: <abhishek.bachiphale@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52240C79F99
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 10:21:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31650.1788776511074488736
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Sep 2026 03:21:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=ERY4YiKM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3710b275f7=abhishek.bachiphale@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6879cjUC3809207
	for <openembedded-devel@lists.openembedded.org>; Mon, 7 Sep 2026 03:21:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=iZ6d7DtP2ml6dtonlqtrPPGsmgphuZutM99CvUT2rh4=; b=
	ERY4YiKMqVjKaGZg1NcYaAs99nzEsvl0CB5+szJkOOdDhniILWDiBh54h3h2WRS3
	WSUOuXPpYsUNqMhvve0cmfxG/kew5n+0PivFB9NuEK4ab0U6phUJL1cXZWFYLd80
	Tte/jInkS9yInkdivoQZa0SeUEPX4PI+OkR7zcC0tZqudU2MIxXNDk0GzwO3WBj0
	B8HDCFCI3bb2NO6HIr7yJAJUmShnQSUM31Plnn7g4dfmX0fBsBWUqmL9PvOEhPhD
	6oGze2llt9TQxn28MWdmUTdJ/eKEPtecvXnxLFNEmuxE8s17KI8NA7zTLrUYNnBB
	qOsZRQfcQrF4ZHOW5C/UEQ==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021075.outbound.protection.outlook.com [52.101.62.75])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ggec0t373-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 03:21:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=or9Jyb8hnPAnqNcA1cpD+kGvZmVpDkv1nF3xutXsd0hoboD3NyMQzuoJtrEBPdIx1D4TnaWx23t45fi4YDJUjhneWFhW+kLIgl3QZ/iTsn3qMq/zM6xRHsd9lX36W6LeE6KIA6yJfK1OMJYaEJFhLlzu7bx77U0oAFoAOi5hF7+nUpiruzaEsHZQOVdkkNCUaQcLL+KRGKb3GKB8WMFFmMCdlHGnI2QaKOseBMAuikQkST3p8G1WxUZyhf9jF797ogh3uvP9y3GsjMJ8J7Ns6ybae5K/tKwxiOKkN/FvLBLSoqpCWRUtncpWE3kDqIuj6RxaxhZCH+mPHBl4ZHSL2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iZ6d7DtP2ml6dtonlqtrPPGsmgphuZutM99CvUT2rh4=;
 b=JTF4qcBGG8Z6LPNISN5xu5mxYXN9Q4WwaxkgTf/mfO0kvw7n/SYUatFDQQcAXfSe0+2pxFzH4elWOlQOZ+KbsTTp8UfzH41OQd5IIZ8brV/WSBxqU2AO1G99/9C27lPqKU8aAZ8s6dqwxvn8pOyUU1PqlN71AbDLN/KHBDoP4w42bsUceoFSIPqeVJl8fN+4y+nq0jySIS6E2w1C+IgGzix2FRQAHJEpWcsRzSPEXZO6E5J6IceId+rN6kiF06v1vP2pGA/qdNc0BeVdw0PNZQae9n8ZbiEZmOreK1xcvh/R6uVkFRC8EhFXHoyCNqGXhze7DoILRASEQUXgVE0jQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW6PR11MB8410.namprd11.prod.outlook.com (2603:10b6:303:249::17)
 by DS0PR11MB8738.namprd11.prod.outlook.com (2603:10b6:8:192::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.13; Mon, 7 Sep
 2026 10:21:44 +0000
Received: from MW6PR11MB8410.namprd11.prod.outlook.com
 ([fe80::cb25:91f6:670d:3578]) by MW6PR11MB8410.namprd11.prod.outlook.com
 ([fe80::cb25:91f6:670d:3578%6]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 10:21:44 +0000
From: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com
Subject: [meta-oe][wrynose][PATCH 3/4] thrift: fix CVE-2026-48145
Date: Mon,  7 Sep 2026 15:51:06 +0530
Message-Id: <20260907102107.4007371-4-Abhishek.Bachiphale@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20260907102107.4007371-1-Abhishek.Bachiphale@windriver.com>
References: <20260907102107.4007371-1-Abhishek.Bachiphale@windriver.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SE2P216CA0130.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c7::7) To SJ2PR11MB8402.namprd11.prod.outlook.com
 (2603:10b6:a03:545::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW6PR11MB8410:EE_|DS0PR11MB8738:EE_
X-MS-Office365-Filtering-Correlation-Id: bf96f36e-a1ed-4762-bd7e-08df0cc9d0a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|52116014|10067099003|56012099006|11063799006|6133799003|12006099003|18002099003|22082099003|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	erECy3hAZ+JOrHZdHedt82szMC/aBG0Lw0pVo5Bs6vnEhJyDJIA2lI4voAMsc7M3RUTZwi7V2XHbK982/lElpWyMbkHH51rIh6ns75AnClsp41FgjoffyfH/+ShcLd1HlCUbIr3/kWRZlhJi1Efz674+zLlahyHbNok8nV84ZbDsoo+x+KWnolOZkcCcZ2hP3azN6S4enSaIe7BI+cj+v/x3HQTLkzW4n9l1YQcOgPz6bXdUpaKT0WY2vEcfcVJGswxy11JcX71Q9Ies7oUmdUsft2Uf+Jac9/EGbQFW829UhACyh9ScGMKYysk7xyS5Qplzhy+dxMnAgOnOqy+XT5FLGsHdnKgSHfC9oShxaHAdAxiTjCtXfSRG5++XYvXX7VC0R+QY54ydrVGAai5fKVZyLcjjTOk75MnffwMCMbXtmOxFtcWnlF5Yc1r4oZ2dJMGC3xOzOMk4Tt5Yz9Kh3Q7LqC4bvz816se3Xk4Qej9j8Uqqunhw8JZpLcN5bO1+v4H3Z1bx/yjtjCPbiyempQYGFBqntOcwfiCc3BJAAGPu3GykZ+Www2K+U9OH8jJ/FDqBEXy7J61JIw67EjIjCFFgMpg1zEM5dGcI/rkhra4JHH+apPFFz6WArD7yDc7gtQlrQGMBmw4Uvyqliww7r0hcBcb/wT8QYFWY0qQjJb/71fECTp7gFEuh+3FD6/WXVmtEFr8eWrcYpHWL+cLpWroI1X6fo6JQMnEnebF3CuA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW6PR11MB8410.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(52116014)(10067099003)(56012099006)(11063799006)(6133799003)(12006099003)(18002099003)(22082099003)(13003099007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?a0pwNXFEZmFTaU5INDgxN2RLMmYxTlF3U1RFRjYzR1d4L052SVpFNFFoSDFE?=
 =?utf-8?B?MEhvY1pCcXJNS0dCekc1UzIzbzZvcXVrOG9MNzh5M1V1OE5heEx0NkJsRDVm?=
 =?utf-8?B?bTAxU1hhSHNMR2JVcDBlN0ZtSkM3aTVuTEVmcGVna3lyM0VyeXcwWHMzN3gr?=
 =?utf-8?B?UzUxU0gxcnRlVHFPRUlBMEdZcSsveWxWWHBRRGhXTHAxa295TzlNNWdkS3dq?=
 =?utf-8?B?ZC9KNkRDeXRtSUdOd2VQVFJiMElidjZXNVNpeWo4ZU1yRlZ2WFZYeThvTHVV?=
 =?utf-8?B?bHhQc2FwdldKSzdIbGlTQlljemt6RG5MbmVobXpIZzNoaEdIZjJ5REczNVdI?=
 =?utf-8?B?ckliV0J1ZDY1L2hDcUJ1K1poMFhWbFNxdHAzeFZ6RGRhVTdrbkNSU25xY202?=
 =?utf-8?B?azdmMWRkK2lPVVRWNHpFWkJlUlg1YXFZWXZpN3RVZ0lscVk3NWFmK1F2VkFQ?=
 =?utf-8?B?QW5iRUhvY2Y3SVpHaHR1YWhuZTFaU2FoMkJZNGlhR1l1YUoya0JwVkNiMHdh?=
 =?utf-8?B?ajYxdWpkWjUvRi9RcDhnRTFzeDJ3K3YwSXpPeUJQTmU0S3YxVUY4WE5YYStP?=
 =?utf-8?B?UDJNZktEbE8wdnlJUEdVNUkyeCtRRmYzZ0lHTlZQTjQrMUU4RUgra1VRbGVw?=
 =?utf-8?B?L29EZ25OenYyR1VMU3U1RDNVczZOTng5L0VRdHZTaXE4Z0o0K0p5WTJ5Yzg3?=
 =?utf-8?B?M2FtTW1nc05iUFEyTXJZNnJSdXk4TFlXazlVVmhGL1RpR1htUEpBV2xLSGwr?=
 =?utf-8?B?RG9wRCtseGZWb1cyWGxHOHJRTjY5MGpCdy96VnNuWmx0bXNvMWkxL2xkREpU?=
 =?utf-8?B?SmQ1c1ZGTld6R0d4WlE2Ly9BZ0IrSm0xRXhtZlplYUpUSG9oeENqYzRsV20x?=
 =?utf-8?B?clF1bUZkaEJUN25iWUpVNTQxdURIYmtJVWVlU05EK000bTRvajBEaTdjcjh6?=
 =?utf-8?B?L09rUEZpUkdaellrNWwzZWdKQ20rdjY0KzIvKzdQVUhhT1AvZnUrbzJTRlJC?=
 =?utf-8?B?Tll6dmpNcHhrbGJmY1k0SFAvRkh0QWE2STA4RlZXZVZLZ0Y3azlGQklXbk9D?=
 =?utf-8?B?NGhPazJLUzR2NkRvUTQ0ajZuL2tNSFIxOFRDeklHUkJRM0UzNDE2eGVsWlJX?=
 =?utf-8?B?YUJ5T2FpNmlJd01mOVcyT3FPSlVPd2lXeUV6TStIMDQ4WXlBa1dVU1VFWWw2?=
 =?utf-8?B?VThYQ09Zcmt3TVd6S093OXZDeTkxNHVvbVl0NVgzSHNRQ3ZnOFczYW10VUJo?=
 =?utf-8?B?aW90OFZuektSYTlMUjkvT2g5bFhYZnBBUDFhUWIwenR0djJCTGtlUDZ3T2Yv?=
 =?utf-8?B?d0hXcWhNeVNNano4aExGQTg5MEJydm1kQ1lFMzM2TXk4c0pOT0JDZ2tMTmoy?=
 =?utf-8?B?SW9adGRwcVdqY0FhSllNTlY4Q0syUkNrMjBNQ3hTOFpJeVJaOFFWNW9vUkpF?=
 =?utf-8?B?WVhPT0lEOUlmYWJxYzU2SS9FSjRIeVRtNHlMSGVDclNxeDRhcGltSi9IaHYz?=
 =?utf-8?B?SHkwOGt2VEZqYmhaRTN2WDRnYTRKQmhkVzhNdmE2dEVZY1BLa1JnREJjOHN4?=
 =?utf-8?B?L3RpNW5JYk5lYmc5Sll2K1JQbUNtSHdtQmJBbEVvTUcyOW9zYzl1SFcwWCtu?=
 =?utf-8?B?aFRHMkVmYVI0VFgydkt1b3dqMkxNaUgwMzY0V3QxMFpqWTZsaHUwM1V1Uk9U?=
 =?utf-8?B?QU1xSUttUHVuaEUyNXl3NHVwUm93N2EzZ1ZYOHNpcjB5NHdzMjNDYlg5QnFn?=
 =?utf-8?B?WHdjQmw4WTd3d0tEQWVUQUlkZ0lFTlRva0tUQnBKZDZRMFlzN2xKY01IQ1g3?=
 =?utf-8?B?bUlZUTdPOWhkR3c3ZERISUdNZ0R2dytJeSsyQzczVnFXVmRpU2M1cDdWS3pU?=
 =?utf-8?B?Y3kzT01FS2xWaHRLSytGbmZKN3BXbStPamtQZjFrbkdmcm9qY1E5MHhWZTVs?=
 =?utf-8?B?YkN5bERzSmhxOThQNkJhb2RaeVJnS2VrNTdDS2lsUStiQUQ1bEFhcXFtS04y?=
 =?utf-8?B?ZUNuQnd5QjYrSFJxWDNZOVM5UkN2RHlFV0pHRmkxZUxpRTlML2lkaU5DTjBM?=
 =?utf-8?B?a3ZJZnFKbTRkNVhRVVpoNlducWNUZXcwT2piZ0xCZTVWM0NaNUhzVGpHbldF?=
 =?utf-8?B?MXVRN0ptaGl0Vk5ZMk5QNkE3MEs4TnhWL0JybW9lMmU5a3VabUZLa1lyM2Nt?=
 =?utf-8?B?TXRaei9rVVhDeVhrNlQwdWpKcU5GK253NGZLdmlPKy9TZTVJTXZNQ3c3d2dj?=
 =?utf-8?B?OUVQZkp3QjBJOG93b2VtNkxINWZLeW90bmQ1d1crNlFqaUNYb0l5WlJORE1m?=
 =?utf-8?B?WjQwSlFKYUZIbFI0K01BcDZQc2F4cXk0b1dnbnNXYXRnZENjSlUzWWQ3VHll?=
 =?utf-8?Q?PkzX2mbbwpUqr2VGHTsx0kuxNNK/jbsI8l+hP?=
X-Exchange-RoutingPolicyChecked: 
	AH+NYPB7d0Im66ikZo/6iNKxxf5VGqRPWSdmrzgS7SH52gEKK+NP3veMk+tAa85hhQbnAn1TUgBi68ouwOt/lmlBMLqwtC4boJ0m/VObRk114SRQabw7wwe9aORZx6PBBcp9Gk3Rv4BpD3XlbxZ9liMPHxH6zwjFGYs8XwDpY7UpSstu7D3dn2X1rdKokxojOyU04uW4UHiSNNmuQgEaLILJoWqRZMtGP0CS/txcXciPlk4Ra5i4w0U6gkMIEBIBFEK0pspd3vSBDEUZN7DZ284xe4d4npfrXoWju/xoFUblZASu+BovqDW2/eB+tqqoh5+QvYUM8csxeX6JjmkEGA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf96f36e-a1ed-4762-bd7e-08df0cc9d0a2
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8402.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 10:21:44.4933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N1qPZO70UbweqIRI2PnF6K64tXOtQRII2z0I6nGDmYiWtIYbfwcCI/85KVR3WGbCCge8Et/sQ1vqk3Z6bVVoSiK65c6sAuDhJKjVG3uqI3YriEYAtgBwRwy6eyaNpXdP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8738
X-Authority-Analysis: v=2.4 cv=E+v9Y6dl c=1 sm=1 tr=0 ts=6a9e903e cx=c_pps
 a=APgIdIbuBBIe7PXa++EYhg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=mV9VRH-2AAAA:8 a=t7CeM3EgAAAA:8
 a=6gl_cCoBAAAA:8 a=A1X0JdhQAAAA:8 a=P5wrnlEIAAAA:8 a=fLVUkWqjAAAA:8
 a=t7-nprh3AAAA:8 a=907Dq08TzvMCUCo10xoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22 a=Bor9z-CvbNo2M6AZn8_k:22 a=aoaxo0Z0h-rxbPFMW5aL:22
 a=yP29yDhXvrXOTQxZJtvQ:22 a=kkU8RBYwHATXwbvRRDo2:22
X-Proofpoint-ORIG-GUID: lz-djmWhjBZIwxejvgKr_e7RgAtPPAjV
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExMSBTYWx0ZWRfX6QiG7Cz5iFNg
 yKw2Z0NfGw+wLbrJ+GnpORrcQIt13Rzq6+vCmoyEefs9S4hAg/F+R0v9fzoqGLUyHorJc4z+Yv5
 ijjeihgNrHQ6ukUzdIMqXqEir9bl3lrUr3f2CzsmKXsjT4IuhmF2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExMSBTYWx0ZWRfX/zg51thucxPc
 /U0VCS3kcjewXUdehX+Gs1G6/EG+qVXuSOwfb0FTLgvKLZd4yQUbOimbJrv3sqASvSWP5zDcrzb
 6KFkkO3RkWaLhdXL7aQMGzQoOMCn7sAb9lOK3zZFQ+uF5UB9E4Z+5TYBrJgxzWDfJbufi1YZwcE
 nnlfBbAj8oU8BZ5rKpOhJ8D2E111T1KmrbHn7JCZqo+fY3zchZekX/2HHa63GPK7qKVNUccbdjB
 5syCr16dhClVuuOEaHyrL1KzWTitSHZEiuD50QZthyQjhWS4jZvvDGpIZzvTAZeN2sQ3bxtfWck
 3Bwm8bJvL1z9nel7l5uUeljo6Mtj1uQhBcS4r2Bf3k8SCtftVEnubxQ4y6GhKs7eCV/w/W66EAR
 ziklNMnjAYaW7IvXXZhYt2qUhyr2Gptt2uGWwjMtTI7TBJ8o3p7DgCbqW7U2go1YyYRoYZMvman
 acS6JZuAIV8G2rX5hBg==
X-Proofpoint-GUID: lz-djmWhjBZIwxejvgKr_e7RgAtPPAjV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070111
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6879cjUC3809207
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 10:21:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129811

Improper Validation of Certificate with Host Mismatch vulnerability in
Apache Thrift C++ bindings. This issue affects Apache Thrift: before
0.24.0.

Backport patch to fix CVE-2026-48145.

Reference:
[https://nvd.nist.gov/vuln/detail/cve-2026-48145]

Upstream Patch:
[https://github.com/apache/thrift/commit/c1457c69fbd49c6d554dafe91f100404=
9537322b]

Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
---
 .../thrift/thrift/CVE-2026-48145.patch        | 137 ++++++++++++++++++
 .../thrift/thrift_0.22.0.bb                   |   1 +
 2 files changed, 138 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-4=
8145.patch

diff --git a/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-48145.pa=
tch b/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-48145.patch
new file mode 100644
index 0000000000..34be3bb6cc
--- /dev/null
+++ b/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-48145.patch
@@ -0,0 +1,137 @@
+From c1457c69fbd49c6d554dafe91f1004049537322b Mon Sep 17 00:00:00 2001
+From: Jens Geyer <jensg@apache.org>
+Date: Thu, 21 May 2026 00:16:49 +0200
+Subject: [PATCH] Enforce RFC 6125 wildcard placement in TSSLSocket hostn=
ame
+ matching Client: cpp
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Wildcards in certificate names must appear only in the leftmost
+label per RFC 6125 =C2=A76.4.3. Add the check to matchName() and
+cover it with a dedicated Boost.Test suite.
+
+CVE: CVE-2026-48145
+Upstream-Status: Backport [https://github.com/apache/thrift/commit/c1457=
c69fbd49c6d554dafe91f1004049537322b]
+
+Co-Authored-By: Claude Sonnet 4.6 <noreply@anthropic.com>
+Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
+---
+ lib/cpp/src/thrift/transport/TSSLSocket.cpp |  6 ++
+ lib/cpp/test/Makefile.am                    | 10 ++++
+ lib/cpp/test/TSSLSocketMatchNameTest.cpp    | 61 +++++++++++++++++++++
+ 3 files changed, 77 insertions(+)
+ create mode 100644 lib/cpp/test/TSSLSocketMatchNameTest.cpp
+
+diff --git a/lib/cpp/src/thrift/transport/TSSLSocket.cpp b/lib/cpp/src/t=
hrift/transport/TSSLSocket.cpp
+index db426c85ebe..f97962ea5b7 100644
+--- a/lib/cpp/src/thrift/transport/TSSLSocket.cpp
++++ b/lib/cpp/src/thrift/transport/TSSLSocket.cpp
+@@ -1215,6 +1215,12 @@ Decision DefaultClientAccessManager::verify(const=
 sockaddr_storage& sa,
+  * @return True, if "host" matches "pattern". False otherwise.
+  */
+ bool matchName(const char* host, const char* pattern, int size) {
++  // RFC 6125 =C2=A76.4.3: wildcard must not appear outside the leftmos=
t label.
++  bool past_first_dot =3D false;
++  for (int k =3D 0; k < size; k++) {
++    if (pattern[k] =3D=3D '.') { past_first_dot =3D true; continue; }
++    if (pattern[k] =3D=3D '*' && past_first_dot) return false;
++  }
+   bool match =3D false;
+   int i =3D 0, j =3D 0;
+   while (i < size && host[j] !=3D '\0') {
+diff --git a/lib/cpp/test/Makefile.am b/lib/cpp/test/Makefile.am
+index 7c4153b49e4..234dd0b9964 100644
+--- a/lib/cpp/test/Makefile.am
++++ b/lib/cpp/test/Makefile.am
+@@ -108,6 +108,7 @@ check_PROGRAMS =3D \
+ 	TFileTransportTest \
+ 	link_test \
+ 	OpenSSLManualInitTest \
++	TSSLSocketMatchNameTest \
+ 	EnumTest \
+ 	RenderedDoubleConstantsTest \
+ 	AnnotationTest
+@@ -413,6 +414,15 @@ OpenSSLManualInitTest_LDADD =3D \
+ 	$(OPENSSL_LDFLAGS) \
+ 	$(OPENSSL_LIBS)
+=20
++TSSLSocketMatchNameTest_SOURCES =3D \
++	TSSLSocketMatchNameTest.cpp
++
++TSSLSocketMatchNameTest_LDADD =3D \
++	$(top_builddir)/lib/cpp/libthrift.la \
++	$(BOOST_TEST_LDADD) \
++	$(OPENSSL_LDFLAGS) \
++	$(OPENSSL_LIBS)
++
+ #
+ # Common thrift code generation rules
+ #
+diff --git a/lib/cpp/test/TSSLSocketMatchNameTest.cpp b/lib/cpp/test/TSS=
LSocketMatchNameTest.cpp
+new file mode 100644
+index 00000000000..dabfa59b9f8
+--- /dev/null
++++ b/lib/cpp/test/TSSLSocketMatchNameTest.cpp
+@@ -0,0 +1,61 @@
++/*
++ * Licensed to the Apache Software Foundation (ASF) under one
++ * or more contributor license agreements. See the NOTICE file
++ * distributed with this work for additional information
++ * regarding copyright ownership. The ASF licenses this file
++ * to you under the Apache License, Version 2.0 (the
++ * "License"); you may not use this file except in compliance
++ * with the License. You may obtain a copy of the License at
++ *
++ *   http://www.apache.org/licenses/LICENSE-2.0
++ *
++ * Unless required by applicable law or agreed to in writing,
++ * software distributed under the License is distributed on an
++ * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
++ * KIND, either express or implied. See the License for the
++ * specific language governing permissions and limitations
++ * under the License.
++ */
++
++#define BOOST_TEST_MODULE TSSLSocketMatchNameTest
++#include <boost/test/unit_test.hpp>
++#include <thrift/transport/TSSLSocket.h>
++
++using apache::thrift::transport::AccessManager;
++using apache::thrift::transport::DefaultClientAccessManager;
++
++BOOST_AUTO_TEST_SUITE(TSSLSocketMatchNameTest)
++
++// Helper: ALLOW means match, SKIP means no match.
++static bool allows(const std::string& host, const std::string& pattern)=
 {
++  DefaultClientAccessManager mgr;
++  return mgr.verify(host, pattern.c_str(), static_cast<int>(pattern.siz=
e()))
++         =3D=3D AccessManager::ALLOW;
++}
++
++BOOST_AUTO_TEST_CASE(standard_wildcard_matches) {
++  BOOST_CHECK(allows("foo.example.com", "*.example.com"));
++  BOOST_CHECK(allows("FOO.EXAMPLE.COM", "*.example.com"));  // case-ins=
ensitive
++  BOOST_CHECK(allows("a.b.c.example.com", "*.b.c.example.com"));  // le=
ftmost wildcard
++}
++
++BOOST_AUTO_TEST_CASE(exact_match) {
++  BOOST_CHECK(allows("example.com", "example.com"));
++  BOOST_CHECK(allows("foo.example.com", "foo.example.com"));
++}
++
++BOOST_AUTO_TEST_CASE(wildcard_must_not_span_labels) {
++  BOOST_CHECK(!allows("foo.bar.example.com", "*.example.com"));
++}
++
++BOOST_AUTO_TEST_CASE(wildcard_must_be_in_leftmost_label) {
++  // RFC 6125 =C2=A76.4.3: wildcard must not appear outside the leftmos=
t label.
++  BOOST_CHECK(!allows("example.foo.com",  "example.*.com"));
++  BOOST_CHECK(!allows("a.evil.com",       "a.ev*.com"));
++}
++
++BOOST_AUTO_TEST_CASE(no_suffix_bypass) {
++  BOOST_CHECK(!allows("evil.com.attacker.com", "evil.com"));
++}
++
++BOOST_AUTO_TEST_SUITE_END()
diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb b/meta-=
oe/recipes-connectivity/thrift/thrift_0.22.0.bb
index 0d804b9831..b68dacc806 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb
+++ b/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb
@@ -21,6 +21,7 @@ SRC_URI =3D "https://downloads.apache.org/${BPN}/${PV}/=
${BP}.tar.gz \
            file://CVE-2026-55969.patch \
            file://CVE-2026-48586-01.patch \
            file://CVE-2026-48586-02.patch \
+           file://CVE-2026-48145.patch \
            "
 SRC_URI[sha256sum] =3D "794a0e455787960d9f27ab92c38e34da27e8deeda7a5db0e=
59dc64a00df8a1e5"
=20
--=20
2.40.0


