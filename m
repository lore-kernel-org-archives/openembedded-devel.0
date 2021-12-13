Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51EE6C433FE
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 11:05:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.9672.1639393528402457838
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 03:05:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9ED5113E
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 03:05:22 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 64ECE3F793
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 03:05:22 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 11/12] srecord: remove obsolete support for renamed libtool
Date: Mon, 13 Dec 2021 11:05:10 +0000
Message-Id: <20211213110511.3274555-11-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211213110511.3274555-1-ross.burton@arm.com>
References: <20211213110511.3274555-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Dec 2021 11:05:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94326

libtool is now longer renamed to ${host}-libtool, so remove the changes
to support this.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-support/srecord/srecord_1.64.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/srecord/srecord_1.64.bb b/meta-oe/re=
cipes-support/srecord/srecord_1.64.bb
index 4c34fa1bc3..4a00be1baf 100644
--- a/meta-oe/recipes-support/srecord/srecord_1.64.bb
+++ b/meta-oe/recipes-support/srecord/srecord_1.64.bb
@@ -17,7 +17,7 @@ DEPENDS =3D "libtool-native boost groff-native"
=20
 inherit autotools-brokensep
=20
-EXTRA_OECONF =3D "--without-gcrypt LIBTOOL=3D${STAGING_BINDIR_CROSS}/${H=
OST_SYS}-libtool"
+EXTRA_OECONF =3D "--without-gcrypt"
=20
 # Set variable WITHOUT_DOC=3D0 to enable documentation generation
 EXTRA_OEMAKE =3D "WITHOUT_DOC=3D1"
--=20
2.25.1


