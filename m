Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B5BAC4321E
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 11:05:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.9664.1639393520254811192
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 03:05:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 151BE6D
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 03:05:21 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B4C163F793
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 03:05:20 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 08/12] unbound: remove obsolete support for renamed libtool
Date: Mon, 13 Dec 2021 11:05:07 +0000
Message-Id: <20211213110511.3274555-8-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211213110511.3274555-1-ross.burton@arm.com>
References: <20211213110511.3274555-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Dec 2021 11:05:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94322

libtool is now longer renamed to ${host}-libtool, so remove the changes
to support this.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-networking/recipes-support/unbound/unbound_1.13.2.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-networking/recipes-support/unbound/unbound_1.13.2.bb b/=
meta-networking/recipes-support/unbound/unbound_1.13.2.bb
index 4eb313ad09..61a75d71f4 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.13.2.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.13.2.bb
@@ -22,9 +22,7 @@ RDEPENDS:${PN} =3D "bash openssl-bin daemonize"
 S =3D "${WORKDIR}/git"
=20
 EXTRA_OECONF =3D "--with-libexpat=3D${STAGING_EXECPREFIXDIR} \
-		--with-ssl=3D${STAGING_EXECPREFIXDIR} \
-		libtool=3D${HOST_SYS}-libtool \
-"
+		--with-ssl=3D${STAGING_EXECPREFIXDIR}"
 	=09
=20
 PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'largefile sy=
stemd', d)}"
--=20
2.25.1


