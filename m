Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68A16F36BB8
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 06:23:24 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.150206.1775802202138327259
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 23:23:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=S3B1TYJc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8560adcec7=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A4wmvw029598
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 06:23:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=sfn4zO0IxKQof6oLmsYzKkNFgyxDWmB7GtYeGzzAJQ4=; b=
	S3B1TYJcjO07KY1F4EmZgY3JADcXWfT5spyjQMTDhBonXOMh92IkVlsbb15GiOGv
	/XIMOucZ/VkDUvqjr884+pul0fT3PHQdsinrm4Ph3X/dwAM4Ix5aLnkQp/mpqSG7
	aD6LeRHBQ8Fbyk3+CetXUCIoQaKXTveL/276N5zWRfSNwKBqoVUBK5jzIvWWLLB7
	eo4ompYICd9BXW/htMi84hQQ7NYZfUvx4rRvnuHdgweR8TLLxEoO5NUNU+wKpwXs
	QI10eqssYggbaLGkFYAYiMALydduNDmmWxh1khgf45ZwgVJIMkWc3GLXxsCS5l/w
	5N7d31ODKzHaUtiFt9rHcQ==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012038.outbound.protection.outlook.com [40.107.200.38])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dcmryd5v4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 10 Apr 2026 06:23:20 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T3pNRwoEg72TpByafknfFewsOoA00HdXq554j97A6DEkk+tX0xUQb/Q8eIrBiTar59DHisYcY24KJ/fLc/ZCVnVAP0JxSvPgjYytUq/4Sa6LzleeULhrYveF1AwZPUxuk0PGozaItUqflnFnL/fJPVGHoRnTxbQCDiuZ9x/OtQ2XDpPSgWvRBD3M+9u8ii07Rba/+uJZa8nhSAi34Gdrecgg2E9rmSB/mM2Fkk3qfFxUP3wVF1sUKA9tHCCaSeu8N17FFHUEeV2CHJQcrdKuxfI+M2zr2CBy9XsW4ZNGGOq8FLRp8h3455O4En3QAqoUdJQlgY5jg/9QSKH5/uYOjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sfn4zO0IxKQof6oLmsYzKkNFgyxDWmB7GtYeGzzAJQ4=;
 b=lwGDsqSOQlOqYWYC9/ZB9JTfvbbqQT6HaPv94QgyTcgpxL8JYxoSOkAo1vy1rpPVggrXQBmz3WuM0RQME+UR+nVvfZn8q6myiOJwGgTQUYQIsX5ia3vmaANahQAD4MlFeJPgR89rSlMOIllmz1stv85+Vo7RpDRNFkOyPUOVRlEefMOGL7R6kHzs2PaIyIoNn1OZGZ5tPErddx3bOvxQjFJGakccB7P9UqCPNVQxDampCxkhl5Fy+nSs3LjoE2YBKWcf5Ed6bCcz8d45jEiexaeKe4a7AahTJm+aRGKJ0tKDTdPMqLY/XPLLFyRdnXjLU1slSjzDoOwZ457CZ/Qvvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SA1PR11MB8428.namprd11.prod.outlook.com (2603:10b6:806:38b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.41; Fri, 10 Apr
 2026 06:23:17 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%6]) with mapi id 15.20.9769.041; Fri, 10 Apr 2026
 06:23:16 +0000
Message-ID: <25ab0aec-2573-468c-b01a-6e872cb3fde6@windriver.com>
Date: Fri, 10 Apr 2026 14:23:08 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking][PATCH] freeradium: Update to latest on 3.2
 release
To: raj.khem@gmail.com, openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
References: <20260410051518.425767-1-khem.raj@oss.qualcomm.com>
Content-Language: en-US
From: Yi Zhao <yi.zhao@windriver.com>
In-Reply-To: <20260410051518.425767-1-khem.raj@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0025.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::12)
 To DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SA1PR11MB8428:EE_
X-MS-Office365-Filtering-Correlation-Id: 03df67eb-e53f-4d96-825c-08de96c9a635
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|4022899009|366016|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	iLLMhguweEfq71oD5EqkxEV7JcIaxUFzKHTpMO8OZa5wwhGoofHsaT6935wPz/qfZLJH65azd3tZcdZs/jHpGCMppthZz/lmqB+0w4rufznifkfDZf1Tzj7kKN/TgLfltqxJ3kO9jvasByYH+/Jzzdg/Kz5NwrewZhuCZFABLMhFBf5aI0GJfLBIJ5M8vnIQgumYqpHW0/PZQDAb9L2z2oIKB1iOZ3DYt2+LXPuh4kJQwXWh3EaDvjOZd2SYaR5aEgoda+LCcqLlE2xNMJE0sYc/lZXPZzMLhnank/jH3mGQURQ9KvHDWzDCjPN8MoWJWt7qGimlUC81UC+kES4Vs2DfBTKOEtVSzQ6WmcrOrvn/d0Qfl8ZoSEcaJKsgOmL5Z+jLUoY8uF52OSGoWPmTPJONRXlYN90hLS5IdKxsmwXXbZ3ZcpVIxn0WfCBuzsp+ChR2vLkE9H3EFlKCwr0DpYY3OxaDfCEuYdSstCe8XrbDVOw3PcMJopHenBbUCpjnQYIbqp5chbcMxp6/y9Zg4Ts756MjkQhjsmrYf0H1vCamizic+u1/p+L3lurOAMxFojGfdYxTusQg76q+Bqbe40f3bbD6SgLKvyQhIqoX3BpEhkLw4rftefyVH9KXB0Vfmwt/dAT15SckqhzTm5zuFBUmQftPGWcbhjP2wYqwTM+eMQ8axxCDcNElqov92T1Z
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(366016)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Q2FPYVVyWjRRRG4wNzUrVldxN3hlUFhFQlJiU0xobjBQRU5qOWV3TlYyMndB?=
 =?utf-8?B?ZDNWcGR0UldlNHZSUlo3V0xSOTh2bE16Z1lEaXg4azZwM1F4ZnNvOUtzeTdr?=
 =?utf-8?B?RUVwZHZjY0hJNzQ3NGZOb25ZU3ZVUjVLTkFPVnhqa3N2cFFlWlhONTFrZzhv?=
 =?utf-8?B?ek03b0NTLzByTkh4OExiVittME03TzBkcHFqZmNqSXVGNlhDS0tRZ0NGdk9u?=
 =?utf-8?B?bDF1U1lIdko5ZnlNTEFUZjV6NUZHaEU0ZzlraWMzOWE1SkN1RHZNZ3NEVnl6?=
 =?utf-8?B?Z0k2VWc0Y1pRTmQ2T1FrelRaY25MRlp1S3RhQzYxcGxkSFlCR2JkNTUvVjV2?=
 =?utf-8?B?S2NzZmlCeVZsVVpPQ0tSNkRlTzdvck9ibVRIU29hK1ZxRlM0azRhNm03bW42?=
 =?utf-8?B?Si81L3RFQjliRXJ1RUMxMzVsSkQ4aFdDdVgrb1JMcEtNVHdmclRvcS92VWN0?=
 =?utf-8?B?Z2FaQzdRTTNMbWNKbE5LejU4VG9hUXUxcXNQaHBpckk4UDFuTllGNVJpNDFV?=
 =?utf-8?B?WG1Ia3k2U2FoaTBjWHdDc0VIbytIelhudDdjNmlSejU4b094bVJzOVVJbEg2?=
 =?utf-8?B?dGpFNjdkeVRYMk1SZVU2RGtKY2NreXNZQlNWNEd0TStKWVpGQ0xoK1JLeWdt?=
 =?utf-8?B?MzUzdVZXZjVleE9YZTYvVThWSkliUDhZNWY1L0NhTkJmN294VTVsR3BlMjd5?=
 =?utf-8?B?M09sMmRCbEZ3SWV3aVJUNys1VjhXZ1ZUQlBmUWdVZDFCbWptcVBEeWtnbU1v?=
 =?utf-8?B?QTUyME9WT2c2aGlsVUVXbFFPVG5xVjF2OUZ0a3FPN0ZBYWFJOHR0Nmc2L1lr?=
 =?utf-8?B?TElrZXJSb21kZzVTNkVrcFNicnRhaGtQUHhwQXB6bVhjSWk2c1ZhMURUc2FE?=
 =?utf-8?B?L2lQMGdYc295UTB3dTBjamI2L1ZPZXUzdncwVDlGOTJIVE1laFMrZVVxOFpP?=
 =?utf-8?B?OHRJNjdROCtnRW5jMm44ckIycWd5Ny9ZdU5GNDhHWkl4Q1BiYU9SUnJiY3RM?=
 =?utf-8?B?cXlOcmZLYWJTNlBnaDd3R21oRG0waFBKd2MwVmxsUzlNUXV3Tm9Dd2xUR2Nt?=
 =?utf-8?B?akpQMDBTclkyV29NNUNRekR1K25nTlVsMmhwSnp3L1M1OFY0L2RkbGNkbm5U?=
 =?utf-8?B?N2pjd0hSYStkTStQSXhpOUVTdDhMUDQvQW5uMEcwemZyVVhueFM3dkdzbjdI?=
 =?utf-8?B?Y1hQNGlwS3FMelNlMWhrbXV3ZVRHbElJaVYzWGxDcmQ5YlFIejdSdmNubEJ0?=
 =?utf-8?B?aTBvaWUyZERtbzhUbmhBNHQrSC9qcjhrNzhjRy9nU3ErRE9XMHRUR3dNOGNW?=
 =?utf-8?B?dHZ1NXYrZVdFY0xRekpkUUFtVld5dG9JdXdrNUtJL0dpREp6YzU3Wm8wd1dn?=
 =?utf-8?B?bU9YUkIxNEZHVWJabFN0UGFUaC9YUXg5K3BTdkovbkN6NVJMVDZCbUJNUUxJ?=
 =?utf-8?B?WUR5UENJallkcjZnUE1RZXRsZVNpSFFNTzh6Ukg4TGNBSnNTcjhCYkNZRVdZ?=
 =?utf-8?B?QnFnR0dWKzRwc3FzSk45dWQrUndjNStEMlFmQ3FrMUl6QUdjb1plV045R2sz?=
 =?utf-8?B?aWhvaGlKYlUwcVBiZ0FvcVNZbnIyR1VsQlhxeGxDWjR4VmRMZERrWVNwd1dX?=
 =?utf-8?B?ZThndmhjL1BjUzdqV3FpcjJyM0Evd2tUSWVqbGJiOFBPYmd0U1lXaXkzTjFs?=
 =?utf-8?B?MTZUUDc5SWgvWGtxNU9xR2lvL29YY2hSWHFpVzJmazE4UmhKZGQ0aTJ3Z3o0?=
 =?utf-8?B?QkphbnZ5eDlFVVFVSWdLRm8xdVRxd290R0J0V2g0L09sYjhlTVRVVlMvbUhr?=
 =?utf-8?B?LzJZOU9GZktiZVI3amNYdCtVNDNFYklkZzBibWN1ai9CK1ZUbURsRmZPRDJl?=
 =?utf-8?B?cWpUNVBaYnYwMk9nVyt6WjhmR2VuTHV5WENVMzNRT2tZK0RHRjQ3QlhoRm9T?=
 =?utf-8?B?a0llWWlXbzhkaUQyUmpmVXU2M09GcWlOMHZxTEUxbTlzSlVpSHNDazFJbzNv?=
 =?utf-8?B?RisrT281eVoyNUZwSFUrRDZCSzltcVZ5UzlSY3BrOWZLSWZxOUtVSDVRRkVn?=
 =?utf-8?B?Q0gzL3lCQjRGYmltZlE2bGZuT04yWGl1UUo4L2s4eWdJd0dDTUloL3EyR0da?=
 =?utf-8?B?dUJaMXlOOW9VTU9PTm1lWC9IWk9LdkZpMU50c0JxOTdZMjlXN0FFclNlb1hH?=
 =?utf-8?B?dUlmYWhQN1hpanhHTms0OUx1dzdKaWVxY1FmVERUbEZua05MMlNZVUtLMGhi?=
 =?utf-8?B?WlNiSnN6M2hiNVpSdzI2am9RdHIwUEtFVmpBUUNJZGJuYTF2RXZhM1pMMHdp?=
 =?utf-8?B?L0dkKzlHejcyc3BpajRka2QwT3lna3BxU0ZtNUVSSXhYbENpVDhVZz09?=
X-Exchange-RoutingPolicyChecked: 
	faNLTQl3HcTQuQWS45SxOnnr3KEaHlidF62A4H21TLgHDc61hnSeu1S1Rx2fft5AjCdrvOzT4q2fjkyq5uMlbCBx9+qygu6ZDEBC3eoUdEEBlLi1qc2y87xaEax+e4iUSvxtLNqKa3kN2OLOT3giPCg+hYESVV0toL1jZsX/Daz1FKJ3Y4zpTbVgYUoMxoXhZd56H7NAwgNMzcpwOFmhWwGTjiKMBIvjdImLYoDp1PdjdAT9A/x+CRFD83SvkJKAxG54N297PtfAxtbw1VOLF21NMNvkk24DrhdJGqCIGJknSQ9CGMNfmf63eU9/4D2n7A8uo/EImpDdmdkg5PGhEQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03df67eb-e53f-4d96-825c-08de96c9a635
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 06:23:15.8556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3QAmhOxGaJrxv2U6NOp/HsmydSTv43xuasOXuPjBns2NnUFF4Ztx3m4C/zz9OXg2H3LrnD7FDs0lRay9DwnzMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8428
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=QoduG1yd c=1 sm=1 tr=0 ts=69d89758 cx=c_pps
 a=xHz2x/H0+t1Z4EfVAX8SiQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8 a=FcTRRU_JAAAA:8
 a=t7CeM3EgAAAA:8 a=07Z4HDr4AAAA:8 a=rkQD3D615oqKLhvT6Q4A:9 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=24chkg8mTlgNITX-x-SQ:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=9HVVtDUExptghyUDL4SE:22
X-Proofpoint-GUID: TvxiJduw4FEj_XGyRbkVvA7mZBpwo8Vl
X-Proofpoint-ORIG-GUID: UcrppU31rCnulhLcNxv7RSwudZaHA9K5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA1NyBTYWx0ZWRfX7jMLse+R7bFv
 qpFAAzry0JkxERSsY3cwrUI641/l1ZyTSIFovCb9i6Cck0XHprc96Geq8MQoab0g7RcFCXANj4z
 gRSH/C5E+iLJXlzREYFxg9X8lr410xDyyTzxRVwc3FfwuFXwUhxkz7m9bCzIX2R2X1tE+YIOVgN
 JmU0YMtt/gdf/X4NhXDZ0ilv+UmEDQqUPmMpeBZX7zmHJuTzNQuKptqf9eLVndS2MJ95BxDBljM
 0xzBRJxaLXj0RrzpVcdXzkN9Z517CfK/J2QZDV6t9PYnsKi5PsBsVZDyMg681xSOcAOXMJ1TL7C
 QlK6Y/OTwcpsstmlaDHhowFl6pKM8g6ShH0WEoyr9ZvlQXoo9jTNTnb6vZosmLe3SKgn9sNLt5W
 qBquA3Vs2rt6RmqY+fN/oKSUUtFsJj4+d+HRSLuDc97UmyAaPV7HM3An7CbePdbX9/CeligLOYl
 FZt49VSBOISpi4ah32Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100057
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 06:23:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126214

A typo in subject: freeradium -> freeradius


//Yi

On 4/10/26 13:15, Khem Raj via lists.openembedded.org wrote:
> Drop backports which are already in this SHA update
>
> Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> ---
>   ...y-provider-on-enable-fips-workaround.patch |  62 -------
>   ...y-provider-on-enable-fips-workaround.patch | 104 -----------
>   ...r-for-expansion-of-macro-in-thread.h.patch |  61 ------
>   .../files/0018-update-license-1.patch         | 175 ------------------
>   .../files/0019-update-license-2.patch         |  52 ------
>   .../files/0020-update-license-3.patch         | 101 ----------
>   .../freeradius/freeradius_3.2.8.bb            |  12 +-
>   7 files changed, 4 insertions(+), 563 deletions(-)
>   delete mode 100644 meta-networking/recipes-connectivity/freeradius/files/0001-don-t-load-legacy-provider-on-enable-fips-workaround.patch
>   delete mode 100644 meta-networking/recipes-connectivity/freeradius/files/0002-don-t-load-legacy-provider-on-enable-fips-workaround.patch
>   delete mode 100644 meta-networking/recipes-connectivity/freeradius/files/0010-fix-error-for-expansion-of-macro-in-thread.h.patch
>   delete mode 100644 meta-networking/recipes-connectivity/freeradius/files/0018-update-license-1.patch
>   delete mode 100644 meta-networking/recipes-connectivity/freeradius/files/0019-update-license-2.patch
>   delete mode 100644 meta-networking/recipes-connectivity/freeradius/files/0020-update-license-3.patch
>
> diff --git a/meta-networking/recipes-connectivity/freeradius/files/0001-don-t-load-legacy-provider-on-enable-fips-workaround.patch b/meta-networking/recipes-connectivity/freeradius/files/0001-don-t-load-legacy-provider-on-enable-fips-workaround.patch
> deleted file mode 100644
> index 594286cdcf..0000000000
> --- a/meta-networking/recipes-connectivity/freeradius/files/0001-don-t-load-legacy-provider-on-enable-fips-workaround.patch
> +++ /dev/null
> @@ -1,62 +0,0 @@
> -From 2c2c6a460ae8cc655df83c8964595581389676c1 Mon Sep 17 00:00:00 2001
> -From: "Alan T. DeKok" <aland@freeradius.org>
> -Date: Tue, 9 Sep 2025 07:03:21 -0400
> -Subject: [PATCH] don't load legacy provider on --enable-fips-workaround.
> - Fixes #5644
> -
> -Upstream-Status: Backport
> -[https://github.com/FreeRADIUS/freeradius-server/commit/2c2c6a460ae8cc655df83c8964595581389676c1]
> -
> -Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ----
> - src/main/tls.c | 7 +++++++
> - 1 file changed, 7 insertions(+)
> -
> -diff --git a/src/main/tls.c b/src/main/tls.c
> -index ba267983b1..c04f3228e4 100644
> ---- a/src/main/tls.c
> -+++ b/src/main/tls.c
> -@@ -64,8 +64,11 @@ USES_APPLE_DEPRECATED_API	/* OpenSSL API has been deprecated by Apple */
> - #  include <openssl/provider.h>
> -
> - static OSSL_PROVIDER *openssl_default_provider = NULL;
> -+
> -+#ifndef WITH_FIPS
> - static OSSL_PROVIDER *openssl_legacy_provider = NULL;
> - #endif
> -+#endif
> -
> - #define LOG_PREFIX "tls"
> -
> -@@ -3693,6 +3696,7 @@ int tls_global_init(TLS_UNUSED bool spawn_flag, TLS_UNUSED bool check)
> - 		return -1;
> - 	}
> -
> -+#ifndef WITH_FIPS
> - 	/*
> - 	 *	Needed for MD4
> - 	 *
> -@@ -3703,6 +3707,7 @@ int tls_global_init(TLS_UNUSED bool spawn_flag, TLS_UNUSED bool check)
> - 		ERROR("(TLS) Failed loading legacy provider");
> - 		return -1;
> - 	}
> -+#endif
> - #endif
> -
> - 	return 0;
> -@@ -3777,10 +3782,12 @@ void tls_global_cleanup(void)
> - 	}
> - 	openssl_default_provider = NULL;
> -
> -+#ifndef WITH_FIPS
> - 	if (openssl_legacy_provider && !OSSL_PROVIDER_unload(openssl_legacy_provider)) {
> - 		ERROR("Failed unloading legacy provider");
> - 	}
> - 	openssl_legacy_provider = NULL;
> -+#endif
> - #endif
> -
> - 	CONF_modules_unload(1);
> ---
> -2.43.0
> -
> diff --git a/meta-networking/recipes-connectivity/freeradius/files/0002-don-t-load-legacy-provider-on-enable-fips-workaround.patch b/meta-networking/recipes-connectivity/freeradius/files/0002-don-t-load-legacy-provider-on-enable-fips-workaround.patch
> deleted file mode 100644
> index 84b78320c4..0000000000
> --- a/meta-networking/recipes-connectivity/freeradius/files/0002-don-t-load-legacy-provider-on-enable-fips-workaround.patch
> +++ /dev/null
> @@ -1,104 +0,0 @@
> -From 2ff8eb44bb626e9e63f9bf06c3bcf3b34291c335 Mon Sep 17 00:00:00 2001
> -From: Yi Zhao <yi.zhao@windriver.com>
> -Date: Tue, 31 Mar 2026 07:45:16 -0400
> -Subject: [PATCH] don't load legacy provider on --enable-fips-workaround. Fixes
> - #5775
> -
> -Upstream-Status: Backport
> -[https://github.com/FreeRADIUS/freeradius-server/commit/2ff8eb44bb626e9e63f9bf06c3bcf3b34291c335]
> -
> -Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ----
> - src/main/radclient.c                | 6 ++++++
> - src/modules/rlm_mschap/smbencrypt.c | 6 ++++++
> - 2 files changed, 12 insertions(+)
> -
> -diff --git a/src/main/radclient.c b/src/main/radclient.c
> -index ea64486dcf..52555603e1 100644
> ---- a/src/main/radclient.c
> -+++ b/src/main/radclient.c
> -@@ -168,7 +168,9 @@ static int _rc_request_free(rc_request_t *request)
> - #  include <openssl/provider.h>
> -
> - static OSSL_PROVIDER *openssl_default_provider = NULL;
> -+#ifndef WITH_FIPS
> - static OSSL_PROVIDER *openssl_legacy_provider = NULL;
> -+#endif
> -
> - static int openssl3_init(void)
> - {
> -@@ -181,6 +183,7 @@ static int openssl3_init(void)
> - 		return -1;
> - 	}
> -
> -+#ifndef WITH_FIPS
> - 	/*
> - 	 *	Needed for MD4
> - 	 *
> -@@ -191,6 +194,7 @@ static int openssl3_init(void)
> - 		ERROR("(TLS) Failed loading legacy provider");
> - 		return -1;
> - 	}
> -+#endif
> -
> - 	return 0;
> - }
> -@@ -202,10 +206,12 @@ static void openssl3_free(void)
> - 	}
> - 	openssl_default_provider = NULL;
> -
> -+#ifndef WITH_FIPS
> - 	if (openssl_legacy_provider && !OSSL_PROVIDER_unload(openssl_legacy_provider)) {
> - 		ERROR("Failed unloading legacy provider");
> - 	}
> - 	openssl_legacy_provider = NULL;
> -+#endif
> - }
> - #else
> - #define openssl3_init()
> -diff --git a/src/modules/rlm_mschap/smbencrypt.c b/src/modules/rlm_mschap/smbencrypt.c
> -index 9a8a5ab777..531c40ec26 100644
> ---- a/src/modules/rlm_mschap/smbencrypt.c
> -+++ b/src/modules/rlm_mschap/smbencrypt.c
> -@@ -43,7 +43,9 @@ static char const hex[] = "0123456789ABCDEF";
> - #  include <openssl/provider.h>
> -
> - static OSSL_PROVIDER *openssl_default_provider = NULL;
> -+#ifndef WITH_FIPS
> - static OSSL_PROVIDER *openssl_legacy_provider = NULL;
> -+#endif
> -
> - #define ERROR(_x) fprintf(stderr, _x)
> -
> -@@ -58,6 +60,7 @@ static int openssl3_init(void)
> - 		return -1;
> - 	}
> -
> -+#ifndef WITH_FIPS
> - 	/*
> - 	 *	Needed for MD4
> - 	 *
> -@@ -68,6 +71,7 @@ static int openssl3_init(void)
> - 		ERROR("(TLS) Failed loading legacy provider");
> - 		return -1;
> - 	}
> -+#endif
> -
> - 	return 0;
> - }
> -@@ -79,10 +83,12 @@ static void openssl3_free(void)
> - 	}
> - 	openssl_default_provider = NULL;
> -
> -+#ifndef WITH_FIPS
> - 	if (openssl_legacy_provider && !OSSL_PROVIDER_unload(openssl_legacy_provider)) {
> - 		ERROR("Failed unloading legacy provider");
> - 	}
> - 	openssl_legacy_provider = NULL;
> -+#endif
> - }
> - #else
> - #define openssl3_init()
> ---
> -2.43.0
> -
> diff --git a/meta-networking/recipes-connectivity/freeradius/files/0010-fix-error-for-expansion-of-macro-in-thread.h.patch b/meta-networking/recipes-connectivity/freeradius/files/0010-fix-error-for-expansion-of-macro-in-thread.h.patch
> deleted file mode 100644
> index cae27ad3a4..0000000000
> --- a/meta-networking/recipes-connectivity/freeradius/files/0010-fix-error-for-expansion-of-macro-in-thread.h.patch
> +++ /dev/null
> @@ -1,61 +0,0 @@
> -From 0475d948ceab91b22172f0fae3bc01e0a1502ae8 Mon Sep 17 00:00:00 2001
> -From: Yi Zhao <yi.zhao@windriver.com>
> -Date: Wed, 18 Jan 2017 14:59:39 +0800
> -Subject: [PATCH] fix error for expansion of macro in thread.h
> -
> -The parameter declaration is missing in expansion of macro
> -which cause the build error:
> -| In file included from src/freeradius-devel/libradius.h:80:0,
> -|                  from src/lib/log.c:26:
> -| src/lib/log.c: In function '__fr_thread_local_destroy_fr_strerror_buffer':
> -| src/lib/log.c:37:31: error: 'fr_strerror_buffer' undeclared (first use in this function)
> -|  fr_thread_local_setup(char *, fr_strerror_buffer) /* macro */
> -|                                ^
> -
> -Add the missing declaration in macro.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ----
> - src/include/threads.h | 10 +++++-----
> - 1 file changed, 5 insertions(+), 5 deletions(-)
> -
> -diff --git a/src/include/threads.h b/src/include/threads.h
> -index f2aea776d6..1c4e526797 100644
> ---- a/src/include/threads.h
> -+++ b/src/include/threads.h
> -@@ -92,7 +92,7 @@ static _t __fr_thread_local_init_##_n(pthread_destructor_t func)\
> - #  define fr_thread_local_get(_n) _n
> - #elif defined(HAVE_PTHREAD_H)
> - #  include <pthread.h>
> --#  define fr_thread_local_setup(_t, _n) \
> -+#  define fr_thread_local_setup(_t, _n) static __thread _t _n;\
> - static pthread_key_t __fr_thread_local_key_##_n;\
> - static pthread_once_t __fr_thread_local_once_##_n = PTHREAD_ONCE_INIT;\
> - static pthread_destructor_t __fr_thread_local_destructor_##_n = NULL;\
> -@@ -103,17 +103,17 @@ static void __fr_thread_local_destroy_##_n(UNUSED void *unused)\
> - static void __fr_thread_local_key_init_##_n(void)\
> - {\
> - 	(void) pthread_key_create(&__fr_thread_local_key_##_n, __fr_thread_local_destroy_##_n);\
> --	(void) pthread_setspecific(__fr_thread_local_key_##_n, &(_n));\
> - }\
> - static _t __fr_thread_local_init_##_n(pthread_destructor_t func)\
> - {\
> - 	__fr_thread_local_destructor_##_n = func;\
> - 	if (_n) return _n; \
> - 	(void) pthread_once(&__fr_thread_local_once_##_n, __fr_thread_local_key_init_##_n);\
> -+	(void) pthread_setspecific(__fr_thread_local_key_##_n, &(_n));\
> - 	return _n;\
> - }
> --#  define fr_thread_local_init(_n, _f)			__fr_thread_local_init_##_n(_f)
> --#  define fr_thread_local_set(_n, _v)			__fr_thread_local_set_##_n(_v)
> --#  define fr_thread_local_get(_n)			__fr_thread_local_get_##_n()
> -+#  define fr_thread_local_init(_n, _f)	__fr_thread_local_init_##_n(_f)
> -+#  define fr_thread_local_set(_n, _v) ((int)!((_n = _v) || 1))
> -+#  define fr_thread_local_get(_n) _n
> - #endif
> - #endif
> ---
> -2.25.1
> -
> diff --git a/meta-networking/recipes-connectivity/freeradius/files/0018-update-license-1.patch b/meta-networking/recipes-connectivity/freeradius/files/0018-update-license-1.patch
> deleted file mode 100644
> index 8647c389ab..0000000000
> --- a/meta-networking/recipes-connectivity/freeradius/files/0018-update-license-1.patch
> +++ /dev/null
> @@ -1,175 +0,0 @@
> -From 82d874c638c80fbbf1eca7c51aca095fbbf40024 Mon Sep 17 00:00:00 2001
> -From: "Alan T. DeKok" <aland@freeradius.org>
> -Date: Mon, 27 Oct 2025 06:31:22 -0400
> -Subject: [PATCH] update license
> -
> -Upstream-Status: Backport
> -[https://github.com/FreeRADIUS/freeradius-server/commit/82d874c638c80fbbf1eca7c51aca095fbbf40024]
> -
> -Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ----
> - src/modules/rlm_dpsk/rlm_dpsk.c               | 25 +++++++---------
> - .../rlm_eap/types/rlm_eap_teap/eap_teap.c     | 29 +++++++------------
> - .../rlm_eap/types/rlm_eap_teap/eap_teap.h     | 29 +++++++------------
> - .../rlm_eap/types/rlm_eap_teap/rlm_eap_teap.c | 29 +++++++------------
> - 4 files changed, 44 insertions(+), 68 deletions(-)
> -
> -diff --git a/src/modules/rlm_dpsk/rlm_dpsk.c b/src/modules/rlm_dpsk/rlm_dpsk.c
> -index 4b818d08a5..aa07415540 100644
> ---- a/src/modules/rlm_dpsk/rlm_dpsk.c
> -+++ b/src/modules/rlm_dpsk/rlm_dpsk.c
> -@@ -1,20 +1,17 @@
> - /*
> -- * Copyright (C) 2023 Network RADIUS SARL (legal@networkradius.com)
> -+ *   This program is is free software; you can redistribute it and/or modify
> -+ *   it under the terms of the GNU General Public License as published by
> -+ *   the Free Software Foundation; either version 2 of the License, or (at
> -+ *   your option) any later version.
> -  *
> -- * This software may not be redistributed in any form without the prior
> -- * written consent of Network RADIUS.
> -+ *   This program is distributed in the hope that it will be useful,
> -+ *   but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+ *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -+ *   GNU General Public License for more details.
> -  *
> -- * THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
> -- * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
> -- * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
> -- * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
> -- * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
> -- * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
> -- * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
> -- * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
> -- * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
> -- * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
> -- * SUCH DAMAGE.
> -+ *   You should have received a copy of the GNU General Public License
> -+ *   along with this program; if not, write to the Free Software
> -+ *   Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA
> -  */
> -
> - /**
> -diff --git a/src/modules/rlm_eap/types/rlm_eap_teap/eap_teap.c b/src/modules/rlm_eap/types/rlm_eap_teap/eap_teap.c
> -index 20646c5ba1..33512788c2 100644
> ---- a/src/modules/rlm_eap/types/rlm_eap_teap/eap_teap.c
> -+++ b/src/modules/rlm_eap/types/rlm_eap_teap/eap_teap.c
> -@@ -1,24 +1,17 @@
> - /*
> -- * eap_teap.c  contains the interfaces that are called from the main handler
> -+ *   This program is is free software; you can redistribute it and/or modify
> -+ *   it under the terms of the GNU General Public License as published by
> -+ *   the Free Software Foundation; either version 2 of the License, or (at
> -+ *   your option) any later version.
> -  *
> -- * Version:     $Id$
> -+ *   This program is distributed in the hope that it will be useful,
> -+ *   but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+ *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -+ *   GNU General Public License for more details.
> -  *
> -- * Copyright (C) 2022 Network RADIUS SARL <legal@networkradius.com>
> -- *
> -- * This software may not be redistributed in any form without the prior
> -- * written consent of Network RADIUS.
> -- *
> -- * THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
> -- * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
> -- * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
> -- * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
> -- * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
> -- * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
> -- * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
> -- * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
> -- * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
> -- * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
> -- * SUCH DAMAGE.
> -+ *   You should have received a copy of the GNU General Public License
> -+ *   along with this program; if not, write to the Free Software
> -+ *   Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA
> -  */
> -
> - RCSID("$Id$")
> -diff --git a/src/modules/rlm_eap/types/rlm_eap_teap/eap_teap.h b/src/modules/rlm_eap/types/rlm_eap_teap/eap_teap.h
> -index 59f7835a26..69f4b1ebba 100644
> ---- a/src/modules/rlm_eap/types/rlm_eap_teap/eap_teap.h
> -+++ b/src/modules/rlm_eap/types/rlm_eap_teap/eap_teap.h
> -@@ -1,24 +1,17 @@
> - /*
> -- * eap_teap.h
> -+ *   This program is is free software; you can redistribute it and/or modify
> -+ *   it under the terms of the GNU General Public License as published by
> -+ *   the Free Software Foundation; either version 2 of the License, or (at
> -+ *   your option) any later version.
> -  *
> -- * Version:     $Id$
> -+ *   This program is distributed in the hope that it will be useful,
> -+ *   but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+ *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -+ *   GNU General Public License for more details.
> -  *
> -- * Copyright (C) 2022 Network RADIUS SARL <legal@networkradius.com>
> -- *
> -- * This software may not be redistributed in any form without the prior
> -- * written consent of Network RADIUS.
> -- *
> -- * THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
> -- * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
> -- * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
> -- * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
> -- * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
> -- * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
> -- * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
> -- * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
> -- * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
> -- * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
> -- * SUCH DAMAGE.
> -+ *   You should have received a copy of the GNU General Public License
> -+ *   along with this program; if not, write to the Free Software
> -+ *   Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA
> -  */
> - #ifndef _EAP_TEAP_H
> - #define _EAP_TEAP_H
> -diff --git a/src/modules/rlm_eap/types/rlm_eap_teap/rlm_eap_teap.c b/src/modules/rlm_eap/types/rlm_eap_teap/rlm_eap_teap.c
> -index fcf9717257..13c709b287 100644
> ---- a/src/modules/rlm_eap/types/rlm_eap_teap/rlm_eap_teap.c
> -+++ b/src/modules/rlm_eap/types/rlm_eap_teap/rlm_eap_teap.c
> -@@ -1,24 +1,17 @@
> - /*
> -- * rlm_eap_teap.c  contains the interfaces that are called from eap
> -+ *   This program is is free software; you can redistribute it and/or modify
> -+ *   it under the terms of the GNU General Public License as published by
> -+ *   the Free Software Foundation; either version 2 of the License, or (at
> -+ *   your option) any later version.
> -  *
> -- * Version:     $Id$
> -+ *   This program is distributed in the hope that it will be useful,
> -+ *   but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+ *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -+ *   GNU General Public License for more details.
> -  *
> -- * Copyright (C) 2022 Network RADIUS SARL <legal@networkradius.com>
> -- *
> -- * This software may not be redistributed in any form without the prior
> -- * written consent of Network RADIUS.
> -- *
> -- * THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
> -- * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
> -- * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
> -- * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
> -- * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
> -- * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
> -- * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
> -- * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
> -- * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
> -- * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
> -- * SUCH DAMAGE.
> -+ *   You should have received a copy of the GNU General Public License
> -+ *   along with this program; if not, write to the Free Software
> -+ *   Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA
> -  */
> -
> - RCSID("$Id$")
> ---
> -2.43.0
> -
> diff --git a/meta-networking/recipes-connectivity/freeradius/files/0019-update-license-2.patch b/meta-networking/recipes-connectivity/freeradius/files/0019-update-license-2.patch
> deleted file mode 100644
> index 4fa3ecd265..0000000000
> --- a/meta-networking/recipes-connectivity/freeradius/files/0019-update-license-2.patch
> +++ /dev/null
> @@ -1,52 +0,0 @@
> -From a46e81a7764b57983ce6724524f745a06222dc0a Mon Sep 17 00:00:00 2001
> -From: "Alan T. DeKok" <aland@freeradius.org>
> -Date: Tue, 28 Oct 2025 11:33:44 -0400
> -Subject: [PATCH] update license
> -
> -Upstream-Status: Backport
> -[https://github.com/FreeRADIUS/freeradius-server/commit/a46e81a7764b57983ce6724524f745a06222dc0a]
> -
> -Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ----
> - .../rlm_proxy_rate_limit.c                    | 25 ++++++++-----------
> - 1 file changed, 11 insertions(+), 14 deletions(-)
> -
> -diff --git a/src/modules/rlm_proxy_rate_limit/rlm_proxy_rate_limit.c b/src/modules/rlm_proxy_rate_limit/rlm_proxy_rate_limit.c
> -index 744b14a448..a855273784 100644
> ---- a/src/modules/rlm_proxy_rate_limit/rlm_proxy_rate_limit.c
> -+++ b/src/modules/rlm_proxy_rate_limit/rlm_proxy_rate_limit.c
> -@@ -1,20 +1,17 @@
> - /*
> -- * Copyright (C) 2024 Network RADIUS SAS (legal@networkradius.com)
> -+ *   This program is is free software; you can redistribute it and/or modify
> -+ *   it under the terms of the GNU General Public License as published by
> -+ *   the Free Software Foundation; either version 2 of the License, or (at
> -+ *   your option) any later version.
> -  *
> -- * This software may not be redistributed in any form without the prior
> -- * written consent of Network RADIUS.
> -+ *   This program is distributed in the hope that it will be useful,
> -+ *   but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+ *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -+ *   GNU General Public License for more details.
> -  *
> -- * THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
> -- * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
> -- * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
> -- * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
> -- * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
> -- * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
> -- * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
> -- * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
> -- * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
> -- * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
> -- * SUCH DAMAGE.
> -+ *   You should have received a copy of the GNU General Public License
> -+ *   along with this program; if not, write to the Free Software
> -+ *   Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA
> -  */
> -
> - /**
> ---
> -2.43.0
> -
> diff --git a/meta-networking/recipes-connectivity/freeradius/files/0020-update-license-3.patch b/meta-networking/recipes-connectivity/freeradius/files/0020-update-license-3.patch
> deleted file mode 100644
> index f77c585bda..0000000000
> --- a/meta-networking/recipes-connectivity/freeradius/files/0020-update-license-3.patch
> +++ /dev/null
> @@ -1,101 +0,0 @@
> -From d00440f3290871aef667f80e15f256c64f9b7cd6 Mon Sep 17 00:00:00 2001
> -From: "Alan T. DeKok" <aland@freeradius.org>
> -Date: Wed, 29 Oct 2025 09:45:17 -0400
> -Subject: [PATCH] update license
> -
> -Upstream-Status: Backport
> -[https://github.com/FreeRADIUS/freeradius-server/commit/d00440f3290871aef667f80e15f256c64f9b7cd6]
> -
> -Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ----
> - .../types/rlm_eap_teap/eap_teap_crypto.c      | 30 +++++++------------
> - .../types/rlm_eap_teap/eap_teap_crypto.h      | 30 +++++++------------
> - 2 files changed, 22 insertions(+), 38 deletions(-)
> -
> -diff --git a/src/modules/rlm_eap/types/rlm_eap_teap/eap_teap_crypto.c b/src/modules/rlm_eap/types/rlm_eap_teap/eap_teap_crypto.c
> -index 17f49f9dfc..aaa74837a9 100644
> ---- a/src/modules/rlm_eap/types/rlm_eap_teap/eap_teap_crypto.c
> -+++ b/src/modules/rlm_eap/types/rlm_eap_teap/eap_teap_crypto.c
> -@@ -1,26 +1,18 @@
> - /*
> -- * teap-crypto.c  Cryptographic functions for EAP-TEAP.
> -+ *   This program is is free software; you can redistribute it and/or modify
> -+ *   it under the terms of the GNU General Public License as published by
> -+ *   the Free Software Foundation; either version 2 of the License, or (at
> -+ *   your option) any later version.
> -  *
> -- * Version:     $Id$
> -+ *   This program is distributed in the hope that it will be useful,
> -+ *   but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+ *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -+ *   GNU General Public License for more details.
> -  *
> -- * Copyright (C) 2022 Network RADIUS SARL <legal@networkradius.com>
> -- *
> -- * This software may not be redistributed in any form without the prior
> -- * written consent of Network RADIUS.
> -- *
> -- * THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
> -- * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
> -- * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
> -- * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
> -- * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
> -- * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
> -- * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
> -- * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
> -- * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
> -- * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
> -- * SUCH DAMAGE.
> -+ *   You should have received a copy of the GNU General Public License
> -+ *   along with this program; if not, write to the Free Software
> -+ *   Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA
> -  */
> --
> - RCSID("$Id$")
> - USES_APPLE_DEPRECATED_API	/* OpenSSL API has been deprecated by Apple */
> -
> -diff --git a/src/modules/rlm_eap/types/rlm_eap_teap/eap_teap_crypto.h b/src/modules/rlm_eap/types/rlm_eap_teap/eap_teap_crypto.h
> -index b02f2b9083..f9403dcf93 100644
> ---- a/src/modules/rlm_eap/types/rlm_eap_teap/eap_teap_crypto.h
> -+++ b/src/modules/rlm_eap/types/rlm_eap_teap/eap_teap_crypto.h
> -@@ -1,26 +1,18 @@
> - /*
> -- * eap_teap_crypto.h
> -+ *   This program is is free software; you can redistribute it and/or modify
> -+ *   it under the terms of the GNU General Public License as published by
> -+ *   the Free Software Foundation; either version 2 of the License, or (at
> -+ *   your option) any later version.
> -  *
> -- * Version:     $Id$
> -+ *   This program is distributed in the hope that it will be useful,
> -+ *   but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+ *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -+ *   GNU General Public License for more details.
> -  *
> -- * Copyright (C) 2022 Network RADIUS SARL <legal@networkradius.com>
> -- *
> -- * This software may not be redistributed in any form without the prior
> -- * written consent of Network RADIUS.
> -- *
> -- * THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
> -- * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
> -- * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
> -- * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
> -- * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
> -- * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
> -- * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
> -- * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
> -- * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
> -- * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
> -- * SUCH DAMAGE.
> -+ *   You should have received a copy of the GNU General Public License
> -+ *   along with this program; if not, write to the Free Software
> -+ *   Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA
> -  */
> --
> - #ifndef _EAP_TEAP_CRYPTO_H
> - #define _EAP_TEAP_CRYPTO_H
> -
> ---
> -2.43.0
> -
> diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.8.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.8.bb
> index 4be127209b..a0e0292c3e 100644
> --- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.8.bb
> +++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.8.bb
> @@ -15,7 +15,7 @@ DEPENDS = "openssl-native openssl libidn libtool libpcap libtalloc"
>
>   PATCHTOOL = "git"
>
> -SRC_URI = "git://github.com/FreeRADIUS/freeradius-server.git;branch=v3.2.x;lfs=0;;protocol=https \
> +SRC_URI = "git://github.com/FreeRADIUS/freeradius-server.git;branch=v3.2.x;lfs=0;protocol=https \
>       file://freeradius \
>       file://volatiles.58_radiusd \
>       file://radiusd.service \
> @@ -29,7 +29,6 @@ SRC_URI = "git://github.com/FreeRADIUS/freeradius-server.git;branch=v3.2.x;lfs=0
>       file://0007-rlm_python-add-PY_INC_DIR-in-search-dir.patch \
>       file://0008-libtool-do-not-use-jlibtool.patch \
>       file://0009-Fix-quoting-for-BUILD_WITH.patch \
> -    file://0010-fix-error-for-expansion-of-macro-in-thread.h.patch \
>       file://0011-rlm_mschap-Use-includedir-instead-of-hardcoding-usr-.patch \
>       file://0012-raddb-certs-Makefile-fix-the-existed-certificate-err.patch \
>       file://0013-raddb-certs-Makefile-fix-the-occasional-verification.patch \
> @@ -37,16 +36,13 @@ SRC_URI = "git://github.com/FreeRADIUS/freeradius-server.git;branch=v3.2.x;lfs=0
>       file://0015-bootstrap-check-commands-of-openssl-exist.patch \
>       file://0016-version.c-don-t-print-build-flags.patch \
>       file://0017-Add-acinclude.m4-to-include-required-macros.patch \
> -    file://0018-update-license-1.patch \
> -    file://0019-update-license-2.patch \
> -    file://0020-update-license-3.patch \
> -    file://0001-don-t-load-legacy-provider-on-enable-fips-workaround.patch \
> -    file://0002-don-t-load-legacy-provider-on-enable-fips-workaround.patch \
>   "
>
>   raddbdir = "${sysconfdir}/${MLPREFIX}raddb"
>
> -SRCREV = "032be31bb52646171099617928ec1703335bcf73"
> +SRCREV = "4e4cbbd93ff3b469a773c964c7b5b6f53d01457a"
> +
> +PV .= "+git"
>
>   UPSTREAM_CHECK_GITTAGREGEX = "release_(?P<pver>\d+(\_\d+)+)"
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126212): https://lists.openembedded.org/g/openembedded-devel/message/126212
> Mute This Topic: https://lists.openembedded.org/mt/118755338/7283133
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [yi.zhao@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

