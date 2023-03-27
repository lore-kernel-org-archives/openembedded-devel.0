Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 099EFC74A5B
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 03:05:47 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.26482.1679886342277980803
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Mar 2023 20:05:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=pBivOQ4s;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679886340; i=@fujitsu.com;
	bh=ed/AXKJFy1Fmwg9kukK8wB4PfFed1p3HUMPaYvnDZ6M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=pBivOQ4sDwkhvf6FpzE17B6R6HUtcsSfNYT5x4vjIUrfKEd4f2dkldD7qoi5wLObm
	 MOCJrHeTSyF+KtxLTMah6B2Qlda3l3fO0u+i9d06umTsjKIRGTCTIb7ZrlrJIvpDJk
	 yhpv2SNS2anrjf+v8JDEeEOud4TGU4QNzsJWyOu5dtaZDmB1uvawoPx++E3tBTvgIO
	 oXPMbNtw9ukpQtfX+JLQ/MSFfD7gwrD+Twwdia0wKMjjoJ2dw/uQZ198h0bnIuE6P9
	 RAgJCHI9LlRgCsXD+snclxfliYJsn6XNbBRYq4TUcXfSceI6ts4POgwmJ6UcoE5rGD
	 B+QgRM2WgXuug==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8ORqMvMoZh
  i8KDVxOLi4aXMDowe5zauYAxgjGLNzEvKr0hgzWg+coC5YD9/xe/FC9kbGF/ydjFycQgJPGGU
  eHXrHjuEc51JYubVtcwQzh5Gia6be9i6GDk52ASkJG7c/w9miwjoSyydvYcZxGYWUJF48buHH
  cQWFnCVWN61h7WLkYODRUBV4t1KDZAwr4CTxMQtC1hBbAkBBYkpD9+DtXIKOEt8/vAUzBYCqr
  m2cwU7RL2gxMmZT1ggxktIHHzxghmiV1Fi9uVmFgi7QqJx+iEmCFtN4uq5TcwTGAVnIWmfhaR
  9ASPTKkbT4tSistQiXVO9pKLM9IyS3MTMHL3EKt1EvdRS3fLU4hJdI73E8mK91OJiveLK3OSc
  FL281JJNjMDQTSlW27WDcULfX71DjJIcTEqivNFu8ilCfEn5KZUZicUZ8UWlOanFhxhlODiUJ
  Hhd2BRThASLUtNTK9Iyc4BxBJOW4OBREuFd80shRYi3uCAxtzgzHSJ1ilFRSpz3E0ifAEgioz
  QPrg0Wu5cYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfO2gkzhycwrgZv+CmgxE9DibwVgi0s
  SEVJSDUzb9C2Cvlh0c7e+XGB74dAnNftfVnpVfLL5T1nb+y41nP++R2nF9r3hh2zz/3tuncow
  e3r25pQ0IakI+UwtW6ntDQW/ApUuldvJC7tMUHjcKZ/j1Ni/fN/uTtXJstpcLJ/lD3lsWTp7b
  uKeM/zmezor0xKnzdXNXyKg6+QvMvklmzg7i7JCYvtG+7fvZGp28DMof1hycEezYkT1xuhXHn
  HXz/c2xb71CZxeMc3YYtfOF4HLelTX6fftvFKq7J4p3Pfc/M+/64EsrtdmXrOdF/X+duv6JdL
  zb/nt37xvvsv3WaXsAee7LkfO6En45ZZ+V2TGsve/9VQ+sx2dbSIh/o1petbkhT2eoduuCV5U
  iVdiKc5INNRiLipOBAAYBmbgWAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-571.messagelabs.com!1679886339!451944!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22741 invoked from network); 27 Mar 2023 03:05:39 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-6.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Mar 2023 03:05:39 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 8F0841001A4
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 04:05:39 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 8318B1001A3
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 04:05:39 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 27 Mar 2023 04:05:37 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] glibmm-2.68: upgrade 2.74.0 -> 2.76.0
Date: Mon, 27 Mar 2023 11:05:19 +0800
Message-ID: <1679886322-20954-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1679886322-20954-1-git-send-email-wangmy@fujitsu.com>
References: <1679886322-20954-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 03:05:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101760

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Glib:
* Dispatcher: Don't warn when a Dispatcher is deleted while
  messages are pending.
* Dispatcher: Add const versions of emit() and operator()()
  and deprecate the non-const versions.
* Module: Deprecate build_path()
* Binding: Fix the bind_property() with two transformation functions
* Add the GLIBMM_CHECK_VERSION() preprocessor macro

Gio:
* ListModel: Add get_typed_object()
* NetworkMonitor::get_default(): Add refreturn
* AppInfo: Add get_[recommended|fallback]_for_type()
* Add BytesIcon
* ListStore: Rename a local variable
* Settings: Add bind() with mapping functions and unbind()

Documentation:
* Glib::Binding::unbind(): Fix documentation

gmmproc:
* generate_wrap_init.pl.in: Disable warning C4273 on Visual Studio

Tests:
* Fix giomm_simple test on Windows

Meson build:
* Detect if we build from a git subtree
* Don't copy files with configure_file()

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../glib-2.0/{glibmm-2.68_2.74.0.bb => glibmm-2.68_2.76.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/glib-2.0/{glibmm-2.68_2.74.0.bb => glibmm-2.68_2.76.0.bb} (90%)

diff --git a/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.74.0.bb b/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.76.0.bb
similarity index 90%
rename from meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.74.0.bb
rename to meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.76.0.bb
index 5028a8bb8..ac55ceb80 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.74.0.bb
+++ b/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.76.0.bb
@@ -13,7 +13,7 @@ inherit gnomebase
 
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
-SRC_URI[archive.sha256sum] = "2b472696cbac79db8e405724118ec945219c5b9b18af63dc8cfb7f1d89b0f1fa"
+SRC_URI[archive.sha256sum] = "8637d80ceabd94fddd6e48970a082a264558d4ab82684e15ffc87e7ef3462ab2"
 
 S = "${WORKDIR}/${GNOMEBN}-${PV}"
 
-- 
2.34.1


