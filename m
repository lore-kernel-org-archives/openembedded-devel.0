Received: from NAM04-DM6-obe.outbound.protection.outlook.com (NAM04-DM6-obe.outbound.protection.outlook.com [40.107.102.59])
 by mx.groups.io with SMTP id smtpd.web10.5609.1599332614586874722
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Sep 2020 12:03:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Y9yAYhf3;
 spf=pass (domain: windriver.com, ip: 40.107.102.59, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OSstX07tPEM0lOL8jDUfNKFaMxJ//FWzUGDeThHuoW4z7u9rSY7kKp75FGnUuGW7BJ7/MVMswSYiKIn1x6Of84b6SK64G6J2vVsDUtam5fx47szyXrods9kC+H0XfYoiNS9pf6QCNtJ7t9fpiZO83aAef9yZlmn/YUe1dkQaNYFMvKGsmm4Om/Az7ZOe4DApfjv5kJCA9q9woZX41B28twYmsvdFOMI91XLYtBNRjFxbNWGWifedMkt8rZ+C2WvqtbTwg9sH0wtM9pUPVmcUjA2EV+gDf7cnh/2KL8BlOB200L+WKGcwm6oeaRHojF9clQfPNOa//E0/aP3OqWMjjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qm5kA2T52PTNBIJTw8Oy/tStrC/1pSxB1DxHtQSbpI8=;
 b=WtM0rVqzhnv/0hg5gmf4crJuP1K6jBpLbML0WeiNr1t+0rZTDw1hQxH89viyWs5Mqxsdrb19DKFGQIAKi2HapdVarVKoyDP1KK/D52b4uw6Mu9lda6RL38kbRylLk3ijEtM5YTvlUx4FNJXmGgf/gZSl55DI16cRBAB5nKquNj3YnEJ6eR3jBgKEJ5psEJh7NyEOhT01Oi22TdY4ttJuhIK5Pfqdjm7qZWqXlCYTV86z4mW7Ee+CVpY717XgWn8iNg8uZYPzmE7RAgf2RxdwQtWoKjC9Rt4DGDj9RFpeQ54VNNTH33RRbbzFBsBeWSLJMuQz2DzKN7fe5u3jfSxugQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qm5kA2T52PTNBIJTw8Oy/tStrC/1pSxB1DxHtQSbpI8=;
 b=Y9yAYhf3OIcqsbBbfr173QQQQuuk5N0am1Jev4mo8f9EoUrfaNuRt9NTFVLzFRSRE1O14M/4sHq4SAJutTS6GZIJyS1/2qNpVjGXYEcX5vlUrGLo0xxMb9GP4UQoTYt97Q059HP7S+ri4czVdDMmmawaT3DAS/OQLnTQIb3iQwY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2952.namprd11.prod.outlook.com (2603:10b6:a03:82::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Sat, 5 Sep
 2020 19:03:33 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3348.015; Sat, 5 Sep 2020
 19:03:33 +0000
Subject: Re: [oe] [meta-python][PATCH 7/7] python3-gevent: Upgrade 1.4.0 -> 20.6.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200902112808.18547-1-leon.anavi@konsulko.com>
 <20200902112808.18547-7-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <d011af8f-7348-ece8-8d36-dbd4701ad9b7@windriver.com>
Date: Sat, 5 Sep 2020 15:03:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200902112808.18547-7-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTBPR01CA0019.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::32) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTBPR01CA0019.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16 via Frontend Transport; Sat, 5 Sep 2020 19:03:32 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45d6a72d-36a8-4192-25c6-08d851ce628a
X-MS-TrafficTypeDiagnostic: BYAPR11MB2952:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2952B1C9D1943D8A9BC904659F2A0@BYAPR11MB2952.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+0WfhCBEOphvVZThnQ+No15eECN1xtbv8aCaoEaj5cMEDGfMDXMXEUbnkJ6u1zb1CAfMX3Jryjk/7fIiVubJfIXqfkkUui22ybhSq+YkALFC/nw2e1Oton/Sc7vdZbn7o+QzUVM0nmOMuMLf1ZSSWPpjTdnaZlYSFHq+NgCBW44TiSgusG+mdrPxcc5b5dJoJqjrZLtSQbOBwymmBHMGW0qtNUAJ83CYWKs8kzCQ4KjZdAKgU1l0m+kHK12bT9SVE9lRvPjT2B9WrwOTEluQqLLKx7SvbABEN/+VJLaHmrtnKWt40uHx75iz5fzHVE/KUmxVi630bQWRvOsySdIS/NmDiopdu9pV4cf+mlVWoATa2BPPPHYasvUh8Ef5ou5AtSknWwj99/CSs/tkgTCVxsMuf6bfk/y+4AqGYMH4s+ABEEUYAX+eSvLk9R9Xqp2f7gz1mtcZ6VlvRvV44Ea51w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(39840400004)(376002)(346002)(396003)(53546011)(66556008)(66946007)(8936002)(16526019)(26005)(186003)(166002)(8676002)(16576012)(83380400001)(316002)(31686004)(36756003)(86362001)(33964004)(31696002)(2616005)(5660300002)(2906002)(966005)(66476007)(44832011)(52116002)(478600001)(956004)(6486002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	zPISib3GTUTtNNevSaBZu4KBDmT5DT/klfDgtW4sFdl7JbzYhJqVFS2qrCFC1dAbHZ2NKUtgPvEoEZVXLM9J5LiO71Zy2qTlovd+n0FcYCf0GyrUjKnoBDkWQQNKVJ2+oDIx5+3QZCbyLoL8NJZVwyU+JTnrQh8M1zRY8qke4/IUScIFKCQjI0JMXphniqfsafpiLEKuWHEg5vtTNoz764fVeFV19K42AQDdsCVzhqID6QCTXoNHab02CGq9BoaWJpSJMAsGkEMaYNFnPlMlldBpKpYzXnSH/Nort+fV4T74iQH/XcGFKL8+LcsM9sCXFgp3ZE6LKzULbjCeQReOx3Irshr00Q8WSvFRHENBFxn2PJWYVMVt6j8Ius9fe4otkMVzjVcbaUhjHYxk7HLP0CJiIwDPGJeJj0xllmUFW5nE/T+BYhjKFxequEaMSBmqPAe+OUMecvDw2qjRHoGuWSe1zVCyFSnae2gPyupGZlpOaXV7zQuvArm3QH2JNAkHEtA815Oj77HD47Bm0Y5yFV0pSrCMiJ3/InTt2Su1sdLSxxUHTvIMDQZ1Pt3rlKbVl4NcvxGaf9CVsTW+C+ZyKEcLwjr02BZaBREcM5cgwaVoGR0lS7UZZIZKFEIloJEydpVk5TixbdxyeQNkgh8F4g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45d6a72d-36a8-4192-25c6-08d851ce628a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2020 19:03:33.3007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m/zHLX4jhTQlyymlApIVXag9I0bJoYsns0xYjekzXHKgdjFajWAB0iBXj0Oj56YxOkAHoeFrr/NlCewtmKV/82+J8ta20PFUB1khsi6sDWg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2952
Content-Type: multipart/alternative;
 boundary="------------5394AE6334E00B18300C4D8A"
Content-Language: en-US

--------------5394AE6334E00B18300C4D8A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/2/20 7:28 AM, Leon Anavi wrote:
> Upgrade to release 20.6.2:
>
> - It is now possible to build and use the embedded libuv on a
>    Cygwin platform.
> - Bug fix: relax the version constraint for psutil on PyPy.
> - The include directories used to compile the C extensions have
>    been tweaked with the intent of making it easier to use older
>    debug versions of Python.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...etup.py-do-not-query-for-include-dir.patch | 26 -------------------
>   ...vent_1.4.0.bb => python3-gevent_20.6.2.bb} |  5 ++--
>   2 files changed, 2 insertions(+), 29 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-gevent/0002-setup.py-do-not-query-for-include-dir.patch
>   rename meta-python/recipes-devtools/python/{python3-gevent_1.4.0.bb => python3-gevent_20.6.2.bb} (85%)
>
> diff --git a/meta-python/recipes-devtools/python/python-gevent/0002-setup.py-do-not-query-for-include-dir.patch b/meta-python/recipes-devtools/python/python-gevent/0002-setup.py-do-not-query-for-include-dir.patch
> deleted file mode 100644
> index 7536b71a6..000000000
> --- a/meta-python/recipes-devtools/python/python-gevent/0002-setup.py-do-not-query-for-include-dir.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -From a53ed6b2f967a5f95e69d51cad3f8c120d7df65b Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex.kanavin@gmail.com>
> -Date: Thu, 7 Feb 2019 15:21:15 +0100
> -Subject: [PATCH] setup.py: do not query for include dir
> -
> -As this will return the native python directory erroneously.
> -
> -Upstream-Status: Inappropriate [oe-core specific]
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ----
> - setup.py | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/setup.py b/setup.py
> -index 86d6c5a..5d22291 100755
> ---- a/setup.py
> -+++ b/setup.py
> -@@ -52,7 +52,7 @@ from _setupares import ARES
> - # Get access to the greenlet header file.
> - # The sysconfig dir is not enough if we're in a virtualenv
> - # See https://github.com/pypa/pip/issues/4610
> --include_dirs = [sysconfig.get_path("include")]
> -+include_dirs = []
> - venv_include_dir = os.path.join(sys.prefix, 'include', 'site',
> -                                 'python' + sysconfig.get_python_version())
> - venv_include_dir = os.path.abspath(venv_include_dir)
> diff --git a/meta-python/recipes-devtools/python/python3-gevent_1.4.0.bb b/meta-python/recipes-devtools/python/python3-gevent_20.6.2.bb
> similarity index 85%
> rename from meta-python/recipes-devtools/python/python3-gevent_1.4.0.bb
> rename to meta-python/recipes-devtools/python/python3-gevent_20.6.2.bb
> index e42980d38..dbeb3a60c 100644
> --- a/meta-python/recipes-devtools/python/python3-gevent_1.4.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-gevent_20.6.2.bb
> @@ -18,11 +18,10 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/python-gevent:"
>   
>   SRC_URI_append = " \
>       file://libev-conf.patch;patch=1;pnum=1 \
> -    file://0002-setup.py-do-not-query-for-include-dir.patch \
>   "
>   
> -SRC_URI[md5sum] = "6b9dd98917061803d9158e5258b8f412"
> -SRC_URI[sha256sum] = "1eb7fa3b9bd9174dfe9c3b59b7a09b768ecd496debfc4976a9530a3e15c990d1"
> +SRC_URI[md5sum] = "27b07fe9fdfff2d75e3d140e890489b1"
> +SRC_URI[sha256sum] = "a23c2abf08e851c988723f6a2996d495f513a2c0dc70f9956af03af8debdb5d1"
>   
>   # The python-gevent has no autoreconf ability
>   # and the logic for detecting a cross compile is flawed
>
> 

--------------5394AE6334E00B18300C4D8A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/2/20 7:28 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200902112808.18547-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 20.6.2:

- It is now possible to build and use the embedded libuv on a
  Cygwin platform.
- Bug fix: relax the version constraint for psutil on PyPy.
- The include directories used to compile the C extensions have
  been tweaked with the intent of making it easier to use older
  debug versions of Python.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200902112808.18547-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...etup.py-do-not-query-for-include-dir.patch | 26 -------------------
 ...vent_1.4.0.bb =&gt; python3-gevent_20.6.2.bb} |  5 ++--
 2 files changed, 2 insertions(+), 29 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-gevent/0002-setup.py-do-not-query-for-include-dir.patch
 rename meta-python/recipes-devtools/python/{python3-gevent_1.4.0.bb =&gt; python3-gevent_20.6.2.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python-gevent/0002-setup.py-do-not-query-for-include-dir.patch b/meta-python/recipes-devtools/python/python-gevent/0002-setup.py-do-not-query-for-include-dir.patch
deleted file mode 100644
index 7536b71a6..000000000
--- a/meta-python/recipes-devtools/python/python-gevent/0002-setup.py-do-not-query-for-include-dir.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From a53ed6b2f967a5f95e69d51cad3f8c120d7df65b Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <a class="moz-txt-link-rfc2396E" href="mailto:alex.kanavin@gmail.com">&lt;alex.kanavin@gmail.com&gt;</a>
-Date: Thu, 7 Feb 2019 15:21:15 +0100
-Subject: [PATCH] setup.py: do not query for include dir
-
-As this will return the native python directory erroneously.
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <a class="moz-txt-link-rfc2396E" href="mailto:alex.kanavin@gmail.com">&lt;alex.kanavin@gmail.com&gt;</a>
----
- setup.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/setup.py b/setup.py
-index 86d6c5a..5d22291 100755
---- a/setup.py
-+++ b/setup.py
-@@ -52,7 +52,7 @@ from _setupares import ARES
- # Get access to the greenlet header file.
- # The sysconfig dir is not enough if we're in a virtualenv
- # See <a class="moz-txt-link-freetext" href="https://github.com/pypa/pip/issues/4610">https://github.com/pypa/pip/issues/4610</a>
--include_dirs = [sysconfig.get_path(&quot;include&quot;)]
-+include_dirs = []
- venv_include_dir = os.path.join(sys.prefix, 'include', 'site',
-                                 'python' + sysconfig.get_python_version())
- venv_include_dir = os.path.abspath(venv_include_dir)
diff --git a/meta-python/recipes-devtools/python/python3-gevent_1.4.0.bb b/meta-python/recipes-devtools/python/python3-gevent_20.6.2.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-gevent_1.4.0.bb
rename to meta-python/recipes-devtools/python/python3-gevent_20.6.2.bb
index e42980d38..dbeb3a60c 100644
--- a/meta-python/recipes-devtools/python/python3-gevent_1.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gevent_20.6.2.bb
@@ -18,11 +18,10 @@ FILESEXTRAPATHS_prepend := &quot;${THISDIR}/python-gevent:&quot;
 
 SRC_URI_append = &quot; \
     <a class="moz-txt-link-freetext" href="file://libev-conf.patch;patch=1;pnum=1">file://libev-conf.patch;patch=1;pnum=1</a> \
-    <a class="moz-txt-link-freetext" href="file://0002-setup.py-do-not-query-for-include-dir.patch">file://0002-setup.py-do-not-query-for-include-dir.patch</a> \
 &quot;
 
-SRC_URI[md5sum] = &quot;6b9dd98917061803d9158e5258b8f412&quot;
-SRC_URI[sha256sum] = &quot;1eb7fa3b9bd9174dfe9c3b59b7a09b768ecd496debfc4976a9530a3e15c990d1&quot;
+SRC_URI[md5sum] = &quot;27b07fe9fdfff2d75e3d140e890489b1&quot;
+SRC_URI[sha256sum] = &quot;a23c2abf08e851c988723f6a2996d495f513a2c0dc70f9956af03af8debdb5d1&quot;
 
 # The python-gevent has no autoreconf ability
 # and the logic for detecting a cross compile is flawed
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------5394AE6334E00B18300C4D8A--
