Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7C58C6FA86
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 09:10:12 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web09.8697.1664269804999737179
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 02:10:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Hu9XjO9i;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1664269803; i=@fujitsu.com;
	bh=v5jZ/qUfBbUBolmApepPm0gMVyr/UVIWz81xmGiK9Hc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Hu9XjO9iPqP+SR67SVUroYJdZ46EMsnayBEDJOuI3BuiRHvsmTx/RHy6lyVcPVJwT
	 Yy9vyvVsVmQ5NspdFLWMACf0eNj7U3cbK0d5AlXI/4Epg/CknVw13pGtdv63Hl5i1R
	 aK6QIm2G5ZcyrrJw22Y1Jc87o/pKyki51Iu++kLXnFW0+YSEwdTW10Bg8+/4vDytFo
	 rfpTUJXfUFjNn19wxAa6ECv3b2Z+B3ChEWyL03Y5fZ3ye3sjeqVakfKuNvzOgIkQ1F
	 iWFe946eJUU5tojcktdYA/Usk8Jsz6Y5zLKUQhpJvUYpLD3kzlq7NOU71X38DU0Qyr
	 rE4iZeshZKNVw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrAIsWRWlGSWpSXmKPExsViZ8OxWff1XqN
  kgzl3mS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oyFszgLmrkrJl1/wNjAOJ2ri5GLQ0jgIaPE
  8T+fmSCcK0wSPReb2SGcPYwSD1oXM3cxcnKwCahJTL91gxXEFhHQl1g6ew9YnFlAReLF7x6gB
  g4OYQF/iQWn5UHCLAKqEpPe/WMDsXkFHCWmd50CK5cQUJCY8vA9mM0p4CTx4W43M0irEFBNX0
  sCRLmgxMmZT1ggpktIHHzxAqpVUWL25WYWCLtConH6ISYIW03i6rlNzBMYBWchaZ+FpH0BI9M
  qRqukosz0jJLcxMwcXUMDA11DQ1NdY3NdQ0u9xCrdRL3UUt3y1OISXSO9xPJivdTiYr3iytzk
  nBS9vNSSTYzAAE4pVhXewdix8qfeIUZJDiYlUV77RUbJQnxJ+SmVGYnFGfFFpTmpxYcYZTg4l
  CR4JXcD5QSLUtNTK9Iyc4DRBJOW4OBREuFdtwQozVtckJhbnJkOkTrFaMkxdfa//cwcy8HkzK
  9tB5iFWPLy81KlxHlNtwA1CIA0ZJTmwY2DRfwlRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK
  8pnuApvBk5pXAbX0FdBAT0EF2fPogB5UkIqSkGpjUjzt5Gm76IaOxu7uo5MjqKYbNe7tjf8dN
  Z7aRun2lVTtjzelPC1fpKkpO6WJi/HL3xb0jc66ZhfmqzuBI7jn/i1fVjeFrxM9lqzdz3tnN9
  zrE4Y5EL9Ot4OA1p9ZP8X296OfTHY+eeGZwbVeVO/W3wL367JuyGnuvW/IH1DwuR8VdjPguyb
  t92/Jln0pYaqon8xxk8U89oXL4cLnGzb2RHNbTf9RlvXLN8z1sJuFT+WhhOd9CYdW4jTeCX/t
  2Tzbcb+ba9HJxZLHPQs34L5/a1xc1eZwuu3D52nHNFKPazS+nL/YJvvxExFEsfD6vx8LS5Yb7
  3/J4xm3vO/Y5zVO56p1iYc5UtstfuGQdVi5VYinOSDTUYi4qTgQAmLbbKHMDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-571.messagelabs.com!1664269802!338067!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19296 invoked from network); 27 Sep 2022 09:10:03 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-3.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Sep 2022 09:10:03 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id C1A4E152
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 10:10:02 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id B5258151
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 10:10:02 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 27 Sep 2022 10:10:01 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-langtable: upgrade 0.0.59 ->
 0.0.60
Date: Tue, 27 Sep 2022 17:09:40 +0800
Message-ID: <1664269780-2655-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1664269780-2655-1-git-send-email-wangmy@fujitsu.com>
References: <1664269780-2655-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Sep 2022 09:10:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98983

Changelog:
===========
* Add list_common_locales() function
(Resolves: https://github.com/mike-fabian/langtable/issues/15)
* For ar_IN locale, langtable should give the 'ara' keyboard layout as the first choice
(Resolves: Resolves: https://github.com/mike-fabian/langtable/issues/14)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-langtable_0.0.59.bb => python3-langtable_0.0.60.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-langtable_0.0.59.bb => python3-langtable_0.0.60.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-langtable_0.0.59.bb b/meta-python/recipes-devtools/python/python3-langtable_0.0.60.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-langtable_0.0.59.bb
rename to meta-python/recipes-devtools/python/python3-langtable_0.0.60.bb
index 23f13fc96d..eac069f041 100644
--- a/meta-python/recipes-devtools/python/python3-langtable_0.0.59.bb
+++ b/meta-python/recipes-devtools/python/python3-langtable_0.0.60.bb
@@ -6,7 +6,7 @@ SECTION = "devel/python"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI[sha256sum] = "0e9cec4dfadb4debf387ea695fe2bf7be4af1cbb3f030d5d04bf6a254ad13751"
+SRC_URI[sha256sum] = "ae77d62fe6002308ce6197310c4a933c4e13632bbaf7219a3533dc45d36223f8"
 
 inherit pypi setuptools3 python3native
 
-- 
2.25.1


