Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D913CC63797
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 07:18:42 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.191039.1673939915545041752
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Jan 2023 23:18:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=RTvEzUdc;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673939914; i=@fujitsu.com;
	bh=RerCnWv7SmQR9sqlhPBMH4Kdu3TE/moBvEyvOu/P/Yg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=RTvEzUdcrDExJxBokHtMk2NI09k6YsyUEBSkXxzEIPxX1/Irelr49Sw8S7NXpOA1t
	 5TggpkLAx97OZQm81ONbNSuKD5kdI1dB+AZv4oKdv7m1mbzP2Jv9l+1pQAZeYxKomS
	 vCQigsiEELu4cwIVOLRlHM2K4vCP46jbB13D7c33WW0/lSifHcmmNySLlj5ATg+R/6
	 ky2OqFHLHGem1DO8jWF3fBr96/Ej2GUGehoi/PMQmfJPedlcQlz/sJPRg/S/VqqbJs
	 1ttYDS6IIRleCKfr+pEWA9frCMEtPNWDEG2kgwU65+ZJ62BaiffplD1t3gPE2BqNqZ
	 ExTIOwy5bvRBA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRWlGSWpSXmKPExsViZ8MxSfek97F
  kgz9fZSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1owvLz+xF5zkrOjcfJ6pgfEuRxcjF4eQwBNG
  iaUf57NDODeYJC5tb2KGcPYySjzrfsjUxcjJwSYgJXHj/n82EFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrBAsETr3d+sIDaLgKrEmWsdYDW8Ak4SXVffgtkSAgoSUx6+B7M5BZwl5rxcCtYrBFTz48
  JKVoh6QYmTM5+wQMyXkDj44gVUr6LE7MvNLBB2pUTrh19QtprE1XObmCcwCs5C0j4LSfsCRqZ
  VjGbFqUVlqUW6hgZ6SUWZ6RkluYmZOXqJVbqJeqmluuWpxSW6RnqJ5cV6qcXFesWVuck5KXp5
  qSWbGIHhm1Ks0reD8e2yP3qHGCU5mJREeU+aHksW4kvKT6nMSCzOiC8qzUktPsQow8GhJMF7y
  gsoJ1iUmp5akZaZA4wlmLQEB4+SCG+4JVCat7ggMbc4Mx0idYpRl2Ntw4G9zEIsefl5qVLivN
  dAZgiAFGWU5sGNgMX1JUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvE88gKbwZOaVwG16BXQ
  EE9ARHiVHQY4oSURISTUwOR1dO3vt5Ofe02Z1usadu850ZE360oKMmz9Yj+ywOTrjwb8zeZ71
  RQareZT/s9ruuHHTeZrjb6HT07fe4BPsepq2Noh9WSbvt7lTp11dMHtTBfe/UJW9b1VXz01nu
  2T+lonz2+TvOZJ3o2ouzvnPf1blg5FLklfh2Y1BTRm+R2YxPrv8/cCU2T1u+nYHBT9vktjptP
  qzV+bRnqM79V7IG/o27nlz//SSrM89EZW65qHeK/eU/Pp4+vSs8w0Wz0V/c/jl8K2K4Xt6ZfE
  1Ffm1wWvqTL/HKUyxTCi2SZWddtzuxGL3BHuhRb7vPvV2cPUFbEtRcYgoPXvLfFflqcIlL08x
  tz5+9i58tbxmaN8UtftKLMUZiYZazEXFiQBrgNe2ZgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-548.messagelabs.com!1673939913!86586!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32429 invoked from network); 17 Jan 2023 07:18:33 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-17.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Jan 2023 07:18:33 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 311391000F5
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:18:33 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 250511000D7
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:18:33 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 17 Jan 2023 07:18:31 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-filesystems] [PATCH] xfstests: upgrade 2022.12.18 -> 2023.01.01
Date: Tue, 17 Jan 2023 15:18:15 +0800
Message-ID: <1673939896-20171-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673939896-20171-1-git-send-email-wangmy@fujitsu.com>
References: <1673939896-20171-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:18:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100607

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xfstests/{xfstests_2022.12.18.bb => xfstests_2023.01.01.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-utils/xfstests/{xfstests_2022.12.18.bb => xfstests_2023.01.01.bb} (97%)

diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests_2022.12.18.bb b/meta-filesystems/recipes-utils/xfstests/xfstests_2023.01.01.bb
similarity index 97%
rename from meta-filesystems/recipes-utils/xfstests/xfstests_2022.12.18.bb
rename to meta-filesystems/recipes-utils/xfstests/xfstests_2023.01.01.bb
index b1cb9d0521..defa11c929 100644
--- a/meta-filesystems/recipes-utils/xfstests/xfstests_2022.12.18.bb
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests_2023.01.01.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git;branch=master;na
            file://0002-Drop-detached_mounts_propagation-and-remove-sys-moun.patch \
            "
 
-SRCREV_xfstests = "e263104046712af5fb5dcc7d289ac3fa5f14b764"
+SRCREV_xfstests = "fbd489798b31e32f0eaefcd754326a06aa5b166f"
 SRCREV_unionmount = "e3825b16b46f4c4574a1a69909944c059835f914"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


