Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1519E77181
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 17:26:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.107810.1733765192062669946
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Dec 2024 09:26:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C2A3A175D
	for <openembedded-devel@lists.openembedded.org>; Mon,  9 Dec 2024 09:26:59 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6558A3F720
	for <openembedded-devel@lists.openembedded.org>; Mon,  9 Dec 2024 09:26:31 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/7] syzkaller: network in compile is not needed
Date: Mon,  9 Dec 2024 17:26:21 +0000
Message-ID: <20241209172626.4144686-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241209172626.4144686-1-ross.burton@arm.com>
References: <20241209172626.4144686-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Dec 2024 17:26:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114250

There appears to be no more network access in the compile task, so we
can remove the flag.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-test/syzkaller/syzkaller_git.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-oe/recipes-test/syzkaller/syzkaller_git.bb b/meta-oe/re=
cipes-test/syzkaller/syzkaller_git.bb
index 4043ab7ea5..ef76a37891 100644
--- a/meta-oe/recipes-test/syzkaller/syzkaller_git.bb
+++ b/meta-oe/recipes-test/syzkaller/syzkaller_git.bb
@@ -17,10 +17,6 @@ SRCREV =3D "25905f5d0a2a7883bd33491997556193582c6059"
 UPSTREAM_CHECK_COMMITS =3D "1"
=20
 export GOPROXY =3D "https://proxy.golang.org,direct"
-# Workaround for network access issue during compile step.
-# This needs to be fixed in the recipes buildsystem so that
-# it can be accomplished during do_fetch task.
-do_compile[network] =3D "1"
=20
 COMPATIBLE_HOST =3D "(x86_64|i.86|arm|aarch64).*-linux"
=20
--=20
2.43.0


