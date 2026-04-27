Return-Path: <xiao.zhang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70C2CFF8861
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 07:01:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37698.1777273269182880254
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Apr 2026 00:01:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=IW78n7Ph;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=857713b235=xiao.zhang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R4hqUR2793495
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Apr 2026 07:01:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=DKZno0+NdrQRIely1eMj
	sXKmfvgpFQ18yG14UtFCVyY=; b=IW78n7Phm90saYKXu6+ZwMQ/lCmn9gdY9KZc
	DklNeRPgh7/iY15kOI6ZBt/+hG1JKxh/DdfbR0oM0jOrOpNxEP8eUiTVaq2b67AZ
	L3Dw1oS4UgHKgMtHEmAAulRhLqvQ3Fc93qeLafEuMEe1A3JOwQPfw0XFry+Ipluu
	0DuUgiv+IhyIL6SezR2POC4WrOhON8ITtZ6+c9WA2tv2X27LinMovAT4LV2hldlt
	27oIMARgN/8bZ39kX/9e6ZTF6mg03WhhZbs4WhQv8DobdktqeC+fOIYA4sPNMvWF
	3kkPGRXmg+S7g4JaR3ZmTlPrFWVJaffIcMLwgiy1J7U9NGb4tg==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010036.outbound.protection.outlook.com [40.93.198.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4drju09q5g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Apr 2026 07:01:08 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hmAb1WtVmn1E03YcgRm8AOkWkDg2676PYOZ+N0Bn0hw/sGCMJlTzOop34SfANZo17xq6uLVqTCbZD/pWr7NYlh+cDrD/fPr5OIZDGriD/wSoUwU8eBaj8fJa4tZ7Rpxg2+J0jkAylAvnLCrFl9OI5HZO+IzUmZsfqQaKfGpBurfiiG2FtLYnBXbP8z0XqDp8f9Mj35FPE2rg8lbmzXgLKKHYtkNF3OEak8jyDlCflDFfX58O48bSYBxMO4PQNg0im+n2DVyMsPp5MCPFtlkmbrXjXXenPZOwEAuDNmVuF/0Lw8IIBWGG4zZV0HIUi3zYaJLaa6rppMHNFBv6ZvwIrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DKZno0+NdrQRIely1eMjsXKmfvgpFQ18yG14UtFCVyY=;
 b=J4xC6glLIU06vAp/1C6WVrLHqMgLSb8NeZ2jLN40E37N2/D++ScwAh9ERp46GFtryxqbzlrdsECIiFShvAi2JgCOR1oDjc4D9m2nAO515ZALdqN3Fygi/UwqIGk9H5xP3mv9o14Xea4pl9qBrgfEE0VgHIp7zdk2oq2/bt5YR626JNHZBdcjTYE4heUnZm3ggRSbGZysPyJwp5MBgC36ZO7yIHaXVzgyV1sO32I9LIk3DnXUM8w4G5WwLh314n/agiOGI7dQ92FJOqUYSSzA8KTu7LaqLBjFFy+IdCdjQQYZ3uUfWToC18pnq7QJ4U5GWmGlR+eINYpWFyk9GuM/GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB6080.namprd11.prod.outlook.com (2603:10b6:8:84::8) by
 SJ0PR11MB6719.namprd11.prod.outlook.com (2603:10b6:a03:478::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 07:01:04 +0000
Received: from DS7PR11MB6080.namprd11.prod.outlook.com
 ([fe80::675d:2fe5:276a:f11d]) by DS7PR11MB6080.namprd11.prod.outlook.com
 ([fe80::675d:2fe5:276a:f11d%5]) with mapi id 15.20.9870.012; Mon, 27 Apr 2026
 07:01:04 +0000
From: Zhang Xiao <xiao.zhang@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe] [meta-python][PATCH] python3-aspectlib: Fix pytest compatibility
Date: Mon, 27 Apr 2026 07:00:57 +0000
Message-ID: <20260427070058.302371-1-xiao.zhang@windriver.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SJ0PR03CA0131.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::16) To DS7PR11MB6080.namprd11.prod.outlook.com
 (2603:10b6:8:84::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6080:EE_|SJ0PR11MB6719:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ec44653-eadf-43dc-a66b-08dea42abfaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	YpUc84KQqGiFVc7z1ZxVmXoAKxxz0c3vJStzzCa43uPfYWmfWHbdQofByGBeBjeUJnIpyvQ4NbFaFukBzqeH0LRtPmXXG7FRIezotNh9ihP5HZytczoC7htwh3SUFI0D3TgXUWqKoFBxzNLkzxJjyDxGCDc2XbSw1rFUbdB/YkuZhSEi0kHkk3PXAd4+rwd+vjDqpzQmhjm8bk55PMCfwWvvY6qdCNI8maXdvaIIhZ+v7nMG+Mo21XtEyQRKt+wxhycfHg0inznbVQexHiYdTrsSHuk5yRH4mg8CR40r43SGxOmLn/QijTnHWiqBhD2nRLF8aF9lFTz3bCzkTGHsnA06hCuEEQAmn0rV/IWu1iIenPTmb2rAxstOhtHZEzhK7C6UWYPNTh7FWPP122QqrD4evuWxUc0HnK+I/+bHobkC+mLlIdTxqht/4dx9Cd9SqG/HfpkDA55NVKiwCjGBSA5g41eIu4RUq0zn6UcrCC1dEvjCrtCKMUop89xCJhAAoqHqsUpVOk2d++F7eV1cwwCqcihVr7WcF8AQHXfekymz7Pz6M+fiyl/m8m41ZthciXZyUwEZFH6ylR7AAK05ZAUxq5f8L1rAJKE5ZIRAETYj9kthoFoAPBGevDpvmeigYXmGMsCGQ3rVMy40pSHVXWjmaMhyrs3OZ8zcYyuXwdhL4yRbhQ64D5pLH8N+HCICGMrMuq5F6jRUwqKiexzDkste8oDpv+L4rwvdqR778Bd7rFHRvbvPmkAg5aahh6Bc
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6080.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZWc5bDhwOXpRZW1wZExyNHp4ZXRuakxkMEFoSGFNTnlBalFFTEJrcEpxeHUw?=
 =?utf-8?B?R1pzbU04elZSRVJRWnJacnZtUFhDU01SRFBsVGtmbERnTE43Y2EzVkpLdzRZ?=
 =?utf-8?B?NEpRMUJCSnltS3VFcEQ5eVVDdVJ4Q05JZFJoaHZMZFZOQi9ULzF6REF1OVh3?=
 =?utf-8?B?UEVPRVZUVVJNMVlFbGJrNnFmaStpSDR2TmtmWlczYlFUU0RzN2tKd2d0cS9z?=
 =?utf-8?B?ZEhZM21nL0w3dXJBdHVWeHZXaktFNVhVZ3A3TjVJR2Y5Qzl5dTRuVG8rSjlB?=
 =?utf-8?B?VEtlV0dCVEtzQytiTGw1S0swZENuaEFEOU1tWG5KYXNpSnBDSUZMcjRBdVI2?=
 =?utf-8?B?M1F4T2JlUzdMc3BKa21LNWk1ZHhuRWpXQklnU0h5S2lMbjRSWDJFRHFXbGdx?=
 =?utf-8?B?Y0xMZFBESndUNFFORHhyTEZ5aU9NbnkzNWtaelQ1U2xQQ21qL3cvVkdZVTlM?=
 =?utf-8?B?T0ZqbGZROW5NN1Z4L3pGM20vUTJWcVIvWWxoZlVQZEdCc2ZsWk9pbWgvYito?=
 =?utf-8?B?TDVCSGJaOHU5SDlsV2JRdXNHcy9hNWoydTdlMHVRQlVma0Y5S0E5U3Fwc01m?=
 =?utf-8?B?TG9JWlBvTmxLVi96M3NLMFBxWC8zUjRNOTNDWDE0aGF4eW1jRDFoRzZNRDBj?=
 =?utf-8?B?Unh0REM3S3BkWkRqUWdlZzZmY2FMSjdENUsxOHVCS2oxZjlpWjBWbmVLSDJ4?=
 =?utf-8?B?eXhmN0pQVmVSREtRVVU3SVQ3Rmg4bmpJaXZvdDFudERIMnZ6aXFSWnlnQitx?=
 =?utf-8?B?M0RWR2xxWTFPdnZVTWpGZlY5NTJRU0hoZ2JGaGcrVGFuR1MzUk9QcXM2emh4?=
 =?utf-8?B?eEhrUDRZMXhKZ3NFSFIrZnZKRU1qdEhRZG5iVElkSndoOXpiYXNMTE92V2p6?=
 =?utf-8?B?NFBJQm1uWXdmeVFuYlJFT0hhRDdTQmRhaUhQSmpLb2UwaEpJUGh3S0V4TlM1?=
 =?utf-8?B?R3dSKzBoVFhxdjdwZFlyb2ZkZUVhWDU5V015T21BNzhGZmVaY3Rtd3BzdHhm?=
 =?utf-8?B?VVRtWjZnMTNIczBOYlVsQ00zSTZRdEVHODhRREk2Uis0b21pd1RwN1YyT0ln?=
 =?utf-8?B?T3lhZkRZNVpMYjVaMVB6WVc5UVVuSThLSVMvYVQ3MzRsZGJQSWFqMFp4Y2x4?=
 =?utf-8?B?MGxTQVorTEJZTmQrb3VUbFpFSHMxSTZkT1hteHJuQWZPTmdMM2tkdEg4ejFy?=
 =?utf-8?B?WVFWRnB4Z3FBeFVFK3BnMVBNTW8rUGQ4WEJ1Y0JnM3NLNDdtb3RnK1FLYkdR?=
 =?utf-8?B?NVRuSTdXV0VtWmo4eE53eXN4THEzb2s1QWV5UE1FTW9PV2VmVHBEWmtpdStO?=
 =?utf-8?B?N0tSS1JocUlCOEFZQ0k2Ly93TjdpWDE1Mm51SW9sZFN6b0NsZU9qMjg4L1Nx?=
 =?utf-8?B?emhXQk5jTW4yRVVOOEU0TjNUT0tVVGVJbFhpRVJOUmozdzdSMUthSXBNbk9M?=
 =?utf-8?B?YkhpZjNEMTdWY0RSdWkwODZ5bk1rZUY0YjRTMmo0dmRwRlE0aUkrcmpEUVha?=
 =?utf-8?B?SXVHZXZ3U0RoVWRkL0syYnZKeWlpYnF5eCtzR1hxVkhYNEtJMmx3cDF5MlFG?=
 =?utf-8?B?OTRSd1hDQnp0VCtIUjU2a2VsMDhEdml5Y1VzbjNZN2ptZjZnMTNPRm5FeWhO?=
 =?utf-8?B?R0dQN3FiSEFLZXY2N0dKcC9tejJ3c09KeGpoWHBHZ3ZwTW1LN0VobWpndmdt?=
 =?utf-8?B?ck1iM2R1RzNrdi9PN1ZRMldqdHU5V3AydFJ0S282cytCOVAvRGhjakxlMFdy?=
 =?utf-8?B?dHQ4ekRaRGxLMGRCRi9RdWlMM3N6UmV3K1F2eHdQSkowM2pwY0pmSXFsWEdC?=
 =?utf-8?B?TzNTeEFobUQyZldWVlFjMTVRTkY1dXZ6c28wVlBlcFppVGg3R1VPaDB5KzlH?=
 =?utf-8?B?MkRxeXFkNUI5djBOenA4UFhZTUFFckYzYjRBMzhKQWpDenR6YzMzOFVPcHo2?=
 =?utf-8?B?QjNkL1M5UHQzUlVuWjRSakxITENjRHBnSTZCUUdMNXN3VGJDdStuTGozMFZy?=
 =?utf-8?B?OEtTaHhicjlPT3hrVDU4d1BpS1dyVDVRckRnT1kwR2tFSWVDaFROT0dEZEZm?=
 =?utf-8?B?SkNkSmNQeEdUOHFyV3FvWFp3cm1weUpKeVo3UkE0OEExbnYzcHVmRGZGem1j?=
 =?utf-8?B?Uytscmd5TG95Uko4NkdibnFsSHdONFBYb1p0WWZWaGJmemNxSGJiSTd3Tk4z?=
 =?utf-8?B?Q2dBRmdSMHdBcWVHUTdORnBWUjllbHVYOUpJbko1WXRjZDZQSDBmbnVmRkJ0?=
 =?utf-8?B?UEpOYWFyQ2RxN3pXZkk0b0loR1JFYnpCWVR4Sm1vV3lPYW1RYm9BQys4dUhX?=
 =?utf-8?B?bVVybGFiekNCdmVsMTJudUlBRjVORVdTczJva1F3SjJvWFozem43OERwRW11?=
 =?utf-8?Q?SAgi8IiqkDxfJOGA=3D?=
X-Exchange-RoutingPolicyChecked: 
	uhy8jDjq9gQ+7WsIrVhDEj20ntFkRVNhBMHmf6ozVIbLRu8pUFvKU77psiNk4Z9Mb10rNZ2wulcf7jjGQ3QDIbY9OO2meAcOsHvhTCwD1rZrfvZVmWHXCg98xKD+SacLCI0TkgrckbbDdgMaFnsw7P1Q1xuAfNo/j179Wcwj7Fg707lDN3Dhhd4UPX/ocEwCzRJm3o4zUWs1HpWh+AJhdc9+DcpZdeMxmtHGvvPO7OuagoqHv/2tL/BBdOgavr5kCz8zWmaTi5+lNE3k/MwPS5EXHcnD5dRz7k9F+inmNFlW0UYLqWtsX8m0ws916TWnPcO+Ew/fFjhgxieJR04ClA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ec44653-eadf-43dc-a66b-08dea42abfaf
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6080.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 07:01:04.6339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kHSkI27vPbqUDGKH831Thj9vDbhju9QN9r0lCo6XNyxhTjMryVnILgOfI2CHF11uceZCPRGUCNaQqSutdz+F2l0Y05FjABDvvWs3Z5OmBY4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6719
X-Authority-Analysis: v=2.4 cv=J+SaKgnS c=1 sm=1 tr=0 ts=69ef09b4 cx=c_pps
 a=6XMsudVPN6gIPUAaaOvvlA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=Ujd8b4A6AAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=O8qsM3uNCzvEDnAuQKwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=-TmhFAHAl66zCO8_Mo53:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: f3jrulEjI_JfHayAeCqpDD1jAyXhrtoU
X-Proofpoint-ORIG-GUID: f3jrulEjI_JfHayAeCqpDD1jAyXhrtoU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA3MSBTYWx0ZWRfX7MYQubgF1yln
 CYmvjMiHMdej5uUCoL6HH5DMxpVsaDApfkTiLaT3+G6ONvktRNpPrPRIXwfNHGi236Y97DMVTTe
 RIXFeA3AXEI+J1HloiQ4JowI+hAuKtio3siMtEhfqnkJrAMPJWjwUTGXUqSGcpem7iNWo/bCXsr
 DYAVGJ/afwNUA0hsjDp3CliKIlPWUxDnIZYtlN0Fd70Iz/dgB7NLqFBDxXD7W5INN3NGE7sOP/1
 p/0MXu3wLEQC4k1GvZFbT1h+LwdSNw54CkeOs0GV2mO51F70rxjkbhH03NhnHkF2FMTJ2FaSlzk
 ephAouTyyM3OkrZKA0GM+4AYZLYRxka8PYV1pNm6nwyzkuJY+V5JOSY4Enfdw4ksyI3u+xPNYin
 vCmZjyMRAuIltbqdzoGxo5w7Chakl7TlVBN7bHgisQXGoPKxrLkDYGK0oAHHOGwH6SXI3AoPBOX
 TaMhRSrGXIzcL0tglmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270071
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 63R4hqUR2793495
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Apr 2026 07:01:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126633

Partially backport upstream commit to fix pytest compatibility issue.

Fixes pytest errors e.g.
  | pytest.PytestRemovedIn9Warning: The (path: py.path.local) argument is=
 deprecated, please use (collection_path: pathlib.Path)
  | see https://docs.pytest.org/en/latest/deprecations.html#py-path-local=
-arguments-for-hooks-replaced-with-pathlib-path
  | ERROR: Exit status is 1

Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
---
 ...-aspectlib-backport-fix-for-selftest.patch | 37 +++++++++++++++++++
 .../python/python3-aspectlib_2.0.0.bb         |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aspectlib=
/0001-python3-aspectlib-backport-fix-for-selftest.patch

diff --git a/meta-python/recipes-devtools/python/python3-aspectlib/0001-p=
ython3-aspectlib-backport-fix-for-selftest.patch b/meta-python/recipes-de=
vtools/python/python3-aspectlib/0001-python3-aspectlib-backport-fix-for-s=
elftest.patch
new file mode 100644
index 0000000000..05d7b63126
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aspectlib/0001-python3-=
aspectlib-backport-fix-for-selftest.patch
@@ -0,0 +1,37 @@
+From 2e007c5c3ed048491c29e37991e6788f41728b31 Mon Sep 17 00:00:00 2001
+From: Ionel Cristian M=C4=83rie=C8=99 <contact@ionelmc.ro>
+Date: Fri, 24 Apr 2026 13:17:54 +0000
+Subject: [PATCH] python3-aspectlib: backport fix for selftest
+
+Partial backport of upstream commit b85abdb056("Fix some cleanup regress=
ions")
+
+Changes excluded:
+The stacklevel assertion updates in test_aspectlib.py and
+test_integrations.py are omitted. These are specific to upstream's
+test suite configuration and cause failures in this environment
+without providing functional value to the core library.
+
+Upstream-Status: Backport [https://github.com/ionelmc/python-aspectlib/c=
ommit/b85abdb0565d1598ce56bd49d49dc709d4e16081]
+
+Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
+---
+ tests/conftest.py | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/tests/conftest.py b/tests/conftest.py
+index ee54d9d..29caa50 100644
+--- a/tests/conftest.py
++++ b/tests/conftest.py
+@@ -1,5 +1,6 @@
+-def pytest_ignore_collect(path, config):
+-    basename =3D path.basename
++from pathlib import Path
+=20
+-    if 'pytestsupport' in basename:
++
++def pytest_ignore_collect(collection_path: Path, config):
++    if 'pytestsupport' in collection_path.__fspath__():
+         return True
+--=20
+2.53.0
+
diff --git a/meta-python/recipes-devtools/python/python3-aspectlib_2.0.0.=
bb b/meta-python/recipes-devtools/python/python3-aspectlib_2.0.0.bb
index 854a14441c..7bfee7ff7a 100644
--- a/meta-python/recipes-devtools/python/python3-aspectlib_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-aspectlib_2.0.0.bb
@@ -8,6 +8,7 @@ HOMEPAGE =3D "https://github.com/ionelmc/python-aspectlib=
"
 LICENSE =3D "BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D80721ace117fd1f814049ecb81c6b=
e76"
=20
+SRC_URI +=3D "file://0001-python3-aspectlib-backport-fix-for-selftest.pa=
tch"
 SRC_URI[sha256sum] =3D "a4b461b9da0b531aebcb93efcde3de808a72c60226dd8d90=
2c467d13faf7ce92"
=20
 inherit ptest-python-pytest pypi setuptools3
--=20
2.53.0


