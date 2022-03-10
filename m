Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F197DC433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 13:25:26 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.9310.1646918726203772606
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Mar 2022 05:25:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6DEBA1691
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Mar 2022 05:25:25 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1CA193FA27
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Mar 2022 05:25:25 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/9] packagegroup-meta-python: add poetry-core and
 unattended-upgrade
Date: Thu, 10 Mar 2022 13:25:15 +0000
Message-Id: <20220310132523.2253188-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Mar 2022 13:25:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95923

These were missing from the packagegroup.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-core/packagegroups/packagegroup-meta-python.bb      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-pyt=
hon.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.=
bb
index 9626231bba..86bf6db30b 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -280,6 +280,7 @@ RDEPENDS:packagegroup-meta-python3 =3D "\
     python3-pkcs11 \
     python3-pkgconfig \
     python3-ply \
+    python3-poetry-core \
     python3-pocketsphinx \
     python3-polyline \
     python3-portalocker \
@@ -475,6 +476,7 @@ RDEPENDS:packagegroup-meta-python3 =3D "\
     python3-yarl \
     python3-zopeinterface \
     telepathy-python3 \
+    unattended-upgrades \
 "
 RDEPENDS:packagegroup-meta-python3:remove:libc-musl:powerpc64le =3D "pyt=
hon3-grpcio python3-grpcio-tools"
=20
--=20
2.25.1


