Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.66])
 by mx.groups.io with SMTP id smtpd.web11.15246.1593523493069382672
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2020 06:24:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=nGc19L16;
 spf=pass (domain: windriver.com, ip: 40.107.237.66, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EOVVCl0hFivOwdDnCs6ta12wO1RuAan/luu2YrMvJImfTYYibvqUINwYjVl5lOJ7mWIFYF+LUcpgBpBqf/K6E3LG5mio0MPnC+g+hHw1CSIVQ2KyRUUQT+SmUtAn1h2LJ15/LOLhfr5mu5Y/CH1nwgV5Qv8ii/4QQQqnrOiHfScbp1omoquDhqvDCZSJFdtgeSOUzsCF6tAAryviS60MU50h59bjjIsVsWLoaRaHsp2Zvc1tw660njvY1aeqN6Haoynh9ftRpz2IFNRXtcWgXY+MhrndVtJdzsTAqAnIJl7I7Ix2SSKtdDnwamsuQFQ+ej2Y/2K/Jr0QlUbGuPPISA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i61VAfUrcUcjUGgfxskZzV1YQztDr8jJ3WvglKQ4m/I=;
 b=WPB/7T4azPYliDoG/pBUvnqZBGOFlCZ54VEaaIs2porz6uQJTmwpqqWbGmm3Rzvo7wxXUNpQ7R3LsTRZHHsGVoiKir04QUIXKGwX6+GXY158OQ6MmM3rfK/Fwe7WfQMvU3iG9dpE+FBELeLqAToC9V8HHcuNxphoLDRoOL4pmReNtECciM0rbcpvgQoIlWBgjbkyE3a1mFL1Y2XgT0BjRGdxSyEFAzJOHo8zPZOZSoXiK/Lk8DesnHQwirD53S1oZpw/zdsS/0odKEX9+qlYSnf5WQXoGRe4bKiUR01qGe8RopQHrI2AT3h65W8X1Sr4vmK7i2wPptYIrM6ooDSTIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i61VAfUrcUcjUGgfxskZzV1YQztDr8jJ3WvglKQ4m/I=;
 b=nGc19L16zytOkSt/bLqCL31YOIyrN3iP3YwVGKMXrdX7v6UOvrwAUvhqD3QIOEC7hOfjZ+TWfB50DwqcemKU6Jil7uIrriwvG+M6wsg0o5GfkQaAFLZHnY5bHe1ypDwY+02cRlw5MtSqsMPptNq5q9IE1zHopGoYpW8twnKDqww=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CY4PR11MB0006.namprd11.prod.outlook.com (2603:10b6:910:7b::18)
 by CY4PR11MB1686.namprd11.prod.outlook.com (2603:10b6:903:30::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21; Tue, 30 Jun
 2020 13:24:51 +0000
Received: from CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4]) by CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4%7]) with mapi id 15.20.3131.027; Tue, 30 Jun 2020
 13:24:51 +0000
Subject: Re: [oe] [meta-python][PATCH 07/10] python3-autobahn: Upgrade 20.4.3 -> 20.6.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200629121233.27026-1-leon.anavi@konsulko.com>
 <20200629121233.27026-7-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <e49bcf41-7edf-edfa-f9b0-119fd624b99f@windriver.com>
Date: Tue, 30 Jun 2020 09:24:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200629121233.27026-7-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0018.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::31)
 To CY4PR11MB0006.namprd11.prod.outlook.com (2603:10b6:910:7b::18)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0018.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend Transport; Tue, 30 Jun 2020 13:24:50 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5b02ce6-bc89-4d86-23e5-08d81cf8f83f
X-MS-TrafficTypeDiagnostic: CY4PR11MB1686:
X-Microsoft-Antispam-PRVS: 
	<CY4PR11MB1686CD3E778D17B3E05CF3269F6F0@CY4PR11MB1686.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:262;
X-Forefront-PRVS: 0450A714CB
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ngl6WvQ7PnTnZpp8XDGpV7ctFr6kdD9UjXIFCqcJeQCnlG8Q0U7GBLrHZbeGJyq9ai72nAIh0si0Ps/H7X7HnlX2t9nrQYlNXDZAG1X+3d49tckhhxq5j8UDRR5kfOBIJQMW0chwf/pfCzE2+R6kn2+YrmgUa9g+pgyG0O4bGmsGNBeTVHvHyc3l2bFs0nkRugSyCclCsEK86yGioCKYmGcavwSw5uQ8odpLadXsptfO/UJZrb1zeQuSKAihXYKKqqUyd4LyTct/cAdaaPkvtNpWTMd99XxsSQugkmgrJMDLh73Z6doMuxNMoUiSdVWDS8ax1p4iP8ZLMgLjgJwbYJ4oyp3H+bAk0BQJb819jSw14q4SDqMLbqOsYjz4z9TK6rTTji8ctfmrxZPOw/cq1xa5vkbS3raH+E5OKonUXgSGd0V87SdiahXjtzWS+iv7UWTKaZ9hhdUeUN1oKlilyg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB0006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(366004)(39850400004)(346002)(136003)(376002)(53546011)(31686004)(8936002)(2906002)(8676002)(966005)(44832011)(66574015)(16526019)(36756003)(83380400001)(2616005)(956004)(86362001)(26005)(31696002)(33964004)(186003)(478600001)(316002)(5660300002)(52116002)(6486002)(66946007)(16576012)(66556008)(66476007)(166002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	hpLpdxMaxaFcJ/AN7puPHe8aV94MV++P6DF/eM718UbeVnMAAUSmCEKsPXqym30t3wD2c8LMYbGGq7R9ujFugYjur4FrxmNq+pun4sfKBvkqzMsz7T/+ctl+kqZQEw9dnCpJEP9iliHxgEo7OaOVx2nRqT22uSdesV/Mk5dqQaG/NBDotrDWvM3C1bneA2cQKmsb7N635Jw/YFx5S2y3Ut7TPlTFlYxhO/Yk04Kmt3AQ3A7sK8BF1knIU376LU2Fa91YNO78e9Q3xDvNF9N2r/v89Hs5jw756D3oT/bsXAGinpB7uPaTW5mWCTe99YFheFWSlvkotI4SAFWvoA5lMy8eoOvZXJsXzq2JKz0UO1TshfX2x6+eVV//M/wx62lORVw8IMwu5xeW9GuvyB3xlAMvL/gB0+kJfsuB36VyZaZGFhmrU/O+3ocBfJaFiSbxtsm0E3Y6lPppx01BbVyZmOfYs2+jnd0ZeH4pzMiE1ChKXrBFbyPILGQk1kTR3KmA
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5b02ce6-bc89-4d86-23e5-08d81cf8f83f
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB0006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2020 13:24:51.6579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9G4WLhnQ4Dirm97S9paTwjTKKOaNTY0AtqD2WgbXzm9aCbhLnEBlXIlYZgzvz3hoMxXN9ZCc1LYVzAULeeEyXSdYqxMjX2Tb56jtMJkuJe8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1686
Content-Type: multipart/alternative;
 boundary="------------9A2441665DF490FB128E0F01"
Content-Language: en-US

--------------9A2441665DF490FB128E0F01
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/29/20 8:12 AM, Leon Anavi wrote:
> Upgrade to release 20.6.2:
>
> - fix: xbr fixes
> - fix: use cpy 3.8 for running flake in CI
> - new: Ticket1392 internal attrs
> - new: internal-only router attributes and hook for router to add
>    custom information
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-autobahn_20.4.3.bb => python3-autobahn_20.6.2.bb} | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-autobahn_20.4.3.bb => python3-autobahn_20.6.2.bb} (78%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-autobahn_20.4.3.bb b/meta-python/recipes-devtools/python/python3-autobahn_20.6.2.bb
> similarity index 78%
> rename from meta-python/recipes-devtools/python/python3-autobahn_20.4.3.bb
> rename to meta-python/recipes-devtools/python/python3-autobahn_20.6.2.bb
> index 60ef57d04..171a6dce4 100644
> --- a/meta-python/recipes-devtools/python/python3-autobahn_20.4.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-autobahn_20.6.2.bb
> @@ -3,7 +3,8 @@ DESCRIPTION = "WebSocket client & server library, WAMP real-time framework"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=97c0bda20ad1d845c6369c0e47a1cd98"
>   
> -SRC_URI[sha256sum] = "c6fe745d52ba9f9eecf791cd31f558df42aebfc4f9ee558a8f1d18c707e1ae1f"
> +SRC_URI[md5sum] = "bcafb42ea58232308777a265d41c1c98"
> +SRC_URI[sha256sum] = "6ac6b6653b8d20d632b034adccf6a566154d4efbeaa23abf7c3995fd601e9a01"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------9A2441665DF490FB128E0F01
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/29/20 8:12 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200629121233.27026-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 20.6.2:

- fix: xbr fixes
- fix: use cpy 3.8 for running flake in CI
- new: Ticket1392 internal attrs
- new: internal-only router attributes and hook for router to add
  custom information

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200629121233.27026-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-autobahn_20.4.3.bb =&gt; python3-autobahn_20.6.2.bb} | 3 &#43;&#43;-
 1 file changed, 2 insertions(&#43;), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-autobahn_20.4.3.bb =&gt; python3-autobahn_20.6.2.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-autobahn_20.4.3.bb b/meta-python/recipes-devtools/python/python3-autobahn_20.6.2.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-autobahn_20.4.3.bb
rename to meta-python/recipes-devtools/python/python3-autobahn_20.6.2.bb
index 60ef57d04..171a6dce4 100644
--- a/meta-python/recipes-devtools/python/python3-autobahn_20.4.3.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-autobahn_20.6.2.bb
@@ -3,7 &#43;3,8 @@ DESCRIPTION = &quot;WebSocket client &amp; server library, WAMP real-time framework&quot;
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=97c0bda20ad1d845c6369c0e47a1cd98">&quot;file://LICENSE;md5=97c0bda20ad1d845c6369c0e47a1cd98&quot;</a>
 
-SRC_URI[sha256sum] = &quot;c6fe745d52ba9f9eecf791cd31f558df42aebfc4f9ee558a8f1d18c707e1ae1f&quot;
&#43;SRC_URI[md5sum] = &quot;bcafb42ea58232308777a265d41c1c98&quot;
&#43;SRC_URI[sha256sum] = &quot;6ac6b6653b8d20d632b034adccf6a566154d4efbeaa23abf7c3995fd601e9a01&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------9A2441665DF490FB128E0F01--
