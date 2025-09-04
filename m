Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F632CA1013
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 22:13:01 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.7356.1757023976677093220
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Sep 2025 15:12:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=YQzcamP+;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20250904221254c319f9213c0002078c-van82i@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20250904221254c319f9213c0002078c
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 05 Sep 2025 00:12:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=4b/VBUV/I7nfDtCyownHZPSw7HzUiE72IBh54TUBkb8=;
 b=YQzcamP+9zijE58QSxmPQB26PUPzR7DdQ5LbIc1Es2QH6r0m1p5V/leujfEkHDrv6AfCy8
 ITb9uQYqBRiGoqmaEnj2v2getFNkKmQCk5BVWrPP/HxOoPDyH11BSKit7IYh1r8Fktqay2ab
 BaIDUgJ7ynAYztx+07Q26EQYufFjS62psM0oDAxGy/Zw3fI1bhgWEctKD7wW96lbVvD4coHd
 4PTSN0rnM+nkWpD5gGymn8hIu+AtY0wljjqiwM3lqvXz4AKI8mADnr9lQ+6pO4ceX4h7ZS1O
 rQwtnPPrKmUrkJ6/outBaGQO4uJL/W8xP43KnfDLobEoOAe57BLpBMWQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 04/10] poco: enable dns in ptest
Date: Fri,  5 Sep 2025 00:11:33 +0200
Message-Id: <20250904221139.3131569-4-peter.marko@siemens.com>
In-Reply-To: <20250904221139.3131569-1-peter.marko@siemens.com>
References: <20250904221139.3131569-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Sep 2025 22:13:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119301

From: Peter Marko <peter.marko@siemens.com>

NetSSL tests connect to secure.appinf.com and thus need to resolve DNS.
1 failure and 23 errors are fixed by this change making
NetSSL-testrunner to pass.

Such configuration is already used in oe-core oeqa maturin test.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-support/poco/poco/run-ptest | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-oe/recipes-support/poco/poco/run-ptest b/meta-oe/recipes-support/poco/poco/run-ptest
index c8e50fc967..95fd988e48 100644
--- a/meta-oe/recipes-support/poco/poco/run-ptest
+++ b/meta-oe/recipes-support/poco/poco/run-ptest
@@ -1,4 +1,12 @@
 #!/bin/sh
+
+# configure dns
+if ! nslookup secure.appinf.com >/dev/null 2>&1; then
+  trap 'mv /etc/resolv.conf.backup /etc/resolv.conf' INT EXIT
+  mv /etc/resolv.conf /etc/resolv.conf.backup
+  echo 'nameserver 8.8.8.8' > /etc/resolv.conf
+fi
+
 export POCO_BASE=/usr/lib/poco/ptest
 export LD_LIBRARY_PATH=${POCO_BASE}/bin:${LD_LIBRARY_PATH}
 i=0

