Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE0ADC3DA59
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 14:57:20 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.59])
 by mx.groups.io with SMTP id smtpd.web11.12868.1721141829533819960
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jul 2024 07:57:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arri.de header.s=selector1 header.b=gi5cli37;
 spf=pass (domain: arri.de, ip: 40.107.104.59, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JZ7kZc4LpXq6NIlPxerX91l0PMS4FgQYgOuioYQdjLmjnQkH/j95QlzGYD6uH1d/YhYZus32FNvpeUMXHKCG1PqwmhK8Akm8HoehSBRh7PO5eVqGNFc7a4nQvpt2P85mM1GJr/flmUdI4NgIMnzyp1Xygm2TZ8VU2sRDsK7OoErqBa0T2HVvhNlu6GYV6E5NjeY8UwkJoJHWN8tB4NkNZmSK6pK0w+QZ26T7Cnrx/6ge9xr2lYXzX4gdcQ4UvoRHfi6hia2nsgE2ReTZZ2pAV2FN8hMAT2OU41e85qhGgtloCGlnLeQKqT2JKArTiIaoyWQwBXi/p3XWZEhwkzoY6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qjj5ZdOK1BTwGs/xEsWfeI7kq9GEeYuInU7ne5w0Jho=;
 b=iE26Hgs4hLZiMNqHNYyjVQYaGgBokALh0NblICgiht6l0Zl6t6Ja6Otvwn17I27QSbGWfB17E8WaYUNUo5s6BnwQwS0251iAQOvxgv80nc+oVf17EaHZPs+8FfbtQltHShl7P4ROTa7jG3sYLrIYN3HNO4BlnUxNxcLZaY5e8kjoK0Mj1IhYSOEpmhpbV/gcAOqDMM6BoXR6lRHgtIfS5SQ5hcNmCy5moAg7542GQtV7lag0NgKRHtzEks18+bcHr6kdoKBWnKHgT26UuVB27l0GvSIXCKmxpcAzyzvdS76yRuEr/ZRmxF7JPyPvIMEJiJplxAkRhphLCHG2kIdilw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=gmail.com smtp.mailfrom=arri.de; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=arri.de; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arri.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qjj5ZdOK1BTwGs/xEsWfeI7kq9GEeYuInU7ne5w0Jho=;
 b=gi5cli37yZmH5ncWCLgC1fqW29qTpVElqrfm2SukxowrKl1pp+jJBAbQU4/5+Pm4zII6au0jZJtYThvuBePBo3AAFa+QxcsVW9b0hQ3+Vi5kqU/pd2ZOQeD06LCRk7Mvcnj8nhO/d9Iws8i1UYYvyrDqNdnI/3u4B2cm2Sr8LII=
Received: from DB7PR05CA0067.eurprd05.prod.outlook.com (2603:10a6:10:2e::44)
 by GVXPR07MB10014.eurprd07.prod.outlook.com (2603:10a6:150:122::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Tue, 16 Jul
 2024 14:57:06 +0000
Received: from DB1PEPF000509E7.eurprd03.prod.outlook.com
 (2603:10a6:10:2e:cafe::d5) by DB7PR05CA0067.outlook.office365.com
 (2603:10a6:10:2e::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28 via Frontend
 Transport; Tue, 16 Jul 2024 14:57:06 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 DB1PEPF000509E7.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.11 via Frontend Transport; Tue, 16 Jul 2024 14:57:05 +0000
Received: from n9w6sw14.localnet (10.30.4.185) by mta.arri.de (10.10.18.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Tue, 16 Jul
 2024 16:57:05 +0200
From: Christian Eggers <ceggers@arri.de>
To: Khem Raj <raj.khem@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][RFC PATCH] include-what-you-use: new recipe
Date: Tue, 16 Jul 2024 16:57:05 +0200
Message-ID: <4907407.OV4Wx5bFTl@n9w6sw14>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
In-Reply-To: <CAMKF1spu4fha8UzWVVU-dFQ84TsXHKKCfJxsQGHFnJgnxXAQPw@mail.gmail.com>
References: <20240715121744.18888-1-ceggers@arri.de> <2532679.XAFRqVoOGU@n9w6sw14>
 <CAMKF1spu4fha8UzWVVU-dFQ84TsXHKKCfJxsQGHFnJgnxXAQPw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [10.30.4.185]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E7:EE_|GVXPR07MB10014:EE_
X-MS-Office365-Filtering-Correlation-Id: dc148394-0381-46d4-6a58-08dca5a78f26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZXVRTDE2cWE5T3JOM0NwekFQM1dXZ1R4NUsyVlQydjVteXBpQWdiV1hIUjZJ?=
 =?utf-8?B?R2JjSlR5SDRmZWR1N3dpYUQ3Ty9kamxPa1pmVGlsTVlvY2FhZEs4MzlkWVlB?=
 =?utf-8?B?bWZNWm1BTEtpQVRJMDZUSVRlSFFZT29zT2tGeEN3MDBvVzY3OUxQTCtuSjlP?=
 =?utf-8?B?eVBieHQ0Y3FOdDJXMzZ5T0pwL0VmblE3K1B4VEhkSkQydk5hYVFzTlp3dldw?=
 =?utf-8?B?SXdCN0h0Q0RRdDE4alAyS1doYks5UkNMRUZUR2tlaWkxa1pXR2o2WXIxbzho?=
 =?utf-8?B?WmFJaXBlQ1VTSjdsUlJqZWlFSW9ObzRSSHNBcisxc3RjRG50Wm9BdEIxZ3BB?=
 =?utf-8?B?L0FSR2NpV2pxRmZKa09pdWxKVm9VMnM2OW5EQ0N6eFZ1VFUrSVRWNE5kNG9v?=
 =?utf-8?B?cnp4RGhXRVg1WGc3d1djOTNJVlRjM0ZOejRxSU9ZWlpmcGp1QzB0TVE3MDhH?=
 =?utf-8?B?VDJxQmQzTzBJSWxnbXpTV05HeXJEbG1GQk1ZaE9PeWtXWTlJeHlHdVhmaEFl?=
 =?utf-8?B?ZDl6dVpSSEN4U053UW1FdWJBc1NGanYyK2M0U3hDdkpBWStlaHpUZDVheUYr?=
 =?utf-8?B?YTlPYnhvQzZuRFJXZDMzcks5bTVZQnN6K0hhV3FJdkNrUC8vK1FYRnc2OHdv?=
 =?utf-8?B?VnRtSEk0V004amhLd0N4d0RTWEtPT2p0R2pXU1o3eDRTZmYwa2xXS3NVUjZF?=
 =?utf-8?B?SmMwUEswTnhjRDRvaEpFTko2bWN2bDRCbVJ4K3VXdlIzZ0ZTTGpTZ01aNDFm?=
 =?utf-8?B?TEg3cDFQc1kwWk5jeGxVWTZjVnBWcU1vVmNyd08xcHhyTkNNRTY4RHNIRWZV?=
 =?utf-8?B?ckdwZFlqaVNGM0VObGZJOTUydWlIN2ttVldPMEZ2elp5a1JUTTRwempPNE5U?=
 =?utf-8?B?dVhEdmRRNGc0clRKRXZveDg1OUdEU2s0UDR0ZWM2ZXpMT2RldUNPYjRJeENL?=
 =?utf-8?B?aEI3anUra2NjUXoxcWpOU05DNXlWOWMzZ2c2SFFvS0JkQy90Z2VTanRrWmZM?=
 =?utf-8?B?TzJzMWJwS3NpbC8vWG5MRkdlYWI2NlpPdnFHYUswaTRUUTRYNFhMQnB3YWls?=
 =?utf-8?B?VkZrZ2EwVzlJV1NZN05RTVVDTTFCSmtyMi9YVmhCaE1DUEltTnl3Rjd4Q0Zu?=
 =?utf-8?B?ZytRV2grTDhCc3pkQTExUVlDQitJcmUzUFM2TlFHWFkxK1E3ZEVmczlFNUZi?=
 =?utf-8?B?eElqWmNQaVAzcWtVQVZYNmhpUjFQRDMxRXJXNWE4SmZsSUYrMERpYTZQbUE4?=
 =?utf-8?B?U0JFYStLaUdUdXZMenZuMUNTVmpMMWM4d0h3Vm0vbkNlK2dMSEdoUU5rUDNw?=
 =?utf-8?B?eHE2WHhiK05UaVJNaFI1ODFWMHVuV3JJYUViWTdKS0YwK3VsWVpqd0FKN0FY?=
 =?utf-8?B?eEVEcmF6c25nSEUydk1WS21DR25nbzY5M2crOG9PcGJIelhJbU9NUGU2VnpS?=
 =?utf-8?B?SWFNcVExNVl3Vm5NWUpuSHE1MGRiSG5FOWhvZ2JSM1FYb05hOExNVVJjT2NX?=
 =?utf-8?B?MEJrNlFvaTU2VGxqQlAxT0lwWUxLcU9GSmZ2eG52OFV5cEdlNmg3SEdmc2pJ?=
 =?utf-8?B?Rk9hYjdZM01oQUYrazhoSHQ2VjNMbHh1Y3VMcFBiYU80MTlZMzlKN1h3bmo2?=
 =?utf-8?B?WW1Rek1QMm5VRGJPYVlxN1ZsTmsxTE1MK0h4SmxURDVpSW9TQWw3YjJXM1k0?=
 =?utf-8?B?d2hSUGtmQmxVTHdUeEN6MWdVRHk0MlNDTG5xUWtIbTJuRWlVQ1BZOVRxS3py?=
 =?utf-8?B?dVNlK3lPT0JZdVROL0NKaUlMR21yOFUxM3VIYXNtSC9nSDFsMWwyTUd1ZTlp?=
 =?utf-8?B?MDdCNnBDM1BpSEFLN29tWUx2bEhjQldFdHo5dlozbTZyeWlOdlFTSWI5NlR1?=
 =?utf-8?Q?JdFCRL5L3gR9Y?=
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 14:57:05.8611
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc148394-0381-46d4-6a58-08dca5a78f26
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509E7.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR07MB10014
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Jul 2024 14:57:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111376

Hi Khem,


On Tuesday, 16 July 2024, 15:45:54 CEST, Khem Raj wrote:
> On Tue, Jul 16, 2024 at 1:08=E2=80=AFAM Christian Eggers <ceggers@arri.de=
> wrote:
>=20
> > On Monday, 15 July 2024, 16:18:14 CEST, Khem Raj wrote:
> > > On Mon, Jul 15, 2024 at 5:18=E2=80=AFAM Christian Eggers via
> > lists.openembedded.org
> > > <ceggers=3Darri.de@lists.openembedded.org> wrote:
> > >
> > > > Based on proposal send previously here:
> > > > https://lists.yoctoproject.org/g/yocto/topic/recipe_for/83279588
> > > >
> > > > This recipe depends on meta-clang, so should it be added to that la=
yer?
> > > >
> > > > Unfortunately the 'include-what-you-use' (iwyu) tool doesn't work y=
et.
> > > > Although I have installed nativesdk-clang (via CLANGSDK =3D "1") and
> > > > nativesdk-include-what-you-use packages, the C++ standard headers a=
re
> > > > not found:
> > > >
> > > > include-what-you-use
> > > >
> > --sysroot=3D/opt/poky/5.0.2/sysroots/cortexa7t2hf-neon-vfpv4-poky-linux=
=2Dmusleabi
> > > > impl/Fdt.cpp
> > > > impl/Fdt.cpp:9:10: fatal error: 'cerrno' file not found
> > > >     9 | #include <cerrno>
> > > >       |          ^~~~~~~~
> > > >
> > > > As iwyu uses Clang and I have no experience working with it, this is
> > > > probably only a beginner mistake. Can Clang use the C++ headers
> > provided
> > > > by libstdc++, or do I need to install further packages?
> > > >
> > >
> > > It can but it seems your SDK install might be missing any c++ runtime=
 so
> > > check a simple program that includes say <iostream> header and try
> > > compiling it
> > My SDK definitely contains std:: C++ headers for target and nativesdk. =
But
> > the
> > libstdc++ C++ headers are installed in GCC specific locations:
> >
> > /opt/poky/5.0.2/sysroots/x86_64-pokysdk-linux/usr/include/c++/13.3.0/
> >
> > /opt/poky/5.0.2/sysroots/cortexa7t2hf-neon-vfpv4-poky-linux-musleabi/us=
r/include/c++/13.3.0
> >
> > How can Clang know that the C++ headers are located in the (GCC specifi=
c)
> > c++/13.3.0
> > sub directory?
>=20
>=20
> Try adding -stdlib=3Dlibstdc++ on clang cmdline

The following seems to work:
include-what-you-use \
    -target arm-poky-linux-musleabi \
    --sysroot /opt/poky/5.0.2/sysroots/cortexa7t2hf-neon-vfpv4-poky-linux-m=
usleabi \
    -stdlib++-isystem /opt/poky/5.0.2/sysroots/cortexa7t2hf-neon-vfpv4-poky=
=2Dlinux-musleabi/usr/include/c++/13.3.0/arm-poky-linux-musleabi \
    -stdlib++-isystem /opt/poky/5.0.2/sysroots/cortexa7t2hf-neon-vfpv4-poky=
=2Dlinux-musleabi/usr/include/c++/13.3.0  \
    File.cpp

Is there a way to make this a little bit handier? I would like to avoid har=
d coding this into my CMake toolchain file.

regards,
Christian




