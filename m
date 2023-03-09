Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E27D5C64EC4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 09:08:59 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.8976.1678352931727479757
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Mar 2023 01:08:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=FMwyZjY3;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678352929; i=@fujitsu.com;
	bh=HqCzdqytdWz1bVg+n9NFSBDsWD+IgMGSkJosNL7r5+4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=FMwyZjY3Xw8i1MXceCuu/y8QzKUj5AwjRXhR4VBO552+gKmiyuegcNLsPkrX6g9NJ
	 ak8hAiNwRisaYI3OkO+h/l6sOoNI62KVmXkhJqwK2iBlQxIXZm+iTBqqPwlqblzu2r
	 0nm1zAZhCkP5Mj5XiciWSCBFTcjaqpCCjxQdA2GNKZtGY/1He8WNaz6XbUOU8FOLnj
	 IVbKL6WkTV1kcG4BrM6CPTVTND5JldkRBzm7RT35omaepEdWsluA80blU5/O44vHxp
	 HMP/4RC7nnmktOQg/6qVT5rsdZ15IJf6OnQbSFORgzLXirliGObqOkyyEz6lw5+dHg
	 fSw8Iuj3xOfgg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8MxSVdxEWe
  KwcJ1khYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aDJ3/YCg4LVexd+oKxgfGQQBcjF4eQwBNG
  iY7jK9khnBtMEvtvz2GDcPYwShy+sZmli5GTg01ASuLG/f9sILaIgL7E0tl7mEFsZgEViRe/e
  9hBbGGBQIlbM+4B1XBwsADFb5+VBwnzCjhJzN11jBHElhBQkJjy8D0zRFxQ4uTMJywQYyQkDr
  54wQxRoygx+3IzC4RdKdH64ReUrSZx9dwm5gmM/LOQtM9C0r6AkWkVo3lxalFZapGuoaFeUlF
  mekZJbmJmjl5ilW6iXmqpbl5+UUmGrqFeYnmxXmpxsV5xZW5yTopeXmrJJkZgOKYUpx3fwfiy
  76/eIUZJDiYlUd5uNs4UIb6k/JTKjMTijPii0pzU4kOMMhwcShK8S+cD5QSLUtNTK9Iyc4CxA
  ZOW4OBREuHtnw2U5i0uSMwtzkyHSJ1iVJQS5y0F6RMASWSU5sG1weLxEqOslDAvIwMDgxBPQW
  pRbmYJqvwrRnEORiVhXuc5QFN4MvNK4Ka/AlrMBLR41xYOkMUliQgpqQYmVoX5eX5Ptkx41VV
  Z0Md0/ZFtpE3J1txsjpsfZFU+KW1Jt3hvpCDfVi8etmXq6Q1VBUEmjnf8wo4J2P3dv/9czOqp
  26e0vWtM0pdV0JDn3eZaECng/Mi0YOLmpI/th14z35k8kdlm6stHQYcnRcw6vGHvpne9excyz
  uU5a3HhpN6l9Vr2+7M32saV3frt6Hre/4/vizyPJY1uqyNKL7U1K4b7i6vFsJZ/Xb//2eETx1
  e8NHNiz1xxNs5AvG+S8PPD3o/nX0z7WSe/ZUpL561fvqq/Z90JOr6w5aKOMZu4XTTz6z4Nrgd
  nMh8rNqSueHTnZ4fw/BfLFB7v5LwrVXqqk7O5ynvrKr372/S/XVVfpMRSnJFoqMVcVJwIAE9e
  k79CAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-732.messagelabs.com!1678352929!1042783!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14482 invoked from network); 9 Mar 2023 09:08:49 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-4.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 9 Mar 2023 09:08:49 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id C42621000EE
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Mar 2023 09:08:48 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id B7E481000D5
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Mar 2023 09:08:48 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 9 Mar 2023 09:08:47 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 06/11] python3-mpmath: upgrade  1.2.1 -> 1.3.0
Date: Thu, 9 Mar 2023 17:08:32 +0800
Message-ID: <1678352916-32505-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Mar 2023 09:08:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101446

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2022.

Changelog:
===========
Security issues:
----------------
* Fixed ReDOS vulnerability in mpmathify() (CVE-2021-29063)

Features:
----------
* Added quadsubdiv() for numerical integration with adaptive path splitting
* Added the Cohen algorithm for inverse Laplace transforms
* Some speedup of matrix multiplication
* Optimizations to Carlson elliptic integrals
* Added signal functions (squarew(), trianglew(), sawtoothw(), unit_triangle()
  sigmoidw())

Bug fixes:
----------
* Correct mpf initialization from tuple for finf and fninf
* Support QR decomposition for matrices of width 0 and 1
* Fixed some cases where elliprj() gave inaccurate results
* Fixed cases where digamma() hangs for complex input
* Fixed cases of polylog() with integer-valued parameter with complex type
* Fixed fp.nsum() with Euler-Maclaurin algorithm

Maintenance:
------------
* Dropped support for Python 3.4
* Documentation cleanup
* Removed obsolete files
* Added options to runtests.py to skip tests and exit on failure

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-mpmath_1.2.1.bb => python3-mpmath_1.3.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-mpmath_1.2.1.bb => python3-mpmath_1.3.0.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-mpmath_1.2.1.bb b/meta-python/recipes-devtools/python/python3-mpmath_1.3.0.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-mpmath_1.2.1.bb
rename to meta-python/recipes-devtools/python/python3-mpmath_1.3.0.bb
index 3337df490..4ac9e2192 100644
--- a/meta-python/recipes-devtools/python/python3-mpmath_1.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-mpmath_1.3.0.bb
@@ -4,9 +4,9 @@
 SUMMARY = "Python library for arbitrary-precision floating-point arithmetic"
 HOMEPAGE = "https://pypi.org/project/mpmath/"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=71970bd3749eebe1bfef9f1efff5b37a"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=bde3c575382996b75d85702949512751"
 
-SRC_URI[sha256sum] = "79ffb45cf9f4b101a807595bcb3e72e0396202e0b1d25d689134b48c4216a81a"
+SRC_URI[sha256sum] = "7a28eb2a9774d00c7bc92411c19a89209d5da7c4c9a9e227be8330a23a25b91f"
 
 inherit pypi setuptools3
 
-- 
2.34.1


