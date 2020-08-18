Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.84])
 by mx.groups.io with SMTP id smtpd.web12.66470.1597759642695199418
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2020 07:07:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ZbEPt+4Y;
 spf=pass (domain: windriver.com, ip: 40.107.243.84, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NNQ/mfCeUzDADh6IyG1h6e1HtdFIsoAm+dZDa9DFtqCtrpd+aakd+yNpjeEP9rAHPtHdtNdJ73a+3mVXURMFp+P/NjyKIdtO/cXda47FEEpJ1BYR6ckDpNyx7P2NkO6txU+e4nsYNNsHnjjEEMjgbUbbzj2gbDG1zjkQZCga64UE8qSfPLPs9NVkLm1zKIQxS8GNvbfgqSrkL8eVzOy7yGCNOPLU6ssxP2HJNT+25ULxQ7Dn2luehhlWqAvQurHFSDqgmudCp6GTJukLX1qDSHXlGHfQaj0yqHmDlYocbiauIHpEmo4i2716/jGnFHEve78fRj+61CUAtdK5g05GgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7wmVjRTPfY3AubNzgJWPPyJZmdzs3ykLWrYcPwBEvSU=;
 b=H/z2zWO3EG02vGATdCzAkJSxHx+Yfftv5oTrf1T+vTEldCHlN79S0euFgE0xuq68a8VDI+1smWx/38FSlS/kU2LVidppcwVtsO5eGMgz1JN9it3tkbT+V5ScBtYCzf9CqaWYOVDtXJohcOReTqKAwE0l5+Octzl+ojMUyeAQGg7gTRVLSZGOJ/BirGJ8VtlKloNknBC8xcMo9Mvb0EK5yw37Xcat6+yjgr23r0vQki8u+sALGzyBC7Glr42oScJJAzyPMIiMDFEP1mEKCIjFJznP3ajjKaSuzuLAMKv6JLIbPJqw5/i5f0s1ISFMyfg9GJ5wWi955w8GvC1aCf9T0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7wmVjRTPfY3AubNzgJWPPyJZmdzs3ykLWrYcPwBEvSU=;
 b=ZbEPt+4YfToYClXG2eW66TMD4gvskNX7MH6VPQYI07cLhwbtZS/nrpyeN9iw8tRHPi1P9KjMcU3dG5SM15vIOg1cO0fJD6ocvCi0ivmfAQx2XA/wC+PUlxeOxCBB/EICQaU1Hj04dFx23+u+FRRAIHMzNuvGfMAyu2k3nyxWXAM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3398.namprd11.prod.outlook.com (2603:10b6:a03:19::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Tue, 18 Aug
 2020 14:07:21 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3283.028; Tue, 18 Aug 2020
 14:07:21 +0000
Subject: Re: [oe] [meta-python][PATCH 07/10] python3-cmd2: Upgrade 1.3.2 -> 1.3.3
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200817112901.28914-1-leon.anavi@konsulko.com>
 <20200817112901.28914-7-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <1c60c6c6-1e40-a997-70f6-024b776f9e61@windriver.com>
Date: Tue, 18 Aug 2020 10:07:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200817112901.28914-7-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTBPR01CA0014.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::27) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTBPR01CA0014.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend Transport; Tue, 18 Aug 2020 14:07:20 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b9e425e9-9445-448c-d0d3-08d843800629
X-MS-TrafficTypeDiagnostic: BYAPR11MB3398:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB339817BC8DDB87836BF2B72C9F5C0@BYAPR11MB3398.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/qPkVdNiLa+j7MuTNMxzC4x9DiHE5qyzm8cfog1stNy1fajcznlCpv4PgyHyHI0cfbzGJVCiJqMd8JsEUlgOtdEbr/FHUIBEEH581PXjUiyi1AvLdZLimeg018jMOtcNkO5vcL6AOWbgmrnS8u/2u0+F8ai5wUTwOCE39osy9ACGFH6aWJZ5bHvFhCN1YwhOSAIsah63NGjbeR+pSzZ5YvLyGf9rRmfb0FCOFFbTa6w1gaSnebUYxceFPaTaSnQvR+s+7+muYQYSfVG7C5DLS1prnj0LD9S4DQ9D0yVy0HCslueT19yG/5Tn4MNIGxnHmQQPQUcVt5l2kAp0Ppbbce2A9mCjA0P/mvCxuFdJcEFUgRtgc2/LR3PA2eCXNBroMsIfLRlTadlQk4NpLzmxxx+VA1ON8gwuAn4nxKa6ryTrEqCcN5S3LP0kK412zDo4/L5RksRhvXU9MMXoe/6aMQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(396003)(366004)(39850400004)(346002)(136003)(166002)(966005)(36756003)(31686004)(478600001)(956004)(2616005)(16576012)(6486002)(2906002)(66946007)(66556008)(44832011)(66476007)(19627235002)(316002)(5660300002)(53546011)(26005)(52116002)(31696002)(16526019)(86362001)(8676002)(8936002)(83380400001)(33964004)(186003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	NXDpm+2AyPXHSIpbjY4E+s5koIbmqTR/idu8nrhBmrgZTdLXuto8rGKg4HgIm8YUkj+gQ17+wwIEdBVZsc7ZylrAHg3Vhu9ASy6yCiWbyMvnUWBags3IbnMRGLUSt6plRGwB7mZAEPU2kHBmY/Jb9QdMogEkd2DsQw0tppXk2TAClgLz+m2mG2IHI81T4vBV39jivwLtv6kjd0Kj6ykdsK/r8k7243GrlVvIz0b9Uz8sIvBfaYZltNB2lpX7bUkQAPsIp7X/ebGJm7L+TDEu06D644WJCoABh5MIV6bblI9mT9pdFRr8YvHrYInrqZWOHMPKO53mil/IVxG7V2xuMsskGWLvkgafC/7NcCZfKX1/k3tAhO1Sl5CsC4G8SxDdFqao82D35o1x08jEh2oXvWSo9HmwDV0meyTTKK5Ielr+Q+43RZseiR5/lCk7fIEIeLiWdXslO4vBBq341DLTfLvLs0m26fmuiSn2DbmsCDa6CHBlZ4bn8MFTUcaQHOekyx1v4PM3rRzYCjZszgGKTVO2lFJLph2SmvHlOn08yrUeYRP2lMHdSTQgl9dW2BJYaBOVSil6ASOFiBkZVVyjSaN5NDWClo6KrW/1tXK2IZPR7u77I89axtwVkCc/zbKukZISQL0YkBHTcoZg9m64WA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9e425e9-9445-448c-d0d3-08d843800629
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2020 14:07:21.5011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mmkKkPjJLwKhcJC347/2Lq1Ry3ITwIMCnghZXji2JH2LR4VC1pe0KQ0hj0EDD+d5AvDVO0vCBM61YvUqBcCEhqmNXk3AGvTHkdaCGpNYxj8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3398
Content-Type: multipart/alternative;
 boundary="------------564A58910F4A1C3AE8A06EA8"
Content-Language: en-US

--------------564A58910F4A1C3AE8A06EA8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/17/20 7:28 AM, Leon Anavi wrote:
> Upgrade to release 1.3.3:
>
> - CommandSet command functions (do_, complete_, help_) will no
>    longer have the cmd2 app passed in as the first parameter after
>    self since this is already a class member.
> - Renamed install_command_set() and uninstall_command_set() to
>    register_command_set() and unregister_command_set() for better
>    name consistency.
> - Fixed help formatting bug in Cmd2ArgumentParser when metavar is
>    a tuple.
> - Fixed tab completion bug when using CompletionItem on an
>    argument whose metavar is a tuple.
> - Added explicit testing against python 3.5.2 for Ubuntu 16.04,
>    and 3.5.3 for Debian 9.
> - Added fallback definition of typing.Deque (taken from 3.5.4)
> - Removed explicit type hints that fail due to a bug in 3.5.2
>    favoring comment-based hints instead.
> - When passing a ns_provider to an argparse command, will now
>    attempt to resolve the correct CommandSet instance for self.
>    If not, it'll fall back and pass in the cmd2 app.
> - Added missing doc-string for new cmd2.Cmd init parameters
>    introduced by CommandSet enhancement.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-cmd2_1.3.2.bb => python3-cmd2_1.3.3.bb}   | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-cmd2_1.3.2.bb => python3-cmd2_1.3.3.bb} (75%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-cmd2_1.3.2.bb b/meta-python/recipes-devtools/python/python3-cmd2_1.3.3.bb
> similarity index 75%
> rename from meta-python/recipes-devtools/python/python3-cmd2_1.3.2.bb
> rename to meta-python/recipes-devtools/python/python3-cmd2_1.3.3.bb
> index f5d6099dd..a44f02f00 100644
> --- a/meta-python/recipes-devtools/python/python3-cmd2_1.3.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-cmd2_1.3.3.bb
> @@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9791cd24ca7d1807388ccd55cd066def"
>   
>   DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
>   
> -SRC_URI[md5sum] = "ee7199d76f75bf01d8a162db6b696662"
> -SRC_URI[sha256sum] = "645792972e1c0475b03fd575d8ca95c526db970d886669a399307eb52fddd7bd"
> +SRC_URI[md5sum] = "c8ffa926c50673f00fd8ff8533e9f959"
> +SRC_URI[sha256sum] = "38015008ff4639edfd66591063a0e9bb75a62dccb14ee3ec7bf3a6cb130de5cf"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------564A58910F4A1C3AE8A06EA8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/17/20 7:28 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200817112901.28914-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.3.3:

- CommandSet command functions (do_, complete_, help_) will no
  longer have the cmd2 app passed in as the first parameter after
  self since this is already a class member.
- Renamed install_command_set() and uninstall_command_set() to
  register_command_set() and unregister_command_set() for better
  name consistency.
- Fixed help formatting bug in Cmd2ArgumentParser when metavar is
  a tuple.
- Fixed tab completion bug when using CompletionItem on an
  argument whose metavar is a tuple.
- Added explicit testing against python 3.5.2 for Ubuntu 16.04,
  and 3.5.3 for Debian 9.
- Added fallback definition of typing.Deque (taken from 3.5.4)
- Removed explicit type hints that fail due to a bug in 3.5.2
  favoring comment-based hints instead.
- When passing a ns_provider to an argparse command, will now
  attempt to resolve the correct CommandSet instance for self.
  If not, it'll fall back and pass in the cmd2 app.
- Added missing doc-string for new cmd2.Cmd init parameters
  introduced by CommandSet enhancement.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200817112901.28914-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-cmd2_1.3.2.bb =&gt; python3-cmd2_1.3.3.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_1.3.2.bb =&gt; python3-cmd2_1.3.3.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_1.3.2.bb b/meta-python/recipes-devtools/python/python3-cmd2_1.3.3.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-cmd2_1.3.2.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_1.3.3.bb
index f5d6099dd..a44f02f00 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_1.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_1.3.3.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=9791cd24ca7d1807388ccd55cd066def">&quot;file://LICENSE;md5=9791cd24ca7d1807388ccd55cd066def&quot;</a>
 
 DEPENDS += &quot;${PYTHON_PN}-setuptools-scm-native&quot;
 
-SRC_URI[md5sum] = &quot;ee7199d76f75bf01d8a162db6b696662&quot;
-SRC_URI[sha256sum] = &quot;645792972e1c0475b03fd575d8ca95c526db970d886669a399307eb52fddd7bd&quot;
+SRC_URI[md5sum] = &quot;c8ffa926c50673f00fd8ff8533e9f959&quot;
+SRC_URI[sha256sum] = &quot;38015008ff4639edfd66591063a0e9bb75a62dccb14ee3ec7bf3a6cb130de5cf&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------564A58910F4A1C3AE8A06EA8--
