Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A698EC00140
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 06:32:19 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web12.13708.1660545135712306052
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Aug 2022 23:32:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=VjXW07eT;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1660545133; i=@fujitsu.com;
	bh=ZGW2DLqNcBa+MpaMxAO1O0BkiP7ChtI4Ub/mi7x00P8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=VjXW07eT4IUtjrgq+vPzFi3i924iEe+29aVRTBik1TOC5PSLmv9027LMjAOZ6EUv/
	 Ksr/U8p1/d1zzy76KwnBoB5DHYiRTEZi8V4nbicp9LOZlTfMw1SNkn72frjKs9xzZs
	 5+iu4JVaRv5MHuAoAw55eaUwGAOKL36y14n92kRfuu3xACFOyVRmUGvH8U8FwX+icJ
	 poQE5YYnzw/6ffDm5JZXRRzooAuoFA1Ej9kjGnzmZOqe07ZfTiNf+x9TV4I1Pf3H8Y
	 xm6GG53ysOn4F2HyU0WXk2OkT2iDwCXbPR2CXLWcLKOIQLsRHyQ+RDT9J5z0oZD3wA
	 LgSmK4wiweyBA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLIsWRWlGSWpSXmKPExsViZ8MxSTf3xc8
  kgwsfJSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1owtB7vZC55xVpxc/JyxgbGFs4uRi0NI4Amj
  xN+X29kgnOtMEg+b3jFBOHsYJb6tbGXvYuTkYBNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvH
  rAaYQFPiTOHLgE1c3CwCKhKfNtvDBLmFXCUeLh2KhuILSGgIDHl4XuwVk4BJ4njd/vAWoWAar
  bM28oMUS8ocXLmExaI8RISB1+8YIboVZSYfbmZBcKukJgxYxvUTDWJq+c2MU9gFJyFpH0WkvY
  FjEyrGG2TijLTM0pyEzNzdA0NDHQNDU0htKW5XmKVbqJeaqluXn5RSYauoV5iebFeanGxXnFl
  bnJOil5easkmRmAopxSnHN3BeGzfL71DjJIcTEqivNcu/kwS4kvKT6nMSCzOiC8qzUktPsQow
  8GhJMFb+hwoJ1iUmp5akZaZA4wrmLQEB4+SCO+C20Bp3uKCxNzizHSI1ClGRSlx3rpnQAkBkE
  RGaR5cGyyWLzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5uUFmcKTmVcCN/0V0GImoMV6d7+
  DLC5JREhJNTCFzJ3WzHjH7LrGzlNvklkbti325rsy/+6vhreMLHveT5QLP+Wx/sBubsmPDXN1
  5t6VbO/duShDKnzH4bdWs/xEQ582f63/6FfXonTZVlif/UqnOPeco2f3Jp+VFFyhouR24ZmJ4
  /F9bixHRec7PJm/hMFtE28OR1xchebhrUXrC8/GnDq5V6Z4bbGISNKZXbkTQ9X0L95Y8Srh6K
  wpsmUv+yb/+PO+eq7jnZ8n3L8wqfHcufi77+lk7yZfySluKV8cDr7yy2y9UFDMM5fZa/cSt1n
  bONUPyiofbn9Zznn12O55nxm/dm568fvORa34dmGBnPX6rpftr0z/q7jV47cbh/hGOzWheUL3
  9ROkeFeWKbEUZyQaajEXFScCANs8RolgAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-745.messagelabs.com!1660545133!444934!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25783 invoked from network); 15 Aug 2022 06:32:13 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-6.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Aug 2022 06:32:13 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id CE5C81000C2
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Aug 2022 07:32:12 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id C1D62100077
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Aug 2022 07:32:12 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 15 Aug 2022 07:32:11 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH] libtest-warn-perl: upgrade 0.36 -> 0.37
Date: Mon, 15 Aug 2022 14:31:52 +0800
Message-ID: <1660545115-1513-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1660545115-1513-1-git-send-email-wangmy@fujitsu.com>
References: <1660545115-1513-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Aug 2022 06:32:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98245

Merged PR:
- allow duplicate warnings when using warnings_exist
  https://github.com/hanfried/test-warn/pull/8

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libtest-warn-perl_0.36.bb => libtest-warn-perl_0.37.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libtest/{libtest-warn-perl_0.36.bb => libtest-warn-perl_0.37.bb} (88%)

diff --git a/meta-perl/recipes-perl/libtest/libtest-warn-perl_0.36.bb b/meta-perl/recipes-perl/libtest/libtest-warn-perl_0.37.bb
similarity index 88%
rename from meta-perl/recipes-perl/libtest/libtest-warn-perl_0.36.bb
rename to meta-perl/recipes-perl/libtest/libtest-warn-perl_0.37.bb
index 7f539933d7..5148fbeb09 100644
--- a/meta-perl/recipes-perl/libtest/libtest-warn-perl_0.36.bb
+++ b/meta-perl/recipes-perl/libtest/libtest-warn-perl_0.37.bb
@@ -17,8 +17,7 @@ CPAN_AUTHOR = "BIGJ"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/B/BI/${CPAN_AUTHOR}/${CPAN_PACKAGE}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "3d958f43d36db263994affde5da09b51"
-SRC_URI[sha256sum] = "ecbca346d379cef8d3c0e4ac0c8eb3b2613d737ffaaeae52271c38d7bf3c6cda"
+SRC_URI[sha256sum] = "98ca32e7f2f5ea89b8bfb9a0609977f3d153e242e2e51705126cb954f1a06b57"
 
 S = "${WORKDIR}/${CPAN_PACKAGE}-${PV}"
 
-- 
2.25.1


