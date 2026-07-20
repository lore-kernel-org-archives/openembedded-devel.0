Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E223C44529
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 19:28:22 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5629.1784575698168253051
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2026 12:28:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=ITGkO0bJ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20260720192819268cece63e0002073f-fqzfxy@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20260720192819268cece63e0002073f
        for <openembedded-devel@lists.openembedded.org>;
        Mon, 20 Jul 2026 21:28:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=C8eK4sGDc34wtfAGWvU6nYg/noPKCrMq0Hojv1+5cic=;
 b=ITGkO0bJLVjMhr284lPNyZODaW1Sj5HfgTmNiYaniYVbogRwVUoW/UOgBSmD6xTWkVh/3S
 gi/oxVK0cEWtAfPnhIF2eHz8EvYl3HSNbtYXU/zxW7c+gID+3+bLE5MCDq30e+kh1k7r3OAt
 U3vzoCnb3GOiVyvHAx6AWfV+Eyglxs6A/YQC+7vdMYjf1fGcK66+gCEEc9ruOHlGu6ML0xFZ
 hWd4UmtI1gXRYuakoF+b8iaH9637aKAudmA2ciQM7p6uzzzg4tRz+Ar6N+7EtMYbEvHUo30/
 aPTEbzm8nQ5kbWiAl7yDo8OtH+Hsq9ZO5bjsE9BmNcNAno5K1v9chtHw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-python][wrynose][PATCH 2/6] python3-grpcio: set status for CVE-2023-33953 and CVE-2024-37168
Date: Mon, 20 Jul 2026 21:28:05 +0200
Message-ID: <20260720192809.28277-2-peter.marko@siemens.com>
In-Reply-To: <20260720192809.28277-1-peter.marko@siemens.com>
References: <20260720192809.28277-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 19:28:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128295

From: Peter Marko <peter.marko@siemens.com>

CVE-2023-33953 is fixed since 1.56.2 per [1].
FKIE sets "defaultStatus": "unknown" so it needs to be set explicitly.

CVE-2024-37168 description in [2] says grpc-js.
Even if (like FKIE added) grpc core would be affected, it would be in
old versions (also listed in [2]).

[1] https://nvd.nist.gov/vuln/detail/CVE-2023-33953
[2] https://nvd.nist.gov/vuln/detail/CVE-2024-37168

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-python/recipes-devtools/python/python3-grpcio_1.78.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.78.0.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.78.0.bb
index d9ec337427..867c55096f 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.78.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.78.0.bb
@@ -51,3 +51,5 @@ CCACHE_DISABLE = "1"
 
 CVE_PRODUCT += "grpc:grpc"
 CVE_STATUS[CVE-2026-33186] = "cpe-incorrect: the vulnerabilty affects only the go implementation"
+CVE_STATUS[CVE-2023-33953] = "fixed-version: Fixed since 1.56.2"
+CVE_STATUS[CVE-2024-37168] = "cpe-incorrect: This CVE is for grps-js"

