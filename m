Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.51])
 by mx.groups.io with SMTP id smtpd.web11.10896.1601818634416932298
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Oct 2020 06:37:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=gZHlo+RS;
 spf=pass (domain: windriver.com, ip: 40.107.93.51, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ko1DN+pbL84v6heINIkCjTXIzbeLPmPF3SwAqFWaEIUGtAK9wnJH/bNH2ukvdWOvtFRYd5NoTXRoaneNEd9Lk5K7yak2K94jGQQDQwzq7W7tUFCPruuDtI5uBt2wkNxA2Gp7SYjwvXAdEkhxJs2VDC9DyzXa4GHZVz8E6pe83zFFj3qpYbf6xcwkI2UxAHboMnpfpn2NdUXnb3Ha8dYc5b+qyobQzc1YSsDfUXpsNxL1k+U0VL+Xh5smF+uPqyr6ezibaN44eHNDGgSxEmYlVJ7O0o9PkJG7RmYjGCjZw/PonmtBc1eot87qNzXlsvbGEbl/W3MKfcvyWBumIbfEOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9C31m6qxLwuWroqjIwqcpfzOIUHqyYP3y4EiPLYEEu0=;
 b=U1QJhZQvL2YnKVEAwhVMKSD2ls/+4jGN9stBhhjinhbMjayPiUdxI/ukO2dkOocHwiFqbil6P3sayqrLT1XuvyIp/BqR104/dgGHYEx/4n7zK6MoyHdwP/omtaIyr5RfnUvj33EF7cCAn3on5XRcheO34JR5Zq/4XRVzT2rr5swOdBk/ZU0MQavCIWfhT6trjrI14EEOBcXCQj3qSAoocnW1lDdrYllELHNEb+63dnX8zLUKH04fTYEDanAWymnjqNKtVDILGsmWcBp4AOi3s6f2VBLs4C6hMr8S/t0Ft5hLP1RlhrSOw8Ptn0kNcE6QdKcL41mtZ+6I7lXKio8Zzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9C31m6qxLwuWroqjIwqcpfzOIUHqyYP3y4EiPLYEEu0=;
 b=gZHlo+RSHo4C2DuVdppzODBDFWzxMOW3BxkSAJzMzS4a3N5KoTFY4K+QAjglxEtnzM3a2VpAR3o8byXykhzdNgJNr+YNGTBrXuRgpPj4Dc5QJW6x2JvWHzLZlPYwxy6PM1ny0IVhNxsB1jx0bp9EeCdmwSSKgUc5DuBW69pSExE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2951.namprd11.prod.outlook.com (2603:10b6:a03:90::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Sun, 4 Oct
 2020 13:37:12 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3433.042; Sun, 4 Oct 2020
 13:37:12 +0000
Subject: Re: [oe] [meta-python][PATCH 1/5] python3-isort: Upgrade 5.5.3 -> 5.5.4
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201001082006.21365-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <c7b5ed9b-a5f8-cd61-9142-72c43423a082@windriver.com>
Date: Sun, 4 Oct 2020 09:37:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <20201001082006.21365-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YTOPR0101CA0072.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::49) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTOPR0101CA0072.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::49) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.36 via Frontend Transport; Sun, 4 Oct 2020 13:37:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e456c8fd-9378-4333-2210-08d8686a98f8
X-MS-TrafficTypeDiagnostic: BYAPR11MB2951:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2951B5CC4E06F8095A21944F9F0F0@BYAPR11MB2951.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	k5m5PS6crqeGA5m5MuLgMN7iZdg27oAaeQr71D87AuFqfjHQyTaSTDB/9KGnOX6hNcHR1f/vWXfSnSEt1CZNV4rjEQ4A0UrVp9ymsSqJZ60pSDMLO5a/VI2yrOUlL/nJ0WFd8JEfrzOyj23AgkxlALozqOuEa/zRfLHRJCMr2E3UcYJgR+3MOeJaX1L4ZXEMSMl4gcK5FE5IiaIcxtPxAYU0qyZc0AxRrCN6IaTyKqfqgIc0AWidWGB7eSMd+Sdffm36QicA2Wo2jgY2UWmfhj1n6OWlCEuBV7moAPXuYGBPKC+/XZujhUs4DTdVxoBLtaIuy7A8nHmM6zpnPnjs/ZfjBZZ0yceSDbmJGou+Ug1U9MX/j+FwrpFlNW2BCvBf6cWX8bK3pyNPZB1XgImXL6bJzwSn3Pc+yKt0KeeSA121jIcIUK96PddVQKCZI3+1k1D4F6xabV3pHzqcmSGA5Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(39840400004)(396003)(136003)(6486002)(6666004)(186003)(16526019)(86362001)(478600001)(44832011)(52116002)(33964004)(31696002)(5660300002)(66476007)(66946007)(66556008)(36756003)(8936002)(8676002)(53546011)(26005)(83380400001)(966005)(83080400001)(16576012)(316002)(2906002)(166002)(956004)(31686004)(2616005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	OaJ0quNImqdFYJ/y7qwI3fBX8D+trAgXx7ErnqV6MHg65VrWr1MP76DH1fW/SmL4YLY0bvdmtz1viTeD31K5sdNLANy3gAdIHohdXeIBAdFW7nmlijyJ8zvKxi0mvgGJhzLx/+eUzNjnUxBNwJdWGBqY8PRGYe9p2v9kbuNOuQSirCVoimaS+/BdK6vt86WHpzshbJ6G2rjmcB/zA3SQBnfSsGgvDp3iiR0FtVE3tFqBCHsQgDg1qwI+DFRzYPSr70ww11ffyB5WiYLw3v9dp4hjIx+u0HBhS/j5+YKuKbmQgjU763i+/Upprj5petO+y/J0Cpj2fGcogxQd4eqCggEgHhJyrvQEzwodLJsa26BEQvUFP2gIjS8BfseozDiVbKEGnd1wjAmMm1iKeBty4Bt0pvVtiOWw0PiKlMSKqEN13hyHhjQelCCdC3cl1wnh3oAUp2RdBmBRrczZWPTYcHROgmdSaOkOT5NLu9XaHMzFGW+SH0ZBnI3mdAu3rQstDebddH0xgx21mjVOvVPE0bb0XtnfS6UiyBX2Hi8Rl8Ah2ySIeVfEvDzkvm59a8Aq0f5azBBjlNy0E0mB1HqLSdSVjv2668ejFTwldBwxlsR9zHPcfjHDfwplix4DuSiYzKkvUosfZGKADXQbI2Yj7Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e456c8fd-9378-4333-2210-08d8686a98f8
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2020 13:37:11.8623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ABgkhaAurBaTdb6iIUJ+FizNc5nNWc/doFI75tAZtjpaEJ7P7/mrW8eC/gHTVSYRjt/MFEoVEXiLmQyXRTu5q9gE8S/8/NrUN+RRwbP7Br8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2951
Content-Type: multipart/alternative;
 boundary="------------557D18DDDB585DBC726E641F"
Content-Language: en-US

--------------557D18DDDB585DBC726E641F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/1/20 4:20 AM, Leon Anavi wrote:
> Upgrade to release 5.5.4:
>
> - In rare cases isort changes the content of multiline strings
>    after a yield statement.
> - Support case where known_SECTION points to a section not listed
>    in sections.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-isort_5.5.3.bb => python3-isort_5.5.4.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-isort_5.5.3.bb => python3-isort_5.5.4.bb} (73%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-isort_5.5.3.bb b/meta-python/recipes-devtools/python/python3-isort_5.5.4.bb
> similarity index 73%
> rename from meta-python/recipes-devtools/python/python3-isort_5.5.3.bb
> rename to meta-python/recipes-devtools/python/python3-isort_5.5.4.bb
> index 00978ec59d..0c5842790f 100644
> --- a/meta-python/recipes-devtools/python/python3-isort_5.5.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-isort_5.5.4.bb
> @@ -4,8 +4,8 @@ LICENSE = "MIT"
>   SECTION = "devel/python"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=8227180126797a0148f94f483f3e1489"
>   
> -SRC_URI[md5sum] = "5200f5b09a2a648775d0e8dbf0c0d3c8"
> -SRC_URI[sha256sum] = "6187a9f1ce8784cbc6d1b88790a43e6083a6302f03e9ae482acc0f232a98c843"
> +SRC_URI[md5sum] = "6b90dd55851a8ccb3a19fe2cb82cb82f"
> +SRC_URI[sha256sum] = "ba040c24d20aa302f78f4747df549573ae1eaf8e1084269199154da9c483f07f"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------557D18DDDB585DBC726E641F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/1/20 4:20 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201001082006.21365-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 5.5.4:

- In rare cases isort changes the content of multiline strings
  after a yield statement.
- Support case where known_SECTION points to a section not listed
  in sections.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20201001082006.21365-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-isort_5.5.3.bb =&gt; python3-isort_5.5.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-isort_5.5.3.bb =&gt; python3-isort_5.5.4.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-isort_5.5.3.bb b/meta-python/recipes-devtools/python/python3-isort_5.5.4.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-isort_5.5.3.bb
rename to meta-python/recipes-devtools/python/python3-isort_5.5.4.bb
index 00978ec59d..0c5842790f 100644
--- a/meta-python/recipes-devtools/python/python3-isort_5.5.3.bb
+++ b/meta-python/recipes-devtools/python/python3-isort_5.5.4.bb
@@ -4,8 +4,8 @@ LICENSE = &quot;MIT&quot;
 SECTION = &quot;devel/python&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=6;endline=6;md5=8227180126797a0148f94f483f3e1489">&quot;file://PKG-INFO;beginline=6;endline=6;md5=8227180126797a0148f94f483f3e1489&quot;</a>
 
-SRC_URI[md5sum] = &quot;5200f5b09a2a648775d0e8dbf0c0d3c8&quot;
-SRC_URI[sha256sum] = &quot;6187a9f1ce8784cbc6d1b88790a43e6083a6302f03e9ae482acc0f232a98c843&quot;
+SRC_URI[md5sum] = &quot;6b90dd55851a8ccb3a19fe2cb82cb82f&quot;
+SRC_URI[sha256sum] = &quot;ba040c24d20aa302f78f4747df549573ae1eaf8e1084269199154da9c483f07f&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------557D18DDDB585DBC726E641F--
