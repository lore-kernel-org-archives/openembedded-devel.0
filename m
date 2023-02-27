Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F87FC64ED6
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 08:10:01 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.85507.1677485393019252141
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Feb 2023 00:09:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=elzLXvGk;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677485391; i=@fujitsu.com;
	bh=VilnPu7A5zTYKaJoG8uw8B9moI0lkyuEPKULpbAni14=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=elzLXvGkvqL0R2txuXGVbEjNxJn/KAWK27muRmC0/JkwIDDe5WpZxDwbE1InCv24c
	 2/cS7fsq/UgfpGAWccKava36g9vIkLlW+fVzsflqbtitdds6mbGL+ReLPEQ5xU7SyP
	 CYxDQ112r3UtzGZgPVehI3j2rQFiutTJvGrOxItfUEB2Tq1K3f+3EGxSVeqEJaLzBS
	 kPvN91VBbyyCWMtVWZfOYN4RvQ6hzh68Vn1cKHg53YWPGhcyjDkEyZA1BnnYcryuJI
	 88DOJ+f3HvAssYmNxRzaeuRONaZJ81cUVPYZ6+kVLotEasfD+EtzzfU4Km2od76ykC
	 jisfW2OmsBw+w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8MxSdcv9U+
  yweu5ShYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8b1H5eYC9ZxVSza4dHAuImzi5GLQ0jgCaPE
  /uPzGCGcG0wSLesus0I4exklLq87xdLFyMnBJiAlceP+fzYQW0RAX2Lp7D3MIDazgIrEi9897
  CC2sICvxIXpa1hBbBYBVYn3m6+C1fMKOEmsPfkKbI6EgILElIfvmSHighInZz5hgZgjIXHwxQ
  tmiBpFidmXm6HqKyVaP/yCstUkrp7bxDyBkX8WkvZZSNoXMDKtYjQrTi0qSy3SNTTVSyrKTM8
  oyU3MzNFLrNJN1Est1S1PLS7RNdJLLC/WSy0u1iuuzE3OSdHLSy3ZxAgMxpRixQk7GC/2/dU7
  xCjJwaQkyrvI6U+yEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQneg0lAOcGi1PTUirTMHGBkwKQlO
  HiURHiZjYDSvMUFibnFmekQqVOMilLivHyJQAkBkERGaR5cGywaLzHKSgnzMjIwMAjxFKQW5W
  aWoMq/YhTnYFQS5o1KAJrCk5lXAjf9FdBiJqDF2x/+AFlckoiQkmpg2sz/KYaLb3NsUeb91Nr
  KIuaFi3YqbV160/DCDQ7+aOdEdetynsMnL/KyfVLJZpIJktPJM/IJyW64O6367ZcZU5lma1TK
  nHn+1PXEDfn61awSO4N+7GrJ1j9vveW279RrBXMaVdzNhE4rZ87Tv6V04qVAjMJSkQUJa7in3
  k7bJZS7UHX+3ik8hR4fmL/Xe2Y+U3imufP1vrvLTjpZPwzYe2nThiJhgx2Nc4tfPp54oE1BxT
  LnhOFylusnnD2uX0/9+nxRSeTS4/4G83OVGopfru/nvRTVfCmyY3uoftjdqXd0rFo3/JCxWjp
  db//q3EpFgxubrlS63+m8YCr0e+dE5/Altek9lwqP1S84/CbtoBJLcUaioRZzUXEiAJ7Zsb1B
  AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-571.messagelabs.com!1677485390!303077!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31720 invoked from network); 27 Feb 2023 08:09:50 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-13.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Feb 2023 08:09:50 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 420381000E9
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:09:50 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 365FC1000D5
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:09:50 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 27 Feb 2023 08:09:48 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-imageio: upgrade 2.25.0 -> 2.25.1
Date: Mon, 27 Feb 2023 16:09:37 +0800
Message-ID: <1677485381-11595-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:10:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101278

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Fix
----
    Format hint test doesn't need to establish a connection (#941) (b7a0f35)

Other
------
    Don't build pdfs on RTD (#944) (d200673)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-imageio_2.25.0.bb => python3-imageio_2.25.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-imageio_2.25.0.bb => python3-imageio_2.25.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.25.0.bb b/meta-python/recipes-devtools/python/python3-imageio_2.25.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-imageio_2.25.0.bb
rename to meta-python/recipes-devtools/python/python3-imageio_2.25.1.bb
index 4edd166fd..9a9205c37 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.25.0.bb
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.25.1.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=24cb9a367a9e641b459a01c4d15256ba"
 
-SRC_URI[sha256sum] = "b80796a1f8c38c697a940a2ad7397ee28900d5c4e51061b9a67d16aca867f33e"
+SRC_URI[sha256sum] = "6021d42debd2187e9c781e494a49a30eba002fbac1eef43f491bbc731e7a6d2b"
 
 inherit pypi setuptools3
 
-- 
2.34.1


