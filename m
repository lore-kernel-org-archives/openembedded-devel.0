Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDC84C54EE9
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 09:09:52 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web08.8536.1664269792015851997
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 02:09:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=qh18RTJt;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1664269790; i=@fujitsu.com;
	bh=lUuQ76VQOOmkmyrXZFAV3+VdYi7Yjfban73VjPzK3EQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=qh18RTJtF8cOexJBFTtydmpDf6hQeIYHHTNW8ohgOnJ5onHBkbKz0ntwDT07dRpqh
	 air6fZ/Z0F1vShL/UI9h5YfJZPcYBKsjJu0Dar7lVjHkVSSNBLmm/1gFeoKNyDvzbQ
	 iAVjiV52zovYEgK9Vs3kWROvWmvEnsFoqutfedROOsSIYT7PAY6CNzs4y0pDH7IvJ9
	 TogTE3enFoQDTJb9R+ng7r7MTnEcuaxavGUin6vk0q6bw9cAN8dYO9KRyoXOji6Mx0
	 UN0fSB2h2BnwcjUVyLvi7CD6AzvSrro4V8Tiu8Fk4XuBy5AWuNcg6AFtXDqZL04Qv9
	 JN4Ne4AzZm3/Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLIsWRWlGSWpSXmKPExsViZ8OxWffuXqN
  kg8/ndSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oxbu5cxFnRyV+z6K9HA+I+zi5GLQ0jgIaNE
  5+apjBDOFSaJra13WCCcPYwS7SuusncxcnKwCahJTL91gxXEFhHQl1g6ew8ziM0soCLx4ncPU
  A0Hh7BAkMSSSw4gJouAqsSWi6EgFbwCjhIvZuxgBLElBBQkpjx8zwwRF5Q4OfMJC8QUCYmDL1
  4wQ9QoSsy+3MwCYVdINE4/xARhq0lcPbeJeQIj/ywk7bOQtC9gZFrFaJ1UlJmeUZKbmJmja2h
  goGtoaKpraa5raaKXWKWbqJdaqpuXX1SSoWuol1herJdaXKxXXJmbnJOil5dasokRGJIpxYlx
  Oxgf7vuld4hRkoNJSZTXfpFRshBfUn5KZUZicUZ8UWlOavEhRhkODiUJXsndQDnBotT01Iq0z
  BxgfMCkJTh4lER41y0BSvMWFyTmFmemQ6ROMepyzPzadoBZiCUvPy9VSpzXdAtQkQBIUUZpHt
  wIWKxeYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMa7oHaApPZl4J3KZXQEcwAR1hx6cPckR
  JIkJKqoFJNjPaOCi/KGDLMnOj9d2Gjz+mv7gosk73Atc/NeZ6MYfFevYctjLiFYJvq95zbbFZ
  vPHqTbYVSmtNHF/xRmrsUAjtCW3fcOLmM+O+ySW6/b8lNr9+ZMUc/+dZ7DuO/gWFv5gv7Y8NO
  lQaFfQk/vFb1uPhq5P1N/Xfzr68r+Jnz6ptB46t3dRkM4c5ju3J4sflSx7erlS6rVSbx9oYGi
  1jWrY99IG82dNeW8MNlhdzdH+VSdc1K09rVXja9ufmnVWvZB6x39nR+9CyWmfB8l8v8tm/FFy
  NftH5JWWu6eZu7qYLlqu9NeeWTal8s8e+/saLzgmZJvdecPMd4Jl1WZVl7nTJHWWOkTFMXlW1
  aySUWIozEg21mIuKEwGTZT8sUAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-745.messagelabs.com!1664269789!382158!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14422 invoked from network); 27 Sep 2022 09:09:49 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-21.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Sep 2022 09:09:49 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 2654E152
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 10:09:49 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 16E37151
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 10:09:49 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 27 Sep 2022 10:09:47 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-grpcio-tools: upgrade 1.49.0 ->
 1.49.1
Date: Tue, 27 Sep 2022 17:09:36 +0800
Message-ID: <1664269780-2655-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Sep 2022 09:09:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98979

Changelog:
=========
All
------
    Update protobuf to v21.6 on 1.49.x. (#31028)

Ruby
------
    Backport "Fix ruby windows ucrt build #31051" to 1.49.x. (#31053)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-grpcio-tools_1.49.0.bb => python3-grpcio-tools_1.49.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-tools_1.49.0.bb => python3-grpcio-tools_1.49.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.49.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.49.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-grpcio-tools_1.49.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-tools_1.49.1.bb
index d2b599ae7a..e1b8a755d5 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.49.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.49.1.bb
@@ -12,7 +12,7 @@ DEPENDS += "${PYTHON_PN}-grpcio"
 SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch \
             file://0001-protobuf-Disable-musttail-attribute-on-mips.patch \
             "
-SRC_URI[sha256sum] = "16ac93ac515194f63febcf6f8a96a7f17390268972acc15e765d257f5008f2af"
+SRC_URI[sha256sum] = "84cc64e5b46bad43d5d7bd2fd772b656eba0366961187a847e908e2cb735db91"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-grpcio"
 
-- 
2.25.1


