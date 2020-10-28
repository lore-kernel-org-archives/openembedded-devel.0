Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.74])
 by mx.groups.io with SMTP id smtpd.web12.10591.1603898418725203494
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Oct 2020 08:20:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=NHyh4d3x;
 spf=pass (domain: windriver.com, ip: 40.107.236.74, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R94369vDSRZxrrTziHbBcC5kkL1gpbCBXWjZgX8y6bWHEItcrYjItFnGOtQIhhQ74ouZ48rFr3pJBHvgDp2sciwRhmsbQvNhWSerXD/4GV3K0s1mBHdlVIzrLd2CXb1XYaATjgMGIULbvYwViXEpEaBB4adBysKXgRzP6d5DJQONPhr8kOgkGMuqJUNYYaW3HWsLvDhYuwqnHtgByi6uWULB3prB/yDKnt43rdgRyYls47foo8l0ZkXK+JRBpnCs48aOkDt11CcMzPS+exM7vQ9YPvtDa24Po8tTy9xAQKbHEyRacdm3spg4/OGtga0DVJjUojW3Pkzznh4KKjD79g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uxJ+xhlVcAMQJm6WiCqBJ7ewt8u95JnCU8VRjuKFfsI=;
 b=oaSF3ou9UlsiJN7FXFZi89dhsuijwK4KcDcgkwW/JtvfjckceAqNk0gctnsyJF7bC0Bc7UdgOAN0W7Dad7EZELvOhYiLaSRLrNVscAKa1SxI5oMmjXI2FzvPHeHTJJvHkFvvjnQxQzOlKj2dbuAsAKLPxvulTsHgfzTYkftpRXMbZfHIyfr0LEBTFQ9I0V0D3HR72PMJu1LKpmmg6A7+OEL1KhtKjD94I0FRPYb9lV0TDcbfdMxu2kGyHbD7jS2WVdPx9d/XHZA6OF9nY5i+KPF/Hj8GD214hJuEeRRwgtfpZ0kvEL4LR73fr58YrCNhJutV7K6IyJGtF3f9FpBdmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uxJ+xhlVcAMQJm6WiCqBJ7ewt8u95JnCU8VRjuKFfsI=;
 b=NHyh4d3xCfD0pLdGN9M5UEAn1sZcp5+BV0SIS6ZXmwmNpejIDErDYrFmBZcFNayNPpy9gkN06JbXZIAfd9AeRcXIJy8xkfveIHH5TSp3D5zJxSB+tQBE7JB19Y+o9m6aX3EofpiadmhVrTHw1iibFvrKYLIckntep+hgqYCf4e8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB5008.namprd11.prod.outlook.com (2603:10b6:a03:2d5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 28 Oct
 2020 15:20:17 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3477.028; Wed, 28 Oct 2020
 15:20:17 +0000
Subject: Re: [oe] [meta-python][PATCH 3/3] python3-lxml: Upgrade 4.5.2 -> 4.6.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201022141749.14950-1-leon.anavi@konsulko.com>
 <20201022141749.14950-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <0ff4d3b2-4d00-e407-cada-e323287492e0@windriver.com>
Date: Wed, 28 Oct 2020 11:20:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
In-Reply-To: <20201022141749.14950-3-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BYAPR11CA0085.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::26) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BYAPR11CA0085.namprd11.prod.outlook.com (2603:10b6:a03:f4::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Wed, 28 Oct 2020 15:20:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e8f326bd-e9b3-4815-21fa-08d87b54f9ae
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5008:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB5008EC9A9B42817C693126439F170@SJ0PR11MB5008.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oq9QqAhNPgHg3j18YlP7O6mCOWyfwW9sbFOfMKOcOlnigz05lY5KI0KkW6cwsLu6s9OMjLk41VJ+6q8UOnK7o5jpAdvWca7mHhHPrLEnn5eKuU9mU4gL8Wj0IMmkJPoKZSwxXbalPrQfwvbkT+jpfbGPomCBJQIqC5SOw+wcIhtwPc5fEzBMUa9CN1Tywab8TuV/feFJUsCWB26w1RixAuZqh84zNBQWzcjjmoY6bwppnO6+2IJCkhj9lVoF28tjeg8JaTHmT1tgCSnob61UYxDoTw7lJhXmyirfuK7DrvQjyQcnoJkdl4J5VS7D6TcZ4yfM32d+CphtSI+kiRx0wRffQDToaOnNQtaWzDCJyRJBfpJN1JSBAUCJ5PAeJgiipa+qtZFRbqD0/SGDlxPh9MAXhPdOujj1Pf9Ux8GxfNvC++UbmwiehJPAWxmVxQFwezKYP1WjG+HNdpMM3mj84g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(346002)(396003)(136003)(376002)(83380400001)(5660300002)(166002)(6486002)(478600001)(44832011)(33964004)(31686004)(86362001)(53546011)(52116002)(2906002)(16576012)(186003)(16526019)(8676002)(316002)(36756003)(66946007)(26005)(966005)(31696002)(66556008)(66476007)(8936002)(2616005)(956004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	xL3tLF0NBigxLha1GpqELnTfz6m2K/XKkY3o/4RJ4lAk6o60LZi0K0Y9c72wI/XDAVyj+91RbFTC2If3lqJgfkabZKwIFDNw8x+oJvsB8uryFhfLH5uYYEj4fivNg/laGKsLk01vWP6YyhIIK/N7sOLdIHqLWezCissGQjiOOLe419IoFMBVncgeMR03rDllBiQijNTAdOBopjaNxoQWP9l/2DX0JxSY5b5sukAEsQzTTMP8WUJAP4PgtqGRCKQTmYIr7DjuMbPucywG+lwNUxidYE/Z2aRRDhIQoGooVbO6yg+yI2xChIPl4cA0+UQkHQfzqAKoldLfHYrxnAC3H8yrtVmi2rr6/qEoze6mer42FdfRy/92CuHWvzemHiU8SZ7qf4uN/UroRb9W0bTct6AhYc1pwBcStRNWfLZf5EEp1gOCHff20FRPbGIDcjWVNNPnE1SOs/DUzU+wfsif+svUEabih1lCA1Am2Y43aF56Bw6Sq1Re1N5ICyf1XwvVV7FndCr7Ngo27Nd0myKr5+oonGrtXSYEAg448yDCWl9wmqdSAkrvcXi8TNDCkm3l5L7Wz9ezBTJ5EDpbB9GEO+u7PeB0lLjkK2WPhMDgalDXICiz4c0x0GHOJVF2tsRZ/YDghczY5vxyX7TagsNtfw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8f326bd-e9b3-4815-21fa-08d87b54f9ae
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2020 15:20:17.1252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t/gvzedRimrKUVmo9JHMad4Hqg65Cv9W3CLV1y3YLlSM2RobjHv/2Udh/V6XpS1BX3niDTzsPedP+eiibZfrGOjs7XhnITVTQ+oE6wFxfvA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5008
Content-Type: multipart/alternative;
 boundary="------------B6B8938B034B1FBC2F619638"
Content-Language: en-US

--------------B6B8938B034B1FBC2F619638
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/22/20 10:17 AM, Leon Anavi wrote:
> - lxml.html.InputGetter supports __len__() to count the number of
>    input fields.
> - lxml.html.InputGetter has a new .items() method to ease
>    processing all input fields.
> - lxml.html.InputGetter.keys() now returns the field names in
>    document order.
> - GH-309: The API documentation is now generated using
>    sphinx-apidoc.
> - C14N 2.0 serialisation failed for unprefixed attributes when a
>    default namespace was defined.
> - TreeBuilder.close() raised AssertionError in some error cases
>    where it should have raised XMLSyntaxError. It now raises a
>    combined exception to keep up backwards compatibility, while
>    switching to XMLSyntaxError as an interface.
> - A vulnerability was discovered in the HTML Cleaner by Yaniv
>    Nizry, which allowed JavaScript to pass through. The cleaner
>    now removes more sneaky "style" content.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-lxml_4.5.2.bb => python3-lxml_4.6.1.bb}   | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-lxml_4.5.2.bb => python3-lxml_4.6.1.bb} (93%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-lxml_4.5.2.bb b/meta-python/recipes-devtools/python/python3-lxml_4.6.1.bb
> similarity index 93%
> rename from meta-python/recipes-devtools/python/python3-lxml_4.5.2.bb
> rename to meta-python/recipes-devtools/python/python3-lxml_4.6.1.bb
> index 7e11a67e7f..af012e6300 100644
> --- a/meta-python/recipes-devtools/python/python3-lxml_4.5.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-lxml_4.6.1.bb
> @@ -18,8 +18,8 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
>   
>   DEPENDS += "libxml2 libxslt"
>   
> -SRC_URI[md5sum] = "83ad758eab6c254b3565715967d553a6"
> -SRC_URI[sha256sum] = "cdc13a1682b2a6241080745b1953719e7fe0850b40a5c71ca574f090a1391df6"
> +SRC_URI[md5sum] = "10924ab543397a06cb4cfaf9bdf0b80f"
> +SRC_URI[sha256sum] = "c152b2e93b639d1f36ec5a8ca24cde4a8eefb2b6b83668fcd8e83a67badcb367"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------B6B8938B034B1FBC2F619638
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/22/20 10:17 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201022141749.14950-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- lxml.html.InputGetter supports __len__() to count the number of
  input fields.
- lxml.html.InputGetter has a new .items() method to ease
  processing all input fields.
- lxml.html.InputGetter.keys() now returns the field names in
  document order.
- GH-309: The API documentation is now generated using
  sphinx-apidoc.
- C14N 2.0 serialisation failed for unprefixed attributes when a
  default namespace was defined.
- TreeBuilder.close() raised AssertionError in some error cases
  where it should have raised XMLSyntaxError. It now raises a
  combined exception to keep up backwards compatibility, while
  switching to XMLSyntaxError as an interface.
- A vulnerability was discovered in the HTML Cleaner by Yaniv
  Nizry, which allowed JavaScript to pass through. The cleaner
  now removes more sneaky &quot;style&quot; content.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201022141749.14950-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-lxml_4.5.2.bb =&gt; python3-lxml_4.6.1.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-lxml_4.5.2.bb =&gt; python3-lxml_4.6.1.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-lxml_4.5.2.bb b/meta-python/recipes-devtools/python/python3-lxml_4.6.1.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-lxml_4.5.2.bb
rename to meta-python/recipes-devtools/python/python3-lxml_4.6.1.bb
index 7e11a67e7f..af012e6300 100644
--- a/meta-python/recipes-devtools/python/python3-lxml_4.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-lxml_4.6.1.bb
@@ -18,8 +18,8 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403\DEPENDS+=">&quot;file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += &quot;</a>libxml2 libxslt&quot;
 
-SRC_URI[md5sum] = &quot;83ad758eab6c254b3565715967d553a6&quot;
-SRC_URI[sha256sum] = &quot;cdc13a1682b2a6241080745b1953719e7fe0850b40a5c71ca574f090a1391df6&quot;
+SRC_URI[md5sum] = &quot;10924ab543397a06cb4cfaf9bdf0b80f&quot;
+SRC_URI[sha256sum] = &quot;c152b2e93b639d1f36ec5a8ca24cde4a8eefb2b6b83668fcd8e83a67badcb367&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------B6B8938B034B1FBC2F619638--
