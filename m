Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13B0BC77B73
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 03:23:39 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.42811.1682306617587632647
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Apr 2023 20:23:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=rVxLIQIp;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1682306615; i=@fujitsu.com;
	bh=E+5SA5/5wi1mb3tpIvBfN+HHDTev5V5SNcVAsqsBX58=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=rVxLIQIpFEZ4KuPHtcfzmh4Rcvyc0XI3onv19tR+uzUAT3Vvsv8sXkv3se85btfS7
	 vyemwNymOW9s5cRJW74QEaaGX4la7mRepe9p4tvaR1/Ykh1rhfdRy0QXtzWF/3NQQ0
	 GeZcDuevK+4KkWCN90odgkOy4QArfRMwnDCbG4bhJYPQWTt+4KkiUZ97cDER8KCpFX
	 Zbh9lZjXrLETzcgh/SgqCHfZFJ2GauMWrvqJaCMcw0trM8l1DsMaGWGsTqmQaY7CnO
	 zc0n4e9QKknEI4LTJx7iKaD1JLXb20t0WZd7yq1j9cJvtdG3ikSVanG6eI//VZ1gpO
	 WRQaf2i1GhLmQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8MxSdfsm2u
  KwbVrHBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bP7gtsBVM5K7bea2BsYNzK0cXIxSEk8IRR
  4sn5C2wQzg0miWtzZ7NCOHsZJb4cm8vUxcjJwSYgJXHj/n82EFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrCAj8S+YzcZQWwWAVWJWTPmg9XzCjhJHFo8FywuIaAgMeXhe7BeTgFnid7dz1hAbCGgmv
  +HHrFD1AtKnJz5hAVivoTEwRcvmCF6FSVmX25mgbArJVo//IKy1SSuntvEPIFRcBaS9llI2hc
  wMq1iNCtOLSpLLdK11EsqykzPKMlNzMzRS6zSTdRLLdXNyy8qydA11EssL9ZLLS7WK67MTc5J
  0ctLLdnECAzflOLU2TsYF+/6q3eIUZKDSUmUd8kGlxQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKE
  rxFn1xThASLUtNTK9Iyc4CxBJOW4OBREuFd9gUozVtckJhbnJkOkTrFqCglzhsIkhAASWSU5s
  G1weL3EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVhXskPQFN4MvNK4Ka/AlrMBLR4F7cLyOK
  SRISUVANTwNqCLVp7r6Waz1iz+erm9+f+uP9aJ9wkEPDV+mr6iRQGm0UHo7z/VXg+2lQqOmsH
  a931v9anc46HSSgF/Gac6GHboW+otHYbU2Rc96sK7fdxEh+uTa9ym6IaF1SZrfp5xpYUOYu7j
  hYbucOVtnSb8vrY7TmncePjwuLQxD7zDQFJr/IltQ+335DsuHpsogJ/1e/lMjwhOQ0hkV5uhn
  vbG7T5qpfNY7reP7HXZnG2jctWmy9iAdv/SWWW2vmpVPwKzX81XeD3cyGLFf9O+nVMNs7wXbM
  /iclI5Lrw4f1S+V2mc3/qPZx47Fo9z4fW2QHREd9SIs/y+bZXRCplz+ewN7oR3ZVooPmj1Crk
  uhJLcUaioRZzUXEiAKp5Nu1aAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-732.messagelabs.com!1682306613!290136!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25897 invoked from network); 24 Apr 2023 03:23:34 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-7.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Apr 2023 03:23:34 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 9078C10032B
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 04:23:33 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 8477E1000FC
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 04:23:33 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 24 Apr 2023 04:23:32 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-engineio: upgrade 4.4.0 -> 4.4.1
Date: Mon, 24 Apr 2023 11:23:09 +0800
Message-ID: <1682306589-11841-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1682306589-11841-1-git-send-email-wangmy@fujitsu.com>
References: <1682306589-11841-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 03:23:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102163

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Prevent crash when closing simple-websocket connection
Fix server/client mixup in client docstrings

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-engineio_4.4.0.bb => python3-engineio_4.4.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-engineio_4.4.0.bb => python3-engineio_4.4.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-engineio_4.4.0.bb b/meta-python/recipes-devtools/python/python3-engineio_4.4.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-engineio_4.4.0.bb
rename to meta-python/recipes-devtools/python/python3-engineio_4.4.1.bb
index 03a7d480d..b20a6413f 100644
--- a/meta-python/recipes-devtools/python/python3-engineio_4.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-engineio_4.4.1.bb
@@ -17,4 +17,4 @@ RDEPENDS:${PN} += " \
 	python3-asyncio \
 "
 
-SRC_URI[sha256sum] = "bcc035c70ecc30acc3cfd49ef19aca6c51fa6caaadd0fa58c2d7480f50d04cf2"
+SRC_URI[sha256sum] = "eb3663ecb300195926b526386f712dff84cd092c818fb7b62eeeda9160120c29"
-- 
2.34.1


