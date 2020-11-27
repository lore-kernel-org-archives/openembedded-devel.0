Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.69])
 by mx.groups.io with SMTP id smtpd.web10.19125.1606484884119939381
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Nov 2020 05:48:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=VnEZV3/r;
 spf=pass (domain: windriver.com, ip: 40.107.92.69, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CLfaYqjSsWZgvnXveMVCKCQUVQa9mqjrCdGRZXJnCEBYea2rpz7DXcE9D4EgeDJLOv2UYeDoAlQAXkunjB6G7epsFRitB43yoqjaEFmbFYKeqBL4+827pq3WTGlG62VVIxyhUaoEOLXw8RrvRt4j3J7I+FKu1c/g0DY3ACCswmfFsqiB02fvFp7O1Uhn9CjmiE1MhYsdxGrDk60xQZW96mq1dXzHgPVc5e9eNmoqH9XaKOKAD28+YDU/Tv87KZ0ZKGwrBtBBvnTytWDonBYuoHTMVkQybwTXUinvs2cfU2v+EBg9mce0DnqaGG0rrpuFJSAZ1AthxLKnvINRY3bcMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dxAyKPByXOTMpjZTSEsJjmNVFRwwdLRwFHObcqsih6U=;
 b=DTH929wPSOoXCbDh5o7hi5PNe33sWuHC1GKjRMuiEDz8t/XB2J64yGvF2GsvQ8YynPWthajg15bXFbtWQwDfyJdcM9iQ+aYkGzBJH1gqo8LodFz67nLItv7jNsfLASErKdemCQRLlWODk5wFPPIN0S+n0HwL5tM16w8wC6AZEfApdJFo/w9IiQ3PEpigySKmt3pfzxZV1NFmhNR0BpfJksCM9IghFQRw29cwcLcH0Ry4nQrQ82NDXs9Fwhyruk5nwykuZ8j+vX8Ebqtp9z4ZSpSR7v15swxKosJ91g99NUF7Du6RBYIp85ca7BeUdSdJuhWoZn6h5RvL3NjL/H2W6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dxAyKPByXOTMpjZTSEsJjmNVFRwwdLRwFHObcqsih6U=;
 b=VnEZV3/rtQ7FIO9cMN9/JOw8WU0zZvr7/+i3NetqPRX9QUY/KrFlVxSq+j40uzaZCh5+OatIsDMWXFpXfRLMXLQqcMR3VAr4ehBiD9OHQvFx8Bep9jrfhMf5TadJYOvWL80B+Fi6ejISQHm26br1FMck+UmswTlkv4tyR0fZx3I=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2598.namprd11.prod.outlook.com (2603:10b6:a02:cb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22; Fri, 27 Nov
 2020 13:48:02 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498%4]) with mapi id 15.20.3589.030; Fri, 27 Nov 2020
 13:48:02 +0000
Subject: Re: [oe] [meta-python][PATCH 6/7] python3-urllib3: Upgrade 1.25.11 -> 1.26.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201126112215.11451-1-leon.anavi@konsulko.com>
 <20201126112215.11451-6-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <46d0cf78-e3d8-8fa1-6643-245064b433c2@windriver.com>
Date: Fri, 27 Nov 2020 08:48:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <20201126112215.11451-6-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YT1PR01CA0140.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::19) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0140.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend Transport; Fri, 27 Nov 2020 13:48:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d816161d-5980-44fe-5abb-08d892db0f33
X-MS-TrafficTypeDiagnostic: BYAPR11MB2598:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB25987E54F12B3659A84344D09FF80@BYAPR11MB2598.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZtxXv7HV9wacF2jnubckXTShQVXv5xDNRB2BZUCCdfbjeUF8PUZ68WQYOmvSfv4LTqlb7WbvIwbm9M+0RdCfqn0kBhWYBiEFBBcQ1quNWa0gDlrdEYJSEizxvIDb9Iq/hjfEzOjq7KQhCXoC30Y8+knwjJpi9rvCviLTU/sYUqjVbIvx8Vq43PYkyugPEIUuYDy0ej5ar6bzFrVh9XwFa3G055o4JQIVWokF8ywzd4+nsNG7QPNu2Mmtu6vUe832RSBw9G45UtjBfmZMeJG2VD9lBhITlKK+AMB7rl2kvBmgPArfh8SEtt0rm9wsJ6NlPAh1JeW5iAphnakV+aYkJbQBxAE7N/7uz5Q6UfIQJt4v44REGL8VxyK9RMZl11jpk6f8CsauGbAp99mgUfZexjmzwUe+zF9fF1z4G7srGbG1dN3klMN8JZrXby+8+VXWPGV2mp2AIh5xrnPbE/c42A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39840400004)(136003)(366004)(346002)(396003)(186003)(2906002)(26005)(16526019)(52116002)(6486002)(8936002)(83380400001)(53546011)(478600001)(66946007)(33964004)(86362001)(966005)(5660300002)(2616005)(956004)(166002)(8676002)(316002)(31696002)(16576012)(4001150100001)(36756003)(66556008)(66476007)(31686004)(44832011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?cGpjVXBwbFQzS1hxOUorZS9FZDhXNFovSXFPTDFTUEx3bU1Sd09lSUxncUZ6?=
 =?utf-8?B?czZQMXFjbENCaVViL051dmEwUUhJZUhlVHdJemRDeXlnc2RVQWRRQVp6TGw2?=
 =?utf-8?B?RlBqeEVVbWJYbVAvY0ZsN1plenVYUFhXY2hDMGR4bzFheXhuajMyckdGNnMw?=
 =?utf-8?B?SktyMjJzTjRuMXhYRmE1QzIwVzBmdmM2QWgvZkdodkgwRkFUWDZReWV3Y0R4?=
 =?utf-8?B?R2hTdzMrRzM1RDZUeUpvOTEzZitMRUg5S1Zac0dOYmg5c3IxbU5IZFdCUWlk?=
 =?utf-8?B?TTNXWjBSWWpMUDdoMGxFNVBFKzMrcDhXMTBtVnZ6Z3FkcmpleVovQnk0M1l4?=
 =?utf-8?B?Sm9wbXZBdDViYWFINUYrWkp6QVRhWFJNU3UyTVJ5MVdHYkM4dXg5WkZZekZn?=
 =?utf-8?B?clVRRTdGZzFYMjYwaDFVcXdQNjd0ZGRrbXpTUmxYRmxPaHh6Q0h1a0JxbjZi?=
 =?utf-8?B?UWw1UW9HRmp5bVNiZk1JaCt3N3VZdW1NZmZ3TFp4SDBuUERvUVZJczBtbS9j?=
 =?utf-8?B?WWZ3RDRSMWo4WGEwY2IzZCswVDN3S2FLOXEzdXFZaGVDODBUZmg0a085TVZ2?=
 =?utf-8?B?RFVnT2dHR0UxS0RDUWlNMmZhTXBieEhVK1VPUVA4Y3oreDRUZiswMkNyTkkz?=
 =?utf-8?B?VzZhSlYwSmZlMzVFcnJhd0VJZG5JZVVEeCtFRVRDVWZFS0p5ZW1abCtIbXli?=
 =?utf-8?B?eW1adWZtdVFjZkVWTmYvWkJBMWlEYkl1dFpWQzhKOVdLbzAydDk0ajRpRlFV?=
 =?utf-8?B?VU5aUXliY0JNMnh1Z09VVlA0dXhrbEg2LzZGTzEyOXBQK2IzM3VqTWxEMTls?=
 =?utf-8?B?ZEVzSUtQY3hMb3NpMFVuLzhDVHZRVThMek05MHdydUtpK2tkNlRUbitxYnVk?=
 =?utf-8?B?NTdwMmVMT2dPalBDWC84cVczcHhJOTlGb0YvamZYekd5cWxqUDVtTXZPanNN?=
 =?utf-8?B?cTR6Uk84WHVzZ2dTTUF5L1pXVFRSbGRmeHlNYW5NOGpGekJqWER4RHZ6VDM1?=
 =?utf-8?B?MTVsWVV2RzhkV0U3S2xWakEwbEJSRk1ia3V6YVVQTmN3ZjV4aVVCaHAxZ2o1?=
 =?utf-8?B?bjVYbnVubEZ4RHd6N29MWHBxMHlDUEZJTloxZnJUTmhyTzk4MEYyU1NVc0Qw?=
 =?utf-8?B?emFpczJpR1QzQk9FZEZBQzNkTkNRNWNHZFd6R1NkanZIZW1BVTJaeUtCbG5I?=
 =?utf-8?B?TkpGamdudGo1VDMxTitOL0t2Y09zeGVLK2xReXA3bWhER0FISnNnTXBYLzhG?=
 =?utf-8?B?UldKMzRGSWM2ZzBicUNsTldkSkQ0UnJNNDJTV0ZBTzdFNjFKQWVyMktWT0F0?=
 =?utf-8?Q?4vNSCnnH3v6wG9n3pdkeRkSX1lwke6VPEo?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d816161d-5980-44fe-5abb-08d892db0f33
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2020 13:48:02.4631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iuKwitV5sdTLAr/xuzIB9rHD8iw3QKDPaw4Kx0UUL5kVjBFLq95XE7rDBPAFpzuQGRnlHLBxrFskJREl9UTxxY+BxgmMoBQzXptvJTnrnxo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2598
Content-Type: multipart/alternative;
 boundary="------------BD0601D891785F2D14EE01A2"
Content-Language: en-US

--------------BD0601D891785F2D14EE01A2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-11-26 6:22 a.m., Leon Anavi wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 1.26.2:
>
> - NOTE: urllib3 v2.0 will drop support for Python 2.
> - Added support for HTTPS proxies contacting HTTPS servers
> - Deprecated negotiating TLSv1 and TLSv1.1 by default. Users that
>    still wish to use TLS earlier than 1.2 without a deprecation
>    warning should opt-in explicitly by setting
>    ssl_version=ssl.PROTOCOL_TLSv1_1 Starting in urllib3 v2.0:
>    Connections that receive a ``DeprecationWarning`` will fail
> - Deprecated Retry options Retry.DEFAULT_METHOD_WHITELIST,
>    Retry.DEFAULT_REDIRECT_HEADERS_BLACKLIST and
>    Retry(method_whitelist=...) in favor of Retry.DEFAULT_ALLOWED_METHODS,
>    Retry.DEFAULT_REMOVE_HEADERS_ON_REDIRECT, and
>    Retry(allowed_methods=...)
>    Starting in urllib3 v2.0: Deprecated options will be removed
> - Added default User-Agent header to every request
> - Added urllib3.util.SKIP_HEADER for skipping User-Agent,
>    Accept-Encoding, and Host headers from being automatically
>    emitted with requests
> - Collapse transfer-encoding: chunked request data and framing
>    into the same socket.send() call
> - Send http/1.1 ALPN identifier with every TLS handshake by default
> - Properly terminate SecureTransport connections when CA
>    verification fails
> - Don't emit an SNIMissingWarning when passing server_hostname=None
>    to SecureTransport
> - Disabled requesting TLSv1.2 session tickets as they weren't
>    being used by urllib3
> - Suppress BrokenPipeError when writing request body after the
>    server has closed the socket
> - Wrap ssl.SSLError that can be raised from reading a socket
>    (e.g. "bad MAC") into an urllib3.exceptions.SSLError
> - Fixed an issue where two User-Agent headers would be sent if a
>    User-Agent header key is passed as bytes
>
> License-Update: Update copyright date
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...{python3-urllib3_1.25.11.bb => python3-urllib3_1.26.2.bb} | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-urllib3_1.25.11.bb => python3-urllib3_1.26.2.bb} (68%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-urllib3_1.25.11.bb b/meta-python/recipes-devtools/python/python3-urllib3_1.26.2.bb
> similarity index 68%
> rename from meta-python/recipes-devtools/python/python3-urllib3_1.25.11.bb
> rename to meta-python/recipes-devtools/python/python3-urllib3_1.26.2.bb
> index 980f4c53d2..fcd6709017 100644
> --- a/meta-python/recipes-devtools/python/python3-urllib3_1.25.11.bb
> +++ b/meta-python/recipes-devtools/python/python3-urllib3_1.26.2.bb
> @@ -1,10 +1,9 @@
>   SUMMARY = "Python HTTP library with thread-safe connection pooling, file post support, sanity friendly, and more"
>   HOMEPAGE = "https://github.com/shazow/urllib3"
>   LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=65715c2eb961313d71b297dd5a04f85e"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c2823cb995439c984fd62a973d79815c"
>
> -SRC_URI[md5sum] = "d47dd21a6e66a03c3633cac468ffd010"
> -SRC_URI[sha256sum] = "8d7eaa5a82a1cac232164990f04874c594c9453ec55eef02eab885aa02fc17a2"
> +SRC_URI[sha256sum] = "19188f96923873c92ccb987120ec4acaa12f0461fa9ce5d3d0772bc965a39e08"
>
>   inherit pypi setuptools3
>
> --
> 2.17.1
>
>
> 
>

--------------BD0601D891785F2D14EE01A2
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-11-26 6:22 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201126112215.11451-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

Upgrade to release 1.26.2:

- NOTE: urllib3 v2.0 will drop support for Python 2.
- Added support for HTTPS proxies contacting HTTPS servers
- Deprecated negotiating TLSv1 and TLSv1.1 by default. Users that
  still wish to use TLS earlier than 1.2 without a deprecation
  warning should opt-in explicitly by setting
  ssl_version=ssl.PROTOCOL_TLSv1_1 Starting in urllib3 v2.0:
  Connections that receive a ``DeprecationWarning`` will fail
- Deprecated Retry options Retry.DEFAULT_METHOD_WHITELIST,
  Retry.DEFAULT_REDIRECT_HEADERS_BLACKLIST and
  Retry(method_whitelist=...) in favor of Retry.DEFAULT_ALLOWED_METHODS,
  Retry.DEFAULT_REMOVE_HEADERS_ON_REDIRECT, and
  Retry(allowed_methods=...)
  Starting in urllib3 v2.0: Deprecated options will be removed
- Added default User-Agent header to every request
- Added urllib3.util.SKIP_HEADER for skipping User-Agent,
  Accept-Encoding, and Host headers from being automatically
  emitted with requests
- Collapse transfer-encoding: chunked request data and framing
  into the same socket.send() call
- Send http/1.1 ALPN identifier with every TLS handshake by default
- Properly terminate SecureTransport connections when CA
  verification fails
- Don't emit an SNIMissingWarning when passing server_hostname=None
  to SecureTransport
- Disabled requesting TLSv1.2 session tickets as they weren't
  being used by urllib3
- Suppress BrokenPipeError when writing request body after the
  server has closed the socket
- Wrap ssl.SSLError that can be raised from reading a socket
  (e.g. &quot;bad MAC&quot;) into an urllib3.exceptions.SSLError
- Fixed an issue where two User-Agent headers would be sent if a
  User-Agent header key is passed as bytes

License-Update: Update copyright date

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201126112215.11451-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...{python3-urllib3_1.25.11.bb =&gt; python3-urllib3_1.26.2.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-urllib3_1.25.11.bb =&gt; python3-urllib3_1.26.2.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-urllib3_1.25.11.bb b/meta-python/recipes-devtools/python/python3-urllib3_1.26.2.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-urllib3_1.25.11.bb
rename to meta-python/recipes-devtools/python/python3-urllib3_1.26.2.bb
index 980f4c53d2..fcd6709017 100644
--- a/meta-python/recipes-devtools/python/python3-urllib3_1.25.11.bb
+++ b/meta-python/recipes-devtools/python/python3-urllib3_1.26.2.bb
@@ -1,10 +1,9 @@
 SUMMARY = &quot;Python HTTP library with thread-safe connection pooling, file post support, sanity friendly, and more&quot;
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/shazow/urllib3">&quot;https://github.com/shazow/urllib3&quot;</a>
 LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=65715c2eb961313d71b297dd5a04f85e">&quot;file://LICENSE.txt;md5=65715c2eb961313d71b297dd5a04f85e&quot;</a>
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=c2823cb995439c984fd62a973d79815c">&quot;file://LICENSE.txt;md5=c2823cb995439c984fd62a973d79815c&quot;</a>

-SRC_URI[md5sum] = &quot;d47dd21a6e66a03c3633cac468ffd010&quot;
-SRC_URI[sha256sum] = &quot;8d7eaa5a82a1cac232164990f04874c594c9453ec55eef02eab885aa02fc17a2&quot;
+SRC_URI[sha256sum] = &quot;19188f96923873c92ccb987120ec4acaa12f0461fa9ce5d3d0772bc965a39e08&quot;

 inherit pypi setuptools3

--
2.17.1

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------BD0601D891785F2D14EE01A2--
