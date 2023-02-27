Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A041C64ED6
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 08:06:11 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.85452.1677485167662481566
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Feb 2023 00:06:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=q7DMY+vX;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677485165; i=@fujitsu.com;
	bh=hRp71j1R9wLX5XlkBET1S4hdjITdxdAeUzrxuwLz2vQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=q7DMY+vX8a97s3qsWFYY+smL0R9qWKrDmgfjwu4xK7T9fqk1eNkE4rO7AvVajbPqB
	 Ylbflja/UGGj3HKXt76l5VsDBKqHAHiJ3+HDz1tKbX5eYg/wijbNZIE8pSfFkeRQrB
	 r9c1UPZ8S9hiwVWYAl7/jhf6XIIvVaTKKLwFa5z/ZchdNgrZL4S+0L4zyQmp+NoSLL
	 UyIJkNyVBHPSQ3tfq5bn38wn4ZEVnM7IuKYZyLOikOM9qOEVB1tc0ybqMs0B2A6doP
	 8jVOby+V2BO9hVbqPnVtCQvnkwNjcYa5fWEzzwDM1aIpYCZ3PTKUjP19UODLYZqRPZ
	 MFEHUJ98LsLUg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8MxSTc35U+
  ywd7dkhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aSQ80sBW95K+7f2M/YwLiSp4uRi0NI4Amj
  xO2tZxkhnBtMEleutrJAOHsZJZ6euAbkcHKwCUhJ3Lj/nw3EFhHQl1g6ew8ziM0soCLx4ncPe
  xcjB4ewgI/EvwPGIGEWAVWJzpsHmUBsXgEnicPv+lhBbAkBBYkpD9+DtXIKOEu8enYYbKQQUM
  3jE7ug6gUlTs58wgIxXkLi4IsXzBC9ihKzLzezQNiVEq0ffkHZahJXz21insAoOAtJ+ywk7Qs
  YmVYxmhenFpWlFukamuslFWWmZ5TkJmbm6CVW6SbqpZbq5uUXlWToGuollhfrpRYX6xVX5ibn
  pOjlpZZsYgSGb0px0p0djDv7/uodYpTkYFIS5V3k9CdZiC8pP6UyI7E4I76oNCe1+BCjDAeHk
  gTvwSSgnGBRanpqRVpmDjCWYNISHDxKIrzMRkBp3uKCxNzizHSI1ClGRSlxXr5EoIQASCKjNA
  +uDRa/lxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ80YlAE3hycwrgZv+CmgxE9Di7Q9/gCw
  uSURISTUwrRddX7o/7YGHUccPnTPzGxL/OJy+WXHn2+TEju7oS3p7N+jV25cVKd7ztBO8z7qQ
  e9Wd//cXfHq+tWWfhMAtni/bT9vc6vB5fILb41Fj74y3VgKv7r8VuC58rnWKcfOTJFfeLZcnR
  dzs8zn+LFpyx7/Otc/i9Vb0NH1Xu2uV/6JZ7d3lZyyzc3UOhf74rpdTnrtY4s6iH87ip/qd6r
  4wu97eE/acWZdd6GwC473jRxR1mcWrDIO964VXPX1YJxUyr2Ta/cZNCd3WN1Y9i/W+7NmzQjV
  aerc2y9QoQ5Vtr63N8/ud3F9M/m4rftxDxL6kN1Fo/zPvi++8V2sK2ka6lRWfM2Ve9kwkx6pm
  yt0zSizFGYmGWsxFxYkALQ+++loDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-732.messagelabs.com!1677485164!212068!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5537 invoked from network); 27 Feb 2023 08:06:05 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-18.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Feb 2023 08:06:05 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id B5C1A1000DC
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:06:04 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id A9D341000D7
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:06:04 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 27 Feb 2023 08:06:03 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-bitarray: upgrade 2.7.0 -> 2.7.3
Date: Mon, 27 Feb 2023 16:05:50 +0800
Message-ID: <1677485153-11495-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1677485153-11495-1-git-send-email-wangmy@fujitsu.com>
References: <1677485153-11495-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:06:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101269

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 * fix popcount64 name conflict on NetBSD, #189
 * even though PyPy is not actively supported, allow running tests for
   PyPy 3.7 and 3.8, see also #188
 * allow running `python setup.py test`
 * add official Python 3.12 support
 * simplify count functionality in util module
 * retire `bitcount_lookup[256]` table
 * improve `util.count_n()` error messages
 * avoid `util` module tests from being run more than once in each
   call to `bitarray.test()` when called multiple times in the same
   Python process, see #6e52e49a
 * improve testing

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-bitarray_2.7.0.bb => python3-bitarray_2.7.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_2.7.0.bb => python3-bitarray_2.7.3.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_2.7.0.bb b/meta-python/recipes-devtools/python/python3-bitarray_2.7.3.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-bitarray_2.7.0.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_2.7.3.bb
index 269ac83ad..f766692a0 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_2.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_2.7.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
 
-SRC_URI[sha256sum] = "00bb723cf7059e30b328b6568b3b75c0f652ec9228d959d54e997852a31a31a2"
+SRC_URI[sha256sum] = "f71256a32609b036adad932e1228b66a6b4e2cae6be397e588ddc0babd9a78b9"
 
 inherit setuptools3 pypi
 
-- 
2.34.1


