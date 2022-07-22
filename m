Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B295DC04A68
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 10:16:59 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web09.18041.1658917012804783411
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jul 2022 03:16:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=sFfYjmh/;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658917011; i=@fujitsu.com;
	bh=bsR2WIu+TB24My0am+Zc+blQcufIAEXfIcfImzmzarc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=sFfYjmh/MJnrwoT3soL80WlpdfTaKxJntRU2wSdSBLZY3PgO7ae40wruERtospsYd
	 1bM8k40Ii2EVmx0HXooB6lKXuYrgPNHCr7Jmbyo1Yki0c3kDwF8y5wMhEHUJFQwXd4
	 RU90qUUKXLP1TQ1UkXMDOcUJioE1sXj4UVPxm+xc6kYFP2vgIOWvjSTGra+Zraqnr/
	 HxO+dBhToXV2x0XeU9Jf4R8FnkHl+eNVlVKVPpXoB/ZRhhJQM9krmWIqa7Alwdkm7O
	 W278epzRxP6AqKJfa3kbiHOHP7mVJ1oLVUkGPL63y3Ts8aDq30tbmBvquCluGOKYEQ
	 XC6HJUum0/V5w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJIsWRWlGSWpSXmKPExsViZ8ORpDtJ4GG
  SwfW7ihYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bP7gtsBVu5K84fvcPYwLiOq4uRi0NI4CGj
  xOYpv9khnCtMEn/vdzBBOAcYJf5vucDcxcjJwSagK/Hix2IWEFtEQF9i6ew9YHFhAR+JH2tOs
  IHYLAKqEn9eT2QFsXkFPCTW/PvPCGJLCChITHn4nhkiLihxcuYTsDnMAhISB1+8AIpzANUoSs
  yeLg9RXiHx+vAlZghbTeLquU3MExj5ZiHpnoWkewEj0ypG66SizPSMktzEzBxdQwMDXUNDU11
  jU11DE0u9xCrdRL3UUt3y1OISXSO9xPJivdTiYr3iytzknBS9vNSSTYzA8EspVp66g/H0qp96
  hxglOZiURHnd3z5IEuJLyk+pzEgszogvKs1JLT7EKMPBoSTBu5fjYZKQYFFqempFWmYOMBZg0
  hIcPEoivMm8QGne4oLE3OLMdIjUKUZjjrsL9+5l5pj5te0AsxBLXn5eqpQ4bwwfUKkASGlGaR
  7cIFiMXmKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzDubH2gKT2ZeCdy+V0CnMAGdskXhAcg
  pJYkIKakGJtGanV6fzHpfuZff9FM2F6kLsu7VmPDc7+GT4BvTTeI6WT++6nnGYWBTwHowrvHa
  X5bTJ26avJ8SvmFJ86R3Mf/37f2zR7J+TnD9+9fCGd59W9T157boX5rdE66/5ziXa/4tCdeFv
  hxfFrxZ+OTGhv02/lODPIOe+UZqrV2b86XcpSSteH8KUymDxMx35v9jHkXM0PZh+vB6yV1hTw
  ZNpfl6X6/WNn60lZDR7753oe2u3EvvOPXD7bVmr9a5cohtV/nG9HrqNqHQ3P99cybMyO0yVCv
  IOWb86P26O+cbfq8Itmf0vXlgdyvXM0UewS8JMwz22JtalS7zCn16ZM/qx2cTXz7295nF6PhD
  X7L1gRJLcUaioRZzUXEiAJpAEexMAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-14.tower-571.messagelabs.com!1658917010!234644!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22775 invoked from network); 27 Jul 2022 10:16:50 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-14.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Jul 2022 10:16:50 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 475871B1
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jul 2022 11:16:50 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 3C8421AF
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jul 2022 11:16:50 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 27 Jul 2022 11:16:49 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-bitarray: upgrade 2.5.1 -> 2.6.0
Date: Fri, 22 Jul 2022 12:03:16 +0800
Message-ID: <1658462596-26085-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Jul 2022 10:16:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98009

Changelog:
===========
  * add data descriptions: '.nbytes', '.padbits', '.readonly'
  * allow optional 'endian' argument to be 'None' when creating bitarrays
  * fix type annotation for 'canonical_decode()', #178
  * frozenbitarray's padbits are now guaranteed to be zero
  * add tests

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-bitarray_2.5.1.bb => python3-bitarray_2.6.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_2.5.1.bb => python3-bitarray_2.6.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_2.5.1.bb b/meta-python/recipes-devtools/python/python3-bitarray_2.6.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-bitarray_2.5.1.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_2.6.0.bb
index bda2d96bd8..507c0bc51a 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_2.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_2.6.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
 
-SRC_URI[sha256sum] = "8d38f60751008099a659d5acfb35ef4150183effd5b2bfa6c10199270ddf4c9c"
+SRC_URI[sha256sum] = "56d3f16dd807b1c56732a244ce071c135ee973d3edc9929418c1b24c5439a0fd"
 
 inherit setuptools3 pypi
 
-- 
2.25.1


