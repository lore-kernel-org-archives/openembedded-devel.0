Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.70])
 by mx.groups.io with SMTP id smtpd.web12.7637.1619447343521268886
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Apr 2021 07:29:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=pNFpXl7S;
 spf=pass (domain: windriver.com, ip: 40.107.77.70, mailfrom: randy.macleod@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jmFg3GbLxwOU/WIa+KF9mPr3rWgU5KtMf/uOw6blZdUqU1SF40kP5hKEI9MqMHYqxJNyiS2rOjA7iY62RNdMHiaofZGBsdhXsVbOEDB7vRxZLXBHC04aEIuG7qn3CcbNGE9VRzwBPQaBZZRQEUGH94nphxtmp9wPKALISoyQ1tvFlo/fsA2CqUMBe4/pm8ugbKkB6tMwIaCaWx9bMqSDvPJY34ujwZjeC4QBnoV0jgFj+FfXz9Y+b0ZhJ0UJ82Mdv0gA3VQo/SZk8v/wFE5eWh/B8WVKc5BF8VoqudztLqWbrl88O8r/0+JgZUzpoNDe4GPxVoYjKXjW0qIaQ10m1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9FQxhDuGEG1ptBPQXGi56z3LubQaYkNE6ba4I4hCNqw=;
 b=ewS6JZnPDVnMgRx+cBslsivbwyU8sOOntzD2V3eBeCZAZ3CxajNh2+lsSBe/suwsWR9LIuMhuCTaO3Uk2auQaXodw8Gj8P0qtgZme1xNldNtO6vd8fRFIGE2wiWNTJ2osbCyMtXC5kNd9BaVchDcaXYOXAC/EMUrdaUhMZqPk0xA6tMix3TvGm1x1u6LNQOpfixIFePLpdto563aS1KfdaG+B9ThX86mem5oOca7xvwSGyLrjOQoenAqOuv7wyMc2qqy5McLA0gmYU2J3Oc/LT4MBFPJSuqtJyHRhV08TgD3j6u3K7KDEjB3WgXAlOdBvRRB93C/BdS81/3Fr1Q9jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9FQxhDuGEG1ptBPQXGi56z3LubQaYkNE6ba4I4hCNqw=;
 b=pNFpXl7Srqxno5I9xe3dF5CgzkpgQAS8WhtvM9FOB2d2MFCdw8fx7OHahvIj7Z/UI7N3iERGju2qg3DYKXG8fC0/vUaVdBLVNBynvqNkWeJECffJjAHtEGEfEGMUSZOfoVJ2gUN3JIknqoGA+Jnm5W+UzwHdauOaL/LZAuKk/j8=
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB3292.namprd11.prod.outlook.com (2603:10b6:5:5a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20; Mon, 26 Apr
 2021 14:29:02 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::8d3b:70ab:5fc7:9eb5]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::8d3b:70ab:5fc7:9eb5%7]) with mapi id 15.20.4065.027; Mon, 26 Apr 2021
 14:29:02 +0000
Subject: Re: [oe] Hardknott merge request - April 25th
To: Armin Kuster <akuster808@gmail.com>, Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
 "Yang, Liezhi" <Liezhi.Yang@windriver.com>,
 "Jia, Hongxu" <Hongxu.Jia@windriver.com>
References: <bfd87f9a-d54f-25fd-5229-ff3cd60ad033@gmail.com>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <8f10c7cd-696b-7276-90bb-99e1194ff859@windriver.com>
Date: Mon, 26 Apr 2021 10:28:58 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <bfd87f9a-d54f-25fd-5229-ff3cd60ad033@gmail.com>
X-Originating-IP: [198.48.226.187]
X-ClientProxiedBy: BYAPR21CA0016.namprd21.prod.outlook.com
 (2603:10b6:a03:114::26) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
Return-Path: randy.macleod@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.2] (198.48.226.187) by BYAPR21CA0016.namprd21.prod.outlook.com (2603:10b6:a03:114::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.4 via Frontend Transport; Mon, 26 Apr 2021 14:29:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92ee1f96-234d-485b-a46a-08d908bfa332
X-MS-TrafficTypeDiagnostic: DM6PR11MB3292:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB3292AFC970536511B935660DF8429@DM6PR11MB3292.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:446;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6XD89K0XgM05MHzL3n+oqUsCa0wgKUM8poFiN9W8kvIZ7fFbtrPoh5ukocN5++ztC+tE60wX7AKgiGjpTAQaF+mFdgeyPwFGAHz3/swlxWbxrUUdZsf5l69lyuneN6aO1gxJZieQy6aF3MGZlQm1lrXM56edF1nsxyKO9p7wMnnK4a7Dt7x4TyzbgIIcGLpp2Bb0iXLJASYBICYxu2QiNVpjrHMNvy1i86z1a4oISikKwUJFIU2e25WUIyM5S34i8pGGItGA7VBvz6GZPEMMsi04V/ga55SNlV/a1fUZ6lyeTAbPJIAkTg4Ap7PJAZpC/UAT1WA1VhiWkpDZDH5W5EJ0o4VekjlFaRFlgNYuxXJx3hTL8JHJvNQcc+2V9+krlo5ZBu/Qttt8MAo7wLEKYqVOsn5TxmeGohzA36dftc+QvPyRbYLQ0Iz5/11bK1cB7ycfscZcDNBVnhIfODSUgW6Mvsg3093uNyvAwkUhDYXbkg/f7ZjlEHoHGOrUfo5G+R+YQIqKdA07DOVFSaPClUiUtZ4fBT4xrBzilwBM3NX61vSzqrtd7Yi92+QtnVm1OfYszl8Iph3VaQorz8ynqCTAAsszig/O1j1kSXe1frFak2qBo22dMWpK88OtfkDvk6yEWgsBKtiQSWswH8KYjUsW6a4vdKcJsSirMJt8fwrvWoWJecm3Qm1RRsCbgU5mErVhDfLLwlQM7IOl6uefgDyYQP7VD//6sWelIc/GioxVp4bkAAZQFAUoyKyp6ZM8lfZqDO4qX24+6dj9JbY3eWia7ZmTPTmXNnZpMfqGvMg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(376002)(346002)(396003)(366004)(66476007)(66574015)(66556008)(31696002)(83380400001)(66946007)(5660300002)(53546011)(8936002)(26005)(36756003)(6486002)(38100700002)(2906002)(8676002)(38350700002)(966005)(16576012)(110136005)(16526019)(316002)(186003)(478600001)(2616005)(6666004)(956004)(6636002)(31686004)(52116002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?stXeDeCho6hg/r9P7T0BhZo3EYAYyBrmASfHDDGH56RBU3wKJWTcNLmhZRH+?=
 =?us-ascii?Q?SKrOH2AJMNDmMbEYkcOxJLzw03/5+rstZMvr83GAI37VQKwGbOTOJ/+MLppz?=
 =?us-ascii?Q?geW1jPVKtTUh593N2Q3QggKB2FKrTgBb9bnTTg1sBPfbx/QickjYwt+If3tM?=
 =?us-ascii?Q?+7gpqCFNi1RryfWGW325O1MxzmaCKeoUHi2UNUKWsTpq9VxhhNlrN25BvM4r?=
 =?us-ascii?Q?NocIYYGr0ofywCQ8IMv11XswqJMa3METR0EdTwu4HeiJavvt5PFOZ+8V/vG7?=
 =?us-ascii?Q?pa8aajUsfeQIWA9Mj6szKD2Zol9hCKwrr1i8EFF8TwZxqViyB8RM3udgKTfu?=
 =?us-ascii?Q?tbOwmKD/0rTooyEtmByHNyeNQrRi0Y0LZz0Fxca+UAcQFJC/WDrTzli9LWg+?=
 =?us-ascii?Q?WLt6RAifet/uk19EOTXR0teh06WsdPDH5a7J/xeIk6pa7bVhKinOqmEdBS0I?=
 =?us-ascii?Q?Ti5W4fTBAM0AmOMxwKwmWVKcxA7bAU4LlNBbNsB1OzkFkv3VcSV7BwXSWdWJ?=
 =?us-ascii?Q?0YfKGj3E991wB8+Zq1R1Tlpe7Juk+gDIv/UIQiwlqxMdUxqAkho3hsnj3MHO?=
 =?us-ascii?Q?oSLMQRpJyBeT3OPNVaw7/64PLwx3yep1BiaN2TZVZRj4I4trsf6RqUPY0+jf?=
 =?us-ascii?Q?bsFDIUbnTPxgo5f26OFGH3ESUeKXJ0+cW3z99ieQfyeZxyp2fokYoEURsAGd?=
 =?us-ascii?Q?vqWXZDDcAo0Alb+5c0lLFVYOGEeakWTt8yDfT04UsXBV7nDxqUnWaIhHvmA3?=
 =?us-ascii?Q?dst/6Z0hcJas+2TLLjyr924VnAWkcO2fr2rLVrxHg2RJxejWkfK7BqmsrOld?=
 =?us-ascii?Q?wKlOyZ4vd3GZ+NxwG6YBnuay6yDCIpE7MZQ3L2wZPCo03hBbrDdqyq2XKx8O?=
 =?us-ascii?Q?hKWyTnCTvtHTTHrYwO8jo5PlKE05TjmeSOLXSf39HzpL1MWgiaRrqJ3zBKDj?=
 =?us-ascii?Q?biMYfn819sNT+AAU6r+Fd8DNmLXdVJ8KWcaQ4HWIjn22FfHCYiwkyWy0XQyu?=
 =?us-ascii?Q?tfizLrAGiVY9LNOwv2+s3Ab1e1D/593vCg2mliX8s+pb2+0Ca7NsSDb/Gsap?=
 =?us-ascii?Q?J0c1GYNkF9x7cI1L9BxPOGYRuQpk7EYSMT/q61huovGJZxRy8+IiayMuVzWt?=
 =?us-ascii?Q?P6xLSwaG7frLTGfJsw04PWB81HdZ84bowZduzQTq4n7skB0qohg4lnWk5CPt?=
 =?us-ascii?Q?A5abkuNsh3DlCJPvvk14Bgiv9uvqMBBYsCO1xoCzZK/F3FBRdZRQwif2Ky8i?=
 =?us-ascii?Q?JO8lSjEYUVzFuX+GcW3e5R3bffNG3inOkSBkPJ5dg37xhXUJ9TC1yDCS4duG?=
 =?us-ascii?Q?dT43tU2mThI94wKWeenSBRui?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92ee1f96-234d-485b-a46a-08d908bfa332
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2021 14:29:02.0486
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c8cxgtGqKGeWdoya0qDUXgUavZ90solUI2NQ3NTOAyAFc9GbeNooe0M4NeE5Uej9UvfpFwBYEs7y/E2uTYUB0PGBFG71IJQmkBXbXGmIlK0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3292
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: quoted-printable

On 2021-04-25 5:35 p.m., Armin Kuster wrote:
> The following changes since commit 2297d4ee04b47bc574f8879732d9e213ab7bf=
685:
>=20
>  =C2=A0 wireguard: update to v1.0.20210219 +1 (2021-04-18 13:49:13 -0700=
)
>=20
> are available in the Git repository at:
>=20
>  =C2=A0 https://git.openembedded.org/meta-openembedded hardknott-next
>=20
> for you to fetch changes up to 71b546ed8595b14d29efc1e8b951f8c845ad10c4:
>=20
>  =C2=A0 python3-cryptography: Upgrade to 3.3.2 (2021-04-23 19:09:56 -070=
0)
>=20
> ----------------------------------------------------------------
> Chen Qi (2):
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tigervnc: upgrade to 1.11.0
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-django: upgrade to 2.2.20
>=20
> Mingli Yu (2):
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 php: Upgrade to 7.4.16
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-cryptography: Upgrade to 3.3.2
>=20
> Stefan Ghinea (1):
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-django: fix CVE-2021-28658
>=20
> Ulrich =C3=96lmann (1):
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v4l-utils: fix reproducibility


These are CVE or fix-ups to get to a supported version of tigervnc.

Thanks for letting us get open-vm-tools and syslog-ng updated.

Armin,
   Do we hope/expect things to slow down now
aside from CVE patches (or 'dot' updates to fix them)?


../Randy


>=20
>  =C2=A0.../recipes-devtools/php/php/CVE-2020-7069.patch=C2=A0=C2=A0 | 15=
8
> ---------------------
>  =C2=A0.../recipes-devtools/php/php/CVE-2020-7070.patch=C2=A0=C2=A0 |=C2=
=
=A0 24 ----
>  =C2=A0.../php/{php_7.4.9.bb =3D> php_7.4.16.bb}=C2=A0=C2=A0=C2=A0=C2=A0=
=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 7 +-
>  =C2=A0.../0002-do-not-build-tests-sub-directory.patch=C2=A0=C2=A0=C2=A0=
 |=C2=A0 21 +--
>  =C2=A0...tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch |=C2=A0 36 ++-=
--
>  =C2=A0.../{tigervnc_1.10.1.bb =3D> tigervnc_1.11.0.bb}=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 13 +-
>  =C2=A0...ure.ac-autodetect-availability-of-systemd.patch |=C2=A0 47 +++=
+++
>  =C2=A0...estrict-installation-of-50-rc_keymap.conf.patch |=C2=A0 40 +++=
+++
>  =C2=A0.../v4l2apps/v4l-utils_1.20.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 11 +-
>  =C2=A0...aphy_3.3.1.bb =3D> python3-cryptography_3.3.2.bb} |=C2=A0=C2=
=A0 2 +-
>  =C2=A0.../python/python3-django_2.2.16.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=
 9 --
>  =C2=A0.../python/python3-django_2.2.20.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=
 9 ++
>  =C2=A012 files changed, 137 insertions(+), 240 deletions(-)
>=20
>=20
>=20
>=20
>=20


--=20
# Randy MacLeod
# Wind River Linux
