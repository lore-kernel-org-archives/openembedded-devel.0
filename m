Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D70B3C77B7A
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 07:40:40 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.8559.1685518836650991592
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 00:40:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="106644029"
X-IronPort-AV: E=Sophos;i="6.00,205,1681138800"; 
   d="scan'208";a="106644029"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 16:40:33 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id C8CDDCD6C2
	for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 16:40:31 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0848FD3F3D
	for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 16:40:31 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5726568957;
	Wed, 31 May 2023 16:40:30 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] eog: upgrade 44.1 -> 44.2
Date: Wed, 31 May 2023 15:40:00 +0800
Message-Id: <1685518820-20028-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685518820-20028-1-git-send-email-wangmy@fujitsu.com>
References: <1685518820-20028-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27662.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27662.006
X-TMASE-Result: 10--4.778500-10.000000
X-TMASE-MatchedRID: eWs1WpfTtqCjz0nOeth/yUmSRRbSc9s3kdS3kPlaZyXkABvhO7aBvqTz
	q4wH3yI22GcSxE3tAnfOXKeO1wPAIh2P280ZiGmRuce7gFxhKa2XBPRemiwRNb5/tqn0MloN7v0
	MlFSLfmmiJGJGoluOFgFd21k9Z8naL/tBTZzO5Q0ZgmFGHqyx6x+KaaVwAG43+P39ZekX4LKIwP
	rAH8iLMlYN5baMCdFIH9OMn5RABnOUaXoPdxGAMbQJVdi+qYBRO8fk7n+zHAxGQgIVrmBL5Mxme
	x8p4qoCmZlDPk9oSwXTqvKYOU9Msa1i/8UCZ5uOngIgpj8eDcAZ1CdBJOsoY8RB0bsfrpPIcSqb
	xBgG0w5Vi3AT91sVURjhiNYnTUwnxbyhjKrKjNP6qkyXsear0iuw+/aF7mBAqDgM9b7KoGYYQMg
	9qUX/82wfpQCoXIQh1Rg1kHEbxJuCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 07:40:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102906

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Replace-filename-with-basename.patch
removed since it's included in 44.2

Changelog:
==========
- EogWindow: Fix refcount and signal handler issues around
  GSettings handles
- Replace filename with basename

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-Replace-filename-with-basename.patch | 48 -------------------
 .../eog/{eog_44.1.bb => eog_44.2.bb}          |  3 +-
 2 files changed, 1 insertion(+), 50 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/eog/eog/0001-Replace-filename-with-basename.patch
 rename meta-gnome/recipes-gnome/eog/{eog_44.1.bb => eog_44.2.bb} (82%)

diff --git a/meta-gnome/recipes-gnome/eog/eog/0001-Replace-filename-with-basename.patch b/meta-gnome/recipes-gnome/eog/eog/0001-Replace-filename-with-basename.patch
deleted file mode 100644
index 26d75780b..000000000
--- a/meta-gnome/recipes-gnome/eog/eog/0001-Replace-filename-with-basename.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From d00edda1f57f904e1590828bea3cedb53d789c48 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 24 May 2023 20:33:59 -0700
-Subject: [PATCH] Replace filename with basename
-
-This avoids emitting absolute paths into generated sourcecode, it
-improves reproducibility. See [1]
-
-[1] https://developer-old.gnome.org/gobject/stable/glib-mkenums.html
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/eog/-/merge_requests/154]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/eog-enum-types.c.template | 4 ++--
- src/eog-enum-types.h.template | 2 +-
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/eog-enum-types.c.template b/src/eog-enum-types.c.template
-index 0249baf..1013dcf 100644
---- a/src/eog-enum-types.c.template
-+++ b/src/eog-enum-types.c.template
-@@ -4,8 +4,8 @@
- /*** END file-header ***/
- 
- /*** BEGIN file-production ***/
--/* enumerations from "@filename@" */
--#include "@filename@"
-+/* enumerations from "@basename@" */
-+#include "@basename@"
- 
- /*** END file-production ***/
- 
-diff --git a/src/eog-enum-types.h.template b/src/eog-enum-types.h.template
-index bc3c195..8f4e916 100644
---- a/src/eog-enum-types.h.template
-+++ b/src/eog-enum-types.h.template
-@@ -8,7 +8,7 @@ G_BEGIN_DECLS
- /*** END file-header ***/
- 
- /*** BEGIN file-production ***/
--/* Enumerations from "@filename@" */
-+/* Enumerations from "@basename@" */
- 
- /*** END file-production ***/
- 
--- 
-2.40.1
-
diff --git a/meta-gnome/recipes-gnome/eog/eog_44.1.bb b/meta-gnome/recipes-gnome/eog/eog_44.2.bb
similarity index 82%
rename from meta-gnome/recipes-gnome/eog/eog_44.1.bb
rename to meta-gnome/recipes-gnome/eog/eog_44.2.bb
index 0b7cfca49..110e73fd4 100644
--- a/meta-gnome/recipes-gnome/eog/eog_44.1.bb
+++ b/meta-gnome/recipes-gnome/eog/eog_44.2.bb
@@ -22,8 +22,7 @@ inherit gnomebase pkgconfig gsettings gobject-introspection gettext mime-xdg fea
 # FIXME: whilst eog uses libpeas <2, g-i is needed. This can be removed when libpeas2 is used.
 REQUIRED_DISTRO_FEATURES = "opengl gobject-introspection-data"
 
-SRC_URI += "file://0001-Replace-filename-with-basename.patch"
-SRC_URI[archive.sha256sum] = "e2c963f232fe5a1091dcc18bec25a730e91b02af6e466601efa55e500cd74cab"
+SRC_URI[archive.sha256sum] = "468f539f6b67ee46188170f244480cc311dd1efe4786fe1554bffe26a65c72c4"
 
 GTKDOC_MESON_OPTION = "gtk_doc"
 
-- 
2.34.1


