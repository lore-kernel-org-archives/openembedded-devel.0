Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.68])
 by mx.groups.io with SMTP id smtpd.web10.3008.1591818736520346089
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2020 12:52:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=jOW1QFMG;
 spf=pass (domain: windriver.com, ip: 40.107.237.68, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a5q9htNuF2dJ4NFK/VajEpbiXjTNCFWCaB8U/7Z8UlNPBH8UOyJHaVg4TkcI48MnyLCxspx+5KTQdReWuabh28l4DZ5cLX1G+PFJohoMH71NJmPjua48cQgaGLHADqMBYvXuclFHUTOfLDY4VUKEhXpEXddoZy0lJkpSidk9SqHws9YaGBgeuubOqVIbY3bLQUQwW4dd3Jp1iYvirKneiCyEft7zEu3L6O8Cww/V5VdwrKA0YS4+9mHK+3B2rTW40Erzdup7w1SPFlrvUW811bAxcW0oyY76cub7jelGg/ddTDf+AlS8vQC87z6buN5k1vxlEM2gvNNrkAiVjwrK7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OQ2z6FTO+Q4m8mehnPfl3AAgvyrGnWSFaL95v/xFQUg=;
 b=LVmF7pmdABd3C+sgpjGd1u7BFt61EVE5dZTTvM+j62NLaQq+XtxCJrk9FUFmzsSPGZhoP32Af89adOeAnS7p/ukaret7e8e8hzDCYgdhsnWz4HPECKBrwMqzbYnbI7lH2PBB9iRO7ads4VbhoteWgJpszDP8j0DdxKC92e00s8G5E69urd67HIJeT9DMKc6v7N9lv1pImG6NpYfATJFIvbUNtPQKwi/TZGS9wF3PbDiZl6c6xWn+d+/aiK8xLw7XgyHgAQXyfZX/I0h1Y9pcozwcXaRjD0WAMq77qVuFL8RLRgKgyKoqoHYsSc7a6Sy3sIFzVxlPTq6NVGEzfWTo8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OQ2z6FTO+Q4m8mehnPfl3AAgvyrGnWSFaL95v/xFQUg=;
 b=jOW1QFMGjwME1Ci0Ybh2Z9kdVvf3j5z69sc0/fPhOnrdqAzIHetp7AsWzpZrIQ0nu/KFSVfVU8WbGlyd1CU78UtOvz43jbI5mDRUdKm8suKw1KZqvGxr2td1ULoLwCMwlayBe6IPmuml8xs7jDwZmQA7PWCfd2o48wk8FSKnRxQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1522.namprd11.prod.outlook.com (2603:10b6:405:b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Wed, 10 Jun
 2020 19:52:15 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3088.021; Wed, 10 Jun 2020
 19:52:15 +0000
Subject: Re: [oe] [meta-python][PATCH 4/6] python3-urllib3: Upgrade 1.25.7 -> 1.25.9
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200609111050.32307-1-leon.anavi@konsulko.com>
 <20200609111050.32307-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <480d7881-6dc3-07b7-2cce-db01f5c92621@windriver.com>
Date: Wed, 10 Jun 2020 15:52:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200609111050.32307-4-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0072.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::49) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTOPR0101CA0072.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::49) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.20 via Frontend Transport; Wed, 10 Jun 2020 19:52:14 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f9821cc-bab8-43f8-8b07-08d80d77c635
X-MS-TrafficTypeDiagnostic: BN6PR11MB1522:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB15222FE7B7D8A0A993965A6E9F830@BN6PR11MB1522.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-Forefront-PRVS: 0430FA5CB7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	g0Ys1TvwUWZ0ehuRQEyNhRjGLRHorfUZC+XAqU5n2qexGyIjQnQYCGyOfEDRipB/YKHqHGF1h0R9mjhaC5pwBfyjTcgW17z9lUSk7V2apHuPZ1QLzHSqw8pcD6mNWNn48jl6o7lO3rRkTcFa8HpElQpFJz7+uWxDMmz1aXisLv6qdMFFdsSHzT9srXTWkYR7JYzNT28UtRapuHkh89L4BmsGr+Con1SVK2W3Hva8HXtwTiBH7xl4IOYkrgyXKnZYmtfM9foApMPJ0H+A9L8J0mFFND2lIpjNHnQKzDPrlz8CxmyKQVbdj7hDrzwIXvI/cE5cVgqFY3uxrQKOETwaia6C23fEH1HhXQeYEc4/RDavl45lHHKJ6pMnIaKSdCpS4o3piOoPe9dxBJJXEVdT17slpznRik+MmZqxwpSWkPaS7jPw/jrPXVchb9kGav3OikrXIJ7X+DhTLNfMSLl8Yg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(396003)(346002)(376002)(136003)(366004)(956004)(166002)(8676002)(8936002)(2906002)(31686004)(16526019)(16576012)(6486002)(83380400001)(2616005)(186003)(316002)(36756003)(33964004)(5660300002)(66946007)(66556008)(478600001)(966005)(66476007)(31696002)(44832011)(52116002)(86362001)(53546011)(26005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	SY8pEFRU30Qtdu3HipLVmJ4gAk2ProL7kLg8cA8Zb8keD4o/tH4J3LYou0axDbRuZTwLURy4y7GrSlka0AWvmaYCTuPPNflz7uU+ZCik89gvC5f1cqfr5BbsZxiVuK7nov6nlDGIPJvGshPJ3xAWs5S4HfJPXiT7Hl4hn14jx7fZRFsh9pzWMG2tr88iEC9lNW6GA/8SIMIYy8px65Pn9orP9chY3Vpu5sw+tRDTIIMYCk+SSbupnwvyA0jENRDK6Iw89cZzS9EgxVSi+wxq8giTfY1dE369sqPFX+Ze7GHRDOO7AsSEltgc3W6M7FjCR6v80XsoPfl1GVQlDFCRDdvcEpQCLGx01PMoYMVq3doLqHfQhru4YFaAlV+dxdUYpsV+iQfLvCTfIuOwezhCc1l7uxZREf62mhoCu7U2bis9aeiYW9bmOCfb6zlnVsDT7eVbLlLw8VdBHZA9TtQ7kX84/CGWvtV9AJJ33HXZq5d8own6tGSo0UWqaCn7kB5p
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f9821cc-bab8-43f8-8b07-08d80d77c635
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2020 19:52:15.1641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1nZFmfCVB0//oLQ8VjQ59P/wkxCP+OJsboNqBipz1VXMdz5U/HK/jwC5CxYVStzXODCoaZ6QhBovkOFYU1ROVBgIUmgHJDKVb5WpFOSwrqs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1522
Content-Type: multipart/alternative;
 boundary="------------B2F3C15E3057B68BADA738E1"
Content-Language: en-US

--------------B2F3C15E3057B68BADA738E1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/9/20 7:10 AM, Leon Anavi wrote:
> Upgrade to release 1.25.9.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-urllib3_1.25.7.bb => python3-urllib3_1.25.9.bb}  | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-urllib3_1.25.7.bb => python3-urllib3_1.25.9.bb} (79%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-urllib3_1.25.7.bb b/meta-python/recipes-devtools/python/python3-urllib3_1.25.9.bb
> similarity index 79%
> rename from meta-python/recipes-devtools/python/python3-urllib3_1.25.7.bb
> rename to meta-python/recipes-devtools/python/python3-urllib3_1.25.9.bb
> index 34c15b6c2..8cbc1f9f9 100644
> --- a/meta-python/recipes-devtools/python/python3-urllib3_1.25.7.bb
> +++ b/meta-python/recipes-devtools/python/python3-urllib3_1.25.9.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=65715c2eb961313d71b297dd5a04f85e"
>   
> -SRC_URI[md5sum] = "85e1e3925f8c1095172bff343f3312ed"
> -SRC_URI[sha256sum] = "f3c5fd51747d450d4dcf6f923c81f78f811aab8205fda64b0aba34a4e48b0745"
> +SRC_URI[md5sum] = "dbf9b868b90880b24b1ac278094e912e"
> +SRC_URI[sha256sum] = "3018294ebefce6572a474f0604c2021e33b3fd8006ecd11d62107a5d2a963527"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------B2F3C15E3057B68BADA738E1
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/9/20 7:10 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200609111050.32307-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.25.9.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200609111050.32307-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-urllib3_1.25.7.bb =&gt; python3-urllib3_1.25.9.bb}  | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-urllib3_1.25.7.bb =&gt; python3-urllib3_1.25.9.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-urllib3_1.25.7.bb b/meta-python/recipes-devtools/python/python3-urllib3_1.25.9.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-urllib3_1.25.7.bb
rename to meta-python/recipes-devtools/python/python3-urllib3_1.25.9.bb
index 34c15b6c2..8cbc1f9f9 100644
--- a/meta-python/recipes-devtools/python/python3-urllib3_1.25.7.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-urllib3_1.25.9.bb
@@ -3,8 &#43;3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/shazow/urllib3">&quot;https://github.com/shazow/urllib3&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=65715c2eb961313d71b297dd5a04f85e">&quot;file://LICENSE.txt;md5=65715c2eb961313d71b297dd5a04f85e&quot;</a>
 
-SRC_URI[md5sum] = &quot;85e1e3925f8c1095172bff343f3312ed&quot;
-SRC_URI[sha256sum] = &quot;f3c5fd51747d450d4dcf6f923c81f78f811aab8205fda64b0aba34a4e48b0745&quot;
&#43;SRC_URI[md5sum] = &quot;dbf9b868b90880b24b1ac278094e912e&quot;
&#43;SRC_URI[sha256sum] = &quot;3018294ebefce6572a474f0604c2021e33b3fd8006ecd11d62107a5d2a963527&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------B2F3C15E3057B68BADA738E1--
