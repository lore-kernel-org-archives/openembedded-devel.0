Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.65])
 by mx.groups.io with SMTP id smtpd.web11.3389.1599675969056657298
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Sep 2020 11:26:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=RdptWuZ6;
 spf=pass (domain: windriver.com, ip: 40.107.92.65, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LGJErLIBfDg6cg6Bbk65tJMjRpjmWW6cftvuY+5Tk9RAuWH8YLEmbNXpBJkf4kevPO0zmpT1LrR1iG7IHzeydU/JjjZkIdRb00TKbBNX11NRGB15l7lBSX0QgMmIiHfqtHmk37DBQ6kQqDsiRpgOuq4rnUdhNEnTp/TU3uHVbAve8/uFeGDRKOLri1hDPGLGVBOHvvOPQKZMmnMUMRGGPNuu0oO6PT8AjeisugRa0+H53zNHw3JIwieDDuTFvXlIiomRyRpMbN43T4PcvWDvhg8ivSlqZ2i16RWPIHb8CJ3s7EvbDNHzbxa7kMFT5Y8BX9sE3IWi+vuxr3dnehe52Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8qd7NaooL5aRowCn2geFUmwHrTDqg9JYwPP5tYUUftc=;
 b=bkr/CDrNDEZSF3/HNbAurbeH5RoJLrQcKRaWN8/2137Ol5j7gzO4JNzSG9qxBSDVIKvq9FahvdkVxpHDZIQv2Rxbo9cbyNcXgKhNCw/KqmNrX5+9GoFueJgL7JDAPUI3lojvPqAVbFYFikgBNFmRycgzcRl4B6kNymhUllUaHIkQIIinmxdOL34C61Z3Me/XPjE3cVkgFW9OuqwMsRBWn2JpF3wz7QtfxEeJUi7QHGtno0ElHwxb0Be3KQgnSr6eyS3KCg36QeB/I9lMIDPbn7T0J1V4S3FGrqivOxyh78f2/bxMjAIjNMkQ0XWka8AB8tGSr4wonD3FkazHwrPpAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8qd7NaooL5aRowCn2geFUmwHrTDqg9JYwPP5tYUUftc=;
 b=RdptWuZ67rHLygjMUxYTljypiseNsAKz3GcWEhdZd4p0vdWZZsjU4afei7BGjw1dbBohDZwA2VKJFybRQwHrJ58pZHgKty43IBs4gRSMIqe/b9GBO/LSlFUOj5gm5dwYP6gvY3ZiTz8TQcmFak8L0dapmqCFylnGyOCFvjNIavA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3669.namprd11.prod.outlook.com (2603:10b6:a03:f7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.23; Wed, 9 Sep
 2020 18:26:07 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3348.019; Wed, 9 Sep 2020
 18:26:07 +0000
Subject: Re: [oe] [meta-python][PATCH 3/3] python3-sentry-sdk: Upgrade 0.17.2 -> 0.17.3
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200903133520.19437-1-leon.anavi@konsulko.com>
 <20200903133520.19437-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <a9d9e8d1-7c17-37c2-e863-ff8ae1dd75d9@windriver.com>
Date: Wed, 9 Sep 2020 14:26:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200903133520.19437-3-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0059.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::28) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0059.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend Transport; Wed, 9 Sep 2020 18:26:06 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe87b0fc-2535-4a7a-df52-08d854edd147
X-MS-TrafficTypeDiagnostic: BYAPR11MB3669:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3669CF30B0634E7BA6C1B83D9F260@BYAPR11MB3669.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yo2ZyJkEU6QOtgcsSc26Sf/Ha83qrOQc2RIDzNp+YKo1bd2YNKOL3r3mCdUAFIwfU7PZFoEs2vlO2LfBWumFfUB8cooh9Y4DP5ZWNSlRxkgR2SPLwW/pHyE6dbiaxBG4tIvCIKSYn2D55pi8wWg41x5rW7NbmikwOA569zCH7MIwqX1z6WSWulaVQlhPMdpX5Y5Yw0qyVCufQ/QgcvGtDDyXw1g6jCaksNXHVYzXiF1mjyAQYeTwCUayCkcGAVWopzkRd2CcS4R7CV48MCKepXreaY2/B/FUGTTLeRDpis1+9kmMWYBqfUPa7u7b83HABerdy5qQrUFNkGquOXNmVjBIk0ZKfBreBgKrdALbXDDiTOWTyLaoP7kQF5Y1I+GsVCd9HXvwMU7EMwHh4ZZ2vNiyHOFAGjygvEmy3iSH075FW+jdPM47tWOhvDt88NtxQ0jkgQsDTwXzrUYdUM8Mvw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(396003)(136003)(346002)(366004)(966005)(33964004)(26005)(52116002)(8676002)(956004)(166002)(478600001)(36756003)(2616005)(86362001)(83380400001)(66556008)(66476007)(316002)(186003)(66946007)(5660300002)(16576012)(8936002)(44832011)(16526019)(2906002)(31696002)(53546011)(31686004)(6486002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	MWkClDKoXGKzg9HpLZUuZMHkFnsCVoMDsEjuohPQQ12Gxk6wZNL3TCNVxiDCRjSZS8Wy1pAWra6NsjajgapXoOS4w2IF4AkObyEfUzJBwxYNy+nBQ4nNHNmNlPMHL3/4g+yNP2P9i6iuoPqQ+urxFvqWDEbemZBJeezgQqlot4QCyDsP0af4iJ7QEAvLaAj+oZNmOfr4irNY7ipbPPAkhLmXzx5qoLb6idS2oCmXOwhPiaDKqv9xsIVEgCXCv4c96hlgWevaU5vhNdnMHT91vz3AM8s1FWI+SB0nF5gNiSoD9QCMQVUWpaznGP3WSCgvnVBm+m6mHN+BEcDcWRyJQzBphFzDiJskF8naZgSHfbK10hCzPitYEutR+lJ3ycw2Sr5xhfq/G0z4uEk/eEghjeQlYyIPV4D4JRXRYL3gV3BPrSyoAXo7k3QfSKJZvXIYEuOXKxQuxhdZeytNXdyifbGDeSQODg98e/HBczswgIagLCTWWPS3nrkLTVhWnpBDofkRP2rQ7getKjtiI1whZ8AZLQ1ge1t3+wHZ+hCXIHjwHS4Zr4kshPlMw7wkUBLr4pvQx9gpCo1JEV/dsPKjsCKAmbbaNRuYoVHCAC7XW/Z2RaVo8UFQ28cZvHbMZ9GiTYvt86FSR9cuYo9D4jKf3Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe87b0fc-2535-4a7a-df52-08d854edd147
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2020 18:26:07.0164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6OXX428tWSDCK8AarKNGM8oHvbcB1MUxquD0kIcqBI6U9m9tboKRN7AhoS+krMMwYJQ9mK3/Urxex1pll9aJkcOVh7GvFDcizwvuBl4Uj1U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3669
Content-Type: multipart/alternative;
 boundary="------------7BD13F40FE81638E4248E33A"
Content-Language: en-US

--------------7BD13F40FE81638E4248E33A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/3/20 9:35 AM, Leon Anavi wrote:
> Upgrade to release 0.17.3:
>
> - Fix an issue with the pure_eval integration in interaction with
>    trimming where pure_eval would create a lot of useless local
>    variables that then drown out the useful ones in trimming.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...hon3-sentry-sdk_0.17.2.bb => python3-sentry-sdk_0.17.3.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-sentry-sdk_0.17.2.bb => python3-sentry-sdk_0.17.3.bb} (72%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.2.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.3.bb
> similarity index 72%
> rename from meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.2.bb
> rename to meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.3.bb
> index 9eddbbfdd..0a39fb142 100644
> --- a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.3.bb
> @@ -5,8 +5,8 @@ HOMEPAGE = "https://github.com/getsentry/sentry-python"
>   LICENSE = "BSD-2-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341"
>   
> -SRC_URI[md5sum] = "a9d68b19c457d6a9ff70396ab341fca2"
> -SRC_URI[sha256sum] = "bbfe5633aee4dacb53d79d303ab6bfacf1749fb717750c112fb1658e5accce0d"
> +SRC_URI[md5sum] = "5d4abcc416cbd0b9443bf56588b02b55"
> +SRC_URI[sha256sum] = "0af429c221670e602f960fca85ca3f607c85510a91f11e8be8f742a978127f78"
>   
>   PYPI_PACKAGE = "sentry-sdk"
>   inherit pypi setuptools3
>
> 

--------------7BD13F40FE81638E4248E33A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/3/20 9:35 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200903133520.19437-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.17.3:

- Fix an issue with the pure_eval integration in interaction with
  trimming where pure_eval would create a lot of useless local
  variables that then drown out the useful ones in trimming.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200903133520.19437-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...hon3-sentry-sdk_0.17.2.bb =&gt; python3-sentry-sdk_0.17.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_0.17.2.bb =&gt; python3-sentry-sdk_0.17.3.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.2.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.3.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.2.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.3.bb
index 9eddbbfdd..0a39fb142 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.2.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.3.bb
@@ -5,8 +5,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/getsentry/sentry-python">&quot;https://github.com/getsentry/sentry-python&quot;</a>
 LICENSE = &quot;BSD-2-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341">&quot;file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341&quot;</a>
 
-SRC_URI[md5sum] = &quot;a9d68b19c457d6a9ff70396ab341fca2&quot;
-SRC_URI[sha256sum] = &quot;bbfe5633aee4dacb53d79d303ab6bfacf1749fb717750c112fb1658e5accce0d&quot;
+SRC_URI[md5sum] = &quot;5d4abcc416cbd0b9443bf56588b02b55&quot;
+SRC_URI[sha256sum] = &quot;0af429c221670e602f960fca85ca3f607c85510a91f11e8be8f742a978127f78&quot;
 
 PYPI_PACKAGE = &quot;sentry-sdk&quot;
 inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------7BD13F40FE81638E4248E33A--
