Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE354C433F5
	for <webhook@archiver.kernel.org>; Tue,  3 May 2022 17:53:45 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web08.86.1651600417664239962
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 May 2022 10:53:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: enedino.org, ip: 13.77.154.182,
 mailfrom: alejandro@enedino.org)
Received: from alsamon-xub.lan (cpe-70-112-59-126.austin.res.rr.com
 [70.112.59.126])
	by linux.microsoft.com (Postfix) with ESMTPSA id 6BB0020EB0C3;
	Tue,  3 May 2022 10:53:36 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6BB0020EB0C3
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
To: openembedded-devel@lists.openembedded.org
Cc: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Subject: [PATCH v2] cryptsetup: Add luks2 configure options defaults
Date: Tue,  3 May 2022 11:53:30 -0600
Message-Id: <20220503175330.4086295-1-alejandro@enedino.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 May 2022 17:53:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96954

Cryptsetup allows for certain luks2 related defaults to be
set for libcryptsetup, these include the default PBKDF
algorithm, memory limit for Argon2, parallel threads and
iteration time.

Set default variables defined to the same values currently
coming from cryptsetup upstream, making this change transparent
for the user but allow these values to be customized.

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.o=
rg>
---
 .../recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb    | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb b/meta=
-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb
index 8f9f663a3..435b55477 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb
@@ -70,6 +70,7 @@ PACKAGECONFIG[kernel] =3D "--with-crypto_backend=3Dkern=
el"
 PACKAGECONFIG[nettle] =3D "--with-crypto_backend=3Dnettle,,nettle"
 PACKAGECONFIG[luks2] =3D "--with-default-luks-format=3DLUKS2,--with-defa=
ult-luks-format=3DLUKS1"
=20
+
 EXTRA_OECONF =3D "--enable-static"
 # Building without largefile is not supported by upstream
 EXTRA_OECONF +=3D "--enable-largefile"
@@ -78,6 +79,17 @@ EXTRA_OECONF +=3D "--disable-static-cryptsetup"
 # There's no recipe for libargon2 yet
 EXTRA_OECONF +=3D "--disable-libargon2"
=20
+# libcryptsetup default PBKDF algorithm, Argon2 memory cost (KB), parall=
el threads and iteration time (ms)
+LUKS2_PBKDF ?=3D "argon2i"
+LUKS2_MEMORYKB ?=3D "1048576"
+LUKS2_PARALLEL_THREADS ?=3D "4"
+LUKS2_ITERTIME ?=3D "2000"
+
+EXTRA_OECONF +=3D "--with-luks2-pbkdf=3D${LUKS2_PBKDF} \
+    --with-luks2-memory-kb=3D${LUKS2_MEMORYKB} \
+    --with-luks2-parallel-threads=3D${LUKS2_PARALLEL_THREADS} \
+    --with-luks2-iter-time=3D${LUKS2_ITERTIME}"
+
 FILES:${PN} +=3D "${@bb.utils.contains('DISTRO_FEATURES','systemd','${ex=
ec_prefix}/lib/tmpfiles.d/cryptsetup.conf', '', d)}"
=20
 RDEPENDS:${PN} =3D " \
--=20
2.25.1


