Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.67])
 by mx.groups.io with SMTP id smtpd.web10.66998.1597759630132086326
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2020 07:07:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=hBmV4aFJ;
 spf=pass (domain: windriver.com, ip: 40.107.236.67, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GL5SP0+iIzq2LQX4xNtGTFBRuwAmYz8okA00Hc0XDjxePX7YUxIauoejIM3muMbu7SakR13ApixsgXIfpYhgjumMhM16I2gGTtZOOv4ZDpEtpmaOkwfnT5CGLKWu4b3qrmZbDmg1vVcrrNwJODgL+1XXqo47DP0314H2sZqFx/PEZhyEu+jnpQZR8jTJSBywUnlbnDQCo+kaIPTmmmBUukjuoFPDHKpz+6tH9xl8OvQFUijT1u4wZS9Xe76aJ2fCFy8taiBhuGjRkCpmylkYGf809/RMnF4/2wzd9FuA0XRqq+O4HM6zQd2iOW9WNXyI13Vvm1NatOKgOGnbsXLuaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/YBs4dLBMZuAvewPA+xn+GMGIMOUGsAPtf2u5B0cK4=;
 b=Vm0oTA5LkFo7l3Lh/tfZejaKdMqCvG2B3Ouuno0+PwMb8MnV8PU5O6hehLepovp5oFj4Yuq+zaGjQJJg4/XhDLWayxMGr1Xv2dmvdEzzy20KzsUAQG237M/T4bhYl+h8wVZLBDdXHJf+RwTZrz4mQioE45AT19KqNjC/IOyayShKnwyrtgpiDKMFiXX07NqbT6BRaWGmBH40foA5p3GzW3GIkFlDn/oJIZdcEwP7sJiqWOQXnSbaT45qaDmNsckpOjMrUNdjWgyYW0m7C8vs63Efphlui+Oe1++mbL7MVZ0yApHYdgeP0/kUSW6zHdhfkFPihuMKLBKtoE1VHOCvjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/YBs4dLBMZuAvewPA+xn+GMGIMOUGsAPtf2u5B0cK4=;
 b=hBmV4aFJ8a0oXHCkRVetF3S+d52kzDCQD052Vzcb1fZ/lUtT9CPxajlpXZoxsQ5GYzP1SF9l2sF60uKuz7YYqvpJTSyB6u6s6Bwwm5tdDnEJan+Pa5P3X4IMnrLo++7GqGqQ6eIp2rxWyJI8jbj3Su8VvNsQ2QIlgn6VZ0PiFbQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3398.namprd11.prod.outlook.com (2603:10b6:a03:19::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Tue, 18 Aug
 2020 14:07:08 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3283.028; Tue, 18 Aug 2020
 14:07:08 +0000
Subject: Re: [oe] [meta-python][PATCH 06/10] python3-wheel: Upgrade 0.34.2 -> 0.35.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200817112901.28914-1-leon.anavi@konsulko.com>
 <20200817112901.28914-6-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <01c6f7b8-7acf-d1e5-1c9f-f566ba0cc53d@windriver.com>
Date: Tue, 18 Aug 2020 10:07:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200817112901.28914-6-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTBPR01CA0024.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::37) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTBPR01CA0024.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::37) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend Transport; Tue, 18 Aug 2020 14:07:07 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4879e5b9-82bb-4e74-f23d-08d8437ffe57
X-MS-TrafficTypeDiagnostic: BYAPR11MB3398:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3398467F633EDCB84A98A70F9F5C0@BYAPR11MB3398.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gPXT5W7SUCdUQa61Svoro4NaBGtWyxYh+QcEc58pXX588EhgghSAXImh1j7hp0/hNhMcBWQ1IpHYGQy9SdNeyksWmhlhxC9/VQpbRQ2TKjARGYY4ndgz3b4WCBcs7D7jwl3a2EbAS0WDJi+3Zo6W0/zDQjfFRXIWzfIPZWsxGH8+ROU9Opzca8GjVR79XUiSsbMQIt3BpQz5F+6pQirjyDXJHmnY1ThOnjv9oLhPBG5ie79no2IV3S2wVwoXybRtuV7ykj9/3BT2nlGMUwBCUZ5b0fU4BtYyAaT6A9WOZVboxEpZ7m+oZxrwL8WQsZWQbEi3o6Kbb1NdfY3F2NHX6xz2Lm6jyBdrzWWFRwyrHxVClx8Xr/35VL9Ngg7llrEDCtv6OTtn5DkpN4USotPBlEv7qj5SCnw219E7pC0c9YBcPJrINKKte1QLRNM1A1Hq/1m8QsZNE3diEvooTBT8gw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(396003)(366004)(39850400004)(346002)(136003)(166002)(966005)(36756003)(31686004)(478600001)(956004)(2616005)(16576012)(6486002)(2906002)(66946007)(66556008)(44832011)(66476007)(316002)(5660300002)(53546011)(26005)(52116002)(31696002)(16526019)(86362001)(8676002)(8936002)(83380400001)(33964004)(186003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	MXJimS+1+WcYVjOgSvUM7s5HFo6vuBHTzTwLb2JufZcu5OngkbhdwSnrICKXwXTh7EhrDLehg4/e61kVrdJvtgFPWpsQrCdoJD4TfAGbHb1Vz2RJdyWA/RFlZPdOn08UUGN0JweLyMpDdFbnQmfnjoJ8t7Miuvl/Ka0YCvDEiYzJ3f1C3kP6HYZtN75RikWg+klm0lw1h0E4mJ3WPG3YWiF2LOYrE+E0BxvVSsUSOyNIiH2OM//+iR2i1n03NL2YOVm8V6Ml2I8lDOwGz/IXBobCL3hf7+2u/5HU4Hok3TWxAZRSdt6bW0IJXP1MbQGxPb3GDVVPxoQ4pvz9yM29fWsrUhky4AqDZJsPY5wya0j/EhILhQaSHC7U5vp8itYdyLN/O71BNiG7aGoCkf82TE4debPDvhsz5w9t0/31s+6wjjGf/mO1FzLahbTXXh/CaoOuwrwkA5X5TJpoqGbWmZ848061p3eACp05cuoFJOiPAsY5tREch3r6j3QhKDRokAwdg4SzUgmDs03QszE6Y7czGvAD27MRdR8wD3ZMN0Ipr5PnHJfyoe4TRxmsQ39RWZjqej8EjSWYJOS8z91o3wdBKppF7uwuO40aS2H60XrEGk5EbFwEXCQ3Rt4DL8i/u8bHtXp5lpKbqaGW76LSFQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4879e5b9-82bb-4e74-f23d-08d8437ffe57
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2020 14:07:08.7105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 200okzdWwcu8tl42ItERJwrMxPXHh350Sn73Tn8oEyvAl02f5eajNvP/4d/lfh8w7Q4D18497GhTf+CsmtrD94+y/hJXhGEKYLXlcOjFnjk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3398
Content-Type: multipart/alternative;
 boundary="------------5F960A30C4276DEE054E563F"
Content-Language: en-US

--------------5F960A30C4276DEE054E563F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/17/20 7:28 AM, Leon Anavi wrote:
> Upgrade to release 0.35.1:
>
> - Switched to the packaging library for computing wheel tags
> - Fixed a resource leak in WheelFile.open()
>
> License-Update: Use PKG-INFO to check the license.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python3-wheel_0.34.2.bb | 13 -------------
>   .../recipes-devtools/python/python3-wheel_0.35.1.bb | 13 +++++++++++++
>   2 files changed, 13 insertions(+), 13 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python3-wheel_0.34.2.bb
>   create mode 100644 meta-python/recipes-devtools/python/python3-wheel_0.35.1.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-wheel_0.34.2.bb b/meta-python/recipes-devtools/python/python3-wheel_0.34.2.bb
> deleted file mode 100644
> index 8633a4fc9..000000000
> --- a/meta-python/recipes-devtools/python/python3-wheel_0.34.2.bb
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -SUMMARY = "The official binary distribution format for Python "
> -HOMEPAGE = "https://github.com/pypa/wheel"
> -SECTION = "devel/python"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9d66b41bc2a080e7174acc5dffecd752"
> -
> -SRC_URI[md5sum] = "ce2a27f99c130a927237b5da1ff5ceaf"
> -SRC_URI[sha256sum] = "8788e9155fe14f54164c1b9eb0a319d98ef02c160725587ad60f14ddc57b6f96"
> -
> -inherit pypi setuptools3
> -
> -BBCLASSEXTEND = "native"
> -
> diff --git a/meta-python/recipes-devtools/python/python3-wheel_0.35.1.bb b/meta-python/recipes-devtools/python/python3-wheel_0.35.1.bb
> new file mode 100644
> index 000000000..b4e77ea84
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-wheel_0.35.1.bb
> @@ -0,0 +1,13 @@
> +SUMMARY = "The official binary distribution format for Python "
> +HOMEPAGE = "https://github.com/pypa/wheel"
> +SECTION = "devel/python"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=10;endline=10;md5=8227180126797a0148f94f483f3e1489"
> +
> +SRC_URI[md5sum] = "7ec7c435cc73eefebd9f0af43c120044"
> +SRC_URI[sha256sum] = "99a22d87add3f634ff917310a3d87e499f19e663413a52eb9232c447aa646c9f"
> +
> +inherit pypi setuptools3
> +
> +BBCLASSEXTEND = "native"
> +
>
> 

--------------5F960A30C4276DEE054E563F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/17/20 7:28 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200817112901.28914-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.35.1:

- Switched to the packaging library for computing wheel tags
- Fixed a resource leak in WheelFile.open()

License-Update: Use PKG-INFO to check the license.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200817112901.28914-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python3-wheel_0.34.2.bb | 13 -------------
 .../recipes-devtools/python/python3-wheel_0.35.1.bb | 13 +++++++++++++
 2 files changed, 13 insertions(+), 13 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-wheel_0.34.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-wheel_0.35.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-wheel_0.34.2.bb b/meta-python/recipes-devtools/python/python3-wheel_0.34.2.bb
deleted file mode 100644
index 8633a4fc9..000000000
--- a/meta-python/recipes-devtools/python/python3-wheel_0.34.2.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-SUMMARY = &quot;The official binary distribution format for Python &quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/pypa/wheel">&quot;https://github.com/pypa/wheel&quot;</a>
-SECTION = &quot;devel/python&quot;
-LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=9d66b41bc2a080e7174acc5dffecd752">&quot;file://LICENSE.txt;md5=9d66b41bc2a080e7174acc5dffecd752&quot;</a>
-
-SRC_URI[md5sum] = &quot;ce2a27f99c130a927237b5da1ff5ceaf&quot;
-SRC_URI[sha256sum] = &quot;8788e9155fe14f54164c1b9eb0a319d98ef02c160725587ad60f14ddc57b6f96&quot;
-
-inherit pypi setuptools3
-
-BBCLASSEXTEND = &quot;native&quot;
-
diff --git a/meta-python/recipes-devtools/python/python3-wheel_0.35.1.bb b/meta-python/recipes-devtools/python/python3-wheel_0.35.1.bb
new file mode 100644
index 000000000..b4e77ea84
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-wheel_0.35.1.bb
@@ -0,0 +1,13 @@
+SUMMARY = &quot;The official binary distribution format for Python &quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/pypa/wheel">&quot;https://github.com/pypa/wheel&quot;</a>
+SECTION = &quot;devel/python&quot;
+LICENSE = &quot;MIT&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=10;endline=10;md5=8227180126797a0148f94f483f3e1489">&quot;file://PKG-INFO;beginline=10;endline=10;md5=8227180126797a0148f94f483f3e1489&quot;</a>
+
+SRC_URI[md5sum] = &quot;7ec7c435cc73eefebd9f0af43c120044&quot;
+SRC_URI[sha256sum] = &quot;99a22d87add3f634ff917310a3d87e499f19e663413a52eb9232c447aa646c9f&quot;
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND = &quot;native&quot;
+
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------5F960A30C4276DEE054E563F--
