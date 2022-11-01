Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04CDEFA3740
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 02:08:47 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web10.1671.1667268520282378903
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Oct 2022 19:08:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=jycvgYJa;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667268518; i=@fujitsu.com;
	bh=eYPrGemp+zBmhWVp3aKJjBJwJCZgFzOxhrJUfd13quM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=jycvgYJa5+JTZ9abaGoYiZGmXv3Qm1UIixC9o1iukPltkueNbaZ55DZR7DQgRPlOC
	 IUzSmWLu0ljXwRhE1pbZGNfpU96jj/rT6PQmNDcGCeNB/54ydkmfvY6mFXkQTLKO3y
	 t/Xx7sgyV9rlHRnrX2mfcAtheirwPgQDbOrhaeMQqG4mqqE+RbLs6rhMRAHyMcETy/
	 tHlPRdry60HD5ytEtxytCwARi4kM/UqtBdIi6LdJh+GgdbrSKwrg/GP2W7J1m2LUXr
	 wEoNGwo0+HIj1+mvMcOlNCiIpBLqC4Ru9x8pZYqMdn3o3tCg1qlIc0p+yG161uymsB
	 2JAmZ4lJsJ/gA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAIsWRWlGSWpSXmKPExsViZ8OxWXdZfUK
  ywec53BYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8axW2dZCx5xVkw6+JOxgbGDs4uRi0NI4CGj
  xIuz79kgnMtMEp/+PGeEcHYzSmxcuQzI4eRgE5CSuHH/PxuILSKgL7F09h5mEJtZQEXixe8e9
  i5GDg5hAT+JlUdLQEwWoPCcI14gFbwCThKfD0xgBbElBBQkpjx8D9bJKeAs8fH7LSYQWwio5u
  Sjc4wQ9YISJ2c+YYGYLiFx8MULZoheRYnZl5tZIOwKiVmz2pggbDWJq+c2MU9gFJyFpH0WkvY
  FjEyrGE2LU4vKUot0LfSSijLTM0pyEzNz9BKrdBP1Ukt1y1OLS3SN9BLLi/VSi4v1iitzk3NS
  9PJSSzYxAgM3pVh96w7Gw8v+6B1ilORgUhLl/S+RkCzEl5SfUpmRWJwRX1Sak1p8iFGGg0NJg
  jeyBignWJSanlqRlpkDjCKYtAQHj5II769qoDRvcUFibnFmOkTqFKMux8yvbQeYhVjy8vNSpc
  R5nWqBigRAijJK8+BGwCL6EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3gaQS3gy80rgNr0
  COoIJ6Ai29jiQI0oSEVJSDUxuJ4XWMVp33jfcl3NvxquUGXsbz710XH/xlnrIy7D1S/5kyE4W
  5bjct1HI6KjMJeYTa+Zq7rx9mWWxxV3pow7LqjzFJGzW1MxbNnu6yVrLV447eB5KFN9JOchs8
  mhj9o5tllOVF1h9uCkryvlNVXZKy1sF/ZTsvRlBdg5HL3u4LuiY1py86vyaBNYtEu9mvJj2qs
  V0VY5nugDDuQLv6F4uXaPpwj9OsTNsPTj3RUDK0w+Np4LiGRuK17kFH//5qVCB38XiYtiTF73
  eeh6cHdPi/lkqdV/uXS5TEmcrMPX6uS5/Nhu9aaEyPtvvC6zijdUVrFi1YxnfnfVues7HlRVr
  3G3rwjcfDqp7UXW1yFqJpTgj0VCLuag4EQD8ohPzYwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-548.messagelabs.com!1667268518!51851!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7974 invoked from network); 1 Nov 2022 02:08:38 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-6.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 1 Nov 2022 02:08:38 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id E477A151
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Nov 2022 02:08:37 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id D7E1573
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Nov 2022 02:08:37 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 1 Nov 2022 02:08:36 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-protobuf: upgrade 4.21.8 -> 4.21.9
Date: Tue, 1 Nov 2022 10:07:58 +0800
Message-ID: <1667268480-10004-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1667268480-10004-1-git-send-email-wangmy@fujitsu.com>
References: <1667268480-10004-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Nov 2022 02:08:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99389

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-protobuf_4.21.8.bb => python3-protobuf_4.21.9.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_4.21.8.bb => python3-protobuf_4.21.9.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_4.21.8.bb b/meta-python/recipes-devtools/python/python3-protobuf_4.21.9.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-protobuf_4.21.8.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_4.21.9.bb
index 1eb1832619..7970d0b90e 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_4.21.8.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_4.21.9.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=53dbfa56f61b90215a
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "427426593b55ff106c84e4a88cac855175330cb6eb7e889e85aaa7b5652b686d"
+SRC_URI[sha256sum] = "61f21493d96d2a77f9ca84fefa105872550ab5ef71d21c458eb80edcf4885a99"
 
 # http://errors.yoctoproject.org/Errors/Details/184715/
 # Can't find required file: ../src/google/protobuf/descriptor.proto
-- 
2.25.1


