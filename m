Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65D01C77B7F
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 08:13:51 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web10.16564.1684224829268983105
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 May 2023 01:13:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=rHl6Kvuv;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1684224829; i=@fujitsu.com;
	bh=b1ks0X0zImgCG1oV9EWq5rdz9Sa9CfJ8pxTH/tymlA4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=rHl6KvuvlY4G/PwxNYKDOdJPL35Kw2MZbTcI2j/SdoVsq46PDmd0QM9rQyvWvaF0X
	 D6KUbXVFxMafvzsjA9MwWuxU4csvb3Z85kEQdbDQgaMUs6h8sn17w3hNWIsBU5O39Z
	 KrgZACVqhv0lp6tedsHIlz6ytyUR2hGhiIVeqQk8YExEs1qf6yd/RKMgVN0GYQmCMM
	 j4ONVvBqQY9x8McrGB+E6sU5aC3h8dTwsjRyD0wnoCEkdiLZ9BVbllA2z/7FBmOjaM
	 qj0xbg2Mg6q0+tWpeW4yhbkYa86/VHAugDvKavWZ/9HSXDu+ZvGsdq032FH5wRm4kr
	 SNk05Vqzyx+iw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrALMWRWlGSWpSXmKPExsViZ8ORpGtjnZx
  i8GCnocXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmtG9/BxLwRu+itb9LxkbGE/wdjFycQgJbGSU
  +HdyEyuEM5VJorXhKFsXIycHm4CExPS9J9lBbBEBXYmPH+YygtjMAioSMyYfYQKxhQUcJKbPP
  wdUz8HBIqAq8XajPkiYV8BJ4vTpa8wgtoSAgsSUh++ZQUo4BZwlHp+qAQkLAZUsbp3PBlGiJn
  H13CbmCYw8CxgZVjGaFacWlaUW6Rqa6CUVZaZnlOQmZuboJVbpJuqlluqWpxaX6BrqJZYX66U
  WF+sVV+Ym56To5aWWbGIEBkRKMevmHYzbdv3VO8QoycGkJMrLsiApRYgvKT+lMiOxOCO+qDQn
  tfgQowwHh5IEL7dVcoqQYFFqempFWmYOMDhh0hIcPEoivNUWQGne4oLE3OLMdIjUKUZFKXFed
  pA+AZBERmkeXBssIi4xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEuZdZwQ0hSczrwRu+iugxU
  xAi2/tiQdZXJKIkJJqYHKJThPK8b3uk6LiJHnuetTP3zofj66eWs+SmbxKcVfnjl/eKrJZ+Ta
  bWqtiL5/cd0Dlr/WiCzNtanXf+jgXbUnw3Mq/aPbfoFXfl2SeO25d3L76+3Jvt5+/55W1BDHv
  frYm6cWGbRXLohYLL1p6TlPOYXUPQ2mT68rpJg8y5/ZEy5XbH+77FdZ7gTFZ4evnS4f27yo1a
  Tiwo8FWPTn8gnC3vFpZSXb/N9YVpx4cP60U9DH0hsvxtJLpJ6JNt96V/y7Brb15zuSYdTd+P9
  paUacYGJy7aY9dtGDe071ZXy+F8y5aUDhPd57llM3znV4mcmjkHwsQM+Nxc+Zz6SkX9QtbzRW
  zpEMgeN5mK53r2kosxRmJhlrMRcWJAPF7RVEDAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-587.messagelabs.com!1684224828!143293!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20170 invoked from network); 16 May 2023 08:13:48 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-11.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 May 2023 08:13:48 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 6EB721B5;
	Tue, 16 May 2023 09:13:48 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id A79C17B;
	Tue, 16 May 2023 09:13:47 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] wavpack: upgrade 4.60.1 -> 5.1.0
Date: Tue, 16 May 2023 16:13:33 +0800
Message-Id: <1684224813-27544-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1684224813-27544-1-git-send-email-wangmy@fujitsu.com>
References: <1684224813-27544-1-git-send-email-wangmy@fujitsu.com>
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 May 2023 08:13:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102625

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-multimedia/wavpack/wavpack_4.60.1.bb | 10 ----------
 meta-oe/recipes-multimedia/wavpack/wavpack_5.1.0.bb  |  9 +++++++++
 2 files changed, 9 insertions(+), 10 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/wavpack/wavpack_4.60.1.bb
 create mode 100644 meta-oe/recipes-multimedia/wavpack/wavpack_5.1.0.bb

diff --git a/meta-oe/recipes-multimedia/wavpack/wavpack_4.60.1.bb b/meta-oe/recipes-multimedia/wavpack/wavpack_4.60.1.bb
deleted file mode 100644
index 021496bd43..0000000000
--- a/meta-oe/recipes-multimedia/wavpack/wavpack_4.60.1.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-DESCRIPTION = "WavPack is a completely open audio compression format providing lossless, high-quality lossy, and a unique hybrid compression mode."
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://license.txt;md5=f596650807588c61fcab60bec8242df8"
-
-SRC_URI = "http://wavpack.com/wavpack-${PV}.tar.bz2"
-SRC_URI[md5sum] = "7bb1528f910e4d0003426c02db856063"
-SRC_URI[sha256sum] = "175ee4f2effd6f51e6ec487956f41177256bf892c2e8e07de5d27ed4ee6888c5"
-
-inherit autotools lib_package
-
diff --git a/meta-oe/recipes-multimedia/wavpack/wavpack_5.1.0.bb b/meta-oe/recipes-multimedia/wavpack/wavpack_5.1.0.bb
new file mode 100644
index 0000000000..9096123939
--- /dev/null
+++ b/meta-oe/recipes-multimedia/wavpack/wavpack_5.1.0.bb
@@ -0,0 +1,9 @@
+DESCRIPTION = "WavPack is a completely open audio compression format providing lossless, high-quality lossy, and a unique hybrid compression mode."
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://license.txt;md5=8c1a910e5c2a8b30ec8ffb2ffa63d9b2"
+
+SRC_URI = "git://github.com/dbry/WavPack.git;branch=master;protocol=https"
+SRCREV = "9ccc3fe4a37d069137ceabe513a4dd9b0a09c1c2"
+S = "${WORKDIR}/git"
+
+inherit autotools lib_package
-- 
2.34.1


