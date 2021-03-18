Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.63])
 by mx.groups.io with SMTP id smtpd.web12.8236.1616071521241899465
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Mar 2021 05:45:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=RwGpw1ob;
 spf=pass (domain: windriver.com, ip: 40.107.220.63, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YMp5z4nCm4AuSs0J+fb1pmteCmwo7wXTVJ+zWRg0cWCdfpI74UtWPFjIYwFSpEZoSwsDNzNYXMfkxW5U9oaEQwIGxaMo3G/vSbfxQo2udCzDrH+YO/rcT2BGq3lxuOlPzZpX4Vqr03+7wJ2ocE9tjPMyk+iKaJwNrjp6ujobnRVW51uC9uVUMA8b4B00wHIhEdbwaFB2q0t/xNZdRjoL0+Wsgz2a230p3n0fJ7zLZrZ+flnoCouqgqXnVC3YSzAQA7mv/yN+RClC75PGRGdcqs33eqiIF/oYNqWBcRExvfFMWYyLjHnXMfkx39F9tg6V+8NB202LvHzB8g2X/SF/Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ovNlkeJCKOZDF1Mq2eE83s9x69gbO4ow7voAc5k/nU=;
 b=jlJVGr1C1Nb1fvvpRl+Z5jc+9nH5I/oLQG7fp1qNyjZ9PNk1P2yDmQam9zWrRYlutEvamC52rhkBWHQvDCuvLCSCBiITI0xpklN+dA8+T7I7+eLYa56rq/ux4vgF1g4S8EamBo+TS1UPdvnZ6pWj4Fk7HquQjDkuxETfvK4LCElgkUZB7BuR7EOpRWrV8+8HFfDo78c4LF7ghVlU0czELAMMQ7TJQeR/2aaRJpcY9oVkDsdUU34qqPf8DAgu+U/7nU1CvTOifkk9Gbjny6M1/aMtIx9o6bhSs4v+xEOh+LN9AYvSnV1iyVE84P37y0qmnTa9so33IKdjey/tDKw4aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ovNlkeJCKOZDF1Mq2eE83s9x69gbO4ow7voAc5k/nU=;
 b=RwGpw1obG7hTKg6KxuxzsrVxGNAHWahRWIOmFtvRv3wvtIRQrQKL34brn6N1rO3FnH99IKW/32F6aG7JRonsv/hwwvljSd4+aiCOtLCquGIb0db4tcNnFAR6GwYE5+5Fy47DFLGsdPvKZG+Ca+uCiQAH541lIUqabJgh2Z2EIm0=
Authentication-Results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB5184.namprd11.prod.outlook.com (2603:10b6:a03:2d5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Thu, 18 Mar
 2021 12:45:20 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::89c3:3b4d:43c5:ae76]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::89c3:3b4d:43c5:ae76%5]) with mapi id 15.20.3955.018; Thu, 18 Mar 2021
 12:45:20 +0000
Subject: Re: [meta-python][PATCH] python3-wpa-supplicant: new package
To: Bartosz Golaszewski <brgl@bgdev.pl>, Khem Raj <raj.khem@gmail.com>,
 Armin Kuster <akuster808@gmail.com>,
 Tim moto-timo Orling <TicoTimo@gmail.com>, Derek Straka <derek@asterius.io>
Cc: openembedded-devel@lists.openembedded.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20210307152224.31148-1-brgl@bgdev.pl>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <2f7fcfa4-a340-a68d-0883-ac4ae145f879@windriver.com>
Date: Thu, 18 Mar 2021 08:45:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210307152224.31148-1-brgl@bgdev.pl>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN9PR03CA0198.namprd03.prod.outlook.com
 (2603:10b6:408:f9::23) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN9PR03CA0198.namprd03.prod.outlook.com (2603:10b6:408:f9::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Thu, 18 Mar 2021 12:45:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4748024c-5055-437d-3fce-08d8ea0bb04d
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5184:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB5184930E6E3F8F69AB61E5949F699@SJ0PR11MB5184.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/yffnSa+OM3sEhBkprTTPYjXRBoNuRr/9IDUnOFftsit7va27O+JCCMh/x9cERRhqXya4kHO4AmpiD8wVXCxQXUXl9IOQsxb68GFgKILqDS+16BKs+pOYSH4Edpm7sVzttDY8hCu9v7+/jB+dcVvhDypvxgp10iGp1KbkOx4kKAAKg+HygdpEcYm36aylmQHUhqC40X5bjfFB61lR3QSp0mm2QD+XKGqbl8hPThPVuFxtUna4Oc458ZZ/05egCuD/AZZggtiryge7+REhTf3ZHXgmYyFPETJ38aAA3ltH98F2A2eZmW5O2nLnvoWTiaZ2Gr+00zlyheuoF+tgg1gzIdcZfoom1Wm89gZPQmnYTL74/6KsGhJLOc4R5Ib/TjhMkUFomfJ6ntZ7d7OC76xyRVaOPxPqFX4VY/bL1tFCR31OjEpk0xCddT5AZGhe7jM02wHv0hltx0jFFlaPej7hOXCjo/jN1v1JXr5wuI6iL3um+LRsOX4ycIplvQ+9fYgbgft582CA9BqFjMqYm1M287dxFRPs7eiPinzyvucnOoN1Pkm9HR9K+UYakq+kFOAbaC5wYM1pxf/E9c5k55YfLw4SNoG2oDhMk66bDkvhXgDq6AZJftFAN6V4WAgpvNfvkFepywBqeK2JIrFcWouJVAbkRhJkV1jLPugLylepzhKh1ksmDewUHNXsPax8nnGgaWnKJ/0S6YYl1efLYCEgsEYvLUJjsQ1N7vFq9HfGpYshwf24j429C60Fu9O7RXV
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(396003)(136003)(346002)(39840400004)(8676002)(478600001)(5660300002)(316002)(16576012)(186003)(2616005)(86362001)(16526019)(8936002)(956004)(26005)(44832011)(36756003)(53546011)(110136005)(31686004)(66476007)(4326008)(6486002)(31696002)(66946007)(2906002)(66556008)(38100700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?c2g1UWdjMGhndEF4dDJ1VmVkei9wc2w3WEJpeFZ4VkV3VWE2bVpueGtVQm4z?=
 =?utf-8?B?enBkRUl4T3dIUVh5ZVVvMlU3eFFLeXdKZE56d2hBdFcrcXdtbkRNSG5tc0li?=
 =?utf-8?B?LzlPeWltRWpDZU55Z2lvOTJSL2c2Yk9TUzNCZ0I5QThrMVcrVEVzaVcxdzM1?=
 =?utf-8?B?Z0x4alcxZHZjNG01V3dvM1MySk5EOFM4YWRQL3VEUHdHQUc4NUZmWkk2dGJ3?=
 =?utf-8?B?R2tuN2M1aTdlYm9yeUtxNTkyWS9yNTJ2cTZDaEpscGFTL3NhbVVzS1RGd3ZC?=
 =?utf-8?B?bUJ2VEo4TWVmcjBidzR2aUhKSitHdFN1enhYY2loS3F2UFYxdDRMUVRBa1Jj?=
 =?utf-8?B?Q3hJVG56MERnQTdleWord0xuZXFsLzM3S1pXazF4Zk1WNFZSVjRxL2xwRjQr?=
 =?utf-8?B?MUk3UDhtSGtaMWk1T0dXb3NrZFBHNjVmWnNvWTdWUzY2QlNJczAyanl2U1NR?=
 =?utf-8?B?SzBRSWZURXNQWnQ4WkNwSy9HTGpRaWZQZDgwKy9kRWxFV2ZEV2xPazZWT3Fx?=
 =?utf-8?B?b2hJT0hxV2xWY1hkU1ArUzdBS0hGRjFnK1ZuQkJyejJOWUk3a3ZaTDY4YXM1?=
 =?utf-8?B?d0Z2M1I5RllKMXJ4UnAxN0YxS0hUeE9Tc1hvSGZ4WEY5ZDMvdFFkTkZIcXln?=
 =?utf-8?B?SVIxV0JRMW5iUVRIMjdNQnNOMXFBMVZZTWoyQ2VMUkZCYjd5Y1hDdHpMT3E4?=
 =?utf-8?B?Tm1WZHMranZjK00vSmh5QkxTV21scmticW8wYmU2T1JWWDI5QURqQVVsVGdJ?=
 =?utf-8?B?K3kvWU9tTUU0dHorNkl0OURXeldFUnUybzlSanVjaS9ERk9iUDBrVElxWFow?=
 =?utf-8?B?TzlrV1dLMWFTTHcvRzhlT04vUkdGbmJQdnRCTDcyYU9LeWo4cE95SUZSZTZv?=
 =?utf-8?B?SGxvNjQ1QWJ3WVRXNDBHc0J6U2ZXTjI5TnF0ZFFFSStCZGZWVVlYd1dhcCtr?=
 =?utf-8?B?WHIvWG1VNUptNURTNDZYalg0ZkM4eWl1V3dWNDZWV2o3dFRhRTFrcEkxeWVL?=
 =?utf-8?B?TmtqMCtUckhlQXRGS0NWcDRBVnMxSVl3K2g0YzFnSEliY3lpK1k5OUpxMEpG?=
 =?utf-8?B?Q3VCOWxTajNjUHpwNDJINjQ4Wjh0anFJZVN1dEdRWnNzeFFseXQvV2tKVHZx?=
 =?utf-8?B?SjdUQ3JFQjQ2MjBUQ0tQMjl1MTVhNmRyN2RSeFNoKzd0T0J2cEdHQ3ZCMWhN?=
 =?utf-8?B?M1VKV0YxSnl2V1J5QWFlRHRrZ0hYaFJnazBoVEFDNVlsejdvWVRUN2RLa3JB?=
 =?utf-8?B?SW5NTldKcXhiK0dYRlF5d0xzVDc4RlJDNndnbmFrcXZGZEhLZk1kdEVQWnQ5?=
 =?utf-8?B?WXZwdmlZYnEvUzgwNFdCSjFCZnJHcmpBckR5UlpxZEFmWmlKdENrZE9uQlNM?=
 =?utf-8?B?UUpmdGlvQmhMYlA3QjhrZVYwR1h0Z0pEVjNNZjJrZmhPRlYxM1JwcTFzeHNC?=
 =?utf-8?B?V3Y5Z3hIMGMwV1J2UFF0U2YzdDNta2xkWjZ6bzNxRjB3RnRCVmowYjlNVlVK?=
 =?utf-8?B?MVNnT0ZSMVlXKzUxNWdsQVY5WXVqeE9TL3J2blpsRXdCVDNyWjdoaEJGZU1u?=
 =?utf-8?B?S21SbnBhT2tTSzdpMjdMcDFwMmhqdWF0R2txWFV6enQ4UzU4dDhKSUdodE9a?=
 =?utf-8?B?ckh3MDk5T1duYzdzekwwSTlSNFUxTGtGTUVnVFlJNU5SVGZyQ3o1WXpheFRK?=
 =?utf-8?B?azZwWXppTStlbXRocFlRSFNDTTZJUmV5cnNkU0g3OXlmdURPZmFoUkVyTUFZ?=
 =?utf-8?Q?1l7hDFLAyNIhSm9RpM/NNZ3Vb76rnOS64971Vbg?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4748024c-5055-437d-3fce-08d8ea0bb04d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2021 12:45:19.8376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X9/PXyQQnrwh/QoKoHzLgEaoIcHNn03sao3LA2rkI5RZfbg6Zfg8S/Q+8US2BrTxRJwmp5e3iDmVXTln7EePQJP56Z6ohbZQnkLGerpmeco=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5184
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 2021-03-07 10:22 a.m., Bartosz Golaszewski wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Add a recipe for python3-wpa-supplicant - a package allowing to talk to
> the wpa_supplicant over dbus using a convenient python API.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../packagegroups/packagegroup-meta-python.bb        |  1 +
>   .../python/python3-wpa-supplicant_0.2.bb             | 12 ++++++++++++
>   2 files changed, 13 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-wpa-supplicant_0.2.bb
>
> diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> index 635dee194..c8bb2020a 100644
> --- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> +++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> @@ -507,6 +507,7 @@ RDEPENDS_packagegroup-meta-python3-ptest = "\
>       python3-uritemplate-ptest \
>       python3-webcolors-ptest \
>       python3-whoosh-ptest \
> +    python3-wpa-supplicant \
>       python3-xlrd-ptest \
>       python3-xmltodict-ptest \
>       python3-xxhash-ptest \
> diff --git a/meta-python/recipes-devtools/python/python3-wpa-supplicant_0.2.bb b/meta-python/recipes-devtools/python/python3-wpa-supplicant_0.2.bb
> new file mode 100644
> index 000000000..a62ccb72f
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-wpa-supplicant_0.2.bb
> @@ -0,0 +1,12 @@
> +DESCRIPTION = "Python interface to the wpa_supplicant D-Bus interface"
> +HOMEPAGE = "https://pypi.org/project/wpa_supplicant/"
> +SECTION = "devel/python"
> +LICENSE = "MPL-2.0"
> +LIC_FILES_CHKSUM = "file://README.md;beginline=171;endline=199;md5=462586bcbebd12f5d0ac443be0ed3d91"
> +
> +SRC_URI[md5sum] = "c21c7841f5e03ff709a0564b2e094010"
> +SRC_URI[sha256sum] = "3ad0f40a696763bb0f4d4dec5b51f6b53ccfeb7c16ebb5897349303045f94776"
> +
> +PYPI_PACKAGE = "wpa_supplicant"
> +
> +inherit pypi setuptools3
> --
> 2.30.1
>
