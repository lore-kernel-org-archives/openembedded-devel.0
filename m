Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EB52C54EFD
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:49 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web09.2679.1649137340887693483
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Apr 2022 22:42:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=jOH70cYF;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649137339; i=@fujitsu.com;
	bh=at5YAIHY7blnLhMTufSozZEVVL/zOKzYM3TqKCSGj9k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=jOH70cYFEujnGNt7vOswWe5MR6B+rOyX3QhFEdFlwkItBrnxhqG1XEgPNL3igZrcz
	 r4jYmSti56kHLyR210IvStqfhZJhdinWIVWDsLzpPkFJnkWiK5XKwwc81KiMg1nS8R
	 hlI+FBQrWWWKR3Nz4bPlsYHp87EAyiF6cfvH9AWTbwZ1b20as3jemmHx4Z/aQVkjRs
	 70dxYMR/uVwsxLBXiTH7IZacjWQSr/Lf3RmEK0XNNvWU8f4xWPGd4TdviRwttU97bx
	 pC7UCBz8oEXUyY5CYHCOmPcI9QVnfWQIkwIH3nM8kR98HUmsqkdqx6iazF1Z3wajE7
	 RVH7nVsS0Vehg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPIsWRWlGSWpSXmKPExsViZ8ORqLvrmne
  SwdO3yhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8azV/8YC15yVNzofcvUwDiVo4uRi0NI4Amj
  xPvf/1kgnAtMElsPrGaHcHYzSiz6dpWxi5GTg01ATWL6rRusILaIgL7E0tl7mEFsZgEViRe/e
  9hBbGEBT4m3C56wgdgsQPHtLx6C9fIKOEkcefUYzJYQUJCY8vA9WC+ngLPE64PPwGYKAdU8/t
  HBBlEvKHFy5hMWiPkSEgdfvGCG6FWUmH25mQXCrpCYNauNCcJWk7h6bhPzBEbBWUjaZyFpX8D
  ItIrRLqkoMz2jJDcxM0fX0MBA19DQVNfMUtfQ1EwvsUo3US+1VDc5Na+kKBEorZdYXqyXWlys
  V1yZm5yTopeXWrKJERjOKcWuc3YwXuj7qXeIUZKDSUmU94yrd5IQX1J+SmVGYnFGfFFpTmrxI
  UYZDg4lCd6TZ4FygkWp6akVaZk5wNiCSUtw8CiJ8B65CJTmLS5IzC3OTIdInWJUlBLnvXkFKC
  EAksgozYNrg8XzJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvFZXgabwZOaVwE1/BbSYCWj
  xuzOeIItLEhFSUg1My9VVNT5OP9JgJfj6xlqtczeM1jz577f9rOTrOlffpQGV8z7r/3p0/IpR
  zjW/bSwf1Rex3UkuWvHfacHxzPdarnVpu9Yl1Cz6wHP4/fei4N6uiV3t/401/8oIzGOfWb+m5
  d+9SbLy9nJ3/ztM2Nj4JnqC2toH8hH6+sv61F1dZDd58T2WW8O47knmROeQPf1qCyOnN2nuPt
  Cg6+qxrtdshZ/NxsX3L7WYWIdOy3u4Zctnz7++x/ZpbvP4cvLYDt55C05cNS5s3F8++b9USKf
  jLFGdfws3z5h9RCzeKDHy+9NUz0O3bp68fG/Dh0TvKK19j2WF/RhSsy5dW1T9alnVyvcb7F8r
  mPbc21oy4bHq1U9KLMUZiYZazEXFiQBKNoolYgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-532.messagelabs.com!1649137338!42842!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24321 invoked from network); 5 Apr 2022 05:42:18 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-22.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 5 Apr 2022 05:42:18 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id E89631001B2
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  5 Apr 2022 06:42:17 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id C41981001A5
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  5 Apr 2022 06:42:17 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 5 Apr 2022 06:42:00 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-twine: upgrade 3.8.0 -> 4.0.0
Date: Sat, 2 Apr 2022 20:38:32 +0800
Message-ID: <1648903115-19946-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1648903115-19946-1-git-send-email-wangmy@fujitsu.com>
References: <1648903115-19946-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Apr 2022 17:24:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96413

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-twine_3.8.0.bb => python3-twine_4.0.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-twine_3.8.0.bb => python3-twine_4.0.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-twine_3.8.0.bb b/meta-python/recipes-devtools/python/python3-twine_4.0.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-twine_3.8.0.bb
rename to meta-python/recipes-devtools/python/python3-twine_4.0.0.bb
index 4296ab2b33..08252e837b 100644
--- a/meta-python/recipes-devtools/python/python3-twine_3.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twine_4.0.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://twine.readthedocs.io/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3d1106b253a8d50dd82a4202a045b4c"
 
-SRC_URI[sha256sum] = "8efa52658e0ae770686a13b675569328f1fba9837e5de1867bfe5f46a9aefe19"
+SRC_URI[sha256sum] = "817aa0c0bdc02a5ebe32051e168e23c71a0608334e624c793011f120dbbc05b7"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.25.1


