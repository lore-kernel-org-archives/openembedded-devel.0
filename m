Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.79])
 by mx.groups.io with SMTP id smtpd.web09.13866.1604501161648089429
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Nov 2020 06:46:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=VeUiJgP3;
 spf=pass (domain: windriver.com, ip: 40.107.243.79, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j1HJUYSLNUVIRzSQvS4zZzCNDK48/ZFOYJJ56tZHWFtYDR37Hn/iP+5bWcMkWZNbOQmGr3wxjcviGRDpt6GFvaKSEJmH+6T47KeSTfCwyOEDavardQEFhOMBO2j6hmmLXYG1JbGexqxyFVQS+va+OpNRFyS1BW16plXfh8uFTg+lYrrWSdXsios1Ah1dR6gJLWmDRYyJgUTl2AC0vvKLuY1mbBmjCtH7sHBb/IhxRpIgGa2nvdWtJTwpZy11UqerkXofmWyVMDNhs+ngMi0amXx7Z/kU6vgY/vF2bLDyffeQ4ffgfb+Evw74kUXU6Lnsrrltx+q3QryySM7MeTAJGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ksUti8X6XJkYSN4SesoF83DzX2lAEUtkWlc7+K+BETY=;
 b=QppY27e4GhD2rmSVWXQE3zSBBmqhEp61vmB3lL2DUBObd93QqKHcTwhBNDlrf+CmYIqcM55VFykynRW+Msp07BWkrQ2ACEjYH2S5Ose+nxz4QBvNLO3TKgysWcRrZGydzFKDJeHo1hKH1riqtUJ2ONcci6wPgFFnrXxJX7HNaUJu8jrT7L6Ct/wZqKEn56vtGnfIoOBnTxZ/a+dAz2QMqU4baSiWAtrYD3Suu/f9/GKAMlY3p5Gt4rzkKy4r7TRKswTaqbvlhLyx3PhvhuszHtf3o6tEBV+z3Bztc2AxxzJkYSb24NgXMijqG9LC1tjDOlAu+Yyj1N8UuiK+b2l/9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ksUti8X6XJkYSN4SesoF83DzX2lAEUtkWlc7+K+BETY=;
 b=VeUiJgP3F78GznDjLozOZHh9x9ottDiXaRpaSEvPQWuOoUKvHS9X5jPwA/CRSifAbp0mp5EGx5k+I83czn+ZKiJMen9ytr5B5QnkAPkRvui6iv4UVmQRXkx+xjzXb7hHD2WwsgRxiFjtO0usi54urPFm3aosLYP7m6R8nn9LYV4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB5085.namprd11.prod.outlook.com (2603:10b6:a03:2db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Wed, 4 Nov
 2020 14:46:00 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3499.032; Wed, 4 Nov 2020
 14:46:00 +0000
Subject: Re: [oe] [meta-python][PATCH 1/3] python3-pyexpect: Upgrade 1.0.20 -> 1.0.21
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201027104013.11394-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <e987e4d5-657d-3042-ef37-132ac3524ce1@windriver.com>
Date: Wed, 4 Nov 2020 09:45:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
In-Reply-To: <20201027104013.11394-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BYAPR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::25) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BYAPR05CA0012.namprd05.prod.outlook.com (2603:10b6:a03:c0::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.10 via Frontend Transport; Wed, 4 Nov 2020 14:46:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56084d4c-a1c6-483f-a227-08d880d058de
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5085:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB50850A760A1868D01D395BDC9FEF0@SJ0PR11MB5085.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lL+HtsNaFaAJLbmGYbDXl/B9/QPHd6kmz4PqgXYJUINTiD722IWk+eWqkFcqWf0sSVc5FTeCTcX0Kv8hC5IuP6MZJ3Xipdd/KnSlnk/7rkFVCZFhxXXdfFGGqenQAeyzIw2IijEpUJEmj/VXYHC1AHN2PS16w+IlJaVfwpf+T7lP+76mWnDHwUDuXwMDFyH9RJFYH7eqKHq07YJgD6vpnaZrc2uCrLaaNc3FWJ8E0eB8gZJRKqRUSWPstpkO/wI2x5AQymqk9x0k+cOoIeil7qQwGe/L4K6sO3gQNnIIE8yB7B77qULzVDcKqKQWFuefmlBC4vQPBA5Cj4S6KmpW8tKZdd1gfy50pwnoOOvSG9kHuJnSapFegsC3YPHcw85jfHluDRaYH99DBaK45tmyj+B2BW/0KwB7o6PXTj6RnQoxh7KuFB20XwagijRKa18bkGFJfVgUgMe7D63fkW06pA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39850400004)(136003)(366004)(376002)(8936002)(36756003)(6486002)(166002)(5660300002)(8676002)(33964004)(53546011)(66946007)(86362001)(66556008)(66476007)(44832011)(83380400001)(52116002)(478600001)(2616005)(956004)(2906002)(31686004)(316002)(186003)(16526019)(966005)(16576012)(26005)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	cnOtjHpMN9mcmN/+0OIL2sSLDNY5N8XlSRPggou9sA17f76sBjP9jEfwenpbhcIQYazRFLrm+rzwk1nuftT+hE0jkpGY0ftk0fpvuYDwvahH+aNucMlZ2Q49VqkJWTgvMFR4L+jW0S+q5tAnsOeRY2ioMzNA7aEi53/vQls6KPmqJ/Y9DsPpXN6Xgnpbvuz2W7HHm+XNVn8V87XTddPxQqNbzX3PUR+q+6NXbgBd8dpFoswTK+GRyEtxrpCVL7EQVetdNc82pL52bhBu1sq9aTzF6bPGU2aauhiiGRn2OvomeN3HWXyup13eozqF4tEgK6zgLZ672LuZEAGAXVQGsWdZ9rdZX9Lo4WSHDkbY4Pmnqv20BPgZejjxNxJnBK/wV86WScprnisu/anIdvC7djCJ/qEpLrRklNZDG6UDOmRSUckft2ghmuXg66wEYHcaQoSxfQ4mPB2rHw6ix6wsOiEg9yJW65Y2VYEfq5kFxNC/ydRcMwgxNqc63Ia5WRu3ZRgNR3Id4SSqcBMfe40S0kBIDbbtikGr5g2RvzMaz21Zusp4mlzs+dGXdR7VKQhxqyXfstrWfamPD1F/r8ZmcbDq2ePFYwOdTQRP7IsDS+E93tp9IsgXO3RvjzXYI9QBbjP/7j275bqFDYz8PSBQLQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56084d4c-a1c6-483f-a227-08d880d058de
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2020 14:46:00.7872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 90VSVv8N443Jc3efAWOm3oUoht2JDPSJY/vofl5W+AWsw+Na/kXHSxHII3Yi7HzPPj9IABWwBIoJH4qOdq5hrlKWY/OqWn/XjvTjXixfrqE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5085
Content-Type: multipart/alternative;
 boundary="------------9BF53DC64D31944B8D6068A6"
Content-Language: en-US

--------------9BF53DC64D31944B8D6068A6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/27/20 6:40 AM, Leon Anavi wrote:
> - Ensure .includes() handles a generator correcly
> - Also check python 3.8 and 3.9
> - Ignore tox directory
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...{python3-pyexpect_1.0.20.bb => python3-pyexpect_1.0.21.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pyexpect_1.0.20.bb => python3-pyexpect_1.0.21.bb} (68%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pyexpect_1.0.20.bb b/meta-python/recipes-devtools/python/python3-pyexpect_1.0.21.bb
> similarity index 68%
> rename from meta-python/recipes-devtools/python/python3-pyexpect_1.0.20.bb
> rename to meta-python/recipes-devtools/python/python3-pyexpect_1.0.21.bb
> index e09fec01dd..1b80770d73 100644
> --- a/meta-python/recipes-devtools/python/python3-pyexpect_1.0.20.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyexpect_1.0.21.bb
> @@ -7,5 +7,5 @@ LIC_FILES_CHKSUM = "file://README.md;md5=a6aa1e7097aca5955f9a2e1c8b0ce158"
>   
>   inherit pypi setuptools3
>   
> -SRC_URI[md5sum] = "7ebc843f015b54d849ac7632eda74e9b"
> -SRC_URI[sha256sum] = "acaaa6f96de315dc99cac3da810156bf3829d1eb5c49180f00a4fdde82eabc76"
> +SRC_URI[md5sum] = "c661939158d6a1acbcc2191bedc47751"
> +SRC_URI[sha256sum] = "96e900d6af928a94c2a75b4935ddda44872c218121d0467c549ae19e7608a9a2"
>
> 
>

--------------9BF53DC64D31944B8D6068A6
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/27/20 6:40 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201027104013.11394-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Ensure .includes() handles a generator correcly
- Also check python 3.8 and 3.9
- Ignore tox directory

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201027104013.11394-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...{python3-pyexpect_1.0.20.bb =&gt; python3-pyexpect_1.0.21.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyexpect_1.0.20.bb =&gt; python3-pyexpect_1.0.21.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-pyexpect_1.0.20.bb b/meta-python/recipes-devtools/python/python3-pyexpect_1.0.21.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-pyexpect_1.0.20.bb
rename to meta-python/recipes-devtools/python/python3-pyexpect_1.0.21.bb
index e09fec01dd..1b80770d73 100644
--- a/meta-python/recipes-devtools/python/python3-pyexpect_1.0.20.bb
+++ b/meta-python/recipes-devtools/python/python3-pyexpect_1.0.21.bb
@@ -7,5 +7,5 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://README.md;md5=a6aa1e7097aca5955f9a2e1c8b0ce158">&quot;file://README.md;md5=a6aa1e7097aca5955f9a2e1c8b0ce158&quot;</a>
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = &quot;7ebc843f015b54d849ac7632eda74e9b&quot;
-SRC_URI[sha256sum] = &quot;acaaa6f96de315dc99cac3da810156bf3829d1eb5c49180f00a4fdde82eabc76&quot;
+SRC_URI[md5sum] = &quot;c661939158d6a1acbcc2191bedc47751&quot;
+SRC_URI[sha256sum] = &quot;96e900d6af928a94c2a75b4935ddda44872c218121d0467c549ae19e7608a9a2&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------9BF53DC64D31944B8D6068A6--
