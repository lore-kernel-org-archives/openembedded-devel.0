Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1820C25B75
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 05:35:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.76592.1717392903648507532
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Jun 2024 22:35:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6884dc6aeb=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4535SFAl030932
	for <openembedded-devel@lists.openembedded.org>; Mon, 3 Jun 2024 05:35:02 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yftm7sduj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 03 Jun 2024 05:35:02 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4535Z2nd006534;
	Mon, 3 Jun 2024 05:35:02 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2041.outbound.protection.outlook.com [104.47.73.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yftm7sduf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 05:35:02 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GK6anda7LQCChpraryJQagwxFuNx1U2uoc92cNRB1B9HDEnSEyS5re0XdaLzGStvOs4+Q3eE8A+XviE/bJN48lX61iUJwjcsGI2t01okE4AJ8bx0KZnTMcQWRHFccVsd1JVRYt0SgRaYjyYtUB4cWlBNwbcFNKNLwaV14AEZmSHCT1BUxlQD88wwZwP3a4wEK78i69NYMDlaLGAid8ovofwjGqyeTqlZ6uL6rLAvy5avMkPMn3QrlatQkVw60CFX/uDDQIRbJCAxBgT/GAWQptq4LjjKpAvGYAQ0m/iZPulE7FCYfGBMjDnC0/CuJCjAAJ5sqSvwiYFSfPpBh2M73w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gHTRkHeqfF27lYZqTXYr127f8P6dV6N0G/8vCySzn2s=;
 b=cZH4zc3JrA6AYwOoRkO0Ybq+MHml08DD9Ncw8DfeivU0oRcyGPgq8TuOVnZzjWSJd9l3I8/0luMOMNLZugsaRQYKYRpxiLUp0k+kQxxYx0WgUq9d1E2re3WGSuDXnlQXIjSQVVe9z1yugg+VMtSOPo/tfZgolvyDOOPa9lGvtlJ7na6tRsor7U3iNTyZgq1mzIVQqZzht1fKouRZiI83QIR7iMFZVBgg9tUjSCzit+ALFy9TKBlooeDOf21ALwEtTWGA1bPqkSAKjQhvVt1ebOAWB5plAn8fzNXJhkwyEPXHnrya2FbM7ACjadFcE/Db+VG/Lxw09Pwo57QJcDDdMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MW4PR11MB6737.namprd11.prod.outlook.com (2603:10b6:303:20d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Mon, 3 Jun
 2024 05:34:57 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b03a:b02:c24e:b976]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b03a:b02:c24e:b976%4]) with mapi id 15.20.7633.021; Mon, 3 Jun 2024
 05:34:57 +0000
Message-ID: <c7ba73fd-2407-4ade-a629-b346f5e90ca9@windriver.com>
Date: Mon, 3 Jun 2024 13:34:51 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][PATCH] python3-dasbus: Add new recipe
To: Tim Orling <ticotimo@gmail.com>, mingli.yu@eng.windriver.com
Cc: openembedded-devel@lists.openembedded.org
References: <20240528095659.4123056-1-mingli.yu@windriver.com>
 <CANx9H-BYs2hEx0FZorOfjHSq7qFZjCtZUU1Upnyw_BiJyNJmDg@mail.gmail.com>
Content-Language: en-US
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <CANx9H-BYs2hEx0FZorOfjHSq7qFZjCtZUU1Upnyw_BiJyNJmDg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SI1PR02CA0041.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::18) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|MW4PR11MB6737:EE_
X-MS-Office365-Filtering-Correlation-Id: 7df6c19c-1197-4f02-6598-08dc838ee76d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Z2ZXTUJoY3NJY2pmSHRvNEhQdnQyTUNMcmd3RkF5cTUzMTI5My83KzBxcXRQ?=
 =?utf-8?B?MDdsMnQzUGV6VThsV3E4WDJ2MW5vakc2bkZDd0p5cHhycW9DcW53aHZrSkI3?=
 =?utf-8?B?T0x5UllzR3F4RHFEY1pYRmlPaG5vYlRyS2VOdmduWE1EdE9lNDMwUlhyYXgz?=
 =?utf-8?B?aXY1L0RZR2JITFBaYk9qWTJVNW0veXVNMjFWLzNvYlRQNW5pbGFmdllQdHBN?=
 =?utf-8?B?eXhDQWVLS3FMVWxZREtjbitNT3g3d2lpNzFFMjcvbkV4V29oWXM0a0pzOVZh?=
 =?utf-8?B?WlVPT2pEK1RRUExoUzRRYmpXNGtyNTdnL2IzZHBJSkJLcTdFVFlpYTg4WUtX?=
 =?utf-8?B?cVZaYlduSUhwdGdGNUxSbTJ4RklQVk5Wb2J3eWNFcHkvOW8wN2RVOUdYOXB6?=
 =?utf-8?B?a0lhSWlBcHdkVk5TQkFwVFB0U2lCUGc4YU45QkxrcFhpK29vTTlyUXBPSmls?=
 =?utf-8?B?aWkvaGJ5bk9xb2ozc0NSd0lQeGVtVVBOa202cjVVVlJSenNmbmdaOFJWRSt2?=
 =?utf-8?B?bTU1TWVWYkFQWFBhQTNiWTV1RkFFVWhKRFhoRUFNQkgyaXJKR0d0eENLY1Bh?=
 =?utf-8?B?bUU2MzFHS1hiTVY1Smp2Z3QxRjIrS3dlOGs4WWlURkx3Ri9aa294MEMrS0Rn?=
 =?utf-8?B?OThVQUtNU085MUhtVUszSHJ0V1ZtbkRKcm1CNHpEeGF4Y2hRSlpXREtQUVlL?=
 =?utf-8?B?Mjl2Y1AySENGY2JlMytNa1ExWXNuMXc1Y2NQaWU2NlZqcEVVWlVydm5iQ3RX?=
 =?utf-8?B?ajhSOENya3ZGdENkdHNnZU5IL0RZZ2w2Ky80aXE5UXJEU2IwcVJmNTNHZnJR?=
 =?utf-8?B?K3FIb3VIRjEzUU50Qk12U1p5dCtVQzl6YmtFOVBiWlc1TFhoTlNQSzdnM0p1?=
 =?utf-8?B?dnViK3lTVXl2SG9URGtrclM1VlVlMm1oMytyVVdTZzRPOE5yUVlLejNzS0R6?=
 =?utf-8?B?b3pjbk9kYmxWN2Q0c0J1c2hvT0pQUldHRmdvTlU2WGREby9tQmJtam9tZUh0?=
 =?utf-8?B?L1VLNmhUaWp3VTFrWEdCczdzVU15VjQyZUV4QkFtbDRHWmh2blZLQkdLOFVw?=
 =?utf-8?B?K0xnSTRjUlNYMlJrdnlzU21YMzJuUmtMSFlOUFpyVFJLK0prbEE2K1pwZFZI?=
 =?utf-8?B?RzJXMW9oYTViNWhCMzNJSllYWnRLa2Z3R2Nudmw1Vk1taWw0K1dDOHVnL3ZU?=
 =?utf-8?B?VGVmaW1UUk5MOC92OHdaSGlwTTdQY00xUzFETS9YQWdNand5OVhackhTSHFp?=
 =?utf-8?B?czErNXh3UmRZZnZsRmU0Y3h6R2k5Z0FpYisrTENUQjRWcUh0a2tuMFhKVDJN?=
 =?utf-8?B?bW1iRStBSVRNU09JdGRPWjN2VmQ5ZDVzeVBwWXh5QXdYYXJPcTV5bFVtYjRq?=
 =?utf-8?B?cFlKcHV1TE5mcUdXcWg3dllKeDMyaHNrVHYyWVE0Y1N1OUhNbW0xbUljRDc4?=
 =?utf-8?B?M0M1Y1E0VmpTZm1KblYwTU9PNjd0SjhtK2V2U1JVZ1NUTHZSSmZMbmdxM1V1?=
 =?utf-8?B?eTlxMkowYXFudHBwSkZEQ2ZCSjNJVWt5cnlWOTJjUjFkS3ZKU3BSUGMwaTlK?=
 =?utf-8?B?dUxTb01PQ2NINkorcTZZamlUaUw0OUloKzM2TUNFZUYzd3NvZGxPVmxldFdS?=
 =?utf-8?Q?zEpa5cBdMegtxCAYiVTZ5hWTucIpomrUOLM3W91pcL08=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Z2VRUmZCQ2Vvd3ZydnZ6M2U5ZnRtK1MxMHQxMnczeitkWXJGVDlZNldNdC9V?=
 =?utf-8?B?R0g4MFduVDZlb3pnQVpyMk1lSG0vcnVTclU4MVMrY3ZFZU5rQTlwK05vM2dP?=
 =?utf-8?B?eTQrdWE2d3VFM2wxSTNpeENpTm1LZDRCTytTaHRvSlFEbFRCUit5ZnRjY0Rq?=
 =?utf-8?B?TEF1bEtVNGlXeTIyWDdtTXROc09JdDdsb3VlMG5lUVBjdFpxNFdWbUE5RlhZ?=
 =?utf-8?B?b3d4QmYvS1RiU2V1L1k5YlBrWEJyQW9YRzlDMHhyMHJlb3dFL3FvMUp0N0U3?=
 =?utf-8?B?ZFRnclBoU2xjYjRwNDRzWUJlbTVKYUY2MElJN2ZtN0grUDViWlpDbCtaQmt6?=
 =?utf-8?B?ZUdCaTVyM2hCMjRrRDBBQzNxOWhwaWI4ZXFpWlhUblhhWWFaNGl4Y0ROM29k?=
 =?utf-8?B?cS96NDNnd214NDlEamJ5YUZZcEFtaDF4bExNV0FYOVJ5QXhsVVlMUDlhb3dX?=
 =?utf-8?B?NHJlK2hIaTZUeFNLUUdZbGFUSko0bzNhRkMyaGU4azltZW9nV0UvNUNwUml6?=
 =?utf-8?B?NmJJOVVGWjVjY2RUL1lBNFhLaFJmbkQ3UzQrSGFzZ0k5VUl6dmJjMGRmNnVR?=
 =?utf-8?B?M3N0ZDNQN3JqblZlZjZhdzI3U3JxYzFaUmZObUtDNEIxRlhsMHpVVW9VNXN3?=
 =?utf-8?B?RTVpbmRLRWJtL0VnZVg2UUpUMHBzQldqakZqQ09YTTRiemcxZ3JRUmszRmha?=
 =?utf-8?B?Q1ZJREVvc0d2SkpMWHhDZWdkSmRlOW5ydnN0ZTdTMk9lamRGbitMcVhXSm8y?=
 =?utf-8?B?R3FkRzZvZm4vR2QzQUx1L0w4R3J4NnlNeXd6QW0xTlVEY3MwcnlLRDVHZm1a?=
 =?utf-8?B?R1V0WmFUaWJPUEJuQ1B6RDErMU0rSkhFNFRScFB2UTFBaHdjRXNtVkRsVU8y?=
 =?utf-8?B?MHhQZGozWmU2cU43TTM5dTRhMzg2ajBFaDdsc0ZKMjhLSSt2UytHSlYxSWxl?=
 =?utf-8?B?c3JvZE1nQWJlalpGS0ZtYW9wdVIwcmIvaFMxMEV2K0xndzVySm1wa1V3MmFx?=
 =?utf-8?B?TnZSVUxJeStXZnNkUllhUzVHTlNWTmRUR29DMEc2Z0ZIU0JoWXM3WFZUQklp?=
 =?utf-8?B?OW9rOGVWOHpSTzNxUXFmTER5d0RobHlTR2pFSTlaNURHUzBGSFpBRExPcW9z?=
 =?utf-8?B?WkRGYmJ4MkR2eUF6N3pFQVAxS2d0bXFJTWIwZ3JjNUVieGVna0VkeVFYWUll?=
 =?utf-8?B?dHNaNVpQOHg4anBoTit6TUtPa2RqQ3YvSjNUWXJ4cDFpSjVCSmtXR2ZKUFB1?=
 =?utf-8?B?UG40NlV3Yk9pUE8zL3lTdzZ3NnJqVm15RzQzSmNlYmZNQ0tFN1NybnlvSnVT?=
 =?utf-8?B?eVdkOEtIWlk5TytleUFYcHVXL3RlNFIzemZSZ0tvclFtUXpTS3JtL1A1TUgw?=
 =?utf-8?B?R1lmNU9pbGpVNUorY2pwOHlQbEdwOFAxUFZBeEVLaGoycjF4YVhoZDMyYkxJ?=
 =?utf-8?B?UTNSQ0ZiOHZ0R3Z3aGZ2Z2RZWGM1a0hUR2d6UlFqNTB4ZFhKSXExbU12MGtq?=
 =?utf-8?B?MEpqRWhNeEpuNjN3NzdSenM4eFAvVzFKTGdkQXRQdUxseGtpSjgyN0tUWVJq?=
 =?utf-8?B?S29VWTkranpheTRWTi9VK2FqVmJIYklrMEFiRVdiK0ZSR0NmcEk2UzZTWkZz?=
 =?utf-8?B?UVpBOWFXV3o1V09oeDg4bmpZdHRjbDk4bGkxekpFZ2ptR0N3QU9zU1ZOU2Zj?=
 =?utf-8?B?ZnNRSmhVTFRISFFsRjlRSFkzYVpNemRKb0dJQ0JYOFBlWDBldkdiSXZCK0xT?=
 =?utf-8?B?bytYaEl2cnVNSFFFdGNIejdMaE1jZEZWZ0ZFMUpmSTFJb1JyVnlHWTBPTlVo?=
 =?utf-8?B?R2gwU0p5eTcvNkRERTRCSFY4RHVzdXoyZnQyeWhKWklGWnV2ZW1iblIvSEZZ?=
 =?utf-8?B?TFNjc244bDAxRHhML1M0N3RlR2Z5QmYxOC9WMGN3MCtFL1dOMTdJVVBob0Nn?=
 =?utf-8?B?REVWVVhlKzVhdGk0TmtzZ0Q0NkQ4MnhYdHRxT2M1U05LMUxpRXVOZG9EZXFr?=
 =?utf-8?B?Sk5ZYkJxWldXaDNkYzNqckdMMjBYdHQ1OTVTcElBUVpjRkZyQkZHTnZLU2NP?=
 =?utf-8?B?U1pZVXYwWW5zbFg2SFNJSXBYajk3MFE3ZWR5TkFqS3IrODNBR3ZsRlNGc3ll?=
 =?utf-8?Q?1X2pMfbvI63QsNuJZxNoDs+JH?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7df6c19c-1197-4f02-6598-08dc838ee76d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 05:34:57.4098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ElETW/y3oZMZ2qC9rI6CzT97FbndJtHUmHh4gleHEEr1bU0jfTEssTy0IqQAQvSOq8FFl+Bq+yYGwQrLUs5aHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6737
X-Proofpoint-GUID: bS4DvLcCY--b9iTUswsIhp6lyoE-r_kv
X-Proofpoint-ORIG-GUID: 92ctnG_oXAJJcoIrbueWCmiGNteZB6gf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-02_15,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 phishscore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406030045
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4535SFAl030932
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Jun 2024 05:35:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110667



On 5/29/24 23:16, Tim Orling wrote:
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
>=20
>=20
> On Tue, May 28, 2024 at 2:57=E2=80=AFAM Yu, Mingli via lists.openembedd=
ed.org=20
> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8=
EvQ!Y5NUwukPKP_HnepOX_NV-Oa4tXfkyjxJPk4ygBglVwbOyv4Lc_RjWWNA1peUyA7SsJfU7=
GkiYG6VXIHkUo__zHc$> <mingli.yu=3Deng.windriver.com@lists.openembedded.or=
g <mailto:eng.windriver.com@lists.openembedded.org>> wrote:
>=20
>     From: Mingli Yu <mingli.yu@windriver.com
>     <mailto:mingli.yu@windriver.com>>
>=20
>     Dasbus is a DBus library written in Python 3, based on GLib
>     and inspired by pydbus.
>=20
>     Signed-off-by: Mingli Yu <mingli.yu@windriver.com
>     <mailto:mingli.yu@windriver.com>>
>     ---
>      =C2=A0.../recipes-devtools/python/python3-dasbus_1.7.bb
>     <https://urldefense.com/v3/__http://python3-dasbus_1.7.bb__;!!AjveY=
dw8EvQ!Y5NUwukPKP_HnepOX_NV-Oa4tXfkyjxJPk4ygBglVwbOyv4Lc_RjWWNA1peUyA7SsJ=
fU7GkiYG6VXIHk4El2d1U$> | 15 +++++++++++++++
>      =C2=A01 file changed, 15 insertions(+)
>      =C2=A0create mode 100644
>     meta-python/recipes-devtools/python/python3-dasbus_1.7.bb
>     <https://urldefense.com/v3/__http://python3-dasbus_1.7.bb__;!!AjveY=
dw8EvQ!Y5NUwukPKP_HnepOX_NV-Oa4tXfkyjxJPk4ygBglVwbOyv4Lc_RjWWNA1peUyA7SsJ=
fU7GkiYG6VXIHk4El2d1U$>
>=20
>     diff --git
>     a/meta-python/recipes-devtools/python/python3-dasbus_1.7.bb
>     <https://urldefense.com/v3/__http://python3-dasbus_1.7.bb__;!!AjveY=
dw8EvQ!Y5NUwukPKP_HnepOX_NV-Oa4tXfkyjxJPk4ygBglVwbOyv4Lc_RjWWNA1peUyA7SsJ=
fU7GkiYG6VXIHk4El2d1U$> b/meta-python/recipes-devtools/python/python3-das=
bus_1.7.bb <https://urldefense.com/v3/__http://python3-dasbus_1.7.bb__;!!=
AjveYdw8EvQ!Y5NUwukPKP_HnepOX_NV-Oa4tXfkyjxJPk4ygBglVwbOyv4Lc_RjWWNA1peUy=
A7SsJfU7GkiYG6VXIHk4El2d1U$>
>     new file mode 100644
>     index 000000000..c07464210
>     --- /dev/null
>     +++ b/meta-python/recipes-devtools/python/python3-dasbus_1.7.bb
>     <https://urldefense.com/v3/__http://python3-dasbus_1.7.bb__;!!AjveY=
dw8EvQ!Y5NUwukPKP_HnepOX_NV-Oa4tXfkyjxJPk4ygBglVwbOyv4Lc_RjWWNA1peUyA7SsJ=
fU7GkiYG6VXIHk4El2d1U$>
>     @@ -0,0 +1,15 @@
>     +SUMMARY =3D "Dasbus is a DBus library written in Python 3, based o=
n
>     GLib and inspired by pydbus."
>     +HOMEPAGE =3D "https://dasbus.readthedocs.io
>     <https://urldefense.com/v3/__https://dasbus.readthedocs.io__;!!Ajve=
Ydw8EvQ!Y5NUwukPKP_HnepOX_NV-Oa4tXfkyjxJPk4ygBglVwbOyv4Lc_RjWWNA1peUyA7Ss=
JfU7GkiYG6VXIHkyZ--IS8$>"
>     +SECTION =3D "devel"
>     +LICENSE =3D "LGPL-2.1-only"
>     +LIC_FILES_CHKSUM =3D
>     "file://LICENSE;md5=3D1803fa9c2c3ce8cb06b4861d75310742"
>     +
>     +SRC_URI =3D
>     "git://github.com/dasbus-project/dasbus.git;protocol=3Dhttps;branch=
=3Dmaster <https://urldefense.com/v3/__http://github.com/dasbus-project/d=
asbus.git;protocol=3Dhttps;branch=3Dmaster__;!!AjveYdw8EvQ!Y5NUwukPKP_Hne=
pOX_NV-Oa4tXfkyjxJPk4ygBglVwbOyv4Lc_RjWWNA1peUyA7SsJfU7GkiYG6VXIHkMNwIRNw=
$> \
>     +"
>     +SRCREV =3D "413cf9a0b7c231468f1d28d9a29dd8dd8bda15c5"
>     +
>     +S =3D "${WORKDIR}/git"
>     +
>     +inherit setuptools3
>=20
>=20
> This should inherit python_hatchling since a proper pyproject.toml is=20
> provided
> https://github.com/dasbus-project/dasbus/blob/be51b94b083bad6fa0716ad6d=
c97d12f4462f8d4/pyproject.toml#L7 <https://urldefense.com/v3/__https://gi=
thub.com/dasbus-project/dasbus/blob/be51b94b083bad6fa0716ad6dc97d12f4462f=
8d4/pyproject.toml*L7__;Iw!!AjveYdw8EvQ!Y5NUwukPKP_HnepOX_NV-Oa4tXfkyjxJP=
k4ygBglVwbOyv4Lc_RjWWNA1peUyA7SsJfU7GkiYG6VXIHktJoxsjs$>


Seems the above commit which provides pyproject.toml is not included in=20
the latest verson dasbus 1.7.

Thanks,

>=20
>=20
>     +
>     +RDEPENDS:${PN} =3D "python3-pygobject"
>     --=20
>     2.25.1
>=20
>=20
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#110580):
>     https://lists.openembedded.org/g/openembedded-devel/message/110580
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-devel/message/110580__;!!AjveYdw8EvQ!Y5NUwukPKP_HnepOX_NV-Oa4tXfk=
yjxJPk4ygBglVwbOyv4Lc_RjWWNA1peUyA7SsJfU7GkiYG6VXIHkek3yezo$>
>     Mute This Topic: https://lists.openembedded.org/mt/106345708/924729
>     <https://urldefense.com/v3/__https://lists.openembedded.org/mt/1063=
45708/924729__;!!AjveYdw8EvQ!Y5NUwukPKP_HnepOX_NV-Oa4tXfkyjxJPk4ygBglVwbO=
yv4Lc_RjWWNA1peUyA7SsJfU7GkiYG6VXIHkLETnVCU$>
>     Group Owner: openembedded-devel+owner@lists.openembedded.org
>     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-devel/unsub
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-devel/unsub__;!!AjveYdw8EvQ!Y5NUwukPKP_HnepOX_NV-Oa4tXfkyjxJPk4yg=
BglVwbOyv4Lc_RjWWNA1peUyA7SsJfU7GkiYG6VXIHk83Y-ScQ$> [ticotimo@gmail.com =
<mailto:ticotimo@gmail.com>]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

