Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBA14C4332F
	for <webhook@archiver.kernel.org>; Thu, 22 Dec 2022 08:15:09 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.41323.1671696906764372153
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Dec 2022 00:15:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=LSCnc+Wl;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1671696904; i=@fujitsu.com;
	bh=4uByGp4RnsP6VFMCu+UYiDWUSAUHn8LufW+Z99u63XE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=LSCnc+WlAvhd+jhFNbZY4ARMMe36ch9yxP1dswzCbj5PKZOq1w6h+A1IlYvSmZxU8
	 s6nsIC3QpNRNaTLZ/nhyOgLmTf24RwxvoA3VIsK49dvqmKNRGFoNF1hW2l3tOou8Rq
	 iJdgk/V33Rj8fbepFGsM84RqKmAl5iFgoCS5VLuyAy4E6DmPdtlN9KooVGZONOsO24
	 BtYtQOfyiLzfOcw7kTwFXa2m6FFF9xbrICBAm2JvTMVycfX4Y01GhBTMMME2Avdsm9
	 MrjDMXA3ZKX+cm2znWEB4LrhO3j6co7NPLIjkFX1lTS68JwHQUvLch7gdOlSgttdkF
	 JLZFTFoITeSvg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAIsWRWlGSWpSXmKPExsViZ8ORpMshtCT
  ZoO+GgMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnF24RumguOcFX+O6Tcw3uboYuTiEBJ4yCix
  6+8kRgjnCpPEu2PdUM4eRokLl9uZuhg5OdgEpCRu3P/PBmKLCOhLLJ29hxnEZhZQkXjxu4cdx
  BYWCJN4u2MemM0ioCrRuOoRWA2vgJNE17wJLCC2hICCxJSH76HighInZz5hgZgjIXHwxQtmiB
  pFidmXm6HqKyRmzWpjgrDVJK6e28Q8gZF/FpL2WUjaFzAyrWI0K04tKkst0jU000sqykzPKMl
  NzMzRS6zSTdRLLdUtTy0u0TXSSywv1kstLtYrrsxNzknRy0st2cQIDMaUYsWtOxhvLPujd4hR
  koNJSZQ37ufiZCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvEd4lyQLCRalpqdWpGXmACMDJi3Bw
  aMkwnuXBSjNW1yQmFucmQ6ROsVozLG24cBeZo6rV67sZRZiycvPS5US5w0WACoVACnNKM2DGw
  SL2EuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHkD+ICm8GTmlcDtewV0ChPQKdNuLgQ5pSQ
  RISXVwBQwj1m0KPyR5OxfWh/at5eaH4mT2ypYlMQucVdZ8+4r9kd/g+fHJjAJbX5Q7a2lqH/q
  QrNt6oMnEddLAiWi/1q/T7qmnugfHPuyuPfOqS19O/8LxiyrlXdd9FVRKUvy3v4f8mvSjgQ/s
  CsKUFVXt++oOryq5dy5ZOOJm2YeOed75pRk49Tj06Ym3Dwawlfu2aDc9pp952uZrOA1l64fmm
  bGpxcx/8Nq8bLTX1/Pc7vXVfC1WPpc0v9yayeTTUaXV89zvh512C5syu1jm+N/XV2xv+nq3/u
  nS6pdFzlIf38nwyvdePb1TZ05Hz89e+FZ+nu3yHVN1RceW8xk5feePHl6e2/0EQWxlAsvzFd3
  XmlUYinOSDTUYi4qTgQA55IW+FMDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-565.messagelabs.com!1671696904!560242!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9857 invoked from network); 22 Dec 2022 08:15:04 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-17.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 22 Dec 2022 08:15:04 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 00DE71B0
	for <openembedded-devel@lists.openembedded.org>; Thu, 22 Dec 2022 08:15:04 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id EA5101AF
	for <openembedded-devel@lists.openembedded.org>; Thu, 22 Dec 2022 08:15:03 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 22 Dec 2022 08:15:02 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-filesystems] [PATCH v2] xfstests: upgrade 2022.11.27 -> 2022.12.11
Date: Thu, 22 Dec 2022 16:14:29 +0800
Message-ID: <1671696869-22824-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Dec 2022 08:15:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100187

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xfstests/{xfstests_2022.11.27.bb => xfstests_2022.12.11.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-utils/xfstests/{xfstests_2022.11.27.bb => xfstests_2022.12.11.bb} (97%)

diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests_2022.11.27.bb b/meta-filesystems/recipes-utils/xfstests/xfstests_2022.12.11.bb
similarity index 97%
rename from meta-filesystems/recipes-utils/xfstests/xfstests_2022.11.27.bb
rename to meta-filesystems/recipes-utils/xfstests/xfstests_2022.12.11.bb
index 8c791a7e6..136fea8ad 100644
--- a/meta-filesystems/recipes-utils/xfstests/xfstests_2022.11.27.bb
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests_2022.12.11.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git;branch=master;na
            file://0002-Drop-detached_mounts_propagation-and-remove-sys-moun.patch \
            "
 
-SRCREV_xfstests = "1e8502082ca94addc20b7cb0e86cbc6af397ebe0"
+SRCREV_xfstests = "87ab8bdf20db7308e7ecc2ddcdce530ec1f08f1f"
 SRCREV_unionmount = "e3825b16b46f4c4574a1a69909944c059835f914"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


