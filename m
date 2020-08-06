Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.78])
 by mx.groups.io with SMTP id smtpd.web12.5766.1596719014379964791
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Aug 2020 06:03:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=eEqocCpU;
 spf=pass (domain: windriver.com, ip: 40.107.223.78, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XDu/E0JC0XnPAiajkjh42E9RQHjVBwJJTNaU2u55YyAo/4tL1C8tTSoqpSP4DX0cdB+CR1kflkxYlYmOi45v44Wg5oifFgg8VaTsxrTF/Ko2S5W1uGmCC3NlaQ/CMePVcXixaFRkRkITheh7zNJHcZo5HZtL3/3Et+oAMn1HRLogHMEeS5vMF/KWksNcfOvSg+ItlwBT1uNMxTPuGXwRtei4Ii+0x0EHYsnxX8wzRYneYhvRwXb/9HgWV9KUq9ClTK5sqOEbodpcFCcEfcz3jbbBRdY5K0sHlHDCaHRW6Sy0PTw2IkcSPoPWQm3txhI6kLnI0nCMVoImuQ0/kQs/5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mWIY2hxMzbJbufnTbsa8ZFMP2nlNTGJwW5HBOPPuI9Y=;
 b=J2wVSkEStdWqnjgPuRcA65GVR7hpodXMuMFzgn1r8uIfObMwC2OBrMViXz7ydTCLX9YWqsfwXTDMcXh8JMua4Km+wACR3OYXw4+EveMEAF5jPikoQhXaOq/UHtUBiZ1G1tiZTU92koz9soT8ulrWAs2nkx8rs/ixELfRzjtztOStyfIFqaBkygr874iMPl18RG965K2olMP0JhjKgbyZxYGXrv6jePNZocliqQuRPCtTKTvWkhpmvL6t6EBdbHTdEASmLSueaBSuhRd59lkCyCqWqKvnmEvatZ3ZLt/nNsXZ/VF/5fgP1iYLFTOfOSV97UR2x66Viay5t2mnGmSOUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mWIY2hxMzbJbufnTbsa8ZFMP2nlNTGJwW5HBOPPuI9Y=;
 b=eEqocCpUM11xpb2iY5AqnVXxgvI2IIuCZ/JE0qE/BZFAXVhRMj2VnS0Xgyj/8MHXQZlQHqpn+D/UrahTn3rtzLZHzwGQCO+Y0YHguloiqm3uK62d/j+CEYQl2d/s7Bf2GSy1+KpN4xh5IbJzLTxewPdXYqziyHScxAIRhQ/u8BQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4305.namprd11.prod.outlook.com (2603:10b6:a03:1bf::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Thu, 6 Aug
 2020 13:03:33 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3261.016; Thu, 6 Aug 2020
 13:03:33 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-xxhash: Upgrade 1.4.4 -> 2.0.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200804101005.7169-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <db48d300-72de-11ef-9c2a-5acc9e5ba95a@windriver.com>
Date: Thu, 6 Aug 2020 09:03:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200804101005.7169-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0071.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::10) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0071.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::10) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18 via Frontend Transport; Thu, 6 Aug 2020 13:03:32 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4eaa9df9-6dd2-48c5-7e79-08d83a091f6f
X-MS-TrafficTypeDiagnostic: BY5PR11MB4305:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4305F3D5B0D5A7DABBD028529F480@BY5PR11MB4305.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TUe0QMd3UVCJHzB+7DPBFklJvghyf3ve8jpat/qty8mUCBVSfW4y53Sae+4RCGs+ZWB9J83QVfMbbjfKLn+Ve5lNxHwWy80FyxehFD8CrHH12YjMildCnJ8dyQl6Kmx+b0BiHYGImeGttdi1ccQZHUM6jBVB9dJh3M8uOIC+jrminY9/e3+8WXjUstyF9//obw13lfDu6y6JOWUCYMC8FW9UxHTL08xZGEvgTt9YGUJy1d31qvuB2uvWacfMWF7H7DUPHifBnBRfKOgTpDtJDCumB27GCGmWIQpObZu/MHIQguvCsLBK4BaC7AWb0dFQ054vw5wNVp5TSckRmzhJ5j8j8aIgxa8ZCTap4Dj2l3AEAFRRgWFC4x0O0U5s884l5sjmqEYY/l6FYh1NgDY10DTismrX/sSWYvypxiTjFcvnaxhLpg0bV91mbsBjaKQGAmDiseo5pn77wV/QcDJWQg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(376002)(346002)(366004)(396003)(136003)(2616005)(44832011)(26005)(86362001)(186003)(16526019)(31686004)(956004)(5660300002)(16576012)(316002)(478600001)(966005)(52116002)(2906002)(6486002)(166002)(8676002)(8936002)(36756003)(66556008)(66476007)(66946007)(31696002)(33964004)(53546011)(83380400001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	EMSuVK/R2t6NX3X1xpuyxuBdTZ7r3Gv9VX6gtjx001rItvEf9vATlGpr9xL9S0htSz/CzY2MqCFuB6MxeG6oVZ+W2m+h+6/avJfnZ0OlIGqKGYqF344JJiFCPZMfO4tgcDNNg5AYFVk3AQoYRtVCtb77akVDebhEQjWhU9Gmr6EhqpZ3Xk8TXv6PBoWLjedG0BveVb56vSDb1HDnI5czx1z+zmu31lvhUtTUgc0qoDGFnEvsdJrl+ZtsqyB512E5faSx8g1VPcCd8rjDWUECBCCkF54u8rN6tw6DxQTL0K7CoX34Y3cQsDnXqpKwA4SA9JfvesYzpIm8dvBs/jRPHEC2nIpHRV34uhSXARmlNkrcs+b2JDdWxPvFxQ1I6V7Aa2PE8ZXC7Nfu+ULqlLkYMvXHQazAhhlt3ll6SICNhfCBDShiZgqlX9cvmR18+gR6VnvK12PsnAQq8RoxOcDcewehWKQUmkkGLWAB8CtSNf0GBBPRY88kkoQcA07MR2AiYOMoK8ug/NEeD8txkerjRoHziILROnJQJyO3x/qLcoJcG8BhsM0JXpPCpFNX7DFEAUKg63nswf1K4qMcjtTu6ZFw5uYpSog//weUQ3wjdIURTzfNAuKsKKNjCan2Sp4EHGiA51KXyRLgF5K+gx5RCw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eaa9df9-6dd2-48c5-7e79-08d83a091f6f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2020 13:03:33.1571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rNL7OSikBkYEZSQacV5ul8/zZcctl8Pe5K7c9LIYMQlik51F68zZX2tYAKCGPruXyZWALik0lZWeW8ZuSuNlzNWWcIKItBV6N0axEmjAt84=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4305
Content-Type: multipart/alternative;
 boundary="------------1B9942130E369A5DB6A4488F"
Content-Language: en-US

--------------1B9942130E369A5DB6A4488F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/4/20 6:10 AM, Leon Anavi wrote:
> Upgrade to release 2.0.0:
>
> - Require xxHash version >= v0.8.0
> - Upgrade xxHash to v0.8.0
> - XXH3 hashes: xxh3_64, xxh3_128, and their oneshot functions
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-xxhash_1.4.4.bb => python3-xxhash_2.0.0.bb}      | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-xxhash_1.4.4.bb => python3-xxhash_2.0.0.bb} (75%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-xxhash_1.4.4.bb b/meta-python/recipes-devtools/python/python3-xxhash_2.0.0.bb
> similarity index 75%
> rename from meta-python/recipes-devtools/python/python3-xxhash_1.4.4.bb
> rename to meta-python/recipes-devtools/python/python3-xxhash_2.0.0.bb
> index 97f4e358b..c5add103c 100644
> --- a/meta-python/recipes-devtools/python/python3-xxhash_1.4.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-xxhash_2.0.0.bb
> @@ -3,8 +3,8 @@ SECTION = "devel/python"
>   LICENSE = "BSD-2-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=5a8d76283514a1b7e6a414aba38629b5"
>   
> -SRC_URI[md5sum] = "0194cc926dd7676d27aba0f89da9798b"
> -SRC_URI[sha256sum] = "7d6df9d217977d085b8abd74b61efa40405ac416f2d8bdacc40826bd5cb1b746"
> +SRC_URI[md5sum] = "010fda0427b621e5fe6930ad42511d88"
> +SRC_URI[sha256sum] = "58ca818554c1476fa1456f6cd4b87002e2294f09baf0f81e5a2a4968e62c423c"
>   
>   SRC_URI += " \
>       file://run-ptest \
>
> 

--------------1B9942130E369A5DB6A4488F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/4/20 6:10 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200804101005.7169-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 2.0.0:

- Require xxHash version &gt;= v0.8.0
- Upgrade xxHash to v0.8.0
- XXH3 hashes: xxh3_64, xxh3_128, and their oneshot functions

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200804101005.7169-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-xxhash_1.4.4.bb =&gt; python3-xxhash_2.0.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-xxhash_1.4.4.bb =&gt; python3-xxhash_2.0.0.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-xxhash_1.4.4.bb b/meta-python/recipes-devtools/python/python3-xxhash_2.0.0.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-xxhash_1.4.4.bb
rename to meta-python/recipes-devtools/python/python3-xxhash_2.0.0.bb
index 97f4e358b..c5add103c 100644
--- a/meta-python/recipes-devtools/python/python3-xxhash_1.4.4.bb
+++ b/meta-python/recipes-devtools/python/python3-xxhash_2.0.0.bb
@@ -3,8 +3,8 @@ SECTION = &quot;devel/python&quot;
 LICENSE = &quot;BSD-2-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=5a8d76283514a1b7e6a414aba38629b5">&quot;file://LICENSE;md5=5a8d76283514a1b7e6a414aba38629b5&quot;</a>
 
-SRC_URI[md5sum] = &quot;0194cc926dd7676d27aba0f89da9798b&quot;
-SRC_URI[sha256sum] = &quot;7d6df9d217977d085b8abd74b61efa40405ac416f2d8bdacc40826bd5cb1b746&quot;
+SRC_URI[md5sum] = &quot;010fda0427b621e5fe6930ad42511d88&quot;
+SRC_URI[sha256sum] = &quot;58ca818554c1476fa1456f6cd4b87002e2294f09baf0f81e5a2a4968e62c423c&quot;
 
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

--------------1B9942130E369A5DB6A4488F--
