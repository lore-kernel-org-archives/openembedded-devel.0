Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CC34C7EE23
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 10:23:28 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.103806.1683541398751364166
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 03:23:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=vGklmkNP;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1683541398; i=@fujitsu.com;
	bh=N5ve1C7Z+V7bSPERZI+YMJf0fwryVyfunUZxg1N1Fd8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=vGklmkNPy7Rb3mKXfQLJNb3UsfBJ03lWy7qFAOqUli3gj+0UfxTENMQbiqelc33By
	 WaXVZM1vRaDKVizLxNBr1qHs9NmEoAW8hbc2wDSztWSC2ctC+iCXNZQZk3Kqbkws3P
	 DkeJFRsvGH3m6xPWCqL0VTGCCPDX459ARRZkO3qxWXduVR9lUgzugDEi/UjMsgl9sw
	 +6k0i3jsUs5k0srbjJ06ILACfcjlZCI+XkbXCLgvFNuWxg/VKjtkz9k6bSfN/WtmJk
	 AzecqFN1mSJp+grvpU1btqOpNXt91/ruJLJXO3FM9K6slxmGvIjLEqbS4BIZ5Gsk6t
	 iDOEHrwfUn59A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrALMWRWlGSWpSXmKPExsViZ8ORpDvtbES
  KwcY1rBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bVy3dYCx5xVvzZMJulgbGDs4uRk0NIYCOj
  xLpdsl2MXED2NCaJU/O/s4Mk2AQkJKbvPQlmiwjoSnz8MJcRxGYWUJGYMfkIE4gtLOAncbf5P
  1gNi4CqxPnufrA4r4CTxI8dL8DqJQQUJKY8fM8MYnMKOEt8fb2BBWKxk0R372x2iBo1iavnNj
  FPYORZwMiwitG0OLWoLLVI11QvqSgzPaMkNzEzRy+xSjdRL7VUtzy1uETXSC+xvFgvtbhYr7g
  yNzknRS8vtWQTIzAgUooVjXYwPtn5V+8QoyQHk5Ior+nBsBQhvqT8lMqMxOKM+KLSnNTiQ4wy
  HBxKErwupyNShASLUtNTK9Iyc4DBCZOW4OBREuGVPQKU5i0uSMwtzkyHSJ1iVJQS5+U7A5QQA
  ElklObBtcEi4hKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYV4GkCk8mXklcNNfAS1mAlrsfz
  kcZHFJIkJKqoGpqmGKI0/L8W0iu/R/cxv1dPHt+5qsnC9StDlKT3p67gM2mZak74s2t/IUH2f
  nP6n+4Q8z51/n/KsZk75nz7rk6GOjFyD5/ZBlxXUDbs7PvzSEt78szH8ex17q/ONgdZ9//s2G
  2qO/bFW0FzY9tj734wLXXuVJutsjr/AsPsa1wsFw9o3LK7oydhrN/WRVIJfm3LhA36v1QOr66
  L8Nl6SZBac2bpm3SatbwvJcruZWpcszssQSAzLmsSn9u3i3fEHQWfnX/Ikfar4tDnb9bG3EtU
  rZ4FVccv5nHVeVDX/+LLJe8aVbcbZ0X6px5VX2l/Zplc0/S/jdvZ0l5/+b83ve3w2/OO20Kgr
  quHJXyiuxFGckGmoxFxUnAgA5HcKhAwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-565.messagelabs.com!1683541397!183104!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18794 invoked from network); 8 May 2023 10:23:18 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-17.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 May 2023 10:23:18 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id C71A11D2;
	Mon,  8 May 2023 11:23:17 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id EE4941D5;
	Mon,  8 May 2023 11:23:16 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-protobuf: upgrade 4.22.3 -> 4.22.4
Date: Mon,  8 May 2023 18:23:03 +0800
Message-Id: <1683541384-25689-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1683541384-25689-1-git-send-email-wangmy@fujitsu.com>
References: <1683541384-25689-1-git-send-email-wangmy@fujitsu.com>
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 10:23:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102419

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-protobuf_4.22.3.bb => python3-protobuf_4.22.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_4.22.3.bb => python3-protobuf_4.22.4.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_4.22.3.bb b/meta-python/recipes-devtools/python/python3-protobuf_4.22.4.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-protobuf_4.22.3.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_4.22.4.bb
index 5b2ff302ce..1cdeb6a364 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_4.22.3.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_4.22.4.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=53dbfa56f61b90215a
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "23452f2fdea754a8251d0fc88c0317735ae47217e0d27bf330a30eec2848811a"
+SRC_URI[sha256sum] = "21fbaef7f012232eb8d6cb8ba334e931fc6ff8570f5aaedc77d5b22a439aa909"
 
 # http://errors.yoctoproject.org/Errors/Details/184715/
 # Can't find required file: ../src/google/protobuf/descriptor.proto
-- 
2.34.1


