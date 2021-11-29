Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6D8AC433F5
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 15:05:28 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web08.62133.1638198327558375798
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Nov 2021 07:05:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=mv3KLaID;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1638198325; i=@fujitsu.com;
	bh=VA3Zp37z9PKLHettBuyQc9HCoH/GNt0Td5SyNj0AvLU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=mv3KLaIDphny0ZToW6PdeTIM6MMOAg2rOlcGKZhCC3+DbZZzGYskmyl31yr0+rAdH
	 leiwvUonoXiMYxRJU/Lfe9fP5HhhvQtQntTFGE8eIyv9O5sr6fYTlJydLtwgjXSYlX
	 iTJ+gBNHJBRPUmqWEcReixqnc5aFmBM4unfw5+QtuKd91EWew/h6tIwVmQWD4LPjs+
	 2QGJkfICn+bHLvIkbUCbcFQaHu9H7bE7f6+D2ohuvrwNF06uO9O/aVw4rzxp/w8CBh
	 pjKr+X9dzBlK2kDElAW9swfgnJlPIW1vc0KGS35zu6FKa94WCMkHu2VbUDV+/k8VZr
	 8SJFMhksnETjw==
Received: from [100.115.3.142] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.ess.symcld.net id AA/A8-12056-53CE4A16;
 Mon, 29 Nov 2021 15:05:25 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrPIsWRWlGSWpSXmKPExsViZ8MxSdf0zZJ
  Eg1fL1SwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oyPWxULZnFUnDyxnL2BcT97FyMXh5DAE0aJ
  +zMesEE4F5gk+j7+Y+pi5ARyTjBKbLnBDmKzCahJTL91gxXEFhHQl1g6ew8ziM0soCLx4ncPW
  I2wgKPEnqlPWUBsFgFVidcNOxlBbF4BZ4nVW/eC2RICChJTHr4H6+UUcJH4vPcYK8QuZ4nP1x
  eyQtQLSpyc+YQFYr6ExMEXL5ghehUlZl9uZoGwKyRmzWpjgrDVJK6e28Q8gVFwFpL2WUjaFzA
  yrWK0SirKTM8oyU3MzNE1NDDQNTQ01TXVNTI21kus0k3USy3VLU8tLtE11EssL9ZLLS7WK67M
  Tc5J0ctLLdnECAzhlGLWlzsYp/f91DvEKMnBpCTKm7VkSaIQX1J+SmVGYnFGfFFpTmrxIUYZD
  g4lCd7+V0A5waLU9NSKtMwcYDzBpCU4eJREeItfAKV5iwsSc4sz0yFSpxjDOd6sXbKImeMtmG
  y7dxdItoPJmQsOrmbmmAUm77cfApIPQKQQS15+XqqUOO9JkG0CIOMySvPglsHSxSVGWSlhXkY
  GBgYhnoLUotzMElT5V4ziHIxKwry3QabwZOaVwN30CuhcJqBz3y5dDHJuSSJCSqqBSZfnq6uw
  t1OsI5/YnblXUt6W7y+OCdtmqvf2eFXHOoeJYf6sMUv6gnmYI3t8xc3jGoWfCwtfnJU/+ZJYn
  H/wxxVyr3/tKBEo/f1q/zy+HRNbf22SrY25eOEd24EVrX8UY3h9Nxh92btvw75k7ySvGwfVnX
  9O2WR1um0bf8bZbXfWbfQxUWrd4ympuT7gOtvpvzub5t1ZacSyYVFSFAvPQSO/Y3bnY1rncsv
  sqDn49+XZ2Q3zFVkb39V4lpn3/W+VMjqweuMv0fQ+rz9Sekuk16idbp1SYrLBRd/IiePJ5cRn
  Bp9Dfdc+XWIdsvlPbKH43LOKybPSzk+WeqT3bFO0+1elxwdMjTdXhut+1Vp2VYmlOCPRUIu5q
  DgRAB3yhgeSAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-585.messagelabs.com!1638198325!52889!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11582 invoked from network); 29 Nov 2021 15:05:25 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-4.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 29 Nov 2021 15:05:25 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id E387E214D2A
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Nov 2021 15:05:24 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id D6290214775
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Nov 2021 15:05:24 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 29 Nov 2021 15:05:02 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] pps-tools: upgrade 1.0.2 -> 1.0.3
Date: Mon, 29 Nov 2021 23:04:47 +0800
Message-ID: <1638198287-119133-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1638198287-119133-1-git-send-email-wangmy@fujitsu.com>
References: <1638198287-119133-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Nov 2021 15:05:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94137

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../pps-tools/{pps-tools_1.0.2.bb => pps-tools_1.0.3.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/pps-tools/{pps-tools_1.0.2.bb => pps-tools_1.0.3.bb} (89%)

diff --git a/meta-oe/recipes-support/pps-tools/pps-tools_1.0.2.bb b/meta-oe/recipes-support/pps-tools/pps-tools_1.0.3.bb
similarity index 89%
rename from meta-oe/recipes-support/pps-tools/pps-tools_1.0.2.bb
rename to meta-oe/recipes-support/pps-tools/pps-tools_1.0.3.bb
index 3d0c9df286..344dbcaafe 100644
--- a/meta-oe/recipes-support/pps-tools/pps-tools_1.0.2.bb
+++ b/meta-oe/recipes-support/pps-tools/pps-tools_1.0.3.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://linuxpps.org"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRCREV = "cb48b7ecf7079ceba7081c78d4e61e507b0e8d2d"
+SRCREV = "c50cb7183e252b47308fa22f420e0a877277aa29"
 SRC_URI = "git://github.com/ago/pps-tools.git;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


