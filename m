Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F149C433F5
	for <webhook@archiver.kernel.org>; Thu, 18 Nov 2021 16:11:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.3702.1637251904514145144
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 08:11:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C2BAB1042
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 08:11:51 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C7AC3F766
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 08:11:51 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 18/19] python3-posix-ipc: remove spurious dependencies
Date: Thu, 18 Nov 2021 16:11:37 +0000
Message-Id: <20211118161138.663375-18-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211118161138.663375-1-ross.burton@arm.com>
References: <20211118161138.663375-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Nov 2021 16:11:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94043

pip isn't needed to build, and adding the empty string to RDEPENDS is
most certainly meaningless.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/python/python3-posix-ipc_1.0.5.bb | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-posix-ipc_1.0.5.=
bb b/meta-python/recipes-devtools/python/python3-posix-ipc_1.0.5.bb
index c46881cd47..d66ef0e3c4 100644
--- a/meta-python/recipes-devtools/python/python3-posix-ipc_1.0.5.bb
+++ b/meta-python/recipes-devtools/python/python3-posix-ipc_1.0.5.bb
@@ -13,13 +13,3 @@ SRC_URI[md5sum] =3D "8c9443859492ecf3aae9182aa6b5c78c"
 SRC_URI[sha256sum] =3D "6cddb1ce2cf4aae383f2a0079c26c69bee257fe2720f3722=
01ef047f8ceb8b97"
=20
 inherit setuptools3 pypi
-
-# DEPENDS_default: python-pip
-
-DEPENDS +=3D " \
-        ${PYTHON_PN}-pip \
-        "
-
-# RDEPENDS:default:
-RDEPENDS:${PN} +=3D " \
-        "
--=20
2.25.1


