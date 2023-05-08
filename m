Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59714C7EE26
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 10:19:48 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.103759.1683541187807691214
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 03:19:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=LYwUKsCU;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1683541186; i=@fujitsu.com;
	bh=MXzipERrmfy/3hz05uQUuT84ItMi5RS0xnu8mKjRLO0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=LYwUKsCUNIeT65dERpT0B2b6dU4ZEbALCt1/PZwD87i6Tp9TjMWqa5mFshyLXJOSB
	 WcDw5I+vQbm8i1o3tHW6Sa9kRksnI+bSTU7LZ9q3jNKljTe30Cz4Gi6a37l/vzktWq
	 3MF4GgW/+P5YyHZnKUrltYwM4zHhp9fgrxgw/YoF0CQAVUE2N0xuVn/xrbDwHCrM3v
	 q5YzWlggPzBQ8VA+fiGStnYlbh4ZJCgNnq3Vkx0WBmnfBOh6geWHdbZA+duC8HKNxu
	 0xmsMesdtGJGEOr1LF/b0R5v+uZbKnN6e23jkb/7nWp51Uu/oB8O5RPZrCUHMQi+rh
	 9E9h4ND6IhSmQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrPLMWRWlGSWpSXmKPExsViZ8ORpHvwTES
  KwcTT8hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8azGxNYCm5wVbzct4u1gfE6ZxcjF4eQwEZG
  icl3VjBBONOYJDbNe8nexcjJwSYgITF970kwW0RAV+Ljh7mMIDazgIrEjMlHmEBsYQF/iR/fb
  rKC2CwCqhKfDh8Eq+EVcJLY+vMwWI2EgILElIfvmUFsTgFniZ4/N8FsIaCazm/PGSFq1CSunt
  vEPIGRZwEjwypG8+LUorLUIl1DS72kosz0jJLcxMwcvcQq3US91FLdvPyikgxdQ73E8mK91OJ
  iveLK3OScFL281JJNjMCwSClO+72D8evOv3qHGCU5mJREeU0PhqUI8SXlp1RmJBZnxBeV5qQW
  H2KU4eBQkuB1OR2RIiRYlJqeWpGWmQMMUZi0BAePkgiv7BGgNG9xQWJucWY6ROoUoy7H2oYDe
  5mFWPLy81KlxHlngswQACnKKM2DGwGLl0uMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHkZgN
  EnxJOZVwK36RXQEUxAR/hfDgc5oiQRISXVwMQWsWFzyqQVP8UdmCObLCqYl52sjKjT7nrpdMH
  u75nNDCrqFxec2CjGtfxDmBHvn/u3fp457WiWqsD161kZS4TAu/08tu32VvZaGQs26HudXntU
  4dYBOd5J3FxpdtyZHyenT7i5OPJW3DmlO+buuQ13IpdFWa5R321TdXXvMclNQudd+heqNh9gL
  6/1vFK9gP3typsb5+QLi82bar9nX/n3sOqQiNvOmnPLL2WE5Hy/JsJ3RNPr1dUTyRbLGK9eX+
  ppckCbc+uPm9tOJXEs2v72ITtzspjQvwkTmhQEOdyFAte3vdGavK1HcvLby1IFy+1nTdYStF7
  hd8nqxqXaNS3GZ/+Ub03yY5xQUBD830iJpTgj0VCLuag4EQCaeO73EgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-745.messagelabs.com!1683541185!214971!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16355 invoked from network); 8 May 2023 10:19:45 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-2.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 May 2023 10:19:45 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id EF1731D4;
	Mon,  8 May 2023 11:19:44 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 225671D2;
	Mon,  8 May 2023 11:19:43 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-langtable: upgrade 0.0.61 -> 0.0.62
Date: Mon,  8 May 2023 18:19:29 +0800
Message-Id: <1683541169-25445-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1683541169-25445-1-git-send-email-wangmy@fujitsu.com>
References: <1683541169-25445-1-git-send-email-wangmy@fujitsu.com>
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 10:19:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102415

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
    Get translation changes from CLDR
    Add more translations from CLDR
    Add Norwegian keyboard layout to keyboards.xml (Resolves: #16)
    Add Hang script to Southern Aymara

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-langtable_0.0.61.bb => python3-langtable_0.0.62.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-langtable_0.0.61.bb => python3-langtable_0.0.62.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-langtable_0.0.61.bb b/meta-python/recipes-devtools/python/python3-langtable_0.0.62.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-langtable_0.0.61.bb
rename to meta-python/recipes-devtools/python/python3-langtable_0.0.62.bb
index 6e924ac42e..df6d14ece5 100644
--- a/meta-python/recipes-devtools/python/python3-langtable_0.0.61.bb
+++ b/meta-python/recipes-devtools/python/python3-langtable_0.0.62.bb
@@ -6,7 +6,7 @@ SECTION = "devel/python"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI[sha256sum] = "2c09f561463f18b038373b1fa8a4f68143dd3bfb59fdc8edbbba00548fc70db4"
+SRC_URI[sha256sum] = "df8d5daedaa5c0d4e72dace925733376ba705d9330f63934f122eacf4746f360"
 
 inherit pypi setuptools3 python3native
 
-- 
2.34.1


