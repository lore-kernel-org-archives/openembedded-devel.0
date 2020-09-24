Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.44])
 by mx.groups.io with SMTP id smtpd.web10.26208.1600976657673908716
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Sep 2020 12:44:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=U9kPTxBW;
 spf=pass (domain: windriver.com, ip: 40.107.220.44, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BFhD4j+VHa4RJ1i5EEfBtLmV8XsHtGNtxwWu0cyfy5TS/Qur0EqVyXgia+mZvc3GwfGi4TgRwnf1GD99auJAzHehfLy/zIsN/Y0DJdg6aRoI57l0iY1ZnloKJZMojwVyi8Pa3LdxP24B64IPtxPtf9+ZHZdQ9h+pWuSpfWDZf5LEX4iXH6KeCQJlIr1izvbpG5xztffOjvBT0hr5BuKczSDQlDyqTGtrxqs8w30Vpuxopn57Gy0W2uHlYgbT7XP6Lxc27aqqV4qTx6o3tg/N7+DEFnsM7utu2eZ2P/uLvjFUEq6jiZxw3j9XYieT7Italg8OPJtX55ZOqfLHJGf5xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fCtF6m3uET+JI+su3k95h9xj+hAupbQLiApNJ6gnT/M=;
 b=SEROADPccOqr+Lqt7aaxPwGGTcqggFV/mgYA8OucIPf65pxZpdeyga3/AkQsYvrojc6/2l776j758y0Api7hg/JcMk4R8Nki0iaIG4XSlMVls1kEpvzrNUeQI87kk7MVQMOvMbxTBl1yGJTNhJ3mdF+tz7OwIFpwi7FJE8poEpUntSZ23lMH6CQjdjWVN97GwE3VpFEGVBYy67MdkaHk1DIF/JY6SF7xTMe2+ZOZJ2x3T3b1sP4ix/sVsyJSTsqexQ9SX4l/GS4ErXu4MsS+GaZr7PTcnZeI8y+zdccMkHvDkfkLjQUmBOKWV6reRcRnO9W8BevWqQpzqLgyGITy3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fCtF6m3uET+JI+su3k95h9xj+hAupbQLiApNJ6gnT/M=;
 b=U9kPTxBWMcCn38SZOXsoEOKLjoK4jv4Ny9PEZLS2v6CGc/9qKP0dP2w4a41vD2WpE5ygR2C7DadL2QIJuGA+usoSo/0cmoWn476ebord4rSOz5YILX5LfXVvNpuIKZ693LDKUbmbJDEZyDlijNBvrllYJzS2sjfHEDv2yoX4Z6o=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3559.namprd11.prod.outlook.com (2603:10b6:a03:f7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.19; Thu, 24 Sep
 2020 19:44:16 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3391.026; Thu, 24 Sep 2020
 19:44:16 +0000
Subject: Re: [meta-python][PATCH V3] python3-docopt: add version 0.6.2
To: Hongxu Jia <hongxu.jia@windriver.com>, raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org
References: <16375B943F866857.15058@lists.openembedded.org>
 <20200923081621.32822-1-hongxu.jia@windriver.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <08fdf1ab-aaac-877c-0290-a529d89d2106@windriver.com>
Date: Thu, 24 Sep 2020 15:44:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200923081621.32822-1-hongxu.jia@windriver.com>
X-ClientProxiedBy: YT1PR01CA0023.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::36)
 To BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0023.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.21 via Frontend Transport; Thu, 24 Sep 2020 19:44:15 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 83ba1f68-e319-492a-f982-08d860c2386e
X-MS-TrafficTypeDiagnostic: BYAPR11MB3559:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3559DE01401ED4EFAD89BE379F390@BYAPR11MB3559.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:335;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qx72zunRn2v5BjsULihb7gDGOM6v2cyggRxpXfMWonr+OudSdFjoz0VLNYjFx4+chhc14/jHZXP36GfcnskqNHuxcxbiuZqj2oOg4XKNihf9UirWKlzLttOeMf7NEiScX1DYm8nZf1nYZ1etu88ZBba3z9/ybhp5sXE28ZnGqUMvWLLn+0lQDrqrRnumytl7FwoFEqBb54as4AbW96GBZNET1VBCFVZF7YvoDzdP9MGSFm4Q4uv467E3kuR+tNfETrwL/5OkqF4SP0FujHDynAVxozGGrltTM9jQb/dQUO5LTEOzZlzlSoDcmdziUWYxQ4YfKu9UhXZSIFpRM+P8cM9k2quKnaWVZj3Ev/Xs7/JCKaqS62SVz8GWu9iaahBpZe3Ro10HBBXoOA+pkRdoAzc9mcS6Wl2K1h9HCQuDYZWkvkN7B3NI8UV9TUy1slJPxDg95K6UROIFvp2+jNbkAWcj8C6JV3Atso6hmbLm3IjYH1ewz6kE36ZELF7bon4V
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(346002)(376002)(366004)(396003)(66476007)(26005)(52116002)(53546011)(36756003)(8676002)(44832011)(86362001)(316002)(2906002)(66556008)(8936002)(4326008)(31696002)(31686004)(66946007)(956004)(6486002)(5660300002)(186003)(478600001)(16576012)(2616005)(16526019)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	ED669kQwX8H1yj5P6ZadJpMULfO0AZ5BMgK3fXs831c8dKRLGsFBwgapOfjGqLPU7nUxV1D0YcLgNZux1FGRekBOAeTAWzGHzwrYaAR0xLXMrcyyU4BEJvu9uguYqWB6PCYmwHfArgjnt9CdrJTXNGqchwB3tD8pnFq1aDNmm/b27uypjo9Rjizvk3vpiju+vjm/YDjTKcfWYLr6nSwrjgFaogUUcJsjmhyuPWz2rGlhvj/EQggwhnFTvoYRwjCTulheh/piMRgpKJh4jImQefxUZ7ybzvw55qqFRcFD5SQ11lBJ0RlhF79rsGgEKRGQQBzLt1Yr86dHZ59UWL3bvXPcrwEmI4hf1kjuxrZoD7NcppY/cX2Jz+h0HfS2JD+c6yFTVUhxAc+OcEEPxX05PgGNVZdaXxoslbBWzSvTPLiyVqiP8qAv4IaLC91WJUqop7qVIrw5fHcvZsElNh1uTySwPj28q7gIj8F3k7mS9Tmyr0631DHuzFNQDiQevyGo1Tg8Z8dw9Nbqj4pLxrZNGD77oUw8KhAULxmJAOsxMukIgv8OCQBZ2PK9osdBOG1ab6fBugTyHl3LL9R9d9M7JILw9EhVwHxp3YkEbL8DbIEuJGt4fB2K1rxd9SWFS2s1xE7KeDhzksdnYJyqPjr/1g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83ba1f68-e319-492a-f982-08d860c2386e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2020 19:44:16.1752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wIa50NB+7Mrf5fRIifov/yybcCsEFVkAfnJ6C0fpZdZngrFylsTrGU5EvaftlA0BeuoNRFoinIumG2j5+tamtvWJfKitrfYAe0nCfIIAARY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3559
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 9/23/20 4:16 AM, Hongxu Jia wrote:
> It is required by python3-pykwalify cli
> ...
> $ pykwalify -h
> x86_64-wrlinuxsdk-linux/usr/lib/python3.8/site-packages/pykwalify/cli.py", line 11, in <module>
>      from docopt import docopt
> ModuleNotFoundError: No module named 'docopt'
> ...
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../packagegroups/packagegroup-meta-python.bb         |  1 +
>   .../recipes-devtools/python/python3-docopt_0.6.2.bb   | 11 +++++++++++
>   .../python/python3-pykwalify_1.7.0.bb                 |  1 +
>   3 files changed, 13 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-docopt_0.6.2.bb
>
> diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> index 61623ac98..a7c71e37c 100644
> --- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> +++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> @@ -261,6 +261,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
>       python3-pyiface \
>       python3-pyjwt \
>       python3-pykwalify \
> +    python3-docopt \
>       python3-pylint \
>       python3-pynetlinux \
>       python3-pickleshare \
> diff --git a/meta-python/recipes-devtools/python/python3-docopt_0.6.2.bb b/meta-python/recipes-devtools/python/python3-docopt_0.6.2.bb
> new file mode 100644
> index 000000000..a2432068c
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-docopt_0.6.2.bb
> @@ -0,0 +1,11 @@
> +SUMMARY = "Pythonic argument parser, that will make you smile"
> +HOMEPAGE = "http://docopt.org/"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE-MIT;md5=09b77fb74986791a3d4a0e746a37d88f"
> +
> +inherit setuptools3 pypi
> +
> +SRC_URI[md5sum] = "4bc74561b37fad5d3e7d037f82a4c3b1"
> +SRC_URI[sha256sum] = "49b3a825280bd66b3aa83585ef59c4a8c82f2c8a522dbe754a8bc8d08c85c491"
> +
> +BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb b/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb
> index 4440723d3..7a30f1f67 100644
> --- a/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb
> @@ -12,6 +12,7 @@ inherit setuptools3 pypi
>   unset _PYTHON_SYSCONFIGDATA_NAME
>   
>   RDEPENDS_${PN} = "\
> +    ${PYTHON_PN}-docopt \
>       ${PYTHON_PN}-dateutil \
>       ${PYTHON_PN}-pyyaml \
>   "
