Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.58])
 by mx.groups.io with SMTP id smtpd.web12.33827.1612186491432147576
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Feb 2021 05:34:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=YhK6Wnh0;
 spf=pass (domain: windriver.com, ip: 40.107.75.58, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eLZ0J9KttDxqzRHyd11PKbD3tpLLpiabnxRYwEINrvoWRZDRKd5gqNEifM17yiMQ7dNbRVEvG501ARcbXOWwCTtsim3cPtmHPTxkKnVXebQwKDOwMWTjq0KvzmZ7ISm7bcezMV2TRKm8zSi65Ge5TQ6xutuR5BaG7mhw/8PSNaSwdm8HLwMfBU7odnS3OoJP4R2mG9ZJcwGtY7wFFa8A/up9bHQDUzWiU10aFFr/atj0T3NRDcpsBc8+EsYixBCQwBMgWA7rPBbiiFqUj3DQOLqC4rGmaqKGKf6BkjZ5tcjjYh6Le8REAHhhLszRhmHk4E6CUampfTvf2YUz0dH2ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dm0j7aT/+u2qibyxsIHTHrPMGN4MWJRjr/mEscTMOmM=;
 b=DFOIsRRjVoCGF9SNh2C11eAC0Shgn1BDZ9YBEm43Tdm4qglkT/OKkrFmwXgcJmuSbF1eWaK/I3ef4I8DUaDeigr9ezxxzKlxmyyeODYAH13QF+r1UAg67B55klhOquy3bOOdaLOkLbxDFxzngqJW2TNUmfwbExnb4u23f7xmFmvQayo3pnYnpLAyLmFcka+37MdvNmiwlcKbPmBNxpdpoduDjFngMGS2A0rBAttFvAuJlHqKnoPyuaHb/ehB/esGDFFCVGKVi8ViUKUT/7NvFWdBeUjToztgmBsMmGMFXGpkMpcMEK6qdLW6ObpL/ZMHS+NVuck1n4ojDFRKV+gSUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dm0j7aT/+u2qibyxsIHTHrPMGN4MWJRjr/mEscTMOmM=;
 b=YhK6Wnh0xMShfu9jogiRuu+C8JVlGAIpHX+i7rvAcARt+8vWbrAB2lL42iLfjoZ0eEHX3dVmS7mNdog0BvuMkPzGsDc/QhtUjQi3T5MlER7n9gZDsZZ9OfYl7iTWom8Ht0XAHx+Oglh27VTzynGoZeUhBHwPYYIEdg6iGlTAgME=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4308.namprd11.prod.outlook.com (2603:10b6:a03:1b9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Mon, 1 Feb
 2021 13:34:48 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3805.024; Mon, 1 Feb 2021
 13:34:48 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-h5py: improve reproducibility
To: "Yu, Mingli" <mingli.yu@windriver.com>,
 openembedded-devel@lists.openembedded.org
References: <20210129030449.21879-1-mingli.yu@windriver.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <e790f656-7b6c-f84c-58e4-afbdf066926c@windriver.com>
Date: Mon, 1 Feb 2021 08:34:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210129030449.21879-1-mingli.yu@windriver.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN6PR1101CA0014.namprd11.prod.outlook.com
 (2603:10b6:405:4a::24) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN6PR1101CA0014.namprd11.prod.outlook.com (2603:10b6:405:4a::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend Transport; Mon, 1 Feb 2021 13:34:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e77ed606-7e51-4201-5212-08d8c6b62536
X-MS-TrafficTypeDiagnostic: BY5PR11MB4308:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB43082B1C00E4E4ABD2650FEA9FB69@BY5PR11MB4308.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vFv5/FwtP4itewV5AL1TYV7+zSaE02EI+lte5N+Lze9A2egSC4E1wD4fasywaRMdXyoS36dPDR8NPt6ZvGUk0iUN6DfGXQJ8DknzwqvQkEtM8rmHEVF0NR8EYdCSUSsH9qPRNGsRYY6Y2hmtGiHoEYnmjp/wZvE+YsA+buGa25xxB4JLIQWEq/iL4dnJ7BbQJRq/ZChXWxw6+8dh5+0NQUBi+xon76RPR+a803U/mOUv7n3SV/foPWPAcZMNKLaQjhQqigoXMWKzPJHM0qDD7t3lf1NhxxnckM9lNe79M449qlbBB+211KSBP+CD1gkkM73snxsgp8SVm1J4R805vsQzoQoppphMneuzxOlrhKS8/gYsqpLfTvtnCTJWeOVusmwTWG7M471XriW9kfrPdSoRBE3BRydhUOQQ4nPmJj0f3SPG+dZaf1aEzrM6CQtnQ6eFNHlLNrZLwPzzAvvphQZjAu9kMykOm3N9BsSGuqaZJyh0kOJns0H/RYu7jmSGqcVniC1d7Ab9cdXt8K5iudYzp1hsfDi9/nojpN/79JuPpP8WTfOPL3OBJvWNEc+9MdlLmhNJWJlmFm0jNlo68nu1L1I129aeSGW7/H4YA4NCzYz/FUa+9a+iBR3a/wmV6mNbQDMh9QwblCxb3o5gAaW92roi1HNu4Nvw0rerYGImOc97Qz4/tEjfHrGvHU5W
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(136003)(376002)(396003)(366004)(5660300002)(316002)(478600001)(26005)(966005)(8936002)(53546011)(956004)(2616005)(186003)(44832011)(16526019)(166002)(86362001)(52116002)(2906002)(16576012)(66946007)(83380400001)(66556008)(66476007)(31686004)(6486002)(33964004)(31696002)(36756003)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?ODdaTlErL3B5Y2tqODVnSzk5MnAyUmIwWWx1WUdicUsrMkpwMU9zUThGcExL?=
 =?utf-8?B?QmVuMlBRbWRITTRDb1E0b0RNMDQwWFJCVHFLbDJWRW1QV0R0Z1NsVzdaWTJm?=
 =?utf-8?B?V2ZWc3haQkhoSnByNjdVdGE3Ym9zOVVsc0E3cCt6YmtRSDZsQjRtdXZpckg3?=
 =?utf-8?B?K254aWpkRlFzOFJVWFBkTXJzaFFsTzRQbEVmMlpvVVNJMnZmbWlvWHJ0ZDVm?=
 =?utf-8?B?Wm5GZWV1VnhJejcwOGlkalhkSXRJcDVnOXFJZTgvT25oR2JPL0lndlArWlFi?=
 =?utf-8?B?K3FzeFRLRWZzd08vTHhWTTc3eGQxVld2ZWZON2xCU1RkcjlxemJSUUtnT2tE?=
 =?utf-8?B?RGViL0RxNU1lalIxQkhsSVZ4QURzSm5EYTBiZDJFcHJ0SkxFNmd2VkNockdQ?=
 =?utf-8?B?RjQ0N0dLQmozRFhmUVkycjRraWNxaUU1ejZ4aHNvL1NNVUdpd0FhUVNZK1Yx?=
 =?utf-8?B?SUlUaFd6R0hRMC9FbUJMOCt0ZGVKM01ubi9kc0Y0b0xibTdvOHJkMTdaNjlF?=
 =?utf-8?B?NnFSQlE5cWorWWZrc0dXWFd4dFdITnZJWkk4dUpwNDU1eGIzOUtIdkdHU0U1?=
 =?utf-8?B?cjA3SGRpNFpOcDhiUFovUE1HRkxwT3oxaVM4RFoxWThxcWlXZEc3bWg0V2xW?=
 =?utf-8?B?S0w2TDlBWnJJRGxIY1pYVHVJLzlrL2lJa0Vyc3E3d2lYMkhvMjY1aXJibTYz?=
 =?utf-8?B?a2ZPWU9qUkN5emJ0RnVubWdlQ0RJMk5hYVJtMlJVSjNqRVVLalBnSEd0V01M?=
 =?utf-8?B?QXA1NDlPVDFLTWNGMzZhazlQR3diaHMxU2NWcXRnTDl1VW9tN05WTnVzRk5w?=
 =?utf-8?B?UE5yVlRud0RYVWF4N29ZbjdQWmVBTElndGhlbEs3SnZlS2c3ZWhNQzlIVWJU?=
 =?utf-8?B?Q3h4QmJ0R3oyOWNyNGxpSnphYkoyQ082Z1FjdS9zbjlobzFBeGY4VDJZRC9D?=
 =?utf-8?B?UzZCQkQvQi9iallNTVV2QThaQk5RUmNpYmk0d1M0bU5OSjh0cnB1WFViL3Q2?=
 =?utf-8?B?QkJhNG52U0NORGRyMXpKRFM3b1M4cWxqZU1Pak1URHRuaFFJbk4rRVIxTzRr?=
 =?utf-8?B?TFMyd0U5T1Rmc0NBSENHTDloUHRTQzJKa2dpVUoyY3l6SHdNaGJESk9QNEEx?=
 =?utf-8?B?a2I3MDBveHB0SzFRNkJXaG5wOHllc1czQ014bGE1VnhzbDBkb2FvMVRabklV?=
 =?utf-8?B?QkIxVXd2d3lXSnh1SXJER2tDbm12VE9XbEJFSDZUeUIwS29rcDlNWkQvY1A2?=
 =?utf-8?B?OWZSaGsxUVN3dFE0UDNxS2hHOUlUajhRY2JaOEN4bHJkVVhHTXJPKzZFZWgv?=
 =?utf-8?B?K3RVR3N4YTdSYmhDZC9mVDkwZ3BEdVFFTnJMeVZBZmpvc3JmNUFMSGVxbC9j?=
 =?utf-8?B?RUdlOFgxZmNoMlN0Q084VWhXbFdhRHZwQkJqaVpLd1YvbGtTM3luU2xzVk9a?=
 =?utf-8?B?U0N5RWJiRk92VDFFOFdCSkJDdGFuRThwV0JnWFlRPT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e77ed606-7e51-4201-5212-08d8c6b62536
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2021 13:34:48.6078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J84eS65F8jf1aT0azFCNSKmEpHXr4iNUr8/XHh7LQuMUa1+4GItnPkVA2ZkhWhxOxH7ama14oJKco4QU/S4HiJ2Ibs2YqCpJdx8aHTqF0+k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4308
Content-Type: multipart/alternative;
 boundary="------------B01BDE600194AEA2007447B3"
Content-Language: en-US

--------------B01BDE600194AEA2007447B3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-28 10:04 p.m., Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
>
> Prevent absolute path from ending up in the egg-info SOURCES.txt.
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...1-setup_build.py-avoid-absolute-path.patch | 30 +++++++++++++++++++
>   .../python/python3-h5py_2.10.0.bb             |  1 +
>   2 files changed, 31 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-h5py/0001-setup_build.py-avoid-absolute-path.patch
>
> diff --git a/meta-python/recipes-devtools/python/python3-h5py/0001-setup_build.py-avoid-absolute-path.patch b/meta-python/recipes-devtools/python/python3-h5py/0001-setup_build.py-avoid-absolute-path.patch
> new file mode 100644
> index 000000000..da95ee7af
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-h5py/0001-setup_build.py-avoid-absolute-path.patch
> @@ -0,0 +1,30 @@
> +From b5d5a7efc7aaa2be830731001ed17c5b71bcefb1 Mon Sep 17 00:00:00 2001
> +From: Mingli Yu <mingli.yu@windriver.com>
> +Date: Fri, 29 Jan 2021 02:33:06 +0000
> +Subject: [PATCH] setup_build.py: avoid absolute path
> +
> +Prevent absolute path from ending up in the egg-info SOURCES.txt.
> +
> +Upstream-Status: Submitted [https://github.com/h5py/h5py/pull/1803]
> +
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + setup_build.py | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/setup_build.py b/setup_build.py
> +index ffd3bef..fb196c0 100644
> +--- a/setup_build.py
> ++++ b/setup_build.py
> +@@ -20,7 +20,7 @@ import api_gen
> +
> +
> + def localpath(*args):
> +-    return op.abspath(op.join(op.dirname(__file__), *args))
> ++    return op.join(*args)
> +
> +
> + MODULES =  ['defs','_errors','_objects','_proxy', 'h5fd', 'h5z',
> +--
> +2.29.2
> +
> diff --git a/meta-python/recipes-devtools/python/python3-h5py_2.10.0.bb b/meta-python/recipes-devtools/python/python3-h5py_2.10.0.bb
> index 3904abbb4..b812b323f 100644
> --- a/meta-python/recipes-devtools/python/python3-h5py_2.10.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-h5py_2.10.0.bb
> @@ -9,6 +9,7 @@ SRC_URI[sha256sum] = "84412798925dc870ffd7107f045d7659e60f5d46d1c70c700375248bf6
>   
>   SRC_URI_append = " \
>              file://0001-cross-compiling-support.patch \
> +           file://0001-setup_build.py-avoid-absolute-path.patch \
>             "
>   
>   inherit pypi setuptools3
>
> 
>

--------------B01BDE600194AEA2007447B3
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-28 10:04 p.m., Yu, Mingli
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210129030449.21879-1-mingli.yu@windriver.com">
      <pre class="moz-quote-pre" wrap="">From: Mingli Yu <a class="moz-txt-link-rfc2396E" href="mailto:mingli.yu@windriver.com">&lt;mingli.yu@windriver.com&gt;</a>

Prevent absolute path from ending up in the egg-info SOURCES.txt.

Signed-off-by: Mingli Yu <a class="moz-txt-link-rfc2396E" href="mailto:mingli.yu@windriver.com">&lt;mingli.yu@windriver.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210129030449.21879-1-mingli.yu@windriver.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...1-setup_build.py-avoid-absolute-path.patch | 30 +++++++++++++++++++
 .../python/python3-h5py_2.10.0.bb             |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-h5py/0001-setup_build.py-avoid-absolute-path.patch

diff --git a/meta-python/recipes-devtools/python/python3-h5py/0001-setup_build.py-avoid-absolute-path.patch b/meta-python/recipes-devtools/python/python3-h5py/0001-setup_build.py-avoid-absolute-path.patch
new file mode 100644
index 000000000..da95ee7af
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-h5py/0001-setup_build.py-avoid-absolute-path.patch
@@ -0,0 +1,30 @@
+From b5d5a7efc7aaa2be830731001ed17c5b71bcefb1 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <a class="moz-txt-link-rfc2396E" href="mailto:mingli.yu@windriver.com">&lt;mingli.yu@windriver.com&gt;</a>
+Date: Fri, 29 Jan 2021 02:33:06 +0000
+Subject: [PATCH] setup_build.py: avoid absolute path
+
+Prevent absolute path from ending up in the egg-info SOURCES.txt.
+
+Upstream-Status: Submitted [<a class="moz-txt-link-freetext" href="https://github.com/h5py/h5py/pull/1803">https://github.com/h5py/h5py/pull/1803</a>]
+
+Signed-off-by: Mingli Yu <a class="moz-txt-link-rfc2396E" href="mailto:mingli.yu@windriver.com">&lt;mingli.yu@windriver.com&gt;</a>
+---
+ setup_build.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/setup_build.py b/setup_build.py
+index ffd3bef..fb196c0 100644
+--- a/setup_build.py
++++ b/setup_build.py
+@@ -20,7 +20,7 @@ import api_gen
+ 
+ 
+ def localpath(*args):
+-    return op.abspath(op.join(op.dirname(__file__), *args))
++    return op.join(*args)
+ 
+ 
+ MODULES =  ['defs','_errors','_objects','_proxy', 'h5fd', 'h5z',
+-- 
+2.29.2
+
diff --git a/meta-python/recipes-devtools/python/python3-h5py_2.10.0.bb b/meta-python/recipes-devtools/python/python3-h5py_2.10.0.bb
index 3904abbb4..b812b323f 100644
--- a/meta-python/recipes-devtools/python/python3-h5py_2.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-h5py_2.10.0.bb
@@ -9,6 +9,7 @@ SRC_URI[sha256sum] = &quot;84412798925dc870ffd7107f045d7659e60f5d46d1c70c700375248bf6
 
 SRC_URI_append = &quot; \
            <a class="moz-txt-link-freetext" href="file://0001-cross-compiling-support.patch">file://0001-cross-compiling-support.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://0001-setup_build.py-avoid-absolute-path.patch">file://0001-setup_build.py-avoid-absolute-path.patch</a> \
           &quot;
 
 inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------B01BDE600194AEA2007447B3--
