Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 395FFC9830B
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 12:59:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6437.1790168395332132546
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 05:59:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=oeQaUZDo;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=37263e68a8=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8IbIl1528108
	for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 05:59:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=UcnyrHlbTBKzDNE8/3JkV+
	wYgfGH8e5t1IfJwmvsAic=; b=oeQaUZDowmLf+sTC/g/4xvi0fzM5cFquex/cy+
	nvhfhkFIdhvbGmIef1e/+v+PaOnXonu1Yk9MzNLpub+34dshIBVnCl4DoL30BOrU
	WPAZEcRpDs7HkPTcJkuyRKdvpMDBC2PfvDI+L5ZW2eKxi7KOq43IQrHymdRNLz5h
	lkmEEsmqg8aVdM+UTzUSv0DRbeX4Sv1aPmN+7CD2OtJfV+LurgrE2IkymPObjUkN
	0z1e4RJCC7ed4byPOci5s6n6+0aD9wI7MZGYjA0FGr7ggP7kHCn6x2jrltKChAlo
	9MXFyZBW4YiyVK5EScMhko61eZ0rBPbro9oE3kx6KPOFArWA==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020096.outbound.protection.outlook.com [52.101.201.96])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gsnp1eecy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 05:59:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eoBmSPqr+g97MZG9hds729A676yfl2nSoueQgMHC4NhM5d0Ob+e28ec1jhIBulLPaItMbclwgn1MQNGHj1SDlKeBkMHi0djw6kQrSL87ht1owdbniB4rHAf2rc99wvf/Ohqb61wWSuyW/jT7Xk2LbCxI22LgvrmpLsFnw+i1q+dQdkrSaCW+J6cd4u1AxlD9gXzMo9u96LiPVE5HvTptt5ipGw0alDlD6zS+zhoGiSkqJ74feDTdkPJ/ed4+MgSAh55aVugOnCMCrx1iVlCY1j4n105aK8jvHx1WETYWhPj01UPExW1zDReuN6xYXN5D6wLZMLlQT5tcxj6JgF8UlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UcnyrHlbTBKzDNE8/3JkV+wYgfGH8e5t1IfJwmvsAic=;
 b=Qv6h0G9LmT+BElrScfwzFbBTT+fSpMro2rSlav94U26b/88na45QM4yjwcYqpGz3regmTbBesHgPH7/skQ8XdNMYYMRJxhP1LrgHlZTPcd01KS7DdYEI7GZbDjNbXeJF2BR1L08UVMJoowQgJkT59bdyfijMozG2gudUpDqFgHO1CoKd6CpW2dia+msf033ZzLaQHNbmXQj5qA6d/xC78I/JipiOnoSPMvO0i5CNOPyeJ5Cn96yVhYoHJuKtjsiRE1/YMvw2LzjLgylU5vXD1fpte6Frq29lzoltIndgBQd3RzIwF+qlhtw7+oP+eoaaeW/uov+enO323KdUJv3MdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by SA1PR11MB8474.namprd11.prod.outlook.com (2603:10b6:806:3ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Wed, 23 Sep
 2026 12:59:51 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%4]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 12:59:50 +0000
Content-Type: multipart/alternative;
 boundary="------------p0QIfynRHJpNlSQYTln5ezNS"
Message-ID: <95aa82fb-9bae-4d4c-b244-7b0e44b9fcec@windriver.com>
Date: Wed, 23 Sep 2026 08:59:48 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-oe][scarthgap][PATCH] postfix: fix build on hosts with
 Linux 7.x kernel
To: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>,
        openembedded-devel@lists.openembedded.org
References: <20260923065746.2542154-1-HimaniRamesh.Barde@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20260923065746.2542154-1-HimaniRamesh.Barde@windriver.com>
X-ClientProxiedBy: BY3PR03CA0015.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::20) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|SA1PR11MB8474:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e48cbcb-95d7-4e74-41eb-08df19728db8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|22082099003|18002099003|13003099007|8096899003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	a2a0eb87W7oid6OYoXFpwlu1oeRxXtHDVGBtGI6zSOcZaZ/Jco5DWwhkLzMnm5MFwIYqB/t4xpXLchGNcxvohXb2vhS5BjZn7G9CKllX6rqmHDStk842WEq3LGjIAwjT4CxigNBIpJxhnsQ3ilBKQs1nC1dZzoewlHse1XFCHU6iNR6a35yDtej84V2LGGG2H1y3NPRIsRJvWgNJGqNuZ2nM0ehnpNEHogyuJoSdc+3RivUbZLdcXVyEX9QAnm08T5NFdesne3uzeUnfOx6KqkhLQ2CIO0p2BCM1BkwdoUUObPf5fjCUEe0Tb2yWwCWSV7ABFfcqNBZcijZRrDtXdoeFGHWixyMI1D2WIKsI4Y/BjVqJRrYTUpzvUnLCVsMlkG0LGpxke036cTAlsJ5V7tzkgpRM8vn804CGuZTHYb7etQETIhuSqA/ac+UDa6RfG2tBf3vBrtuLHADcpiWJIBIa+QM3F5qWWlehzPVGBjd9DNgWfnzDudovlIgCO/6QmRin6DtTPb0H8+JeosQqGebHSkon99F/Ewy1uoAhyOPez1luId2ew5JpCSALaFUtxjjFuFDZGa21nY+101TZO+0fNBN8p9bzxvRDLjTJmU3MUJxR/pq/omRYMW/e31LI
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(22082099003)(18002099003)(13003099007)(8096899003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NllRb2tBc2R3Q3BsdXhBUUpQcElLZDI4UlU2by9MU3Q4cG5aR1ExcjYxUEVx?=
 =?utf-8?B?VWg2TytrSGpnNGFuYS9ZWmJLcnR2cmlWV0FpM1RudTd5M1V0dFhhR1ZuQWJD?=
 =?utf-8?B?c3Y0RHZyN1VISkV5dncyOWlzcjJQeGpzUGlSVzQrdWVMcS9pL1plQ2w0RFFi?=
 =?utf-8?B?SitBV0NFbUFtcXlzMHovR0Vjdkl5OHFJb3pRWjMyZlVZQ21mM3Z0U3RvQ081?=
 =?utf-8?B?ZjdIUkh5SEdPT3p1QUYxTG5FR3g2UUc0UEYyK0I0T2Z4KzZUcWZwVkI3Mlhx?=
 =?utf-8?B?VnRTeUFnYkwrbmxPMS9jWnBFWGw5M21COFUrdnV2dXBzaXZTMzMzN002OEp4?=
 =?utf-8?B?SWV1UVV4L0RTWmV3a3lFZ3FaZGNJbzl1MlB2QnE3YS9zcldHMkd6ZGN6ejJo?=
 =?utf-8?B?WUNyWm5OK1l6T2M2dGJ6Y05XYlA4N1ludDgwN2xEd1RoYXp5UUJoWVVsYTJE?=
 =?utf-8?B?SG1IcEt5ZnpnTG5CM21vendEOXdwaXowTENDTTBjdVV6NTg1SW1GdmtWMytw?=
 =?utf-8?B?MFpJeGhRYUUvRXBCOEJPOFZtUHJRWVplZnR3ZUExZGx2azMzVDg0eWc2c1BX?=
 =?utf-8?B?TnJaSmgzR0xXS3pFaUlWZmNTa2lWczMrRTJLbXY3ZjVsZmRCa0ZSWjJZdmJv?=
 =?utf-8?B?Uk9GbEZDSlNrVmZzWWJNK3ZkUmdGMDdLZUV1c1o3SEV6aFFOOHR3ajRZSndI?=
 =?utf-8?B?QTIwR0U0Q0VybWRab3k4Z2xJaDJPSzV5eFFGVmRCcTgvRWJoMUJnUkUrQlV3?=
 =?utf-8?B?aHhOU2ZOUStBYVgyTHZ3Wm54blVpMkhCUDRhbjZPNkp3TTdRdEc3N0M0emxz?=
 =?utf-8?B?RzZ3Ris1R3BldUttWEpqQXBiSXhHWmRzY2l0cHhTZXJVdjczajRGdldqVGVY?=
 =?utf-8?B?Mytob0IwSHdhNW9tNjdiL1hzaW93RTdEWkhqQ3cvNTFTa1M5TUU0eisyMmpW?=
 =?utf-8?B?K1A4SDN3NGF6V0xYclUrMnlsT0hrbHIwWE0rSkhYYjdRMXlhQnA1U2NrZkNF?=
 =?utf-8?B?RkpsaHJVMXBleStrUEcxSE8ybENlRHk3Nkw3OEMyb3dUZm9sc0lQRmVobGtL?=
 =?utf-8?B?QlV2RC9TOStyeUU1ZVNZeHNZQm5CRE5iYUlKNmlCdjRYK0VpQ0twZkJaU0h6?=
 =?utf-8?B?WUZKZkk2NmV0MWVrL3pueUJOL1JTNVpuOGxYTFNUSHJHV2dLM3d6bld3akRN?=
 =?utf-8?B?bm5lbm5LTHZUQ3hsK2JHS3NxUHovSWwyZnhubHZ1WFYza29kYTI2SFRSY3pk?=
 =?utf-8?B?dXRtWlcwbzVDOGlrMWlXM3NqWWZ4NzBsdEphejZ5NzlHTm5zVzNIYXpTOXpQ?=
 =?utf-8?B?UlRzRHpXeERuZDJneEllblFTcXlybCt6cGF2TTc5VElTTjNVVGxBS1NZSHNO?=
 =?utf-8?B?MDEzUVIwbnNiQUF6ZkNKNEdEMWxmQWw1Y3d5QWVBRExwZFZWdWdSZDdycWFp?=
 =?utf-8?B?U09yUXNKRHhOUUlBZ0lKeGVoTGs5dVhnMlgvSHpvMEtNUGVaUVZyMXMxa0pq?=
 =?utf-8?B?VEZ5bWFLWVJabDZsNitUUGJibWt0cGp5bjQ2b3V3YjZYOEpKTmI2M2s4eFJW?=
 =?utf-8?B?ZG5uSDRJSmp0WDdNT1dWK2o4ODFNSkhDWnFSbThLS2tmYzVQR0xmamZLbkpM?=
 =?utf-8?B?eVdBS1E2dzhXNGtwSDJqV0R0RG11RW8wRlVCd3FQWTlveHZ6bHVoMUhONGwr?=
 =?utf-8?B?cDlqQVVlRXVsL0puaVMyT2ZQcFBZekZsWTRORVU4Z09DVS9IbUEyZjUycVFo?=
 =?utf-8?B?UTZVN3BwOEY4QmM4VFFzVmJJTG11T0ZLTStGZ09CSnErOTJaK1lab1RNbnRq?=
 =?utf-8?B?TG1hcnZMcUM3Nk5WdmVtbjRLcXVxbU9xb1pVZkhrZ0swcE1uNjZtaWdBTjNW?=
 =?utf-8?B?RnNVU1ExQjAxand0YmNmSzBjZFpEZTJGRUhIVmtzUWJ2TGp3K29TTGpON28y?=
 =?utf-8?B?OGVaODVTQUtkNE1HREd6VWtHM2tHNDJ2R2RQN09OMG9tK2FGV0RYckN1Y2h5?=
 =?utf-8?B?MlF1RTF4QkJxMWl1bk5TUE9DbitYSzBZWnFVeUJ4WXhaTTE0TFFCMTFqdHJu?=
 =?utf-8?B?TDZtTkRhZnZlUHpUZ3JsU3I5L3RxYUxtNko1cFpPblgvVUlwempPYjdHU0ti?=
 =?utf-8?B?QThmT21YVXl2bmhmYXAwWm4vYnlNYkVWYW9SNytISHVDR1hXd2c4M0hwOS9k?=
 =?utf-8?B?YUVrYjJZSkYxdU1WVlFQLzNaRjlDOFFGeUtUR2JubFNJd3Z4Q216MGpPVlJl?=
 =?utf-8?B?c3FsMzA1OTdBakR3c2VOeXAySVI3ZGVYcHE0SXlON0RiMGozTStLY3RHTnA4?=
 =?utf-8?B?V1c0MHRBL3dVMlhTZmJoRk1mWjRMUUZCQmFHSUpuTS85UmdEK2Q5OWh4ajkz?=
 =?utf-8?Q?/fDUDarLDkJxBzEE=3D?=
X-Exchange-RoutingPolicyChecked: 
	t0eOAW6VjTnr8T0SROwM/lW6ALbPY/MIDvz/eN0atqO8vYyc/87G8Gr4evtU4tERLL/TaPI/e/h1FtV9lvvrsI6Bdlgoy0tp1t3YufxeOG05sOXrMxZJYiScobQX27h6dHxjwAhwwb5N52RSOJnp2bDRpS5GopUZcqt01CK7cX51yho21QZu03cN181x3vuNWyRoK4vf7g42d86tTdUu4RgNvzFDsANeLMONdEzGtuMmz05YYWAbHhCqnsof+SEpXnPMEovmbCVMgSz3xTFTMIU825B4Cu2YhslcFVSZZlge/+pHv3kAwi7693yjlNdCLTU8eEETLvyJBwtdL/4uZA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e48cbcb-95d7-4e74-41eb-08df19728db8
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 12:59:50.6771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1qBm3l0NpWAz29yT0XVXgLqXErlrkPOtrD5WDmh/ot5NMMj0BdH8wH6nIghEJuPLP+591/6/5OMyE/mj97tQVefIVIdWRrW5FyE1iLhRSZg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8474
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1MSBTYWx0ZWRfX2BHtjGdOqqXh
 UA4BcDM7wud+O0wBDcYX1tWGB5yemtmTeYpL1CaSx9SKP5R9NmZmIfOtYexVfc7ylWiEOzAUfZd
 6fsfijT9/uRToMF6f6y6JXQfoyAou5wizLrM+TBiO9zzZRhJCEawAyhAwa0JuGGRLpu2oFRIuQg
 cC96BCVLjMhtbkSm4r9FywwwZhhYVGpIIMVQHhHpS1sCjKkay+60DbXNcC5lwuOSBqpfwpZtlEc
 NdCFC5FSt+hl7TnGltPa67fEgQ2RhBZYfM+tUOki1fo9uX0wcFRSjfX/gIsO9k0c0VYl7p9Wnnv
 dLE6jXSVpwpHLZNKwGZ8xQQUB+6ONcRxYFcmgzpNVmqvs+3G0GaxJDZlsMDhyXM33CylSYMTd82
 XU+n0nokaQzKsvXDLIoKXt2BTzTgKOS2U0e48CXoRgT7QK721Cq0B+KAebbmLiKwgTusHSqIbIj
 yj+kQkbI9sAapAQI9uw==
X-Proofpoint-GUID: -zleKN40j55BT8FP7F8HH452AoRXxMw0
X-Authority-Analysis: v=2.4 cv=V4foQuni c=1 sm=1 tr=0 ts=6ab3cd4a cx=c_pps
 a=NPiivNiK8hhPJgysqx5tlQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=Q4-j1AaZAAAA:8
 a=VJYubktbAAAA:8 a=e1GkridNAAAA:8 a=t7CeM3EgAAAA:8 a=2jTi7P-k0BhgT-8jWWYA:9
 a=QEXdDO2ut3YA:10 a=uSz_AfzkImT7HWIo5TwA:9 a=rf2Vw8NIgaC6Iyh3:21
 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=OqWDEjY5HwswFcA5adJo:22 a=6ft9yNkZjdd813gQxDxM:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: -zleKN40j55BT8FP7F8HH452AoRXxMw0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1MSBTYWx0ZWRfX2jtwoOH7nFtE
 NiD7UIeXP3pJ8TnWeReJOlGZAWgmhtCEs1iiGKvVW8d3MlSm9NH8Wgj73FoqQAZbxj1X+TG2zTY
 PbzaX3eFqln0CDMY9/Oxae79A9k1UXWjJLtkMsrGGZ5PsP0Y13KO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230051
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 12:59:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130234

--------------p0QIfynRHJpNlSQYTln5ezNS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-09-23 02:57, Himani Ramesh Barde wrote:
> makedefs only recognizes kernel majors 3-6. Hosts running a 7.x
> kernel get "Unknown system type: Linux 7.0.0-..." and the native
> build fails. Add 7 to the version match in makedefs and sys_defs.h.
>
> Already fixed in postfix 3.11.
What about wrynose which has postfix 3.10.x?
https://layers.openembedded.org/layerindex/branch/wrynose/recipes/?q=postfix

../Randy
>
> Upstream-Status: Backport [postfix 3.11]
> Signed-off-by: Himani Ramesh Barde<HimaniRamesh.Barde@windriver.com>
> ---
>   ...kedefs-Account-for-linux-7.x-version.patch | 47 +++++++++++++++++++
>   .../recipes-daemons/postfix/postfix_3.8.19.bb |  1 +
>   2 files changed, 48 insertions(+)
>   create mode 100644 meta-networking/recipes-daemons/postfix/files/0001-makedefs-Account-for-linux-7.x-version.patch
>
> diff --git a/meta-networking/recipes-daemons/postfix/files/0001-makedefs-Account-for-linux-7.x-version.patch b/meta-networking/recipes-daemons/postfix/files/0001-makedefs-Account-for-linux-7.x-version.patch
> new file mode 100644
> index 0000000000..4bc59ace7d
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/postfix/files/0001-makedefs-Account-for-linux-7.x-version.patch
> @@ -0,0 +1,47 @@
> +From 5466d510dfbc2b7a81dcf766f83d2c89066c0446 Mon Sep 17 00:00:00 2001
> +From: Changqing Li<changqing.li@windriver.com>
> +Date: Mon, 11 May 2026 18:16:07 +0000
> +Subject: [PATCH] makedefs: Account for linux 7.x version
> +
> +Major version has bumped to 7, update the scripts
> +
> +Upstream-Status: Backport [The latest stable version 3.11 already fixed]
> +
> +Refer:
> +https://www.ftp.saix.net/MTA/postfix/index.html
> +
> +Signed-off-by: Changqing Li<changqing.li@windriver.com>
> +---
> + makedefs            | 2 +-
> + src/util/sys_defs.h | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/makedefs b/makedefs
> +index 74b103d..fe8c618 100644
> +--- a/makedefs
> ++++ b/makedefs
> +@@ -625,7 +625,7 @@ EOF
> + 		: ${SHLIB_ENV="LD_LIBRARY_PATH=`pwd`/lib"}
> + 		: ${PLUGIN_LD="${CC-gcc} -shared"}
> + 		;;
> +-    Linux.[3456].*)
> ++    Linux.[34567].*)
> + 		SYSTYPE=LINUX$RELEASE_MAJOR
> + 		case "$CCARGS" in
> + 		 *-DNO_DB*) ;;
> +diff --git a/src/util/sys_defs.h b/src/util/sys_defs.h
> +index 70aab23..c5472eb 100644
> +--- a/src/util/sys_defs.h
> ++++ b/src/util/sys_defs.h
> +@@ -763,7 +763,7 @@ extern int initgroups(const char *, int);
> +   * LINUX.
> +   */
> + #if defined(LINUX2) || defined(LINUX3) || defined(LINUX4) || defined(LINUX5) \
> +-	|| defined(LINUX6)
> ++	|| defined(LINUX6) || defined(LINUX7)
> + #define SUPPORTED
> + #define UINT32_TYPE	unsigned int
> + #define UINT16_TYPE	unsigned short
> +--
> +2.53.0
> +
> diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.8.19.bb b/meta-networking/recipes-daemons/postfix/postfix_3.8.19.bb
> index 018e8d89bb..ad770651d8 100644
> --- a/meta-networking/recipes-daemons/postfix/postfix_3.8.19.bb
> +++ b/meta-networking/recipes-daemons/postfix/postfix_3.8.19.bb
> @@ -26,6 +26,7 @@ SRC_URI ="http://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${P 
> file://0003-makedefs-Use-native-compiler-to-build-makedefs.test.patch 
> \ file://0004-Fix-icu-config.patch \ 
> file://0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch 
> \ + file://0001-makedefs-Account-for-linux-7.x-version.patch \ "
>   
>   SRC_URI[sha256sum] = "1ebaec340fea1b80a9c88d276f07bed0886cc4f000753cf310223affb427754b"


-- 
# Randy MacLeod
# Wind River Linux

--------------p0QIfynRHJpNlSQYTln5ezNS
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <head>

    
  </head>
  <body>
    <div class="moz-cite-prefix">On 2026-09-23 02:57, Himani Ramesh
      Barde wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260923065746.2542154-1-HimaniRamesh.Barde@windriver.com">
      <pre wrap="" class="moz-quote-pre">makedefs only recognizes kernel majors 3-6. Hosts running a 7.x
kernel get &quot;Unknown system type: Linux 7.0.0-...&quot; and the native
build fails. Add 7 to the version match in makedefs and sys_defs.h.

Already fixed in postfix 3.11.</pre>
    </blockquote>
    What about wrynose which has postfix 3.10.x?<br>
    &nbsp;
<a class="moz-txt-link-freetext" href="https://layers.openembedded.org/layerindex/branch/wrynose/recipes/?q=postfix">https://layers.openembedded.org/layerindex/branch/wrynose/recipes/?q=postfix</a><br>
    <br>
    ../Randy
    <blockquote type="cite" cite="mid:20260923065746.2542154-1-HimaniRamesh.Barde@windriver.com">
      <pre wrap="" class="moz-quote-pre">

Upstream-Status: Backport [postfix 3.11]
Signed-off-by: Himani Ramesh Barde <a class="moz-txt-link-rfc2396E" href="mailto:HimaniRamesh.Barde@windriver.com">&lt;HimaniRamesh.Barde@windriver.com&gt;</a>
---
 ...kedefs-Account-for-linux-7.x-version.patch | 47 +++++++++++++++++++
 .../recipes-daemons/postfix/postfix_3.8.19.bb |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/postfix/files/0001-makedefs-Account-for-linux-7.x-version.patch

diff --git a/meta-networking/recipes-daemons/postfix/files/0001-makedefs-Account-for-linux-7.x-version.patch b/meta-networking/recipes-daemons/postfix/files/0001-makedefs-Account-for-linux-7.x-version.patch
new file mode 100644
index 0000000000..4bc59ace7d
--- /dev/null
+++ b/meta-networking/recipes-daemons/postfix/files/0001-makedefs-Account-for-linux-7.x-version.patch
@@ -0,0 +1,47 @@
+From 5466d510dfbc2b7a81dcf766f83d2c89066c0446 Mon Sep 17 00:00:00 2001
+From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
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
+Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
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
+ 		: ${SHLIB_ENV=&quot;LD_LIBRARY_PATH=`pwd`/lib&quot;}
+ 		: ${PLUGIN_LD=&quot;${CC-gcc} -shared&quot;}
+ 		;;
+-    Linux.[3456].*)
++    Linux.[34567].*)
+ 		SYSTYPE=LINUX$RELEASE_MAJOR
+ 		case &quot;$CCARGS&quot; in
+ 		 *-DNO_DB*) ;;
+diff --git a/src/util/sys_defs.h b/src/util/sys_defs.h
+index 70aab23..c5472eb 100644
+--- a/src/util/sys_defs.h
++++ b/src/util/sys_defs.h
+@@ -763,7 +763,7 @@ extern int initgroups(const char *, int);
+   * LINUX.
+   */
+ #if defined(LINUX2) || defined(LINUX3) || defined(LINUX4) || defined(LINUX5) \
+-	|| defined(LINUX6)
++	|| defined(LINUX6) || defined(LINUX7)
+ #define SUPPORTED
+ #define UINT32_TYPE	unsigned int
+ #define UINT16_TYPE	unsigned short
+-- 
+2.53.0
+
diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.8.19.bb b/meta-networking/recipes-daemons/postfix/postfix_3.8.19.bb
index 018e8d89bb..ad770651d8 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.8.19.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.8.19.bb
@@ -26,6 +26,7 @@ SRC_URI = <a class="moz-txt-link-rfc2396E" href="http://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${Pfile://0003-makedefs-Use-native-compiler-to-build-makedefs.test.patch\file://0004-Fix-icu-config.patch\file://0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch\+file://0001-makedefs-Account-for-linux-7.x-version.patch\">&quot;http://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${P
            file://0003-makedefs-Use-native-compiler-to-build-makedefs.test.patch \
            file://0004-Fix-icu-config.patch \
            file://0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch \
+           file://0001-makedefs-Account-for-linux-7.x-version.patch \
            &quot;</a>
 
 SRC_URI[sha256sum] = &quot;1ebaec340fea1b80a9c88d276f07bed0886cc4f000753cf310223affb427754b&quot;
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------p0QIfynRHJpNlSQYTln5ezNS--

