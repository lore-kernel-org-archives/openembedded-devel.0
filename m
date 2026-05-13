Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5F30CD37AC
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 03:25:49 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3971.1778642743181457513
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 20:25:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=GEfbtSTO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=95933ffc80=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D1dPFe012295
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 20:25:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=/faQkdh6zEcXfr2/Hj/sHE
	xj9T94nz/FLIcf7puhgBY=; b=GEfbtSTOW7+T6zMuhI1FCsfSUl4PqJ6NJdRJZE
	jm8dnGOvsyTFwdMDOat0aIKkvD7tpSimwU+Jj6Wkw7DTnrbr+J5Gv0LSlF3Uzjaj
	zDBtP2m1wehKgbNUUbrIqtdKtSrVQ1cfgAIKXziXNTHFfbqmu+ytdkcAbfkXeRhG
	adeaKAkQVnMeNPUTcB2OUVx3atWL4/Pkf6W7UDx7rfcNyEq1Ho0BbA8rp5jhOb0L
	JlAns3toNEgXca9j58c4Bl4eEbXf0WUG1UeUlDpdk/lTsl9LI8jxKhuHd6Ak2uNQ
	RYwnqn7QTvefZBTAuBKathZPLxostL8c7i38CrJr7vU+BZbg==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012063.outbound.protection.outlook.com [40.93.195.63])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e4ftb83bt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 12 May 2026 20:25:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a/se08n5FGfxEgsRRuDtIdUOJEimGlzteOo731EQ2hrATfjiah/BIjo36jnwSpaCtNXeaFyEPHkMvrL9Mgi50bjUhPDyGaHeVA7cGifXvRAbp6uSglHCQRJApIIbxDgTcr5NQ0pAYnGiNNnnJBvoJ4LaKJRnQkgksOwtGcth7fYcVP9rLTFTWh68FskRe80486WY+aaAU72dzt5FTmly5sZHlosyZQmX80xRtRhybKL6SmiFahkp/KL6hj06SrLGht3/jklfIh7dsYFot00hg3nNhALsZloznbL4AVUSZi/Uj3EcUK+tjiLVVzvfPXk/pASskJ5SnHqHAANr1uyWOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/faQkdh6zEcXfr2/Hj/sHExj9T94nz/FLIcf7puhgBY=;
 b=eatgqgcFPZZDm7JSl/pN6nrOZ6mTfpYnhZ4UMv+yKhpK+TJE+53yCpu7XFmVvHSC5v/YGdp0jqhgum96AtfcljWWsiM0d9Q4xvQnK4FN3jZzoGj784yAaeFf/FYEp5XxC0iz4uv1E/vy3Ze62W1h8R1QjQ4x6J6T9k55uDZpmNrtukkGtQxlCTZKhmfrhFj4soMSCNX645H+xhKiMg3DOopL0p2dNTKev6Mh37UFR2R3L57VadckijNCEQXsE3L7+nhj4eaUbrXdKVDUTyHa9l5idQa1rx1+zcwR2Wtap07WPBT8GSTww6+/JEEvETKnvprDPJVzGw5ojobCNK/Smg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by DM3PPF49E43CAC1.namprd11.prod.outlook.com (2603:10b6:f:fc00::f1c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 03:25:38 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 03:25:37 +0000
Content-Type: multipart/alternative;
 boundary="------------zx1y35t6yTh5B85MSI07lwq7"
Message-ID: <dc0b8b7c-52af-461d-aa69-685c0dbed320@windriver.com>
Date: Wed, 13 May 2026 11:25:31 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [wrynose][master][PATCH V2] postfix: upgrade 3.10.8 ->
 3.11.2
To: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
References: <18AF0166CB71E13F.3218295@lists.openembedded.org>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <18AF0166CB71E13F.3218295@lists.openembedded.org>
X-ClientProxiedBy: SGBP274CA0022.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::34)
 To DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|DM3PPF49E43CAC1:EE_
X-MS-Office365-Filtering-Correlation-Id: 1864690a-8605-4391-dcb7-08deb09f4d49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|4022899009|366016|11063799003|3023799003|56012099003|22082099003|18002099003|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	8VirW4Cfsf4gkPZac1Q3KKwGOD9ERIvikR/41dNw2jfdJD7tKocYRk6fmm4avWkwfEF2PjCvKiAMBnST8QGH5e1L1TjDeJmUiFmY/6cxabYcVdWAaX8pUAOpSFV8ACdRuK8stUk+XyA67I14go5YRb/BW5GEINXGldLhNgW13wfgulDQEBhoNh5kI1udaErqMVwcVdlSbmNdO9iWlQPmAHB9A0qNa7rr8jK6TMo+HOzJaheL7RmTqMpaw3GooEx67J3+osbA6ipO3CzjdMLPlYDa91jAfsQkVt/84k/HDYTZSg1RburjMO63luWfm1F7wwcL9vRN90InBuYLNLlLYEH5+ai629bDekHc3VIJjtwbq1MRTZCPjyESsjcAijdiXV+8llb59N9fvG5HJAPXLEeTXPHGXUud1BbxvNa0XBwxKDN7xwbBuoJW5TUemOLzVV72+isiIzJmtRIKfmaEnYU+iky4PSXZS126Syp1sdkIGYe7inBJHYh3X8wBQ4GvaSLIKBf8hwb6rRPYSCj85kDA+OkCf96mfgbHRUskch6Nfi2KKDXz6pS6KgIP5fQR+6FESPF0/7LP16DO5m+buV978BI92gxpEfLdfu4uRJmcqcLpnRPK3wx9GXa6lPlDHaxr3tbjah8yRgtYdqGqSQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(4022899009)(366016)(11063799003)(3023799003)(56012099003)(22082099003)(18002099003)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WXVEZkJDRWZOS040Tm9SWjk2d0hjK3hVMnA5ejNZV2pZcXpvN1QxSTVmVjdO?=
 =?utf-8?B?OUZLS1BCQXk1YTduMmxvMnNoZWNRVVJybE5NVEJMZWg2bDh0TTdqNkVTMWlz?=
 =?utf-8?B?eDE0WlY1RFdwcjg0dnFCclN3bm0wT0N1dUpkY3g3c1BvTExQOE9vcUxUY1BY?=
 =?utf-8?B?WVk2WmRXL01wVXdaTTRESkdtTWs2TFdHWGkvWEg2MjROa0xXN2xjaFlOMk4w?=
 =?utf-8?B?RDh5NTlNNzJWQTNUTVZTcXFiRUtySHQ1bHpNdzRIWXdKUm00anZwVjRWbWla?=
 =?utf-8?B?U0d0WHJTR2xnMys1aml0VFlDbEZLM0VsT1htczQxazZSRCthMjg3aHdwYjQ1?=
 =?utf-8?B?TTE2QVhsRzY1Tk1KZVFLREZSckh0Q0VuVDFQTDNMNC91TXZFYi8vK1NWNjVM?=
 =?utf-8?B?YWVvSnk3VHdFYVgxU25iLzFPblo0Y211QitLYXd0b2tyU25vbzl1MjVYVk5V?=
 =?utf-8?B?UllNTXQxeUhMV3hEV1BEMmVxdnhJUGxUemVzWjZWVS85OVBVbE1oZkt5eGpn?=
 =?utf-8?B?UW5EZkZTRElmL1JldHBwVU54SjFDMEZTS0xLdm42bE4yTHFtWTMwSmJobWQz?=
 =?utf-8?B?d3ZGWjRnNmxaeVdpcGxNVWpVamJiZUxyUEx2UDlHRERrV3JXODNNUDZIeVc1?=
 =?utf-8?B?SHA2dXlmeHFZYzN4MEZvL2tuZlZGcU1oVGd0R0hYb2QxNkpLWTAwZitjY3Ns?=
 =?utf-8?B?UWE5MGlDeVJLcFhIWFptemRtbktXZ3dkdWFYb2cwYncwSUNvY2FFaUF0TEM5?=
 =?utf-8?B?UHVGMVp5OUR5eGdHejhHcENIWFZ4LzdNaWkvcUdtY1BuSXBGL0QzSTRpMXlz?=
 =?utf-8?B?aWRTdVNBMnM2OVp6MEJld2tYanY1OWF5aEcyVFBRdmJEVFc5MEQ5Qml2MC9u?=
 =?utf-8?B?SVMvTFB0R0ZmMmVMUlM2YkZLMEVRdXZQeE5PK3YrWmNkZmNiaHRjTVNPRzB4?=
 =?utf-8?B?RUZZNFV1cUgwS0YwVUgvWjIzNElRMW5zdlRRZDNXYnpERUFTaDhNMU9YNnIx?=
 =?utf-8?B?WXZCTFk3V2JWeUlDamFnSXFZY01KQUdLNW9kVDR4QUZQeEhhS1JXUklUeW9t?=
 =?utf-8?B?WUxkM3JwaGYyTnlJMmk2c2hQY1VnNnBHeC9WRDF0OUtXVysyOURMMDAyeGZP?=
 =?utf-8?B?YXVVc1p5eTJ1NDVuZ0hZTU5YY1h3U2RENHQwbjNSNG1EN1llQm5zSjZkWWdZ?=
 =?utf-8?B?Z0V3NlhNZi9SQnl4Skp4ZGh1ZjBnOU90RFFSUXI3NitQV0Y0NmFNMUdiKzNk?=
 =?utf-8?B?VkVmSWd3ckk0di9CV0hvek5NQ2hSV21kV2FOdzVZMGNyZWRMNnZqdjN5bTIv?=
 =?utf-8?B?OEtreTVNSkdsZ0ZxQzFLR3I1NWZiZEtBNUJWTlhHcElrOWhpdlVyTmNhSzl2?=
 =?utf-8?B?dkdOR2ZZMGMxeWZ0UDF1bmJmbWNmZHBwM3dIeFVNMXA1NXB6ejU1T3d2ZHlp?=
 =?utf-8?B?M082MzhUMENobzViKzZiL3dFVDVjYjdDZmpPUmlFZWVpbnpkTjdtVlJiWiti?=
 =?utf-8?B?U2U5QUkybnpkcWNNbXNMR2hXU1BaUi84UmdLUmFSVi9ielowWnpjVzN3VTd1?=
 =?utf-8?B?WVVXdTQ3dUVMa1IyQ2V4S1JYZ1g4WGtPQTdoVS9LUFZwS3dYSFZ2MmkyTWk3?=
 =?utf-8?B?S3VEWFhTQVNqVm5xZlJMVDVFN2p4SEY3UlYrdHp6NEZ4M2ZRNkI0MVhUV0Zv?=
 =?utf-8?B?elFQYkNqRTB1OVFRM0pFa3prcmRpaEdFTmJSMENKNG5rbEt6TmlWZ2xsbXVZ?=
 =?utf-8?B?VEJMQW1LTWRNOFVRcTE1K3lhYVg2aDMyOTk4ZFp1NmZQZjdiSkkwL203RURW?=
 =?utf-8?B?cFpzaVhSQ3F0VitFSGhKc3NxUHVoT1U3Lyszay9CWlhBaTY3MXBhNlkwYWdt?=
 =?utf-8?B?bDJQOGF3TTZ5WWM3OWJCOFlQTjBNQno3dlA3TGVuNFl6ZUNjOXBGM3laT1RZ?=
 =?utf-8?B?a1pLZjBML3FKUGV0UzRyZ0hDblJGOWtlRjNpRFlPV2ZibGZmMXRpQVdCZEts?=
 =?utf-8?B?d3NNZytiZ3RRbjY3TkxpY2tOOFpqY1p2anZCUVFobHl3KzBMWHM5SGJtWjRT?=
 =?utf-8?B?V3UrS1JzbTRyUkF2M2tVOVRHenJrQ2YwZkhJUFdrcFJpVFNPV3JVVlBtSWh6?=
 =?utf-8?B?aUp6NnF2TGVoZTcwSnYxZzFheWYyZzR2eWRLS2NLSnltZzRMbWVNV21ZTWVr?=
 =?utf-8?B?VndHUTNNS2MvWXBGVWQvZ2k4RFRTS3ZHTWg0NjlKbEFaUzRaOVBHemlaRnc4?=
 =?utf-8?B?ZWcvYlEzT0IwVmMzSi9heE9OMXNoakgvMHMrWHNKZUtHRzJtVmZHM01QSXlI?=
 =?utf-8?B?TFhudUp1YWUwY0FKSmduTS9SNXlzbmFGbWp2THpQRStGSkswdVhZMElBNTNC?=
 =?utf-8?Q?iXAngLAvwr6S4Yvk=3D?=
X-Exchange-RoutingPolicyChecked: 
	v77QeOXnkr7wqPJvzqLutTqrdlgvtDEk6uRirQayFWdIuXSAsYZ2tWfSqomkxIVepYb1yC1OdboR3vlAk2hpcveDPpvOj9btzPzsibdNrStzBDa92QojsNdEmQ8R7zc1fm9XvQox9b+EmFTHjrrCwq98aFAPRNeKgn6vy+H0IdywbiytRoESPG5wHxjnPjJK3j1VZpOpaV0OkJzVxuI9XCSIzum0ZAuKTPrkqLnihumP7urCpqI6j5chHWi7pYtd7sTy2VG8ixFXvQlHOEqrKe6Ak++bO89C7wUbAErbDaE7i6PeMsIStIaR6tFMYZIeR+TKU3Zo4ukOSrft/1jMiw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1864690a-8605-4391-dcb7-08deb09f4d49
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 03:25:37.8822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ftw4RE5v7g+LVgoPgeG14Q5gEpXW1dG3q7W3u3o1JLESds7vovGBe5FmSuO0VV/B3pcNPFlSMwyNyvLHKbG12APB8+nBcD0A7CM6/2nL3DQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF49E43CAC1
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDAzMSBTYWx0ZWRfXwPaA4OCnld9G
 k5AH/uKoxzDtXrAo9SMh19WE80eeL3w+gp+TbnkAL4CXntV35dc+xcuRaXWsKuvdyNBbfHWZmQA
 qKMAIpKEsKigQ2v3seYOpOcCnXv8M0p+hjFhEZNMXANtXVLWqNW07Dn1Jr/fT4+rFrBGb4dwp0t
 uS/njpHIxliwO9lJF3BSZXlIXL8wLCk3sAKkA7aGA8Bn90WqaKrpieb4c+5p0RDxWJW6fU/fZoi
 baZzVUnCHqkkgD52Ujm1FDRCTFrZc7z9ylLI64sXqLNs5+d2gSvLFNLJatzr66tQSxldDrScAIr
 DdeGnxRXqHNdrwNW4XhxER8x5GN84ngpXmWjn87TMOHY16vlyzinr8n8SPcQ0wX4VmcA7wwj+B2
 5do24dBJSoYdmUZMJIKNyRYDbHrdgiTnYSMarDf8BPb3ztcGWh1ylgE2MQm/BOkH4vNphzdWtXW
 VbJ2/PaWJQkjqzzhRtw==
X-Proofpoint-GUID: 2k198iFiyymvcThkDTwofHG9VBrx3kKE
X-Authority-Analysis: v=2.4 cv=du/rzVg4 c=1 sm=1 tr=0 ts=6a03ef36 cx=c_pps
 a=LrO9QPEl2oM1zDNvT4V0vg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=Q4-j1AaZAAAA:8
 a=VJYubktbAAAA:8 a=gmDo1nssAAAA:8 a=Vt2AcnKqAAAA:8 a=e1GkridNAAAA:8
 a=t7CeM3EgAAAA:8 a=omOdbC7AAAAA:8 a=pGLkceISAAAA:8 a=Og4MLQNxjSFhrD55geUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=3t1cjJATwRc7fM8vnD0A:9
 a=KlXo9_8hfPIFzdWS:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=OqWDEjY5HwswFcA5adJo:22 a=DmCNEmdWNTAeIjfGWauO:22
 a=v10HlyRyNeVhbzM4Lqgd:22 a=6ft9yNkZjdd813gQxDxM:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: Ea-7Ryc-cQwh4jaiwKHZkETJJBWUlGFR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130031
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 03:25:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126884

--------------zx1y35t6yTh5B85MSI07lwq7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 64D1dPFe012295

Hi,

Current=C2=A0 postfix 3.10.8 not support build on Linux 7.x,=C2=A0 and it=
 is=20
supported from 3.11.0.

But distro like ubuntu26.04 has=C2=A0Linux 7.x.=C2=A0 Maybe it is better =
that we=20
also upgrade postfix to 3.11.2

for wrynose.=C2=A0 if upgrade for=C2=A0wrynose=C2=A0is not accept, then w=
e maybe need=20
to patch postfix with the following patch:


        [meta-networking][PATCH] postfix: make it can compile with linux =
7.x

https://lists.openembedded.org/g/openembedded-devel/message/126826

Regards

Changqing

On 5/13/26 11:09, Changqing Li via lists.openembedded.org wrote:
> * Refresh patch to mute patch-fuzz
> * Add patch 0001-sys_defs.h-workaround-for-musl-lib.patch to workaround
>    for musl lib
> * This upgrade include the following commit, which make postfix can
>    compile on latest stable ubuntu 26.04, which have Linux 7.x kernel
>
>    Postfix works on Linux 7.x kernels. Frank Scheiner. Files:
>          makedefs, util/sys_defs.h.
>
> Changes:
> https://www.ftp.saix.net/MTA/postfix/official/postfix-3.11.2.HISTORY
>
> Signed-off-by: Changqing Li<changqing.li@windriver.com>
> ---
>   .../postfix/files/0001-Fix-makedefs.patch     | 25 +++++------
>   ...1-sys_defs.h-workaround-for-musl-lib.patch | 43 ++++++++++++++++++=
+
>   ...tconf-to-a-variable-for-cross-compil.patch |  9 ++--
>   ...tive-compiler-to-build-makedefs.test.patch | 17 +++-----
>   .../postfix/files/0004-Fix-icu-config.patch   |  9 ++--
>   ...sl-and-lresolv-to-SYSLIBS-by-default.patch | 11 ++---
>   .../{postfix_3.10.8.bb =3D> postfix_3.11.2.bb}  |  3 +-
>   7 files changed, 73 insertions(+), 44 deletions(-)
>   create mode 100644 meta-networking/recipes-daemons/postfix/files/0001=
-sys_defs.h-workaround-for-musl-lib.patch
>   rename meta-networking/recipes-daemons/postfix/{postfix_3.10.8.bb =3D=
> postfix_3.11.2.bb} (98%)
>
> diff --git a/meta-networking/recipes-daemons/postfix/files/0001-Fix-mak=
edefs.patch b/meta-networking/recipes-daemons/postfix/files/0001-Fix-make=
defs.patch
> index 785fe87452..4e187849dc 100644
> --- a/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.p=
atch
> +++ b/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.p=
atch
> @@ -1,4 +1,4 @@
> -From e4197bc1f431fd7e555a31e6f7f1e020b4ec8f4c Mon Sep 17 00:00:00 2001
> +From 51e29c0a1d98948118e5135bb817a96811105d39 Mon Sep 17 00:00:00 2001
>   From: Li xin<lixin.fnst@cn.fujitsu.com>
>   Date: Fri, 19 Jun 2015 16:45:54 +0900
>   Subject: [PATCH] Fix makedefs
> @@ -19,10 +19,10 @@ Signed-off-by: Yao Zhao<yao.zhao@windriver.com>
>    1 file changed, 11 insertions(+), 16 deletions(-)
>  =20
>   diff --git a/makedefs b/makedefs
> -index a740e41..28fb128 100644
> +index d5103ce..9713327 100644
>   --- a/makedefs
>   +++ b/makedefs
> -@@ -230,9 +230,6 @@ echo "# pie=3D$pie"
> +@@ -232,9 +232,6 @@ echo "# pie=3D$pie"
>   =20
>    # Defaults for most sane systems
>   =20
> @@ -32,7 +32,7 @@ index a740e41..28fb128 100644
>    ARFL=3Drv
>   =20
>    # Ugly function to make our error message more visible among the
> -@@ -563,12 +560,12 @@ case "$SYSTEM.$RELEASE" in
> +@@ -608,12 +605,12 @@ case "$SYSTEM.$RELEASE" in
>    		case "$CCARGS" in
>    		 *-DNO_DB*) ;;
>    		 *-DHAS_DB*) ;;
> @@ -48,8 +48,8 @@ index a740e41..28fb128 100644
>    		    else
>    			# No, we're not going to try db1 db2 db3 etc.
>    			# On a properly installed system, Postfix builds
> -@@ -577,12 +574,12 @@ case "$SYSTEM.$RELEASE" in
> - 			echo "Install the appropriate db*-devel package first." 1>&2
> +@@ -623,12 +620,12 @@ case "$SYSTEM.$RELEASE" in
> + 			echo "Alternatively, build with CCARGS=3D\"-NO_DB ...\"" 1>&2
>    			exit 1
>    		    fi
>   -		    SYSLIBS=3D"-ldb" @@ -63,7 +63,7 @@ index a740e41..28fb128 1006=
44 do test -e=20
> $lib/lib$name.a -o -e $lib/lib$name.so && { SYSLIBS=3D"$SYSLIBS -l$name=
"
> -@@ -602,7 +599,7 @@ case "$SYSTEM.$RELEASE" in
> +@@ -648,7 +645,7 @@ case "$SYSTEM.$RELEASE" in
>    		       if [ `expr "X$CCARGS" : "X.*-DNO_EPOLL"` -gt 0 ]
>    		       then
>    			   :
> @@ -72,7 +72,7 @@ index a740e41..28fb128 100644
>    		       then
>    			   echo CCARGS=3D"$CCARGS -DNO_EPOLL"
>    		       else
> -@@ -626,8 +623,6 @@ int     main(int argc, char **argv)
> +@@ -672,8 +669,6 @@ int     main(int argc, char **argv)
>    }
>    EOF
>    			   ${CC-gcc} -o makedefs.test makedefs.test.c || exit 1
> @@ -81,7 +81,7 @@ index a740e41..28fb128 100644
>    			   rm -f makedefs.test makedefs.test.[co]
>    		       fi;;
>    		esac
> -@@ -644,12 +639,12 @@ EOF
> +@@ -690,12 +685,12 @@ EOF
>    		case "$CCARGS" in
>    		 *-DNO_DB*) ;;
>    		 *-DHAS_DB*) ;;
> @@ -97,8 +97,8 @@ index a740e41..28fb128 100644
>    		    else
>    			# On a properly installed system, Postfix builds
>    			# by including <db.h> and by linking with -ldb
> -@@ -657,12 +652,12 @@ EOF
> - 			echo "Install the appropriate db*-devel package first." 1>&2
> +@@ -705,12 +700,12 @@ EOF
> + 			echo "See:https://www.postfix.org/NON_BERKELEYDB_README.html#build=
-conf" 1>&2
>    			exit 1
>    		    fi
>   -		    SYSLIBS=3D"-ldb" @@ -112,6 +112,3 @@ index a740e41..28fb128 10=
0644 do test -e=20
> $lib/lib$name.a -o -e $lib/lib$name.so && { SYSLIBS=3D"$SYSLIBS -l$name=
"
> ---
> -2.25.1
> -
> diff --git a/meta-networking/recipes-daemons/postfix/files/0001-sys_def=
s.h-workaround-for-musl-lib.patch b/meta-networking/recipes-daemons/postf=
ix/files/0001-sys_defs.h-workaround-for-musl-lib.patch
> new file mode 100644
> index 0000000000..b7a8e05165
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/postfix/files/0001-sys_defs.h-wor=
karound-for-musl-lib.patch
> @@ -0,0 +1,43 @@
> +From ce15792203ae0c787e3602d6d38a892ea1ce31ce Mon Sep 17 00:00:00 2001
> +From: Changqing Li<changqing.li@windriver.com>
> +Date: Tue, 12 May 2026 15:04:55 +0800
> +Subject: [PATCH] sys_defs.h: workaround for musl lib
> +
> +Fix musl lib compile failure:
> +vbuf_print.c:215:46: error: macro 'VBUF_SNPRINTF' passed 5 arguments, =
but takes just 4
> +  215 |                     VSTRING_ADDNUM(fmt, width);
> +      |                                              ^
> +vbuf_print.c:132:9: note: macro 'VBUF_SNPRINTF' defined here
> +  132 | #define VBUF_SNPRINTF(bp, sz, fmt, arg) do { \
> +
> +Previously checking condition will make #else branch is selected, and
> +NO_SNPRINTF is defined, and when NO_SNPRINTF is defined, VBUF_SNPRINTF
> +only take 4 arguments, and cause above failure. musl lib support
> +snprintf and we only have glibc and musl libc, so workaround by when
> +glibc is not defected, take it as musl lib, and select the #if branch.
> +
> +Upstream-Status: Pending [Reported topostfix-users@postfix.org]
> +
> +https://www.mail-archive.com/postfix-users@postfix.org/msg107898.html
> +
> +Signed-off-by: Changqing Li<changqing.li@windriver.com>
> +---
> + src/util/sys_defs.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/util/sys_defs.h b/src/util/sys_defs.h
> +index 1890577..c3527c9 100644
> +--- a/src/util/sys_defs.h
> ++++ b/src/util/sys_defs.h
> +@@ -794,7 +794,7 @@ extern int initgroups(const char *, int);
> + #define NATIVE_NEWALIAS_PATH "/usr/bin/newaliases"
> + #define NATIVE_COMMAND_DIR "/usr/sbin"
> + #define NATIVE_DAEMON_DIR "/usr/libexec/postfix"
> +-#if HAVE_GLIBC_API_VERSION_SUPPORT(2, 1)
> ++#if HAVE_GLIBC_API_VERSION_SUPPORT(2, 1) || !defined(__GLIBC__)
> + #define SOCKADDR_SIZE	socklen_t
> + #define SOCKOPT_SIZE	socklen_t
> + #else
> +--
> +2.34.1
> +
> diff --git a/meta-networking/recipes-daemons/postfix/files/0002-Change-=
fixed-postconf-to-a-variable-for-cross-compil.patch b/meta-networking/rec=
ipes-daemons/postfix/files/0002-Change-fixed-postconf-to-a-variable-for-c=
ross-compil.patch
> index d46efb95cb..a74c46fa92 100644
> --- a/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-p=
ostconf-to-a-variable-for-cross-compil.patch
> +++ b/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-p=
ostconf-to-a-variable-for-cross-compil.patch
> @@ -1,4 +1,4 @@
> -From 953719878466c55572294f42e85127bda5d34999 Mon Sep 17 00:00:00 2001
> +From ce8deeaac8ca5d7329e1923790a1f35798953799 Mon Sep 17 00:00:00 2001
>   From: Li xin<lixin.fnst@cn.fujitsu.com>
>   Date: Fri, 19 Jun 2015 17:14:58 +0900
>   Subject: [PATCH] Change fixed postconf to a variable for cross-compil=
ing
> @@ -12,10 +12,10 @@ Signed-off-by: Yao Zhao<yao.zhao@windriver.com>
>    2 files changed, 11 insertions(+), 9 deletions(-)
>  =20
>   diff --git a/Makefile.in b/Makefile.in
> -index a37f89f..17cb64b 100644
> +index 8d7501a..d2a85e8 100644
>   --- a/Makefile.in
>   +++ b/Makefile.in
> -@@ -22,7 +22,7 @@ META	=3D meta/main.cf.proto meta/master.cf.proto met=
a/postfix-files \
> +@@ -23,7 +23,7 @@ META	=3D meta/main.cf.proto meta/master.cf.proto met=
a/postfix-files \
>    EXPAND	=3D sed -e "s;\$${LIB_PREFIX};$(LIB_PREFIX);" \
>    	    -e "s;\$${LIB_SUFFIX};$(LIB_SUFFIX);"
>    SHLIB_DIR_OVERRIDE =3D \
> @@ -102,6 +102,3 @@ index 563ee27..00d4651 100644
>        "daemon_directory =3D $daemon_directory" \
>        "data_directory =3D $data_directory" \
>        "command_directory =3D $command_directory" \
> ---
> -2.25.1
> -
> diff --git a/meta-networking/recipes-daemons/postfix/files/0003-makedef=
s-Use-native-compiler-to-build-makedefs.test.patch b/meta-networking/reci=
pes-daemons/postfix/files/0003-makedefs-Use-native-compiler-to-build-make=
defs.test.patch
> index 6f8e3e84da..201b4741de 100644
> --- a/meta-networking/recipes-daemons/postfix/files/0003-makedefs-Use-n=
ative-compiler-to-build-makedefs.test.patch
> +++ b/meta-networking/recipes-daemons/postfix/files/0003-makedefs-Use-n=
ative-compiler-to-build-makedefs.test.patch
> @@ -1,4 +1,4 @@
> -From a8ec63a71361ccd3f6d2959c4c87b7824282b291 Mon Sep 17 00:00:00 2001
> +From fc51d9145210350577fdb29a9b0680df779ae347 Mon Sep 17 00:00:00 2001
>   From: Khem Raj<raj.khem@gmail.com>
>   Date: Sat, 26 Aug 2017 10:29:37 -0700
>   Subject: [PATCH] makedefs: Use native compiler to build makedefs.test
> @@ -13,10 +13,10 @@ Signed-off-by: Khem Raj<raj.khem@gmail.com>
>    1 file changed, 5 insertions(+), 5 deletions(-)
>  =20
>   diff --git a/makedefs b/makedefs
> -index 28fb128..313b401 100644
> +index 9713327..e879832 100644
>   --- a/makedefs
>   +++ b/makedefs
> -@@ -622,7 +622,7 @@ int     main(int argc, char **argv)
> +@@ -668,7 +668,7 @@ int     main(int argc, char **argv)
>        exit(0);
>    }
>    EOF
> @@ -25,7 +25,7 @@ index 28fb128..313b401 100644
>    			   rm -f makedefs.test makedefs.test.[co]
>    		       fi;;
>    		esac
> -@@ -865,7 +865,7 @@ int     main(int argc, char **argv)
> +@@ -914,7 +914,7 @@ int     main(int argc, char **argv)
>        exit(0);
>    }
>    EOF
> @@ -34,7 +34,7 @@ index 28fb128..313b401 100644
>    		   ./makedefs.test 2>/dev/null ||
>    			CCARGS=3D"$CCARGS -DNO_SIGSETJMP"
>    		   rm -f makedefs.test makedefs.test.[co]
> -@@ -903,7 +903,7 @@ int main(int argc, char **argv)
> +@@ -952,7 +952,7 @@ int main(int argc, char **argv)
>    				  &error) !=3D 14);
>    }
>    EOF
> @@ -43,7 +43,7 @@ index 28fb128..313b401 100644
>    			$icu_ldflags >/dev/null 2>&1
>    		    if ./makedefs.test 2>/dev/null ; then
>    			CCARGS=3D"$CCARGS $icu_cppflags" -@@ -1024,7 +1024,7 @@ int main(=
void) +@@ -1088,7 +1088,7 @@ int=20
> main(void) exit(ferror(stdout) ? 1 : 0); } EOF @@ -52,7 +52,7 @@ index=20
> 28fb128..313b401 100644 ./makedefs.test || exit 1 rm -f makedefs.test=20
> makedefs.test.[co] } -@@ -1180,7 +1180,7 @@ int main(void) +@@ -1245,7=20
> +1245,7 @@ int main(void) exit(ferror(stdout) ? 1 : 0); } EOF @@ -61,6=20
> +61,3 @@ index 28fb128..313b401 100644 parm_val=3D`./makedefs.test` ||=20
> exit 1 rm -f makedefs.test makedefs.test.[co] eval ${parm_name}=3D\""\$=
parm_val"\"
> ---
> -2.25.1
> -
> diff --git a/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu=
-config.patch b/meta-networking/recipes-daemons/postfix/files/0004-Fix-ic=
u-config.patch
> index 0660ee098e..daf5c7089e 100644
> --- a/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu-config=
.patch
> +++ b/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu-config=
.patch
> @@ -1,4 +1,4 @@
> -From 404150f53bb49af987d7338a808f47fdbd50ba7f Mon Sep 17 00:00:00 2001
> +From b63facf538af99e7c79ebee8d41abd52e7d5ee5e Mon Sep 17 00:00:00 2001
>   From: Khem Raj<raj.khem@gmail.com>
>   Date: Sun, 16 Jan 2022 11:21:54 +0800
>   Subject: [PATCH] Fix icu config
> @@ -18,10 +18,10 @@ Signed-off-by: Khem Raj<raj.khem@gmail.com>
>    1 file changed, 1 deletion(-)
>  =20
>   diff --git a/makedefs b/makedefs
> -index 313b401..e5db212 100644
> +index e879832..f9c132e 100644
>   --- a/makedefs
>   +++ b/makedefs
> -@@ -906,7 +906,6 @@ EOF
> +@@ -955,7 +955,6 @@ EOF
>    		    ${BUILD_CC-gcc} -o makedefs.test makedefs.test.c $icu_cppflags=
 \
>    			$icu_ldflags >/dev/null 2>&1
>    		    if ./makedefs.test 2>/dev/null ; then
> @@ -29,6 +29,3 @@ index 313b401..e5db212 100644
>    			SYSLIBS=3D"$SYSLIBS $icu_ldflags"
>    		    else
>    			CCARGS=3D"$CCARGS -DNO_EAI"
> ---
> -2.25.1
> -
> diff --git a/meta-networking/recipes-daemons/postfix/files/0005-makedef=
s-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch b/meta-networking/reci=
pes-daemons/postfix/files/0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-b=
y-default.patch
> index 1571aa844d..c2e640d6ff 100644
> --- a/meta-networking/recipes-daemons/postfix/files/0005-makedefs-add-l=
nsl-and-lresolv-to-SYSLIBS-by-default.patch
> +++ b/meta-networking/recipes-daemons/postfix/files/0005-makedefs-add-l=
nsl-and-lresolv-to-SYSLIBS-by-default.patch
> @@ -1,4 +1,4 @@
> -From 25e7d1a9bc64f39666eb0e2b9b175773615e28d2 Mon Sep 17 00:00:00 2001
> +From fb5b16db0282b5d80edb0ccc6f0f197a7f663610 Mon Sep 17 00:00:00 2001
>   From: Yi Zhao<yi.zhao@windriver.com>
>   Date: Fri, 12 Oct 2018 12:38:02 +0800
>   Subject: [PATCH] makedefs: add -lnsl and -lresolv to SYSLIBS by defau=
lt
> @@ -14,10 +14,10 @@ Signed-off-by: Yi Zhao<yi.zhao@windriver.com>
>    1 file changed, 2 insertions(+), 20 deletions(-)
>  =20
>   diff --git a/makedefs b/makedefs
> -index e5db212..b00049b 100644
> +index f9c132e..5ebef5b 100644
>   --- a/makedefs
>   +++ b/makedefs
> -@@ -577,16 +577,7 @@ case "$SYSTEM.$RELEASE" in
> +@@ -623,16 +623,7 @@ case "$SYSTEM.$RELEASE" in
>    		    SYSLIBS=3D"$SYSLIBS -ldb"
>    		    ;;
>    		esac
> @@ -35,7 +35,7 @@ index e5db212..b00049b 100644
>    		# Kernel 2.4 added IPv6
>    		case "$RELEASE" in
>    		2.[0-3].*) CCARGS=3D"$CCARGS -DNO_IPV6";;
> -@@ -655,16 +646,7 @@ EOF
> +@@ -703,16 +694,7 @@ EOF
>    		    SYSLIBS=3D"$SYSLIBS -ldb"
>    		    ;;
>    		esac
> @@ -53,6 +53,3 @@ index e5db212..b00049b 100644
>    		SYSLIBS=3D"$SYSLIBS -ldl"
>    		: ${SHLIB_SUFFIX=3D.so}
>    		: ${SHLIB_CFLAGS=3D-fPIC}
> ---
> -2.25.1
> -
> diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.10.8.bb =
b/meta-networking/recipes-daemons/postfix/postfix_3.11.2.bb
> similarity index 98%
> rename from meta-networking/recipes-daemons/postfix/postfix_3.10.8.bb
> rename to meta-networking/recipes-daemons/postfix/postfix_3.11.2.bb
> index a66ecc0b5d..14fec1b276 100644
> --- a/meta-networking/recipes-daemons/postfix/postfix_3.10.8.bb
> +++ b/meta-networking/recipes-daemons/postfix/postfix_3.11.2.bb
> @@ -26,9 +26,10 @@ SRC_URI =3D"http://ftp.porcupine.org/mirrors/postfix=
-release/official/postfix-${P=20
> file://0003-makedefs-Use-native-compiler-to-build-makedefs.test.patch=20
> \ file://0004-Fix-icu-config.patch \=20
> file://0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch=20
> \ + file://0001-sys_defs.h-workaround-for-musl-lib.patch \ "
>  =20
> -SRC_URI[sha256sum] =3D "31d4b3eb8093d823b5a151f571719ff7c0462571bc95e6=
440d87ca525bfb096c"
> +SRC_URI[sha256sum] =3D "daed65b08c9288cdb386a914f3e52cdddd44935407b5ce=
5aee8bcc3aa4207778"
>  =20
>   UPSTREAM_CHECK_URI =3D"https://www.postfix.org/announcements.html"
>   UPSTREAM_CHECK_REGEX =3D "postfix-(?P<pver>\d+(\.\d+)+)"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126883):https://lists.openembedded.org/g/openembedd=
ed-devel/message/126883
> Mute This Topic:https://lists.openembedded.org/mt/119292155/3616873
> Group Owner:openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub [=
changqing.li@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------zx1y35t6yTh5B85MSI07lwq7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#ffffff">
    <p>Hi,&nbsp;</p>
    <p>Current&nbsp; postfix 3.10.8 not support build on Linux 7.x,&nbsp; and it
      is supported from 3.11.0.&nbsp;</p>
    <p>But distro like ubuntu26.04 has&nbsp;Linux 7.x.&nbsp; Maybe it is better
      that we also upgrade postfix to 3.11.2</p>
    <p>for wrynose.&nbsp; if upgrade for&nbsp;wrynose&nbsp;is not accept, then we maybe
      need to patch postfix with the following patch:</p>
    <h4>[meta-networking][PATCH] postfix: make it can compile with linux
      7.x</h4>
    <p><a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/message/126826">https://lists.openembedded.org/g/openembedded-devel/message/126826</a></p>
    <p>Regards</p>
    <p>Changqing</p>
    <div class="moz-cite-prefix">On 5/13/26 11:09, Changqing Li via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:18AF0166CB71E13F.3218295@lists.openembedded.org">
      <pre wrap="" class="moz-quote-pre">* Refresh patch to mute patch-fuzz
* Add patch 0001-sys_defs.h-workaround-for-musl-lib.patch to workaround
  for musl lib
* This upgrade include the following commit, which make postfix can
  compile on latest stable ubuntu 26.04, which have Linux 7.x kernel

  Postfix works on Linux 7.x kernels. Frank Scheiner. Files:
        makedefs, util/sys_defs.h.

Changes:
<a class="moz-txt-link-freetext" href="https://www.ftp.saix.net/MTA/postfix/official/postfix-3.11.2.HISTORY">https://www.ftp.saix.net/MTA/postfix/official/postfix-3.11.2.HISTORY</a>

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 .../postfix/files/0001-Fix-makedefs.patch     | 25 +++++------
 ...1-sys_defs.h-workaround-for-musl-lib.patch | 43 +++++++++++++++++++
 ...tconf-to-a-variable-for-cross-compil.patch |  9 ++--
 ...tive-compiler-to-build-makedefs.test.patch | 17 +++-----
 .../postfix/files/0004-Fix-icu-config.patch   |  9 ++--
 ...sl-and-lresolv-to-SYSLIBS-by-default.patch | 11 ++---
 .../{postfix_3.10.8.bb =&gt; postfix_3.11.2.bb}  |  3 +-
 7 files changed, 73 insertions(+), 44 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/postfix/files/0001-sys_defs.h-workaround-for-musl-lib.patch
 rename meta-networking/recipes-daemons/postfix/{postfix_3.10.8.bb =&gt; postfix_3.11.2.bb} (98%)

diff --git a/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.patch b/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.patch
index 785fe87452..4e187849dc 100644
--- a/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.patch
+++ b/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.patch
@@ -1,4 +1,4 @@
-From e4197bc1f431fd7e555a31e6f7f1e020b4ec8f4c Mon Sep 17 00:00:00 2001
+From 51e29c0a1d98948118e5135bb817a96811105d39 Mon Sep 17 00:00:00 2001
 From: Li xin <a class="moz-txt-link-rfc2396E" href="mailto:lixin.fnst@cn.fujitsu.com">&lt;lixin.fnst@cn.fujitsu.com&gt;</a>
 Date: Fri, 19 Jun 2015 16:45:54 +0900
 Subject: [PATCH] Fix makedefs
@@ -19,10 +19,10 @@ Signed-off-by: Yao Zhao <a class="moz-txt-link-rfc2396E" href="mailto:yao.zhao@windriver.com">&lt;yao.zhao@windriver.com&gt;</a>
  1 file changed, 11 insertions(+), 16 deletions(-)
 
 diff --git a/makedefs b/makedefs
-index a740e41..28fb128 100644
+index d5103ce..9713327 100644
 --- a/makedefs
 +++ b/makedefs
-@@ -230,9 +230,6 @@ echo &quot;# pie=$pie&quot;
+@@ -232,9 +232,6 @@ echo &quot;# pie=$pie&quot;
  
  # Defaults for most sane systems
  
@@ -32,7 +32,7 @@ index a740e41..28fb128 100644
  ARFL=rv
  
  # Ugly function to make our error message more visible among the
-@@ -563,12 +560,12 @@ case &quot;$SYSTEM.$RELEASE&quot; in
+@@ -608,12 +605,12 @@ case &quot;$SYSTEM.$RELEASE&quot; in
  		case &quot;$CCARGS&quot; in
  		 *-DNO_DB*) ;;
  		 *-DHAS_DB*) ;;
@@ -48,8 +48,8 @@ index a740e41..28fb128 100644
  		    else
  			# No, we're not going to try db1 db2 db3 etc.
  			# On a properly installed system, Postfix builds
-@@ -577,12 +574,12 @@ case &quot;$SYSTEM.$RELEASE&quot; in
- 			echo &quot;Install the appropriate db*-devel package first.&quot; 1&gt;&amp;2
+@@ -623,12 +620,12 @@ case &quot;$SYSTEM.$RELEASE&quot; in
+ 			echo &quot;Alternatively, build with CCARGS=\&quot;-NO_DB ...\&quot;&quot; 1&gt;&amp;2
  			exit 1
  		    fi
 -		    SYSLIBS=&quot;-ldb<a class="moz-txt-link-rfc2396E" href="mailto:@@-63,7+63,7@@indexa740e41..28fb128100644dotest-e$lib/lib$name.a-o-e$lib/lib$name.so&amp;&amp;{SYSLIBS=">&quot;
@@ -63,7 +63,7 @@ index a740e41..28fb128 100644
  		    do
  			test -e $lib/lib$name.a -o -e $lib/lib$name.so &amp;&amp; {
  			    SYSLIBS=&quot;</a>$SYSLIBS -l$name&quot;
-@@ -602,7 +599,7 @@ case &quot;$SYSTEM.$RELEASE&quot; in
+@@ -648,7 +645,7 @@ case &quot;$SYSTEM.$RELEASE&quot; in
  		       if [ `expr &quot;X$CCARGS&quot; : &quot;X.*-DNO_EPOLL&quot;` -gt 0 ]
  		       then
  			   :
@@ -72,7 +72,7 @@ index a740e41..28fb128 100644
  		       then
  			   echo CCARGS=&quot;$CCARGS -DNO_EPOLL&quot;
  		       else
-@@ -626,8 +623,6 @@ int     main(int argc, char **argv)
+@@ -672,8 +669,6 @@ int     main(int argc, char **argv)
  }
  EOF
  			   ${CC-gcc} -o makedefs.test makedefs.test.c || exit 1
@@ -81,7 +81,7 @@ index a740e41..28fb128 100644
  			   rm -f makedefs.test makedefs.test.[co]
  		       fi;;
  		esac
-@@ -644,12 +639,12 @@ EOF
+@@ -690,12 +685,12 @@ EOF
  		case &quot;$CCARGS&quot; in
  		 *-DNO_DB*) ;;
  		 *-DHAS_DB*) ;;
@@ -97,8 +97,8 @@ index a740e41..28fb128 100644
  		    else
  			# On a properly installed system, Postfix builds
  			# by including &lt;db.h&gt; and by linking with -ldb
-@@ -657,12 +652,12 @@ EOF
- 			echo &quot;Install the appropriate db*-devel package first.&quot; 1&gt;&amp;2
+@@ -705,12 +700,12 @@ EOF
+ 			echo &quot;See: <a class="moz-txt-link-freetext" href="https://www.postfix.org/NON_BERKELEYDB_README.html#build-conf">https://www.postfix.org/NON_BERKELEYDB_README.html#build-conf</a>&quot; 1&gt;&amp;2
  			exit 1
  		    fi
 -		    SYSLIBS=&quot;-ldb<a class="moz-txt-link-rfc2396E" href="mailto:@@-112,6+112,3@@indexa740e41..28fb128100644dotest-e$lib/lib$name.a-o-e$lib/lib$name.so&amp;&amp;{SYSLIBS=">&quot;
@@ -112,6 +112,3 @@ index a740e41..28fb128 100644
  		    do
  			test -e $lib/lib$name.a -o -e $lib/lib$name.so &amp;&amp; {
  			    SYSLIBS=&quot;</a>$SYSLIBS -l$name&quot;
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-daemons/postfix/files/0001-sys_defs.h-workaround-for-musl-lib.patch b/meta-networking/recipes-daemons/postfix/files/0001-sys_defs.h-workaround-for-musl-lib.patch
new file mode 100644
index 0000000000..b7a8e05165
--- /dev/null
+++ b/meta-networking/recipes-daemons/postfix/files/0001-sys_defs.h-workaround-for-musl-lib.patch
@@ -0,0 +1,43 @@
+From ce15792203ae0c787e3602d6d38a892ea1ce31ce Mon Sep 17 00:00:00 2001
+From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
+Date: Tue, 12 May 2026 15:04:55 +0800
+Subject: [PATCH] sys_defs.h: workaround for musl lib
+
+Fix musl lib compile failure:
+vbuf_print.c:215:46: error: macro 'VBUF_SNPRINTF' passed 5 arguments, but takes just 4
+  215 |                     VSTRING_ADDNUM(fmt, width);
+      |                                              ^
+vbuf_print.c:132:9: note: macro 'VBUF_SNPRINTF' defined here
+  132 | #define VBUF_SNPRINTF(bp, sz, fmt, arg) do { \
+
+Previously checking condition will make #else branch is selected, and
+NO_SNPRINTF is defined, and when NO_SNPRINTF is defined, VBUF_SNPRINTF
+only take 4 arguments, and cause above failure. musl lib support
+snprintf and we only have glibc and musl libc, so workaround by when
+glibc is not defected, take it as musl lib, and select the #if branch.
+
+Upstream-Status: Pending [Reported to <a class="moz-txt-link-abbreviated" href="mailto:postfix-users@postfix.org">postfix-users@postfix.org</a>]
+
+https://www.mail-archive.com/postfix-users@postfix.org/msg107898.html
+
+Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
+---
+ src/util/sys_defs.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/util/sys_defs.h b/src/util/sys_defs.h
+index 1890577..c3527c9 100644
+--- a/src/util/sys_defs.h
++++ b/src/util/sys_defs.h
+@@ -794,7 +794,7 @@ extern int initgroups(const char *, int);
+ #define NATIVE_NEWALIAS_PATH &quot;/usr/bin/newaliases&quot;
+ #define NATIVE_COMMAND_DIR &quot;/usr/sbin&quot;
+ #define NATIVE_DAEMON_DIR &quot;/usr/libexec/postfix&quot;
+-#if HAVE_GLIBC_API_VERSION_SUPPORT(2, 1)
++#if HAVE_GLIBC_API_VERSION_SUPPORT(2, 1) || !defined(__GLIBC__)
+ #define SOCKADDR_SIZE	socklen_t
+ #define SOCKOPT_SIZE	socklen_t
+ #else
+-- 
+2.34.1
+
diff --git a/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-postconf-to-a-variable-for-cross-compil.patch b/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-postconf-to-a-variable-for-cross-compil.patch
index d46efb95cb..a74c46fa92 100644
--- a/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-postconf-to-a-variable-for-cross-compil.patch
+++ b/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-postconf-to-a-variable-for-cross-compil.patch
@@ -1,4 +1,4 @@
-From 953719878466c55572294f42e85127bda5d34999 Mon Sep 17 00:00:00 2001
+From ce8deeaac8ca5d7329e1923790a1f35798953799 Mon Sep 17 00:00:00 2001
 From: Li xin <a class="moz-txt-link-rfc2396E" href="mailto:lixin.fnst@cn.fujitsu.com">&lt;lixin.fnst@cn.fujitsu.com&gt;</a>
 Date: Fri, 19 Jun 2015 17:14:58 +0900
 Subject: [PATCH] Change fixed postconf to a variable for cross-compiling
@@ -12,10 +12,10 @@ Signed-off-by: Yao Zhao <a class="moz-txt-link-rfc2396E" href="mailto:yao.zhao@windriver.com">&lt;yao.zhao@windriver.com&gt;</a>
  2 files changed, 11 insertions(+), 9 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index a37f89f..17cb64b 100644
+index 8d7501a..d2a85e8 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -22,7 +22,7 @@ META	= meta/main.cf.proto meta/master.cf.proto meta/postfix-files \
+@@ -23,7 +23,7 @@ META	= meta/main.cf.proto meta/master.cf.proto meta/postfix-files \
  EXPAND	= sed -e &quot;s;\$${LIB_PREFIX};$(LIB_PREFIX);&quot; \
  	    -e &quot;s;\$${LIB_SUFFIX};$(LIB_SUFFIX);&quot;
  SHLIB_DIR_OVERRIDE = \
@@ -102,6 +102,3 @@ index 563ee27..00d4651 100644
      &quot;daemon_directory = $daemon_directory&quot; \
      &quot;data_directory = $data_directory&quot; \
      &quot;command_directory = $command_directory&quot; \
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-daemons/postfix/files/0003-makedefs-Use-native-compiler-to-build-makedefs.test.patch b/meta-networking/recipes-daemons/postfix/files/0003-makedefs-Use-native-compiler-to-build-makedefs.test.patch
index 6f8e3e84da..201b4741de 100644
--- a/meta-networking/recipes-daemons/postfix/files/0003-makedefs-Use-native-compiler-to-build-makedefs.test.patch
+++ b/meta-networking/recipes-daemons/postfix/files/0003-makedefs-Use-native-compiler-to-build-makedefs.test.patch
@@ -1,4 +1,4 @@
-From a8ec63a71361ccd3f6d2959c4c87b7824282b291 Mon Sep 17 00:00:00 2001
+From fc51d9145210350577fdb29a9b0680df779ae347 Mon Sep 17 00:00:00 2001
 From: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
 Date: Sat, 26 Aug 2017 10:29:37 -0700
 Subject: [PATCH] makedefs: Use native compiler to build makedefs.test
@@ -13,10 +13,10 @@ Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
  1 file changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/makedefs b/makedefs
-index 28fb128..313b401 100644
+index 9713327..e879832 100644
 --- a/makedefs
 +++ b/makedefs
-@@ -622,7 +622,7 @@ int     main(int argc, char **argv)
+@@ -668,7 +668,7 @@ int     main(int argc, char **argv)
      exit(0);
  }
  EOF
@@ -25,7 +25,7 @@ index 28fb128..313b401 100644
  			   rm -f makedefs.test makedefs.test.[co]
  		       fi;;
  		esac
-@@ -865,7 +865,7 @@ int     main(int argc, char **argv)
+@@ -914,7 +914,7 @@ int     main(int argc, char **argv)
      exit(0);
  }
  EOF
@@ -34,7 +34,7 @@ index 28fb128..313b401 100644
  		   ./makedefs.test 2&gt;/dev/null ||
  			CCARGS=&quot;$CCARGS -DNO_SIGSETJMP&quot;
  		   rm -f makedefs.test makedefs.test.[co]
-@@ -903,7 +903,7 @@ int main(int argc, char **argv)
+@@ -952,7 +952,7 @@ int main(int argc, char **argv)
  				  &amp;error) != 14);
  }
  EOF
@@ -43,7 +43,7 @@ index 28fb128..313b401 100644
  			$icu_ldflags &gt;/dev/null 2&gt;&amp;1
  		    if ./makedefs.test 2&gt;/dev/null ; then
  			CCARGS=&quot;$CCARGS $icu_cppflags<a class="moz-txt-link-rfc2396E" href="mailto:-@@-1024,7+1024,7@@intmain(void)+@@-1088,7+1088,7@@intmain(void)exit(ferror(stdout)?1:0);}EOF@@-52,7+52,7@@index28fb128..313b401100644./makedefs.test||exit1rm-fmakedefs.testmakedefs.test.[co]}-@@-1180,7+1180,7@@intmain(void)+@@-1245,7+1245,7@@intmain(void)exit(ferror(stdout)?1:0);}EOF@@-61,6+61,3@@index28fb128..313b401100644parm_val=`./makedefs.test`||exit1rm-fmakedefs.testmakedefs.test.[co]eval${parm_name}=\">&quot;
-@@ -1024,7 +1024,7 @@ int     main(void)
+@@ -1088,7 +1088,7 @@ int     main(void)
      exit(ferror(stdout) ? 1 : 0);
  }
  EOF
@@ -52,7 +52,7 @@ index 28fb128..313b401 100644
      ./makedefs.test || exit 1
      rm -f makedefs.test makedefs.test.[co]
  }
-@@ -1180,7 +1180,7 @@ int     main(void)
+@@ -1245,7 +1245,7 @@ int     main(void)
      exit(ferror(stdout) ? 1 : 0);
  }
  EOF
@@ -61,6 +61,3 @@ index 28fb128..313b401 100644
  	parm_val=`./makedefs.test` || exit 1
  	rm -f makedefs.test makedefs.test.[co]
  	eval ${parm_name}=\&quot;</a>&quot;\$parm_val&quot;\&quot;
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu-config.patch b/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu-config.patch
index 0660ee098e..daf5c7089e 100644
--- a/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu-config.patch
+++ b/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu-config.patch
@@ -1,4 +1,4 @@
-From 404150f53bb49af987d7338a808f47fdbd50ba7f Mon Sep 17 00:00:00 2001
+From b63facf538af99e7c79ebee8d41abd52e7d5ee5e Mon Sep 17 00:00:00 2001
 From: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
 Date: Sun, 16 Jan 2022 11:21:54 +0800
 Subject: [PATCH] Fix icu config
@@ -18,10 +18,10 @@ Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
  1 file changed, 1 deletion(-)
 
 diff --git a/makedefs b/makedefs
-index 313b401..e5db212 100644
+index e879832..f9c132e 100644
 --- a/makedefs
 +++ b/makedefs
-@@ -906,7 +906,6 @@ EOF
+@@ -955,7 +955,6 @@ EOF
  		    ${BUILD_CC-gcc} -o makedefs.test makedefs.test.c $icu_cppflags \
  			$icu_ldflags &gt;/dev/null 2&gt;&amp;1
  		    if ./makedefs.test 2&gt;/dev/null ; then
@@ -29,6 +29,3 @@ index 313b401..e5db212 100644
  			SYSLIBS=&quot;$SYSLIBS $icu_ldflags&quot;
  		    else
  			CCARGS=&quot;$CCARGS -DNO_EAI&quot;
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-daemons/postfix/files/0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch b/meta-networking/recipes-daemons/postfix/files/0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch
index 1571aa844d..c2e640d6ff 100644
--- a/meta-networking/recipes-daemons/postfix/files/0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch
+++ b/meta-networking/recipes-daemons/postfix/files/0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch
@@ -1,4 +1,4 @@
-From 25e7d1a9bc64f39666eb0e2b9b175773615e28d2 Mon Sep 17 00:00:00 2001
+From fb5b16db0282b5d80edb0ccc6f0f197a7f663610 Mon Sep 17 00:00:00 2001
 From: Yi Zhao <a class="moz-txt-link-rfc2396E" href="mailto:yi.zhao@windriver.com">&lt;yi.zhao@windriver.com&gt;</a>
 Date: Fri, 12 Oct 2018 12:38:02 +0800
 Subject: [PATCH] makedefs: add -lnsl and -lresolv to SYSLIBS by default
@@ -14,10 +14,10 @@ Signed-off-by: Yi Zhao <a class="moz-txt-link-rfc2396E" href="mailto:yi.zhao@windriver.com">&lt;yi.zhao@windriver.com&gt;</a>
  1 file changed, 2 insertions(+), 20 deletions(-)
 
 diff --git a/makedefs b/makedefs
-index e5db212..b00049b 100644
+index f9c132e..5ebef5b 100644
 --- a/makedefs
 +++ b/makedefs
-@@ -577,16 +577,7 @@ case &quot;$SYSTEM.$RELEASE&quot; in
+@@ -623,16 +623,7 @@ case &quot;$SYSTEM.$RELEASE&quot; in
  		    SYSLIBS=&quot;$SYSLIBS -ldb&quot;
  		    ;;
  		esac
@@ -35,7 +35,7 @@ index e5db212..b00049b 100644
  		# Kernel 2.4 added IPv6
  		case &quot;$RELEASE&quot; in
  		2.[0-3].*) CCARGS=&quot;$CCARGS -DNO_IPV6&quot;;;
-@@ -655,16 +646,7 @@ EOF
+@@ -703,16 +694,7 @@ EOF
  		    SYSLIBS=&quot;$SYSLIBS -ldb&quot;
  		    ;;
  		esac
@@ -53,6 +53,3 @@ index e5db212..b00049b 100644
  		SYSLIBS=&quot;$SYSLIBS -ldl&quot;
  		: ${SHLIB_SUFFIX=.so}
  		: ${SHLIB_CFLAGS=-fPIC}
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.10.8.bb b/meta-networking/recipes-daemons/postfix/postfix_3.11.2.bb
similarity index 98%
rename from meta-networking/recipes-daemons/postfix/postfix_3.10.8.bb
rename to meta-networking/recipes-daemons/postfix/postfix_3.11.2.bb
index a66ecc0b5d..14fec1b276 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.10.8.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.11.2.bb
@@ -26,9 +26,10 @@ SRC_URI = <a class="moz-txt-link-rfc2396E" href="http://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${Pfile://0003-makedefs-Use-native-compiler-to-build-makedefs.test.patch\file://0004-Fix-icu-config.patch\file://0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch\+file://0001-sys_defs.h-workaround-for-musl-lib.patch\">&quot;http://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${P
            file://0003-makedefs-Use-native-compiler-to-build-makedefs.test.patch \
            file://0004-Fix-icu-config.patch \
            file://0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch \
+           file://0001-sys_defs.h-workaround-for-musl-lib.patch \
            &quot;</a>
 
-SRC_URI[sha256sum] = &quot;31d4b3eb8093d823b5a151f571719ff7c0462571bc95e6440d87ca525bfb096c&quot;
+SRC_URI[sha256sum] = &quot;daed65b08c9288cdb386a914f3e52cdddd44935407b5ce5aee8bcc3aa4207778&quot;
 
 UPSTREAM_CHECK_URI = <a class="moz-txt-link-rfc2396E" href="https://www.postfix.org/announcements.html">&quot;https://www.postfix.org/announcements.html&quot;</a>
 UPSTREAM_CHECK_REGEX = &quot;postfix-(?P&lt;pver&gt;\d+(\.\d+)+)&quot;
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#126883): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/message/126883">https://lists.openembedded.org/g/openembedded-devel/message/126883</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/119292155/3616873">https://lists.openembedded.org/mt/119292155/3616873</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:changqing.li@windriver.com">changqing.li@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------zx1y35t6yTh5B85MSI07lwq7--

