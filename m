Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EC1CC7EE26
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 10:10:28 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.103690.1683540620836460055
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 03:10:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=jJtPMiTc;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1683540619; i=@fujitsu.com;
	bh=KdOqp6ujsbyc1gCoFIGsXqRT9WlQJ7dcC+IhVUcw33g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=jJtPMiTcSvHLl0tk7viCDIH6VwoUPABiv89QGdW3UxdlmoVMQJvoiDwKHqRZXuyrw
	 AUByhMl6/NzROyDqdcODPPvn1T8HAZKAxeM4TNp44omOqpH5yvgq1EDYBAaow3WukL
	 1zdrIM+4qKYv7uZDeKDNFaW7GiZ/uIMM1uOMciQY8XQ7ViA5qCmIZM6nD5GxNSYfP+
	 ZWAflEpuujXKWPRi+kD5kovqy1Vdu3wx4vWV+rnK84Mw5O4NELy5Kxu+MLazbPc+uc
	 aAjqi5nMal/t5+PamsCwnycnqStJIBeR3CPZbeL3/Yf3dvaMr44V6kD13X9f/D6/kq
	 3c2ZjSn3tc8EQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrELMWRWlGSWpSXmKPExsViZ8ORpNt1KiL
  F4MQsZYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaPxwX/Gghm8Fd2XJrA1MN7l7mLk4hAS2Mgo
  8f3LBEYIZxqTxK6Zm4AcTg42AQmJ6XtPsoPYIgK6Eh8/zAWLMwuoSMyYfIQJxBYW8JVom7mQG
  cRmEVCVWH/zPAuIzSvgJPFpex9YjYSAgsSUh+/BajgFnCXu3LsLFhcCqnnz8T8bRI2axNVzm5
  gnMPIsYGRYxWhWnFpUllqka66XVJSZnlGSm5iZo5dYpZuol1qqm5dfVJKha6iXWF6sl1pcrFd
  cmZuck6KXl1qyiREYFCnFqZ47GNt2/dU7xCjJwaQkymt6MCxFiC8pP6UyI7E4I76oNCe1+BCj
  DAeHkgRv27aIFCHBotT01Iq0zBxggMKkJTh4lER4ZY8ApXmLCxJzizPTIVKnGBWlxHmZTwIlB
  EASGaV5cG2wqLjEKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZh38wmgKTyZeSVw018BLWYCWu
  x/ORxkcUkiQkqqgWlqgbxUX/XqTZ6tQpf4La3m2gfduv3yhP2d35xdmz7wiz7IFs7fanvggZP
  7gRDfJ8YfwpqPc3DufS+2v/nNIaXprte55ob+qGNy3VKlt9jDWVRIQ+1ezaPIq+FTmCPWC7s0
  Kr47dKphihYX35vPeyyX+jT5qO+QUPAWEjuk7Prc6dHkLfNW/rh479rZiAUhxyot+V7ytG1UL
  RacHvTks/WjfL9tiYebjh2w3FXCOk9648wIo8CHciz1Bdtfd7dbdDyevPzRdtdag2LZMPvSnK
  c3K/urdty5tqX53N63Zj7KtvXsBgWeyz1M853fJD95/enXid0RTJx2hq8LQuW1L3q9W89QHed
  5L2F186zr75VYijMSDbWYi4oTAYef5FMFAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-728.messagelabs.com!1683540618!494514!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25732 invoked from network); 8 May 2023 10:10:18 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-10.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 May 2023 10:10:18 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 035FE1D2;
	Mon,  8 May 2023 11:10:18 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 29F141D5;
	Mon,  8 May 2023 11:10:16 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-alembic: upgrade 1.10.3 -> 1.10.4
Date: Mon,  8 May 2023 18:10:00 +0800
Message-Id: <1683540600-25325-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1683540600-25325-1-git-send-email-wangmy@fujitsu.com>
References: <1683540600-25325-1-git-send-email-wangmy@fujitsu.com>
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 10:10:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102405

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
feature
----------
  Added support for autogenerate comparison of indexes on PostgreSQL which
  include SQL sort option, such as ASC or NULLS FIRST.

bug
---------
  Fixed issue where using a directive such as op.create_foreign_key() to
  create a self-referential constraint on a single table where the same
  column were present on both sides (e.g. within a composite foreign key)
  would produce an error under SQLAlchemy 2.0 and a warning under SQLAlchemy 1.4
  indicating that a duplicate column were being added to a table.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-alembic_1.10.3.bb => python3-alembic_1.10.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.10.3.bb => python3-alembic_1.10.4.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.10.3.bb b/meta-python/recipes-devtools/python/python3-alembic_1.10.4.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-alembic_1.10.3.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.10.4.bb
index 6bdc9cf96c..071f40bb03 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.10.3.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.10.4.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e3023b042cb6002cb398344b51c67093"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "32a69b13a613aeb7e8093f242da60eff9daed13c0df02fff279c1b06c32965d2"
+SRC_URI[sha256sum] = "295b54bbb92c4008ab6a7dcd1e227e668416d6f84b98b3c4446a2bc6214a556b"
 
 PYPI_PACKAGE = "alembic"
 
-- 
2.34.1


