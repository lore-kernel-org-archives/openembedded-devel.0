Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEB14C38A2D
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:06 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.19070.1650531615626658179
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Apr 2022 02:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=lBwgW8wS;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1650531613; i=@fujitsu.com;
	bh=TBC1tVufJTWRDpPwHRiOXOwk80vuBXA+UwWzHXA+UlI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=lBwgW8wSXIVIxoWMfqHUY/YtYs3UkNS+GjlACKmfNtwJbC9ork4jvcNOBZ9dqE3dI
	 e6TvzmzxSfONWr+ThRF3Ze6g2Ik4ks74HmgWNRWAGK9OMwBvjJBsTmWVCAf2YcVgxQ
	 D5LoHJy2M1NSdvh5Yiu9YI0/tlZxqSDvcbMthLidF/J8QoJ+wchhJkUES2vRMP+ug7
	 qWjkfEf3SkInV6ZaD06EJ5x8BQJPsau0lCWoMceB4tuqfDQxmXGGLYiKyu4JKUaonr
	 tjO2ANLWI5ZMXEdrAMFAUQ0A/ZUR7a2fro69/nxohG0oyilmI00wT9STFFbbE9iRDm
	 0Vo7MQpByJ4Vw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8MxSVdWNjH
  JYFGnjMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnFjwXK2gi88FT9Xr2JvYHzI3cXIxSEk8IRR
  4sOmFSwQzgUmiavPf7NDOCcZJaZe+ACU4eRgE1CXeHzzNSOILSKgL7F09h5mEJtZQFWi++Iad
  hBbWCBQ4uTJL2A2C1B87px7YDavgLvEs3XfweZICChITHn4HqiXg4NTwENi3UsfkLAQUMnpP1
  1sEOWCEidnPmGBGC8hcfDFC2aIViWJEys+MkHYFRKvD1+CiqtJXD23iXkCo+AsJO2zkLQvYGR
  axWidVJSZnlGSm5iZo2toYKBraGiqa2yka2hhqZdYpZuol1qqW55aXKJrpJdYXqyXWlysV1yZ
  m5yTopeXWrKJERjGKcUKe3cwXl75U+8QoyQHk5Iob75EYpIQX1J+SmVGYnFGfFFpTmrxIUYZD
  g4lCd65UkA5waLU9NSKtMwcYEzBpCU4eJREeOulgdK8xQWJucWZ6RCpU4y6HJcOXdnLLMSSl5
  +XKiXOqy4OVCQAUpRRmgc3AhbflxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ8y6SAZrCk5l
  XArfpFdARTEBHVE+JBTmiJBEhJdXAlK/ObaVndvfPwX3PU3qW6UoKi6XJJp03Vq1yMVu29k/x
  ty9bIicIflzO8u5r4YTSpZNk2E/nxIrzf/VIytrfKpxq+P73P8H+Oamc5wo0lq+Rm57++VPxr
  gdM7zd6nnw8sdlUauq/rNrld4NthK9Znvgiony2WHWXusK7Dmev2x7hX7r3b8vRe8I2P2rRb9
  coz+8V/DMED1R/m1Q+Y/rM60vKD+4O+ykr0ff30uH8x1Jr02ZW3tPf8fi0QcykX5vfme62+B8
  V8OU8X0qfx6SQWfPid8tP/3DXvkon4Mx0q0W/CgKezXFctHve8WY77x5/W+s6g/w/M50NJvNe
  XvxebjMTd8SlSt6uKY8nK8UqNyuxFGckGmoxFxUnAgA8ceL5agMAAA==
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-2.tower-565.messagelabs.com!1650531613!5072!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29984 invoked from network); 21 Apr 2022 09:00:13 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-2.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 21 Apr 2022 09:00:13 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 00A1B1009B2
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Apr 2022 10:00:13 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id E8E011009A8
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Apr 2022 10:00:12 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 21 Apr 2022 09:59:55 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 5/5] python3-imageio: upgrade 2.16.1 ->
 2.17.0
Date: Thu, 21 Apr 2022 16:59:24 +0800
Message-ID: <1650531564-26234-5-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1650531564-26234-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1650531564-26234-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96723

From: Xu Huan <xuhuan.fnst@fujitsu.com>

License-Updated:
years update to 2022

changelog:
================================================================
Feature:
-New Plugin for pyAV
-Add plugin default sentinel

Other:
-Better Type Annotations + mypy support
-Add fast-paths for pyav formats
-Update readme
-Fix docs on standard images

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-imageio_2.16.1.bb => python3-imageio_2.17.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-imageio_2.16.1.bb => python3-imageio_2.17.0.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.16.1.bb b/meta-python/recipes-devtools/python/python3-imageio_2.17.0.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-imageio_2.16.1.bb
rename to meta-python/recipes-devtools/python/python3-imageio_2.17.0.bb
index d1d318d5ae..53f61e8827 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.16.1.bb
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.17.0.bb
@@ -3,9 +3,9 @@ write a wide range of image data, including animated images, video, \
 volumetric data, and scientific formats."
 SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=7b9bbbb543b6af3e6b53f9b7fb68f71d"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=24cb9a367a9e641b459a01c4d15256ba"
 
-SRC_URI[sha256sum] = "7f123cb23a77ac5abe8ed4e7ad6a60831a82de2c5d123463dcf1d4278c4779d2"
+SRC_URI[sha256sum] = "b21f009e52eb22b02b839f3bf2ae5374aaf0886317313c1358c6014e5383b539"
 
 inherit pypi setuptools3
 
-- 
2.25.1


