Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 775A8C77B75
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 10:23:18 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.103880.1683541396901545318
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 03:23:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=uKc3Zbrl;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1683541394; i=@fujitsu.com;
	bh=iN/vOTMNKtRNnzPnieHBGRUdYNgdT1CvV+D43T3OY+U=;
	h=From:To:Cc:Subject:Date:Message-Id;
	b=uKc3ZbrlgpqHmnWSwYjpEhG/nhA1vhrdd5UGsRMHl/8Ikh2GVSgBYIpgZ0sH83q8X
	 yf16M27OGJvHO25keicVufD+MVMnmrtCmJr47u5VYiC657KUabeLQ4m20kcXmPyNJ1
	 Lao3vFY59FHgPPqto0gwLmRzsyPUTKg8oM3UvlLK0zoPNEzhtyukxvTTLwunAQF7WA
	 mvdoOwlayM7oMCQkQEjDjAnLgul70T8d0hqVEUnf9TfqYQn6aQ2kSuynNtkkx3WOUK
	 JARNhgub1KcbRr4RiX0VhYrMKYURzLbk0ZKhBQ+SndcpvAgh50UOXXd61rxFyEEVmW
	 pCis3VNXmbKWw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrFLMWRWlGSWpSXmKPExsViZ8ORpDvpbES
  KwdFzohYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aR3e+ZCzZxVjx5MJW9gfE2RxcjF4eQwEZG
  icU7jjJBONOYJCZv3AvkcHKwCUhITN97kh3EFhHQlfj4YS4jiM0soCIxY/IRsBphAT+J1WvOA
  NkcHCwCqhI9P7NBwrwCThI3dm5nBbElBBQkpjx8zwxhq0lcPbeJeQIj1wJGhlWM5sWpRWWpRb
  qG5npJRZnpGSW5iZk5eolVuol6qaW6eflFJRm6hnqJ5cV6qcXFesWVuck5KXp5qSWbGIFeTil
  OCd3BOGnXX71DjJIcTEqivKYHw1KE+JLyUyozEosz4otKc1KLDzHKcHAoSfC6nI5IERIsSk1P
  rUjLzAEGHExagoNHSYRX9ghQmre4IDG3ODMdInWKUVFKnJfvDFBCACSRUZoH1wYL8kuMslLCv
  IwMDAxCPAWpRbmZJajyrxjFORiVhHkZQKbwZOaVwE1/BbSYCWix/+VwkMUliQgpqQam5fM+xO
  lbePwpdYhY3JL0nblDViXlVo+A4fOmlKnds30j3/NKeaVLOBd+iWtzt+tLn/3x7d19/wQrxG9
  dFVkUo7/6ulFjaVP1KyUxze3Zj3YLMH//Ebb+0L5Xiw9lvL/Sy5OgwKbsVRJg0taXfX7pyqS/
  nwQWPHVRVW04XFU5x/SzkcGKYINXQu8Kxf5JGs1inV2l8KVH69AnOX0OjXv81v5fOsJFKg5V1
  7dYX/wfF9Z1Y+Lbv0t6v8+7doXpYOav108SDjdZbI09/V5CeLLoNKmtkuLG6TrHNm2vievkCf
  zgmLxmx2GPg3aVEmtMWfh3qMl+t1suqzgrI9/vXi9LZobPJYdXdQXT9LbecVdiKc5INNRiLip
  OBAAWsmdw7QIAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-728.messagelabs.com!1683541394!496099!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12039 invoked from network); 8 May 2023 10:23:14 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-15.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 May 2023 10:23:14 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id C9C7E1D2;
	Mon,  8 May 2023 11:23:13 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id F12561C2;
	Mon,  8 May 2023 11:23:12 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-nocasedict: upgrade 2.0.0 -> 2.0.1
Date: Mon,  8 May 2023 18:23:00 +0800
Message-Id: <1683541384-25689-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 10:23:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102416

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-nocasedict_2.0.0.bb => python3-nocasedict_2.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-nocasedict_2.0.0.bb => python3-nocasedict_2.0.1.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-nocasedict_2.0.0.bb b/meta-python/recipes-devtools/python/python3-nocasedict_2.0.1.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-nocasedict_2.0.0.bb
rename to meta-python/recipes-devtools/python/python3-nocasedict_2.0.1.bb
index a5bc40d6c4..6185b7b1e9 100644
--- a/meta-python/recipes-devtools/python/python3-nocasedict_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-nocasedict_2.0.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pywbem/nocasedict"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1803fa9c2c3ce8cb06b4861d75310742"
 
-SRC_URI[sha256sum] = "33bf7b0ea50eee6bad16dc7400fd89dd2d5379d9ba9cf17634bf2a59ae36ff0a"
+SRC_URI[sha256sum] = "960cb699f1209da80ac39e3ab50aa7342fe8ca9f70606c23447a510550435e50"
 
 inherit pypi setuptools3
 
-- 
2.34.1


