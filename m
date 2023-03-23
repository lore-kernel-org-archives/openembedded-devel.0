Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ACD5C6FD1C
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 05:14:58 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.65404.1679548490919969821
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Mar 2023 22:14:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=avXzkcs4;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679548489; i=@fujitsu.com;
	bh=ott7mL2M2yGAjlHfSrlGe889UBwiRn+K0y+a1CVT7iw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=avXzkcs4i2XFWoxH55uZW1BDPZlK4vvV6HvVzbALAfldWvmdv2+KBVFhcsDLeErRC
	 uoWhk4/MpN5l/O2KCbyZug7Ni/6mbbc9xGMQ5yuurndgU0Q/jAkQauOM5f/1W5Myyd
	 cfqEUIvKuSC+zTxZS2O12X5ShMNdGhDod5jPslHVBSpV3z/8mw5x6II0idNr5CrQY4
	 jo2wgwZALzZhVC5FPfuHJ6yL1xu7nZn/0CWVV4wtU+ItehihWTKNtfpY6sxqRFkAbm
	 hdFXiLIvrgLzvdbEBtQBws91BHHpGjeCsJVm6PuJDuDnvHuORvGIGslncvgtkVHfxf
	 c2i3PjmVQpaYg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8OxWdfjgXS
  KwdyXMhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bRXftYCvq4KpovvmBqYNzE2cXIySEk8JBR
  4sZvuy5GLiD7CpPEx0l3WCCcPYwSbXMeMoJUsQlISdy4/58NxBYR0JdYOnsPM4jNLKAi8eJ3D
  zuILSzgJ7Hi9mImEJtFQFViS/MWsBpeASeJz0uugNkSAgoSUx6+B7I5ODgFnCXONyVAHOEk8f
  j+ASaIckGJkzOfsECMl5A4+OIFVKuixOzLzSwQdoVE4/RDTBC2msTVc5uYJzAKzkLSPgtJ+wJ
  GplWMpsWpRWWpRbpmeklFmekZJbmJmTl6iVW6iXqppbrlqcUlukZ6ieXFeqnFxXrFlbnJOSl6
  eaklmxiBgZtSrP5rB+PMvr96hxglOZiURHklQqVThPiS8lMqMxKLM+KLSnNSiw8xynBwKEnwC
  twBygkWpaanVqRl5gCjCCYtwcGjJMI79yBQmre4IDG3ODMdInWKUVFKnJfpPlBCACSRUZoH1w
  aL3EuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHl17gFN4cnMK4Gb/gpoMRPQ4rgZEiCLSxI
  RUlINTGt8IreujZDJ7ikJk9E21Kgqn2Zo510oU116bsa5eV65+/dEXs1qM5JR2Wjq9maq56sv
  yb8ZddxuxQlt0XN8py0muqPx8jOO1JvTv21f9vKp57d5l2a5BqqsLK9UXyKmbKPlXic0l8c2w
  FB/a9OJih/h6k82PL80w3C9h/n0q0IcMbGuX9Nb7LlMdr7n0GX+d3BvYPcS/qBTlcy2yyz/dx
  WoVTLa3s26ND8ywjJdy68p65D45uXFzzYstWnaxvsriu9N9dq5wTpNZW0rq90XVlVxlD26Pdu
  1ubgkwyCDbdMxWV7rWNf67wbPtkuaOU41S53yaFOvoMKBkJg28W2vtbyPXxT8bXH19Qsl5V4l
  luKMREMt5qLiRAARgeyeVwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-565.messagelabs.com!1679548488!183909!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22637 invoked from network); 23 Mar 2023 05:14:48 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-9.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 23 Mar 2023 05:14:48 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 2C979156
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 05:14:43 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 29C2D150
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 05:14:43 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 23 Mar 2023 05:14:41 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-sqlalchemy: upgrade 2.0.4 -> 2.0.7
Date: Thu, 23 Mar 2023 13:14:23 +0800
Message-ID: <1679548466-20438-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1679548466-20438-1-git-send-email-wangmy@fujitsu.com>
References: <1679548466-20438-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 05:14:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101658

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://docs.sqlalchemy.org/en/20/changelog/changelog_20.html#change-2.0.7

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-sqlalchemy_2.0.4.bb => python3-sqlalchemy_2.0.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_2.0.4.bb => python3-sqlalchemy_2.0.7.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.4.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.7.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.4.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.7.bb
index e5d0212a6..2d1cc5ed3 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.7.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b707d50badb798e1d897f2c8f649382d"
 
-SRC_URI[sha256sum] = "95a18e1a6af2114dbd9ee4f168ad33070d6317e11bafa28d983cc7b585fe900b"
+SRC_URI[sha256sum] = "a4c1e1582492c66dfacc9eab52738f3e64d9a2a380e412668f75aa06e540f649"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
-- 
2.34.1


