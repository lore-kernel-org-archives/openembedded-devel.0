Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.81])
 by mx.groups.io with SMTP id smtpd.web12.3078.1591818772582536791
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2020 12:52:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=VqcCXrEe;
 spf=pass (domain: windriver.com, ip: 40.107.237.81, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EtlP7pOlFqksJ/thqIWR7/4nZRq17hu6YypKgXJO0cEGl6Kbx/oFYYuw8g7i8eeuvy4SBWEGjtC8tA5YdUAre0IFSk7SCJ2YySR5qi1fImOGLzdc4WBloQNXRSOam/ZCvaDByn/oKs6OLnX92a9aExJ2cHTRPuru6tVuRDMJ56XeNRlH1N/2OyUDPz93tm2GLkLpLIMj6nz2AyWKBY1X+L3KRfP7h4B9rd2MeiVO+11rSd5FnrqUv8AaCHPb6IdFhaQ0SeKlfkScYXx3y0kza45QLF6gem+4+G9cC3vHUCO+wQ5DOPKjx2gk4euNpgmjz8xbCdh4g0wQ+IJBNB/PMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J/pts5rmuxRmLJXustrmCoJCuDD7KzKHTlicciXOL+M=;
 b=bU24kzwE5H4fdkOfkRvCeKW3HamPEwYzseZ6vPRST3nuizlx6bs/68X7GR3wdQ4MhVruw2Z+tikJ9lE4b1rnahJ+Yq8gFrDKiMkDBsgrL91xFA+pwC0Xn0+M3rk0MyvaYkXVFgoUw2KzB3h/WcJPPePq1mDQq1bd9cl3Zf3D9GUMLUvrI008+nTH3Wx8etch0g3hmhwAvzo/0lU3sSliDcgaiaC+AiY3KuahRMQSy6BTWriCOruMrFaToqlzhwniZSu9UgTSX+c8IZqT6pXxSrnCiFz3lop7xC/ZKUIaUXa+6T8neXOX7qMeR365B2Dr+5QfWZaOegY4yQYeU2LFGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J/pts5rmuxRmLJXustrmCoJCuDD7KzKHTlicciXOL+M=;
 b=VqcCXrEelrkKl64wXuzciA3MNw/WZ/y6JmhZLXrtFzcto5bz+AEQaPjnFS0B2IfR6JD+ZSecvJEqp2U/5vmFsl77mCWR0D/awpbGwz+2BoItTP9/41umqHBxNszBIlfPMmGhWVostJPQaEvlTzOMzeKXO6ggOP1LY0NLg1B9Lek=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1700.namprd11.prod.outlook.com (2603:10b6:404:47::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.22; Wed, 10 Jun
 2020 19:52:49 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3088.021; Wed, 10 Jun 2020
 19:52:49 +0000
Subject: Re: [oe] [meta-python][PATCH 1/2] python3-wcwidth: Upgrade 0.1.8 -> 0.2.4
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200609125600.17773-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <551db792-8819-85e3-51ae-f39fcb1de63d@windriver.com>
Date: Wed, 10 Jun 2020 15:52:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200609125600.17773-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0061.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::38) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTOPR0101CA0061.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::38) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.19 via Frontend Transport; Wed, 10 Jun 2020 19:52:48 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 729d4e9e-42ce-4a2d-c572-08d80d77da3c
X-MS-TrafficTypeDiagnostic: BN6PR11MB1700:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1700BDA2C2CB49375FEB7B4A9F830@BN6PR11MB1700.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-Forefront-PRVS: 0430FA5CB7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QMSQmJwLfrP6vSPrRr4vOKkqbDkz/yNd5gZ3LsGqaMT9ac0U9aoprNLrWSql5tmfVvkb9Xvuf4wfKrfuQ2+cPtjf+f3sTytL0KdzepzFKJcJtAmX2j8OXaCM3LAEbvQZSpz5tNgC15SAV91HksuXbQ+33ommWzU+KrJWe+OAmTbESaX2lay2ZeiM8xZ9Xd7YZTH8+qAfW/NkMPvVSBcpyVHAohD+/e9EZRErwurr3jkda15HcR92eyRbV3SSdwI+UdtJu6EYw3B9edCQsBnix5b1qbBZ7HjeBo1zIPN4dKMEYp/TG3XXD1RFNnvOiJzmZ7My2bOgdz76WlKfpbkVpfU5P49SgoSz7J9AUq9OsVGpuTOrYyCU0ZeOPuoBOhlkFJ7jpr1CQnRVHJH49IV2X3974Tl7yhFRnhtKjxruayjOFMEjOQFo64m02VerKJcZpQAEsMlWG43o4GBJ8+InNA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(366004)(396003)(376002)(136003)(39850400004)(66556008)(52116002)(66946007)(2906002)(33964004)(66476007)(31696002)(31686004)(53546011)(86362001)(186003)(956004)(966005)(16576012)(83380400001)(8936002)(2616005)(6486002)(8676002)(36756003)(5660300002)(26005)(16526019)(44832011)(166002)(316002)(478600001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	kxtnAtwpOdBSL2/Zg6T4lqwOYC9OHMKF9HfhbD9TYaLKIvC8UL5WlJBDHgReguu5WneLTZOIcL86qUd2GJq0vsUFgzfViTt7x8cniyCvH6umhi6/f/q49C/SdXHqvIAROX3FCEMcg1D6WZLJYbvQ6dcJvgaewtrNjDdIVgVzXdBhhIgqc4gtSvWJwssXFpSLmLeWrUJa53p69BkrvotgrhPYc5/iKzkOdHuhpA0wxbo8Muu+ae99jLQIwK1c6mgGw1fkYQopB5p5OhGpFjTz8++nMC2ieb6Bv/TfuZpEXG5RYxI+WDz6xVRpJfscG20m4dgBoF8hrlfRc9RvOPY3xVAARiSU0iGCfZTa0v7Bn+7BlkthHqn6TOSMy5Zkpr1Q4boo+max+211Jhwp1wBZKXvhSKh++C+9p81BEL4jaFBVIi0Dwq/9N7FGchrumqAVYpxfljm4DjzlTiym39fZjwUDfQt7tcRY8xF2bReA2SEJjZ0cFvc7jCK9P+lK5nAw
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 729d4e9e-42ce-4a2d-c572-08d80d77da3c
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2020 19:52:48.7629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q4dvoaCgVbNp6E/T0tJTPK52YLVsEaXrLlvlDJA+DWjiMz+IpokBmfPf39vd/RDQHAs4z4lvvLPX3/dD06fIiUaIaHgdzrbnk5CMt5HnOO4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1700
Content-Type: multipart/alternative;
 boundary="------------F41AF38D5485EA3B622DA400"
Content-Language: en-US

--------------F41AF38D5485EA3B622DA400
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/9/20 8:55 AM, Leon Anavi wrote:
> Upgrade to release 0.2.4. The license file has been renamed but
> the source code remains avaiable under MIT. Add a description
> and a homepage.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python3-wcwidth_0.1.8.bb | 10 ----------
>   .../recipes-devtools/python/python3-wcwidth_0.2.4.bb | 12 ++++++++++++
>   2 files changed, 12 insertions(+), 10 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python3-wcwidth_0.1.8.bb
>   create mode 100644 meta-python/recipes-devtools/python/python3-wcwidth_0.2.4.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-wcwidth_0.1.8.bb b/meta-python/recipes-devtools/python/python3-wcwidth_0.1.8.bb
> deleted file mode 100644
> index f9f6474ad..000000000
> --- a/meta-python/recipes-devtools/python/python3-wcwidth_0.1.8.bb
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -SUMMARY = "Library for building powerful interactive command lines in Python"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=11fba47286258744a6bc6e43530c32a1"
> -
> -SRC_URI[md5sum] = "dc6677d099e6f49c0f6fbc310de261e9"
> -SRC_URI[sha256sum] = "f28b3e8a6483e5d49e7f8949ac1a78314e740333ae305b4ba5defd3e74fb37a8"
> -
> -inherit pypi setuptools3
> -
> -BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-wcwidth_0.2.4.bb b/meta-python/recipes-devtools/python/python3-wcwidth_0.2.4.bb
> new file mode 100644
> index 000000000..48ff37654
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-wcwidth_0.2.4.bb
> @@ -0,0 +1,12 @@
> +SUMMARY = "Library for building powerful interactive command lines in Python"
> +DESCRIPTION = "Measures the displayed width of unicode strings in a terminal"
> +HOMEPAGE = "https://github.com/jquast/wcwidth"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=b15979c39a2543892fca8cd86b4b52cb"
> +
> +SRC_URI[md5sum] = "5e6cd8cd008a7ad2c2578ac49a9d87a1"
> +SRC_URI[sha256sum] = "8c6b5b6ee1360b842645f336d9e5d68c55817c26d3050f46b235ef2bc650e48f"
> +
> +inherit pypi setuptools3
> +
> +BBCLASSEXTEND = "native nativesdk"
>
> 

--------------F41AF38D5485EA3B622DA400
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/9/20 8:55 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200609125600.17773-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.2.4. The license file has been renamed but
the source code remains avaiable under MIT. Add a description
and a homepage.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200609125600.17773-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python3-wcwidth_0.1.8.bb | 10 ----------
 .../recipes-devtools/python/python3-wcwidth_0.2.4.bb | 12 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
 2 files changed, 12 insertions(&#43;), 10 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-wcwidth_0.1.8.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-wcwidth_0.2.4.bb

diff --git a/meta-python/recipes-devtools/python/python3-wcwidth_0.1.8.bb b/meta-python/recipes-devtools/python/python3-wcwidth_0.1.8.bb
deleted file mode 100644
index f9f6474ad..000000000
--- a/meta-python/recipes-devtools/python/python3-wcwidth_0.1.8.bb
&#43;&#43;&#43; /dev/null
@@ -1,10 &#43;0,0 @@
-SUMMARY = &quot;Library for building powerful interactive command lines in Python&quot;
-LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=11fba47286258744a6bc6e43530c32a1">&quot;file://LICENSE.txt;md5=11fba47286258744a6bc6e43530c32a1&quot;</a>
-
-SRC_URI[md5sum] = &quot;dc6677d099e6f49c0f6fbc310de261e9&quot;
-SRC_URI[sha256sum] = &quot;f28b3e8a6483e5d49e7f8949ac1a78314e740333ae305b4ba5defd3e74fb37a8&quot;
-
-inherit pypi setuptools3
-
-BBCLASSEXTEND = &quot;native nativesdk&quot;
diff --git a/meta-python/recipes-devtools/python/python3-wcwidth_0.2.4.bb b/meta-python/recipes-devtools/python/python3-wcwidth_0.2.4.bb
new file mode 100644
index 000000000..48ff37654
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-wcwidth_0.2.4.bb
@@ -0,0 &#43;1,12 @@
&#43;SUMMARY = &quot;Library for building powerful interactive command lines in Python&quot;
&#43;DESCRIPTION = &quot;Measures the displayed width of unicode strings in a terminal&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/jquast/wcwidth">&quot;https://github.com/jquast/wcwidth&quot;</a>
&#43;LICENSE = &quot;MIT&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=b15979c39a2543892fca8cd86b4b52cb">&quot;file://LICENSE;md5=b15979c39a2543892fca8cd86b4b52cb&quot;</a>
&#43;
&#43;SRC_URI[md5sum] = &quot;5e6cd8cd008a7ad2c2578ac49a9d87a1&quot;
&#43;SRC_URI[sha256sum] = &quot;8c6b5b6ee1360b842645f336d9e5d68c55817c26d3050f46b235ef2bc650e48f&quot;
&#43;
&#43;inherit pypi setuptools3
&#43;
&#43;BBCLASSEXTEND = &quot;native nativesdk&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------F41AF38D5485EA3B622DA400--
