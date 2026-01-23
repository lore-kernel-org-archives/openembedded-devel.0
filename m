Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFB46D72356
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 08:55:26 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.63954.1769158441408170304
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jan 2026 00:54:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=aKJgMzO4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.168.131, mailfrom: shoudil@qti.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N5m0ll3504255
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 08:23:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=/figBU4li9wxWhs4FxAZa8fLyuvjwVHEkoC2iTPTZew=; b=aK
	JgMzO4Jpsy2K1Xvyx8cq7ZEUx446H0d21Yvyi9nV0VFli6MtRWME1xKJYuCney/D
	BuvU4DygVwrgXiUI06B+hDxcZlKxRiKtTdo3lBYrsJa9p9iXd39Bmv9d2rqq2Fjv
	Ja5C3z6i47C+WCdMupPcqUBM6wHPI+Edlb6YKJUZAjX1dIaw2bTl1T2VbSfjN1hu
	E3aFwY5DRAu61emnZz0g8T2fuZrUCJZnU5k2kjg+yZCclJ2kNgcU9Jf5qW2HsoXv
	+QWW9z7GWBjCeZdmr71oqUnL+V70VEiwESFtiUuKfrn919Ajn19HmpB4uPEsEJa6
	3JAcySTs8LDrp7OY7JEw==
Received: from ph0pr07cu006.outbound.protection.outlook.com (mail-ph0pr07cu00600.outbound.protection.outlook.com [40.93.23.88])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bus982bpd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 08:23:08 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g1aCAIjHI4PwtPMj266cfOW+iRFU33NDuJvtwdolK0S8ii4rjL8cUKg2eB0rE2QVU57IH2MqhR62Da3omdpRlbGQK55Oqmn0uwYwIVOGUvAI+lXJgzFmZzsZBwt5yJWKRYjz7RjhqkZhiP1ldsNfnmwueA6UJab1iCTVUiC8pvTAVLqwaFa9gKwN1p9MaQwWQpOnCr86IUYjrdH+z53Uwq13dWgT9JTEbAAtP6/QMv9cHtM/HVoxywJhIpVHq8fgdAcbylOBUqwIjxfT7FQXke/F6JobZLf/aGbTZYuP30bHsJyB+zA+FEyfnWORgZSDmp5yaVM7pvCMhMhbZJFPfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/figBU4li9wxWhs4FxAZa8fLyuvjwVHEkoC2iTPTZew=;
 b=UjWPFfJPMbXS0G3OzVo3o8ZZ6Jo36B7ISvKDbxj3iUmPZDczZlN19sKJ58MZOi0uXpUXa+AVIdp4Rf0PA0h758ywi3niCHouMolUjRZLaucO5VvrUksh49RNrM7Aa0GFez2VNUX55zZRYdtHCrHd0gtheSip0gwhBIv5bMahhHXDoHak+b4px0igSYPSZ7QygvKzoJ2kIuVUn2gMlstxkmsCbeGLx2py0HwIUZzHGw/E5knyYHjGerpcJ6bZGOghUUIWMaBrkiNsdlQBG23jFHjB15sFKtwcuB24115O+PEwiP+I/KKb83imx1SZJjf/tBEVOGGm4CmbEiTbh671XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from LV2PR02MB11156.namprd02.prod.outlook.com
 (2603:10b6:408:350::22) by BL3PR02MB8267.namprd02.prod.outlook.com
 (2603:10b6:208:342::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Fri, 23 Jan
 2026 08:23:05 +0000
Received: from LV2PR02MB11156.namprd02.prod.outlook.com
 ([fe80::ca5:a90e:7b8a:3905]) by LV2PR02MB11156.namprd02.prod.outlook.com
 ([fe80::ca5:a90e:7b8a:3905%5]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 08:23:05 +0000
From: Shoudi Li <shoudil@qti.qualcomm.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: Shoudi Li <shoudil@qti.qualcomm.com>
Subject: Please help review https://github.com/openembedded/meta-openembedded/pull/1022
Thread-Topic: Please help review
 https://github.com/openembedded/meta-openembedded/pull/1022
Thread-Index: AdyMQT3pp8Zrva91T9mNw8xD4839/g==
Date: Fri, 23 Jan 2026 08:23:05 +0000
Message-ID: 
 <LV2PR02MB11156D8117417F9CFAD864EB99294A@LV2PR02MB11156.namprd02.prod.outlook.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR02MB11156:EE_|BL3PR02MB8267:EE_
x-ms-office365-filtering-correlation-id: 122b2761-fa17-42ad-3b41-08de5a58a1f5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|8096899003|13003099007|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?UBrRKxWISPsHOFeSDsMwVIQgbNgaO/q4NwHdNcoFwEi0xgFeiwt93dcRzYo1?=
 =?us-ascii?Q?+fFexahGYIeC1k9p7VeTAWXm2UUSMRMx+m0Kj4Yird3pJaSq1S/IX0XR0Ren?=
 =?us-ascii?Q?bN0L1QuZTkQYMJfOoV4jvFZYU0Vp14DDW2euyObcD9tpNm4f3MotnAUMp4Z5?=
 =?us-ascii?Q?J0hrMP19TbYPttI0FmU+Yq7dfVY0ZKqeZ1cCE8fCJ947MGXwh6TYCFsaRHAE?=
 =?us-ascii?Q?RhwOeUShc0HzH94lQHlly0yx1dMas7kbAccLKT3CG2d/PJkI1Zt3OxXv5wqf?=
 =?us-ascii?Q?QR3965eVaK8gUzq2ABFdpX40pfMlzShZfLbR/r5SFmQznFUllmVlVBfEEgBA?=
 =?us-ascii?Q?yfUF7deoLFfYKaqC7mwZlWBK8lB7PpxnfACLL7m7vyxXDbzphh4tFqiZSDHW?=
 =?us-ascii?Q?EPB02vMNe/rLiHAmTDnRN/YGfgPwUZ6H/qahYJg59qhdvx2qKHp+afzrHtM1?=
 =?us-ascii?Q?uxDejnPjk9ijS0FEF2LpZSAGnJXWvH6iu7gRYK25p6y7cTZh4kd9uG0x47fi?=
 =?us-ascii?Q?GJVtoP62PJ7L7h7iHV1Vh9HGz8otOmXdIWybqHUzSm9u/Fhs3hb+06mBIKMF?=
 =?us-ascii?Q?FFhYx+/ERKr6ujcfpLubRa0lq4Zss3AHtsm8VvnipNMz9LC/WK/Pq3ktYNWI?=
 =?us-ascii?Q?41VtJ4Rqc2wnSHxxj5qufhokqN2q6NnV9WaUUUKYDyMPiRjkyHKmDvwm4i2N?=
 =?us-ascii?Q?1B6qDwXjYahjqXx3nMVDwHXPleRRuHRx1ZNbh4rjaztjFtGs2+rq4UpaGH20?=
 =?us-ascii?Q?8mvobT/PpHxdW/o9gNUMAwQ7Q5ReVOirqPW6Dz37my+R1iyMqot4cSjKTSOq?=
 =?us-ascii?Q?NOLFyjZaXN268Y/HL+qSjjsD8s2OzdAdtDN2kk2w6kNqIiUpmZLAmU4aYGZ5?=
 =?us-ascii?Q?SOC1JuE6FyrKFY+4dj8kmCL8XQesbAcEJb4tlC3Sf5Xj2ktFTVuri298f9AX?=
 =?us-ascii?Q?eQRMKyQIy55OY+OtL30lfzI80AGgzsEKwk8uBp8xFtGbeSHNuBQYHOrYcQbm?=
 =?us-ascii?Q?85J3SoIqxE7U6VdasyDTzPGNoyxuYkZBNpHcPZJvwOpNLKfnm840NnQmdyGq?=
 =?us-ascii?Q?toBcx2rkocC10zTv60VrlquQ/thsXP+zPDFFkgMBVRYPHHcnlkYI6FhpCj2A?=
 =?us-ascii?Q?QhGqSCKzKe9MjvvCNILdnozplLITkuBUNyB1nAewfT1EWQUkmQnlRRqiSBP7?=
 =?us-ascii?Q?GPyC11A897DXLKH3cCXEkiD0155OGl34MXq2boF7YwRId/V1Fo1WqnxpVdaJ?=
 =?us-ascii?Q?M4VedWzQ6RUlxmDq1ZRR3Payc2qAXTy8qHb+t9AsPdIdFKokJOZmGZlrkNAd?=
 =?us-ascii?Q?+r0fuvPxQa6OPXu7UMR265dKrNhSRbiJNKbsl/W80CleDXhD0fRoi3Kw7Uxa?=
 =?us-ascii?Q?sRulNvy657DSQ6//vow4lF+J5zQ3feqhBDvaXtMhESiiMA+IgLx3mxiMTjLt?=
 =?us-ascii?Q?VEX1+95IQGFHxggck6/wEXqU3rLlqM5Z0PGlqXWHNMoLaUQXACxQBT8b7ek4?=
 =?us-ascii?Q?frERt/nwxD71IH3sZHbAHsCGULPlpUUqFuMaTQo7rCSkfnPwyatnD2P5+nrx?=
 =?us-ascii?Q?d6zcOI52OCsOrTezeIauBBNhKGYnJ87y5AzdDX3JGlh0r5ssg1BttnIlL0F9?=
 =?us-ascii?Q?PiXCPLBcsoL+Nnz+QzxqOWQ=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR02MB11156.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(8096899003)(13003099007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?QsfAK7+fibLzRC6VZzdSd5zS8bLuHzTLEZJHTPiMP7Rj1YT56jkk/Vn24rTX?=
 =?us-ascii?Q?qnOxfgKs8ardk22TUL0eNimc2gkmirsKbkcAxsvOJ4NHE2FN1sgONiAoioFZ?=
 =?us-ascii?Q?q/06bIsOfn7l3Ev0hQnIWeOrH4w/dB8xgsyJp1S9uipFIg0ArMFEkuu67B0Y?=
 =?us-ascii?Q?BbhO5O7csSV9eC2rXThbgOebid1UzV0Zphz0C/7BrxwLXa4JYD4+hz3hKAdO?=
 =?us-ascii?Q?OD6jI9ijxlo9CQ59S6OtCr7K/erVKXo+r4G3Z+SQAdLvViC/54U5lldqQegO?=
 =?us-ascii?Q?/gpffmBHKcKwdAidw606YhQKAc4oi90SuD1b5NNnTd6b41uoUm26Uvdrcnp6?=
 =?us-ascii?Q?NCq4773GXlrNyvKl5RaPCDtUnjWo2buJTZpT73WMdjMAPhK87FtnQ4OhL0K4?=
 =?us-ascii?Q?K8lK/lnDdkHSJD4pUG0uyYtEu+YxrTEYD0iRDW4JzPYR00XGPLWrdqONnbQM?=
 =?us-ascii?Q?SiuL/YpdBzgK3/yWVVOiZzx9aa65yM27qO4zYWIlVNc6pm21ODDNDapMceDh?=
 =?us-ascii?Q?QzfeKKjpVtmgkYMkVTpo+T2k41VlPYBVpemLkdsA7uoi5/BpPH0J8XC9eYxT?=
 =?us-ascii?Q?OMSmYr3IrvmPNVcqA+54WAcVVRUWQYRNTKi9ZI2+2SQvu9SS2msyaIkKFtGe?=
 =?us-ascii?Q?rkO+8W8pXcgwdHExmaERJ7Z/d+UsOESwJxi2ASOXuR+3xByZjLkNopiM2SFa?=
 =?us-ascii?Q?aXk+DbxjyvpCOC3FhUdEFjmRq/k0hgEZi3r+FvGM++if5vtR9rzyhKwmHYiq?=
 =?us-ascii?Q?Vfw4Mq6CrVMwVw2b6gixG/OK037HUlyEpDLgbvHO2tktNvAIXtxNPovJOkMA?=
 =?us-ascii?Q?2fQHbE+sFRSNc95IFAPHsUDX9p+fSCSQ3RvzE2CEfxkTcvnwCyGQtRbm465/?=
 =?us-ascii?Q?3RKc6AUHPUpFoU+3qBjCDgc5QHQGAeS/PLmWo1kosFN5Zhb1UlWxrMEg85nX?=
 =?us-ascii?Q?4uQDEJm0tkAJ6QkVzmp2Ln09RR1CMpMSJ4GbwhJgMv7vqhwspyz42EwGJJba?=
 =?us-ascii?Q?LgzLHVibJzavDzXqem26LhbSBqH0AauSI628XAY27R8FIhY5COvUakcTVRw3?=
 =?us-ascii?Q?kRvntj4vTdv40FRAkEuh92eIEJdI4RH4mDqpd4y7oIKOinOvQ+yNrSZ4Tnmw?=
 =?us-ascii?Q?KUR8ZFiH0Shy1B93to5edXK3xmCPS/RnCEJm5XYNDK/pXRdfP6GxIL/OO+6Y?=
 =?us-ascii?Q?imhssdx5KN84/HnJe5xDd1PcgtVI2SZg4u5t6OEDehMMwIOMnoWPDBMmezb0?=
 =?us-ascii?Q?nShDrGg8N1118pJ6GOjLTgSYLZZwd7i9HsrRBOiOmvzECgefD3eo2l71/7+m?=
 =?us-ascii?Q?AaYuOZZw/PKNG1tl9VDZZMvL5ibPw5LHcUxFWN9ga3etQSfBXQqHd7zaFl4r?=
 =?us-ascii?Q?AznGaSb9KL3diDUgRTri7d2gP7gsJ1nEBmuxwwtOn8MulfqT2tSeltQjZOK/?=
 =?us-ascii?Q?VJIqZdFhCx/hwZpQih3hFxLTyF5eCR1L2yhtHLNhhFZtt8E6j4/bo5fLdmG4?=
 =?us-ascii?Q?T6y+6ii3GTPUnw0rgodLwWUSmAUjMIr1vrxY+2SuzcFmuaDxJ+e+VFTvuaEu?=
 =?us-ascii?Q?MF+/s/L61yVRMeERZbxccYI3a3fq/VK9EiXIA+QRXmZHJrtqHvCfjAjc8VXW?=
 =?us-ascii?Q?NaqB28M/XAYaxEve20JDPd7hM62gB74qaaIzp450mW+Fxh/IxoLpIpo3lqXO?=
 =?us-ascii?Q?8H7NBUqbtQ0INS/wocUyBxUS1bcbSezOQUG/XbiP/5rtUZbFX/PQwNbpTOir?=
 =?us-ascii?Q?qqiuTtWL1Q=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	abMmeoDLkZF4W4eMysRuV4hWbqDx1nSRkFI0gIhitX9f8CvihBmX1Z+PKjgnnl+oxig0Q4VMhQgi6jLh/3UJfYSmddBL75ziy2BCv2Uwlw99k9jLVvP60xwN8z/2TF6f0219XvcS03kY1tDeNFANtaZEs1Oct16nWBqN1iaixFQTu2dzDiXaklKB4cMdvg7uqfqyc2HbG1IEPU2jyz3l/E0PvAJKKrWVvNt1alPPxxHJCHhZLMD03BderV5QJzRm0GEuNv6c3safyNjV0I+AOSVLgXZTgX0j9pGR2RY/G/MMHfSPQi4unHnVoUoFIbUvmkpc4stokUJlDB6PvPtw+BYQvqMnmM+Fojcsra8iIgmTSbIvTt2w87ZKKJpou4l6Ij2yR1RXuB/qz154ZGfFiB6+kn99ralWFlvtU3fKOtUWfVZEDVlQ1vnyRzsQl3k8SZoJgEo8O7FRmjVM3dgjx8xUrWNe0RppzsrgY1ePjTS887hXYg9WRkmURRLF3LSraUKDxM6SU5g3ndyU42CwZBVo1cdAZ2hGMwVOBbtTp4waLLQo9l1TfQP1yJD/4rgSCE8o4C1q+qYFInzJA6vC8vBYWP4g+HsAaGMIMwFWmxEOUieIyCDPesG/39FpeXPd
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR02MB11156.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 122b2761-fa17-42ad-3b41-08de5a58a1f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2026 08:23:05.3670
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IZhQUCJe/gOzjNdqzsWOOSlHCE8npGWvmex6qEVsrPRcQDuh/R6ZHjG1ulg8SeZ3o4j4XcYJuwikvGJ7o2dnHXqFBdIPyQthLoOT2eJYQb0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR02MB8267
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA2NCBTYWx0ZWRfXztKTnI8ERbZ2
 mfYBzrevL+Uqu4ek1DnEWZ7V5DAcYJjAbMbL6m9eqSWMxKfmIcwwlWyg4utC7mBsjoTssM4J5/N
 aRzdIFKeI+DTnBAfauP0LkP9XV+H0v3M66kC81KcTQTQhOplPdv9zZvFRcPAGZS9Fmk2jfoGuqI
 e0MQXR72QaE1GZrfhO3hpGe9W1/6NH8JmDEViESr0WZ1GXkr4cYl/ebIKu1X4lVv+jktXyEWrX5
 FSXyafUjC65wzfpsGBqeFjAiK6P414+QUM6iTCXy38qMniFqa+a5k/hH/SUre7t+TII3uT6xwxO
 JxDSBSTsAoS7FUBrF2kBf35bvYZvytBursJngT8QnwVdFeWkYgoHgQ8NDZZsod48MN4WAQ6ox4X
 XMMw7Y5Z2iN8IRDTjlT3aNhMkFIamNwSjzv9VzEQtVpkTtfgblkvzpg1VzmNZxN7nHfAeWrioBe
 AvKPBrpp1E1B3vevt0g==
X-Authority-Analysis: v=2.4 cv=JuX8bc4C c=1 sm=1 tr=0 ts=69732fec cx=c_pps
 a=2ZwNoJ055HxK2a8VhTG6Xw==:117 a=NEAV23lmAAAA:8
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IBDm-M1lAmkA:10 a=ECptLAa0K98A:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=t0QusjzNh06dqVebM3MA:9 a=CjuIK1q_8ugA:10
 a=yMhMjlubAAAA:8 a=SSmOFEACAAAA:8 a=a5ZQ6NDiXY5NoRcP:21 a=gKO2Hq4RSVkA:10
 a=UiCQ7L4-1S4A:10 a=hTZeC7Yk6K0A:10 a=frz4AuCg-hUA:10
X-Proofpoint-GUID: o8i5ZPhUEtyfn9fB-FL6G0rC-OoJOWlA
X-Proofpoint-ORIG-GUID: o8i5ZPhUEtyfn9fB-FL6G0rC-OoJOWlA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_01,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 clxscore=1011 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230064
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_LV2PR02MB11156D8117417F9CFAD864EB99294ALV2PR02MB11156na_"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 08:55:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123774

--_000_LV2PR02MB11156D8117417F9CFAD864EB99294ALV2PR02MB11156na_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Maintainers,

Could you help review this PR to fix adb issue on boards with multiple UDC =
ports ?
android-tools-conf-configfs: handle multiple UDC controllers by shoudil * P=
ull Request #1022 * openembedded/meta-openembedded<https://github.com/opene=
mbedded/meta-openembedded/pull/1022>

Best regards,
Shoudil




--_000_LV2PR02MB11156D8117417F9CFAD864EB99294ALV2PR02MB11156na_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Aptos;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;
	mso-ligatures:standardcontextual;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#467886;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-US" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi Maintainers, <br>
<br>
Could you help review this PR to fix adb issue on boards with multiple UDC =
ports ?<br>
<a href=3D"https://github.com/openembedded/meta-openembedded/pull/1022">and=
roid-tools-conf-configfs: handle multiple UDC controllers by shoudil &middo=
t; Pull Request #1022 &middot; openembedded/meta-openembedded</a><br>
<br>
Best regards,<br>
Shoudil<o:p></o:p></p>
<div name=3D"divtagdefaultwrapper">
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-liga=
tures:none">&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-liga=
tures:none">&nbsp;<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_LV2PR02MB11156D8117417F9CFAD864EB99294ALV2PR02MB11156na_--

