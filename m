Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB260CD5BA4
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 18:55:26 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19974.1779303322536109745
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 May 2026 11:55:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: key syntax error: missing public key data" header.i=@rootcommit.com header.s=dkim header.b=ZovDrA5N;
 spf=pass (domain: rootcommit.com, ip: 185.246.84.56, mailfrom: michael.opdenacker@rootcommit.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1F83A1A363B
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 May 2026 18:55:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D25AB60019
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 May 2026 18:55:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0681F107EA396;
	Wed, 20 May 2026 20:55:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=dkim; t=1779303319; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=uUBmRcPmNe0mC8jg2AN+EgMHPdKM7Ly54ulkxCHKcIs=;
	b=ZovDrA5NUZirjnZP9oDyGpHFymL4csqV6IlYtP2H3GnDp3ohVu4AhBC0muUhmh7VEhMAfO
	HS31E/Bb2J/1px0uckYsqjraY20/8pGwZxShV2no4N4fOLH60fe0drXkRRTclgCvzmphgZ
	Z+l65E15L4vHWrI/zCSy9UB79U7H59/AdPM2JWJKwtR/nvo8kJGU8xI3mDdJ1r+adEDZWN
	vAU3WuaxBrNSY1nE6mA9zzI+xPtPFfiB3YrStQgoUR8Dm/7YT9y9LttBXeArjhHMYz0dG9
	FzZc7yGC/FOCWpus3VlyG3h65CgLhFDv/CKBSomhKbPa/yJp0/nQ+xFJfFZ6Sg==
From: michael.opdenacker@rootcommit.com
To: openembedded-devel@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: [meta-oe][scarthgap][PATCH] spectre-meltdown-checker: new recipe
Date: Wed, 20 May 2026 20:55:07 +0200
Message-ID: <20260520185508.2376683-1-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 May 2026 18:55:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127122

From: Michael Opdenacker <michael.opdenacker@rootcommit.com>

Backport from meta-oe master

Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
---
 .../spectre-meltdown-checker_26.33.0420460.bb | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-security/spectre-meltdown-checker/spe=
ctre-meltdown-checker_26.33.0420460.bb

diff --git a/meta-oe/recipes-security/spectre-meltdown-checker/spectre-me=
ltdown-checker_26.33.0420460.bb b/meta-oe/recipes-security/spectre-meltdo=
wn-checker/spectre-meltdown-checker_26.33.0420460.bb
new file mode 100644
index 0000000000..a97ae50013
--- /dev/null
+++ b/meta-oe/recipes-security/spectre-meltdown-checker/spectre-meltdown-=
checker_26.33.0420460.bb
@@ -0,0 +1,35 @@
+SUMMARY =3D "Hardware vulnerability and mitigation checker"
+DESCRIPTION =3D "\
+    Reptar, Downfall, Zenbleed, ZombieLoad, RIDL, Fallout, Foreshadow, S=
pectre, \
+    Meltdown vulnerability/mitigation checker for Linux & BSD \
+"
+HOMEPAGE =3D "https://github.com/speed47/spectre-meltdown-checker"
+BUGTRACKER =3D "https://github.com/speed47/spectre-meltdown-checker/issu=
es"
+LICENSE =3D "GPL-3.0-only"
+LIC_FILES_CHKSUM =3D "file://spectre-meltdown-checker.sh;beginline=3D2;e=
ndline=3D2;md5=3D3ae5399e70af7be9b93f72568069e2f4"
+
+SRC_URI =3D "git://github.com/speed47/spectre-meltdown-checker;protocol=3D=
https;branch=3Dmaster"
+SRCREV =3D "1c067add59115190e8d87313ff5899b29bff0ff3"
+
+S =3D "${WORKDIR}/git"
+
+# binutils: readelf,objdump might be used for deeper analysis
+# coreutils: dd with iflag=3Dskip_bytes oflag=3Dseek_bytes in some cases
+# kernel-dev: /boot/config is used
+# perl: sometimes used when other tools (dd, rdmsr/wdmsr) are missing
+RRECOMMENDS:${PN} =3D "\
+    binutils \
+    coreutils \
+    kernel-dev \
+    perl \
+"
+
+INHIBIT_DEFAULT_DEPS =3D "1"
+
+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
+
+do_compile[noexec] =3D "1"
+
+do_install() {
+    install -m 755 -D ${S}/${BPN}.sh ${D}${bindir}/${BPN}
+}

