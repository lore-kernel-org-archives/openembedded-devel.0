Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.52])
 by mx.groups.io with SMTP id smtpd.web09.303.1610649911381297339
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Jan 2021 10:45:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=oQGCWKXt;
 spf=pass (domain: windriver.com, ip: 40.107.244.52, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=it391ABaJS2WUW7LfQIuW6ygjGdOns8Ens1fqJTw65rH8+0CRCrP2vCNannRFXvfJeqZD6Lwfx8s9CWD5jUvLH6i+tOSHhPWfyoTtyrjdsEnlIKMW2JizCpVqhpenqjmiF1JNaP/cF5Yk8XZThO8ujAahLVrX85fuHGINcN/s14Y7VJ3ngv7SAvcHq7FwXteSigxjUcZrOAZjMrIrIjeB4Pcve8jaqEQxoyDkm2HQ4G3UvJC2aEI8keBWmTUaI/gHkDO9klY+mR3MNxaT1SGcj8bsgYbfVj9VmwsUNLwqhat1yCNUrs38NZuVUQk11FAexHUvBXtdZ6PUBC26LSvPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MDc1ZXaZg3oyXaoVC8Zm/2mrhCOTjlNlxmXFLagTNdk=;
 b=nPgb3eK7KbMWOWlRSZxbodwOpADOvaTZ79i7cDzBfvHO+Mz5R+mr0Odlhr09v0Fa9lJd94OkPgWre6KzczSsaBoqOGiw1oST5oCoIFgU/xVU+Xru6yo9UR9lW/l/dUdmkqh4r0fkgICkwagd4GeVoJjtrmjS05ElvYZPpBAyB0wiPV59mI7QnskrnhZiu1L0k/a0m1kxKjxVSAVXxLxXkbIv6ksFh/a+IrVVXk6WCv6h+tXyR2SkRh7RCgj2h3bXmt79YQWXlX8YWaKQPF4tsmm/PRAPsqg+eRvZqDIHrwGcHQu16rXhBYmVlab6D5u+xyJnoIWBjFzEhSfQfCWxJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MDc1ZXaZg3oyXaoVC8Zm/2mrhCOTjlNlxmXFLagTNdk=;
 b=oQGCWKXt8mWxMHfv7qed06grX1lsgy4/H74MFZU4W4MgohX3nb1V8PyLkceVtXbmyyhfKrNsXsJ7pWhCMRIccnB0H9APyRvIut8Ln8XYN2UwYlhs2p80I7Tz55bIz/4Zhx6Hy8+Lw2Ybfqs4pzDzwPXFyL0/HBmgTJa5sX4eg0E=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4800.namprd11.prod.outlook.com (2603:10b6:a03:2af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Thu, 14 Jan
 2021 18:45:10 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6%7]) with mapi id 15.20.3742.012; Thu, 14 Jan 2021
 18:45:10 +0000
Subject: Re: [oe] [meta-python][PATCH 07/10] python3-cryptography: Upgrade 3.2 -> 3.3.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210113142626.27599-1-leon.anavi@konsulko.com>
 <20210113142626.27599-7-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <30b21667-d3b8-b498-9f41-6e21e1ce057d@windriver.com>
Date: Thu, 14 Jan 2021 13:45:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210113142626.27599-7-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL1PR13CA0129.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::14) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL1PR13CA0129.namprd13.prod.outlook.com (2603:10b6:208:2bb::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.4 via Frontend Transport; Thu, 14 Jan 2021 18:45:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c723606-fe43-41df-4b5a-08d8b8bc857c
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4800:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB4800BF8DBE55A0FA0D9C46DF9FA80@SJ0PR11MB4800.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eXbyCvHkOWdGjV+sEenMz0Xn6zP2MNiuI/+ixjvVwyO5SC6EeQh8hXYJ/T+ijSESOAMUJqUwDTSwKfwviaTQl36GRj1TIpEXt3bjOJIGSlxm9b548b79rJSylyWaj7Z6X5zJOTau5UDpVkIZ0HYUkNRXg2CVmdFrhFzlNL8fbmtQeVtDkhTCEp43SSo95qQWJ98vLHb0RIQczPvHCAMehQXWdQYSerVfz3IENCDPPi104xa4tiZAy8zEu1e1vbyUZ/CO26mXWcdlrzrSd1s5sfXncgfpMEISuVw+OWCP/jYWhbHj6bfrpI7W416w9yZ6WNkPjQOxucb68Dp/oEPRs8xsQs6PEGfDRN70nPxF0uAPnYy9zPOsgVw/Phz1HnEDheZc+3jVosmju3l0ZY6AbhtQB3ZnB9WpOsgHLSUdMzV7FfF7YnCSjba7xWmf/6OSjCLpHOFk1832Zszup+xbEmji9IWEbIdFfq0vh04GR3vIxS0zd6+GqRxfVx8uhMS+s4QGiH8G8IZlPOWx5/yLEK8xXa79szQFLj5YGt6fYb5jljSc2cDA58GYdp8ZGRpPZbWuaToRoAdDT+RQS43Hww==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(396003)(136003)(376002)(346002)(86362001)(478600001)(83380400001)(66946007)(2906002)(31696002)(31686004)(166002)(16576012)(316002)(966005)(8936002)(5660300002)(186003)(16526019)(53546011)(6486002)(52116002)(8676002)(66476007)(36756003)(33964004)(26005)(2616005)(956004)(44832011)(66556008)(43740500002)(45980500001)(148694004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?bEpJYnAwazVhbmY5OGNnTVI2VXNCWEZwK1lQUWVkSEpJREVZcGQ2MUQ1ejNV?=
 =?utf-8?B?azVtdWhmSnZXN0lKK3RvRWh1Z25aTjYyck5WdzN6RVFtSEJuQ3hMcjdsMWUw?=
 =?utf-8?B?NTZFL3ZvU3NVc1Z2VHdHdjQ1NTVhQnE1YWJLYnBOMC9CWWQ0N25QeWlDRGM0?=
 =?utf-8?B?VEZQZkpXSllLc09ad3NTOTJhcENyT1R2WkNNaENHT3AwWVFyNXlDTXpUbnB6?=
 =?utf-8?B?MEg1cThGdDJ6RnFyd3YwYU1VeW5ieEIyODFxN1pWTm9lR0NDSzlwVW5YZ01M?=
 =?utf-8?B?cUFmQk5QWjJNOUlOenpWZFR6ZFhZRE5Ed1FKMkdSaWk4QTBWRFdhVGJXTmdx?=
 =?utf-8?B?RXJaOEsySk1ULzRTbThOQkFsYjhrWXpxSmRXUWYzYkFwTUdHbjJDQzVvQWkx?=
 =?utf-8?B?OUwvU1RrTDNpK0tCY3R1VWEwVERDREVWWkF5cFB1YWQ4bk45ZUlQWEJITUow?=
 =?utf-8?B?b3Q3T29pQVBVQTFPMmlwVlB6Q3JrVEh2MHU3QnhCc0E3cTdZRnlJMGM4U1hl?=
 =?utf-8?B?amIwWDFiNGwwRVRlR25vckF5enlHaFNZT2lwaUhYYzAvRzVoZWV0czZuMVkx?=
 =?utf-8?B?QTZUcVVwbDJxRkpZY245NWtSOEJ3SGR2Z1lnUmFRNTJaSGp5ZU5yZXZDS1k2?=
 =?utf-8?B?OHdkVWJ0cjRKQk9GL0ZaZVlnV2VSOG5Xd1piUVV4MHdJc3BKRVBRNkhCdjRh?=
 =?utf-8?B?OEVFbDJJMlNJblR0aW5Ba1orc25rdUNibDNJUXBIQWVEVFpYbzAxVEQzNnR3?=
 =?utf-8?B?YWhSblBhdFQ0VVhVNWczL09DYzczdGM4bXNONVZ5WDBWTnY1MHUrYW1ZbE1m?=
 =?utf-8?B?QlJuWUlySzZvTVMxKzZvdmxGY1M5eUtVTUdiOG1oN0dIMUt0Y003T01pcVJM?=
 =?utf-8?B?MFRtR0p6Wkdqc3VmaVMxNlZUYkdySVhqSEl2VzlzK1VpTXJsTnYrV1c4WG5u?=
 =?utf-8?B?S2RtN3YxdGFBZVNVR1QxRmtNQ1NsOEUrSm9NOHpVaEttaFNKd0FTU0RXT2RC?=
 =?utf-8?B?RDhSbXdUcThKTStCSWxXanVUZ1k4OWFmeGM4WXJCR3IxN2daNllMNUYwb3Nw?=
 =?utf-8?B?NHdxc0xwM2VtMXVkdHhLT3duQVZNZXA0c0lMVWx1d1ZjRkMySXhORks1aEZS?=
 =?utf-8?B?Ly9CNUJQbUhiZ2FPc3FkZ0hGcDkyZlF2OGFmeEpjZVVlR3o1VkRnM0pNYjlH?=
 =?utf-8?B?K0FwdWo0emlWcGpXSzVnUS9TV2puckVOUEJoRE5lRHZDcXhhbzQ2UHh1L3pz?=
 =?utf-8?B?ZVdwcHJBWTZuSWVzK2QycEFtcjF4R1cxUFQzNzNMR0gzQmlQN3FmTWRNd09o?=
 =?utf-8?Q?ybaoOPvGcXs0XA1ttjjmGvXiTEyjrqxDcO?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 18:45:10.5003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c723606-fe43-41df-4b5a-08d8b8bc857c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NSzefu0y7wuM5nUSMAZzHJb0htf+5uCeEZG6s9RuYVglFxaudE1VrKAXmMQNWIL6+/MnUGX4mz4IE4rz3QrsCGW1xtiBPrvxQXAmlDQi87M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4800
Content-Type: multipart/alternative;
 boundary="------------6556D08E00B005B3467F11E8"
Content-Language: en-US

--------------6556D08E00B005B3467F11E8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-13 9:26 a.m., Leon Anavi wrote:
> - Re-added a legacy symbol causing problems for older pyOpenSSL
>    users.
> - BACKWARDS INCOMPATIBLE: Support for Python 3.5 has been removed
>    due to low usage and maintenance burden.
> - BACKWARDS INCOMPATIBLE: The
>    :class:`~cryptography.hazmat.primitives.ciphers.modes.GCM` and
>    :class:`~cryptography.hazmat.primitives.ciphers.aead.AESGCM` now
>    require 64-bit to 1024-bit (8 byte to 128 byte) initialization
>    vectors. This change is to conform with an upcoming OpenSSL
>    release that will no longer support sizes outside this window.
> - BACKWARDS INCOMPATIBLE: When deserializing asymmetric keys we
>    now raise ValueError rather than UnsupportedAlgorithm when an
>    unsupported cipher is used. This change is to conform with an
>    upcoming OpenSSL release that will no longer distinguish between
>    error types.
> - BACKWARDS INCOMPATIBLE: We no longer allow loading of finite
>    field Diffie-Hellman parameters of less than 512 bits in length.
>    This change is to conform with an upcoming OpenSSL release that
>    no longer supports smaller sizes. These keys were already wildly
>    insecure and should not have been used in any application
>    outside of testing.
> - Updated Windows, macOS, and manylinux wheels to be compiled with
>    OpenSSL 1.1.1i.
> - Python 2 support is deprecated in cryptography. This is the last
>    release that will support Python 2.
>
> License-Update: Update note about the code derived from CPython
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...on3-cryptography_3.2.bb => python3-cryptography_3.3.1.bb} | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-cryptography_3.2.bb => python3-cryptography_3.3.1.bb} (86%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-cryptography_3.2.bb b/meta-python/recipes-devtools/python/python3-cryptography_3.3.1.bb
> similarity index 86%
> rename from meta-python/recipes-devtools/python/python3-cryptography_3.2.bb
> rename to meta-python/recipes-devtools/python/python3-cryptography_3.3.1.bb
> index cec37b027..79a7ac1bf 100644
> --- a/meta-python/recipes-devtools/python/python3-cryptography_3.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-cryptography_3.3.1.bb
> @@ -2,12 +2,11 @@ SUMMARY = "Provides cryptographic recipes and primitives to python developers"
>   HOMEPAGE = "https://cryptography.io/"
>   SECTION = "devel/python"
>   LICENSE = "Apache-2.0 | BSD"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=097f805837700cfac572ac274cd38124"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=bf405a8056a6647e7d077b0e7bc36aba"
>   
>   LDSHARED += "-pthread"
>   
> -SRC_URI[md5sum] = "1e476287399bae923514e19429804155"
> -SRC_URI[sha256sum] = "e4789b84f8dedf190148441f7c5bfe7244782d9cbb194a36e17b91e7d3e1cca9"
> +SRC_URI[sha256sum] = "7e177e4bea2de937a584b13645cab32f25e3d96fc0bc4a4cf99c27dc77682be6"
>   
>   SRC_URI += " \
>       file://run-ptest \
>
> 
>

--------------6556D08E00B005B3467F11E8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-13 9:26 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210113142626.27599-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Re-added a legacy symbol causing problems for older pyOpenSSL
  users.
- BACKWARDS INCOMPATIBLE: Support for Python 3.5 has been removed
  due to low usage and maintenance burden.
- BACKWARDS INCOMPATIBLE: The
  :class:`~cryptography.hazmat.primitives.ciphers.modes.GCM` and
  :class:`~cryptography.hazmat.primitives.ciphers.aead.AESGCM` now
  require 64-bit to 1024-bit (8 byte to 128 byte) initialization
  vectors. This change is to conform with an upcoming OpenSSL
  release that will no longer support sizes outside this window.
- BACKWARDS INCOMPATIBLE: When deserializing asymmetric keys we
  now raise ValueError rather than UnsupportedAlgorithm when an
  unsupported cipher is used. This change is to conform with an
  upcoming OpenSSL release that will no longer distinguish between
  error types.
- BACKWARDS INCOMPATIBLE: We no longer allow loading of finite
  field Diffie-Hellman parameters of less than 512 bits in length.
  This change is to conform with an upcoming OpenSSL release that
  no longer supports smaller sizes. These keys were already wildly
  insecure and should not have been used in any application
  outside of testing.
- Updated Windows, macOS, and manylinux wheels to be compiled with
  OpenSSL 1.1.1i.
- Python 2 support is deprecated in cryptography. This is the last
  release that will support Python 2.

License-Update: Update note about the code derived from CPython

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210113142626.27599-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...on3-cryptography_3.2.bb =&gt; python3-cryptography_3.3.1.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cryptography_3.2.bb =&gt; python3-cryptography_3.3.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-cryptography_3.2.bb b/meta-python/recipes-devtools/python/python3-cryptography_3.3.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-cryptography_3.2.bb
rename to meta-python/recipes-devtools/python/python3-cryptography_3.3.1.bb
index cec37b027..79a7ac1bf 100644
--- a/meta-python/recipes-devtools/python/python3-cryptography_3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cryptography_3.3.1.bb
@@ -2,12 +2,11 @@ SUMMARY = &quot;Provides cryptographic recipes and primitives to python developers&quot;
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://cryptography.io/">&quot;https://cryptography.io/&quot;</a>
 SECTION = &quot;devel/python&quot;
 LICENSE = &quot;Apache-2.0 | BSD&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=097f805837700cfac572ac274cd38124">&quot;file://LICENSE;md5=097f805837700cfac572ac274cd38124&quot;</a>
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=bf405a8056a6647e7d077b0e7bc36aba">&quot;file://LICENSE;md5=bf405a8056a6647e7d077b0e7bc36aba&quot;</a>
 
 LDSHARED += &quot;-pthread&quot;
 
-SRC_URI[md5sum] = &quot;1e476287399bae923514e19429804155&quot;
-SRC_URI[sha256sum] = &quot;e4789b84f8dedf190148441f7c5bfe7244782d9cbb194a36e17b91e7d3e1cca9&quot;
+SRC_URI[sha256sum] = &quot;7e177e4bea2de937a584b13645cab32f25e3d96fc0bc4a4cf99c27dc77682be6&quot;
 
 SRC_URI += &quot; \
     <a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------6556D08E00B005B3467F11E8--
