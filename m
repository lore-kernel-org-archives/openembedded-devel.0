Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AFB2C36003
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 17:42:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1087.1742406121564355323
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Mar 2025 10:42:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5CB8E113E
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 10:42:09 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E3DA33F673
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 10:42:00 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2 11/12] redis: don't inherit autotools
Date: Wed, 19 Mar 2025 17:41:51 +0000
Message-ID: <20250319174152.706861-11-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250319174152.706861-1-ross.burton@arm.com>
References: <20250319174152.706861-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 17:42:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116096

This upstream does not in fact use autotools, so remove the inherit.

Also, clean up a oe_runmake to not require a subshell.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-extended/redis/redis_6.2.16.bb | 4 ++--
 meta-oe/recipes-extended/redis/redis_7.2.7.bb  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-extended/redis/redis_6.2.16.bb b/meta-oe/rec=
ipes-extended/redis/redis_6.2.16.bb
index 40473461a2..fbf2f04e3d 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.16.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.16.bb
@@ -20,7 +20,7 @@ SRC_URI =3D "http://download.redis.io/releases/${BP}.ta=
r.gz \
=20
 SRC_URI[sha256sum] =3D "846bff83c26d827d49f8cc8114ea9d1e72eea1169f7de36b=
8135ea2cec104e7d"
=20
-inherit autotools-brokensep update-rc.d systemd useradd
+inherit update-rc.d systemd useradd
=20
 FINAL_LIBS:x86:toolchain-clang =3D "-latomic"
 FINAL_LIBS:riscv32 =3D "-latomic"
@@ -37,7 +37,7 @@ GROUPADD_PARAM:${PN} =3D "--system redis"
 REDIS_ON_SYSTEMD =3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd',=
 'true', 'false', d)}"
=20
 do_compile:prepend() {
-    (cd deps && oe_runmake hiredis lua linenoise)
+    oe_runmake -C deps hiredis lua linenoise
 }
=20
 do_install() {
diff --git a/meta-oe/recipes-extended/redis/redis_7.2.7.bb b/meta-oe/reci=
pes-extended/redis/redis_7.2.7.bb
index 7efdebd905..c688e92cca 100644
--- a/meta-oe/recipes-extended/redis/redis_7.2.7.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.2.7.bb
@@ -22,7 +22,7 @@ SRC_URI[sha256sum] =3D "72c081e3b8cfae7144273d26d76736f=
08319000af46c01515cad5d2976
=20
 RPROVIDES:${PN} =3D "virtual-redis"
=20
-inherit autotools-brokensep pkgconfig update-rc.d systemd useradd
+inherit pkgconfig update-rc.d systemd useradd
=20
 FINAL_LIBS:x86:toolchain-clang =3D "-latomic"
 FINAL_LIBS:riscv32 =3D "-latomic"
@@ -42,7 +42,7 @@ PACKAGECONFIG[systemd] =3D "USE_SYSTEMD=3Dyes,USE_SYSTE=
MD=3Dno,systemd"
 EXTRA_OEMAKE +=3D "${PACKAGECONFIG_CONFARGS}"
=20
 do_compile:prepend() {
-    (cd deps && oe_runmake hiredis lua linenoise)
+    oe_runmake -C deps hiredis lua linenoise
 }
=20
 do_install() {
--=20
2.43.0


