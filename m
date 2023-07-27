Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C222EEB64DD
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 04:36:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.722.1690432569885504910
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jul 2023 21:36:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=c6WCW4/4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6572b4b065=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36R3oa6u011377
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Jul 2023 21:36:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=2vObDrRJ55JKPVipbMhBl2CPcaFONg95INrGBK7jgOw=; b=
	c6WCW4/4m6c4ZI6vxcm8+hLA1Pf7Kz4vukrnH6yEUojGNzpJ6UVLpIZRJvolTvK7
	OLTMQ7vyZBOpUy+qhgm8oczcAViAfNsV/ILirPEhr2ntOs5MlfiQ4QfLJfKFwwUW
	+pIESoZipmDXQxLqzf9sE4pbGW6yDcbwRcN42xUFtrMRh5eExzo4YMbZ+6mAlQTl
	l99nXjrlnEo5C8seVMQa3jYhqljSMsZg9lA5oLlMfTzo1qT8UzMgecJsvJ+JWbih
	kCTS606z9bqCTHvdoNox1npcNuU7xkiwBK8skJBfD+a06feVMVD6q9W+xtZn7LEP
	DU5EzQjX2ufixxvA9M+QjA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s0ad042xd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Jul 2023 21:36:09 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 36R4ZFDV003395
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Jul 2023 21:36:08 -0700
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2043.outbound.protection.outlook.com [104.47.57.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s0ad042xc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jul 2023 21:36:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=km3zKE7N4A8m0oSfVgU07s7uN7zjdvLYrrOlpBGGKsO+eoNap8VJMC5EBGj7FUc1Oh76INsAZjyxWwUe0ZfpoH+WcUcCV2fMvDSyeiaM0Uhfyy7F39THNnk9XdReKxvafGoRPD0WcX+5CwioW+wMXWrkipKxD3M38NRKPTcKZUQjT7D6sl1fAK+/7Q8dvSkwqZuRgxRrCECKIUcTizo/Om3igSsiOVY1EZi4WFAyU/fpVWswSWG9leNC9TsPsiB/zmU5Eu9L+qYHxXdIbBtoIguaB0lDBftXQzziDZpmGhlrUyYfBWBLSiaaT59gcu8hAhonEMoBcq6AYVlJ2z389A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2vObDrRJ55JKPVipbMhBl2CPcaFONg95INrGBK7jgOw=;
 b=W/PJygkFNyDzOcAF7mRMe2/eQ3z1fXlvkWmNMPKCmJDj44fCLSVOqbyGzxD0ZNUj/Yovr1wpYSTSWDgB4wRLwFYAZatgQL1J2BNE4Ib065nsSABfm1kgvPQJL8ZGtal8IeUN6uXDWj8HW27GraKw8Ny3sPr0YFlZff53NO4xsk5tMM4Y2B3mj8/YL9kNEDcohXE3aqvZwjPmHNILLBOOxq9Wix7ctng4FHXUjlcD78GknEmTdG0OHd6fxy5FKXuZeeeL7dp8qfm1KN5kDxMPXG7NOVIPDg4B4aNsPXDNBjDLLaDCLjSIdMcn9Nj3JlMOJmjSl8xUI+KRxrE+MShZEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by SN7PR11MB6969.namprd11.prod.outlook.com (2603:10b6:806:2a9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Thu, 27 Jul
 2023 04:36:05 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::f499:a2a9:85eb:97ac]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::f499:a2a9:85eb:97ac%3]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 04:36:05 +0000
Message-ID: <efe84917-0da4-face-5d3a-3cf5ab38db4d@windriver.com>
Date: Thu, 27 Jul 2023 12:35:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [oe] [meta-networking][PATCH V2] vsomeip: add recipe
Content-Language: en-US
To: "Mittal, Anuj" <anuj.mittal@intel.com>,
        "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>,
        "yi.zhao@eng.windriver.com" <yi.zhao@eng.windriver.com>
References: <20230727023924.1121571-1-yi.zhao@windriver.com>
 <5325926049a47cf61b6fe57040b9f98189f0e968.camel@intel.com>
From: Yi Zhao <yi.zhao@windriver.com>
In-Reply-To: <5325926049a47cf61b6fe57040b9f98189f0e968.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SG2PR01CA0139.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::19) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|SN7PR11MB6969:EE_
X-MS-Office365-Filtering-Correlation-Id: 3997abfe-9e09-4632-f232-08db8e5afd4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	G8K0RkzkgxyMwyAeYMWLNu+XFqZPhBrO5KLb3xmemVHkDIB/NoZAOsKm5yKoN6uXzSUQD2WrO/ZaaIwlW/8gtjhfo0eBuo+1defZ+qvund5dewXiHVOAN9xBhgsiswIGKCvcly8GGDguFFIdkwiCHj+0FY1885Q1PBNCUtGdRm2e9fP5wmUbo4B9PWkRbArHILbkNFNKLxPQpWNW9OMP3gQgNahIc/K+cPNsUrb9jDJq4IkvIiFHOclocuPnUDP6uZB9ceEZQtR8Q8E/meayYjZfRH1mu83xQBAdtAB3p6CRAoFqzlGsUIa38N6NJv7+cpl5yqT9ycoq+Q6ynLgcfZU696ayramwNbwDnPyufHnyrP8rW6+NxOLheGuORdwJreTFBsOq6nbJnsRX8heF3+8wqE2ipQmGio1lA4wTsK1UtxjIBQy0c8k+VTjB4js6XAXxT0SgEOkI6+VLv99xQBGgkLx3HHp5Ms584ZCtdGkG22bUZMDO7gPWGZJqV/L4b3TeVgOPlIRyFFPIQfZHFM/zRJ3L1LQQfdd23cuGSMp5jO4BJUrdEW2FmnvnrDRL0xx1JgnvrGf12WYqa0UtMAandKPwapVXd85aRR4tIFU7fw3hOBBZF70MyuyZmFXV
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(376002)(136003)(346002)(396003)(366004)(451199021)(38100700002)(66476007)(2616005)(83380400001)(53546011)(36756003)(8676002)(5660300002)(8936002)(44832011)(478600001)(41300700001)(110136005)(66946007)(2906002)(66556008)(186003)(316002)(26005)(6506007)(6512007)(966005)(6666004)(6486002)(31696002)(31686004)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cjNma0gwVDF0cTFJR1dud29NVmovWXJ5TlpDWmV5UVlja1ZnbS9qNk5iTWJ1?=
 =?utf-8?B?WTdwMkVHdkhBNC8rRG9FdjJsNVNxa0I5Nkpna0FQUktLMDBocE9SeUZvUUJE?=
 =?utf-8?B?SEVob1hsa3Rsb1RuSlhFbjNoaGlMbS9kaGc3TUVwQ2J3L3hHR0QxcnhHbnpv?=
 =?utf-8?B?czR6MFRaUGcvcHl3V25KUk9tTFNlQ0tHVDErQWpWVWo0Z0hkbHZTMEVWRkVF?=
 =?utf-8?B?QkFPekZlNzJCYytKS0k2MC84bHpjOU8vNnQ3eDNGUWRyWWs1UzZlMm1ETUVy?=
 =?utf-8?B?TTkyYzd2R25iakpVWm9tdnBEd0dXNFptd0F5amVoa3V4YWdSSWNRaitSNDho?=
 =?utf-8?B?WDRDSkV5VUs3VFJYYVRzeTREejMrcTh5YTQ5aUU3U0c3U2Nmd29kUnpnRm5h?=
 =?utf-8?B?dUNZM3NSUlN3dGtzcm4wWXhlcFdMR1ZqbVJOWjUxazdOZ01tTzNYbmtiMVRQ?=
 =?utf-8?B?T2E4Snd2N05iYU9vS2RKdWFLbmRxdWg5UllGZWs4Y1FIbm1RbnREKys4SUYv?=
 =?utf-8?B?TmxzZzdYaHo2R3h6REFSNlcrcDdQaTRIVEN2ME54V1F2VUd4WHVMZUZEN0NW?=
 =?utf-8?B?TTEyTndHWitRTFY2ZVBrcnVMWmhoVDV2NjJQU3pyRkRiWEtRWVMwbGs1YzVO?=
 =?utf-8?B?WC9EMElPT2tXWWtOUGtUQ3ErQXhQRExkQmo1cVNVbUlaaks0NzlpRXBJdkF2?=
 =?utf-8?B?RVJWQUZ1UjZJUWNkWFlJeFk1dXVSS1pJbTc2bFllNUZhZGlJM3FycVZ2KzlQ?=
 =?utf-8?B?SFBEZXN6S1ROQ2x0dUZNMG1waS9Fdm9BdjE0Y0xJOU8xcnFhbWJLSlNDVkZ6?=
 =?utf-8?B?K2RhaWdFODBYWXY0Zmc3YURFVTBuTjRwK0FWTmVuUzhIeldLRjhZTm1jNU5t?=
 =?utf-8?B?YnFEK0Z6Vnk4TUV6ckdSS1VLeFJCdVRIUEJaNk4xbksvR2lwTnZzMUFlWkQ5?=
 =?utf-8?B?cFhDMDZaT1ROZjMxdUZmYU50T3oxOFZLR2NySC9sSUo1dkdFbHB2MkF0YTRs?=
 =?utf-8?B?YVAvNkNIMWR5amJoWFNPa2pNUzNYZGRlaHVEbVRVWVZuNDBlSGVDbmdlY3Ur?=
 =?utf-8?B?OUdsT1F3MWRrckttdmM4d0E3ZWVEanBDWFVxUC93L1l5d1JqMXgxZGR0eXNO?=
 =?utf-8?B?R2s1OUhLZHhZanRkdlRPT2lrMVRhekFNdHRTcGh1OUxteVM5RExtZVl5RlZh?=
 =?utf-8?B?dy9YL2d1aFdmT0lQejJQdVJTUStNbEtWbDA0ODNob2FjTUNvS0pHVUttaVA5?=
 =?utf-8?B?M2I4TlpaY1VLMmZpMHZrUUdyOHBPdDZBb2M3Yks5VENzUkNwQnBjY1FQcFFt?=
 =?utf-8?B?aTJGNlNXMkgwN2xrdDVmVXI2WlZxeVRXVkNuamljNEFtd1ZHWHRjNFRyNjAr?=
 =?utf-8?B?clBMRUN1anFUTnNtbi8vTC9MdVJOZ1Q3QlA3Y2ZXNXI2U2paT1lHWUhQUmxC?=
 =?utf-8?B?MSt2Z2M2aHVFZEhXdE5mc21lL2wrT1h5Yi9xMDlyMkcxdWJ6TzdBSkgxcXpx?=
 =?utf-8?B?WTVDdzcwRlBLVUJtdmhXbVlzMEd4YUlkNXMwS0FRNU1lT3IzM3BJckZ2SzEy?=
 =?utf-8?B?bDVjdHpmZ0duQXUwL0VUMlFINVh4Z2VaZmdUNStJYzBoRXBWT2NGeDY0N1VK?=
 =?utf-8?B?Tkt6N24wQy9qZ2EvZGltaXByeXh0SkpJQkx4TCtDc0JDZUxRYXFwM09IVnVN?=
 =?utf-8?B?ZGIySTBiTmFUQWdCaGVXdGNVQ1ZDRG1Wc2lpdHZCZTFoTTEyV3dTeDN5eVFF?=
 =?utf-8?B?QkVDUDBtT0VzYWRqLytJdXd5S3dsdG1PUTlIL28wYWowM2xHK1paWUQ0dEsx?=
 =?utf-8?B?RUMvUEoxTlRNcDZqOWN3TDlmUGN5Y2Q3U2pVWDFkMXdGMGkwMmtHRFgySHdZ?=
 =?utf-8?B?RkRwd1VhSXZyaHl1ZUxEYXJqeGZiNjl2SGl4WEl1NHorekZOU0Q4cmpjY3BX?=
 =?utf-8?B?alNLMmZ5Zm8wWDlyQTlqNFNDTmNXd3dmZHJsazVnMFk2bWExN0dpVTRMcVBY?=
 =?utf-8?B?U3pxQ3Z2dm5sVXRLOGdOdnVpZmJpQ1EybkFZWkZrN0NYamVNdE93ZjNpb2JM?=
 =?utf-8?B?Qk13VEplNWkyemFaRmJvc0JFZ0FiRmR0YmIrZzJqWFdiWHVxdkt4d1YxSXll?=
 =?utf-8?Q?6Z/hwspf1OE9jJU1z9RtdDcDq?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3997abfe-9e09-4632-f232-08db8e5afd4c
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 04:36:05.1987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 60sBXjKqfV0Bn9NAkrbIBpRmWjoJZNMIQK3mnwNNkoriSjSxHNWR+Hw2ompGZ98esx1h9CBYSXtBWjE06Vfl9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6969
X-Proofpoint-ORIG-GUID: rIvbFPpzn4PWSSAlNWWf2YEhgh41uTmD
X-Proofpoint-GUID: Ruhov-WGyKO7ij6ozvEYsgJhieiGi7dm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-26_08,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=917 lowpriorityscore=0 malwarescore=0 spamscore=0
 impostorscore=0 mlxscore=0 bulkscore=0 phishscore=0 adultscore=0
 clxscore=1015 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2306200000 definitions=main-2307270041
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 36R3oa6u011377
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Jul 2023 04:36:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104047


On 7/27/23 10:55, Mittal, Anuj wrote:
> On Thu, 2023-07-27 at 10:39 +0800, Yi Zhao wrote:
>> The vsomeip stack implements the http://some-ip.com/=C2=A0(Scalable
>> service-Oriented MiddlewarE over IP (SOME/IP)) protocol.
>> The stack consists out of:
>>  =C2=A0 a shared library for SOME/IP (libvsomeip3.so)
>>  =C2=A0 a shared library for SOME/IP's configuration module
>>  =C2=A0 (libvsomeip3-cfg.so)
>>  =C2=A0 a shared library for SOME/IP's service discovery
>>  =C2=A0 (libvsomeip3-sd.so)
>>  =C2=A0 a shared library for SOME/IP's E2E protection module
>>  =C2=A0 (libvsomeip3-e2e.so)
>>
>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> ---
>> V2 Change: fix build with nodistro
>>  =C2=A0.../0001-Fix-pkgconfig-dir-for-multilib.patch |=C2=A0=C2=A0=C2=A0=
 28 +
>>  =C2=A0...e-configuration-files-to-etc-vsomeip.patch |=C2=A0=C2=A0=C2=A0=
 28 +
>>  =C2=A0.../0003-Do-not-build-external-gtest.patch=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0=C2=A0 68 +
>>  =C2=A0.../vsomeip/0004-Support-boost-1.76.patch=C2=A0=C2=A0=C2=A0=C2=A0=
 | 14220
>> ++++++++++++++++
>>  =C2=A0...upport-so-that-vsomeip3-will-compile.patch | 14216
>> +++++++++++++++
>>  =C2=A0.../vsomeip/0006-Support-boost-1.82.patch=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0=C2=A0 32 +
>>  =C2=A0...up-of-warnings-that-gcc-12.1.1-fired.patch |=C2=A0=C2=A0 298=
 +
>>  =C2=A0...8-Do-not-specify-PIE-flag-explicitly.patch |=C2=A0=C2=A0=C2=A0=
 41 +
>>  =C2=A0.../vsomeip/vsomeip_3.1.20.3.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 7=
2 +
> Is there some reason why you are adding this recipe for an older
> version and then adding big backport patches instead of just taking a
> newer version?


We found some regressions in the new release. So we decided to add this=20
old stable version and plan to upgrade it after the upstream fix.


Thanks,

Yi


>
> Thanks,
>
> Anuj

