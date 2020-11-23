Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.52])
 by mx.groups.io with SMTP id smtpd.web12.42098.1606165076584547534
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2020 12:57:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=QzP+GmRP;
 spf=pass (domain: windriver.com, ip: 40.107.223.52, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bvj3Z+e4NUaVC1E8jzjEcU5HOLW2Jk+Vof91zyTeR7diDqJW3HBk/4y03wQWeUuK+KS5wg6Kg7YHzQkG25Ds8thRsjzg5EzI+gjlrBoojiwUeOz58egZQM4FIKF8jznY/BEU28Z/q/N8AFU4SkjSVxSWYpqVxW5PK6Wle4igDkwp2TwIHBOuuzOA0rvqRIhcq2YmlRewt4robdnjhRdCsTE/Q1r6S/sn2RX7lKswJFjWy4Y6Uz0nWfL1oAyoCqgUWWv1orCpUkX9AHeZFQebK9tndsd1cIfyK19cC4GqYUcXGcHe2OxvuXMJ6/QxJwQzZbGohM7/538YRXEqjcco3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5tF8G2jfhKciAccI1qOR0JNNOo67sAMmS6M5VjbE/aA=;
 b=ewryyvT1PMs2Kyl0wMIDJd4P6Un9OAjuHfKxTc7QVwHopIID/7S1pDjpPzlweGx214QRLvlEibkaUFOK9g4BDwDrThw8zHs7FVqfee9D6nUvyMBvXVyuVrhVIMj+SRJik/pemConN4O8/PCbVGgzGprxhD1JQaH34Q/mBnY5c103M/GUlW/Bfnm+DV0exl79+bgTDPADVbpHVRyybMRtK30AN5K4jnxmncipGOsFo6oBKCFElF8efIU/EUGoHRgf2kHhv9ERN90/SZKtePN+Q/TavLIuBDiNiEJPID4sKGjKY3B7ic+h59qOQOzYBdfk3sMO7J6rgeEzySiJGDSs1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5tF8G2jfhKciAccI1qOR0JNNOo67sAMmS6M5VjbE/aA=;
 b=QzP+GmRPduW3MQVdMSLEMoA5oB4d+R6F8QHdpnLVGbu95w/r1YMq8mBgXqaAWxiD55xgLJ9THugIAo633hE77dpbvsWufARNyP7eGpvVJynH9jHmxkPmBHPxwr7dnoDdAAtwE9UoZzLjImqepTsZfa6lxGU/j/kVkmt1atS7rDE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2600.namprd11.prod.outlook.com (2603:10b6:a02:c8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Mon, 23 Nov
 2020 20:57:54 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498%4]) with mapi id 15.20.3589.030; Mon, 23 Nov 2020
 20:57:54 +0000
Subject: Re: [oe] [meta-python][PATCH 2/3] python3-arpeggio: Upgrade 1.9.2 -> 1.10.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201120092910.30736-1-leon.anavi@konsulko.com>
 <20201120092910.30736-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <79377846-20e8-89d2-2ab3-de72db084c47@windriver.com>
Date: Mon, 23 Nov 2020 15:57:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <20201120092910.30736-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YT1PR01CA0052.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::21) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0052.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend Transport; Mon, 23 Nov 2020 20:57:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de5a2467-9b99-4caf-c625-08d88ff272db
X-MS-TrafficTypeDiagnostic: BYAPR11MB2600:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2600DB653A3938923A67E08A9FFC0@BYAPR11MB2600.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:400;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Cs+uOmChODdk2mSyuVEzbHEhQTrvlJwRq7BDlhAqTGmHLDImO3qEEDY01O/cpVtelukpro6w5eFOV2Bkw+z9vtHuSJF98/kIs4k0mzhMLcU5D3m4s3H4DFc3DkF7uklDAAghKctcZiRaIm+pEl3kAJ1cmaP5KaC9x9Kjd7IgcFS3u9lo2YolcUEvjU5lfTJNvryxgHPhlOpyPzMQQ6xIrSvPP68CAU+qUJAyKrYOb5EBV3BFaJ6ZQog0VEEpJqHnq3Ea8t2OWHa+9BkgiWcSp0fENeVQXa8mLre3cD+8jCm3w+/cg34XxuPBE76IXNp474U4GVqLgTiKFXEu/EwJA7En1qTkUn28wdaFGor1aNn51I707kfNJQlayxsM/w10L9BRlrFxh7AMXySScpiJUQzVtjnDiVsvpRaWaMCXqc5lSAdGhzCa/rh139+KKYmjAKQ1jpcQzf43DO0/rB0J3A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(136003)(346002)(396003)(39850400004)(2616005)(53546011)(956004)(16576012)(83380400001)(33964004)(52116002)(8676002)(44832011)(8936002)(16526019)(66476007)(66556008)(66946007)(166002)(316002)(186003)(26005)(478600001)(966005)(36756003)(86362001)(31696002)(4001150100001)(5660300002)(6486002)(2906002)(31686004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	B1HMqvvyFRN+I7IDCo/W0ElRO/lJcd+ErRs9dfYWi3YKF0aWEy/JGLSvz+9VeUYW9I1GmKaiW5Ez2mQPPaBSLQkwuIQOFQ6OBgKO89vH2Nqt6h3H9+Yqsdsr94s9dA0JaVqnwbBs/Wu+pQ8n3MLF0yHw9Ts/UvOHTeaS0t4+yoMQCpGEIu0GT7WGaaaNAb/uGV751SAm1c2DjnuoiqgYSBew7aMp0I5uG1+Zn7mU2DBQnV7ENqRR5ua8fccY5jwIYvy8qRbnVGMwyPL+qhpUM9kqSTgrPGuoWqezMNgHHEFvj4tDr8qUxrg91GHROEqUx68XWfc7zLmWHXWoKLrNFWNQy2enV56kYBNh/J9qzGo80fXnd6lBvAP3Mqe32vQIV35AvqrXz03GV3pW4taJUmfm1zC258K00N5fIFy5Fd0g07Q8P+E5wmdYNve1CUTR/xM1OQYfruMqOrLEnHQxd/3ZWQr3JkZ76Nv0REIxIJ3Fale3C9YEGLVfIDXaNlDf83Iqm5P7L5aXwmP2oHcIJiZudaYf0BlEcC7fgOKYhNRZGbgoLh5zF+XQjwZ4Uc3U9iP4M5uf8TJv2EpJnZXGPPXwpHhtCn/E0AQDapoyLLYofMPl8hqi3Q+2Nzbwl+MNECJJ5jp4Fa2SJY1YTFkTYd4x3uutpdTPpODZ+G0v+zfuFOb8VM2WcT/yuG+/x+XS27pc/bEhjQUvioqd0res6s5/SPwHaVLu6mIA7r0dV2eDrBhQF6koGAfweZGdXNcvHz+ePVM58DCV6m7vP1dbBrGLBO+dRv5wGUENKp3FgPfoA6HHFnHPVCCH6C53VoYHMek9oFrridYR+YNKaE/vVI3/tN5MHOMv7n800avoeDvR6NVYGOKkbPyFhlmplSLU+U4oiBoZ8jjDmV5AUf4yCQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de5a2467-9b99-4caf-c625-08d88ff272db
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 20:57:54.7816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ccyjDml6tZFV2n4zxMSnRq52aeI2YlWODZy13LG/MlqtoLCDPPrET8OQfM4iKgz+hOxwvqcHwhZz8KSQcQNWUKxSjKXTcs6fAFl3JU6nBQE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2600
Content-Type: multipart/alternative;
 boundary="------------860CA17A3BCA4165C744BBC5"
Content-Language: en-US

--------------860CA17A3BCA4165C744BBC5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-11-20 4:29 a.m., Leon Anavi wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 1.10.1:
>
> - Fix packaging, exclude examples from wheel
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...thon3-arpeggio_1.9.2.bb => python3-arpeggio_1.10.1.bb} | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-arpeggio_1.9.2.bb => python3-arpeggio_1.10.1.bb} (66%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-arpeggio_1.9.2.bb b/meta-python/recipes-devtools/python/python3-arpeggio_1.10.1.bb
> similarity index 66%
> rename from meta-python/recipes-devtools/python/python3-arpeggio_1.9.2.bb
> rename to meta-python/recipes-devtools/python/python3-arpeggio_1.10.1.bb
> index 802a5b2eaa..38e26623f5 100644
> --- a/meta-python/recipes-devtools/python/python3-arpeggio_1.9.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-arpeggio_1.10.1.bb
> @@ -3,13 +3,15 @@ HOMEPAGE = "https://pypi.org/project/Arpeggio/"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=33b8d1ba459a2fa4d801acfd1d1b7ceb"
>
> -SRC_URI[md5sum] = "39667a626217c670bc634444be6e904a"
> -SRC_URI[sha256sum] = "948ce06163a48a72c97f4fe79ad3d1c1330b6fec4f22ece182fb60ef60bd022b"
> +SRC_URI[sha256sum] = "920d12cc762edb2eb56daae64a14c93e43dc181b481c88fc79314c0df6ee639e"
>
>   PYPI_PACKAGE = "Arpeggio"
>   inherit pypi setuptools3
>
>   # setup.py of Arpeggio needs this.
> -DEPENDS += "${PYTHON_PN}-pytest-runner-native"
> +DEPENDS += "\
> +    ${PYTHON_PN}-pytest-runner-native \
> +    ${PYTHON_PN}-wheel-native \
> +"
>
>   BBCLASSEXTEND = "native nativesdk"
> --
> 2.17.1
>
>
> 
>

--------------860CA17A3BCA4165C744BBC5
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-11-20 4:29 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201120092910.30736-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

Upgrade to release 1.10.1:

- Fix packaging, exclude examples from wheel

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201120092910.30736-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...thon3-arpeggio_1.9.2.bb =&gt; python3-arpeggio_1.10.1.bb} | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-arpeggio_1.9.2.bb =&gt; python3-arpeggio_1.10.1.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-arpeggio_1.9.2.bb b/meta-python/recipes-devtools/python/python3-arpeggio_1.10.1.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-arpeggio_1.9.2.bb
rename to meta-python/recipes-devtools/python/python3-arpeggio_1.10.1.bb
index 802a5b2eaa..38e26623f5 100644
--- a/meta-python/recipes-devtools/python/python3-arpeggio_1.9.2.bb
+++ b/meta-python/recipes-devtools/python/python3-arpeggio_1.10.1.bb
@@ -3,13 +3,15 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://pypi.org/project/Arpeggio/">&quot;https://pypi.org/project/Arpeggio/&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=33b8d1ba459a2fa4d801acfd1d1b7ceb">&quot;file://LICENSE;md5=33b8d1ba459a2fa4d801acfd1d1b7ceb&quot;</a>

-SRC_URI[md5sum] = &quot;39667a626217c670bc634444be6e904a&quot;
-SRC_URI[sha256sum] = &quot;948ce06163a48a72c97f4fe79ad3d1c1330b6fec4f22ece182fb60ef60bd022b&quot;
+SRC_URI[sha256sum] = &quot;920d12cc762edb2eb56daae64a14c93e43dc181b481c88fc79314c0df6ee639e&quot;

 PYPI_PACKAGE = &quot;Arpeggio&quot;
 inherit pypi setuptools3

 # setup.py of Arpeggio needs this.
-DEPENDS += &quot;${PYTHON_PN}-pytest-runner-native&quot;
+DEPENDS += &quot;\
+    ${PYTHON_PN}-pytest-runner-native \
+    ${PYTHON_PN}-wheel-native \
+&quot;

 BBCLASSEXTEND = &quot;native nativesdk&quot;
--
2.17.1

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------860CA17A3BCA4165C744BBC5--
