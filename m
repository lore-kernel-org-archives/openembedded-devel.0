Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB819C636F8
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:56 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web09.9966.1649931549168749271
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 03:19:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=e/2PZYSd;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649931547; i=@fujitsu.com;
	bh=mVP+HQ5wLjLjAcJq18tqAQS81oWXXKV6uugYSxdujIw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=e/2PZYSd5UuVeL7cE3ihduVy4N/oRHSN7LpzQsGZQC4t5a76pqK/CzQYOL2/Daoth
	 XuHKDOAKW29xfZE8+FXMtvhZzkKnGxGZyRzpkpHsepSlmLlt10r+oQyk/PYTTfOftK
	 aTdI5R+hiH0QrCSJkXJoAWDgkys5wX17E4uQ9flYhbJfNyIBDBy9kX+pnM6opvp7Kw
	 KKK2SfgOGnEJ7CA+92CHDoVu09sM48fFChv1eJm50uJDFMGrAzH01aiitFZ/GSGOb7
	 XwxrQkdGP9iwdKazT1efJqD0/Er68LYKUxzxGOOLz/WE7kTKS4OqWiuUxb7hMTuVVl
	 YMcplNh/L0tgw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRWlGSWpSXmKPExsViZ8ORqCv9NTz
  JYGoHi8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvH/yTvGgu9cFfMm9bM3MD7k7GLk4hASeMIo
  cf3yGyYI5wKTxI173xkhnD2MEusfzQVyODnYBNQkpt+6wQpiiwjoSyydvYcZxGYWUJF48buHH
  cQWFnCQeNm+lAXEZhFQlei+cBEszivgJNE65RqYLSGgIDHl4XuwXk4BZ4kl/RfYQGwhoJqzq7
  qYIeoFJU7OfMICMV9C4uCLF8wQvYoSsy83s0DYFRKzZrUxQdhqElfPbWKewCg4C0n7LCTtCxi
  ZVjFaJxVlpmeU5CZm5ugaGhjoGhqa6hqb6hqaWOolVukm6qWW6panFpfoGukllhfrpRYX6xVX
  5ibnpOjlpZZsYgQGckqx8tQdjKdX/dQ7xCjJwaQkyqv5JjxJiC8pP6UyI7E4I76oNCe1+BCjD
  AeHkgTvgkdAOcGi1PTUirTMHGBUwaQlOHiURHjXvAVK8xYXJOYWZ6ZDpE4xKkqJ88Z8AkoIgC
  QySvPg2mCRfIlRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMC//F6ApPJl5JXDTXwEtZgJa/G1
  VKMjikkSElFQDk9N62fOarScOu8xt/v07rcZly8e2IIZ1Ilfqv/4XWf25cetGpfJwm/2LuLby
  frhsbf4jwrHCxKA1vr3k/g/TVxN/16hv3O+jGlnMtu1F8O9kTZv9MxXvTap13ZdudMewSX6R1
  SLPDpM9C7Qs1zX1nTvtZ3AstfvADpVDx+OYyqYFhWeuuOHZe1BX7J2Um3ZMY8bKe5vM63QFD6
  yxZtb8rFZ1X82tsV4oVzEg5udciYxLlW/sS+esZY5d3aX/LHKJuNzEJ+9ygqqWaDzpcXqqun9
  /aWj1yxWz52iZcwWntS1Y9yX21V659QYxG64/y1batfWGwrr9iTcP/v4uEq5kbvH97sbvQRNM
  /n/bW/veUImlOCPRUIu5qDgRADgAHrhfAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-571.messagelabs.com!1649931546!98637!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23023 invoked from network); 14 Apr 2022 10:19:07 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-2.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 14 Apr 2022 10:19:07 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id A8158100181
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 11:19:06 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 6FFB910019A
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 11:19:06 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 14 Apr 2022 11:19:02 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] thrift: upgrade 0.14.2 -> 0.16.0
Date: Thu, 14 Apr 2022 18:18:51 +0800
Message-ID: <1649931533-20183-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1649931533-20183-1-git-send-email-wangmy@fujitsu.com>
References: <1649931533-20183-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96649

Changelog:
==========
- C++ library don't work with HTTP (csharp server, cpp client; need cross test enhancement)
- Swift service generator doesn't support oneway

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../thrift/{thrift_0.14.2.bb => thrift_0.16.0.bb}              | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/thrift/{thrift_0.14.2.bb => thrift_0.16.0.bb} (93%)

diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.14.2.bb b/meta-oe/recipes-connectivity/thrift/thrift_0.16.0.bb
similarity index 93%
rename from meta-oe/recipes-connectivity/thrift/thrift_0.14.2.bb
rename to meta-oe/recipes-connectivity/thrift/thrift_0.16.0.bb
index 014613e5d6..2d601a2f9d 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift_0.14.2.bb
+++ b/meta-oe/recipes-connectivity/thrift/thrift_0.16.0.bb
@@ -11,8 +11,7 @@ DEPENDS = "thrift-native boost flex-native bison-native openssl zlib"
 SRC_URI = "https://www-eu.apache.org/dist/thrift//${PV}/${BPN}-${PV}.tar.gz \
            file://0001-DefineInstallationPaths.cmake-Define-libdir-in-terms.patch \
           "
-SRC_URI[md5sum] = "284a48df355aa3910687ee9b894d3ae8"
-SRC_URI[sha256sum] = "4191bfc0b7490e20cc69f9f4dc6e991fbb612d4551aa9eef1dbf7f4c47ce554d"
+SRC_URI[sha256sum] = "f460b5c1ca30d8918ff95ea3eb6291b3951cf518553566088f3f2be8981f6209"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.25.1


