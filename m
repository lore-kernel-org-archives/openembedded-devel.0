Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E44DC4332F
	for <webhook@archiver.kernel.org>; Sun, 13 Nov 2022 03:15:56 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web09.267.1668309348601053286
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Nov 2022 19:15:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=aEFcW08E;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1668309347; i=@fujitsu.com;
	bh=0dg7IhUxsoidbwF4c3eNbks2n79u24M17TbtEQDpiSQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=aEFcW08E3iqjQ7pOaPegk2nlOVagaV4PvAbaUfYqtjeQZWVvgLMuDJNbsG50rrT+Z
	 Wca01Etnh16+YHfIr9DRauqbo9/XfBvdV74cYetGNYGXKR8tdRZo6uK8IRnqX0zoCo
	 XHLxJmd9O9bgKkLpUq26B5Wil+wlLadqMTneB89tz3BCNZyPRNXz3D8NYdrHqyTUph
	 Axc/7spZtYnpnvB2uYcPGluMMpfGrQNAkNLhJNlVXil6bR9+pJA8qnVUPS1UZZWEV/
	 AQdfvMEZkAovtatVZGzTBDnDomqxP9DUulhoNb3P5uw83mMeXhy3LENi69I9zU6X71
	 bn61iid48nIww==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrNIsWRWlGSWpSXmKPExsViZ8OxWTcxsSD
  ZYGa7isXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmtHSP5Wp4CFPxYFTHg2Mk7m7GLk4hAQeMkrM
  W/qVBcK5zCSx6s4iRghnD6PEiWcHgTKcHGwCUhI37v9nA7FFBPQlls7ewwxiMwuoSLz43cPex
  cjBISxgKzG7KRQkzCKgKnFl1w2wEl4BJ4nNVx+zgtgSAgoSUx6+ZwYp5xRwlphwSAYkLARUMn
  XGCVaIckGJkzOfsEBMl5A4+OIFM0SrosTsy80sEHaFxKxZbUwQtprE1XObmCcwCs5C0j4LSfs
  CRqZVjKbFqUVlqUW6lnpJRZnpGSW5iZk5eolVuol6qaW65anFJbpGeonlxXqpxcV6xZW5yTkp
  enmpJZsYgWGbUqyuuoPx3LI/eocYJTmYlER5067nJwvxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4
  P0dWZAsJFiUmp5akZaZA4whmLQEB4+SCG+FHVCat7ggMbc4Mx0idYrRkmPq7H/7mTmWg8mZX9
  sOMAux5OXnpUqJ885OAGoQAGnIKM2DGweL80uMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHn
  XRgNN4cnMK4Hb+groICagg75H5oEcVJKIkJJqYGrrS3gW8c64Zd1R08UWE/b1307S/vXN489d
  /v3rPmY/ESv+2JVVetO3/djWXWuC+B7cfbGVNagpgGWOgB1/VcO26/aZB7ztLlpouL82sYmXv
  PovJ0GWYdr31htcq7R9Tv9aHHzDusje/vz1mGmf6/6yvghq58rlM1cLqO+dPb/Be/UB36O39j
  V2+LzkkXs0JTd/s2b2/5f15fGz0nJUtzR5hiXkGJ08/GJ6FLNl+pJTX53Wep+cOYX3ncODC7J
  b3rN/d33zIcrilFvuhu4jJrw3RFZnG63fdbz1yX9F0Rf7IrwOL+Scvmed/Mq4r3cTtFLNv+6Q
  aTnee+u88Uv+LYoVQfdd7ugkePRqpd//1a/EUpyRaKjFXFScCABeFAU4bgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-571.messagelabs.com!1668309345!833641!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29261 invoked from network); 13 Nov 2022 03:15:45 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-13.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 13 Nov 2022 03:15:45 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 52A78142
	for <openembedded-devel@lists.openembedded.org>; Sun, 13 Nov 2022 03:15:45 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 4645473
	for <openembedded-devel@lists.openembedded.org>; Sun, 13 Nov 2022 03:15:45 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Sun, 13 Nov 2022 03:15:43 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] mpich: upgrade 4.0.2 -> 4.0.3
Date: Sun, 13 Nov 2022 11:15:15 +0800
Message-ID: <1668309316-15398-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1668309316-15398-1-git-send-email-wangmy@fujitsu.com>
References: <1668309316-15398-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Nov 2022 03:15:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99570

From: Wang Mingyu <wangmy@fujitsu.com>

Changes in 4.0.3
=================
    Fix message queue dumping interface support
    Fix multinic usage in ch4:ofi
    Fix bug in MPI_WIN_CREATE in ch4:ucx when UCX >= 1.13.0
    Fix MPIR_pmi_barrier when PMI2 is used
    Fix ROMIO lazy mutex initialization
    Fix build with HIP support
    Fix potential dynamic process message mixups in ch3
    Add missing const to MPI_Pready_list array_of_partitions argument
    Add support for C++ datatypes even when the C++ binding is disabled
    Add support for Intel OneAPI compilers

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-devtools/mpich/{mpich_4.0.2.bb => mpich_4.0.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/mpich/{mpich_4.0.2.bb => mpich_4.0.3.bb} (95%)

diff --git a/meta-oe/recipes-devtools/mpich/mpich_4.0.2.bb b/meta-oe/recipes-devtools/mpich/mpich_4.0.3.bb
similarity index 95%
rename from meta-oe/recipes-devtools/mpich/mpich_4.0.2.bb
rename to meta-oe/recipes-devtools/mpich/mpich_4.0.3.bb
index d277f7e71..000f73981 100644
--- a/meta-oe/recipes-devtools/mpich/mpich_4.0.2.bb
+++ b/meta-oe/recipes-devtools/mpich/mpich_4.0.3.bb
@@ -6,7 +6,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=bd4d7ab13df98988b1ca2a4e01c8c163"
 
 SRC_URI = "http://www.mpich.org/static/downloads/${PV}/mpich-${PV}.tar.gz"
-SRC_URI[sha256sum] = "5a42f1a889d4a2d996c26e48cbf9c595cbf4316c6814f7c181e3320d21dedd42"
+SRC_URI[sha256sum] = "17406ea90a6ed4ecd5be39c9ddcbfac9343e6ab4f77ac4e8c5ebe4a3e3b6c501"
 
 RDEPENDS:${PN} += "bash perl libxml2"
 
-- 
2.25.1


