Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D250CC43334
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 01:41:52 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web08.3159.1658454102094360706
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jul 2022 18:41:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=L+oJwlSk;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658454100; i=@fujitsu.com;
	bh=Jw4W1l32bdimQ4WiUYslDY+hUoY9JnXk72xJ6nHEMwc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=L+oJwlSkq1PEQBKCnuj5PFc4YkOKL6UdXhB6JAATgCo+EwZ5Bi9GCGRGSWku0hlQo
	 Sd1Y+iCl1yoFD25rfbcQBXT3beURMceLnZ0ryF3IYLQd/qqMrVFebKI7tSQUoXbkWG
	 +xVQDwNseSQzRNqVyasYVdadNpCHJkSILPhi4C1EFXRfglz/M6gGuWUsyVB9KWaZ4x
	 ITHQXMpumdRqC2x0/zLtXUkAPVSZ6fMk+WeUE4yT2oC0KX83dibw/dd2GcF2No+BXy
	 FGQg9w4dXL/5S9phfLDaumT1+h6oNRGSVhJolgr3WiMGgngkgQmRLh6bwYXOs/LAPT
	 zFJ3noMy/vofA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRWlGSWpSXmKPExsViZ8MxSTeY4Va
  SwdxZ3BYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aRjY3sBb84K9Zf8m1g7OLsYuTiEBJ4wigx
  aflrZgjnOpPEmc//WCCcA4wSB3bPB8pwcrAJ6Eq8+LGYBcQWEdCXWDp7D1Ccg0NYwENiaUsuS
  JhFQFVifuMENhCbFyi86N4hsHIJAQWJKQ/fM0PEBSVOznwCFmcWkJA4+OIF2BgJAUWJ2dPlIc
  orJF4fvsQMYatJXD23iXkCI98sJN2zkHQvYGRaxWiVVJSZnlGSm5iZo2toYKBraGiqa6JrZGy
  pl1ilm6iXWqpbnlpcomuol1herJdaXKxXXJmbnJOil5dasokRGHgpxSzvdzA29f3UO8QoycGk
  JMq7b9LNJCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvAV/gXKCRanpqRVpmTnAKIBJS3DwKInwW
  nwBSvMWFyTmFmemQ6ROMepyzPzadoBZiCUvPy9VSpx3yVegIgGQoozSPLgRsIi8xCgrJczLyM
  DAIMRTkFqUm1mCKv+KUZyDUUmYd8p/oCk8mXklcJteAR3BBHSEufkNkCNKEhFSUg1MpX851m7
  YO6NdOXF5vt4W1iUZjNGNLnL+DQ1mvxcWiG1PWFNXplZvH+o8uf7Lghkz8hL4WH7U1/JPtMgu
  5z/7JmumsS3/aR71Gtkzh7IPbIj5/SiVaarF2a1V2x61TnUsFkg4Eya5+bxu+mLvE5GKey/mF
  QfxLbhyVY5t5f6Wr9KKdfvren0kL927tG/q6o3xt1aJfljqaKck3CK5SsmiafM9qcxFZyuiuP
  /OCn+//Yxlluw+oZe3LaW213OtX5X6of3LI/srm+RNm5x+LrqeqPep9II8k0rVpIfhT1rWFzN
  x/vGe11XtaNQq+Fhuzf5A5xPbkqQd5jy589Hvdd6qWQsa5q/dLuRmmKZ0QvKtEktxRqKhFnNR
  cSIAUuY6WUMDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-9.tower-585.messagelabs.com!1658454098!220142!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31529 invoked from network); 22 Jul 2022 01:41:39 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-9.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Jul 2022 01:41:39 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id CBB161000CE
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jul 2022 02:41:38 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id BEAE7100077
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jul 2022 02:41:38 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 22 Jul 2022 02:41:37 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-cmd2: upgrade 2.4.1 -> 2.4.2
Date: Fri, 22 Jul 2022 09:41:30 +0800
Message-ID: <1658454090-24280-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Jul 2022 01:41:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97935

Enhancements
------------
-Updated argparse decorator to remove annotations when the docstring is used
 for a command's help text.
-Updated unit test to be Python 3.11 compliant.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../python/{python3-cmd2_2.4.1.bb => python3-cmd2_2.4.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_2.4.1.bb => python3-cmd2_2.4.2.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_2.4.1.bb b/meta-python/recipes-devtools/python/python3-cmd2_2.4.2.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-cmd2_2.4.1.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_2.4.2.bb
index 8e3883b4f9..d2434b626f 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_2.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_2.4.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=209e288518b0668115f58c3929af9ff1"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "f3b0467daca18fca0dc7838de7726a72ab64127a018a377a86a6ed8ebfdbb25f"
+SRC_URI[sha256sum] = "073e555c05853b0f6965f3d03329babdf9e38a5f2cea028e61a64cd7eeb74ad5"
 
 inherit pypi setuptools3
 
-- 
2.25.1


