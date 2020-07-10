Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.85])
 by mx.groups.io with SMTP id smtpd.web11.9753.1594384628070369304
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jul 2020 05:37:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=cAUTUY8G;
 spf=pass (domain: windriver.com, ip: 40.107.244.85, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=obFKK5+xd5HDdp08cy+FByee9K5kS24q7UH47cgKlNVZbhO9uAq7BSJ9GuDJpFWjoLtaLmIh6iMm0e2y3y24GveX37CFFobg3esgKqseFeDT9mThaw3hS8SvHbcOd6jxA/Zu5pM/jBpU1lTJVszyPB3WF3PbQA2RQqCI/impfpvFYLxiX2OoEmWi8B0tnQ9vfdYEwJQMguQnuyyEWphraxWwrmspZfwif5IE6SvwBKkKNszgsWEC0NX99NE2ylUCBm0bpxpbuZjI4rj/0gKYdX0dtz4bUsCf3xDiA6CyOViFcLmfTRznvGncx298J6cQKzKTyDAX1H2lfYFl4fVo2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GhMj+NRFAzdpx8d+tB+SqqtvGrrmL8SGk2jgAPnq9Gs=;
 b=U1S7rfmMIgDh3xdWOsuzfS3suapaV/uhJXOzSxzT1wxORInm10SwSQ7olz11KvtKqkkOHQiIzJbNl8nczHwY4TjaWyyb36XpwtnqtHluL4kocuKY0/F5gyX5QLpIAATO+TQLHFLGPUPLJxxmllEQOQd8WatYqpd4+Vf1+CjVV23N4ymBNAKtVGUj9fdvK2QSJ+8VCsNBJelUTtMiwcFpzDMGVL6vF6ArgxpzOuO/jf4RUVvrg9eps7CSjilXoIy4UbBdTkPM5FX/BSAf+va22tvLJCIJkca1QrksweenTSbBfD90N3/ORMvbkTy1nbLXy3YZTFYGSPF0myQBYjBOlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GhMj+NRFAzdpx8d+tB+SqqtvGrrmL8SGk2jgAPnq9Gs=;
 b=cAUTUY8GKa+Yx5JLIGu/Jp+HK8GjDGMauXR36MS/D+osLDBWoWHbMiOJEm5XdIywxC50yvinUy6ywwwFvEaZ3eaE2WRY9AkcJRwaT8cVFgqwe15g4ia5MuQNxCfXPJLMdY39avJnkn7Jp4UQHW4n/tIJpnDwkQQEKncvWrcC/oc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM5PR11MB1449.namprd11.prod.outlook.com (2603:10b6:4:8::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.23; Fri, 10 Jul 2020 12:37:07 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3153.031; Fri, 10 Jul 2020
 12:37:06 +0000
Subject: Re: [oe] [meta-python][PATCH 2/7] python3-imageio: Upgrade 2.8.0 -> 2.9.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200708094659.27331-1-leon.anavi@konsulko.com>
 <20200708094659.27331-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <e1a8b5f7-938a-3a6f-8aed-4f0adfc0dddf@windriver.com>
Date: Fri, 10 Jul 2020 08:37:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200708094659.27331-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0085.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::24) To DM5PR11MB0011.namprd11.prod.outlook.com
 (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0085.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21 via Frontend Transport; Fri, 10 Jul 2020 12:37:06 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ee7be03-3143-4155-7a89-08d824cdf4cd
X-MS-TrafficTypeDiagnostic: DM5PR11MB1449:
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB14492288B2F748FA6A61E7069F650@DM5PR11MB1449.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pLpRipnZ0Yj9U+Sm1B2xblmMfQrpOVXFjft/djiK3uUaYln/wLrfcOCIp0vOQvQcsNCh8L91lX4sQkviL9VWq8sE3JoQ13EHdREpWINBTwQlxtjWXAhwdGI1e0T6R0hJGIkNU9DZcqWLOHR+5al9gUoTRhSoZ06rscAYzu6qTnqKgmknuprmeAwCpkohcsWv6KiMrJUb2p+8k1qMqXVVl1fyNAdB1CVsC+10kbU1CwG1+N2/aNvg6xCCYD6CZcFx1T9W1dqv+/ahb1LAfMjoianL+WmpgqaDvxn4G/HI9qWiH7A/eFoA50Sl/IZzY75/1YyjG7QnZv9gapwZ1PeD1W4VcKY4UAoY6Avp34Dyu3/EHYh4Wv/8xLoLclb+GT+6t2ArSPCUbdnN+pNvjmQVc4fTmU1f2KlmQDN8U0VoIophbP0vr2s5ABL7kLOvvek4HZY5IcF5wlRxewjbUHX4DQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(366004)(136003)(376002)(39850400004)(396003)(186003)(8676002)(16526019)(26005)(316002)(6486002)(966005)(478600001)(2906002)(33964004)(66946007)(16576012)(52116002)(53546011)(66574015)(8936002)(83380400001)(44832011)(36756003)(86362001)(31696002)(66556008)(66476007)(31686004)(5660300002)(166002)(956004)(2616005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	W+ss9oTWjLzXdLbA+AxHkbRixkCO74OP/4Bvd4ukL9Vvr9uICj6LonKH5BunyNgk5fpziCv/6yfGbihRz0V2yVoO+c4abAK5KXa2ZVS3Iqrp3UIRRizgBbTSa3DWNOOeX0bQlB5cMI+1q7x6B26Jy1UdcEhoWMvihwLFHAXP5d7GQfP1D/1qrCjWVqGCGv3za8hq+Fy4Cd5Xc/EZ0/KRaVmjxq9YSwIq5kTjxnCI7cOkVR901nFNMOtFkERPQFfwQANgueSPeNtG02ian8r4SepyBKc5GEEqnwBJO0shP6TFTqFeir8QYAmp3/dw5wNJq/mnhwyZY3jwXdBS2snAu3+iv+g9t4nmsv1OyrONhrOq5Ab8IX1JqielfzHaFivUeAePhEzuNVwEr13aBp6CcfGESRfpnWIuGWFC+RxKJY9cZRU63KL1YC9+z9kuCPkaRVSVJf7LS+P+K8NDi5eRDlF0BXvndaAp460IXqYwVn0=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ee7be03-3143-4155-7a89-08d824cdf4cd
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2020 12:37:06.8616
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TZdQB7lKZygkef8Dlo1MOgCjNY8Z0ir/xXxJu/SVkYjPKKrMAs3kHYju8fOGZ3fvofIhisHKWFdbhVGfPa9yjjH+EHOUBmIMz9XoOxID6QQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1449
Content-Type: multipart/alternative;
 boundary="------------27728FB8C6B8DD52D82B8992"
Content-Language: en-US

--------------27728FB8C6B8DD52D82B8992
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/8/20 5:46 AM, Leon Anavi wrote:
> Upgrade to release 2.9.0:
>
> - More robust loading of FEI SEM data.
> - Fix webcam not working on Win10.
> - Add a few standard images useful to 3D visualization.
> - The timeout used in HTTP requests can now be set with an
>    environment variable.
> - The DICOM plugin can now used gdcm for compressed transfer
>    formats.
> - Better support for itk/sitk plugins.
> - Test coverage and CI for ARM.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-imageio_2.8.0.bb => python3-imageio_2.9.0.bb}    | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-imageio_2.8.0.bb => python3-imageio_2.9.0.bb} (73%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.8.0.bb b/meta-python/recipes-devtools/python/python3-imageio_2.9.0.bb
> similarity index 73%
> rename from meta-python/recipes-devtools/python/python3-imageio_2.8.0.bb
> rename to meta-python/recipes-devtools/python/python3-imageio_2.9.0.bb
> index 9ca30f424..fbe5e2c97 100644
> --- a/meta-python/recipes-devtools/python/python3-imageio_2.8.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-imageio_2.9.0.bb
> @@ -6,8 +6,8 @@ LICENSE = "BSD-2-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=7b9bbbb543b6af3e6b53f9b7fb68f71d"
>   
>   
> -SRC_URI[md5sum] = "1e270dbf24c0390c2f4e3e4120904ac0"
> -SRC_URI[sha256sum] = "fb5fd6d3d17126bbaac9af29fe340e2c97a196eb9416d4f28c0e543744a152cf"
> +SRC_URI[md5sum] = "d22757338542e3742a335cea6210e419"
> +SRC_URI[sha256sum] = "52ddbaeca2dccf53ba2d6dec5676ca7bc3b2403ef8b37f7da78b7654bb3e10f0"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------27728FB8C6B8DD52D82B8992
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/8/20 5:46 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200708094659.27331-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 2.9.0:

- More robust loading of FEI SEM data.
- Fix webcam not working on Win10.
- Add a few standard images useful to 3D visualization.
- The timeout used in HTTP requests can now be set with an
  environment variable.
- The DICOM plugin can now used gdcm for compressed transfer
  formats.
- Better support for itk/sitk plugins.
- Test coverage and CI for ARM.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200708094659.27331-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-imageio_2.8.0.bb =&gt; python3-imageio_2.9.0.bb}    | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-imageio_2.8.0.bb =&gt; python3-imageio_2.9.0.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.8.0.bb b/meta-python/recipes-devtools/python/python3-imageio_2.9.0.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-imageio_2.8.0.bb
rename to meta-python/recipes-devtools/python/python3-imageio_2.9.0.bb
index 9ca30f424..fbe5e2c97 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.8.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-imageio_2.9.0.bb
@@ -6,8 &#43;6,8 @@ LICENSE = &quot;BSD-2-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=7b9bbbb543b6af3e6b53f9b7fb68f71d">&quot;file://LICENSE;md5=7b9bbbb543b6af3e6b53f9b7fb68f71d&quot;</a>
 
 
-SRC_URI[md5sum] = &quot;1e270dbf24c0390c2f4e3e4120904ac0&quot;
-SRC_URI[sha256sum] = &quot;fb5fd6d3d17126bbaac9af29fe340e2c97a196eb9416d4f28c0e543744a152cf&quot;
&#43;SRC_URI[md5sum] = &quot;d22757338542e3742a335cea6210e419&quot;
&#43;SRC_URI[sha256sum] = &quot;52ddbaeca2dccf53ba2d6dec5676ca7bc3b2403ef8b37f7da78b7654bb3e10f0&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------27728FB8C6B8DD52D82B8992--
