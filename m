Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53E48C433FE
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 11:05:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9737.1639393519205505946
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 03:05:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 817C7D6E
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 03:05:20 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2CE693F793
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 03:05:20 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 07/12] xfsdump: remove obsolete support for renamed libtool
Date: Mon, 13 Dec 2021 11:05:06 +0000
Message-Id: <20211213110511.3274555-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211213110511.3274555-1-ross.burton@arm.com>
References: <20211213110511.3274555-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Dec 2021 11:05:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94321

libtool is now longer renamed to ${host}-libtool, so remove the changes
to support this.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.9.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.9.bb b/me=
ta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.9.bb
index 3e18fba74f..3b06730b70 100644
--- a/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.9.bb
+++ b/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.9.bb
@@ -25,8 +25,6 @@ PACKAGECONFIG[gettext] =3D "--enable-gettext=3Dyes,--en=
able-gettext=3Dno,gettext"
=20
 CFLAGS +=3D "-D_FILE_OFFSET_BITS=3D64"
=20
-EXTRA_OEMAKE +=3D "'LIBTOOL=3D${HOST_SYS}-libtool' V=3D1"
-
 do_configure () {
     export DEBUG=3D"-DNDEBUG"
     install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${=
S}
--=20
2.25.1


