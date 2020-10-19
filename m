Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.58])
 by mx.groups.io with SMTP id smtpd.web11.12317.1603110739982886592
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2020 05:32:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=C38AQRJ4;
 spf=pass (domain: windriver.com, ip: 40.107.237.58, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D8RlfvKDRnYtMQf9aEpFgH62LihvapA21+QtiDYuetj0q6dWeTwEdTIJ5MgJ6EPfvt1SvGJrmiU3+69K2pNXE1xqO/eqxXFeLVjEUDuZH1bQKAOydVuVnuheMWQ8vhGc0LufeTTUi5qZO4ir+meLTSF1Q1bwE1MyW26IfZ+kW+6mNFOa5qpNPjvSs7ND1IljQnH2KCrd94oue6eYyblCwBkr8o7WS2nP5RvQy2oti0vWAVz/eA3UfoYGy4xIS50a6paAgzT6eihlG/+s5eD/buJge7NaI6c1zBDrKzwIDJ4QjCj+hVq28z5ex661aYBMexlweKKSn7Co2IzPNWshEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qcpiQkVjnbvvyUy7aQ+xohzzP7hTavhdNNKQzGXgiIA=;
 b=Uv2vO5gKPr67hM0NTEFvPYd6NazyFqk07Gh7Ya4KmbfYjiBq0hxGWX0KNkVL5t8EuBv4DnXlNS1pUGs3r8h3LkN9955Lw9efaLd0OWJAukgESSi93Q0P1OvkRVJgKSpqavzcU1rXx+VRw2VvzZ6Ky5q/2Wb+4E0TCdbjiSeDFnq/k21CtRg1iyJdllJxeMRvv0DiBh3P6oxKnaepir1pMnl3mjdPy66otF7QEO9zmnasmyRg99SINoI7O/UrlvMIJZBEwTUKL9EZLWZbQEwQzKaJGxzz5wNtxunRe7JXZX/ne7VHLu1To++ujw0e6XMWkXK+05rBM8w701dyuSPygQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qcpiQkVjnbvvyUy7aQ+xohzzP7hTavhdNNKQzGXgiIA=;
 b=C38AQRJ4yMiy0uL8l56e6bI3eXJTYsiuDTMvQytAUYtInuDAtOIRI1jXt+F5huMywdzfmYDKTyqtfyz7FyEMXA8V+jCTDhVs0OgyHYJRzIieKhDXKqWVdfaaWKBbsm1sOK5uJ4dtvk3zmceMfRaoc/YWJFAKokY3s6ZlfKJRxo4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4323.namprd11.prod.outlook.com (2603:10b6:a03:1c2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.22; Mon, 19 Oct
 2020 12:32:18 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3477.028; Mon, 19 Oct 2020
 12:32:18 +0000
Subject: Re: [oe] [meta-python][PATCH 2/2] python3-iniconfig: Upgrade 1.0.1 -> 1.1.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201015072201.13634-1-leon.anavi@konsulko.com>
 <20201015072201.13634-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <eb0f67e3-f362-9f75-4904-540112b79a1d@windriver.com>
Date: Mon, 19 Oct 2020 08:32:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <20201015072201.13634-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BYAPR08CA0053.namprd08.prod.outlook.com
 (2603:10b6:a03:117::30) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BYAPR08CA0053.namprd08.prod.outlook.com (2603:10b6:a03:117::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.22 via Frontend Transport; Mon, 19 Oct 2020 12:32:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 09753e62-5b2f-4c66-5977-08d8742b04b5
X-MS-TrafficTypeDiagnostic: BY5PR11MB4323:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4323E928685692DCCC197C729F1E0@BY5PR11MB4323.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:159;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PiPKb09KBIggSDVHoMuhKROwFZ1E21TJk9NsfBMMiJ0mhrvp6coF7rHzvlvwmHMXP087AcS72pfFg7CLTXOtE6/ti/g71qvWiPO04Ljeo244X5A6SXw6vGxok03JFGCHovCZIhNoOGwWcY1W3kZXlzj1SYBVu7jKDaHbUO7Oy4/VR+42J1Ikkchd6jyozKOWy1VgjOoYvQ6pzL9R1kEttz7K5H6CvjJL1vMq8N6MLlh/4ypi6MxN+CmfW9LdFjAHH8TWUhmRe00We+V4X+yokqsNzA1wNhUPTTjuVRtV9XRF4aVF5RcQ03FaLesehmqL9xjgLZv717GSDZStfNMbjmNRP4qyXnXuW1p511UU2RsFlZKWchHvjUjZk9Cgwj9AHaUuVUthIYRw8gLiLA1DPiaEguyMLTiT5EoUp8SbXd06V4qzL5pdJLrgLIWy0xA4dcPDKUFexuS0mAMTsz/cGA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(39850400004)(366004)(376002)(33964004)(6486002)(316002)(66556008)(66476007)(2616005)(66946007)(86362001)(956004)(52116002)(8936002)(166002)(36756003)(2906002)(16576012)(53546011)(83380400001)(478600001)(186003)(31686004)(16526019)(966005)(44832011)(8676002)(31696002)(26005)(5660300002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	Bw+RHVVB62HTQFnryjcFQmALXzAjsnGQJmLGDyzmxEr1YfU9iIHX8LNL3mpf8nbVC0oktV5KcynNBKlxmj2bxSRyq1Tzf1+r6f3/f2tTEs4HKnaKb4rUQeGVUIFRaWG6POtUoh6oi8Zp/Bsfiyg0s9DBP86QaBaOmYZmaPHhWPMgGIhBhYmRGDj599M5W/r0pbtWq0tzTEjJMK/hAFeuhHtl/xuFi2+julvEuGybZoRUeXQCOZpRhfi1Fkjcze0ePYMYVUId0R4qjDwlLWtcYGh0449DSYs75mC4CxnrDJdTLq7cb29Jn/9AgkEN9b/7JyrrnnAnZIQfPVT7VKK3IXwN7dpFLkZG2/rcnhz6a34TtYMTeMbRrJfv0svE/gdgo4GLQLDrCMd/VpRO6YC6uOontTokpi7tIfGZZ/IMqW5YCOOjz4ULltL42rYkfXkpVZrBAWt6lVErE11a/mPTCJ5RDZ6JzUmf7QFr7CXvJR+sj3i2Q3jmFlwNLtJIrECkz9LTGrIYFl1mAY+EylORCbQ8UYMIA0VV/FvyOp9a/i77mwOGO4CT4uwkt+mSCEENu41yYmprjpe7z0EMI65CDFcrhyx4RwuSrzlfCTfGFCp61FVPCl8sAYG+1yKAhRx2A0coQuEzN1D/Pjvj3L8AjQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09753e62-5b2f-4c66-5977-08d8742b04b5
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2020 12:32:18.6283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y6KTEozVJgb/UPZt76MN98byoGN7Rlktr20aC0W3PsrjdEUVoqYABqVfLt31fJDB87cSs85Ji/PbfJCbqaTfW+AC0ZAMipoheiRiAsYl3rI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4323
Content-Type: multipart/alternative;
 boundary="------------CF066152BB0366D6DE29C3B6"
Content-Language: en-US

--------------CF066152BB0366D6DE29C3B6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/15/20 3:22 AM, Leon Anavi wrote:
> - typing stubs
> - ci fixes
> - fix version determination
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-iniconfig_1.0.1.bb => python3-iniconfig_1.1.1.bb} | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-iniconfig_1.0.1.bb => python3-iniconfig_1.1.1.bb} (54%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-iniconfig_1.0.1.bb b/meta-python/recipes-devtools/python/python3-iniconfig_1.1.1.bb
> similarity index 54%
> rename from meta-python/recipes-devtools/python/python3-iniconfig_1.0.1.bb
> rename to meta-python/recipes-devtools/python/python3-iniconfig_1.1.1.bb
> index 9ed0e033b7..af4291bbf4 100644
> --- a/meta-python/recipes-devtools/python/python3-iniconfig_1.0.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-iniconfig_1.1.1.bb
> @@ -3,6 +3,7 @@ SUMMARY = "A small and simple INI-file parser module"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
>   
> -SRC_URI[sha256sum] = "e5f92f89355a67de0595932a6c6c02ab4afddc6fcdc0bfc5becd0d60884d3f69"
> +SRC_URI[md5sum] = "0b7f3be87481211c183eae095bcea6f1"
> +SRC_URI[sha256sum] = "bc3af051d7d14b2ee5ef9969666def0cd1a000e121eaea580d4a313df4b37f32"
>   
>   inherit pypi setuptools3
>
> 
>

--------------CF066152BB0366D6DE29C3B6
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/15/20 3:22 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201015072201.13634-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- typing stubs
- ci fixes
- fix version determination

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201015072201.13634-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-iniconfig_1.0.1.bb =&gt; python3-iniconfig_1.1.1.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-iniconfig_1.0.1.bb =&gt; python3-iniconfig_1.1.1.bb} (54%)

diff --git a/meta-python/recipes-devtools/python/python3-iniconfig_1.0.1.bb b/meta-python/recipes-devtools/python/python3-iniconfig_1.1.1.bb
similarity index 54%
rename from meta-python/recipes-devtools/python/python3-iniconfig_1.0.1.bb
rename to meta-python/recipes-devtools/python/python3-iniconfig_1.1.1.bb
index 9ed0e033b7..af4291bbf4 100644
--- a/meta-python/recipes-devtools/python/python3-iniconfig_1.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-iniconfig_1.1.1.bb
@@ -3,6 +3,7 @@ SUMMARY = &quot;A small and simple INI-file parser module&quot;
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9">&quot;file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9&quot;</a>
 
-SRC_URI[sha256sum] = &quot;e5f92f89355a67de0595932a6c6c02ab4afddc6fcdc0bfc5becd0d60884d3f69&quot;
+SRC_URI[md5sum] = &quot;0b7f3be87481211c183eae095bcea6f1&quot;
+SRC_URI[sha256sum] = &quot;bc3af051d7d14b2ee5ef9969666def0cd1a000e121eaea580d4a313df4b37f32&quot;
 
 inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------CF066152BB0366D6DE29C3B6--
