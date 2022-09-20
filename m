Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC7F6C54EE9
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 02:31:14 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web08.7359.1663641065913880326
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 19:31:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=PzQYhT1a;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663641064; i=@fujitsu.com;
	bh=crkJ3mX+qnwk6daWpvklKtqo5JkSGBiGZE4/9POBPBY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=PzQYhT1acsTQfB5F5VDry2rOHPk5RzOesTZVHtF/6ELmctuxXwmmjt6izlFcdo1pa
	 u8fVtq3e4JgykGLmzSmuHXtiZ32CgEL52J9ZHRS50JUn/Be3Byk0P6kHAv68jti35x
	 4NzBGNgt140fI2JhI1ouJvEm9HEePtjg53SGRBCzTcCOvmgyzZfViwXn/NLTysvfol
	 w7ZcSIdRIrrQvrNLxkon5QFkgfMkyPOO59F+8oopcfOcQOZj7mTU4dXcQJQEcor7xO
	 P4okDQDvMFfIE0s3Nrc9c5TjYbr80AZA79szdDwVnc4XnYNlB3v+rW+G8GwCT8PfVF
	 rFoPdjEyoaZ5g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRWlGSWpSXmKPExsViZ8ORqPtcVTP
  ZYMELPYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPx7/NMBbs4K6a1r2JqYHzK0cXIxSEk8IRR
  4srWHmYI5zqTxKa3j5kgnD2MEs8OrGbvYuTkYBNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvH
  rAaYQE/iWOfVzGB2CwCqhLbFm0Aq+EVcJJYfPU/WFxCQEFiysP3UHFBiZMzn7BAzJGQOPjiBT
  NEjaLE7MvNLBB2hUTj9ENQvWoSV89tYp7AyD8LSfssJO0LGJlWMVonFWWmZ5TkJmbm6BoaGOg
  aGprqGpvqGlqY6CVW6SbqpZbqlqcWl+ga6SWWF+ulFhfrFVfmJuek6OWllmxiBAZmSrHyjh2M
  bat+6h1ilORgUhLl5arTSBbiS8pPqcxILM6ILyrNSS0+xCjDwaEkwWsvqJksJFiUmp5akZaZA
  4wSmLQEB4+SCK+cClCat7ggMbc4Mx0idYrRkmPq7H/7mTmWg8mZX9sOMAux5OXnpUqJ81qCNA
  iANGSU5sGNg0XyJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvJzKQFN4MvNK4La+AjqICei
  gGyrqIAeVJCKkpBqYFNYKx27hTJk3tVQi61fXSh++ubP097OvfmXcmPHoiFJvpVmO9V31tVt6
  gjXEFhxSOR8uwv4812qyZPdvWf4wBfOZghvPantmdC2bw+nPk8+1ITRt6ZFPT/0sGUN+983xz
  61YFLua4dyKrZ0HpBk3tO+5KFMcN7XvGWPyxEq+OY2BdWF5cz70Rolc4xLV3TyPd/r/4Kwi+c
  Mn5foETnb8cNtp2x/tvUjz0CKt9PdP82otKv8yB8s/nROeZ9nZEOq4cMaPa6wuZ//uUxF9/po
  zNOS2kMWOJG5fPyuJl4qiTvbXV3M3XzJvc2S4ueffsvYtzPyzym5sqvzPliu48b2FiZ/4iVWO
  oTuV2z+V2CmxFGckGmoxFxUnAgDZ13H4XwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-565.messagelabs.com!1663641063!319776!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5382 invoked from network); 20 Sep 2022 02:31:03 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-5.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Sep 2022 02:31:03 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 753E2100199
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:31:03 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 69528100197
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:31:03 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 20 Sep 2022 03:31:01 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-protobuf: upgrade 4.21.5 -> 4.21.6
Date: Tue, 20 Sep 2022 10:29:58 +0800
Message-ID: <1663640998-27922-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Sep 2022 02:31:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98897

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-protobuf_4.21.5.bb => python3-protobuf_4.21.6.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_4.21.5.bb => python3-protobuf_4.21.6.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_4.21.5.bb b/meta-python/recipes-devtools/python/python3-protobuf_4.21.6.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-protobuf_4.21.5.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_4.21.6.bb
index 537683000d..96b3d02120 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_4.21.5.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_4.21.6.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=53dbfa56f61b90215a
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "eb1106e87e095628e96884a877a51cdb90087106ee693925ec0a300468a9be3a"
+SRC_URI[sha256sum] = "6b1040a5661cd5f6e610cbca9cfaa2a17d60e2bb545309bc1b278bb05be44bdd"
 
 # http://errors.yoctoproject.org/Errors/Details/184715/
 # Can't find required file: ../src/google/protobuf/descriptor.proto
-- 
2.25.1


