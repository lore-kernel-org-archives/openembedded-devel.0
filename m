Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B06E8C3601E
	for <webhook@archiver.kernel.org>; Mon, 14 Apr 2025 06:04:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.43573.1744610634939406740
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Apr 2025 23:03:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=61992b229a=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E4nvdd003639
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Apr 2025 06:03:54 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45yf58hmgu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Apr 2025 06:03:53 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rcYNhXuOZnUfXu2YnVt1Jpq5syx8iyOGI3fhwq3RXjcc07TcYlKD2E8bA8plycyWsKhZ8WWgQIIuRJkU9xmOFayLxuZAgTG/h5ops6i57rzjd7EMeHuraB8c10zIR+ExcvPgZA8Oec7y1w9dWwOv02hjc171dr7hwRo8DSWld95Nk3N7KtgI/xAUD8h0ymWfoNIiuLvZ2QanrJwvsBXvjh+8CTS7C/aFHRuBh9bV1UUM9ajBUUI1MjZXaaHIj0ymNKOef588/dh2JWwB5OXMxu3ecnsQ9BouwMpEvBnacENEP57g0zwnEf4nucS3sSgthqudLTiZVC1zyFnu6HLEKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ymgae9fr1c/4u5htVL9NGfBFu3qLIf+s+zDQU+7Fzzw=;
 b=FQucKZ0YE5gu2F0P3NJagsQW8tnsTlrNoO7LlYkA5fu47Btx93glCKFEL3YeF4becaDXPKEPZmt45ycPQTmyaVym+PbEg9cLDhnUhKlMFxKkwPAfLFTtBGwbikLWtomDxfCztrspFJHgj/5/12biwaPpzaU1bgev5TyVQ8mjaPGmk4Ld4uswXg3XBsk9AswZsPwSly3NfO1i72j4zLJojNmpgnCpL0PEEP5WS+r++ivehYx5sHTDRpmuOFsm9likmTudbz1QNIzpWC4rWLQ9R5OeY45bXMqj19sTOIfEH2/wu+o2ozLBnjYoCaZ98RzhrhmQ8E4sjeBKKtM3TNLDgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by SJ0PR11MB6766.namprd11.prod.outlook.com (2603:10b6:a03:47c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.50; Mon, 14 Apr
 2025 06:03:50 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%4]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 06:03:50 +0000
From: haixiao.yan.cn@eng.windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH] lmsensors: Clean stale files for sensord to avoid incorrect GCC header dependencies
Date: Mon, 14 Apr 2025 14:03:33 +0800
Message-Id: <20250414060333.1701811-1-haixiao.yan.cn@eng.windriver.com>
X-Mailer: git-send-email 2.35.5
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SI2PR06CA0018.apcprd06.prod.outlook.com
 (2603:1096:4:186::8) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|SJ0PR11MB6766:EE_
X-MS-Office365-Filtering-Correlation-Id: 425242bd-f7e0-40ed-d465-08dd7b1a206a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?a0ZHRWdRaWZGdE1Da0hKRlhYaVlQZm1RMHh0K3hMcjJSVEdiMEVDMzVvL2pT?=
 =?utf-8?B?d1U2WTNmOGE4MmlpMlR4Z3VrMHJuZGRmTUxVMVI3RlpTSU9ncGRxS3ZPVDRQ?=
 =?utf-8?B?RGRFdXNiRGpvVEFKbitXMjVnam5KOHIyODlLWkZPZitmYUM4bUd3N2s2dlAw?=
 =?utf-8?B?c3FQR3gzSW15eUpZWUdaYzVSMFpSUXpyWkliVDgraGtHdzBqa1NCLy80ZFR4?=
 =?utf-8?B?aHBjSWY4TzVWVE91MExpUkp4L29WcFpjRmpFaWZnbitNUWRBb0ZKUFZnSW5H?=
 =?utf-8?B?UjJEcWo2SnRVSVhZTUlYaGxKWGl0NzA4WGZMQUxpMTZMWVN0TkxIN1lxQnBZ?=
 =?utf-8?B?bnhNN3BaRDdQVkhKcW05SHJLdkk1YjRSOGNPbm5xWndMV05pTUIzZVdFam1B?=
 =?utf-8?B?azRqTjBHVkE4bXErZjRrMzJMZFJ3dGtzR2RKdEJJeWpReHF2R1o3NSt4QWVP?=
 =?utf-8?B?Z2FuK3lUSHAyVzFtWUhQY2xEMkVLZk0zaGpQT2EzVEIxUUI0dkZoZEJBWVVw?=
 =?utf-8?B?N0drRWQxSXA1djY5SzUvRVZzRlV5ZmIxWnlpZm8ycVVtLzZhMG1zM3ZIL3RP?=
 =?utf-8?B?cnQ5b0s0SHYvcHgxekxXL0dSeElMamtGNFBTZkoyZVM2TGo4aFh5TnpwcGlU?=
 =?utf-8?B?aWh2aGdQUmF6ZkRZQzBNdHQrYnY4Q1kzWmtueVRLd1BGZGdZeEN0Nk9oVFN2?=
 =?utf-8?B?WVpyaXdPN2Y3eDRkK01lTDJlcXIyN3ZXNXpZTTM4VlIvSWVCMGtGbXdnZmRZ?=
 =?utf-8?B?WVpoV0E1MGJXSisyS0poSFp4OStha0tEOWJvZ1BodENBcUg2UklITDN6RXZn?=
 =?utf-8?B?WEVMRUJUQWM5V3lMenFBNHV1N1RXQUJGVlNBQkNWSTlaT3lnRjl6L1hvYkdo?=
 =?utf-8?B?UklvVEZUUWUvK2hMV0hkNnN5YjN6ZVhVRmwwbi82U0lDaTh5RHdRMnprTCtm?=
 =?utf-8?B?cTBlalhDdWZmUzl2SVN2ajgwSUtoK05lb3VCdzFIOXk2aEUyaHo1Mmk0eDh0?=
 =?utf-8?B?UXpMZDNJdkVFVVNwaU03UHFkaTcyc1NINjRmK0xCU2NUdmxOdjEwOUs3dnQz?=
 =?utf-8?B?dmVZSnFocnB1UFRoVGlsUkxZZmJCakxtWGFkazE3cUJES0JEWDlnNW5abHpJ?=
 =?utf-8?B?dXc1QW0vQ01QUzJmc3VRenJpY2tPNks0b1VFdzNYVUVKbWw4Y2YvQ3hNN0Fn?=
 =?utf-8?B?M3J1TjU3TlhpMmJKUm00d0g1OVNqajl5cHQzR3lUYyt5NjJYVnBRTkpkZE5D?=
 =?utf-8?B?UlZuNHBYa2YyK2hPczdRZDlUZTZvaUxGUTNVajRZbUl4ZFZYcE9TL1hLd3dQ?=
 =?utf-8?B?OHpKQy91T0VOMHJtTXo3cGcvdVpLa3c3c0h4M1ZEOXNxOW4zbWlMQjlONDhM?=
 =?utf-8?B?QVViNW1MUVZLK2c2UnBwU0VyZEZrRUpLZGlWQ0oxeENqOGJYM2luSXVzbHBx?=
 =?utf-8?B?SERnU1lFWDJqbm12Y3dQalN2eTY5eEtQVCtPckpBMUNFQjZaSFpCU3Y2VlMr?=
 =?utf-8?B?ZlZTaXlNaFVwS1I5MFVVRjBHNnVzTm5oK0RxTEZmK3JRWGkxL205VTlQWWo2?=
 =?utf-8?B?cGpZSWpVd0wrc2RHSGZRWEh4RVBESjlBWFRNWElRL0Q5dmF0VUYzSmlkMFdU?=
 =?utf-8?B?QkZuUU9kWDJHckZla2Zwb0p1TDRIRUptYUo4a1ZSZEE3Yi90RDRtWVhzZklj?=
 =?utf-8?B?bFhUU1MwdkMzdE9iKytSOGp4YTMrejVyUUxCWG40enR1RFVQUTl6by93MzhY?=
 =?utf-8?B?Y2JRODRkN0JWYmd1d1ZsUDJSWHNRNHRsRFJSdkNPajFBUXJ3STF5dytVZll3?=
 =?utf-8?B?N2JVb3gzTm5CejV5L3NSdjlKd3FRb1ZsNlpBSU1QdHd6aG9lTE5zSGVJRFBL?=
 =?utf-8?B?bC9JcWgyVUtXdm9BOENMaGxHVXVETnFCT2c5eXB2WHduR0RkR2JCcEdKakUw?=
 =?utf-8?B?SjV5VU5vUUdITnV5ZzlVT1JocExVMTNEYWwvdXZoNko3TXJJWFhRbG9EdjEx?=
 =?utf-8?B?VEpEaHVLbWtBPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eVo2QWo0UlU1U1ZuUmVXTVhZOStXRGNSSTRYR0xyelFMMWhTb3N3M0xmaXNl?=
 =?utf-8?B?VGdWYW80a2ZaOTNxQnFBT2NqdU51ejF0b0lEemZiaW0xUTFHck90NDh0cWoy?=
 =?utf-8?B?NXgzS1paQ2ZvRDBJVnowTnJGMW5IeXk5Ulg2NTRIcFAxdG9zMzZhY3dwZFk4?=
 =?utf-8?B?bG9Pb3R2V2F4OGtoR3pVemNDSDV0V2pBUi9rUG5wTE9PV2Vxd1RlQjE2Z2k2?=
 =?utf-8?B?VThuZjBERTJNRWxWbXE1Ly9zRFJxck9aQmFOYUppNFpJRDNUVXZSZHNGR0hr?=
 =?utf-8?B?TlNLMXBnUE5oVWZyY2Y3bjJRbFcwZ3ZDOXlQbERDaGZxR2NvRE9EVUJhUmRk?=
 =?utf-8?B?bnppWjl6d1lPNktWeTB0VC9PNit1cDl2bVZCdExCTThLWldkcnpJY0NoYnlI?=
 =?utf-8?B?UTZkeW9qWVJQamVKbjg5aFM4VFRncm9ldHFCSHZtVU5GZ1lxYjRBNXJ2WTNm?=
 =?utf-8?B?TXJET2p4RW1qRDJua0hzeVJnVHpxRnBvQjlkOTRndVV1bkRlV2V5VGFWdkJW?=
 =?utf-8?B?aWdOZlBIZGkxODgwOVQ4K21XYUZaYVJ4dExLM08yWTc3djR2OVdOREMzbFNO?=
 =?utf-8?B?VHg4d2NJaHUyb3FYT1NVY2tsU1ZwbXNOM0hSMWNZRkF1WkpXdkNYRkJLMkVt?=
 =?utf-8?B?eTRYSWZqMkRnaXIxK1hkNVNTa2JITm9ick4ydDQvdFRUOUczcFhRUkcxQXJR?=
 =?utf-8?B?ZXhubHlKWXB3Qm9FRy9YQUN1NnM5bk5tYVl6MkVHRzNFa0l2UEZhRVplNHU0?=
 =?utf-8?B?enVsODQxUU5pc3V1cHRpOC95MWdYaWpRQUtQc1NWWUdaUUVFbVIrMVUzWGEy?=
 =?utf-8?B?b0JsOVNiUXkzTzBFVVBWcUtneGhtc09KaEtRSWlDZFN2U0ttbE5Od3VLNUwz?=
 =?utf-8?B?dU5uWXNPQWVmcjkxZUpZRHFxejJHV2JkdUxHTE5ZZmZnN2FpQkx4ZUE4V0ZQ?=
 =?utf-8?B?Z24ybVRPWFEwb1drbjVZKzdIRmkrY1BLdm9KYUZGWWhoYnJUMTBZYnY4Ky9M?=
 =?utf-8?B?b0tiS1A4K0Qzb1orVzZIQXlFS2E1TXE5TkxCT0ovRFJxa0YwalEwc0dVNm0z?=
 =?utf-8?B?NDIra0M5eXN3VXJkbkFxaWZhQWRYVlhKRTJ6QnREZHMvYzIzL3k4b1dwMDl0?=
 =?utf-8?B?RXNidzlyRmhleGtSMUQ4RkVNS1k1dVJ6N3h4aXphbXhPVnlnTDNBOGlzVlNw?=
 =?utf-8?B?TGNab2JjUklKN09Cd1piTENhRWhBSU5xSlB1MkJ1MzlVVVNKQ2JJOHAxd29Z?=
 =?utf-8?B?c3pveWR6SlBXYU40VUNudWtFdVVlVFJlOCtWL2JwdWYyVUJlRjVxL3U5VnpQ?=
 =?utf-8?B?TWFEbEJPVkdRSUxlZGxLSE5nbTB1bU5vNXl6K3o3UlhQY0l2SG1GeFN1OThw?=
 =?utf-8?B?SGVVZXROM21rYTB2MDNabndtZTVxYjNpZm90b2dTL0pMSTNTcUJiNHRqc1FJ?=
 =?utf-8?B?K0lVRXFpYlgxSDRTZm5RQm9zaWtvM1dXNnBlR3AvMVFPUENHeUU1MjJUSElG?=
 =?utf-8?B?WFB5NW9VVCtuMGFMUjkvalMxbkhtY25qd21xbXpJV1V1OU5ycTIrUllLRmFL?=
 =?utf-8?B?MU9DazFtVkg5UjRDeUhZQnI3Z1dTdGhaUjJiVnhodHdhZGMyUHNRcEdrNkFB?=
 =?utf-8?B?czRxQ2Vvb2JiYVNGV0tKdzhBYmY0ZUtrZUo4NWlUOFNaYkRzTk9HOE5CUWhW?=
 =?utf-8?B?dllERVlFNkhqWWhnNkNyNzJ0VDE5TkJKWGZjbkpSQkN4dE5lZjJaZUxQMURX?=
 =?utf-8?B?Zkl2YVNiOEE1WStzVko5T3drSU9kdWVkYkJxeVd5OXJiMjRIZFVnblBXN1N1?=
 =?utf-8?B?OWt3RlhvRnRXSkxpYThmZTRZVHVpRXpzeDRrQjVJNUpHUWJrakpvNE45RDBr?=
 =?utf-8?B?UjY1ellZcFVTMG1VbGYzcHlCRFdlN0NydHJZQ2Yzalc2cmQyaU5wTDAwRmd3?=
 =?utf-8?B?WWw2WVhOVk1YZ09FUjBMOG9KSms2UXhqQi9iYzZHdXRuc1U1UHJZN1Z1MUU0?=
 =?utf-8?B?V01jQjdjTXM5enk0ZjdvYm1mcWJ0RVJFdG1CMGh6STFQbm93alZ0d2pyN2hQ?=
 =?utf-8?B?YWtPVjZENmtROHVLdVJvZjRONHZGS1lEWVROcVhHbWpSb2NkZkRpWiszVmpo?=
 =?utf-8?B?dzhLWmpPNXdJWnIrbFBrNVpzUUxsY0tXMFhiUnVSbU5oNVRzaU1hSERyT2Ra?=
 =?utf-8?B?Mnc9PQ==?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 425242bd-f7e0-40ed-d465-08dd7b1a206a
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 06:03:50.2082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5HTcwPgDhvNfU5ovOdMBZqPbtEneiWMkwlRWqJxMLUqa592K9OE7N84mhqLTI2UWORrE7S9NmPqa3dvCJpi538sSLlRmwvd0iHakGrh6UzM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6766
X-Authority-Analysis: v=2.4 cv=UPPdHDfy c=1 sm=1 tr=0 ts=67fca549 cx=c_pps a=qvBKVd3KFl3zkoLf5jvq7Q==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=AJs-ryozdUd9o3ahdBkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=Omh45SbU8xzqK50xPoZQ:22
X-Proofpoint-GUID: N38zhgWZvLnn_EGX-LOOjUU2m9q4PjTN
X-Proofpoint-ORIG-GUID: N38zhgWZvLnn_EGX-LOOjUU2m9q4PjTN
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=713 spamscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504140042
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 53E4nvdd003639
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Apr 2025 06:04:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116842

From: Haixiao Yan <haixiao.yan.cn@windriver.com>

After upgrading GCC=E2=80=94for example, from 14.1.0 to 14.2.0=E2=80=94bu=
ilding lmsensors that
was previously compiled with GCC 14.1.0 may fail with an error like:
lmsensors/3.6.0/recipe-sysroot-native/usr/lib/x86_64-wrs-linux/gcc/x86_64=
-wrs-linux/
14.1.0/include/stddef.h can't find, which is needed by 'prog/sensord/args=
.rd'.

This occurs because prog/sensord/args.rd still references stale headers f=
rom the
older GCC version.
The root cause is that stale *.rd and *.ro files under prog/sensord are n=
ot
properly cleaned during do_configure. This patch ensures those files are =
removed
to prevent broken dependencies when GCC is upgraded.
Also remove the same statement in do_compile.

(master rev: 86b20b84ec278cacf4975b7933d46b894d74796e)

Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb b/meta-oe/=
recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
index aba5ab587886..e3186132c76c 100644
--- a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
+++ b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
@@ -50,8 +50,11 @@ EXTRA_OEMAKE =3D 'EXLDFLAGS=3D"${LDFLAGS}" \
         LIBDIR=3D${libdir} \
         CC=3D"${CC}" AR=3D"${AR}"'
=20
+do_configure:prepend() {
+    sed -i -e 's:^#\(PROG_EXTRA\):\1:' ${S}/Makefile
+}
+
 do_compile() {
-    sed -i -e 's:^# \(PROG_EXTRA\):\1:' ${S}/Makefile
     # Respect LDFLAGS
     sed -i -e 's/\$(LIBDIR)$/\$(LIBDIR) \$(LDFLAGS)/g' ${S}/Makefile
     sed -i -e 's/\$(LIBSHSONAME) -o/$(LIBSHSONAME) \$(LDFLAGS) -o/g' \
--=20
2.35.5


