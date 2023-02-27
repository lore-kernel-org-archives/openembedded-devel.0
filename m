Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BD05C7EE2D
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 08:09:21 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.85542.1677485353457712834
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Feb 2023 00:09:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=P2lb5/kd;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677485351; i=@fujitsu.com;
	bh=CngXMW+zEYaMwgF+puYCaxqLtlM9PCjbHAraGHUj71s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=P2lb5/kdfyYeWrnY4yocCgDYjgqWhoZ84C+duRSHxuoCmD+PsDLZ5gK1K+x8tcrda
	 21yaYja8DjgaAXcBXxk5G1+HoHjwxPaAYo+nkZqGWSPYOM9xnjeINSFfyExQTCNBoL
	 063bpv0i0hb0E5H9yWogB6nDszCnBlFg4o+/VtOicCYhi5tebIMHWz4+wsLHmPbz3/
	 paZbLKv/ekkJOWFGaH9iDGxo5v4wLvv4kMClkFu3gf5H9jHm7N05eGt47WjYCBGGyb
	 U+S8DiLgauT9lxSjZBE7Vl18a8aCOlXzh+96WKBOQXE+IYdNFzq4yvFXGODYLU4RSi
	 0J/1vOXajwrVg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8OxWbc45U+
  yway1jBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aiH3+YC94IVuxfvZ6lgfEGfxcjF4eQwENG
  ic7/V5khnCtMErserWCCcPYySiw8/Z69i5GTg01ASuLG/f9sILaIgL7E0tl7mEFsZgEViRe/e
  8BqhAV8JF5PesQEYrMIqErMWP6QsYuRg4NXwElieqczSFhCQEFiysP3YK2cAs4Sr54dBhspBF
  Ty+MQusFZeAUGJkzOfsECMl5A4+OIFM0SvosTsy80sEHalROuHX1C2msTVc5uYJzAKzkLSPgt
  J+wJGplWMpsWpRWWpRbpmeklFmekZJbmJmTl6iVW6iXqppbrlqcUlukZ6ieXFeqnFxXrFlbnJ
  OSl6eaklmxiBoZtSrP5rB+PMvr96hxglOZiURHkXOf1JFuJLyk+pzEgszogvKs1JLT7EKMPBo
  STBezAJKCdYlJqeWpGWmQOMI5i0BAePkggvsxFQmre4IDG3ODMdInWKUVFKnJcvESghAJLIKM
  2Da4PF7iVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrxRCUBTeDLzSuCmvwJazAS0ePvDHyC
  LSxIRUlINTAUTEtefr5m5VLBzTVfPp5d7r8dGC2zMdUoNcRf9G2P+atrfMNPZ0/l5F+Yy5HJ0
  Tiyoeyrhspz/4Dbdux4+FUqz9MJ2vxPIZP0a7/N8gjNDFmPfxGlF6zaG75iy71V0U6rX7p1OH
  F+l+X7fVXPJ8zN6G8XAXbTyHs/pp/67qpdtEv3XJLPHoKZ84YE/LvpXNIL2+dRdvmfAvnBOyk
  FDOY3FXYw33y75MXWitfGKr008Z/tfPRDWcSzUNbox5ffXdq7O45wqjzc8NN3M+M2p8b2Nygq
  fmS3Wvd3Pnlhc3XfqiKJE3NFFQY2f1c85HLs67dEG48eakieTj+fWTpE8cDnps/y9v8YXZsjo
  fU/dcVuJpTgj0VCLuag4EQDmZFEZWAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-571.messagelabs.com!1677485170!303143!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10326 invoked from network); 27 Feb 2023 08:06:11 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-15.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Feb 2023 08:06:11 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id B11D2150
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:06:10 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id A518073
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:06:10 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 27 Feb 2023 08:06:09 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-coverage: upgrade 7.1.0 -> 7.2.0
Date: Mon, 27 Feb 2023 16:05:52 +0800
Message-ID: <1677485153-11495-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1677485153-11495-1-git-send-email-wangmy@fujitsu.com>
References: <1677485153-11495-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:09:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101277

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Added a new setting "[report] exclude_also" to let you add more exclusions
  without overwriting the defaults.  Thanks, 'Alpha Chen <pull 1557_>'_,
  closing 'issue 1391_'.

- Added a :meth:'.CoverageData.purge_files' method to remove recorded data for
  a particular file.  Contributed by 'Stephan Deibel <pull 1547_>'_.

- Fix: when reporting commands fail, they will no longer congratulate
  themselves with messages like "Wrote XML report to file.xml" before spewing a
  traceback about their failure.

- Fix: arguments in the public API that name file paths now accept pathlib.Path
  objects.  This includes the "data_file" and "config_file" arguments to
  the Coverage constructor and the "basename" argument to CoverageData.
  Closes 'issue 1552'_.

- Fix: In some embedded environments, an IndexError could occur on stop() when
  the originating thread exits before completion.  This is now fixed, thanks to
  'Russell Keith-Magee <pull 1543_>'_, closing 'issue 1542'_.

- Added a "py.typed" file to announce our type-hintedness.  Thanks,
  'KotlinIsland <pull 1550_>'_.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-coverage_7.1.0.bb => python3-coverage_7.2.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_7.1.0.bb => python3-coverage_7.2.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.1.0.bb b/meta-python/recipes-devtools/python/python3-coverage_7.2.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-coverage_7.1.0.bb
rename to meta-python/recipes-devtools/python/python3-coverage_7.2.0.bb
index 358a0ec19..c51f9ca55 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "10188fe543560ec4874f974b5305cd1a8bdcfa885ee00ea3a03733464c4ca265"
+SRC_URI[sha256sum] = "9cc9c41aa5af16d845b53287051340c363dd03b7ef408e45eec3af52be77810d"
 
 inherit pypi setuptools3
 
-- 
2.34.1


