Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59A70C6379F
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 05:40:43 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web11.97337.1673329238242255072
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jan 2023 21:40:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=CSWRrMMG;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673329236; i=@fujitsu.com;
	bh=KvDHtRAcrs/ek1mIjAiOdzeEc9/d5rdScEsYZkcEuuY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=CSWRrMMGLUlN2nWLTgSiaFOXTYgLVGZ4G6tkkbZEeM8OANNmgjxjL1svcMRFENYXk
	 qaxKZYyiXCz44RR6yIZ/YFGVSegVcK6rmRZCwW+Q5+eNmbi/XHWQ9PtDxMng/a39Wl
	 h2urlPxTvsjcOvQd5MmDIk684YiKkfPIvGHqkEPIffyqsE/pIV+tViJ7AoNxwRLc2I
	 pNuJ+lWA5iWcL3APCUIldDpzX/Keo3Py7JSNIgTW8+AOzIxuH8kQZKvjPruHeGtBX+
	 lxu9pPuTVpdzxrDNmU+Sln0I9mQDxzW+eDa3keE162lLlro/dzTP4ig4q0gI2FLkp8
	 ghz+s2v7lLGIQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8MxSTf4155
  kg3l/5SwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oyD67ayFDznq2ja/4apgbGPt4uRi0NI4Amj
  xN8n25kgnBtMEvcfnmSGcPYySmxobWHvYuTkYBOQkrhx/z8biC0ioC+xdPYeZhCbWUBF4sXvH
  rAaYQFbiYf9s1hAbBYBVYnWrRvBbF4BR4lFU7oZQWwJAQWJKQ/fg/VyCjhJdE+4ClYjBFTz9d
  MXRoh6QYmTM5+wQMyXkDj44gUzRK+ixOzLzSwQdqVE64dfULaaxNVzm5gnMArOQtI+C0n7Aka
  mVYymxalFZalFuuZ6SUWZ6RkluYmZOXqJVbqJeqmluuWpxSW6hnqJ5cV6qcXFesWVuck5KXp5
  qSWbGIHBm1LMmLuDceeyP3qHGCU5mJREeYs+7UkW4kvKT6nMSCzOiC8qzUktPsQow8GhJMGr8
  wMoJ1iUmp5akZaZA4wkmLQEB4+SCO+860Bp3uKCxNzizHSI1ClGXY6rV67sZRZiycvPS5US55
  30E6hIAKQoozQPbgQsqi8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEua1/go0hSczrwRu0yu
  gI5iAjvgxdSfIESWJCCmpBqa9S+ZNzK5lM337emX8Gvfkw+q5diK309d9PF/hnLv6/qp9TKER
  QjcvuPywtumTenPnrvsrrntLNISu1iqr1dq7H6mM3Hw75mGS0YTUd7ZXtgXWn0xb6njz6yz2A
  wZCd+fr6zvcPaCW/LLb3Pu3o3DOTL3MOznR3bcfn9i9pT+/b7ua68H0Pzsjviy6dJP5ocbHH0
  /L4h7UmiVpF3M8/BpenPhVnF38vvJuDj+vtWwHA25JdB2z9WA4IJvzv1ziSGWTKodPgPCviIs
  B38pcYhpf8p4OWeck4tyw9/Bxy3NblLzZJm3R5pr7QUP83K2P52O363z3ZeacLGA3+7z1g3qt
  LXe8ZJp3n2pd5W5744ASS3FGoqEWc1FxIgBJRhD9ZQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-591.messagelabs.com!1673329235!448397!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3139 invoked from network); 10 Jan 2023 05:40:35 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-2.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Jan 2023 05:40:35 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 16AF71000E7
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jan 2023 05:40:35 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 0A3E91000D2
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jan 2023 05:40:35 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 10 Jan 2023 05:40:33 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] cli11: upgrade 2.3.1 -> 2.3.2
Date: Tue, 10 Jan 2023 13:40:18 +0800
Message-ID: <1673329220-5227-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673329220-5227-1-git-send-email-wangmy@fujitsu.com>
References: <1673329220-5227-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jan 2023 05:40:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100506

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Bugfix: Consistently use ADL for 'lexical_cast', making it easier to extend
  for custom template types [#820][]
- Bugfix: Tweak the parsing of files for flags with 'disable_flag_override'
  [#800][]
- Bugfix: Handle out of bounds long long [#807][]
- Bugfix: Spacing of 'make_description' min option output [#808][]
- Bugfix: Print last parsed subcommand's help message [#822][]
- Bugfix: Avoid floating point warning in GCC 12 [#803][]
- Bugfix: Fix a few gcc warnings [#813][]
- Backend: Max CMake tested 3.22 -> 3.24 [#823][]

License-Update: Copyright updated to 2023.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/cli11/{cli11_2.3.1.bb => cli11_2.3.2.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/cli11/{cli11_2.3.1.bb => cli11_2.3.2.bb} (87%)

diff --git a/meta-oe/recipes-support/cli11/cli11_2.3.1.bb b/meta-oe/recipes-support/cli11/cli11_2.3.2.bb
similarity index 87%
rename from meta-oe/recipes-support/cli11/cli11_2.3.1.bb
rename to meta-oe/recipes-support/cli11/cli11_2.3.2.bb
index cdba31e704..313973326d 100644
--- a/meta-oe/recipes-support/cli11/cli11_2.3.1.bb
+++ b/meta-oe/recipes-support/cli11/cli11_2.3.2.bb
@@ -2,8 +2,8 @@ SUMMARY = "C++11 command line parser"
 DESCRIPTION = "A command line parser for C++11 and beyond that provides a rich feature set with a simple and intuitive interface."
 HOMEPAGE = "https://github.com/CLIUtils/CLI11"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=9ad746b5f49c0fd53c08ca1faff1922c"
-SRCREV = "c2ea58c7f9bb2a1da2d3d7f5b462121ac6a07f16"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=afb20fe5f67e21074b10b864d9563c11"
+SRCREV = "291c58789c031208f08f4f261a858b5b7083e8e2"
 PV .= "+git${SRCPV}"
 
 SRC_URI += "gitsm://github.com/CLIUtils/CLI11;branch=main;protocol=https \
-- 
2.25.1


