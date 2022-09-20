Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D950BC6FA82
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 02:27:34 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web10.7379.1663640851065292007
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 19:27:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=I8XzeUqi;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663640849; i=@fujitsu.com;
	bh=0IoynyXPQkBTd8bMajLeLSDgewV3cHFDeRB2ivlXFps=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=I8XzeUqiDAPFidUrnyrUtuOPfH22eWZWyAriRqfM2d3q+C9ktHNDpWu971ZxaACub
	 eGi5ittl94FHSBRgs/rF6vqaFN4Ndln2rYJMY1Mh3lXm5/gJ3gpHXFFUMELFtV8dRM
	 ncl7w2P2xtsnsfKjJvbluIw+cyAna8qKBxr07SMWxTHV9niQz2gQn5+5t2mDD0EEV3
	 JgRk0RDJpSNDp2hMK7GDxA2VHSQu0NpnhmfuDltfRhTHaJ3jWHlnzU/HLEUXYnXYxY
	 tRBJvaxkxCSW5cm6Qtm04ujqtufU0iW8ALfCFFVwN2dmD1zs88hK8TTyUdAtEw+aP4
	 TWL2CK/aTh2KQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRWlGSWpSXmKPExsViZ8OxWVdAVTP
  Z4MIscYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePc7Ta2guecFb+fvGRuYOzk7GLk4hASeMgo
  Me/XaTYI5wqTRPPMa0xdjJxAzh5Gib8TZUBsNgE1iem3brCC2CIC+hJLZ+9hBrGZBVQkXvzuY
  QexhQVCJd5fuMYGYrMIqEo8f7IOyObg4BVwkljZ6g8SlhBQkJjy8D1YK6+AoMTJmU9YIMZISB
  x88YIZokZRYvblZhYIu0KicfohJghbTeLquU3MExj5ZyFpn4WkfQEj0ypGq6SizPSMktzEzBx
  dQwMDXUNDU11jXUNLS73EKt1EvdRS3fLU4hJdQ73E8mK91OJiveLK3OScFL281JJNjMCQTClm
  Pr6DcUrfT71DjJIcTEqivFx1GslCfEn5KZUZicUZ8UWlOanFhxhlODiUJHjtBTWThQSLUtNTK
  9Iyc4DxAZOW4OBREuGVUwFK8xYXJOYWZ6ZDpE4xWnJMnf1vPzPHcjA582vbAWYhlrz8vFQpcd
  59ykANAiANGaV5cONgMXyJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjAvJ8gUnsy8Eritr4A
  OYgI66IaKOshBJYkIKakGpmwD9VM7Za0nNE1VZm4y0+3Wf7Oo1s3N1v1cx8OmzxuWfoy/3XC4
  zKfswKpT6r90I/xYr+uLLHz2+3fZFufLunyWEw4cK9CTl/yx4HoXX+Of/+u9JCMu+b52lr7pX
  qx1V3btS7Ze4ZK9G9UsF6dcDDxhNynMv2phtfre7sd1WWpnzB5Hn+R9VGS3ISrgywK/n62Hed
  69z5nb6L/l4447AQZX/qenPFuxJdhw/t3ICdc+/gs0YD9g8DOjrn2D0eWfLtESmbdOmB27umO
  G0DQGf53JV79NOvCg2PZ6z+57Vw5pT2LeMlOxbk94dE1zfNO6pV4fmmbfFOHKvb/kcq0ZU3Vy
  6bxPP57GWHX9/T+JyUeJpTgj0VCLuag4EQCdSzmcXAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-587.messagelabs.com!1663640848!308986!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21732 invoked from network); 20 Sep 2022 02:27:28 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-4.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Sep 2022 02:27:28 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 086BF156
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:27:28 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id EFE22152
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:27:27 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 20 Sep 2022 03:27:26 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-api-core: upgrade 2.10.0 ->
 2.10.1
Date: Tue, 20 Sep 2022 10:27:05 +0800
Message-ID: <1663640825-27786-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Sep 2022 02:27:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98890

Changelog:
=========
Improve transcoding error message (#442) (538df80)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...gle-api-core_2.10.0.bb => python3-google-api-core_2.10.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-core_2.10.0.bb => python3-google-api-core_2.10.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-core_2.10.0.bb b/meta-python/recipes-devtools/python/python3-google-api-core_2.10.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-google-api-core_2.10.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-core_2.10.1.bb
index 470bc7fc50..c7ded90984 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-core_2.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-core_2.10.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "1d053734f14591939e7764e99c31253fed46bf2578da0dcd82821f17a6dd991c"
+SRC_URI[sha256sum] = "e16c15a11789bc5a3457afb2818a3540a03f341e6e710d7f9bbf6cde2ef4a7c8"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-asyncio \
-- 
2.25.1


