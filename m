Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA5F9CEDDB7
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 01:41:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.33877.1728524482779078320
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Oct 2024 18:41:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=00130c5401=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49A0EWoW024568
	for <openembedded-devel@lists.openembedded.org>; Wed, 9 Oct 2024 18:41:22 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4234ykvs0n-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 09 Oct 2024 18:41:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JtG63voLK1KzkrJ+cTQkNBvdod4epy2mxUZQI8Lz3Kxz2gxQym4UK8FEPZai+s+iXyL1h4tDz5vdUcXNm6vopm8vc0Ceoeq1Q65IO6C5kfa5JQ/z9uNwTsGt3pdim7gcG3NFlaNanaFGtfOHinX5+Ktzzn9rx26m7TUYp09sYGmX7Lvgtrd9C6JfumBpoLArFZtJ8G6ObrgyNXdqyoMR23a5aUkRpLDteHm7j3ezoG02DbFnAF5IqsCqJ98VSgjqb77SVGEaR3R2dWR3PwFLmShlHTV0GxKr8TBvz4zcBOi+Za8hSD0t2sLftzMCPRMQA+I5LLAVpSdPXNsBJ2Dwbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wTmLFbKSBGnDIEvfb+v+NEsBdz06hMSTiCkmHOEyJy0=;
 b=QlYS5H9OiZ5J1HW0jKxD0EPgBcIndzfHgNQCEABZIs76V8di/AE8MmgaK6uAypjLbIpfrGNhyDerp3qUzIKU+Is5zgWwQjkd6NiA5PDjhaRF843zxAT96vsuZyxdp3e6pZzIohMSGLXwZ8lZ2fgkcam2sAzDi01Yb8guZ1azs7+qn7LayXu++b5BdGompnqfhfAkQNXT/8iCTgTNjt0sd6TXuYvBjipULhWBAWJ416qr53nxDa+yygXR/Cr1y74+a0wegAJ460j0yqwcvJhh/DmZv+hvE/Uzu/NqMaWPuXBJZtGLabagRr9sd6oYSn8TsPowSJAsEpQgMGXBxcKvfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8048.16; Thu, 10 Oct 2024 01:41:18 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8026.020; Thu, 10 Oct 2024
 01:41:18 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 3/4] redis: upgrade 6.2.14 -> 6.2.16
Date: Thu, 10 Oct 2024 09:38:15 +0800
Message-Id: <20241010013816.4084737-3-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241010013816.4084737-1-yi.zhao@windriver.com>
References: <20241010013816.4084737-1-yi.zhao@windriver.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: TYCP286CA0174.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::15) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DS0PR11MB8718:EE_
X-MS-Office365-Filtering-Correlation-Id: 93e68f93-e497-4be6-7417-08dce8cca2f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?L2VFMHBGSGc0MEdjRXo1dDNlRmR6bHVva3FZSnViRytiV3ZzK2Y1bGRZazhQ?=
 =?utf-8?B?Si95cDVGaWR0NE9YYXNrM0cxRDB0M0RMakpVMDRTWTRyN0ZxK1BETmlBVWNo?=
 =?utf-8?B?S3NOVjNWdDNaNDZ6ZHRIL1hRMjRHd20vUGwxU3ZTa1NQUVROTHc0RktHWHh0?=
 =?utf-8?B?R0g2VEtoWk5EbWh4MGZXYUYwQWFRZnYzZmltSmhiWlROaVdFdkpUSFVxZnpY?=
 =?utf-8?B?amNpWUx4YzFPQ0trblQzaFptdnFvTDdISG5ORzRZSVJNNVBvVnEyd1V3d1NN?=
 =?utf-8?B?a04zVDNTSnNmR2hydlJvOEVjdm5hd25XOUhCQk9TOFFVU05TZE4zb3IrRXgr?=
 =?utf-8?B?MFdwcm1tRHl0bXhGcUxQOVQxRlZTak94czJheUhFcmRyMi9zUDFwN2o5dHpl?=
 =?utf-8?B?REI5SG1naGJtL0p3b1pSQzR1RndDZVFxN1U2eTc0bi9oMFVjRDZWM2FIMFBr?=
 =?utf-8?B?ajFFeVlSenEwS3lJdXZoVTgrN0NhMVh4NGZMbi9mNnZLc0RGSHYwQmNucWFH?=
 =?utf-8?B?OVJweUhJTmRzRVJwKzdQVVR4cnpLaVN6YjlHYW55QnRDRE5YOCtodEIrVENv?=
 =?utf-8?B?WmpVcWR5citEaUkxQ0dFbXBRVi9vUTU5bldNekhGeUl5cGlJeXZWRUVsQXJZ?=
 =?utf-8?B?dVJINDkvN2FPU2xaeTFBTWx3K0t2Rk9jMnp5USt5UnhKeDlkYUtDZkxhTzNt?=
 =?utf-8?B?Q2tZeUtYTERDaDFmUWdxVHo4azVhZHBCdDhGMVJRUElkbHJ6eFZZMjJIVDYz?=
 =?utf-8?B?dC9FMXY1aW4yblJEUHJudUxPVmNQb2hCYnhodlErVzd6ZmxhSitYTzc2T21u?=
 =?utf-8?B?QnAyWjJ6V3ZKd3RnZDk2bk5BaGJLTkhzZ1pZQmhHNkFWeTJwaDljVkF1N3BZ?=
 =?utf-8?B?ZHR0dVlKTXVjK09USTMvMWFhZS9EZ0xtdTBLNmZURTNhOWVxVUU3dUozTWxw?=
 =?utf-8?B?b0dxMVVhTHRBZnNWNUgxanR1Q3RzVCtzQUlpM3FtTzdORC9oY3piTjV6VHZa?=
 =?utf-8?B?U3ZJaEdteldTaGdPZTFDc3lqTksvQTlkbDZ0Z2IxYTVyTFpUaXJKSEErdGlT?=
 =?utf-8?B?a1h1S2tlei9uYTN4blJGcExPWDNtM2V0ZmxvbU50Y1hLWXF3VENoMnREYllU?=
 =?utf-8?B?WHdRVXZmczJVN2ZLYitBOGpOaWI4eklmNW45MkJZVXN3T3Q5RWpXQzZjK0pC?=
 =?utf-8?B?UFNna3lHQm40bjFBajZNVFlWWVo0YUt1WS9wb0x1V1J2M3NMY3FMYk9DSkZn?=
 =?utf-8?B?b2hVMWJWenIya0IrNU9JRGF2d1hjWTVHKzRhSStOcDBqYXZDdDROeTl4V1BH?=
 =?utf-8?B?V2FEVzlubmUvOWY2SE5rMWI3MUVHTit3NlZTdjI1M3JYTHpVWEo4K1dLZE1M?=
 =?utf-8?B?RXM0Q1hDaU5vY0dySnEvMCsxY0VpZHRqdFhYSkphR1JZWDVMYXVzUEhlV3VP?=
 =?utf-8?B?T05Ob3E5MlNheE1GbEN1RTRxNGxLUHVPYUczK05xMUx6QU1IUWZ5M3BkRzUv?=
 =?utf-8?B?ZEhJWENVSzE3MXh2MDM0OXV1VENwWVdtOHhTTmdRUytjWTJseHZjM01icDIx?=
 =?utf-8?B?TWRxcW50a2lveFk3bjZJT2pHVlQyejBsZWYwNDFwM0FhQjRDeEpJcmgrT2VW?=
 =?utf-8?B?OWJ2UzhMaDdqSFk2ZGxLSHNkeGNBVFNuT3pJK0xNM3J1cnIwcWpFdWMwVWdI?=
 =?utf-8?B?UldGckl4VDdFZkIvbFhqNmNrRG9DZzNBQ1B0M0xrYU5SUVhObXJFMExRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b2hhdDFReVp4cHljRDBaMVBoKzhvRmh3YWRMUWdHUmdSTWdSblNQUXd0ajd5?=
 =?utf-8?B?bWw3NXpJc1MydFNHdnhJTFVGck1POExUenFSSitOZzhqUTlUd3hlVDZ6N0NZ?=
 =?utf-8?B?RG9HWnkrL0NBWTBXQXM2QmhLZ1FReVJTdXg3dDV6NjB6OEVDTmpJR1cvMXBP?=
 =?utf-8?B?cGpld0p1anBxSW5lVXFXVHUvNTBOZSs5RUw5Z1Buc2xnZ1F6T0p6TzhrdDhr?=
 =?utf-8?B?RTNYbzZ5S0hoNUNXaXRrK2w4WEdCV1RZeWpGaW9aMGw2WDkwV0dIU0FoRTVs?=
 =?utf-8?B?SmhLUDlyLzZrTHFxNjdXUjVqSlVFVFptZGQwSTF6bDkycjY2NVFZdG55M2VY?=
 =?utf-8?B?amkzT2Z1dzR2Vmd3UU1sZDY1ZWQ3QmVMMW4xQUUzb0JLcS9pUnhRdFovNDNS?=
 =?utf-8?B?Rk1mNkduTUZqRWZNcTNENzVpS3MxY3ByRmNRSG56Mk5NU2RLQWhwL2IwTlpq?=
 =?utf-8?B?eUxMY1ZadUpkY0ZNUnhIT2pONWo5bjhWTjBybHBzRXRlOW9sVmJIWEV4ZXpt?=
 =?utf-8?B?Wng2TWpWaWNsS0UyTUpmNy9YMkQzbmQ0UkFBQjBQNkROa1NSRW8rcXRrRlJa?=
 =?utf-8?B?YW1OdVg1T3NoTlJ1VzRQR2phUGdoQjE0RHdTR0RJaklnMEtGWURhUEpMdHB6?=
 =?utf-8?B?TTdyVHE5Y3pvUFZRTHR0WmRCNUhkb3F1TUd3MTJZOGVkSTk5NUtRNnBzYzJO?=
 =?utf-8?B?cDJ5RTMxc0lhUEFvbEo1YUduWmExUGNhT1hPZS9vekVvL3M3cTlRM0tEMENJ?=
 =?utf-8?B?UWVJbEpETnFzZE1vZnkvbFJzSytmcm1kNzRWREZGdkFIandmVHpSaTNtUEIx?=
 =?utf-8?B?aldrckNZWW1ERVdLK2tjUW43dzQ2N3hZdDNLaHlucXRnQzlHSkQ0WXJvbmg4?=
 =?utf-8?B?NWt5QXN3aHNmN0tFamlvR0t1aUMzRThYS0cwSERVVDZweEt3NytaU3U3a2Ni?=
 =?utf-8?B?aHVTMGMrd0p3UHA3Q3JpeXhsdHE2WE8wdmlFY3ZvSnpEdUlGR1FpdEE1akJL?=
 =?utf-8?B?Z1U4NzFybGROQmFxYzVmRm43Smsrc2g4RjVzQk9yeThxL3pQRnNqYTZwd0p5?=
 =?utf-8?B?R0lNMUs3RW9XR2JDMjRUV01mUElDd2NqdDV4RXhJUURHa0tuclhsR3FkeDc2?=
 =?utf-8?B?TmFtWjlGS0JIZlQ4NHk3S1cwdFVqbzRpaGtPeVZoMFFDUHYzUFE1V281NEZo?=
 =?utf-8?B?eURLd1hlNGswZTMvUUhtTG9tWmJvZkh2VHZ4eS9LcWNIY09aUzg4cm9wNCtE?=
 =?utf-8?B?RXZIZkhndGl1Z0FReGY5bmNEWnkrOFZtNUJSK0hPcXRNTmo2K1hVVWF5QU5a?=
 =?utf-8?B?b0pRSXVaeS96dTJVK2tiTDNsU3V5YzBTSXpQaElsUzdpV3FNeDR2ZDJtb3pS?=
 =?utf-8?B?RXF2bFlmZ3FkU29waTQzT0RBRnRuajVHdFBlN1luWUFLeUxmZ09Nb2dMRHFt?=
 =?utf-8?B?RDNUU0hQajgrWHpqMU1ZejZSU0U0WStZSURIT01oVDZFVExoeFp0MENGYmQy?=
 =?utf-8?B?MXMzdzcrMDFUVG8wQ1J6ZjRZdTAvVTlZdkJJbXZ0RXJzWVNTbjlSUnd1dzNH?=
 =?utf-8?B?NEJZYSt6TTZqN2UvTHRlVWVYajFXZ1poRVBZcXdUdm1ET09aMEtJTmdFaTha?=
 =?utf-8?B?L2o0U0lmM3RGRkJodFJEeWZzNXBXMHRXNzN1eW03OVRvekEvTjlJVEJNdkFV?=
 =?utf-8?B?cnA3eFBYUC94YTBWOCtxd0dhY0luR1hYUzJxL1dGZE5rcy9Ham5TaE1hVHg1?=
 =?utf-8?B?aTdCOXNmRHdKS2tPQytxRDllZngrSkJmTnhZVkpCRTd3NFE1cWpnUDFrRkxC?=
 =?utf-8?B?amQvTHFkemllQ3UzcHJkUmFuQzh2MVFUQkdORkVyWlhHbjdvbEpDazZraXNT?=
 =?utf-8?B?QkxQcHZPQm5xYzl6enhJMVdUMVNqNkhwU3pCYlZMc0pYeDROSkkzczExd05T?=
 =?utf-8?B?UDVxNmxDQjEya0FJRGo4TVlOZG0wNGd1VEs4K0lvcmUzMURNcG5iMmJhNjNO?=
 =?utf-8?B?SGxJUVlCcGczbDV4UnU4TndadFZGcFpUaWJoVUdlMFJtUDRnTmdXaHI2YmdI?=
 =?utf-8?B?dXRablpEVitJcWU5SnZKcWxHbllrcW82T1JEZVNSZlFNeTMrdUliVzQyY1dh?=
 =?utf-8?Q?GYkiomC/XrtS83xglVpc2Z9j6?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93e68f93-e497-4be6-7417-08dce8cca2f7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 01:41:18.7678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BbEm3EyxtBv/GnkBochwkmVN+3e8TPQnh83OlsVcV5pcVmw44sB7hJtwIxmetux++9MrPTqYqeMiY3BUGK5+4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8718
X-Authority-Analysis: v=2.4 cv=AKB5nO5v c=1 sm=1 tr=0 ts=670730c2 cx=c_pps a=F+2k2gSOfOtDHduSTNWrfg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=1KubnttrAAAA:8
 a=JF9118EUAAAA:8 a=pGLkceISAAAA:8 a=7UKGVgRVAAAA:8 a=V4tb18-pIKpFZfX4vkcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=H0t3PWKhy-h45uLjrunQ:22 a=xVlTc564ipvMDusKsbsT:22 a=8Ox4Rr8FuIIqx5qz5MW0:22
X-Proofpoint-GUID: jqXIwQG6UrUOOTuFgIF39MyHz1wVH_Ks
X-Proofpoint-ORIG-GUID: jqXIwQG6UrUOOTuFgIF39MyHz1wVH_Ks
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-09_23,2024-10-09_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 clxscore=1015 spamscore=0
 adultscore=0 priorityscore=1501 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2409260000
 definitions=main-2410100009
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 49A0EWoW024568
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Oct 2024 01:41:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112752

ChangeLog:

Security fixes
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
* (CVE-2024-31449) Lua library commands may lead to stack overflow and
  potential RCE.
* (CVE-2024-31228) Potential Denial-of-service due to unbounded pattern
  matching.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...001-hiredis-use-default-CC-if-it-is-set.patch} | 14 +++++++-------
 ...kefile-to-use-environment-build-setting.patch} | 10 +++++-----
 ...> 0003-hack-to-force-use-of-libc-malloc.patch} |  9 ++++-----
 ...tch =3D> 0004-src-Do-not-reset-FINAL_LIBS.patch} |  8 ++++----
 ...SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch} |  6 ++----
 .../0006-Define-correct-gregs-for-RISCV32.patch   | 12 +++++-------
 .../redis/redis/init-redis-server                 |  0
 .../redis/{redis_6.2.14.bb =3D> redis_6.2.16.bb}    | 15 ++++++++-------
 8 files changed, 35 insertions(+), 39 deletions(-)
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
.bb} (81%)

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
similarity index 81%
rename from meta-oe/recipes-extended/redis/redis_6.2.14.bb
rename to meta-oe/recipes-extended/redis/redis_6.2.16.bb
index 2433abba5..ce5bacaa5 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.14.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.16.bb
@@ -10,14 +10,15 @@ SRC_URI =3D "http://download.redis.io/releases/${BP}.=
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
--=20
2.25.1


