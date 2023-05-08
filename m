Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 610B7C7EE2C
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 10:24:58 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web10.103898.1683541493289546922
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 03:24:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=jIv9xvIy;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1683541491; i=@fujitsu.com;
	bh=x8a33nRfYRWQ4yZwrR4hgm1/hJJ+9QOLAEt4oIDZvxc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=jIv9xvIy+fySV7EEaYjLDh3qFYFFdtExUs+1jyGRVlcOvoUv2LLN/fgxIO/aA/0M4
	 mexFxx4+Xwi4rYBKwd9r22QEgEAEK292zOGyLYMCGxyrQSxCj6cK8uVPSc21qgsrGv
	 Gnz6WXCsLy7OZ5as399CJo+AGf4B5KxJ0ZU/v//ZStOfbPDTSLEmQ34qjDO2p0+e9p
	 ZsEi3QF0Z4iXelzo/h27S3f3YnrTrfHAKTh7JNMx/nuAQ3JscwaiIVKHcfmUocXsxc
	 GEqsJ5eBF5OvjtgaxFpMtUDmqqW0L0kVM7BS3b4b8FqOxKtNeS9ZBM54aCU7MGfqDD
	 Wb2EWeyuy5lpw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrILMWRWlGSWpSXmKPExsViZ8ORpPv5bES
  KwaurnBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aGH/fZC/4IVOzv2sPYwLiJr4uRi0NIYCOj
  xKYvvYwQzjQmiSnHV7J1MXJysAlISEzfe5IdxBYR0JX4+GEuI4jNLKAiMWPyESYQW1jAV2LL1
  i6wOIuAqsSfZz+YQWxeASeJp02rwHolBBQkpjx8DxbnFHCW2Nq3FaxeCKjmVnMvM0SNmsTVc5
  uYJzDyLGBkWMVoWpxaVJZapGuml1SUmZ5RkpuYmaOXWKWbqJdaqlueWlyia6iXWF6sl1pcrFd
  cmZuck6KXl1qyiREYEinFLG93MH7a+VfvEKMkB5OSKK/pwbAUIb6k/JTKjMTijPii0pzU4kOM
  MhwcShK8LqcjUoQEi1LTUyvSMnOA4QmTluDgURLhlT0ClOYtLkjMLc5Mh0idYlSUEufdegYoI
  QCSyCjNg2uDxcQlRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8acAIE+LJzCuBm/4KaDET0G
  L/y+Egi0sSEVJSDUzmdexOaudi0pVkmmdtV486ULF3pYR7zuZ5Uv0dPBc2aW47nhd2+/9nxd4
  tzMXq9gcvXuDaJ9+Q193Qp7vg0NPLN8zWmMq/Yg06dLu8+mtVgpfBqZMv55/RO/0w/LeCw9Va
  o/8eP68zz3O79ufKuS2ezd5fn7hVbLg79XOuQeT9ugmuT65y7Phc9XTB8XlicdIKV+6Hzu/t9
  A1vr2gJW/3vlPvnzaqJTOF9P9mbWm+WKL2cXGE77cZt7dnTLCuWbJXhn6/9tWRh2w9Hw2vHxJ
  132F95t1TYzti70bupT/rJS+vGRleXTxoy2j9r9k4T3SL4ctniRdaVVmL7VV5PP8FR+jI7mGP
  ujP9XDj8KePFWiaU4I9FQi7moOBEASM9obgQDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-585.messagelabs.com!1683541490!503851!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2583 invoked from network); 8 May 2023 10:24:51 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-7.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 May 2023 10:24:51 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id C26C51D4;
	Mon,  8 May 2023 11:24:50 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id E8BAC1D2;
	Mon,  8 May 2023 11:24:49 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-twitter: upgrade 4.13.0 -> 4.14.0
Date: Mon,  8 May 2023 18:24:35 +0800
Message-Id: <1683541475-25799-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1683541475-25799-1-git-send-email-wangmy@fujitsu.com>
References: <1683541475-25799-1-git-send-email-wangmy@fujitsu.com>
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 10:24:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102431

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
New Features / Improvements
------------------------------
    Add constants for potential model object fields (f3f73bc)
        DIRECT_MESSAGE_EVENT_FIELDS
        DM_EVENT_FIELDS
        LIST_FIELDS
        MEDIA_FIELDS
        PLACE_FIELDS
        POLL_FIELDS
        PUBLIC_SPACE_FIELDS
        SPACE_FIELDS
        PUBLIC_TWEET_FIELDS
        TWEET_FIELDS
        USER_FIELDS
    Add creator_id field for Space (a13726a)

Twitter API Backwards-Incompatible Changes
-------------------------------------------
    Remove support for streaming with Twitter API v1.1 status/filter endpoint (c8a02eb)
        Stream
        AsyncStream
    Remove support for deprecated Premium v1.1 Search APIs (a955f30)
        API.search_30_day
        API.search_full_archive

Misc
------
    Overhaul Getting Started documentation (addb9f7)
    Remove no longer valid Twitter API version badges in README (880e7bf)
    Update and improve various documentation

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-twitter_4.13.0.bb => python3-twitter_4.14.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-twitter_4.13.0.bb => python3-twitter_4.14.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-twitter_4.13.0.bb b/meta-python/recipes-devtools/python/python3-twitter_4.14.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-twitter_4.13.0.bb
rename to meta-python/recipes-devtools/python/python3-twitter_4.14.0.bb
index e780a753e0..68908bb64e 100644
--- a/meta-python/recipes-devtools/python/python3-twitter_4.13.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twitter_4.14.0.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "Python module to support twitter API"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=9;endline=9;md5=8227180126797a0148f94f483f3e1489"
 
-SRC_URI[sha256sum] = "097425335f9f6674826ba7e72b2247bbca39c9ca0a0bd82f30a38a5bef8c6c88"
+SRC_URI[sha256sum] = "1f9f1707d6972de6cff6c5fd90dfe6a449cd2e0d70bd40043ffab01e07a06c8c"
 
 PYPI_PACKAGE = "tweepy"
 
-- 
2.34.1


