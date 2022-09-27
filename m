Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 091B4C6FA86
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 09:11:23 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.8824.1664269872670877131
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 02:11:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=G1XS0AxN;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1664269871; i=@fujitsu.com;
	bh=GKJ3jWfgTtJ6IBeifWV++F6r0Yu0EPKl3xpfiBC5F4I=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=G1XS0AxNZzDQnSO5o/m3Z9+hA/C8jpZAXvFVwi2MyeCWQHYXnKY7iSDLeTiLWG8d1
	 xLCcU58nNFaseBa6M4R5qYa1PpGNagwwn91OGNqUh8OTRfS46g4iKN8/8iWNQwqYJG
	 FilNGUqc+y6ckdY7Tc5r1Hx+8gRFk0ej6hLiHouORwmbCUJC7nNk0PODlzXJs9D04W
	 FcmkT4ods9xoYohhtEBgnSvUWwp3ocNnyQA2jP9lZW07CQ5Rl6Frm0IssaEYMQwI4w
	 szWCN6jcERipLIz1uvRYL8FrAWk8Ea3LMDBCDNgM5BOqHUZuhn0v0nNnG8n2et9Ccg
	 ADa2SM/C9s7Yg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAIsWRWlGSWpSXmKPExsViZ8MxSVdvn1G
  ywb33RhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0Z3ewtbwQyuirkX9zE3MC7j7GLk4hASeMIo
  8WXDfFYI5zqTxLuGOywQzh5GiW2zlwJlODnYBNQkpt+6AWaLCOhLLJ29hxnEZhZQkXjxu4cdx
  BYW8JL4/O87C4jNIqAq8eVwHxuIzSvgKPGy9RwTiC0hoCAx5eF7Zoi4oMTJmU9YIOZISBx88Y
  IZokZRYvblZhYIu0KicfohqF41iavnNjFPYOSfhaR9FpL2BYxMqxitk4oy0zNKchMzc3QNDQx
  0DQ1NdY1NdQ0tTPQSq3QT9VJLdctTi0t0jfQSy4v1UouL9Yorc5NzUvTyUks2MQIDM6VYeccO
  xrZVP/UOMUpyMCmJ8tovMkoW4kvKT6nMSCzOiC8qzUktPsQow8GhJMEruRsoJ1iUmp5akZaZA
  4wSmLQEB4+SCO+6JUBp3uKCxNzizHSI1ClGXY6ZX9sOMAux5OXnpUqJ85puASoSACnKKM2DGw
  GL2EuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHlN9wBN4cnMK4Hb9AroCCagI+z49EGOKEl
  ESEk1MPVuqVezO2/Ols2iZHT/ukLd43XL4z/LzHI5zlTwc3Ho253c9VVfp/vUcb96vc/WxkD3
  oMme9AdLvk9b871dNHK7Z+z+tY0TJN4fulr0av3/jp71YozGf9jeOkqGKPudiFHdeC3x0PM1x
  z1D40Nb2X1n+q30LNjMK+iwxbI2rfWNVA/nwZaq1wK5k+994rh/92xB4lYD/ezlKQxFzWvmFx
  e/1XIOPpgi8DtquVLjxSSOCdXikSmC7Nwlf5SNY5cd754/I2P327KiSatP8gU6xSzgEwn3frF
  socO7A8HWMmuf79Qwqxa7u5rjzr1bbl8fGOp43J04Kb9W9+V6djOHyJchAqytFo+3CoWfe3xP
  XImlOCPRUIu5qDgRANH9WH9TAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-548.messagelabs.com!1664269870!15923!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22875 invoked from network); 27 Sep 2022 09:11:10 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-5.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Sep 2022 09:11:10 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 89BDE1000CE
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 10:11:10 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 657C81000E9
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 10:11:10 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 27 Sep 2022 10:11:08 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-path: upgrade 16.4.0 -> 16.5.0
Date: Tue, 27 Sep 2022 17:11:00 +0800
Message-ID: <1664269861-2695-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Sep 2022 09:11:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98984

Changelog:
==========
 Refreshed packaging.
 #197: Fixed default argument rendering in docs.
 #209: Refactored write_lines to re-use open semantics. Deprecated the linesep parameter.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-path_16.4.0.bb => python3-path_16.5.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-path_16.4.0.bb => python3-path_16.5.0.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-path_16.4.0.bb b/meta-python/recipes-devtools/python/python3-path_16.5.0.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-path_16.4.0.bb
rename to meta-python/recipes-devtools/python/python3-path_16.5.0.bb
index 10b112860f..3dc5d7cdec 100644
--- a/meta-python/recipes-devtools/python/python3-path_16.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-path_16.5.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "A module wrapper for os.path"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
 
-SRC_URI[sha256sum] = "baf2e757c4b19be8208f9e67e48fb475b4a577d5613590ce46693bdbdf082f52"
+SRC_URI[sha256sum] = "2722e500b370bc00d5934d2207e26b17a09ee73eb0150f651d5a255d8be935a2"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.25.1


