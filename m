Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.70])
 by mx.groups.io with SMTP id smtpd.web09.8751.1611759279679382114
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jan 2021 06:54:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ZmdoOmiM;
 spf=pass (domain: windriver.com, ip: 40.107.244.70, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HcIt2jKT3FeS1k/ym6GaWxNo2dOMM09lmbDig7XxvDNwT6+jg5kk8Vi4KcLo1en3/8q/6tCPljnfVW+Hm16tUtR228e4k+WuwOiBmPb8ovpn2i7AIw0cWpLDnQmWyrqaRqMpZaM35Y9t7d/byxfttrFakecFpvDZjkMPlOmhrix+c2E/RWHuqzw0W/3RZmf9bLrGgV3BpYLLovS/hqMAn8X5HZspPZsxE27VZOmeCpuHt+rWY7xDU5ozNlxWJGLbUYF/blEt5zMXW40K4BSvxJgLMIuZP9lZQMuLcZCztP4YKFk/ehijXImo8kEgnBdgLMDn8nQtHJktzpTSKmwqiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nMGvawvUTNf66xhtmJ66Or6x+5Pf+lcfOOYE2xZtRyc=;
 b=kog2TD4TjvFvAtGWt+K29OfvxllTG1wmAcrv6ap5OuS1meli7UXy7nQ/dKb8hDW/GymfX3OQQ1JxZ1hTV99KANdK2bmBQRD/q7DWOZ9+IJSyaG8yUYYoEtZx1CICUxUISFW1ficR+CIDFeVnsZxLeEssvivyDtBsBrWNTWthcO1svhTkqXxmoOHpeL2Jmoa5Y9yDWS63SPAIt9sRTuplACHaA5aoUP88yrlkQ/gsK/2EhBtifmi6Rquz1JKy+YupCLf1O0aYR+h9HRqxik2k0SXR94jalLWluEqfP7HPMXTUWxKcchcpPmzWQHajnqKOxfi2PQGVN1sc2xsisjWEeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nMGvawvUTNf66xhtmJ66Or6x+5Pf+lcfOOYE2xZtRyc=;
 b=ZmdoOmiMKfd51JmNj/7ulguL0hNqJhRhBASCZ5AORSF8itgWKkb3kwzH0BjKfuGmSpaG/qHDLI+TURxp5ZntPUtO49hM5QkPneqBYPWhHPxW6MBfvNpUwriEiipomczXCEhV9J0hsGeR4sHIn5p8cKz/cl+CgSvN1xh9KY3Wc2E=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3112.namprd11.prod.outlook.com (2603:10b6:a03:85::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Wed, 27 Jan
 2021 14:54:39 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3805.017; Wed, 27 Jan 2021
 14:54:38 +0000
Subject: Re: [meta-python][PATCH 5/5] python3-typed-ast: Initial add 1.4.1
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <20210123192513.2663547-1-schnitzeltony@gmail.com>
 <20210123192513.2663547-5-schnitzeltony@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <545fe215-566a-7f69-e62d-a2b5e187166e@windriver.com>
Date: Wed, 27 Jan 2021 09:54:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210123192513.2663547-5-schnitzeltony@gmail.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR13CA0007.namprd13.prod.outlook.com
 (2603:10b6:208:160::20) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR13CA0007.namprd13.prod.outlook.com (2603:10b6:208:160::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.8 via Frontend Transport; Wed, 27 Jan 2021 14:54:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a1ce9e5-f639-4941-618f-08d8c2d37859
X-MS-TrafficTypeDiagnostic: BYAPR11MB3112:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3112C308C71204C84488ED9C9FBB9@BYAPR11MB3112.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	h82U3+rKgO+HOuAB4EXZnasokaglrMxVO8DRIRshwmhRSZn+gLmZkcI1/LntaCheLhrNjynEpd2uH2Sm0pkXOJcLMf/RPWJUfLqmsl2AHWjuYojKfJcfx8lulbyhDq1EO48imushLLYfP+E2w/ysouVvirzgsbZBqE8vnrLioGz4B/MY1A9OGGsqD2xoA3QQVu3sfJdO09irGDuUqoav1yL0f5HjVH1nEq1KaguVVuqAQeTbq2rreYxOg6Rg33QjlYqNZvufg+N9SOHMmoHPFrbduQDORiejUt1lqn2LnzPmiQXaUt7fUqmoaaviKxsf7gephML/q5K50TYiB1kHW9seCbRIXTYIkelovcC6CqV24J09V0OEhTtrT/hRjBxiV477imKWhv2RxM91WZbmIz1BwvPxJRGMobbO/9ZnMXILQGvNInhd7yG98jgOtYSQgDppGvBjfUVZpnBSAk1gPQsXT694yGD0dac+AfKzzL1DsvoGy3g3IFCiO5pFL2ML6MKJBhHEiBjXAy6UtnA3aDBoEI5e360EhKdCY8pf1/ykWAqB7Zrm0dkAXyK0tZuayFMJCPzogknwIIEirKMaVa2djG4f7x4yT8RsOREKZX/AYLk8AJ2u0gQ96WgE5Hglmc8DB8JCROfXANPjcwOouEUXDbehbKEOsE0+0hCfLwJIDtwhirWr1mz3ufgXUt0Z
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(136003)(366004)(376002)(346002)(44832011)(5660300002)(52116002)(16526019)(86362001)(6486002)(186003)(2616005)(2906002)(53546011)(316002)(66556008)(8676002)(16576012)(66476007)(66946007)(478600001)(31696002)(956004)(31686004)(36756003)(26005)(66574015)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?qc+3vkKiTtx9isNFPUjilFFByegb9DrbWchY+2rEhpNxlTt4xCIPz//OOVYY?=
 =?us-ascii?Q?lBw3M4oJA4xa3CGDP3UUUR67KApdJ3S8Q7MzZ3z3UNaQ0ZwXZb8Ws5A/1aCw?=
 =?us-ascii?Q?3cKULvWXqM6oBxzMxSlJVq/CFIFDnEtR5Q1Ig4622rjVg+9KaWbMBkkNZ0at?=
 =?us-ascii?Q?6178O3q4hwa/lnXELLQz7ODrXcOLaUsbvuhf6rlxz3AYzCoYC/tb8s+AyE8f?=
 =?us-ascii?Q?q7pPEZ29kzbrQftcoTsRollsW07vaN+G2rhMsPM0sURISNe/f+t1bXuibXjI?=
 =?us-ascii?Q?uKQB9I0cUzrqmkvoj50FSJ6S2zihDTXwaI6+8wTbiltX9TPLFT3l0r7XTrre?=
 =?us-ascii?Q?XuuLtpSka5O/QKUXEIIJRMhMEO7SdyL+8A3cGRYIP+70RJKtkp5yltnh80pD?=
 =?us-ascii?Q?ESCv53KHpu+rfPineU/FGO1A7s/IqFULAbImKhXw3+3++4T27ngj6xJkpuDk?=
 =?us-ascii?Q?alDjzmKAAozS/ZtoYtW+0UAA6qlW7xHnsWSiTJUb2tHOlMA6bw1F7SGKSwIG?=
 =?us-ascii?Q?ZSEfdZyksrW7M2ZbOBDCQ47xJG90QBh+0rjbtLWwz3avg5wOOdyyc15Y6qju?=
 =?us-ascii?Q?bUyAPFUw8Tfg6ldkRnqopxyJnAVF+Sx+f53j+75Rj3LbvsQDoXnx3fwzt7Y1?=
 =?us-ascii?Q?tUSipqdRxx/SHENhXddO/yQwHgeJhDB/MjTGIzplcpm3Qu8rqoUdAMZxE0l2?=
 =?us-ascii?Q?5TobA5w/F2nccmQJUkKwg8IQlaRSqnkxsVqj+PUGvgLn0R/aijrK+R4uqQL5?=
 =?us-ascii?Q?ek4pj90Ud/5G7aCaW67HCbPp/GX3ngCMdY5skNWcsBxU27H1l17hriCOepFL?=
 =?us-ascii?Q?pKuYcsJSp2VkEJKjsO1w1rZOpTm8wLjQTRRVNsbE5S/iO2TZ3SNP3W7P+/7G?=
 =?us-ascii?Q?7kiPihB4jymr5GQS5vgrcpotRd7ETHsvjxsOvIIZYo+/6Kg2I+bF6A7H6ZrV?=
 =?us-ascii?Q?JwD3Z7Bqt0+c+T99L4E6ri58gHO0qQ6SgT/pA3AhCOr6NTyWrvg+kd3Dm6mP?=
 =?us-ascii?Q?07ADMfUFuTJ/kDAOuN6mc2lg/Pmdtejb2Wuc1R0Hs8GWdv+UfE603jrD0t97?=
 =?us-ascii?Q?XqKIy9kG?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a1ce9e5-f639-4941-618f-08d8c2d37859
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 14:54:38.8705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YEqHpsqiNwACfAA0p6hJF3jKWL002efUZaKmyPe3dFMVqgDpO87LSPpOQfaABBDH4rMseGLvMAlD3JpLLlAZQKMqh/mhoACBG9v+aCLu2ow=
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
>   .../python/python3-typed-ast_1.4.1.bb                | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-typed-as=
t_1.4.1.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-typed-ast_1.4.1.=
bb b/meta-python/recipes-devtools/python/python3-typed-ast_1.4.1.bb
> new file mode 100644
> index 000000000..2cc9f6c43
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-typed-ast_1.4.1.bb
> @@ -0,0 +1,12 @@
> +SUMMARY =3D "Modified fork of CPython's ast module that parses `# type:`=
 comments"
> +HOMEPAGE =3D "https://github.com/python/typed_ast"
> +LICENSE =3D "Apache-2.0 & MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D97f1494e93daf66a5df47118407a4=
c4f"
> +
> +PYPI_PACKAGE =3D "typed_ast"
> +
> +inherit pypi setuptools3
> +
> +SRC_URI[sha256sum] =3D "8c8aaad94455178e3187ab22c8b01a3837f8ee50e09cf31f=
1ba129eb293ec30b"
> +
> +BBCLASSEXTEND =3D "native"
> --
> 2.26.2
>
