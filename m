Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.75])
 by mx.groups.io with SMTP id smtpd.web10.53068.1598879485280599068
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Aug 2020 06:11:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=jEkgP+Tl;
 spf=pass (domain: windriver.com, ip: 40.107.243.75, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UCGAgfIh4CRr/OqzRDvoNPOAuHDnzlkmOIu+ebWC7qVB4HX3xQzf+snhkFXw6Jmox0+oOrteVtlkKU/ReUAQsHNZ4MhfJTHpVOwF04wCrm9JKudhHzL9yjviVFwTnSbdoQMrKbJU06Ny7Gs+Trsdoih3f71MocFSW0oMythS5Y9TEF0KQblthtDoMlP00N8j6NFindz+qE8/1KR9ZoKOhALOswu5qPTdLYswMvBJAK5lku4OtAl6VVzQdWfy0w5PYumhTYmumEZ/f3GmNPyBmHQEfD5INX4YNmAcrAHj7doapvhxsNduDQOU4xMjPOZ0/6BUEyAlLGG8EHuZ6Tapfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GFhs7btVbjxoE6SArf+il85bwtfneVKDnevBTffYJEA=;
 b=c6horVDuFTM5UWZ6cx1gLyXq/ZeMGwlVJnRV6uNPyEqJCyZvzQptk3IoCuUbL3brSd0sKTzpT2XcdUAeuFkwMmsUR2dxbr11BW6oF3amzJPHfY+OT20+nB4oYvCvG2GytzdzlPCJ9z91WU69b/b/SOZVRjC2akcthKcUA70jYOcJx9AZh7eRrx4sjtNJs+Xtv09oicHOmB1yMnWkllZbWIvLzLjBPOdBLTfL7OyIj/HXp5rtrtpNdJ6DoY7mT/GOkb1x4iz6NEyzArYPnwLM5QlRI+F/hVM6xow4cLSX4WIcc+1EcOWVRwQK3jqj6/I0Hv6UESGC5ZapPclMxT+BUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GFhs7btVbjxoE6SArf+il85bwtfneVKDnevBTffYJEA=;
 b=jEkgP+TlKdbDScaiATOfqlAmqz9T+X3eVBkWRqk8m7myp2jb6RaG7O2Wosjlrw9f72fcMv5yFORefqt/edQ8EatgjGGzmja3iqfp4q8Iapb7VDFOMBrrmglT7nPEjsX8zVeE5VI9J1YvXduvuAGrIXnW3tn9XTPpPsXezMajqPs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2807.namprd11.prod.outlook.com (2603:10b6:a02:c3::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Mon, 31 Aug
 2020 13:11:24 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3326.025; Mon, 31 Aug 2020
 13:11:24 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-ntplib: Upgrade 0.3.3 -> 0.3.4
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200827145409.29077-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <84be768f-b7f9-468f-2470-33640f84b9b9@windriver.com>
Date: Mon, 31 Aug 2020 09:11:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200827145409.29077-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0036.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::49)
 To BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YT1PR01CA0036.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::49) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Mon, 31 Aug 2020 13:11:23 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9cec4ab0-c967-43f6-50ef-08d84daf5c43
X-MS-TrafficTypeDiagnostic: BYAPR11MB2807:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB28073418D10CDD1B230566649F510@BYAPR11MB2807.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/ZQgcIZSZFdS0C1Y15xYMoQ8/uzm3QJc1CLluAlx+rdS+QurEwWsHaahJKQyN0OBM57s4Nmp7qnJnqvuTNI8hP4YFWHLHwvH3Hq2J01mTWViBlEiwOl2+UgE7GT3Kp9OcKDhyUHRZ6RRltIjXDk26T3WV3igq5hrhO5BcAy/U6ijf0h+Q4RfDeK8cJCLGm19tgr4G/yAKTJc4Wxva5pg433BWf1Lc7m9EC9NP/CfpLwAXQox8I7T4SMx5mVsBYRI7R7niurlbrErad+YtxoaQX0nzSfquvLZ7hIjBDp27q5fMkzYwYFPbklR8EV3XiAntNrq0xfCagP0gHWJHJPwhbb9gXTAvQcibapZtcnwnKoj7EyIZZcZiCExLIEtzHRb6G9dTwUxL0n2et3VKATlxqP5CRhabc82Uq0xIHwzJ0YKfdijgL7ixC+E0qvabwItupPCHwc+nAKU3XE4pD9qWA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(39850400004)(376002)(346002)(316002)(2906002)(53546011)(33964004)(66556008)(166002)(478600001)(26005)(186003)(6486002)(36756003)(956004)(83380400001)(8676002)(31696002)(8936002)(66476007)(966005)(31686004)(66946007)(86362001)(2616005)(5660300002)(52116002)(16576012)(44832011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	Lc7AGQDkjMUt3uj9BfwHEXbH5blvOx0uR6+lVVn/ZAfsj8XCUCwWhZJXXrNIggNAgmBEfLuqwNW0LYQsELj4RP9LKD+1s815YOfOAsTN0K08c7LWisdfKZuelIHfhNu39mNyy1taIcp1K54Xyj83YuaasyEOy/2P7szFbhg88TGRUlptyJGTa0xOAbeKaSvE87LSAYvPzx7gY6CghOBnNeBNBmuhFgPX54U1YBBQCW0xYBVFH9oJeZoj6v7WCiM2+hMCTX6r3P5dV4I4PZQh6dnjXZSzi4843YELwisF3s7dSSYl7A/ufX1VMq3DcCB1+GDoINKbdo60Fd+PpbpY6Z1Y1+YN6ux2W/+/YOfZYjhz5VOSZot7cQCyBNBEAkyTX3xlJ9Iiq3Liy/O/7hbyY5uV6XZYvCthqgLjtYIrSkRg7He9LOSo/YU6rHZ92S+OJCRKp9lZCphakEVLRlTxM2L8JuehTSrW7AMIQlAf9S0bs3V9KcYG/RCa6H0CCbf4mTPuPpTlo1+Rq767pqpq++V2IMIksN8SPCaTaygF13BaLev5r4QDGn8wso2SwGYHFbLrje/XW1ub8Qgyl/v6AlGX4zsjPBMTfWKJM3lRNFxwVPTf5+PQvw84moG7hz16MY1Qz9W+Nxe8LNeHwDKBFw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cec4ab0-c967-43f6-50ef-08d84daf5c43
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2020 13:11:23.9264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gvb4iNT3n/UQixRkTrZllaITeAal9Vjnr/gMYbN8jOIuflWYq/kAOQAE0yOdgVg0goZiI/AJkk8QnIbRe9kFGryoipKQFoLoOc87FbTm9yM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2807
Content-Type: multipart/alternative;
 boundary="------------A8E573BC274071B86A5C22BF"
Content-Language: en-US

--------------A8E573BC274071B86A5C22BF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/27/20 10:54 AM, Leon Anavi wrote:
> Upgrade to release 0.3.4:
> - Use setuptools
> - update URL
>
> Use source from the GitHub repository instead of pypi because
> appropriate archive for this release is not available at pypi.org.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-ntplib_0.3.3.bb => python3-ntplib_0.3.4.bb} | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-ntplib_0.3.3.bb => python3-ntplib_0.3.4.bb} (55%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-ntplib_0.3.3.bb b/meta-python/recipes-devtools/python/python3-ntplib_0.3.4.bb
> similarity index 55%
> rename from meta-python/recipes-devtools/python/python3-ntplib_0.3.3.bb
> rename to meta-python/recipes-devtools/python/python3-ntplib_0.3.4.bb
> index ce2618b81..ae4c10f38 100644
> --- a/meta-python/recipes-devtools/python/python3-ntplib_0.3.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-ntplib_0.3.4.bb
> @@ -3,12 +3,11 @@ SECTION = "devel/python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://ntplib.py;beginline=1;endline=23;md5=afa07338a9595257e94c205c3e72224d"
>   
> -SRCNAME = "ntplib"
> -SRC_URI[md5sum] = "c7cc8e9b09f40c84819859d70b7784ca"
> -SRC_URI[sha256sum] = "c4621b64d50be9461d9bd9a71ba0b4af06fbbf818bbd483752d95c1a4e273ede"
> +SRC_URI = "git://github.com/cf-natali/ntplib.git"
> +SRCREV ?= "aea7925c26152024ca8cf207e77f403f8127727a"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> +S = "${WORKDIR}/git"
>   
> -inherit setuptools3 python3native pypi
> +inherit setuptools3 python3native
>   
>   RDEPENDS_${PN} += "${PYTHON_PN}-datetime ${PYTHON_PN}-io"
>
> 

--------------A8E573BC274071B86A5C22BF
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/27/20 10:54 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200827145409.29077-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.3.4:
- Use setuptools
- update URL

Use source from the GitHub repository instead of pypi because
appropriate archive for this release is not available at pypi.org.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200827145409.29077-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-ntplib_0.3.3.bb =&gt; python3-ntplib_0.3.4.bb} | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-ntplib_0.3.3.bb =&gt; python3-ntplib_0.3.4.bb} (55%)

diff --git a/meta-python/recipes-devtools/python/python3-ntplib_0.3.3.bb b/meta-python/recipes-devtools/python/python3-ntplib_0.3.4.bb
similarity index 55%
rename from meta-python/recipes-devtools/python/python3-ntplib_0.3.3.bb
rename to meta-python/recipes-devtools/python/python3-ntplib_0.3.4.bb
index ce2618b81..ae4c10f38 100644
--- a/meta-python/recipes-devtools/python/python3-ntplib_0.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-ntplib_0.3.4.bb
@@ -3,12 +3,11 @@ SECTION = &quot;devel/python&quot;
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://ntplib.py;beginline=1;endline=23;md5=afa07338a9595257e94c205c3e72224d">&quot;file://ntplib.py;beginline=1;endline=23;md5=afa07338a9595257e94c205c3e72224d&quot;</a>
 
-SRCNAME = &quot;ntplib&quot;
-SRC_URI[md5sum] = &quot;c7cc8e9b09f40c84819859d70b7784ca&quot;
-SRC_URI[sha256sum] = &quot;c4621b64d50be9461d9bd9a71ba0b4af06fbbf818bbd483752d95c1a4e273ede&quot;
+SRC_URI = &quot;git://github.com/cf-natali/ntplib.git&quot;
+SRCREV ?= &quot;aea7925c26152024ca8cf207e77f403f8127727a&quot;
 
-S = &quot;${WORKDIR}/${SRCNAME}-${PV}&quot;
+S = &quot;${WORKDIR}/git&quot;
 
-inherit setuptools3 python3native pypi
+inherit setuptools3 python3native
 
 RDEPENDS_${PN} += &quot;${PYTHON_PN}-datetime ${PYTHON_PN}-io&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------A8E573BC274071B86A5C22BF--
