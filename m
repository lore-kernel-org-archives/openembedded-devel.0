Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.55])
 by mx.groups.io with SMTP id smtpd.web10.17024.1585156271915966708
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Mar 2020 10:11:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@uievolution.onmicrosoft.com header.s=selector2-uievolution-onmicrosoft-com header.b=TGAZ+MFQ;
 spf=pass (domain: xevo.com, ip: 40.107.75.55, mailfrom: mkelly@xevo.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ESRRpeIbOW/RzTVUEgrEGkdE+jX4k4YJrC+3hffUiUzrm+Mff9I7LhKFmb/ojQhvn13+0Cz7ly6/xEIAP/OJ6rxKoGKRNH4aL6JdUuXJlO9LwKYX95gcrgB66XoWJoFLU5WuNw3jfidNWjEkTZGULuDWTK7YqRa7LcJM0hAuPkAGWiy/70P1x1BdJTtM0xvSGoQcxijJWjWFe6Ma4iPidK4sOXHviKWOG6E3VG/G7kmWLw2oIAwoyVc0JeGAitzkldwfhASi8ZChUSrQw7fOxHRpGIeY/1x7QQi3LrrwF+JJV9uU3RbgkrzN6jsmVueAO7oyrx2ohd5ltgRVuNq6bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AA99DJrK1RhNY7gWRP0MoO5zjr0xYZUYw+fMrunBE0Q=;
 b=jQtwKm5ZyBuezr5iGOczgaIC1i5qyRfbIybJ6ISVpBMoF08t3bJfzveBdMhTlGYoMQ7DyP+2e6N+Re9llZ9cX4hJRcLzf+MKllWTDaUPyexjV1QEsJt/ZPtohcbO2QOBEsYFHOFYYbN+5XI7WrLhYU57JKkbubF3HB65nhoRUN8ycqeFue+xa1HAGFqOwkzk/q9z9FRZsVE6c8yxZtAENt3LiEDDz8TZRjqO4MUsk0jIV3PNsBjWlzSDZJfp73qpmmFKyeSWtbK4Ct5W997ik2IrkrWbcrPECSYgqhGySDOkW2ZHNxUTQmBQGqmGt9dQTo47HvKjxzWD+z6co90Elw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xevo.com; dmarc=pass action=none header.from=xevo.com;
 dkim=pass header.d=xevo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=uievolution.onmicrosoft.com; s=selector2-uievolution-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AA99DJrK1RhNY7gWRP0MoO5zjr0xYZUYw+fMrunBE0Q=;
 b=TGAZ+MFQO9sdqxZYwJAkRqDR7hzNMDwgue6HFPioKV1x4II735ToHgCD9tMJxLzHkhKiNs8cMakBGSuV1d5AFlNkZ6A10dDn2LV2aiC5Fx5UFTRNTAmFYqKmkbZ2fwuOm3yfUukc/gqhnrDGcYxxZbMFBNxzHA6Q8Tz1MfSIHGo=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=mkelly@xevo.com; 
Received: from MW2PR18MB2236.namprd18.prod.outlook.com (2603:10b6:907:7::14)
 by MW2PR18MB2140.namprd18.prod.outlook.com (2603:10b6:907:e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.18; Wed, 25 Mar
 2020 17:11:09 +0000
Received: from MW2PR18MB2236.namprd18.prod.outlook.com
 ([fe80::e1fb:58c9:4324:cbe0]) by MW2PR18MB2236.namprd18.prod.outlook.com
 ([fe80::e1fb:58c9:4324:cbe0%7]) with mapi id 15.20.2835.023; Wed, 25 Mar 2020
 17:11:09 +0000
Subject: Re: [oe] [meta-python][PATCH v2] python3-pint: upgrade 0.9 -> 0.11
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20200325164838.977493-1-mkelly@xevo.com>
 <a2bc1b96-73b0-8caf-7d3a-e49c1ddd5436@gmail.com>
From: "Martin Kelly" <mkelly@xevo.com>
Message-ID: <1f54cb63-78ec-58fa-c430-b70dde91dbea@xevo.com>
Date: Wed, 25 Mar 2020 10:11:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
In-Reply-To: <a2bc1b96-73b0-8caf-7d3a-e49c1ddd5436@gmail.com>
X-ClientProxiedBy: CO2PR07CA0050.namprd07.prod.outlook.com (2603:10b6:100::18)
 To MW2PR18MB2236.namprd18.prod.outlook.com (2603:10b6:907:7::14)
Return-Path: mkelly@xevo.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.252.28] (4.14.243.50) by CO2PR07CA0050.namprd07.prod.outlook.com (2603:10b6:100::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.19 via Frontend Transport; Wed, 25 Mar 2020 17:11:08 +0000
X-Originating-IP: [4.14.243.50]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: add648ed-8e49-400a-74a3-08d7d0df82bf
X-MS-TrafficTypeDiagnostic: MW2PR18MB2140:
X-Microsoft-Antispam-PRVS: 
	<MW2PR18MB2140CBEE9B8659BAF35541DDABCE0@MW2PR18MB2140.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:901;
X-Forefront-PRVS: 0353563E2B
X-Forefront-Antispam-Report: 
	SFV:NSPM;SFS:(10009020)(396003)(346002)(376002)(136003)(39850400004)(366004)(31686004)(956004)(8936002)(2616005)(53546011)(31696002)(8676002)(6486002)(36756003)(2906002)(66946007)(66556008)(66476007)(81166006)(81156014)(86362001)(26005)(478600001)(966005)(16526019)(186003)(5660300002)(52116002)(6666004)(16576012)(316002);DIR:OUT;SFP:1101;SCL:1;SRVR:MW2PR18MB2140;H:MW2PR18MB2236.namprd18.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
Received-SPF: None (protection.outlook.com: xevo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kd2vpChVgVBeYzmHGp0AcywZQzYCnKCDdGz1d2ArSSWwdMMM/DsWm244n+BmWGoEhb+ZcrNuz1/jkTueBmlZwiW+7WqRxVwwlIc48TvgwcHDxa4yeaQ7m5koug0C8HwFxEZBysB+6Xj4eqJEzzP25hbdsHebWtG/UWbQ4YCxUTSK/S1ScZx/lXuYXF/Pj97aVluKqzfuAmZMWKPaWB1j/q1hgaNP3/gmsq9OCAsyZJkFCYlKn3PnP1siv59wenxv3sF3jJ5ajR4PYyusCMlXcb1FWO4oCoEz1fi2LNScDCDC9wJqzgMqE4zNhIc1G63LXYmMZOyi+7AV5t0+n6mbArYOb+HWP6itV/8Fg56SiEXxjegIvmzjSjUHjy48q14V2jzzjCMs2CoFTa/Ei5EgbGBzBKPAXZYvTq7r9Yg2PCSVFjjJ2PoSoUtnsi5jdwEi9JaCee/5PN+S2K2eB1gG8So+Zr8TSONnnimtJ2SA5j8B5NQ7zr4JY4/7juuRUz9NVkHYs9AqerajCXr0VvblFw==
X-MS-Exchange-AntiSpam-MessageData: 
	XF2xZ92JpCoVUfeVpD6bVlToZqEtOhTm6MeEWdoYzsQdpa6MnjYBtfP8aKTwIx3QQZwHXRmMHO1SiZP/T5PcV2+vcusun+kWxOWvJhMmBca/e2Wk7C2/uioUQ/VT2plUXr5NeD9bJIeyZgBg3p56ag==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: add648ed-8e49-400a-74a3-08d7d0df82bf
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2020 17:11:08.8612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H6mZJKlrlBU7i48Oq+IREAy4PJeztoW4CZkjGMmTygQiRcUxZLGrxHa0kGK8z4Ww
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR18MB2140
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 3/25/20 9:59 AM, Khem Raj wrote:
>=20
>=20
> On 3/25/20 9:48 AM, Martin Kelly wrote:
>> Also add a dependency on python3-setuptools-scm-native to make this
>> build with the newer version.
>>
>=20
> Can you rebase it on master-next please ?
>=20

I just did, and it applies cleanly with no changes (applying on top of=20
cfa5f5689: "python3-matplotlib: update to version 3.2.1"). Would you=20
like me to send an identical v3 anyway?

That aside, I will make sure to base future patches on master-next.

>> Signed-off-by: Martin Kelly <mkelly@xevo.com>
>> ---
>> =C2=A0 meta-python/recipes-devtools/python/python-pint.inc=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 6 ++++--
>> =C2=A0 .../python/{python3-pint_0.9.bb =3D> python3-pint_0.11.bb}=C2=A0=
=
=C2=A0=C2=A0 | 0
>> =C2=A0 2 files changed, 4 insertions(+), 2 deletions(-)
>> =C2=A0 rename meta-python/recipes-devtools/python/{python3-pint_0.9.bb =
=
=3D>=20
>> python3-pint_0.11.bb} (100%)
>>
>> diff --git a/meta-python/recipes-devtools/python/python-pint.inc=20
>> b/meta-python/recipes-devtools/python/python-pint.inc
>> index 0900d91d7..4a9300900 100644
>> --- a/meta-python/recipes-devtools/python/python-pint.inc
>> +++ b/meta-python/recipes-devtools/python/python-pint.inc
>> @@ -9,7 +9,9 @@ PYPI_PACKAGE :=3D "Pint"
>> =C2=A0 inherit pypi
>> -SRC_URI[md5sum] =3D "d0681cb7cfaca9fc68ce7edab0d08d88"
>> -SRC_URI[sha256sum] =3D=20
>> "32d8a9a9d63f4f81194c0014b3b742679dce81a26d45127d9810a68a561fe4e2"
>> +SRC_URI[md5sum] =3D "3a8f29c2a30efd35af4b5c5a224ef965"
>> +SRC_URI[sha256sum] =3D=20
>> "308f1070500e102f83b6adfca6db53debfce2ffc5d3cbe3f6c367da359b5cf4d"
>> +
>> +DEPENDS +=3D "python3-setuptools-scm-native"
>> =C2=A0 BBCLASSEXTEND =3D "native"
>> diff --git a/meta-python/recipes-devtools/python/python3-pint_0.9.bb=20
>> b/meta-python/recipes-devtools/python/python3-pint_0.11.bb
>> similarity index 100%
>> rename from meta-python/recipes-devtools/python/python3-pint_0.9.bb
>> rename to meta-python/recipes-devtools/python/python3-pint_0.11.bb
>>
>>
>>=20
>>
