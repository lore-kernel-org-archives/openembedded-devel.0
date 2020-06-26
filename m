Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.43])
 by mx.groups.io with SMTP id smtpd.web12.9815.1593183677268788611
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jun 2020 08:01:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=NI4agj0j;
 spf=pass (domain: windriver.com, ip: 40.107.93.43, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S4xXMHR4ptO1+79ZX+42V1U6501y8e/rytMjltx6TqClwDLivum/4DJUpuI9uTdBnEknHLqV6D8ePaem8osrUlk1W/eiirXacOEr9X2eku+1232f5SpqaOZ5rmnoljs6x3ZadLE4gboAh9iRfGI/G0HJHFFEgBcbT6pZBsxrMbNU6NBv6qdSsMTLr6wOWIUjM5fxfezAyjBBIYq4UWavfFkWvxxrhCl1Zv22HENQH3HkC/4ASxh29ia2ZKRN4W5vUFsPmSeCiEl1CDOg3I0w8QQUz5ona8/AWKV2T5mIqf78KVp/tZjqlasx1J9kwYBir2QL4XwQc1MR/d3di4BXOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sNWFCb4VA2wGN4z5ASrapTRaN44WwhJkGislKiQSvKI=;
 b=NypwXySjUcWB4XGCUKkVajqN03XQLKNyZqEWHWSGBWvv747GX6Ivo0ygiVxAeGkt+vJKij8tkjzOHcJp0KxNV66xSXgfp5janvjsfiQDT3fbIUW5mvBsB0rcE3ua+M2wU5OZLGxw1a9nJ1tVw23LPCVeT6VaHAxi+RURsJe0SrnvhZIVBJboiySInhdCDYbbEbYKkeAKpa8jAm94EuK2Ofb+bBCPJA/4jdFTiNewi+8uC6iHWzNqnrDPXUmoMYO0OQ+Yd2zbenQgVWhV1jquOdEgEERggf0fBWKJLcGzKpWv7smUA3Sr70czaaa+R803l4LdQBuJ1PqSEa/XF/T7UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sNWFCb4VA2wGN4z5ASrapTRaN44WwhJkGislKiQSvKI=;
 b=NI4agj0joKX+uA6JkfkHRO0Q7TXwsJRszu9HEyMwEJFSVmWYRIIUV7nccOT+DDrKvEcGGfmYFy1GFz2L/abfrBIWw0gUCyHRhjels4BnJxWV5u7jexlh78YVaBDbKvCP8O31mLfAHozYbLRmWB6+DCDQzEExeNdvc9zyszEOHmg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1604.namprd11.prod.outlook.com (2603:10b6:405:e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20; Fri, 26 Jun
 2020 15:01:16 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3131.025; Fri, 26 Jun 2020
 15:01:16 +0000
Subject: Re: [oe] [meta-python][PATCH 05/12] python3-pyexpect: Upgrade 1.0.19 -> 1.0.20
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200625090719.16068-1-leon.anavi@konsulko.com>
 <20200625090719.16068-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <6957f92b-d27b-776f-c370-f25b1701fc66@windriver.com>
Date: Fri, 26 Jun 2020 11:01:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200625090719.16068-5-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0007.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::20) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTXPR0101CA0007.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend Transport; Fri, 26 Jun 2020 15:01:15 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63ac21cc-1eb2-4485-414e-08d819e1c655
X-MS-TrafficTypeDiagnostic: BN6PR11MB1604:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB160456B44118C57A7F6192AB9F930@BN6PR11MB1604.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-Forefront-PRVS: 0446F0FCE1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sus7ljvPAfPiPrR20kk7ql0KdPsQOyaIaBMesgh9rSNo5d/cFQ9dI9qY2AiMWAosQIGM4kA2zPNvfa/vnb0qJ3ZwfMVF0ycStXIwNDHqoFhd5/dVlg8H3OnA6AS/DiW3xS1AQGdZ6U/BELT+3EuP6Jsli/W5zcMJZJG2LO1V07Roxe+Ag+GWWtHBZwCGtia8zWSCGuKyIjyyu6gtQmhDWzvfVhQN9R2Uuh4DAPmK6BKl9gTeDkAnWXUrQD/paJ5AbsxovgCndeRldeDo8Y9ILvTVFbhso3kaib+SZ/LQkv8nm4v0U55mPCvVzZV+HemqLzlleyoaUNrKxRTR8Ib4CHjPqrQqiZQfRcBAw9RaLpxdoCJ93wrIYk/1T2Tq4J4dp+HiVRUsP8ZLbX97fmuqe6f2T4yJaP69oGA25mPoyzB1A85ChcUNw/I0+f6PEiCawRb7TaYzyXAAnCMj95h2fg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(346002)(136003)(396003)(376002)(39850400004)(2616005)(956004)(31686004)(66556008)(66946007)(44832011)(83380400001)(6486002)(86362001)(16576012)(31696002)(166002)(316002)(966005)(66476007)(53546011)(8936002)(8676002)(36756003)(2906002)(186003)(478600001)(5660300002)(33964004)(16526019)(26005)(52116002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	ATIMJSqom5tRUzEsgVtcbXRuJKYphor2DEs/oj5hoqpfM2aCe+dodOI8dR4n4Z2bXGXs+D4129jSfdtgnnDh9xXfuc75YvFDyICApWgp4Xi56wjvf1KH+3SyWXhtcBE44cCSJQke5tDiBr4X8k4X56e9QSS8MW7VRvfpGIVMU7bgXYa7Coka4i4NGE4TB9q7Bw5BZJ1kFzwlJw7iiiDq+lmMMoZyPisFhbnKRAXD6lvv54OXxpdMCu/xDhupNMEHVrzHbEMWpb63e0cpF+Hp01XZa9aaueu1UXM1yEIhl3CPngA5oA4OAROwyThCxgPnL2BfBfFWzO4JRWBQtlT5J7RCGs1XW54rPykK/BIJx1OpRr3bq3TlgDjWaLE391mOflA9AdfF8azY9xvZSvjRYDXusBB1kuggzbxC2U3YEZI2RXtviOcWNlvgjdJri/eYbI6rcgW9YjGEDFwW9BRVYt8VfCSZuQ65+6ZMn9a6M80=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63ac21cc-1eb2-4485-414e-08d819e1c655
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2020 15:01:16.1255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WW8kEWT//vscNv1aeFj/1PkZPf2SubbGizRD+ovYa6H1tRAPuCW9wM0TyX8C3u1A+TAj0I4pFPTTUks2jit/mWWONuZHIeo5HFZbXv+9frQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1604
Content-Type: multipart/alternative;
 boundary="------------FF9371E565CD7754A68C244D"
Content-Language: en-US

--------------FF9371E565CD7754A68C244D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/25/20 5:07 AM, Leon Anavi wrote:
> Upgrade to release 1.0.20:
>
> - Support expectations on types that return different types than
>    bool on comparison.
> - Better documentation intro using the feedback I got for my talk
>    at berlin.python.pizza
> - Fix upload command and add some todos
>
> LIC_FILES_CHKSUM changed due to the recent modifications of
> README.md. The license remains the same.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...ython3-pyexpect_1.0.19.bb => python3-pyexpect_1.0.20.bb} | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pyexpect_1.0.19.bb => python3-pyexpect_1.0.20.bb} (52%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pyexpect_1.0.19.bb b/meta-python/recipes-devtools/python/python3-pyexpect_1.0.20.bb
> similarity index 52%
> rename from meta-python/recipes-devtools/python/python3-pyexpect_1.0.19.bb
> rename to meta-python/recipes-devtools/python/python3-pyexpect_1.0.20.bb
> index ea3c018af..e09fec01d 100644
> --- a/meta-python/recipes-devtools/python/python3-pyexpect_1.0.19.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyexpect_1.0.20.bb
> @@ -3,9 +3,9 @@ DESCRIPTION = "Minimal but very flexible implementation of the expect pattern"
>   SECTION = "devel/python"
>   HOMEPAGE = " https://bitbucket.org/dwt/pyexpect"
>   LICENSE = "ISC"
> -LIC_FILES_CHKSUM = "file://README.md;md5=500b884e9dcd5f677a53cbbee8ace939"
> +LIC_FILES_CHKSUM = "file://README.md;md5=a6aa1e7097aca5955f9a2e1c8b0ce158"
>   
>   inherit pypi setuptools3
>   
> -SRC_URI[md5sum] = "dc744289858001925c75d21e26f1260f"
> -SRC_URI[sha256sum] = "bff4654b113dac6c2231e486e11dcb23281ddc0742a5404467303fe7638829ef"
> +SRC_URI[md5sum] = "7ebc843f015b54d849ac7632eda74e9b"
> +SRC_URI[sha256sum] = "acaaa6f96de315dc99cac3da810156bf3829d1eb5c49180f00a4fdde82eabc76"
>
> 

--------------FF9371E565CD7754A68C244D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/25/20 5:07 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200625090719.16068-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.0.20:

- Support expectations on types that return different types than
  bool on comparison.
- Better documentation intro using the feedback I got for my talk
  at berlin.python.pizza
- Fix upload command and add some todos

LIC_FILES_CHKSUM changed due to the recent modifications of
README.md. The license remains the same.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200625090719.16068-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...ython3-pyexpect_1.0.19.bb =&gt; python3-pyexpect_1.0.20.bb} | 6 &#43;&#43;&#43;---
 1 file changed, 3 insertions(&#43;), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyexpect_1.0.19.bb =&gt; python3-pyexpect_1.0.20.bb} (52%)

diff --git a/meta-python/recipes-devtools/python/python3-pyexpect_1.0.19.bb b/meta-python/recipes-devtools/python/python3-pyexpect_1.0.20.bb
similarity index 52%
rename from meta-python/recipes-devtools/python/python3-pyexpect_1.0.19.bb
rename to meta-python/recipes-devtools/python/python3-pyexpect_1.0.20.bb
index ea3c018af..e09fec01d 100644
--- a/meta-python/recipes-devtools/python/python3-pyexpect_1.0.19.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-pyexpect_1.0.20.bb
@@ -3,9 &#43;3,9 @@ DESCRIPTION = &quot;Minimal but very flexible implementation of the expect pattern&quot;
 SECTION = &quot;devel/python&quot;
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://bitbucket.org/dwt/pyexpect">&quot; https://bitbucket.org/dwt/pyexpect&quot;</a>
 LICENSE = &quot;ISC&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://README.md;md5=500b884e9dcd5f677a53cbbee8ace939">&quot;file://README.md;md5=500b884e9dcd5f677a53cbbee8ace939&quot;</a>
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://README.md;md5=a6aa1e7097aca5955f9a2e1c8b0ce158">&quot;file://README.md;md5=a6aa1e7097aca5955f9a2e1c8b0ce158&quot;</a>
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = &quot;dc744289858001925c75d21e26f1260f&quot;
-SRC_URI[sha256sum] = &quot;bff4654b113dac6c2231e486e11dcb23281ddc0742a5404467303fe7638829ef&quot;
&#43;SRC_URI[md5sum] = &quot;7ebc843f015b54d849ac7632eda74e9b&quot;
&#43;SRC_URI[sha256sum] = &quot;acaaa6f96de315dc99cac3da810156bf3829d1eb5c49180f00a4fdde82eabc76&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------FF9371E565CD7754A68C244D--
