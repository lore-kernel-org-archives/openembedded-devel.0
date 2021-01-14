Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.44])
 by mx.groups.io with SMTP id smtpd.web08.224.1610649776115229765
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Jan 2021 10:42:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=DVvm/aPb;
 spf=pass (domain: windriver.com, ip: 40.107.243.44, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aVMiFi7p8I4Ldz/3Yfj66KhxBAsw6cjcwgSgKH6uJrCVCnBlHTJzhmzEaW11FqunD+SkdNIU7PdNNhoicouSaRVhUlemFz7rYOJb0nRpHR0NbY3lZFjMCaKePEnmw3UXG6dc/6jWaouTbfOc+8M/QEFipIt7LmyKcOxUJtkBIOzESrLEf5vn2i3cx8Qk4THINojp6r4AxSnViDa+zIZXZNNdi3ke/vsb7Rvgwknpx24YxYogfwlp9fWgGGHnQP9tr69mrFL+BnFK+Y/bJ443S9cneGZLmK0wnNqDLazPRIoLnZFqWtGQ82zYuZnc5+DN3nbuOYdofR2FeO/0sQ1oHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FoS1LqxCqfO5z3lg460ySTbItbQ42uEkrZD4OS2jM+Q=;
 b=c56KmLxFzPvAwjXyimSpvDcgbaAAxCu9P3dOI8bKt7CYyIdWiqXZvvonRsj6UrkHf1XsNRMtXISg2u42E2OyT/naKxxBkEHh97/Cdbbq2MgGjxBdjmhGpAUTNDKRmHE3F6S1fB5JlThH3Z57Yr+RPOHP6h/X1IKb0skHg4XwMx3OiUL7W6tg2T94EeIBd/O6dBJWLVQEECSbjHAY9PUwI8QEyVQjiPjtkQtNQ/5I3Vy7+SiOy2HyowFIWf9Q4OXuJ7/2cNaVNz+EIXMAO9wfgrzrvO2b6mkBY733La7WxxWuVRJBmO/Dl3Slt801hH6tvcetwXetCKEQIO4eP7I04A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FoS1LqxCqfO5z3lg460ySTbItbQ42uEkrZD4OS2jM+Q=;
 b=DVvm/aPb/YGGC0y2UKM+7a32Ddysr5vIflvOOG5sa0xSl0LXVf0y/xYbn19IY4NgxGCqq4dYiCL1ka1IuixFvzC4EOqwrjAylpzNtgg3yZbFj02zWN1bfvR7QLDXVFhZWjTIpiTy1Zb3yS6RO9ZgUVb+CddKJDVR7mOBzhRt1DY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4800.namprd11.prod.outlook.com (2603:10b6:a03:2af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Thu, 14 Jan
 2021 18:42:54 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6%7]) with mapi id 15.20.3742.012; Thu, 14 Jan 2021
 18:42:54 +0000
Subject: Re: [oe] [meta-python][PATCH 1/2] python3-pyscaffold: Upgrade 3.2.3 -> 3.3
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210112175641.5003-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <56599845-d32c-a501-54c7-a3567f83ff83@windriver.com>
Date: Thu, 14 Jan 2021 13:42:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210112175641.5003-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR22CA0023.namprd22.prod.outlook.com
 (2603:10b6:208:238::28) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR22CA0023.namprd22.prod.outlook.com (2603:10b6:208:238::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9 via Frontend Transport; Thu, 14 Jan 2021 18:42:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97ee32ba-3ea3-4575-91a4-08d8b8bc3453
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4800:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB4800671611063AA4ECFEE1359FA80@SJ0PR11MB4800.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:483;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/iGKM9AGKoki3e1Og1cCzurwYrRLNHzJMnKURN89a7jC19u82TM6oJLtI0Ufz8AVSfH0W0Hrpob1QjTw0Plh++HaoXSUalL1o1DMBv0tMsB3GGzvXpD1MLsfmcfybXgZk/nQOWNNhCb+PM9ffj7HGF+unQT5BCiB/JSI9BOiv6I/CmmSC2k1tcccdSsDissRfStXgwhkLv8m3d04nXivNiyPrQJhopmcIPr3RsLB5k1Lp8y/jLqJm5dh5FUqGQJscWnz5l/MsTKGPBO5T6WIwCOTRUaRpHPBrWS7EKEPv87nOzcBgvBRCO2uuwL6/SPSPrbBWgfdlAK4T/i4pf+ZQqgByiWi3vcc/t0Ozkm5bLVBvpYYezwRdhafX91qvYh3UnchZJAGJfIsvEkKdD/fVQpnEYtrTuTXI0KpibQQj3Du+be1Ek5uv3LxNdZDov8j14/aThBBCmgmN7i20El2IF19UJ42KK9Yxwb0bnBBIyMmeucGBOh41ZswBJux6Rli2EhyUCU5biJx0ch0ZpkFMeiQmua54Ed0x0OiF8Pubzu+UjaSBAOY3WuoLOZiZ64O
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(396003)(136003)(376002)(346002)(86362001)(478600001)(83380400001)(66946007)(2906002)(31696002)(31686004)(166002)(16576012)(316002)(966005)(8936002)(5660300002)(186003)(16526019)(53546011)(6486002)(52116002)(8676002)(66476007)(36756003)(33964004)(26005)(2616005)(956004)(44832011)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?S2dZZXE3Q211RUVYK2JIanNUVFhmWDl5OU1oVWkyN0REU2lkekNoMmEyZkQy?=
 =?utf-8?B?MVZ3N0lhVDBTMUJUeWlhNnhQbzdNdmNPaGM1OXJFZWJHUHZuTDQ0STN6REZY?=
 =?utf-8?B?U0RZdVVPZnMybDNzT004ZVh0SmNzQ1JQdThVaGFoSHViaTVycC9vVVBMN1Nx?=
 =?utf-8?B?MEFIL0ZnMnhGK2JCaWFKRnErZU9Ua3RoK3BJYzNWTktuaCtNcUM0VUdoU2ZS?=
 =?utf-8?B?ZWpPS1N5SjVnN0Z6VWVKWlBmdi81eVRQaHRDZVYrb0xGanlhSWVRbGo4dDY1?=
 =?utf-8?B?eEw3UXJRVkliOGo0NEVqUjVmTHAzeklIUWpiMGpLcjdOVHAyRVdEd0xRQUVy?=
 =?utf-8?B?RCtCTWJteitoNkg1VTJXL2x2eHh3MWdoNkFjelQzQ0F0ODBWUVVHK21valNN?=
 =?utf-8?B?RXpKNDJPcFY1Vy9lSmpzZklUd29GeUFWMjk1Q2VDSlNuWmExdjlMaU51cTFD?=
 =?utf-8?B?VDhSWnozREJBS2tia25PU2d1ODRKaEFlQXVNNXZMcUZBR1hJaEcvQVJSRlhq?=
 =?utf-8?B?KzYzUCszODR1RnRPV1prV2lCNmpYcGpwT2MrbEtUTGFFQzNKNEJ2RVBjUGpG?=
 =?utf-8?B?SEIrY1IvaUFTamdMUGhkRjdKMmQ0NTcrc0VuVDZuRkU0dEhEY3FLMzIvekdJ?=
 =?utf-8?B?K2pmYUE3K042dTVCSGFoL3ZiL3JWL2VwTW5tQkdxdTNEdVVtbU9DR2VuQUV0?=
 =?utf-8?B?RnFQTWNBU2FLeHVjTGZVYUU3QVV5YW5BUVNXRlFjdW1qcHFtVVFFT0ErQlRs?=
 =?utf-8?B?b2ZuMnM0VjJlMkkzRWE5ZzZFb2ZTZVdydURQY2RBT3IyMTQ0UjQ1Vi8ya3gy?=
 =?utf-8?B?dlNPTklZaHBGU3NSMk5ZRjFCckRiZHRpZkU3QStHNlc0Q0xDenFERW95anh1?=
 =?utf-8?B?a0w0SndIUmZRMFZoc0xOV3cxNVluTStWdzFGQXJUYlhJd1ZsOXQwWVRWeG9v?=
 =?utf-8?B?MGlmdnkzT0tVTEtwV0hYNlVaeHB3V2w1b3ZlQS8rVkhaOFJzK1M0UE8xeSsv?=
 =?utf-8?B?UEMxVkJGZGs1UmdJVzNjUnNoVUdxZGpSRHc2THBWRTY3S3ZTb0ZmZTBxMCtT?=
 =?utf-8?B?M2pxZnpFQlBMekpwSUNSOE40VkJmbndCbEttWG1DVzdYbXpwTW1ueGVYSDZM?=
 =?utf-8?B?SXBSRTVUbkVZaEc5Sm1yNGEzK2RqOXJqdlpGdElmSUtNN0pvQkR0K1pjU3pJ?=
 =?utf-8?B?ck9rU2l6eVBHdDRJOXg3UnNuVEx4NFZwWDJwNGVKTmUxRzZTRCtvK3NnYlIz?=
 =?utf-8?B?czVCb2FFRElmZnd1VGVlUXpMOEpNQytTT0Y2NXJyS05QUHJCMUFjb25mNmkr?=
 =?utf-8?Q?9KD1NwpzjYJg70zNxEnv+ojrihhhdGSClk?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 18:42:54.3260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 97ee32ba-3ea3-4575-91a4-08d8b8bc3453
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4P1w7HlbXiaNT+7jirYAhXemgaoAHo71fQ9vVNS8r8r9cUqbE7ixzf11CAwaLs9/uYhKn89dhFzGBmdJZEzg4eH5fcpS9YB44KBkNKmJ6U4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4800
Content-Type: multipart/alternative;
 boundary="------------8025E9621C95194E1EE35F41"
Content-Language: en-US

--------------8025E9621C95194E1EE35F41
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-12 12:56 p.m., Leon Anavi wrote:
> - Code base changed to Black's standards
> - New docs about version numbers and git integration
> - Updated pre-commit hooks
> - Updated docs/Makefile to use Sphinx "make mode"
> - deprecated setuptools extensions/commands
>    python setup.py test/docs/doctests
> - New tox test environments for generating docs and running
>    doctests
> - New built-in extension for Cirrus CI
> - experimental get_template is now part of the public API and
>    can be used by extensions
> - Updated setuptools_scm to version 4.1.2 in contrib
> - Updated configupdater to version 1.1.2 in contrib
> - precommit automatically fixes line endings by default
> - deprecated log.configure_logger, use log.logger.reconfigure
>    instead
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-pyscaffold_3.2.3.bb => python3-pyscaffold_3.3.bb} | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pyscaffold_3.2.3.bb => python3-pyscaffold_3.3.bb} (79%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pyscaffold_3.2.3.bb b/meta-python/recipes-devtools/python/python3-pyscaffold_3.3.bb
> similarity index 79%
> rename from meta-python/recipes-devtools/python/python3-pyscaffold_3.2.3.bb
> rename to meta-python/recipes-devtools/python/python3-pyscaffold_3.3.bb
> index dbd222f54..87ecb5606 100644
> --- a/meta-python/recipes-devtools/python/python3-pyscaffold_3.2.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyscaffold_3.3.bb
> @@ -12,7 +12,6 @@ inherit pypi setuptools3
>   
>   PYPI_PACKAGE = "PyScaffold"
>   
> -SRC_URI[md5sum] = "6769d2a26a9d1f3038944b8fbfe728ff"
> -SRC_URI[sha256sum] = "96c3e7f5529df0b5b351e879a141e1e5c9f26211f30d493c23d8c09d9d610a6f"
> +SRC_URI[sha256sum] = "28c77ec70e727944a42ba2494bdd5c912ec38511ac76281dd28fcb9805799025"
>   
>   BBCLASSEXTEND = "native nativesdk"
>
> 
>

--------------8025E9621C95194E1EE35F41
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-12 12:56 p.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210112175641.5003-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Code base changed to Black's standards
- New docs about version numbers and git integration
- Updated pre-commit hooks
- Updated docs/Makefile to use Sphinx &quot;make mode&quot;
- deprecated setuptools extensions/commands
  python setup.py test/docs/doctests
- New tox test environments for generating docs and running
  doctests
- New built-in extension for Cirrus CI
- experimental get_template is now part of the public API and
  can be used by extensions
- Updated setuptools_scm to version 4.1.2 in contrib
- Updated configupdater to version 1.1.2 in contrib
- precommit automatically fixes line endings by default
- deprecated log.configure_logger, use log.logger.reconfigure
  instead

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20210112175641.5003-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-pyscaffold_3.2.3.bb =&gt; python3-pyscaffold_3.3.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyscaffold_3.2.3.bb =&gt; python3-pyscaffold_3.3.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-pyscaffold_3.2.3.bb b/meta-python/recipes-devtools/python/python3-pyscaffold_3.3.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-pyscaffold_3.2.3.bb
rename to meta-python/recipes-devtools/python/python3-pyscaffold_3.3.bb
index dbd222f54..87ecb5606 100644
--- a/meta-python/recipes-devtools/python/python3-pyscaffold_3.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pyscaffold_3.3.bb
@@ -12,7 +12,6 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = &quot;PyScaffold&quot;
 
-SRC_URI[md5sum] = &quot;6769d2a26a9d1f3038944b8fbfe728ff&quot;
-SRC_URI[sha256sum] = &quot;96c3e7f5529df0b5b351e879a141e1e5c9f26211f30d493c23d8c09d9d610a6f&quot;
+SRC_URI[sha256sum] = &quot;28c77ec70e727944a42ba2494bdd5c912ec38511ac76281dd28fcb9805799025&quot;
 
 BBCLASSEXTEND = &quot;native nativesdk&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------8025E9621C95194E1EE35F41--
