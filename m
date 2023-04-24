Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25530C77B73
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 03:30:39 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web10.43220.1682307031750601176
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Apr 2023 20:30:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=sld56FNA;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1682307029; i=@fujitsu.com;
	bh=KY1FbVcM02gsghn5PFdU+e+tZpq2R6WN7oewxgdg+kc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=sld56FNAoraIXfOBDSQekV0p1KWfzDhIBC8S3thwTIKISf73t2nYGwSXqz5ZoNun3
	 12yTG5qUxawZCYrEBFqjybL9fAW0iXp9/TDHv8KrYpSsyjuDuPtPlJtsN3d6/9KY8v
	 ++MkV5wGqbEbzN3+zVnVv7UgJcJWFAFxuEECRLAQqcnDN0wi858gfWs6SYVK2iUEzr
	 ACH+eHV43YzplGfTih1QKhTa6tmAg0medJg9st71sKInoNiJWaf80CZ7YYCLBzELHL
	 gxxrpfEwGrbjdyVEY0glGprGBhgxClkE1J6Q+y0LasSxVuKuKK1CPlXnrFZS2zwrRq
	 ao8gh7ttQ8reg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDIsWRWlGSWpSXmKPExsViZ8ORpHv1u2u
  KwedtAhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bZ56cYCyZwV0zYt4u1gbGHq4uRi0NI4CGj
  xK9Vq1kgnKtMEt1XDjNCOHsZJVZe+A2U4eRgE5CSuHH/PxuILSKgL7F09h5mEJtZQEXixe8ed
  hBbWMBHYveS60DNHBwsAqoSnb2yICavgJPE3WOhIBUSAgoSUx6+B+vkFRCUODnzCQvEFAmJgy
  9eMEPUKErMvtzMAmFXSrR++AVlq0lcPbeJeQIj/ywk7bOQtC9gZFrFaFqcWlSWWqRropdUlJm
  eUZKbmJmjl1ilm6iXWqpbnlpcomukl1herJdaXKxXXJmbnJOil5dasokRGIgpxUodOxiv7/yr
  d4hRkoNJSZR3yQaXFCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvEWfXFOEBItS01Mr0jJzgFEBk
  5bg4FES4V32BSjNW1yQmFucmQ6ROsWoKCXO6/8NKCEAksgozYNrg0XiJUZZKWFeRgYGBiGegt
  Si3MwSVPlXjOIcjErCvJIfgKbwZOaVwE1/BbSYCWjxLm4XkMUliQgpqQamFJGex/NLBGfqL6u
  0t4toYi5eWbr9iM6l5LtzurP/LN5u4j35xIIlO6uXeuhMXcT5RWnxhtPMMtdf3Vr4rN8vSnrJ
  5lmql5ue35lRkbLPanrlL5M3Nvu9REt2HVvoFzThnuoRmVCvaK1fNVyt7T7qqzcenOmyJt3Fw
  /suy6vrL6N/qZ/34n03T1Jff3bkhMTvYfk86Xt8PQRT5u2sCaxR/8cuIu1//7rNpqw2rnvZT4
  V1X/DsSdHbU5Y/PdWwN3NFR9yxd7mlynevXN2xg605+M2+fec4XqbsXPJw/n75nZ5i26Y8cYs
  9ecVt9ppr1r2LvN99mXZOQdpOnkHqibOv/v01ntdNHbinVvw2vHelQImlOCPRUIu5qDgRAHYT
  W+o/AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-548.messagelabs.com!1682307029!139255!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27598 invoked from network); 24 Apr 2023 03:30:29 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-10.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Apr 2023 03:30:29 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id F3CBB1B5
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 04:30:28 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id E84971AC
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 04:30:28 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 24 Apr 2023 04:30:27 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pyscaffold: upgrade 4.4 -> 4.4.1
Date: Mon, 24 Apr 2023 11:30:08 +0800
Message-ID: <1682307012-11984-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 03:30:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102169

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
    Re-use pre-built wheels in CI for upgrade tests in #702
    Make security permissions explicit in GHA template #704
    Fix GITHUB_TOKEN variable in GHA template #715

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pyscaffold_4.4.bb => python3-pyscaffold_4.4.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyscaffold_4.4.bb => python3-pyscaffold_4.4.1.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-pyscaffold_4.4.bb b/meta-python/recipes-devtools/python/python3-pyscaffold_4.4.1.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-pyscaffold_4.4.bb
rename to meta-python/recipes-devtools/python/python3-pyscaffold_4.4.1.bb
index 980b6d965..8af13b6f2 100644
--- a/meta-python/recipes-devtools/python/python3-pyscaffold_4.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pyscaffold_4.4.1.bb
@@ -9,7 +9,7 @@ LICENSE = "0BSD & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=14a49c74a1d91829908ac756c07e6b91"
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "94088d129b61cd9b4b4607c6a466759b1bb2ada36206d5ac20aa319edcc5d701"
+SRC_URI[sha256sum] = "4dbdb76c45ad860dfe64e00103c18a6279ce382ddd5a7f18651c129c5539a0ab"
 
 inherit pypi python_setuptools_build_meta
 PYPI_PACKAGE = "PyScaffold"
-- 
2.34.1


