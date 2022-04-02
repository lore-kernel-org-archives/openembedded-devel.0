Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1AB2C48BD1
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:48 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.2631.1649136985499291257
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Apr 2022 22:36:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=whYk0H6V;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649136983; i=@fujitsu.com;
	bh=uAO5vbe/4OYB4tyPnDqGIDhk27+zbaMFvAfdzCmw60U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=whYk0H6VL41b5+1ftDYheKeBqngTfZy/0RVNA0I6LOE98HGdoTkQV6pH6p5HxOgCm
	 dxirEKhS3RETPJrjT2lJMp8Ieam3gK0UwieFxUg0tdH6ayDKkB6S6jwhqk0qtV+6P/
	 VEARaizOUSYTJQFUq+v5G5ItaL6+70l6Xd3war8OK2pohuGBB8N/R+Q7Mm+qw03hML
	 ULPTzT+hdrXogaUaS224CPsiEHHShRzlurukxffAcB5Rh7Z7RYE+5TO8MGLbws8unP
	 o0YfuuzC7hf9VxCKyZ/h8tvwY7YIgAQZq5kY+1skre09Kv0tgt+sszNVUMBAu8HWGt
	 IsNJUmLbHcdSg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRWlGSWpSXmKPExsViZ8MxRTf8qne
  SwcxVQhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8avZvOCTp6KHy8nsDcwTuXuYuTiEBKYxSSx
  /vBhZghnN6PE8bN32boYOTnYBNQkpt+6wQpiiwjoSyydvYcZxGYWUJF48buHHcQWFvCTeNzVz
  AJiswDFX/e3gPXyCjhJnN21B6xXQkBBYsrD90C9HBycAs4Sp5fVgYSFgEqefp3KCFEuKHFy5h
  MWiPESEgdfvGCGaFWUmH0ZYryEQIXErFltTBMY+WchaZmFpGUBI9MqRuukosz0jJLcxMwcXUM
  DA11DQ1NdYwtdI0MjvcQq3US91FLd8tTiEl0gt7xYL7W4WK+4Mjc5J0UvL7VkEyMwJFOK1a7s
  YNyz6qfeIUZJDiYlUd4zrt5JQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4T54FygkWpaanVqRl5
  gDjAyYtwcGjJMJ75CJQmre4IDG3ODMdInWKUVFKnPfBZaCEAEgiozQPrg0Wk5cYZaWEeRkZGB
  iEeApSi3IzS1DlXzGKczAqCfOeA5nCk5lXAjf9FdBiJqDF7854giwuSURISTUwVUrvm255X+9
  rS1fQFsXkw1XMH9/kyhRfM/ox8+ifW8vWCxcdT1nxuiAgQ1wvOC9Kadfy8BnMm1niZgh/LTnu
  Yu0ZoR7pEviWVVved11vrp1tjJKHaOaNmSbZiv9KFuVdMOF5W/nizj+9ay9TJVi++NfJ5uq2R
  aUwHHKY9GOpzCY9e5WLMfPmmnVyakXfff9v7p2NTOWmcTNYt/6bvSn3be+n01MTaktWv/y39h
  ZnvlDapWw9j8wzO1gTnd2lal8Y/6gIOvU5s9VKTHjS/EXLdaQj1TmnGXxK+ZOu89/hs+z9/Z4
  79tTLXo18vsY0cMfXhflntXnXB0VY+e5O19i14vR9y5y4pfHOxpedFixTYinOSDTUYi4qTgQA
  VkHzB0QDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-548.messagelabs.com!1649136983!93348!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21134 invoked from network); 5 Apr 2022 05:36:23 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-15.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 5 Apr 2022 05:36:23 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 2355aChF011600
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 5 Apr 2022 06:36:23 +0100
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 5 Apr 2022 06:36:20 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-protobuf: upgrade 3.19.4 -> 3.20.0
Date: Sat, 2 Apr 2022 20:32:46 +0800
Message-ID: <1648902767-19756-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1648902767-19756-1-git-send-email-wangmy@fujitsu.com>
References: <1648902767-19756-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Apr 2022 17:24:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96399

License-Update:
  modify the description of License: change from 3-Clause BSD License to BSD-3-Clause

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-protobuf_3.19.4.bb => python3-protobuf_3.20.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_3.19.4.bb => python3-protobuf_3.20.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_3.19.4.bb b/meta-python/recipes-devtools/python/python3-protobuf_3.20.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-protobuf_3.19.4.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_3.20.0.bb
index 85147544e7..5c4de4ac2b 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_3.19.4.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_3.20.0.bb
@@ -3,11 +3,11 @@ HOMEPAGE = "https://developers.google.com/protocol-buffers/"
 SECTION = "devel/python"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=19e8f490f9526b1de84f8d949cfcfd4e"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=53dbfa56f61b90215a9f8f0d527c043d"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "9df0c10adf3e83015ced42a9a7bd64e13d06c4cf45c340d2c63020ea04499d0a"
+SRC_URI[sha256sum] = "71b2c3d1cd26ed1ec7c8196834143258b2ad7f444efff26fdc366c6f5e752702"
 
 # http://errors.yoctoproject.org/Errors/Details/184715/
 # Can't find required file: ../src/google/protobuf/descriptor.proto
-- 
2.25.1


