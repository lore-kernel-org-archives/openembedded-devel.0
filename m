Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.88])
 by mx.groups.io with SMTP id smtpd.web11.10740.1593784969747948212
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jul 2020 07:02:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ddgqpB7M;
 spf=pass (domain: windriver.com, ip: 40.107.237.88, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VGwZsVvJI/doqdd1CZpFeqP4Dp2pD7vUxQJndPYnepLfuBqf81o4kLQGpXP1WKeWbYkg+OqRiAQbvKdNqDIXVFT/+YvGxjuXd9RIMRqhi+4Ty6XjDrHRIJqyScXzxdyYPucNBVLcQq+Rew/0MHDEiFx1W3DgVmTvV1GHtBRPs0RSk6z8+tDUFwpS6YbU6EzkofxSKLCjMPnjIB80F5CshhqbPwBX2VOY32ERqb8KxD4+FZbvo5ZWhaG3pZWCmqA9nmMqNm7DkpJNG++1JBf211bGMhdb/CAzSnlt1dnul/aHNVM6QPONypBbuYJPeruos9JUPl7xwrVDjlMxyw3ooQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sx0VjpeXVQQCUJprBnw1scxIAI44cTe0n+0pXgCgug0=;
 b=c4xmmVYlJ10iY/RkLkVcGANk8j3WzeeVzzvrS9bVNOtC5hV9KnAHGx5ysu28Kcdzx9Po+dsZznAjFuYym8/Y1CLynmz1F+ioAj14GhFw54N4bxVhT47lY3+QEkaBcCRBTN2m3YaXKNro3+/OBPj9W7dz+0O/m6a1+DZKudDx9NwyM58NM6ZbkoWmOZUvS2C5qxg492gOb287Pge/DfKlsvf5gMdbomz/PuXmHVbbQAWixe9Qgtrbwo7gosnpDKbkn6Q3zPZKBzPIqAPjexFfHGTdkqBc0W4LgiuU4pS4yQQSYZ5/D2yWRAuYRsLM/iuJla3w2GmjcHbKKSjZXYWKYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sx0VjpeXVQQCUJprBnw1scxIAI44cTe0n+0pXgCgug0=;
 b=ddgqpB7M4VJBHsygUQ0SRSpq6nmKr1aFxi4PMuxMksD8YAPeWEyHWXZ0qKrEBUw4p5uMkbqYVu9ip4OHp3EtPKWcNIcDWqZT4YIEUhbqLF34hphxPbTjN4rl1tUBtH/d3jsejxam3hbWivK2uQQJarZ/mChO8BVU/yDgr5sIEOc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM6PR11MB3627.namprd11.prod.outlook.com (2603:10b6:5:13b::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.23; Fri, 3 Jul 2020 14:02:48 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3131.036; Fri, 3 Jul 2020
 14:02:48 +0000
Subject: Re: [oe] [meta-python][PATCH 4/7] python3-pychromecast: Upgrade 4.2.3 -> 7.0.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200629171853.18608-1-leon.anavi@konsulko.com>
 <20200629171853.18608-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <57ebe73f-86eb-3381-901a-ed02f3e1f9ce@windriver.com>
Date: Fri, 3 Jul 2020 10:02:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200629171853.18608-4-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0140.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::19) To DM5PR11MB0011.namprd11.prod.outlook.com
 (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0140.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23 via Frontend Transport; Fri, 3 Jul 2020 14:02:48 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f826b8c-3a7e-47a0-77aa-08d81f59c481
X-MS-TrafficTypeDiagnostic: DM6PR11MB3627:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB362775B2E83EDFA6E2E37EB79F6A0@DM6PR11MB3627.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:454;
X-Forefront-PRVS: 045315E1EE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oHYuj8p07UMmo+ZCgaUKHaSFd9zdQFkKjtOKPr1Fcr2dqp3nHe2qZNyT79RId7klwpzXvS5hqtA5JOf9otb93oJouplFcSbm5RW6p+hUqpdXNMI0gxIbALJuihEDDZgTc3AIjG2Xz0eBYRVuM5A0oRqkT7eOl8C9bsxD8qs0b7VjuyKchoFZVBPdjYizrir/Znv02Xpw7pTayDIzdVHVbjICmwG/dQtNe3I0VQv1ry/T0DTyQ8UcIHX/mkwO1bDp7ubaYejZdbra7Vh09Jm91dc4tngr/ojf0g8V0rJz6apijh5MwDJae2HQupOvots6nHYskV8BaSwYnpQkkstpaa4jhnagZ6ABvHrGKnrh0x4V0ov42qHsCFQ8uJ6I64QkJ1aE98G4u8NVU53qJiFu+uxG5FA5HplkISljz4GEM+ip5HFJi+eZZd3cHXV/kCo9X+XbZvTA2KmbNPv3czPo8Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(366004)(39850400004)(376002)(346002)(136003)(33964004)(66556008)(478600001)(966005)(16576012)(316002)(36756003)(8676002)(66476007)(8936002)(53546011)(2906002)(86362001)(52116002)(31686004)(31696002)(166002)(66946007)(83380400001)(16526019)(5660300002)(26005)(186003)(44832011)(6486002)(2616005)(956004)(6666004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	6zU5L1BzKBUb0Xg+X2lW1tyMjXZgH39P7hf8Tduc+ZqK3YgOpSivtHyD6JLbT07/zRk8KHLvZrPXrzqQ8zZHgduL10BIAMzubwRiI//+/GEx3meVyhAiugtiXEvuBsSfxUBl9+W2sF/khzvSCkFNMJRMbtDcXsPfoTJkTM/Z0dxWdeo845k4y3sgxhWjReazzgKf24MMj/8QXCSh4r6utLiCXB14IYBWLuDo+3k9IvEPMO2/f+nXXfpCxJnup3KmOSRKobCGeaKT8TFWXe7dn1LR1pVFr3oXVdiQzNI5QaFhy+meqFAC4A/XMsfHtR0EPHoHdV/5H6ryIkOzhMZtTMqne5ffETCaC+byAYEEM472MUYjUotLIUgROIIpg8x9U86oINevB0tAi6KW6hKBBAXWqKlrbNsqGrYg6P8H9tSUUFyvN/wdmp1XnOFMP2C9pO2+1cMGeGoYmxe/aUG64kahvVeMRx5t0lQKExk4YPY=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f826b8c-3a7e-47a0-77aa-08d81f59c481
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2020 14:02:48.4823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JKp4F9MBF8jLlSCy51K3hbQVyI7odVDi4sOOMJsgaKB/82TaWolDi6FPhwTQdsJzE2Qzpi/OHX7wU75CeOMYs0DZfj1miTmCi0o9Zzi/Fj0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3627
Content-Type: multipart/alternative;
 boundary="------------E0B4C344E2D1704DDF0E16F8"
Content-Language: en-US

--------------E0B4C344E2D1704DDF0E16F8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/29/20 1:18 PM, Leon Anavi wrote:
> Upgrade to release 7.0.1:
>
> - BREAKING CHANGE Track services based on UUID instead of mDNS
>    service name
> - Correct version
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...n3-pychromecast_4.2.3.bb => python3-pychromecast_7.0.1.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pychromecast_4.2.3.bb => python3-pychromecast_7.0.1.bb} (66%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_4.2.3.bb b/meta-python/recipes-devtools/python/python3-pychromecast_7.0.1.bb
> similarity index 66%
> rename from meta-python/recipes-devtools/python/python3-pychromecast_4.2.3.bb
> rename to meta-python/recipes-devtools/python/python3-pychromecast_7.0.1.bb
> index f561753a1..d21bb5f3a 100644
> --- a/meta-python/recipes-devtools/python/python3-pychromecast_4.2.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-pychromecast_7.0.1.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/balloob/pychromecast"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
>   
> -SRC_URI[md5sum] = "56632e0d94f2648a29d89affddddaaec"
> -SRC_URI[sha256sum] = "d7b7b35254203ab4617389061bee25b0fa67c6628c48bd6a75ccfefef74f1edb"
> +SRC_URI[md5sum] = "519d928bf3bdc8adb4dff1ad0e9de6ff"
> +SRC_URI[sha256sum] = "85112a0f39727636e35a0e1b633cc55a90a17bfc06be0a9a9bea5e46ac603cf1"
>   
>   PYPI_PACKAGE = "PyChromecast"
>   
>
> 

--------------E0B4C344E2D1704DDF0E16F8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/29/20 1:18 PM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200629171853.18608-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 7.0.1:

- BREAKING CHANGE Track services based on UUID instead of mDNS
  service name
- Correct version

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200629171853.18608-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...n3-pychromecast_4.2.3.bb =&gt; python3-pychromecast_7.0.1.bb} | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pychromecast_4.2.3.bb =&gt; python3-pychromecast_7.0.1.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_4.2.3.bb b/meta-python/recipes-devtools/python/python3-pychromecast_7.0.1.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-pychromecast_4.2.3.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_7.0.1.bb
index f561753a1..d21bb5f3a 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_4.2.3.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-pychromecast_7.0.1.bb
@@ -3,8 &#43;3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/balloob/pychromecast">&quot;https://github.com/balloob/pychromecast&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5">&quot;file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5&quot;</a>
 
-SRC_URI[md5sum] = &quot;56632e0d94f2648a29d89affddddaaec&quot;
-SRC_URI[sha256sum] = &quot;d7b7b35254203ab4617389061bee25b0fa67c6628c48bd6a75ccfefef74f1edb&quot;
&#43;SRC_URI[md5sum] = &quot;519d928bf3bdc8adb4dff1ad0e9de6ff&quot;
&#43;SRC_URI[sha256sum] = &quot;85112a0f39727636e35a0e1b633cc55a90a17bfc06be0a9a9bea5e46ac603cf1&quot;
 
 PYPI_PACKAGE = &quot;PyChromecast&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------E0B4C344E2D1704DDF0E16F8--
