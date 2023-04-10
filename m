Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4EE4C77B6F
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 08:28:28 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.39448.1681115302965712593
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Apr 2023 01:28:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=l0KGL8uJ;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681115301; i=@fujitsu.com;
	bh=8sQsmAH7bGUZ/+lqARbCwoGYnIFzsvtxmhhYLzS9Kx4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=l0KGL8uJ8KTEedcz1TXKwlSH3alcb+gfbnO8bbOkKlrm7t0SFFMEBXZFa70yId+vq
	 ggogdNzrKalaIrC3Mfor1JLCpf4Spse/5Ju6Rsv5MuqfW+uIhRFlcX0eLI/EC3IVql
	 ZzVvZQXm7I9LcZXNRUn6PlrZKuQpq5Bev0PNXZiDqMZtwMuMxE0TwA0NneWYhdr8yK
	 Vb0L2pM3r3Gl+npv84VSii48ZfNuG9ZQ4B+IZgdh+ij9yulhekCKagNU/6U7WO41HK
	 ttklfb4bbXNeHVy2TwGeqcCB8T7tT+p/fJBhqvvdh6tvMMvFBxJx4XN4wYA+LM4Wmi
	 PwETaDRS0n0/Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8ORpLvkhHG
  KwdWXIhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aKT7wFc4QqHq38zNrAuFmgi5GLQ0jgIaNE
  8/NPTF2MnEDOFSaJ7+d0IBJ7GCV6z65iBUmwCUhJ3Lj/nw3EFhHQl1g6ew8ziM0soCLx4ncPO
  4gtLOAvMWvXLqAaDg4WAVWJJdP5QMK8Ak4SG+/sASuREFCQmPLwPVgrp4CzxLJrJ1gh9jpJLH
  /9iBGiXlDi5MwnLBDjJSQOvnjBDNGrKDH7cjMLhF0h0Tj9EBOErSZx9dwm5gmMgrOQtM9C0r6
  AkWkVo1lxalFZapGuiV5SUWZ6RkluYmaOXmKVbqJeaqluXn5RSYauoV5iebFeanGxXnFlbnJO
  il5easkmRmDgphQnpO1gbO37q3eIUZKDSUmUt4vLOEWILyk/pTIjsTgjvqg0J7X4EKMMB4eSB
  O/CA0A5waLU9NSKtMwcYBTBpCU4eJREeCuOAaV5iwsSc4sz0yFSpxgVpcR5a48DJQRAEhmleX
  BtsMi9xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYd9thoCk8mXklcNNfAS1mAlrM5WIAsrg
  kESEl1cDk0aPFrZc5ne9KjZXC33xpSWH5c7uqXQ6szdrAlTz3bIL8WbYa9vV7C60br1xbFKm3
  boe/dupKjjLGb0/vyVw2+hTUWvtBqTLZbM/yBUevHSrLnrT0+39P7xrLlGeyL6aHyClOabybK
  vzB71DZarkoP9VOudhf295Hykz8wB2Y6fqrpci2zMzUk2v/rSWzpu1/zmsx//GLI3/mrS5lX8
  2hz7P00HHh23tZa0/lSAe75G+0LmU8dVz5wD7fI7wZ909v2FfEN7tXwOG2/act3/5YFlp0/H/
  XzJJwy2LD+Wwp5i9hzpm7XzYJCM/bs1i7PPbQUhOr2O2a/yqXPJxxqWf3hrM1CzP6/57Prem2
  8HikxFKckWioxVxUnAgAxxBl4FcDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-732.messagelabs.com!1681115299!471853!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6775 invoked from network); 10 Apr 2023 08:28:20 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-18.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 08:28:20 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id C3B751CF
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 09:28:19 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id B87FE1C8
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 09:28:19 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 09:28:18 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-websockets: upgrade 10.4  -> 11.0.1
Date: Mon, 10 Apr 2023 16:27:42 +0800
Message-ID: <1681115263-24378-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681115263-24378-1-git-send-email-wangmy@fujitsu.com>
References: <1681115263-24378-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 08:28:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102013

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Use standard licence text and SPDX identifier.

Changelog:
==========
Bug fixes
----------
Restored the C extension in the source distribution.

Backwards-incompatible changes
-------------------------------
The Sans-I/O implementation was moved.
Sans-I/O protocol constructors now use keyword-only arguments.
Closing a connection without an empty close frame is OK.
serve() times out on the opening handshake after 10 seconds by default.

New features
-------------
websockets 10.0 introduces a implementation on top of threading.
Added open_timeout to serve().
Made it possible to close a server without closing existing connections.
Added select_subprotocol to customize negotiation of subprotocols in the Sans-I/O layer.

Improvements
--------------
Added platform-independent wheels.
Improved error handling in broadcast().
Set server_hostname automatically on TLS connections when providing a sock argument to connect().

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-websockets_10.4.bb => python3-websockets_11.0.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-websockets_10.4.bb => python3-websockets_11.0.1.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-websockets_10.4.bb b/meta-python/recipes-devtools/python/python3-websockets_11.0.1.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-websockets_10.4.bb
rename to meta-python/recipes-devtools/python/python3-websockets_11.0.1.bb
index fac4d7a42..06110d38b 100644
--- a/meta-python/recipes-devtools/python/python3-websockets_10.4.bb
+++ b/meta-python/recipes-devtools/python/python3-websockets_11.0.1.bb
@@ -2,11 +2,11 @@ SUMMARY = "An implementation of the WebSocket Protocol (RFC 6455)"
 HOMEPAGE = "https://github.com/aaugustin/websockets"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=78c2cc91e172ca96d6f8e4a76c739ec6"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=51924a6af4495b8cfaee1b1da869b6f4"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "eef610b23933c54d5d921c92578ae5f89813438fded840c2e9809d378dc765d3"
+SRC_URI[sha256sum] = "369410925b240b30ef1c1deadbd6331e9cd865ad0b8966bf31e276cc8e0da159"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.34.1


