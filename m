Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D121C4708D
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 16:46:40 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web08.7723.1649744997847720083
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Apr 2022 23:29:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=WYbrxFu3;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649744996; i=@fujitsu.com;
	bh=fUPF8N6fxIxyMnhVPwyRkLoTCSVyonKwvY2flQHgncw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=WYbrxFu382is6TEdvigIBBrVVwD/qtvB43tmUEj8uw/l4x3PHgRfPez0ifKp3TXX1
	 cCw1Bt0MqqIF/YhV+1X8z/nuV/YP9wU1v9K+fpf423MgmzY7QZixS1T1q0gI23vwBi
	 XNsVS04TAZtfVP9I/F1Wc8qXBRwMEEiAiixcH8oe2MwltWQxc0Ic1vbl63op8n0HY1
	 0T4Iy4LSWa833Ql9WJWY2V50OJdBmY26X7vFq8DnPIOpyMlNrD07QBDzEFIcSZBGSr
	 EVXF8I3CHFoGRXfv45nIhwFvSFJylsS9rJ9aLPat1dC087u1ISnijPW3NpjjsfHKSS
	 ESe2GhRar87eg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJIsWRWlGSWpSXmKPExsViZ8MxRTdZJjT
  JYMl1bYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaPt6HnGgqecFb1nD7M0MH7h6GLk4hASmM0k
  8ffgYTYIZw+jRMOiuUxdjJwcbAJqEtNv3WAFsUUE9CWWzt7DDGIzC6hIvPjdww5iCwvYSuw6e
  xqsngUoPuneFbB6XgFHiQnPr4DFJQQUJKY8fM8MEReUODnzCQvEHAmJgy9eMEPUKErMvtzMAm
  FXSMya1cY0gZF3FpKWWUhaFjAyrWK0TCrKTM8oyU3MzNE1NDDQNTQ01TXWNbTQS6zSTdRLLdU
  tTy0u0TXUSywv1kstLtYrrsxNzknRy0st2cQIDLGUYmahHYzr+37qHWKU5GBSEuU14AlNEuJL
  yk+pzEgszogvKs1JLT7EKMPBoSTB6yAJlBMsSk1PrUjLzAGGO0xagoNHSYRXRQoozVtckJhbn
  JkOkTrFqCglzqsrDZQQAElklObBtcFi7BKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd5qkC
  k8mXklcNNfAS1mAlocui0QZHFJIkJKqoEp8ydLLMf8Ist4M/dF0yJuvEy9fS/Yva17kXnPcYl
  XaiwqjNGL7Tvm+4ZrrY4QeGgtIXI6zpP1mY+qmmVoTZ7clYw5xY0bgve9rUn75FW07lJa2f8/
  JsZztSavLQjflHjlipvAubvrbY+KR37fvFaw9dGcpLJXD//KPd+2KM9v1a4mjrXPbmv3VXtfm
  SK+btrUXaoF031MHrlfP35u6a3w9hM7/s9Yppj7yfCb+SmerRM+eMXGmz285xuWc+fWPMmDv5
  u4YsvrNb5Gf8/LyDkj9XLB3eq5MSW5Wh+tql6m8HO06pcyLtz8Y9+9Y6xuoutsZ2yQuHlo5ow
  5Yut0i2INFzpG3lBSXVjFk/Zt841vSizFGYmGWsxFxYkAd67ysywDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-591.messagelabs.com!1649744995!63258!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8266 invoked from network); 12 Apr 2022 06:29:55 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-4.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 12 Apr 2022 06:29:55 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 23C6Tn69005657
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Apr 2022 07:29:55 +0100
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 12 Apr 2022 07:29:48 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] icewm: upgrade 2.9.0 -> 2.9.6
Date: Sat, 9 Apr 2022 21:26:19 +0800
Message-ID: <1649510782-4563-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Apr 2022 16:46:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96560

Changelog from 2.9.0 to 2.9.6:
https://github.com/ice-wm/icewm/blob/2.9.6/NEWS

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-extended/icewm/{icewm_2.9.0.bb => icewm_2.9.6.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/icewm/{icewm_2.9.0.bb => icewm_2.9.6.bb} (94%)

diff --git a/meta-oe/recipes-extended/icewm/icewm_2.9.0.bb b/meta-oe/recipes-extended/icewm/icewm_2.9.6.bb
similarity index 94%
rename from meta-oe/recipes-extended/icewm/icewm_2.9.0.bb
rename to meta-oe/recipes-extended/icewm/icewm_2.9.6.bb
index dac025de7c..f3b147d10a 100644
--- a/meta-oe/recipes-extended/icewm/icewm_2.9.0.bb
+++ b/meta-oe/recipes-extended/icewm/icewm_2.9.6.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4a26952467ef79a7efca4a9cf52d417b"
 SRC_URI = "https://github.com/ice-wm/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.lz \
            file://0001-configure.ac-skip-running-test-program-when-cross-co.patch \
            "
-SRC_URI[sha256sum] = "c76a8c9965a1edde4f2446b47ee17c8564e0e20f3d8474465f6d4c54d1125ac4"
+SRC_URI[sha256sum] = "f8f453fc1f0009e3e7f113fd128638770894d004a3b60202922e2c7347c30607"
 
 UPSTREAM_CHECK_URI = "https://github.com/ice-wm/${BPN}/releases"
 
-- 
2.25.1


