Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.79])
 by mx.groups.io with SMTP id smtpd.web10.3005.1591818725465296458
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2020 12:52:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=N6jRKWO4;
 spf=pass (domain: windriver.com, ip: 40.107.237.79, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ux2WnhlP+mY1VwC60CQQMgQemYHzJZ1iosD5SJevwTvMneXQB9d4MvL+6i4A7J79cj2DLUNCFleRi0eu1bVptJahlWS27f6sa9pdXaKiHu80cJ6ZN3Fyhl6kNWXjJUcgqQlayUmbU9iuXcpnei5oSjuAW29pgpdViN/LkWEW/6DgS4Q7MULuCaUCM5lCrb5V9bY4pyHW7mNAqXA9Xxe5Utt5QYbHxkczoEHBGvoK1Ak1jnaVTxaQ57vNxu5XsXBgFGqY8IiI+JCkZCG/WRA0z9AJxiSqWO99vmBMQcDzthWwj+AXd7VqlNhoHTIvWwSC17oRR26T51poC7vlT8l0QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hn8KI0egu2WV7vLapPRkOEvkegR/V+AvtvXvuWsnnYc=;
 b=dg7wrtd4z7F5bOj6BTECJPBH4XrrWcj4oKT3u5UDhiJbsbDwyixYtj6LlE1iIh5vb5w9Dx4VDKKn/ViOooUKFBoFqW8uahWeaJxY6uL5padTeotSyXWCdF7sfRjrzTnQ728PN15TEYI9RaPS9tAtXgQr0RLwS7TvkjxNNs8XlEbg8B6mRKT+fwYl1V30RTvaRDjso5vid0hQj5AHzoJwPYHuCDLBMAEZEcTq7ye5U2yOH4N/AnA6GKcAkGG7udcxrKuEOWufTYor6pUYPlpELamC+AGSv65TmCzUTu167q/8EtptE6C3dRjI6eoptp8gE0sHIJhmK3Sp69/G3JRdlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hn8KI0egu2WV7vLapPRkOEvkegR/V+AvtvXvuWsnnYc=;
 b=N6jRKWO4fjIvImN6ZEvL2SDl0afhx1gHI3YSLVZfIYPU7Jmj7+RuC0APPcLfs8syUAt+tX6Q84spYCAJwqGvVECReYVTBzcXTComJXo5Vo6vFCjIBpUgcd0oFTek9jSv38Bf4vJ4SpBpxrtxxK5KbBawnD58TlyK3k5mPBCrwfU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1522.namprd11.prod.outlook.com (2603:10b6:405:b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Wed, 10 Jun
 2020 19:52:04 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3088.021; Wed, 10 Jun 2020
 19:52:04 +0000
Subject: Re: [oe] [meta-python][PATCH 3/6] python3-waitress: Upgrade 1.4.3 -> 1.4.4
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200609111050.32307-1-leon.anavi@konsulko.com>
 <20200609111050.32307-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <f806a7c7-c2dd-d07a-aea6-e2bf02a12877@windriver.com>
Date: Wed, 10 Jun 2020 15:52:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200609111050.32307-3-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0072.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::49) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTOPR0101CA0072.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::49) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.20 via Frontend Transport; Wed, 10 Jun 2020 19:52:03 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d265548b-7f55-42c6-608b-08d80d77bf9b
X-MS-TrafficTypeDiagnostic: BN6PR11MB1522:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB15226463E11DD031822443C59F830@BN6PR11MB1522.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-Forefront-PRVS: 0430FA5CB7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NNYA6gs2uXste6waWnZ8JgcafYklBZgyLEbx4z+HGIXqPXSoX+NDFatIs70tUemffdYPNdl2LrBRbNGEAQW2C+X+atd0T+jxoOnXK0P8vRLI6OQ/3ySv89a0YUWXXciG4x9WSS2kfeHdfVnVc5hJkWHU4rbCVX7KiGT+mD4CPIDOwqmopJT+3Qf7D2QpRommq0qJiJkZovZVfF6jTBLeFRpu0YAV46V7ijPXukr57g7V5vhLJQViNPDCLsGTWS7CWFvk3l9dSesth8wRWAOcbAIop5HK9qCS1UZpq/Cq0D3tKrP8hdAa3UXIkklTZdHM7EECkP8tuW+8SoK6gJPgz6ngRr+mkYvoUZPoDT85pGCWLV6rD9tBbkHLXSXS/dt8B0eh7jYgEGyNokvK1dJFq+okeT38T51r+RO0vQYkqZWHegGnQg96Y96oYY66iIBoXdbG+ICSSJ1FGGFxavYksA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(396003)(346002)(376002)(136003)(366004)(956004)(166002)(8676002)(8936002)(2906002)(31686004)(16526019)(16576012)(6486002)(83380400001)(2616005)(186003)(316002)(36756003)(33964004)(5660300002)(66946007)(66556008)(478600001)(966005)(66476007)(31696002)(44832011)(52116002)(86362001)(53546011)(26005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	jLn1af6rlWnhxa+Gl93ZyYqRnoqTlD09vzADZ+nGoRKFkAAfQgO0bNY9fk7yi0Ch39P5Vm+I+17wNt97Pi1sinshm/i/6JXBjN/upwsj2KppDl58Anh9Ns4Kdu7etpjsw8B3pxn4u5USiPUhY1OQAAHafc+o2LM4HWuQ0J00T7vzSw/haV4lHPKEP75SMhr9daW1knrhlPJD/+IRd02w0TBOdxBZe+KVwv65neYOOd+YWReNGgOzIUyDmc62STyk73kdzGp6BoAfC5vNdPbS1uda2TJxNB6hZD85A8BeMW3ADWvcXFTuPfoXSotwya77XDwWeHl7vxwVf4hS6skjaz8tRgI1OSqffLZj9tEvmUXyjpON/74dvCZUWXf6wpnhS8RxJQi46pNFYp9/vJRyuI1CuIo7wX4MCrHNfsqtIQEcG7w/TbaqOIap+7oO/rc2GQ0Y+0UgLZYTIc0htXiI0UCayqoQZXRPhO8JC/HeIDa0qGXyg7IU+HqMpiLRJKRN
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d265548b-7f55-42c6-608b-08d80d77bf9b
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2020 19:52:04.0834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +kx3Mq2ybrMTJ9g1OPsLdsLdVaTgoYmmHwiknCioD7jZINPUU1+HGQ9AmGyJqoqm6A9pafP4gbfRCM4dRCM6gdSaqWBy4qklqCZEKx7L7ic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1522
Content-Type: multipart/alternative;
 boundary="------------1A78C83E907D8F159EA326D6"
Content-Language: en-US

--------------1A78C83E907D8F159EA326D6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/9/20 7:10 AM, Leon Anavi wrote:
> Upgrade to release 1.4.4.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-waitress_1.4.3.bb => python3-waitress_1.4.4.bb}  | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-waitress_1.4.3.bb => python3-waitress_1.4.4.bb} (71%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-waitress_1.4.3.bb b/meta-python/recipes-devtools/python/python3-waitress_1.4.4.bb
> similarity index 71%
> rename from meta-python/recipes-devtools/python/python3-waitress_1.4.3.bb
> rename to meta-python/recipes-devtools/python/python3-waitress_1.4.4.bb
> index 8ac3e928e..3e207de4f 100644
> --- a/meta-python/recipes-devtools/python/python3-waitress_1.4.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-waitress_1.4.4.bb
> @@ -6,7 +6,7 @@ SECTION = "devel/python"
>   LICENSE = "ZPL-2.1"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=78ccb3640dc841e1baecb3e27a6966b2"
>   
> -SRC_URI[md5sum] = "4bffad7009d3824ae61ea6c0696e45f6"
> -SRC_URI[sha256sum] = "045b3efc3d97c93362173ab1dfc159b52cfa22b46c3334ffc805dbdbf0e4309e"
> +SRC_URI[md5sum] = "079c3c4902b1cb5d0a917276ee70f1df"
> +SRC_URI[sha256sum] = "1bb436508a7487ac6cb097ae7a7fe5413aefca610550baf58f0940e51ecfb261"
>   
>   inherit setuptools3 pypi
>
> 

--------------1A78C83E907D8F159EA326D6
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/9/20 7:10 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200609111050.32307-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.4.4.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200609111050.32307-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-waitress_1.4.3.bb =&gt; python3-waitress_1.4.4.bb}  | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-waitress_1.4.3.bb =&gt; python3-waitress_1.4.4.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-waitress_1.4.3.bb b/meta-python/recipes-devtools/python/python3-waitress_1.4.4.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-waitress_1.4.3.bb
rename to meta-python/recipes-devtools/python/python3-waitress_1.4.4.bb
index 8ac3e928e..3e207de4f 100644
--- a/meta-python/recipes-devtools/python/python3-waitress_1.4.3.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-waitress_1.4.4.bb
@@ -6,7 &#43;6,7 @@ SECTION = &quot;devel/python&quot;
 LICENSE = &quot;ZPL-2.1&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=78ccb3640dc841e1baecb3e27a6966b2">&quot;file://LICENSE.txt;md5=78ccb3640dc841e1baecb3e27a6966b2&quot;</a>
 
-SRC_URI[md5sum] = &quot;4bffad7009d3824ae61ea6c0696e45f6&quot;
-SRC_URI[sha256sum] = &quot;045b3efc3d97c93362173ab1dfc159b52cfa22b46c3334ffc805dbdbf0e4309e&quot;
&#43;SRC_URI[md5sum] = &quot;079c3c4902b1cb5d0a917276ee70f1df&quot;
&#43;SRC_URI[sha256sum] = &quot;1bb436508a7487ac6cb097ae7a7fe5413aefca610550baf58f0940e51ecfb261&quot;
 
 inherit setuptools3 pypi
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------1A78C83E907D8F159EA326D6--
