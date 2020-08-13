Received: from NAM04-SN1-obe.outbound.protection.outlook.com (NAM04-SN1-obe.outbound.protection.outlook.com [40.107.70.53])
 by mx.groups.io with SMTP id smtpd.web12.13094.1597334166273532775
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2020 08:56:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=NUn8J8br;
 spf=pass (domain: windriver.com, ip: 40.107.70.53, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WVRQaxko/CT0ug6xeaJHG2TZ1XE0M0qvuqml4XskdDLnKMv5TyaP3F7R/yJRvrDX+D+TibPIBXIlAcDs/mB7dD/3yjkg1mWMF4cu75+hPxAkDExlnNGcvU8zu5i6vFSrONzaln52So98LZcR1IbOnYwAHDOJJp6mJJc+yFcT0x78ep1m9/vWupVxJxt4ptvmVNj/bn2XLDqbwkGtnafyShZhh53rGH7NISis1txeeMrQE4xdaVebZyyEkXfuy8RlX6GKjqucK8p3kgwDj7dM02HL1r/vUVemNQu4/OQUVoB+Bu1Sh3A4qJdjebnnhEeGCjHFyliprTAqs9O9i6iJwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wkxgV8dVKeyyoBe0ABLmTQdVpT79Cc63AuDKH3eSCRk=;
 b=JCsdGQnbJ8vY98RO+qo/CSYp9BIRlfhu1kGlzzjan+FwbKLFKsIUEMegWBpHEqxFazP9awDB6gRk3b0QHbAJSSpTgJZq+A2fAq7tMJsV8NT5CMci6eaiNGyApbxxsnDP0xV/dVwOTyPJbOYaufUCzPmOnLhFvIWhxaD1JxoqPC72kUJO2k2vbF5FRFDgt7mNfJV0m8eQMuUuffJUOCWLccE4EGziTrwFvcCR/D2tag6NdNrVZTXux2J5hlq9xlUxoZYRkbsGI5BAbZaZsAqmnUqvGxiIPEQdAv9X42sjV7JBTjV7x6isIfJRZHocFFEJjC9E7hk45Ur9GN1tETTErw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wkxgV8dVKeyyoBe0ABLmTQdVpT79Cc63AuDKH3eSCRk=;
 b=NUn8J8brxgmhCOBfA7xTDL2yHC8HSTQqlO23x36KhCGxpA6oSeWg8JrTULlB9WKpd7rbA4+DdZS7DSrhvVIWybRcJAGq2bF7wudF/E1THLTuokoE/4qvW8+He06kCwE0xkJ98EXP+fTB7ir12zYWxGRWDn/IqU7JekLsEcHDw7I=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3814.namprd11.prod.outlook.com (2603:10b6:a03:fb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Thu, 13 Aug
 2020 15:56:05 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3261.024; Thu, 13 Aug 2020
 15:56:05 +0000
Subject: Re: [oe] [meta-python][PATCH 2/5] python3-huey: Upgrade 2.2.0 -> 2.3.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200812102726.4376-1-leon.anavi@konsulko.com>
 <20200812102726.4376-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <98320315-8cc0-68aa-34c0-7a56270969b3@windriver.com>
Date: Thu, 13 Aug 2020 11:56:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200812102726.4376-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::48) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTOPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::48) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend Transport; Thu, 13 Aug 2020 15:56:04 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd1a0de3-a2e6-4e67-547d-08d83fa1629b
X-MS-TrafficTypeDiagnostic: BYAPR11MB3814:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3814CF1AE6DBF467F19EE1C29F430@BYAPR11MB3814.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	G6QesEHyOVgW3596EEbWEROk+WJdx34rEQyl7A675Xvtv1D84/EuAxR92Ll1UUwqtE0hyOGMgGWzKlpq3Q70YgCke8HiAqhncyMK7RJ+xQDIqK+czLg7QuB3Ye+TAyE5HQ8JeKE9etzP/USqIPqxTjFcvJXbJwWIMCzuaoRqrvbMNvR/P7crKZGbcC3MGu+o6NK3PLw2vDKKVbm9GBhA3sxKd4KLu87kwYqRVoUwxDBLft1v3mgtE7p0ENM0vrEGxfCUxmH0itymRBvCfh8bN/YG1+BgD/CRS2dkRMUp7nVbeu0csiCvWQyi8RaCKHeVT6bZYjCtnghRsP54e2MFDVkjpuoFcRwVimJrymEeJ77ZMkr9fHMrBZk+7kJuPn+6rFUY5b6gg6riEDDaUcloMmdU3QPlEqrKjyrMglzhFkN1esfp/YwThsXeI7JHBoJ+MRWfaWWQ2Vttc4oDcHFjMQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(39850400004)(376002)(366004)(136003)(346002)(8936002)(16526019)(66946007)(66556008)(966005)(66476007)(2616005)(31686004)(31696002)(44832011)(186003)(956004)(36756003)(166002)(83380400001)(26005)(86362001)(5660300002)(16576012)(53546011)(33964004)(6486002)(52116002)(8676002)(316002)(2906002)(478600001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	Rei//jqr4zu/R2WB9NGc2pBKaSVKpFES+YW7Gm7U3UihSbLYX7VckXdBaYoMoQ04dwwG6GFAOgxZcy8aiVqNM8u7aDJj9W2Qe13VqLr7jgq7p1SV24gnbd07dedWglTk/6GYklvxFZeYWzq8+6nXIk1RFxeOfMfeeC4mAQ7s6DWXKfpEcN2jvugq3apuC+YWNhFFM4oknHFgvA//yM9DoyR8kSXjz1n5S00zA5JNXXcxWy5ypB0RNTw/zJ1uPUXqxYZNVAFD6fH0hIq9cBvHJcUkyI1kk6HYgpDUZhZu7aNu5qoYtA06kdaHLoA7UwTX28Z8GPts0OYAVpJ/fszfCzKCFgJ5je4G9Vc+QakFe+L2KZqrnf0hBGNfDT2DjnprYq3MA7cDPhSX3O8fr3deQ7ROGkADKWnpIBTItxG27xwZJWWz/su+NNMu0CqwXFB707ZOcxcByMJW4eAkwTdFTVejbtw+rcMI9CzqC//W7vnPS/LfhuolqB0jfW+xKgMbBGW6SRDc/w2yGq+VSvuIPBhEYpajbFELQGzi2h0ZSx7exI9I6IneCT3XYk5kTLZEEPxF+7maVSAdOHbZtqdsiW6TObPKqO7QAB/3eUxaEJMp5xnDSw0pHUabG/Fno4zsJ6+0YjNzpVRb9Ch1l5SWwA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd1a0de3-a2e6-4e67-547d-08d83fa1629b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2020 15:56:05.1575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 52DgCFFXgqZUVcZiWx0rQiiSoqxyoClBxgJQHpEBUlVdjfzsh//VNl0UhEVxP5tqwIP2aQhlDVL/P04cBXh+aTcXiMeZ4BIltBU+HTRVDR4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3814
Content-Type: multipart/alternative;
 boundary="------------C2D22C467FA8F26FC6961E09"
Content-Language: en-US

--------------C2D22C467FA8F26FC6961E09
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/12/20 6:27 AM, Leon Anavi wrote:
> Upgrade to release 2.3.0:
>
> - Use monotonic clock for timing operations within the consumer.
> - Ensure internal state is cleaned up on file-lock when released.
> - Support passing around TaskException as a pickled value.
> - Set the multiprocessing mode to "fork" on MacOS and Python 3.8
>    or newer.
> - Added option to enforce FIFO behavior when using Sqlite as
>    storage.
> - Added the on_shutdown handler to djhuey namespace.
> - Ensure exception is set on AsyncResult in mini-huey.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-huey_2.2.0.bb => python3-huey_2.3.0.bb}   | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-huey_2.2.0.bb => python3-huey_2.3.0.bb} (59%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-huey_2.2.0.bb b/meta-python/recipes-devtools/python/python3-huey_2.3.0.bb
> similarity index 59%
> rename from meta-python/recipes-devtools/python/python3-huey_2.2.0.bb
> rename to meta-python/recipes-devtools/python/python3-huey_2.3.0.bb
> index cac6be954..f70a349fd 100644
> --- a/meta-python/recipes-devtools/python/python3-huey_2.2.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-huey_2.3.0.bb
> @@ -4,7 +4,9 @@ LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=5cac039fcc82f01141cc170b48f315d4"
>   
>   PYPI_PACKAGE = "huey"
> -SRC_URI[sha256sum] = "15cef4225f7ae200fbecf89a0fed13e389fd751d6c8e1d3b26562b7df953de0e"
> +
> +SRC_URI[md5sum] = "aa9f2a8f54cb68c62690c5e28589f49c"
> +SRC_URI[sha256sum] = "76978840a875607cd77c283c4ebf3ea5071b2ec06a1ac428d63be0d88f1e7070"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------C2D22C467FA8F26FC6961E09
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/12/20 6:27 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200812102726.4376-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 2.3.0:

- Use monotonic clock for timing operations within the consumer.
- Ensure internal state is cleaned up on file-lock when released.
- Support passing around TaskException as a pickled value.
- Set the multiprocessing mode to &quot;fork&quot; on MacOS and Python 3.8
  or newer.
- Added option to enforce FIFO behavior when using Sqlite as
  storage.
- Added the on_shutdown handler to djhuey namespace.
- Ensure exception is set on AsyncResult in mini-huey.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200812102726.4376-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-huey_2.2.0.bb =&gt; python3-huey_2.3.0.bb}   | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-huey_2.2.0.bb =&gt; python3-huey_2.3.0.bb} (59%)

diff --git a/meta-python/recipes-devtools/python/python3-huey_2.2.0.bb b/meta-python/recipes-devtools/python/python3-huey_2.3.0.bb
similarity index 59%
rename from meta-python/recipes-devtools/python/python3-huey_2.2.0.bb
rename to meta-python/recipes-devtools/python/python3-huey_2.3.0.bb
index cac6be954..f70a349fd 100644
--- a/meta-python/recipes-devtools/python/python3-huey_2.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-huey_2.3.0.bb
@@ -4,7 +4,9 @@ LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=5cac039fcc82f01141cc170b48f315d4">&quot;file://LICENSE;md5=5cac039fcc82f01141cc170b48f315d4&quot;</a>
 
 PYPI_PACKAGE = &quot;huey&quot;
-SRC_URI[sha256sum] = &quot;15cef4225f7ae200fbecf89a0fed13e389fd751d6c8e1d3b26562b7df953de0e&quot;
+
+SRC_URI[md5sum] = &quot;aa9f2a8f54cb68c62690c5e28589f49c&quot;
+SRC_URI[sha256sum] = &quot;76978840a875607cd77c283c4ebf3ea5071b2ec06a1ac428d63be0d88f1e7070&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------C2D22C467FA8F26FC6961E09--
