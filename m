Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22E97C433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 14:09:43 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.19996.1646057381597685676
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 06:09:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=HftDMXwo;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646057379; i=@fujitsu.com;
	bh=7wQIq1Jn4hSWjfjrI2BlSD2+Jw/gOKW84Ggg+xgw6Zo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=HftDMXwog50eHV+u6mxkZwNQ3OSlLPBsMW3QLQ3eqVSi8detz1wIGVN4yzwHiBHqn
	 ikFs5uEoU1WCtTCgG5MLMT3DifbmHYjtG5kxFdN7hoN39gvnOQoYvJZoWGtnKwScSs
	 X2bscakhi1AR7rCEhhO7xXqCFSx0MGMvAdWj1Ov/sU7C00tS1z1ysbeYHJ0sghMo7U
	 nhH02sxeWayvJjkyKUngplnRhYCoMEv712aPQx6sb4PHh6y3w0m/fbt27zwxsjBixi
	 o1zQAwvvACTE6xM/5avOC5IdjK6+TMRPDJCxO4qptbCGFdFNVoyqEy4IrFwHU+yXmx
	 z4V7yQEQB/Yqw==
Received: from [100.115.7.206] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.ess.symcld.net id BE/1F-12986-3A7DC126;
 Mon, 28 Feb 2022 14:09:39 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8MxSXfxdZk
  kgzeneC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1ox7G04yFZznqtiycx1LA+N9zi5GLg4hgSeM
  Ej8ezmCFcC4wSfyaOYkJwjnBKHG7bw5jFyMnB5uAmsT0WzdYQWwRAX2JpbP3MIPYzAIqEi9+9
  7CD2MICnhLLH7cC1XBwsAioSuw9xQ0S5hVwkvj+YA9Yq4SAgsSUh+/BWjkFnCWmXzrCAmILAd
  U86XjIDFEvKHFy5hMWiPESEgdfvGCG6FWUmH25mQXCrpCYNauNCcJWk7h6bhPzBEbBWUjaZyF
  pX8DItIrRKqkoMz2jJDcxM0fX0MBA19DQVBdImproJVbpJuqlluqWpxaX6BrqJZYX66UWF+sV
  V+Ym56To5aWWbGIEBnFKMcOsHYyz+n7qHWKU5GBSEuXl7JJMEuJLyk+pzEgszogvKs1JLT7EK
  MPBoSTB23lMJklIsCg1PbUiLTMHGFEwaQkOHiUR3qeXgdK8xQWJucWZ6RCpU4yKUuK8KdeAEg
  IgiYzSPLg2WBRfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTM+w9kCk9mXgnc9FdAi5mAFv8
  NlgJZXJKIkJJqYDqaO6XzfNOCVZ7Cj+69WqSUocISbWT/VjuCv+yKkq3W24O+22xvNzxa/3z/
  4Uk7Pnq5XFD72GBcc//IFYvHkVJ7ld7OakzsFf7hqys2Rbvhi+GHuL7UW9kGU/JN1mRVT+DZX
  T9Hseb351eeEtOy+A+XybRt+2XcsbO4+tQ3K7bDoSarnz36tWXR73sFR/88PfTK/XVFYNrT+b
  7L76bPqEnYaFZz4GC06e6H8v5fzW74OzQXXJNfo69qHuFY/9hz+tJO+Qh7mf9qLup6X48dOct
  RL87DHJlvEB756EeP/Jtbr/si5l/u71gpr7GvUGiF3deexz5u7uIT6tvu1UoaXfsrVrZCxX4R
  e6S7vZBDkxJLcUaioRZzUXEiAK509x1dAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-587.messagelabs.com!1646057378!12830!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25203 invoked from network); 28 Feb 2022 14:09:39 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-15.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Feb 2022 14:09:39 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id BE15D100440
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 14:09:38 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id B0BE110033B
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 14:09:38 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 28 Feb 2022 14:09:22 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] openconnect: upgrade 8.10 -> 8.20
Date: Mon, 28 Feb 2022 22:09:08 +0800
Message-ID: <1646057348-36134-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1646057348-36134-1-git-send-email-wangmy@fujitsu.com>
References: <1646057348-36134-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Feb 2022 14:09:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95573

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../openconnect/{openconnect_8.10.bb => openconnect_8.20.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/openconnect/{openconnect_8.10.bb => openconnect_8.20.bb} (87%)

diff --git a/meta-networking/recipes-connectivity/openconnect/openconnect_8.10.bb b/meta-networking/recipes-connectivity/openconnect/openconnect_8.20.bb
similarity index 87%
rename from meta-networking/recipes-connectivity/openconnect/openconnect_8.10.bb
rename to meta-networking/recipes-connectivity/openconnect/openconnect_8.20.bb
index 7a61f74e31..d204481164 100644
--- a/meta-networking/recipes-connectivity/openconnect/openconnect_8.10.bb
+++ b/meta-networking/recipes-connectivity/openconnect/openconnect_8.20.bb
@@ -1,11 +1,11 @@
 SUMMARY = "Open client for Cisco AnyConnect VPN"
 LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING.LGPL;md5=243b725d71bb5df4a1e5920b344b86ad"
+LIC_FILES_CHKSUM = "file://COPYING.LGPL;md5=8c2e1ec1540fb3e0beb68361344cba7e"
 
 SRC_URI = " \
     git://git.infradead.org/users/dwmw2/openconnect.git;branch=master \
 "
-SRCREV = "9d287e40c57233190a51b6434ba7345370e36f38"
+SRCREV = "03a3b9c76a9b6d0a65073b6bebbc1192e3445507"
 
 DEPENDS = "vpnc libxml2 krb5 gettext-native"
 RDEPENDS:${PN} = "bash python3-core vpnc-script"
-- 
2.25.1


