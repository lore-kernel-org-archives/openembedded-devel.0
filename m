Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40D39C433FE
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 06:14:18 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web11.111440.1669616053384206788
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Nov 2022 22:14:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=gtTdwHYv;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1669616051; i=@fujitsu.com;
	bh=UpwFZofKWO6XJ5Rfy6VNH8AWJphyka0G8NcFXaFNhNA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=gtTdwHYvb69OsXLOe/NJOaF58TbzyIbXngRPlxSXCQB/fjbnbyo5dPs6d0I4p2IVs
	 hc2HzTPYNU9XfKh2myYtlo8kACPczHdbu7lAkxQ/K9EUSujXfuN7uWT6ATOHgD9V/y
	 0C0OmNofOLZA6cLTEwRuqAm33PSODxJX/ca4EB2Vy/PkIu4LDBh575VJn7ylk4CITA
	 vySM5cD0mcVpvgSDO2/BELPrTmGN4Sy5IrPe/oh0I73Q8NqY0bvwP3jfuhGSkG+r68
	 KCxD6DC7JNlHzMeSBo/XZO1iuDPT8ooIFYftbPwd+ueFqnsicIEYwIMz88hTbdtAaK
	 QJSzS5ig4f6WA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRWlGSWpSXmKPExsViZ8OxWXdzYEu
  ywaJHYhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8a0fWdYC1ZyV2z69I+tgXE9VxcjF4eQwENG
  idMz1jBCOJeZJPY+mMwK4exhlNj84SBbFyMnB5uAlMSN+//BbBEBfYmls/cwg9jMAioSL373s
  IPYwgJhEh8unmEBsVkEVCVOvDzHBGLzCjhJfJk+hxHElhBQkJjy8D1YL6eAs8TtvUdZQWwhoJ
  rm14dZIOoFJU7OfMICMV9C4uCLF8wQvYoSsy83s0DYFRKzZrUxQdhqElfPbWKewCg4C0n7LCT
  tCxiZVjGaFacWlaUW6Roa6iUVZaZnlOQmZuboJVbpJuqlluqWpxaX6BrqJZYX66UWF+sVV+Ym
  56To5aWWbGIEhm9KMcP0HYw/l/3RO8QoycGkJMq78FJTshBfUn5KZUZicUZ8UWlOavEhRhkOD
  iUJ3vWeLclCgkWp6akVaZk5wFiCSUtw8CiJ8C62B0rzFhck5hZnpkOkTjHqcsz82naAWYglLz
  8vVUqc95w/UJEASFFGaR7cCFhcX2KUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzLsNZApPZl4
  J3KZXQEcwAR2xSbEJ5IiSRISUVAOTbp/rtrQozzVcUr45pUVL/93wmyV/VE737maGiTNy+bSs
  Ojcabg9YvC0lrPjycpeWzdvbTMO0z5zLbUnznen/abdG8CT2t+sEH2z/f+PmvEKPR6Fnjm57P
  5Vpa0d1e2t2/ieFyorfStNcRYXvLl276dtcq2lfps/t950oKRqzqOLJ7TeS6a65SZvVYsUO1L
  3apV7KvfdxxIuKb/2xNXwca95GOHvZbbQrn+G3ZYrP6uNFZVN2mfxeLpbkcb20wKgo72bxbVW
  pucrNkpZnZ36a91r4d/PqLfdffRRglBOXYiiZdPNH0AIv2x7l5U/MCrecXp6zfOuao5UPkgr5
  PGbKSN7q3F+2fG/0pNLrzOH5SizFGYmGWsxFxYkA2DitCWYDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-585.messagelabs.com!1669616051!221906!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3681 invoked from network); 28 Nov 2022 06:14:11 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-23.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 28 Nov 2022 06:14:11 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 0635E150
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:14:11 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id EDEDA7B
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:14:10 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Nov 2022 06:14:09 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-charset-normalizer: upgrade 3.0.0 -> 3.0.1
Date: Mon, 28 Nov 2022 14:13:41 +0800
Message-ID: <1669616024-13194-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1669616024-13194-1-git-send-email-wangmy@fujitsu.com>
References: <1669616024-13194-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:14:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99802

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
Fixed
------
    Multi-bytes cutter/chunk generator did not always cut correctly (PR #233)

Changed
-------
    Speedup provided using mypy/c 0.990 on Python >= 3.7

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-normalizer_3.0.0.bb => python3-charset-normalizer_3.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-charset-normalizer_3.0.0.bb => python3-charset-normalizer_3.0.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-charset-normalizer_3.0.0.bb b/meta-python/recipes-devtools/python/python3-charset-normalizer_3.0.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-charset-normalizer_3.0.0.bb
rename to meta-python/recipes-devtools/python/python3-charset-normalizer_3.0.1.bb
index 895f88a62..0a48ae97d 100644
--- a/meta-python/recipes-devtools/python/python3-charset-normalizer_3.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-charset-normalizer_3.0.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ousret/charset_normalizer"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0974a390827087287db39928f7c524b5"
 
-SRC_URI[sha256sum] = "b27d10ad15740b45fd55f76e6901a4391e6dca3917ef48ecdcf17edf6e00d770"
+SRC_URI[sha256sum] = "ebea339af930f8ca5d7a699b921106c6e29c617fe9606fa7baa043c1cdae326f"
 
 inherit pypi setuptools3
 
-- 
2.25.1


