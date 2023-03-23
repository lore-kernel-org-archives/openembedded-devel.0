Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 189E4C6FD1D
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 05:15:08 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.65764.1679548498551807005
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Mar 2023 22:14:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=pUyhll/4;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679548496; i=@fujitsu.com;
	bh=JW0yarcl0+mlb7hZ7qqgpPliEoA4UB2N4Kp60ATachc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=pUyhll/4lxDjyktnG1FHdEpbXV45s5ANbOBSaYYgq294/Oyf7ENEEN/IMDzTx/Xul
	 rxAyEVuOZ24Avnxh554svvnwdzm+mEQZeUkAq0wEugmXlGl/EEBmMEPQm0ArXahLcH
	 xqj2AP6Bet7L1s5MWUxgiJKma43fjcx6qsvSkcYtn4Pj9EK67xJKOPJXbONj/AGUS0
	 zQUAIW4b51wLRsMKBHMUK7bvlMqldnfC1tnzo88TIXB0CK9iCoMBfKeAshVSgd5UcC
	 xkivXQ7gdVVZsOUAqgH3Busyy74WpHecazvGlCH6RMbYe0cNH0/14aoyrH4hVL4DNL
	 AS4d8MqbieWeQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORpOv/QDr
  FYPUJcYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePtmjbWgjPyFUuO+DUwrpTuYuTiEBJ4yCix
  b8NZdgjnCpPExkdLWSCcPYwSTxr3A2U4OdgEpCRu3P/PBmKLCOhLLJ29hxnEZhZQkXjxuwesR
  ljAT6Jz7wewOIuAqsTdLY9YQGxeASeJruP/wHolBBQkpjx8D1TDwcEp4CxxvikBJCwEVPL4/g
  EmiHJBiZMzn7BAjJeQOPjiBTNEq6LE7MvNLBB2hUTj9ENMELaaxNVzm5gnMArOQtI+C0n7Aka
  mVYzmxalFZalFuobmeklFmekZJbmJmTl6iVW6iXqppbp5+UUlGbqGeonlxXqpxcV6xZW5yTkp
  enmpJZsYgcGbUpx0Zwfjzr6/eocYJTmYlER5JUKlU4T4kvJTKjMSizPii0pzUosPMcpwcChJ8
  ArcAcoJFqWmp1akZeYAIwkmLcHBoyTCO/cgUJq3uCAxtzgzHSJ1ilFRSpyX6T5QQgAkkVGaB9
  cGi95LjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5de4BTeHJzCuBm/4KaDET0OK4GRIgi0s
  SEVJSDUwMv0O2prBV9q7ewJ+XmCmQ0Hqsy++a3J4Lr6ftc3f9aMj9fUXS1R8X0rZVXktUWLiG
  Y8bGvVuPGIX2bJs19wxf3cWke4WsiVGmzD0SjdezC2e+8FsV/M+bZ+20aWFCVROy972cZ7uz5
  Fy17r+JPIUh+asyZEKuTvwy867SrPpXMzd0XGrmsrl/8q3IbYNdH3kTp0noVRnkb0pdt/eW5R
  L/aI+t3Xc5jB2zp8m/Uepf/njGFK1Xh11zNkarX19rHh05qa5Dy/xjYN+ctEUVd54dP+R6aee
  zz8trn+wTyrxe/YSv/Y/DFqXwQ+tci1Rd9NptThowmWz/l3QmxpFDdtXWScU9FUKsJ0qtLN4c
  /2yvxFKckWioxVxUnAgA7i3xY1kDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-728.messagelabs.com!1679548494!431019!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1322 invoked from network); 23 Mar 2023 05:14:55 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-2.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 23 Mar 2023 05:14:55 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id B32331B4
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 05:14:54 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id A7E161AF
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 05:14:54 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 23 Mar 2023 05:14:43 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-typeguard: upgrade 2.13.3 -> 3.0.1
Date: Thu, 23 Mar 2023 13:14:24 +0800
Message-ID: <1679548466-20438-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1679548466-20438-1-git-send-email-wangmy@fujitsu.com>
References: <1679548466-20438-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 05:15:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101659

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
  Improved the documentation
  Fixed assignment unpacking (a, b = ...) being checked incorrectly
  Fixed @typechecked attempting to instrument wrapper decorators such as @contextmanager when applied to a class
  Fixed py.typed missing from the wheel when not building from a git checkout
  BACKWARD INCOMPATIBLE Dropped the argname, memo, globals and locals arguments from check_type()
  BACKWARD INCOMPATIBLE Removed the check_argument_types() and check_return_type() functions (use @typechecked instead)
  BACKWARD INCOMPATIBLE Moved install_import_hook to be directly importable from the typeguard module
  BACKWARD INCOMPATIBLE Changed the checking of collections (list, set, dict, sequence, mapping) to only check the first item by default.
  BACKWARD INCOMPATIBLE Type checking failures now raise typeguard.TypeCheckError instead of TypeError
  Dropped Python 3.5 and 3.6 support
  Dropped the deprecated profiler hook (TypeChecker)
  Added a configuration system
  Added support for custom type checking functions
  Added support for PEP 604 union types (X | Y) on all Python versions
  Added support for generic built-in collection types (list[int] et al) on all Python versions
  Added support for checking arbitrary Mapping types
  Added support for the Self type
  Added support for typing.Never (and typing_extensions.Never)
  Added support for Never and NoReturn in argument annotations
  Added support for LiteralString
  Added support for TypeGuard
  Added support for the subclassable Any on Python 3.11 and typing_extensions
  Added the possibility to have the import hook instrument all packages
  Added the suppress_type_checks() context manager function for temporarily disabling type checks
  Much improved error messages showing where the type check failed
  Made it possible to apply @typechecked on top of @classmethod / @staticmethod (PR by jacobpbrugh)
  Changed check_type() to return the passed value, so it can be used (to an extent) in place of typing.cast(), but with run-time type checking
  Replaced custom implementation of is_typeddict() with the implementation from typing_extensions v4.1.0
  Emit InstrumentationWarning instead of raising RuntimeError from the pytest plugin if modules in the target package have already been imported
  Fixed TypeError when checking against TypedDict when the value has mixed types among the extra keys (PR by biolds)
  Fixed incompatibility with typing_extensions v4.1+ on Python 3.10 (PR by David C.)
  Fixed checking of Tuple[()] on Python 3.11 and tuple[()] on Python 3.9+
  Fixed integers 0 and 1 passing for Literal[False] and Literal[True], respectively
  Fixed type checking of annotated variable positional and keyword arguments (*args and **kwargs)
  Fixed checks against unittest.Mock and derivatives being done in the wrong place

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-typeguard_2.13.3.bb => python3-typeguard_3.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typeguard_2.13.3.bb => python3-typeguard_3.0.1.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-typeguard_2.13.3.bb b/meta-python/recipes-devtools/python/python3-typeguard_3.0.1.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-typeguard_2.13.3.bb
rename to meta-python/recipes-devtools/python/python3-typeguard_3.0.1.bb
index e9fce6145..932b6f0c6 100644
--- a/meta-python/recipes-devtools/python/python3-typeguard_2.13.3.bb
+++ b/meta-python/recipes-devtools/python/python3-typeguard_3.0.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/typeguard/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f0e423eea5c91e7aa21bdb70184b3e53"
 
-SRC_URI[sha256sum] = "00edaa8da3a133674796cf5ea87d9f4b4c367d77476e185e80251cc13dfbb8c4"
+SRC_URI[sha256sum] = "beb0e67c5dc76eea4a6d00a6606d444d899589908362960769d0c4a1d32bca70"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.34.1


