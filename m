Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A1FAC433F5
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 01:12:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.1847.1648689149230889530
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Mar 2022 18:12:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=krw39wjF;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=1089bc0830=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22V0siK7002399
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Mar 2022 01:12:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=7/eCJTHYI1i6+M/27A1EDCWss3J5CpT/qwfIgQRmY+Y=;
 b=krw39wjFjw6iGngcmytaRsCEE1x2q+2Y9xDYIGlNL9ZlV+wkOYmItvHXSG8eXNFtsskn
 MrRtDIxLUUUl+/8yPEP2j/tL31fG1roMSLibs8zHjc/JCxnHmRWa6VXStu2I5vv4hor9
 K/a13U0CePcChdcBAmSA1GJLTirRru8+CZtzz+y3y1OzwndTHDMiXIM+MxCtVtAYjRor
 DjSOeAIblXXfI635Lqd+l7JzevUcvZ8janP+mRXH7QgDsyKYfnXs7n+486DEsZRN1Nky
 7yv9p8O7pPGzqzt0B/eRA+dy1A1GnmQ/FFU0b8vwGqjDBqyqOuk1cmar5/NhVq0YrKa6 /Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3f1st83y7h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Mar 2022 01:12:28 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 22V1CRi6026817
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Mar 2022 01:12:28 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3f1st83y7f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Mar 2022 01:12:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jUojqBfwU6iKXWptyauK+Jbjfrpn9k9BSf6XHqa1Oov+S1GyAIaTqyG52xy4/jAZWPpuNFXhrtrVI8UIhqX1WivX/oRevHyw6twPWK3YnDBFTkJjqeA8Qg3gQ3TMZkaNkKR+ro0KXInLqcf3GJT3Drx+ZvVbV8ztSjRG1YSuOzoKcA8AP3VdXIdlY3SuNwt4Dp548RAKI0avznRp05DvbXJMCC2DDpeHb+hSEEkwCscGYaTF4yfkKJn7WRTuEEGqcmGeCVwwvxtwb7GoN9AWTg7N/d013ULm9AmtIOGO+rmhOr1WOM8YSTN4cKRDoB35Cs/ErB2ZbNR2sUXjMBD1wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7/eCJTHYI1i6+M/27A1EDCWss3J5CpT/qwfIgQRmY+Y=;
 b=kr/bkaRY2WDKm0SB1NDmAUF9rnrjL0Sd57/7JeAxKiRhSgvxoup9RONWinj8a9XR8BmL0K/naGTL5SGhn9iZUWtruBHG89+MOB0M4IlvwBA/3x41ztsp/btmvovu3iRoSm7rnCOn19RfSJaCtRoJCPh162EY1Bb8WKqSQRd4/FdXGf4i4sSbgkYwDNlNAjF82KzpMrcCa6PFdGAhu+e6pQSod4p0sgVJ0FkxO/iWUsG254KyE4Gr3FJbqNGCznenV39DFJd8wu7gAlOFHEbJ1yZbrTM2rbJEva11xcja57tK4NXOVtcspISOmfg4rfXcxrS5akZ/p8fSsrvnmIwRoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4851.namprd11.prod.outlook.com (2603:10b6:303:9b::13)
 by CY4PR11MB2023.namprd11.prod.outlook.com (2603:10b6:903:30::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18; Thu, 31 Mar
 2022 01:12:26 +0000
Received: from CO1PR11MB4851.namprd11.prod.outlook.com
 ([fe80::f1b3:7366:4e07:9f14]) by CO1PR11MB4851.namprd11.prod.outlook.com
 ([fe80::f1b3:7366:4e07:9f14%5]) with mapi id 15.20.5123.020; Thu, 31 Mar 2022
 01:12:25 +0000
Subject: Re: [meta-python][PATCH] python3-wxgtk4: Use cross prefix with native
 wx-config
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20220331005935.3921128-1-raj.khem@gmail.com>
From: Kai <kai.kang@windriver.com>
Message-ID: <40c21bae-3534-bf8d-3ed5-ecc77e5a42d7@windriver.com>
Date: Thu, 31 Mar 2022 09:12:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20220331005935.3921128-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: BYAPR11CA0039.namprd11.prod.outlook.com
 (2603:10b6:a03:80::16) To CO1PR11MB4851.namprd11.prod.outlook.com
 (2603:10b6:303:9b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c79e19ab-4a7c-428e-7c10-08da12b3846a
X-MS-TrafficTypeDiagnostic: CY4PR11MB2023:EE_
X-Microsoft-Antispam-PRVS: 
	<CY4PR11MB20230345F33D06E07433325695E19@CY4PR11MB2023.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ibyQZPtzlikhsyDbxxEIlL66JHgGsSX5NJ1VWEyNDEgIUKT6jkECNqN/Xjyl1ggbg7wTRIhOUiBN3YHkD7BmCeW60dR6LvoHSXUUVD+aiU/wwMy2ANTGGVApfMLEuD3iulvZGrRrui3J0DZsdZ916pW2wUk58EaLV4Sf6pdHu/Y9Srv+1vwR3q/Nss/VZm4TULVWO0sP6rZI+oEBBPebUq7VHv2W6oGr2ds19B8VqogTnH28V9wLiFKmDnKNyVFZsfip1A6BMlG1x2S9Aw6MTPCE7fymFaaeG6G9QcOu1G60KNGUFRRKs1Hq6d6RI3AtDqCgqILq+NgbWRtoC2HJT+1iukvu8pB4JKME6rGOQBbCNS9kd7vtXAcPND4V03X3LTG4di/5SfuIIJ7x0FpKk9icsV6kvEf8rIosBLUyOB3ofAOV6LD+Hs8nSz+vXSqYM9JvroBHzREHKdfnCv/VleVvdD6kQVAxLHG6ijK+Ct+AXBdoyNuqo6NjObeEPMd8C64RaHW5cvNWbXvK8VPtQ8hEg/fbLodUegEoYLlcP3m3Re+IF0BkE0xpW8DUBwLl/Xy3ndaKwvJPQ5LwlgbkrmzCZbKM5W+0svZ9YNNL03zY21TBA8K2vVN6FJSdBJcKxnbs5tnNvzYSN7PGr/VdM8JJtsLSeUgjN2wvLRZyE9IMMYYWQ9jr1qA90yM8w8eZUYETq8IJb8rsFTSP6T4xh/kwQyCibiHkbWzrdnuw8tuYy1sXwhtVBKe7PlTa9KFzx8UBEQwaiYVPP/+vHr4raw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4851.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(36756003)(8936002)(6512007)(66556008)(38100700002)(31686004)(5660300002)(66946007)(8676002)(38350700002)(2616005)(508600001)(31696002)(53546011)(83380400001)(26005)(6506007)(316002)(6486002)(52116002)(86362001)(66476007)(186003)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZjlZZ1pGOEN5NDVMYlBwVjQ2cVBxTlM5M29iZXZxSGlqMDR0aFcrUmRlTEZE?=
 =?utf-8?B?NVhjSFhra0ZsWTVSSGhGanFXaEZDQUJSYUdPZlhmYkdtbW5rT0poNnFUc1Zh?=
 =?utf-8?B?U3laZzltNk1qdS81Y3ZEdCtqK1EwZDRobnczSnZYYkpSeGdtSEdkRmUwNUQ2?=
 =?utf-8?B?Ym9Bb3dScnhKSCsrbWF4bDhxa2dVQnJIUmpOcGxmYWVFZElpMWk1dWZvZFNK?=
 =?utf-8?B?UkVzUWo3RUs1Y2xWWHVaV1hwbGExcnVzQW95WFpwSUpsRzJhOEpoN2RaeTlM?=
 =?utf-8?B?OE80U2xuNlJPOGFMRkpDR21lV3NnUm5xUDFjS0FJNVBuSUJ4L2tzaFhmNnNj?=
 =?utf-8?B?QWlZWC91RXR3ODJyU2dMS201L0EwUmdhSklpbHJvNlVLcEdsRmM2SDJzdGcv?=
 =?utf-8?B?cktRcFRpVlhLZWx5WHFIaTlIdFlidkt1Njdpd1pVUzlJK1FpMWJTRndiSndY?=
 =?utf-8?B?TGduNVFiTkdGZ2ZnTzRIcnorckU5a1A2cm95VDhkUndENURGMTJOMzkxUnZi?=
 =?utf-8?B?THpnZUNTbDhsODlsNkxxVHJVejFuRHlCRWhKZTNiaysvOHpUNXViU3J1ZEIx?=
 =?utf-8?B?Vmk2WU1Ec0pWV2t6MCt0VllDdFJNZFE3YVF0SHBPa3kvYlNFeElzQVlVRjhy?=
 =?utf-8?B?TkNiZ2c3YzI5Tzl3aTNtbjlxTDJGeTh2ZFpkNDdseVNLeTlEMmRMR2J2Y0xZ?=
 =?utf-8?B?TldKZWpxQytSdmIwVWlRZEVVYnZKRWhheGd5ZTdjeFVyNHhEYUw5N0JpWGpR?=
 =?utf-8?B?dURmdzFmWk55N2gxNzl6b01CMGVoVm9zUVFyTmZVUmhkWTJJN2JPNTlPekF4?=
 =?utf-8?B?c01ITlRmSHZBYU91SUpUTHFCM1FyNTU5cktacWVwZFUvdnFMMFRzT05DbU5U?=
 =?utf-8?B?TXdLWHQ0QndIQi9GY2VlY0ZObVpZUEVaY1VRTjl5em5ZMDR0Y28rTStCUlJy?=
 =?utf-8?B?Vzl6RXFYN1FoZWN1TXA5RG0xQzRxM1Jib3hsTWxlYVZMSkN5eUJ4WXlxMThw?=
 =?utf-8?B?OVJKaFZuQ2FIS0lvSkpDbVROSjlFODBsc0U3MitTMXd2eDlOMWt3QnNpdjFx?=
 =?utf-8?B?M3laT1VUU0V3TWxoQjUxQ01jeEdjVmdSNTRxSCt4UGlLT3pXcFVPaUVjZEUx?=
 =?utf-8?B?dzJKN3UrSHVmRFVuaENFQmg3L0o3dER0QUpSQnV2ZnBuUXZyOVdaVjlSOSs2?=
 =?utf-8?B?THozTFl6cUYwYk9SUCtwVUJZeUcrRzVKaVlaMUhIYk9LVlZ2b3hGZzhKQlpB?=
 =?utf-8?B?K1VMUFlDdk5PQlRNZXlyY3ZHSnAzSmZ5eHFvOWhnWk5UTm1PL0JxcUd1TmhN?=
 =?utf-8?B?QkU1U2tIQmxHNFpoTVJseUE2b05RZmpYeUVERnVIcTNPdGNQUTFjOENIUklm?=
 =?utf-8?B?cGVyZm1LUkE3dFROeSs4ZnBZUld4aERNdnp2ZVdXNkZoblpRZ1pZREMveVRk?=
 =?utf-8?B?Njg3aFZweTdzaFdZaXp4ekVvWFlFSUFhNnZSNjAwbHFXMTU4cURhT3JJTmxp?=
 =?utf-8?B?VitodldNOVVKREVIQjZGRXZFZGYxNkVtei9RQjVlQ1A4Z3dUVHhVUUxVQldh?=
 =?utf-8?B?SFlRZUk5OUhPZXMzeWU2UXg0VFJxcjhRdEVKZHRQYzlzS2tXcTQ3MitRbzcw?=
 =?utf-8?B?bm9BSkxoeXdra0xpc1lZaHpOSGVYUWlYQ2pIblg5czNFYnQrWGxjM1pyN3Z0?=
 =?utf-8?B?QjN1cHdCdU04VTQvZy9DS054MVBCZWxoYTFCTlVnYi9raTFoL3N0NndPUk5C?=
 =?utf-8?B?L3l1blFGRDF3a05hUkJYSG1EcHMvY1FDWEVaWTM3bllTemVPRVFqTUhwck1y?=
 =?utf-8?B?ZTdvYytEcWx6MmdiMlhlVmsxblFRVExKeU1vaElYdG4xSVdSNSt3aFZlN25p?=
 =?utf-8?B?eHFhdGthazRUMDczcHRGYTBWQ2I4SVl2bnRBOFBwQnVjSEpybTBZbEd5YkZC?=
 =?utf-8?B?T0M0eW5ZSTU2bk9mVWJ4cU5HbzV5Skpua3BDVkk0NS8xM3J1M1NUL3N1QkNh?=
 =?utf-8?B?T1FLRExWWTNCRUlKNnY0c0d0cWpydVZOZDdIVmVMSDM1TXNqbm9SclpNSW9Y?=
 =?utf-8?B?T29nSHA2MWVqSDQwenNRL1VnYjJmMGUvUGEwUC82RklkWFFjSWJ3SXJ2TGhX?=
 =?utf-8?B?TXlLUWYzTmRQdXZEZk5aR3dFZjlQMFZzZzg1eFVnOHZDTkIyZWxJQTFWUHpz?=
 =?utf-8?B?a2htelZNU1A2elNmeDMxeTRzVkpJdGVBZ0FSalE4OU9ERFB4MUYzRHZMK09R?=
 =?utf-8?B?Q3FDMGs1ekpPTEQrUy82QTQ2N1c0NTlvWEdxUERZc2tEZUMvVWFGQVZLMDFC?=
 =?utf-8?B?eTdybXk0M2x5Um5qaFlTbXp3dnZiM3VJd0lod1EzNldzZVVWUlM5QT09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c79e19ab-4a7c-428e-7c10-08da12b3846a
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4851.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 01:12:25.9030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 uaPaOF78kGoIb8deuzbqDt35Mzd83BmVN6hNwqgC/CRT8q1fJ2IvYXw0p1wWhzWa8004Dx8MrwedRp+TGgUgUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB2023
X-Proofpoint-GUID: QnOzSrRDiMwMB-w462gEh7Cq7Vo0akN9
X-Proofpoint-ORIG-GUID: vxa8FqcP9DoseVpo7eqlqIEBS6VKW9xf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-30_06,2022-03-30_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 adultscore=0 mlxlogscore=999 suspectscore=0 spamscore=0
 clxscore=1015 mlxscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203310005
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 31 Mar 2022 01:12:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96273

On 3/31/22 8:59 AM, Khem Raj wrote:
> This ensures that it relocates the returns of queries w.r.t. target
> sysroot and not based on native sysroot where this tool itself resides
> and uses that by default. Fixes build issues seen on mips architecture
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Kai Kang <kai.kang@windriver.com>
> ---
>   .../recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.1.1.bb     | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.1.1.bb b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.1.1.bb
> index af7b51d83b..e61b00efa4 100644
> --- a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.1.1.bb
> +++ b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.1.1.bb
> @@ -18,7 +18,7 @@ S = "${WORKDIR}/wxPython-${PV}"
>   
>   inherit pypi setuptools3 pkgconfig
>   
> -export WX_CONFIG = "${RECIPE_SYSROOT_NATIVE}${bindir}/wx-config"
> +export WX_CONFIG = "'${RECIPE_SYSROOT_NATIVE}${bindir}/wx-config --prefix=${STAGING_EXECPREFIXDIR}'"
>   
>   RDEPENDS:${PN} = "\
>       python3-difflib \

Thanks a lot.

-- 
Kai Kang
Wind River Linux


