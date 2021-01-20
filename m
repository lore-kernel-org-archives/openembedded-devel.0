Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.75])
 by mx.groups.io with SMTP id smtpd.web08.27665.1611149708422680255
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Jan 2021 05:35:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=l9QSJCto;
 spf=pass (domain: windriver.com, ip: 40.107.92.75, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GlTYScszYg5VaoLOt0HivHKVmVv05xNL0vRXxBByC1ns16Wtq6j6UhXcJv304lCjSt4evd5uAgxq+tC5EGjcKsVHNuZQ1gb5zV1JHB9cV839mgLH4uJBbLo2Jv889HtJ8weaOJKQrdpGtfy+MVf0yr89pNDdUUEhyau+nHnN8/SohQ+ZIljk5rFiFb+ZJ9jkaJZiWvD18Z8ZhVG5DVJauDpQKRH9SyU+AptdnyLJWIxuZUNLJ1lasauJxERobWCzFskY5sMS/79B1N2DE2U5IHIMvviMxl9XwtPbZOLMQanprWc0uSUXaZqeoryp+Iy4n88/Fhp7ceU8yhGp1Hw2kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xic4qsYdDfjRV18WosxWBT32SQvixkN//gixOhlKVZ8=;
 b=Lg7XqCVlSKdKJwamVPT/XsCQNaSgAHWgJHJxOBMIjDL8eK6s+UyhNA73oOhYobfwOWe7872H0oqMeZEMGFgLdogDQR075g9tz4JjoDYfPf4AHPE3YFyAIlJ24DGCqB1L31QArwGrzJvTostXWtlxvZ+o/1yz0tppDXppTIQQS+h66Hqp2x226OmMrIfGe9wK5E9JCxGATizIVR6/t2yX5LH5tiii2u9dw03xrIkdb0+aY6Kr561Xy+al7/KqynOGRj7Zml6HWOQomGf8cQVkUghFYB9O97zahS1HW1wtWQkJBiE6iHhCgogrf7onYhEnyp5bLjEYbOHidNe6zUijCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xic4qsYdDfjRV18WosxWBT32SQvixkN//gixOhlKVZ8=;
 b=l9QSJCtoKyV8lHEZful96vEcXBpzuai+aiE7EtoEIX8peup70VzCLB8AWB8zp0Hc862fRMbnCPvuy6zz1hztBqJOfWnyaTVzIU/BkxCBVDLXkSjyI7bpVdXU/OMQ8Od1nn79lfAco5lKt7r6mi/6YvLA/JNnlg9mkheQJEeyX2Y=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3559.namprd11.prod.outlook.com (2603:10b6:a03:f7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Wed, 20 Jan
 2021 13:35:06 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3763.014; Wed, 20 Jan 2021
 13:35:06 +0000
Subject: Re: [oe] [meta-python][PATCH 05/10] python3-pyscaffold: Upgrade 3.3 -> 3.3.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210119173746.24694-1-leon.anavi@konsulko.com>
 <20210119173746.24694-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <07e89d9d-5c33-5933-0508-f3a21af705aa@windriver.com>
Date: Wed, 20 Jan 2021 08:35:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210119173746.24694-5-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: CH2PR14CA0016.namprd14.prod.outlook.com
 (2603:10b6:610:60::26) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by CH2PR14CA0016.namprd14.prod.outlook.com (2603:10b6:610:60::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10 via Frontend Transport; Wed, 20 Jan 2021 13:35:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c0a681c-f642-4b53-0050-08d8bd483307
X-MS-TrafficTypeDiagnostic: BYAPR11MB3559:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB35593328D7DEADC3B98742099FA20@BYAPR11MB3559.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:483;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bdBWZqgYL13Ulmbjto9O2WjzbBHjotfIHZdnKM5YXABGSsMfKvdCR24VO0nReuKJ8R5b8DE38H2fyLtc1svDPKEUFKXea6bWu2KS6lTxYTLd2VZR9Vc69fKyXdjQ74NEAaee5WS8DwuufIg94zt3jABDDzo4Lig8y+eAjVx3nHIiNRl9YW18B+lgIosoFrEmgNI8bPuUBmllp4KPnbNMBuQ9q/du+3Oeo95dWv130CK7gqAg2zHg5BOD7AQJ6KveBCaMLdMvZUqvy3OObgQYgft3bWFhLjSs7A2PZlnqMtxdNz0OCo5GQrrUq4V0r4PBGXsuo5ST0sTnxnL8AFdyQgjQd5tFeP3TQaDN+oB3keXBidXEbiKRw9AvrjSl1Sh8CvxhMzYOFk2fQxXXw11A8cMK9MPbgUGIASQSReNBn8gfRWaqj/idlzvq7IQc+dGLjlEZlwL7pXxofW8FsSAKWoIK2vO3zybKTOmReX4lIJO4pexpq7HVofbFg3rXYQo6Ik+rfhqG9hPaknYqClM+ojTyjdsH7R+bqe/pQPkiBg3Kwd36JUf+1ZV1SmGlmPee
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(956004)(26005)(53546011)(44832011)(33964004)(16576012)(31696002)(86362001)(966005)(66476007)(66946007)(166002)(83380400001)(66556008)(186003)(498600001)(16526019)(2616005)(5660300002)(6666004)(36756003)(6486002)(8676002)(52116002)(8936002)(2906002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?RUY3eTBNU09DQVhCZE1GOTVodzVmUC9CSEt5bXl4Nzh6dmhKcFJsUDREOWJu?=
 =?utf-8?B?c2JueUtWYzZjWTlSYXA4S3RaUjJCbGp0R0FLREtnNWhoWE8zWEtjeEZ2SVdm?=
 =?utf-8?B?NSt6aFIrV25zR0ZZamlJVVdUb2FxNVN0Tm9zeUtJbEJtSENBT01oV05zZmNa?=
 =?utf-8?B?cXp3Ny9sUmxhczVoMlBGbzNRd2dyVHI0Y21BazUxeGVYa1pLdHcxTmozdzhD?=
 =?utf-8?B?amIwTTFtakFGSElaY3V1QkgvTFFiMjV6NUxkTHJJa20rMXZVUVF5ZHdVS3Y0?=
 =?utf-8?B?clRRMDRIZTQ1RytoMVBrZnFrL3VvOTNkaTFFQlA2UFhPL2Z6T3BxSFQ0aVlC?=
 =?utf-8?B?amJnMzR1RUIzOFc0QkNScmNhRnFMU1BUVTNHOFZ2bzMyZWN4YUVwTDdTd045?=
 =?utf-8?B?Nm1IbjNyZ1VRdEhOcXNNaWZkeGhSc2Q5aDFqL0tHNHR3c3VRTXM4SkhHdlFV?=
 =?utf-8?B?b3ZudmRLNjNCZU56YW1DVld3bi90MlZWVWtUaUtjM1RDUU8vQVM2YTJWTG9V?=
 =?utf-8?B?NENuNWU0RncxZG9PaGZZMGFZR3owOURWaDFXOUFkVjBRQnlNUHBZMGV6NFM2?=
 =?utf-8?B?N0RmL0w2NExHSmFuQk9XWk96endrSDZ0U2R4cVhnYWRwMVlLdVRuN09abHJB?=
 =?utf-8?B?RjZnVG5kVGZvMUtML081anI1cHdqYVdmUXFFRmc3YzNUbjA5bkp1c2JiVGl4?=
 =?utf-8?B?SThuVlF5eWJ0NHl3QkVhVnl4RldvZVUwaURlT29UeU92eDMyVG1JYmx5MTlR?=
 =?utf-8?B?YWtmQk16aDBJZGM5QzkrRnc3MGRmOXdBNE9KMVZ5YVZwRWs2NjNxaUJqQVNp?=
 =?utf-8?B?NFF1eUZSR3NHRERsUGZaOTRsdEhORUtuY2ZGVlpxd1EwUWVUMk03V3RyR1VC?=
 =?utf-8?B?K3h0eUx2K0JRRCtzRU5hWFE4QlJzZkV5NW0yMjkvTXJ2ZGpSWkhrN2xta3Y1?=
 =?utf-8?B?YjhRVkpGa24rcVpLVS8wdFVjUUwxdDIwdkRydG1Fd2RRUjhpSmZJdDZyNmc2?=
 =?utf-8?B?Q2svYVVhMlkydEZEOVZPY2hncVB5MXg4V2hMMlordld3MW83aVNKdTZyZzZi?=
 =?utf-8?B?QjRTYlFpRVNGNVY3M0NBaEE3OUZpOC8zWWszN09HbWUvMWtGUytZQWd0ZXZj?=
 =?utf-8?B?ckRqSHlUZDFVU3pxVVhFaFpqRlZuRzRYb0NicDAyYVdhRWcyd1ViVXpZamE4?=
 =?utf-8?B?Ui9VbFNvL2V4NkJYSGhiSlEvU29IbGdKQXFHbmk5SGFlSVVCQWFHd1RHbDVr?=
 =?utf-8?B?Y3JyZmw2WHpWRVMzaENudzNWSE1HNVFJcEMxZXc4c2xoTG5oQ2JIa1JHY0xm?=
 =?utf-8?Q?HQqbWpHDJCiVgOttaT/t6LHZdwQHlZRuii?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c0a681c-f642-4b53-0050-08d8bd483307
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 13:35:06.6245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q/Tywwe264Jk+aBTVCgQw5KOCh9ykwoo5EXq1dGcICRGobsf79ZNJ5GMupV+R9T8avW3dCE5oI5oAEbcp+Y8Euf1YhQHOb4ZVaoejmQaGD0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3559
Content-Type: multipart/alternative;
 boundary="------------4E498C584757B6CEF255D535"
Content-Language: en-US

--------------4E498C584757B6CEF255D535
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2021-01-19 12:37 p.m., Leon Anavi wrote:
> Upgrade to release 3.3.1:
>
> - Code base changed to Black’s standards
> - New docs about version numbers and git integration
> - Updated pre-commit hooks
> - Updated docs/Makefile to use Sphinx "make mode"
> - deprecated setuptools extensions/commands python setup.py
>    test/docs/doctests
> - New tox test environments for generating docs and running
>    doctests
> - New built-in extension for Cirrus CI
> - experimental get_template is now part of the public API and
>    can be used by extensions, issue #252
> - Updated setuptools_scm to version 4.1.2 in contrib
> - Updated configupdater to version 1.1.2 in contrib
> - precommit automatically fixes line endings by default
> - deprecated log.configure_logger, use log.logger.reconfigure
>    instead
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-pyscaffold_3.3.bb => python3-pyscaffold_3.3.1.bb}  | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-pyscaffold_3.3.bb => python3-pyscaffold_3.3.1.bb} (85%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pyscaffold_3.3.bb b/meta-python/recipes-devtools/python/python3-pyscaffold_3.3.1.bb
> similarity index 85%
> rename from meta-python/recipes-devtools/python/python3-pyscaffold_3.3.bb
> rename to meta-python/recipes-devtools/python/python3-pyscaffold_3.3.1.bb
> index 87ecb5606..9bebcedd3 100644
> --- a/meta-python/recipes-devtools/python/python3-pyscaffold_3.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyscaffold_3.3.1.bb
> @@ -12,6 +12,6 @@ inherit pypi setuptools3
>   
>   PYPI_PACKAGE = "PyScaffold"
>   
> -SRC_URI[sha256sum] = "28c77ec70e727944a42ba2494bdd5c912ec38511ac76281dd28fcb9805799025"
> +SRC_URI[sha256sum] = "1c3a2b76e60319b6ffc2a8b54e240382109c6241576bf0a47ea476c7194f6a69"
>   
>   BBCLASSEXTEND = "native nativesdk"
>
> 
>

--------------4E498C584757B6CEF255D535
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-19 12:37 p.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210119173746.24694-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 3.3.1:

- Code base changed to Black’s standards
- New docs about version numbers and git integration
- Updated pre-commit hooks
- Updated docs/Makefile to use Sphinx &quot;make mode&quot;
- deprecated setuptools extensions/commands python setup.py
  test/docs/doctests
- New tox test environments for generating docs and running
  doctests
- New built-in extension for Cirrus CI
- experimental get_template is now part of the public API and
  can be used by extensions, issue #252
- Updated setuptools_scm to version 4.1.2 in contrib
- Updated configupdater to version 1.1.2 in contrib
- precommit automatically fixes line endings by default
- deprecated log.configure_logger, use log.logger.reconfigure
  instead

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210119173746.24694-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-pyscaffold_3.3.bb =&gt; python3-pyscaffold_3.3.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyscaffold_3.3.bb =&gt; python3-pyscaffold_3.3.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pyscaffold_3.3.bb b/meta-python/recipes-devtools/python/python3-pyscaffold_3.3.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pyscaffold_3.3.bb
rename to meta-python/recipes-devtools/python/python3-pyscaffold_3.3.1.bb
index 87ecb5606..9bebcedd3 100644
--- a/meta-python/recipes-devtools/python/python3-pyscaffold_3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pyscaffold_3.3.1.bb
@@ -12,6 +12,6 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = &quot;PyScaffold&quot;
 
-SRC_URI[sha256sum] = &quot;28c77ec70e727944a42ba2494bdd5c912ec38511ac76281dd28fcb9805799025&quot;
+SRC_URI[sha256sum] = &quot;1c3a2b76e60319b6ffc2a8b54e240382109c6241576bf0a47ea476c7194f6a69&quot;
 
 BBCLASSEXTEND = &quot;native nativesdk&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------4E498C584757B6CEF255D535--
