Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50F27C43219
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 11:05:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9737.1639393519205505946
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 03:05:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D28186D
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 03:05:18 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7D7AA3F793
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 03:05:18 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 04/12] php: remove obsolete support for renamed libtool
Date: Mon, 13 Dec 2021 11:05:03 +0000
Message-Id: <20211213110511.3274555-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211213110511.3274555-1-ross.burton@arm.com>
References: <20211213110511.3274555-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Dec 2021 11:05:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94318

libtool is now longer renamed to ${host}-libtool, so remove the changes
to support this.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-devtools/php/php_8.0.12.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/php/php_8.0.12.bb b/meta-oe/recipes=
-devtools/php/php_8.0.12.bb
index 4f484179cc..38771948f1 100644
--- a/meta-oe/recipes-devtools/php/php_8.0.12.bb
+++ b/meta-oe/recipes-devtools/php/php_8.0.12.bb
@@ -141,8 +141,8 @@ EOF
=20
 do_configure:append() {
     # No, libtool, we really don't want rpath set...
-    sed -i 's|^hardcode_libdir_flag_spec=3D.*|hardcode_libdir_flag_spec=3D=
""|g' ${HOST_SYS}-libtool
-    sed -i 's|^runpath_var=3DLD_RUN_PATH|runpath_var=3DDIE_RPATH_DIE|g' =
${HOST_SYS}-libtool
+    sed -i 's|^hardcode_libdir_flag_spec=3D.*|hardcode_libdir_flag_spec=3D=
""|g' libtool
+    sed -i 's|^runpath_var=3DLD_RUN_PATH|runpath_var=3DDIE_RPATH_DIE|g' =
libtool
 }
=20
 do_install:append:class-native() {
--=20
2.25.1


