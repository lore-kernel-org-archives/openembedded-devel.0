Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12E7EFA373D
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 07:02:16 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web11.16374.1666594922198165841
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Oct 2022 00:02:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=yZw6Ih11;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1666594920; i=@fujitsu.com;
	bh=2LU4cTdaQYse1OPP4ubw4pvMRox2yu5DhGyCZb6YUZ4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=yZw6Ih11WOAyLIpqxCa3was+DEOERJ0He2XyZb7l9LgnXnL0vJzMT+m4GTbq5qeHz
	 b9ugwfkCXR8IKbSDhfW2mMd7idE1a9ZlCNzKV0vk/exAGy9bSNjV3rOZirR3JFrOVu
	 EpkRbZCWu6MA81VsquisU3hk23W0IL9QTqp2/jb36V12nD8kcrMQtlI5LUoLafJwQj
	 QXLmpwGzPGzK3PtloraBf7NW0RnGe5f2/2EeJfLskhMAfjPySpz6w2qKSd+RgZeMpg
	 pXb7ZPZaqqPmNBIZA9mBnn07IZevj0onNCXTvAuuh+2zHhmR9LjAv2RE9BdcZ0CBqb
	 5SRl4xR/9x68A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8OxWTfdIiz
  ZYOJHfYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePqzB9sBZ2cFX37WxgbGNdxdDFycQgJPGCU
  2LPlBxOEc5lJ4kzXUUYIZw+jxOXpM1m6GDk52ASkJG7c/88GYosI6Essnb2HGcRmFlCRePG7h
  x3EFhbwkDixfAmYzSKgKnF+8SqwXl4BJ4lFs6+A2RICChJTHr5nhogLSpyc+YQFYo6ExMEXL5
  ghahQlZl9uhqqvkJg1q40JwlaTuHpuE/MERv5ZSNpnIWlfwMi0itGsOLWoLLVI19BYL6koMz2
  jJDcxM0cvsUo3US+1VLc8tbhE11AvsbxYL7W4WK+4Mjc5J0UvL7VkEyMwHFOKGbbuYOxY/kfv
  EKMkB5OSKC+DeFiyEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQneGi2gnGBRanpqRVpmDjA2YNISH
  DxKIryzjIDSvMUFibnFmekQqVOMilLivD/NgBICIImM0jy4Nlg8XmKUlRLmZWRgYBDiKUgtys
  0sQZV/xSjOwagkzJttDjSFJzOvBG76K6DFTECLL60IAllckoiQkmpg2rB18sLar70bd+xnn6s
  eUvRb+U74jAsFAXP+B4nc6n3xcUMcb7p/xY7Vh1M+Ne48y6ETnJPqEVofb8zKeXaD1Wb/vrVz
  WC+c6txpdyjnteT36n+vn+inbtouqse82s721Y+cPcyBMzxFL8y1Dps1ZX2roilvXreZouXNW
  /8OxD3+dOLLl73udhMbg0wUtQXsFhd+l9gtN/vDmjqX3MywG9oLtOfH8xqLBQYxXHzx/F+P4f
  ncyh5+leUaWgpz/me+ap8p/z3g7/bp9x88PJAlv2rfbP8Zv6dtcPSsXHMlg83vtGR9wc5PH46
  V1Nw+nF7BtF2/2lbqwMW1ckFx/xc//f2us3ru772RbjYfe/hP5iqxFGckGmoxFxUnAgBynbBL
  QgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-587.messagelabs.com!1666594919!199278!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24569 invoked from network); 24 Oct 2022 07:01:59 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-20.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Oct 2022 07:01:59 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 68A537B
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 08:01:59 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 5BB0773
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 08:01:59 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 24 Oct 2022 08:01:57 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pika: upgrade 1.3.0 -> 1.3.1
Date: Mon, 24 Oct 2022 15:01:41 +0800
Message-ID: <1666594901-29473-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 07:02:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99287

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pika_1.3.0.bb => python3-pika_1.3.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pika_1.3.0.bb => python3-pika_1.3.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-pika_1.3.0.bb b/meta-python/recipes-devtools/python/python3-pika_1.3.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-pika_1.3.0.bb
rename to meta-python/recipes-devtools/python/python3-pika_1.3.1.bb
index 7ffec26e55..075f3bb577 100644
--- a/meta-python/recipes-devtools/python/python3-pika_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pika_1.3.1.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://pika.readthedocs.io"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=678ec81495ba50edf81e84e4f1aa69f3"
 
-SRC_URI[sha256sum] = "15357ddc47a5c28f0b07d80e93d504cbbf7a1ad5e1cd129ecd27afe76472c529"
+SRC_URI[sha256sum] = "beb19ff6dd1547f99a29acc2c6987ebb2ba7c44bf44a3f8e305877c5ef7d2fdc"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.25.1


