Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.1664.1625080808531168602
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Jun 2021 12:20:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=TX087vIz;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2815b49594=tony.tascioglu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15UIvoQg010460
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jun 2021 12:20:08 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 39g5a8142u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jun 2021 12:20:07 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15UJK7Yv018447
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jun 2021 12:20:07 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
	by mx0a-0064b401.pphosted.com with ESMTP id 39g5a8142r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Jun 2021 12:20:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P76GYa7VIGdYlx/kbZkLtSFU3N9h9J4jtF+FwfipU11nl+u+ElhGkXRKgBG7gy0VfT/4y+40aDRuhGXvvWkii3GiW7sKY377kgjj3maeo7iniPlIxFOYvPe1AoDABoQ8lk5bQhxH5BqdOQ4u9gK5ym8PDn59SaeRl1kCgluciHSwA+QRzWj2fwxHoXfcKig+5g0hMME1z8lNXZRAY/G6aot23mzi9sDUvQFkWsQ5jJSuSV3rT+To42lvc9DL7nRKfpwcMK1taZ0SZq63NBgjHpVl0TvMbK9+TsuLGA56/78RRLZprGvIU8iocgiqtu9AgH0pdfQ5D+H7IlbSNnNuqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bHUUASRQj6YW/+FC7wP6e5BHP4+7WicvtGruBBta13Q=;
 b=TelJCbzL+o/Vc217CxlYLOG8JYqctFz2okHCutfx0VbafyUeBUFZOSOqaqnDA2xkT9OtQHFTwaXipda8siip7yXY3Bn5A07CJLyP70vf6kt50RzHUXxXH8Q6OdaU0UMIQrj7BBdEe64ojdyvKu6CwNM1Na72OIqRHJStL+nVJe7RfrYGGxeYas/RPzYkt1Ts8xTDqd7274nIKKrHGiJ27KG4nvjIG19Fr/4Q6ADruAQF/sISpAMT6zh+FVkQcimI7Ybe/T67s7fAqwp54aWdThwCUwgLxWOM4UAmpFdv9eQ4wLO1fMRuG6FnoUI37O07dwrqOSQw2VMdQEOxl9hRhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bHUUASRQj6YW/+FC7wP6e5BHP4+7WicvtGruBBta13Q=;
 b=TX087vIzLrDuVO4erJdFDU0UQo67ege0utlp5rb8v2D8zHyxBKyP9BB2AyhEjYceKuDo+RfEQasY+4J2pZT34NB8/b7kSTZ36R5q3tQ06cVgVUkPcX9ZRbVuFJCBAufbU8VMjfY1maENVbE0rgb4TsvgQz7ogYd8bqIva7vYbcY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SJ0PR11MB4783.namprd11.prod.outlook.com (2603:10b6:a03:2af::8)
 by SJ0PR11MB4781.namprd11.prod.outlook.com (2603:10b6:a03:2d8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Wed, 30 Jun
 2021 19:20:04 +0000
Received: from SJ0PR11MB4783.namprd11.prod.outlook.com
 ([fe80::643a:dbcb:bf31:3596]) by SJ0PR11MB4783.namprd11.prod.outlook.com
 ([fe80::643a:dbcb:bf31:3596%7]) with mapi id 15.20.4264.027; Wed, 30 Jun 2021
 19:20:04 +0000
Subject: Re: [oe] [meta-oe][PATCH v2] libyang: create recipe for libyang
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20210630143719.166267-1-tony.tascioglu@windriver.com>
 <20210630165516.71817-1-tony.tascioglu@windriver.com>
 <e4f53a3a-e043-d394-4889-333c6e2e0852@gmail.com>
From: "Tony Tascioglu" <tony.tascioglu@windriver.com>
Message-ID: <d1d63abb-ca8e-3bc5-35be-2507446184ea@windriver.com>
Date: Wed, 30 Jun 2021 15:20:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <e4f53a3a-e043-d394-4889-333c6e2e0852@gmail.com>
X-Originating-IP: [5.25.166.245]
X-ClientProxiedBy: YT1PR01CA0076.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::15) To SJ0PR11MB4783.namprd11.prod.outlook.com
 (2603:10b6:a03:2af::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.108] (5.25.166.245) by YT1PR01CA0076.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23 via Frontend Transport; Wed, 30 Jun 2021 19:20:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c8ee113-6f0a-45d2-dcfa-08d93bfc1046
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4781:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB478181AD3CD842833B29866D84019@SJ0PR11MB4781.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	B+8D6WZfdAbYGKUaeGVZHW+0+37EeSWygBsqmuvmUSjA6ckumK2pqSS/04ptMa+nuSJAkEY6bFzde6rxGADxLQYHlFK6AWXUVJWLSlXMzJCj0H42a/AGEg7FVEq3n5q9kqazLWaxvJCNOuAKq8JSHNA0CS1/urH1ZWPZqRl6DFUEr1V2RBDRaJ9SLo7AETwBZJM59icieiFWLaPP4KgVLyNKqviNsHj/wRTO09wtKIRkK7D8nrgoqMtgLdT0aVx5xu6D40A6DeGTedKHSOyRYXsE6sUXINqw5vBm0GTuoENPX6McpkRycsnWVuvFLpSK21qYxphLUnXcrFxsZDLq6ussQYQb8EPxUd6U+M1OLxRVfJFKPby8x2eqW3QjI2YRLGgrqDc0HcATcqX/gj4CROj7/ALopkEdH+HQRjaMk4QtoHPENjX3ULuUZAGePpNOgGCxcjIpg5Mob+7r8a4aAwjl5Ca0soL8GivSj/1GMWcgfzVpUE7ktGY+7cEfPnIDSV/C7rwTRaXS+OQZQZPkCHOq/NEJKc3SdISC7GBBsMTOUzJeY5KnfPwkKFvcmMuueaegr1ioEPE/bWTfJ+Crpy1dXgWMo39M/ioJ6kykt0f+T2lXQmq8tQ/EhCg/qN9I9+s93Pz0XlOJmksHdapvJ/tnTWerSbt76dvMrpNcmMFs5UC0vpxTEDZZgP9EM8b3Xdf2nR+i/BLZjVVvMQ6dL6EijaVHvZ019wAvmE5vyjMkWs5VGHLK3j0lCXjg1N7GsgnXtPbLXdP3xn1qy0BI9BpfA/JtJmIx2ymsIRlf7zsLuEKoNn4icslLUxiPtNIyojzdm9VXU30WofzPE9sWyIZgqr/xHYHs18twNLV16jiDOSJRNDe+E+wmarkUpQry8uaLAUBa0hf6pPp5UXT+nPtaXrQ/sWPg0eyuXXU6Xgk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4783.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(376002)(396003)(39850400004)(136003)(31686004)(2906002)(316002)(16576012)(44832011)(8676002)(53546011)(52116002)(83380400001)(66556008)(36756003)(8936002)(66946007)(66476007)(26005)(6666004)(5660300002)(478600001)(31696002)(38100700002)(38350700002)(186003)(19627235002)(16526019)(966005)(2616005)(6486002)(86362001)(956004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SVQyeGNmWmMvcEcwN2g1dENSWS9uUjA2SERBSWxESlpYaTc0bGRjcHdhSFIw?=
 =?utf-8?B?ZWRobTNXVUh3Z21vcFUyUC9IenAyaWtudE5mM1UwbU5KdDJmN2tOR01VN3BJ?=
 =?utf-8?B?Tk1OTURFQ3ZtMXArc1VBc0VteXNFSDlCQWwrVXhCRDN2ZmUwRVIyc2R0eC9I?=
 =?utf-8?B?czZDeTZrWHQ3RXVEK0tGaG1LUkljcTJaK3BJNVNhYlJmTVNhQ09BbUh0S3hj?=
 =?utf-8?B?cE1jUllBSHJ6My85NFFlRkw4a3dlV3lYWjFVUVRhUWxxbFhyYVRqM3dwd1Zv?=
 =?utf-8?B?STlCTTNQNlpqNEFHSHhuanN3K2lraTcrTTB4NmtrYURXS3krbURoWEdqa2Ns?=
 =?utf-8?B?ZDAzVzlkNk5PQXU3a2M2eXlpb2JmcHBYZjA5MEVhZzVkWDlXckpwOGRNZzE0?=
 =?utf-8?B?dnBSZ044eVNiaXQwU1VDTWRNSnZUdHlDQXpjOTlTZ1lzTTI5RXQvSnBXdlA3?=
 =?utf-8?B?dlF2MWh0RllScmM3M3hJdlJQMGY3cHN0Z2MzSlFYUGlJRW1RKy8xaE9DRUJ6?=
 =?utf-8?B?cFljUmNYaXRyb2xOQVlUdmZQNDMvU2VjRlZ1UVZaa2NNenNMejNtUW5rNWg3?=
 =?utf-8?B?Z2tmZmd3U01oZXpuYmdEUGtBbTV5QWJ3YVJwZmFSNitkRjJxUEhacisvVk5o?=
 =?utf-8?B?eW9KZjVQaHN4YVFnekY4dXJxaERZLzk4OHQzRGNRelhiWDdZK2NSSHVhalFF?=
 =?utf-8?B?bGN3UEJsSmNEbzdLWkZRM2JlSWJwVldXMWJsZE1rVTFpL3VabnExZncvYkhj?=
 =?utf-8?B?LzJMeGZFVlFXa3E3SnZoRTlmMUhLY2FWNmdtTnZncEpOSGhTU2lHekg2YjZ5?=
 =?utf-8?B?cHEyT1Q5R1ViQk9wcmZhdm9RZk5mRG1kSlN3bG9kTjhjVDNFTCt6dm83a1Jz?=
 =?utf-8?B?cVNqZitrK3dkVFVaMU9BeU9qaXVoTTE5UFlaR0NxSG5Lb2JKcTBybXFFbEZ1?=
 =?utf-8?B?NTUyanA2bmxCcGJsNUxqbE8wakNzK1pwZGtkenRQZUVzcWZpQ1VPaDRiSGZu?=
 =?utf-8?B?c0xRS1lwQzNUOHZIekljMVZaK0ZJZTV0TEJwS3YzeWdpUE1Ycjl4ZG52TVI3?=
 =?utf-8?B?S2t1b0VJd3BRRUpSMWxjN1psY3JEajFibUdhcy8veWFROU1HbmEzQjBFWnMv?=
 =?utf-8?B?cVZ3ZGxUVnIyeUZ2Q2ZsMnp4UlcyRHN1QTU5Wm9SbmJlN0t1Zno1eHFZSy83?=
 =?utf-8?B?RDI2ZVpZYXppVCs3Y1NxNDdZN1Y3MjBFYXpBVHl5M0tsTUx2RnNCZFNmOG4w?=
 =?utf-8?B?QkU1RVNTa3hnZlZKbnNzbkNzVXd5cVhPWEN6OEwzbXQ3aGJVRGNFTzBXN3FR?=
 =?utf-8?B?aC9Idk9TYjdYQTNHT2I1MjV5SGYzc1Z3NVI5Z2haRGZFL0dubjZqYVhTQ0Fq?=
 =?utf-8?B?U1VzcjQrU1BjY2dJVjIwV2l6M0J2enNoenY0S1BUYjB0V0FzYWJzbzFNZUhp?=
 =?utf-8?B?MGhtRFBTWDlNbEtjWkdrQlYyN0s2eVczL3Btc2RNRGdXVUF2SVhtbUp4UlZT?=
 =?utf-8?B?TGF3dnV6NHhnbzV3Y0x5VnppNDREUnhEMlAraW9SdjdqTnJ6b1IxYjBoTlB1?=
 =?utf-8?B?ZTBqeG1QTXY1UEVWUlhDZ1NnZm81Ky9HY3RrRTc0RUNhNkhNdWJYNzBocHo1?=
 =?utf-8?B?aWZkWmRkV0dRWFY0K3VvMWUzQUI5aXlPd3VYbjdsOXV2bk9qK0tpZlREenE3?=
 =?utf-8?B?OTRkME90ZUYycUNmMnEwUG5xb0NOeVdCaFBFWXdIR1cxeUk3TnRPamR1NW1E?=
 =?utf-8?Q?5wSov7h+YlsF08LQ3Z3yhq/wj5bdAEJ3BIi7ZW9?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c8ee113-6f0a-45d2-dcfa-08d93bfc1046
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4783.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2021 19:20:04.2613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 60P5lgwAVGXeXYuakwwBDU3GtJDkKoF3s6VdQreqrx7pzi4WNf0C+yPNrVFHAO7gqg6Ao3b8sFQhPJl8Qx2/6ShIQuKFBKY8pVTrjWEIT+8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4781
X-Proofpoint-GUID: w1SvLySZEtG0UlOX0ITKvm-xATHbDplv
X-Proofpoint-ORIG-GUID: b5hIn8c4vqDVeIUtNA0UOQEokFKUvsT3
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-06-30_11:2021-06-30,2021-06-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 suspectscore=0 mlxlogscore=999 impostorscore=0 adultscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106300106
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 15UIvoQg010460
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hello,

rv64 is also incompatible with valgrind, which is used for the ptests.

ERROR: Nothing RPROVIDES 'valgrind' (but libyang_2.0.7.bb RDEPENDS on or=
=20
otherwise requires it)
valgrind was skipped: incompatible with host riscv64-poky-linux (not in=20
COMPATIBLE_HOST)

So far, the only obstacle for other architectures has been the ptest=20
runtime dependency on valgrind.

Thanks, Tony

On 6/30/21 2:26 PM, Khem Raj wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> On 6/30/21 9:55 AM, Tony Tascioglu wrote:
>> Add a new recipe, patches, and ptest coverage for libyang.
>>
>> The recipe follows from upstream, using the cmake build system.
>>
>> There were 2 small changes needed to get the package building:
>> =C2=A0=C2=A0 - Remove call to pcre2-config
>> =C2=A0=C2=A0 - Add missing import statement
>>
>> The recipe has a dependency on libpcre2, which satisfies the minimum
>> requirements for libyang. In addition, for tests, cmocka is required
>> during build and runtime, and valgrind is required in the runtime for
>> some tests.
>>
>> Due to the way the library by default builds in a debug mode, release
>> mode was specified. However, this disables building the built-in tests,
>> so an EXTRA_OECMAKE was added based on whether or not ptests are enable=
d
>> to specifiy the required extra flag.
>>
>> Binconfig-disabled is inherited since using pcre2-config directly is no=
t
>> suggested anymore. Cmocka as a dependency depends on whether ptests hav=
e
>> been enabled. Since ptests are built with the main package, we need
>> cmocka installed before the test are compiled if they are needed.
>>
>> Ptest coverage:
>> The ptests come from the original tests included with the library.
>> Ptests are in ctest format by default, so we compare the return code to
>> print it in Yocto format. However, as each "test" target executable has
>> multiple tests in it, the full stdout and stderr logs are saved for
>> troubleshooting.
>>
>> Currently, several of the tests fail due to hardcoded paths in the
>> executable binaries generated, this is an issue we will take upstream.
>> For now, only the tests which work on a different target are enabled as
>> the ptests. The list can be updated in the run-ptest script, which is
>> portable shell compatible, without requiring bash.
>>
>> The recipe also has libyang-bin as a split package, which includes
>> yanglint should it be needed.
>> This recipe was tested using buildall-qemu as well as from within qemu
>> in x86_64 and arm64.
>>
>> Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
>> ---
>> =C2=A0 ...byang-skip-pcre2-config-add-stdint-h.patch | 55 +++++++++++++=
++++++
>> =C2=A0 .../libyang/libyang/run-ptest=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 46 +++++=
+++++++++++
>> =C2=A0 .../recipes-extended/libyang/libyang_2.0.7.bb | 37 +++++++++++++
>> =C2=A0 3 files changed, 138 insertions(+)
>> =C2=A0 create mode 100644=20
>> meta-oe/recipes-extended/libyang/libyang/libyang-skip-pcre2-config-add-=
stdint-h.patch
>> =C2=A0 create mode 100644 meta-oe/recipes-extended/libyang/libyang/run-=
ptest
>> =C2=A0 create mode 100644 meta-oe/recipes-extended/libyang/libyang_2.0.=
7.bb
>>
>> diff --git=20
>> a/meta-oe/recipes-extended/libyang/libyang/libyang-skip-pcre2-config-ad=
d-stdint-h.patch=20
>> b/meta-oe/recipes-extended/libyang/libyang/libyang-skip-pcre2-config-ad=
d-stdint-h.patch=20
>>
>> new file mode 100644
>> index 000000000..e3b2d0e02
>> --- /dev/null
>> +++=20
>> b/meta-oe/recipes-extended/libyang/libyang/libyang-skip-pcre2-config-ad=
d-stdint-h.patch
>> @@ -0,0 +1,55 @@
>> +From c7f3e2a8fe530beec6103cb9071ccc41458879aa Mon Sep 17 00:00:00 2001
>> +From: Tony Tascioglu <tony.tascioglu@windriver.com>
>> +Date: Mon, 21 Jun 2021 12:34:22 -0400
>> +Subject: [PATCH] libyang: fix initial build errors
>> +
>> +This patch addresses build errors seen when integrating libyang as a
>> +recipe.
>> +
>> +The call to pcre2-config has been commented out. *-config calls are
>> +being replaced by pkgconfig, and we want to avoid the binary config
>> +calls. This call can safely be discarded since it is used to check
>> +the version of libpcre2 on the system, and all recent YP builds meet
>> +the minimum required version (v10.21).
>> +
>> +There is a missing include statement for stdint.h in utests.h which
>> +causes build problems. stdint.h is required to be imported by cmocka.h
>> +prior to the cmocka file. Adding the stdint allows it to build the
>> +tests correctly
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
>> +---
>> + CMakeModules/FindPCRE2.cmake | 2 +-
>> + tests/utests/utests.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
>> + 2 files changed, 2 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/CMakeModules/FindPCRE2.cmake=20
>> b/CMakeModules/FindPCRE2.cmake
>> +index 8f60daa2..ad014f14 100644
>> +--- a/CMakeModules/FindPCRE2.cmake
>> ++++ b/CMakeModules/FindPCRE2.cmake
>> +@@ -12,7 +12,7 @@ FIND_PATH(PCRE2_INCLUDE_DIR pcre2.h)
>> + FIND_LIBRARY(PCRE2_LIBRARY NAMES libpcre2.a pcre2-8)
>> +
>> + # Check required version
>> +-execute_process(COMMAND pcre2-config --version OUTPUT_VARIABLE=20
>> PCRE2_VERSION OUTPUT_STRIP_TRAILING_WHITESPACE)
>> ++# execute_process(COMMAND pcre2-config --version OUTPUT_VARIABLE=20
>> PCRE2_VERSION OUTPUT_STRIP_TRAILING_WHITESPACE)
>> +
>> + # Handle the QUIETLY and REQUIRED arguments and set PCRE_FOUND to=20
>> TRUE if all listed variables are TRUE.
>> + INCLUDE(FindPackageHandleStandardArgs)
>> +diff --git a/tests/utests/utests.h b/tests/utests/utests.h
>> +index 5bea0459..a256120c 100644
>> +--- a/tests/utests/utests.h
>> ++++ b/tests/utests/utests.h
>> +@@ -23,6 +23,7 @@
>> + #include <stddef.h>
>> + #include <stdlib.h>
>> +
>> ++#include <stdint.h>
>> + #include <cmocka.h>
>> +
>> + #include <string.h>
>> +--
>> +2.32.0
>> +
>> diff --git a/meta-oe/recipes-extended/libyang/libyang/run-ptest=20
>> b/meta-oe/recipes-extended/libyang/libyang/run-ptest
>> new file mode 100644
>> index 000000000..1c9f8f47f
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/libyang/libyang/run-ptest
>> @@ -0,0 +1,46 @@
>> +#!/bin/sh
>> +# Valid tests to run
>> +tests=3D"utest_binary \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 utest_bits \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 utest_common \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 utest_hash_table \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 utest_inet_types \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 utest_int8 \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 utest_json \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 utest_list \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 utest_merge \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 utest_metadata \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 utest_parser_yang \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 utest_parser_yin \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 utest_pattern \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 utest_printer_yang \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 utest_printer_yin \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 utest_range \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 utest_schema \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 utest_set \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 utest_string \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 utest_tree_data \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 utest_tree_schema_compile \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 utest_types \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 utest_xml \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 utest_xpath \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 utest_yang_types \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 utest_yanglib"
>> +
>> +# cd into right directory
>> +ptestdir=3D$(dirname "$(readlink -f "$0")")
>> +cd "$ptestdir"/tests || exit
>> +
>> +# Run specified tests
>> +for f in $tests
>> +do
>> +=C2=A0=C2=A0=C2=A0 if test -e ./"$f"; then
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ./"$f" > ./"$f".out 2> .=
/"$f".err; then
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ech=
o "PASS: $f"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ech=
o "FAIL: $f"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
>> +=C2=A0=C2=A0=C2=A0 else
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo "SKIP: $f"
>> +=C2=A0=C2=A0=C2=A0 fi
>> +done
>> diff --git a/meta-oe/recipes-extended/libyang/libyang_2.0.7.bb=20
>> b/meta-oe/recipes-extended/libyang/libyang_2.0.7.bb
>> new file mode 100644
>> index 000000000..8e9e8cc02
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/libyang/libyang_2.0.7.bb
>> @@ -0,0 +1,37 @@
>> +SUMMARY =3D "YANG data modeling language library"
>> +DESCRIPTION =3D "libyang is a YANG data modelling language parser and=
=20
>> toolkit written (and providing API) in C."
>> +HOMEPAGE =3D "https://github.com/CESNET/libyang"
>> +SECTION =3D "libs"
>> +LICENSE =3D "BSD-3-Clause"
>> +
>> +LIC_FILES_CHKSUM =3D=20
>> "file://LICENSE;md5=3Df3916d7d8d42a6508d0ea418cfff10ad"
>> +
>> +SRCREV =3D "69d9fff65abb58beb0bb6aa9ecacd572ca1dfc56"
>> +
>> +SRC_URI =3D "git://github.com/CESNET/libyang.git \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://li=
byang-skip-pcre2-config-add-stdint-h.patch \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://ru=
n-ptest \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
>> +
>> +S =3D "${WORKDIR}/git"
>> +
>> +COMPATIBLE_HOST_riscv32 =3D "null"
>> +COMPATIBLE_HOST_armv5 =3D "null"
>> +COMPATIBLE_HOST_riscv64 =3D "null"
>
> what issue do you see on rv64
>
>> +
>> +# Main dependencies
>> +inherit cmake pkgconfig lib_package binconfig-disabled ptest
>> +DEPENDS =3D "libpcre2"
>> +DEPENDS +=3D "${@bb.utils.contains('PTEST_ENABLED', '1', 'cmocka', '',=
=
=20
>> d)}"
>> +BINCONFIG =3D "${bindir}/pcre2-config"
>> +
>> +# Ptest dependencies
>> +RDEPENDS_${PN}-ptest +=3D "valgrind"
>> +
>> +EXTRA_OECMAKE =3D "-DCMAKE_BUILD_TYPE=3DRelease"
>> +EXTRA_OECMAKE +=3D " ${@bb.utils.contains('PTEST_ENABLED', '1',=20
>> '-DENABLE_BUILD_TESTS=3DON', '', d)}"
>> +
>> +do_install_ptest () {
>> +=C2=A0=C2=A0=C2=A0 cp -fR ${B}/tests/ ${D}${PTEST_PATH}/
>> +}
>> +
>>
>>
>>
>>=20
>>
