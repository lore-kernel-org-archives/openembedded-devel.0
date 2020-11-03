Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.41])
 by mx.groups.io with SMTP id smtpd.web10.4561.1604370708008663820
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Nov 2020 18:31:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Y1sSfcN3;
 spf=pass (domain: windriver.com, ip: 40.107.244.41, mailfrom: yi.zhao@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c7CsS3MJ+14+MapfhNcR3do9WZqiv7WekQYClFLMJJY3zPOnRxy2/k6abNTw3oSYhQXOTa4GcNCev+VpgfA+mViHNmgJ7yCJcUjgd6bS+G8UbT/i/4EvM/Hf4BdxvS4boen3hYWPiI+Ju5i+vx4Ysz/BhofzX7mYe7a/BFSEJCQXBRkBeHqTnkdSmRnCYtvqW0PBylYhWYs0x324OAUFVkEaNeCqP1S5x7YAze/NCn0q4aCk7KFiSzC9hHonqaCSXMKQKPrdtIIv3eRkF+Ont9B1kuakykdqWR0uy3SqZvBzJF5PqnYA5yV066deIlDjVCusMLR4EwHBdT2uIFLMdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Oi8AUPRuzqV1cqeK8xD18tz/sVFUth0SX0R6jPbjss=;
 b=PSxGn/4Iryx2RVLdGM06C4D5zrnRjW/C6kj8GRKNeiJB0mKLz4SfgRya6WKA9D0dBy45rrhTqgGcTQBQX8c6qyJQioQ9qNIai/WBSTIzFSnrbblLnsbpLd8CXuAQfs0g4OCO2yUw1km0qCZG0B7VeNq1CChsAhFgDD6HbjJFjlQRfIpHaCKQoUoWNA99eFg7xpTQzbDwilDBoR/8VWwlNkp2WgbsPeZ+Mk23Itfr73rxSHOjTnhCVxh0WQNJnwkCYMx7AWU1ew6JwXZt5oeQ5g5anrY9ATKdjcyyRZiLn4cRUykSyVv3bgGC+zm90J3Qph6Z4aK7eCEb9qi3FXahKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Oi8AUPRuzqV1cqeK8xD18tz/sVFUth0SX0R6jPbjss=;
 b=Y1sSfcN3P4XeqrX0gIEtV0uMbrcQnEGIrBAyocBCFu2DbdXYWIgOqk5SneMvtv55q2U6KoX3+kToeBeJNhrPw4mVsX/Dl8GGITMbEybAaB2KhYlXIUYVnLzBrKs4/Fs2CGqbOidCv+Ylf7sEKf1IBEd6QAqSN09G9aTMAg4N76Q=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Tue, 3 Nov
 2020 02:31:47 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::d844:ac89:6b05:ed98]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::d844:ac89:6b05:ed98%6]) with mapi id 15.20.3499.030; Tue, 3 Nov 2020
 02:31:47 +0000
Subject: Re: [oe] [meta-networking][PATCH] quagga: unify volatiles file name
To: Khem Raj <raj.khem@gmail.com>
CC: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20201102091320.15732-1-yi.zhao@windriver.com>
 <CAMKF1sr721emgcyE=+GHPPiz1VZThqjWOXe01WQndv4qVMKDPw@mail.gmail.com>
From: "Yi Zhao" <yi.zhao@windriver.com>
Message-ID: <ced6967d-c807-4352-1d0f-0e239aa2111f@windriver.com>
Date: Tue, 3 Nov 2020 10:31:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAMKF1sr721emgcyE=+GHPPiz1VZThqjWOXe01WQndv4qVMKDPw@mail.gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: BY5PR13CA0027.namprd13.prod.outlook.com
 (2603:10b6:a03:180::40) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
Return-Path: yi.zhao@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.174] (60.247.85.82) by BY5PR13CA0027.namprd13.prod.outlook.com (2603:10b6:a03:180::40) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.10 via Frontend Transport; Tue, 3 Nov 2020 02:31:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 861c14ae-9fd4-47c8-5bc1-08d87fa09c4e
X-MS-TrafficTypeDiagnostic: MW3PR11MB4555:
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB4555A2ACFB15D2445760A410F9110@MW3PR11MB4555.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FctGIhPXf087ViJ5+zlGR//fcyJoR96WKs4lyxHjdjwKD8rtxsHX/2R4mSvML22cigk3a5l3bR6+cbwTin8QNWAvltC3QZ8TH6xL5+x/nz3SUiqzNVqpVwSk1ExWqSteYEZUHqybInMYNi1u8tyP6F3yEhzJsd2uw+kdbrKTnEnVVBAhoLgEufPm9v7+ojG5SvvMhdPXROivqiewk/rIzjf1DD/2/7q4kdBAOL+PGymjMMXrBS837b4of4iksy+gyfDsvXCEaB/t5MpshzbvT3VGiyH07BAK3sKTbJKvUOH/7+Dt1EBB+hr3Ofb7FytN9EEyriY3kN5c57YCt9kT6yXilirJQBleV1ZYcYazSElxX8LCKp9XhR7J8Wkjkl1H8VwdyTEzLZbeT0mRbumJQx52O6fY0l3/wjKcLY1n1PgYKLX7/gEM+IcXKopY/bZLASgR2VwQQiwxQKcYHbL2FW1G/8mife/FoZSo5hpicBQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(396003)(136003)(346002)(376002)(6486002)(8676002)(66556008)(66476007)(66946007)(956004)(4326008)(8936002)(186003)(36756003)(26005)(16526019)(83380400001)(478600001)(52116002)(2906002)(86362001)(31686004)(16576012)(6706004)(316002)(6916009)(6666004)(53546011)(2616005)(31696002)(44832011)(5660300002)(966005)(78286007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	AGgE+8M78I4fWWm45CKXhvxF0Gjjso2wGKmMquF7Kct/Mzxt1kEfHyoHbMMWnizVDzda7ss/cnq2yjqRCSjn19SxghsZVzdX63S11Ze+7mSitc2YRuDgjhxRgHBkbPZAuo6K/i7aDcoF58LpmUUPIPpRwyWDItCqSFW1F/W8QKA0E2mGkRxIOJtiLJeXkEpTxpnZbGyCLWZynZ5QD6gOI49NwJeGttHyWjMzhrh7GF4sGY6IKL0GObjvq/0LUuc33fPl7Xiq4OtmmyG8U5eJM85hetly3EgN098cqpbm9r6Z5KhaVxn9wd5+lr+sOrdUKRqmhmDz0GdyXkZfTD71lPY9XgOp5GMWtoEdidd1XxXOYqsTbyVlVQ3hzeGLJjxPvsNmpHh5d8t1dBf3ghtDiVnoAoKH1ju3q0ZBsqWeUL7XC6bdzafFE3goQrXe6Ic3rc3Y677hCTDu38cueH1UWKmMemOro77uWyHcRdE4wMEZHZkhciscVgeG+nvRbqOR5MXCAUmj0JC2Cs4DHyVHUvmaAjlp3uWVdMDKdbKHpAVFJ+jJSJUepTJnqSzkCd2l+JfWcZMaR/mDzfjoP/rkND71Jl35n9fLJ9vPLMoCqHgmQR1s56eQ5OV+nQjPLJWjNwwX7oewO8hnGk3xVjm5xA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 861c14ae-9fd4-47c8-5bc1-08d87fa09c4e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2020 02:31:46.9110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ueJXMLizOlySgvXu5CIu8DGBw1OnUi90FE8IxVE/8yCgSONZDNggaUwbj9BBIvohJIDI5Xuu6M81AaaWBzPbUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4555
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US


On 11/3/20 12:26 AM, Khem Raj wrote:
> On Mon, Nov 2, 2020 at 1:13 AM Yi Zhao <yi.zhao@windriver.com> wrote:
>> Make the volatiles file name starts with digital.
> what does this get us ?


Just want to make all volatiles file names uniform. I searched oe-core=20
and meta-openembedded, only pulseaudio and quagga volatiles file names=20
are not start with number value.
$ ls /etc/default/volatiles
00_core=C2=A0 01_bootlogd=C2=A0 99_dbus=C2=A0 99_sshd=C2=A0 99_wpa_supplic=
ant=20
volatiles.03_quagga=C2=A0 volatiles.04_pulse

//Yi


>
>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> ---
>>   meta-networking/recipes-protocols/quagga/quagga.inc | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta=
-networking/recipes-protocols/quagga/quagga.inc
>> index 11b7d576a..6df72427b 100644
>> --- a/meta-networking/recipes-protocols/quagga/quagga.inc
>> +++ b/meta-networking/recipes-protocols/quagga/quagga.inc
>> @@ -81,7 +81,7 @@ do_install () {
>>       install -m 0644 ${WORKDIR}/watchquagga.default ${D}${sysconfdir}/=
default/watchquagga
>>       install -m 0755 ${WORKDIR}/quagga.init ${D}${sysconfdir}/init.d/q=
uagga
>>       install -m 0755 ${WORKDIR}/watchquagga.init ${D}${sysconfdir}/ini=
t.d/watchquagga
>> -    install -m 0644 ${WORKDIR}/volatiles.03_quagga  ${D}${sysconfdir}/=
default/volatiles/volatiles.03_quagga
>> +    install -m 0644 ${WORKDIR}/volatiles.03_quagga  ${D}${sysconfdir}/=
default/volatiles/03_quagga
>>
>>       # Install sample configurations for the daemons
>>       for f in bgpd vtysh isisd ospfd ripngd zebra ripd ospf6d; do
>> @@ -106,7 +106,7 @@ do_install () {
>>       sed -i 's!/usr/sbin/!${sbindir}/!g' ${D}${sysconfdir}/init.d/*
>>       sed -i 's!/usr/bin/!${bindir}/!g' ${D}${sysconfdir}/init.d/quagga
>>       sed -i 's!/etc/!${sysconfdir}/!g' ${D}${sysconfdir}/init.d/* ${D}=
${sysconfdir}/default/watchquagga
>> -    sed -i 's!/var/!${localstatedir}/!g' ${D}${sysconfdir}/init.d/* ${=
D}${sysconfdir}/default/volatiles/volatiles.03_quagga
>> +    sed -i 's!/var/!${localstatedir}/!g' ${D}${sysconfdir}/init.d/* ${=
D}${sysconfdir}/default/volatiles/03_quagga
>>       sed -i 's!^PATH=3D.*!PATH=3D${base_sbindir}:${sbindir}:${base_bin=
dir}:${bindir}!' ${D}${sysconfdir}/init.d/*
>>       sed -i 's!--with-libtool-sysroot=3D[^ "]*!!' ${D}${includedir}/qu=
agga/version.h
>>
>> --
>> 2.17.1
>>
>>
>>=20
>>
