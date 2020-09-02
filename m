Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.68])
 by mx.groups.io with SMTP id smtpd.web10.11202.1599062497146470672
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 09:01:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=H/bjl+Dg;
 spf=pass (domain: windriver.com, ip: 40.107.94.68, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cnuPCnGC8htz8xmb8MLkOmAMUUNiUakwaI1A/4AGdfvlbBfTuaG8BBschw9v4U0AE7x5cBQKwyfgHOyElssEhM0o2VOMn1ItzA4Y65DDRExMZQZH+M2kDRKbvf6zi/Ev9jjbAhZgetWWo09iNArEsYtBd/wcRYgqniKzkFzW2vlC2D3bB+3O96WEFNcB+nM/V6iEDx8a2+iEYfW7JHiJlfyTEPno8M1ZNg1wlRlmIjoq5A4Qh61QWZNmBbLJoXJYD/1t7jrgx64TIHwde/ncpVNpUyjr0WiazMH6fc6TwEiPNL+deCD8WCAbt+2um0443i2aN0esrP+o66+Jhdxxdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EbhRNmjc4RKRZ8+KUjKjQMM77rUPD6I4i8/d+mHQBEw=;
 b=NCkogoQaEDAcZOUeezBjjH7P8/Xhn/WyNgX26SJ1nCihKOZpsWOBJTFLhH2RTCnfSVEAgO4knFJGlhQO79H0Umuj83GbRDPve3XXtNHBqvEzym3pTfqf9yMdmht2Rhu2Fsdo9gz/tsHGIeJxS+aXvAfg/DtNf1VWHEoI1XJ3rY8fABliekSofAXqD01Pylwq+mFm9veGX1UxthS2iOaoIguaE3YUHo3VsBg/zjGLwR9ZpRsexBrxsaemrU+Jw6j6SrZSkQ4QDMUT8Eru+SdoA84OkQ6XNCZemG53RSDs45cXrsvSD1nliCPV13TtjByYuEO/dVMdqviDj6KU+/ZceA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EbhRNmjc4RKRZ8+KUjKjQMM77rUPD6I4i8/d+mHQBEw=;
 b=H/bjl+Dg667ANj6BWyq9UsEaUia/zB5/hYC/r4rw5Moilzhz3ut3tf3b92+k4DGg6EIUpVKvS0lg7PxwK/ihOgKR2AmePLapykIWXJmVOXNbTpbf/ODExcdPYtPmPo3/tjhFQm0JLGFsBQ9cNUKSRbTs9VW8zPWyi2JDDdhMLoo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3815.namprd11.prod.outlook.com (2603:10b6:a03:fa::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Wed, 2 Sep
 2020 16:01:35 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3348.015; Wed, 2 Sep 2020
 16:01:35 +0000
Subject: Re: [meta-python][PATCH] python3-texttable: add recipe
To: Hongxu Jia <hongxu.jia@windriver.com>, raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org
References: <20200827080016.26124-1-hongxu.jia@windriver.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <f3c2aeaf-ccbb-83b0-13a1-fcbe216393d6@windriver.com>
Date: Wed, 2 Sep 2020 12:01:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200827080016.26124-1-hongxu.jia@windriver.com>
X-ClientProxiedBy: YT1PR01CA0064.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::33) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YT1PR01CA0064.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend Transport; Wed, 2 Sep 2020 16:01:34 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 048f75f9-d806-4dc5-4e38-08d84f597776
X-MS-TrafficTypeDiagnostic: BYAPR11MB3815:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB381504A1582F09395A3D042A9F2F0@BYAPR11MB3815.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:386;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	K+rAyUT+/SsRxXmoFqhvT/Tz1/A7N4WGulA81Uvvd/QxtthPN5I+V+hpOjae9HZ8qOApyTn/O1Ecky12gOQLOaLVXs56qDRl8y4EqEsEPb+vcFn2k/eWAa09/A5tU+qC0l6FlIihHY37t7HQuh4dS/r7LOc+tfrcXDDVLWdonq065SzEZwLPAxrLmp0c/uxCXkJbCCEpfQ8OqWJblF2OeWOJaG1sGP8huVVxbhRdfJPBuUtBlGuE2CAfHYIhR055DDIp+RWraxJ2QOCSYef5GTVt4KavsrRwoGA/uf9hlSRwdoImEerGRbHTzTA57leUft+VtZNzHS3ZIoLXehLtKCBHVrCtp0e4J7x0JidUthixaHPDllO9uiVE+axR9LdWYd19ibMOD0TwS9JQfbr+UfMwbfdq/SvtCGwuagJUhm0Ge/GWKzEtnZxTo6OeuxKsCfRw7ENfFS4q05K1kHnu1g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(366004)(39850400004)(136003)(186003)(6486002)(8676002)(16576012)(44832011)(956004)(26005)(53546011)(2616005)(52116002)(478600001)(31686004)(8936002)(316002)(31696002)(2906002)(4326008)(66946007)(66476007)(66556008)(36756003)(5660300002)(86362001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	3cKRIfeJmhsrFJrfrMIik4Td5pWHnobMA+ZXu0KyWrLmGx2jIhS5BFAiImLfcmESQIl35ZRAsg1hhTgoZleSQ2EHZEgMGkY9W8u9UeLNKFahYfb9kconl4tNJXXTUwJdbsWqZM2qtGOBpKhxmg4AprtlBgFbHgebPHXnuF0r1QMIZ+aZRyTCngJDPSSHG3su1tZxhcjyUmusw+xOvxeVJJcu3QsMPqlVwopv2Bxnox5UpEQ6Z4tqQEwV3FCn/mKADiY0/PtmTjtYXjNmXVscxBMOGnhOO4pmsnKNUUZ4RhbtwihJoQ56vrurUIokBRl3cQ74V1NSRD5FfIiy+54OYKohl05ExqeAzPCQQPOgmjA2WjKoU8PPpq5q3T8rmarENbzd6ylEW0AD7oSGRuRajL1kBORpPCS16+giw/RquO1o3tHuCh4q+SD+fNGsuTgYl5lYE/mwlVg6Kqh2kdEHOFokPgNhCaj/WdUirW5JOh30vxdI5Z4ekloENZY6yOBJe+RvK4e8qWQTToMnghRORt91dcZhsclEwVf38ZMoo2PsQCb+G3eXKpmcsPWabUXVzxPgxY/wBznBMNdw+uUzIudWqMtVcuHR2Ga4bqcW54tmK6BjhWPnevUdSo+UHV3YtEMbAhQrCtZNR3o29DCYeg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 048f75f9-d806-4dc5-4e38-08d84f597776
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2020 16:01:34.9819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XVZAxHmbbrbMHCJ8dZ9AIKBF0lGICv1gZqzw6mTWx1FyuWx7HrnVRbz2DZmoXQg9xnb0xx26jLnrzyTfg38sqlSPQULzG8D1P6yYKEPvmkk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3815
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 8/27/20 4:00 AM, Hongxu Jia wrote:
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-texttable_1.6.2.bb                 | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-texttable_1.6.2.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-texttable_1.6.2.bb b/meta-python/recipes-devtools/python/python3-texttable_1.6.2.bb
> new file mode 100644
> index 000000000..b507008f4
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-texttable_1.6.2.bb
> @@ -0,0 +1,11 @@
> +SUMMARY = "module for creating simple ASCII tables"
> +HOMEPAGE = "https://github.com/foutaise/texttable/"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=af37e32174857b1f2043245f3651c824"
> +
> +inherit pypi setuptools3
> +
> +SRC_URI[md5sum] = "763141f0bdf598cdc5cf780ed4d2eb94"
> +SRC_URI[sha256sum] = "eff3703781fbc7750125f50e10f001195174f13825a92a45e9403037d539b4f4"
> +
> +BBCLASSEXTEND = "native nativesdk"
