Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39FA8C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 01:18:57 +0000 (UTC)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.67])
 by mx.groups.io with SMTP id smtpd.web11.3690.1634606335962898604
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Oct 2021 18:18:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=CS/r0f8c;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.67,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1634606334; i=@fujitsu.com;
	bh=bX3qaWG5W337DURrqQj4kSXs00qwOEKcwJMY36ioK+E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=CS/r0f8cHy9YOJMNLm+j0XxPGLCOAZ4o+F8wGiANIxAAG7UG9VXdYuURov9qHLfro
	 B24rGBIaJJc6i2YKPsdI5jiRpnzinrW5lbLrUdBOIxOoS2TKxfljEItvpagbgbel8I
	 U4Uf+oo/vAl6D8+KqE2nxr9jvKKOmjwBCLbOXS0PHvvOZHZicKFBjMp6yhGieIdVbB
	 TXCWB5pOXWt4Rn7RybsFT+5KgsmRk9iOyRG6NIUiJUCrce9O9FlNsaVBi9FHY7iSmO
	 Uc3oYfY5IUQ56mSr7SjanIJr/RdICX5HgVuFugeWs2eQx5eW0hFcAvNC7XV6YT3Gdg
	 lQzDTlzXHHO0g==
Received: from [100.112.196.227] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-west-1.aws.symcld.net id F2/89-20159-DFC1E616;
 Tue, 19 Oct 2021 01:18:53 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKIsWRWlGSWpSXmKPExsViZ8MxSfePTF6
  iQVufhcXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmjH94ia2gi98FZtnXWFpYGzj7WLk4hASeMIo
  sf7XMeYuRk4g5wKTxMF5XhCJE4wSZ69MZQRJsAmoSUy/dYMVxBYR0JdYOnsPWAOzgIrEi9897
  F2MHBzCAu4SVyZXgYRZBFQl1h76yQ5i8wo4S5x4OZ8JxJYQUJCY8vA9M0RcUOLkzCcsEGMkJA
  6+eMEMUaMoMftyMwuEXSExa1YbVK+axNVzm5gnMPLPQtI+C0n7AkamVYwWSUWZ6RkluYmZObq
  GBga6hoZGuoaWFrpGhqZ6iVW6SXqppbrlqcUluoZ6ieXFesWVuck5KXp5qSWbGIHhmFJw7PoO
  xquvP+gdYpTkYFIS5XW4mJsoxJeUn1KZkVicEV9UmpNafIhRhoNDSYL3oXReopBgUWp6akVaZ
  g4wNmDSEhw8SiK8f0DSvMUFibnFmekQqVOM4Rxv1i5ZxMzxFky23bsLJNvB5MwFB1czc8wCk/
  fbDwHJByBSiCUvPy9VSpz3PMg4AZBxGaV5cMtgsX+JUVZKmJeRgYFBiKcgtSg3swRV/hWjOAe
  jkjDvaZApPJl5JXA3vQI6lwno3KvOOSDnliQipKQamMSO7e9KO8FVuc7hqL0wM/vd2eafYiYr
  9DLl+hpPaNQqy1S5t+FOkR1D5/2T7PFWkcdEe67l77Qvj81zEnX4Om2TlfC51eduPzW2eXL8X
  KvNQnmxPt1uhelbnySbbNv9/Em4QXvfjJtFe57Nk3Hm3vB3458nJw9m3rFe5FgWmhJkwnvyhU
  WnzvWgFgevV0YnSqw0Lt4Q2XjXa/X0nIXnjTn/2pjuE1dJdgzWF+dbUXuRuyuldylLlXbnnNm
  HT9qsjMvSlb6yqsXU7VCLYtwslWY9KfEn0/rvRf3pEVz23/rl2n/VZno/Ij93HjxnN4lvQcek
  dxEzko9m65Zuz/tYOd1Mv3CW7IYDfC758rzTlFiKMxINtZiLihMBorKddHgDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-291.messagelabs.com!1634606332!356604!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30559 invoked from network); 19 Oct 2021 01:18:52 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-23.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 Oct 2021 01:18:52 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 82683100452
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Oct 2021 02:18:52 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 75FAA100451
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Oct 2021 02:18:52 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Tue, 19 Oct 2021 02:18:30 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] ifenslave: upgrade 2.12 -> 2.13
Date: Tue, 19 Oct 2021 09:18:20 +0800
Message-ID: <1634606300-130468-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Oct 2021 01:18:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93442

ifenslave (2.13) unstable; urgency=medium

  * QA upload.

  [ Guillem Jover ]
  * Fix MAC address setting messed up by udev for bond interfaces.
    (Closes: #949062)
  * Use ifquery instead of example contrib script ifstate. (Closes: #991930)
  * Fix ifquery redirections.
  * Bump Standards-Version to 4.6.0 (no changed needed).
  * Remove long supported Linux version requirements from Description.

  [ Sami Haahtinen ]
  * Use correct argument in setup_slave_device(). (Closes: #968368)

  [ Oleander Reis ]
  * Handle slave definitions of interfaces with no bond settings.
    (Closes: #990428)
  * Delete bond interfaces on ifdown -a. (Closes: #992102)

 -- Guillem Jover <guillem@debian.org>  Sun, 17 Oct 2021 06:02:55 +0200

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ifenslave/{ifenslave_2.12.bb => ifenslave_2.13.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/ifenslave/{ifenslave_2.12.bb => ifenslave_2.13.bb} (91%)

diff --git a/meta-networking/recipes-support/ifenslave/ifenslave_2.12.bb b/meta-networking/recipes-support/ifenslave/ifenslave_2.13.bb
similarity index 91%
rename from meta-networking/recipes-support/ifenslave/ifenslave_2.12.bb
rename to meta-networking/recipes-support/ifenslave/ifenslave_2.13.bb
index 0254823304..a2eb81fd5b 100644
--- a/meta-networking/recipes-support/ifenslave/ifenslave_2.12.bb
+++ b/meta-networking/recipes-support/ifenslave/ifenslave_2.13.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://debian/copyright;md5=acc89812938cf9ad6b1debc37cea0253
 inherit manpages
 MAN_PKG = "${PN}"
 
-SRCREV = "88410a7003c31993e79471e151b24662fc2a0d64"
-SRC_URI = "git://salsa.debian.org/debian/ifenslave.git;protocol=https"
+SRCREV = "1bdfb472f2f8212056ed418d48387e8b36e61b34"
+SRC_URI = "git://salsa.debian.org/debian/ifenslave.git;protocol=https;branch=main"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


