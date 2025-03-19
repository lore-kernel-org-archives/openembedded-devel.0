Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D868C36001
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 17:41:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1079.1742406117776482431
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Mar 2025 10:41:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6EC9E113E
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 10:42:05 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id ED4613F673
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 10:41:56 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2 05/12] valkey: don't inherit autotools
Date: Wed, 19 Mar 2025 17:41:45 +0000
Message-ID: <20250319174152.706861-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250319174152.706861-1-ross.burton@arm.com>
References: <20250319174152.706861-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 17:41:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116090

This upstream does not in fact use autotools, so remove the inherit and
clean up do_compile().

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-extended/valkey/valkey_8.0.2.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-extended/valkey/valkey_8.0.2.bb b/meta-oe/re=
cipes-extended/valkey/valkey_8.0.2.bb
index af56e54590..04ed342556 100644
--- a/meta-oe/recipes-extended/valkey/valkey_8.0.2.bb
+++ b/meta-oe/recipes-extended/valkey/valkey_8.0.2.bb
@@ -23,7 +23,7 @@ S =3D "${WORKDIR}/git"
=20
 RPROVIDES:${PN} =3D "virtual-redis"
=20
-inherit autotools-brokensep pkgconfig update-rc.d systemd useradd
+inherit pkgconfig update-rc.d systemd useradd
=20
 FINAL_LIBS:x86:toolchain-clang =3D "-latomic"
 FINAL_LIBS:riscv32:toolchain-clang =3D "-latomic"
@@ -42,8 +42,9 @@ PACKAGECONFIG[systemd] =3D "USE_SYSTEMD=3Dyes,USE_SYSTE=
MD=3Dno,systemd"
=20
 EXTRA_OEMAKE +=3D "${PACKAGECONFIG_CONFARGS}"
=20
-do_compile:prepend() {
-    (cd deps && oe_runmake hiredis lua linenoise)
+do_compile() {
+    oe_runmake -C deps hiredis lua linenoise
+    oe_runmake
 }
=20
 do_install() {
--=20
2.43.0


