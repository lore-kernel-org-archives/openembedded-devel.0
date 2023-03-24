Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D9ADC74A5B
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 00:31:53 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.90542.1679617908976905704
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Mar 2023 17:31:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=e/jK5Dmm;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679617907; i=@fujitsu.com;
	bh=0HlUXPLK+hGnf/eA+4i5MwAOPfClIOWvdp/UhYueEOw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=e/jK5DmmW1hNt5x0xei1HPZFGYmMHXmuCSY8bv+cZKMToHyAwt8DBLRZ5hn2fTkO9
	 j+u3+Pqx0WS+YslUsun8ZLx7GjdSKwOl31y/cEMhLG8+ft3VlH+te0hAeawnjV0SuO
	 zdqQkZ+wz5b+MsQUDzvX6IJSNNZlV08l+hDLwIKvihcFpbtcC5nRSA5dg5lI2DU/oR
	 cYYOsFeWSTJJRRzb028ng9Ts/kUAZWhcTxYt2DetgpvNNzXhIXNe2DxmidyfTVZyBN
	 +44e3idUBy/9zxaL/4wDX6bcLqtViTjfJcEeNuCyjc/GPp0h6rt63dmEVpOBJQSKrS
	 ibDl0Cn1Q2J7Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8ORpFv0Xib
  FYMppGYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP89e2MBSc5K84tPczYwHiXo4uRi0NI4CGj
  xKUNJ1m7GDmBnCtMEusPSkIk9jBKHOnazgSSYBOQkrhx/z8biC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1ggWOLEjt0sIDaLgKrEr+dfwGp4BZwkHn6dATZHQkBBYsrD92BxTgFnibmPOoBmcgAtc5
  JYco4FolxQ4uTMJywQ4yUkDr54wQzRqigx+3IzC4RdIdE4/RDUSDWJq+c2MU9gFJyFpH0WkvY
  FjEyrGM2KU4vKUot0TfSSijLTM0pyEzNz9BKrdBP1Ukt18/KLSjJ0DfUSy4v1UouL9Yorc5Nz
  UvTyUks2MQJDN6U4IW0HY2vfX71DjJIcTEqivBKh0ilCfEn5KZUZicUZ8UWlOanFhxhlODiUJ
  Hg/v5FJERIsSk1PrUjLzAHGEUxagoNHSYT30FmgNG9xQWJucWY6ROoUoy7H2oYDe5mFWPLy81
  KlxHkT3wIVCYAUZZTmwY2AxfQlRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8wu+ApvBk5pX
  AbXoFdAQT0BHONWBHlCQipKQamGIcX4tVFe7Jn1g5K+XpwUDHW7NcO7W+cholKKy87e77PCU2
  3OOSyL+cNWHiWYb80WwnzmzV/G/etceDWWrr3yuBp7J42B9PKO39Xar444276J7wf7emPDOSV
  /jeYxJ7ofvWzldKzFJxfu98zXdZHauZFxzl6vjyd92W7w4/FRXtTebWudTdKWarOig74fq/1i
  jPm2tX2TQxu5eymF6cYTers2Tr/lMpy1h/LXnFtMvRsqZ8tmD2nGesQs19WWsm263foKpv+OD
  CEsulf2bWeVxVKRbQzpru8GLHEYcVP47WWO6evuLTZKMjW1tfCHG3zT4drj/3zpX/t1TfJW02
  1DZfXPz5RV9Eu+GOu9n9lUosxRmJhlrMRcWJAHl59WlkAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-732.messagelabs.com!1679617906!253179!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18611 invoked from network); 24 Mar 2023 00:31:46 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-8.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Mar 2023 00:31:46 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id D5B801B5
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:31:45 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id CAB031B0
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:31:45 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Fri, 24 Mar 2023 00:31:44 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-filesystems] [PATCH] xfstests: upgrade 2023.01.01 -> 2023.03.05
Date: Fri, 24 Mar 2023 08:31:22 +0800
Message-ID: <1679617885-27327-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1679617885-27327-1-git-send-email-wangmy@fujitsu.com>
References: <1679617885-27327-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:31:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101689

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xfstests/{xfstests_2023.01.01.bb => xfstests_2023.03.05.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-utils/xfstests/{xfstests_2023.01.01.bb => xfstests_2023.03.05.bb} (97%)

diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests_2023.01.01.bb b/meta-filesystems/recipes-utils/xfstests/xfstests_2023.03.05.bb
similarity index 97%
rename from meta-filesystems/recipes-utils/xfstests/xfstests_2023.01.01.bb
rename to meta-filesystems/recipes-utils/xfstests/xfstests_2023.03.05.bb
index defa11c929..9baa31f712 100644
--- a/meta-filesystems/recipes-utils/xfstests/xfstests_2023.01.01.bb
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests_2023.03.05.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git;branch=master;na
            file://0002-Drop-detached_mounts_propagation-and-remove-sys-moun.patch \
            "
 
-SRCREV_xfstests = "fbd489798b31e32f0eaefcd754326a06aa5b166f"
+SRCREV_xfstests = "f7765774a1b5cb98c2f21a892e82b3421f40e791"
 SRCREV_unionmount = "e3825b16b46f4c4574a1a69909944c059835f914"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


