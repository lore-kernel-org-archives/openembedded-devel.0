Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EB6AC433EF
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 23:00:32 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web08.3680.1651186828875416597
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 16:00:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: enedino.org, ip: 13.77.154.182,
 mailfrom: alejandro@enedino.org)
Received: from alsamon-xub.lan (cpe-70-112-59-126.austin.res.rr.com
 [70.112.59.126])
	by linux.microsoft.com (Postfix) with ESMTPSA id 7AE4920E99DD;
	Thu, 28 Apr 2022 16:00:27 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 7AE4920E99DD
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
To: openembedded-devel@lists.openembedded.org
Cc: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Subject: [PATCH] cryptsetup: Add luks2 related PACKAGECONFIGs
Date: Thu, 28 Apr 2022 17:00:12 -0600
Message-Id: <20220428230012.3467800-1-alejandro@enedino.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Apr 2022 23:00:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96850

Cryptsetup allows for certain luks2 related defaults to be
set for libcryptsetup, these include the default PBKDF
algorithm, memory limit for PBKDF2, parallel threads and
iteration time.

Add these options as PACKAGECONFIGs to cryptsetup while
setting variables defined as the current cryptsetup
defaults, making this change transparent for the user but
allow these knobs to be customized.

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.o=
rg>
---
 .../recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb    | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb b/meta=
-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb
index 8f9f663a3..7baca98cb 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb
@@ -44,6 +44,14 @@ PACKAGECONFIG:append:class-target =3D " \
     udev \
 "
=20
+
+# libcryptsetup default PBKDF algorithm, Argon2 memory cost (KB), parall=
el threads and iteration time (ms)
+LUKS2_PBKDF ?=3D "argon2i"
+LUKS2_MEMORYKB ?=3D "1048576"
+LUKS2_PARALLEL_THREADS ?=3D "4"
+LUKS2_ITERTIME ?=3D "2000"
+
+
 PACKAGECONFIG[keyring] =3D "--enable-keyring,--disable-keyring"
 PACKAGECONFIG[fips] =3D "--enable-fips,--disable-fips"
 PACKAGECONFIG[pwquality] =3D "--enable-pwquality,--disable-pwquality,lib=
pwquality"
@@ -69,6 +77,10 @@ PACKAGECONFIG[nss] =3D "--with-crypto_backend=3Dnss,,n=
ss"
 PACKAGECONFIG[kernel] =3D "--with-crypto_backend=3Dkernel"
 PACKAGECONFIG[nettle] =3D "--with-crypto_backend=3Dnettle,,nettle"
 PACKAGECONFIG[luks2] =3D "--with-default-luks-format=3DLUKS2,--with-defa=
ult-luks-format=3DLUKS1"
+PACKAGECONFIG[luks2-pbkdf] =3D "--with-luks2-pbkdf=3D${LUKS2_PBKDF}"
+PACKAGECONFIG[luks2-memorykb] =3D "--with-luks2-memory-kb=3D${LUKS2_MEMO=
RYKB}"
+PACKAGECONFIG[luks2-parallel-threads] =3D "--with-luks2-parallel-threads=
=3D${LUKS2_PARALLEL_THREADS}"
+PACKAGECONFIG[luks2-itertime] =3D "--with-luks2-iter-time=3D${LUKS2_ITER=
TIME}"
=20
 EXTRA_OECONF =3D "--enable-static"
 # Building without largefile is not supported by upstream
--=20
2.25.1


