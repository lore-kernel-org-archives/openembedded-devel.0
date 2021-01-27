Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.82])
 by mx.groups.io with SMTP id smtpd.web08.8582.1611759243077242076
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jan 2021 06:54:03 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ATlCJcYC;
 spf=pass (domain: windriver.com, ip: 40.107.93.82, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RrvBn2LgE1y+jM0Gh/l5L5FkJp5obN2hzCszREZTqHNM1i9dpxNAZrzoWNXeuE+uB0/K26l6VWOfMY6s+Y7j0Ayr8jYJ3CJAm746GgFqJNP/Uvk8RRIO6HpHIKe1uHsz5vCrAEod8tO9Xr5TitLeFtzODBAlf/38AMKXWG2aVkiRKVrYb3+7q4pg1VDv2/JilKSv6i5bFAXW/7NcoJKU7GnXy6lb1Ip2xubsC7m3fJ8tQ8o7T3RnUN/44WU7FlehMRghFEDgR6FoHgSEh/TqJ6cDolzuV5sSYa+cjJmads5K+OE6UFUlz3wLglIBpKF9gWPDodIA7tK/TEtKZDhcbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1CrHzI+ja28MZdLeRwIESiqtQctcLKDuH5oqZIflvUM=;
 b=W5Dr1M87ayXwZtKKCQylS9jtQL52kwMY44atoyC3VrnFByBroHh5QbEnR2bHiGdIXpOaJNNONT2CwtwQviWlALr72+Zdx/jgUy3WGjHF/MlWe6U4PO7f0lWZoxH1WTZCXK+tMnLUK2NrwANkl0yr2Bap9gA5Eeo6nLjxq3pFPbhlt17NuY5iAxoIxvQ3W4OZg4UU3xjX/OIQki5oG130wVX+QjwsVEObib+aotJGSXepCd1gVuG7aoNQqVlSTCHMYmCgb5ISHn7a29z13VaYH2cH6+6ghfxO8eg3a2IMwmwOgmT81qfOUz/eKGJInA8xxVI6G4RMKeG7C/tqxds/uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1CrHzI+ja28MZdLeRwIESiqtQctcLKDuH5oqZIflvUM=;
 b=ATlCJcYCLVd0bTzOsvIyooWx+KEjWl8i1/LkhZRJe84RqOpzMY5keNtB+4KaToYBNtXJFN6QbcDn7mUhWN10UprUAVUr1mxJ09L6pQ0UBdHCoqSYtso8PlWyUw73UR+v8h4oV3dni/C2oVZUqVak4Fylnfc4NYaS8zg/bJhZNI4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3112.namprd11.prod.outlook.com (2603:10b6:a03:85::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Wed, 27 Jan
 2021 14:54:00 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3805.017; Wed, 27 Jan 2021
 14:54:00 +0000
Subject: Re: [meta-python][PATCH 2/5] python3-mypy: initial add 0.800
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <20210123192513.2663547-1-schnitzeltony@gmail.com>
 <20210123192513.2663547-2-schnitzeltony@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <a1314830-a96d-1d7d-dd29-68167fc8106c@windriver.com>
Date: Wed, 27 Jan 2021 09:53:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210123192513.2663547-2-schnitzeltony@gmail.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR13CA0014.namprd13.prod.outlook.com
 (2603:10b6:208:160::27) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR13CA0014.namprd13.prod.outlook.com (2603:10b6:208:160::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.8 via Frontend Transport; Wed, 27 Jan 2021 14:53:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a5ccb8fe-8dd2-4d55-32bc-08d8c2d36174
X-MS-TrafficTypeDiagnostic: BYAPR11MB3112:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3112CDA3B6E1B4DE4CB41CC09FBB9@BYAPR11MB3112.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uS7fJJkfPu7c2bUfMm4arcMQp8nT6jT+BgilzVGj1IWPL/AiGj070gMw+WxjP8qpspnaQBMBOpkTORayg2LnJDVCm0tMwD8Rsue9XPj0/VPFE7v1I7nqqSxo6T500bp9RlZPzl/mGkOKTuNp42KPLPjbUFEQCxNIHCGeT3eFiaPp9dWHNL3Fb2h4/2HJdjPnOjzG3RiWScMWkmaCbxILJa1yppn2o5l8kgzlHlheNFIX36dJ6LIoFKvxVqAfQo3F39gjdoJ8uHXtrfXZRxdA82LkMJycTHNYQuhoyXCwlMWGge8caO9QRFzHfr/QgKqvmCU9OtOtzbZiIHaAxnRdCVwEbS4RP+8YGyypuq44anTewqj049pIokv5X9vsIMzO99YUTphCXwy0aVLraRbThsY3m73E3aFFdvNj2tqE/NoZN6ARPjw4w1xJwEFg2BFAubURSPk/ZhefP7kVfWnbeiTiys4Q1vE+S4/xJ9XyVbIOIAprWflantBSdX6gcWSkQ2PnbOYjSrHxotAD9NhLbM5FG9yobz1PutON/Ap5dwK8PCH14XW1bnxp3d2MleGn71JvElYzeD8iIAxtRXQTpt/G7RI2d1I7OHlAOzcgoGVP6aSUFxqpmRftmjYewBSPmImNebo6y2ndS/JO4nkvi5XZA+1AXx9mBbLw5dQpsOFZuwHHpNpYd/DRJXPUFqjq
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(136003)(366004)(376002)(346002)(44832011)(5660300002)(52116002)(16526019)(86362001)(6486002)(186003)(2616005)(2906002)(53546011)(316002)(66556008)(8676002)(16576012)(66476007)(66946007)(478600001)(31696002)(956004)(31686004)(36756003)(26005)(66574015)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?9u6iHlACb9Dn0TQYRYNJGk1ADzjN0w1kfRAxCvM3rldX+vMfYvVS+ssMdWSL?=
 =?us-ascii?Q?fAzLcXBB9HRhWJq/nBze8d693oeKFLxz/TSBxCybhBi/nKSyPZOptt9GH9U0?=
 =?us-ascii?Q?VcY367cFAJmZxGzGUcXmDqbhsa1VRBsFJFxn8h2dJtFFEdMOb/X+9rLdvyLa?=
 =?us-ascii?Q?cuAbK2R8XijWQooSv/YywEYaiGmJ9amFMUIHJ0n9mVMyQy3k14YAefse6VLA?=
 =?us-ascii?Q?qz2KBhuig71itj/KSj93Z8qDsdwuEi5Zlrmz0u+ZL3tds2ZNG3Ixx7PAGINW?=
 =?us-ascii?Q?MW1GDXnJKjGvdJaK6mBMONtl6lZ4Kc6sYzjV+g5nqnv3QQCOj/8VNNVSMqRb?=
 =?us-ascii?Q?mSzKnnSWh5PKMsb8dL0+3M8YSnUrnbV26k4QQIDLWcGILxKr1aYtH40PbyAN?=
 =?us-ascii?Q?hJi7uMyjxqWbbTd7LqQgUXcxkfX7latC5whxTV46Xwu1JBPh/rFvJTC1g/Sy?=
 =?us-ascii?Q?fb7pCfI3K8CC2374vGbwVsTh5RxlCDtbErD3HiRsgmhNXr2u0GtDeoEPQGq6?=
 =?us-ascii?Q?G2ipMfmf1qCNBepyQqB1qLvOaudBCns1ua2c3L/oyzCy7sEdYOfQCW0GVAyO?=
 =?us-ascii?Q?zg75oiJUc9TZP1b5WFhqDv6XxfBUp9kcvetKUGa+Har6TJ9k1Dfzdc5vNQXO?=
 =?us-ascii?Q?IZDWn0jXV+5GzlDGjQElJmQFXD6QMT/P7Iny1wZ0jumC/5lZqsbnyuR1pg66?=
 =?us-ascii?Q?wTHrI33/IQqbBDec6DTPqY4hNAWqm7Pma8kGGioWJvZ7wnyJLw6Tf1CeAFku?=
 =?us-ascii?Q?D8ujRXhhtCjWeWnOrRA41EIkQNzU7Ml2vOAqujnBhQhgU1E9kO/w2gtqQu5m?=
 =?us-ascii?Q?9ZCWCoRbAye/7nlrZsl/LMWvg75FdJDOYB90/OmjvqV4UwM/In1PSkk6t+3I?=
 =?us-ascii?Q?b/YY6WUtUdCuwJLM3Bbv8uybcMSBjB7QxiwafsSd/Eg3emt++mvCBkqGEwNq?=
 =?us-ascii?Q?jLdkhPBHPeTSja5yOF3gTDx1ztreOih7bpVFs7N/ZCXECYyUpTCdtRhQw9X1?=
 =?us-ascii?Q?b8zkXfBBv3GQ34KfKgn8YjpHu/PDXiJI0eV6bXIW1ij7EjOqDkr7nTKNSVg5?=
 =?us-ascii?Q?dmeRWs02?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5ccb8fe-8dd2-4d55-32bc-08d8c2d36174
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 14:54:00.4286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fRin9f9L5PBgbhnrndu89VE1++ACRxZ7WttebY8mjaHeTXoclU9+581Jd4PBkWcheH1GYbWebvsdwvMDvZfnKwF2SPpWJ76CWCFr8wAhA6o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3112
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US


On 2021-01-23 2:25 p.m., Andreas M=C3=BCller wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> Currently it lives in:
>
> * meta-microcontroller
> * meta-ros-common
> * meta-sca
>
> Seems important so add it to meta-python
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-mypy_0.800.bb               | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-mypy_0.8=
00.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-mypy_0.800.bb b/=
meta-python/recipes-devtools/python/python3-mypy_0.800.bb
> new file mode 100644
> index 000000000..0d019dfe1
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-mypy_0.800.bb
> @@ -0,0 +1,18 @@
> +SUMMARY =3D "Optional static typing for Python 3 and 2 (PEP 484)"
> +HOMEPAGE =3D "https://github.com/python/mypy"
> +LICENSE =3D "MIT & Python-2.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6afb7c151c4dedb5c3dc292cc120f=
adc"
> +
> +RDEPENDS_${PN} =3D " \
> +    ${PYTHON_PN}-mypy-extensions \
> +    ${PYTHON_PN}-typed-ast \
> +    ${PYTHON_PN}-typing-extensions \
> +"
> +
> +PYPI_PACKAGE =3D "mypy"
> +
> +inherit pypi setuptools3
> +
> +SRC_URI[sha256sum] =3D "e0202e37756ed09daf4b0ba64ad2c245d357659e014c3f51=
d8cd0681ba66940a"
> +
> +BBCLASSEXTEND =3D "native"
> --
> 2.26.2
>
