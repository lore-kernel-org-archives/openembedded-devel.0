Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2176C433EF
	for <webhook@archiver.kernel.org>; Tue, 31 May 2022 09:45:56 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web11.47495.1653990349631937877
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 May 2022 02:45:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=a8mjKd4B;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653990347; i=@fujitsu.com;
	bh=cBjE5TCmLgJTpO5bul2RhlyQ6GVq8SY7KA+iRG1rPSk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=a8mjKd4B0EAcFa0rES5qIffIJB/gazJcHHuahuYDcyADbWdKLVcIvAZuCSBsflGPP
	 +V2LMGW09pDCZ2ZMegiMl4sEDNODduwxtyudni+q3jGpSLOrUG3PwcPCxRwn3kw14R
	 SODHCQJmUzDlpMZG6URXmsuAAw5xjfsLyC1vRxIJ8yBfx0QxoxMJDJDgec/o24ErKF
	 7Lt3H065DvxcoHbNwG3gnJBFFk7D4NbzAed/8yuIYDwMpFI8OVz4lxKS3DD+GE6jed
	 vmQt7XiyB/fMuld4kQ9KHICTmxUYVrSnwbJ6DD08qdUx7YrnVdDMjIKfUw9MFZXL/J
	 oltFtTS3ji21w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEIsWRWlGSWpSXmKPExsViZ8OxWff046l
  JBj8mMlpcPLyU2YHR49zGFYwBjFGsmXlJ+RUJrBltXe9YC7p4Kg7s62NpYHzM1cXIxSEk8JBR
  4tfPK8wQzlkmic4ZLWwQzh5GiYO777F3MXJysAmoSUy/dYMVxBYR0JdYOnsPM4jNLKAi8eJ3D
  1iNsIC9xKJzz9lAbBYBVYmLay8DxTk4eAWcJB71SoOEJQQUJKY8fA/WyingLHFs+gIwWwio5O
  XqLSwgNq+AoMTJmU9YIMZLSBx88YIZoldRYvblZhYIu0JixoxtbBC2msTVc5uYJzAKzkLSPgt
  J+wJGplWMVklFmekZJbmJmTm6hgYGuoaGprrGuoaWlnqJVbqJeqmluuWpxSW6hnqJ5cV6qcXF
  esWVuck5KXp5qSWbGIFBnFLMfHwH45S+n3qHGCU5mJREeYMvT00S4kvKT6nMSCzOiC8qzUktP
  sQow8GhJMFb8wAoJ1iUmp5akZaZA4womLQEB4+SCK/7Q6A0b3FBYm5xZjpE6hSjJcfVK1f2Mn
  PcAJMzv7YdYBZiycvPS5US5518DahBAKQhozQPbhws6i8xykoJ8zIyMDAI8RSkFuVmlqDKv2I
  U52BUEubtBVnLk5lXArf1FdBBTEAHXfs2BeSgkkSElFQDUwu/bVuQAneOwl7pBp7VXwNmW31e
  LrdaIWCi1ftblzk43J/bHtXrYxEsz37xbL+F94K0PXYdlloJi54t1Aip2eu375jGr5mmb/bfb
  5PvkLisNP8i0/oTq+0PNb/OPLB7ruB/LS7bi/eu6zi/7Txo0qKZYnt/c8cd5omSZ8JnKaveWz
  jniMGcE0tVG1cG5+wO1/dfXP7q5NyXWrUvVswtsd5aH9z/ZxPvksWRdScub4nYt+OotUtW6OU
  /3Douy+f7PZpeHBnOeUvjgsGKPdO7l05lslmadjFwQsbOjgCh5R4NhQ7HdWVfzI/hPDxdveiy
  l/mubb+MWxTL+bV2PV+0RuzpV/GsqQXn/1pwzmi3a1RiKc5INNRiLipOBAA8+qhSdQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-587.messagelabs.com!1653990346!123874!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9113 invoked from network); 31 May 2022 09:45:47 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-21.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 31 May 2022 09:45:47 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 858DD8A1
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 May 2022 10:45:46 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 5506F816
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 May 2022 10:45:46 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 31 May 2022 10:45:44 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libbytesize: upgrade 2.6 -> 2.7
Date: Tue, 31 May 2022 17:45:19 +0800
Message-ID: <1653990320-31470-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1653990320-31470-1-git-send-email-wangmy@fujitsu.com>
References: <1653990320-31470-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 May 2022 09:45:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97344

Changelog:
==========
 Added translation using Weblate (Croatian)
 Translated using Weblate (Croatian)
 build: avoid bashisms in configure
 Do not use distutils to get Python library path
 Revert "Translations update from Weblate"
 Fix warnings dicovered by the GCC analyzer
 Fix some warnings and typos in docstrings and comments
 Remove Travis CI configuration
 Fix skipping tests when required locale is missing
 Update translation files
 Update translation files

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libbytesize/{libbytesize_2.6.bb => libbytesize_2.7.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libbytesize/{libbytesize_2.6.bb => libbytesize_2.7.bb} (93%)

diff --git a/meta-oe/recipes-support/libbytesize/libbytesize_2.6.bb b/meta-oe/recipes-support/libbytesize/libbytesize_2.7.bb
similarity index 93%
rename from meta-oe/recipes-support/libbytesize/libbytesize_2.6.bb
rename to meta-oe/recipes-support/libbytesize/libbytesize_2.7.bb
index 154973254..c83ee926d 100644
--- a/meta-oe/recipes-support/libbytesize/libbytesize_2.6.bb
+++ b/meta-oe/recipes-support/libbytesize/libbytesize_2.7.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c07cb499d259452f324bb90c3067d85c"
 S = "${WORKDIR}/git"
 B = "${S}"
 
-SRCREV = "c9864f4dd03736839f40d225da494cb1eb64e654"
+SRCREV = "0f47dde41f92f00b12160387659501edefd05b38"
 SRC_URI = "git://github.com/rhinstaller/libbytesize;branch=master;protocol=https"
 
 inherit gettext autotools pkgconfig python3native
-- 
2.25.1


