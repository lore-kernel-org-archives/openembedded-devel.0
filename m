Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.88])
 by mx.groups.io with SMTP id smtpd.web12.44569.1600701789985572318
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Sep 2020 08:23:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=C7kpBOLa;
 spf=pass (domain: windriver.com, ip: 40.107.236.88, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W+PcClhbyX/ooOrOAE6yFoTPTnKo7kqM70CdzHyaqsMJkbEVhwcLTel7BrJuh1CHRFQj3MK0FysDI+PuvX8niSkg9+zCeqTjWgG63HzuESEqEr7usgHladOk8O/VYCCtqlhGiqGhEjWeDGVUwdbRqmkSBUnq/wZq4QQbm8hniTvyRrx2dIMcZ61k3ofgqsvt9ocCoL5wwB4X3tb8PfyJWJY5EYGdW/ffxMHcngN/bb3laj7+ddSe8tiZsy1/xlvkk0lxVoxnomK1NJ4jbQc5NtW5VqObksD9O7u/jhG8dCjEt/KgSl7pMfHIZdKOpE4hkTbokLkABdk5gyUxDIF3Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JtlxPhUUzLr8a/ZZVZhLNKrfKBWzeKlms/ZIq53CAS4=;
 b=dzCgvv8E7mLMMDP88hPmCV51D9RsbNMVB8RAG47TgbjpC3mII7vRCvsTMuqXnXc56OwOUykHFfUZnb9KTX+38F6YWeeEzOa1lfekDomwyM2iN9Z6+OY8XTkNlYNh9nvsgXbIzYObCKVKygQSQHk4itp9NxhUDWQekRfPmW8KTlRfwinNZyF7GQhzKhBM3j3fWH5wOfYxcupEkxPRdDNmxA4DO/cgFbuBfyCQ7fJrmEopM9FOH/JYzy1RS1PtyNkW22NNEDFMHngpY6zlraSx18Hq/fnbUzkQcEiSBmKFxox0+q6u2ETGWN/O87pYFyyqzRavZad/VNQxApg4rX6/3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JtlxPhUUzLr8a/ZZVZhLNKrfKBWzeKlms/ZIq53CAS4=;
 b=C7kpBOLaKYuT9ZwGfi2Qzqi8HAeLGHahIegQHPBVJbG5EgsGWyFcYHUCKvqiFnHkN3c2MFbHEIwCbvfGZs61LjZtRm21OlFmb2NSPvNTjOpV6VSxgGePKbkFJfDOcgFSLu5Cb4XLNEwWrASv4Xd9bNNwkQ4xYhoodd6Nl/Yrd7c=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4307.namprd11.prod.outlook.com (2603:10b6:a03:1bd::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Mon, 21 Sep
 2020 15:23:08 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3391.026; Mon, 21 Sep 2020
 15:23:08 +0000
Subject: Re: [meta-python][PATCH V2] python3-argcomplete: add recipe 1.12.0
To: Hongxu Jia <hongxu.jia@windriver.com>, raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org
References: <CAMKF1srbs8OQ5udXzXBW-sj4DmcjNsSJrj3vgKkE9qi_nfyosQ@mail.gmail.com>
 <20200918132706.16113-1-hongxu.jia@windriver.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <b300b851-48b0-eae2-46d5-4bda35edb368@windriver.com>
Date: Mon, 21 Sep 2020 11:23:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200918132706.16113-1-hongxu.jia@windriver.com>
X-ClientProxiedBy: YT1PR01CA0124.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::33) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0124.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.26 via Frontend Transport; Mon, 21 Sep 2020 15:23:07 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 837fc79d-ab38-4a52-06b8-08d85e423e42
X-MS-TrafficTypeDiagnostic: BY5PR11MB4307:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB430798FEDBBA23F859D52B4A9F3A0@BY5PR11MB4307.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:632;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HJHnK2ms66vI/UbXVq47HWYWFCqRCEEtZjUUUZ7SAu9IUepI7PyuDqb1nqFdss45ihLFGgFEs16H0KqYWoso5Dxkg5f/0Xv4kV+PsXLu9RnkIEqyXeeBZAdD8vNh5tS9iayS9mjcPPTEWbCFoUYynE/0/2CnMDOkDzhZIex3ydBjBEjRB2Rzz9POpWtrCS0ebqkTG/+g12SxDO59BM1stD/QOeOplQvQXtaE+Kolz0b8mtwHE9S4D90VQ4gsYNkLQioMKgvqMvbPWZEh6TPWMMGO1xF/Y6Oh/pcKTDxjM4VdR4dT0D5Kxly0q0svRdX5H+BoQLBc5pmbN5mxSUuEWuC181FHomodfP4WF6Y/bYrj/un41QrdvZHAqQZ+ysXD+O1TPwiMu9tOsrkfGYZTNvoj9+rk2ggRj3p4UIsBw52vY5JVpPNIBluJG5558BDSrLfrNdMnn07NjS1Xj6laRg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(366004)(136003)(346002)(39850400004)(478600001)(8676002)(86362001)(36756003)(44832011)(4326008)(53546011)(956004)(2616005)(66556008)(66476007)(2906002)(66946007)(52116002)(186003)(16576012)(31696002)(31686004)(26005)(5660300002)(16526019)(8936002)(6486002)(316002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	Dw4w0V5udasuTSEIchRJtmsjKVym/SrcvyUabGCFBbEScgib+PRk4DVdQeCbuWgZ6kJP2R5PurV9MU3JQGvLnZY6KWelP52mJLRVM51yO84VF8KeYsA+4bc/aOufISl0XJJbjleDyMeYvY12T7aX8app0Zh+PCSs/X/4Wn1jajikZ/C6wqLvbQxQDDvpTbHCCBLyrRqyPF5mMQ54IrTlECZ0rsrMGeBFcQ57iHCNr3pRZRGiUBBuT6pM3aEu5lORY41vIehkgJzEOSSryNBmBzMkfir8h4VDKwO50zHMnuSuFhf16McA9cAWIYR35jRo3fyQjv6F6N0t1ayojkERv4OMHNZeEpfngS+M2YlWnaqA0hw6uSlB0PPksm63n43LZ0CA6vRSkEcC4icpQSYipOvm2OFFiAoAUnVNj92ntrPPxnID9lvzcfm7GishxR+w5NxnSEzF3Suob9BLjusk2SoCE26kFEiHUFznsz2jMvURHL67LytZT3InI2BeQ9eNs0qygWcbMTi/I7+hEmEmlhetUdLeoNTysysZIm68/B9KPV9YXnG5Z6sazscXx/Lvy5rlJfpSZKLnMDR5iu016WPxPIgvyBbTQ+KKr3rwEGoMkXLZ48AwO2EGTB56cMiYNVRIZ/by80RFC16h5Yz7Pg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 837fc79d-ab38-4a52-06b8-08d85e423e42
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2020 15:23:08.4068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mzAbPkzndOwrRqtQQaTh5V3iyyR0Ff2CEhsk3FPuaN2xS26+Uawr+RK8QBv9EtsK2L/Zjt2/OAP93G322jDZisfyyYYqcG7VqDO47CxOiT4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4307
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 9/18/20 9:27 AM, Hongxu Jia wrote:
> Tab complete all the things!
>
> Argcomplete provides easy, extensible command line tab completion of
> arguments for your Python script.
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../packagegroups/packagegroup-meta-python.bb  |  1 +
>   .../python/python3-argcomplete_1.12.0.bb       | 18 ++++++++++++++++++
>   2 files changed, 19 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-argcomplete_1.12.0.bb
>
> diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> index 61623ac98..914359a86 100644
> --- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> +++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> @@ -42,6 +42,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
>       python3-alembic \
>       python3-ansi2html \
>       python3-ansicolors \
> +    python3-argcomplete \
>       python3-argexec \
>       python3-appdirs \
>       python3-apply-defaults \
> diff --git a/meta-python/recipes-devtools/python/python3-argcomplete_1.12.0.bb b/meta-python/recipes-devtools/python/python3-argcomplete_1.12.0.bb
> new file mode 100644
> index 000000000..dd749dd9e
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-argcomplete_1.12.0.bb
> @@ -0,0 +1,18 @@
> +SUMMARY = "Argcomplete provides easy, extensible command line tab completion of arguments for your Python script."
> +HOMEPAGE = "https://github.com/kislyuk/argcomplete"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=2ee41112a44fe7014dce33e26468ba93"
> +
> +SRC_URI[md5sum] = "47e2a3db821f57165be8f3d3ec1e5259"
> +SRC_URI[sha256sum] = "2fbe5ed09fd2c1d727d4199feca96569a5b50d44c71b16da9c742201f7cc295c"
> +
> +PYPI_PACKAGE = "argcomplete"
> +
> +inherit pypi setuptools3
> +
> +RDEPENDS_${PN} += "\
> +    ${PYTHON_PN}-core \
> +"
> +
> +BBCLASSEXTEND = "native nativesdk"
> +
