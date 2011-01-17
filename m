Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefflance01@gmail.com>) id 1Pexnz-0002Es-DT
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Jan 2011 23:44:07 +0100
Received: by gwaa12 with SMTP id a12so2160689gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jan 2011 14:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=87yo/I1LRVzodUuy//UWpv25QjKNPNZR61aF6xINdwI=;
	b=imKc6Td746/Zgtp+0FMCesj4BdyeIwtMxqL9fj4ByZNTflqUSzo06UEqUTglfPtv57
	epfGKVQHp1R2dbRBI2etnrcB5xk+E6QEIe0YI2WsrnQz7KWio61Gx/qIOsYSZYe6bWUH
	12GrGb7gkjWXMQW/EZMVRX1EDoG7UejYt6Eug=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=eOOFpa+OJuCSMvIf04w+k6KJIF5D38/xqqTRcVHrTvII5gTkscZq0+h9df2RozBnP1
	7JZg6JXATKhbY+ncrKWBdDv8ljg3tl6DGYbf4qvkLB+ncWGOpmt4lbkA+cG08d7hRwGX
	EPGJVEm1lgbw8jZMR39D2Sk/0uFT3R08fxaXc=
Received: by 10.147.125.7 with SMTP id c7mr6581369yan.30.1295304208913;
	Mon, 17 Jan 2011 14:43:28 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id g58sm2967288yhd.5.2011.01.17.14.43.28
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 17 Jan 2011 14:43:28 -0800 (PST)
From: Jeff Lance <jefflance01@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Jan 2011 16:42:08 -0600
Message-Id: <1295304128-13887-1-git-send-email-j-lance1@ti.com>
X-Mailer: git-send-email 1.6.3.3
Cc: Jeff Lance <j-lance1@ti.com>
Subject: [PATCH 1/1] am-benchmarks: updating SRCREV - Makefile update to support CCSv5
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Jan 2011 22:44:07 -0000

  * Update SRCREV
    * update makefile to support both debug and release versions supported by CCSv5

Signed-off-by: Jeff Lance  <j-lance1@ti.com>
---
 recipes/ti/am-benchmarks_1.2.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/ti/am-benchmarks_1.2.bb b/recipes/ti/am-benchmarks_1.2.bb
index 88b38e7..5ae0585 100644
--- a/recipes/ti/am-benchmarks_1.2.bb
+++ b/recipes/ti/am-benchmarks_1.2.bb
@@ -8,7 +8,7 @@ LICENSE = "BSD"
 SECTION = "system"
 PRIORITY = "optional"
 
-SRCREV = "58"
+SRCREV = "59"
 PR = "r2+svnr${SRCPV}"
 
 COMPATIBLE_MACHINE = "(dm365|omapl138|omap3|ti816x)"
-- 
1.6.3.3



