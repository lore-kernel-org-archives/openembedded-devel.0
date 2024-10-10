Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A950CEDDB8
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 01:59:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.34112.1728525549678449465
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Oct 2024 18:59:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=00130c5401=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49A0EWp9024568
	for <openembedded-devel@lists.openembedded.org>; Wed, 9 Oct 2024 18:59:09 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2044.outbound.protection.outlook.com [104.47.70.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4234ykvsdn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 09 Oct 2024 18:59:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZqOPDtLqQHy+bzSZ36uLRfjoQhY1cPIO+j6SOKgbm4YvoueKs+fS5SJFxftdb9PwIOmJQ80BEEx2xzDilx8yycGvNfd6TKiYUQEuM4ecd+dA1uGgvnEjNo7oSsSpr8mdKyoI/1ThVXtYENiVjaJHIm2krT/7nD7PjyKhUFXeMtNbv+VbYoscPxJm3RYZ7NaJAOD3GCFGonFjEhkqlvLOi25rwfUykiuRmsL5RiA0Y2HZ6LWa+5rHkpKPK7MZ3ULgwy48u+Hn/aXQjlZzFRhg/HWtrIfwxgu2KM6fUeEq5n+aTyi533f2zEOwsgAbpYMrrUhk80qERxghItu2/kOmXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bmufxqp4yQVLDkrd5uCWljEskpY0L7dG0KVoJsRh9ek=;
 b=qtHiPJPjQXLAazxDbLOgcmV6XzJPXcpY3foF+fTjIuioZ/anmoi3Pv++66quW7Pz7YK2Wr6xgUEgEOO7Bf2LoQQX/CJvfxPg/eSRIRkxP1cm5SPAT1FstooOtxZn5GRjOCXWIm6G+gvF4SuwgjS+cArS3J0JuDbzFJI2RYuOPMHwH9GBQVmwQ1LfRiahxyEYTsiu3/b6pPi6tYU2hc5owlkIB0aINyKpnpZtAThgb8xWq1TNWNHstyUcEZ/MacNeRQk7ge5ikTsjW5Q0MwdppT4euE65kNiJx0wbs541GQ1LagN2rsU0aHZUZkipVr4S53xJzFDd1Jlec4sS88ZMfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SA1PR11MB8491.namprd11.prod.outlook.com (2603:10b6:806:3ac::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Thu, 10 Oct
 2024 01:59:05 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8026.020; Thu, 10 Oct 2024
 01:59:04 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2 V2] redis: upgrade 6.2.14 -> 6.2.16
Date: Thu, 10 Oct 2024 09:58:44 +0800
Message-Id: <20241010015845.4140358-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: TYCP286CA0092.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::10) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SA1PR11MB8491:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fd8569c-8c13-444f-729f-08dce8cf1dec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dVQ3R003ZElNY0lhYjB3WkRmUDVPenVqdVdIR0E1cVZ6QVRrbWx4c01RWjVt?=
 =?utf-8?B?RDB1M2VvN08vV0ZSMHpodjBGT2RWVUpTLzRWVUIrbWI0bzZ3VkR0UEVWamVZ?=
 =?utf-8?B?aWlZV3ZneGJBSnZxVzdKVmVPZHl3dzBNMjRKT2U4UndRTVZ2YWVBMzVDK200?=
 =?utf-8?B?RjBaRDR5OHN0bGJ1NmdGSHRqZTJGMUEzNFZ3bmh0MDkrZC9sK1h4dzZYNVM4?=
 =?utf-8?B?R3JGODdPeTBmbFV3VHU0R3dCYTErUUhVVWROYlNJL1R6czUya2hpMHZpY0t2?=
 =?utf-8?B?cHJ4S3hDZ1d0eVhMK1lzUktGdnh1aUFkZnNLTmlzTFpueGlhK3M1VTFGcWwv?=
 =?utf-8?B?UVRrWGNFV29INlZjamowcm0zcU1qTWh4TkVsc3JMTzlSaWVIbllUUWVCMnlS?=
 =?utf-8?B?YkVFUkkzTThSS1V1SUI1Wkk5YUZXV0FzUzJPczFWOUNJYkdPaUZJMGxSTnpu?=
 =?utf-8?B?RU8zQ2NTZ0k5UnQxUkdaU2ZwVk12N0x3U1RXRkJTUExRMDZ3RG9CazVnUFZr?=
 =?utf-8?B?dFJ0L3U5SVE4TXc4NzNhMVdldFhwblVHSjRhWUZXcEhGenhmVy9hRDhKUHZY?=
 =?utf-8?B?bERLSkYrSmJkSTBMbHc3OTE1czd3Z25aaUNrcHdXNm5FU1BmYUQvSUgxOC93?=
 =?utf-8?B?QjVBdThndTlLSkswNE0wNVUvdkpVYjBaMm5uUWptRjM5MDJxbTNzY3FQaGJv?=
 =?utf-8?B?dldCK3VqcUwxYUx2b2NNa1ZnSm1VNW02UWZpOUhaak1RN09HNkNXRjRMN3lo?=
 =?utf-8?B?YmxmRWIwR1drenFKL0RvM0xFQUFta1ZWdTM0Q2pBWkg2OVBJNi9LbnFwMEFN?=
 =?utf-8?B?YmVmczNKNjcwNWRKbHRqQllaM243QWVnNkpMYTNJQVpTY3E4RjNUV0VpWlly?=
 =?utf-8?B?ZjFkQXM0R2dsSVhSTDV2QmdBdm1HNXdQamN1WHoxTXVHVFZEcFBiL0tId2Rl?=
 =?utf-8?B?UmJtTkcxTElpaE9iRE1TQjdyTWtIMjZQeXIxWURDOGJZcDRBeTVDZS83QWNC?=
 =?utf-8?B?cG8va3Q5TjJIbnNWSVFoVWJpSVV5VXRhbGtVMmxJanFoSi9CN2VtVk1pUjNC?=
 =?utf-8?B?Q2FZcDZoYm1MbXMrZmhERUNBVllCRjdiWDlGM1pEbjAxeU4zaEdtKzkwS3Zj?=
 =?utf-8?B?R24zenNrRnQrdmtPQTA4NWNYditMckY4dFBzMEhqaGd3YmtlcGFIMzRHZ3Jy?=
 =?utf-8?B?MjNNNGV2MFFhc2xKeklIMUVZN1NxWFVwNmIvSWhRSXRtcHhpeHIzcDB3R2Fq?=
 =?utf-8?B?aTJsYVh0OS9acmRQOEtlVjE0dHFFWTR6R0lqOWNkZUdhdUFiZDVTMVVTODhU?=
 =?utf-8?B?SXB2L3FEWGFpZkJyUkRWbHhieFZhQmZJT3NZMC9XdWY1djROdVJFM2UwOC9r?=
 =?utf-8?B?YTdQdTkvRWYrRXVmUnhUS2hMMHVtMFQyRmRDS21NdjZ6Mkp5ckUycVI2aS9H?=
 =?utf-8?B?Z2s5S0NCYWpna1g5Sm9oeGhraFpVS3I3RnlsaTJydGtwNGIyaitUQmIxaHlS?=
 =?utf-8?B?OHVRa3ZvbUVYOEY2WHRqU1RUaVlZWEx4VWxXT3NMVFhBRlFoUjlQWGpnK2dt?=
 =?utf-8?B?aFliRU5mYjJHK2d6emZVUEloa2VsUUEwVDdVUStBQzdTYlRTYWFxc25JWThR?=
 =?utf-8?B?TmxERys4OEtmNTUvYlJIRHB4MllnNTVXR3dxdGhwZ084c01KdFlBUHowSnFx?=
 =?utf-8?B?ekFnQjNXd3duV09NWmQvUHliMldmLzZlZTUyYm5kNlJWdkpSQzN3aE5nPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?alQrbzdka2h2U3daQTAyT3piSjVpNktrc2hhc2N1c2ZQbTJ2Qy90enRjUGly?=
 =?utf-8?B?R09tWHVoSUJmd0IrOFMwekdhNU54WWhwQVA5VDdzQlFqc2xLUjA0dFcvN1gr?=
 =?utf-8?B?TVc5cjMxczBiN2tBM0xVUmRpa0JTb2V5TUJibThxOE9FM3hTK0pqMXJYL29w?=
 =?utf-8?B?eG9UWEc0YVBYZW1iWHJZV29kNG5QWmtQMERZSzkxMlBKMzQzNE51bmNhbWlh?=
 =?utf-8?B?ZXp1eit6OUlITStOeVF1cldHVjBFbytBVnlYNkgrVDNhRUhEWnpYRHNJcVVi?=
 =?utf-8?B?ODBEL1ZWTGg2WEtXR2lPQ1ZWRDFnbzV0bHpYWjhkSEgrNHRUSmQrWTYzOFNC?=
 =?utf-8?B?K2xQUStFWDVKWm8yc29mL3cxRkM2T2JYWk5VVUlyRFNJVFR2enUzcHBaVE9o?=
 =?utf-8?B?RTdPYXA5cmpqSmprOFAwcVFLSFRMNncyMXdkaEhsMFhpQytuZGlQUUpVVHhB?=
 =?utf-8?B?SWhVb3hMUS9WK01LblBIcWNiV2FqcnVJWWlvcDZPMDFkdkdEdmhsSHhGTzRo?=
 =?utf-8?B?bGdSMHVSMFhYZnR6aUhuVjUwcjN4Ums3OFZ0VzRXcDlZSWpyeEY1YlJzMnE0?=
 =?utf-8?B?UE5qWTdKOGgrWDRhWkJraTVMd0xMVVlCbzY0S2JQM2FTK0NCV1IvRzhpQmk1?=
 =?utf-8?B?dGMrdDAyeVBMZ0ZiYTVMU0R5VTFaOGsyKzF5ekhkWHJVWmsvcnVQOGlCUElv?=
 =?utf-8?B?S3FIUndSa3VDTEREYTdCaWpudDVGclNCY3Y2OFM0cXJvemxhVkVwVkcvOTlz?=
 =?utf-8?B?RkVUYU5GQVN2Qnhua0lKaVgvRmQ5MmNrNXhqY1F6NHkzME1IQ2ZFU1Yrb1pO?=
 =?utf-8?B?Sitxa3IxS3lvMzFkZGxaSEtvaG9CUzRNcU44eXptNi9NazAweE5kMXhkZlVP?=
 =?utf-8?B?bTdHVXRzejVwbkpVUUlnZUE1czdXd3A4aTYyZXhKVklDbE9Ea2RuYkkrdW5W?=
 =?utf-8?B?MlFwaXgxRm90cXAxQ0NpZGhPWVlnNC9pT2s4M2VOZDJnd3hoeDYyYWh0ZDNh?=
 =?utf-8?B?R0hJSWU5L1A1MDZLU0lYYnJxWitxdktreDBmbVlrcCtnTm9odFc4cDRGUFYv?=
 =?utf-8?B?d3dTKzRQVnZydGZndWs5clgvUndRSjRUS291cVBVOEZpTC9OR3EvcFo2YWkr?=
 =?utf-8?B?VldvZnVmdEplQlRJMHR5V2xKR1dTSlh1b3VJSE1RVUJEWFpSTHc2eEJodUFK?=
 =?utf-8?B?M1FtYVJrNm90dG0yM1ppRGZ3bVBna1hKcldTalAzWHNOZjlJTDA3RzlTVmNL?=
 =?utf-8?B?a0gwQjdFeGFaci92bDZrZkhBVVFEdGxkR3U2S1RKYVBpOWZ2bnR6eDhqSlJl?=
 =?utf-8?B?T3dqaGZOcDlLMW44UmlEU0NqTHBRZHlvMTYrRytFVzdpTnNQU1owcUF5TEhq?=
 =?utf-8?B?Uk1vUVladkczdWRXU2VhM1B0SzJhQTRuSWVuRnFDUEJGcGdTeHJWd0lNOGJY?=
 =?utf-8?B?QmRZZFgxdkNpbXVPRTI2YXJ0OHhiKzVIWkZERUNrWm9lTStPZFYzVXl1R3lP?=
 =?utf-8?B?dmlLR3VLcm92VThnd01XRExQdmNWdHFnRFp6dVFXWHNZRUdHTDIzUXNod05h?=
 =?utf-8?B?aFh3VjVIR0cxNWRSbzR4QUhERGovN1R1SnM0OW4rcWtxMUd2amRXb2FoaW9l?=
 =?utf-8?B?cVkwT3VWY1ZWUHpCZmx1VU9HcTIxdTNZU1cvaDBjR3QxNHRtQnVXNVJabHo2?=
 =?utf-8?B?WEdWSWNMK1Q2VG1TUXl5TTdicmd0K3BOS2FzdTVuTTE0QUMvWjFoOFp6eWRa?=
 =?utf-8?B?OVg2TTltNjdGQzZ0SHBKbDFJaFBwZGNZM2lnSTEvNUswbG9KV0Y3dENld1dV?=
 =?utf-8?B?dmZpeTdURElvbkhyaTYzQ1dVRlpxcTNtWVhTWkIzT21lSXFNMEYvS3F5TWRH?=
 =?utf-8?B?bWwweWRWSHZtTTF0V0ZranFyY2g1OUdHbGJNbjhaRXFHUkp6WHVDY1g0eWlP?=
 =?utf-8?B?dnlxSzA0MWtPT1REREpFRnYwS1FtQm92RThyU2Z1SGlIYTlaeWFaYUNPY3l2?=
 =?utf-8?B?THdMbVFDUjEzWUl3RkZYZ29ncUNPNHkrcC9FWS82ZUlrYU1qSEh3bnJpeVVM?=
 =?utf-8?B?ZGVFZ0RYUXAraFd1TTl3bDdJVlR6L04wL2xlNDJzK044RDBobVJFdTJ1MzdL?=
 =?utf-8?Q?fP6WtpfI2t7MB3+404NLZKtZT?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fd8569c-8c13-444f-729f-08dce8cf1dec
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 01:59:03.9925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vjnaRbiRjoXegaWtROYiSfnqJUEqAeu1n8WUSHHpfa+J7pKzYGL3Z4Xf5zzrnQ+yAyRj3vsnuNvfhT73d+l+Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8491
X-Authority-Analysis: v=2.4 cv=AKB5nO5v c=1 sm=1 tr=0 ts=670734ec cx=c_pps a=zz2QubYGG/9FVtTd3zWqHQ==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=1KubnttrAAAA:8
 a=JF9118EUAAAA:8 a=pGLkceISAAAA:8 a=7UKGVgRVAAAA:8 a=V4tb18-pIKpFZfX4vkcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=H0t3PWKhy-h45uLjrunQ:22 a=xVlTc564ipvMDusKsbsT:22 a=8Ox4Rr8FuIIqx5qz5MW0:22
X-Proofpoint-GUID: mTZihLw0xENQkKsH9zgbiGLZQvGJMbBB
X-Proofpoint-ORIG-GUID: mTZihLw0xENQkKsH9zgbiGLZQvGJMbBB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-09_23,2024-10-09_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 clxscore=1015 spamscore=0
 adultscore=0 priorityscore=1501 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2409260000
 definitions=main-2410100011
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 49A0EWp9024568
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Oct 2024 01:59:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112754

ChangeLog:

Security fixes
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
* (CVE-2024-31449) Lua library commands may lead to stack overflow and
  potential RCE.
* (CVE-2024-31228) Potential Denial-of-service due to unbounded pattern
  matching.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
V2 change: fix build on riscv32

 ...1-hiredis-use-default-CC-if-it-is-set.patch} | 14 +++++++-------
 ...file-to-use-environment-build-setting.patch} | 10 +++++-----
 ...0003-hack-to-force-use-of-libc-malloc.patch} |  9 ++++-----
 ...h =3D> 0004-src-Do-not-reset-FINAL_LIBS.patch} |  8 ++++----
 ...URCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch} |  6 ++----
 .../0006-Define-correct-gregs-for-RISCV32.patch | 12 +++++-------
 .../redis/redis/init-redis-server               |  0
 .../redis/{redis_6.2.14.bb =3D> redis_6.2.16.bb}  | 17 +++++++++--------
 8 files changed, 36 insertions(+), 40 deletions(-)
 rename meta-oe/recipes-extended/redis/redis/{hiredis-use-default-CC-if-i=
t-is-set.patch =3D> 0001-hiredis-use-default-CC-if-it-is-set.patch} (85%)
 rename meta-oe/recipes-extended/redis/redis/{lua-update-Makefile-to-use-=
environment-build-setting.patch =3D> 0002-lua-update-Makefile-to-use-envi=
ronment-build-setting.patch} (93%)
 rename meta-oe/recipes-extended/redis/redis/{oe-use-libc-malloc.patch =3D=
> 0003-hack-to-force-use-of-libc-malloc.patch} (92%)
 rename meta-oe/recipes-extended/redis/redis/{0001-src-Do-not-reset-FINAL=
_LIBS.patch =3D> 0004-src-Do-not-reset-FINAL_LIBS.patch} (86%)
 rename meta-oe/recipes-extended/redis/redis/{GNU_SOURCE.patch =3D> 0005-=
Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch} (91%)
 mode change 100755 =3D> 100644 meta-oe/recipes-extended/redis/redis/init=
-redis-server
 rename meta-oe/recipes-extended/redis/{redis_6.2.14.bb =3D> redis_6.2.16=
.bb} (79%)

diff --git a/meta-oe/recipes-extended/redis/redis/hiredis-use-default-CC-=
if-it-is-set.patch b/meta-oe/recipes-extended/redis/redis/0001-hiredis-us=
e-default-CC-if-it-is-set.patch
similarity index 85%
rename from meta-oe/recipes-extended/redis/redis/hiredis-use-default-CC-i=
f-it-is-set.patch
rename to meta-oe/recipes-extended/redis/redis/0001-hiredis-use-default-C=
C-if-it-is-set.patch
index d2a1b45e6..51a6e9c95 100644
--- a/meta-oe/recipes-extended/redis/redis/hiredis-use-default-CC-if-it-i=
s-set.patch
+++ b/meta-oe/recipes-extended/redis/redis/0001-hiredis-use-default-CC-if=
-it-is-set.patch
@@ -1,11 +1,16 @@
-From dc745a33f3875cc72d41bd34ed490b352e546352 Mon Sep 17 00:00:00 2001
+From 67990f216f2fbbc8a6699c700dfc089aa617905f Mon Sep 17 00:00:00 2001
 From: Venture Research <tech@ventureresearch.com>
 Date: Fri, 8 Feb 2013 17:39:52 -0600
 Subject: [PATCH] hiredis: use default CC if it is set
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
=20
 Instead of trying to automagically figure out CC, which breaks with OE
 as CC has spaces in it, just skip it if one was already passed in.
=20
+Upstream-Status: Pending
+
 Signed-off-by: Venture Research <tech@ventureresearch.com>
=20
 Update to work with 4.0.8
@@ -14,13 +19,11 @@ Signed-off-by: Alistair Francis <alistair.francis@wdc=
.com>
 Reworked for 6.0.4
 Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
 ---
-Upstream-Status: Pending
-
  deps/hiredis/Makefile | 2 --
  1 file changed, 2 deletions(-)
=20
 diff --git a/deps/hiredis/Makefile b/deps/hiredis/Makefile
-index 25ac154..569f82b 100644
+index 7e41c97..54717e3 100644
 --- a/deps/hiredis/Makefile
 +++ b/deps/hiredis/Makefile
 @@ -42,8 +42,6 @@ endef
@@ -32,6 +35,3 @@ index 25ac154..569f82b 100644
  OPTIMIZATION?=3D-O3
  WARNINGS=3D-Wall -W -Wstrict-prototypes -Wwrite-strings -Wno-missing-fi=
eld-initializers
  DEBUG_FLAGS?=3D -g -ggdb
---=20
-2.21.3
-
diff --git a/meta-oe/recipes-extended/redis/redis/lua-update-Makefile-to-=
use-environment-build-setting.patch b/meta-oe/recipes-extended/redis/redi=
s/0002-lua-update-Makefile-to-use-environment-build-setting.patch
similarity index 93%
rename from meta-oe/recipes-extended/redis/redis/lua-update-Makefile-to-u=
se-environment-build-setting.patch
rename to meta-oe/recipes-extended/redis/redis/0002-lua-update-Makefile-t=
o-use-environment-build-setting.patch
index aade7afd0..17b533669 100644
--- a/meta-oe/recipes-extended/redis/redis/lua-update-Makefile-to-use-env=
ironment-build-setting.patch
+++ b/meta-oe/recipes-extended/redis/redis/0002-lua-update-Makefile-to-us=
e-environment-build-setting.patch
@@ -1,4 +1,4 @@
-From 097a2b259cb266c2c861dc74fa6f80712d6138c5 Mon Sep 17 00:00:00 2001
+From ef989aab052510bfda32b2b325a5f80b76c42677 Mon Sep 17 00:00:00 2001
 From: Venture Research <tech@ventureresearch.com>
 Date: Fri, 8 Feb 2013 20:22:19 -0600
 Subject: [PATCH] lua: update Makefile to use environment build settings
@@ -6,6 +6,8 @@ Subject: [PATCH] lua: update Makefile to use environment =
build settings
 OE-specific parameters, instead of overriding all of these simply use
 the ones that are already passed in. Also configure for only Linux...
=20
+Upstream-Status: Pending
+
 Signed-off-by: Venture Research <tech@ventureresearch.com>
=20
 Updated to work with 3.0.x
@@ -15,18 +17,16 @@ Signed-off-by: Armin Kuster <akust808@gmail.com>
 updated to work wtih 6.2.1
 Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
 ---
-Upstream-Status: Pending
-
  deps/Makefile         |  1 -
  deps/lua/Makefile     |  1 -
  deps/lua/src/Makefile | 16 ++++++----------
  3 files changed, 6 insertions(+), 12 deletions(-)
=20
 diff --git a/deps/Makefile b/deps/Makefile
-index ff16ee9..d8d64aa 100644
+index cbe3aef..76bc222 100644
 --- a/deps/Makefile
 +++ b/deps/Makefile
-@@ -74,7 +74,6 @@ LUA_LDFLAGS+=3D $(LDFLAGS)
+@@ -81,7 +81,6 @@ endif
  # lua's Makefile defines AR=3D"ar rcu", which is unusual, and makes it =
more
  # challenging to cross-compile lua (and redis).  These defines make it =
easier
  # to fit redis into cross-compilation environments, which typically set=
 AR.
diff --git a/meta-oe/recipes-extended/redis/redis/oe-use-libc-malloc.patc=
h b/meta-oe/recipes-extended/redis/redis/0003-hack-to-force-use-of-libc-m=
alloc.patch
similarity index 92%
rename from meta-oe/recipes-extended/redis/redis/oe-use-libc-malloc.patch
rename to meta-oe/recipes-extended/redis/redis/0003-hack-to-force-use-of-=
libc-malloc.patch
index e76bdbc26..f1021eef6 100644
--- a/meta-oe/recipes-extended/redis/redis/oe-use-libc-malloc.patch
+++ b/meta-oe/recipes-extended/redis/redis/0003-hack-to-force-use-of-libc=
-malloc.patch
@@ -1,4 +1,4 @@
-From 1fa047162983d4a7e0576f0837a73a6027a783bd Mon Sep 17 00:00:00 2001
+From b9586abcb803747301f6cc4ff93c7642bef693ea Mon Sep 17 00:00:00 2001
 From: Venture Research <tech@ventureresearch.com>
 Date: Wed, 6 Feb 2013 20:51:02 -0600
 Subject: [PATCH] hack to force use of libc malloc
@@ -9,19 +9,18 @@ removed in favor of magic.
 Note that this of course doesn't allow tcmalloc and jemalloc, however
 jemalloc wasn't building correctly.
=20
+Upstream-Status: Pending
+
 Signed-off-by: Venture Research <tech@ventureresearch.com>
=20
 Update to work with 4.0.8
 Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
-
 ---
-Upstream-Status: Pending
-
  src/Makefile | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
=20
 diff --git a/src/Makefile b/src/Makefile
-index ecd6929..c7f43c5 100644
+index 7d75c83..35dd314 100644
 --- a/src/Makefile
 +++ b/src/Makefile
 @@ -13,7 +13,8 @@
diff --git a/meta-oe/recipes-extended/redis/redis/0001-src-Do-not-reset-F=
INAL_LIBS.patch b/meta-oe/recipes-extended/redis/redis/0004-src-Do-not-re=
set-FINAL_LIBS.patch
similarity index 86%
rename from meta-oe/recipes-extended/redis/redis/0001-src-Do-not-reset-FI=
NAL_LIBS.patch
rename to meta-oe/recipes-extended/redis/redis/0004-src-Do-not-reset-FINA=
L_LIBS.patch
index 66ab0ee33..958106e26 100644
--- a/meta-oe/recipes-extended/redis/redis/0001-src-Do-not-reset-FINAL_LI=
BS.patch
+++ b/meta-oe/recipes-extended/redis/redis/0004-src-Do-not-reset-FINAL_LI=
BS.patch
@@ -1,4 +1,4 @@
-From 97584e1eb78dc18599534b47b6670c20c63f5ee2 Mon Sep 17 00:00:00 2001
+From a4d87aca1c00c53b386ee7490223971e00873add Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 10 Sep 2019 20:04:26 -0700
 Subject: [PATCH] src: Do not reset FINAL_LIBS
@@ -9,17 +9,17 @@ environment to get it going
 e.g. -latomic is needed on clang/x86 to provide for 64bit atomics
=20
 Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
=20
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  src/Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/src/Makefile b/src/Makefile
-index 5564351..83ccd76 100644
+index 35dd314..3770f96 100644
 --- a/src/Makefile
 +++ b/src/Makefile
-@@ -91,7 +91,7 @@ endif
+@@ -93,7 +93,7 @@ endif
 =20
  FINAL_CFLAGS=3D$(STD) $(WARN) $(OPT) $(DEBUG) $(CFLAGS) $(REDIS_CFLAGS)
  FINAL_LDFLAGS=3D$(LDFLAGS) $(REDIS_LDFLAGS) $(DEBUG)
diff --git a/meta-oe/recipes-extended/redis/redis/GNU_SOURCE.patch b/meta=
-oe/recipes-extended/redis/redis/0005-Define-_GNU_SOURCE-to-get-PTHREAD_M=
UTEX_INITIALIZER.patch
similarity index 91%
rename from meta-oe/recipes-extended/redis/redis/GNU_SOURCE.patch
rename to meta-oe/recipes-extended/redis/redis/0005-Define-_GNU_SOURCE-to=
-get-PTHREAD_MUTEX_INITIALIZER.patch
index 20f689bd0..d73c66c9d 100644
--- a/meta-oe/recipes-extended/redis/redis/GNU_SOURCE.patch
+++ b/meta-oe/recipes-extended/redis/redis/0005-Define-_GNU_SOURCE-to-get=
-PTHREAD_MUTEX_INITIALIZER.patch
@@ -1,4 +1,4 @@
-From 98d526f76049be21bf3d77158236b2189419a78e Mon Sep 17 00:00:00 2001
+From 2e6311c9c7cd85bf63eab8fe92c08ec1ec01b6fc Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 21 Dec 2019 12:09:51 -0800
 Subject: [PATCH] Define _GNU_SOURCE to get PTHREAD_MUTEX_INITIALIZER
@@ -9,6 +9,7 @@ Fixes
 |       |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~
=20
 Upstream-Status: Pending
+
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  src/zmalloc.c | 1 +
@@ -26,6 +27,3 @@ index 1f33d09..5e182d1 100644
  #include <stdio.h>
  #include <stdlib.h>
  #include <stdint.h>
---=20
-2.25.1
-
diff --git a/meta-oe/recipes-extended/redis/redis/0006-Define-correct-gre=
gs-for-RISCV32.patch b/meta-oe/recipes-extended/redis/redis/0006-Define-c=
orrect-gregs-for-RISCV32.patch
index 9d7e50271..bb3f5c607 100644
--- a/meta-oe/recipes-extended/redis/redis/0006-Define-correct-gregs-for-=
RISCV32.patch
+++ b/meta-oe/recipes-extended/redis/redis/0006-Define-correct-gregs-for-=
RISCV32.patch
@@ -1,9 +1,10 @@
-From 26bd72f3b8de22e5036d86e6c79f815853b83473 Mon Sep 17 00:00:00 2001
+From 6149911f7a6fbaef3ed418408e2b501fa9479ffa Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 26 Oct 2020 21:32:22 -0700
 Subject: [PATCH] Define correct gregs for RISCV32
=20
 Upstream-Status: Pending
+
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
=20
 Updated patch for 6.2.1
@@ -13,10 +14,10 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
  1 file changed, 24 insertions(+), 2 deletions(-)
=20
 diff --git a/src/debug.c b/src/debug.c
-index 5318c14..8c21b47 100644
+index bb76c5d..55a0696 100644
 --- a/src/debug.c
 +++ b/src/debug.c
-@@ -1055,7 +1055,9 @@ static void* getAndSetMcontextEip(ucontext_t *uc, =
void *eip) {
+@@ -1067,7 +1067,9 @@ static void* getAndSetMcontextEip(ucontext_t *uc, =
void *eip) {
      #endif
  #elif defined(__linux__)
      /* Linux */
@@ -27,7 +28,7 @@ index 5318c14..8c21b47 100644
      GET_SET_RETURN(uc->uc_mcontext.gregs[14], eip);
      #elif defined(__X86_64__) || defined(__x86_64__)
      GET_SET_RETURN(uc->uc_mcontext.gregs[16], eip);
-@@ -1222,8 +1224,28 @@ void logRegisters(ucontext_t *uc) {
+@@ -1234,8 +1236,28 @@ void logRegisters(ucontext_t *uc) {
      #endif
  /* Linux */
  #elif defined(__linux__)
@@ -57,6 +58,3 @@ index 5318c14..8c21b47 100644
      serverLog(LL_WARNING,
      "\n"
      "EAX:%08lx EBX:%08lx ECX:%08lx EDX:%08lx\n"
---=20
-2.25.1
-
diff --git a/meta-oe/recipes-extended/redis/redis/init-redis-server b/met=
a-oe/recipes-extended/redis/redis/init-redis-server
old mode 100755
new mode 100644
diff --git a/meta-oe/recipes-extended/redis/redis_6.2.14.bb b/meta-oe/rec=
ipes-extended/redis/redis_6.2.16.bb
similarity index 79%
rename from meta-oe/recipes-extended/redis/redis_6.2.14.bb
rename to meta-oe/recipes-extended/redis/redis_6.2.16.bb
index 2433abba5..40473461a 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.14.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.16.bb
@@ -10,19 +10,20 @@ SRC_URI =3D "http://download.redis.io/releases/${BP}.=
tar.gz \
            file://redis.conf \
            file://init-redis-server \
            file://redis.service \
-           file://hiredis-use-default-CC-if-it-is-set.patch \
-           file://lua-update-Makefile-to-use-environment-build-setting.p=
atch \
-           file://oe-use-libc-malloc.patch \
-           file://0001-src-Do-not-reset-FINAL_LIBS.patch \
-           file://GNU_SOURCE.patch \
+           file://0001-hiredis-use-default-CC-if-it-is-set.patch \
+           file://0002-lua-update-Makefile-to-use-environment-build-sett=
ing.patch \
+           file://0003-hack-to-force-use-of-libc-malloc.patch \
+           file://0004-src-Do-not-reset-FINAL_LIBS.patch \
+           file://0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZ=
ER.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
-           "
-SRC_URI[sha256sum] =3D "34e74856cbd66fdb3a684fb349d93961d8c7aa668b06f81f=
d93ff267d09bc277"
+          "
+
+SRC_URI[sha256sum] =3D "846bff83c26d827d49f8cc8114ea9d1e72eea1169f7de36b=
8135ea2cec104e7d"
=20
 inherit autotools-brokensep update-rc.d systemd useradd
=20
 FINAL_LIBS:x86:toolchain-clang =3D "-latomic"
-FINAL_LIBS:riscv32:toolchain-clang =3D "-latomic"
+FINAL_LIBS:riscv32 =3D "-latomic"
 FINAL_LIBS:mips =3D "-latomic"
 FINAL_LIBS:arm =3D "-latomic"
 FINAL_LIBS:powerpc =3D "-latomic"
--=20
2.25.1


