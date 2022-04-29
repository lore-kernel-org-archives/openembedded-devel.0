Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC6C6C433EF
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 08:19:22 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web08.29337.1652084352118043271
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 May 2022 01:19:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=t/j+RqqL;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652084350; i=@fujitsu.com;
	bh=CvE+KXHsVY76NV0j/ggGOXyNYeCtLUOB7dUJM9nNyyk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=t/j+RqqL4SSPGh8KIQ22wzjbKewlxREI7ajsH5GyZuSuuCr0wTjoVsgj98uF8G1WG
	 eQUPdpTOlTDttg0cW1kAxW7zHoLWX/t68ovhA+BFHl7Q+D4S6b8u+R8tAxgMZvbT15
	 9pu+FUrEjLUmAdzZhbu+/w9llRIosUzIWoZmLYuMvQWaauUFM/15FYlunrl/uwFW/z
	 uPVXa7WivaqXcN9un0wGOHb1463fIYZnxyg+H6UyJ4+XEPa15RDz60y03n2prsqaGq
	 N6X/c/ziyZxLkDyaEXTN6/asF4pZCoXWhaKZClFodCUgvWgN9/DjWofJnPLqFGxDYC
	 MWO8eBEz89cfw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRWlGSWpSXmKPExsViZ8MxRbfuXEW
  SQctyXouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePz0+PMBas4Kt6/bmBqYDzB3sXIxSEkMItJ
  4u+n+0wQzm5GiR/nPgNlODnYBNQkpt+6wQpiiwjoSyydvYcZxGYWUJF48bsHrEZYwEPi3cHpb
  CA2i4CqxMame2D1vAJOEg+OnWMCsSUEFCSmPHwP1ssp4Cxx+d5mRhBbCKjm+eSTTBD1ghInZz
  5hgZgvIXHwxQtmiF5FidmXm1kg7AqJWbPamCYw8s9C0jILScsCRqZVjNZJRZnpGSW5iZk5uoY
  GBrqGhqa6xhZAylAvsUo3US+1VLc8tbhE10gvsbxYL7W4WK+4Mjc5J0UvL7VkEyMwLFOK1fJ3
  MP5d+VPvEKMkB5OSKG9lU0WSEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQleh1NAOcGi1PTUirTMH
  GCMwKQlOHiURHjvngBK8xYXJOYWZ6ZDpE4x6nLcXbh3L7MQS15+XqqUOO/3s0BFAiBFGaV5cC
  Ng8XqJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjBvHcgUnsy8ErhNr4COYAI64mNAKcgRJYk
  IKakGpg7ne4+yG9IbKqXYVdJbhde1rlFdKucrE/3kdFHYr6a1LSdfC9Uu3phuvPv9beFnZ/Ye
  FOf953k3xHVlqa7PXbsptTel78pN95y69P21QqbSH5O+nq5+sihFdvYdjRvWXQoyLscWp51t8
  vh8c9a98KMf1mx48aPi/mIz3p3Gx/Z/mmiQGnlre4b7hZQTvOmbWXN+PHg0OUT5gq3JSjtRzt
  cffqfd5CmIYHjDNkskMmhyxKKIrvA2r5aFeQ95nKv+unDzKW7vYLq2IcVU1/ERf/Od8xahNQe
  fr/o/a//+GiXu8rDCjsp/t3miTatm5hWWvPsXLXRkhumd153u+/jVk5qWLI5aPrto8eX3OTMM
  qpRYijMSDbWYi4oTAQecM4xSAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-571.messagelabs.com!1652084349!350059!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32532 invoked from network); 9 May 2022 08:19:10 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-13.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 May 2022 08:19:10 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 2498J4Si032126
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 9 May 2022 09:19:09 +0100
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 9 May 2022 09:19:02 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] cifs-utils: upgrade 6.14 -> 6.15
Date: Fri, 29 Apr 2022 16:01:10 +0800
Message-ID: <1651219273-27341-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1651219273-27341-1-git-send-email-wangmy@fujitsu.com>
References: <1651219273-27341-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 May 2022 08:19:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96989

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../cifs/{cifs-utils_6.14.bb => cifs-utils_6.15.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/cifs/{cifs-utils_6.14.bb => cifs-utils_6.15.bb} (97%)

diff --git a/meta-networking/recipes-support/cifs/cifs-utils_6.14.bb b/meta-networking/recipes-support/cifs/cifs-utils_6.15.bb
similarity index 97%
rename from meta-networking/recipes-support/cifs/cifs-utils_6.14.bb
rename to meta-networking/recipes-support/cifs/cifs-utils_6.15.bb
index d4cdda0f8..a009a26cc 100644
--- a/meta-networking/recipes-support/cifs/cifs-utils_6.14.bb
+++ b/meta-networking/recipes-support/cifs/cifs-utils_6.15.bb
@@ -4,7 +4,7 @@ SECTION = "otherosfs"
 LICENSE = "GPL-3.0-only & LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRCREV = "8c06dce7d596e478c20bc54bdcec87ad97f80a1b"
+SRCREV = "58ca03f183b375cb723097a241bc2fc2254dab21"
 SRC_URI = "git://git.samba.org/cifs-utils.git;branch=master"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


