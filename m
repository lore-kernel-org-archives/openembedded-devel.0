Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.80])
 by mx.groups.io with SMTP id smtpd.web10.9591.1594384637248255656
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jul 2020 05:37:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=a1x6BHdK;
 spf=pass (domain: windriver.com, ip: 40.107.243.80, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YIH05EXeCT9qNsJLW/UvR24Jt196FRtuPVZwyjtW+XOZWIKpwNutO850M1KsVozRJObqzlUB3EHALVjxptbvIhKJPe7vDZyAJaVeDEh6JF6d6gmlwTyfQq5OSyMulqbFBeNWhlduKS6qvt/uD8Tv/2jde4qE7UXzOO7CSCgBCTx+eIIYz8bzT8LQPhMT1lnsEHyp5xCw4+0oN6eUh+G5Iv7NrOLfGa09JTV6lNu17Ty0bCmGR315Dy1qlTvbRndrXOCVbckeBXWvjHpP/g4QrdCr2a8Ppw+2erbl8NNZJvjPwIY+IKdII4mVz1z0eXgBUNTx4bl1OzaihSv5zyvgGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0jW1/j3aTz8iihFZ+19m5rwzTVU5uCWlDzc8VZ9AYdo=;
 b=TLzY/+nrVbd82E01u4omEURtWZXFYO1sgQrslbCz26l3kBVcZm+qAdGE/5sCDJExo9UyE7lUlRr8/+AmXWP96BrMU1eOPr9Q+1fvtGtoh4mtHU/kP8iSt3pG5el16kf6lQugGuS2ddDZ0Za+y++BG2WCZbkE3yVPtp1x6MECc878tOr2LM7L0UwBsXc5MkAXsu6uODZqRx8Mh6KRvgc54oGYLSbgw2nrzidmbtFrR8C4vxuYyz2VxEPAjqCfE6rEvrigVyOV5FqcEtPrrntVPmTT76hzf7tM0Nb25E4oyP0kPz8KPzbK8ZJHmGhuWltm8IP24BDqe2xnsZFadAwY4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0jW1/j3aTz8iihFZ+19m5rwzTVU5uCWlDzc8VZ9AYdo=;
 b=a1x6BHdKF3GQ0dVRgbJtHNV0TJQVxnnUYGVMElgyBXcxV3vhiIXMNVVJJs/a2nKyK9ihdw4iuK3CFqXE5O3APIkcFdBBGweEr65LR7wehLnlcC8JdzyVSN3O53GFAD9yjJjcqHrGrDWhDl8v9aIMbrds5wunGDJLnix/dqao+1Y=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM6PR11MB4516.namprd11.prod.outlook.com (2603:10b6:5:2a5::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.20; Fri, 10 Jul 2020 12:37:16 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3153.031; Fri, 10 Jul 2020
 12:37:16 +0000
Subject: Re: [oe] [meta-python][PATCH 3/7] python3-humanize: Upgrade 2.4.1 -> 2.5.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200708094659.27331-1-leon.anavi@konsulko.com>
 <20200708094659.27331-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <2a174cb7-3ac2-8147-d77a-aa221e423c07@windriver.com>
Date: Fri, 10 Jul 2020 08:37:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200708094659.27331-3-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0067.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::6) To DM5PR11MB0011.namprd11.prod.outlook.com
 (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0067.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22 via Frontend Transport; Fri, 10 Jul 2020 12:37:15 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 690102f0-4c3c-4f26-cb0f-08d824cdfa85
X-MS-TrafficTypeDiagnostic: DM6PR11MB4516:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB45166D9C18B58FDD6E6DA2C09F650@DM6PR11MB4516.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AkAXnWNxZIu5ETe3gzy7LpOprk0sNjy3XXEg1MlyYl/GToyzVX6sr0c/Mz0VoB1w5CgcOWlheD4uA0Y7q3dOhVjofEGhInt8AJL0ppTzIZUO/SZpbmECZSnGUHVyIpFNZEMtZme9CNGTfq1QsZKXMG6+jvt/aaOp8jvgp1Nii22hwFg91p78RKFcxp1Uf5U+pivmrORx3c1jD3mSYxKxJ+1hJcFp1WpD8cua9HHhBqeKUnp0PkjaF3UAd7Pczxc84Nr++9R7rXO++3bznB4b+mFw1uYmjL82lm1hSAJwnP9LjwMcBU5pWsreo5n6aJ3B/qM+BnrWFaMNMXzjbNXNWS779lFE5P9aj+Z79f9dvebaDier0UozSI88ikLs7zJPXBebbmbAKe1DTeMlnEqxSxY8e9l/XBjF94HT2qB1WUbYjtJAnOkb/gfrbrQ33Sd34tjFiZ6GN0530dEufaqjT+2tlwmZChuxjXgyNRzmGxc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(39850400004)(366004)(376002)(346002)(136003)(16526019)(16576012)(44832011)(166002)(53546011)(66556008)(66946007)(26005)(66476007)(2906002)(966005)(316002)(478600001)(8676002)(31686004)(31696002)(8936002)(6486002)(86362001)(2616005)(956004)(36756003)(186003)(52116002)(5660300002)(19273905006)(83380400001)(33964004)(43740500002)(563064011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	wU8NoOEWmOtVMK4r4Stgt0QD5OfcngS2LUDe0MjKPvH/4dnERl4gH5bLxcU0A/JPX7bd5uiZ85Av2jU1u614Vq1qCACUH/kR6mN1Zyo8NEHO0AYLy2DaxySqlPhyc4VvV6GeenfuG1EurMfmfMIBq7Z+Hjm6l01RfHUY0lC4zROkrTPxqqJBc8KrWOjVml5SRrPjGAmBnrBFS2z/k+6147i4c+d40f07dAPN9KdIH3rowCpnV9bgAw0cITRqQ1FojR+CCTuTyPC/0xFI7/Zhx5iO9GBlTyHDYAR4gj8hLqzSLmjC3x3fEAm8s9+Z5kwVPc1VxLrPNtY3xGI4oNEK6aTl6MNurNtkd6FuKDOliiJ9Zdo6DSFtYGBm9HbEbNMy/+SSbBoHt635K+1N5mINpVeMsWCKXw2C5TsUQe17HCSX0E8jlvUlYNtkCucBj91dXYwQfqRBeBCOKyb6UglMgPujG9PeRtOvBNnV52G7j1Y=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 690102f0-4c3c-4f26-cb0f-08d824cdfa85
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2020 12:37:16.4212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SKsJJxeucb6KHVW8yuJ38q3teZWDDaCpt0ef/4FirfhfyTEBlMQ8dU6rXQe4QPWtf6oIWmnwuHDr7huv9q1seR231O9R2OUcqXFiUPXkHeQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4516
Content-Type: multipart/alternative;
 boundary="------------5DE514130F800D4BE205E9FB"
Content-Language: en-US

--------------5DE514130F800D4BE205E9FB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/8/20 5:46 AM, Leon Anavi wrote:
> Upgrade to release 2.5.0:
>
> - Add pt_PT locale
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-humanize_2.4.1.bb => python3-humanize_2.5.0.bb}  | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-humanize_2.4.1.bb => python3-humanize_2.5.0.bb} (71%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-humanize_2.4.1.bb b/meta-python/recipes-devtools/python/python3-humanize_2.5.0.bb
> similarity index 71%
> rename from meta-python/recipes-devtools/python/python3-humanize_2.4.1.bb
> rename to meta-python/recipes-devtools/python/python3-humanize_2.5.0.bb
> index 3a06a48b1..255933a5c 100644
> --- a/meta-python/recipes-devtools/python/python3-humanize_2.4.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-humanize_2.5.0.bb
> @@ -4,8 +4,8 @@ HOMEPAGE = "http://github.com/jmoiron/humanize"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d"
>   
> -SRC_URI[md5sum] = "3d4d25cf84181c55bf7d219dd175dbff"
> -SRC_URI[sha256sum] = "4b4ce2fc1c9d79c63f68009ddf5a12ad238aa78e2fceb256b5aa921763551422"
> +SRC_URI[md5sum] = "636e2c0fa1465abf8f1ff677d00e11c4"
> +SRC_URI[sha256sum] = "8a68bd9bccb899fd9bfb1e6d96c1e84e4475551cc9a5b5bdbd69b9b1cfd19c80"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------5DE514130F800D4BE205E9FB
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
    <blockquote type="cite" cite="mid:20200708094659.27331-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 2.5.0:

- Add pt_PT locale

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200708094659.27331-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-humanize_2.4.1.bb =&gt; python3-humanize_2.5.0.bb}  | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-humanize_2.4.1.bb =&gt; python3-humanize_2.5.0.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-humanize_2.4.1.bb b/meta-python/recipes-devtools/python/python3-humanize_2.5.0.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-humanize_2.4.1.bb
rename to meta-python/recipes-devtools/python/python3-humanize_2.5.0.bb
index 3a06a48b1..255933a5c 100644
--- a/meta-python/recipes-devtools/python/python3-humanize_2.4.1.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-humanize_2.5.0.bb
@@ -4,8 &#43;4,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://github.com/jmoiron/humanize">&quot;http://github.com/jmoiron/humanize&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d">&quot;file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d&quot;</a>
 
-SRC_URI[md5sum] = &quot;3d4d25cf84181c55bf7d219dd175dbff&quot;
-SRC_URI[sha256sum] = &quot;4b4ce2fc1c9d79c63f68009ddf5a12ad238aa78e2fceb256b5aa921763551422&quot;
&#43;SRC_URI[md5sum] = &quot;636e2c0fa1465abf8f1ff677d00e11c4&quot;
&#43;SRC_URI[sha256sum] = &quot;8a68bd9bccb899fd9bfb1e6d96c1e84e4475551cc9a5b5bdbd69b9b1cfd19c80&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------5DE514130F800D4BE205E9FB--
