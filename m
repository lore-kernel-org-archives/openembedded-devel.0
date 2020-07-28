Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.61])
 by mx.groups.io with SMTP id smtpd.web10.12466.1595943169445135336
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2020 06:32:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=MCO/l8sI;
 spf=pass (domain: windriver.com, ip: 40.107.243.61, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R5ayZHnrP+SBCpK3anapcx0CI/7kCDrR8lLhZH3ZJKjoux2lgG81vt72cZ8R+xXtz3CyIDZfqu9uDyMUaq9uxdgFcukMu4VN/3bKt6MCHeQj99YAWHIbDV1am/+LKdXfSXRbtaSSli1Unel5OSoyvGf2NAeuwdrrqpOsdybqThiz0l0YxQjZ1fAMgA7r3Dn90J2YxmU63+wZkkeekfiWhmRclKQVKmWQakApn/oR1OpKbfjHVE3t1hML8WWxiceTMDsRFroFqvz9zNDvoK6sBJuPVZBAyW8OwetCAriGhJ0dtkPWMTfPGFAr/F/pYojIuNAJOnLIFXii/wJOpq1mbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bcyhrMWmjonQYBDMW24W7rD3gJtqxO3lBWkZ6f0vjY8=;
 b=EjkWozHNoXYhwKvJeuxHa9yt60thsGC0+expFKhmCuh0V07VmGnnDb1GS1JpTOu+CvrJd0g54GABgUK02UnmQ0ziisJJzgyqAYbbG2vmLnJNT79Q0eC9LIYyUsKDPFUIE8lhzH3dlTZ0Nhr0JmAbJqpY9aoApFQwVF4qtmz2W9ls8IzrlIOT3dsjlQiQRa10FILTdEi3fqUBACqM/PexEO4z2CqrZBspZF0jheGpwxShkSCLXf2qhcsVRH2e/cRLZjEQGiH6s9EdsMR86jyiChZkX0Lwbgd9yaTDalNAtUmMyeeD2THg3iYHnN/bWZJfUCrZGjJLPibMCIxb2TVX8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bcyhrMWmjonQYBDMW24W7rD3gJtqxO3lBWkZ6f0vjY8=;
 b=MCO/l8sIYos26KcHUoeYYq0E2BXqVzVgMZVPpVaD3OuobfGv5TfbNbUam/rO8Gl2KG9OmxC46yeYYWoc8a68ZcPgz3nr0QmcmQYKc4RFaZjfm7KkqEJ3hnbaSwTXwSA1TgnxXYb8XqXG9uHLmqmw0N/sXFVaLihevG4vIAltMYI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3816.namprd11.prod.outlook.com (2603:10b6:a03:f8::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Tue, 28 Jul
 2020 13:32:48 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3216.033; Tue, 28 Jul 2020
 13:32:48 +0000
Subject: Re: [oe] [meta-python][PATCH 4/7] python3-bitarray: Upgrade 1.4.1 -> 1.4.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200724103515.21420-1-leon.anavi@konsulko.com>
 <20200724103515.21420-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <3d43aba0-c74e-98fa-328c-34ed9b655e05@windriver.com>
Date: Tue, 28 Jul 2020 09:32:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200724103515.21420-4-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0073.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::12) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0073.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23 via Frontend Transport; Tue, 28 Jul 2020 13:32:47 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db07932a-8ff3-478f-d10d-08d832fab7d1
X-MS-TrafficTypeDiagnostic: BYAPR11MB3816:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3816A81C6F6271EB2B39BCE99F730@BYAPR11MB3816.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:462;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ODrA9Txb0R+MezWxVW7DDUdRmeHrDcRPspRE+s61E9eV1XJqUvKp3sxX1mS+PwOZX8+vNn9nsH3P6ulZr6JUpKx5o/PvGujfsp8JRy1Pd0KDH2fNgQu7dnlBXCFeYlKvUUGz2eCKr96uivIztfciwg+EaWhCT45pjLtqAQQKG7KBn7x/HS6aRa+rw9r1nbE/05pl8eFo+dBlzSYeLtRFxy6oDWXGVIJhSp31ZGZbe/cfR9nVr21jMQn/ktRLlqVe9zCvNn+aZlwE+W/repvji/pd0a37POwuwMmFNLPe5fOwT9ihff1YYbFsxV5ndSOdTWgjvcgGpYZxhxm/on5u9IudDj8u+PK2lWB21M6Lq3aDKgVnBiRfmbouToa9K4+VscvnOHgnyUWtVASNGy8UqTf9NzcMoQTldyyYA7tLsbrp+C9sW/Q2uHEiWWA5oGqZtfdEzX3hPX+slgxf5U++xw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(346002)(366004)(136003)(39850400004)(396003)(86362001)(166002)(16526019)(2906002)(186003)(36756003)(5660300002)(26005)(2616005)(956004)(44832011)(31686004)(8936002)(53546011)(52116002)(8676002)(316002)(478600001)(33964004)(16576012)(83380400001)(6486002)(66946007)(66556008)(66476007)(966005)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	zJ5tWw0XWneTQlttw/NVDY8lksXd1qkelXvTUHFN6Ec2+mIGG/H0CjZ2xoPubqUq7B75DpWs1i3mLO7YyRou7sxaflZsyfDW9id0TfLJTCuhK4TrORCMBQ76xAcw+RxPFO7LbvsFPZ6/9dX6kgP+EqQxccLz3GX0B1A+YQkPkY11tWrmXfbEpIeG2XDUObeLx4F4yXmhKXNZ1pdn9My4fyOfqIznow86iMFQrCUx3rzhlLQnIjNpSCzAsvaCtc7sIBioHuRve2Qi5dPo4C332v1FlXCOCFlxNaDDNvXS3pp38RHGiCzfJfs/o4LfvyqhBdk7AbjmC9VVHVzVkCEiEnowCNOzucHpznwwBC9KgWjyLZ9mGht03I6Regcezo+Ox7FWIWbJrqSpmSYTlxJc6xEMt4hgMs/fFJWbHcACi6iCeCBqvPhAZO3YzpXyo6Zwyf++4t/PHknkjLZaU8jjCWJN7Gp7TSReV7Lflp9TkrY=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db07932a-8ff3-478f-d10d-08d832fab7d1
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2020 13:32:48.4096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xPBb9tq9/7uKW0/SOsTnGmcK7BaXNUPaWhP1oHMGj9Mjw2xS/guidJunf84NFUYZhK1qjI8iMOHQz6HCSgmM8QBWufbr+NtH+ogn6jbzt3U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3816
Content-Type: multipart/alternative;
 boundary="------------0DD04062EA03771C5A14CF74"
Content-Language: en-US

--------------0DD04062EA03771C5A14CF74
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/24/20 6:35 AM, Leon Anavi wrote:
> Upgrade to 1.4.2:
>
> * add more tests
> * C-level:
>      - simplify pack/unpack code
>      - fix memory leak in `~` operation (bitarray_cpinvert)
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-bitarray_1.4.1.bb => python3-bitarray_1.4.2.bb}  | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-bitarray_1.4.1.bb => python3-bitarray_1.4.2.bb} (68%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-bitarray_1.4.1.bb b/meta-python/recipes-devtools/python/python3-bitarray_1.4.2.bb
> similarity index 68%
> rename from meta-python/recipes-devtools/python/python3-bitarray_1.4.1.bb
> rename to meta-python/recipes-devtools/python/python3-bitarray_1.4.2.bb
> index 4866e8464..925bdc8d9 100644
> --- a/meta-python/recipes-devtools/python/python3-bitarray_1.4.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-bitarray_1.4.2.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
>   LICENSE = "PSF"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
>   
> -SRC_URI[md5sum] = "dfb3fe66ae989e4724747fcb0f704f56"
> -SRC_URI[sha256sum] = "9e26d3dc7fad932fed66e08da3fcf93dd15e8402aa84e764e1e2a9e1b6ae2b7f"
> +SRC_URI[md5sum] = "2bc9489e9048db6a8705a7b9493e3015"
> +SRC_URI[sha256sum] = "16f9908c9388af616f2b298febbefa8315d648f522d195a7706d8ba1895c5680"
>   
>   inherit setuptools3 pypi
>   
>
> 

--------------0DD04062EA03771C5A14CF74
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/24/20 6:35 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200724103515.21420-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to 1.4.2:

* add more tests
* C-level:
    - simplify pack/unpack code
    - fix memory leak in `~` operation (bitarray_cpinvert)

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200724103515.21420-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-bitarray_1.4.1.bb =&gt; python3-bitarray_1.4.2.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_1.4.1.bb =&gt; python3-bitarray_1.4.2.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_1.4.1.bb b/meta-python/recipes-devtools/python/python3-bitarray_1.4.2.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-bitarray_1.4.1.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_1.4.2.bb
index 4866e8464..925bdc8d9 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_1.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_1.4.2.bb
@@ -3,8 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/ilanschnell/bitarray">&quot;https://github.com/ilanschnell/bitarray&quot;</a>
 LICENSE = &quot;PSF&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d">&quot;file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d&quot;</a>
 
-SRC_URI[md5sum] = &quot;dfb3fe66ae989e4724747fcb0f704f56&quot;
-SRC_URI[sha256sum] = &quot;9e26d3dc7fad932fed66e08da3fcf93dd15e8402aa84e764e1e2a9e1b6ae2b7f&quot;
+SRC_URI[md5sum] = &quot;2bc9489e9048db6a8705a7b9493e3015&quot;
+SRC_URI[sha256sum] = &quot;16f9908c9388af616f2b298febbefa8315d648f522d195a7706d8ba1895c5680&quot;
 
 inherit setuptools3 pypi
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------0DD04062EA03771C5A14CF74--
