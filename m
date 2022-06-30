Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23125C433EF
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 02:17:38 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web09.20156.1656555448942259144
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jun 2022 19:17:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=DKEju6r/;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1656555447; i=@fujitsu.com;
	bh=HlKIMn8vbm9aVLeCSlo9YhHXw5nf24Ska8000ADbww0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=DKEju6r//YAZXyGAUuqqZfMTW4jc14/nuPCekF9TqPQ8qv8xxEGHAa4eteAtDWiJJ
	 b4r9kHNoKCBLHDHxid8CWQ8SY1I/c2WI7urtShay/jkXxPC67rTbKFppALc6oJ4no8
	 mpKFka+eUNmGr6e5MCicx57f7BTBOCxsm0wkgt+CfQIeJo8QWXYCUHbKsNbBLltFjc
	 H3Aw20Q7XHkw4SHQA6e93YNZ3dymEAA7QkEAzv9EV9tfGvV5MJf3po2+D40JnvzyS+
	 m6QfjL7d6qbVrEUrnc9QNjfCVYSiGKZO9c481eMmN/Uh3hcgnSn4v49k5fBOKmNhUy
	 D1MwlgXCBdV+g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRWlGSWpSXmKPExsViZ8ORqLuNfW+
  SQdNKXYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePq0gVMBfs5K15cWMPcwPiKo4uRi0NI4Amj
  xJHX39ggnOtMEr+erGeHcA4wStyZdAPI4eRgE9CVePFjMQuILSKgL7F09h5mEFtYwE/iec91s
  DiLgKrE9j17WEFsXgF3iel7prKB2BICChJTHr5nhogLSpyc+QSsnllAQuLgixdAcQ6gGkWJ2d
  PlIcorJF4fvsQMYatJXD23iXkCI98sJN2zkHQvYGRaxWidVJSZnlGSm5iZo2toYKBraGiqa2y
  ka2hhqZdYpZuol1qqW55aXKJrpJdYXqyXWlysV1yZm5yTopeXWrKJERh+KcUKe3cwXl75U+8Q
  oyQHk5Io79Npe5KE+JLyUyozEosz4otKc1KLDzHKcHAoSfCuZ9ibJCRYlJqeWpGWmQOMBZi0B
  AePkgjvje9ArbzFBYm5xZnpEKlTjLocM7+2HWAWYsnLz0uVEuddyQI0QwCkKKM0D24ELC4vMc
  pKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmZWADmsKTmVcCt+kV0BFMQEfsnAZ2REkiQkqqgSn
  73mW//J8CnkvTNfi8dulf7Lk9c/7jVS93PLjLrldtofx4XVDvvjo9572Khqxrppywl2jbti7Q
  vEn/DdeCN/MWSm3QUC9pbZx7cdG5nbVpm+KMtvfnCQT6qi7sP6wyqUDN5+40W/sPk9Xv6zswF
  GusCHfjuRpXmFdZfFxi//Y9TI/K95pdjo3f7ODMqvH77N62pypnwy62MvI89650iddSLtJUM7
  j94HoLxxyTvg53z393UzftP7Y859l/rb2Lm+Xbbm52n7r9QuGm14HRnI/TZO4Hvnui+XPHxA3
  BacXZyTXZF5mtJ617s91xbZ3J73Pzzs6RXXwyhKMrarZ0hsfUTeum31i69WzEAq3gnmolluKM
  REMt5qLiRACPoH0hRgMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-23.tower-565.messagelabs.com!1656555446!12407!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31286 invoked from network); 30 Jun 2022 02:17:26 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-23.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 30 Jun 2022 02:17:26 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 6EAC610018D
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jun 2022 03:17:26 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 630CE100043
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jun 2022 03:17:26 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 30 Jun 2022 03:17:25 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-protobuf: upgrade 4.21.1 -> 4.21.2
Date: Thu, 30 Jun 2022 10:17:18 +0800
Message-ID: <1656555438-9917-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jun 2022 02:17:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97632

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-protobuf_4.21.1.bb => python3-protobuf_4.21.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_4.21.1.bb => python3-protobuf_4.21.2.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_4.21.1.bb b/meta-python/recipes-devtools/python/python3-protobuf_4.21.2.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-protobuf_4.21.1.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_4.21.2.bb
index cdce531e8..b8287a88e 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_4.21.1.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_4.21.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=53dbfa56f61b90215a
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "5d9b5c8270461706973c3871c6fbdd236b51dfe9dab652f1fb6a36aa88287e47"
+SRC_URI[sha256sum] = "863f65e137d9de4a76cac39ae731a19bea1c30997f512ecf0dc9348112313401"
 
 # http://errors.yoctoproject.org/Errors/Details/184715/
 # Can't find required file: ../src/google/protobuf/descriptor.proto
-- 
2.25.1


