Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4356EC64ED8
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 08:10:01 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.85508.1677485395397076349
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Feb 2023 00:09:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=jF/PoJh6;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677485396; i=@fujitsu.com;
	bh=VHIfDgGrl9+hgGzPndRy1r9nc/pW+rD1TSDM/re4M+A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=jF/PoJh6liT3pDolJkiFvDCNibeOXMJAA76uN5Me+F/JAsZfSSMWYv4NOZ98+w4IY
	 z2PCTA1GxFSS4YM7UI6LDp3WhPAwsRufZd3yYj/k84U7gbBzQrO40W44Yjre2Tg6ai
	 Kq1Ttb2iGO7m+4u+77rXABjtskA/Bb7VaVHugWOBUWGdaxa1+YRhQ54OBwoGDP4gTo
	 +QwoF08fXnyUBpmfm+E81w5tjFdENXbCmy6o/D+x/iFUM6+xpiY8atE0cInyheOFF+
	 s3FJfdNXoC9JFexGLaZdIAyu8VxmxtAFoTWSHLUuF+/6VVjX5OSxUJEgT6TZwlGWs1
	 kEUcasgErWjnQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRWlGSWpSXmKPExsViZ8OxWTck9U+
  ywYq5PBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bMLbPYCnq4Kt7Nu8vewLiAs4uRi0NI4CGj
  xLrlixghnCtMEj83P2GBcPYySqydP5+pi5GTg01ASuLG/f9sILaIgL7E0tl7mEFsZgEViRe/e
  9hBbGEBH4m+lw2MIDaLgKrEhxnrWEFsXgEniXNXZ4LZEgIKElMevgfr5RRwlnizeBpYXAiopu
  V+MztEvaDEyZkgR4DMl5A4+OIFM0SvosTsy80sEHalROuHX1C2msTVc5uYJzAKzkLSPgtJ+wJ
  GplWM5sWpRWWpRbqGxnpJRZnpGSW5iZk5eolVuol6qaW6eflFJRm6hnqJ5cV6qcXFesWVuck5
  KXp5qSWbGIEBnFKcMGMH46++v3qHGCU5mJREeRc5/UkW4kvKT6nMSCzOiC8qzUktPsQow8GhJ
  MF7MAkoJ1iUmp5akZaZA4wmmLQEB4+SCC+zEVCat7ggMbc4Mx0idYpRUUqcly8RKCEAksgozY
  Nrg0XwJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvFEJQFN4MvNK4Ka/AlrMBLR4+8MfIIt
  LEhFSUg1Mmm3rn/9cE9OTLTcja1V7k4HT/c/LtT6v+7dvi8Bdz3bO2a2PxdMc38nsey7Ds1PQ
  7vN83qMhD99se/j/Q6r215hJya+MdmeW7xF3VFzy0tb7RsujlXPv/1v47BjDmR0T7jK7hWxa4
  Blreq57p7bcojevVkar7JNuZ190dsmZl+VdWcvm5iTa/RC41ZSdzNhmLhlipRm/8HTOYQeroi
  xVuct9a5bmq+Z+3zhHyb/MRYrZtHh6DLPoo1Mrfxy03y77uC5FY6tl3ZZNxVG+fRf6vzeKpqd
  uECibLLhB6NFLzbSTsieac9zVEpf6aGk4Gnz5vJSt48kdjaPef3cs/vlmye7irzxacZG7TI4u
  m1X7TYmlOCPRUIu5qDgRAJaRoPpbAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-745.messagelabs.com!1677485395!128632!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22136 invoked from network); 27 Feb 2023 08:09:56 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-21.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Feb 2023 08:09:56 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 8FFF9150
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:09:55 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 833127C
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:09:55 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 27 Feb 2023 08:09:54 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-openpyxl: upgrade 3.1.0 -> 3.1.1
Date: Mon, 27 Feb 2023 16:09:39 +0800
Message-ID: <1677485381-11595-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1677485381-11595-1-git-send-email-wangmy@fujitsu.com>
References: <1677485381-11595-1-git-send-email-wangmy@fujitsu.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101280

From: Wang Mingyu <wangmy@fujitsu.com>

Bugfixes
========
 #1881 DocumentProperties times set by module import only
 #1947 Worksheet-specific definitions are missing

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-openpyxl_3.1.0.bb => python3-openpyxl_3.1.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-openpyxl_3.1.0.bb => python3-openpyxl_3.1.1.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-openpyxl_3.1.0.bb b/meta-python/recipes-devtools/python/python3-openpyxl_3.1.1.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-openpyxl_3.1.0.bb
rename to meta-python/recipes-devtools/python/python3-openpyxl_3.1.1.bb
index f93d258f2..a0a4b6dc9 100644
--- a/meta-python/recipes-devtools/python/python3-openpyxl_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-openpyxl_3.1.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "eccedbe1cdd8b2494057e73959b496821141038dbb7eb9266ea59e3f34208231"
+SRC_URI[sha256sum] = "f06d44e2c973781068bce5ecf860a09bcdb1c7f5ce1facd5e9aa82c92c93ae72"
 
 RDEPENDS:${PN} += "\
 	${PYTHON_PN}-compression \
-- 
2.34.1


