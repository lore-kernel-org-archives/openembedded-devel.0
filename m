Return-Path: <Liyin.Zhang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C349FCFC60D
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 07:32:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6272.1728631973244367602
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Oct 2024 00:32:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0014a34f0e=liyin.zhang.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49B4VKFK001650
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 07:32:52 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 426sdq88tc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 07:32:52 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49B7Wppa008785;
	Fri, 11 Oct 2024 07:32:51 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2046.outbound.protection.outlook.com [104.47.56.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 426sdq88tb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 07:32:51 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ohCBpKQLA84fJTY4PnF9k4i/gyWgCx6foL0AjS/aMBWnzmX6czygbI9fgDQMCiOUmHeEP22c51qGH6xz+UR9NbVzdwBa6Jguy2n7H9Ln0FAlBxIUFAdQeBL9jL+nK9oyUtm4a5gBVdaT86rfYzq54aDiNb1MhKR+rn9L3sgn+VezaI6j24/4/oeZC2PXROn8o2y68Biy56QbPfS2ZRUUvm7ki3NYtcy0O1g7I1R0qA3/LuuP79cCJ48IcDz2CBkyLjan8+BTMbGa3C917ty8U6v90hweFaEpZ7FzTvwmsd7bcPtxYwL5GqspRKzLPlbjqdlHczxbHpA2v6IZXhOYhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z1De7muEMgjCw15Ge+vyab3vhWlXbrSb04WEAV0mJrU=;
 b=mIboU+5E713Lmy3ZND6xrNG87CZXrlYyscwdKPMUjN+TjaRm3z+qTMCBF3w5Ph52klZbWHKQUh7vZk3Qx1sT+r1P7Jb8e0ogBDdNu70KrHQYQjvt7QFQxUAJ+gTuxFpd3Ag9A7hTXLfcH9c6HMJtdjRIyJjw2njFxGNkxXu1qQQ/AxgRwRM+VUnVRA18NXJWBjTfWZlKn7oI9XyjQEqxNUy0i/mEw2+nJ7kli785gmNku6qVWimHnFug3DnVd40DpFFGvLi6WB4/TmzKi4xbrfGx30LhEKboJjFgDKzi73UeDXY+C0E3PFGkXLHMN1xbrn+Y1enRF1fXLdmR8/7SSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ2PR11MB8421.namprd11.prod.outlook.com (2603:10b6:a03:549::9)
 by PH0PR11MB4935.namprd11.prod.outlook.com (2603:10b6:510:35::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Fri, 11 Oct
 2024 07:32:49 +0000
Received: from SJ2PR11MB8421.namprd11.prod.outlook.com
 ([fe80::97d2:efc7:3eda:ea83]) by SJ2PR11MB8421.namprd11.prod.outlook.com
 ([fe80::97d2:efc7:3eda:ea83%3]) with mapi id 15.20.8048.013; Fri, 11 Oct 2024
 07:32:48 +0000
Message-ID: <afe368ca-2417-4d74-a520-a151a69edcf0@windriver.com>
Date: Fri, 11 Oct 2024 15:32:21 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [PATCH] libatasmart: Update SRC_URI to fix fetch issue
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20241011071123.1936609-1-liyin.zhang.cn@windriver.com>
 <CAMKF1sqYxtyrmpvro=fmHs2pj6qPOhYb3WLsBipZYR3gRSrtAg@mail.gmail.com>
Content-Language: en-US
From: "Zhang, Liyin (CN)" <liyin.zhang.cn@windriver.com>
In-Reply-To: <CAMKF1sqYxtyrmpvro=fmHs2pj6qPOhYb3WLsBipZYR3gRSrtAg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYBP286CA0009.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::21) To SJ2PR11MB8421.namprd11.prod.outlook.com
 (2603:10b6:a03:549::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8421:EE_|PH0PR11MB4935:EE_
X-MS-Office365-Filtering-Correlation-Id: 74748faf-a528-4cf5-dda1-08dce9c6e80c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bXlLZFlSejRqY3VTQmxvWGdBMXdqbkhia25OWjB6RnVrd0VVb2w0bkdyaGdQ?=
 =?utf-8?B?OUZHZVp5SE1iVVNoQytNZGNnRk8wRXgwUU11amZTN0g3ZHZkQ1MxL0Vnbi9i?=
 =?utf-8?B?TDNBQTlzY2k5NnNHczd4OUtEYjNucGhBVU1CYzBVdEVIN0tYRDBxOWZMaUJV?=
 =?utf-8?B?M0FUSkVUWVJlMjZGcG9OY2VJTHFPZmhVYTl4N0ZkSGZITll5Z29OcnA5MDFV?=
 =?utf-8?B?Ym9qTjhVL1pheEhvN0FQZEU2clgrQm01a1lzNmorNVk3NjlaaUtDMXJ4UXBx?=
 =?utf-8?B?VkMwWVNrRkk2dnRybHRoSm5ENnVCVmRzazBlYUVXdGdtcUtXTGhCMWx5MzBr?=
 =?utf-8?B?a0IvVmJvNHl3THpDVTNSeGM5bW1GRkNQZW1EeFR2cGtja2tmMzhMMzZnaUdF?=
 =?utf-8?B?WW1DaUJ4OVdhdDhBZDJVQm1HQnQzWXRqSDNhejNIOTZqb3czb1FiUm5DOGty?=
 =?utf-8?B?bXUrcjI4VFF2V2RNRDBkcUR4ajQ4dTFRQXJMMkpwWDNCYUxlYitJTU9Dckc2?=
 =?utf-8?B?Q0VlTVpDVDlnNE1GMGtSb2hEYmNPdUZKVlNUMDVPV1ZSUU9DMjByT24ydi92?=
 =?utf-8?B?MHEwMUZNSjBtdXAvMHAvQW52NkVsT21jUm5pNGNLZHk1NTFLR1c0K3Q4VW5T?=
 =?utf-8?B?R2EwOStObmNJOEVkUmd0RlFqV09SZGhFMUVOMVpBbVJhVEZRTU5mTCt3OEJJ?=
 =?utf-8?B?aitRRkc4SnNZNEhxdm9jMFMvcGNJN1gvUlUvcm9TWTl0UzV1cGxxbzU3NXhu?=
 =?utf-8?B?bDQzRlVoYXM0SFVRdjlTai9jN1ZHL3lYeWhpRTN3dlpmSEZXZVFOdWlTVWcx?=
 =?utf-8?B?eHdwVVV5eUEvOTNWVndKdVBtaXRsWUY2Q1NNRkpNNm1DNGs5Nkd1VHhMK1dw?=
 =?utf-8?B?TzRUUHREdks3Mk9NTTh5YUdoNkJ6RE5BTjdpV1BxODgrM3ZPU2s4eWk2WTY1?=
 =?utf-8?B?ZDl3RkZobGxNWWdBUnlSL0Zkd3haTUVXeHFyYTdZc2ZSSDJNZXVoRWNQRUEw?=
 =?utf-8?B?NnlocXVlRjgyVFN3dldhKzdhMmpBZGxYSGszeWpPL0FuSE1iRjlPSUIzWVRa?=
 =?utf-8?B?bFRwZktIQ0tuVmw0RTYxd1VSVHhWSUE3ZTJhSTdBelFIL0gvNkFlZ2NPUjN0?=
 =?utf-8?B?eEplNEE3QXladTYxK2doanRkUVhuSGdCQ2MrWUFsSnBtMkVIczdnMWtOSmtP?=
 =?utf-8?B?YU1yVDl5YlZnU3Qya1Z1eFozNTdubG1iMTA5Q3Y5NjQvUElMMHJkcWdvYzYx?=
 =?utf-8?B?QzVuUjdCNXh3UW50UVl6c2V1ODA0K1VxSGNnZEZocCt3eUppT3laTDVhSUxi?=
 =?utf-8?B?eHU2UVRvS1o0OXhxcUo2UWNQSVVoQ2xjVTF2bHRlZnM2L0kzOURuVDRQeWMr?=
 =?utf-8?B?bUoxeG1ERzliZ21DRnZZZGM2b3ZZYTNnV0JNVExMMjBTcUtjSUpCeUhUbWMy?=
 =?utf-8?B?b04zRHEzMzQreHhNWDJqOWlkMk5rMnI0YnVoWG1TRy85N1NvUkd5TnJzR0E2?=
 =?utf-8?B?SURqWnJ4WStyQU15anZER2NqZ2R4T2trc1dXTGlSdGZ3Z3dPdWR2QmM4aDF5?=
 =?utf-8?B?ODZpK1duUzNiU3N6UnB1MDFqNEUwODlxejdrdTJvcFhjaitOLzJ2NUpyTnFw?=
 =?utf-8?B?UVA1d3hzNHJzRDBpQUtPekRQd0tubE1xQWpqRmNzWlBQNUVqSklXaHpLaVZJ?=
 =?utf-8?B?UmpsRHA1WjFic0J3RHp3Y0JiS2tZOFpwc3JFeDJwbUdRdjFQb3NSZlFRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8421.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MExpVDFzaGkrVWQ3Y1NaU0RValBaam1WMEpOK3pjUk9WL2NXVXc2UXIzZFNY?=
 =?utf-8?B?b0ovWnFRMUJqeWQ5NHozZHE2aU42Uk1VZGJuWlpFeEloelZ5VkVETTl6enox?=
 =?utf-8?B?Y0VJR0lSOHU5WmNNN3d6MzVkVlVNc3FqWkxZd04vUllMd29Nc3F3OFI2YXl0?=
 =?utf-8?B?NXFITmg5TlB5WDVBQW43eGowcnY5VE9tVnJXNHh3bXRjNkJRaDZITEZ4TDh4?=
 =?utf-8?B?RGpDUlE3M3lzS25rTkFRdmNpQnFyRXBoUHFCQkFYT05PV2xHMUJlRVIvU1Rs?=
 =?utf-8?B?WVFqWWl2eWJydlRaUTNGc29hb0x2MHNzM0dpZk1YeXlQR0J6dmF2ZUlOczVJ?=
 =?utf-8?B?YlBiRWpaLzRnMFBLNjdac1JvYVNaMXd6enlRbTh0VWQxSTY5SklIbldqY3Er?=
 =?utf-8?B?WDZTRndQZU82dDE3TU9xZ2tFbU5ibGlBdlAxbzY4T3pKWTBQcXRlY0tzenQ0?=
 =?utf-8?B?cjVjQWhxQmp3WHVTS0JTT2tTSndZUWNFbFN6MEoyZlBab1d6RjdYdTNnbTNx?=
 =?utf-8?B?d2R2VjkvdjNlakhsVmVGc0QzcytzUlJ1Qm4vUE11QmJrTHo3K2xRR0FUb2wr?=
 =?utf-8?B?WjJJbjZnYWFHOHZwQ1ExNVl1OEx5eFdXdU90VEVlWGx1RHoxRHZTaFpkcHF2?=
 =?utf-8?B?UndrRS96S1pCMFM4OVhEdDlGQ1pXck93Um9jVHpnVDh1cUdlYkZRWi8zVDV2?=
 =?utf-8?B?VktLUHNGSm5HZnQwSVQwT3FxbU9ycXF4QUtYdDRwL20zVFhJUllhYzR0ZEoz?=
 =?utf-8?B?RDVOcmJKOGg1cHhWZXJUUDZyZmVsMHFkd0drdjdUYjkzcmpWRTJtUk5XT0pj?=
 =?utf-8?B?Vi9WZG1GL3hHRExId1hMcTJoUC9LUk9aUllteXNRd3dXOWkwOTJHRFZMS0N4?=
 =?utf-8?B?MlZPVUY1MmU1NHBQSXIwd0RXeUoxNHlRQS9kYXVMc1J6QkhzMDZUT3VJbXFV?=
 =?utf-8?B?VVd1WUx1clZ6eERpa211NzNJd3UwR01DTHRtUnRDLzNyeHZXcm0rSFlkbktZ?=
 =?utf-8?B?azl0V1ZnZ3pQNjZDVW9yUi9pSlZUL0hzako0blpiODdDTEZmR3EvdjFYdVlr?=
 =?utf-8?B?K3ljeXFSc1JoWVRvMkF1eEJNc1hmaHVTVU5WUmdEanluS2MwYjZ5VGxaYUVm?=
 =?utf-8?B?S0NWSmJEUVNzZGZIekhveFR3VmdIRWFhbnpMUmhKbXFnaHJJSitMdmlhcUN5?=
 =?utf-8?B?NUR6SmVpVUU4OXZPVHFMTk5JVVpnSDNNL3Vub3IwMElaeUdrZHFoQTgxTzJC?=
 =?utf-8?B?NXdubkhZZC9yZFczbHVzSkdnWnY3cVRDdkNKSDdBdWgwRkNVVzVIYXV1TG5z?=
 =?utf-8?B?cUtBRzNoY0tGaFl5Z2J5Tm44UkVWQXFJY0tQbU1zRC9iZjkweUV2aGM2VTRB?=
 =?utf-8?B?K25uVXZwQkJseXZzU3JpcW9CeFczaTdTNUZ6UXZSUTVaR2FuVzZLOTNKbUxw?=
 =?utf-8?B?QlJoQmRzMkNwcEFlRlM5SlhUVnh1Z1R2czBrS1c4Tm41VG04djduVGEzNzdM?=
 =?utf-8?B?dGZkYUNzcjdhZ0JldXB1cU41aXFhWitRL2VSa0R3SHVHM1dQVTRtSU1uQ2Rh?=
 =?utf-8?B?SVc2WVAxVjZJcnlXUDVZQ09GL1J2Y0RmeTQyOUtKVWRPR0EvczN3M2JSemtx?=
 =?utf-8?B?bGk1cUc3K3pVTElsT3lkK0hvUzVlczJScjZDRm13bGtqdzAxVGROcm5Wa3Rx?=
 =?utf-8?B?MzM5a293bFdaUkR1akRvVlRuQ3BSL2NoMnEzS2IvVGdQZVd1ZXZyTERqaXRz?=
 =?utf-8?B?S3RuL2hOeG9acTJxKzhTMEQwbVFCREpMZTE4bGo0SWFnTklIQmZtSHhaQksx?=
 =?utf-8?B?NFNzYThxWXVGT0FVdGliUU42Nk5mNjQ0OU9xb2lnelNTd3VUUFJZNHQwN1ZG?=
 =?utf-8?B?eDFJSVRuNXczeDJDTFdHREZVV2NDR1R6M282QVdKRGYzN2wwZG5XeE9qSFcv?=
 =?utf-8?B?aDJNdDNQS3E3bG9hL0dDV2NpZTJPOHMyVDZRSFVZSXZVNE13WTVQUmNNWjJH?=
 =?utf-8?B?SFZZNWxBUUdaZGg5bHJERmo0Qm5uQThscytaVTBHNEVJem0xMXNKQVBkUUhN?=
 =?utf-8?B?akJZSmxrLzZ1dVZhN0g0VWdVU1NuNlhMeDF6akExRGZoYURyWmN1Z2hyNUJs?=
 =?utf-8?B?L3RoMlhVOVNUQVMrbWUwOFowWXQ3Uzd2RDJSR3pLdVZFY1JXYXp2Ullac3dQ?=
 =?utf-8?B?NWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74748faf-a528-4cf5-dda1-08dce9c6e80c
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8421.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 07:32:48.7446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g1Ahma7Oe8fT04lQvAFgLP+JyrIzlVv9Bgk+WDXnOtIi0HwBjsATaoY2Oheq/BpyvKb4lSTIM3j9XTsV3sCmPFe3ycwzLzFRvdQgNK4YneA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4935
X-Proofpoint-GUID: L_Ld-9rF990osIyWxi-yIGlzoX5q9iG2
X-Proofpoint-ORIG-GUID: kZi_d3Zr5gAcbClMlxn4cflsGP6AK_WZ
X-Authority-Analysis: v=2.4 cv=LfZu6Sfi c=1 sm=1 tr=0 ts=6708d4a4 cx=c_pps a=SmJf4+RRogz8lGj/IwyRsg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=6xbm41ixAAAA:8 a=pGLkceISAAAA:8 a=BDHBPATH-nPVIyVEXLMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=S5GGVp12ez9_aiSFvI17:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-11_05,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0 mlxlogscore=982
 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0
 adultscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410110049
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 49B4VKFK001650
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 07:32:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112786

Sorry, I want to apply it to krikstone. I'll send it again(v2) with=20
correct patch subject format.


On 10/11/2024 3:24 PM, Khem Raj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> is was applied with b631359a42b8d73d7fd33f32851445e90acf4170
> why is it being sent again ?
>
> On Fri, Oct 11, 2024 at 12:11=E2=80=AFAM Zhang, Liyin (CN) via
> lists.openembedded.org
> <Liyin.Zhang.CN=3Dwindriver.com@lists.openembedded.org> wrote:
>> From: Liyin Zhang <liyin.zhang.cn@windriver.com>
>>
>> Signed-off-by: Liyin Zhang <liyin.zhang.cn@windriver.com>
>> ---
>>   meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb b=
/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb
>> index f747ecbf7..8947b9fa8 100644
>> --- a/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb
>> +++ b/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb
>> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LGPL;md5=3D2d5025d4aa3495=
befef8f17206a5b0a1"
>>   DEPENDS =3D "udev"
>>
>>   SRCREV =3D "de6258940960443038b4c1651dfda3620075e870"
>> -SRC_URI =3D "git://git.0pointer.de/libatasmart.git;branch=3Dmaster \
>> +SRC_URI =3D "git://git.0pointer.net/libatasmart.git;branch=3Dmaster;p=
rotocol=3Dhttps \
>>              file://0001-Makefile.am-add-CFLAGS-and-LDFLAGS-definiton.=
patch \
>>   "
>>
>> --
>> 2.25.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#112784): https://lists.openembedded.org/g/openembe=
dded-devel/message/112784
>> Mute This Topic: https://lists.openembedded.org/mt/108944740/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

