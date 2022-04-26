Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5CD3C433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 01:45:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.1132.1650937546549497637
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 18:45:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=jTfjmHFd;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=111571f8b4=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 23Q1CTHT022198
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Apr 2022 01:45:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=6lyVVStYPykb3rKGiAu9O3qF5dsZTqav5uELSMiaIMI=;
 b=jTfjmHFd3kZzctjb2PcmGYpGQGBZg6mkb8AVjYZbKdaMS9PcFFu9Cr6i/QpBrcQrJZ+L
 v22lGxlhOL6kepGryziIEob++fAu5/inkwukO+SYYbdg0aTPglqd+s5QoLmo0zt6RP5x
 Cvcfr7UyPprLsknNcsUXwI94NeCVmWh3U1E8GCVkgVwMHGrKhzvyiYxLWnOR0Hwy/n3T
 NwkV/enZknRMYqpB6VG8G6uoOdLDRrD32izXeI5IG5VUAsCHwhwB2g+qlBGVqeQBls8Z
 fMRC9Jp31qvA9ikxNkxkpI+ILXr0sUBinyFJRo01xBSYmfLYsAIenkZeLgfdpdgcjEQv AA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fm8e9218b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Apr 2022 01:45:45 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 23Q1jj1a020884
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Apr 2022 01:45:45 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fm8e92188-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Apr 2022 01:45:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k6maiO7vsu4EN1sF8UMsSpERT5XiGGnDRU84QHj6TYkOhKvaPT0cMhpEOFQm1oHmLE99ott9cIZxOoYJ5tT60B/RlX2S3t9LgOS83SeYcDNFP9L3ZNjIJfYpvHj93Lxv7gModVyTsFjv0UZnMbiTG/zeyPlvinzXoSRizFpt86tZdHxDrXKQ6gZ4+Wc7Qt39i8vvKE5QBJPNYuSqv/sQ4GTV5jtqH4JyMnauuqrSSd9/pBtu2ik313KSH4znO0WioBdlKMzL5FvUHYLIl8tKoakBxxICUyAhLY7VdJVKFXTwTW7GI28jw92OhG8iCVcEBqj4+vSFxmpQwGyITVMwXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6lyVVStYPykb3rKGiAu9O3qF5dsZTqav5uELSMiaIMI=;
 b=YqavANeLQp78xIXGS8SQoSUt0dWaQxZtbvi5kYqrpqpr07m7Ke4BObtELVqFD6/pxM7ynINTrYXPuSjWj/s3hZNUEof6WZPEL3IKBhmyoO4cyZh+isZio8db+te/z8ycEKZfgdLu2g1BJNMbpfyn1NQn2FLG+Gk95ERXx/Psq3E5b8txuykxJv2U4XjRAXh6B6iMPkn59TQUU0TI3lCpb0Fr2GzfEEvAzlPmsmH5tOUasK6chrypov7UlOMlkrYwyf2rzYqkdLo/OStlEOXqq/Fd51swfuU9kQfT2TUwAISm/G3UZMj9yvvZ/bJjMJhfr1SymuHjWKwlo/c/Ejn83w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by BYAPR11MB2551.namprd11.prod.outlook.com (2603:10b6:a02:c5::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Tue, 26 Apr
 2022 01:45:41 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::c515:d21d:135:c65c]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::c515:d21d:135:c65c%3]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 01:45:41 +0000
Subject: Re: [oe] [meta-oe][PATCH] crash: Upgrade to 8.0.0
To: akuster808 <akuster808@gmail.com>,
        openembedded-devel@lists.openembedded.org
References: <20220422030730.2556794-1-mingli.yu@windriver.com>
 <f07a5c7a-40ac-177f-eaa9-bb0d3d23c922@gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <6c80817d-0b9b-4f55-2814-8ef22f85c839@windriver.com>
Date: Tue, 26 Apr 2022 09:43:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <f07a5c7a-40ac-177f-eaa9-bb0d3d23c922@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-ClientProxiedBy: HK2PR06CA0019.apcprd06.prod.outlook.com
 (2603:1096:202:2e::31) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb0ef46b-eaa5-4f8a-78bd-08da272678aa
X-MS-TrafficTypeDiagnostic: BYAPR11MB2551:EE_
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2551EE4D9B45DAC47FB8B961F1FB9@BYAPR11MB2551.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TevZG/JWfwHW+Wevj+Q46KaiEyol0XrJ0POU+aY4KO63jlqN3iD1jNjmugatQAdyCeni2eUxTYl3k2eMq1n+A6aV9E2YuOIV4pXW5HPSUjCjkKsV6pwrPWMtOAIi+Ov7ewz58+9ju7oELuzRCCyWdmbrddUkMpKwtFtJxKyLfQehRx5qvVt38pBXGqU+pSF3lHrh8E+FyEf0RMwKsXsUQacShWikZt/VO7AeeNOw8cNvO9rUTd+9Jwlt5xFUmfPCjgb0Kqd8Ce0XxwoESaF6FctUg2gr3twngiVIC7vg0Dh/cmYlPbo+7OnSKruhum7gvgoGnihGBM1kzoR1D7ThZ/r2AFUzxAarKv2SxB0LWA3Zv5mcAVbsGIX2YypGv8Jb7ECGLOHku0h44mVrTsO56rey1ya/k38HGnUI+qawj/gYrdCyCr6cgzsHYQg9jgW1N7Ky6DXoo0p8OvGEssiSNIhVNJCao8nE2aT651BIZxCEi776qrccbHykru7dlLpvevR409jClhwZ5O6ezlPcurDMKGZ4DYkPcSvUwoa7JziPW4Y3REZemKOr2QOGXMDl7zWgB1tU0OvqyLlRs8UiCqNuuIIFHvkkL5Tkc8SN0gvoGQERlHxTBhkpPMsVXIU9HoTVzNP5nUxWXqlAlqzlC337+JfsRozd55qK+YWEhu4O20aDmCo+B72Y/enb7fuhNJUbsIbM8NkxFVrmzw3IMpSf80OEGnNkj/FSapfgpgKuTnejLKUmeVmXZHK9dImzYEpXF6nYZYSQOU8gla3/ZG0CvMgdy73G0K7iNfKVPnFuGh+F5I4qs7qbx7+LDda4A3y9RPHNpcSgFEG41RzDQjIBld2mDw2s8PcY/qNbscn/13kLhmKNLd/819mU/I8t
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(26005)(6666004)(6512007)(6506007)(83380400001)(31686004)(31696002)(186003)(2616005)(30864003)(8936002)(66556008)(66476007)(8676002)(53546011)(52116002)(38100700002)(2906002)(5660300002)(38350700002)(966005)(66946007)(36756003)(6486002)(508600001)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QVJnYU14S3NsT1YzS24xazBMeFVvTHRTWERodzFDUTJ1NUJWaWRTVm5sVmxp?=
 =?utf-8?B?Y29aY3RFVWpCdUxXNktwZFlWSkFtOEdralVxQnlwcjdOaVNPdjR3MVNpQ2p6?=
 =?utf-8?B?Ym1YWnU2cHI2YlE4cjM1MEdISExUMkpiRkl0YjhpeUZRZE03Uk1USjNST2dj?=
 =?utf-8?B?YzRqWTFHWXRGODAza280bjd6RVd5SXZBOXByNXFlSnFIM0xaVzRDa0V2Vi80?=
 =?utf-8?B?VEpnVU90NlNrcEFBL1lEeW9tQ2E3KzRpRWV1WUxCUERkTlh5U29SU2FqS0lo?=
 =?utf-8?B?RktFMzllMGdzZ1Q2RGYwYW55ckt4RkZPbEhXZTBzaVhTK1pZM05XVzAyM1d4?=
 =?utf-8?B?aHV5cm10cTdlR3RpVUdFSlpHTGQ4SjZSRkw4Zit1ODhSVHJMVUpsZm9NcTlX?=
 =?utf-8?B?TE1GQmpTTnh4eTJaSmJYUkdPSUpWbWRBaWF4ZUFHVmNCRE5uMlc5WWtHRC9h?=
 =?utf-8?B?bWVPczdNVFBkV1p4TVNoQU1lNHlKc2RIbThXaTJ4enRJTWNEU1VBQ0Jvc2dz?=
 =?utf-8?B?dXRSZHlXWkpodVlXSjZMOFpXVzJ2QmVVUC9hSTdsR1lkSEYvU3pOdHNQbjFB?=
 =?utf-8?B?OGVJb2xpQTJXb0gxNm84YVlPQ3RGRmhqWm5GR2UxNjFZNklvVmNKcVE0a3VR?=
 =?utf-8?B?cGliL29NSUp1YnRSSzE3YjYwU3dsUjhxdkUvWEp3UFFrUS9iTm9mWjNzbnBI?=
 =?utf-8?B?S2tHaHY1TlI2N01HK3NLU1V3QkVYU3NVa2ZGMzJ4MWVoU3Zkc1gyUG1zTm0z?=
 =?utf-8?B?L1NBQjlnVUVSSlBSZDhqMG5oeXF1cWZKMzd1T0FVbGJxQ3NHeVVINm90aFlK?=
 =?utf-8?B?Sm1pWk42N3dSQ0pYMWE3VTR2RXNKQnRuREd6SnVrdGt1SjYxRDBOcnM5ejBS?=
 =?utf-8?B?eW41RDBTUVFHcm5qV3hnMFMyTmdabEhkZHI1M0M3aDBIcFBjUG1UVjVhbTEy?=
 =?utf-8?B?U295dHBOR3BydFJMVk9BZ2QyeHhmNlFxSG5hQi8xR3A5MFdYUHR0M200U0Ev?=
 =?utf-8?B?WXF0Q3d5bk5QalRSV3ZEMjYySVlYakFPUmdZNDIrVXB0Mi9MUno1eThSMXJF?=
 =?utf-8?B?bHpDNG1jaytrQjRLamh0aEpWMWpCSis3bThya3RyamxGUHNMM3NpZ0pObVpn?=
 =?utf-8?B?cXRCWGRFNmlEOFVISWprRnRSNklaVytzcFN1aDBSc2xPN3ZBYjRWMlJ0Nm9F?=
 =?utf-8?B?UnJtOWJMTm1lUnp5UVppOGNOenF4L1ovZmhPbmxqWjNQUkc4cjFzWVhFeElu?=
 =?utf-8?B?Mkw2RDVSZzk5YzQrSEV4SGo0SmJaVTVETHJ6emlyTnpDZ3ZoREQ5R3g4dG9B?=
 =?utf-8?B?b2VBaEhFczd3bXlxckgvY3NaQ0p5cHUzcjE5S1U4d29RS2Z0S0RrWDBGcGpo?=
 =?utf-8?B?QThMbExUSlFMa0lYcGxZaVpsMEFPaWpIdVRuZzhYOGR0YUp6Qjg1MXZURVdq?=
 =?utf-8?B?dUJVYzdVd0hXeXRjb2NuOHhoZ0RXMjlpLzlLT1VjY3FGUk5LSWE2YXR6WFl0?=
 =?utf-8?B?VzA4cEw4dS82OEsyWnJLc2ZnV3FyQXNiazFXQll3clN4UklxSzFoYTRuWDdS?=
 =?utf-8?B?RS8yMmxPR2cxRG92WVo5dklpK0RnZkw4M05QdlVqalgweXYxMUlnTlBYYWpx?=
 =?utf-8?B?cUkyUUN4VTdkSXl4S1l2YlR5V1pyRmEwaVM0V1NRVVl3eTZkWUVCTG9zZnZY?=
 =?utf-8?B?SU5hMTErdHBLb2E4b2pVOTF5RUFwM1lHaVZIRndjdXFjNW5UaDdUZnVVNUlV?=
 =?utf-8?B?S3RQeHM0Y0gydldURHRRNlcreXkxdCtKcGVURXlvTHFLNFF4eG1iRWJsVnpI?=
 =?utf-8?B?dk5nOW1DZ2dvS0RYNHdxRDd6MkhLd3VkcUZ0SEtxVTZIakFFSVlHM2dDOS96?=
 =?utf-8?B?WjdUeUtmUmU3YUNZT0h1c2ZrTWREWGJZSFlMNlFaTlNIRWZBQWRLUFM5ZUtZ?=
 =?utf-8?B?d3NoQmgvTHZpQW1EQjZYRmo4TXo0WG91eDJHNVRBTnUrKzBraG9Ic09GQWNG?=
 =?utf-8?B?eXRPVVBBQ1MzK2hRNlBYYzBRUVlEWEFPNFk4ZDFPdjlMd2c0RUNQYUd6TkpE?=
 =?utf-8?B?bnBqY3huZnA4WHVubFJvVlRJMWp0Nm5scitiRFNMLzRTd0lEZkNJQW9MVmlF?=
 =?utf-8?B?ZnBZMGhoNkgzWUU3Yk9nZjJLc2JCU3I4RzNXS3lCaytLY28zYUpoYjUvMkp3?=
 =?utf-8?B?bFVCcHBBUzZnV2hJYnVRd1UvRlV1VW5TM3VxdXAwZ042bFBBcnlNZGdYaGRm?=
 =?utf-8?B?eXNsOUJWY2FhSEE2NDM1SU91N2JkNDlIa2FyREMybTVXSG9BT1lqMzhvVFY0?=
 =?utf-8?B?bWI5Z2h1aWIwMEwyekFjSTNybWVBeEsvTkh4U2laTUtCK21aRnFFN0JiMFE3?=
 =?utf-8?Q?F2dAY6cvk6WvZ51I=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 eb0ef46b-eaa5-4f8a-78bd-08da272678aa
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 01:45:41.4430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 kOBysb3GZYCYDzxABLXowWfwapRan7HdcGzHMha/+65o11Y4UsMdqoJRWYPGTnyDid35Ke/NlFDTH//AioUQJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2551
X-Proofpoint-GUID: HZjjZpJiTYPQOxaABYIxb4orqriACJI_
X-Proofpoint-ORIG-GUID: TaN7cUs9eFXAihqQqQWVldHFsWxGQJJa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-25_10,2022-04-25_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 mlxlogscore=999 lowpriorityscore=0 spamscore=0 suspectscore=0 mlxscore=0
 adultscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204260009
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 23Q1CTHT022198
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Apr 2022 01:45:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96786



On 4/26/22 7:31 AM, akuster808 wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>=20
> On 4/21/22 20:07, Yu, Mingli wrote:
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> The bundled gdb upgraded to 10.2 [1] and remove related patches
>> against the previous gdb 7.6.
>=20
> Do we need to be in-sync with the GDB in core?

Yes, there is also some changes related to gdb in release note as=20
https://github.com/crash-utility/crash/commit/ec568e2ea515b66343d3488d5d4=
b9a625d55b7ae

Thanks,

>=20
> - armin
>>
>> [1]=20
>> https://github.com/crash-utility/crash/commit/ec568e2ea515b66343d3488d=
5d4b9a625d55b7ae=20
>>
>>
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ---
>> =C2=A0 ...error-unknown-type-name-gdb_fpregset.patch | 36 ---------
>> =C2=A0 ...tect-the-sysroot-s-glibc-header-file.patch | 33 --------
>> =C2=A0 ...unrecognized-gcc-option-m32-for-mips.patch | 33 --------
>> =C2=A0 ...im-arange-fix-extern-inline-handling.patch | 79 ------------=
-------
>> =C2=A0 ...m-ppc-drop-LIBS-from-psim-dependency.patch | 37 ---------
>> =C2=A0 .../crash/{crash_7.3.0.bb =3D> crash_8.0.0.bb}=C2=A0 | 12 +--
>> =C2=A0 6 files changed, 3 insertions(+), 227 deletions(-)
>> =C2=A0 delete mode 100644=20
>> meta-oe/recipes-kernel/crash/crash/0002-crash-fix-build-error-unknown-=
type-name-gdb_fpregset.patch=20
>>
>> =C2=A0 delete mode 100644=20
>> meta-oe/recipes-kernel/crash/crash/0003-crash-detect-the-sysroot-s-gli=
bc-header-file.patch=20
>>
>> =C2=A0 delete mode 100644=20
>> meta-oe/recipes-kernel/crash/crash/remove-unrecognized-gcc-option-m32-=
for-mips.patch=20
>>
>> =C2=A0 delete mode 100644=20
>> meta-oe/recipes-kernel/crash/crash/sim-common-sim-arange-fix-extern-in=
line-handling.patch=20
>>
>> =C2=A0 delete mode 100644=20
>> meta-oe/recipes-kernel/crash/crash/sim-ppc-drop-LIBS-from-psim-depende=
ncy.patch=20
>>
>> =C2=A0 rename meta-oe/recipes-kernel/crash/{crash_7.3.0.bb =3D>=20
>> crash_8.0.0.bb} (87%)
>>
>> diff --git=20
>> a/meta-oe/recipes-kernel/crash/crash/0002-crash-fix-build-error-unknow=
n-type-name-gdb_fpregset.patch=20
>> b/meta-oe/recipes-kernel/crash/crash/0002-crash-fix-build-error-unknow=
n-type-name-gdb_fpregset.patch=20
>>
>> deleted file mode 100644
>> index 8355fe44e..000000000
>> ---=20
>> a/meta-oe/recipes-kernel/crash/crash/0002-crash-fix-build-error-unknow=
n-type-name-gdb_fpregset.patch=20
>>
>> +++ /dev/null
>> @@ -1,36 +0,0 @@
>> -From 52fc1a7c17768fd52c3577d21dad84e8babb94b5 Mon Sep 17 00:00:00 200=
1
>> -From: Dengke Du <dengke.du@windriver.com>
>> -Date: Thu, 6 Apr 2017 23:01:14 -0400
>> -Subject: [PATCH 2/3] crash: fix build error unknown type name=20
>> 'gdb_fpregset_t'
>> -
>> -Upstream-Status: Pending
>> -
>> -Signed-off-by: Dengke Du <dengke.du@windriver.com>
>> ----
>> - gdb-7.6/gdb/gdb_proc_service.h | 3 +--
>> - 1 file changed, 1 insertion(+), 2 deletions(-)
>> -
>> -diff --git a/gdb-7.6/gdb/gdb_proc_service.h=20
>> b/gdb-7.6/gdb/gdb_proc_service.h
>> -index 8bc6088..99c6496 100644
>> ---- a/gdb-7.6/gdb/gdb_proc_service.h
>> -+++ b/gdb-7.6/gdb/gdb_proc_service.h
>> -@@ -20,6 +20,7 @@
>> - #define GDB_PROC_SERVICE_H
>> -
>> - #include <sys/types.h>
>> -+#include "gregset.h"
>> -
>> - #ifdef HAVE_PROC_SERVICE_H
>> - #include <proc_service.h>
>> -@@ -53,8 +54,6 @@
>> - #include <sys/procfs.h>
>> - #endif
>> -
>> --#include "gregset.h"
>> --=20
>> - /* Functions in this interface return one of these status codes.=C2=A0=
 */
>> - typedef enum
>> - {
>> ---
>> -2.8.1
>> -
>> diff --git=20
>> a/meta-oe/recipes-kernel/crash/crash/0003-crash-detect-the-sysroot-s-g=
libc-header-file.patch=20
>> b/meta-oe/recipes-kernel/crash/crash/0003-crash-detect-the-sysroot-s-g=
libc-header-file.patch=20
>>
>> deleted file mode 100644
>> index 1f4bd01da..000000000
>> ---=20
>> a/meta-oe/recipes-kernel/crash/crash/0003-crash-detect-the-sysroot-s-g=
libc-header-file.patch=20
>>
>> +++ /dev/null
>> @@ -1,33 +0,0 @@
>> -From c7950ef5228adc52a500b4fc67d7e48c3c09c1df Mon Sep 17 00:00:00 200=
1
>> -From: Dengke Du <dengke.du@windriver.com>
>> -Date: Thu, 6 Apr 2017 23:02:44 -0400
>> -Subject: [PATCH 3/3] crash: detect the sysroot's glibc header file
>> -
>> -This is cross compile, so let the Makefile detect the sysroot's glibc
>> -header file, not the host's glibc header file.
>> -
>> -Upstream-Status: Pending
>> -
>> -Signed-off-by: Dengke Du <dengke.du@windriver.com>
>> ----
>> - Makefile | 4 ++--
>> - 1 file changed, 2 insertions(+), 2 deletions(-)
>> -
>> -diff --git a/Makefile b/Makefile
>> -index b6b7e80..94f21a5 100644
>> ---- a/Makefile
>> -+++ b/Makefile
>> -@@ -264,8 +264,8 @@ gdb_patch:
>> -=C2=A0=C2=A0=C2=A0=C2=A0 if [ "${ARCH}" =3D "x86_64" ] && [ "${TARGET=
}" =3D "PPC64" ] && [ -f=20
>> ${GDB}-ppc64le-support.patch ]; then \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 patch -d ${GDB} -p1 -F0 < ${GDB}-ppc64le-support.patch ; \
>> -=C2=A0=C2=A0=C2=A0=C2=A0 fi
>> --=C2=A0=C2=A0=C2=A0 if [ -f /usr/include/proc_service.h ]; then \
>> --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g=
rep 'extern ps_err_e ps_get_thread_area (struct'=20
>> /usr/include/proc_service.h; \
>> -+=C2=A0=C2=A0=C2=A0 if [ -f ${RECIPE_SYSROOT}/usr/include/proc_servic=
e.h ]; then \
>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g=
rep 'extern ps_err_e ps_get_thread_area (struct'=20
>> ${RECIPE_SYSROOT}/usr/include/proc_service.h; \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 if [ $$? -eq 0 ]; then \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 patch -p0 < ${GDB}-pr=
oc_service.h.patch; \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 fi; \
>> ---
>> -2.8.1
>> -
>> diff --git=20
>> a/meta-oe/recipes-kernel/crash/crash/remove-unrecognized-gcc-option-m3=
2-for-mips.patch=20
>> b/meta-oe/recipes-kernel/crash/crash/remove-unrecognized-gcc-option-m3=
2-for-mips.patch=20
>>
>> deleted file mode 100644
>> index 37d43b888..000000000
>> ---=20
>> a/meta-oe/recipes-kernel/crash/crash/remove-unrecognized-gcc-option-m3=
2-for-mips.patch=20
>>
>> +++ /dev/null
>> @@ -1,33 +0,0 @@
>> -Upstream-Status: Pending
>> -
>> -It fails to build crash for mips with error:
>> -
>> -| mips-wrs-linux-gcc: error: unrecognized command line option '-m32'
>> -| Makefile:291: recipe for target 'make_build_data' failed
>> -
>> -So remove the unrecognized option '-m32' for mips.
>> -
>> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ----
>> -diff --git a/configure.c b/configure.c
>> -index cf1973b..71e97b3 100644
>> ---- a/configure.c
>> -+++ b/configure.c
>> -@@ -155,7 +155,7 @@ void add_extra_lib(char *);
>> - #define TARGET_CFLAGS_PPC64_ON_X86_64=C2=A0 "TARGET_CFLAGS=3D"
>> - #define TARGET_CFLAGS_MIPS           =20
>> "TARGET_CFLAGS=3D-D_FILE_OFFSET_BITS=3D64"
>> - #define TARGET_CFLAGS_MIPS_ON_X86    =20
>> "TARGET_CFLAGS=3D-D_FILE_OFFSET_BITS=3D64"
>> --#define TARGET_CFLAGS_MIPS_ON_X86_64=C2=A0 "TARGET_CFLAGS=3D-m32=20
>> -D_FILE_OFFSET_BITS=3D64"
>> -+#define TARGET_CFLAGS_MIPS_ON_X86_64 =20
>> "TARGET_CFLAGS=3D-D_FILE_OFFSET_BITS=3D64"
>> - #define TARGET_CFLAGS_MIPS64=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 "TARGET_CFLAGS=3D"
>> - #define TARGET_CFLAGS_SPARC64=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 "TARGET_CFLAGS=3D"
>> -
>> -@@ -167,7 +167,7 @@ void add_extra_lib(char *);
>> - #define GDB_TARGET_ARM64_ON_X86_64 =20
>> "GDB_CONF_FLAGS=3D--target=3Daarch64-elf-linux"=C2=A0=C2=A0 /* TBD */
>> - #define GDB_TARGET_PPC64_ON_X86_64 =20
>> "GDB_CONF_FLAGS=3D--target=3Dpowerpc64le-unknown-linux-gnu"
>> - #define GDB_TARGET_MIPS_ON_X86    =20
>> "GDB_CONF_FLAGS=3D--target=3Dmipsel-elf-linux"
>> --#define GDB_TARGET_MIPS_ON_X86_64 =20
>> "GDB_CONF_FLAGS=3D--target=3Dmipsel-elf-linux CFLAGS=3D-m32"
>> -+#define GDB_TARGET_MIPS_ON_X86_64 =20
>> "GDB_CONF_FLAGS=3D--target=3Dmipsel-elf-linux"
>> -
>> - /*
>> -=C2=A0 *=C2=A0 The original plan was to allow the use of a particular=
 version
>> diff --git=20
>> a/meta-oe/recipes-kernel/crash/crash/sim-common-sim-arange-fix-extern-=
inline-handling.patch=20
>> b/meta-oe/recipes-kernel/crash/crash/sim-common-sim-arange-fix-extern-=
inline-handling.patch=20
>>
>> deleted file mode 100644
>> index 0185b5704..000000000
>> ---=20
>> a/meta-oe/recipes-kernel/crash/crash/sim-common-sim-arange-fix-extern-=
inline-handling.patch=20
>>
>> +++ /dev/null
>> @@ -1,79 +0,0 @@
>> -Upstream-Status: Backport
>> -
>> -https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommit;h=3D92fc6=
15
>> -
>> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>> -From 92fc6153a6fdf2a027d9780f5945712aafad4a9e Mon Sep 17 00:00:00 200=
1
>> -From: Mike Frysinger <vapier@gentoo.org>
>> -Date: Sun, 29 Mar 2015 15:59:01 -0400
>> -Subject: [PATCH] sim: common: sim-arange: fix extern inline handling
>> -
>> -With newer versions of gcc (5.x), the extern inline we're using with =
the
>> -sim-arange module no longer works.=C2=A0 Since this code really wants=
 the gnu
>> -inline semantics, use that attribute explicitly.
>> -
>> -Reported-by: DJ Delorie <dj@redhat.com>
>> -Reported-by: Joel Sherrill <joel.sherrill@oarcorp.com>
>> ----
>> - gdb-7.6/sim/common/sim-arange.h | 20 ++++++++++++--------
>> - gdb-7.6/sim/common/sim-inline.h |=C2=A0 4 +++-
>> - 2 files changed, 15 insertions(+), 9 deletions(-)
>> -
>> -diff --git a/gdb-7.6/sim/common/sim-arange.h=20
>> b/gdb-7.6/sim/common/sim-arange.h
>> -index 73117f3..de842c9 100644
>> ---- a/gdb-7.6/sim/common/sim-arange.h
>> -+++ b/gdb-7.6/sim/common/sim-arange.h
>> -@@ -60,22 +60,26 @@ extern void sim_addr_range_delete (ADDR_RANGE *=20
>> /*ar*/,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 address_word /*start*/,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 address_word /*end*/);
>> -
>> -+/* TODO: This should get moved into sim-inline.h.=C2=A0 */
>> -+#ifdef HAVE_INLINE
>> -+#ifdef SIM_ARANGE_C
>> -+#define SIM_ARANGE_INLINE INLINE
>> -+#else
>> -+#define SIM_ARANGE_INLINE EXTERN_INLINE
>> -+#endif
>> -+#else
>> -+#define SIM_ARANGE_INLINE EXTERN
>> -+#endif
>> -+
>> - /* Return non-zero if ADDR is in range AR, traversing the entire tre=
e.
>> -=C2=A0=C2=A0=C2=A0 If no range is specified, that is defined to mean =
"everything".=C2=A0 */
>> --extern INLINE int
>> -+SIM_ARANGE_INLINE int
>> - sim_addr_range_hit_p (ADDR_RANGE * /*ar*/, address_word /*addr*/);
>> - #define ADDR_RANGE_HIT_P(ar, addr) \
>> -=C2=A0=C2=A0 ((ar)->range_tree =3D=3D NULL || sim_addr_range_hit_p ((=
ar), (addr)))
>> -
>> - #ifdef HAVE_INLINE
>> --#ifdef SIM_ARANGE_C
>> --#define SIM_ARANGE_INLINE INLINE
>> --#else
>> --#define SIM_ARANGE_INLINE EXTERN_INLINE
>> --#endif
>> - #include "sim-arange.c"
>> --#else
>> --#define SIM_ARANGE_INLINE
>> - #endif
>> - #define SIM_ARANGE_C_INCLUDED
>> -
>> -diff --git a/gdb-7.6/sim/common/sim-inline.h=20
>> b/gdb-7.6/sim/common/sim-inline.h
>> -index af75562..8a9c286 100644
>> ---- a/gdb-7.6/sim/common/sim-inline.h
>> -+++ b/gdb-7.6/sim/common/sim-inline.h
>> -@@ -303,7 +303,9 @@
>> - /* ??? Temporary, pending decision to always use extern inline and=20
>> do a vast
>> -=C2=A0=C2=A0=C2=A0 cleanup of inline support.=C2=A0 */
>> - #ifndef INLINE2
>> --#if defined (__GNUC__)
>> -+#if defined (__GNUC_GNU_INLINE__) || defined (__GNUC_STDC_INLINE__)
>> -+#define INLINE2 __inline__ __attribute__ ((__gnu_inline__))
>> -+#elif defined (__GNUC__)
>> - #define INLINE2 __inline__
>> - #else
>> - #define INLINE2 /*inline*/
>> ---
>> -2.6.1
>> -
>> diff --git=20
>> a/meta-oe/recipes-kernel/crash/crash/sim-ppc-drop-LIBS-from-psim-depen=
dency.patch=20
>> b/meta-oe/recipes-kernel/crash/crash/sim-ppc-drop-LIBS-from-psim-depen=
dency.patch=20
>>
>> deleted file mode 100644
>> index 77a287f14..000000000
>> ---=20
>> a/meta-oe/recipes-kernel/crash/crash/sim-ppc-drop-LIBS-from-psim-depen=
dency.patch=20
>>
>> +++ /dev/null
>> @@ -1,37 +0,0 @@
>> -Upstream-Status: Backport
>> -
>> -https://sourceware.org/git/?p=3Dbinutils-gdb.git;h=3D0d8a6ab
>> -
>> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ----
>> -From 0d8a6ab7d39d28fb1557e2a62e9e4b336341ab34 Mon Sep 17 00:00:00 200=
1
>> -From: Aaro Koskinen <aaro.koskinen@iki.fi>
>> -Date: Mon, 17 Feb 2014 17:12:59 -0500
>> -Subject: [PATCH] sim: ppc: drop $(LIBS) from psim dependency
>> -
>> -When cross-compiling GDB for PPC, there's a prerequisite "-lz" for ps=
im
>> -that results in a build failure. With such prerequisite, GNU Make wil=
l
>> -try to search the library from build machine's /usr/lib which is wron=
g.
>> -On 64-bit Linux build machines the compilation will fail because of=20
>> this.
>> -
>> -URL: https://sourceware.org/bugzilla/show_bug.cgi?id=3D12202
>> ----
>> - sim/ppc/Makefile.in | 2 +-
>> - 1 files changed, 1 insertions(+), 1 deletions(-)
>> -
>> -diff --git a/gdb-7.6/sim/ppc/Makefile.in b/gdb-7.6/sim/ppc/Makefile.i=
n
>> -index b811f6f..740bdb0 100644
>> ---- a/gdb-7.6/sim/ppc/Makefile.in
>> -+++ b/gdb-7.6/sim/ppc/Makefile.in
>> -@@ -552,7 +552,7 @@ PACKAGE_SRC =3D @sim_pk_src@
>> - PACKAGE_OBJ =3D @sim_pk_obj@
>> -
>> -
>> --psim: $(TARGETLIB) main.o $(LIBIBERTY_LIB) $(BFD_LIB) $(LIBS)=20
>> $(LIBINTL_DEP)
>> -+psim: $(TARGETLIB) main.o $(LIBIBERTY_LIB) $(BFD_LIB) $(LIBINTL_DEP)
>> -=C2=A0=C2=A0=C2=A0=C2=A0 $(CC) $(CFLAGS) $(SIM_CFLAGS) $(LDFLAGS) -o =
psim$(EXEEXT) main.o=20
>> $(TARGETLIB) $(BFD_LIB) $(LIBINTL) $(LIBIBERTY_LIB) $(LIBS)
>> -
>> - run: psim
>> ---
>> -1.9.4
>> -
>> diff --git a/meta-oe/recipes-kernel/crash/crash_7.3.0.bb=20
>> b/meta-oe/recipes-kernel/crash/crash_8.0.0.bb
>> similarity index 87%
>> rename from meta-oe/recipes-kernel/crash/crash_7.3.0.bb
>> rename to meta-oe/recipes-kernel/crash/crash_8.0.0.bb
>> index d4aa0d52b..4ea5b67de 100644
>> --- a/meta-oe/recipes-kernel/crash/crash_7.3.0.bb
>> +++ b/meta-oe/recipes-kernel/crash/crash_8.0.0.bb
>> @@ -14,22 +14,16 @@ DEPENDS =3D "zlib readline coreutils-native=20
>> ncurses-native"
>>
>> =C2=A0 S =3D "${WORKDIR}/git"
>> =C2=A0 SRC_URI =3D=20
>> "git://github.com/crash-utility/${BPN}.git;branch=3Dmaster;protocol=3D=
https \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${GNU_MI=
RROR}/gdb/gdb-7.6.tar.gz;name=3Dgdb;subdir=3Dgit \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${GNU_MI=
RROR}/gdb/gdb-10.2.tar.gz;name=3Dgdb;subdir=3Dgit \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 file://7001force_define_architecture.patch \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 file://7003cross_ranlib.patch \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 file://0001-cross_add_configure_option.patch \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://s=
im-ppc-drop-LIBS-from-psim-dependency.patch \
>> -          =20
>> file://sim-common-sim-arange-fix-extern-inline-handling.patch \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 file://donnot-extract-gdb-during-do-compile.patch \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 file://gdb_build_jobs_and_not_write_crash_target.patch \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://r=
emove-unrecognized-gcc-option-m32-for-mips.patch \
>> -          =20
>> file://0002-crash-fix-build-error-unknown-type-name-gdb_fpregset.patch=
 \
>> -          =20
>> file://0003-crash-detect-the-sysroot-s-glibc-header-file.patch \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 "
>> -SRCREV =3D "2a3e546942ab560f050ab77e8c7828b06513b3f0"
>> +SRCREV =3D "ec568e2ea515b66343d3488d5d4b9a625d55b7ae"
>>
>> -SRC_URI[gdb.md5sum] =3D "a9836707337e5f7bf76a009a8904f470"
>> -SRC_URI[gdb.sha256sum] =3D=20
>> "8070389a5dcc104eb0be483d582729f98ed4d761ad19cedd3f17b5d2502faa36"
>> +SRC_URI[gdb.sha256sum] =3D=20
>> "b33ad58d687487a821ec8d878daab0f716be60d0936f2e3ac5cf08419ce70350"
>>
>> =C2=A0 UPSTREAM_CHECK_URI =3D "https://github.com/crash-utility/crash/=
releases"
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#96730):=20
>> https://lists.openembedded.org/g/openembedded-devel/message/96730
>> Mute This Topic: https://lists.openembedded.org/mt/90620887/3616698
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
=20
>> [akuster808@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>=20

