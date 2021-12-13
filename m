Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54619C433F5
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 11:05:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.9666.1639393523623410328
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 03:05:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D642D6E
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 03:05:23 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ECC443F793
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 03:05:22 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 12/12] apache-websocket: remove obsolete support for renamed
 libtool
Date: Mon, 13 Dec 2021 11:05:11 +0000
Message-Id: <20211213110511.3274555-12-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211213110511.3274555-1-ross.burton@arm.com>
References: <20211213110511.3274555-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Dec 2021 11:05:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94324

libtool is now longer renamed to ${host}-libtool, so remove the changes
to support this.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-httpd/apache-mod/apache-websocket_git.bb           | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git=
.bb b/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb
index cf6e28a20c..040788609e 100644
--- a/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb
+++ b/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb
@@ -21,8 +21,7 @@ S =3D "${WORKDIR}/git"
=20
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2ee41112a44fe7014dce33e26468b=
a93"
=20
-EXTRA_OECONF =3D "APACHECTL=3D${STAGING_DIR_TARGET}${sbindir}/apachectl =
\
-                LIBTOOL=3D${STAGING_DIR_TARGET}${bindir_crossscripts}/${=
HOST_SYS}-libtool"
+EXTRA_OECONF =3D "APACHECTL=3D${STAGING_DIR_TARGET}${sbindir}/apachectl"
=20
 do_install() {
     install -d ${D}${libexecdir}/apache2/modules
--=20
2.25.1


