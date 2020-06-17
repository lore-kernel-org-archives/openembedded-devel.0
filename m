Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.59])
 by mx.groups.io with SMTP id smtpd.web11.7154.1592399333732015868
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jun 2020 06:08:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=pv/T5nln;
 spf=pass (domain: windriver.com, ip: 40.107.77.59, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hn0Pj551BwqDj4PaJSxoR0RJb5AbyC4lMSDStG0hdvDBBxulzAySAWKmBQje8mH7xaEqUNu2dC+T6XMGNdWx6Z+macD3AW4Wdszy2fJP+Q8YPfX52v4GlN5Vozu2XljsbhUybzGxK0IZ4C/AbCu30Nv8mY3/aOjzFLD6smuOrTVrrq2oO9KZL2OsCwJPgGcTe0qXm87Q7zbIiQwKfjZcZjrPrcJ2HUD2oaNuKEnWwUUiiP5o+FfnIN4Cjd4rjXx/FizJBqOZyj1LemlQnLToHWABRhic6j5Hub2McCqj8H1PZnJfLaks3Rts4MpWAaLsP/dsR+zT+1MYw+/kpYPUjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wkWzLol2DKyiXm+3YNywdqyXZkal7ArrFCx1gdYLb+M=;
 b=THp9shBC5ifI6ZIPYqpBVjEQAUHSb0NEmQFsi04RymAOdRMos24+k0R8IV8xivTkouI+qalv9hTwAic+S9tZ1KM3L8k/T3o0khm0vTjqr1oJlTixZQuNqSGfEBerclEWfQbymWvPXI11OzC9FYTuxwBg6WW121h2aTxXwn7CBWqTUq8YR+mhocA1Nkt8e+XpbNIKCEy1Rvea+QW6Ne+MXvu7mFXKmxBVshUIxGZdjpsVkaPo/QCR61hrowWhf3VZIainCvjB1r4mRTxCDWrnv+PPkdB5SM0A54kniWwF/r5NzXxeLtplVdiVN1+Q/p6pTNs2XJHHcIOBvMEzWIU/+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wkWzLol2DKyiXm+3YNywdqyXZkal7ArrFCx1gdYLb+M=;
 b=pv/T5nlnFuhxsFIulPpGSStrHt9dNwtku3ZwBKN5AMRy21sn904deIM7XRf2B4s+8ZV+VkLJbTiU3lrsbFDbplFFxnZl3Q1gvmyGRrcP52nSiBMrzUBkKs/CymymaFsOx+C1WYSmNcXfODi+GRMwUGpt788k2wxhFCwvGUAm7Js=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB3875.namprd11.prod.outlook.com (2603:10b6:405:80::37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21; Wed, 17 Jun
 2020 13:08:52 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.021; Wed, 17 Jun 2020
 13:08:52 +0000
Subject: Re: [oe] [meta-python][PATCH 7/7] python3-can: Upgrade 3.3.2 -> 3.3.3
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200615103017.2714-1-leon.anavi@konsulko.com>
 <20200615103017.2714-7-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <34969883-981c-42fb-afda-117d23179047@windriver.com>
Date: Wed, 17 Jun 2020 09:08:50 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200615103017.2714-7-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0006.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::19) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTOPR0101CA0006.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21 via Frontend Transport; Wed, 17 Jun 2020 13:08:52 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00764d0b-2d8a-423f-13e2-08d812bf9517
X-MS-TrafficTypeDiagnostic: BN6PR11MB3875:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB38751C978E66E271966431019F9A0@BN6PR11MB3875.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-Forefront-PRVS: 04371797A5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rNgjKQupvTxrr32WFxiExmMXcoIFa66mn+oDyUZJUMP7LhAswLlcq7tqzx8kDAaRNGzdAHNO/9ZXsAiRo8eStTTerXHOL5zv4XwDN6W9xdmNwUFMkZCEpDI2TQxGGCTTZ39qr8i4eJHKRDkcAG1tCwt7MmN+ZtrnsfMpem/i1DNgQPf1Q6DxT6swmZMvgtoXuyZPb4ioZ1veT+4j37htgiLzqLsJ0V+7s8IJC7nk3tsJ2wkp9f47nZ0zjLPzS7qxirZpMdHHQ3Zry0+zVVmOSXOQY6V/7WJgINfgpQOQNj266Bjb2HgsRa6G9+VY79lwOZ2wNLZP48ejxWlp6M0q6//vrTsHWkp4WoPPxiuUj7JUr4mqeHGqGf8gIC1qQCa+XkOD9WTOjCu87Z//CorGeD4iTFbwjDQdZKnMiM02FNBZ5mS6ZI7AyZAKDGyfwo5em16vMLOsCHndH0TguYqWtw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(39850400004)(396003)(366004)(376002)(346002)(83380400001)(2906002)(966005)(36756003)(44832011)(31686004)(2616005)(956004)(5660300002)(52116002)(66946007)(31696002)(16526019)(186003)(316002)(53546011)(66476007)(166002)(6486002)(478600001)(8676002)(16576012)(26005)(8936002)(66556008)(33964004)(86362001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	/6b38wWZQKQQMj6qFz2TsEbnl9EumERjA0k78JWDMfXouMHBcsQ3Si0VlGtl9QvaaU+KQk+wh1xkAWpFkoMcr79kr9jqm9GidJs8HVV32tSyTxzog+Bs7FQPZHC79jLRBnGna62ayfTjgttGHSBSAW8O0zcPNE+MY3IVY1P1EDbNhI78oKunHWl9CjbJFyhmHw1wj4q0FYzcebqcOCXjM/rF8GBnPW1Snz4p/Cm379229/g13Mk+0wOQwQa9qR/Fo8Sck1GUUhH+XUoupT9AKkxiUWmOU+hftWKYe8027M6PBA3oSFtso/1gPoNYP1Qo7BW4CEPCiU19+1szOYIlZ9pzzWnPLXxbMC+AKXzPB+1l1AfBKPK5ef6bgAdvjl22zG2ztQo9CPLFXwQ/PeFXdXNysRZ8gFa74nNXuvvMBrH/DmAAjkywV2DypO3hE3k7VsaGoRS4F4SLDlhUBJwVDicAtz04dPLm5PW7cDWWn+0=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00764d0b-2d8a-423f-13e2-08d812bf9517
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2020 13:08:52.5016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q4e4SqpvkmxYDopVLJYXRw+uIbMWfo99WLz+W6NhzT6A4F5OWwp/MYZZ2yz7X11Ssxl0XysvhYJefwzYfrBYGvX+GqXf8AyuVU0mk35/STE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3875
Content-Type: multipart/alternative;
 boundary="------------2759ED258FC9C78DBD040FF9"
Content-Language: en-US

--------------2759ED258FC9C78DBD040FF9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/15/20 6:30 AM, Leon Anavi wrote:
> Upgrade to release 3.3.3. It contains backported fixes from 4.x
> development branch which targets Python 3:
>
> - Backport caching msg.data value in neovi interface.
> - Fix Vector CANlib treatment of empty app name.
> - Handle empty CSV file.
> - ASCII reader can now handle FD frames.
> - Exclude test packages from distribution.
> - RTR crash fix in canutils log reader parsing RTR frames.
> - Skip J1939 messages in ASC Reader.
> - Exposes a configuration option to allow the CAN message player
>    to send error frames (and sets the default to not send
>    error frames).
> - Fixes the semantics provided by periodic tasks in SocketCAN interface.
> - Avoid padding CAN_FD_MESSAGE_64 objects to 4 bytes.
> - Fixes the broken CANalyst-II interface.
> - Socketcan BCM status fix.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-can_3.3.2.bb => python3-can_3.3.3.bb}     | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-can_3.3.2.bb => python3-can_3.3.3.bb} (80%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-can_3.3.2.bb b/meta-python/recipes-devtools/python/python3-can_3.3.3.bb
> similarity index 80%
> rename from meta-python/recipes-devtools/python/python3-can_3.3.2.bb
> rename to meta-python/recipes-devtools/python/python3-can_3.3.3.bb
> index 698eaf5b3..4da233959 100644
> --- a/meta-python/recipes-devtools/python/python3-can_3.3.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-can_3.3.3.bb
> @@ -3,8 +3,8 @@ SECTION = "devel/python"
>   LICENSE = "LGPLv3"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e6a600fd5e1d9cbde2d983680233ad02"
>   
> -SRC_URI[md5sum] = "b724553a330478270267380b4888a18e"
> -SRC_URI[sha256sum] = "5fefb5c1e7e7f07faefc02c6eac79f9b58376f007048a04d8e7f325d48ec6b2e"
> +SRC_URI[md5sum] = "1310da316799e4b12944a6c1dcb017a9"
> +SRC_URI[sha256sum] = "ecd69cf6b2f0235345ebe607a15325cf1384c85b24ffbe1d68c3754357f87488"
>   
>   PYPI_PACKAGE="python-can"
>   
>
> 

--------------2759ED258FC9C78DBD040FF9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/15/20 6:30 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200615103017.2714-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 3.3.3. It contains backported fixes from 4.x
development branch which targets Python 3:

- Backport caching msg.data value in neovi interface.
- Fix Vector CANlib treatment of empty app name.
- Handle empty CSV file.
- ASCII reader can now handle FD frames.
- Exclude test packages from distribution.
- RTR crash fix in canutils log reader parsing RTR frames.
- Skip J1939 messages in ASC Reader.
- Exposes a configuration option to allow the CAN message player
  to send error frames (and sets the default to not send
  error frames).
- Fixes the semantics provided by periodic tasks in SocketCAN interface.
- Avoid padding CAN_FD_MESSAGE_64 objects to 4 bytes.
- Fixes the broken CANalyst-II interface.
- Socketcan BCM status fix.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200615103017.2714-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-can_3.3.2.bb =&gt; python3-can_3.3.3.bb}     | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-can_3.3.2.bb =&gt; python3-can_3.3.3.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-can_3.3.2.bb b/meta-python/recipes-devtools/python/python3-can_3.3.3.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-can_3.3.2.bb
rename to meta-python/recipes-devtools/python/python3-can_3.3.3.bb
index 698eaf5b3..4da233959 100644
--- a/meta-python/recipes-devtools/python/python3-can_3.3.2.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-can_3.3.3.bb
@@ -3,8 &#43;3,8 @@ SECTION = &quot;devel/python&quot;
 LICENSE = &quot;LGPLv3&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=e6a600fd5e1d9cbde2d983680233ad02">&quot;file://LICENSE.txt;md5=e6a600fd5e1d9cbde2d983680233ad02&quot;</a>
 
-SRC_URI[md5sum] = &quot;b724553a330478270267380b4888a18e&quot;
-SRC_URI[sha256sum] = &quot;5fefb5c1e7e7f07faefc02c6eac79f9b58376f007048a04d8e7f325d48ec6b2e&quot;
&#43;SRC_URI[md5sum] = &quot;1310da316799e4b12944a6c1dcb017a9&quot;
&#43;SRC_URI[sha256sum] = &quot;ecd69cf6b2f0235345ebe607a15325cf1384c85b24ffbe1d68c3754357f87488&quot;
 
 PYPI_PACKAGE=&quot;python-can&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------2759ED258FC9C78DBD040FF9--
