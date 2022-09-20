Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7B81C54EE9
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 02:21:44 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web12.7322.1663640503438369907
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 19:21:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=RBkB8wFv;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663640501; i=@fujitsu.com;
	bh=nlIdNVWzX8UHn0FPAMj6d3sul1PMzASlUInmf2hCQxU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=RBkB8wFviHITXnA8V3js5X32Y9xKknAw3PyAO/pwJtrZU3sMWKoa8Y5eCiKbrJJaj
	 1ISvcVy2AszeNKD4Vp9n1EzguaP9oKG30i49au4Zpq6hCONCj7EF4s/aQvYh5m7Wac
	 5sb6r0/XVd4h8pxim+WaKiMzlwDDIh6z5jDP17Y8jKdslq4Csz2Y9r6z4ePIkbsazC
	 JY1pkQ0/OxwvsIFNhhJtzfpqxe2u8bTknAT3qc41FkcO+fZ0OJY4fPmJFKZgglb4yN
	 GwJHC64OrodBJTWd/0Hjyb8hrKGMVPh5WfIsR+ohWm+EpQ5GtaKhcja9P68EEGx2a1
	 PB3cb/PIhdZDQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8OxWXeLsma
  ywY3X2hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bbgx62gkkcFSeOHWNuYNzE3sXIySEk8JBR
  4sjJmC5GLiD7CpPEu+MNjBDOHkaJOR/Ws4BUsQmoSUy/dYMVxBYR0JdYOnsPM4jNLKAi8eJ3D
  9gkYQEbiVmds8DiLAKqEgffLQayOTh4BZwk5v7LBglLCChITHn4HqyEV0BQ4uTMJywQYyQkDr
  54wQxRoygx+3IzC4RdIdE4/RAThK0mcfXcJuYJjPyzkLTPQtK+gJFpFaNtUlFmekZJbmJmjq6
  hgYGuoaEpkDbSNTQ11kus0k3USy3VzcsvKsnQNdRLLC/WSy0u1iuuzE3OSdHLSy3ZxAgMzJTi
  tJk7GLfs+6V3iFGSg0lJlJerTiNZiC8pP6UyI7E4I76oNCe1+BCjDAeHkgSvvaBmspBgUWp6a
  kVaZg4wSmDSEhw8SiK8W5WA0rzFBYm5xZnpEKlTjMYcaxsO7GXmmPm17QCzEEtefl6qlDjvBp
  BSAZDSjNI8uEGw6L3EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZg3XA5oCk9mXgncvldApzA
  BnXJDRR3klJJEhJRUA9Nyg7MbfH3XhXV6B5+3VVggKfFSpmnRmt/cgkVFP+duO5dqExDZM+2Q
  qn/RmyZLIfkpF2yYS5Z+PqkycfL+b6vL/k1MiU27K8dxctmUd8fqz8rUTnmqKLdZU/TFfr+qa
  3Lt6gL6UnMnWfnf3Wr2qEhq6QPXJHPmJ0rvvcXeW/d5F2RsMClvYGQymhVpOi1k6rbXLOl/r3
  248KYqJtbjj3ggS4iu/crWz9GTeeoF6m6+6l0gfFlyufbJ/eq8338Yb8zYurhsZVaa16dZp04
  /+91WycJ+yC6/p8zFubKqKV5J6ZnAtpzlph1Whb8X2PO/XhA45cuNCHbDJ3Wb/v6asrbQ6Zlc
  2w3XKkHmmf3dk5VYijMSDbWYi4oTAXVlm/JZAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-728.messagelabs.com!1663640500!34265!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26687 invoked from network); 20 Sep 2022 02:21:40 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-18.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Sep 2022 02:21:40 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 292D0156
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:21:40 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 1C1E0152
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:21:40 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 20 Sep 2022 03:21:38 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] xwud: upgrade 1.0.5 -> 1.0.6
Date: Tue, 20 Sep 2022 10:21:26 +0800
Message-ID: <1663640486-27455-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Sep 2022 02:21:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98882

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-app/{xwud_1.0.5.bb => xwud_1.0.6.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xwud_1.0.5.bb => xwud_1.0.6.bb} (73%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xwud_1.0.5.bb b/meta-oe/recipes-graphics/xorg-app/xwud_1.0.6.bb
similarity index 73%
rename from meta-oe/recipes-graphics/xorg-app/xwud_1.0.5.bb
rename to meta-oe/recipes-graphics/xorg-app/xwud_1.0.6.bb
index 7cb550d276..1be0b5cd77 100644
--- a/meta-oe/recipes-graphics/xorg-app/xwud_1.0.5.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xwud_1.0.6.bb
@@ -8,5 +8,5 @@ SECTION = "x11/app"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=31e8892c80b7a0c1c5f37c8e8ae6d794"
 
-SRC_URI[md5sum] = "79972093bb0766fcd0223b2bd6d11932"
-SRC_URI[sha256sum] = "99997051f8a892313f22edf41dab45864e86e7062ee9012d5dbb6a40fc6b10a9"
+SRC_URI_EXT = "xz"
+SRC_URI[sha256sum] = "64048cd15eba3cd9a3d2e3280650391259ebf6b529f2101d1a20f441038c1afe"
-- 
2.25.1


