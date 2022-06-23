Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDAE4C43334
	for <webhook@archiver.kernel.org>; Thu, 23 Jun 2022 07:09:56 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web08.4647.1655968195405245803
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jun 2022 00:09:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=GDCOQi2y;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655968193; i=@fujitsu.com;
	bh=MlNMw0BxMYdJWzd01fNY2f335+ydHdBPyNVZe1PEeEA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=GDCOQi2yqX2PQED8FKcG96YtIBpZcuOnGJ99uhDez1SyDcOCuBi51sihT3cXs4WF8
	 1Lxc0QMse6m2o7rX1V9T6YP+7890FrNl95XNgw05TxVfnskJkgCbpDpXKIQkRnu2/v
	 oeoj5Q6KaWP9Fvlcqa7kjkPVdafrz91ms7E5F1L+qrzmOsPGACg566lNzmYhZ6Fztc
	 psBPkvgL1Jvoci/EWTeaLYRbMmxAhZ8VlARlwYzxGMe3iayZB+Ho/tGCFz36d+cosU
	 SGXMZ5+6WBylo7O3sNDKW47v2+Ow/lDD5nGHGgIlA8pdpoDtwtB77ByLIvLv/0qIpZ
	 P4PAImUyEhPeA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCIsWRWlGSWpSXmKPExsViZ8MxSfeg4JY
  kg7+75SwuHl7K7MDocW7jCsYAxijWzLyk/IoE1ozuX7uYCi7zVDQeP8zUwLiDu4uRi0NI4Amj
  RPvBE4wQzl0miRcX2tghnJOMEu+6eoEcTg42AXWJxzdfM4LYIgL6Ektn72EGsZkFVCW6L64Bq
  xEW8JE4/+sKC4jNAhRfsOokWJxXwF1i26rJYPUSAgoSUx6+B7M5BTwkjmxawQpiCwHVXLjSyQ
  hRLyhxcuYTFoj5EhIHX7yA6lWSOLHiIxOEXSHx+vAlqLiaxNVzm5gnMArOQtI+C0n7AkamVYz
  WSUWZ6RkluYmZObqGBga6hoamusZGuoZGZnqJVbqJeqmluuWpxSW6RnqJ5cV6qcXFesWVuck5
  KXp5qSWbGIGBnFKsULeD8drKn3qHGCU5mJREeZ/xbkkS4kvKT6nMSCzOiC8qzUktPsQow8GhJ
  MF7iR8oJ1iUmp5akZaZA4wqmLQEB4+SCO8ckDRvcUFibnFmOkTqFKMlx9TZ//YzcywHkzO/th
  1gFmLJy89LlRLnbWADahAAacgozYMbB4v8S4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeX1
  B1vJk5pXAbX0FdBAT0EFPlm8AOagkESEl1cAUdO2V+NqvT35OWN3lxpVh985pQ9sZ47t17x73
  cs48+WnGXvsOm9YqKeuD4u88D9yXexdQonlA86Pke9090mGrzIQLee0FSs+1mTQwvj9QF7+aY
  6fizCv+nQpp81QM2vpz2nzPlLAZKNRsDj9sy/grKeGaQnOKHcefbxOzWra+b9lXzzfvk6mRN+
  OXGSqNnroLz8zv5Hz/X3HzVctlDK3C6k2nLzk/yH/ELia6xezaUpnUxy/tNrdtsDhjs63+6Zq
  EZ38Spt/2czPfZNQ97WB39+PbV8Nenjfh9whb9OnWLKm5HfuWH44XllmX9muCobCLr3n4GcGT
  yyfcrji07Nr62Z07vS1Wrqw4objs5EMzJZbijERDLeai4kQAfY8myHcDAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-15.tower-548.messagelabs.com!1655968193!33627!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15137 invoked from network); 23 Jun 2022 07:09:53 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-15.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Jun 2022 07:09:53 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 248411000CD
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jun 2022 08:09:53 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown10-183-43-178
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 175E31000CC
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jun 2022 08:09:53 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 23 Jun 2022 08:09:51 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pylint: upgrade 2.14.1 -> 2.14.3
Date: Thu, 23 Jun 2022 15:09:35 +0800
Message-ID: <1655968177-15916-3-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655968177-15916-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1655968177-15916-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Jun 2022 07:09:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97581

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Changelog:
==========
* Fixed two false positives for bad-super-call for calls that refer to a non-direct parent.
* Fixed a false positive for useless-super-delegation for subclasses that specify the number of
  of parameters against a parent that uses a variadic argument.
* Allow suppressing undefined-loop-variable and undefined-variable without raising useless-suppression.
* Fixed false positive for undefined-variable for __class__ in inner methods.

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-pylint_2.14.1.bb => python3-pylint_2.14.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pylint_2.14.1.bb => python3-pylint_2.14.3.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pylint_2.14.1.bb b/meta-python/recipes-devtools/python/python3-pylint_2.14.3.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pylint_2.14.1.bb
rename to meta-python/recipes-devtools/python/python3-pylint_2.14.3.bb
index d4d2d2c8a..835ed2203 100644
--- a/meta-python/recipes-devtools/python/python3-pylint_2.14.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pylint_2.14.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE= "http://www.pylint.org/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c107cf754550e65755c42985a5d4e9c9"
 
-SRC_URI[sha256sum] = "549261e0762c3466cc001024c4419c08252cb8c8d40f5c2c6966fea690e7fe2a"
+SRC_URI[sha256sum] = "4e1378f815c63e7e44590d0d339ed6435f5281d0a0cc357d29a86ea0365ef868"
 
 inherit pypi setuptools3
 
-- 
2.25.1


