Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.82])
 by mx.groups.io with SMTP id smtpd.web12.199.1590595068614787573
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2020 08:57:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=R7jjgEiZ;
 spf=pass (domain: windriver.com, ip: 40.107.237.82, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l4Pu8t0+qR19IyQiFF9SUR9Ag4CdZIC2dlr1sCP03B61V/Xdz42zhXzh9gcLSEZl9BBVktPhZ8EPYsNArUPeUUu2anFGb0jQetSu3+C0QOq6JoScz7w/sBcFdpM4BPmS5BGsJjWICWHEGLGDTbbS37uxXRmen5j6Ti89M/JnfmtY8m5JLiTAzSyAc0mGUAcM+Oo4DNEGCu98dsWtemrYalQCuGl6LG1mLvMt+YEsmBPq4CjkZ1j/jcD0IuCu1vNvEYqUumQTHqaRdIDOwRt0BnfUU5OBIedSbCnnRLoiQOIvTNkTvoiOhuyiE4X5TDGoP7rlZhnW23O1edwTo7dVyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LB6ZStbyAOGNpme6Aq5KLKWgmGnb5d8tW+CahiQIzJs=;
 b=n3SD6JF1ctEucucqnItltQmJrIZk6JtSDPW9ybbkrOzolG0xVVGR45ffKpK27ChtqNKorxc+/TwdxjEm7n2xYuD145EcpPJpmxZYm1cNpQB0lA5Izjeqwzuze01gTp72o8hVlMl2KvhrrUPej6HvjfcC0ByTHfwGQ8OYN0bXGH3+gak37F5ITsr+kVGoUO/KmbMQYgfqPbAzD6W6KnB/86h+riqSFNqJSEgACJ5bPkLJozPh2RUVMxQJEWvf/TwDvrlswIP7194l8mTuzRDBrmHoNsxrazqcaH570+T38ry7zi+eNFpeBDZZ2L/KzYAQWa6yxqk4L5PgwQyVCuxFfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LB6ZStbyAOGNpme6Aq5KLKWgmGnb5d8tW+CahiQIzJs=;
 b=R7jjgEiZbDZYr1zY/LUacq3HvjNyd0tjYZc3jlOIEOuwXpAlR9GszMSX40CmAIB4xQkchzZOo2PQvgOPZgzvvTlXik0LnyzH65qgQVfazm+LsYrI6kGXzcNgVApvui/VklOsqSps2LlR/XN50dvGQbOIfYWpw1qm3/YCUh4CBFc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1316.namprd11.prod.outlook.com (2603:10b6:404:3c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Wed, 27 May
 2020 15:57:47 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3045.018; Wed, 27 May 2020
 15:57:47 +0000
Subject: Re: [oe] [meta-oe][PATCH 4/4] python3-pytest-asyncio: Update 0.10.0 -> 0.12.0
To: Domarys Correa <domarys.correa@ossystems.com.br>,
 openembedded-devel@lists.openembedded.org
References: <20200526192011.17024-1-domarys.correa@ossystems.com.br>
 <20200526192011.17024-4-domarys.correa@ossystems.com.br>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <e6ab11b8-e1d5-984a-3ff0-274d71629d89@windriver.com>
Date: Wed, 27 May 2020 11:57:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200526192011.17024-4-domarys.correa@ossystems.com.br>
X-ClientProxiedBy: YTBPR01CA0019.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::32) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTBPR01CA0019.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.18 via Frontend Transport; Wed, 27 May 2020 15:57:46 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44396656-be57-43c4-6cd8-08d80256b350
X-MS-TrafficTypeDiagnostic: BN6PR11MB1316:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB13161138E29B458B6868D3759FB10@BN6PR11MB1316.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:546;
X-Forefront-PRVS: 04163EF38A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0qLbxIDWSXN+KNFtEjLQ1dW4ozdOJbywLmcQir9VO971UHQDGttLeoq6wy+MxXzS5j2pBhh9Ml6tkv0gyXNSXiXDuGWvRYN5vlg9PJYpR5hIRIzvD75e03CIeQsAmoITZA+9klxoNQ31iIsr7ISQaJC4yUDVhSZU5E6cTje66J6TL8sZm5+mOo4RlzDTAGI61wwTdsC3FAtkPdlT2VvzND6BXBOdBabIATgkvnmQVtdouvpWOM/XmjwFrMviTh0Orj7IXi65cNAiHS0nASenRVwdoc81JmvO7v20zJ5dciL4vqnX6674/W81Fgm/U8Fu8LLYZb97wHerICvNevIs5a4AK82mMk4AXq92zYJK9GCNzCyDgQLpPwn3p5wvnTLNLwVz82ur3P5Xh8RVhJm4VrmSB5+5qcwyhSWdn4yhq4L8n3qChku42ph8S2JmfeGczvDHizpZmipNEwNog5xzTA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(376002)(136003)(396003)(39850400004)(366004)(8936002)(31696002)(36756003)(15650500001)(478600001)(66556008)(83380400001)(86362001)(5660300002)(66946007)(66476007)(966005)(53546011)(31686004)(44832011)(2616005)(956004)(6486002)(8676002)(166002)(316002)(16576012)(16526019)(2906002)(186003)(52116002)(33964004)(26005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	bQPrFjWbO/Ptlj0kOCaInsWuTOHg2a1OlJosE1JA+rk4tox8OmZH6epeQ2X9M7YRjx4N0AtVOXPqtd109oQoCdgU6arYYbxL+nFwvygqmewSDDGpgeAS6YD1D88bLR0k5p595SvJQM0N2bLlvM1lDEZ8Cywx9rTWxUGCiLJY5xeJ0Co7t+lUlHimOn1sOegfAhBIq4ivo+kad+8P7UisKi5/X9PDk+rlLdSQk/1qmtfpfpMQZLaTALHiNzz3NXCsYsFKQoUtom6FsTfi68BHIaPTJ27Dg4+bPfbu+sQERH26YPR16a525LOm+SruH0rOYFE8jbHblRtvwuJeuG+mCXJTMn5JD/DiwnxyL+nqqkBINqBGjIIWOBjcY4zeXfGA2QwSN53E74ZuGfyClNX5a0CZk79p/OR+urBCuDcPWZc2NJ4Gl1Nco2EYxeiRqVScevw4To+6LvBmG5R9nhhFiM+SCzrcplfO3YcvnuPgqpteYuyIW+muzM7vvLRrsrNg
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44396656-be57-43c4-6cd8-08d80256b350
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2020 15:57:47.3038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SA4jGCs16gXfgQlneB2sEz+jdhbkvJmomCKWuXLY1k1i6anHZgvWAUj68YypRp7P1hTiEeIKxWQifYc6kA66ekT6an4XqOmj76NmTTteOkc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1316
Content-Type: multipart/alternative;
 boundary="------------88B68C1AF99CE5A0FBDF0F64"
Content-Language: en-US

--------------88B68C1AF99CE5A0FBDF0F64
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/26/20 3:20 PM, Domarys Correa wrote:
> Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-pytest-asyncio_0.10.0.bb        | 13 -------------
>   .../python/python3-pytest-asyncio_0.12.0.bb        | 14 ++++++++++++++
>   2 files changed, 14 insertions(+), 13 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python3-pytest-asyncio_0.10.0.bb
>   create mode 100644 meta-python/recipes-devtools/python/python3-pytest-asyncio_0.12.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.10.0.bb b/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.10.0.bb
> deleted file mode 100644
> index a7e963b04..000000000
> --- a/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.10.0.bb
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -DESCRIPTION = "pytest-asyncio is an Apache2 licensed library, written in Python, for testing asyncio code with pytest"
> -HOMEPAGE = "https://github.com/pytest-dev/pytest-asyncio"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://README.rst;md5=ae62268d207c73b615fbefddaf91a881"
> -
> -SRC_URI[md5sum] = "247a7ec32f24a185341327c42a0f85bf"
> -SRC_URI[sha256sum] = "9fac5100fd716cbecf6ef89233e8590a4ad61d729d1732e0a96b84182df1daaf"
> -
> -inherit pypi setuptools3
> -
> -DEPENDS += "${PYTHON_PN}-pytest-native"
> -
> -BBCLASSEXTEND = "native"
> diff --git a/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.12.0.bb b/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.12.0.bb
> new file mode 100644
> index 000000000..d83c42de3
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.12.0.bb
> @@ -0,0 +1,14 @@
> +DESCRIPTION = "pytest-asyncio is an Apache2 licensed library, written in Python, for testing asyncio code with pytest"
> +
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://README.rst;md5=3faed73a08162b5b5367cdcaee996f75"
> +
> +SRC_URI[sha256sum] = "475bd2f3dc0bc11d2463656b3cbaafdbec5a47b47508ea0b329ee693040eebd2"
> +
> +inherit pypi setuptools3
> +
> +RDEPENDS_${PN} += " \
> +    ${PYTHON_PN}-pytest \
> +"
> +
> +BBCLASSEXTEND = "native nativesdk"
>
> 

--------------88B68C1AF99CE5A0FBDF0F64
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/26/20 3:20 PM, Domarys Correa
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200526192011.17024-4-domarys.correa@ossystems.com.br">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Domarys Correa <a class="moz-txt-link-rfc2396E" href="mailto:domarys.correa@ossystems.com.br">&lt;domarys.correa@ossystems.com.br&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200526192011.17024-4-domarys.correa@ossystems.com.br">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-pytest-asyncio_0.10.0.bb        | 13 -------------
 .../python/python3-pytest-asyncio_0.12.0.bb        | 14 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
 2 files changed, 14 insertions(&#43;), 13 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pytest-asyncio_0.10.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-asyncio_0.12.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.10.0.bb b/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.10.0.bb
deleted file mode 100644
index a7e963b04..000000000
--- a/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.10.0.bb
&#43;&#43;&#43; /dev/null
@@ -1,13 &#43;0,0 @@
-DESCRIPTION = &quot;pytest-asyncio is an Apache2 licensed library, written in Python, for testing asyncio code with pytest&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/pytest-dev/pytest-asyncio">&quot;https://github.com/pytest-dev/pytest-asyncio&quot;</a>
-LICENSE = &quot;Apache-2.0&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://README.rst;md5=ae62268d207c73b615fbefddaf91a881">&quot;file://README.rst;md5=ae62268d207c73b615fbefddaf91a881&quot;</a>
-
-SRC_URI[md5sum] = &quot;247a7ec32f24a185341327c42a0f85bf&quot;
-SRC_URI[sha256sum] = &quot;9fac5100fd716cbecf6ef89233e8590a4ad61d729d1732e0a96b84182df1daaf&quot;
-
-inherit pypi setuptools3
-
-DEPENDS &#43;= &quot;${PYTHON_PN}-pytest-native&quot;
-
-BBCLASSEXTEND = &quot;native&quot;
diff --git a/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.12.0.bb b/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.12.0.bb
new file mode 100644
index 000000000..d83c42de3
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.12.0.bb
@@ -0,0 &#43;1,14 @@
&#43;DESCRIPTION = &quot;pytest-asyncio is an Apache2 licensed library, written in Python, for testing asyncio code with pytest&quot;
&#43;
&#43;LICENSE = &quot;Apache-2.0&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://README.rst;md5=3faed73a08162b5b5367cdcaee996f75">&quot;file://README.rst;md5=3faed73a08162b5b5367cdcaee996f75&quot;</a>
&#43;
&#43;SRC_URI[sha256sum] = &quot;475bd2f3dc0bc11d2463656b3cbaafdbec5a47b47508ea0b329ee693040eebd2&quot;
&#43;
&#43;inherit pypi setuptools3
&#43;
&#43;RDEPENDS_${PN} &#43;= &quot; \
&#43;    ${PYTHON_PN}-pytest \
&#43;&quot;
&#43;
&#43;BBCLASSEXTEND = &quot;native nativesdk&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------88B68C1AF99CE5A0FBDF0F64--
