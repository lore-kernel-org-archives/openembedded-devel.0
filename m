Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9B1FC48BCF
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:48 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web12.2762.1649136980454957765
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Apr 2022 22:36:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=AtGIa1vg;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649136978; i=@fujitsu.com;
	bh=IhW9W5/GrqjZqx15CEqMxXo4OIVkbETdNfjIiJ2piJI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=AtGIa1vgqusOeGwvMuAzjq9RS3YSZrg57CAjSEqeOY2tRXrk71NZ7lZu6oWj/GqBD
	 QvW64de3JbiCUVGCK5uYmmVRgmoXR316kaF2NDJe4B12twMfietienCshjhL+iIJJy
	 mhDrzXuoXe5umNiM/J4o3UTBdgZfuYRoMfMkBm/6rMlmgMyrmjOIXKPgZNrwkHhgRO
	 shHBoSQx9ed+UBCVAFbUVp7B0SpbAFaaQ2o5OIaKt3DURSHqwkw2ZTv+v14RqMeXF6
	 h8YeOSTRx921jPK3HOEn9pZCDuJYf4ewbjF1XotLA9RDxRys5G+SlpXuTFjtS1K5cz
	 JFjtLfMa5hpww==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJIsWRWlGSWpSXmKPExsViZ8MxRTfwqne
  Swb9d5hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bx3uNsBbs5Klbd/M3YwHiXvYuRi0NIYBaT
  xMsJ05khnN2MEofO9QI5nBxsAmoS02/dYAWxRQT0JZbO3gMWZxZQkXjxu4cdxBYWcJG4duwRU
  A0HBwtQ/PU6M5Awr4CTxI/2WWDlEgIKElMevmeGiAtKnJz5hAVijITEwRcvoGoUJWZfbmaBsC
  skZs1qY5rAyDsLScssJC0LGJlWMVolFWWmZ5TkJmbm6BoaGOgaGprqAklTE73EKt1EvdRS3fL
  U4hJdQ73E8mK91OJiveLK3OScFL281JJNjMAQSylmmLWDcVbfT71DjJIcTEqivGdcvZOE+JLy
  UyozEosz4otKc1KLDzHKcHAoSfCePAuUEyxKTU+tSMvMAYY7TFqCg0dJhPfIRaA0b3FBYm5xZ
  jpE6hSjopQ474PLQAkBkERGaR5cGyzGLjHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5j0HMo
  UnM68EbvoroMVMQIvfnfEEWVySiJCSamBqfrRq6YmyU1e/5S3i3Hjx0gnHANGPwS9ubfo2eVX
  7YwkuN5Mlr5lW+Zs89/v5h6fbZ4/qpVufbqgclkjaISsQKzr9LNsPN6+EyYWqVd9jXmmIX+7c
  q+TMIeja9Cw77Zffri+yT3xWMu2y09D6IFjs1XoluzCla96Jnfc2fNRVsNGXerz9wQKdz1kPz
  z+09lrZ4/wkPzv0cCbLlrx96ktmmdYf3XEw6uLGN9NFRZJPB4tv6pwh2Sx+jk1Cff1LpxTB8G
  nXSudMNnufMtWy5p6ho3r7GzOBvjQNg8IZNWuWaKr9kJ158Qjzs6drumcrFHn/kp5zeNKd3EP
  HX8+p5iuczT7v4sQlfsu1rOK59mVeVGIpzkg01GIuKk4EANAJcrgsAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-591.messagelabs.com!1649136977!364759!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21907 invoked from network); 5 Apr 2022 05:36:17 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-2.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 5 Apr 2022 05:36:17 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 2355aChB011600
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 5 Apr 2022 06:36:17 +0100
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 5 Apr 2022 06:36:10 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ceres-solver: upgrade 2.0.0 -> 2.1.0
Date: Sat, 2 Apr 2022 20:32:43 +0800
Message-ID: <1648902767-19756-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Apr 2022 17:24:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96397

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{ceres-solver_2.0.0.bb => ceres-solver_2.1.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/ceres-solver/{ceres-solver_2.0.0.bb => ceres-solver_2.1.0.bb} (97%)

diff --git a/meta-oe/recipes-support/ceres-solver/ceres-solver_2.0.0.bb b/meta-oe/recipes-support/ceres-solver/ceres-solver_2.1.0.bb
similarity index 97%
rename from meta-oe/recipes-support/ceres-solver/ceres-solver_2.0.0.bb
rename to meta-oe/recipes-support/ceres-solver/ceres-solver_2.1.0.bb
index bfd2d035fa..2b74ad845b 100644
--- a/meta-oe/recipes-support/ceres-solver/ceres-solver_2.0.0.bb
+++ b/meta-oe/recipes-support/ceres-solver/ceres-solver_2.1.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bb761279816b72be19d7ce646e4e2a14"
 DEPENDS = "libeigen glog"
 
 SRC_URI = "git://github.com/ceres-solver/ceres-solver.git;branch=master;protocol=https"
-SRCREV = "399cda773035d99eaf1f4a129a666b3c4df9d1b1"
+SRCREV = "f68321e7de8929fbcdb95dd42877531e64f72f66"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


