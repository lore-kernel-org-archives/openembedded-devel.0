Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31FC8C64ED6
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 10:43:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.87205.1677494614328220646
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Feb 2023 02:43:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D26A6C14;
	Mon, 27 Feb 2023 02:44:16 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3AEE03F881;
	Mon, 27 Feb 2023 02:43:33 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] liburing: enable native/nativesdk builds
Date: Mon, 27 Feb 2023 10:43:31 +0000
Message-Id: <20230227104331.662191-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 10:43:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101295

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-support/liburing/liburing_2.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/liburing/liburing_2.3.bb b/meta-oe/r=
ecipes-support/liburing/liburing_2.3.bb
index ba9b7480ce..7d8c2f596d 100644
--- a/meta-oe/recipes-support/liburing/liburing_2.3.bb
+++ b/meta-oe/recipes-support/liburing/liburing_2.3.bb
@@ -29,3 +29,5 @@ do_configure() {
 do_install () {
     oe_runmake install DESTDIR=3D${D}
 }
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


