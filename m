Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.78])
 by mx.groups.io with SMTP id smtpd.web11.10331.1593091132916252963
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2020 06:18:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Q6vcps5H;
 spf=pass (domain: windriver.com, ip: 40.107.94.78, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SOivXOjsLFVxpNLSdhHr72RJXs+0QMNRGGTasY9/BzkXDZl/7NNts+66Cqwc9Cby4f6BBc4s6B5yTtF3zMfN2MhO03YnHNvt8GD02/cYPRHCNV+nqu3ZL4NP6xZkDzlcDYUIDgX9C+PkjLASUdq4nPZM19ai9qtmvYR/nyxJNYzaalfsZQb25TMt6zrMSpF1gkI9/OrtV8yKVl8mvwj3ejZLmVObjHsLTc35RHs7DldYDoRa2oENcdcLFEKNnFn9AcnpmekFXKPkE5Z3RzTY0yO7DxTdZKYnZraMxSPyVU7g1hsELuD30L16SmYk/xUsOo+0t+QR35+LuU++Qgti2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sDjvbe4DtLMWQFd1wpyVUa/k4AH4WsGvoClGaVU1Rlw=;
 b=C7v6bAsackLZu7uO6TySvGP9xTU2c6ngRYlFkLqQG1j4kbJBROWdmxFNtdUWUh2T272ceyT/nbz6I/NpYtliuNiCB7u0MCY/9HVHcEijyb+FQgxEZpojBKDMy71WOE5GpY09pqMFZ0DR2HJWhsiv9myZ0Ojr9bkufFdhBNJ/2G6nXsHFbZTF8IXWJajNnq78WSsQabie6pF4Eq2wR44+DgToKY5taEgOZS3z20zOAiPvizPA8IksFXQ8bJfIJkH3Svig92ERKfjKN+T6Nav/FNsFpq5bG9HoMCqsqKjNYYnMqy1B6NrxWHRbUrWTfU+5Yj95MNpBayrA0eI8dSM+OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sDjvbe4DtLMWQFd1wpyVUa/k4AH4WsGvoClGaVU1Rlw=;
 b=Q6vcps5HSnX2Kzw1iV7FBKN+nXWyc+WXfMEkYwwCF6yHuUVIqDqpJenrh7rw6KFgF/qzIeSrCL32W/RZcbfZ+5Ki+nqwj9KwzItzijjGz9hKkpfbvbfeSppLl/5p0DZ0kdbAQpN5+lsX7zGAKFxPUDNWfq3MOrny6X4Tfy2fbpE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1713.namprd11.prod.outlook.com (2603:10b6:404:3c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20; Thu, 25 Jun
 2020 13:18:51 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.027; Thu, 25 Jun 2020
 13:18:50 +0000
Subject: Re: [oe] [meta-python][PATCH 11/11] python3-xxhash: Upgrade 1.4.3 -> 1.4.4
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200623095136.24854-1-leon.anavi@konsulko.com>
 <20200623095136.24854-11-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <1c1fe2fa-5775-15b1-dc31-ab43afff435d@windriver.com>
Date: Thu, 25 Jun 2020 09:18:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200623095136.24854-11-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0015.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::28)
 To BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0015.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend Transport; Thu, 25 Jun 2020 13:18:50 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44bb2033-d0e0-42fe-6a8f-08d8190a4ce7
X-MS-TrafficTypeDiagnostic: BN6PR11MB1713:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB17131CE9AE681E922730F41D9F920@BN6PR11MB1713.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:88;
X-Forefront-PRVS: 0445A82F82
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XZXzMwvLbwGjgXHc70W2YPBzOhkhypKqdHBpKLCgbvSEN7yc800IWjSRJNOKTukpQYwah5oAEl0kSthEhkV85bQzyv/lJ9RRWroDGVRefbZl++t7q1mEKhH3kiDppEdZgCCPeabhlbdY+yWg1DgkvLL/rb1cSMkf7pclaCyMiDjOy6xhVe9+XVd6aKpxrnAEIBYPhxQDW/J7kqb89PdvHKwloaA7h6svkshgXlnpjJt812krWNhLcHsKuNVxevSSsUkw93unGQoliNnPxVHxglm9b5u52GgwtpvD1iXkn4UwrHrjeoZdVc8FzcKCqfm2ieNupXAOrQh5loj6W0GvKZL/YrREf7IghIPmVtttFmNsswJjQulh7J7U6RgZVbRjxxJiZxbj2VehSYYIqNyJ7Yc6v8WihjU5WK/wAIHtqrd3YpBUjWVVCmJnN9bLC0eIF4BiJg4ZWOuAGZZoTJu3JQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(366004)(376002)(396003)(136003)(39850400004)(478600001)(316002)(16576012)(966005)(86362001)(31696002)(36756003)(33964004)(956004)(44832011)(52116002)(2906002)(31686004)(2616005)(53546011)(186003)(16526019)(26005)(166002)(66946007)(66476007)(8676002)(83380400001)(5660300002)(66556008)(6486002)(8936002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	1ZSRorKgh8RwsPL5/lqbRYSHSYLS/8p1fDGcZDepsrycxGeD7PvsgiHINX0k3I7CP7i6oWnnFPEceMCOklrcQlxy5HFsa0LJfO2XoWe80vF0OhgdTjrn0HfvbZUq/KIMfxj2s1J7LdH9g0vkB5Y/Y/vobG6eYPN8L1Ee9fZAQrvyMOnRPuYEy3iZ+OgudBvj7x0x3tZHbXJTe/cGVk6Fr4xBLuSUXkm5QQUPbVkwQP7hpoQKrFk7q8+CdkmfVzLjnqmpZleWW6mICLhH+iLcpyPG9Ty0afZvdSwhPU5oW0MjuH7w79+WAPzc8tOgtOUZvj4G8IzsfwkWU53CTVvp4HiqzKVItenVxsjGZV0sMQkJInCTRxWRQHN8yrW6HPbFZjgEFCTAOaiBieH7Igd/xVzL6Q60ow9o1maKaZ51h2cJR9OBvmaRVPMadiASyvZpqYwJHJMfGt/fjZ0KHr0J4A50HOe7LsSR24oDB/b7GkW68UcRJTBM6qY26IzOjyKM
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44bb2033-d0e0-42fe-6a8f-08d8190a4ce7
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2020 13:18:50.6436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1PVbM/2ltR6fOFTyoujPFVEV+10t8TRJqTnTvNEbRCh6PIyqRT+5fSs4TnT77EHUxDtysTcjkMmDjbnDKScxE8x9/dbv0uiGebBb260OPzA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1713
Content-Type: multipart/alternative;
 boundary="------------E6EE47A44DB4587D09E4FE7A"
Content-Language: en-US

--------------E6EE47A44DB4587D09E4FE7A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/23/20 5:51 AM, Leon Anavi wrote:
> Upgrade to release 1.4.4:
>
> - Upgrade xxHash to v0.7.3
> - Stop using PEP393 deprecated APIs
> - Use XXH(32|64)_canonicalFromHash to replace u2bytes and
>    ull2bytes
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-xxhash_1.4.3.bb => python3-xxhash_1.4.4.bb}      | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-xxhash_1.4.3.bb => python3-xxhash_1.4.4.bb} (75%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-xxhash_1.4.3.bb b/meta-python/recipes-devtools/python/python3-xxhash_1.4.4.bb
> similarity index 75%
> rename from meta-python/recipes-devtools/python/python3-xxhash_1.4.3.bb
> rename to meta-python/recipes-devtools/python/python3-xxhash_1.4.4.bb
> index c114a6c8b..97f4e358b 100644
> --- a/meta-python/recipes-devtools/python/python3-xxhash_1.4.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-xxhash_1.4.4.bb
> @@ -3,8 +3,8 @@ SECTION = "devel/python"
>   LICENSE = "BSD-2-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=5a8d76283514a1b7e6a414aba38629b5"
>   
> -SRC_URI[md5sum] = "ce9cbbcc89620fd47a2468badd08dcf0"
> -SRC_URI[sha256sum] = "8b6b1afe7731d7d9cbb0398b4a811ebb5e6be5c174f72c68abf81f919a435de9"
> +SRC_URI[md5sum] = "0194cc926dd7676d27aba0f89da9798b"
> +SRC_URI[sha256sum] = "7d6df9d217977d085b8abd74b61efa40405ac416f2d8bdacc40826bd5cb1b746"
>   
>   SRC_URI += " \
>       file://run-ptest \
>
> 

--------------E6EE47A44DB4587D09E4FE7A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/23/20 5:51 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200623095136.24854-11-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.4.4:

- Upgrade xxHash to v0.7.3
- Stop using PEP393 deprecated APIs
- Use XXH(32|64)_canonicalFromHash to replace u2bytes and
  ull2bytes

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200623095136.24854-11-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-xxhash_1.4.3.bb =&gt; python3-xxhash_1.4.4.bb}      | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-xxhash_1.4.3.bb =&gt; python3-xxhash_1.4.4.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-xxhash_1.4.3.bb b/meta-python/recipes-devtools/python/python3-xxhash_1.4.4.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-xxhash_1.4.3.bb
rename to meta-python/recipes-devtools/python/python3-xxhash_1.4.4.bb
index c114a6c8b..97f4e358b 100644
--- a/meta-python/recipes-devtools/python/python3-xxhash_1.4.3.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-xxhash_1.4.4.bb
@@ -3,8 &#43;3,8 @@ SECTION = &quot;devel/python&quot;
 LICENSE = &quot;BSD-2-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=5a8d76283514a1b7e6a414aba38629b5">&quot;file://LICENSE;md5=5a8d76283514a1b7e6a414aba38629b5&quot;</a>
 
-SRC_URI[md5sum] = &quot;ce9cbbcc89620fd47a2468badd08dcf0&quot;
-SRC_URI[sha256sum] = &quot;8b6b1afe7731d7d9cbb0398b4a811ebb5e6be5c174f72c68abf81f919a435de9&quot;
&#43;SRC_URI[md5sum] = &quot;0194cc926dd7676d27aba0f89da9798b&quot;
&#43;SRC_URI[sha256sum] = &quot;7d6df9d217977d085b8abd74b61efa40405ac416f2d8bdacc40826bd5cb1b746&quot;
 
 SRC_URI &#43;= &quot; \
     <a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------E6EE47A44DB4587D09E4FE7A--
