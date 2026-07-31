Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2975C55173
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 19:19:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3633.1785525565514547957
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Jul 2026 12:19:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=IJN1v1Q7;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F0A63152B
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jul 2026 12:19:20 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 959553F66F
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jul 2026 12:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785525564; bh=hh66liK6BxJIf/brMC4rNTXfduGipF7QCEGBFPQnyvo=;
	h=From:To:Subject:Date:From;
	b=IJN1v1Q7zEncsjfwpobE4Rfh2AzrlEY9+mzwbCrwUHGKvqjAJoaXIXgh/ur5eFEiL
	 Vb3jGxp93i5Cg4uj6QfZEh+bhTwr6sb1Jz8gmPxEmBqAVgcqPSqE5MMUDIRk+hX0PE
	 TJJsTXLK0TXHvDtVwbQZIkawJO1uJ+780nV2mAJs=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] xmlrpc: fix Upstream-Status
Date: Fri, 31 Jul 2026 20:19:23 +0100
Message-ID: <20260731191923.2167249-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Jul 2026 19:19:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128594

This patch has now been upstreamed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../0001-test-cpp-server_abyss-Fix-build-with-clang-libc.patch  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0001-test-cpp-ser=
ver_abyss-Fix-build-with-clang-libc.patch b/meta-oe/recipes-devtools/xmlr=
pc-c/xmlrpc-c/0001-test-cpp-server_abyss-Fix-build-with-clang-libc.patch
index 531f0d45fb..4ae81a762e 100644
--- a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0001-test-cpp-server_aby=
ss-Fix-build-with-clang-libc.patch
+++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0001-test-cpp-server_aby=
ss-Fix-build-with-clang-libc.patch
@@ -8,7 +8,7 @@ Subject: [PATCH] test/cpp/server_abyss: Fix build with cl=
ang/libc++
         rc =3D bind(this->fd, (struct sockaddr *)&sockAddr, sizeof(sockA=
ddr));
              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
=20
-Upstream-Status: Pending
+Upstream-Status: Backport [r3258]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
=20
 Rebase to 1.64.0
--=20
2.43.0


