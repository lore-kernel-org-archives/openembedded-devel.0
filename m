Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3055AC433FE
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 08:34:43 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web10.29271.1652085279554071425
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 May 2022 01:34:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=FYnloV8D;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652085277; i=@fujitsu.com;
	bh=Yn8hj/SkY7ruUMqygHz0F+S7GlLIYwc5HWWd8wxMin8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=FYnloV8DJ8LyLeEsqQRcyE+f5TCHRrzm+HaL/GWbW5196VPgm+sYQh7OMqiDTIaD4
	 +h0uurmV3PxBrKtYLihJNvlbbsQYJrAAzZHakI6EpilE36DlQQDjTxXstCHQJRXiKs
	 SnT0hCJnsYkYTBsUfcAfkVTXFpMGTz1wH0opktB/UrKK7yLPPG2p0TvJJ6YcPOdvSc
	 1ToJb825spsjhe1H2qw8Lb/XL7n28EXHC89cHRu9aHYp31V2r/kyr2mG3wvV8x7KGs
	 SlZDWhE0JjHLvRvBB3IZDEO2TScT5gTAsJ5kxERbPVu8s8KlPtu314qDL3AsdccLir
	 R4PW69Z0Bn6vg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8MxSVf2UkW
  Swb9bchYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0b7rCtMBR3sFZ1/T7A0MO5l62Lk4hASeMIo
  8fbySWYI5wKTxJQbX5ggnN2MEudubAcq4+RgE1CTmH7rBiuILSKgL7F09h5mEJtZQEXixe8ed
  hBbWMBVYumeHrA4i4CqxIn3u4HiHBy8Ak4S35otQcISAgoSUx6+ByvhFRCUODnzCQvEGAmJgy
  9eMEPUKErMvtzMAmFXSMya1cYEYatJXD23iXkCI/8sJO2zkLQvYGRaxWidVJSZnlGSm5iZo2t
  oYKBraGiqa2ypa2RgoJdYpZuol1qqW55aXKJrpJdYXqyXWlysV1yZm5yTopeXWrKJERiWKcXq
  J3YwPl35U+8QoyQHk5Iob2VTRZIQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCd6Qc0A5waLU9NSKt
  MwcYIzApCU4eJREeO+eAErzFhck5hZnpkOkTjEac9xduHcvM8fVK1f2Mgux5OXnpUqJ8566AF
  QqAFKaUZoHNwgWu5cYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfPWXASawpOZVwK37xXQKUx
  Ap3wMKAU5pSQRISXVwKRx6+DWE8kCd+8od2scX/7x0I2+DJnN9aICJaEyN2W/5UQ/Z54x4Y23
  +e/lzx+lBXrt23XgKp/lpdj6lcIpItN1bSZ/NVum6yzx5v1uv+9yU6QnXjnxRopXp/9/ZYeXR
  +zEFo8fduLBeZf4t08uE3gmOFX2gceyQ3nOqVOLF3TNyctx1pDiyG/VOBsVZ9cXlpEsGDFru+
  HOTP6XtgH5n5ddED5xLC1AxFOLZRbDo80Ndn8cNb94OlZW3v/22+aERXY49422XMPqG+F/7iz
  +oVVlrfZNW4rzp3H71ifxd3Xf2Pl0n3MVC8iKzpjjcLwvYcb0YycvRRRt85h3oEn6eaTwxb0N
  rzTv37zZMl1umxJLcUaioRZzUXEiAGohRChYAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-31.tower-548.messagelabs.com!1652085277!206194!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21941 invoked from network); 9 May 2022 08:34:37 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-31.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 May 2022 08:34:37 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 26E27100446
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  9 May 2022 09:34:37 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 1A6011000EE
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  9 May 2022 09:34:37 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 9 May 2022 09:34:15 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] tgt: upgrade 1.0.79 -> 1.0.82
Date: Fri, 29 Apr 2022 16:16:31 +0800
Message-ID: <1651220195-27553-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 09 May 2022 08:34:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97007

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-networking/recipes-extended/tgt/tgt_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-extended/tgt/tgt_git.bb b/meta-networking/recipes-extended/tgt/tgt_git.bb
index 42141cb72..ada0fd174 100644
--- a/meta-networking/recipes-extended/tgt/tgt_git.bb
+++ b/meta-networking/recipes-extended/tgt/tgt_git.bb
@@ -4,8 +4,8 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://scripts/tgtd.spec;beginline=7;endline=7;md5=21c19ea7dad04648b9c2f791b6e29b4c"
 DEPENDS = "sg3-utils libaio"
 
-SRCREV = "b43dbc6711e43c0a32cc4d9df22884841d911d51"
-PV = "1.0.79+git${SRCPV}"
+SRCREV = "fd4ca0546aa20fa9627c41ca2028db26e11f8d56"
+PV = "1.0.82"
 
 SRC_URI = "git://github.com/fujita/tgt.git;branch=master;protocol=https \
 	file://0001-Correct-the-path-of-header-files-check-in-Yocto-buil.patch \
-- 
2.25.1


