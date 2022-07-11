Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84FBCCCA480
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 08:45:19 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web09.26165.1657529110170630666
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Jul 2022 01:45:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=XAOIY/o1;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1657529108; i=@fujitsu.com;
	bh=pSjaRSc4OlTmN0TZ41cNhSakxRdKwrtiCyRLZtFZ8So=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=XAOIY/o1WV357IQgaeA+U78lAmf3clnPZe+EJMq+xoJbsIPQbjzLSNTqBAX0s/gXB
	 winrY40T3HNT0AAx2sHLZJ2p73JRns9PvqWuYp/I4fUOUatmMLODN3relsrcwm7f+r
	 O3MrBhgd25OWKabE37Rip8vGpxuWjCZUY6K50+soNe4EoyLQ9EaPIgkYp7tbd9+3Sq
	 5vMXi0I5WsbH7bK5xpH6DTwwz8HjXA5cHchje1GVBJ6MSNWXYF5lsSKIYRliy8H04y
	 tRhRcjE47NUtxHCEPMB5S9Nktaq7pVtjee3oOci5sZeBwpO4K9HLaeHrHIY9VU2E0M
	 FzMeuTCrFYwZg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8MxSVfk8ek
  kg3nnmSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oznk5cwFrzgqZja08rSwLiUu4uRi0NI4Amj
  xKp529ggnOtMEj23tjB3MXICOXsYJa7M1wCx2QTUJKbfusEKYosI6Essnb0HrIZZQEXixe8ed
  hBbWMBB4uPLZSwgNouAqsSS6X/BangFnCTmzGplArElBBQkpjx8DxTn4OAUcJZY+AJqlZNE+8
  MWJohyQYmTM5+wQIyXkDj4AqJGQkBRYvblZhYIu0JixgyQm0FsNYmr5zYxT2AUnIWkfRaS9gW
  MTKsYrZOKMtMzSnITM3N0DQ0MdA0NTXWNLXSNDI30Eqt0E/VSS3XLU4tLdIHc8mK91OJiveLK
  3OScFL281JJNjMAgTilWu7KDcc+qn3qHGCU5mJREeYVPnk4S4kvKT6nMSCzOiC8qzUktPsQow
  8GhJMEr8xAoJ1iUmp5akZaZA4womLQEB4+SCO/VE0Bp3uKCxNzizHSI1ClGXY6ZX9sOMAux5O
  XnpUqJ854BmSEAUpRRmgc3AhbdlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ84Y8AprCk5l
  XArfpFdARTEBHxKWcADmiJBEhJdXApLvmT9zfF6ftPDUsOE7HhgQWTzbL+jTtcvWcxsgPrZd8
  Jx96u9vudlUU54GTf3bZvb1ZUv9uy3vz+ZFmh56LdYlJMClc+P7OOqCO5yOPm87v/HO3hTmv1
  CcKy3rMPG4sPMf50tt9aQHvJr7VELykvbx/+VFeo9PfF61Ysz1W29RqXWTD4cJ/f8UOf9nILz
  mJ0SX7Brvdm6QpD69wyzWwG21qUlri0m0+qevQtsjqppVPkv+Hy/M+SnvL4Nnv8VqzgzWjbY9
  4bkKzl1wh+7LVHT4B19P1JdRSQziZbcTc538TYVBaN2etWgsP46bdUg+4rn/fMPlx36x7E5p6
  trREbM9kVHzAuOyLgdfqsCmvlViKMxINtZiLihMBbepQN2kDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-571.messagelabs.com!1657529107!7136!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10361 invoked from network); 11 Jul 2022 08:45:08 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-6.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 11 Jul 2022 08:45:08 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id BB4BE1000C2
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Jul 2022 09:45:07 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id AE9AF100077
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Jul 2022 09:45:07 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 11 Jul 2022 09:45:06 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] gjs: upgrade 1.72.0 -> 1.72.1
Date: Mon, 11 Jul 2022 16:44:41 +0800
Message-ID: <1657529083-24142-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1657529083-24142-1-git-send-email-wangmy@fujitsu.com>
References: <1657529083-24142-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Jul 2022 08:45:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97803

Changelog:
===========
- Various fixes ported from the development branch.

- Closed bugs and merge requests:
  * Compilation error: call to deleted function 'js_value_to_c'
  * jsapi-util-strings: Ignore locale to compute the upper case of a
    char (i.e. fix implicit properties on Turkish locale)
  * Fix memory leak when passing a "transfer none" GBytes parameter to a
    native function
  * arg-cache: Do not leak an interface info structures on Callbacks
  * test-ci: Ignore safe directory errors on CI

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-gnome/recipes-gnome/gjs/{gjs_1.72.0.bb => gjs_1.72.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gjs/{gjs_1.72.0.bb => gjs_1.72.1.bb} (92%)

diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.72.0.bb b/meta-gnome/recipes-gnome/gjs/gjs_1.72.1.bb
similarity index 92%
rename from meta-gnome/recipes-gnome/gjs/gjs_1.72.0.bb
rename to meta-gnome/recipes-gnome/gjs/gjs_1.72.1.bb
index 95e4bd5cc..355894073 100644
--- a/meta-gnome/recipes-gnome/gjs/gjs_1.72.0.bb
+++ b/meta-gnome/recipes-gnome/gjs/gjs_1.72.1.bb
@@ -8,7 +8,7 @@ DEPENDS = "mozjs-91 cairo"
 
 inherit gnomebase gsettings gobject-introspection vala gettext features_check upstream-version-is-even pkgconfig
 
-SRC_URI[archive.sha256sum] = "3ef0caf716e3920dd61f7748f6d56e476cc0fc18351ad0548e7df1a0ab9bdcad"
+SRC_URI[archive.sha256sum] = "17c0b1ec3f096671ff8bfaba6e4bbf14198c7013c604bfd677a9858da079c0ab"
 SRC_URI += " \
     file://0001-Support-cross-builds-a-bit-better.patch \
     file://0002-meson.build-Do-not-add-dir-installed-tests-when-inst.patch \
-- 
2.25.1


