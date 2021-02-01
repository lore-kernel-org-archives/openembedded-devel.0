Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.49])
 by mx.groups.io with SMTP id smtpd.web10.33802.1612186576782205754
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Feb 2021 05:36:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=bIKqTimI;
 spf=pass (domain: windriver.com, ip: 40.107.75.49, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VUIgGBZ6vp1ErCUuMW2LIlZnyBwhVHVrdeibzSfQ9zp5NIJmX0njuq9uRexIEsJzNMBXjdaskwHAmzBx4gcPp2CWVvgpWn3UY+p5NncxyeoqwoHIx8lwyCJS6bLC13FgdbHiE8gi+pBSuGoVeghKl9NT+HjVJ8dmvfHyiHhxKgb+hEhvZdNdBHZOz37XjWcZTqkRYfrUjtH/PDw4KLrFsT5Z06PT6g6ClmoIEOI8uuvLp0A14JTZfgoZPBCuXfKYxlKW4aKrnZNumdiRNIDyoSfXx7LHSkIEgJ8WiS53RFcxLxCLRalWOzJx5HpWzwLQdACOrouSeFabkvswhg4IVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KXIGaxzh+Csbvsl4Xy0GWukzI1t55zE7q8bXdAWdecU=;
 b=OJRiPmhZZNTRZIYFHIyYadsDVII6NEqHmqmE4tAIHP5WxWl9AOJj9Jdzwx4QYxr6I4HtiFY9GBhbRb4EFJVATQ38XrCoE+KNs0Gov4gC78w6cIt+1K0BFXUTr5kjjLcCV5nR+QXfb//59aQkdcyxxH5WZbMI8Hix3dUcuDN/4e8Bs2JT7hEAvdl98f2aK1vfVrChH2HGlZwNFkd427cScZqvR5H4Zyc5FcpoMxBi2n1JBaRB9HBXuk5Q/HCaSNE6ENMvqBQOHF1mwZky5jaSNh8/AbBiKkO+zXDQbeSSpsHnnki2Alr3UYLHr4LECOn0GqtwQ5QbA7p3WfkSNzD2dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KXIGaxzh+Csbvsl4Xy0GWukzI1t55zE7q8bXdAWdecU=;
 b=bIKqTimIpunl8Lp2JUOz1zCY4WMUiTfAnqF4azaiEB5fS9q91/1ePvbiECSYyTonTN/rKyGmmXn1d3wLk2r2x6BG7jTAsQ0yfCHVKQwcuQbDt2ZFFZLOoXA2aLYKXuG/gQeGbd3T7VrWTixKwnrzfj0kg/xu0pQ30whU9d7sLUQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4308.namprd11.prod.outlook.com (2603:10b6:a03:1b9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Mon, 1 Feb
 2021 13:36:15 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3805.024; Mon, 1 Feb 2021
 13:36:15 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-ruamel-yaml: add support for native and nativesdk
To: Peter Smith <salerio@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20210130115216.5875-1-salerio@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <32dc525b-58c1-b5f2-10ef-ab1dc7f5b9bf@windriver.com>
Date: Mon, 1 Feb 2021 08:36:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210130115216.5875-1-salerio@gmail.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN6PR1101CA0021.namprd11.prod.outlook.com
 (2603:10b6:405:4a::31) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN6PR1101CA0021.namprd11.prod.outlook.com (2603:10b6:405:4a::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend Transport; Mon, 1 Feb 2021 13:36:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eda17f3b-0ab1-4955-c697-08d8c6b658e9
X-MS-TrafficTypeDiagnostic: BY5PR11MB4308:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB430812A0A789C7C0390DFFB69FB69@BY5PR11MB4308.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NBEkTGuJvJAyp1vCI18lqeRoyLp+hrKOMhDWkhQd6jdT2YDBST+AARnMKT1yDSnE42u9D/J2FIhQqhQcAx/tPYBqI7yuv9hlrx1tSzgXqTw+7Q1jKLGCXsK9T23EAybwNhmya+loelYFR9ZtsPKv9FjkhdLGmnl2Y7gu7b3qKoLkkEegcF0fMal30cEZ9enHIGirXcGt7DDz1xunpUqEI6rVYwJ0VlRiwPEHDGSFtPI3o3QlosBWdkeRVpFrJMO7I2UGomDGV457n0TVEv2/LRk1fDAKeGdGUVnLkF7YIl8wA6etnkwUFaEY7zHyhpJ2u4oj521+g62FTes4nKkFp1gJFDbubyeOeYVxNMsbVDp+ye54xqUZ3gC2g9ycX2rqOK/Dhh8Oa6QhJjFoErxQStoID/CsV3+UDnFCVXFPn0lY68ttJWNdDlRSa0xaYSwdpV1VFWqulVMPMdGRBSGD+Z2M+kzdrsAqwHNNOwZprTIbF/wUzdTI/KREhERH49HlIhCqLFxJZ/agj+k/0qQhicH4nSs9ne02ODt/8qB7fiTVAZUEEEHXW3H8Xi+QDmAdLnN5v3k8oEKq3JxraIYRpby44bQXhPCvlfGFFTKLouCHqYg75NBzq5+frdeR0Hw7dxaSm0zYO7RpehZkMfP4uSpeTQ+aJXEzYiM+/ju/QHftFgs8hN5wOldcmA56Xb9f
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(136003)(376002)(396003)(366004)(5660300002)(316002)(478600001)(26005)(966005)(8936002)(53546011)(956004)(2616005)(186003)(44832011)(16526019)(166002)(86362001)(52116002)(2906002)(16576012)(66946007)(83380400001)(66556008)(66476007)(31686004)(6486002)(33964004)(31696002)(36756003)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?SWlmam5nUlh0ZzRXdnVQTzVKdnZ4bCtIdFdHdFhGTEVzRHBHWm1wTHVlYkJm?=
 =?utf-8?B?d0VlL29BRWtCZ0NHYmsxM3pvU204cUlBNmxRcjdINUlEN1RRczdhQ1VkZHBD?=
 =?utf-8?B?b3QwcXdtWFpIZUp2NXlDNVBpZXZhTG9sRTRXTjV0ZTBvUVVoczE1OXNnNWhS?=
 =?utf-8?B?NUgvbmprVk5ydEU1eXpWbjVGU1RzbHlINEo5dXdiM3MyZDFHQmhCQ09Qandl?=
 =?utf-8?B?Z29nbTlLVVpDcW5xendEVzZ2V3IzdEJibHVYSHdOb0ZtVExjVjFQK3NRQnNt?=
 =?utf-8?B?YTNzTndHS1JhQlY4b3dIMXFUMk91a1BQYzJVbElLQ3Bha2tGRi9TdW5WeCtY?=
 =?utf-8?B?TVB1YTNDa1k3NXYvbE50djZPd09KOWJwd2VsdDg1Rms4b3pHanJpU2M5R0xL?=
 =?utf-8?B?c1czS2VxcGdxTkozeUsyQ0tmeUdvUTJBaE1TMmdTMk11Sk4rcGFyVytMKzZV?=
 =?utf-8?B?MFdmOUNtcDFYMEVuWFc2K1NCVWE5c1ErVUc0TngrYmxKYWxqZlpYUElGekE2?=
 =?utf-8?B?ckNPNVV4MXluOHBycGV3NU9BNGZZOXplamFGTTFSaFk2QXpub0k1d0l6THlN?=
 =?utf-8?B?eXVHWndyWEFmNEFnZTd6cVVQc2VTaG5RTUlqUENPS25ML1A5M0txemI2TERj?=
 =?utf-8?B?RnZsaExVYXAvZ0tWN3JCekZEV0t4Vjc0UmlyY214TWUwTXEyaG1BY2pRdjlT?=
 =?utf-8?B?QW12NjdaUHpiVUx6VnhicGNqQUZoa3Q1eWRueVpQMWVRSUlhWEl5VWdFYUc2?=
 =?utf-8?B?N3kxZmUreGxZZDBoVStYeVZJQ0I2V3NUKzFaelhQOGNhQXFDQ2JaQnFpYm9X?=
 =?utf-8?B?a3duekFqUngzRGsyWUZPb3dpWFA3YjlQdUMrUnhDMm9MV2tRN0xZT3BZbUlJ?=
 =?utf-8?B?d3A3bUw5aVlQZlluNlM0QS9BRG9FU0lMTXhYZWJucDkrRjhaZnFiV0c0Smt5?=
 =?utf-8?B?QjBOUkRSYzZhYzR5SjdmZGgvb2xLTXhGdWVqVEtRVDdkL2U0bTMyZHR0ZFlZ?=
 =?utf-8?B?OWwwWkpVZUFHcjVpakdpeDVYd0srcjEvNGxQWStXUUpxbDUwVWZkaFpFL2dP?=
 =?utf-8?B?M2wxT3JtZVNSM1dIaDZzZm1NTk9neHRUWFFvdzRBT0ZyL2ltcTFObmU5UDd5?=
 =?utf-8?B?bUp2eXI4UFBheWJNWUtseXBlR0JjUUxCN3lLSW82a0s2UjdCRUlpN1YzbDNy?=
 =?utf-8?B?UEJiWTFSMC9GSXI4dEhPZkJMUURVTXNYNmxqYm5DdmRPb3Fsd05yRzhzSnl6?=
 =?utf-8?B?TlUvMnBhSCtKc2p5UUoxTDdwUzdPUTZqaVNtOGx4SGVMTmVxUUNDdTZ4cWo0?=
 =?utf-8?B?NjEwK3JpWnNsZkMzMlQyUFh5Q3YrWnk2a3NWamx2c3NkSGJDRXg0SEJFWWZO?=
 =?utf-8?B?eVpsQkRnZTNaU2NXbldaU281Y045ZHRnYWcrNjdpY1hTSm9DSlgwc01GRUVm?=
 =?utf-8?Q?CSTiLMQQ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eda17f3b-0ab1-4955-c697-08d8c6b658e9
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2021 13:36:15.2857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dEV9eG50E49ZUt6pUx2OzC0tWMB5faZFH1GjXc5o9XsBs/dW9HI8PWwmbyh0sDJRVoyLKMl4vB24ZzRj8/JnBg5riapGZXk5qddbtNYVMdU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4308
Content-Type: multipart/alternative;
 boundary="------------A084C40965CFCD225DF83BFA"
Content-Language: en-US

--------------A084C40965CFCD225DF83BFA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-30 6:52 a.m., Peter Smith wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> The recipe is missing the BBCLASSEXTEND so it has been added.
>
> Signed-off-by: Peter Smith <salerio@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python3-ruamel-yaml_0.16.12.bb      | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.12.bb b/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.12.bb
> index ec8545dae..406da80f4 100644
> --- a/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.12.bb
> +++ b/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.12.bb
> @@ -8,6 +8,8 @@ PYPI_PACKAGE = "ruamel.yaml"
>
>   inherit pypi setuptools3
>
> +BBCLASSEXTEND = "native nativesdk"
> +
>   SRC_URI[md5sum] = "c7e4b216d9554d80be42011b448b7c61"
>   SRC_URI[sha256sum] = "076cc0bc34f1966d920a49f18b52b6ad559fbe656a0748e3535cf7b3f29ebf9e"
>
> --
> 2.24.3 (Apple Git-128)
>
>
> 
>

--------------A084C40965CFCD225DF83BFA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-30 6:52 a.m., Peter Smith
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210130115216.5875-1-salerio@gmail.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

The recipe is missing the BBCLASSEXTEND so it has been added.

Signed-off-by: Peter Smith <a class="moz-txt-link-rfc2396E" href="mailto:salerio@gmail.com">&lt;salerio@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210130115216.5875-1-salerio@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python3-ruamel-yaml_0.16.12.bb      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.12.bb b/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.12.bb
index ec8545dae..406da80f4 100644
--- a/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.12.bb
+++ b/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.12.bb
@@ -8,6 +8,8 @@ PYPI_PACKAGE = &quot;ruamel.yaml&quot;

 inherit pypi setuptools3

+BBCLASSEXTEND = &quot;native nativesdk&quot;
+
 SRC_URI[md5sum] = &quot;c7e4b216d9554d80be42011b448b7c61&quot;
 SRC_URI[sha256sum] = &quot;076cc0bc34f1966d920a49f18b52b6ad559fbe656a0748e3535cf7b3f29ebf9e&quot;

--
2.24.3 (Apple Git-128)

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------A084C40965CFCD225DF83BFA--
