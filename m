Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.68])
 by mx.groups.io with SMTP id smtpd.web12.93613.1597860403363596267
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2020 11:06:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=BLDUTiPJ;
 spf=pass (domain: windriver.com, ip: 40.107.92.68, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BC4Ba8+/UWtXNZAFdj99hPwzmLSRfHEHcWYsI2s7wWVuMue8lp5edQMF99L0KVUaUcPf2EgsxRgub8kIBlNohny702l91uQvIQQNhOaJJDWvD+vIVLJhjdOHSngIErgWBWhKjH5Q1gmL71xzQHVVG7bOa694rl/YM1P9v0zt58Hb3AERJNKv+0qGgrtwdUOJ2hYm6IDRdaHSlnUrAGHRxV6D7fYiUCy47qRpv0AMFst2Z61o1CSnwjANdqM8EGWA3969Y/TtPv+CEv/4XoQv4DKgFG2plXCSr0j2c1UVL0a2niEs+h3zrizUPsmTTzqZ1BlMlihlotytvCR1WYxTPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8tUXsF4GkeywL7lCzMhnZMwiyUg6sGP72K91wzeHd9s=;
 b=eZITXrWu8+4bOxF3+twOm46IOhXFN00PIJp7U/oT66FFjx+QeMJjfZqDb7ZeOkb3clSd+TrN3QCmlc8/oLnOXzXVj+QjFtIMIvVruWUwyTAyM4H279t+otyyT1PNgCF+fvSZGTe0talykO8zxGELHU20YR9CCNnPzHoxQmO6Ihq54TPG+evLYHiClXc/JonXC56mN5+y1l7w4ZYAk6xo2KuMCNSjNkDednPukGX171suJL/6cHKjWeAPt7zAhoz67jZMFq+psDZETLT0zUEfOYUgt4I0C2ma5gAs9Mjms4jBSuFZU1TVT+Cb1SlLaoypIZhDl2xcWezs2aXGg67GsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8tUXsF4GkeywL7lCzMhnZMwiyUg6sGP72K91wzeHd9s=;
 b=BLDUTiPJMuHt1LWkaTmaKBQ76avhgyi1v9XgJodYLZ3clVQEgugde3jG22GzCsNnywZLQnyHmEaY7UNvqVfGA2urew+UHKLFOJbj03bLSavXiAvyX9K/yj8RsMjutsLTWwBOPDr2TUQe5TDhZqTTTdQFrTuHB1xzhthAT+6Gc94=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3913.namprd11.prod.outlook.com (2603:10b6:5:193::33)
 by DM5PR11MB0073.namprd11.prod.outlook.com (2603:10b6:4:67::37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.28; Wed, 19 Aug
 2020 18:06:40 +0000
Received: from DM6PR11MB3913.namprd11.prod.outlook.com
 ([fe80::fb:781c:eb42:b4f]) by DM6PR11MB3913.namprd11.prod.outlook.com
 ([fe80::fb:781c:eb42:b4f%4]) with mapi id 15.20.3305.024; Wed, 19 Aug 2020
 18:06:40 +0000
Subject: Re: [oe] [meta-python][PATCH 3/6] python3-python-vlc: Upgrade 3.0.10114 -> 3.0.11115
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200818153444.15728-1-leon.anavi@konsulko.com>
 <20200818153444.15728-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <c6a2246c-3e13-3275-d3c7-1c3b4b31d6d5@windriver.com>
Date: Wed, 19 Aug 2020 14:06:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200818153444.15728-3-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0018.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::31) To DM6PR11MB3913.namprd11.prod.outlook.com
 (2603:10b6:5:193::33)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YTXPR0101CA0018.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend Transport; Wed, 19 Aug 2020 18:06:39 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c9c0150-2e41-444a-ab13-08d8446a9f3e
X-MS-TrafficTypeDiagnostic: DM5PR11MB0073:
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB007379BEAD0B59278F85ADBA9F5D0@DM5PR11MB0073.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FSA32q8ifJqyP75azbEZ0pgaxEUYgkiWMdxV2M4pSO32rK7Hd7KzO2mJ5e/3hRhK50eYkPuRqU2J9WispTfdyvAWRA1W92HVHVlzkJeYVz6ETtRatnhpABBnMRaMkY2UUnN7gPiwahnRHvqoZs4QRPMm65Qd7L25PaeZ3W2oP8zdWWDS+B2Q9W0UlvFRM0qRZN0TYO38xbE+k7b/aVyBNKWdzENXdScqZNkEyqSel7lkTXQ6d6Hlj+xWhV9awSUopwcA1hH0jG+hA3cv5pEHqL5pP7mLFQk22i3tbwm23PdOG6GATzGzIB9MxgO1KgV4E1QNIK9CAUXTU65qGRxss/wAg8Dn3nME1dAyiysAckOLXyHAyN7Ak4N5d9UVte4GM3gcqHdgDMSNJhvTCBpaAZ+GDZr/EnwTx7PZtTck5WImHtJW0raGHrlfHWTVPx+0u/CVvud0wjioJEQBNh/ntD1cxlBPLu2g5QHOzQa7w0qzq6ODhsEOCsQG/9CKNOw2
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3913.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(376002)(346002)(366004)(39850400004)(396003)(44832011)(36756003)(966005)(33964004)(6486002)(16576012)(186003)(5660300002)(110011004)(31696002)(478600001)(53546011)(2616005)(83380400001)(956004)(66476007)(26005)(66946007)(86362001)(8676002)(8936002)(316002)(66556008)(166002)(2906002)(31686004)(52116002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	5caYtHtGoPT0yNDD3u1Ap69LyEtxPThFXvYEDEreWILOJKW1gEaX7hJSCQBySImIJyv2Tgsf1nr1BbyvcdtvNEUi3+eANrvvO1UeyoisahtadPT0NjFerOSd8eXTZJfqfoxVoruMH7dYqW13E3Ge4s0imumcmCUT0wAhaQiDEfkcs8Grx2dDcwwj9jZUD76ElOrqYIC0sObb0HoyT3idMa6XCpUOebSbb1LRQgcvDmOzVkfSiFFwEqJb7b9wGktSSfWeKfCjFAJCMM9dR133nLB0Gb8u/MqejhqDvwXxxxYFYXRYEbh7BRLJeZCdUNIhvYHLpMAaN4DQJIT/H82WAZLQxOF9t65I3lFpqEFoeVG/BjUKvAHMhHqcwZB3EGyIsqhJekmDN/U3Q47DD/ojVoJHozsJNaHZ8mmZ2PEMHo7AEiZyOhLvDEvN1K5BPkR3XOiDtT+35sWAaf28GTBfLXVeoD+4dvmg9S9W/If8ZEtgiAr/BC/R15vQMUJ3viE/qWrCBIPwX+sXiaSRWVrKILLpJbED7Tr6Kkfd/ifelpFhI69UmVkApBhOqvzp8hTGM+nLtV3R5t0uHPTHejSNiAzgl1r+ZzNkz2N94v2GCsH1CefvdwTbI1mcwgqOYTerXC8m4pIVwXdtpXA9VT1AWg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c9c0150-2e41-444a-ab13-08d8446a9f3e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3913.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2020 18:06:40.3170
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C0Nb0eSADiixypQTYAJxPrqxFWG6RwvTJeOtcjFmTKbVT7j6ShEzKRfk5lRo0eENwEQUPylE/n7ExfqRjER+WNygv7n1WQk9GX/t03nP4a8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB0073
Content-Type: multipart/alternative;
 boundary="------------CC6A684609122E0E0A05EB88"
Content-Language: en-US

--------------CC6A684609122E0E0A05EB88
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/18/20 11:34 AM, Leon Anavi wrote:
> Upgrade to release 3.0.11115:
>
> - Position is now an enum
> - Add Media.get_meta tests
> - Fix typo in play_buffer example
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...ython-vlc_3.0.10114.bb => python3-python-vlc_3.0.11115.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-python-vlc_3.0.10114.bb => python3-python-vlc_3.0.11115.bb} (65%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-python-vlc_3.0.10114.bb b/meta-python/recipes-devtools/python/python3-python-vlc_3.0.11115.bb
> similarity index 65%
> rename from meta-python/recipes-devtools/python/python3-python-vlc_3.0.10114.bb
> rename to meta-python/recipes-devtools/python/python3-python-vlc_3.0.11115.bb
> index 7f8affb4f..014509d55 100644
> --- a/meta-python/recipes-devtools/python/python3-python-vlc_3.0.10114.bb
> +++ b/meta-python/recipes-devtools/python/python3-python-vlc_3.0.11115.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "wiki.videolan.org/PythonBinding"
>   LICENSE = "LGPL-2.0"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
>   
> -SRC_URI[md5sum] = "17dba9a55903cdcae10814080fcadb8f"
> -SRC_URI[sha256sum] = "c1a8a295bea8277fa3d9a07dcdf873fe18c5f11a0e4d1f618df47c316fe0003b"
> +SRC_URI[md5sum] = "422fd025294af2e55dfdcf9bc7d7dbac"
> +SRC_URI[sha256sum] = "a4d3bdddfce84a8fb1b2d5447193a0239c55c16ca246e5194d48efd59c4e236b"
>   
>   inherit pypi setuptools3
>
> 

--------------CC6A684609122E0E0A05EB88
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/18/20 11:34 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200818153444.15728-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 3.0.11115:

- Position is now an enum
- Add Media.get_meta tests
- Fix typo in play_buffer example

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200818153444.15728-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...ython-vlc_3.0.10114.bb =&gt; python3-python-vlc_3.0.11115.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-python-vlc_3.0.10114.bb =&gt; python3-python-vlc_3.0.11115.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-python-vlc_3.0.10114.bb b/meta-python/recipes-devtools/python/python3-python-vlc_3.0.11115.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-python-vlc_3.0.10114.bb
rename to meta-python/recipes-devtools/python/python3-python-vlc_3.0.11115.bb
index 7f8affb4f..014509d55 100644
--- a/meta-python/recipes-devtools/python/python3-python-vlc_3.0.10114.bb
+++ b/meta-python/recipes-devtools/python/python3-python-vlc_3.0.11115.bb
@@ -3,7 +3,7 @@ HOMEPAGE = &quot;wiki.videolan.org/PythonBinding&quot;
 LICENSE = &quot;LGPL-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=4fbd65380cdd255951079008b364516c">&quot;file://COPYING;md5=4fbd65380cdd255951079008b364516c&quot;</a>
 
-SRC_URI[md5sum] = &quot;17dba9a55903cdcae10814080fcadb8f&quot;
-SRC_URI[sha256sum] = &quot;c1a8a295bea8277fa3d9a07dcdf873fe18c5f11a0e4d1f618df47c316fe0003b&quot;
+SRC_URI[md5sum] = &quot;422fd025294af2e55dfdcf9bc7d7dbac&quot;
+SRC_URI[sha256sum] = &quot;a4d3bdddfce84a8fb1b2d5447193a0239c55c16ca246e5194d48efd59c4e236b&quot;
 
 inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------CC6A684609122E0E0A05EB88--
