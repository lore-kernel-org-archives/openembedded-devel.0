Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.57])
 by mx.groups.io with SMTP id smtpd.web10.10034.1593184895035938345
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jun 2020 08:21:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=asWjOHNY;
 spf=pass (domain: windriver.com, ip: 40.107.77.57, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OtHC9t9k8XlGlyOzcz38IWGzmOFF3euf5wtwj8/oiA8wSAmbCXG3keZIwYzltI/x6v7/nZvm/yuh8K6eKfWpoUvD8VP4Qj2LoPuxT+pzIG2Gtpprw0Ol4+BO9Vx4sGHv64wpVfzv6Pz5nHBt8DiePXJkB2Zc21Qay1Oe9YKCf7pj6vi3FcctZwRUdefxHZVMWsWUvHCQvdiYk56rPypm6xJJWFfRChHBCDwwz38UAnzTPbbalkvcnR3YW2Nr9Zt/EJ36vlZSVUD75eErgoMtxDWdCbKKmUAXuaWy/KcKMiCjMYvIqj0pT1E5a+HD//VRFyZcNIPL4iM5V0yYNpKiYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0zAoPBIhtQMnNvT2+Yq9BNxXzXJValgBC38cJBVhB+g=;
 b=aYzj965dqzUvx3O47DBeLit9ITKCYVuMQxx1Eed+t6jsvvHwUop3oVtIG40doSeOfsCVRZ3BB+jrlG+U4cgiuLrmjtPMDCfyOV+2vDvXXGLWcMWmlcjKy7+eDVH/X4c8mXapJHywE7aUZnlUVXMlwcdb4IIGSrDbWWRor0TP/78WL2myQIBx8hV72wlXOX9V5vzY7WuK5UM3ehwpsUJ/e5BdHSXI6pMZHe0XCLAUOkFo5a2ZK3jNq1mrvz19L9aADHdJifFGGIX9A4za+b3lMK0o7VFKkeBBRgDqixIXMHmx7TdE0gtSDc5fiZW+5tG6iCoAStNmnctUdcZBMGlcCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0zAoPBIhtQMnNvT2+Yq9BNxXzXJValgBC38cJBVhB+g=;
 b=asWjOHNYrpdrcqS7NS3daeN/mAjChB+/4+nhT2S0BNlQydGtVlJV38/k192AAfsTmVIKBwR7ktyQ9GT6bB2bkQvuUWlJFLeAHh7FyLsoWOpYfrWeibBh+J6W5gs1PZVGWff1m59nDKOOaMMYO5POx5XCJbYexHohxRiu8ge+EgA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB3953.namprd11.prod.outlook.com (2603:10b6:405:7f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.24; Fri, 26 Jun
 2020 15:21:33 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3131.025; Fri, 26 Jun 2020
 15:21:33 +0000
Subject: Re: [oe] [meta-python][PATCH 04/10] python3-pyrsistent: Upgrade 0.15.7 -> 0.16.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200622103542.27830-1-leon.anavi@konsulko.com>
 <20200622103542.27830-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <65e55483-d26c-11ca-5f4d-09657c52c430@windriver.com>
Date: Fri, 26 Jun 2020 11:21:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200622103542.27830-4-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0029.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::42) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTXPR0101CA0029.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::42) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend Transport; Fri, 26 Jun 2020 15:21:33 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39f2dc7b-36ac-4682-6412-08d819e49c10
X-MS-TrafficTypeDiagnostic: BN6PR11MB3953:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB3953B75F3EC19A07F07510799F930@BN6PR11MB3953.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:397;
X-Forefront-PRVS: 0446F0FCE1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2ZsnHtdWtSd5YfdgiBh7nhsxaL8SQSZJqgj4N2OSK0UQu7hiffCgvzDXo4iL6vPk3MdlcDSah8EF6L2ZYmp3h3QGSNV9LOH95d0FdXBJX7RCUQaSOUgnmqRrr9c/RjmXFcLOU6Da+N9VtYBTkpf178P9NYJ0/l5I8hv99WiskoIMAK7kRzPh1SL0tDRw7ho40VjE2+r+H/60d6zni7veF5nV4gcBlxv+92nW9jgFMj9Psyzze2eBXEzaFygG9NDObLi8MBeVSEFmqQNHyyFg3V7I++isiz7l1Yy5SL2RVjeRt+1B9eFS2JueC8n5dH8ueWvm7tG1Vyekjbl/yH1hz2DCvJbEd0JOwaasL9dPWUByhckb3Wsx1cL8GpbMSaXEoCBpn6r9OjHrW/fabqI054nhEQdjvz/sYFyYbOzuSJ+kcI15KG2ruxx5ou//KRx+LWcy9FGAPhePi1PsGWoA6Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(396003)(136003)(346002)(376002)(366004)(316002)(166002)(16576012)(2906002)(956004)(83380400001)(31686004)(8676002)(31696002)(8936002)(478600001)(966005)(36756003)(52116002)(53546011)(26005)(44832011)(2616005)(186003)(6486002)(16526019)(33964004)(66556008)(66476007)(5660300002)(86362001)(66946007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	8SA0zlQ4giSBu0NoYQTHs/0o4WloGL0tEu26tISP1fVn+BsNTFsercpxaeUwqFW4uMBnk7I244J17zEPYANeueTaC/ED8W32gw1p51/R1xi0bbQrXq74ufBK/DtLMB8bOPbP+YcBXt4/0I1j5fUzHL5EzsVeLdghEEIkGgCNmrPsx5IwjBXf+uAO6AfjwuY5mU6SZ0fXWTY7ckjbgFNwJgTvaeuyeinYPX+nPDrlZcfd7dZ8Xg37nhWLPMe1sK3i3sC0YhpKywIjIN0dGCRgBNezJYeGgfGusw6ZpHrUj3t4PqXSFPfAP+93u8pePwQVsbHCUdd7AUFlmrda+gEGyg1lc+mjKwaAcDLAcFiPF54io9gEWAXTb4PuXRf67oQAXGZnvbA5flXSRUCR8p5SxNgZkKmTe/UMhNXB4bkYkF44B22pjWNOCNIymSnhHkESd4pBTCffQy5lnKJ7TdivIE410nHM47WHlURYDDxuyroolCt/EFfqsLAohwIfpyEr
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39f2dc7b-36ac-4682-6412-08d819e49c10
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2020 15:21:33.6971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dMZxjtMq+yNCQzYFjnT+6iKUugbHmMy3+3LDG5ziWd3UvQZZ128DLxrg/3LOjJSRQ1tLaK027ISqz8N6VjTO32ANcLCC77Jl+4jKNzy6H/I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3953
Content-Type: multipart/alternative;
 boundary="------------A4543B56BA1B4AB10CB5873D"
Content-Language: en-US

--------------A4543B56BA1B4AB10CB5873D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/22/20 6:35 AM, Leon Anavi wrote:
> Upgrade to release 0.16.0:
>
> - No major updates but Python 2 support no longer guaranteed.
> - Fix #192, 'ignore_extra' for 'pvector_field'.
> - Fix #191, include LICENCE in distribution.
> - Fix #190, minor MyPy errors.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...hon3-pyrsistent_0.15.7.bb => python3-pyrsistent_0.16.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pyrsistent_0.15.7.bb => python3-pyrsistent_0.16.0.bb} (71%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pyrsistent_0.15.7.bb b/meta-python/recipes-devtools/python/python3-pyrsistent_0.16.0.bb
> similarity index 71%
> rename from meta-python/recipes-devtools/python/python3-pyrsistent_0.15.7.bb
> rename to meta-python/recipes-devtools/python/python3-pyrsistent_0.16.0.bb
> index 53251aa55..dec661143 100644
> --- a/meta-python/recipes-devtools/python/python3-pyrsistent_0.15.7.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyrsistent_0.16.0.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/tobgu/pyrsistent"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENCE.mit;md5=ca574f2891cf528b3e7a2ee570337e7c"
>   
> -SRC_URI[md5sum] = "da9486d00ef5b213f40d5cf3c5bca82d"
> -SRC_URI[sha256sum] = "cdc7b5e3ed77bed61270a47d35434a30617b9becdf2478af76ad2c6ade307280"
> +SRC_URI[md5sum] = "4ba30da6f0a63554e70ac6c4c1904929"
> +SRC_URI[sha256sum] = "28669905fe725965daa16184933676547c5bb40a5153055a8dee2a4bd7933ad3"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------A4543B56BA1B4AB10CB5873D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/22/20 6:35 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200622103542.27830-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.16.0:

- No major updates but Python 2 support no longer guaranteed.
- Fix #192, 'ignore_extra' for 'pvector_field'.
- Fix #191, include LICENCE in distribution.
- Fix #190, minor MyPy errors.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200622103542.27830-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...hon3-pyrsistent_0.15.7.bb =&gt; python3-pyrsistent_0.16.0.bb} | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyrsistent_0.15.7.bb =&gt; python3-pyrsistent_0.16.0.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-pyrsistent_0.15.7.bb b/meta-python/recipes-devtools/python/python3-pyrsistent_0.16.0.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-pyrsistent_0.15.7.bb
rename to meta-python/recipes-devtools/python/python3-pyrsistent_0.16.0.bb
index 53251aa55..dec661143 100644
--- a/meta-python/recipes-devtools/python/python3-pyrsistent_0.15.7.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-pyrsistent_0.16.0.bb
@@ -3,8 &#43;3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/tobgu/pyrsistent">&quot;https://github.com/tobgu/pyrsistent&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENCE.mit;md5=ca574f2891cf528b3e7a2ee570337e7c">&quot;file://LICENCE.mit;md5=ca574f2891cf528b3e7a2ee570337e7c&quot;</a>
 
-SRC_URI[md5sum] = &quot;da9486d00ef5b213f40d5cf3c5bca82d&quot;
-SRC_URI[sha256sum] = &quot;cdc7b5e3ed77bed61270a47d35434a30617b9becdf2478af76ad2c6ade307280&quot;
&#43;SRC_URI[md5sum] = &quot;4ba30da6f0a63554e70ac6c4c1904929&quot;
&#43;SRC_URI[sha256sum] = &quot;28669905fe725965daa16184933676547c5bb40a5153055a8dee2a4bd7933ad3&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------A4543B56BA1B4AB10CB5873D--
