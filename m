Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D5BBC77B70
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 07:40:41 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web11.48389.1681717233607818218
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Apr 2023 00:40:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=QDU/8l5L;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681717231; i=@fujitsu.com;
	bh=1WWZ4r0ndMlIBTvHQkfevYKnPNd68a86Gz3K8XpPlz8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=QDU/8l5LHTZh8uM6bQU6tLwhH/mAf/rwLyEHVITvO7SpmuXLa03PKelk2qbHU8vQo
	 biTOS1Edss9OyEV89/bpvtOg+289/Orr/d9QPOx814S1FfM/98/a7tR69CyNmQCjoi
	 dDGUDVrNvosqWxqVVW+R92qY7TiWD0ct/lQvPNt9I34mlM9pTycM4j+PdSQ3VoCMlP
	 tppcq6ztov2dtr5L83O+Mey/YyB05En55gq6mZD7rMY/xEwcVIgzpxALgnLlxazEVR
	 P6og6GDxFNiqdKJug7ekQ6e4zYr2sc9sEeWNf7hHo6KZ5n3Qzc6dTL/xqTai88g49X
	 mNvC3qY8N/MUw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8OxWff9d5s
  Ug2PvJC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1owFl+ewF1zgqjj1YjJ7A+Njzi5GLg4hgYeM
  Eive9bJCOFeZJBa9b2CDcPYySix5+Jm5i5GTg01ASuLG/f9sILaIgL7E0tl7wOLMAioSL373s
  IPYwgL+Ek23n7CA2CwCqhL/Nh0Cqufg4BVwklgwuwgkLCGgIDHl4XuwVk4BZ4mG9c9YQUqEgE
  oaW0pBwrwCghInZ0JMYRaQkDj44gUzRKuixOzLzSwQdqVE64dfULaaxNVzm5gnMArOQtI+C0n
  7AkamVYxmxalFZalFuoZGeklFmekZJbmJmTl6iVW6iXqppbrlqcUluoZ6ieXFeqnFxXrFlbnJ
  OSl6eaklmxiBoZtSzPxiB+OPvr96hxglOZiURHlfpFqnCPEl5adUZiQWZ8QXleakFh9ilOHgU
  JLgPf/NJkVIsCg1PbUiLTMHGEcwaQkOHiURXuNnQGne4oLE3OLMdIjUKUZFKXFef2D0CQmAJD
  JK8+DaYLF7iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iw7xuQ7TyZeSVw018BLWYCWiynBLa
  4JBEhJdXA5Jt0Vy9zc3dYYujZppTG85mC1ubHpi0716tZ3Xf3wSszG7U7xt/Pfb5tcZj/yZ3E
  pzb7OJ89z1jim9z29af/tfKtQte3q96NiL1avveNijxPkf2T9FohduuP9385HVwxcY3iHHtr6
  YlJrr6m2+dF65hVSLxf1aBQx+6efvfqnrupD/Mzz/YvmP/uYueKsysW2p37+GuCWsWXDZnGne
  uNOvlFX09vy55r3/Ziv/BJy2XP4iYwTZpi4v5nVs4v9oQQZnML94N1jo0MwWkLDdiPaqyNdPi
  RP5dF80mQsNcch7q6PvlfJ8+cl53VUZ1a9qp5mlLD6RMLvp7qKP3MN8GhWVlMaE637sbvsez1
  nxRdlViKMxINtZiLihMBYap3elgDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-585.messagelabs.com!1681717231!149808!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11672 invoked from network); 17 Apr 2023 07:40:31 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-4.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Apr 2023 07:40:31 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 1088C151
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 08:40:31 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 048E5142
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 08:40:31 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 17 Apr 2023 08:40:29 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-elementpath: upgrade 4.1.0 -> 4.1.1
Date: Mon, 17 Apr 2023 15:39:56 +0800
Message-ID: <1681717197-19108-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681717197-19108-1-git-send-email-wangmy@fujitsu.com>
References: <1681717197-19108-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 07:40:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102110

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
 Simplify type annotations for XSD datatypes
 Full test coverage of sequence type functions with bugfixes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-elementpath_4.1.0.bb => python3-elementpath_4.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-elementpath_4.1.0.bb => python3-elementpath_4.1.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-elementpath_4.1.0.bb b/meta-python/recipes-devtools/python/python3-elementpath_4.1.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-elementpath_4.1.0.bb
rename to meta-python/recipes-devtools/python/python3-elementpath_4.1.1.bb
index 5b8560782..c5f96f2de 100644
--- a/meta-python/recipes-devtools/python/python3-elementpath_4.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-elementpath_4.1.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/elementpath"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5dbb7fb7d72da3921202dd7b995d3ecf"
 
-SRC_URI[sha256sum] = "dbd7eba3cf0b3b4934f627ba24851a3e0798ef2bc9104555a4cd831f2e6e8e14"
+SRC_URI[sha256sum] = "cd2bff3de8cddf8a480f728e648c6cae47d8ab66696c7d830a7a84536d8cae58"
 
 PYPI_PACKAGE = "elementpath"
 inherit pypi setuptools3
-- 
2.34.1


