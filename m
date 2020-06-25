Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.76])
 by mx.groups.io with SMTP id smtpd.web12.9858.1593090056069710524
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2020 06:00:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=T5ZJqqrM;
 spf=pass (domain: windriver.com, ip: 40.107.223.76, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GKqSBjx9s+uo2SMb7B3Jtv85M3L3d1w55fK7a226uBUbsmCWnZukkj5LeVC9+5oqR5IWOAfaUs83447pOfy5IUT9mgu5skUAsx9QuQDiLdHWIs7NGgj6hrsnUYfzWYpz8Km73D1nNPPQ0+vaoMRIRQ0f38I4ihC0Oy8JcSRJTcjDuC/kUJJavEG5mtCq5N9je8zVOkJPvMMrlryPYCYFRLjSBThcD5WjC6s47wH5HtfOiYCKgqvlqf2hOn5tbArIO1d1kWvceb3Xbl52sKUHMMEtf1Cf2Jh7Xzozr4ZMkWjnnaqa7H63WfhZVrDHdDYJVZLIO6Dzi46xEoXd8BB2Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tiYIX7S8vDBYetnql7uxzmX4DUSZfq6Hs/K5YbhWRm8=;
 b=NRB+4V+mvwsM9EJV15mQNkrph1Wxs0Xs7i8p4BvL6RozktwfM0lbjWmd/pe+intf3JkuUM2J/0du87upX9AhlD4Pq+luHGDYUVOJpFOpuX89SKAjy8cf1fNKVG5JJeLhHWNTCp6ZKgJfZOG6NOIxLBpg3z4+2DjdfItN+QxtFGcRSYbzfvGpLprCDocRPwi7bS5tzPkQQ3U5+c+bubxSWsasqjY9iMmk0tS4Gju0rmd/PjJ3PktEPFRBbOYAaAhlGJaVEvo4M4c54aqoeZ1g2IH1WOFfYvaQeoEF/8ONOY5qinW61lrcXKb06KIQvEJEBVjasU8l0biGVR6/2Oa5sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tiYIX7S8vDBYetnql7uxzmX4DUSZfq6Hs/K5YbhWRm8=;
 b=T5ZJqqrMq1bGSRaMxo0ISh/K/59rStGjzN+h2eNrA595mrgPKhslUlA4i56EmXKUC1rx8voObzk66GYgcNrwMMuT58BvWUVhDks+0u9CKrnZOjl9ytzayMomHiCxK7Jc3QdqbW2eCBXc+YHCsXpI7qjiITwp8YTdmvDK1ieg60g=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB4161.namprd11.prod.outlook.com (2603:10b6:405:81::38) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.23; Thu, 25 Jun
 2020 13:00:55 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.027; Thu, 25 Jun 2020
 13:00:55 +0000
Subject: Re: [oe] [meta-python][PATCH 02/11] python3-sh: Upgrade 1.12.14 -> 1.13.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200623095136.24854-1-leon.anavi@konsulko.com>
 <20200623095136.24854-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <564e9bf5-436a-11f7-1b60-898567dead8b@windriver.com>
Date: Thu, 25 Jun 2020 09:00:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200623095136.24854-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0042.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::19) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTXPR0101CA0042.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend Transport; Thu, 25 Jun 2020 13:00:54 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ce50241-9bca-4e66-71bc-08d81907cbb3
X-MS-TrafficTypeDiagnostic: BN6PR11MB4161:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB4161729D6F1CA2F9E5AABDEB9F920@BN6PR11MB4161.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;
X-Forefront-PRVS: 0445A82F82
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/9r10pUX7PMcoLW9qZWLzZEop/zdFwTvyra8c4NgZ95k1wpdgAScOF5bexTbJ4t/88GhDInP2bQlMCPn69uTDHl4GjDnWjMBA7DKEqNcSHe+56l3x7JfqY3/Wv5qvHHP5OCQQRcgToWMWcAQO0l/4MHTlvwhsx77C5wFb3B8r+WUuzKV3RyBKYe66sm1ER07ypFoyfjTBIj7OC1H3juE479IoRvHcHG+Znjg5/teGNFZnaadnLXgNZw7JP/UfgQzv/jpbQP1/n2PgKGszth3QPmCJhVru/FpW89FMea5Jri4nKVhOIv0LZZQ2jvfkllEBRmSu20CZ8BkMDk7gNCdDOkLf7HQpil0remewVxZolG+AMU06/w/YQRE7WQXMcAJVEEglW55I9sCEFXHhv7WKHKL2iWecZk50ByN2stBzKO0GUTDUARQEedtzYDQ3J4bM98Kt1fiSRrIdewq7SR4iw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(396003)(346002)(136003)(366004)(376002)(8676002)(53546011)(6486002)(66556008)(16526019)(86362001)(33964004)(316002)(66946007)(66476007)(52116002)(166002)(186003)(2906002)(26005)(8936002)(83380400001)(966005)(2616005)(956004)(31696002)(31686004)(44832011)(478600001)(16576012)(36756003)(5660300002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	0pPO2VcL5v0h2NddjWxenpqsoQBqLx6flxQh0stsag5ZTI592kYfcOwsp/yv+PiWQ3G748GTQOl0kevLqjyE+EIlijcnE7k4OIPSLNxjRaprFID0fJkhNbxYocU8VU28AEdgzp6/DE26PoI5Tt36xHKd2+mK7lQ+E/OYG0s+EkF6UijHgwOhaEhTzteyP6xhk59EXlUtAvaw2jRbpiSrqoPqiyWifpr+k+5G5URIStF6EGIePQKe4IMFvIqs8aZJpgxe0fKyratiFg7LS2CyZqNE5394bcVya2yHOf9ZZsNaJKbORwd1F88wMIyzE5eJh0ea1pPmd5M+mXRQeJM2zfPFo+hn+h6TZtZT5Vb+Go/Ietp/dRtxdKx39O3G/tcmboc93y85f1BisdaxxCpLD9JBfYtLh8dPD8JN1/W5m6vhbRu6DLyYeiOAoM06MIjHqByrG9xm/1u3zJ8G5YkToIzTrvFwcyPbLGGYCjIRpnRWzEBY5G2aXxG3dNVt8Th/
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ce50241-9bca-4e66-71bc-08d81907cbb3
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2020 13:00:54.8685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KhWEh65RJoFBmrznTFHU+MFFn5Vz9xuwKjBZxk76oczgqrtUMGG51ji/5Me39xXAFSUhWPRp27340rLqbReCsagej6GXN5/dBG7kAfUlS0o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4161
Content-Type: multipart/alternative;
 boundary="------------561D382F1364B67D78A69146"
Content-Language: en-US

--------------561D382F1364B67D78A69146
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/23/20 5:51 AM, Leon Anavi wrote:
> Upgrade to release 1.13.1:
>
> - regression fix if _fg=False
> - minor Travis CI fixes
> - bugfix for boolean long options not respecting _long_prefix
> - fix deprecation warning on Python 3.6 regexes
> - _pass_fds and _close_fds special kwargs for controlling file
>    descriptor inheritance in child.
> - more efficiently closing inherited fds
> - bugfix where passing invalid dictionary to _env will cause a
>    mysterious child 255 exit code.
> - bugfix where _in using 0 or sys.stdin wasn't behaving like a
>    TTY, if it was in fact a TTY.
> - bugfix where help(sh) raised an exception
> - bugfix fixing broken interactive ssh tutorial from docs
> - change to automatic tty merging into a single pty if
>    _tty_in=True and _tty_out=True
> - introducing _unify_ttys, default False, which allows explicit
>    tty merging into single pty
> - contrib command for ssh connections requiring passwords
> - performance fix for polling output too fast when using _iter
> - execution contexts can now be used in python shell
> - bugfix ErrorReturnCode instances can now be pickled
> - bugfix passing empty string or None for _in hanged
> - bugfix where passing a filename or file-like object to _out
>    wasn't using os.dup2
> - regression make _fg work with _cwd again
> - an invalid _cwd now raises a ForkException not an OSError.
> - AIX support
> - added a timeout=None param to RunningCommand.wait()
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-sh_1.12.14.bb => python3-sh_1.13.1.bb}    | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-sh_1.12.14.bb => python3-sh_1.13.1.bb} (78%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-sh_1.12.14.bb b/meta-python/recipes-devtools/python/python3-sh_1.13.1.bb
> similarity index 78%
> rename from meta-python/recipes-devtools/python/python3-sh_1.12.14.bb
> rename to meta-python/recipes-devtools/python/python3-sh_1.13.1.bb
> index b7858734b..2a6d9bcc6 100644
> --- a/meta-python/recipes-devtools/python/python3-sh_1.12.14.bb
> +++ b/meta-python/recipes-devtools/python/python3-sh_1.13.1.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/amoffat/sh"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5317094292296f03405f59ae5f6544b6"
>   
> -SRC_URI[md5sum] = "a8351aef25d25f707c17e0a7a6280251"
> -SRC_URI[sha256sum] = "b52bf5833ed01c7b5c5fb73a7f71b3d98d48e9b9b8764236237bdc7ecae850fc"
> +SRC_URI[md5sum] = "7e3dd3a6b49c06db93746994a68cb8cf"
> +SRC_URI[sha256sum] = "97a3d2205e3c6a842d87ebbc9ae93acae5a352b1bc4609b428d0fd5bb9e286a3"
>   
>   PYPI_PACKAGE = "sh"
>   
>
> 

--------------561D382F1364B67D78A69146
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/23/20 5:51 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200623095136.24854-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.13.1:

- regression fix if _fg=False
- minor Travis CI fixes
- bugfix for boolean long options not respecting _long_prefix
- fix deprecation warning on Python 3.6 regexes
- _pass_fds and _close_fds special kwargs for controlling file
  descriptor inheritance in child.
- more efficiently closing inherited fds
- bugfix where passing invalid dictionary to _env will cause a
  mysterious child 255 exit code.
- bugfix where _in using 0 or sys.stdin wasn't behaving like a
  TTY, if it was in fact a TTY.
- bugfix where help(sh) raised an exception
- bugfix fixing broken interactive ssh tutorial from docs
- change to automatic tty merging into a single pty if
  _tty_in=True and _tty_out=True
- introducing _unify_ttys, default False, which allows explicit
  tty merging into single pty
- contrib command for ssh connections requiring passwords
- performance fix for polling output too fast when using _iter
- execution contexts can now be used in python shell
- bugfix ErrorReturnCode instances can now be pickled
- bugfix passing empty string or None for _in hanged
- bugfix where passing a filename or file-like object to _out
  wasn't using os.dup2
- regression make _fg work with _cwd again
- an invalid _cwd now raises a ForkException not an OSError.
- AIX support
- added a timeout=None param to RunningCommand.wait()

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200623095136.24854-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-sh_1.12.14.bb =&gt; python3-sh_1.13.1.bb}    | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sh_1.12.14.bb =&gt; python3-sh_1.13.1.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-sh_1.12.14.bb b/meta-python/recipes-devtools/python/python3-sh_1.13.1.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-sh_1.12.14.bb
rename to meta-python/recipes-devtools/python/python3-sh_1.13.1.bb
index b7858734b..2a6d9bcc6 100644
--- a/meta-python/recipes-devtools/python/python3-sh_1.12.14.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-sh_1.13.1.bb
@@ -3,8 &#43;3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/amoffat/sh">&quot;https://github.com/amoffat/sh&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=5317094292296f03405f59ae5f6544b6">&quot;file://LICENSE.txt;md5=5317094292296f03405f59ae5f6544b6&quot;</a>
 
-SRC_URI[md5sum] = &quot;a8351aef25d25f707c17e0a7a6280251&quot;
-SRC_URI[sha256sum] = &quot;b52bf5833ed01c7b5c5fb73a7f71b3d98d48e9b9b8764236237bdc7ecae850fc&quot;
&#43;SRC_URI[md5sum] = &quot;7e3dd3a6b49c06db93746994a68cb8cf&quot;
&#43;SRC_URI[sha256sum] = &quot;97a3d2205e3c6a842d87ebbc9ae93acae5a352b1bc4609b428d0fd5bb9e286a3&quot;
 
 PYPI_PACKAGE = &quot;sh&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------561D382F1364B67D78A69146--
