Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F81AC48BE6
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:49 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web12.2779.1649137137499003540
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Apr 2022 22:38:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=jstzsv4c;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649137135; i=@fujitsu.com;
	bh=wGNuhSLR/jStj5KpQKNuq255rSzQwjjuN2sFm+xQ4SA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=jstzsv4crLl7O/hj9wefoZuS/W1gCxhGkxL310oQL+LZCvSVwSyOTdlePlGA3sjGx
	 o1YcURLzbTPTMpRlbqpxFESN9m2hcYVe7FDyxwT/p/lRfZfWv1uvuD0mH2+NFL68Wn
	 7s74G4gloJArLG/yjyn7y4B01IiT8nM5t+VsCPqynoCLRsoj7he7ss+41TA/AEmfS5
	 0OJCfvcYF/BTcfm4RM+qfL7tz+I5GaL5kN0i9yQZ2R/dvY8kBJJZJTSVZ+Wnqi3YpZ
	 xLzErWC1JsK6xPNEjW3vXWI4sBckSymvyTXKgm4eO4zajXchu5tvW32pFouMWUjOc9
	 8+sAyvSVWLhFA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCIsWRWlGSWpSXmKPExsViZ8MRovvuqne
  SwYQZNhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8b6k5PZC+7KVmyZKNXAeEmyi5GLQ0hgFpPE
  l/VTWCCc3YwSF6b3M3YxcnKwCahJTL91gxXEFhHQl1g6ew8ziM0soCLx4ncPO4gtLOApcWzzU
  RYQmwUo/vHodqYuRg4OXgEniRV3BUDCEgIKElMevgdr5RRwlmhvb2ADsYWASiY/XgO2ildAUO
  LkzCcsEOMlJA6+eMEM0asoMftyMwuEXSExa1Yb0wRG/llIWmYhaVnAyLSK0S6pKDM9oyQ3MTN
  H19DAQNfQ0FTXzFLX0NJUL7FKN1EvtVQ3OTWvpCgRKK2XWF6sl1pcrFdcmZuck6KXl1qyiREY
  mCnFrod3MO7u+6l3iFGSg0lJlPeMq3eSEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQnek2eBcoJFq
  empFWmZOcAogUlLcPAoifAeuQiU5i0uSMwtzkyHSJ1iVJQS5715BSghAJLIKM2Da4NF5iVGWS
  lhXkYGBgYhnoLUotzMElT5V4ziHIxKwrw8IFN4MvNK4Ka/AlrMBLT43RlPkMUliQgpqQYm34i
  XtkKXJZL3TNAOkfVeyy7hEXA05sjh8OM7Us+a76xRuFRmbqGiJpLtwSYjeH/G4jJ9Fq9Lx6vD
  s5T2C+wyFHj9snumcY/e5eM+H4671navWF1x3rh8xvtfwdaH2x4n/RWPr1NM/Zj+ylFG/MW/Q
  5OlV7Z//XjhZ9yGkFdVNZ1K4T4TRXhdbSZ8nDpzR3PvlrK9jPoJwhO6WBfnhbjf/7Lh9X2FB2
  6LM6b5/MnTKpIUCm6uPj2zX8Pih6Cjy6+Cva22uy5qnlQWe/3i2T63mKibvwJ/cBsWuO2wfXo
  g9NWi6pcflldfDOyz3Hi8QdTqqHZePYfMa84fc4J9K6oXcTtk+e8srvkU4rxpfYwSS3FGoqEW
  c1FxIgCm3FmYRwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-532.messagelabs.com!1649137134!42625!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11799 invoked from network); 5 Apr 2022 05:38:54 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-21.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 5 Apr 2022 05:38:54 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 2355cs1t005478
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 5 Apr 2022 06:38:54 +0100
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 5 Apr 2022 06:38:52 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-click: upgrade 8.0.4 -> 8.1.2
Date: Sat, 2 Apr 2022 20:35:06 +0800
Message-ID: <1648902907-19815-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1648902907-19815-1-git-send-email-wangmy@fujitsu.com>
References: <1648902907-19815-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Apr 2022 17:24:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96405

Changelog from 8.0.4 to 8.1.2:
==============================
- Fix error message for readable path check that was mixed up with the executable
  check. #2236
- Restore parameter order for Path, placing the executable parameter at the end.
  It is recommended to use keyword arguments instead of positional arguments. #2235
- Fix an issue with decorator typing that caused type checking to report that a
  command was not callable. #2227
- Drop support for Python 3.6. #2129
- Remove previously deprecated code. #2130
- Group.resultcallback is renamed to result_callback.
- autocompletion parameter to Command is renamed to shell_complete.
- get_terminal_size is removed, use shutil.get_terminal_size instead.
- get_os_args is removed, use sys.argv[1:] instead.
- Rely on PEP 538 and PEP 540 to handle selecting UTF-8 encoding instead of ASCII.
  Click's locale encoding detection is removed. #2198
- Single options boolean flags with show_default=True only show the default if it is True. #1971
- The command and group decorators can be applied with or without parentheses. #1359
- The Path type can check whether the target is executable. #1961
- Command.show_default overrides Context.show_default, instead of the other way around. #1963
- Parameter decorators and @group handles cls=None the same as not passing cls.
  @option handles help=None the same as not passing help. #1959
- A flag option with required=True requires that the flag is passed instead of
  choosing the implicit default value. #1978
- Indentation in help text passed to Option and Command is cleaned the same as
  using the @option and @command decorators does. A command's epilog and
  short_help are also processed. #1985
- Store unprocessed Command.help, epilog and short_help strings. Processing is
  only done when formatting help text for output. #2149
- Allow empty str input for prompt() when confirmation_prompt=True and default="". #2157
- Windows glob pattern expansion doesn't fail if a value is an invalid pattern. #2195
- It's possible to pass a list of params to @command. Any params defined with
  decorators are appended to the passed params. #2131.
- @command decorator is annotated as returning the correct type if a cls argument is used. #2211
- A Group with invoke_without_command=True and chain=False will invoke its
  result callback with the group function's return value. #2124
- to_info_dict will not fail if a ParamType doesn't define a name. #2168
- Shell completion prioritizes option values with option prefixes over new options. #2040
- Options that get an environment variable value using autoenvvar_prefix treat
  an empty value as None, consistent with a direct envvar. #2146

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-click_8.0.4.bb => python3-click_8.1.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-click_8.0.4.bb => python3-click_8.1.2.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-click_8.0.4.bb b/meta-python/recipes-devtools/python/python3-click_8.1.2.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-click_8.0.4.bb
rename to meta-python/recipes-devtools/python/python3-click_8.1.2.bb
index 76f7a8e652..a623fe104c 100644
--- a/meta-python/recipes-devtools/python/python3-click_8.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-click_8.1.2.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://click.pocoo.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=1fa98232fd645608937a0fdc82e999b8"
 
-SRC_URI[sha256sum] = "8458d7b1287c5fb128c90e23381cf99dcde74beaf6c7ff6384ce84d6fe090adb"
+SRC_URI[sha256sum] = "479707fe14d9ec9a0757618b7a100a0ae4c4e236fac5b7f80ca68028141a1a72"
 
 inherit pypi setuptools3 ptest
 
-- 
2.25.1


