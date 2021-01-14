Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.74])
 by mx.groups.io with SMTP id smtpd.web09.275.1610649829160861263
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Jan 2021 10:43:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=azyYheNf;
 spf=pass (domain: windriver.com, ip: 40.107.243.74, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ieUQFTMRXe883YXeREULurgNQ9dETnhpvG0sIka8xkDyzPwUv5a0/fauMx2hO+9kYqOcuIbhpLyxq+Gyp5GymxDAig1t4g/TwLHwrTHwBmN7HKe+ynFrOyCASgV5Job+iN3zzIy3jkGqtVhJBv9KWfRVrouLOymJAU+f4DMeKmvojZEucoOFyHmOELvVel13unrtYh/YJ2eNz0dxAjGNKrFCusuCa73AGVUuKVsA6Cvi9usn++MuPAfNkooJFjTAOVpiTUd8bRm0sx6wr1bwEv3BWYiSZ3rlrSs5D0G68PTQbAtmjI3jQBytLbNgznKyf79ohwqRU0QnY/4m1c6sbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xwZCDn7oD8SXYF89WILqrzzIv/K4WlvScRqQ4RQUWl4=;
 b=Ae3ktm2ehHH+MvuBIbWOV5uwYQLcyRaOPfXsdRWiilwfkMoumQ1JYKtowUMaXst9VHWr5+YTAyBpETCl0UJZ3exea3ZdH32sJnrx3oJyzxOajUQYq7dvEpbdrVxs8UCErNWqlTQcPt3tnN5RVFt4CTARBhUqpqi991slbF2GXstxtlp8IedsUtIRmFYdCUidtXIyGJQcfKfhSt75C5AqpnHtcQoVpUH4fmgv3/6U28A9M2BDtEopKFkv9bKkvBVDVybby5DtMkreBySwowa15vGg+4I3gzGiVhJkE0z/lK+eXYbP7GT9RVQ7S5HYLdrOkUwnIvuONuo93N/KZUxNNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xwZCDn7oD8SXYF89WILqrzzIv/K4WlvScRqQ4RQUWl4=;
 b=azyYheNfKyJxf8nkHL9E22nbjjSle+H5ja67+TSJ3DK2JcJhVO+YAWG455Tbk3PfhaQERt4cps8tXjpHnTWNiHykqa5afv4x7C9dR8dOS2U/ZahJ1yvdjXhXrGNfeD6bBXsAdnG2vrCSeCrw5bi7x6tn5x+zBzwFBGzpYYK+hEE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4800.namprd11.prod.outlook.com (2603:10b6:a03:2af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Thu, 14 Jan
 2021 18:43:48 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6%7]) with mapi id 15.20.3742.012; Thu, 14 Jan 2021
 18:43:48 +0000
Subject: Re: [oe] [meta-python][PATCH 01/10] python3-isort: Upgrade 5.6.4 -> 5.7.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210113142626.27599-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <3d944440-c018-e365-292b-2ee129c454f2@windriver.com>
Date: Thu, 14 Jan 2021 13:43:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210113142626.27599-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR22CA0020.namprd22.prod.outlook.com
 (2603:10b6:208:238::25) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR22CA0020.namprd22.prod.outlook.com (2603:10b6:208:238::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9 via Frontend Transport; Thu, 14 Jan 2021 18:43:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea3abb13-8fb6-490e-829c-08d8b8bc5472
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4800:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB48000C7D4CF75EF666CDCA1F9FA80@SJ0PR11MB4800.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	43EqpMLeNZVDlc7vW1FR/9sQQxVRm3EKo/SVo1yl7ExEfaUAdKA0rZNU/frZORN8oaLs8w0R9G8OE8Qc/XYQxh+4Dxd7yrJNdov4A5aElUAREkqWBGqpIpCIYgy+9DvS+fvRJtSeopVAmIhIUUPYHyzBdl5rshD/d3fnJXCIjHV9AWbQzVXURMLVR7GSRqWoGHONSRkWDzJ4cYuxZmt6A7SYrm1tpey0EcnD9XHBWzuWj6bGxs5xiqScHMYsHCKbZmKKbNV4AM13Ql4M/aXK1+MVRnirVajpoF8J2Os2RtnxE/calGSd3V/slN5RyALjzRnInb8sr3LEju5KCCdC1xctYIQapfS+dQ6v2Wa2g2VfG3bO04aTT1mMgMokEbO2ok41Ls3DwEzVlAgf6RQUsHp02J+KvlpNUMGuuyfQH84AK2J16iOmeOrVlY48vFgu+xVn+arjstFl/Y01l7KKnNxuaK1afkFIOErVlRdNU5KG5rziYMbF2OSKz2pECS2zJUduCt/4rj4Cuac4tULAhW/K1caHY6in+DtgFzCXzahnOFshj/Bu+8GyKLLwWzal
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(396003)(136003)(376002)(346002)(86362001)(478600001)(83380400001)(66946007)(2906002)(31696002)(31686004)(166002)(16576012)(316002)(966005)(8936002)(5660300002)(186003)(16526019)(53546011)(6486002)(52116002)(8676002)(66476007)(36756003)(33964004)(26005)(2616005)(956004)(44832011)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?ZmZpZGlyQ0ZPNVQrY1BMcUk0WDFNTjVoWVVvUTRWSnJ3RTI4c0xUQ1FUZHNX?=
 =?utf-8?B?NTJrVjdJTmpQQ1lTdThjdzBacnczaHgzY0hoSkNuVEtGb21DY1RSWE9DaHpZ?=
 =?utf-8?B?aHJpUGYva2xFSnBYNDN0TmhibGtPb2pTN2hUZ0VVMjZMYXY3UVdvZzRndVp5?=
 =?utf-8?B?aEF4WVdGbGcrTEFhRS9KRFJRUngyU0RZUy9ldUczOXp3b1dWaUc0SDQ4TFMw?=
 =?utf-8?B?Rlo4SEZna05NYVR2eTdyZERzS2tuUmN6Y0lwM2hhMDJaZlhUV0loY21UN2tx?=
 =?utf-8?B?am0rOWwyYUhvdE42KzI3cjB3d3VDWThTMGMrV0VyUTdZWXFsTTMxOGRqRnpC?=
 =?utf-8?B?UTJYWVVqMStzV3hFMTl3eXNwTW1oWFBSeE9iRm1ZK1k0VzkzWmJaQlBvMXZF?=
 =?utf-8?B?NE96dkR2UUwvbmhWU05qTTkzMGtTL0xqd1lHWWgrSmpvZUJ0YXEwcFhQRnZB?=
 =?utf-8?B?TEVPZnJpNEYvWGpDenM0VjFyVUxiOFdCdFhPQTRKek1aQk80dXBlRXA3U3Fw?=
 =?utf-8?B?MmZjcm52L3BIQVNxRDFRd2ZWWTNvRmlpeTFyT1lDR1ZiZEVjSmFlbGhWTUZE?=
 =?utf-8?B?eDdwZ3UrYlArdFYyQ0pWcG82SjBTYnFZSmFESUVrMFFNWW0yVk1hNDJ4eVd3?=
 =?utf-8?B?UEpkaml0OW9RL0EvTXdRbzVUdzdFbHhpU00rcmgxSW02eWtXNjRrT3dna1RW?=
 =?utf-8?B?dEVqeWlwdjA0eXMvRXBJK1kzZzgyUmdSTks1Y3VjY2NWZHAvd2FsdjkvcWtq?=
 =?utf-8?B?RThSK1J6alYzNkp2ekhQNmZwcFQ3WFkzS0ZBUTJMVjE0R3FPcGl6UHFSWmpp?=
 =?utf-8?B?ZXAwNE9lbzVYejd0b3Y4eDZnRU8rZjFwUURDMXNaRTJzK2RIOU5DVmkzditV?=
 =?utf-8?B?ZDZCcGRtem1nM2JITnNFQlJtZHJRcnd0cEN1T2FhTTJFamFjdGxnbXp1enF6?=
 =?utf-8?B?NUpSWTMrYXd1a2hKNm5BUGdMNGdWOFZCNFd0b2cwOWhrTkU4aUlvVWRtenFx?=
 =?utf-8?B?NUhoaEJoMzNZa0NKOS9TSjNqeUdOaDhjS2RlNW5mTnN6cjREdmI3R1FBeE9X?=
 =?utf-8?B?VkZEVDBqK2FOTDRBSjdDQ0U4QzYwK2JHaTY0TEkxTHphMnZRcmc2SVB2Nzdu?=
 =?utf-8?B?YjdkV3MwR05KZUp3QktDSDFIeWYxcXFwV3EzZ3BDYUt0L3NwSWROUy9VT2dk?=
 =?utf-8?B?QzN2SE1NSFNpKzdhQTE5UUY2Y1hZYWU1MEthald1bXgreDNwc2JXbnFGdDBB?=
 =?utf-8?B?QjQ2MjA1SFAySFNjSE1jWkk4V2h0bEx6MFZBWTEwM3ZPdWp0c09Ld3ZSblRW?=
 =?utf-8?Q?Xrv91LeWANkcXPYMcxlOn69cgtN+DcWjXT?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 18:43:48.2378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: ea3abb13-8fb6-490e-829c-08d8b8bc5472
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7IDs7MFg+QSGCJqJlC7iZ0QwIJd3+/ItN7cc2UlD1KHCPND76WUA6sH5yypmwjruCgfK80anYuiQsonlpE6Pz/F5nxmGd+op/gmHlSpNbAw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4800
Content-Type: multipart/alternative;
 boundary="------------E47B3F2DC6A1AA59A658460B"
Content-Language: en-US

--------------E47B3F2DC6A1AA59A658460B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-13 9:26 a.m., Leon Anavi wrote:
> - In rare circumstances an extra comma is added after import
>    and before comment.
> - isort encounters bug in Python 3.6.0.
> - Provide ways for extension formatting and file paths to be
>    specified when using streaming input from CLI.
> - Ability to output and diff within a single API call to
>    isort.file.
> - Better more useful fatal error messages.
> - Support for automatically fixing mixed indentation of import
>    sections.
> - Added a CLI option for skipping symlinks.
> - Support for disabling float_to_top from the command line.
> - Allow toggling section comments on and off for indented import
>    sections.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-isort_5.6.4.bb => python3-isort_5.7.0.bb}  | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-isort_5.6.4.bb => python3-isort_5.7.0.bb} (73%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-isort_5.6.4.bb b/meta-python/recipes-devtools/python/python3-isort_5.7.0.bb
> similarity index 73%
> rename from meta-python/recipes-devtools/python/python3-isort_5.6.4.bb
> rename to meta-python/recipes-devtools/python/python3-isort_5.7.0.bb
> index 66a5332be..9f234ee46 100644
> --- a/meta-python/recipes-devtools/python/python3-isort_5.6.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-isort_5.7.0.bb
> @@ -4,8 +4,7 @@ LICENSE = "MIT"
>   SECTION = "devel/python"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=8227180126797a0148f94f483f3e1489"
>   
> -SRC_URI[md5sum] = "d2dfc32943b1d64311facec6a05c2f98"
> -SRC_URI[sha256sum] = "dcaeec1b5f0eca77faea2a35ab790b4f3680ff75590bfcb7145986905aab2f58"
> +SRC_URI[sha256sum] = "c729845434366216d320e936b8ad6f9d681aab72dc7cbc2d51bedc3582f3ad1e"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------E47B3F2DC6A1AA59A658460B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-13 9:26 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210113142626.27599-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- In rare circumstances an extra comma is added after import
  and before comment.
- isort encounters bug in Python 3.6.0.
- Provide ways for extension formatting and file paths to be
  specified when using streaming input from CLI.
- Ability to output and diff within a single API call to
  isort.file.
- Better more useful fatal error messages.
- Support for automatically fixing mixed indentation of import
  sections.
- Added a CLI option for skipping symlinks.
- Support for disabling float_to_top from the command line.
- Allow toggling section comments on and off for indented import
  sections.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210113142626.27599-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-isort_5.6.4.bb =&gt; python3-isort_5.7.0.bb}  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-isort_5.6.4.bb =&gt; python3-isort_5.7.0.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-isort_5.6.4.bb b/meta-python/recipes-devtools/python/python3-isort_5.7.0.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-isort_5.6.4.bb
rename to meta-python/recipes-devtools/python/python3-isort_5.7.0.bb
index 66a5332be..9f234ee46 100644
--- a/meta-python/recipes-devtools/python/python3-isort_5.6.4.bb
+++ b/meta-python/recipes-devtools/python/python3-isort_5.7.0.bb
@@ -4,8 +4,7 @@ LICENSE = &quot;MIT&quot;
 SECTION = &quot;devel/python&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=6;endline=6;md5=8227180126797a0148f94f483f3e1489">&quot;file://PKG-INFO;beginline=6;endline=6;md5=8227180126797a0148f94f483f3e1489&quot;</a>
 
-SRC_URI[md5sum] = &quot;d2dfc32943b1d64311facec6a05c2f98&quot;
-SRC_URI[sha256sum] = &quot;dcaeec1b5f0eca77faea2a35ab790b4f3680ff75590bfcb7145986905aab2f58&quot;
+SRC_URI[sha256sum] = &quot;c729845434366216d320e936b8ad6f9d681aab72dc7cbc2d51bedc3582f3ad1e&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------E47B3F2DC6A1AA59A658460B--
