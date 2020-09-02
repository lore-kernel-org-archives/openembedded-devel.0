Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.69])
 by mx.groups.io with SMTP id smtpd.web11.10158.1599060433170816821
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 08:27:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ZWihgC6G;
 spf=pass (domain: windriver.com, ip: 40.107.92.69, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q7VNwfmuMPrT2uPTkxFEfxfI9BiGoBg/HKz/ghTCjw1sjAZOAI72tdEWRocwNIaUdMibQTeMl7KqU5gCadUK8hPiZZPngzwyQQhj9VWP/xbdi2hcsIuHWx2jKXAiUs6d0QwPGV6icuDbo2w72gKfxg3dW34+BgX0bhVdW32QpYI+4bGu1D3rrKbfIHCVbkDXpdENQa6IIWvl0qxBqwXLlvWqd0CkEigltAENmOj771wNguzQTNxOT55vYtV8EREUYHJJHxCrKfT5V7uAmnkpGQ2CoQFKSOIJnQohbsQY8iBK6csKjeyPn5XfVWFqiQe4p4YNkN5/4+JUa41tYazW8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MBbNIckGeJXpP7VwqhvBg0h1p279fm13aW+D+pBtuaw=;
 b=iKeD1fzQyasUjOAXXzOZHsDKmjDmNIAfaC/l0jr70760+HNDIDNFQqPGAgJPJSdGOFb7VQ8z5cyxUp8cpT2fwgKda7j5erkb6wk++rFJXF8cRlgYJnShkcMKslXjlTpFAUbIrAFMyc4yh128whhCjuzZSqONRsiiEcd+WwjyDDqlQaVuXqlTN+g9WNfWzk356k6K8xRzrwelxKUrdzi2E5hxNwOo6EHF1kQu/lhAwG9JcMZItEgjbtpuPdYH+8urx+kWNFtb4Lyc2tcaTTx0d/ikRjDBk4FWJERKodzDMp8F/XvnjiIyiAIVPTmvxCF2Kg/QQPGRyv1oqIGSxcsYLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MBbNIckGeJXpP7VwqhvBg0h1p279fm13aW+D+pBtuaw=;
 b=ZWihgC6GNBEmSBU2au+GobaIfRfyV3P1Rzzsgun4YIaxzvwlWi7Y/AkLbYoHB+5P3zS+5C31F4gKogn6CTpL2f0ifGZ/qq02lzmtsythYTsTliW3FFiqwWZVlQSVcwXHQYDRt/YVKg960SLUIazN5YeknUJUJTAtVpe4HTa+hI4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3352.namprd11.prod.outlook.com (2603:10b6:a03:1d::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19; Wed, 2 Sep
 2020 15:27:11 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3348.015; Wed, 2 Sep 2020
 15:27:11 +0000
Subject: Re: [oe] [meta-python][PATCH 2/5] python3-luma-core: Upgrade 1.15.0 -> 1.16.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200828135131.26321-1-leon.anavi@konsulko.com>
 <20200828135131.26321-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <d71f81c9-af2a-a774-59d3-4d45f6c49877@windriver.com>
Date: Wed, 2 Sep 2020 11:27:09 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200828135131.26321-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0065.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::42) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YTXPR0101CA0065.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::42) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend Transport; Wed, 2 Sep 2020 15:27:10 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc743467-87ab-43a2-f3cc-08d84f54a987
X-MS-TrafficTypeDiagnostic: BYAPR11MB3352:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3352350505944D4B99DFED529F2F0@BYAPR11MB3352.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:262;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OsnMhdxHI1GbL/DhUgaew0sq/iTunNJG7SSVxJD0DunyZ/dLuJK7D+NoxofqoT9WAyiTQO0fa82NHPF+Mg0wSmCTIkJ/wAlOIJA46IzniHBTUObusPuh1op5MuzM+ZNf49mc0UsyTfaffKiH73dBYvtesfamj5NcwTEOXr1g0Dn4qQZe1OiRdT+lyyqg5tnsLoJdXAQjOnE2G2LfNpOJM3THOXFMBDw/6xYpV7cAGUpDcrXhV5dWvPqYm9qr/A7VrZgRRSooWUcp/52QEKLZTO3S7LDWHO3vsXLzbQ4gBa8jF6jXfkTBVbhk5079PM9k91GHn/CFQyE1kkbu6p8e6XjT379Em6yZQI2nLs2C6Wj93IsZtcrO0IkEuBTgr1ddlza6t37LKPRWg6uKjEXZpVSD2702PGQjuV7mR4fI4Bs52G6aigfnMmVWkMSH0/DJenALIP1mV57xpy+TksWDCQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(39850400004)(396003)(376002)(136003)(66556008)(53546011)(966005)(52116002)(31696002)(83380400001)(26005)(8936002)(2906002)(16576012)(36756003)(5660300002)(31686004)(33964004)(2616005)(66476007)(44832011)(66946007)(956004)(316002)(478600001)(6486002)(166002)(8676002)(86362001)(186003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	FI0JVpG6TWPSWotudWjhc8HejmK9SG0MglSydWsgz9fiRxBh1cWOYfYlyVI2t7/n0AOghySL0R3hCwS/rh7P/Tz6FlB4+jHfhATs/x1PM4Vf5XXIgz/0u/r9ViXg06QaUYutJ4pzehESrnbDQJFyzYVAYev6HLWcXGwBGrhFeoBRtww0hj5R4wl7KOGO30n6DkWjiHWnVHcsd+IEymBLD0RBCtGRaT0j0FhMBwOBPhLSyqqkBcfr6cJT2CwI6sBj+2WRywID2LgasqSIQeaUP7skpo1913y7KvxmB9xmFY8FPKcUcoFU9LTHSQrhFTDPqQeaRGpCtlCwvFuijwDJFllobSaSQH2WqCSPmRQdPxW4iliB+48qurlOiMx27vGIj6PV39w4ShroAuXskk6n63xBnn4MHFU9W1ZeBq00p+olLIObdaFRLXGvTlIABbavqD51sFCMwx5A3vLYUGXnLU8O1FB6IRzGIQKASk9cZILQXQdiq4gJ0jtMSgb7ZSLH/NjKQdpBsJfUF0YvGNYENiUPPgU4+dxxryVQTI4wmYAa00nZRfVpCLurhOXXOBrwY0irs753l1f16HvVtUoZ6V/G0SRqs77c4h+WZ5KXdxyZ23eaOpZh7/8dHZ3ZCphxpzDxtulEVdHXRtme9YazBg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc743467-87ab-43a2-f3cc-08d84f54a987
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2020 15:27:11.5980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8wUI5F6pryAU+G2WQVhcQ2KplGeyQnPHxDowkEWlgJeU12JT+J6hM+aEUI/oblqRHwxNkh9mA1j+TdD32PRUWer4qy14vODP/8ZDCrslJ4c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3352
Content-Type: multipart/alternative;
 boundary="------------097324539A5EB60BF24A969D"
Content-Language: en-US

--------------097324539A5EB60BF24A969D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/28/20 9:51 AM, Leon Anavi wrote:
> Upgrade to release 1.16.0:
>
> - Embedded font parallel device (for upcoming HD44780, Winstar
>    character devices)
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...ython3-luma-core_1.15.0.bb => python3-luma-core_1.16.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-luma-core_1.15.0.bb => python3-luma-core_1.16.0.bb} (75%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-luma-core_1.15.0.bb b/meta-python/recipes-devtools/python/python3-luma-core_1.16.0.bb
> similarity index 75%
> rename from meta-python/recipes-devtools/python/python3-luma-core_1.15.0.bb
> rename to meta-python/recipes-devtools/python/python3-luma-core_1.16.0.bb
> index 17445e727..ce1e7ba03 100644
> --- a/meta-python/recipes-devtools/python/python3-luma-core_1.15.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-luma-core_1.16.0.bb
> @@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=eda804060ba2312e41fe96b6fa334fd7"
>   
>   inherit pypi setuptools3
>   
> -SRC_URI[md5sum] = "9c890fa8e387a035ff0d1ae96a0715f1"
> -SRC_URI[sha256sum] = "e0e14c762695fb8758e8b15cfd28cd4c1618bf2fd93157c8770a2e8e0e254ae5"
> +SRC_URI[md5sum] = "52ab2cdce4222aa71d9ac254a806dccc"
> +SRC_URI[sha256sum] = "ca523f606f8fff2c9843d48b415a0a748bb2c96270eccac97d9caa9ae6810c94"
>   
>   CLEANBROKEN = "1"
>   
>
> 

--------------097324539A5EB60BF24A969D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/28/20 9:51 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200828135131.26321-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.16.0:

- Embedded font parallel device (for upcoming HD44780, Winstar
  character devices)

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200828135131.26321-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...ython3-luma-core_1.15.0.bb =&gt; python3-luma-core_1.16.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-luma-core_1.15.0.bb =&gt; python3-luma-core_1.16.0.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-luma-core_1.15.0.bb b/meta-python/recipes-devtools/python/python3-luma-core_1.16.0.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-luma-core_1.15.0.bb
rename to meta-python/recipes-devtools/python/python3-luma-core_1.16.0.bb
index 17445e727..ce1e7ba03 100644
--- a/meta-python/recipes-devtools/python/python3-luma-core_1.15.0.bb
+++ b/meta-python/recipes-devtools/python/python3-luma-core_1.16.0.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.rst;md5=eda804060ba2312e41fe96b6fa334fd7">&quot;file://LICENSE.rst;md5=eda804060ba2312e41fe96b6fa334fd7&quot;</a>
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = &quot;9c890fa8e387a035ff0d1ae96a0715f1&quot;
-SRC_URI[sha256sum] = &quot;e0e14c762695fb8758e8b15cfd28cd4c1618bf2fd93157c8770a2e8e0e254ae5&quot;
+SRC_URI[md5sum] = &quot;52ab2cdce4222aa71d9ac254a806dccc&quot;
+SRC_URI[sha256sum] = &quot;ca523f606f8fff2c9843d48b415a0a748bb2c96270eccac97d9caa9ae6810c94&quot;
 
 CLEANBROKEN = &quot;1&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------097324539A5EB60BF24A969D--
