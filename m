Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.60])
 by mx.groups.io with SMTP id smtpd.web12.12521.1598359365251849547
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2020 05:42:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=BQWlM2YD;
 spf=pass (domain: windriver.com, ip: 40.107.223.60, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bhYaIBmEJMWjG+InXobV9URl5MyLTWvF132e4fzpxI1YgBAOONHLfX8qknBPaSZfkAFTZo6Llca6gD17/A0lUc6OA2OxbqngzeHDPg+O2sJGl9U6gvnP450mMW+Vf9K9U4YJ3us5JexFAKNVXvXTbWKgEm7/G0UcJ1r6lpuWxjTdSa8i7ZmaILGLaS2kdkgAEBEd1MVMDJuPNHtQkaSDVWApljZR1B/yILMwK7xnmIcT+OjxG8xH6brozkNmIR5hWYh76u5idzIpWSXfTF8mtkxcHImGbO8O1skd/2feXx45a9U/or6z2y3cIKUk4WPQriRxZj1VBvri2g7AbgXkjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ekLzk75IP53wRh0OSJ0fGqS6qwECW/CUf0Yb8c6Moes=;
 b=JPeEZPL/6WBpKwTk2Ln+tlleqQXom8PfdOyznlITf6/mv9q2hHWczHrW/3K2ey/FFrk0rr7cVEhkYC+fikCK+yfkgoSAjvtEuZvBwpYPOOHKKggSXWH/ai8z1z6xjrX0Kk7xuelYCFQELEcILAkzpJJQueZ4pSadV47rIkGGTcgofdvD2mRPvEw4VYNCvvXOwHK+2pbjxee4e5Kb+XMKMTVNG2yMhPKo8z6IGMRiW8EwtBSG7kRgHJndE7Fos+31uSp3FeId919Vw54vSRUE7RHoLD3IACWuhaTIDRuzH/3T17ncRY2SB48hQYvpd0UoFq49fSDCZyObTjmhM8YyDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ekLzk75IP53wRh0OSJ0fGqS6qwECW/CUf0Yb8c6Moes=;
 b=BQWlM2YDjpB653SSU0Oetq8pdoM9daOeOozoJyXh7hTOyTmGRYmXg8lW3zMig95QWBB2fwrGdCqGgLb20GYjg73uG4Z4izSZt09M6Mi0Kou8Cd0qr/Bi6F7TE58MdTxucJlLvxh454Rnf+3nqffx7Gp1vX6dJlUWu+/l1hCrvUg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4260.namprd11.prod.outlook.com (2603:10b6:a03:1ba::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Tue, 25 Aug
 2020 12:42:44 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3326.019; Tue, 25 Aug 2020
 12:42:44 +0000
Subject: Re: [oe] [meta-python][PATCH 09/11] python3-click-repl: Add recipe
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200821234504.719-1-leon.anavi@konsulko.com>
 <20200821234504.719-9-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <0a43a995-a511-e129-a7a5-d001541248bc@windriver.com>
Date: Tue, 25 Aug 2020 08:42:41 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200821234504.719-9-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::48) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YTOPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::48) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend Transport; Tue, 25 Aug 2020 12:42:43 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b80c2470-7dac-44cd-9b4a-08d848f45ce4
X-MS-TrafficTypeDiagnostic: BY5PR11MB4260:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB42602988AC4D579FD44A992E9F570@BY5PR11MB4260.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:473;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	o+jiLbdBxX24WkOmWfLPjfxt+7poeKHA44IwfKHNYtwtsAxymU8O1249XF6xyTr38+bFpuIPQ5LOntGyxLbfRXJYauu84f6LpqbV6AfepkINMGevdEq/vq96Tf2HZ0gRI5ABx2NOqyvdgbTK5Toee6LONblAAHdEvNYCy89JSCEpNkH2xqTBrf5QFN5Hbl8JDNgzdjA7lufoLsMZi4/SauiW5mzaeM6nds7hPF/4b93iAFJHYTOR08FRW31rKEGsl1xXv/0zYRtl9Dn8L1s6vSwaJrsI+HTmIFsMSnglmaGUD6meNuPGReae/Pm+W/Wkig1g6zqsQrMiIpZ300QYG6EuJPObBM20BFcD8qjlS5RQt1UnvOwhjx1+Yr1BGXmdQLOBVq2COZGzGqmM+NnJnuSELi+OV3OWa1S+f0Xe2QRAX6kH/+B+hQtyJ55EKaIq9VcGlvsC03hplrF6fhEmRw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(376002)(396003)(136003)(366004)(186003)(66556008)(66476007)(52116002)(66946007)(6486002)(966005)(8676002)(36756003)(33964004)(316002)(5660300002)(16576012)(31686004)(31696002)(26005)(86362001)(53546011)(2616005)(956004)(44832011)(166002)(478600001)(83380400001)(2906002)(8936002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	FugQwpoLEgzqOuIcXQzEEOjLCxJ2lJLqfacNCS9aPflU5Cn7jHfPe3oG9rBgTbI7EG2Wt1Y82bVIU/Vw2Ds1QtsYWtJ8YScxqnmhsnuKrhy1wJbJhBBsRvO2PEaH/vKqE3ep1FIuZXcE+IWiA1psiTAUgCavPoXoQTXo6x+It9hPXoBHqg8E6aYefqY2QFMunxnztS7kWkumm3/DXIxo/3PfBIDZqUQlvIE3X6w6M/mn9Rm+B9jf1CeXt6wJGROGbOkgMxbZtuW1q5oDFoXZLu9MGjY0VaoDKx7GwUSZiWPjF2ZWRSo1sZN7jpUnKhXTn+pigyPbhmZ394yhWoiHsFXP9gaQo2cbEgyHp/Tt8ZLsONqm5f6R9i6lzREfmeIuyItADpf6xaxWGVKlrBlkd5xOxgIgC7UtDjSDOsbB5MpO8OzRqeqxZmVuzkuUAE7deMewpxZo7lW+ZLKQwafWt3Z+HfsRdIL9CD/W10EgBRsRf3NaN3oJ2v9c+JT9SXv5HaOoibUVSn6IjPoMU7OFaV4qwvqRURLyUQ3pPOgdAm0VwTV3htA3MkvusIrFKkZrCDnoXlcrsEO5uAkuly5w7IZBoaf6/ew4hZB3pofRhIMFF16FiyNVLN4D3eLe2fXiWdZzLWkxxpISuAhKGybsAQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b80c2470-7dac-44cd-9b4a-08d848f45ce4
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2020 12:42:44.2280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qC8CbvnGG4EW88F2tepLYDyn/OnkJG7E04SCuVhB24ghPy0xGqGq1Zvu7dWwPf8vRbi4yLHC7k0vpbRO4TdkOPxHWhMcRxAJgEhQXPW6F3w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4260
Content-Type: multipart/alternative;
 boundary="------------37B2E8F01EAAA21CE4C3357D"
Content-Language: en-US

--------------37B2E8F01EAAA21CE4C3357D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/21/20 7:45 PM, Leon Anavi wrote:
> Add recipe for click-repl, REPL plugin for Click.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python3-click-repl_0.1.6.bb  | 9 +++++++++
>   1 file changed, 9 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-click-repl_0.1.6.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-click-repl_0.1.6.bb b/meta-python/recipes-devtools/python/python3-click-repl_0.1.6.bb
> new file mode 100644
> index 000000000..fce9f9805
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-click-repl_0.1.6.bb
> @@ -0,0 +1,9 @@
> +SUMMARY = "REPL plugin for Click"
> +HOMEPAGE = "https://github.com/untitaker/click-repl"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=fee2943fdd4d8afbac9ccc1c8ac137d5"
> +
> +SRC_URI[md5sum] = "2d5f4d42cbd1da9a50a49dff4d6087ca"
> +SRC_URI[sha256sum] = "b9f29d52abc4d6059f8e276132a111ab8d94980afe6a5432b9d996544afa95d5"
> +
> +inherit pypi setuptools3
>
> 

--------------37B2E8F01EAAA21CE4C3357D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/21/20 7:45 PM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200821234504.719-9-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Add recipe for click-repl, REPL plugin for Click.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200821234504.719-9-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python3-click-repl_0.1.6.bb  | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-click-repl_0.1.6.bb

diff --git a/meta-python/recipes-devtools/python/python3-click-repl_0.1.6.bb b/meta-python/recipes-devtools/python/python3-click-repl_0.1.6.bb
new file mode 100644
index 000000000..fce9f9805
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-click-repl_0.1.6.bb
@@ -0,0 +1,9 @@
+SUMMARY = &quot;REPL plugin for Click&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/untitaker/click-repl">&quot;https://github.com/untitaker/click-repl&quot;</a>
+LICENSE = &quot;MIT&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=fee2943fdd4d8afbac9ccc1c8ac137d5">&quot;file://LICENSE;md5=fee2943fdd4d8afbac9ccc1c8ac137d5&quot;</a>
+
+SRC_URI[md5sum] = &quot;2d5f4d42cbd1da9a50a49dff4d6087ca&quot;
+SRC_URI[sha256sum] = &quot;b9f29d52abc4d6059f8e276132a111ab8d94980afe6a5432b9d996544afa95d5&quot;
+
+inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------37B2E8F01EAAA21CE4C3357D--
