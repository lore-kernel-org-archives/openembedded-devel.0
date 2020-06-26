Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.79])
 by mx.groups.io with SMTP id smtpd.web10.10039.1593184911100515630
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jun 2020 08:21:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Y80IJGH8;
 spf=pass (domain: windriver.com, ip: 40.107.77.79, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f7ebjBDnR0t4O/D/wJ3aF1ysLwLGIIVOCk7aH0CCwRGFdEIh0mfz4IfmCrqFzggwZ9sO/67v0IQR6PwhkpnX05nOP/Knd05M0FCEq7hULdxKkkzjoeJm3ZDl25lWIuH/HM+aDUAtlQ/5VngEpy1ZLGCMiW+zJjqrtBjgaCd4JLLMKORzyh8GCFktdCaViIicUiHGOi6ubnWKkIZ5KFWcYFsWL6ZmdRjEt2c9TEGhufA8ZU2eyROQE4jHUoHB/oG/X6oMtxJDopLUurpOonVp0OGud8dm9gHHMrlOEXDAXLUk+b5Xvz4/7/QLaLUJd1Z5OPMD792S7oh4uLXkz1AgkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aNQrcbTeZKavRjk3XwygM4uGaBJf/X9kSe9qFdYV3DQ=;
 b=LWGcGjrENNfnlnFRo+QkqF/e00iUAe4gOrOeCEbfrSob8CsGOdoKLX6f1fl967B8WkcMDClBpx7KxO0LIbipEyoMzitQgnhlsroxognJz1SVAGV1jSWqcZdP9i89LxIUUlzU2sQKn8JI2oN0BT1/nD+8m0DyuitV0AnNb4Sf2GvP+ZFPxqo+BeWs+KWSsFAGPbWMoEt/hzlJXDSWDv8kwxpm7mEygJzUMRGr//XtMNVhGCffYFQZ8GUuCx5uZ2VO55yUPp7sztT8p/Ke72fH0qc9U1NJs4BCIN1R+Oaz8DwNuL896g6vJjysI2EolGRhWMhaPNx83jXjOpk78T1MFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aNQrcbTeZKavRjk3XwygM4uGaBJf/X9kSe9qFdYV3DQ=;
 b=Y80IJGH8SRD0MT/vzn9UMd4joGyjdIjrf9lck448UnU8h8ptCbYtTDsCZzDhjltwNWMDD3cW38WfA5izBXh33a2k6IUmb4OmxuDmDxlwbBlfnd4moLMNbtotAYO60z4kZ5RZi0hOnc7NAjfJwIpMUKLRUKsYcoTeXVPAP5V/J+c=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB3953.namprd11.prod.outlook.com (2603:10b6:405:7f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.24; Fri, 26 Jun
 2020 15:21:50 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3131.025; Fri, 26 Jun 2020
 15:21:49 +0000
Subject: Re: [oe] [meta-python][PATCH 05/10] python3-requests-file: Upgrade 1.4.3 -> 1.5.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200622103542.27830-1-leon.anavi@konsulko.com>
 <20200622103542.27830-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <06fb8b6a-c074-14e8-bfa6-0e83197c6e53@windriver.com>
Date: Fri, 26 Jun 2020 11:21:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200622103542.27830-5-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0029.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::42) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTXPR0101CA0029.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::42) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend Transport; Fri, 26 Jun 2020 15:21:49 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 25121973-d4b7-4449-36c4-08d819e4a59c
X-MS-TrafficTypeDiagnostic: BN6PR11MB3953:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB395319E75EA6153D7CE72B7F9F930@BN6PR11MB3953.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:291;
X-Forefront-PRVS: 0446F0FCE1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/zRAmHCu7u8ahXh7RQcjddQYhL68HlrTxojt/MveI87Qy4sLdPFuVJD53mxDQE+NeptHB1vyE+Z4glz99T/PFFQnSuwZ5Xl35HZgnvx2C4KGtPzgxVouEtXB09ubPO+vxBKmsmSYf9ebl64QmkZi1Eu2mD6FlKgEBqBGgLj8n/dov8JaNvA6ErrdkepXVioaU1AO/piHBH9bKFdfPoGQEYdSWom2qGWX9sBrENqSKypxBiJsa7rnbbHLkO7vSKR06XIDxq+5S41Q0qwqwW+VYLGHARGDHATLU0AVfPUOtm/YCcYo4wxSCBVL0baOFkyhzct2t+s/yRk9X8s1Rk6BeJ4ZNvl4PXNysONXUbT4OWfalCg/Kh3sMxwUKpPPJrEPdAyh267FMvM5qp8zd8OewB/XSe5lyysPwOnYs1qLye9CVY/H49ku/bizGAyKd91AocIp6/SBym9AIDEyoOYyMg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(396003)(136003)(346002)(376002)(366004)(316002)(166002)(16576012)(2906002)(956004)(83380400001)(31686004)(8676002)(31696002)(8936002)(478600001)(966005)(36756003)(52116002)(53546011)(26005)(44832011)(2616005)(186003)(6486002)(16526019)(33964004)(66556008)(66476007)(5660300002)(86362001)(66946007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	B5NlC33xSLDIjI58p1wkSqwWsAkgnCJggLjOFZVCbiSqigae7XzB6IGT2vJYp6adNzl74eEbj4BS+nckKn/FYQEc9m6fs4fulXXuwPZcjVbRjmyoTCFXpnGT7c1VLtA4tgH3mKa5EHkvLmjPHMdpfuWDJ3gDakrZWrGsxEmUg7sQct2eeBT1h9BPTJhjiLkuXpqUI5lEVqsM9p6ib5/azkSTrr+KokUrP0JK+b0ZwFOirBv+qJkS7lIOaN0N2E3J7gjTiL/rxT2Oq7WQquUKUttTAyGq9OOUUNl6byam0rgaQb9u7U90zePQyFHRCJ0KFkD8RJWnjoV8yHcEg1xOeT3+pDXjYyJZaJq16Ou1f32P/CRjAy+JdiwTeyOqPvIcxAuOVMAr2n16cXk8MIUB8oyLIHUx8dMCiurNrrFVsq0+ktO3p/HJW64XCB84aMktMfjusIqZ9kzVnRmzcmQ9/OXc52Hr9KRGk+jSPgzHGVxK7Irx2jAQ393h6woNaeOQ
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25121973-d4b7-4449-36c4-08d819e4a59c
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2020 15:21:49.6950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W2G5ww5pkqDeqgfBAu0H12WppVnonXON9qG1UtR92nSsE49sFINFR1bmocILnipHJ3fWliEGhZ0ehAAcsxduR00Sob5rzmwbgnwzekOCNOU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3953
Content-Type: multipart/alternative;
 boundary="------------8665B193405FBCE07F9ADEEF"
Content-Language: en-US

--------------8665B193405FBCE07F9ADEEF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/22/20 6:35 AM, Leon Anavi wrote:
> Upgrade to release 1.5.1:
>
> - Add set_content_length flag to disable on demand setting
>    Content-Length
> - Fix python 2.7 compatibility
> - Rename test file for pytest
> - Add tests via github actions
> - Format code with black
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...-requests-file_1.4.3.bb => python3-requests-file_1.5.1.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-requests-file_1.4.3.bb => python3-requests-file_1.5.1.bb} (65%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-requests-file_1.4.3.bb b/meta-python/recipes-devtools/python/python3-requests-file_1.5.1.bb
> similarity index 65%
> rename from meta-python/recipes-devtools/python/python3-requests-file_1.4.3.bb
> rename to meta-python/recipes-devtools/python/python3-requests-file_1.5.1.bb
> index 0407779da..1c8bba40d 100644
> --- a/meta-python/recipes-devtools/python/python3-requests-file_1.4.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-requests-file_1.5.1.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "http://github.com/dashea/requests-file"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=9cc728d6087e43796227b0a31422de6b"
>   
> -SRC_URI[md5sum] = "470711c9b7e0de1057f7b72a58b7ab51"
> -SRC_URI[sha256sum] = "8f04aa6201bacda0567e7ac7f677f1499b0fc76b22140c54bc06edf1ba92e2fa"
> +SRC_URI[md5sum] = "c96daf6b0c56687556e8a52748fd896c"
> +SRC_URI[sha256sum] = "07d74208d3389d01c38ab89ef403af0cfec63957d53a0081d8eca738d0247d8e"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------8665B193405FBCE07F9ADEEF
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
    <blockquote type="cite" cite="mid:20200622103542.27830-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.5.1:

- Add set_content_length flag to disable on demand setting
  Content-Length
- Fix python 2.7 compatibility
- Rename test file for pytest
- Add tests via github actions
- Format code with black

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200622103542.27830-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...-requests-file_1.4.3.bb =&gt; python3-requests-file_1.5.1.bb} | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-requests-file_1.4.3.bb =&gt; python3-requests-file_1.5.1.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-requests-file_1.4.3.bb b/meta-python/recipes-devtools/python/python3-requests-file_1.5.1.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-requests-file_1.4.3.bb
rename to meta-python/recipes-devtools/python/python3-requests-file_1.5.1.bb
index 0407779da..1c8bba40d 100644
--- a/meta-python/recipes-devtools/python/python3-requests-file_1.4.3.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-requests-file_1.5.1.bb
@@ -3,8 &#43;3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://github.com/dashea/requests-file">&quot;http://github.com/dashea/requests-file&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=9cc728d6087e43796227b0a31422de6b">&quot;file://LICENSE;md5=9cc728d6087e43796227b0a31422de6b&quot;</a>
 
-SRC_URI[md5sum] = &quot;470711c9b7e0de1057f7b72a58b7ab51&quot;
-SRC_URI[sha256sum] = &quot;8f04aa6201bacda0567e7ac7f677f1499b0fc76b22140c54bc06edf1ba92e2fa&quot;
&#43;SRC_URI[md5sum] = &quot;c96daf6b0c56687556e8a52748fd896c&quot;
&#43;SRC_URI[sha256sum] = &quot;07d74208d3389d01c38ab89ef403af0cfec63957d53a0081d8eca738d0247d8e&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------8665B193405FBCE07F9ADEEF--
