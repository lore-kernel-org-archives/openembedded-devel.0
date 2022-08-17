Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5526DC25B0E
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 02:58:02 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web08.24632.1660705080086012160
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Aug 2022 19:58:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=iVGAvAHo;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1660705078; i=@fujitsu.com;
	bh=CtrAs09GD02WiVvknScqbJ/dTZF3+ZtQenOETWaGxlc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=iVGAvAHoo2THUMRv0W9OlW+er51KmSOxrn21TDxEljA+e+mnhq/PgJjqSmyomia/i
	 PM5Hdgy4X95ZsVH9hr8lmtwTazc5d9GEXLUTr6OnV8YlZ+5DcLTsrvEt1YzSnTnwBi
	 pUirkhBgb7z89Uu7cF1dHPOC2YYabsPUEe3yZntgzr4Qe6s1mufR/onxUQwP7bf4Yz
	 wxWrYWHJQoqLwtIO65MflYH6ZADG65pghDEm1L+8yA0bJzbsdiqfc2MSOaQdG/utm5
	 iixXxdGQrz5GnYr3uOk58tLtbM1xkXUgUKBoFT7HX8qmDkF2ZXpUef4x53ViaYkaeN
	 ExHWDLPai3vdw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAIsWRWlGSWpSXmKPExsViZ8MxSdc08k+
  SwdNLJhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8arJbOYCtZxVnz5+oK9gfEcRxcjF4eQwBNG
  ieXz/rNAONeZJB5smAjl7GGU6H3/hbGLkZODTUBNYvqtG6wgtoiAvsTS2XuYQWxmARWJF7972
  EFsYQF/if1fJjOB2CwCqhKbNu4Bs3kFnCTW/L4ONkdCQEFiysP3zBBxQYmTM5+wQMyRkDj44g
  UzRI2ixOzLzSwQdoXEjBnb2CBsNYmr5zYxT2Dkn4WkfRaS9gWMTKsYrZOKMtMzSnITM3N0DQ0
  MdA0NTXWNLYCUoV5ilW6iXmqpbnlqcYmukV5iebFeanGxXnFlbnJOil5easkmRmBgphSr5e9g
  /Lvyp94hRkkOJiVR3n6mP0lCfEn5KZUZicUZ8UWlOanFhxhlODiUJHi/hQPlBItS01Mr0jJzg
  FECk5bg4FES4ZUNAErzFhck5hZnpkOkTjHqcsz82naAWYglLz8vVUqc960PUJEASFFGaR7cCF
  jEXmKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzPsd5BKezLwSuE2vgI5gAjri2MXfIEeUJCK
  kpBqYqmrlp7Mdi9+3+q6TY2eo5JL/qt8WzeX4dOhhv+bp5cdYLq+ffVdIvsv/xsF1j5be4YrY
  Zrvp1x7NFxIdAbtnucQfF3Cee+3zIumWjIOH477JrcyNuJH3cnqF64E7LGtMkvJcIipzgz4yR
  Kc/Xtat5tl/QmOyWEPq/Is7jMMXHpv1tGWXiMyVQscFl4Qz1P7K6E/uvGjVvu+ft1fnvmnFSo
  7ch1NnMswMvzB/49ybt5N+aS4LyXr/f4vJ7cNzJsadTBHn0z3y0UNjqVDP/Nr7U5tdOcw6NSQ
  zNxlrdzwMVOyaIt6WmJef9eyhqsSf1dt8vp0v+sdQ+nzqV195E8v0pdf3Bj+9/2xu02eLpA2n
  3ymxFGckGmoxFxUnAgDU7LRWUwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-565.messagelabs.com!1660705077!214058!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14313 invoked from network); 17 Aug 2022 02:57:57 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-17.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 17 Aug 2022 02:57:57 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 928BB1000C1
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 03:57:57 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 85CFD1000C0
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 03:57:57 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 17 Aug 2022 03:57:56 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pycodestyle: upgrade 2.9.0 ->
 2.9.1
Date: Wed, 17 Aug 2022 10:57:36 +0800
Message-ID: <1660705060-17241-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Aug 2022 02:58:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98279

Changes:

    E275: fix false positive for yield expressions.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-pycodestyle_2.9.0.bb => python3-pycodestyle_2.9.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pycodestyle_2.9.0.bb => python3-pycodestyle_2.9.1.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-pycodestyle_2.9.0.bb b/meta-python/recipes-devtools/python/python3-pycodestyle_2.9.1.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-pycodestyle_2.9.0.bb
rename to meta-python/recipes-devtools/python/python3-pycodestyle_2.9.1.bb
index b383828f0f..928e2b2ae7 100644
--- a/meta-python/recipes-devtools/python/python3-pycodestyle_2.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pycodestyle_2.9.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a8546d0e77f416fb05a26acd89c8b3bd"
 
-SRC_URI[sha256sum] = "beaba44501f89d785be791c9462553f06958a221d166c64e1f107320f839acc2"
+SRC_URI[sha256sum] = "2c9607871d58c76354b697b42f5d57e1ada7d261c261efac224b664affdc5785"
 
 inherit pypi setuptools3
 
-- 
2.25.1


