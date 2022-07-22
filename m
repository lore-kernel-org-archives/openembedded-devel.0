Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01C0DC43334
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 02:10:02 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web11.3400.1658455799282684894
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jul 2022 19:10:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=gjG+NliH;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658455797; i=@fujitsu.com;
	bh=RPmBKiuLyyl4vPlnH2bZ5t+yRLKN518yZQLdcNaCZ+k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=gjG+NliHnVebxVYnriwuNi74es7iNoV16e8q9fcHrskv41D1G5+HHYsPBGu/UMeB1
	 fza7ANTz2PYom7u/YG/jQ03nSSqqlaKUHmecpI4J/yVBFyFbMlgKzUSc2EtBtgseP3
	 dd8KrrHfl40AC4cvo6nwEqFuGNExbdpE3SY5NgB5dXvqvl/AHO2GSuST57WcrOY9Yq
	 JLw5cJxJL0pTSxqP0pkouBFi2KyEKtGENWqPWibpVoVe0Mp5M8MbZaJqzePcypB1JQ
	 Dl3LAAIyTBU1LRs+073YxhgLd7pCXfsBvENih/uW4nNvZeRzzUUhWpwX6RMwI7vzin
	 DbbffEtcE2otQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRWlGSWpSXmKPExsViZ8ORqPuF7Va
  SweQ/AhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8anV6tYC95yVlz6c5GtgXESZxcjJ4eQwBNG
  iVeTmLsYuYDs60wS+17+ZIdw9jBKtLQ2soNUsQmoSUy/dYMVxBYR0JdYOnsPM4jNLKAi8eJ3D
  1iNsECwxM7VZ5i6GDk4WARUJd7PqQYJ8wo4SVz58pEJxJYQUJCY8vA9WCungLPEzRf/mCCOcJ
  JYcaKRCaJeUOLkzCcsEOMlJA6+eMEM0asoMftyMwuEXSExY8Y2NghbTeLquU3MExgFZyFpn4W
  kfQEj0ypGy6SizPSMktzEzBxdQwMDXUNDU11jXQszvcQq3US91FLd8tTiEl1DvcTyYr3U4mK9
  4src5JwUvbzUkk2MwABOKWYO28H4p/en3iFGSQ4mJVHefZNuJgnxJeWnVGYkFmfEF5XmpBYfY
  pTh4FCS4L3CfCtJSLAoNT21Ii0zBxhNMGkJDh4lEV6LL0CtvMUFibnFmekQqVOMilLivOqsQH
  0CIImM0jy4NlgEX2KUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzNvGAjSFJzOvBG76K6DFTEC
  Lzc1vgCwuSURISTUwNawR9A9bVOci2RM3Q6Y0xEIpxMClgG8Rj5/k+9S/TgFeggu01zwt37Jn
  arvk27jmd5f5bi722zv7Lb+azHq56wIGcw8tqnnprPSO1S+oZ9lP8WylWhtzkb3PnTaILZh8z
  pF7TtQ95coyr3+/V/s82RMcNLlxqb2TIL+KhlfQccbgD05vUn676flEpe6ZPSH2UqBNVfNVte
  58tx39bLZz9sbtL9Q+HOP45cxfo9+v0jk0igXj/rSk7H949+C9x465/5dN/Ny4RvpMlILBHFW
  eG7saeferHxbfZ33u4gL/6fX98lpfo2N+T27QnSnnPtfDq/XSw593wpzWf2RMtvn1S/xQcpbZ
  2XcvL55ZM5FbiaU4I9FQi7moOBEA4g/+PVsDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-585.messagelabs.com!1658455796!308185!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24420 invoked from network); 22 Jul 2022 02:09:56 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-4.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Jul 2022 02:09:56 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id DAD1C100193
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jul 2022 03:09:55 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id CE078100191
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jul 2022 03:09:55 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 22 Jul 2022 03:09:54 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pytest-metadata: upgrade 2.0.1 ->
 2.0.2
Date: Fri, 22 Jul 2022 10:08:56 +0800
Message-ID: <1658455737-26848-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1658455737-26848-1-git-send-email-wangmy@fujitsu.com>
References: <1658455737-26848-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Jul 2022 02:10:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97939

Changelog:
==========
Allow all python versions above 3.7

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ytest-metadata_2.0.1.bb => python3-pytest-metadata_2.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-metadata_2.0.1.bb => python3-pytest-metadata_2.0.2.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-metadata_2.0.1.bb b/meta-python/recipes-devtools/python/python3-pytest-metadata_2.0.2.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-pytest-metadata_2.0.1.bb
rename to meta-python/recipes-devtools/python/python3-pytest-metadata_2.0.2.bb
index 35e8b7568f..e82213cbe5 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-metadata_2.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-metadata_2.0.2.bb
@@ -4,7 +4,7 @@ DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d425c8f3157dbf212db2ec53d9e5132"
 
-SRC_URI[sha256sum] = "5cdb6aeea8ba9109181cf9f149c8a3ae1430ff7e44506a8f866af8a98ca46301"
+SRC_URI[sha256sum] = "fcd2f416f15be295943527b3c8ba16a44ae5a7141939c90c3dc5ce9d167cf2a5"
 
 PYPI_PACKAGE = "pytest-metadata"
 
-- 
2.25.1


