Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.43])
 by mx.groups.io with SMTP id smtpd.web11.7169.1591881717900858115
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2020 06:21:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=gkoMAflr;
 spf=pass (domain: windriver.com, ip: 40.107.223.43, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gOG3WlM1PsMowOvLBGr1H7mXWRHHz7f2bY797AkJynzLIAzG7XdjSH1yAi9sCyF/Wvn2gtKKCx68FjaWSp6sEIN7jYosuZip/hy6vU+j+81VAaaL5nGhMztX/mLEwQimtEun9DSdyABWzdq4QnpBtMBaETYYiQjbELXArgMwr5HUfQzpss814t45QxzxAB5M7s9YeNw3pE3Xd8HZwoh4LYD8XNYozcp2UD/BTS+DfgWGGTEd1iC6aeG3BIkAO61vsokMHSU/NPJHWFEh1k/dGfrkr8Lf8Dwk27CEyjMSWtLC5gYOUg+Dgk+nmSjeLcjm4deBdT8hjMnHmj7fP0wUcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TGT14Gt6GnJosqesLVI0lyIqIJ9ZLWhck7S9YiLRuQ0=;
 b=esIoCZ9W4+9eAp/o239Ui1EPz1s3nlPM7lt2F6D/rh2njZHy7Wb/diI+XrxO8gLYFonG3TKSb5aUyrAwDSWBL4z/A4YXMKj98K+0JccAHG5uCRGPZ4u8Fxq2KkcbfBVblQJzxx71rFi7SV7sb43bknJIvKoDfZeN3irrFc/uF1sRBewQZPFP5bGZQrgf3XC4CXewxtTnhZt2Stky0ZixwLMqYdb30IAid69nTsmK65jx0GucYXNpKMTWpmV/+fw/0XhkAQTWG24McQqLqN8UigJEAFWi4TXwOR46z0opmc+4b3AdRKDCAeWlli6qSZzYqf2lbcioXKn/ePhCPAVZqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TGT14Gt6GnJosqesLVI0lyIqIJ9ZLWhck7S9YiLRuQ0=;
 b=gkoMAflrjNpYXkhG1Bz/Hl/qFlub169qjBPbBwF+uASIQyuuPuDALCZRu6mI9g4KGQNIgJUbCioVhCnSCDSydhLt0/xA5/oS58ft98oUChCxaH25DAbECwtOzKwOj618SVyxDRP/83gHJdCubotd4r7PIuY8m+1tdPGMUm58R0A=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR1101MB2068.namprd11.prod.outlook.com (2603:10b6:405:50::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18; Thu, 11 Jun
 2020 13:21:55 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3088.021; Thu, 11 Jun 2020
 13:21:55 +0000
Subject: Re: [oe] [meta-python][PATCHv2] python3-soupsieve: Upgrade 1.9.4 -> 2.0.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200610071730.20966-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <75dbfa42-8e85-dcc8-9ad7-e520ba2e2004@windriver.com>
Date: Thu, 11 Jun 2020 09:21:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200610071730.20966-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0029.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::42) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTXPR0101CA0029.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::42) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.19 via Frontend Transport; Thu, 11 Jun 2020 13:21:55 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f9835e9-3a40-47c8-59c8-08d80e0a698a
X-MS-TrafficTypeDiagnostic: BN6PR1101MB2068:
X-Microsoft-Antispam-PRVS: 
	<BN6PR1101MB2068F2757A6078A1E44CDF139F800@BN6PR1101MB2068.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-Forefront-PRVS: 0431F981D8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uv2uOon4Ru4ocgl3QtJ21SOEgEk6CnD7W4ctqBl91fvQ9AyEFnJngiYw50vIOseRgWFDFogmdTuJsmU7xxPzz8iG/pDBJ91CKddFZhrxzPNmfaWEFIZOH+1kGWtPv72ndrXiIP6JxiJ6XuBwHYY8m7VCoqHiG6EF6L4L79AXSIA4e9igqLVASLLaISC0gSHua9w73haaii4XM8uoZ9iwO4p/Ugk1hqYy3LL8UWHbDIUrPxzl1aV7OPIRFAauAZNBWQL3n51+YRj6AUHFQWLPj4m3GvuWjGj4EaNsBWE6B5iEglBQUAmMuW33MggF3JNpZlYRuUuleVGELqIb8XOgSFRIBkG+emE//7jtlJsOYeFh0NHTrfKtuHckYCU1g7KbC23X4mniqpaDY4QQsoWEG7z1yBIV492huSOOZ5uW0XG77d7W2r5VFovjOnfvmWeyiwuOJNJ5E/IRoSvwzPg9ig==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(39850400004)(366004)(376002)(136003)(346002)(8676002)(956004)(186003)(16576012)(2906002)(16526019)(966005)(316002)(6486002)(478600001)(33964004)(8936002)(2616005)(31686004)(166002)(66556008)(26005)(52116002)(5660300002)(31696002)(44832011)(83380400001)(53546011)(36756003)(86362001)(66476007)(66946007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	HHFsySDZju50zu5lw7COx18YZBycHDWvqHUB8I/26hJcHiZOdjo29vyvyStu2w+FoR0uU0fEvh3n0QpTx87DFXQWGgYRe5Q3rBP2HcbgrICYMRsD4qgvFj/PxACkC58csrjKxNlIalA8mfr/n6No1m1FP8zfXUFDf/MIPhO+ZPaRGsx6r+1CArZFBvjKzjIyC2pzMBzPXN0DLE9ME5kM+m26rY0XJBaQdcNDoJYB/MYt5qRoUMmmFcHVYWPl9VOFGVPSeoffj9Ln55O6ST8XY910+7p4HTUfvIe6gLMrKVJSc3f9DXwHPzBqh7ccqRjaQqw61YCAWpy3Hj02uz2Ek+Wm7pOSgu3WEgjXLodRjF4rXieNuS9b569T3jluPUl9MreatnSgCqO/wrlqsNzDDWDMd/cKvWC7DWAK34eqMbGtztPY9UPt/zo0/SjlW0q0at3Sywliz0JAs8s2C/1nNiN41i8VSRM+OyMG1t1FH2zohnRZ+cjp1YNsYmalDgwk
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f9835e9-3a40-47c8-59c8-08d80e0a698a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2020 13:21:55.8100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: svtOAYhwyGQMeYo+ss5BZdIMmMQMVIPR+7RLz3muv0zjXqt7VzyF1nCQDCKUaBYu9jXImMNUINvUG8ALAZxdqi70kGJIqC9wOYpZ4miuXSM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2068
Content-Type: multipart/alternative;
 boundary="------------2E84918963DC6D483A49AED6"
Content-Language: en-US

--------------2E84918963DC6D483A49AED6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/10/20 3:17 AM, Leon Anavi wrote:
> Upgrade to release 2.0.1 which brings the following new features
> and bug fixes:
>
> NEW: SelectorSyntaxError is derived from Exception not SyntaxError.
> NEW: Remove deprecated comments and icomments from the API.
> NEW: Drop support for EOL Python versions.
> FIX: Corner case with splitting namespace and tag name.
> FIX: Prune dead code.
> FIX: Remove unused code.
> FIX: :placeholder-shown should not match if the element has
> content that overrides the placeholder.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...{python3-soupsieve_1.9.4.bb => python3-soupsieve_2.0.1.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-soupsieve_1.9.4.bb => python3-soupsieve_2.0.1.bb} (65%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-soupsieve_1.9.4.bb b/meta-python/recipes-devtools/python/python3-soupsieve_2.0.1.bb
> similarity index 65%
> rename from meta-python/recipes-devtools/python/python3-soupsieve_1.9.4.bb
> rename to meta-python/recipes-devtools/python/python3-soupsieve_2.0.1.bb
> index df69e007f..aa087c920 100644
> --- a/meta-python/recipes-devtools/python/python3-soupsieve_1.9.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-soupsieve_2.0.1.bb
> @@ -4,8 +4,8 @@ HOMEPAGE = "https://github.com/facelessuser/soupsieve"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE.md;md5=5a6fd3b0c24fc5a041a3d1bbb22c81b5"
>   
> -SRC_URI[md5sum] = "43d8ea20c58494446aa65ba5cc6320fe"
> -SRC_URI[sha256sum] = "605f89ad5fdbfefe30cdc293303665eff2d188865d4dbe4eb510bba1edfbfce3"
> +SRC_URI[md5sum] = "62a7481c7dbf6d8cc21e4e3a79c72034"
> +SRC_URI[sha256sum] = "a59dc181727e95d25f781f0eb4fd1825ff45590ec8ff49eadfd7f1a537cc0232"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------2E84918963DC6D483A49AED6
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/10/20 3:17 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200610071730.20966-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 2.0.1 which brings the following new features
and bug fixes:

NEW: SelectorSyntaxError is derived from Exception not SyntaxError.
NEW: Remove deprecated comments and icomments from the API.
NEW: Drop support for EOL Python versions.
FIX: Corner case with splitting namespace and tag name.
FIX: Prune dead code.
FIX: Remove unused code.
FIX: :placeholder-shown should not match if the element has
content that overrides the placeholder.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200610071730.20966-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...{python3-soupsieve_1.9.4.bb =&gt; python3-soupsieve_2.0.1.bb} | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-soupsieve_1.9.4.bb =&gt; python3-soupsieve_2.0.1.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-soupsieve_1.9.4.bb b/meta-python/recipes-devtools/python/python3-soupsieve_2.0.1.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-soupsieve_1.9.4.bb
rename to meta-python/recipes-devtools/python/python3-soupsieve_2.0.1.bb
index df69e007f..aa087c920 100644
--- a/meta-python/recipes-devtools/python/python3-soupsieve_1.9.4.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-soupsieve_2.0.1.bb
@@ -4,8 &#43;4,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/facelessuser/soupsieve">&quot;https://github.com/facelessuser/soupsieve&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.md;md5=5a6fd3b0c24fc5a041a3d1bbb22c81b5">&quot;file://LICENSE.md;md5=5a6fd3b0c24fc5a041a3d1bbb22c81b5&quot;</a>
 
-SRC_URI[md5sum] = &quot;43d8ea20c58494446aa65ba5cc6320fe&quot;
-SRC_URI[sha256sum] = &quot;605f89ad5fdbfefe30cdc293303665eff2d188865d4dbe4eb510bba1edfbfce3&quot;
&#43;SRC_URI[md5sum] = &quot;62a7481c7dbf6d8cc21e4e3a79c72034&quot;
&#43;SRC_URI[sha256sum] = &quot;a59dc181727e95d25f781f0eb4fd1825ff45590ec8ff49eadfd7f1a537cc0232&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------2E84918963DC6D483A49AED6--
