Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFBA6C6FA82
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 10:14:08 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web08.2933.1663064047283681030
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 03:14:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=mFd6ar6W;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663064045; i=@fujitsu.com;
	bh=cuC2xmA+WJipTgMD/gOKv+Py49OJ1yNvBwKW/z2xXwo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=mFd6ar6WzYd1a6C2Sfxc9FNYLfBwMZ0CnCzDBn89gtJWjuqg1NwbZ37t0Gzb4lgC+
	 PLE6AFIbEAIg6KVcGwt/U9D7oLavyEoDzeT5hK0YLjVySSykFX8tKd0QBcYiAMBJ7o
	 FfUnynWBrn+CNiafQmF07NwqEkCmFw0Sh6HRIXm5CpgaiQ0Hhd5Epj0oLOmUGdJaNQ
	 WVm1/xqLxTKbjvlwW+OiMmkuVGaNh0kEw4Su5/VZOza15nEhusI/YiQpA0ch/D07mj
	 rZ4J8hpcPc9baim2/NELCU5ueXnJT44Lxz57jLPaPDtxOQBhcKZcK3PNXasU707rIW
	 7HuLPdX++bIuA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLIsWRWlGSWpSXmKPExsViZ8ORqPsmXCH
  ZoLtf1+Li4aXMDowe5zauYAxgjGLNzEvKr0hgzVhx+RZrwRWOij1TLzE3MDZwdDFycQgJPGGU
  OD/9HzOEc51JYuPE41DOHkaJ55f7GLsYOTnYBNQkpt+6wQpiiwjoSyydvYcZxGYWUJF48buHH
  cQWFvCQWLJ/ApDNwcEioCpxYJ8WSJhXwFFi08VtYCUSAgoSUx6+Z4aIC0qcnPmEBWKMhMTBFy
  +YIWoUJWZfbmaBsCskGqcfYoKw1SSuntvEPIGRfxaS9llI2hcwMq1itEwqykzPKMlNzMzRNTQ
  w0DU0NNU11rUw00us0k3USy3VLU8tLtE11EssL9ZLLS7WK67MTc5J0ctLLdnECAzJlGLmsB2M
  f3p/6h1ilORgUhLljfRSSBbiS8pPqcxILM6ILyrNSS0+xCjDwaEkwRsfApQTLEpNT61Iy8wBx
  gdMWoKDR0mElycYKM1bXJCYW5yZDpE6xajLMfNr2wFmIZa8/LxUKXHemd5ARQIgRRmleXAjYL
  F6iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iwr0QY0BSezLwSuE2vgI5gAjrCyFoe5IiSRIS
  UVAOTXu7msyz/rmfszrV4IqHcl8e9juOU3o5iMa2+ow8Dedcudnho0iGu/fbGxKRquY+p6VOi
  JXuO/K5S2VM+c6VHZOaZbU65K8O35zUuWSJ8uGTjufm7flzWUg3ZY3Ll+qTyq7lTdTs2f1gkI
  iY+Y7Kw4qvUKX9y3dTiOgPOnN34WTxHsfW8yLnCnXdeeO3ymlwS9Nnpxeq/9+xKPrzX1eHsP9
  T03Df3maKWhUem4NPNHLrhF2szfarkPt+7uP+NuNaM24F6HRX5W5d9+hAzRaxmRscy4b1bVn8
  wc8i/apw6/S6bcdr+67kP1hcc5FA6pr5Pg5UzVv/Q08qFL86+ZNn9lr3o9L2Ha9q+s35z+vtP
  WImlOCPRUIu5qDgRADg9xAJQAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-591.messagelabs.com!1663064044!150255!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29115 invoked from network); 13 Sep 2022 10:14:04 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-9.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Sep 2022 10:14:04 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 5BC8D100191
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:14:04 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 4F8A7100192
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:14:04 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 13 Sep 2022 11:14:02 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-filesystems] [PATCH] fuse3: upgrade 3.11.0 -> 3.12.0
Date: Tue, 13 Sep 2022 18:13:50 +0800
Message-ID: <1663064034-3136-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Sep 2022 10:14:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98757

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/fuse/{fuse3_3.11.0.bb => fuse3_3.12.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-support/fuse/{fuse3_3.11.0.bb => fuse3_3.12.0.bb} (96%)

diff --git a/meta-filesystems/recipes-support/fuse/fuse3_3.11.0.bb b/meta-filesystems/recipes-support/fuse/fuse3_3.12.0.bb
similarity index 96%
rename from meta-filesystems/recipes-support/fuse/fuse3_3.11.0.bb
rename to meta-filesystems/recipes-support/fuse/fuse3_3.12.0.bb
index 8055fb06d3..b886effc85 100644
--- a/meta-filesystems/recipes-support/fuse/fuse3_3.11.0.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse3_3.12.0.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://GPL2.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = "https://github.com/libfuse/libfuse/releases/download/fuse-${PV}/fuse-${PV}.tar.xz \
 "
-SRC_URI[sha256sum] = "8982c4c521daf3974dda8a5d55d575c988da13a571970f00aea149eb54fdf14c"
+SRC_URI[sha256sum] = "33b8a92d6f7a88e6a889f0009206933482f48f3eb85d88cf09ef551313ac7373"
 
 S = "${WORKDIR}/fuse-${PV}"
 
-- 
2.25.1


