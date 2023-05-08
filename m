Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EAE7C77B75
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 10:24:08 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.103814.1683541439352274825
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 03:23:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=jIkDhntw;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1683541437; i=@fujitsu.com;
	bh=364fIMkSTWT6XZs18auZUln0C3MsnK1AslX7DRZP3L8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=jIkDhntwqKZ7vz0hlg0X+Fqp2Gn1pphGxQ4F8rcHkfLW/7waBtRjRvH5BHUJUr7DF
	 9Mz/BM2cCnCxV9y1sQeD15uTPXZDRRdQhzWfqNbtLFTdT+r30+SYhNyzMqBtJnyAnL
	 zRlYd8IZ5Fpi4lPMhM2j6FMD6svIlxHY1cHsqa/0SiGN30gzNaC3RrSDE4WcuTM1XP
	 KAlXN0aJTAkETrHOWUb0Na9O0TRTjXMA2XKrgrEknDv9e7Cm1Td9IBd/XpQDNLzbKf
	 YiD0hcX1rG/gdUtEhxK9fHtTqdfIdoKqXZUiI7HfeEe3sBvl/8eUbacXyrDK/lnw2U
	 lGxMM9aWtMMiA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrILMWRWlGSWpSXmKPExsViZ8ORpLv3bES
  KwfS1zBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8b04x3sBVu4Kl6dmM/YwLiDs4uRk0NIYCOj
  xLX9Dl2MXED2NCaJr7cvsYIk2AQkJKbvPckOYosI6Ep8/DCXEcRmFlCRmDH5CBOILSwQIPHu0
  UoWEJtFQFXi5qrPYHFeASeJ7bNfg9kSAgoSUx6+ZwaxOQWcJXZ2PWODWOwk0db1mAWiRk3i6r
  lNzBMYeRYwMqxiNCtOLSpLLdI100sqykzPKMlNzMzRS6zSTdRLLdXNyy8qydA11EssL9ZLLS7
  WK67MTc5J0ctLLdnECAyJlOJkux2MX3b+1TvEKMnBpCTKa3owLEWILyk/pTIjsTgjvqg0J7X4
  EKMMB4eSBK/L6YgUIcGi1PTUirTMHGB4wqQlOHiURHhljwCleYsLEnOLM9MhUqcYFaXEefnOA
  CUEQBIZpXlwbbCYuMQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmJcBZApPZl4J3PRXQIuZgB
  b7Xw4HWVySiJCSamDqlTV6W3a3sXZuYcAS7lnOkf9l2+Xvz7O7e8D4aiez2oGoW8d5NpleUzz
  l1VS4Mnv185Nuk1/9WfRI66sWu9DFAGbR86I6T+vfHlRYkf996TfBZ4cfKtzwODQxPPrz46oP
  AezLSid3OX3kmxt1N33OLt5digseqDIdKTGapXwjlG324RJlvm7xYyLPKnw6Fz6YVtsjwrXD7
  8vkmGfMJw/9Nf8ic3WHW+WZRdu01OLrs3esnd9t5qpnnvA8q2/ZOzdbDakPBh+efdGfOuv1pa
  QV5y7ov+ue2H9NUjjm6o2Mq1XrFKRrdFhcc5IzF/wUXqWqvleO/+j+bO/Xy6OlPLu/TSjWT39
  +dGrlE6mrt75bKbEUZyQaajEXFScCAOUSxI0EAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-732.messagelabs.com!1683541436!498561!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22037 invoked from network); 8 May 2023 10:23:57 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-2.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 May 2023 10:23:57 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 7E8F91D4;
	Mon,  8 May 2023 11:23:56 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id A515F1C2;
	Mon,  8 May 2023 11:23:55 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-regex: upgrade 2023.3.23 -> 2023.5.5
Date: Mon,  8 May 2023 18:23:42 +0800
Message-Id: <1683541424-25761-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1683541424-25761-1-git-send-email-wangmy@fujitsu.com>
References: <1683541424-25761-1-git-send-email-wangmy@fujitsu.com>
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 10:24:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102424

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
    Removed semicolon after 'else' in 'munge_name'.
    Fixed pyproject.toml and setup.py.
    pyproject.toml was missing.
    Added pyproject.toml.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-regex_2023.3.23.bb => python3-regex_2023.5.5.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2023.3.23.bb => python3-regex_2023.5.5.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2023.3.23.bb b/meta-python/recipes-devtools/python/python3-regex_2023.5.5.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-regex_2023.3.23.bb
rename to meta-python/recipes-devtools/python/python3-regex_2023.5.5.bb
index 176f79e0d7..ddd8402465 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2023.3.23.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2023.5.5.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7b5751ddd6b643203c31ff873051d069"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "dc80df325b43ffea5cdea2e3eaa97a44f3dd298262b1c7fe9dbb2a9522b956a7"
+SRC_URI[sha256sum] = "7d76a8a1fc9da08296462a18f16620ba73bcbf5909e42383b253ef34d9d5141e"
 
 RDEPENDS:${PN} += " \
 	python3-stringold \
-- 
2.34.1


