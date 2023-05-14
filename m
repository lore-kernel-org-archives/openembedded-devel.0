Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8FF7C77B7D
	for <webhook@archiver.kernel.org>; Sun, 14 May 2023 13:05:55 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.66058.1684069544336520290
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 May 2023 06:05:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ye3Saouz;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1684069545; i=@fujitsu.com;
	bh=4XyC0lnK/ovF+B6wlV9lPRMkk2ckOrgsYmuB6yTUo1s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=ye3Saouzk2yJNG6npu5jg6tsvbWJ8oADXRFbTqLtkHFunZgKjl7O22Mr0WQ/J5QPS
	 NBZsajp9BkbH+f5nxSGT0sLg5rhLYNrow9t1cI9KkczNaXHEjdgeb1QbHAz7mmudJy
	 uxOdmOrIdEefvrhKigFZN4vGdQxTkKveveSWHqy1CQY35Z5twYzDTo8NB0LurtG0ld
	 o7dNRIRn6LEREJzbOyLjJAS0oM9O27W2e97maZ/4M1RBOloHyieVXplacujC9sCKd8
	 hm6++au5NKM88SpmkN5l2BjwBFnIp0wSXXZApOgcHXVDNarAk6zTK0PyYpQTekuaun
	 P6hNNUoeF7DSQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrILMWRWlGSWpSXmKPExsViZ8ORpLviTkK
  Kwc7rwhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aE57sZCx5xVqw4com9gbGDs4uRi0NIYCOj
  RMf0N0wQzlQmia7vR5i7GDk52AQkJKbvPckOYosI6Ep8/DCXEcRmFlCRmDH5CBOILSzgJ/Hnx
  zuwehYBVYmpfyBsXgEniZP3DrCA2BICChJTHr4Hi3MKOEv8uPUCrFcIqObpvcmsEDVqElfPbW
  KewMizgJFhFaNpcWpRWWqRroVeUlFmekZJbmJmjl5ilW6iXmqpbnlqcYmukV5iebFeanGxXnF
  lbnJOil5easkmRmBIpBQrde1g7Nv1V+8QoyQHk5Io77WSuBQhvqT8lMqMxOKM+KLSnNTiQ4wy
  HBxKErw6NxNShASLUtNTK9Iyc4DhCZOW4OBREuGNuwqU5i0uSMwtzkyHSJ1iVJQS5z0A0icAk
  sgozYNrg8XEJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvDw3gKbwZOaVwE1/BbSYCWjxrT
  3xIItLEhFSUg1M8hVPH1RO/t5Wd/tc43Obnyb3F905LmSeZ1tfHbVrRWD7+t+pM98cDZwXFhV
  Q4q7+eqnHM0YnpZ1/m25J8ur0Ji86w3nR8YRjyraFfcte7Tw3Q6uyI3SSUHPq+q9LJZIWdJhu
  +S5fOJF55aJGg2JTbuU3sxP2rhYIW3Gr+SFr/ry59z/+r/JhUVEqejZ77Y6F6pWvrtlOEfBzv
  ns+KXqf2JuGSbpfGE/uarn5XX6JpvsTw0vHDryUvvrK3UJy5pPmglA+ntOMYY4TY+ealjRW3L
  Z5uq1PN3ddqJS+ePTSyVc69uxrL9779Pvso1NSNtXbHf9ktCaNXTHjqBlzlqK0o6rnmftzrH4
  l8EQIdmyNUWIpzkg01GIuKk4EACxTWJwEAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-548.messagelabs.com!1684069544!196395!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15937 invoked from network); 14 May 2023 13:05:44 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-9.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 May 2023 13:05:44 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 122951AC;
	Sun, 14 May 2023 14:05:44 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 395A97B;
	Sun, 14 May 2023 14:05:42 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-protobuf: upgrade 4.22.4 -> 4.23.0
Date: Sun, 14 May 2023 21:05:20 +0800
Message-Id: <1684069520-12282-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1684069520-12282-1-git-send-email-wangmy@fujitsu.com>
References: <1684069520-12282-1-git-send-email-wangmy@fujitsu.com>
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 May 2023 13:05:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102575

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-protobuf_4.22.4.bb => python3-protobuf_4.23.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_4.22.4.bb => python3-protobuf_4.23.0.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_4.22.4.bb b/meta-python/recipes-devtools/python/python3-protobuf_4.23.0.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-protobuf_4.22.4.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_4.23.0.bb
index 1cdeb6a364..52f34cfa08 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_4.22.4.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_4.23.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=53dbfa56f61b90215a
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "21fbaef7f012232eb8d6cb8ba334e931fc6ff8570f5aaedc77d5b22a439aa909"
+SRC_URI[sha256sum] = "5f1eba1da2a2f3f7df469fccddef3cc060b8a16cfe3cc65961ad36b4dbcf59c5"
 
 # http://errors.yoctoproject.org/Errors/Details/184715/
 # Can't find required file: ../src/google/protobuf/descriptor.proto
-- 
2.34.1


