Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA16EC4332F
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 10:44:26 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web08.4123.1646822665023073992
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Mar 2022 02:44:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=xiWWW8Mk;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646822663; i=@fujitsu.com;
	bh=ZEwLW2T7sPudscnPze4xOK0uT55YFoMpzpj2DzJCr54=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=xiWWW8MkRZDKpgcorxz26tuQQ5m9Kgf+P8RA8VVBcdpoN7X05tuX6V64/X+dA/BmM
	 x1KIqaErKMISoj/20FqTzb2og8eAwuNv+ieKIR0Fncdn+WmcI0DjZoVgbO/MIlpcx7
	 Yy2WHqy/76SmV4y9q2eUXV3jOwSck017jJqCvhemN9fqbWAWBz4tMI0BsI9wRg+1lX
	 Nvtnp9+oeawyw4qfPS8IlOFbUdMxnQmX0guTO0mueqYF5Z6xG0J2cabY/sbW1aVN+i
	 iAll2a40QsZkqEnDoydRFrxDQnZVEiCKU2GucocSDXhgb1duLCnjbbk3uEQvDRAFtl
	 JeB7o1pSQBy/g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEIsWRWlGSWpSXmKPExsViZ8MRosvWqpF
  kcH2jvsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrFl8UnmgkcSFdPPHmJtYNwh1sXIxSEkMINJ
  YufMJ2wQznFGiVPdc4EcTg42ATWJ6bdusILYIgL6Ektn72EGsZkFVCRe/O5hB7GFBUIkXndMY
  QSxWYDiz5+dBYvzCjhJvP//AKxeQkBBYsrD92A2p4CzxIvTM8HmCwHVnD79gxmiXlDi5MwnLB
  DzJSQOvngB1asoMftyMwuEXSExa1Yb0wRG/llIWmYhaVnAyLSK0S6pKDM9oyQ3MTNH19DAQNf
  Q0FTXzEzXyMhCL7FKN1EvtVQ3OTWvpCgRKK2XWF6sl1pcrFdcmZuck6KXl1qyiREYnCnFTk92
  ML7u+6l3iFGSg0lJlFcmWCNJiC8pP6UyI7E4I76oNCe1+BCjDAeHkgRvZxNQTrAoNT21Ii0zB
  xgpMGkJDh4lEd7PNUBp3uKCxNzizHSI1ClGXY6dWy7vZRZiycvPS5US533TDFQkAFKUUZoHNw
  IWtZcYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfPytQBN4cnMK4Hb9AroCCagI+yM1ECOKEl
  ESEk1MOl8PrRad4+L/ks3hezJN2sSROubFyW+bvb8mRf2YMq2f5dPzjbM2BaktdtuyY0la/u3
  ZJoI39/Obn/0PIflJkanA6cDVs0q7Zj7UTdgr+WPiNqMjJW1KzfUnejLZpx4QUbvwupjFkmmb
  yee2CHlKROXzXf8ZXO57KUg4fwEf4bUt1sWr7srUSb0c9dBI5WfeQVdRsn+27gT7k5rTzMVdm
  7iCrS5+eVAq9/5wL/zKtYtnvtuActVzjIJ/34Bb18vn5MVn6S1Xge9O2kYnHr6wiq++5+0XvQ
  VNE91+6SrOemY8a5aPTcJB5ddpU9eaZ+Pv/p21eVlM1PT2tdskUhfvL5G6cgmnZ2+2ZMnmMzJ
  m6nEUpyRaKjFXFScCABw7OzgVQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-545.messagelabs.com!1646822662!3365!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6837 invoked from network); 9 Mar 2022 10:44:22 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-19.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Mar 2022 10:44:22 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 229AiGV8008214
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 9 Mar 2022 10:44:22 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 9 Mar 2022 10:44:20 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [PATCH] [oe] [meta-python] [PATCH] python3-bitarray: upgrade 2.3.7 ->
 2.4.0
Date: Wed, 9 Mar 2022 18:44:02 +0800
Message-ID: <1646822643-61935-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1646822643-61935-1-git-send-email-wangmy@fujitsu.com>
References: <1646822643-61935-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Mar 2022 10:44:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95899

setup.py-use-setuptools-instead-of-distutils.patch
removed since it's included in 2.4.0

Changelog:
=========
* enable building wheels for multiple platforms and Python versions using
  pypa/cibuildwheel, see #165 and #170
* use setuptools instead of distutils in 'setup.py', #168
* add missing type hinting for '.count()' step argument

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-use-setuptools-instead-of-distutils.patch | 29 -------------------
 ...ray_2.3.7.bb => python3-bitarray_2.4.0.bb} |  5 +---
 2 files changed, 1 insertion(+), 33 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-bitarray/setup.py-use-setuptools-instead-of-distutils.patch
 rename meta-python/recipes-devtools/python/{python3-bitarray_2.3.7.bb => python3-bitarray_2.4.0.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray/setup.py-use-setuptools-instead-of-distutils.patch b/meta-python/recipes-devtools/python/python3-bitarray/setup.py-use-setuptools-instead-of-distutils.patch
deleted file mode 100644
index cef7ce15a4..0000000000
--- a/meta-python/recipes-devtools/python/python3-bitarray/setup.py-use-setuptools-instead-of-distutils.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 947d364841954d60bab7a4cf1497a272b1bf73ca Mon Sep 17 00:00:00 2001
-From: Konrad Weihmann <kweihmann@outlook.com>
-Date: Sun, 27 Feb 2022 11:57:09 +0100
-Subject: [PATCH] setup.py: use setuptools instead of distutils
-
-as distutils will be deprecated in python 3.12 and already produces
-a warning when run with python 3.10.x, it might be a good time to
-switch to setuptools.
-It offers the same interface, so results will be the same
-
-Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
-
-Upstream-Status: Backport [https://github.com/ilanschnell/bitarray/commit/947d364841954d60bab7a4cf1497a272b1bf73ca]
-
----
- setup.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/setup.py b/setup.py
-index 4dbdf859..c7787dad 100644
---- a/setup.py
-+++ b/setup.py
-@@ -1,5 +1,5 @@
- import re
--from distutils.core import setup, Extension
-+from setuptools import setup, Extension
- 
- 
- kwds = {}
diff --git a/meta-python/recipes-devtools/python/python3-bitarray_2.3.7.bb b/meta-python/recipes-devtools/python/python3-bitarray_2.4.0.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python3-bitarray_2.3.7.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_2.4.0.bb
index 46ceed8b80..39d1618cb1 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_2.3.7.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_2.4.0.bb
@@ -3,11 +3,8 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
 
-SRC_URI[sha256sum] = "4da790ab193e993107f3ff0aebc4f8d6ad5196a19071fbafad16b02898a44fd7"
+SRC_URI[sha256sum] = "f1203e902d51df31917d77eeba9c3fe78d032873a2ad78c737e26420f0080e58"
 
 inherit setuptools3 pypi
 
-# Backported from 2.3.8
-SRC_URI += "file://setup.py-use-setuptools-instead-of-distutils.patch"
-
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


