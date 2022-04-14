Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69F81C3A5A7
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:54 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.6876.1649901631315710627
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Apr 2022 19:00:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=GI4/DYCq;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649901628; i=@fujitsu.com;
	bh=qo1Cr1XPV5xJnY3OlC4IEjEF0eQDcysi7CeZSyarNE4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=GI4/DYCq8zKWlDr3oPZj2uHe7+lrKvjnVAVPivR9ISTTddisxs5P5Z2KXYauX16wB
	 dLj70+BLMdOHJF5UPZYJftiK/jrP4fnPRC9xHqfEf2ZOaWQJ8FjUfDS6bn/Gdp8xWU
	 NqJtrh7OINO0rr+whI4mTyOtUuwMQkEoR6f5pocXA5X51tzs4zx0bG3s7gcRpD8fDB
	 9kGHWZ9ikx22VVmaXinFUd3wzEYZEgQoa1ULuoFaMYKtFfDDc5HlyJRe1lJ6uApJ8P
	 2SglUVDbkNlirZQM/Sad9uwuxOL+kfUo68wGxYIMFLnxGvAwh2Zk4IG7/1nCCmgw+T
	 bHueOnfl42K/A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprIIsWRWlGSWpSXmKPExsViZ8MxRdemITz
  JYNIifouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPd0Ta2gm7RilOztjE3MN4R6mLk4hASmM0k
  cevMdBYI5wCjxPUfq5i6GDk52AT0JTau+wRmiwDZS2fvYQaxhQUCJba/OMYCYrMIqEpsPH6OF
  cTmFfCQONlxjh3ElhBQkJjy8D0zRFxQ4uTMJ2D1zAISEgdfvACKcwDVKErMni4PUV4h8frwJe
  YJjDyzkHTMQtKxgJFpFaNdUlFmekZJbmJmjq6hgYGuoaGprpmZrqGpqV5ilW6iXmqpbnJqXkl
  RIlBaL7G8WC+1uFivuDI3OSdFLy+1ZBMjMKRSip1m72Dc0fdT7xCjJAeTkihvlmF4khBfUn5K
  ZUZicUZ8UWlOavEhRhkODiUJ3pQ6oJxgUWp6akVaZg4wvGHSEhw8SiK8TTVAad7igsTc4sx0i
  NQpRkUpcd6dIH0CIImM0jy4NlhMXWKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzDsdZApPZl
  4J3PRXQIuZgBZ/WxUKsrgkESEl1cA0k7Et/IQPx5Uzy5t8jzIeXpCWK3J/Vp5RgGksj4luucc
  vg6iJcd2GM861hv2x7PLfm7DO+bpq5uII1qm7VT14/67dbqmofHDCj7TZEVs9uduk5mknaexP
  nHf735uuwxMYbh9S+pWZu0nGqTDsusqTdf9Lr7xXY+adu8Krae7pjV8jOpWXrp8UPI2nXrXsQ
  e670zapTaVrF6S7fhQL0FurGvqc5Y//kj9SazpuRYnKr/ScblWfd/jpTzWD73rb+B8o7+jm2/
  JFelLxlefyfnXMwk2Hpr+tTC2otn15rGXJlmtLQ4Ii/8cHHq6VvNnUE9JjPevPipb9a5omftr
  +fuUl9oSCi5Pe5uySXxOmUqWqxFKckWioxVxUnAgAivGk7SQDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-7.tower-532.messagelabs.com!1649901627!18788!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2767 invoked from network); 14 Apr 2022 02:00:28 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-7.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 14 Apr 2022 02:00:28 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 23E20Rwj021554
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 03:00:27 +0100
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 14 Apr 2022 03:00:26 +0100
From: "zhengrq.fnst" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH v2] python3-nocasedict: upgrade 1.0.2 ->
 1.0.3
Date: Thu, 14 Apr 2022 10:00:06 +0800
Message-ID: <1649901606-14024-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96632

License-Update: type of file changed 
 "ASCII text, with CRLF line terminators" -> "ASCII text"

changelog:
===============================================================================
Bug fixes:

-Mitigated the coveralls HTTP status 422 by pinning coveralls-python to <3.0.0 .
-Fixed issues raised by new Pylint 2.9 and 2.10.
-Fixed a dependency error that caused importlib-metadata to be installed on
Python 3.8, while it is included in the Python base.
-Disabled new Pylint issue 'consider-using-f-string', since f-strings were
introduced only in Python 3.6.
-Fixed install error of wrapt 1.13.0 on Python 2.7 on Windows due to lack of
MS Visual C++ 9.0 on GitHub Actions, by pinning it to <1.13.
-Fixed potential issue with Sphinx/docutils versions on Python 2.7.
-Fixed error when installing virtualenv in install test on Python 2.7.
-Fixed that the added setup.py commands (test, leaktest, installtest) were not
displayed. They are now displayed at verbosity level 1 (using '-v').

Enhancements:

-Enhanced test matrix on GitHub Actions to always include Python 2.7 and
Python 3.4 on Ubuntu and Windows, and Python 2.7 and Python 3.5 on macOS.
-Support for Python 3.10: Added Python 3.10 in GitHub Actions tests, and in
package metadata.

Cleanup:
-Removed old tools that were needed for travis and Appveyor but no longer on
GitHub Actions: remove_duplicate_setuptools.py, retry.bat

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...ython3-nocasedict_1.0.2.bb => python3-nocasedict_1.0.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-nocasedict_1.0.2.bb => python3-nocasedict_1.0.3.bb} (50%)

diff --git a/meta-python/recipes-devtools/python/python3-nocasedict_1.0.2.bb b/meta-python/recipes-devtools/python/python3-nocasedict_1.0.3.bb
similarity index 50%
rename from meta-python/recipes-devtools/python/python3-nocasedict_1.0.2.bb
rename to meta-python/recipes-devtools/python/python3-nocasedict_1.0.3.bb
index 591b9c6b8d..a47c4a455f 100644
--- a/meta-python/recipes-devtools/python/python3-nocasedict_1.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-nocasedict_1.0.3.bb
@@ -1,8 +1,8 @@
 SUMMARY = "A case-insensitive ordered dictionary for Python"
 HOMEPAGE = "https://github.com/pywbem/nocasedict"
 LICENSE = "LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a87a7059d580c45495c1218f53e3610d"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1803fa9c2c3ce8cb06b4861d75310742"
 
-SRC_URI[sha256sum] = "86e2dae49e34de7c31b65b486c8f9aa58b66dc2e8ee9b34c390c6c58885c85a0"
+SRC_URI[sha256sum] = "8220b97ba06b08eb2deded774c406c77e0ca0d5352ae71249f6f9d1f2a17bd7b"
 
 inherit pypi setuptools3
-- 
2.25.1


