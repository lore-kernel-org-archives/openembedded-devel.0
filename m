Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C9F6C761A6
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 10:05:44 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web10.66296.1680516337241754033
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Apr 2023 03:05:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=GBUxM7ly;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1680516335; i=@fujitsu.com;
	bh=PWf0DSNbdb4NCR/+hjh9Vt6lYxxGmLJa2vKCTXqdDfs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=GBUxM7lyKnR0XRR35oIfYXrsYWC8oHLciWjQToGtRYwES1tgcd2PtLggSwzUupKVi
	 Sm2guPBdElFCBFsX62my2+aXHL/14lOEJOHLo9JczUKj+DtJ7XvitoOIgLyen/ppRq
	 q8OUPXYFC3qdkjcceWIaN7kpm/zYvpcvl2IFdbVTJITsvkhlejThCO0jcD3cmSJZyL
	 6xHarf6fArMgNQEvCvrF16Vc4MkSBfSlJKqoQBXbkk7eBoaftY9x6VVVus2NoGfUGT
	 L5lqsJxfyEpmalVxHAlPtUdoSkLADXOSHU7TUdeQ3sShQ7pnLk/yVNMzNaR4dvBjHd
	 rok5lD/eya5Fg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJIsWRWlGSWpSXmKPExsViZ8MxSff9Eq0
  UgzXnGS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1ozG83MZC2bxVuxd9Je9gfE2dxcjJ4eQwBNG
  iZnrhbsYuYDs60wS705/ZIFwdjNK/Pq/nx2kik1ASuLG/f9sILaIgL7E0tl7mEFsZgEViRe/e
  8BqhAV8JSZ+2cgCYrMAxa923WcCsXkFnCTu9m8HsyUEFCSmPHzPDBEXlDg58wkLxBwJiYMvXj
  BD1ChKzL7czAJhV0g0Tj8E1asmcfXcJuYJjPyzkLTPQtK+gJFpFaNpcWpRWWqRrpFeUlFmekZ
  JbmJmjl5ilW6iXmqpbnlqcYmuoV5iebFeanGxXnFlbnJOil5easkmRmAophSzde9gXN/7V+8Q
  oyQHk5Ior2C9VooQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCd55i4BygkWp6akVaZk5wLiASUtw8
  CiJ8CouAErzFhck5hZnpkOkTjHqcnTu7zrALMSSl5+XKiXOexpkhgBIUUZpHtwIWIxeYpSVEu
  ZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMK7YYaApPZl4J3KZXQEcwAR3RGqUBckRJIkJKqoFpReS
  smRECu3+61NWnbL0otUM/Kj7ol0qCrrWsuKXpIwNrx7J3Rw2Ca/QV72x/KXEn6FXxPsWFV0pn
  Tb3p93nrfqE3gk7O+3kY17Ot9L61Uno685nvRdFpmi+PrywpfvTld9ObE5tmPwwUtzXRubi3a
  53A5Yk6L9dtjX+54ViTlqov9zrGJQY3d1dNE6qZJ93y+L1EZPVKj0V6+9S/aT9anqJ8rk47Su
  veap3ZZvt3n7UXWCSRZ831iHWp8RrjT1ceuR1ZUtd57/XFyK0+XqdnCXw+/O7LCRdrmfm7Dcv
  FszbsenzwrsG28MVB7d4KElfCb+Qt6V058+978W2PO5UKr7wNvM9esnouR6ex5fIZakosxRmJ
  hlrMRcWJAAgLdeJMAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-587.messagelabs.com!1680516334!1009889!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10787 invoked from network); 3 Apr 2023 10:05:35 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-2.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Apr 2023 10:05:35 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id A0AD61009B3
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 11:05:34 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 92C6D1009B2
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 11:05:34 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 3 Apr 2023 11:05:33 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-imageio: upgrade 2.26.0 -> 2.27.0
Date: Mon, 3 Apr 2023 18:05:20 +0800
Message-ID: <1680516324-30996-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Apr 2023 10:05:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101919

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Fix
------
    Consistently apply color palettes by default (#955) (938de2d)
    Allow ffmpeg filters to terminate iter (#954) (a463899)
    Handle unknown video duration in pyav metadata (#937) (06a1c0d)
    Update FreeImage backend to v3.18.0 on Windows (#960) (08d3bda)
Feature
---------
    Add n_images to ImageProperties (#966) (76d9aed)
Other
------
    Remove pypy 3.7 testing and improve CI/CD scripts (#964) (b439803)
    Several doc improvements (#959) (ecb6773)
    Add GH Sponsors link (0e13f64)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-imageio_2.26.0.bb => python3-imageio_2.27.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-imageio_2.26.0.bb => python3-imageio_2.27.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.26.0.bb b/meta-python/recipes-devtools/python/python3-imageio_2.27.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-imageio_2.26.0.bb
rename to meta-python/recipes-devtools/python/python3-imageio_2.27.0.bb
index 79e6dd731..be0de475d 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.26.0.bb
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.27.0.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=24cb9a367a9e641b459a01c4d15256ba"
 
-SRC_URI[sha256sum] = "169f1642cdb723133fe8fe901887f4f1b39bc036458c4664f1f9d256226ced35"
+SRC_URI[sha256sum] = "ee269c957785ef0373cc7a7323185956d83ec05e6cdf20b42a03ba7b74ac58c6"
 
 inherit pypi setuptools3
 
-- 
2.34.1


