Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.65])
 by mx.groups.io with SMTP id smtpd.web10.10685.1592583586379355881
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Jun 2020 09:19:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Lwyx6NOv;
 spf=pass (domain: windriver.com, ip: 40.107.237.65, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K0IY9dUbx4YVFe1P3TV6lJSayVsX7azQAVt8a1+jRth9OZ12be0y0hQgTijTKbHau4aNtyVpL/u3L49pL9bNMDGIid4bhZBkeRKnZ6c1jAFFi+newj52pNQ1j0Zj6cSjEPDUM1ZqtZSHMh+mArEANdYgEwnBQRJHV4bFSSYHOc2lJ8g2nYlSxaa+bX6w+YVskSESdrEK/kv26PanD3MCIjl2Rq5flqkkWLTdVsOg8yWlvgMUefki0g+v3dA8W4Yxwvzkx+dhnEB6lI3NurGy8FY+gzw4J831m/VB/5hPTdvhCO5YHH8+QOu2GmuUZ7m4dT6Nw1vcCsSCL1BzHG6X0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r/R7GOYh8tKQyHdUogf41eu8w7n5HAeBhQTSVKg9OrU=;
 b=Ite5QVeIlwHzyK0DCalYj3hRK6U3ZQoV8Y2ktILN8WBUYQezSezhSC4M0fPEwq2F1bSUiJwujstzy9NKH0hgoO2beXHGi2baheAvwoF4pZe4OPk0UnxgUP7D0BDeZYrDoDVNoZ45/UVqmbI4JHTuiHB5O561nORJw13hH5n167IlqEfDV47q157FwyluxoBOaAVESKfqghN0c1GTitT/sHNp0s5KfKhcwH2CM35fXmBxck0XuVNYKL2+6DfAdFZL0JsawhGTmpeW2WTqR3QUHAsigDI/TnsxHfR768CD4hB81kvPKI614hu2YwlMpTfDFHlf3S5zZA8cTG+EYZZwzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r/R7GOYh8tKQyHdUogf41eu8w7n5HAeBhQTSVKg9OrU=;
 b=Lwyx6NOvsSbjWqYW4DEvA46roenL17oYEskq2cd7YMkzqSFAsuqXrEFrv8LCByi8pxqcrB2CbKEdZt8nJloQDhMBjqKL7oOaukA3dgeDP3wLGFHFJE0G9X9i3G61iGi97USxefhSCoXAB9gbPwGtLyrxpCzEUjZjz/lyou7k9yk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB0001.namprd11.prod.outlook.com (2603:10b6:405:69::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Fri, 19 Jun
 2020 16:19:45 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.021; Fri, 19 Jun 2020
 16:19:45 +0000
Subject: Re: [oe] [meta-python][PATCH 4/7] python3-huey: Add package
To: akuster <akuster808@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20200618152805.13075-1-akuster808@gmail.com>
 <20200618152805.13075-5-akuster808@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <aca2e46c-fdd8-f1d3-278a-dadd562d3ce4@windriver.com>
Date: Fri, 19 Jun 2020 12:19:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200618152805.13075-5-akuster808@gmail.com>
X-ClientProxiedBy: YT1PR01CA0142.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::21) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0142.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend Transport; Fri, 19 Jun 2020 16:19:44 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: daa0815d-d15b-44a2-62ef-08d8146c941a
X-MS-TrafficTypeDiagnostic: BN6PR11MB0001:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB00019E2EFCFCD7EB45A9F0589F980@BN6PR11MB0001.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:207;
X-Forefront-PRVS: 0439571D1D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OODayVk0XVxECiiwL5+wQA3BieGq9oXEfzlyYfRskO6dEwinfF5lYrblKVZHkWpVWolryXwADlrw11RVxwxIRSMrU0uYe/1mFwfsIfE2DfJP2X1foFadQcAc8oMQoPR4+PpCWIvt24vOzpixJio02TG9PXVwBw5QdOrquqT+6cy/RQaflF9M2KieZPkG7XnNZV5YdZpaIYumTFaZ3TncGFNC2Jfk+uVHUksnGkzD3MIquU2CevL5cdwfdX+KgltsOzYf8JODH1p5vI/Ca5nd02dfaNiSphezRI8m9b28lL9jlv7UJZKEceCZqfdHS78BSQ7ZRk0HNdrriM1VypLc/WJoOXXkhTgxqBojbpni5YmRz9Mek02VOonb7K0LligTl44fe6PZKflVDTYjCVDbuvhLLaZBu+a7S3THGaFJHxFaNUIwjl4cUy2+m2z+WtOiasXk5E+U8JJnYTp0uwV+mQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(39850400004)(366004)(396003)(376002)(346002)(5660300002)(31696002)(16576012)(316002)(478600001)(8676002)(8936002)(83380400001)(966005)(6486002)(16526019)(2906002)(166002)(36756003)(66946007)(66476007)(66556008)(31686004)(86362001)(2616005)(52116002)(53546011)(956004)(33964004)(186003)(44832011)(26005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	bijlcukPLaGW7IvYUoa5+FNRx+y4zdr0WiUVsUr7Y4j5BC7vk2eRENWRTbKjOgjSvgEn3aMybPyUsKFG07k6MTyk3MSr7C/Vz8uxFP3RooIgs0eRlL/HLcLEvzlKvneExhs0Iu1zW/Nwrqk+Eqnhr8oB7iE9bwgrgAd2tSdWBSLEPdBEgrTMvpNXarFkLbBdbISx9wgd7AfZdFmJXO7OXiEkz1K+aQUIRqBsjzCRlhTHAbD/U287JHNDntaUlAJGL8gfEFY132dkKsK/HB5l/PsHqdLbeGhoeWQeC846sZPG0yc6sI0Zb2j+M9lDCKvF/GKCJtrPV/0H7PoX1cDOEX4JjmGqYkqPscmyXMyqB0TsXtp+eYYYxJFeISUb1uj70w99ANXIWaeCRre4a4jNtwG0hGpYF/2rSrrhuVlA1x/75HiK1JEDaGqqAKBVn4SkUA/CULHFBxmjuG2xQxGkstUvIsLJHpqu2NhQjF+sFX9do9+w/bsRkKgo37sISVM+
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: daa0815d-d15b-44a2-62ef-08d8146c941a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2020 16:19:44.9176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wgsV6tn9VxMQs4cBqeOE8kKdusBmyjveq/ytaPle9sjeE4fqx3EcJJgEykUX9FRNlPOWaONk7Ix7HCoD08SH5i/XaSpNHBJn2M4nUCZS0F4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB0001
Content-Type: multipart/alternative;
 boundary="------------E133C8406ECECA50AACEB189"
Content-Language: en-US

--------------E133C8406ECECA50AACEB189
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/18/20 11:28 AM, akuster wrote:
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python3-huey_2.2.0.bb      | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-huey_2.2.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-huey_2.2.0.bb b/meta-python/recipes-devtools/python/python3-huey_2.2.0.bb
> new file mode 100644
> index 0000000000..cac6be9547
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-huey_2.2.0.bb
> @@ -0,0 +1,10 @@
> +SUMMARY = "a little task queue for python"
> +SECTION = "devel/python"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=5cac039fcc82f01141cc170b48f315d4"
> +
> +PYPI_PACKAGE = "huey"
> +SRC_URI[sha256sum] = "15cef4225f7ae200fbecf89a0fed13e389fd751d6c8e1d3b26562b7df953de0e"
> +
> +inherit pypi setuptools3
> +
>
> 

--------------E133C8406ECECA50AACEB189
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/18/20 11:28 AM, akuster wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200618152805.13075-5-akuster808@gmail.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Armin Kuster <a class="moz-txt-link-rfc2396E" href="mailto:akuster808@gmail.com">&lt;akuster808@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200618152805.13075-5-akuster808@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python3-huey_2.2.0.bb      | 10 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
 1 file changed, 10 insertions(&#43;)
 create mode 100644 meta-python/recipes-devtools/python/python3-huey_2.2.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-huey_2.2.0.bb b/meta-python/recipes-devtools/python/python3-huey_2.2.0.bb
new file mode 100644
index 0000000000..cac6be9547
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-huey_2.2.0.bb
@@ -0,0 &#43;1,10 @@
&#43;SUMMARY = &quot;a little task queue for python&quot;
&#43;SECTION = &quot;devel/python&quot;
&#43;LICENSE = &quot;MIT&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=5cac039fcc82f01141cc170b48f315d4">&quot;file://LICENSE;md5=5cac039fcc82f01141cc170b48f315d4&quot;</a>
&#43;
&#43;PYPI_PACKAGE = &quot;huey&quot;
&#43;SRC_URI[sha256sum] = &quot;15cef4225f7ae200fbecf89a0fed13e389fd751d6c8e1d3b26562b7df953de0e&quot;
&#43;
&#43;inherit pypi setuptools3
&#43;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------E133C8406ECECA50AACEB189--
