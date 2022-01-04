Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 013F1C433FE
	for <webhook@archiver.kernel.org>; Tue,  4 Jan 2022 03:41:56 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web09.2138.1641267714586065867
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Jan 2022 19:41:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=vFJHI8qg;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1641267712; i=@fujitsu.com;
	bh=96jP4RjBqJ45N0UdU2JBHg4TzpqzQC4dnZEl/2Vvvnk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=vFJHI8qgpKp6Sfe1Vl6zI9DU+VUR3mErkQRTx708l15DDe1ZuOYt/RpU9iD8r4yFS
	 aFpjb34T2DTm7WpJf0/kWfxcV7xdPm+RMql46ZJNdQqRAYBbbBUBA/GmwAsN1aHvfE
	 eGVvvZWkfB1c4H1GKQsTJ8TbuQ37QTu/zep8yEbQL6hJZLgydKXCcsRUE3PcIaTEdL
	 eFlLFPcL/f7W+Rs5LdDClscPJ+Y3yv1l/FJDaREdlXjGcn6CZBtJRFCcxDxOHp4olH
	 4xp06Pf1qVQbzrpj4p65Xaq+hZmui2Y7FWphPdSYeynuA9IAZJycW4Q/+dO+paB2RK
	 DKC+5zZDTrNtA==
Received: from [100.115.6.48] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-1.aws.ess.symcld.net id AF/12-10124-002C3D16;
 Tue, 04 Jan 2022 03:41:52 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJIsWRWlGSWpSXmKPExsViZ8ORqPv/4OV
  Eg80zzSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1ozTF2ezFxznqnj1q5u9gfEaZxcjF4eQwBNG
  ifNHm1i6GDmBnAtMEk9nV0IkdjNKXP41mQ0kwSagK3Hu8Vp2EFtEQF9i6ew9zF2MHBzCAr4Se
  65bgoRZBFQk/k8/yQhi8wp4SLw/cwjMlhBQkJjy8D0zRFxQ4uTMJ2C7mAUkJA6+eAE2RkJAUW
  L2dHmI8gqJ14cvMUPYahJXz21insDINwtJ9ywk3QsYmVYxWiYVZaZnlOQmZuboGhoY6Boamuo
  a61qY6SVW6SbqpZbqlqcWl+ga6iWWF+ulFhfrFVfmJuek6OWllmxiBIZdSjFz2A7GP70/9Q4x
  SnIwKYnyVlhdThTiS8pPqcxILM6ILyrNSS0+xCjDwaEkwbtwL1BOsCg1PbUiLTMHGAMwaQkOH
  iURXp4DQGne4oLE3OLMdIjUKcZwjjdrlyxi5ngLJtvu3QWS7WBy5oKDq5k5ZoHJ++2HgOQDEC
  nEkpeflyolzsu2B2icAMi4jNI8uGWwGL/EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZj3DMh
  RPJl5JXA3vQI6lwno3HNyYOeWJCKkpBqYisVuWMR/vcfcter+mjuN2SaabVaLWEK2yX1cKJ0X
  W16f5cxuf6pd0WNV0MQHc0RutC/ZcoN5lce57JvGAf0G4Zm8s5sqp2wM7rlYkb7wnttRNpFX8
  f3/Jl68zs1j8fpfUY2IIHPZ3s5nzo7//57PK9mksyPn1aKpwT8dt5S7GDLpWO+LeB/I/+apy/
  GzLlwWofteXTcR3SHD83q727aWg9+kLLPu2D9RYZ/pVZ4lNOFE7ud294X2i6peLH8d5sX3giv
  65N31JxOtMl5I321mKz287Mxmt6RVvYbG5nfNmUzUn23ysgxedsJh6qsIyXizqEO2Kku25S9Z
  9y7rygTllNs873buXL3oR6TQkxB/JZbijERDLeai4kQAO+wuH2wDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-6.tower-585.messagelabs.com!1641267711!82449!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28038 invoked from network); 4 Jan 2022 03:41:51 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-6.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 4 Jan 2022 03:41:51 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 73D431001A3
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  4 Jan 2022 03:41:51 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 66FF0100198
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  4 Jan 2022 03:41:51 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Tue, 4 Jan 2022 03:41:43 +0000
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-pyatspi: upgrade 2.38.1 -> 2.38.2
Date: Tue, 4 Jan 2022 20:41:36 +0800
Message-ID: <1641300096-14395-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Jan 2022 03:41:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94651

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-pyatspi_2.38.1.bb => python3-pyatspi_2.38.2.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyatspi_2.38.1.bb => python3-pyatspi_2.38.2.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-pyatspi_2.38.1.bb b/meta-python/recipes-devtools/python/python3-pyatspi_2.38.2.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-pyatspi_2.38.1.bb
rename to meta-python/recipes-devtools/python/python3-pyatspi_2.38.2.bb
index 8ae9ac996..d67975b52 100644
--- a/meta-python/recipes-devtools/python/python3-pyatspi_2.38.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyatspi_2.38.2.bb
@@ -8,12 +8,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=db29218e6ba3794c56df7d4987dc7e4d \
 DEPENDS = "python3-dbus-native glib-2.0 dbus-glib libxml2 atk gtk+ python3-pygobject"
 
 SRC_URI = "git://github.com/GNOME/pyatspi2.git;protocol=https;branch=master"
-SRCREV = "6d5f47ee8e8a36140b52bf52fe954a131a0aa5dd"
+SRCREV = "141a53029b3e16bfa5f100ae54a77234a9bf3426"
 
 S = "${WORKDIR}/git" 
 
 # Same restriction as gtk+
-inherit features_check
+inherit features_check setuptools3
 ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
 
 inherit pkgconfig autotools python3native
-- 
2.25.1


