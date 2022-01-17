Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F32A3C433FE
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 00:29:18 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web12.4942.1642379357855857220
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Jan 2022 16:29:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=lexv+Tru;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1642379355; i=@fujitsu.com;
	bh=uRRR8OBZ1sRFIn61l1kuNS44C0iYs5Z8fCeBCnYrSmw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=lexv+Tru42DE1VPC+EbciVWJy2mCEVUVXKaEZmDlzYD8QcgidmrdLzEX+MGYI+l6/
	 1/RnzyKfLH8wFVRAIeB9yK3Ko06OGZ79wOeuTkh9jA2jkoXfJOLbsT7dSAJY7SdMhN
	 qtHKxK4IcmvOZmCUi8pzvf4FLPG5DnQDHlF/VzjGZiHe2+bzOXMbVvatEDwjuFZl3f
	 6xidvZctX5S9leLPNlXp0PBoxVIU175J+sdCcFzsQZXZhj0JacsVTbKt/zE1qb2VUV
	 Wp01mEa7tYtnUbSiP7lpw5LrIv80KRFZZn20CbGUolFtsMZadHIUpFX5AA3DxU6VSZ
	 16/Drpb6eqBXw==
Received: from [100.115.7.63] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.ess.symcld.net id 05/F7-14524-B58B4E16;
 Mon, 17 Jan 2022 00:29:15 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRWlGSWpSXmKPExsViZ8ORqBu140m
  iQcc2U4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePgW82CZWIVj1ZsYmxgPCXcxcjFISTwhFHi
  yYZHrBDOBSaJn5famCGcE4wSB2ZMZexi5ORgE1CTmH7rBiuILSKgL7F09h5mEJtZQEXixe8e9
  i5GDg5hAXeJ/8+SQMIsAqoSqy/fBSvnFXCSWLxzBZgtIaAgMeXhe7BWTgFnidbVV5hBWoWAao
  6sq4coF5Q4OfMJC8R0CYmDL14wQ7QqSsy+3MwCYVdIzJrVxgRhq0lcPbeJeQKj4Cwk7bOQtC9
  gZFrFaJVUlJmeUZKbmJmja2hgoGtoaKprqGtkaK6XWKWbqJdaqlueWlyia6iXWF6sl1pcrFdc
  mZuck6KXl1qyiREYwCnFjDd3MLb2/dQ7xCjJwaQkyhvy5VGiEF9SfkplRmJxRnxRaU5q8SFGG
  Q4OJQne2m1PEoUEi1LTUyvSMnOA0QSTluDgURLhZdsOlOYtLkjMLc5Mh0idYlSUEuddB5IQAE
  lklObBtcEi+BKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd4FIFN4MvNK4Ka/AlrMBLR41cd
  HIItLEhFSUg1MSxb+fStQekTl+iRv24+fsqUst9Sd9Ht/bB2rv+jJawyZ+vnK53yMrq0s//+x
  4e5M2dP1515U/JaQ3ltXJvLcyp6RbVeMvezJLo7uA5Ual9c/WxX4Q2BFctQDvbXlryQaq++9O
  zEtj2GWyXLZLa+vnguSkvn7zXjezXZvF3vjkJfiwa4HnZ+HWr9OvHNu4+9n966Wn1e9d0Fz6d
  yQE9Ji/PVvDVd+3Rmy6qeCxokt6SvObN4/N6SoKtYo73lYL7+3f2b72Terc169mvf7YHhPvEz
  9tYDLHs5L3sZKf3duv93D8f3YBlFdmVcsxm/mRnDdVozuqlRaILDo5bLE2OIu3eXzJBa7t7SG
  Fxt++FX4QomlOCPRUIu5qDgRAP3XGE9bAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-587.messagelabs.com!1642379354!163221!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9330 invoked from network); 17 Jan 2022 00:29:14 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-3.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 17 Jan 2022 00:29:14 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 6DED210019A
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jan 2022 00:29:14 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 536A8100194
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jan 2022 00:29:14 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 17 Jan 2022 00:29:07 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] nlohmann-json: upgrade 3.10.4 -> 3.10.5
Date: Mon, 17 Jan 2022 08:28:54 +0800
Message-ID: <1642379337-12144-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1642379337-12144-1-git-send-email-wangmy@fujitsu.com>
References: <1642379337-12144-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Jan 2022 00:29:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94889

License-Update: year updated to 2022.

Changelog:
=========
Bug fixes
---------
Make sure C++17 filesystem conversions are only used if the compiler supports
it. Furthermore, add defines JSON_HAS_FILESYSTEM and
JSON_HAS_EXPERIMENTAL_FILESYSTEM which can be set to 0 to avoid using
filesystem support altogether.std::filesystem. #3090 #3097 #3101 #3156 #3203
Fix a compilation error with Nvidia CUDA Compiler (NVCC). #3013 #3234

Warnings
---------
Fix a warning for shadowed variables. #3188 #3193
Fix a warning on a pointless comparison. #3227 #2712 #2676 #1390 #755

Improvements
------------
Add a parameter to the update function to recursively merge objects with common
keys. #3006 #3069
Extend std::hash and std::swap to work on any nlohmann::basic_json
specializations rather than just nlohmann::json. #3121

Further Changes
--------------
Tests and CI
Update CI to use Clang 14, GCC 6, and Clang-Tidy 14. #3088
Update cpplint. #3225
Add build step for the Nvidia CUDA Compiler (NVCC). #3227
Remove Travis CI. #3087 #3233
Compile and execute the test suite with C++17. #3101

Documentation
--------------
The mkdocs-based documentation in doc/mkdocs has been totally overworked. It now
has a unified structure, more examples, and contains all information from the
previous Doxygen-based documentation. The single source of truth is now the
documentation on https://json.nlohmann.me and in particular the API
Documentation. #3071
Removed Wandbox online examples. #3071
Fix typos, links, and parameter names in the documentation.
Add more examples. #3071 #3100

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{nlohmann-json_3.10.4.bb => nlohmann-json_3.10.5.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/nlohmann-json/{nlohmann-json_3.10.4.bb => nlohmann-json_3.10.5.bb} (82%)

diff --git a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.10.4.bb b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.10.5.bb
similarity index 82%
rename from meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.10.4.bb
rename to meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.10.5.bb
index 223b141d1..a69c5c7e5 100644
--- a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.10.4.bb
+++ b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.10.5.bb
@@ -2,12 +2,12 @@ SUMMARY = "JSON for modern C++"
 HOMEPAGE = "https://nlohmann.github.io/json/"
 SECTION = "libs"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.MIT;md5=441793d25a658d58d79a1f87516a6ad1"
+LIC_FILES_CHKSUM = "file://LICENSE.MIT;md5=f969127d7b7ed0a8a63c2bbeae002588"
 
 SRC_URI = "git://github.com/nlohmann/json.git;nobranch=1;protocol=https \
            "
 
-SRCREV = "fec56a1a16c6e1c1b1f4e116a20e79398282626c"
+SRCREV = "4f8fba14066156b73f1189a2b8bd568bde5284c5"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


