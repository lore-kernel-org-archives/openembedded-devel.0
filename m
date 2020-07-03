Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.46])
 by mx.groups.io with SMTP id smtpd.web11.10759.1593785011044550875
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jul 2020 07:03:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=pcNaL6A0;
 spf=pass (domain: windriver.com, ip: 40.107.223.46, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hgR1cmEF+Xv9jy/2wCdSAJpdQN6pFP+yN0klPCFYn4vNYyeHP1Fswn6j0/GPqN9xgxjdfYwNyHDYoJafB/gGlSMQxIK+Vg6/XVtUUFKAZuUUK8bjyO40jrxIEP0Og7ONJ0oR+x3C4GUnjl84DoW6NrZ6jDun9sIRzIyvmyZjGMm1hCbtcIAPuzawC1d2NKmqzO8Y653YIgz8hZ9pmSeNw9QJa99Kt4tu6ACh1JSn5E9oK9H5A3y4ZXHJwKdKScxyPs5dv6Dym2AAMQJkMmg8/wJU1h63n+DaD+0YuWKrShYDMUbepQLNWmBO2M3yXKvMEwZk1rQCrNFRGHTRLu1i3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zEorKLyng6Ikz38V0WILRYjJ0nFwWSYPyncbYzEMkws=;
 b=f1Viu2Sc/DmoC8U+e1e4yQUE/eJTh8A6HvbXPkfdzdZdKh1biBcKgGRK6tJxPHW1zWuwOXiNRGhXX19nAT0BANG5U7d0ldBFF7/YT6wLp2cgpRoLcR6QCCnSC+8aLXCkxGufPnnw6zyc1U1mT3LWoFAft7UgqK3+JI5pMT9xGCcrYyKukjk2Y51odxK7uG8Mh8Nlx29fLI4L2sLZmdbDMiMCpYj5nDY2hHQsnR2oQ8qcejjcMz6Ehdbr1cBxFzzFKwLqvP5k5fE64mJW25YFWv6ICzT+qI0/PbE8wrkr9SgdveQZV5KoM567GQy9iypEj8phzbAJlOO5QXxo1/Is/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zEorKLyng6Ikz38V0WILRYjJ0nFwWSYPyncbYzEMkws=;
 b=pcNaL6A0kDE1qGt1ho820YeTF5U27eS5TmbityMgLddKxFvMoBdKzSiNDj0Ud8gnvbW4F0AE5TAu8wqai6v9meQvXV90yaY+9qUlLx53YHkU2UKwsaExDs8XiQnPD01Mmg2EBH8qfq0YFI6l375DN0h4596ZMc/JmuYdprnBmF4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM6PR11MB3628.namprd11.prod.outlook.com (2603:10b6:5:144::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.28; Fri, 3 Jul 2020 14:03:30 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3131.036; Fri, 3 Jul 2020
 14:03:30 +0000
Subject: Re: [oe] [meta-python][PATCH 7/7] python3-lz4: Upgrade 3.0.2 -> 3.1.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200629171853.18608-1-leon.anavi@konsulko.com>
 <20200629171853.18608-7-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <2c22ce93-aab3-874b-1e9f-849613668414@windriver.com>
Date: Fri, 3 Jul 2020 10:03:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200629171853.18608-7-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTBPR01CA0018.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::31) To DM5PR11MB0011.namprd11.prod.outlook.com
 (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTBPR01CA0018.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.22 via Frontend Transport; Fri, 3 Jul 2020 14:03:29 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f298e6a-68e9-4eae-a93f-08d81f59dd46
X-MS-TrafficTypeDiagnostic: DM6PR11MB3628:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB3628A4B10B65E8F7E13159889F6A0@DM6PR11MB3628.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-Forefront-PRVS: 045315E1EE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	W9lDcBLmw0sOUXhq+Q0xM14RcNb7HzjYruU8wjPdSdmtRBiglQ6LVIuLVqDeY5iUtA/3/NI0CNSznrJ1tEI7IdxUDRPoGmTS+BpdbmNzvKUoGEvm/FhTflf05YDQdV8jU++fmz7YhPGONaT2upTMHIrFSozFNnBWPzGwm0WfAk6MgUz8AHuVyN+E04eUlyluvnxKHRa+5JfIylDYtDcIMJtrFo5lTLMxVESHeBql4EYh20WbRfw8PyWIvXNFty1uPrcggtyKvmremRuTND1xkMSbNf8E1EFG1nGYhzTklto0vArePS+h+HbzeeQjI8rq1jql9O/duMjrxUr8IFn5ZWt4QTi7pPGmvB8aOPo9dm0HOz4Bearbj9gvu/yv3GkIzEDeeHoWC31h74ql/IuRSeth4bKppuGtuIihJ1xhEd4EzBQWg7FCURMvMiCwl6T1LLWblIwgNouaCZbWjzx48Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(396003)(136003)(366004)(376002)(346002)(186003)(2906002)(966005)(52116002)(86362001)(16526019)(5660300002)(31686004)(316002)(66946007)(2616005)(66556008)(956004)(478600001)(66476007)(36756003)(26005)(8676002)(44832011)(53546011)(6486002)(16576012)(8936002)(31696002)(83380400001)(33964004)(166002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	Ipqkw3r/hLOlldk0Lb3itEDTCYO6oBPYtt1BB0LKkR599o1enugFFulRoGk20ApbNMlVytQlq+jhysL2HMtDvhdC7LPgIfJvnYJ9nQunUOPw8rd/kFJGM8OWq+oiFojIHN4UiEBthv6BAsM/irKrWp35XPTTfzG4UM/tKlGt5WGOSuGqnAphChzqgfoMU7dcTQcb4uqkN6VXX/hmBomV4bBzpZi5w8yzofhGSq6HRhrcjbjhZ6PYl9G9+hVICqTtIG5lmlz2ijLTbsKyIA87DCD+S8lBfAQDA8G1KFZa/v4feKT14nSo14oQb/RBKHUKGLvnBjP2pxNUE6oUVXiACwOdbQsmBqvNrKwAo4Mh6nOvvyCo7007tHZH1thN6vVGq2sYjZ24NSR8ZRT0wFASpIsrPWTjH7/ONBrRfq47VHDvvH9+gvDWH3wc9QdIE2NmGapmnO0r095GzK5kt0sKx42zYm0NyIFrd/Td6ixgPNc=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f298e6a-68e9-4eae-a93f-08d81f59dd46
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2020 14:03:30.0069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CkYulDW6mGgLgDqpZXPyMR8AcuHd00q0EmAiaitmEoOTkeJwg3p8SEFkanAO7lD85o1U6D6gwCIBq7W96h740Dz/Vvg04Tcb3saLu7Vtc4g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3628
Content-Type: multipart/alternative;
 boundary="------------5EFEF39A29E09DDB237AACD9"
Content-Language: en-US

--------------5EFEF39A29E09DDB237AACD9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/29/20 1:18 PM, Leon Anavi wrote:
> Upgrade to 3.1.0:
>
> - Adds block size record support to the stream bindings
> - Fixups to the tests to reduce execution time
> - A few small fixes
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-lz4_3.0.2.bb => python3-lz4_3.1.0.bb}     | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-lz4_3.0.2.bb => python3-lz4_3.1.0.bb} (70%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-lz4_3.0.2.bb b/meta-python/recipes-devtools/python/python3-lz4_3.1.0.bb
> similarity index 70%
> rename from meta-python/recipes-devtools/python/python3-lz4_3.0.2.bb
> rename to meta-python/recipes-devtools/python/python3-lz4_3.1.0.bb
> index e39ca8f3b..06bf63159 100644
> --- a/meta-python/recipes-devtools/python/python3-lz4_3.0.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-lz4_3.1.0.bb
> @@ -7,7 +7,9 @@ DEPENDS += " \
>       ${PYTHON_PN}-setuptools-scm-native \
>       ${PYTHON_PN}-pkgconfig-native \
>   "
> -SRC_URI[sha256sum] = "9c9f6a8b71c18c24bd83537a4d616f0301623a5e98db7c7ca956d608e1bcd4c7"
> +
> +SRC_URI[md5sum] = "1bf913acec3cb63893f522c222c8e3b1"
> +SRC_URI[sha256sum] = "debe75513db3eb9e5cdcd82a329ff38374b6316ab65b848b571e0404746c1e05"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------5EFEF39A29E09DDB237AACD9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/29/20 1:18 PM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200629171853.18608-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to 3.1.0:

- Adds block size record support to the stream bindings
- Fixups to the tests to reduce execution time
- A few small fixes

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200629171853.18608-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-lz4_3.0.2.bb =&gt; python3-lz4_3.1.0.bb}     | 4 &#43;&#43;&#43;-
 1 file changed, 3 insertions(&#43;), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-lz4_3.0.2.bb =&gt; python3-lz4_3.1.0.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-lz4_3.0.2.bb b/meta-python/recipes-devtools/python/python3-lz4_3.1.0.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-lz4_3.0.2.bb
rename to meta-python/recipes-devtools/python/python3-lz4_3.1.0.bb
index e39ca8f3b..06bf63159 100644
--- a/meta-python/recipes-devtools/python/python3-lz4_3.0.2.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-lz4_3.1.0.bb
@@ -7,7 &#43;7,9 @@ DEPENDS &#43;= &quot; \
     ${PYTHON_PN}-setuptools-scm-native \
     ${PYTHON_PN}-pkgconfig-native \
 &quot;
-SRC_URI[sha256sum] = &quot;9c9f6a8b71c18c24bd83537a4d616f0301623a5e98db7c7ca956d608e1bcd4c7&quot;
&#43;
&#43;SRC_URI[md5sum] = &quot;1bf913acec3cb63893f522c222c8e3b1&quot;
&#43;SRC_URI[sha256sum] = &quot;debe75513db3eb9e5cdcd82a329ff38374b6316ab65b848b571e0404746c1e05&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------5EFEF39A29E09DDB237AACD9--
