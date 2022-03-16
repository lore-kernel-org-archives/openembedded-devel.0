Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31968C433FE
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 08:34:25 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web09.22717.1647419664085313754
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Mar 2022 01:34:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=o+uc+7VJ;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647419662; i=@fujitsu.com;
	bh=s9yOYdkxi9rtwl8aQh4k0L8CK3WYmiq/3OmmBwN+toM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=o+uc+7VJR+goa0b4u/fw05Vj5OfRB0kF1JBB2xUvySZpb3NobAwQxlyBcFiugz8NW
	 KHL0by44wYpQWea0HnhasE3N1q+o//3dunLFD4O77cGmzqCi15dQb3sx+kD+s9Aw8N
	 645YfoehNx0an7UTN+HnkELsVBDReZQn4aMTOg8H119lwWhUThAUMUO4y8JLQ/cdw6
	 9d09K2nYcPGx8yjfKaOTft0Azvm6vuZiWMbpJY2GSyVKs4s2zK21zKmhaXp6AJx0wt
	 GntD1YzWblb7LgRZL75HbmR/hhnSQMj/blOr8SBP6Xh+ZQFx0oQuLAPgBrzcPhpZ9Q
	 2pPZu6ku77ezw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDIsWRWlGSWpSXmKPExsViZ8ORqMu30DD
  JYPkCRouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWNr43SWgsfsFad7OlgaGPvZuxi5OIQEnjBK
  bHq1Asq5wCTxcdtxpi5GTiDnBKPEz4/pIDabgJrE9Fs3WEFsEQF9iaWz9zCD2MwCKhIvfvewg
  9jCAjYSyyY0A/VycLAIqErs3ycMEuYVcJKY0jgRrFxCQEFiysP3YDangLPEljvtjBCrnCS6O3
  eyQdQLSpyc+YQFYryExMEXL6B6FSVmX25mgbArJGbNamOCsNUkrp7bxDyBUXAWkvZZSNoXMDK
  tYrROKspMzyjJTczM0TU0MNA1NDTVNbbUNTI01kus0k3USy3VLU8tLtE10kssL9ZLLS7WK67M
  Tc5J0ctLLdnECAzilGL1qzsYN6/6qXeIUZKDSUmU9/xMwyQhvqT8lMqMxOKM+KLSnNTiQ4wyH
  BxKEry75wDlBItS01Mr0jJzgBEFk5bg4FES4XWdB5TmLS5IzC3OTIdInWI05rh65cpeZo4bIF
  KIJS8/L1VKnJcBZJIASGlGaR7cIFikX2KUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzGszA2g
  KT2ZeCdy+V0CnMAGdMk9aD+SUkkSElFQDE4P3Bv+NsZunsF15FJa7I0dgiRKr86/+WwluH0t/
  5EyX9xHPv9OzTtHw4C6ZSlcjjQsmL5LCd+z/Lfn6XxXL0/nxV3vOhvi4cqawGp+In7TzfbTe6
  mPl71+tFVd1vsT3Nze+bmrDw6AwF5d3nPtkVgnOjTwqt+Ro25ffr8OswjKfLUnfuVe71PFJ3L
  xdIYoXTe9drfT4/4D1leCkGXuPKG148C882r045HvtWY6t6wP4ex+9rzlzZqXahHv3H7z/xrQ
  nz3Dvq0nfo8xana5MWbrjT1ygXtGeWZ66wSYyrSXfBMMNP0zMfW64veDeqgC1h5wz/r74L3i3
  YGbxPq+ZTBdCEhQcXh59XSIicULxg4QSS3FGoqEWc1FxIgAvrw7fbwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-571.messagelabs.com!1647419661!514!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31334 invoked from network); 16 Mar 2022 08:34:22 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-7.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 16 Mar 2022 08:34:22 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 976781001A9
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Mar 2022 08:34:21 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 79C25100197
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Mar 2022 08:34:21 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 16 Mar 2022 08:34:19 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libvdpau: upgrade 1.4 -> 1.5
Date: Wed, 16 Mar 2022 16:34:00 +0800
Message-ID: <1647419641-81593-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1647419641-81593-1-git-send-email-wangmy@fujitsu.com>
References: <1647419641-81593-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Mar 2022 08:34:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96012

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-graphics/vdpau/{libvdpau_1.4.bb => libvdpau_1.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/vdpau/{libvdpau_1.4.bb => libvdpau_1.5.bb} (91%)

diff --git a/meta-oe/recipes-graphics/vdpau/libvdpau_1.4.bb b/meta-oe/recipes-graphics/vdpau/libvdpau_1.5.bb
similarity index 91%
rename from meta-oe/recipes-graphics/vdpau/libvdpau_1.4.bb
rename to meta-oe/recipes-graphics/vdpau/libvdpau_1.5.bb
index 2c08ff3ec6..1dc3b9acde 100644
--- a/meta-oe/recipes-graphics/vdpau/libvdpau_1.4.bb
+++ b/meta-oe/recipes-graphics/vdpau/libvdpau_1.5.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=83af8811a28727a13f04132cc33b7f58"
 
 DEPENDS = "virtual/libx11 libxext xorgproto"
 
-SRCREV = "c3d1a9dbafdfe6144ff474d0d523dc01b068750f"
+SRCREV = "79f1506a3307d3275b0fdfb2e110c173f68e6f78"
 SRC_URI = "git://anongit.freedesktop.org/vdpau/libvdpau;branch=master"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


