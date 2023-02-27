Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 607E9C7EE2D
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 08:07:51 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web11.85484.1677485270509363126
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Feb 2023 00:07:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=VJUFN3bZ;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677485268; i=@fujitsu.com;
	bh=ygL9A4lLjWcmuf4QksdcZZ66C79RXNjOtLZwMZVofUg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=VJUFN3bZE4WuGBDs1IFkWgIrwIobnl+1HMp1ZHwYYpV1leuNC4Lep5cHGyUEF1Fkz
	 hsquB9hGBiSf6mru0xUnZADbggZ16FharRHB+iVFzeCqB3b+n8iuVtlDEKpCqSEXuB
	 my//WrCgMEeFp3adIRDt40GqEfTgUEgxY7UoF25IgikrnEEdW9tlAa5ErCAJWThOP9
	 tMIh4lEj/ONUJy6FsergRYge49kIxpoLYRs3ZMrx3DRK+3xNwtal/Vm54JDQP4JIUv
	 d1q/RAGJlJMfEo1k3MHdq7BeIc2BZzirLePaJQem/KlvEwExH4BsCRpq7X2WGz3O9Y
	 xx9c6djunIdlw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8ORqHsl5U+
  ywZm50hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bviRtZC+ZxV/z+dZS9gfEwVxcjF4eQwBNG
  iYs7pjFCODeYJKYuOQTl7GWU+Ld0KlsXIycHm4CUxI37/8FsEQF9iaWz9zCD2MwCKhIvfvewg
  9jCAnES03YtYAKxWQRUJe69PssCYvMKOEls+T2DEcSWEFCQmPLwPVgvp4CzxNWWbrBeIaCazQ
  fPMEHUC0qcnPmEBWK+hMTBFy+YIXoVJWZfbmaBsCslWj/8grLVJK6e28Q8gVFwFpL2WUjaFzA
  yrWI0K04tKkst0jU00ksqykzPKMlNzMzRS6zSTdRLLdUtTy0u0TXUSywv1kstLtYrrsxNzknR
  y0st2cQIDN+UYuYXOxh/9P3VO8QoycGkJMq7yOlPshBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3
  oNJQDnBotT01Iq0zBxgLMGkJTh4lER4mY2A0rzFBYm5xZnpEKlTjIpS4rx8iUAJAZBERmkeXB
  ssfi8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEuaNSgCawpOZVwI3/RXQYiagxdsf/gBZXJK
  IkJJqYGIR5JPcsfKHTba4q/ESxQ6vLartqoprrPbLrsmTmMxprvb+rNIbF0bzjrvKnQvbIycw
  RV1zYt4eUxj23VyoXP3FpMJTmTzHHuybl+DW67RoUnL80tZZ8Y1ZefG83I91alflSmZYb2Pe+
  iD+24FvC4+feXtQ/4KuW1Oud5f/Va1/8bHLGI9GlH7/tMurZGtiTM9lntxCPqH65zxJ/PmRc5
  pcl3GHlMovOZD6qe2ngvXKjxULyhKlfzzslzwbp7VJmvu5k8C63g2sq922Zzgkv5mkxjVzn8o
  7sYXuv19dSlBvlTHbzTGH42HHpp4YldU8209W1x2yUH65heU1q96eqMK21qdLO4v6n+VHra9S
  YinOSDTUYi4qTgQAEyqScFoDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-591.messagelabs.com!1677485268!212634!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14548 invoked from network); 27 Feb 2023 08:07:48 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-22.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Feb 2023 08:07:48 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 1259110018D
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:07:48 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 058BF100182
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:07:48 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 27 Feb 2023 08:07:46 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-api-python-client: upgrade 2.77.0 -> 2.79.0
Date: Mon, 27 Feb 2023 16:07:31 +0800
Message-ID: <1677485254-11554-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1677485254-11554-1-git-send-email-wangmy@fujitsu.com>
References: <1677485254-11554-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:07:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101274

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
https://github.com/googleapis/google-api-python-client/blob/main/CHANGELOG.md

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ent_2.77.0.bb => python3-google-api-python-client_2.79.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.77.0.bb => python3-google-api-python-client_2.79.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.77.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.79.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.77.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.79.0.bb
index 8e5ab75d0..5c9ade091 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.77.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.79.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "f18e9dbb365f0485194a8daf5d60da2cff6a80ce2c9a694efc2b279922cb3dd0"
+SRC_URI[sha256sum] = "577c0aeae1eb3c754eacb9122d369d67609fef759bc6a4fa16cafeab4f30019b"
 
 inherit pypi setuptools3
 
-- 
2.34.1


