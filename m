Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.47])
 by mx.groups.io with SMTP id smtpd.web10.5468.1611621360861279355
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jan 2021 16:36:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=SEA+GLP8;
 spf=pass (domain: windriver.com, ip: 40.107.77.47, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DhdL6uOxtpnxn8Adea1e7CjbNrfaUr9XmEkq9qjXp7VSsDZBJvgzYxwzC2KAmOQZ93EgcbsGRghp98yVAR9QBYC17MHgis+eKg4fplOT7UzMGHb+0QLLYH0wE1Pe5d+JM4mGJkV1BPVPlHhIX7+lulbG6V7H4n0nUsQlCdvX+HW99TWDKOpQDGLWbUUWIcDAst3hvAM0YDqcvkiZkBWUq1ih2TkdimtVqF5GMVRZ//mpAMiADw5QMr/Q4blU46GSUfZFXKCCSQpipWUQqohMzU0eig7V6rcQMI1Fwyt7QpgPy9C+PmQ45SyYs0+p3TUM796nLwAA4w03CT0+cSNU8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GGc6jGzSz+2/ii2gNoqAYblN4/RzaUnMfEnzS/ontq4=;
 b=ECJ6czua/Ed6U39JNNu4KR6VzGicRXFdciobOvkkoMNOVyQd65Ku1tt0ObDH+yaqIElbAQltjBZ2Yp6NzP2ohWqh7qBsghr6fn+n3/zC/REiyROlwe+e0RhbMc2jCxmIurGR0gSw6zVbpreUrvJjZIj+St6rIicS+w7J97pjlW4d+QN9Y1MXrEytvFbuxNFkFnVWcYxeIm/+0kYWvCz5PGYanZpUc4qWrzjpDAhhiX4h6Owv4X/nc4hDcZ2qSvvcThRwV5n6b1FriKwrj4yv6KtBLGmlXAvd/2FIBxYUpr3JOWTtvIpDXFE9fcE5hmVTUkHq5G3oPSDtSms2LueDXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GGc6jGzSz+2/ii2gNoqAYblN4/RzaUnMfEnzS/ontq4=;
 b=SEA+GLP8+HEsJR+HNfGsYLLmAy0VeOhM+O2H6U9KF3atsMmPXRdhV1jyRTpqjMKio86PxhKDXdqRSEfLeskpJLG4LBfMvaezfi872l9YYAKQPF7RkL3zEn1wR4WJDBOPVzM4R4y3S34n7ApwgtlzmTjrGR5/VRabwqa3ceQ6s3w=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from MN2PR11MB3919.namprd11.prod.outlook.com (2603:10b6:208:13b::27)
 by MN2PR11MB3598.namprd11.prod.outlook.com (2603:10b6:208:f0::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.15; Tue, 26 Jan
 2021 00:35:58 +0000
Received: from MN2PR11MB3919.namprd11.prod.outlook.com
 ([fe80::5462:9c04:72b3:6c44]) by MN2PR11MB3919.namprd11.prod.outlook.com
 ([fe80::5462:9c04:72b3:6c44%7]) with mapi id 15.20.3763.019; Tue, 26 Jan 2021
 00:35:58 +0000
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Subject: Re: [meta-python][PATCH 1/2] packagegroup-meta-python: sort package names, add notes
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
CC: ticotimo@gmail.com
References: <20210125142500.936815-1-trevor.gamblin@windriver.com>
 <8c282148-4e1b-89cc-9001-7868196d8bb9@gmail.com>
Message-ID: <92b3bfd7-4c7b-f95c-c374-bc4237b0c8a8@windriver.com>
Date: Mon, 25 Jan 2021 19:35:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <8c282148-4e1b-89cc-9001-7868196d8bb9@gmail.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:208:c0::37) To MN2PR11MB3919.namprd11.prod.outlook.com
 (2603:10b6:208:13b::27)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR05CA0024.namprd05.prod.outlook.com (2603:10b6:208:c0::37) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.5 via Frontend Transport; Tue, 26 Jan 2021 00:35:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2cfa6983-312b-4ff4-9782-08d8c192594e
X-MS-TrafficTypeDiagnostic: MN2PR11MB3598:
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB35985E69EFFE006801BED9019FBC9@MN2PR11MB3598.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eCEog9HUCmRgVObx/plLgv2dtTN0qlzkw3gMDYbnqCT0erMQ9SsLK+O9573NYvw/DpLDtJfmInZ47ywwsNNYtKRkel2iq8o01IxdLR8+EkdtLsxcL7/y2juHbxrKrEnsYtaIanc1CVxfmfg+O+XwN1BeytdjwELyamsNDHSh8EIy1GyV+9r6cPQVRWZ3IWLgNXHmyw32ZH4AQlfUwLgUnUgxvG8IGZNP75IPQUJ9VB0ZicIiyvFT/ZWJgijY8fVSTCcYPbxVuYgQwnLEBQq7A7RLCGttqusDguLBhMTg2OUDHrZ/a6eWCyu0sfKgUEXmL/FgbZwt+y5Mptl1DmlyOHZgWC9dY2OpPRAy8GxZeNB7xMlrlEbDZnjwHSZibONJUKWIr0+ipPVQzMN3ei99a02FX6L7Y/XAAvFHFK00qPp0rJi+lOWKet+ho2Hx3Lb+CdE8t+V3co9cDutOXV1rnvVJbS3iNWr6qfG7dIT5vIg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB3919.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(396003)(346002)(376002)(366004)(2906002)(8676002)(956004)(16526019)(30864003)(66476007)(44832011)(478600001)(66946007)(4326008)(86362001)(5660300002)(31696002)(8936002)(53546011)(26005)(316002)(2616005)(186003)(36756003)(16576012)(83380400001)(52116002)(31686004)(6486002)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?7ZkRkTNswtOme59nC4P0cbh8gSFRGxrBN12BSJN8uIDbl78XHJNWhKukBgI0?=
 =?us-ascii?Q?WKvE7qUqYvhqV8wLNtw4sbYKbaEsCrWebojCRtv2BtcUQqVmshOblS3s7rVm?=
 =?us-ascii?Q?qCEhe4a4iIgWzNHyyEWz2Ea7FFlfwNCFKJVd54SkCjxJbB9J8AQAZPNx0ihd?=
 =?us-ascii?Q?AUgOuEpyYnjqQA8X6IP9ULnUxIU6jr74bR7/WwHrhAyKz7LcSU6mPRW7aD8T?=
 =?us-ascii?Q?n66FtbmaKj/oVDINjxps8DKIqILS31nD4mB4VKRhdSABE6AerlfgUM/NJyp/?=
 =?us-ascii?Q?iWlEhxdnlDHUwGhpniiEXws39sspE91weuTJi6oQIxxVnEOJ0ID0XZp0jCCR?=
 =?us-ascii?Q?4g8FCEz/dPuXI9fcdRNISp8j6oi43N1/xJejyr/Zz6nSd01JlPRI7REHDZFl?=
 =?us-ascii?Q?9Bzzy9Uk64o9tyhVNZCDtgEDlvKBJaR+VmN4/2N4Okk3A2I+yaVjzMXrOaiz?=
 =?us-ascii?Q?MS9Ekri28hkqyqRjjxmTDWFPDr20l6bwjFGyL2U8OAOWXjcnjwbGkAY8FFV5?=
 =?us-ascii?Q?X4ozSHuo+cm3ESgo+hucsXalaLwRzVOPxepekjQFljijwryHrnP8bOGVUVNG?=
 =?us-ascii?Q?IUy2X/SZwWD+bqKyEL/6JTyyGLAqppy2lU28VZIDj8iN18HZjODar954OD6X?=
 =?us-ascii?Q?DLLHBPJ1O1BS2lPNXuKfDyCwCimifd/St5NNIAIQHlT4gnn6OvGLjqHn0JwV?=
 =?us-ascii?Q?oTAbKg5dzwoQstCH3JzgZ51DWgjJ7gxGg082bP5Up8gKr/vYiya8N8SfhTl1?=
 =?us-ascii?Q?gTLK/z44pQUeSIxPAzZ/2ze1xsKxaRRggOrKF6W+ZfssX6/YJsZ2pJOeXu23?=
 =?us-ascii?Q?xdthJHZtqOdhK1Biz3T4l+m7MMnuBMwhrOxw60+Hfqt+KRG3/8/t7r39V4v4?=
 =?us-ascii?Q?UFDNDgzTEIz1ABmE9lgz/cxbuqts0XpFvE6Q2G0/d2tqXqJ8sE7nDTQVqp0n?=
 =?us-ascii?Q?CVwVXzL3RAF47ZcIhofhn0+ZrPv1GKJjywzlmPuTJ7D3EV6NM8M6PUeMv98W?=
 =?us-ascii?Q?mPVjOyf+xGgwOE1BElMqMcC/Fi2NfTyMmY+lSlXXeP8NL7B3/6e3zVJHs0Cf?=
 =?us-ascii?Q?hcBcTp2wYoZB4hJi3AN3mYFUuUUBig=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cfa6983-312b-4ff4-9782-08d8c192594e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3919.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 00:35:58.3002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: paq1Y2uWu+QAK34+rvmLJN83fdZDgyRxV3Mz233DKjroBT50V8nMnOUDl9qe71CBhBJllHYERr4o/wMNwOmkvN6KhV831JasrXjNeD8Q6q0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3598
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable


On 2021-01-25 5:53 p.m., Khem Raj wrote:
> have you taken care of the patch that Andreas sent earlier ?
Yes, this one is specifically for addressing the problems listed there.
>
> On 1/25/21 6:24 AM, Trevor Gamblin wrote:
>> The packagegroup-meta-python file's package lists were unsorted, so
>> they were reorded to make it easier to manually inspect. Additionally,
>> the packagegroup-meta-python3-extended and -connectivity packagegroups
>> did not appear to have any use except to be added to the main group,
>> so they were removed and their recipe lists combined into the main
>> packagegroup-meta-python3. Finally, a note about enabling Fortran
>> support in the compiler was added to the file, since python3-cvxopt
>> relies on it in order to build.
>>
>> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
>> ---
>> =C2=A0 .../packagegroups/packagegroup-meta-python.bb | 624 +++++++++----=
-----
>> =C2=A0 1 file changed, 308 insertions(+), 316 deletions(-)
>>
>> diff --git=20
>> a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb=20
>> b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
>> index 5f81fd35b..bbc9a80b3 100644
>> --- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
>> +++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
>> @@ -7,442 +7,434 @@ PACKAGES =3D ' \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 packagegroup-meta-python3 \
>> =C2=A0 '
>> =C2=A0 +# Note that python3-cvxopt requires Fortran support. To enable t=
his,
>> +# add the following to your local.conf:
>> +# FORTRAN_forcevariable =3D ",fortran"
>> =C2=A0 RDEPENDS_packagegroup-meta-python3 =3D "\
>> -=C2=A0=C2=A0=C2=A0 packagegroup-meta-python3-extended \
>> -=C2=A0=C2=A0=C2=A0 packagegroup-meta-python3-connectivity \
>> -"
>> -
>> -RDEPENDS_packagegroup-meta-python3 =3D "\
>> +=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains("DISTRO_FEATURES", "systemd",=20
>> "python3-systemd", "", d)} \
>> +=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains("DISTRO_FEATURES", "x11",=20
>> "python3-blivetgui", "", d)} \
>> +=C2=A0=C2=A0=C2=A0 gyp \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pamela \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pyrtm \
>> -=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains("DISTRO_FEATURES", "systemd",=20
>> "python3-systemd", "", d)} \
>> -=C2=A0=C2=A0=C2=A0 python3-bcrypt \
>> -=C2=A0=C2=A0=C2=A0 python3-flask-mail \
>> -=C2=A0=C2=A0=C2=A0 python3-editor \
>> -=C2=A0=C2=A0=C2=A0 python3-flask-pymongo \
>> -=C2=A0=C2=A0=C2=A0 python3-cffi \
>> -=C2=A0=C2=A0=C2=A0 python3-pillow \
>> -=C2=A0=C2=A0=C2=A0 python3-markupsafe \
>> -=C2=A0=C2=A0=C2=A0 python3-flask-nav \
>> -=C2=A0=C2=A0=C2=A0 python3-asciitree \
>> -=C2=A0=C2=A0=C2=A0 python3-flask-sqlalchemy \
>> -=C2=A0=C2=A0=C2=A0 python3-gevent \
>> +=C2=A0=C2=A0=C2=A0 python3-absl \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-aenum \
>> -=C2=A0=C2=A0=C2=A0 python3-gast \
>> -=C2=A0=C2=A0=C2=A0 python3-blinker \
>> -=C2=A0=C2=A0=C2=A0 python3-prettytable \
>> -=C2=A0=C2=A0=C2=A0 python3-cmd2 \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-aiofiles \
>> -=C2=A0=C2=A0=C2=A0 python3-anyjson \
>> -=C2=A0=C2=A0=C2=A0 python3-isodate \
>> -=C2=A0=C2=A0=C2=A0 python3-incremental \
>> -=C2=A0=C2=A0=C2=A0 python3-aiohttp-jinja2 \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-aiohttp \
>> +=C2=A0=C2=A0=C2=A0 python3-aiohttp-jinja2 \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-alembic \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-ansi2html \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-ansicolors \
>> -=C2=A0=C2=A0=C2=A0 python3-argcomplete \
>> -=C2=A0=C2=A0=C2=A0 python3-argexec \
>> +=C2=A0=C2=A0=C2=A0 python3-anyjson \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-appdirs \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-apply-defaults \
>> +=C2=A0=C2=A0=C2=A0 python3-argcomplete \
>> +=C2=A0=C2=A0=C2=A0 python3-argexec \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-argh \
>> -=C2=A0=C2=A0=C2=A0 python3-ply \
>> -=C2=A0=C2=A0=C2=A0 python3-astroid \
>> -=C2=A0=C2=A0=C2=A0 python3-ndg-httpsclient \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-arpeggio \
>> -=C2=A0=C2=A0=C2=A0 python3-astor \
>> -=C2=A0=C2=A0=C2=A0 python3-pika \
>> +=C2=A0=C2=A0=C2=A0 python3-asciitree \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-asn1crypto \
>> +=C2=A0=C2=A0=C2=A0 python3-astor \
>> +=C2=A0=C2=A0=C2=A0 python3-astroid \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-async-timeout \
>> -=C2=A0=C2=A0=C2=A0 python3-absl \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-attr \
>> -=C2=A0=C2=A0=C2=A0 python3-flask \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-autobahn \
>> -=C2=A0=C2=A0=C2=A0 python3-babel \
>> -=C2=A0=C2=A0=C2=A0 python3-pretend \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-automat \
>> -=C2=A0=C2=A0=C2=A0 python3-ptyprocess \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-aws-iot-device-sdk-python \
>> -=C2=A0=C2=A0=C2=A0 python3-bandit \
>> +=C2=A0=C2=A0=C2=A0 python3-babel \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-backcall \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-backports-functools-lru-cache \
>> +=C2=A0=C2=A0=C2=A0 python3-bandit \
>> +=C2=A0=C2=A0=C2=A0 python3-bcrypt \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-beautifulsoup4 \
>> -=C2=A0=C2=A0=C2=A0 python3-betamax \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-behave \
>> -=C2=A0=C2=A0=C2=A0 python3-jsonpointer \
>> +=C2=A0=C2=A0=C2=A0 python3-betamax \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-bitarray \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-bitstring \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-bitstruct \
>> -=C2=A0=C2=A0=C2=A0 python3-cachecontrol \
>> +=C2=A0=C2=A0=C2=A0 python3-blinker \
>> +=C2=A0=C2=A0=C2=A0 python3-blivet \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-booleanpy \
>> +=C2=A0=C2=A0=C2=A0 python3-cachecontrol \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-cachetools \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-can \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-cantools \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-cassandra-driver \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-cbor2 \
>> -=C2=A0=C2=A0=C2=A0 python3-chardet \
>> +=C2=A0=C2=A0=C2=A0 python3-cerberus \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-certifi \
>> -=C2=A0=C2=A0=C2=A0 python3-isort \
>> -=C2=A0=C2=A0=C2=A0 python3-colorama \
>> +=C2=A0=C2=A0=C2=A0 python3-cffi \
>> +=C2=A0=C2=A0=C2=A0 python3-chardet \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-cheetah \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-click \
>> -=C2=A0=C2=A0=C2=A0 python3-huey \
>> +=C2=A0=C2=A0=C2=A0 python3-click-repl \
>> +=C2=A0=C2=A0=C2=A0 python3-click-spinner \
>> +=C2=A0=C2=A0=C2=A0 python3-cmd2 \
>> +=C2=A0=C2=A0=C2=A0 python3-colorama \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-coloredlogs \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-colorlog \
>> -=C2=A0=C2=A0=C2=A0 python3-wheel \
>> -=C2=A0=C2=A0=C2=A0 python3-configshell-fb \
>> -=C2=A0=C2=A0=C2=A0 python3-constantly \
>> -=C2=A0=C2=A0=C2=A0 python3-contextlib2 \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-configargparse \
>> -=C2=A0=C2=A0=C2=A0 python3-crcmod \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-configobj \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-configparser \
>> +=C2=A0=C2=A0=C2=A0 python3-configshell-fb \
>> +=C2=A0=C2=A0=C2=A0 python3-constantly \
>> +=C2=A0=C2=A0=C2=A0 python3-contextlib2 \
>> +=C2=A0=C2=A0=C2=A0 python3-coverage \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-cppy \
>> -=C2=A0=C2=A0=C2=A0 python3-dbussy \
>> +=C2=A0=C2=A0=C2=A0 python3-crcmod \
>> +=C2=A0=C2=A0=C2=A0 python3-croniter \
>> +=C2=A0=C2=A0=C2=A0 python3-cryptography \
>> +=C2=A0=C2=A0=C2=A0 python3-cryptography-vectors \
>> +=C2=A0=C2=A0=C2=A0 python3-cson \
>> +=C2=A0=C2=A0=C2=A0 python3-custom-inherit \
>> +=C2=A0=C2=A0=C2=A0 python3-cvxopt \
>> +=C2=A0=C2=A0=C2=A0 python3-cycler \
>> +=C2=A0=C2=A0=C2=A0 python3-dateparser \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-dateutil \
>> +=C2=A0=C2=A0=C2=A0 python3-dbus-next \
>> +=C2=A0=C2=A0=C2=A0 python3-dbussy \
>> +=C2=A0=C2=A0=C2=A0 python3-decorator \
>> +=C2=A0=C2=A0=C2=A0 python3-defusedxml \
>> +=C2=A0=C2=A0=C2=A0 python3-dill \
>> +=C2=A0=C2=A0=C2=A0 python3-diskcache \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-distro \
>> -=C2=A0=C2=A0=C2=A0 python3-click-repl \
>> -=C2=A0=C2=A0=C2=A0 python3-redis \
>> +=C2=A0=C2=A0=C2=A0 python3-django \
>> +=C2=A0=C2=A0=C2=A0 python3-django-south \
>> +=C2=A0=C2=A0=C2=A0 python3-djangorestframework \
>> +=C2=A0=C2=A0=C2=A0 python3-dnspython \
>> +=C2=A0=C2=A0=C2=A0 python3-docopt \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-dominate \
>> +=C2=A0=C2=A0=C2=A0 python3-dt-schema \
>> +=C2=A0=C2=A0=C2=A0 python3-dynamic-dispatch \
>> +=C2=A0=C2=A0=C2=A0 python3-ecdsa \
>> +=C2=A0=C2=A0=C2=A0 python3-editor \
>> +=C2=A0=C2=A0=C2=A0 python3-engineio \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-et-xmlfile \
>> +=C2=A0=C2=A0=C2=A0 python3-evdev \
>> +=C2=A0=C2=A0=C2=A0 python3-fann2 \
>> +=C2=A0=C2=A0=C2=A0 python3-fasteners \
>> +=C2=A0=C2=A0=C2=A0 python3-fastnumbers \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-feedformatter \
>> +=C2=A0=C2=A0=C2=A0 python3-flask \
>> +=C2=A0=C2=A0=C2=A0 python3-flask-babel \
>> +=C2=A0=C2=A0=C2=A0 python3-flask-bootstrap \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-flask-jsonpify \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-flask-jwt \
>> +=C2=A0=C2=A0=C2=A0 python3-flask-login \
>> +=C2=A0=C2=A0=C2=A0 python3-flask-mail \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-flask-migrate \
>> -=C2=A0=C2=A0=C2=A0 python3-pyinotify \
>> +=C2=A0=C2=A0=C2=A0 python3-flask-nav \
>> +=C2=A0=C2=A0=C2=A0 python3-flask-pymongo \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-flask-restful \
>> +=C2=A0=C2=A0=C2=A0 python3-flask-script \
>> +=C2=A0=C2=A0=C2=A0 python3-flask-sijax \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-flask-socketio \
>> +=C2=A0=C2=A0=C2=A0 python3-flask-sqlalchemy \
>> +=C2=A0=C2=A0=C2=A0 python3-flask-uploads \
>> +=C2=A0=C2=A0=C2=A0 python3-flask-user \
>> +=C2=A0=C2=A0=C2=A0 python3-flask-versioned \
>> +=C2=A0=C2=A0=C2=A0 python3-flask-wtf \
>> +=C2=A0=C2=A0=C2=A0 python3-flask-xstatic \
>> +=C2=A0=C2=A0=C2=A0 python3-future \
>> +=C2=A0=C2=A0=C2=A0 python3-gast \
>> +=C2=A0=C2=A0=C2=A0 python3-geojson \
>> +=C2=A0=C2=A0=C2=A0 python3-gevent \
>> +=C2=A0=C2=A0=C2=A0 python3-gmpy2 \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-gmqtt \
>> -=C2=A0=C2=A0=C2=A0 python3-dateparser \
>> -=C2=A0=C2=A0=C2=A0 python3-defusedxml \
>> -=C2=A0=C2=A0=C2=A0 python3-rsa \
>> -=C2=A0=C2=A0=C2=A0 python3-django-south \
>> -=C2=A0=C2=A0=C2=A0 python3-grpcio \
>> -=C2=A0=C2=A0=C2=A0 python3-pybind11-json \
>> +=C2=A0=C2=A0=C2=A0 python3-gnupg \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-google-api-python-client \
>> +=C2=A0=C2=A0=C2=A0 python3-graphviz \
>> +=C2=A0=C2=A0=C2=A0 python3-greenlet \
>> +=C2=A0=C2=A0=C2=A0 python3-greenstalk \
>> +=C2=A0=C2=A0=C2=A0 python3-grpcio \
>> +=C2=A0=C2=A0=C2=A0 python3-grpcio-tools \
>> +=C2=A0=C2=A0=C2=A0 python3-gsocketpool \
>> +=C2=A0=C2=A0=C2=A0 python3-gunicorn \
>> +=C2=A0=C2=A0=C2=A0 python3-h2 \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-h5py \
>> -=C2=A0=C2=A0=C2=A0 python3-dt-schema \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-haversine \
>> -=C2=A0=C2=A0=C2=A0 python3-fasteners \
>> -=C2=A0=C2=A0=C2=A0 python3-flask-bootstrap \
>> -=C2=A0=C2=A0=C2=A0 python3-dbus-next \
>> -=C2=A0=C2=A0=C2=A0 python3-dnspython \
>> -=C2=A0=C2=A0=C2=A0 python3-traitlets \
>> -=C2=A0=C2=A0=C2=A0 python3-pybind11 \
>> -=C2=A0=C2=A0=C2=A0 python3-flask-script \
>> -=C2=A0=C2=A0=C2=A0 python3-flask-sijax \
>> +=C2=A0=C2=A0=C2=A0 python3-hexdump \
>> +=C2=A0=C2=A0=C2=A0 python3-hpack \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-html2text \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-html5lib \
>> -=C2=A0=C2=A0=C2=A0 python3-intervals \
>> -=C2=A0=C2=A0=C2=A0 python3-ipy \
>> -=C2=A0=C2=A0=C2=A0 python3-ipaddress \
>> -=C2=A0=C2=A0=C2=A0 python3-iso8601 \
>> +=C2=A0=C2=A0=C2=A0 python3-httplib2 \
>> +=C2=A0=C2=A0=C2=A0 python3-huey \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-humanfriendly \
>> -=C2=A0=C2=A0=C2=A0 python3-lrparsing \
>> -=C2=A0=C2=A0=C2=A0 python3-itsdangerous \
>> +=C2=A0=C2=A0=C2=A0 python3-humanize \
>> +=C2=A0=C2=A0=C2=A0 python3-hyperframe \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-hyperlink \
>> -=C2=A0=C2=A0=C2=A0 python3-idna-ssl \
>> -=C2=A0=C2=A0=C2=A0 python3-jdcal \
>> -=C2=A0=C2=A0=C2=A0 python3-greenstalk \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-icu \
>> -=C2=A0=C2=A0=C2=A0 python3-jsonschema \
>> -=C2=A0=C2=A0=C2=A0 python3-keras-applications \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-idna \
>> -=C2=A0=C2=A0=C2=A0 python3-sympy \
>> -=C2=A0=C2=A0=C2=A0 python3-langtable \
>> -=C2=A0=C2=A0=C2=A0 python3-lockfile \
>> -=C2=A0=C2=A0=C2=A0 python3-nmap \
>> +=C2=A0=C2=A0=C2=A0 python3-idna \
>> +=C2=A0=C2=A0=C2=A0 python3-idna-ssl \
>> +=C2=A0=C2=A0=C2=A0 python3-imageio \
>> +=C2=A0=C2=A0=C2=A0 python3-incremental \
>> +=C2=A0=C2=A0=C2=A0 python3-inflection \
>> +=C2=A0=C2=A0=C2=A0 python3-intervals \
>> +=C2=A0=C2=A0=C2=A0 python3-ipaddress \
>> +=C2=A0=C2=A0=C2=A0 python3-ipy \
>> +=C2=A0=C2=A0=C2=A0 python3-ipython \
>> +=C2=A0=C2=A0=C2=A0 python3-ipython-genutils \
>> +=C2=A0=C2=A0=C2=A0 python3-iso3166 \
>> +=C2=A0=C2=A0=C2=A0 python3-iso8601 \
>> +=C2=A0=C2=A0=C2=A0 python3-isodate \
>> +=C2=A0=C2=A0=C2=A0 python3-isort \
>> +=C2=A0=C2=A0=C2=A0 python3-itsdangerous \
>> +=C2=A0=C2=A0=C2=A0 python3-javaobj-py3 \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-jdatetime \
>> -=C2=A0=C2=A0=C2=A0 python3-monotonic \
>> -=C2=A0=C2=A0=C2=A0 python3-mpmath \
>> +=C2=A0=C2=A0=C2=A0 python3-jdcal \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-jedi \
>> +=C2=A0=C2=A0=C2=A0 python3-jsmin \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-jsonpatch \
>> +=C2=A0=C2=A0=C2=A0 python3-jsonpath-rw \
>> +=C2=A0=C2=A0=C2=A0 python3-jsonpointer \
>> +=C2=A0=C2=A0=C2=A0 python3-jsonref \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-jsonrpcserver \
>> -=C2=A0=C2=A0=C2=A0 python3-libconf \
>> -=C2=A0=C2=A0=C2=A0 python3-netifaces \
>> -=C2=A0=C2=A0=C2=A0 python3-msm \
>> -=C2=A0=C2=A0=C2=A0 python3-nocaselist \
>> +=C2=A0=C2=A0=C2=A0 python3-jsonschema \
>> +=C2=A0=C2=A0=C2=A0 python3-jstyleson \
>> +=C2=A0=C2=A0=C2=A0 python3-kconfiglib \
>> +=C2=A0=C2=A0=C2=A0 python3-keras-applications \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-keras-preprocessing \
>> -=C2=A0=C2=A0=C2=A0 python3-flask-babel \
>> +=C2=A0=C2=A0=C2=A0 python3-kiwisolver \
>> +=C2=A0=C2=A0=C2=A0 python3-langtable \
>> +=C2=A0=C2=A0=C2=A0 python3-lazy-object-proxy \
>> +=C2=A0=C2=A0=C2=A0 python3-libconf \
>> +=C2=A0=C2=A0=C2=A0 python3-license-expression \
>> +=C2=A0=C2=A0=C2=A0 python3-lockfile \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-lorem \
>> -=C2=A0=C2=A0=C2=A0 python3-javaobj-py3 \
>> -=C2=A0=C2=A0=C2=A0 python3-passlib \
>> -=C2=A0=C2=A0=C2=A0 python3-pexpect \
>> +=C2=A0=C2=A0=C2=A0 python3-lrparsing \
>> +=C2=A0=C2=A0=C2=A0 python3-luma-core \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-luma-oled \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-lxml \
>> -=C2=A0=C2=A0=C2=A0 python3-precise-runner \
>> -=C2=A0=C2=A0=C2=A0 python3-padaos \
>> -=C2=A0=C2=A0=C2=A0 python3-progress \
>> -=C2=A0=C2=A0=C2=A0 python3-sqlalchemy \
>> -=C2=A0=C2=A0=C2=A0 python3-sh \
>> -=C2=A0=C2=A0=C2=A0 python3-petact \
>> +=C2=A0=C2=A0=C2=A0 python3-lz4 \
>> +=C2=A0=C2=A0=C2=A0 python3-m2crypto \
>> +=C2=A0=C2=A0=C2=A0 python3-markdown \
>> +=C2=A0=C2=A0=C2=A0 python3-markupsafe \
>> +=C2=A0=C2=A0=C2=A0 python3-matplotlib \
>> +=C2=A0=C2=A0=C2=A0 python3-mccabe \
>> +=C2=A0=C2=A0=C2=A0 python3-meh \
>> +=C2=A0=C2=A0=C2=A0 python3-meld3 \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-mock \
>> +=C2=A0=C2=A0=C2=A0 python3-monotonic \
>> +=C2=A0=C2=A0=C2=A0 python3-mpmath \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-msgpack \
>> -=C2=A0=C2=A0=C2=A0 python3-pyasn1 \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-msk \
>> -=C2=A0=C2=A0=C2=A0 python3-openpyxl \
>> -=C2=A0=C2=A0=C2=A0 python3-prctl \
>> -=C2=A0=C2=A0=C2=A0 python3-pyatspi \
>> +=C2=A0=C2=A0=C2=A0 python3-msm \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-multidict \
>> +=C2=A0=C2=A0=C2=A0 python3-natsort \
>> +=C2=A0=C2=A0=C2=A0 python3-ndg-httpsclient \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-netaddr \
>> -=C2=A0=C2=A0=C2=A0 python3-parse \
>> +=C2=A0=C2=A0=C2=A0 python3-netifaces \
>> +=C2=A0=C2=A0=C2=A0 python3-networkx \
>> +=C2=A0=C2=A0=C2=A0 python3-nmap \
>> +=C2=A0=C2=A0=C2=A0 python3-nocasedict \
>> +=C2=A0=C2=A0=C2=A0 python3-nocaselist \
>> +=C2=A0=C2=A0=C2=A0 python3-ntplib \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-oauthlib \
>> -=C2=A0=C2=A0=C2=A0 python3-pyfirmata \
>> -=C2=A0=C2=A0=C2=A0 python3-pandas \
>> +=C2=A0=C2=A0=C2=A0 python3-obd \
>> +=C2=A0=C2=A0=C2=A0 python3-openpyxl \
>> +=C2=A0=C2=A0=C2=A0 python3-ordered-set \
>> +=C2=A0=C2=A0=C2=A0 python3-padaos \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-padatious \
>> -=C2=A0=C2=A0=C2=A0 python3-prompt-toolkit \
>> -=C2=A0=C2=A0=C2=A0 python3-parse-type \
>> -=C2=A0=C2=A0=C2=A0 python3-cycler \
>> -=C2=A0=C2=A0=C2=A0 python3-decorator \
>> -=C2=A0=C2=A0=C2=A0 python3-django \
>> -=C2=A0=C2=A0=C2=A0 python3-croniter \
>> -=C2=A0=C2=A0=C2=A0 python3-flask-user \
>> -=C2=A0=C2=A0=C2=A0 python3-twitter \
>> -=C2=A0=C2=A0=C2=A0 python3-evdev \
>> -=C2=A0=C2=A0=C2=A0 python3-dynamic-dispatch \
>> -=C2=A0=C2=A0=C2=A0 python3-click-spinner \
>> -=C2=A0=C2=A0=C2=A0 python3-future \
>> -=C2=A0=C2=A0=C2=A0 python3-geojson \
>> -=C2=A0=C2=A0=C2=A0 python3-gunicorn \
>> -=C2=A0=C2=A0=C2=A0 python3-engineio \
>> -=C2=A0=C2=A0=C2=A0 python3-gmpy2 \
>> -=C2=A0=C2=A0=C2=A0 python3-coverage \
>> -=C2=A0=C2=A0=C2=A0 python3-fastnumbers \
>> -=C2=A0=C2=A0=C2=A0 python3-fann2 \
>> -=C2=A0=C2=A0=C2=A0 python3-gnupg \
>> -=C2=A0=C2=A0=C2=A0 python3-flask-login \
>> -=C2=A0=C2=A0=C2=A0 python3-pyzmq \
>> -=C2=A0=C2=A0=C2=A0 python3-cryptography-vectors \
>> -=C2=A0=C2=A0=C2=A0 python3-flask-uploads \
>> -=C2=A0=C2=A0=C2=A0 python3-ecdsa \
>> -=C2=A0=C2=A0=C2=A0 python3-networkx \
>> -=C2=A0=C2=A0=C2=A0 python3-flask-xstatic \
>> -=C2=A0=C2=A0=C2=A0 python3-pint \
>> -=C2=A0=C2=A0=C2=A0 python3-iso3166 \
>> -=C2=A0=C2=A0=C2=A0 python3-imageio \
>> -=C2=A0=C2=A0=C2=A0 python3-mccabe \
>> -=C2=A0=C2=A0=C2=A0 python3-kconfiglib \
>> -=C2=A0=C2=A0=C2=A0 python3-grpcio-tools \
>> -=C2=A0=C2=A0=C2=A0 python3-jsmin \
>> -=C2=A0=C2=A0=C2=A0 python3-greenlet \
>> -=C2=A0=C2=A0=C2=A0 python3-idna \
>> -=C2=A0=C2=A0=C2=A0 python3-flask-versioned \
>> -=C2=A0=C2=A0=C2=A0 python3-httplib2 \
>> -=C2=A0=C2=A0=C2=A0 python3-ipython-genutils \
>> -=C2=A0=C2=A0=C2=A0 python3-kiwisolver \
>> -=C2=A0=C2=A0=C2=A0 python3-lz4 \
>> -=C2=A0=C2=A0=C2=A0 python3-obd \
>> -=C2=A0=C2=A0=C2=A0 python3-markdown \
>> -=C2=A0=C2=A0=C2=A0 python3-m2crypto \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-paho-mqtt \
>> -=C2=A0=C2=A0=C2=A0 python3-graphviz \
>> -=C2=A0=C2=A0=C2=A0 python3-pyaudio \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-pako \
>> -=C2=A0=C2=A0=C2=A0 python3-meld3 \
>> +=C2=A0=C2=A0=C2=A0 python3-pandas \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-parallax \
>> -=C2=A0=C2=A0=C2=A0 python3-lazy-object-proxy \
>> -=C2=A0=C2=A0=C2=A0 python3-license-expression \
>> -=C2=A0=C2=A0=C2=A0 python3-luma-core \
>> -=C2=A0=C2=A0=C2=A0 python3-natsort \
>> -=C2=A0=C2=A0=C2=A0 python3-polyline \
>> -=C2=A0=C2=A0=C2=A0 python3-ordered-set \
>> +=C2=A0=C2=A0=C2=A0 python3-paramiko \
>> +=C2=A0=C2=A0=C2=A0 python3-parse \
>> +=C2=A0=C2=A0=C2=A0 python3-parse-type \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-parso \
>> +=C2=A0=C2=A0=C2=A0 python3-passlib \
>> +=C2=A0=C2=A0=C2=A0 python3-pathtools3 \
>> +=C2=A0=C2=A0=C2=A0 python3-pep8 \
>> +=C2=A0=C2=A0=C2=A0 python3-periphery \
>> +=C2=A0=C2=A0=C2=A0 python3-petact \
>> +=C2=A0=C2=A0=C2=A0 python3-pexpect \
>> +=C2=A0=C2=A0=C2=A0 python3-pickleshare \
>> +=C2=A0=C2=A0=C2=A0 python3-pid \
>> +=C2=A0=C2=A0=C2=A0 python3-pika \
>> +=C2=A0=C2=A0=C2=A0 python3-pillow \
>> +=C2=A0=C2=A0=C2=A0 python3-pint \
>> +=C2=A0=C2=A0=C2=A0 python3-pkgconfig \
>> +=C2=A0=C2=A0=C2=A0 python3-ply \
>> +=C2=A0=C2=A0=C2=A0 python3-pocketsphinx \
>> +=C2=A0=C2=A0=C2=A0 python3-polyline \
>> +=C2=A0=C2=A0=C2=A0 python3-prctl \
>> +=C2=A0=C2=A0=C2=A0 python3-precise-runner \
>> +=C2=A0=C2=A0=C2=A0 python3-pretend \
>> +=C2=A0=C2=A0=C2=A0 python3-prettytable \
>> +=C2=A0=C2=A0=C2=A0 python3-priority \
>> +=C2=A0=C2=A0=C2=A0 python3-progress \
>> +=C2=A0=C2=A0=C2=A0 python3-prompt-toolkit \
>> +=C2=A0=C2=A0=C2=A0 python3-protobuf \
>> +=C2=A0=C2=A0=C2=A0 python3-psutil \
>> +=C2=A0=C2=A0=C2=A0 python3-ptyprocess \
>> +=C2=A0=C2=A0=C2=A0 python3-pulsectl \
>> +=C2=A0=C2=A0=C2=A0 python3-py-ubjson \
>> +=C2=A0=C2=A0=C2=A0 python3-pyalsaaudio \
>> +=C2=A0=C2=A0=C2=A0 python3-pyasn1 \
>> +=C2=A0=C2=A0=C2=A0 python3-pyasn1-modules \
>> +=C2=A0=C2=A0=C2=A0 python3-pyatspi \
>> +=C2=A0=C2=A0=C2=A0 python3-pyaudio \
>> +=C2=A0=C2=A0=C2=A0 python3-pybind11 \
>> +=C2=A0=C2=A0=C2=A0 python3-pybind11-json \
>> +=C2=A0=C2=A0=C2=A0 python3-pybluez \
>> +=C2=A0=C2=A0=C2=A0 python3-pychromecast \
>> +=C2=A0=C2=A0=C2=A0 python3-pycodestyle \
>> +=C2=A0=C2=A0=C2=A0 python3-pyconnman \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-pycparser \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-pycrypto \
>> +=C2=A0=C2=A0=C2=A0 python3-pycurl \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-pydbus \
>> -=C2=A0=C2=A0=C2=A0 python3-pathtools3 \
>> -=C2=A0=C2=A0=C2=A0 python3-periphery \
>> +=C2=A0=C2=A0=C2=A0 python3-pydicti \
>> +=C2=A0=C2=A0=C2=A0 python3-pyephem \
>> +=C2=A0=C2=A0=C2=A0 python3-pyexpect \
>> +=C2=A0=C2=A0=C2=A0 python3-pyfirmata \
>> +=C2=A0=C2=A0=C2=A0 python3-pyflakes \
>> +=C2=A0=C2=A0=C2=A0 python3-pyhamcrest \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-pyiface \
>> +=C2=A0=C2=A0=C2=A0 python3-pyinotify \
>> +=C2=A0=C2=A0=C2=A0 python3-pyjks \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-pyjwt \
>> +=C2=A0=C2=A0=C2=A0 python3-pykickstart \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-pykwalify \
>> -=C2=A0=C2=A0=C2=A0 python3-docopt \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-pylint \
>> +=C2=A0=C2=A0=C2=A0 python3-pylyrics \
>> +=C2=A0=C2=A0=C2=A0 python3-pymisp \
>> +=C2=A0=C2=A0=C2=A0 python3-pymongo \
>> +=C2=A0=C2=A0=C2=A0 python3-pymysql \
>> +=C2=A0=C2=A0=C2=A0 python3-pynacl \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-pynetlinux \
>> -=C2=A0=C2=A0=C2=A0 python3-pickleshare \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-pyopenssl \
>> -=C2=A0=C2=A0=C2=A0 python3-protobuf \
>> -=C2=A0=C2=A0=C2=A0 python3-pyasn1-modules \
>> +=C2=A0=C2=A0=C2=A0 python3-pyparted \
>> +=C2=A0=C2=A0=C2=A0 python3-pyperclip \
>> +=C2=A0=C2=A0=C2=A0 python3-pyperf \
>> +=C2=A0=C2=A0=C2=A0 python3-pyrad \
>> +=C2=A0=C2=A0=C2=A0 python3-pyro4 \
>> +=C2=A0=C2=A0=C2=A0 python3-pyroute2 \
>> +=C2=A0=C2=A0=C2=A0 python3-pyrsistent \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-pyscaffold \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-pyserial \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-pysocks \
>> -=C2=A0=C2=A0=C2=A0 python3-pytoml \
>> +=C2=A0=C2=A0=C2=A0 python3-pystache \
>> +=C2=A0=C2=A0=C2=A0 python3-pystemd \
>> +=C2=A0=C2=A0=C2=A0 python3-pytest-asyncio \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-pytest-helpers-namespace \
>> +=C2=A0=C2=A0=C2=A0 python3-pytest-html \
>> +=C2=A0=C2=A0=C2=A0 python3-pytest-metadata \
>> +=C2=A0=C2=A0=C2=A0 python3-pytest-runner \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-pytest-tempdir \
>> -=C2=A0=C2=A0=C2=A0 python3-pyflakes \
>> -=C2=A0=C2=A0=C2=A0 python3-pyrad \
>> +=C2=A0=C2=A0=C2=A0 python3-pytest-timeout \
>> +=C2=A0=C2=A0=C2=A0 python3-python-vlc \
>> +=C2=A0=C2=A0=C2=A0 python3-pytoml \
>> +=C2=A0=C2=A0=C2=A0 python3-pytun \
>> +=C2=A0=C2=A0=C2=A0 python3-pytz \
>> +=C2=A0=C2=A0=C2=A0 python3-pyudev \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-pyusb \
>> -=C2=A0=C2=A0=C2=A0 python3-pyhamcrest \
>> -=C2=A0=C2=A0=C2=A0 python3-custom-inherit \
>> -=C2=A0=C2=A0=C2=A0 python3-pymysql \
>> -=C2=A0=C2=A0=C2=A0 python3-pyperclip \
>> +=C2=A0=C2=A0=C2=A0 python3-pywbem \
>> +=C2=A0=C2=A0=C2=A0 python3-pywbemtools \
>> +=C2=A0=C2=A0=C2=A0 python3-pyyaml \
>> +=C2=A0=C2=A0=C2=A0 python3-pyzmq \
>> +=C2=A0=C2=A0=C2=A0 python3-qrcode \
>> +=C2=A0=C2=A0=C2=A0 python3-raven \
>> +=C2=A0=C2=A0=C2=A0 python3-rdflib \
>> +=C2=A0=C2=A0=C2=A0 python3-redis \
>> +=C2=A0=C2=A0=C2=A0 python3-regex \
>> +=C2=A0=C2=A0=C2=A0 python3-requests \
>> +=C2=A0=C2=A0=C2=A0 python3-requests-file \
>> +=C2=A0=C2=A0=C2=A0 python3-requests-ftp \
>> +=C2=A0=C2=A0=C2=A0 python3-requests-futures \
>> +=C2=A0=C2=A0=C2=A0 python3-requests-oauthlib \
>> +=C2=A0=C2=A0=C2=A0 python3-requests-toolbelt \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-rfc3339-validator \
>> -=C2=A0=C2=A0=C2=A0 python3-pytz \
>> +=C2=A0=C2=A0=C2=A0 python3-rfc3986-validator \
>> +=C2=A0=C2=A0=C2=A0 python3-rfc3987 \
>> +=C2=A0=C2=A0=C2=A0 python3-robotframework \
>> +=C2=A0=C2=A0=C2=A0 python3-robotframework-seriallibrary \
>> +=C2=A0=C2=A0=C2=A0 python3-rsa \
>> +=C2=A0=C2=A0=C2=A0 python3-ruamel-yaml \
>> +=C2=A0=C2=A0=C2=A0 python3-scapy \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-scrypt \
>> -=C2=A0=C2=A0=C2=A0 python3-rdflib \
>> +=C2=A0=C2=A0=C2=A0 python3-sdnotify \
>> +=C2=A0=C2=A0=C2=A0 python3-semver \
>> +=C2=A0=C2=A0=C2=A0 python3-sentry-sdk \
>> +=C2=A0=C2=A0=C2=A0 python3-serpent \
>> +=C2=A0=C2=A0=C2=A0 python3-sh \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-sijax \
>> -=C2=A0=C2=A0=C2=A0 python3-regex \
>> +=C2=A0=C2=A0=C2=A0 python3-simpleeval \
>> +=C2=A0=C2=A0=C2=A0 python3-simplejson \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-slip-dbus \
>> +=C2=A0=C2=A0=C2=A0 python3-smbus \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-smbus2 \
>> -=C2=A0=C2=A0=C2=A0 python3-pytest-metadata \
>> -=C2=A0=C2=A0=C2=A0 python3-term \
>> -=C2=A0=C2=A0=C2=A0 python3-pystache \
>> -=C2=A0=C2=A0=C2=A0 python3-pep8 \
>> -=C2=A0=C2=A0=C2=A0 python3-pytest-runner \
>> -=C2=A0=C2=A0=C2=A0 python3-pybluez \
>> -=C2=A0=C2=A0=C2=A0 python3-rfc3986-validator \
>> -=C2=A0=C2=A0=C2=A0 python3-pocketsphinx \
>> -=C2=A0=C2=A0=C2=A0 python3-sdnotify \
>> -=C2=A0=C2=A0=C2=A0 python3-pycodestyle \
>> +=C2=A0=C2=A0=C2=A0 python3-smpplib \
>> +=C2=A0=C2=A0=C2=A0 python3-snappy \
>> +=C2=A0=C2=A0=C2=A0 python3-socketio \
>> +=C2=A0=C2=A0=C2=A0 python3-soupsieve \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-speaklater \
>> -=C2=A0=C2=A0=C2=A0 python3-wtforms \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-speedtest-cli \
>> -=C2=A0=C2=A0=C2=A0 python3-pyudev \
>> -=C2=A0=C2=A0=C2=A0 python3-sqlparse \
>> -=C2=A0=C2=A0=C2=A0 python3-pyexpect \
>> -=C2=A0=C2=A0=C2=A0 python3-pytest-html \
>> -=C2=A0=C2=A0=C2=A0 python3-uritemplate \
>> -=C2=A0=C2=A0=C2=A0 python3-cryptography \
>> -=C2=A0=C2=A0=C2=A0 python3-requests \
>> -=C2=A0=C2=A0=C2=A0 python3-test-generator \
>> -=C2=A0=C2=A0=C2=A0 python3-whoosh \
>> -=C2=A0=C2=A0=C2=A0 python3-xstatic-font-awesome \
>> -=C2=A0=C2=A0=C2=A0 python3-tqdm \
>> -=C2=A0=C2=A0=C2=A0 python3-vcversioner \
>> -=C2=A0=C2=A0=C2=A0 python3-semver \
>> -=C2=A0=C2=A0=C2=A0 python3-serpent \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-spidev \
>> +=C2=A0=C2=A0=C2=A0 python3-spidev \
>> +=C2=A0=C2=A0=C2=A0 python3-sqlalchemy \
>> +=C2=A0=C2=A0=C2=A0 python3-sqlparse \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-sqlsoup \
>> -=C2=A0=C2=A0=C2=A0 python3-tornado \
>> -=C2=A0=C2=A0=C2=A0 python3-trafaret \
>> -=C2=A0=C2=A0=C2=A0 python3-urllib3 \
>> -=C2=A0=C2=A0=C2=A0 python3-yappi \
>> -=C2=A0=C2=A0=C2=A0 python3-texttable \
>> -=C2=A0=C2=A0=C2=A0 python3-humanize \
>> +=C2=A0=C2=A0=C2=A0 python3-stevedore \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-strict-rfc3339 \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-supervisor \
>> -=C2=A0=C2=A0=C2=A0 python3-diskcache \
>> -=C2=A0=C2=A0=C2=A0 python3-requests-futures \
>> -=C2=A0=C2=A0=C2=A0 python3-matplotlib \
>> -=C2=A0=C2=A0=C2=A0 python3-sentry-sdk \
>> -=C2=A0=C2=A0=C2=A0 python3-xlrd \
>> -=C2=A0=C2=A0=C2=A0 python3-xstatic \
>> -=C2=A0=C2=A0=C2=A0 python3-tzlocal \
>> -=C2=A0=C2=A0=C2=A0 python3-ntplib \
>> -=C2=A0=C2=A0=C2=A0 python3-u-msgpack-python \
>> -=C2=A0=C2=A0=C2=A0 python3-python-vlc \
>> -=C2=A0=C2=A0=C2=A0 python3-xlsxwriter \
>> -=C2=A0=C2=A0=C2=A0 python3-inflection \
>> +=C2=A0=C2=A0=C2=A0 python3-sympy \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-tabulate \
>> -=C2=A0=C2=A0=C2=A0 python3-typing-extensions \
>> -=C2=A0=C2=A0=C2=A0 python3-pystemd \
>> -=C2=A0=C2=A0=C2=A0 python3-pid \
>> -=C2=A0=C2=A0=C2=A0 python3-pkgconfig \
>> -=C2=A0=C2=A0=C2=A0 python3-pylyrics \
>> -=C2=A0=C2=A0=C2=A0 python3-pyyaml \
>> -=C2=A0=C2=A0=C2=A0 python3-raven \
>> -=C2=A0=C2=A0=C2=A0 python3-stevedore \
>> -=C2=A0=C2=A0=C2=A0 python3-requests-oauthlib \
>> -=C2=A0=C2=A0=C2=A0 python3-rfc3987 \
>> -=C2=A0=C2=A0=C2=A0 python3-psutil \
>> -=C2=A0=C2=A0=C2=A0 python3-robotframework-seriallibrary \
>> -=C2=A0=C2=A0=C2=A0 python3-pulsectl \
>> -=C2=A0=C2=A0=C2=A0 python3-py-ubjson \
>> -=C2=A0=C2=A0=C2=A0 python3-pyalsaaudio \
>> -=C2=A0=C2=A0=C2=A0 python3-simpleeval \
>> -=C2=A0=C2=A0=C2=A0 python3-smbus \
>> -=C2=A0=C2=A0=C2=A0 python3-pychromecast \
>> -=C2=A0=C2=A0=C2=A0 python3-pyjks \
>> -=C2=A0=C2=A0=C2=A0 python3-pymongo \
>> -=C2=A0=C2=A0=C2=A0 python3-spidev \
>> -=C2=A0=C2=A0=C2=A0 python3-pynacl \
>> +=C2=A0=C2=A0=C2=A0 python3-term \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-termcolor \
>> -=C2=A0=C2=A0=C2=A0 python3-pyperf \
>> -=C2=A0=C2=A0=C2=A0 python3-qrcode \
>> -=C2=A0=C2=A0=C2=A0 python3-visitor \
>> -=C2=A0=C2=A0=C2=A0 python3-pyroute2 \
>> -=C2=A0=C2=A0=C2=A0 python3-webencodings \
>> -=C2=A0=C2=A0=C2=A0 python3-pyrsistent \
>> -=C2=A0=C2=A0=C2=A0 python3-werkzeug \
>> -=C2=A0=C2=A0=C2=A0 python3-pydicti \
>> -=C2=A0=C2=A0=C2=A0 python3-xmlrunner \
>> -=C2=A0=C2=A0=C2=A0 python3-smpplib \
>> -=C2=A0=C2=A0=C2=A0 python3-pymisp \
>> -=C2=A0=C2=A0=C2=A0 python3-requests-file \
>> -=C2=A0=C2=A0=C2=A0 python3-requests-toolbelt \
>> -=C2=A0=C2=A0=C2=A0 python3-ruamel-yaml \
>> -=C2=A0=C2=A0=C2=A0 python3-socketio \
>> -=C2=A0=C2=A0=C2=A0 python3-soupsieve \
>> +=C2=A0=C2=A0=C2=A0 python3-test-generator \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-textparser \
>> +=C2=A0=C2=A0=C2=A0 python3-texttable \
>> +=C2=A0=C2=A0=C2=A0 python3-thrift \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-tinyrecord \
>> +=C2=A0=C2=A0=C2=A0 python3-tornado \
>> +=C2=A0=C2=A0=C2=A0 python3-tqdm \
>> +=C2=A0=C2=A0=C2=A0 python3-trafaret \
>> +=C2=A0=C2=A0=C2=A0 python3-trafaret-config \
>> +=C2=A0=C2=A0=C2=A0 python3-traitlets \
>> +=C2=A0=C2=A0=C2=A0 python3-transitions \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-twine \
>> +=C2=A0=C2=A0=C2=A0 python3-twisted \
>> +=C2=A0=C2=A0=C2=A0 python3-twitter \
>> +=C2=A0=C2=A0=C2=A0 python3-twofish \
>> +=C2=A0=C2=A0=C2=A0 python3-txaio \
>> +=C2=A0=C2=A0=C2=A0 python3-txws \
>> +=C2=A0=C2=A0=C2=A0 python3-typeguard \
>> +=C2=A0=C2=A0=C2=A0 python3-typing-extensions \
>> +=C2=A0=C2=A0=C2=A0 python3-tzlocal \
>> +=C2=A0=C2=A0=C2=A0 python3-u-msgpack-python \
>> +=C2=A0=C2=A0=C2=A0 python3-ujson \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-unidiff \
>> +=C2=A0=C2=A0=C2=A0 python3-uritemplate \
>> +=C2=A0=C2=A0=C2=A0 python3-urllib3 \
>> +=C2=A0=C2=A0=C2=A0 python3-vcversioner \
>> +=C2=A0=C2=A0=C2=A0 python3-versiontools \
>> +=C2=A0=C2=A0=C2=A0 python3-visitor \
>> +=C2=A0=C2=A0=C2=A0 python3-waitress \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-watchdog \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-webcolors \
>> -=C2=A0=C2=A0=C2=A0 python3-robotframework \
>> -=C2=A0=C2=A0=C2=A0 python3-xxhash \
>> -=C2=A0=C2=A0=C2=A0 python3-yarl \
>> -=C2=A0=C2=A0=C2=A0 python3-zopeinterface \
>> -=C2=A0=C2=A0=C2=A0 python3-requests-ftp \
>> -=C2=A0=C2=A0=C2=A0 python3-scapy \
>> -=C2=A0=C2=A0=C2=A0 python3-paramiko \
>> -=C2=A0=C2=A0=C2=A0 python3-twofish \
>> -=C2=A0=C2=A0=C2=A0 python3-simplejson \
>> -=C2=A0=C2=A0=C2=A0 python3-snappy \
>> -=C2=A0=C2=A0=C2=A0 python3-versiontools \
>> -=C2=A0=C2=A0=C2=A0 python3-flask-wtf \
>> +=C2=A0=C2=A0=C2=A0 python3-webencodings \
>> +=C2=A0=C2=A0=C2=A0 python3-websocket-client \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-websockets \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-werkzeug \
>> +=C2=A0=C2=A0=C2=A0 python3-werkzeug \
>> +=C2=A0=C2=A0=C2=A0 python3-wheel \
>> +=C2=A0=C2=A0=C2=A0 python3-whoosh \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-wrapt \
>> +=C2=A0=C2=A0=C2=A0 python3-wtforms \
>> +=C2=A0=C2=A0=C2=A0 python3-xlrd \
>> +=C2=A0=C2=A0=C2=A0 python3-xlsxwriter \
>> +=C2=A0=C2=A0=C2=A0 python3-xmlrunner \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-xmltodict \
>> -=C2=A0=C2=A0=C2=A0 python3-trafaret-config \
>> -=C2=A0=C2=A0=C2=A0 python3-twisted \
>> -=C2=A0=C2=A0=C2=A0 python3-txaio \
>> -=C2=A0=C2=A0=C2=A0 python3-typeguard \
>> -=C2=A0=C2=A0=C2=A0 python3-pytest-timeout \
>> -=C2=A0=C2=A0=C2=A0 python3-ujson \
>> -=C2=A0=C2=A0=C2=A0 python3-waitress \
>> -=C2=A0=C2=A0=C2=A0 python3-websocket-client \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-xmodem \
>> -=C2=A0=C2=A0=C2=A0 python3-djangorestframework \
>> -=C2=A0=C2=A0=C2=A0 python3-pytest-asyncio \
>> -=C2=A0=C2=A0=C2=A0 python3-nocasedict \
>> +=C2=A0=C2=A0=C2=A0 python3-xstatic \
>> +=C2=A0=C2=A0=C2=A0 python3-xstatic-font-awesome \
>> +=C2=A0=C2=A0=C2=A0 python3-xxhash \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-yamlloader \
>> -=C2=A0=C2=A0=C2=A0 python3-ipython \
>> -=C2=A0=C2=A0=C2=A0 python3-pycurl \
>> -=C2=A0=C2=A0=C2=A0 gyp \
>> -=C2=A0=C2=A0=C2=A0 python3-jsonref \
>> -=C2=A0=C2=A0=C2=A0 python3-transitions \
>> -=C2=A0=C2=A0=C2=A0 python3-dill \
>> -=C2=A0=C2=A0=C2=A0 python3-cerberus \
>> -=C2=A0=C2=A0=C2=A0 python3-cvxopt \
>> -=C2=A0=C2=A0=C2=A0 python3-jsonpath-rw \
>> -=C2=A0=C2=A0=C2=A0 python3-hexdump \
>> -=C2=A0=C2=A0=C2=A0 python3-jstyleson \
>> -"
>> -
>> -RDEPENDS_packagegroup-meta-python3-extended =3D "\
>> -=C2=A0=C2=A0=C2=A0 python3-blivet \
>> -=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains("DISTRO_FEATURES", "x11",=20
>> "python3-blivetgui", "", d)} \
>> -=C2=A0=C2=A0=C2=A0 python3-cson \
>> -=C2=A0=C2=A0=C2=A0 python3-meh \
>> -=C2=A0=C2=A0=C2=A0 python3-pyephem \
>> -=C2=A0=C2=A0=C2=A0 python3-pykickstart \
>> -=C2=A0=C2=A0=C2=A0 python3-pyparted \
>> -=C2=A0=C2=A0=C2=A0 python3-pywbem \
>> -=C2=A0=C2=A0=C2=A0 python3-pywbemtools \
>> -"
>> -
>> -RDEPENDS_packagegroup-meta-python3-connectivity =3D "\
>> -=C2=A0=C2=A0=C2=A0 python3-gsocketpool \
>> -=C2=A0=C2=A0=C2=A0 python3-h2 \
>> -=C2=A0=C2=A0=C2=A0 python3-hpack \
>> -=C2=A0=C2=A0=C2=A0 python3-hyperframe \
>> -=C2=A0=C2=A0=C2=A0 python3-priority \
>> -=C2=A0=C2=A0=C2=A0 python3-pyconnman \
>> -=C2=A0=C2=A0=C2=A0 python3-pyro4 \
>> -=C2=A0=C2=A0=C2=A0 python3-thrift \
>> -=C2=A0=C2=A0=C2=A0 python3-txws \
>> -=C2=A0=C2=A0=C2=A0 python3-pytun \
>> +=C2=A0=C2=A0=C2=A0 python3-yappi \
>> +=C2=A0=C2=A0=C2=A0 python3-yarl \
>> +=C2=A0=C2=A0=C2=A0 python3-zopeinterface \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 telepathy-python3 \
>> =C2=A0 "
>>
