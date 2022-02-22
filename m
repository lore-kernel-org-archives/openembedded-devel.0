Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 581BFC4332F
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 23:45:24 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web11.1037.1645573522831544156
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 15:45:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=jFhxDzzY;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1645573521; i=@fujitsu.com;
	bh=O8OcSX222bCN28NiaRaVvw8rzamMGzfJClODNhgijYw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=jFhxDzzYNXMo/oh6Gs2Hc688nG+suZHtibKlb1eGwUUQAFoOl06cJr127ToMGnClh
	 jUtaiq9cTGYPDPMHD0ip/Uzstvis3fmWvoZs/0OrJ0KWxA1Xi2c2cSsmUecw+QE5F4
	 km5z0IVW6RWlxVKJnbE8aC9ElfU5uFi2qA9YpSnnjWQtTvjLv8YnjBB1ecLS261Q6Z
	 Aa7yGc0HgdW6ulmz29cBU6LghIhRsk7WVgCEFb+s2tUB/QtgndX/pI58WBmG2rn9uD
	 pgtH7KsO0SV/zspvY0Lu/qAhbsUifyLbVfWjF31SPyGXm4nuZ9DxqgWP/0eYOCIz+9
	 P2bF2FaesRQoQ==
Received: from [100.115.35.240] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-2.aws.ess.symcld.net id FD/6A-02429-09575126;
 Tue, 22 Feb 2022 23:45:20 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRWlGSWpSXmKPExsViZ8MxSXdCqWi
  SwaNT7BYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8axpysZC9bzV1yffY69gfEgbxcjF4eQwBNG
  iY8bF7JAOBeYJPrmXmCGcE4wSvz/O4+1i5GTg01ATWL6rRtgtoiAvsTS2XuYQWxmARWJF7972
  EFsYQFbiRMre8FsFgFViRm/XoLZvAJOEkf2d4L1SggoSEx5+B6sl1PAWeLKn2lgthBQzczGOy
  wQ9YISJ2c+YYGYLyFx8MULZoheRYnZl5tZIOwKiVmz2pggbDWJq+c2MU9gFJyFpH0WkvYFjEy
  rGK2TijLTM0pyEzNzdA0NDHQNDU11jY11Dc0t9RKrdBP1Ukt1y1OLS3SN9BLLi/VSi4v1iitz
  k3NS9PJSSzYxAgM5pVhx8w7GiSt/6h1ilORgUhLlnesvmiTEl5SfUpmRWJwRX1Sak1p8iFGGg
  0NJglelECgnWJSanlqRlpkDjCqYtAQHj5IIr0oxUJq3uCAxtzgzHSJ1ilGXY9OaG3uZhVjy8v
  NSpcR5DUuAigRAijJK8+BGwCL8EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3vkgU3gy80r
  gNr0COoIJ6IgpWUIgR5QkIqSkGpiszc1T9rieSU9a95NVKlHa8fw9xtkFE99ulz3zqbkowzmJ
  7UmtjVXdxFtmGfH3ru/43rawItPXZt3+QgYVp4dSkStu6N+3Y2GWdNZZIbspadXkozuu3S8RC
  ihln7Vxxb/8cL2jS2NMJ86a5a/xQ7hrsvJxs/4P7vFOW879f3myc4pA9tELZiXFj7383qU0LE
  iTlX9jxxF3ZO/2lJXeGxlVtM+EyjHwFNas1/j+6Gvvn3TTZfta6j67zDn5021S0eNrvi79Jew
  r33DXvj2jtELP4dlCx/V/y9d0XuVZ5avG6pTwt5e98m7+ydXTJ2hfWSOzpXZ+JrNnbED0EbFX
  mw7sPFXyvOfvyw2ZMTNbrHyUWIozEg21mIuKEwEWvNPoawMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-565.messagelabs.com!1645573519!11760!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25786 invoked from network); 22 Feb 2022 23:45:20 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-16.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Feb 2022 23:45:20 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id B9F99100457
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 23:45:19 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 9D96E10044F
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 23:45:19 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 22 Feb 2022 23:45:05 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] mpv: upgrade 0.34.0 -> 0.34.1
Date: Wed, 23 Feb 2022 07:44:48 +0800
Message-ID: <1645573488-27207-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1645573488-27207-1-git-send-email-wangmy@fujitsu.com>
References: <1645573488-27207-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Feb 2022 23:45:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95455

This is a bug fix release for the 0.34 branch.

Fixes and Minor Enhancements
----------------------------

- player: fix autofit/geometry related segfault
- ao_oss: add missing PATH_DEV_MIXER define
- egl_helpers: fix context creation if GLES 3 is not available
- audio: stop corrupting audio on underreads
- wayland: fix a potential segfault on surface enter
- vo_gpu: opengl: fix wrong glMemoryBarrier call
- vo_gpu: opengl: create context at version 4.4 again
- af_lavcac3enc: fix memory leak on no-op
- subprocess: unblock/reset signals before running child process
- wayland: avoid doing unneccesary window resizes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../mplayer/{mpv_0.34.0.bb => mpv_0.34.1.bb}             | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-multimedia/mplayer/{mpv_0.34.0.bb => mpv_0.34.1.bb} (94%)

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.34.0.bb b/meta-oe/recipes-multimedia/mplayer/mpv_0.34.1.bb
similarity index 94%
rename from meta-oe/recipes-multimedia/mplayer/mpv_0.34.0.bb
rename to meta-oe/recipes-multimedia/mplayer/mpv_0.34.1.bb
index ebcaa6c932..17d4b6ba07 100644
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.34.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.34.1.bb
@@ -18,11 +18,10 @@ DEPENDS += " \
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRCREV_mpv = "9ca9066d052acecb5b05369141a76993a753ee1e"
-SRC_URI = " \
-    git://github.com/mpv-player/mpv;name=mpv;branch=master;protocol=https \
-    https://waf.io/waf-2.0.20;name=waf;subdir=git \
-"
+SRCREV_mpv = "349e437466163cb52f7d0aa227d4606edd9db501"
+SRC_URI = "git://github.com/mpv-player/mpv;name=mpv;branch=release/0.34;protocol=https \
+           https://waf.io/waf-2.0.20;name=waf;subdir=git \
+           "
 SRC_URI[waf.sha256sum] = "bf971e98edc2414968a262c6aa6b88541a26c3cd248689c89f4c57370955ee7f"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


