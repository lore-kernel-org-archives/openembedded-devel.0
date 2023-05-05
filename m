Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E11BC77B75
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 09:18:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.22933.1683278307410051708
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 May 2023 02:18:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=448933cb74=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3458atJq021053
	for <openembedded-devel@lists.openembedded.org>; Fri, 5 May 2023 09:18:26 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3q8rf3drue-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 05 May 2023 09:18:26 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3459FsHW024550
	for <openembedded-devel@lists.openembedded.org>; Fri, 5 May 2023 09:18:25 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3q8rf3drud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 May 2023 09:18:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DxlSNN7cJhZcBa3EG6NBsh8uC4laK4uhdZTa44okPRF/MDZeUZ+sJmAxRsNjgUdM3I1yzFLbAGm5K2itmi9AX3D/NdutNlgfOrhh3ek6LTQnWzDGigT5oy+sZ8xrCI2GiQKM4liI0XwgXl31/4yusO755E3E+Y35rtlj/6cJxw8zU/JsDynSIzLLC24DRY47uTmoRgGEe/V8bPIkWnlun43jc6WZOZE104zRk+/m6ioy3c/y0MORvqQROTxkg/Poy7ueKXtS5BBKGQrzkpVGF1Uw2wxKyCgoBeyRymhy32Bs5vjTeIqoaW6Q52et8HS2u30xoM/IF9tQ2HdDdDK9Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nvulr4U4Jxv5TPcwvYROAcNQdpHgHfnT0jRYUO0FVtI=;
 b=Z7MQTklxOHC/9rpUDKtHuOCjpKoi0Jna3tIjFpQcOimmwxJN2rwrKOUNew1SImaK/TWQ+Fatj+Ppv2vmx2Cz6SJjXDEk7L1Fwcd/9ziB7e5aGgjaGQpgdRJ871ntdTosjtazfz/98Mx/qtwit7aTogBsUGw61dz5P/sW7zxPrcB07+0qMHeYnujkZcpnPsgIvsMS0rlRb32ZD4BQYxsZmK1G+WibYnVMgxFSbqE1joRtRdnW9+7h0j50+yXwSMfDZ5N9iajPhA48YZmmk6F2wfPZtfSpTDiefQtp3nnXY9CgX9kRT6xnMMBlijM/TWLAXZq4bvzkb3yhHs4D5QfBaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from PH7PR11MB5820.namprd11.prod.outlook.com (2603:10b6:510:133::17)
 by CYYPR11MB8432.namprd11.prod.outlook.com (2603:10b6:930:be::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.27; Fri, 5 May
 2023 09:18:23 +0000
Received: from PH7PR11MB5820.namprd11.prod.outlook.com
 ([fe80::84b2:b711:8939:b703]) by PH7PR11MB5820.namprd11.prod.outlook.com
 ([fe80::84b2:b711:8939:b703%6]) with mapi id 15.20.6340.021; Fri, 5 May 2023
 09:18:23 +0000
Content-Type: multipart/alternative;
 boundary="------------fODLrZ58qRy1pWIST1TErL0r"
Message-ID: <860a023c-3124-19db-13aa-e1b574686dcc@windriver.com>
Date: Fri, 5 May 2023 17:18:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [oe][meta-oe][PATCH] pahole: fix native package build error
Content-Language: en-US
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20230505072710.666230-1-xiangyu.chen@eng.windriver.com>
 <CANPvuRmNPikxvkTOkw8_HRXKtnWKVQMjgrxwy1NndB4D3f7ZcQ@mail.gmail.com>
From: xiangyu.chen@eng.windriver.com
In-Reply-To: <CANPvuRmNPikxvkTOkw8_HRXKtnWKVQMjgrxwy1NndB4D3f7ZcQ@mail.gmail.com>
X-ClientProxiedBy: TYCPR01CA0067.jpnprd01.prod.outlook.com
 (2603:1096:405:2::31) To PH7PR11MB5820.namprd11.prod.outlook.com
 (2603:10b6:510:133::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB5820:EE_|CYYPR11MB8432:EE_
X-MS-Office365-Filtering-Correlation-Id: 87459776-639b-4a9f-e969-08db4d49ac6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cmMS5KSjRfbtN7ZEf29U47E9h0NlOgJ7m6OgOzhtCf1pIoHpm260s1nbu3h8sw/oOETq3pBkr4B8tHz1WJkTFQrCfNK/uPMiNj2qED9fj60/7b0bhZA2ZV3YI8bO2oq7n7U5c3rE0mJEMtxFhrZoE7JpXlDlFcc+gQhGVnCIjykNgnyyohEYKbhppVVU35N20QnF3FYV81INuE48gU9KB7M7vaaJan4vms2YrxoZrsT2ySPmM9jFRqFZwMkKaYqFOtL3O9+sUPRxL/QTz1UEydYxBFsnY37pcRZ/9GlOabXGaTUk45A85PMKCNlr0f8qsPakzcYbImukktJPZwSyLs24rny6/FlRBR85siXIADrCpgzXk3s6RhSaoUb11zxdAn7jnWK28qEX3O6sZju4Cpl18Pfv18TnKrrUYkdQkD8wISY+EnHfgMtSLDx80/1e5cuV1PkHwxneM9rKl1IfHaRr8u8Bm11BQiVmfXgQk8ielcpodsrk5SiovAFHiYoEnVfzD585Hzr0GrmL2LRXdpMsZB+DsHzGaO03ekkQT9mTZ4CmXJpObRb5BnnqiWR9XU5zGrjYSaNkKxZc263HAowX+ElcWqrOmQM5YXUp21+oWusufZtqAA9UmA2xZEkvTFpYDUtGMaPB6Dhw1m/zmw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB5820.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(39850400004)(136003)(366004)(376002)(451199021)(83380400001)(186003)(2906002)(166002)(38100700002)(36756003)(31696002)(83170400001)(8936002)(8676002)(5660300002)(33964004)(966005)(6916009)(4326008)(66556008)(66476007)(66946007)(41300700001)(6486002)(6666004)(31686004)(316002)(478600001)(26005)(6506007)(6512007)(9686003)(53546011)(66899021)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TjQ1M1FHQkY2QWxzMFdLZ3ZXL2FPeXJ5SW1xMTh4cWVFa0gxTFZ6WDM1aUVs?=
 =?utf-8?B?QXI1N0NLbjlEOUtqek9ldlozaHFhdVlZcG1RWmxZbnRWNEhXS21iZzJ1MFFh?=
 =?utf-8?B?K0lEK1dpTGZ6WnQ2R3BEVEdGMFJVditxaXJqS3hnNGU5REJVWWQ3WW9WbUFw?=
 =?utf-8?B?Q0picGtWYlVaQWdiZnZUZ2dvK0lCYnFMQk85d1I2SWxtNisrdFFHWVFRVnVw?=
 =?utf-8?B?b0x4eTNxbko4bFZqY2dzeHBFZ2tUWUdwUk4xTTBmN0RhWjlTdVI2enY5MGhF?=
 =?utf-8?B?RzJSRnl6UmxxU1ArM0xHZE9zZURhSkw1QXlZOHVJN3p2dk1vTXRzeGxRV1dz?=
 =?utf-8?B?RzBPWTRkZTlSLzJHcHMyYVNGNnBWNjFwM0pZR0ovWUdOMFJ6dnduanJ1ZXBJ?=
 =?utf-8?B?dTFNMDNzWkYwVVpRZUMzWlBtTFV0YTdwLytWQmc0ZTNYaWVUWXJGcXpGWTZI?=
 =?utf-8?B?Qmg0Z3h4Y3FpRVdBQTJYTHcxL3VqN3JoRTVDV3JXTW1WUnF0cldhK3FLSEJt?=
 =?utf-8?B?TkdoMGM4d0ViZElwRlQvWmV6NjVON2R3aVdMUS8wYXRaek1abXpkWTM3WGZp?=
 =?utf-8?B?ajVnbit1a2llb1ZaRkdSU1pURjVhaktGWnNlNCtZRWFRdUh2TW4xT1RROXcv?=
 =?utf-8?B?WGVtdnZEbUl3c0pKYmVwc3NMdnhPaXpEM1pCaE1rdHhkSXdTdG9ZUzRROUpZ?=
 =?utf-8?B?M2lHT3NCaEZGWE43ZkFwNXBZa3VMcVMrTldqY0c3aDRxS2p0djJWd28zY3BT?=
 =?utf-8?B?T3dnQ0FmMkM4bGRtR1lXTUNXdEFyWEw3TDF5cGcyR1Y1ZU1HWGtGVGJ6Z0NN?=
 =?utf-8?B?VkI0WFArYnp6M2tSOXpiSGRxNE9XK0pIenhReENHemNPeXlFdjRkM3p3dndl?=
 =?utf-8?B?QWVBMWpjOWllNm82Sm05aThYUXEzWHRjMkxwaXpDdUZFUVZTMnZaQzdhMXdx?=
 =?utf-8?B?WnJNaFQ0VXBXbTlSR0hpTGdPcExlQy9JYzFlTVUzKzhydDBmL1FyUGRVTm5v?=
 =?utf-8?B?SWZLdzdkNnlUQzVaOVAvZU1lbXRJWURoSXpBVERUa1R4NHRlR3pLeVViQUFx?=
 =?utf-8?B?YmdUaFFyOXQvQzBZOWpjN1p4QzB2UllDVUgwbXJ3ZFJoWDF4NDZNSXhpaG1C?=
 =?utf-8?B?N1g3cXlsYjYyaUVTYVFvdE9yd0MwWmhhQXZOMUlFaVhWbi9TME5vUk8zdUgy?=
 =?utf-8?B?d01TRm5kSk91ZVJNS3pXV29xM2RhRmFjdUlOckJ0bG1sZEhaNENHMDNGNXRM?=
 =?utf-8?B?MEZpTnJoVUxCMXByY2ZocklKSXhOYUdSdHpsYjBTdVpvVjhPMGEyZHo2Y3Vu?=
 =?utf-8?B?WWg2NVpDRjVmTFZrM05vZFA0UTM0aDhjdXlTREEwcEllZ1VLV3lDcW1rKzJk?=
 =?utf-8?B?dGFFdU5oUHBhWGtqcVVFVjJqZDJiNWdtZGs4YWVwYmozMVpHSmRtTEV1bytM?=
 =?utf-8?B?cmFqRTBsc1JOWlVyQ1pMR05sUlF3NUlWbjJwSDdReEYwdHhtaGI5ZUZVZDQz?=
 =?utf-8?B?aHM2UCtSaCtUeVZCaldoOEtDdXhIV3RIdzJJWHZsSFhlQWNHTTlMRDlTeDk3?=
 =?utf-8?B?TlRrcE9nY3NtOWozbU5CdUhFUTV2a0VLaWFlcm9oK3RibFd3Vnh5UDhhVWx6?=
 =?utf-8?B?b2dRRnVaTTRqSjhQVXlydEtZL0VsQkN3Yzd2NGxNcEJ5QXd3QTZ5cndWNFQ3?=
 =?utf-8?B?UEZLQlQrY1VZd0k1Qmo4NUs0a1UvTFlLdjVIWTNCRVB2a3hzeEpqWndvTEU0?=
 =?utf-8?B?WnJEQXpCYkg4d1dnNDdZdlAvVTBQNmZHLytkVXJKc1NOeSs0Q3BBUUgzMEMr?=
 =?utf-8?B?RkJQN3hFdS9GR0twRlRzYnZZSjVHRDhlOFFKL1VGMkNLQ05tOGFOcWNRNnBa?=
 =?utf-8?B?cHNJM2l6R3ZWUFRabUViZzU1SGhwVkFvNjhKTnRmVkU4dklndjRDNUdhTGli?=
 =?utf-8?B?d0lOUGYyWDU5R0cvSGl5dEZrRXc2dkxuTG0vQXMzUGJheHRZQzRlN1dodXA0?=
 =?utf-8?B?VU94M0JkRzVwMjZxWlpaTC9PMFo0dU9RbW1FZUplR2ZMSE5iZ0hnNzQwZVg5?=
 =?utf-8?B?U1RnenNqdnhiRmllZzRCSEhvVVk4UXZwZmxIVWYrNXRFZFZ5dW96eEV2T0I1?=
 =?utf-8?B?WWpWN3VHWFl4ditrUVpHZTlwZlU5VmlUM2RqSzdvVEQySWc4Z1pDOWlkWXQ1?=
 =?utf-8?B?U0E9PQ==?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87459776-639b-4a9f-e969-08db4d49ac6e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5820.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2023 09:18:22.6076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K74I215f3GANksHkr7uOnxuS30b2CG2kwDIIYkfwtep4qLGr89Ocexc2DfT0scEop5LwnKqJVGKAw8Hy/Gd+xEKt5O3onsH5tBUpFd1ZkO4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8432
X-Proofpoint-GUID: Wb11PaNqoT6QT-x4qkFrCRIEHDSxlEyw
X-Proofpoint-ORIG-GUID: 83uzMX7VmTXIwmtJQNiflp1aGjo9B-SL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-05_15,2023-05-04_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 bulkscore=0 mlxlogscore=999 adultscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305050076
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 May 2023 09:18:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102318

--------------fODLrZ58qRy1pWIST1TErL0r
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3458atJq021053


On 5/5/23 17:05, Jose Quaresma wrote:
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
>
>
> Xiangyu Chen <xiangyu.chen@eng.windriver.com> escreveu no dia sexta,=20
> 5/05/2023 =C3=A0(s) 08:27:
>
>     From: Xiangyu Chen <xiangyu.chen@windriver.com>
>
>     pahole-native package needs some uapi headers such like linux/btf.h=
,
>     otherwise it would report error as below:
>
>     btf_loader.c:342:54: error: invalid use of undefined type =E2=80=98=
struct
>     btf_enum64=E2=80=99
>
>     Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
>     ---
>     =C2=A0meta-oe/recipes-devtools/pahole/pahole_1.24.bb
>     <https://urldefense.com/v3/__http://pahole_1.24.bb__;!!AjveYdw8EvQ!=
bNylWq3KEGYf5hLfs2xlzXzBZmcw-hBCZq9-WEagfdr2DATOw_5uQFj-opLWXKLwWAXTOdF6g=
enpPCYXr9r2yDTGNv8dp2Df$>
>     | 2 +-
>     =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>
>     diff --git a/meta-oe/recipes-devtools/pahole/pahole_1.24.bb
>     <https://urldefense.com/v3/__http://pahole_1.24.bb__;!!AjveYdw8EvQ!=
bNylWq3KEGYf5hLfs2xlzXzBZmcw-hBCZq9-WEagfdr2DATOw_5uQFj-opLWXKLwWAXTOdF6g=
enpPCYXr9r2yDTGNv8dp2Df$>
>     b/meta-oe/recipes-devtools/pahole/pahole_1.24.bb
>     <https://urldefense.com/v3/__http://pahole_1.24.bb__;!!AjveYdw8EvQ!=
bNylWq3KEGYf5hLfs2xlzXzBZmcw-hBCZq9-WEagfdr2DATOw_5uQFj-opLWXKLwWAXTOdF6g=
enpPCYXr9r2yDTGNv8dp2Df$>
>     index 2bb73c3eb..93ee7f30f 100644
>     --- a/meta-oe/recipes-devtools/pahole/pahole_1.24.bb
>     <https://urldefense.com/v3/__http://pahole_1.24.bb__;!!AjveYdw8EvQ!=
bNylWq3KEGYf5hLfs2xlzXzBZmcw-hBCZq9-WEagfdr2DATOw_5uQFj-opLWXKLwWAXTOdF6g=
enpPCYXr9r2yDTGNv8dp2Df$>
>     +++ b/meta-oe/recipes-devtools/pahole/pahole_1.24.bb
>     <https://urldefense.com/v3/__http://pahole_1.24.bb__;!!AjveYdw8EvQ!=
bNylWq3KEGYf5hLfs2xlzXzBZmcw-hBCZq9-WEagfdr2DATOw_5uQFj-opLWXKLwWAXTOdF6g=
enpPCYXr9r2yDTGNv8dp2Df$>
>     @@ -3,7 +3,7 @@ SUMMARY =3D "Shows and manipulates data structure
>     layout"
>     =C2=A0LICENSE =3D "GPL-2.0-only"
>     =C2=A0LIC_FILES_CHKSUM =3D
>     "file://COPYING;md5=3D751419260aa954499f7abaabaa882bbe"
>
>     -DEPENDS =3D "elfutils zlib libbpf"
>     +DEPENDS =3D "elfutils zlib libbpf linux-libc-headers"
>
>
> If it is only needed for native maybe using class-native is better:
>
> DEPENDS:append:class-native =3D " linux-libc-headers"
>
Ah, yes, indeed, i tested on my local setup and this issue happens on=20
native package only, thanks for your suggestion, a v2 patch will

post later.

Thanks,

Xiangyu


> Jose
>
>
>     =C2=A0# Depends on MACHINE_ARCH libbpf
>     =C2=A0PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>     --=20
>     2.34.1
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#102316):
>     https://lists.openembedded.org/g/openembedded-devel/message/102316
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-devel/message/102316__;!!AjveYdw8EvQ!bNylWq3KEGYf5hLfs2xlzXzBZmcw=
-hBCZq9-WEagfdr2DATOw_5uQFj-opLWXKLwWAXTOdF6genpPCYXr9r2yDTGNsH_kE5v$>
>     Mute This Topic:
>     https://lists.openembedded.org/mt/98700913/5052612
>     <https://urldefense.com/v3/__https://lists.openembedded.org/mt/9870=
0913/5052612__;!!AjveYdw8EvQ!bNylWq3KEGYf5hLfs2xlzXzBZmcw-hBCZq9-WEagfdr2=
DATOw_5uQFj-opLWXKLwWAXTOdF6genpPCYXr9r2yDTGNsAure0n$>
>     Group Owner: openembedded-devel+owner@lists.openembedded.org
>     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-devel/unsub
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-devel/unsub__;!!AjveYdw8EvQ!bNylWq3KEGYf5hLfs2xlzXzBZmcw-hBCZq9-W=
Eagfdr2DATOw_5uQFj-opLWXKLwWAXTOdF6genpPCYXr9r2yDTGNiJoZlYi$>
>     [quaresma.jose@gmail.com]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>
>
> --=20
> Best regards,
>
> Jos=C3=A9 Quaresma
--------------fODLrZ58qRy1pWIST1TErL0r
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3458atJq021053

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 5/5/23 17:05, Jose Quaresma wrote:<=
br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CANPvuRmNPikxvkTOkw8_HRXKtnWKVQ=
Mjgrxwy1NndB4D3f7ZcQ@mail.gmail.com">
     =20
      <strong>
      </strong>
      <div style=3D"border:solid #9c6500
        1pt;padding:2pt;background:#fcfc03"><strong><class=3D"msonormal" =
style=3D"line-height:11pt"><span style=3D"font-size:11pt;color:#000">CAUT=
ION: This email
              comes from a non Wind River email account!</span></class=3D=
"msonormal"></strong><br>
        <class=3D"msonormal" style=3D"line-height:10pt3"><span style=3D"f=
ont-size:10pt;color:#000">Do not click links or open
            attachments unless you recognize the sender and know the
            content is safe.</span><br>
        </class=3D"msonormal"></div>
      <div>
        <div dir=3D"ltr">
          <div dir=3D"ltr"><br>
          </div>
          <br>
          <div class=3D"gmail_quote">
            <div dir=3D"ltr" class=3D"gmail_attr">Xiangyu Chen &lt;<a hre=
f=3D"mailto:xiangyu.chen@eng.windriver.com" moz-do-not-send=3D"true" clas=
s=3D"moz-txt-link-freetext">xiangyu.chen@eng.windriver.com</a>&gt;
              escreveu no dia sexta, 5/05/2023 =C3=A0(s) 08:27:<br>
            </div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
              0.8ex;border-left:1px solid
              rgb(204,204,204);padding-left:1ex">
              From: Xiangyu Chen &lt;<a href=3D"mailto:xiangyu.chen@windr=
iver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-lin=
k-freetext">xiangyu.chen@windriver.com</a>&gt;<br>
              <br>
              pahole-native package needs some uapi headers such like
              linux/btf.h,<br>
              otherwise it would report error as below:<br>
              <br>
              btf_loader.c:342:54: error: invalid use of undefined type
              =E2=80=98struct btf_enum64=E2=80=99<br>
              <br>
              Signed-off-by: Xiangyu Chen &lt;<a href=3D"mailto:xiangyu.c=
hen@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"mo=
z-txt-link-freetext">xiangyu.chen@windriver.com</a>&gt;<br>
              ---<br>
              &nbsp;meta-oe/recipes-devtools/pahole/<a href=3D"https://ur=
ldefense.com/v3/__http://pahole_1.24.bb__;!!AjveYdw8EvQ!bNylWq3KEGYf5hLfs=
2xlzXzBZmcw-hBCZq9-WEagfdr2DATOw_5uQFj-opLWXKLwWAXTOdF6genpPCYXr9r2yDTGNv=
8dp2Df$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">pa=
hole_1.24.bb</a>
              | 2 +-<br>
              &nbsp;1 file changed, 1 insertion(+), 1 deletion(-)<br>
              <br>
              diff --git a/meta-oe/recipes-devtools/pahole/<a href=3D"htt=
ps://urldefense.com/v3/__http://pahole_1.24.bb__;!!AjveYdw8EvQ!bNylWq3KEG=
Yf5hLfs2xlzXzBZmcw-hBCZq9-WEagfdr2DATOw_5uQFj-opLWXKLwWAXTOdF6genpPCYXr9r=
2yDTGNv8dp2Df$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"t=
rue">pahole_1.24.bb</a>
              b/meta-oe/recipes-devtools/pahole/<a href=3D"https://urldef=
ense.com/v3/__http://pahole_1.24.bb__;!!AjveYdw8EvQ!bNylWq3KEGYf5hLfs2xlz=
XzBZmcw-hBCZq9-WEagfdr2DATOw_5uQFj-opLWXKLwWAXTOdF6genpPCYXr9r2yDTGNv8dp2=
Df$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">pahole=
_1.24.bb</a><br>
              index 2bb73c3eb..93ee7f30f 100644<br>
              --- a/meta-oe/recipes-devtools/pahole/<a href=3D"https://ur=
ldefense.com/v3/__http://pahole_1.24.bb__;!!AjveYdw8EvQ!bNylWq3KEGYf5hLfs=
2xlzXzBZmcw-hBCZq9-WEagfdr2DATOw_5uQFj-opLWXKLwWAXTOdF6genpPCYXr9r2yDTGNv=
8dp2Df$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">pa=
hole_1.24.bb</a><br>
              +++ b/meta-oe/recipes-devtools/pahole/<a href=3D"https://ur=
ldefense.com/v3/__http://pahole_1.24.bb__;!!AjveYdw8EvQ!bNylWq3KEGYf5hLfs=
2xlzXzBZmcw-hBCZq9-WEagfdr2DATOw_5uQFj-opLWXKLwWAXTOdF6genpPCYXr9r2yDTGNv=
8dp2Df$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">pa=
hole_1.24.bb</a><br>
              @@ -3,7 +3,7 @@ SUMMARY =3D &quot;Shows and manipulates dat=
a
              structure layout&quot;<br>
              &nbsp;LICENSE =3D &quot;GPL-2.0-only&quot;<br>
              &nbsp;LIC_FILES_CHKSUM =3D
              <a class=3D"moz-txt-link-rfc2396E" href=3D"file://COPYING;m=
d5=3D751419260aa954499f7abaabaa882bbe">&quot;file://COPYING;md5=3D7514192=
60aa954499f7abaabaa882bbe&quot;</a><br>
              <br>
              -DEPENDS =3D &quot;elfutils zlib libbpf&quot;<br>
              +DEPENDS =3D &quot;elfutils zlib libbpf linux-libc-headers&=
quot;<br>
            </blockquote>
            <div><br>
              If it is only needed for native maybe using class-native
              is better:</div>
            <div><br>
            </div>
            <div>DEPENDS:append:class-native =3D &quot; linux-libc-header=
s&quot;</div>
            <div><br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <p>Ah, yes, indeed, i tested on my local setup and this issue
      happens on native package only, thanks for your suggestion, a v2
      patch will <br>
    </p>
    <p>post later.</p>
    <p>Thanks,</p>
    <p>Xiangyu</p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CANPvuRmNPikxvkTOkw8_HRXKtnWKVQ=
Mjgrxwy1NndB4D3f7ZcQ@mail.gmail.com">
      <div>
        <div dir=3D"ltr">
          <div class=3D"gmail_quote">
            <div>
            </div>
            <div>Jose</div>
            <div><br>
            </div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
              0.8ex;border-left:1px solid
              rgb(204,204,204);padding-left:1ex">
              <br>
              &nbsp;# Depends on MACHINE_ARCH libbpf<br>
              &nbsp;PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
              -- <br>
              2.34.1<br>
              <br>
              <br>
              -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
              Links: You receive all messages sent to this group.<br>
              View/Reply Online (#102316): <a href=3D"https://urldefense.=
com/v3/__https://lists.openembedded.org/g/openembedded-devel/message/1023=
16__;!!AjveYdw8EvQ!bNylWq3KEGYf5hLfs2xlzXzBZmcw-hBCZq9-WEagfdr2DATOw_5uQF=
j-opLWXKLwWAXTOdF6genpPCYXr9r2yDTGNsH_kE5v$" rel=3D"noreferrer" target=3D=
"_blank" moz-do-not-send=3D"true">
https://lists.openembedded.org/g/openembedded-devel/message/102316</a><br=
>
              Mute This Topic: <a href=3D"https://urldefense.com/v3/__htt=
ps://lists.openembedded.org/mt/98700913/5052612__;!!AjveYdw8EvQ!bNylWq3KE=
GYf5hLfs2xlzXzBZmcw-hBCZq9-WEagfdr2DATOw_5uQFj-opLWXKLwWAXTOdF6genpPCYXr9=
r2yDTGNsAure0n$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"=
true">
                https://lists.openembedded.org/mt/98700913/5052612</a><br=
>
              Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@l=
ists.openembedded.org" target=3D"_blank" moz-do-not-send=3D"true">
                openembedded-devel+owner@lists.openembedded.org</a><br>
              Unsubscribe: <a href=3D"https://urldefense.com/v3/__https:/=
/lists.openembedded.org/g/openembedded-devel/unsub__;!!AjveYdw8EvQ!bNylWq=
3KEGYf5hLfs2xlzXzBZmcw-hBCZq9-WEagfdr2DATOw_5uQFj-opLWXKLwWAXTOdF6genpPCY=
Xr9r2yDTGNiJoZlYi$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D=
"true">
https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href=3D=
"mailto:quaresma.jose@gmail.com" target=3D"_blank" moz-do-not-send=3D"tru=
e" class=3D"moz-txt-link-freetext">quaresma.jose@gmail.com</a>]<br>
              -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
              <br>
            </blockquote>
          </div>
          <br clear=3D"all">
          <div><br>
          </div>
          <span class=3D"gmail_signature_prefix">-- </span><br>
          <div dir=3D"ltr" class=3D"gmail_signature">
            <div dir=3D"ltr">Best regards,
              <div><br>
                Jos=C3=A9 Quaresma</div>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------fODLrZ58qRy1pWIST1TErL0r--

