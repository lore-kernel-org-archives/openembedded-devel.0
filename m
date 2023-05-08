Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48B8CC77B75
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 10:10:18 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web10.103682.1683540611980499562
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 03:10:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=x0qqaYeI;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1683540610; i=@fujitsu.com;
	bh=dG63WOcx2BLAKRIq5iYwrEmLijV1LhB4Xl7wkFR2a5M=;
	h=From:To:Cc:Subject:Date:Message-Id;
	b=x0qqaYeINWFEE4eWZGWkwFvBKpx2pCjayabkJtXlLr/5EWKb1zY7tPcohuHglTmYP
	 rqCVXqAyYeFo9djOSL/FqlpWnlY6qsCkTyExnkxPKBdrBnje4UTZrtb9X86knDl+fx
	 9ZXdAuOO7bUHtAuhkKB/OinTYajWyikdV7bEL9mR4ELoRy7TmmCpNMA4YSbLZ8bpnp
	 qVneKUFkfgpemnKNIboOP2qStabmxOVEGPSyXXJVfUxZ6E3JXS8MapXkZEKmMobZ8D
	 1+6b8kwGJ3bNlyaSsZmk4ZTQCr+ELTHsdTppkPoUal+LxU9g8PEuoP9b1MjHP/uZ4o
	 y/ziIEpgn9H0Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKLMWRWlGSWpSXmKPExsViZ8ORpNt4KiL
  F4Hm/ocXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvFo9g6mgjMcFafP7mVtYHzC3sXIxSEksJFR
  YvrzQ0xdjJxAzjQmiUu3UkBsNgEJiel7T7KD2CICuhIfP8xlBLGZBVQkZkw+AlYvLOAi8X3dQ
  VYQm0VAVWLZ8QNg9bwCThJdd66AxSUEFCSmPHzPDGGrSVw9t4l5AiPXAkaGVYxmxalFZalFuo
  YmeklFmekZJbmJmTl6iVW6iXqppbrlqcUluoZ6ieXFeqnFxXrFlbnJOSl6eaklmxiBPk4pZt2
  8g3Hbrr96hxglOZiURHlND4alCPEl5adUZiQWZ8QXleakFh9ilOHgUJLgbdsWkSIkWJSanlqR
  lpkDDDeYtAQHj5IIr+wRoDRvcUFibnFmOkTqFKMux9qGA3uZhVjy8vNSpcR5mU8CFQmAFGWU5
  sGNgIX+JUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvJtPAE3hycwrgdv0CugIJqAj/C+Hgx
  xRkoiQkmpgkpHZMqPWffUS0+4NOV8ZxNwl/gWrK5rarw3K32L+7XjaK5n3u9U+/rSSu/JUI+S
  h3qPmt0v4Hm+8JqCdIpzAuqhS2V9d77zSMw3rxSnsRWpOLV1mGyxUjobx5ZVPy81os01t7qxp
  /V+QtFL2+SN2QQ35aWEb/2VtjU7aPTUhbOE1iRsCOzeHVbP1+EY8WWe3zt1rg1Ge4JRnLMvFc
  6JDwifOzw9SzYuOYuMx6uTlyuSYaa7S90V3pvBc+Wax9/Nb1rBJqlc4dD0zu/pXIGDZYp0pD7
  bZ6xi5bNugd/SB/+XztZ4FsabrnGRXz38c0MTv0/G9/FH7U2fdgw37//V4z14xubPSn20la//
  NJUosxRmJhlrMRcWJAL3ixuj4AgAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-587.messagelabs.com!1683540609!497500!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13791 invoked from network); 8 May 2023 10:10:09 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-20.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 May 2023 10:10:09 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 6A8A41D5;
	Mon,  8 May 2023 11:10:09 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 91F731D2;
	Mon,  8 May 2023 11:10:08 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] makedumpfile: upgrade 1.7.2 -> 1.7.3
Date: Mon,  8 May 2023 18:09:56 +0800
Message-Id: <1683540600-25325-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 10:10:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102401

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{makedumpfile_1.7.2.bb => makedumpfile_1.7.3.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-kernel/makedumpfile/{makedumpfile_1.7.2.bb => makedumpfile_1.7.3.bb} (96%)

diff --git a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.2.bb b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.3.bb
similarity index 96%
rename from meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.2.bb
rename to meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.3.bb
index 1c3538a3da..0ae691b39b 100644
--- a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.2.bb
+++ b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.3.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 LICENSE = "GPL-2.0-only"
 
 SRCBRANCH ?= "master"
-SRCREV = "9fefc6848d0b3765760e709cfe92fb9d76d5d452"
+SRCREV = "ecc9355e1344d3de94870e855e380ee84224e552"
 
 DEPENDS = "bzip2 zlib elfutils xz"
 RDEPENDS:${PN}-tools = "perl ${PN}"
-- 
2.34.1


