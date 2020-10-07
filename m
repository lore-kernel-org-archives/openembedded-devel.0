Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.47])
 by mx.groups.io with SMTP id smtpd.web10.1492.1602078542394400862
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Oct 2020 06:49:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=dP2QorS3;
 spf=pass (domain: windriver.com, ip: 40.107.93.47, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oPcOFtQlL4FK6nYdutJEFAHgh7gJK9AyLZFSGrJrrVEN9+nRGbQMGz3Gm23TRMbLR/HEjRwiGdXElvsM+2bzQx61bl19WR/H4Z8FZmh8pVo8ltkOEcTNZxRczZ8bQpDNKiYUz8Dc1rAuI96RtacfwpJs/0exeh+IZW2gdQK9suTwChD89ukZlk13ms05VycY+M3/l/0goMMf/94UFJxC0+W9CWchEE7Bpef+To+hPb+bnz8RVn4wCMHS4v+3VD9f+6Qz6bxxsxvJUgS3wHRwiHrZ7hdk/BbQ7d/T207Hb0CSiyBVZ+BsF4FZ+/snGLGOTygilMw524F6VRKylK2Mwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ITc2/QVMAvIkubRO/VyZ/DDKWYD3C/Z+n1+Bh8HxRFQ=;
 b=FFvdJOvM+dcG3XeSeXc1UOK5BhtHVQnLmaElu3JBrWa1c7mGvnemFFYH/30mjiLqJIFndr/y+cz6KEDfad6f6LgK4JeF0cm5crtPKEMMK/Y9JRQPUbvCdhmKmFsJKZReYZ8cD7J9jDKzKNhRWrmOiLcC3dZbsay1Qw3bIOr5q77MpDyEzlHXa0Q4MfHiLFXN4hYKpOjQRbfLrz7VZmxUEOOBxVhKCBJStu7TtXLfq3aTc+duGqVR4Izm1JfvZIv0zqd3/nCKsPlqkAzRXWnTp563wRsqGk8Yh1JfLdQO/bMUXLbjiWQcPVsA/JFvm60/AjieZ7HJsNtz8OMbH8Jk4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ITc2/QVMAvIkubRO/VyZ/DDKWYD3C/Z+n1+Bh8HxRFQ=;
 b=dP2QorS326RYeuadrYBXFRmvxS/zDmMjQIwW5nDLiADIAb+hKFye5AvqMF8x1eZS1TPFcJtjEHuBc/uX3+1Jrki2Nmtb9UknmooVIfp5RmZb6aFzbHMlJqMgY+OeYe1QQd6t2wThIPbo9L7yYjOYYywawYxlio0mhM6JkMYeZTM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2920.namprd11.prod.outlook.com (2603:10b6:a03:82::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.37; Wed, 7 Oct
 2020 13:48:58 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3433.045; Wed, 7 Oct 2020
 13:48:58 +0000
Subject: Re: [oe] [meta-python][PATCH 2/5] python3-pywbemtools: Upgrade 0.7.1 -> 0.7.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201006090526.24310-1-leon.anavi@konsulko.com>
 <20201006090526.24310-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <fa0cb349-bf3e-0951-2541-a9a16ee9def5@windriver.com>
Date: Wed, 7 Oct 2020 09:48:55 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <20201006090526.24310-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YT1PR01CA0074.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::13) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0074.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21 via Frontend Transport; Wed, 7 Oct 2020 13:48:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ab75367-1756-4f6d-34be-08d86ac7bd3f
X-MS-TrafficTypeDiagnostic: BYAPR11MB2920:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB29202F68CDDE3C65C9849B449F0A0@BYAPR11MB2920.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:291;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	J6kqTthTd1zy+YWXi+nmQPE9rz20RWwWX5M2epZqIEuA380QuqCpsCX2HCiG/QuGuVABVaOebscrX2jfCxSr79+5hJNnke2y5qtEX9XDK/WIv/00g4NEoJQlzhkvOq47F8O6Afk3zpSd9XGWWQ65X6VY2EuA3sXmq2lg4DPA5nN6hll1RycJqbDK0CAOI4j8Q0t6Hga5E/s46MvI7ldAaaA2nXgI8U5z1S+/EfLQx7zjNzgUareDR6veNcjYoSzsSPbzp5ToxqA21TIDYmprsxqLPKgi/Lcx8EanXMec5uAxxP5+atCRiIzdgN/xnHm+6XbmK/soCzagvKTudCzf0b+X1aEm+dfCmWbzNJn8I+Lc/2oxKHYvttv6jflSZhD+RIaSszYnzcRqufpZYq73MDD+UmHeTnvfEz63b11F9NG6Zlx/Rra/e0qy9GqpflcP/ubpI7LGHETLqRElNvLeLA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(136003)(39840400004)(366004)(2616005)(26005)(956004)(53546011)(966005)(16526019)(36756003)(186003)(8676002)(16576012)(478600001)(316002)(86362001)(66946007)(31696002)(66476007)(2906002)(5660300002)(8936002)(83080400001)(166002)(83380400001)(44832011)(52116002)(6486002)(33964004)(31686004)(66556008)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	SIqiqjAsKhV+CZatnopRlhUBH5fS5RB0N7CvLdEC3RBrimEjh3gW1E8SuxD8pmBCyCC0zqU3ms55rnBP4c4LzzBKWMCfFmwWV/bmVUhVqc1jUyb+Hd/iwnRledF4c/g3VhcTDv/LZn6KsPMVIbxKF6kTdTUo+JqAKO4+93OM0iI3RR231B4uKUQWfSXqIH6Kub2Bhm1Z5M69PmbZAdDL8mISijfjEbka1cfR3OCQubHKLruY1a4cO05+BQPUb76O4HLmKKRIfq7JfuTGa2+79NPhpCBGQppR3DvB7EtT1x+B+jjkQ8TYmmFbexE7KV9jBEgOuxpfMivKiDkX4sKGb4S95Agi/Xjd1OGAegeZvvutBCEjjNUYYeTmsLw1591lv1YusawlhzLnBFslz9ZQT8zBDKaTOP5udFcihRIFyKTARDkFXldBlipt0vsqBoGijn3uA/uDHmyOZpbBfOpOuDmcv16qU0lFOGB8TSzk/ake02kuMy+RSBdJpE5GZ/V+YPwyXPC97h+l/utGVTiIC46j3AS3ik4JPwR6XUPifeBMAHxmuNu4cTfdpKAStUWxU91ww+z0NwleXB7cv9RUZtYy4Dm91hC87FcbsCjnWKlMDGX+rqLmWLEsH/9QWa7ycC3xKqFggI90ON6NgkC0aQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ab75367-1756-4f6d-34be-08d86ac7bd3f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2020 13:48:58.2345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ww9UPF+KOtwaVM3S2gkx3ojqf8a6r1Cbol+lx270NZ9okDT100ujE6O7JzKemEcQ1R2oe9Z82FlYWTw3v6/7gpy61yBSdP6KiHVIPSgfatM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2920
Content-Type: multipart/alternative;
 boundary="------------BDF7853A0108F2E1185A7DAD"
Content-Language: en-US

--------------BDF7853A0108F2E1185A7DAD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/6/20 5:05 AM, Leon Anavi wrote:
> - Test: Fixed attempt in test_class_cmds.py to invoke a non-static
>    method on a class object.
> - Test: Preventive fix for potential issue with virtualenv raising
>    AttributeError during installtest on Python 3.4.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...hon3-pywbemtools_0.7.1.bb => python3-pywbemtools_0.7.2.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-extended/pywbemtools/{python3-pywbemtools_0.7.1.bb => python3-pywbemtools_0.7.2.bb} (87%)
>
> diff --git a/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.7.1.bb b/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.7.2.bb
> similarity index 87%
> rename from meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.7.1.bb
> rename to meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.7.2.bb
> index 05f77288e7..9121f81079 100644
> --- a/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.7.1.bb
> +++ b/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.7.2.bb
> @@ -4,8 +4,8 @@ HOMEPAGE = "https://pywbemtools.readthedocs.io/en/stable/"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
>   
> -SRC_URI[md5sum] = "a789da735c04ddc08ba828cd8022243e"
> -SRC_URI[sha256sum] = "d2fe776c78a740215142f4f033055093f2283fd9327440c59734716e51e19989"
> +SRC_URI[md5sum] = "54ebb824d7ab231ef1f1e88d8d69ac69"
> +SRC_URI[sha256sum] = "36d70f7d33498cab626e9a2871ea82e434a2c36fe6c240f400615082965f1e4e"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------BDF7853A0108F2E1185A7DAD
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/6/20 5:05 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201006090526.24310-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Test: Fixed attempt in test_class_cmds.py to invoke a non-static
  method on a class object.
- Test: Preventive fix for potential issue with virtualenv raising
  AttributeError during installtest on Python 3.4.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201006090526.24310-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...hon3-pywbemtools_0.7.1.bb =&gt; python3-pywbemtools_0.7.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-extended/pywbemtools/{python3-pywbemtools_0.7.1.bb =&gt; python3-pywbemtools_0.7.2.bb} (87%)

diff --git a/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.7.1.bb b/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.7.2.bb
similarity index 87%
rename from meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.7.1.bb
rename to meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.7.2.bb
index 05f77288e7..9121f81079 100644
--- a/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.7.1.bb
+++ b/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.7.2.bb
@@ -4,8 +4,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://pywbemtools.readthedocs.io/en/stable/">&quot;https://pywbemtools.readthedocs.io/en/stable/&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa">&quot;file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa&quot;</a>
 
-SRC_URI[md5sum] = &quot;a789da735c04ddc08ba828cd8022243e&quot;
-SRC_URI[sha256sum] = &quot;d2fe776c78a740215142f4f033055093f2283fd9327440c59734716e51e19989&quot;
+SRC_URI[md5sum] = &quot;54ebb824d7ab231ef1f1e88d8d69ac69&quot;
+SRC_URI[sha256sum] = &quot;36d70f7d33498cab626e9a2871ea82e434a2c36fe6c240f400615082965f1e4e&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------BDF7853A0108F2E1185A7DAD--
