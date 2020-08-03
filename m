Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.47])
 by mx.groups.io with SMTP id smtpd.web12.6930.1596491787387271807
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2020 14:56:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Ciy7g6v1;
 spf=pass (domain: windriver.com, ip: 40.107.223.47, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CLxWawboe5iVmkk50tmo0IUZOi4uoAEvTfaV5EsW/BMvfUjUTMTKbO6Gv4uJynPdVhZ42u3CMCHj5lTwDy6WVUONAIQFD21jkY5XXr7WaFeOTM3nI+CKd1h7ho8VxXFskO5Nfc5A4fSQmwTLOaSQcgN+Pu0Qery17S1XEfxrN7WCbW2b2ImgH+rhU6CTEMIBngMjhobES9NCoJwpblGFD6v8J/AjKEm6L5RiPCG/RDuNt9Qv/JHVzFspAT9Zap2ZFjYUBApLw5pOcc/yjcewOmKFykvPv3hC9YqqKWMsFN0k+NqSNEbfwvotYgFS7FAUCMjINM5lxwjJHFabkiogxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cSKbJOKoSA5lGRedAV7jOYWALN3t2FmNGM6qR/2GKFY=;
 b=fjf6woDDg5B8oS8Jhrq1z/SMzS16eY3jITYRuUerLkbDHVJ7NqnZcJ+bCS3EdbrKVuAC8WcJl8N7dWZV5FvDy3jDLkl7MWBuYytrzaNS+n3vEB+Z3urpQxjB2Jn38dCzsmCQ6MBcbTq38kmS5RsmD9Nhp1vcyC8f8GfRhHLMzfLQ15pVXlVVr3vh7bZSu45UGpRjwcAux3V8THMvDn/6I2qNFMbZ1D3IfIvnYNPuDBrZPJ91D+xsncTkGN6AbwtnYHLXylnFqTLCG8NjhjOIpj/9DhZFJrknm26+Uxo1x0rBHPaqk2v/HqzyyeQ/hvr91CEiyAMgy9W08Rcrqk5XqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cSKbJOKoSA5lGRedAV7jOYWALN3t2FmNGM6qR/2GKFY=;
 b=Ciy7g6v1bkg4QFL+p3gLmcyieGehGBfoEX/Qn7apz+Try/FRoupdtvW8Nc5HFwk5q6f6zQhpT8iI2tPQ0B6r9eTakFyeos80oEJtsDmG8qAksaCMQZPYVZr1PrNxR7DjqKlMsWNBJuaCkwOLLE461K2T6K7sahDaGJVIHWvluF4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4151.namprd11.prod.outlook.com (2603:10b6:a03:18f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17; Mon, 3 Aug
 2020 21:56:25 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3239.021; Mon, 3 Aug 2020
 21:56:25 +0000
Subject: Re: [oe] [meta-python][PATCH 15/15] python3-tqdm: Upgrade 4.47.0 -> 4.48.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200731132230.20031-1-leon.anavi@konsulko.com>
 <20200731132230.20031-15-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <90533bf9-21b1-bed6-54bc-a44f5a4ee7d0@windriver.com>
Date: Mon, 3 Aug 2020 17:56:23 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200731132230.20031-15-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0139.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::18) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0139.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend Transport; Mon, 3 Aug 2020 21:56:25 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c22d2413-382b-4af7-4185-08d837f81152
X-MS-TrafficTypeDiagnostic: BY5PR11MB4151:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB41518F5EC7AF77800C2849579F4D0@BY5PR11MB4151.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4B3cX+HU1J4orO7BXL49G0ZJggVc/k9IXIpHqN/KPIk8oLVHcl+gt7ko0Cyb5Hx6Xhfsigvj01FvBGfmSO9Wd+k31ROCJS7ypcY/OkcWZGN2SGWv3pYP7qn1Qwk1nm+Kwj5xWCwxEqr7IZBKU0nIPOZ40Ij2PzUYYi8o2UX0dJu1tjkxmILzwZ2gmFApSY2+PNYfXcEJfAZovHtwpohqqAfxLUqGDDgLBRhdBwAiJdoAWgYMAersJHOrHcvQ+3ZGAK5n6WVmLuFuHwqB7J4tK1m/IRn3NvLIVDjKpg4DDFt3OHiA57vE1oMcEOKnx3gTUQCKtRDGDbd5jtEWdsU5sNeXZUqhLgzx02N8xQvUAbi7hqe8p3vH8aXF0ci6IAGG98bfngKbV56aVoBulSRdJZR90d4st/EZwrAxPyHIE964+gBOLM0hJ+JrQ+ePNuW2HvBxDJB/vZYudCKrx0Iu9Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(396003)(136003)(346002)(366004)(376002)(36756003)(16526019)(2906002)(26005)(966005)(478600001)(186003)(86362001)(31686004)(16576012)(83380400001)(5660300002)(53546011)(166002)(2616005)(66556008)(66476007)(956004)(44832011)(33964004)(31696002)(6486002)(8676002)(316002)(8936002)(66946007)(52116002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	o0ykUIaPXi4Voj41xItm+olQ94JWLgXHnezcvciPPMGO1iH/1knUTfWGhT8H+EzEBmsai3OPjqJN1Pj/2ShqhxEBOOYWPqMUqog5FggZlRSyX4J9ttSFq3dgMNYkXhcdSf3xzJToKUABXojLxOT89+J3IQjN2ZL1vc7RbPZV/kXOLy+4sjANYVk4Z9ImZMuU/pRe32/SbFGRUOjNfSCJN5bsbZSfUl6SZ4HUQq6yPbgLXPIzElVZyvjgnJ5TCn8ufuXi2LaUWf5r+A8K0yMiF2/kgCqqIg5kyM0qJXV5x8Fr+IhZ/OwCPHjQlD6W7rHv0SLY/Dz2lHHqW+udBRtCcEBKHcXQbxKPpM9m0Ld+67vpye34xzhMaF7qKhimYh0dvdEL4nG68wt2mjkusErjnD2aQ1DbEH3SwKQ7OhlUhYjpZ3orNGl/8vUCn0upf/Ambxb9recOewarJT9n5elwy5Q5R4AZpofJIuALTdaogSHDJCp0tvQFVgvmJ64ywBG4lpEgwFhefPCqntn47vkCgu3MxGWcnt+06IhFPc+fHLsG//l9iK77mDwNrxNu6FSbKyjcR0U51PnICy+rhP9FGvh5NdS7Idg5lPhThw9K85ZqnZiB6LO52Ug+NsWIVnBnpApuyMuxGZnaQ3FVqvsSmQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c22d2413-382b-4af7-4185-08d837f81152
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2020 21:56:25.6764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LldB2konvcqaPTvC/woPot0HNO6djCa4OolEMw5qTvR8thzZsDZb+HoOUOrE7sF0/mJN1Tz8tVGWtcHKSVie9EjLK7/q7/34/TQsJ2WC2ho=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4151
Content-Type: multipart/alternative;
 boundary="------------B151908D8DA80CB375C11CC3"
Content-Language: en-US

--------------B151908D8DA80CB375C11CC3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/31/20 9:22 AM, Leon Anavi wrote:
> Upgrade to release 4.48.0:
>
> - add tqdm.asyncio
> - reduce contrib.discord logging verbosity
> - fix potential pandas() modifying **kwargs bug
> - update documentation
> - add tests
> - misc framework updates
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-tqdm_4.47.0.bb => python3-tqdm_4.48.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-tqdm_4.47.0.bb => python3-tqdm_4.48.0.bb} (65%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.47.0.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.48.0.bb
> similarity index 65%
> rename from meta-python/recipes-devtools/python/python3-tqdm_4.47.0.bb
> rename to meta-python/recipes-devtools/python/python3-tqdm_4.48.0.bb
> index fad758e3f..428bdb59e 100644
> --- a/meta-python/recipes-devtools/python/python3-tqdm_4.47.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-tqdm_4.48.0.bb
> @@ -5,8 +5,8 @@ SECTION = "devel/python"
>   LICENSE = "MIT & MPL-2.0"
>   LIC_FILES_CHKSUM = "file://LICENCE;md5=7ea57584e3f8bbde2ae3e1537551de25"
>   
> -SRC_URI[md5sum] = "1594eab5b5aef37ef1fd6d36ce4f8f4c"
> -SRC_URI[sha256sum] = "63ef7a6d3eb39f80d6b36e4867566b3d8e5f1fe3d6cb50c5e9ede2b3198ba7b7"
> +SRC_URI[md5sum] = "89dbe66a10f78900e4e7be729ddd28ca"
> +SRC_URI[sha256sum] = "6baa75a88582b1db6d34ce4690da5501d2a1cb65c34664840a456b2c9f794d29"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------B151908D8DA80CB375C11CC3
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/31/20 9:22 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200731132230.20031-15-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 4.48.0:

- add tqdm.asyncio
- reduce contrib.discord logging verbosity
- fix potential pandas() modifying **kwargs bug
- update documentation
- add tests
- misc framework updates

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200731132230.20031-15-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-tqdm_4.47.0.bb =&gt; python3-tqdm_4.48.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-tqdm_4.47.0.bb =&gt; python3-tqdm_4.48.0.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.47.0.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.48.0.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-tqdm_4.47.0.bb
rename to meta-python/recipes-devtools/python/python3-tqdm_4.48.0.bb
index fad758e3f..428bdb59e 100644
--- a/meta-python/recipes-devtools/python/python3-tqdm_4.47.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tqdm_4.48.0.bb
@@ -5,8 +5,8 @@ SECTION = &quot;devel/python&quot;
 LICENSE = &quot;MIT &amp; MPL-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENCE;md5=7ea57584e3f8bbde2ae3e1537551de25">&quot;file://LICENCE;md5=7ea57584e3f8bbde2ae3e1537551de25&quot;</a>
 
-SRC_URI[md5sum] = &quot;1594eab5b5aef37ef1fd6d36ce4f8f4c&quot;
-SRC_URI[sha256sum] = &quot;63ef7a6d3eb39f80d6b36e4867566b3d8e5f1fe3d6cb50c5e9ede2b3198ba7b7&quot;
+SRC_URI[md5sum] = &quot;89dbe66a10f78900e4e7be729ddd28ca&quot;
+SRC_URI[sha256sum] = &quot;6baa75a88582b1db6d34ce4690da5501d2a1cb65c34664840a456b2c9f794d29&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------B151908D8DA80CB375C11CC3--
