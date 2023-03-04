Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 064BEC678DB
	for <webhook@archiver.kernel.org>; Sat,  4 Mar 2023 11:10:45 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.7010.1677928240931028857
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Mar 2023 03:10:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=x29EOG5/;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677928241; i=@fujitsu.com;
	bh=Nm8+V2QCMGoJeaqwaL7cv5Ex43UTBGOFf1BavCTDG+o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=x29EOG5/UE6BtHCS1tImPGOlT+A1ur9OdFYAkgzbTLTh/7lF3i2sBtccLNXXSKFAX
	 2+tc8U6p4EvqQItLNJ1ir2KS7rcs2NzmpGClYfsIh8paxy4WfZywDvs/s15O6VfuZy
	 ldenmYKmThQOdKbQvy6sfTwY8z56PKM7DxkARB06MQTu/yQcVzmSPTLbJum48SoGFj
	 1hk7A4uk/Lw4O018wnbMx8hBB9Ci8yr9w7kNutol0jkyLFzrDI8tGpT6KJ4JvniDNR
	 cisD0d2hDmOe3cKWA5VTazlYGMVHV/isw1x4ni6EuFM4ylsffWEfcISjK+NUivRd8w
	 bJcFNvmeToUDQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8ORqGugzpx
  isK+N2+Li4aXMDowe5zauYAxgjGLNzEvKr0hgzfj2IadgN1dFx263BsZ7nF2MXBxCAk8YJZbv
  uMAG4dxgktjy+TKUs4dRYuufjyxdjJwcbAJSEjfu/2cDsUUE9CWWzt7DDGIzC6hIvPjdww5iC
  wv4S6w/+xasngUovrV1NxOIzSvgJPH22lqwXgkBBYkpD9+D9XIKOEucPXqCFcQWAqqZs+waC0
  S9oMTJmU9YIOZLSBx88YIZoldRYvblZhYIu1Ki9cMvKFtN4uq5TcwTGAVnIWmfhaR9ASPTKka
  z4tSistQiXWO9pKLM9IyS3MTMHL3EKt1EvdRS3bz8opIMXUO9xPJivdTiYr3iytzknBS9vNSS
  TYzA0E0pThTawfit96/eIUZJDiYlUd5JrAwpQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4ZVSZU
  4QEi1LTUyvSMnOAcQSTluDgURLh3SIClOYtLkjMLc5Mh0idYlSUEucVUAZKCIAkMkrz4NpgsX
  uJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjDvFhWgKTyZeSVw018BLWYCWqxxmgFkcUkiQkq
  qgcnxq/pZoXV3F4os+L/2SbXthaJXTSXPL0yyCX28/4Np8hcWgxpzTgvWR+L3Ni633NF8XipS
  Zp5S80sjdjlW94hv+9Xa7syYpWDxn4PtTPqrQ7+j+u9+tpOrPtq+zO3U6dJmHt6GSPvb8YKue
  bpLir6KNHpsddmR0s4Vu0vg0Zaq1bM2MChO3pS4w3zjI7Y7yo9m7mm69vi8U0XYBMffN2bcYe
  L8XVuX+L9U+IfXJCEr5b49m4OU4jqSXcSKBfd2fnPk56pRu3VWwGhxWUuM9DQ5SdUlDjcumUb
  +j9x0buOypDVcolNumEw0Xf5Qu+ttY6T5+nMX/kZnn5umnLHBMtX6Y99EQ4ddJcm7Dgjf6ldi
  Kc5INNRiLipOBADdo+lgWAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-728.messagelabs.com!1677928239!137371!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27404 invoked from network); 4 Mar 2023 11:10:40 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-20.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Mar 2023 11:10:40 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 8CF4D10019F
	for <openembedded-devel@lists.openembedded.org>; Sat,  4 Mar 2023 11:10:39 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 80C8310019D
	for <openembedded-devel@lists.openembedded.org>; Sat,  4 Mar 2023 11:10:39 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 4 Mar 2023 11:10:38 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-protobuf: upgrade 4.21.12 -> 4.22.0
Date: Sat, 4 Mar 2023 19:10:21 +0800
Message-ID: <1677928222-23049-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1677928222-23049-1-git-send-email-wangmy@fujitsu.com>
References: <1677928222-23049-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Mar 2023 11:10:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101374

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
https://github.com/protocolbuffers/protobuf/releases/tag/v22.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-protobuf_4.21.12.bb => python3-protobuf_4.22.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_4.21.12.bb => python3-protobuf_4.22.0.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_4.21.12.bb b/meta-python/recipes-devtools/python/python3-protobuf_4.22.0.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-protobuf_4.21.12.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_4.22.0.bb
index 5e2fe151e..2d59ec754 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_4.21.12.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_4.22.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=53dbfa56f61b90215a
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "7cd532c4566d0e6feafecc1059d04c7915aec8e182d1cf7adee8b24ef1e2e6ab"
+SRC_URI[sha256sum] = "652d8dfece122a24d98eebfef30e31e455d300efa41999d1182e015984ac5930"
 
 # http://errors.yoctoproject.org/Errors/Details/184715/
 # Can't find required file: ../src/google/protobuf/descriptor.proto
-- 
2.34.1


