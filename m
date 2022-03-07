Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48AC9C4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 12:45:06 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web12.25704.1646657104292937078
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Mar 2022 04:45:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=L8X/a++G;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646657102; i=@fujitsu.com;
	bh=uj4ZMez1/K7r9h1oIqDSRk6tjz0EjoaA0mUEcNTD2k4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=L8X/a++GymfClKlt4lmSR0mXx6vsNSJ6SS3O7OGNsd1K+MDVoxVyPVOHBKGzS+Wbl
	 Csq0aAC+X7XoXoA7vYAPiuQprkHttAJ+iRBYwCuiT/Ows5Klg+SnnzJQiDtJzq7ohM
	 C9h/a9IcBlzMm3XGaUlavM13uhX+b0p6px0De6Kk60oMuGP6fqT+2cKSHQTStpoL7m
	 7n7duXjx+fTs4bj68c9X8zxSSfsKezLkh0cOiUGcq122fj4DsVUNMR1LnAeXMy5oNs
	 B4mjLvWg9Jsfl0jz+LAbJ5MagTqdHjCT6mQvLt3u4LeeA2b0/78byocPi+n/4OmO7D
	 sM8NLJ/5ksiBw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRWlGSWpSXmKPExsViZ8ORqOv3TzX
  JYMIkFouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePfrK0sBfu4KtrOHmRrYFzP2cXIySEk8IRR
  YudE9S5GLiD7ApPEgcc72SCc44wSLZuOsYJUsQmoSUy/dQPMFhHQl1g6ew8ziM0soCLx4ncPO
  4gtLOAosf/nQRYQmwUo/mnJKyYQm1fASWLbqiZGEFtCQEFiysP3zBBxQYmTM5+wQMyRkDj44g
  UzRI2ixOzLzSwQdoXErFltTBC2msTVc5uYJzDyz0LSPgtJ+wJGplWMdklFmekZJbmJmTm6hgY
  GuoaGprrmhrqGxsZ6iVW6iXqppbrJqXklRYlAab3E8mK91OJiveLK3OScFL281JJNjMDgTCl2
  b93BeLnvp94hRkkOJiVR3pQFqklCfEn5KZUZicUZ8UWlOanFhxhlODiUJHi//gHKCRalpqdWp
  GXmACMFJi3BwaMkwhvyBSjNW1yQmFucmQ6ROsVozHH1ypW9zBw3QKQQS15+XqqUOO8PkEkCIK
  UZpXlwg2ARfIlRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMK/7X6ApPJl5JXD7XgGdwgR0SpW
  tEsgpJYkIKakGJrXlW4+kNJ44YWTMlHNHLyNo6sQt8zvWlgW9V81bVzjB9m76ZB7h4O5Zvxn1
  pU9zvG3X/Lt+EuMfIw73T5uPCQR1zND99X5t8GqL0s+Wni0m9/9P9Vw9PT0u5+1O6Xct749xn
  y8U/qLaWJW6vKmFIVFIfPfbR6vz+7+cSOvl/XJs63yz/G7Xb8G/LvR9zE6RMzy3TuTjt9k/pN
  d0Gm63ML/x9UTJkQnMN293m7LptqwOZ5urPmGm+6sjpU08TMc3X7t+7dmRo/Xr97yYJy/2I/T
  9rurGeU5peQvkNsxqfd4W1eDKv2/i9pLwiWe53/oL1xafzJXa7fm26vWyqkP6tdPmxsd7vIuK
  eZKQ7d8Y66XEUpyRaKjFXFScCAD9KIBLWwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-528.messagelabs.com!1646657101!28799!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30986 invoked from network); 7 Mar 2022 12:45:02 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-13.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Mar 2022 12:45:02 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 79E60100189
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  7 Mar 2022 12:45:01 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 6CC43100180
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  7 Mar 2022 12:45:01 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 7 Mar 2022 12:44:39 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libcereal: upgrade 1.3.1 -> 1.3.2
Date: Mon, 7 Mar 2022 20:44:26 +0800
Message-ID: <1646657069-56146-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Mar 2022 12:45:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95855

This is a minor bug fix and build enhancement release for cereal.
The primary reason for this release is to correctly increment the version for
cereal in include/cereal/version.hpp.

Bug fixes and enhancements
--------------------------
Make doxygen docs reproducible
Add CMake options for building doc and sandbox
Correct patch version for 1.3.2

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libcereal/{libcereal_1.3.1.bb => libcereal_1.3.2.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libcereal/{libcereal_1.3.1.bb => libcereal_1.3.2.bb} (94%)

diff --git a/meta-oe/recipes-support/libcereal/libcereal_1.3.1.bb b/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
similarity index 94%
rename from meta-oe/recipes-support/libcereal/libcereal_1.3.1.bb
rename to meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
index c905b74d6..08291d2db 100644
--- a/meta-oe/recipes-support/libcereal/libcereal_1.3.1.bb
+++ b/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "\
 PROVIDES += "${PN}-dev"
 
 PV .= "+git${SRCPV}"
-SRCREV = "1de8fe89471d69ea392ea260ce74e079d5f4b415"
+SRCREV = "ebef1e929807629befafbb2918ea1a08c7194554"
 SRC_URI = "git://github.com/USCiLab/cereal.git;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


