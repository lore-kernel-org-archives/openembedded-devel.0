Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4457CC7619A
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 00:29:53 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.89922.1679617786483380685
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Mar 2023 17:29:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Zc43CRu3;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679617784; i=@fujitsu.com;
	bh=l21RXY5A2gnz1a5FPtWfyf+ReK0UEC+yvuhhnOIN3Es=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Zc43CRu3nj6PnYP5+/6qiBgBychFGjVhVdEBnejO3ZaEdDtMPe2HJyX3fEdZxMPmT
	 +fvGfzKaQUIr/sJfKm+EPCswPNth4ioIziqIGcx5Njea/AazitMTaH40/YYgZ1UFDr
	 jRurfPCpUysFXgaUvJrCWC1NV5Ij9/GzY9xrjCZYASR0BK//FxnN+9EO7hMByY921n
	 iTEhjC4AxN7QVg8/Tu2WDCzuVU7yXCIyrb03aaUIy9wfbe4Kie9mET4CuE4d9QVHTe
	 AFEZgKej2fCATLywWcog8J3r0lxh5UKWEAPj04B0xLVLttGrk2XnjJoRNhs0ackprt
	 1o6zJ1lIXRB5g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8ORpPv9nUy
  KwZXJWhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aZHReZCq5zVeyYcJKxgfEKZxcjF4eQwENG
  iYsP3zNCOFeYJCbPnMYE4exhlFg2byprFyMnB5uAlMSN+//ZQGwRAX2JpbP3MIPYzAIqEi9+9
  7CD2MICXhLLb74Ai7MIqEo8bNjDCGLzCjhJPL/7EqxGQkBBYsrD92A1nALOEhvuNIHZQkA1+x
  /OZYOoF5Q4OfMJC8R8CYmDLyBmSggoSsy+3MwCYVdINE4/xARhq0lcPbeJeQKj4Cwk7bOQtC9
  gZFrFaFacWlSWWqRrpJdUlJmeUZKbmJmjl1ilm6iXWqqbl19UkqFrqJdYXqyXWlysV1yZm5yT
  opeXWrKJERi+KcXJn3Ywruv9q3eIUZKDSUmUVyJUOkWILyk/pTIjsTgjvqg0J7X4EKMMB4eSB
  O/nNzIpQoJFqempFWmZOcBYgklLcPAoifAeOguU5i0uSMwtzkyHSJ1iVJQS5018C5QQAElklO
  bBtcHi9xKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYV5hYDIQ4snMK4Gb/gpoMRPQYucasMU
  liQgpqQamML8+HinrA9Ku38zmzG5X6HrIt8dC7JX4srALh9i1d2z69MdKREHFdE1H/y9D1a3e
  cuvcWGo+3t2zTy/lZHr38q1NF3UUJZ6XfXsy93XENLVaiV1nFzNv3sDobVt+nXua8aV9mk3Ka
  VV2LzfO/L7mQQxL8YyPuyLfLSpRYv3LzXxaq6SWe2llh79t+wM+q/D77hobXnivO9rvYmLzqv
  m56lFdtcLXvhmPv7Ir1hb/XOz/a8H9ye5+IdPun9DVqExe6HsyWuzgp9/3M90/He2VX/lGUtl
  R/ZD79pS//cqJs25unynw93CJ6MFCpiOnptz6mBrMopyX9ovx2cJJs9NOMkqvkNSvUmMu2Nvr
  HmmtxFKckWioxVxUnAgAlmlrDloDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-745.messagelabs.com!1679617783!652699!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8816 invoked from network); 24 Mar 2023 00:29:43 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-18.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Mar 2023 00:29:43 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 164FC1B5
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:29:43 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 0B46A1AF
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:29:43 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Fri, 24 Mar 2023 00:29:41 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] nbdkit: upgrade 1.33.10 -> 1.33.11
Date: Fri, 24 Mar 2023 08:29:22 +0800
Message-ID: <1679617764-27268-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1679617764-27268-1-git-send-email-wangmy@fujitsu.com>
References: <1679617764-27268-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:29:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101685

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:
 "Copyright (C) 2013-2020 Red Hat Inc." changed to "Copyright Red Hat"

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nbdkit/{nbdkit_1.33.10.bb => nbdkit_1.33.11.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/nbdkit/{nbdkit_1.33.10.bb => nbdkit_1.33.11.bb} (89%)

diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_1.33.10.bb b/meta-networking/recipes-support/nbdkit/nbdkit_1.33.11.bb
similarity index 89%
rename from meta-networking/recipes-support/nbdkit/nbdkit_1.33.10.bb
rename to meta-networking/recipes-support/nbdkit/nbdkit_1.33.11.bb
index 2a2f01cd87..32d4270d18 100644
--- a/meta-networking/recipes-support/nbdkit/nbdkit_1.33.10.bb
+++ b/meta-networking/recipes-support/nbdkit/nbdkit_1.33.11.bb
@@ -7,11 +7,11 @@ nbdkit is a toolkit for creating NBD servers."
 
 HOMEPAGE = "https://github.com/libguestfs/nbdkit"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f9dcc2d8acdde215fa4bd6ac12bb14f0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=26250adec854bc317493f6fb98efe049"
 
 SRC_URI = "git://github.com/libguestfs/nbdkit.git;protocol=https;branch=master \
 "
-SRCREV = "65fbd0cc87b38f4068c0d973947a82c2d4f9822c"
+SRCREV = "6c02c6a469d62a047f230b0ccf03f72328312d2b"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


