Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.59])
 by mx.groups.io with SMTP id smtpd.web11.802.1592586852449689356
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Jun 2020 10:14:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=OwuTsFgL;
 spf=pass (domain: windriver.com, ip: 40.107.94.59, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F0DuwV0zVJ82Lzk9M5BySR1OsLYKGQhVncjkPlQJf6+kj0hTTc7qHmbyvtYN3VowM34l3qZpMtJbCzjgHU4QDpz3p80h66QH/JlMQJBolujCExRDunVrneRyiU21ob7Qyb9Fp/bBLBI6F0T84UzNgHadVkkfuw/e0LGgO09He737FrwxgLHXyJdEfWHb78GqeqWIZGx812CXJNcx2EGXPCNnMi39a2fLpb9o2zr8DCmjbpP77tB5oSzqBUVbo0Qt1SLhE5L59Y4s0crwK7pWyGm5YQSugA/RIUeiK7BmNRNIh7NlZezJKyc94OKtLRrg5dPsVe9IRlBgyUiVNnjvvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CkAi7E6DPBUmNaLOXdGBqBUsvlxKlU0sRLGGRHnI+EI=;
 b=W4O5Fsb/OhjXta+sjA1INgNMOJC73aY7huwgaNjgxvyP7Ii3m/ZBUisOVi059C+r+3k2gwU76Q7e5YI+N/qqANzlMqsZuSaCzVtE9mGvYAwXmdgA9pwGIGCxMOEPDAeAaLSFbmSNzVgj8BV+L1EDWCdghFeJgT2FK/tXKsfQrcwOlaMkQAMQ/2RQMJtKIcfAaBfW4kJRrupKjsNW788mUbxZoMM0qEGTZVYY9NjTTNEPy4CDypz3n33gM896DL9SnndmladIyHPyX+iUrtn9bVHFjXqQj3QM9BWYjVyJxP9ZV83ZdmQNVFBhAuDHk/OWYrj2Lq2WNs2J38AFpEPngw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CkAi7E6DPBUmNaLOXdGBqBUsvlxKlU0sRLGGRHnI+EI=;
 b=OwuTsFgLuVtYAhzJw6C3cPyUVxEPJ1b70ihHCAA/Pn2JpYph1XvbzfP9SKFOsRv2k53BWTE8DaXpu84w7A2LidYLKDLnN3lvkVeLEO6V2EsR2C9Zdb6b2Qfr0iiR2zfO7Kk75t2R08HVg2n0GCU6I1++qVvbRRYwwW3mmPfdqok=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB3876.namprd11.prod.outlook.com (2603:10b6:405:77::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.23; Fri, 19 Jun
 2020 17:14:10 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.021; Fri, 19 Jun 2020
 17:14:09 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-pocketsphinx: Inherit features_check
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200617101531.11242-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <31fb4b9d-7685-40d6-5513-ae8fab060d6d@windriver.com>
Date: Fri, 19 Jun 2020 13:14:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200617101531.11242-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::48) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTXPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::48) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend Transport; Fri, 19 Jun 2020 17:14:09 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a880a4b4-fc86-4a39-134b-08d814742e1f
X-MS-TrafficTypeDiagnostic: BN6PR11MB3876:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB3876BBD72E6E38B7FF0B5EE69F980@BN6PR11MB3876.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:159;
X-Forefront-PRVS: 0439571D1D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ilPzX5LNe5W5ynsscsTkioxr0HuyHJYoQ04owbiLRVZ9Qk9u105gFdcY51DBmHBpi/sWz01+V4dUU3WXJZLp8BfRqScxGelCaT5bm2ZllHyRa9L+WDdclRY2bPD4+JbX0hOFsl502zzgQO21du2YRxkjNTjIXNLErW6gu7u4xDK5nEvGuS8mOttHgEfhlPWJIeRnLpxU0kGu/Vq2w73RTKQS4aQHNqWshR9Gjc53A6IiDMrs+sQlGggnNwcTb19kuep4T+jPokUMK0VTRvIft2YqpdtROUnvAlMdOv2eEWa8ZXcFxGNJQRv+lIG+YRSNnLXgS3sNEXl00OmLv6TyZF+ZmsebXjJ4sRUTF8/0GfSuQx5a+5cG4/EBdKeA6pP5pHfSqWCZRw9n74NIXuQHh6ZF7/v5n9Oe/+XG0T5alFLJEqT5plhc8cgJEVVcaJ9TunQMNwywfRK6E0sZX04tZA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(376002)(346002)(39850400004)(396003)(136003)(6666004)(53546011)(44832011)(966005)(2906002)(186003)(956004)(2616005)(8936002)(16576012)(52116002)(36756003)(6486002)(316002)(16526019)(31686004)(5660300002)(26005)(66476007)(66946007)(66556008)(8676002)(83380400001)(166002)(478600001)(33964004)(86362001)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	MZ3E2p6gj+/JKC+QZrXNAncWqI5ZycJBw4ZduCEEVwmNFtIlzDYSmRDgy/XO+iH53kHzH7tGDYtUepmw5X2+j5t+JSxFaxMirWT1TNMrAFKcwZnThVJWXjd1xNdQJS+iZAlwHldYKfk5cT069kaj7d4ZcEW2jlmAZa65XhKiNbXvKx9injyeNafdnglqFfqCH0UFvpWY0JojOky5O7it1/w2TcNNBGT4Dnk0wESy3RmGwu04SJuuujNPIALlm+kzQ5kMvIdqWxW82tBph3IyNoKrQve1PnBJ6QseYHmm0xrLxQ3eIiiVh5lmTaM3W6aGHgPXNZGHMNhUIcb8z79QyASLxg50mLy8uCAzkhUF1CTtm0xW0GqM/9PHC6M7caqlvL9vvBO4sXaKTZ9Ua5D/NJSjSwIpZcCs5kM/aWOcj6kKDPsK4Vf/RF8w8nQzA4lYhGYJO+LuraTbsR76PrRd3ETgJAHcfpSzBGHbey7UJU0uZgV33C949hwXyCa1JNh3
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a880a4b4-fc86-4a39-134b-08d814742e1f
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2020 17:14:09.6508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mfHp5E0Dgj38Tq5kPgXX4v/2UVi6uZqTSGEE4Eq//2nNwxzvwkdlFWNoEUs1pXK3ktGzl2s88UA0yhPapRxDT8TrHMxeRAdzoJM8QjKiGYU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3876
Content-Type: multipart/alternative;
 boundary="------------426B977B872AA2CBEACB5B0A"
Content-Language: en-US

--------------426B977B872AA2CBEACB5B0A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/17/20 6:15 AM, Leon Anavi wrote:
> Inherit features_check to fix unhandled-features-check warning
> while executing do_package_qa.
>
> Suggested-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python3-pocketsphinx_0.1.15.bb      | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.15.bb b/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.15.bb
> index 5aa0eb6bc..f7ffd9d26 100644
> --- a/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.15.bb
> +++ b/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.15.bb
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=826ebda787eb48e78aec2624f9faba72"
>   SRC_URI[md5sum] = "94d008eebea16acb60a9ffe614575dee"
>   SRC_URI[sha256sum] = "34d290745c7dbe6fa2cac9815b5c19d10f393e528ecd70e779c21ebc448f9b63"
>   
> -inherit pypi setuptools3
> +inherit pypi setuptools3 features_check
>   
>   DEPENDS += "swig-native pulseaudio"
>   REQUIRED_DISTRO_FEATURES += "pulseaudio"
>
> 

--------------426B977B872AA2CBEACB5B0A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/17/20 6:15 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200617101531.11242-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Inherit features_check to fix unhandled-features-check warning
while executing do_package_qa.

Suggested-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200617101531.11242-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python3-pocketsphinx_0.1.15.bb      | 2 &#43;-
 1 file changed, 1 insertion(&#43;), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.15.bb b/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.15.bb
index 5aa0eb6bc..f7ffd9d26 100644
--- a/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.15.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.15.bb
@@ -8,7 &#43;8,7 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=826ebda787eb48e78aec2624f9faba72">&quot;file://LICENSE;md5=826ebda787eb48e78aec2624f9faba72&quot;</a>
 SRC_URI[md5sum] = &quot;94d008eebea16acb60a9ffe614575dee&quot;
 SRC_URI[sha256sum] = &quot;34d290745c7dbe6fa2cac9815b5c19d10f393e528ecd70e779c21ebc448f9b63&quot;
 
-inherit pypi setuptools3
&#43;inherit pypi setuptools3 features_check
 
 DEPENDS &#43;= &quot;swig-native pulseaudio&quot;
 REQUIRED_DISTRO_FEATURES &#43;= &quot;pulseaudio&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------426B977B872AA2CBEACB5B0A--
