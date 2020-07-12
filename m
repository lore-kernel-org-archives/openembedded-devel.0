Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.46])
 by mx.groups.io with SMTP id smtpd.web11.2107.1594577802464605664
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jul 2020 11:16:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=e+MBRimF;
 spf=pass (domain: windriver.com, ip: 40.107.237.46, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d2K/y+JvvDflul8Wzfbe7feGd1rySYYlDrT7y2Kaq3q5wz+neoxxlB/r6VpTl5vd2PrgrpJ5aKViUoHlVHSRspfBOy4b9AvrmzABgTmK64xKnVltXgSWwInoVt8Umw+kucpJn0F0ne48OYPjzLwOd0j0gaDdL7F9tFHc3Eu+VLoBRnRFqnMWKdVmX6iJZCvqejFWn8EFXZtSajYRdsHhV3H4e23P0uOs0HKI9GqnvZMi9X6F3aulj2MnB4jp7E/y2hJ5d4giZBYW4FB9eqy6hTEUlgSEylt8Kp9Xjl5d23PjD9ZywtHhTlB8b7sdtQ0H+MGjaU7QYsV1v+8nU55WlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Qas76hdbup4eG0pWtkZLK5qpHeJgjGpIO3j17C9dB8=;
 b=HNshoJKVW2i1tErJX85f0mTUrbi85Oz0CQQm/+c53rvr/JWCQ+uGjIs4imvFjO6820eLO/AYvgbJdfGisk4ZyLfi4AHv0ExEQuB3BwW0woINhF4x5HwWVJ/tH4NzudlAfsofreHF8Jp1H82+DgHn4YiSaoxgODo+G5Ym/8Iag1pHqcIt5JBkBF+56kMNLfYRKMcbhAGwscbfbtV3vJv/L3j6atzTahmOOBCA3kch6y71jWvS7l1WAvy7fxwVQJSFK2g6azrM+7OCnkWOLAzZY3kZ73zEBMGGmwXaILDyRi2isw4iMPQZAEj0i9HyDSXFgxSBfc9N/Ui8Hj66DL4JNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Qas76hdbup4eG0pWtkZLK5qpHeJgjGpIO3j17C9dB8=;
 b=e+MBRimF7U2ceumU0nfLw4DPG64JGcb6dzDSWtuVcVAHPZmb83NC8Cz8vMM4zX0VSg7wvTsY7H775Per/acXfatVh6lej4+E8nsiU7G7TNnDXsYw2EpwuO6e65EuCwFvp6lcO+MxPAhR3Jt2Y9gsCKRy8Pxbsn9Q92KdB3xE6zg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM6PR11MB4532.namprd11.prod.outlook.com (2603:10b6:5:2aa::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.23; Sun, 12 Jul 2020 18:16:41 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3174.025; Sun, 12 Jul 2020
 18:16:41 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-pykickstart: 3.22 -> 3.26
To: kai <kai.kang@windriver.com>, openembedded-devel@lists.openembedded.org
References: <20200709075459.40502-1-kai.kang@windriver.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <ad69c865-8ff2-8dec-7cea-b439ee03d853@windriver.com>
Date: Sun, 12 Jul 2020 14:16:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200709075459.40502-1-kai.kang@windriver.com>
X-ClientProxiedBy: YTXPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::48) To DM5PR11MB0011.namprd11.prod.outlook.com
 (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTXPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::48) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21 via Frontend Transport; Sun, 12 Jul 2020 18:16:40 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d8f5c48-c665-470c-bdec-08d8268fb97f
X-MS-TrafficTypeDiagnostic: DM6PR11MB4532:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB4532EB16AE20D0A331E4A6A19F630@DM6PR11MB4532.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hvBqn0f90KgZTjp2ZzIRcKi4xnVYgv6uNKKtzFsLJBlKqvwdn6C/7pj9010mbe83hPbLMGjBQBZbLRxEkKf3AsKhUyb3E+iPU5AuHdDvI+ALtUcak4BLoXkMV0a7btg3fcwMnRoQdq45sLlRITrMcYkSibJzZiMC9WT3wrUMRHlP3I+kWDfjamlpQGwpZcCAmsqCF4kbE4tuuIzSGPrxfZP6fl8pPtZijQFRvDXfodpF5AXAiHwyWotQhcMnTDvWpK5UKkIwSOAr1yk+xZ8OQTVdmagYS+NL5W1QtvsRz3ALm/1mnPxkC8XN3C7Qz5bB/urzYdTdbg/EnPh+pbxxNnn1U21HMvm/rH7Uxo4ps1YxsToV5zcT1l2Y9OHbmSf1a0yjABD7h8+XmB+xXzo91ZAU973qOarrTMlFA9+RdS5+0uZscYQ0vyz3pD3qyTZRKD8+2wjOpiadw6AkC04ZtA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(39830400003)(346002)(376002)(136003)(396003)(2906002)(166002)(8936002)(31696002)(83380400001)(66476007)(66556008)(966005)(478600001)(6486002)(66946007)(33964004)(52116002)(36756003)(86362001)(16576012)(316002)(5660300002)(31686004)(53546011)(186003)(16526019)(26005)(44832011)(956004)(8676002)(2616005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	soIo+XHaf3NX0vwzcgs2oCibElVBppt3f1a1H47FaPDNdg2PzYoxXEHCmshYYEa1yppl16McLoR6EgWeZuBVy6suakNhOjTZH7hQIck+Wz8ElZFBdjLMUQ8Mp5AOGt09Sv9sNavwQGuqX5IzNcx+g9BP2iiW98UX+didf/IfEcR9mknLAscrJyfYoojfYBxUhzlfVjYZJMMEsmVdCMD+PlKVtellJ6le5CqP7xBBUYDKsR0R8HkFl04YOTcSil9bGOGxzKU4RwKDVimIVmDtafvxj+HxBs19Pqgv6Lm4fP1OuuQJndjjKvEKs63ijHp6FiQZ+N1sIhP89PWK1znrX6eG8Weu0K8+T+6AUVtdGIo1ruJTmeydgRmu0mgMkaSyqKxwyMHvWJuURrB1VZs7yXwNKdFsfjotB+ZdneVaCDf/eBDchysvWb0v29LpZlc805TzvIIT8sZOKGtkmXvVm20ABItVmgOVYnOjpguVtfg=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d8f5c48-c665-470c-bdec-08d8268fb97f
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2020 18:16:41.2470
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0x4jVOmUzeK6/QMmjeiA3RPPnoXbsE51Ve9bJg+b+isAU+pthWcTf9fRK0t1DJeATXlROWWO/oVC6hQvnl01QsvKS5LrFwy6o5vw1LjVSK0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4532
Content-Type: multipart/alternative;
 boundary="------------A563EBDC741AFBB30FF8052B"
Content-Language: en-US

--------------A563EBDC741AFBB30FF8052B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/9/20 3:54 AM, kai wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> Update python3-pykickstart from 3.22 to 3.26.
>
> * Update context of 0001-support-authentication-for-kickstart.patch
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../0001-support-authentication-for-kickstart.patch    | 10 +++++-----
>   ...pykickstart_3.22.bb => python3-pykickstart_3.26.bb} |  2 +-
>   2 files changed, 6 insertions(+), 6 deletions(-)
>   rename meta-python/recipes-extended/python-pykickstart/{python3-pykickstart_3.22.bb => python3-pykickstart_3.26.bb} (94%)
>
> diff --git a/meta-python/recipes-extended/python-pykickstart/files/0001-support-authentication-for-kickstart.patch b/meta-python/recipes-extended/python-pykickstart/files/0001-support-authentication-for-kickstart.patch
> index e7533f476..0e64ce420 100644
> --- a/meta-python/recipes-extended/python-pykickstart/files/0001-support-authentication-for-kickstart.patch
> +++ b/meta-python/recipes-extended/python-pykickstart/files/0001-support-authentication-for-kickstart.patch
> @@ -32,10 +32,10 @@ index bf08ac5..aada7aa 100644
>    And some warning classes:
>    
>        KickstartWarning - A generic warning class.
> -@@ -131,3 +134,17 @@ class KickstartDeprecationWarning(KickstartParseWarning, DeprecationWarning):
> +@@ -125,3 +128,17 @@ class KickstartDeprecationWarning(KickstartParseWarning, DeprecationWarning):
> +     """A class for warnings occurring during parsing related to using deprecated
>           commands and options.
>        """
> -     pass
>   +
>   +class KickstartAuthError(KickstartError):
>   +    """An exception for errors relating to authentication failed while
> @@ -43,7 +43,7 @@ index bf08ac5..aada7aa 100644
>   +    """
>   +    def __init__(self, msg):
>   +        """Create a new KickstartAuthError exception instance with the
> -+           descriptive message val.  val should be the return value of
> ++           descriptive message val. val should be the return value of
>   +           formatErrorMsg.
>   +        """
>   +        KickstartError.__init__(self, msg)
> @@ -125,7 +125,7 @@ diff --git a/pykickstart/parser.py b/pykickstart/parser.py
>   index d8880eb..22d14cb 100644
>   --- a/pykickstart/parser.py
>   +++ b/pykickstart/parser.py
> -@@ -787,7 +787,7 @@ class KickstartParser(object):
> +@@ -801,7 +801,7 @@ class KickstartParser(object):
>            i = PutBackIterator(s.splitlines(True) + [""])
>            self._stateMachine(i)
>    
> @@ -134,7 +134,7 @@ index d8880eb..22d14cb 100644
>            """Process a kickstart file, given by the filename f."""
>            if reset:
>                self._reset()
> -@@ -808,7 +808,7 @@ class KickstartParser(object):
> +@@ -822,7 +822,7 @@ class KickstartParser(object):
>            self.currentdir[self._includeDepth] = cd
>    
>            try:
> diff --git a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.22.bb b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.26.bb
> similarity index 94%
> rename from meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.22.bb
> rename to meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.26.bb
> index 041abd3e8..7aeb5d6c9 100644
> --- a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.22.bb
> +++ b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.26.bb
> @@ -18,7 +18,7 @@ SRC_URI = "git://github.com/rhinstaller/pykickstart.git;protocol=https;branch=ma
>              file://0003-comment-out-sections-shutdown-and-environment-in-gen.patch \
>              file://0004-load.py-retry-to-invoke-request-with-timeout.patch \
>              "
> -SRCREV = "674c17b1e231f56a0d8a5ced4a204cdbc4c1edf3"
> +SRCREV = "4c93e84c8798da511da1c05f1912d2f908f8f85f"
>   
>   UPSTREAM_CHECK_GITTAGREGEX = "r(?P<pver>\d+(\.\d+)+(-\d+)*)"
>   
>
> 

--------------A563EBDC741AFBB30FF8052B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/9/20 3:54 AM, kai wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200709075459.40502-1-kai.kang@windriver.com">
      <pre class="moz-quote-pre" wrap="">From: Kai Kang <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a>

Update python3-pykickstart from 3.22 to 3.26.

* Update context of 0001-support-authentication-for-kickstart.patch

Signed-off-by: Kai Kang <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200709075459.40502-1-kai.kang@windriver.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../0001-support-authentication-for-kickstart.patch    | 10 &#43;&#43;&#43;&#43;&#43;-----
 ...pykickstart_3.22.bb =&gt; python3-pykickstart_3.26.bb} |  2 &#43;-
 2 files changed, 6 insertions(&#43;), 6 deletions(-)
 rename meta-python/recipes-extended/python-pykickstart/{python3-pykickstart_3.22.bb =&gt; python3-pykickstart_3.26.bb} (94%)

diff --git a/meta-python/recipes-extended/python-pykickstart/files/0001-support-authentication-for-kickstart.patch b/meta-python/recipes-extended/python-pykickstart/files/0001-support-authentication-for-kickstart.patch
index e7533f476..0e64ce420 100644
--- a/meta-python/recipes-extended/python-pykickstart/files/0001-support-authentication-for-kickstart.patch
&#43;&#43;&#43; b/meta-python/recipes-extended/python-pykickstart/files/0001-support-authentication-for-kickstart.patch
@@ -32,10 &#43;32,10 @@ index bf08ac5..aada7aa 100644
  And some warning classes:
  
      KickstartWarning - A generic warning class.
-@@ -131,3 &#43;134,17 @@ class KickstartDeprecationWarning(KickstartParseWarning, DeprecationWarning):
&#43;@@ -125,3 &#43;128,17 @@ class KickstartDeprecationWarning(KickstartParseWarning, DeprecationWarning):
&#43;     &quot;&quot;&quot;A class for warnings occurring during parsing related to using deprecated
         commands and options.
      &quot;&quot;&quot;
-     pass
 &#43;
 &#43;class KickstartAuthError(KickstartError):
 &#43;    &quot;&quot;&quot;An exception for errors relating to authentication failed while
@@ -43,7 &#43;43,7 @@ index bf08ac5..aada7aa 100644
 &#43;    &quot;&quot;&quot;
 &#43;    def __init__(self, msg):
 &#43;        &quot;&quot;&quot;Create a new KickstartAuthError exception instance with the
-&#43;           descriptive message val.  val should be the return value of
&#43;&#43;           descriptive message val. val should be the return value of
 &#43;           formatErrorMsg.
 &#43;        &quot;&quot;&quot;
 &#43;        KickstartError.__init__(self, msg)
@@ -125,7 &#43;125,7 @@ diff --git a/pykickstart/parser.py b/pykickstart/parser.py
 index d8880eb..22d14cb 100644
 --- a/pykickstart/parser.py
 &#43;&#43;&#43; b/pykickstart/parser.py
-@@ -787,7 &#43;787,7 @@ class KickstartParser(object):
&#43;@@ -801,7 &#43;801,7 @@ class KickstartParser(object):
          i = PutBackIterator(s.splitlines(True) &#43; [&quot;<a class="moz-txt-link-rfc2396E" href="mailto:])self._stateMachine(i)@@-134,7&#43;134,7@@indexd8880eb..22d14cb100644">&quot;])
          self._stateMachine(i)
  
@@ -134,7 &#43;134,7 @@ index d8880eb..22d14cb 100644
          &quot;</a>&quot;&quot;Process a kickstart file, given by the filename f.&quot;&quot;&quot;
          if reset:
              self._reset()
-@@ -808,7 &#43;808,7 @@ class KickstartParser(object):
&#43;@@ -822,7 &#43;822,7 @@ class KickstartParser(object):
          self.currentdir[self._includeDepth] = cd
  
          try:
diff --git a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.22.bb b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.26.bb
similarity index 94%
rename from meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.22.bb
rename to meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.26.bb
index 041abd3e8..7aeb5d6c9 100644
--- a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.22.bb
&#43;&#43;&#43; b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.26.bb
@@ -18,7 &#43;18,7 @@ SRC_URI = &quot;git://github.com/rhinstaller/pykickstart.git;protocol=https;branch=ma
            <a class="moz-txt-link-freetext" href="file://0003-comment-out-sections-shutdown-and-environment-in-gen.patch">file://0003-comment-out-sections-shutdown-and-environment-in-gen.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0004-load.py-retry-to-invoke-request-with-timeout.patch">file://0004-load.py-retry-to-invoke-request-with-timeout.patch</a> \
            &quot;
-SRCREV = &quot;674c17b1e231f56a0d8a5ced4a204cdbc4c1edf3&quot;
&#43;SRCREV = &quot;4c93e84c8798da511da1c05f1912d2f908f8f85f&quot;
 
 UPSTREAM_CHECK_GITTAGREGEX = &quot;r(?P&lt;pver&gt;\d&#43;(\.\d&#43;)&#43;(-\d&#43;)*)&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------A563EBDC741AFBB30FF8052B--
