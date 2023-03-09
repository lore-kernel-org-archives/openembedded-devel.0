Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA14DC61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 09:09:19 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web10.8982.1678352954059900456
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Mar 2023 01:09:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=hrILtiWp;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678352952; i=@fujitsu.com;
	bh=Cd5SKRMMdjwHMgtYasNy7DMAB84rQtvsQitv7iX/XNY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=hrILtiWpk/IJruhAlxQ21n49EC265z8N7OhwWg9BzYg+ezWCoJZ9ga1zVYUaQ3sf+
	 Hv/f3J+8NXoidX5H8pbq9ntogFdnWV4R7vBjDjYy5Q3L61N5NDCwbskM//xn2UfpWM
	 BsikIuWUi4TiwpD+qDDSe4TVFykqM1L5gRe0W1TvpPdJ14u1xQzCMMq+uj3u79Orkn
	 0yy54rRn7w7AJYOIug4Qfgfjf0lz3y7Ehav2QZSQyEL5aMI0+TANqpaM2bkAVMWO5q
	 v0xxZpibRBL180fyPAzYDoKQK63N6SNQSNH+gdGgeeDiBq6RM0sR11S+s1ToISQfxF
	 uB6/+i+tUy8OA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEIsWRWlGSWpSXmKPExsViZ8ORqGuxiDP
  F4L2HxcXDS5kdGD3ObVzBGMAYxZqZl5RfkcCaceTXNqaCPpmKoxOSGxgnS3YxcnEICTxhlPhw
  YQIzhHODSWJX/wWmLkZOIGcPo8TF/dkgNpuAlMSN+//ZQGwRAX2JpbP3MIPYzAIqEi9+97B3M
  XJwCAsES9yYUAgSZgEKb/i1gh3E5hVwkngwfzsLiC0hoCAx5eF7sFZOAWeJ+9vbWCFWOUkcuP
  eBFaJeUOLkzCcsEOMlJA6+eMEM0asoMftyM9ScSonWD7+gbDWJq+c2MU9gFJyFpH0WkvYFjEy
  rGE2LU4vKUot0zfSSijLTM0pyEzNz9BKrdBP1Ukt1y1OLS3QN9RLLi/VSi4v1iitzk3NS9PJS
  SzYxAoM2pZjhxg7GOX1/9Q4xSnIwKYnydrNxpgjxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4F06H
  ygnWJSanlqRlpkDjCCYtAQHj5IIb/9soDRvcUFibnFmOkTqFKOilDjv0wVACQGQREZpHlwbLG
  ovMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmdZ4DNIUnM68EbvoroMVMQIt3beEAWVySiJC
  SamAyNS0TbHG38Dq98fSr0ADL+YuzeSbfMjhvkHpeS3KB9tHzC/ZZf/Zrtpfw57/4V8ZTZHGP
  +7fL7X7bitwvX3g74cAbT/6pe6572x042/UlUFPz5EHG9b3SCim2U+JlhXV+nmAJ/FsnUb7Eh
  mtpLPN0ThPDjBmLuN3uck1ZJvzuU3dnSZgQE+ePi4+bW/us337nzEiXeZG4QdDXMlJ50vSE3Q
  onvtYEGtQ6utZuX/LzpNms+c5SLHPYPPP+rb+wasVG7getf9lC/0speqg0mzff7bZYfzPztZZ
  00BeV44el1n4MPqD2btUPO9cn70VOhE95m3CxpTbC6dNFHhb9fyctZ61ZqKmlv+m9MvvZJmUl
  luKMREMt5qLiRADnuWQYVQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-587.messagelabs.com!1678352951!101269!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11184 invoked from network); 9 Mar 2023 09:09:11 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-3.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 9 Mar 2023 09:09:11 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 8DDCC100194
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Mar 2023 09:09:11 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 811DF100191
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Mar 2023 09:09:11 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 9 Mar 2023 09:09:09 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 03/11] python3-astroid: upgrade 2.14.2 -> 2.15.0
Date: Thu, 9 Mar 2023 17:08:35 +0800
Message-ID: <1678352916-32505-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678352916-32505-1-git-send-email-wangmy@fujitsu.com>
References: <1678352916-32505-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Mar 2023 09:09:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101449

From: Wang Mingyu <wangmy@fujitsu.com>

0001-pyproject.toml-Replace-with.patch
removed since it's included in 2.15.0

Changelog:
==========
* astroid now supports "TryStar" nodes from python 3.11 and should be fully compatible with python 3.11.
* "Formattedvalue.postinit" is now keyword only. This is to allow correct typing of the
  "Formattedvalue" class.
* "Astroid" now supports custom import hooks.
* "astroid" now infers return values from match cases.
* "AstroidManager.clear_cache" now also clears the inference context cache.
* "Astroid" now retrieves the default values of keyword only arguments and sets them on
  "Arguments.kw_defaults".
* "Uninferable" now has the type "UninferableBase". This is to facilitate correctly type annotating
  code that uses this singleton.
* Deprecate "modutils.is_standard_module()". It will be removed in the next minor release.
  Functionality has been replaced by two new functions,
  "modutils.is_stdlib_module()" and "modutils.module_in_path()".
* Fix "are_exclusive" function when a walrus operator is used inside "IfExp.test" field.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-pyproject.toml-Replace-with.patch    | 27 -------------------
 ...id_2.14.2.bb => python3-astroid_2.15.0.bb} |  6 +----
 2 files changed, 1 insertion(+), 32 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-astroid/0001-pyproject.toml-Replace-with.patch
 rename meta-python/recipes-devtools/python/{python3-astroid_2.14.2.bb => python3-astroid_2.15.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid/0001-pyproject.toml-Replace-with.patch b/meta-python/recipes-devtools/python/python3-astroid/0001-pyproject.toml-Replace-with.patch
deleted file mode 100644
index 3e1a17be9..000000000
--- a/meta-python/recipes-devtools/python/python3-astroid/0001-pyproject.toml-Replace-with.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 517f361ba4a6ae430acfe3b83986d32b4f811b58 Mon Sep 17 00:00:00 2001
-From: Leon Anavi <leon.anavi@konsulko.com>
-Date: Wed, 11 Jan 2023 13:56:24 +0200
-Subject: [PATCH] pyproject.toml: Replace ~= with >=
-
-Replace ~= with >= to avoid errors if the version is not exactly
-the same.
-
-Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
----
- pyproject.toml | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/pyproject.toml b/pyproject.toml
-index 537bca9a..a01e0d45 100644
---- a/pyproject.toml
-+++ b/pyproject.toml
-@@ -1,5 +1,5 @@
- [build-system]
--requires = ["setuptools~=62.6", "wheel~=0.37.1"]
-+requires = ["setuptools>=62.6", "wheel>=0.37.1"]
- build-backend = "setuptools.build_meta"
- 
- [project]
--- 
-2.30.2
-
diff --git a/meta-python/recipes-devtools/python/python3-astroid_2.14.2.bb b/meta-python/recipes-devtools/python/python3-astroid_2.15.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-astroid_2.14.2.bb
rename to meta-python/recipes-devtools/python/python3-astroid_2.15.0.bb
index e8b86071a..a5f30b754 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_2.14.2.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_2.15.0.bb
@@ -4,11 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "a3cf9f02c53dd259144a7e8f3ccd75d67c9a8c716ef183e0c1f291bc5d7bb3cf"
-
-SRC_URI += " \
-    file://0001-pyproject.toml-Replace-with.patch \
-"
+SRC_URI[sha256sum] = "525f126d5dc1b8b0b6ee398b33159105615d92dc4a17f2cd064125d57f6186fa"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


