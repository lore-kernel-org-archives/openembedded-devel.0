Received: from NAM04-CO1-obe.outbound.protection.outlook.com (NAM04-CO1-obe.outbound.protection.outlook.com [40.107.69.80])
 by mx.groups.io with SMTP id smtpd.web12.37076.1595250377434068478
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2020 06:06:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=GNol9lTg;
 spf=pass (domain: windriver.com, ip: 40.107.69.80, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DWJhrGOW1x7IisANmFwitbQu6l9L38L0lEHUFh5a8J9gD5CGUm7HSNnYvQnwyuPqXFSYHYMuYnt2hcbIkA/rWUtIh1Z5AvcqR4JS22dfryWMF5R4bI/z6dgcKE1jV/Z4IijrsT7fn/qP4M1L5KkmT2GxxaxP+3Xv8CymQog+WBaZ++NKxQxQrDToZL832SE0FCj4dELzugT9z3rEI3gdVu2kRI9pXTyswGmUg0f9DVLYTug/lptB9wn/0ClQIFmPvTshc100y23RH5/WJf8KBjNS/hRG4cJdlvFXWqDcvJ12rXn07EiALP9QvBfkYK/dHHMwp4Lts4LxdwGF9Osy4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OkbJIrODnsSiga2KUQmeT9VNL1U7nmoRicR6p+G9R5s=;
 b=d7C0z6UHICfFjq1KhpWbTaP/iJpD1CQimh6s9lOpqFH2MdCKolmUQnWWJxhDiCKH8aXC5zG6NF/Ygo0WOIOncprWobVQDrAcHKScnR6zkbR7sjtiwlOyfJyelXHFdcnSsNJmYP0x6/32WKo6LqsqwxY2DU8EOABrnF7aoqwr6AuHaEVmSK2yWDsbchcXYFZcqb4veCsMJwvHEEg0ykrUnzltZVnBWW/zi4v0cfk2/mvMyercW+iZbJ/J0oO0n80Ci90I8XkSqzAPRfgHOIMZsUu9wAth5+5BJfQ1VlQdLHVX11OLFeKihd9JZnDeH4IQkqbOpC/jobI+4Y5ZQRePIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OkbJIrODnsSiga2KUQmeT9VNL1U7nmoRicR6p+G9R5s=;
 b=GNol9lTgI4ZEVUjwXZSWMjUWrocHfKCglfgZv5XF8ne+zO7JIK9wpbsQa6yaoYWrl+XVYvEW+8c3H+JcC9VGU8RYkCkr7KeCa+xLDyMknF6ORxxygN158zvr7AHQPNW9pCo+b3v2SJqABAgp/eHUI/ovtjfRj61vdwBfu+c71Jo=
Authentication-Results: xevo.com; dkim=none (message not signed)
 header.d=none;xevo.com; dmarc=none action=none header.from=windriver.com;
Received: from CY4PR11MB0006.namprd11.prod.outlook.com (2603:10b6:910:7b::18)
 by CY4PR1101MB2120.namprd11.prod.outlook.com (2603:10b6:910:1e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.24; Mon, 20 Jul
 2020 13:06:16 +0000
Received: from CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4]) by CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4%7]) with mapi id 15.20.3195.025; Mon, 20 Jul 2020
 13:06:16 +0000
Subject: Re: [oe] [meta-python][PATCH 2/2] python3-pint: add missing python3-packaging dep
To: Ryan Rowe <rrowe@xevo.com>, openembedded-devel@lists.openembedded.org
Cc: jbroadus@xevo.com
References: <20200716231839.48850-1-rrowe@xevo.com>
 <20200716231839.48850-2-rrowe@xevo.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <848d27a9-24f8-1a0b-eb94-5908fb5b842c@windriver.com>
Date: Mon, 20 Jul 2020 09:06:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200716231839.48850-2-rrowe@xevo.com>
X-ClientProxiedBy: YTBPR01CA0016.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::29) To CY4PR11MB0006.namprd11.prod.outlook.com
 (2603:10b6:910:7b::18)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTBPR01CA0016.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18 via Frontend Transport; Mon, 20 Jul 2020 13:06:15 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a83fc52d-767b-4500-fff3-08d82cadafab
X-MS-TrafficTypeDiagnostic: CY4PR1101MB2120:
X-Microsoft-Antispam-PRVS: 
	<CY4PR1101MB2120117FEDE66423BD074A739F7B0@CY4PR1101MB2120.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oAw3sae4IYDf7NdtEznsJqfe6ipUPxaZcJ9V5rJISUP951IHBrOoY4LRiU0XhPd/kcz0hmoVjQXH8e47SQRq+LbvXsgdTYaK5yr0S14e/bvHdAGS6bYKlX2BGwbuJs6/2OEotwu91z6cZH4MooPeXXSOueq0py8Z51B+kD1wb2ZwDejBR0hCcuqEBfY5VZQOuDRaQ8mcJM8BB0R3aqGoCt+a3ijbRZ3NZZHnxa8mdrpTMA3H3qv07Sc1LN0AXOF74/uQAQrbh50/INuQhv5RBAikm08+LQJrC4KMB/dvYSk8KnfSoC9LFrsGxGmL2u0U3PvcmtzPfmrOJfjo0OtRN3t3EyDK0IhLyYDLo70BYw+amn2wLNOSHMKzcM73hjyt/XI30mTNZbfCU5fKI1QlY7JwxeLCd1ksKCPukFr5Nnd5XMmYj2noukf3mAxvGGu3hClzId1hcoXqg8kVbuBXhw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB0006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(366004)(376002)(39850400004)(346002)(396003)(86362001)(36756003)(16576012)(316002)(5660300002)(2906002)(6486002)(66476007)(66556008)(478600001)(26005)(186003)(16526019)(8676002)(53546011)(966005)(44832011)(33964004)(8936002)(66946007)(52116002)(31696002)(956004)(83380400001)(2616005)(166002)(4326008)(31686004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	kKXjPuXSBjH72M1wZroYh2ydDxhoHE6F61MJd8fMfi9EAqMH0be8zZU2ZVdEaJDUDVu/tmCMOHM80E9mPY9jromrTrtBBwSHueQNO7waRbErttmd4ZIToSXI8UDz/4a2W/DAn5yuKp0tmn1gI0jSroYe5ggq3xUW2sdXI35qVhnX4jT1XUWFUEb9eT8VvNbvCULGAEVQk2eBRfWg0cJQkaB5g4OyNk4onz31+ljyX4B0eni8hX5WcpV0UxOyzgN3TyS8+4zJXgNKjoLkgkIun2s4HM8zUgwjyFj42/u7mvKdJRDJL/45SgUOgWTOKA+hBpFurS770es/rncmBRpcKyHWvRKV0m3mR269SLcxEjVszjX0Yjb16N+KT4FWNMl9bc3DhSwcr+PYgiIjRUkEGSk/Apmel6YYpG4+ZV/7EFW6WdnO4KuERNbn4REcCL1FayRcrI3mHfEm16gc6/c4JBxLnxKoKP8nVBrk5ekol8eeOtPDdmOzzWl+MJEe/8Ha
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a83fc52d-767b-4500-fff3-08d82cadafab
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB0006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2020 13:06:16.3063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tzmeBXK6YsmLOKnST1qzgPfvgMYVr3p6/hvzOl/RGGo+xFZEs+99RAhZy0DTVvbZJHqnKU32NzSsifKBqMw9MLZ1yBeKzA4pw6a+ps3Z4ds=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2120
Content-Type: multipart/alternative;
 boundary="------------0EE185A30B7D7C2722668469"
Content-Language: en-US

--------------0EE185A30B7D7C2722668469
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 7/16/20 7:18 PM, Ryan Rowe wrote:
> Signed-off-by: Ryan Rowe <rrowe@xevo.com>

I get the following when I build an image and test the import:

 >>> import pint
Traceback (most recent call last):
   File "<stdin>", line 1, in <module>
   File "/usr/lib/python3.8/site-packages/pint/__init__.py", line 28, in 
<module>
     from .registry import LazyRegistry, UnitRegistry
   File "/usr/lib/python3.8/site-packages/pint/registry.py", line 49, in 
<module>
     import pkg_resources
ModuleNotFoundError: No module named 'pkg_resources'

Would you mind re-submitting this patch and adding 
${PYTHON_PN}-setuptools to the RDEPENDS?

Trevor

> ---
>   meta-python/recipes-devtools/python/python3-pint_0.14.bb | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pint_0.14.bb b/meta-python/recipes-devtools/python/python3-pint_0.14.bb
> index 8e1630476..ab8b4d74d 100644
> --- a/meta-python/recipes-devtools/python/python3-pint_0.14.bb
> +++ b/meta-python/recipes-devtools/python/python3-pint_0.14.bb
> @@ -21,6 +21,10 @@ SRC_URI += " \
>   	file://run-ptest \
>   "
>   
> +RDEPENDS_${PN} += " \
> +    ${PYTHON_PN}-packaging \
> +"
> +
>   RDEPENDS_${PN}-ptest += " \
>   	${PYTHON_PN}-pytest \
>   "
>
> 

--------------0EE185A30B7D7C2722668469
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/16/20 7:18 PM, Ryan Rowe wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200716231839.48850-2-rrowe@xevo.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Ryan Rowe <a class="moz-txt-link-rfc2396E" href="mailto:rrowe@xevo.com">&lt;rrowe@xevo.com&gt;</a></pre>
    </blockquote>
    <p>I get the following when I build an image and test the import:</p>
    <p>&gt;&gt;&gt; import pint<br>
      Traceback (most recent call last):<br>
      &nbsp; File &quot;&lt;stdin&gt;&quot;, line 1, in &lt;module&gt;<br>
      &nbsp; File &quot;/usr/lib/python3.8/site-packages/pint/__init__.py&quot;, line
      28, in &lt;module&gt;<br>
      &nbsp;&nbsp;&nbsp; from .registry import LazyRegistry, UnitRegistry<br>
      &nbsp; File &quot;/usr/lib/python3.8/site-packages/pint/registry.py&quot;, line
      49, in &lt;module&gt;<br>
      &nbsp;&nbsp;&nbsp; import pkg_resources<br>
      ModuleNotFoundError: No module named 'pkg_resources'</p>
    <p>Would you mind re-submitting this patch and adding
      ${PYTHON_PN}-setuptools to the RDEPENDS?</p>
    <p>Trevor<br>
    </p>
    <blockquote type="cite" cite="mid:20200716231839.48850-2-rrowe@xevo.com">
      <pre class="moz-quote-pre" wrap="">
---
 meta-python/recipes-devtools/python/python3-pint_0.14.bb | 4 &#43;&#43;&#43;&#43;
 1 file changed, 4 insertions(&#43;)

diff --git a/meta-python/recipes-devtools/python/python3-pint_0.14.bb b/meta-python/recipes-devtools/python/python3-pint_0.14.bb
index 8e1630476..ab8b4d74d 100644
--- a/meta-python/recipes-devtools/python/python3-pint_0.14.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-pint_0.14.bb
@@ -21,6 &#43;21,10 @@ SRC_URI &#43;= &quot; \
 	<a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
 &quot;
 
&#43;RDEPENDS_${PN} &#43;= &quot; \
&#43;    ${PYTHON_PN}-packaging \
&#43;&quot;
&#43;
 RDEPENDS_${PN}-ptest &#43;= &quot; \
 	${PYTHON_PN}-pytest \
 &quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------0EE185A30B7D7C2722668469--
