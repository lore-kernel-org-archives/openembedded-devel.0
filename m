Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13225C76196
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 05:13:38 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web11.65388.1679548407839707981
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Mar 2023 22:13:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=jA2Ok0/s;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679548406; i=@fujitsu.com;
	bh=qsROCSt+ZbT+jX40QlL7lKKcM5Oa/mNo771fTN3TtEY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=jA2Ok0/s8MQndjiW9wOxl026gZCr+cqdawYwL/UijpVUsUQg9jY3NF1j54VU4bxh2
	 v8XEuSU3JJ8Y8+NicIB+ztmM2ibF+e6A5ATNBBMF8ifjzuqSosvQPGwoxTQSerIv3m
	 CgbpS8WnMxzA0nOI3R+w3BoleOfq2aTOX3LwxLSGymP2LDScPj0A1GBx5nipbs6+S4
	 cv/aJoO4d68buj8vHxb73bt4qW9vZiaQ/QDnlGmHCsOR7QcfP0qwGVFj9KWvz4e4oX
	 BU0zRKGFZjpYFbBD7V4fQDcweGVPX2iVhLTKpTfYQKXFZb4sgZuTYWBE9rRLVC8iNm
	 pNI5kzZv9rn+A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8MxSffrfek
  Ug8adHBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8afS+9YC1q4KnZ3PGBvYJzE2cXIxSEk8IRR
  on3mbkYI5zqTxKFXrVDOHkaJWT9OMHUxcnKwCUhJ3Lj/nw3EFhHQl1g6ew8ziM0soCLx4ncPO
  4gtLOAl0XZjAyuIzSKgKvF72kewXl4BJ4nJO9aC1UsIKEhMefgezOYUcJa48uQiC4gtBFTzfP
  s0Foh6QYmTM5+wQMyXkDj44gVUr6LE7MvNLBB2hUTj9ENMELaaxNVzm5gnMArOQtI+C0n7Aka
  mVYxmxalFZalFuoYGeklFmekZJbmJmTl6iVW6iXqppbrlqcUluoZ6ieXFeqnFxXrFlbnJOSl6
  eaklmxiB4ZtSzJi8g/Fq31+9Q4ySHExKorwSodIpQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4B
  e4A5QSLUtNTK9Iyc4CxBJOW4OBREuGdexAozVtckJhbnJkOkTrFqCglzrv8HlBCACSRUZoH1w
  aL30uMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHl1QKbwZOaVwE1/BbSYCWhx3AwJkMUliQg
  pqQYmtuZjbGlH18RVnSh6siW8qOoT2/nCasO7O1wuhpU9eS80zeUA77/fntLT6xwbxCddf634
  snHNESYbid1ypxkfNaWwH7CYudKiMr3j4JuyMHfXzJs/8ozYfzwL+b7ZWPXl8herNkh9PJp24
  bvupYteeU/FWje/LZwYM2v3Ss27k9xc1VcI/natfHUktVzCb8csz2fVfXsNIl9PlMhd/NX0+s
  FDS3cIbPro//Ygy9qZisWhjBMKxVd+fMB300jSuW6ewaytXcsb1kqsnsj4fKVzk6dyZlKfaa7
  SBnnXjyqbshcy9RrvOd65TNY+pGfGxA8P+rT2/nnHXX+/aNc/1st3FjW/mXTf6g3zjZPp23m7
  VZVYijMSDbWYi4oTAcqmuzFaAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-591.messagelabs.com!1679548404!170439!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20961 invoked from network); 23 Mar 2023 05:13:25 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-7.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 23 Mar 2023 05:13:25 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id B9D561000EE
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 05:13:24 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id AD6F21000E9
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 05:13:24 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 23 Mar 2023 05:13:23 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-rapidjson: upgrade 1.9 -> 1.10
Date: Thu, 23 Mar 2023 13:12:53 +0800
Message-ID: <1679548374-20397-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1679548374-20397-1-git-send-email-wangmy@fujitsu.com>
References: <1679548374-20397-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 05:13:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101655

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 Use current master version of rapidjson
 Produce ppc64le wheels, thanks to mgiessing (PR #170)
 Use cibuildwheel 2.21.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-rapidjson_1.9.bb => python3-rapidjson_1.10.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-rapidjson_1.9.bb => python3-rapidjson_1.10.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-rapidjson_1.9.bb b/meta-python/recipes-devtools/python/python3-rapidjson_1.10.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-rapidjson_1.9.bb
rename to meta-python/recipes-devtools/python/python3-rapidjson_1.10.bb
index 8b50aabb7..7dac464be 100644
--- a/meta-python/recipes-devtools/python/python3-rapidjson_1.9.bb
+++ b/meta-python/recipes-devtools/python/python3-rapidjson_1.10.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4daf3929156304df67003c33274a98bd"
 
 SRC_URI = "git://github.com/python-rapidjson/python-rapidjson.git;protocol=https;branch=master"
-SRCREV = "8f4ab8e197ca30c03726b675ae7cce6ac9d6622e"
+SRCREV = "e9e209553a65db3568471f32392f54549c8a9816"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


