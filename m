Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76239C64EC4
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 06:15:57 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.13476.1678428954048998512
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Mar 2023 22:15:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=i4wn5jx2;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678428952; i=@fujitsu.com;
	bh=hDXcxzzT1wScjXeSPlD/q0+vCcRs3QZsZQI+ejMkGEY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=i4wn5jx2IgCof5AUlHKVxr7C5O0SUAF7CYDkBbPknCX/who0wyd60gyP0qASSmmI1
	 AIoTtOHePIBtJhKdBZehNPDWJQkVO4/YM4mroRtHZvMnCMa7mmaugkJ9ewB4IKNrAf
	 xeIuUcdWErmGqvUdJDOJkBeUfp7FXpQnTu7rjBkpDtYU8jIrubrqbQ9gTLxcHevwls
	 fcyzki4MYvXzQBOvJVPT4NcoDT2g54q4RvGzCtUHLDcXuxDMWQ8PY1excE2jGMeoX/
	 r48ZPWLKLrwdGnupaZnhoNGJSWjss16HvBb3Lw3lFSXnBD5JkfnTjQnFJa2gf/SU00
	 7H+yTT9NLpqpQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8ORpCt+miv
  FYOpeaYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWNJzwG2gs08FRPuTmdvYLzG1cXIxSEk8JBR
  Yu7vXSwQzhUmiS8tC9i6GDmBnD2MEjuuyYDYbAJSEjfu/weLiwjoSyydvYcZxGYWUJF48buHH
  cQWFnCV+Hy2DcxmEVCV2HVpMSuIzSvgKLF95zRGEFtCQEFiysP3zBBxQYmTM5+wQMyRkDj44g
  UzRI2ixOzLzSwQdoVE4/RDTBC2msTVc5uYJzDyz0LSPgtJ+wJGplWMZsWpRWWpRbpmeklFmek
  ZJbmJmTl6iVW6iXqppbp5+UUlGbqGeonlxXqpxcV6xZW5yTkpenmpJZsYgcGYUpzweAfjvL6/
  eocYJTmYlER5lVO5UoT4kvJTKjMSizPii0pzUosPMcpwcChJ8O49AZQTLEpNT61Iy8wBRgZMW
  oKDR0mEl3UHUJq3uCAxtzgzHSJ1ilFRSpyX9ThQQgAkkVGaB9cGi8ZLjLJSwryMDAwMQjwFqU
  W5mSWo8q8YxTkYlYR5JUC282TmlcBNfwW0mAlo8a4tHCCLSxIRUlINTHO/cdQf0Vsk+k/uaE2
  ZTuJGUbG2HOm5izYGeejunLl2RoDlpZ8rfuuuM+xJX9Tfw1Wq+fN60JJTVbeza9eYTF2lq/I1
  Yi/LVKYTZ7hbJuotWNZyeu9m+/ce8xb8YeP6FNbor6Ad4Lb0st2q739sjQq+bYs3LOd+3G5i+
  O2k5QLlqf3rDN9HfTs0J0/1Txb/HfeVU45ofDO5m2y9yyuR4YLe8SeczA95TedfFBa1FvHqEP
  zU65OyK+9WpczT3lK/3tyjzFt0mj5fm3ToFdN3241T0v9and4zKzpX094nv4nvpnTp4YfTGdi
  570o6HP+oXrxr5pLQgtXP95Vq/Zx7R+ZjvlfJZMa9R1edXG8pxKnEUpyRaKjFXFScCADO7HgK
  QQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-728.messagelabs.com!1678428951!68603!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31892 invoked from network); 10 Mar 2023 06:15:51 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-4.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Mar 2023 06:15:51 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 9AC131AE
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 06:15:50 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 8BD431B2
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 06:15:50 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Fri, 10 Mar 2023 06:15:49 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 06/11] monit: upgrade 5.32.0 -> 5.33.0
Date: Fri, 10 Mar 2023 14:15:33 +0800
Message-ID: <1678428937-7700-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 06:15:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101478

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 New: Added click-jacking protection headers to Monit HTTP GUI (the SAMEORIGIN
      iframe is allowed).
 Fixed: Issue #1035: If the start, stop or restart program statement contains
        the equal sign, which is not followed by a space character, the
        configuration is not parsed correctly.
 Fixed: Issue #1047: If the MariaDB server doesn't allow access to the host,
        from which Monit test is running, Monit reported: Invalid handshake
         packet sequence id -- not MySQL protocol.
 Fixed: Add the missing responsetime option to the ping test.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/monit/{monit_5.32.0.bb => monit_5.33.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/monit/{monit_5.32.0.bb => monit_5.33.0.bb} (94%)

diff --git a/meta-oe/recipes-support/monit/monit_5.32.0.bb b/meta-oe/recipes-support/monit/monit_5.33.0.bb
similarity index 94%
rename from meta-oe/recipes-support/monit/monit_5.32.0.bb
rename to meta-oe/recipes-support/monit/monit_5.33.0.bb
index e4ec9d526..66d4079a9 100644
--- a/meta-oe/recipes-support/monit/monit_5.32.0.bb
+++ b/meta-oe/recipes-support/monit/monit_5.33.0.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
 	file://monitrc \
 "
 
-SRC_URI[sha256sum] = "1077052d4c4e848ac47d14f9b37754d46419aecbe8c9a07e1f869c914faf3216"
+SRC_URI[sha256sum] = "1ace889c0183473a9d70160df6533bb6e1338dc1354f5928507803e1e2a863b5"
 
 DEPENDS = "zlib bison-native libnsl2 flex-native openssl virtual/crypt"
 
-- 
2.34.1


