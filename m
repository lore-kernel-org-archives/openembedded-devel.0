Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.45])
 by mx.groups.io with SMTP id smtpd.web10.15700.1597154709807056436
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Aug 2020 07:05:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=UyCDHu8L;
 spf=pass (domain: windriver.com, ip: 40.107.93.45, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MS/TY5tJ9IAv1u8rJ0F5XzPs2r5aq5lkeCIwOGzYP2F5UhNo571HXxad2IbIOqWNO4Wa2u/a9TUfYjX5P13coaQ0rxzfuvFxMP4pBlH/4cxWekmZWCg8CTJVYuDNJSWOJnuFXDM/YtuYUlBcRABPTpKnr6pcyOqAVciEg7nvHbVV9oGtCF4pWiVH6pJ0oIvfDUru9RSELw3CVz7tD0fbvlc+XaVsn4ExglDT+FKwsgC3gm85q7Fh+7GUxm7/SBq13kE6ZVWLbFyVVmRypvVp42tZJ58EgzQT6RUt7LQnEtILf+HwBgzULEXPoU0AEhubtbXreer/J47cFDO38Gsvbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kLRZ+1jKNVG3m1JIvxlFQxaWVH4HR90A1687oVJc49E=;
 b=fMvpvM1H+d0UWaybx6iJlLhA7Vne77/zPXL5HqNmrLnMErtH3V9fBinvCk+UxSsQ9/Zv1FobCPQ60LbR9irPeZFOuo5T/PPBQegmULFwPC7q1SNNcMEPrDqfjHnYDCGFOwyhRZSu1Rt4UoAo/7dpXWd3UDPhP+YXrPA1E+0w7h+GpoUrHGG7v0DwLHgAttxWU4EIhkoLY6P2/t8H4EZTm+exHSNFeVFpcbXO+87E99pW5gt57PBTw1UC6nyK+mA9MuAiGBfhdSYz5cuBMm9twfnILedVRdLWb8DVbFAamzeO+ZgZsRHfKbbT0+Gs3oQ5p3tJ7DvGS026Qk08KdqfnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kLRZ+1jKNVG3m1JIvxlFQxaWVH4HR90A1687oVJc49E=;
 b=UyCDHu8LaY+bSBIL4bVPyoXaMKHoxfLKJhm6QuAkPSNg8Flb6iiLQmw0gGy2yPLxduK7m2oPGYV0CCyrRLGGg6Ml+3S6cJ7RAXjn4J1DGWMoMcggCOQcFIJvhhSXbuIx8zAOuIPHyMIcxamBLtra6O99I7ZFw5CMKj7OOQyVByU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2904.namprd11.prod.outlook.com (2603:10b6:a03:87::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.17; Tue, 11 Aug
 2020 14:05:08 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3261.024; Tue, 11 Aug 2020
 14:05:08 +0000
Subject: Re: [oe] [meta-python][PATCH 6/7] python3-prompt-toolkit: Upgrade 3.0.5 -> 3.0.6
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200810144318.17106-1-leon.anavi@konsulko.com>
 <20200810144318.17106-6-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <1ec2f8ef-ffc0-7f4c-a270-40dee6a3031a@windriver.com>
Date: Tue, 11 Aug 2020 10:05:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200810144318.17106-6-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0053.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::22) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0053.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend Transport; Tue, 11 Aug 2020 14:05:07 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad5ed4e6-1f49-4e75-462d-08d83dff8e0c
X-MS-TrafficTypeDiagnostic: BYAPR11MB2904:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB290412B34275EEB11EDCFB8E9F450@BYAPR11MB2904.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	A5m4Up1HVq1QYu3ikSTRFADeoAKKwzdmSRbpZoHto3MEbI3bar+/co+y5DkvedHpAl2aPgzYOJwk1SR1Ke3BRroxa/oBkFfjBfy/zh78e/T5PXnvJSAZEL5Vj6xP/6YtdqRIQGX5OZ2RzjnDXdLoT1X4pmN4TClRTfTDrToMZPytyJXXFj4Z2HWA1c/WLOYOgrQUeMJcimqKj+8o53W0gWRKkLOWpSTyq92osM4PhADO565YEXsSKWnRPHjQciQ9JN0Z6LCfIboXdxOExq+AUjlBVoMNXSAR9crMcID/h5QHqNGOsVxwhvdEiORXLyVwSF2QDPmZFtwocTbKI+jm4+SRHq/jvJVPAq0PixpRtrR5kfEOcNp0AHeR9Qx4NJNCnuuBk7+5PiAV+zkeyOPH2JbylXBxurm+AwhYct9F3A3DaJ665hxYSd7686TyLVAn7W8mnlu2vu9GJIRqHJliDw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(966005)(86362001)(8936002)(166002)(8676002)(956004)(16576012)(83380400001)(498600001)(186003)(66476007)(66946007)(2616005)(16526019)(6486002)(31686004)(26005)(66556008)(5660300002)(2906002)(36756003)(31696002)(52116002)(44832011)(33964004)(53546011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	FhQevZLiTt+5mp45NqClXruJJPSKffN0DRYciU4u9EBbhz/befg2o8KNpGk6q7F50p7a5HB1gvGQtvRFVpI8ezaY7UYoIZNBLAyAq0MrJNg6487hOYfFPz38koRMN4x3fCrQzesfx32IZ4xMRF9EjsQqp4FKCXPMSDDOq4RCtthsDfWbP+0sYcFx6LtdSPJw7e9ZcYpRjUIEhTaEftWksstvrwy+/x4Ra05Pf3eq6xs5raKBtmv/sxpM67KYVllkc603tAJtGBHHnbjmiWq4V3WIFZKIuoqFd+fW5kpdxbhjQQ+4YnOwOlGsHkudmXnPgyeDg+4fF70jMHPWX2F3O+WUcobVwe9jXk0/4hEMbONy3iNo8L6L7Xx7nmqsMgrHDTX17Cd441n+dYkqOM1uzA/r6bL820BpCFhO7MTm2CxxzoxKW+XPa5/O/P0MUoHTw0WpYiS7mM1p1ml6MO1CMIlGdN0io1EmX8xYCzTZxJKfMPZYe959d8Q+InMkbLE0AeVaDrT9vqSNxRgswMx3/eNiW235e73DuaalD+BhtrNi3hDrK3Jultzx8hHDT5F00cg2z9JVQg9aaTeTnVkT1CxFH1rdoRwJm9P2Z0IeOlyfCdUVOQjVFbAwz2/ezxcAW9fx++MOCRApbpXk/VeHDw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad5ed4e6-1f49-4e75-462d-08d83dff8e0c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2020 14:05:08.5017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i4n46pD7ufbu8C3JzqnpL7vmNLseB+2yDc9dGj/2vKADW3DlBE3XmseCPF/E9lDNnx3dIKgP5Ej182avp+WjXsRRO4rCHaIAtZ1fOmUhYK8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2904
Content-Type: multipart/alternative;
 boundary="------------706C622D10300598654A1AC8"
Content-Language: en-US

--------------706C622D10300598654A1AC8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/10/20 10:43 AM, Leon Anavi wrote:
> Upgrade to release 3.0.6:
>
> New features:
> - The SSH/Telnet adaptors have been refactored and improved in
>    several ways.
>    * Handle terminal types for both telnet and SSH sessions.
>    * Added pipe input abstraction. (base class for `PosixPipeInput`
>      and `Win32PipeInput`).
>    * The color depth logic has been refactored and moved to the
>      `Output` implementations. Added `get_default_color_depth`
>      method to `Output` objects.
>    * All line feets are now preceded by a carriage return in the
>      telnet connection stdout.
> - Introduce `REPLACE_SINGLE` input mode for Vi key bindings.
> - Improvements to the checkbox implementation:
>      * Hide the scrollbar for a single checkbox.
>      * Added a "checked" setter to the checkbox.
> - Expose `KeyPressEvent` in key_binding/__init__.py (often used in
>    type annotations).
> - The renderer has been optimized so that no trailing spaces are
>    generated (this improves copying in some terminals).
>
> Fixes:
> - Ignore F21..F24 key bindings by default.
> - Fix auto_suggest key bindings when suggestion text is empty.
> - Bugfix in SIGWINCH handling.
> - Handle bug in HSplit/VSplit when the number of children is zero.
> - Bugfix in CPR handling in renderer. Proper cancellation of
>    pending tasks.
> - Ensure rprompt aligns with input.
> - Use `sys.stdin.encoding` for decoding stdin stream.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...rompt-toolkit_3.0.5.bb => python3-prompt-toolkit_3.0.6.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-prompt-toolkit_3.0.5.bb => python3-prompt-toolkit_3.0.6.bb} (80%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.5.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.6.bb
> similarity index 80%
> rename from meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.5.bb
> rename to meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.6.bb
> index 78fdbca4f..806e67c09 100644
> --- a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.5.bb
> +++ b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.6.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://python-prompt-toolkit.readthedocs.io/"
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f"
>   
> -SRC_URI[md5sum] = "96ba0be8d3145eb70e3da25654987670"
> -SRC_URI[sha256sum] = "563d1a4140b63ff9dd587bda9557cffb2fe73650205ab6f4383092fb882e7dc8"
> +SRC_URI[md5sum] = "e50cb328715b338480d8d29dda54ff5d"
> +SRC_URI[sha256sum] = "7630ab85a23302839a0f26b31cc24f518e6155dea1ed395ea61b42c45941b6a6"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------706C622D10300598654A1AC8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/10/20 10:43 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200810144318.17106-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 3.0.6:

New features:
- The SSH/Telnet adaptors have been refactored and improved in
  several ways.
  * Handle terminal types for both telnet and SSH sessions.
  * Added pipe input abstraction. (base class for `PosixPipeInput`
    and `Win32PipeInput`).
  * The color depth logic has been refactored and moved to the
    `Output` implementations. Added `get_default_color_depth`
    method to `Output` objects.
  * All line feets are now preceded by a carriage return in the
    telnet connection stdout.
- Introduce `REPLACE_SINGLE` input mode for Vi key bindings.
- Improvements to the checkbox implementation:
    * Hide the scrollbar for a single checkbox.
    * Added a &quot;checked&quot; setter to the checkbox.
- Expose `KeyPressEvent` in key_binding/__init__.py (often used in
  type annotations).
- The renderer has been optimized so that no trailing spaces are
  generated (this improves copying in some terminals).

Fixes:
- Ignore F21..F24 key bindings by default.
- Fix auto_suggest key bindings when suggestion text is empty.
- Bugfix in SIGWINCH handling.
- Handle bug in HSplit/VSplit when the number of children is zero.
- Bugfix in CPR handling in renderer. Proper cancellation of
  pending tasks.
- Ensure rprompt aligns with input.
- Use `sys.stdin.encoding` for decoding stdin stream.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200810144318.17106-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...rompt-toolkit_3.0.5.bb =&gt; python3-prompt-toolkit_3.0.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-prompt-toolkit_3.0.5.bb =&gt; python3-prompt-toolkit_3.0.6.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.5.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.6.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.5.bb
rename to meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.6.bb
index 78fdbca4f..806e67c09 100644
--- a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.5.bb
+++ b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.6.bb
@@ -3,8 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://python-prompt-toolkit.readthedocs.io/">&quot;https://python-prompt-toolkit.readthedocs.io/&quot;</a>
 LICENSE = &quot;BSD-3-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f">&quot;file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f&quot;</a>
 
-SRC_URI[md5sum] = &quot;96ba0be8d3145eb70e3da25654987670&quot;
-SRC_URI[sha256sum] = &quot;563d1a4140b63ff9dd587bda9557cffb2fe73650205ab6f4383092fb882e7dc8&quot;
+SRC_URI[md5sum] = &quot;e50cb328715b338480d8d29dda54ff5d&quot;
+SRC_URI[sha256sum] = &quot;7630ab85a23302839a0f26b31cc24f518e6155dea1ed395ea61b42c45941b6a6&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------706C622D10300598654A1AC8--
