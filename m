Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43B98CCA478
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 01:36:57 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web10.1717.1654133814316935686
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jun 2022 18:36:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=dcd05zbv;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1654133812; i=@fujitsu.com;
	bh=P9+pZEvGi1uJpIlpqCciCmDpiIYz6/d+eNOZHD5K/p4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=dcd05zbvkzj7yurUVOjqudIeHGb9Iq8TbpgtWLjlvSbt7bEbsihXg6luDO0rZESk+
	 5Mf+1+O8kP11efy4EJz45biQNDcZMmLffCkvrvYv2Wu9I/vxXBdxvlrMa4mbioywLW
	 wSOsr5DeU/19/3uPmEiHOkxYaS5d0Pf+WAQGdFYvY5ugSbai2x+9I7eNxB5vRrdR1d
	 Hm0p+Pi2xFFPRVA5OkKyL0d6t3L1kw9uq6GLQIIxhiriFTST0mJLLOVWq2FZbEymOB
	 HDna7eMAxVAXoo7vuv6B1xhbIU8ngzIkpB/1EfZs1G4SGpMjCQUXKwkrwTAIi4BfzZ
	 Dwo88PrEzhvkw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRWlGSWpSXmKPExsViZ8ORqGssMiP
  J4MIVXYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPmqlXMBdu5Kq78esPawHiIs4uRi0NI4Amj
  xPEXd5khnAtMEtOer2aHcE4wSsw7MoGxi5GTg01AXeLxzddgtoiAvsTS2XuYQWxmAVWJ7otr2
  EFsYYEgiUVnHoHFWQRUJD5PfMEKYvMKuEt8+vOUBcSWEFCQmPLwPTNEXFDi5MwnLBBzJCQOvn
  jBDFGjJHFixUcmCLtC4vXhS1BxNYmr5zYxT2Dkn4WkfRaS9gWMTKsYrZKKMtMzSnITM3N0DQ0
  MdA0NTXVNdY1MTfUSq3QT9VJLdctTi0t0DfUSy4v1UouL9Yorc5NzUvTyUks2MQLDMqWY9f8O
  xu6+n3qHGCU5mJREeXc6Tk8S4kvKT6nMSCzOiC8qzUktPsQow8GhJMHbzT8jSUiwKDU9tSItM
  wcYIzBpCQ4eJRHePEagNG9xQWJucWY6ROoUo6KUOG+dEFBCACSRUZoH1waLy0uMslLCvIwMDA
  xCPAWpRbmZJajyrxjFORiVhHklhYGm8GTmlcBNfwW0mAlo8bVvU0AWlyQipKQamAqtuNy4dU4
  mHObdemtjVc2nVVxR1w7r3zliPFturdcLn7MccUvrxb0tFW6xrPhhK7Q4+eSmp85qFgwP2Ke8
  vJ79Y2qqUkhootmP9KOFV/7m/7L+UTjzh6HOlquH5W48WDrb6KHPqmcHFgls/jJ5/tOXllZa9
  0/31YmYqb2bN6ssZPE9pbsd5ytuzDPbPvPdDl797ZHGmt2ScuYxe9c1Wwdt7WVK19N2cvgd+W
  aS+ttLitdKfO38Mm6VOpbM8jGU9C676h8XbF/1dfIuByPHfNHL3U9yuiqMPAW6PrE4sS5Jdik
  1l17Y3f7OwIdTbGLz29rj573Dkz4lPJyxYf6Hy1dsai47R68KCLx7aKLROSWW4oxEQy3mouJE
  AO3/6eVGAwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-13.tower-585.messagelabs.com!1654133811!159512!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15360 invoked from network); 2 Jun 2022 01:36:51 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-13.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 2 Jun 2022 01:36:51 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 34DCA100192
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  2 Jun 2022 02:36:51 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 2831710004E
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  2 Jun 2022 02:36:51 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 2 Jun 2022 02:36:30 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-flask-socketio: upgrade 5.1.2 ->
 5.2.0
Date: Thu, 2 Jun 2022 09:36:14 +0800
Message-ID: <1654133778-20912-1-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Jun 2022 01:36:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97371

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Changelog:
==========
  Better handling of message_queue connection argument #1130
  More robust handling of to and room arguments of emit and send #1771

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...-flask-socketio_5.1.2.bb => python3-flask-socketio_5.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask-socketio_5.1.2.bb => python3-flask-socketio_5.2.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-socketio_5.1.2.bb b/meta-python/recipes-devtools/python/python3-flask-socketio_5.2.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-flask-socketio_5.1.2.bb
rename to meta-python/recipes-devtools/python/python3-flask-socketio_5.2.0.bb
index 1e5d775b6..9deae8b41 100644
--- a/meta-python/recipes-devtools/python/python3-flask-socketio_5.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-socketio_5.2.0.bb
@@ -9,7 +9,7 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "Flask-SocketIO"
 
-SRC_URI[sha256sum] = "933bcc887ef463a9b78d76f8f86174f63a32d12a5406b99f452cdf3b129ebba3"
+SRC_URI[sha256sum] = "19c3d0cea49c53505fa457fedc133b32cb6eeaaa30d28cdab9d6ca8f16045427"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-flask \
-- 
2.25.1


