Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 579BAC77B75
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 10:19:48 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.103822.1683541186192444130
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 03:19:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=eLaFdvyh;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1683541184; i=@fujitsu.com;
	bh=Z8XqbxGGIVChfdX8nLlQKH36hNswfVdLKkOFTe5QnJo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=eLaFdvyhcbQXodcjbter/tZV+WoztAODpmsQLvsgR4nkiVi0poDzc8YGV1q6GQcaM
	 08lPrsqwdAxt9o1pJCIFR8JgGRx1EXaSXInazoKHVEcsPcDNG5gmoEm5HgbsOw+LK6
	 u5yRLBCPKpA9rI96Obkv9JbYQ2B2m/IWYfcO43AGXm6tExpHVNbdEZTDjrJGyTRswD
	 2iyQkZbaEyEVEFHdk36G0daKggdheclJAtdf+aSp6PyWPK7YrCW5N4kvivgwYIP4+P
	 0HHfwAxLWbBUMyFNrYDQTbt56deKT3YJI6zRPNyDku6mHww0KGqukROw/OyIktbTA3
	 o1WK6XcO2zfeQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrILMWRWlGSWpSXmKPExsViZ8ORpLv/TES
  Kwf4X+hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aOubcYC6byVtz5vICtgfEUdxcjJ4eQwEZG
  iTlvxbsYuYDsaUwS03dsYQVJsAlISEzfe5IdxBYR0JX4+GEuI4jNLKAiMWPyESYQW1jAV+L0t
  LcsIDaLgKrE5zOnwXp5BZwkFn2azAxiSwgoSEx5+B7M5hRwluj5c5MZYrGTROe354wQNWoSV8
  9tYp7AyLOAkWEVo1lxalFZapGusV5SUWZ6RkluYmaOXmKVbqJeaqluXn5RSYauoV5iebFeanG
  xXnFlbnJOil5easkmRmBIpBQnu+5gvLDzr94hRkkOJiVRXtODYSlCfEn5KZUZicUZ8UWlOanF
  hxhlODiUJHjbtkWkCAkWpaanVqRl5gDDEyYtwcGjJMIrewQozVtckJhbnJkOkTrFqCglzvvvF
  FBCACSRUZoH1waLiUuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHkvg0zhycwrgZv+CmgxE9
  Bi/8vhIItLEhFSUg1MsRyvJ+zbwcLhvXrTXdvW6/+elTdNWHSK7c6sE3s0rXtV/zr2vD7vr7G
  m+/PFdX96pV9dVIhqbjwTs3zGDr6M+XPLhc1O+3yvSrv3vP9i34S+0FfpEecu+zJtcb9873K3
  VqDSZY8HMk8b5y2YdV7496n0CiaHq61TZi+rfOac/nfz/gzLhG3WLhM0loWof7RPPyFmnsddN
  8smP2x2vNr2F1zOWrHCO2MOZrK9yGzqtPn98+7Ly/9uf+qyqFuzaVqHaF/VqiXyKXc4RGP1Tr
  67IfjAYNZG4Twu8w1VrNkOSkqSouV1y3qMRX/b7fE9peXWHLPs7ZU5QdasSRG/57N5hQe6sl2
  PyBVdO62FsVxViaU4I9FQi7moOBEAOjhHYgQDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-745.messagelabs.com!1683541183!492631!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2083 invoked from network); 8 May 2023 10:19:43 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-5.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 May 2023 10:19:43 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 411171D2;
	Mon,  8 May 2023 11:19:43 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 689441C2;
	Mon,  8 May 2023 11:19:42 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-imageio: upgrade 2.27.0 -> 2.28.1
Date: Mon,  8 May 2023 18:19:28 +0800
Message-Id: <1683541169-25445-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1683541169-25445-1-git-send-email-wangmy@fujitsu.com>
References: <1683541169-25445-1-git-send-email-wangmy@fujitsu.com>
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 10:19:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102414

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
========
Fix
-----
    Avoid exception when n_frames is not set by Pillow
    Forward get_reader/get_writer kwargs to read/write (#979)
    Allow incremental write in pillow (#978)
    Add writeable_output=True to pillow plugin to ensure data is writable by default (#976)

Other
-----
    Refactor invoke in no-internet CI (#986)
    Fixed typo in CI script (#985)
    Fix typo in PyPI link tooltip (#980)
    Generate images in temporary folders (#977)

Feature
--------
    Expose v3 plugins via v2 API (#824)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-imageio_2.27.0.bb => python3-imageio_2.28.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-imageio_2.27.0.bb => python3-imageio_2.28.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.27.0.bb b/meta-python/recipes-devtools/python/python3-imageio_2.28.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-imageio_2.27.0.bb
rename to meta-python/recipes-devtools/python/python3-imageio_2.28.1.bb
index be0de475da..a747609d7c 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.27.0.bb
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.28.1.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=24cb9a367a9e641b459a01c4d15256ba"
 
-SRC_URI[sha256sum] = "ee269c957785ef0373cc7a7323185956d83ec05e6cdf20b42a03ba7b74ac58c6"
+SRC_URI[sha256sum] = "5db5087be5c814ecf7e2c7d30a1a15c97eca97d8c26f31ddc54d767d4a43bce8"
 
 inherit pypi setuptools3
 
-- 
2.34.1


