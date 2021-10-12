Return-Path: <zangrc.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E235C433F5
	for <webhook@archiver.kernel.org>; Tue, 12 Oct 2021 05:29:04 +0000 (UTC)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web09.9636.1634016542939050727
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Oct 2021 22:29:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=LaOCoMmC;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: zangrc.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1634016541; i=@fujitsu.com;
	bh=SUKat7DerahxpiAt+3BljOOvTCGjo1Lm5bmxvDAYeCY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=LaOCoMmCHospvr8e31cRkNAEUb6L1uBcl9+2npBTw1mtE5AU8dhPFYvuwJJmIunRW
	 7JNl4rW6rHXP2PeztMqHJ+7U4j1wDWBFOuiwApv1a2IeJ2Sa7ghh4bUxwVabWG0xiS
	 MKurbGqyVRxl59zvHm0EFY9Ovi5dQzRbSX9PnPOU6IY+zPxprLS6yhMyRuihCV6jos
	 wiR/CNgaohD5SHZdU2hyX6DZyPCUcsV/VzuByujZIJYXGlIdmf4cKM/9Y+wTL+lwMK
	 3jrZRWg9pIDtH6I7ITjemex3tRH4WbpmGmm591jylswUdSHeGYmNyLsfjAGBrXK2xY
	 9KTMP2IIsNkmw==
Received: from [100.112.194.154] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.symcld.net id 29/B5-23860-D1D15616;
 Tue, 12 Oct 2021 05:29:01 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKIsWRWlGSWpSXmKPExsViZ8MxVVdGNjX
  RYPlddYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeN0412WgmsCFdNmfmNqYOzi72Lk4hASmM0k
  MfXMW5YuRg4g5wSjxKniLkZODjYBHYmOF90sILaIgL7E0tl7mEFsYQFfie3v1zGC2CwCqhJbd
  v0Ga+UVcJf411YGEpYQUJCY8vA9WDmvgKDEyZlPwMYwC0hIHHzxghmiRlFi+84zLBB2hcTrw5
  eYJzDyzELSMgtJywJGplWMFklFmekZJbmJmTm6hgYGuoaGRrqGlkBsYqKXWKWbqJdaqlueWly
  ia6iXWF6sV1yZm5yTopeXWrKJERhCKQUHJuxg3P/6g94hRkkOJiVR3qBTKYlCfEn5KZUZicUZ
  8UWlOanFhxhlODiUJHg7+VIThQSLUtNTK9Iyc4DhDJOW4OBREuGdKQOU5i0uSMwtzkyHSJ1i1
  OV493PxImYhlrz8vFQpcd4fQkBFAiBFGaV5cCNgsXWJUVZKmJeRgYFBiKcgtSg3swRV/hWjOA
  ejkjDvHJBVPJl5JXCbXgEdwQR0RGBUCsgRJYkIKakGphC7FXcvmKr/XW2o5Z+hcF349JTK7Te
  XbrwT47u/5aLnt47NKvwsIszvpN+9eSHy6YptweVHe9b94tX5ufXv9N7LItfUHuuvfGHfcvzd
  H3ExR+cfU3m67tZL7P4lefR7wIeXBw6Lrbt27mru3EfiNlvmPr61NqR9Q2CI2atY9491IdtfN
  szat9ut8NthFwnrvH0HgjdmPCuT/KC1nL2U9eSHGnOl1GzG77MjH/4wzCs+8Z07dUIJi2L3DU
  8j//261d/SIpMX9Z9XYRN5bHfHVvNviRnH1dC9VStbe5W/SgRx7Zl2VYPxvJVSiAWDqepknZW
  fX62IPNH/6bnGH77Vq1sEOlK2HD8sySjuZK7A8EeJpTgj0VCLuag4EQDuHE9yKAMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-17.tower-267.messagelabs.com!1634016540!1278402!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7451 invoked from network); 12 Oct 2021 05:29:00 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-17.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 12 Oct 2021 05:29:00 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 19C5T0SW006507
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Oct 2021 06:29:00 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Tue, 12 Oct 2021 06:28:59 +0100
From: Zang Ruochen <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-multidict: upgrade 5.1.0 -> 5.2.0
Date: Tue, 12 Oct 2021 13:28:52 +0800
Message-ID: <1634016532-17181-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Oct 2021 05:29:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93248

-License-Update: Delete the description of the license and use the license address instead.
 You may obtain a copy of the License at
     http://www.apache.org/licenses/LICENSE-2.0

5.2.0 (2021-10-03)
=====================
Features
--------
- 1. Added support Python 3.10
  2. Started shipping platform-specific wheels with the ``musl`` tag targeting typical Alpine Linux runtimes.
  3. Started shipping platform-specific arm64 wheels for Apple Silicon. (`#629 <https://github.com/aio-libs/multidict/issues/629>`_)
Bugfixes
--------
- Fixed pure-python implementation that used to raise "Dictionary changed during iteration" error when iterated view (``.keys()``, ``.values()`` or ``.items()``) was created before the dictionary's content change. (`#620 <https://github.com/aio-libs/multidict/issues/620>`_)

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 ...{python3-multidict_5.1.0.bb => python3-multidict_5.2.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-multidict_5.1.0.bb => python3-multidict_5.2.0.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-multidict_5.1.0.bb b/meta-python/recipes-devtools/python/python3-multidict_5.2.0.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-multidict_5.1.0.bb
rename to meta-python/recipes-devtools/python/python3-multidict_5.2.0.bb
index 3ec271a0f2..05b18fa0b5 100644
--- a/meta-python/recipes-devtools/python/python3-multidict_5.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-multidict_5.2.0.bb
@@ -2,9 +2,9 @@ SUMMARY = "Multidicts are useful for working with HTTP headers, URL query args e
 HOMEPAGE = "https://github.com/aio-libs/multidict/"
 
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e74c98abe0de8f798ca609137f9cef4a"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=84c63e2bcd84e619d249af5181e2147f"
 
-SRC_URI[sha256sum] = "25b4e5f22d3a37ddf3effc0710ba692cfc792c2b9edfb9c05aefe823256e84d5"
+SRC_URI[sha256sum] = "0dd1c93edb444b33ba2274b66f63def8a327d607c6c790772f448a53b6ea59ce"
 
 inherit pypi setuptools3 ptest
 
-- 
2.25.1


