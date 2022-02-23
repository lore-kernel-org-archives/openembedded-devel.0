Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2F33C433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 02:36:34 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web08.2711.1645583792759101054
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 18:36:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=hjfJcN8D;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1645583791; i=@fujitsu.com;
	bh=lAVV8WxP4l4sWpQJpC/a7lMY7nYSldsW2HuDuGdE8jg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=hjfJcN8DbyFSA+5EJuBBz8LWWwzur960B0IvqOegHvW6gnDUm4rOYSs2OGKFGnyDN
	 GCUda+WLLTrrDE7Mj+OZLXstF5aYUK6VW24FkZIzdbyeI3cB0SClYTgK7oDa3OEADA
	 QgyKUuD30hkLRqw6FBUoouPfChkndTU6QqaN27vTWP4DFxVvFD2qHc2Xrnpl+UqzXN
	 E4lqTKFcthH/ARrjrYa/xFBXmX3AyE5xseU9KWS840DGR8WZ0Ail0CxWGdFH0EjnBy
	 1dr9suoDqhMToRBbqBgxs+RWs4lEjJJ8A5AqbR5CijWATpGAfGz8re+Ald44hgyt7L
	 kP5Oive7tyqNw==
Received: from [100.115.35.240] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-2.aws.ess.symcld.net id A7/C1-02429-EAD95126;
 Wed, 23 Feb 2022 02:36:30 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKIsWRWlGSWpSXmKPExsViZ8ORqLturmi
  SwZEvohYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bUb9PZCubwVxw8sIe5gfE/TxcjF4eQwBNG
  id7jL1khnAtMEpcOP2fpYuQEcvYwSuy8nghiswnoSpx7vJYdxBYR0JdYOnsPM4gtLOAscX7uX
  bYuRg4OFgFViVffdUHCvAIeEkc/fmEFsSUEFCSmPHzPDBEXlDg58wnYeGYBCYmDL14wg7RKCC
  hKzJ4uD1FeIfH68CVmCFtN4uq5TcwTGPlmIemehaR7ASPTKkbrpKLM9IyS3MTMHF1DAwNdQ0N
  TXWNTXUMLE73EKt1EvdRS3fLU4hJdI73E8mK91OJiveLK3OScFL281JJNjMDQSylW3rGDsW3V
  T71DjJIcTEqivHP9RZOE+JLyUyozEosz4otKc1KLDzHKcHAoSfB+mAWUEyxKTU+tSMvMAcYBT
  FqCg0dJhHf/HKA0b3FBYm5xZjpE6hSjopQ4rx4weoQEQBIZpXlwbbDYu8QoKyXMy8jAwCDEU5
  BalJtZgir/ilGcg1FJmPcUyHiezLwSuOmvgBYzAS2ekiUEsrgkESEl1cDktHj7xf5nobuUeZj
  7X2srzJ67c4nUYX85zQIPE++185Qelqxe+MUmrcFxb6XzPuXZG/Kmi9kG3tV9zzdZx1JsRW77
  /RcCZTa31z3j1uy+F5Huu1bz9dJfWvNuu6yZe6Db7dUqaf39Lz9qvmacv9L8pw67v/Odi+95f
  q62c4nebi1yL1+s4+w/kbzc7Aievx8u7FLt+7Ju6UaNK2HHPkg9WSpy5ue+uh/1YdU7I7Tm6J
  vycZ7lVZOxOuXbe2tjcbj5QoO3/T8dTi1wrX1luv5cRPaB9WfS8lfmK2+05Dtk7q0hJ/Hg9SQ
  BrYmLk3e9X3tff96/D8H/p2lxGE9qlviUcSevITHwV8OuyA+XogMLlViKMxINtZiLihMBhWiG
  4zgDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-5.tower-548.messagelabs.com!1645583790!52549!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9976 invoked from network); 23 Feb 2022 02:36:30 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-5.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Feb 2022 02:36:30 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id F311A100197
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Feb 2022 02:36:29 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id E6AEC100192
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Feb 2022 02:36:29 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 23 Feb 2022 02:36:08 +0000
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] poppler: upgrade 22.01.0 -> 22.02.0
Date: Wed, 23 Feb 2022 10:35:53 +0800
Message-ID: <1645583753-38611-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Feb 2022 02:36:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95462

Changelog:
=========
core:
 * Signature: Add a way to detect unsigned FormFieldSignature
 * Signature: Suport background image when using left and right text
 * Signature: Fix path where to search for Firefox NSS in Windows
 * Signature: Fix NSS code to work correctly in Windows/Android
 * Count only signature fields in PDFDoc::getNumSignatureFields
 * Minor code improvements

qt:
 * Allow signing unsigned signature fields
 * Allow passing a background image for the signature when signing
 * Allow passing the document password when signing
 * Fix leftFontSize being ignored when signing

glib:
 * try with utf8 password if latin1 fails
 * New method for getting all signature fields of a document
 * Fix compile with MSVC

utils:
 * pdfsig: Fix compile with MSVC

build system:
         * Fix NSS cmake check for MSVC

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../poppler/{poppler_22.01.0.bb => poppler_22.02.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/poppler/{poppler_22.01.0.bb => poppler_22.02.0.bb} (96%)

diff --git a/meta-oe/recipes-support/poppler/poppler_22.01.0.bb b/meta-oe/recipes-support/poppler/poppler_22.02.0.bb
similarity index 96%
rename from meta-oe/recipes-support/poppler/poppler_22.01.0.bb
rename to meta-oe/recipes-support/poppler/poppler_22.02.0.bb
index 02df6d2163..2954a89b8e 100644
--- a/meta-oe/recipes-support/poppler/poppler_22.01.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_22.02.0.bb
@@ -7,7 +7,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://0001-Do-not-overwrite-all-our-build-flags.patch \
            file://basename-include.patch \
            "
-SRC_URI[sha256sum] = "7d3493056b5b86413e5c693c2cae02c5c06cd8e618d14c2c31e2c84b67b2313e"
+SRC_URI[sha256sum] = "e390c8b806f6c9f0e35c8462033e0a738bb2460ebd660bdb8b6dca01556193e1"
 
 DEPENDS = "fontconfig zlib cairo lcms glib-2.0"
 
-- 
2.25.1


