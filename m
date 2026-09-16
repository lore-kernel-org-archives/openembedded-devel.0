Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BE37C982C5
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 10:01:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11305.1789552863705826972
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Sep 2026 03:01:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=nPh+E3Zk;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B0C91152B
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Sep 2026 03:00:59 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E06253F86F
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Sep 2026 03:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789552863; bh=HdBCs0roDWxscq/afnHgMDqDnOucz7ef/sH1tk9PK/s=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=nPh+E3ZkeW1toGJ46C7IRx0l5KMmoCH7iEDwYS4WfoUE20GF98JqCrmss6TDXA1Yl
	 SEYjseQXjFNPjppmbwsc0srbMb0zrr3dOOHWsIELnNGKbpV+WzKurkn4YBb0/QhEQ6
	 xPU7cYqnc5nKeFMUkrGNXFPB0WsdOBZDxUIWv320=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 4/5] spice: clean up dependencies
Date: Wed, 16 Sep 2026 11:00:54 +0100
Message-ID: <20260916100056.1512426-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916100056.1512426-1-ross.burton@arm.com>
References: <20260916100056.1512426-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Sep 2026 10:01:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130083

We can disable building the tests, and remove a few build dependencies.

python3-six is no longer needed, remove that.

openssl is always required, add to DEPENDS.

Add lz4 PACKAGECONFIG as this is an option upstream, enabled by default
to preserve behaviour.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-support/spice/spice_0.16.0.bb            | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-networking/recipes-support/spice/spice_0.16.0.bb b/meta=
-networking/recipes-support/spice/spice_0.16.0.bb
index b4370084303..4d4086c1803 100644
--- a/meta-networking/recipes-support/spice/spice_0.16.0.bb
+++ b/meta-networking/recipes-support/spice/spice_0.16.0.bb
@@ -24,22 +24,22 @@ CVE_STATUS[CVE-2016-0749] =3D "fixed-version: patched=
 since 0.13.2"
 CVE_STATUS[CVE-2016-2150] =3D "fixed-version: patched since 0.13.2"
 CVE_STATUS[CVE-2018-10893] =3D "fixed-version: patched already, caused b=
y inaccurate CPE in the NVD database."
=20
-inherit meson gettext python3native python3-dir pkgconfig
+inherit meson pkgconfig python3native
=20
-DEPENDS =3D "spice-protocol jpeg pixman alsa-lib glib-2.0 gdk-pixbuf lz4=
 orc python3-pyparsing-native python3-six-native glib-2.0-native zlib"
-DEPENDS:append:class-nativesdk =3D " nativesdk-openssl"
-
-export PYTHON =3D "${STAGING_BINDIR_NATIVE}/python3-native/python3"
+DEPENDS =3D "spice-protocol glib-2.0 pixman openssl jpeg zlib python3-py=
parsing-native"
=20
 do_configure:prepend() {
 	echo ${PV} > ${S}/.tarball-version
 }
=20
+EXTRA_OEMESON =3D "-Dtests=3Dfalse"
+
 PACKAGECONFIG:class-native =3D ""
 PACKAGECONFIG:class-nativesdk =3D ""
-PACKAGECONFIG ?=3D "sasl opus smartcard gstreamer"
+PACKAGECONFIG ?=3D "lz4 sasl opus smartcard gstreamer"
=20
 PACKAGECONFIG[gstreamer] =3D "-Dgstreamer=3D1.0,-Dgstreamer=3Dno,gstream=
er1.0 gstreamer1.0-plugins-base"
+PACKAGECONFIG[lz4] =3D "-Dlz4=3Dtrue,-Dlz4=3Dfalse,lz4"
 PACKAGECONFIG[smartcard] =3D "-Dsmartcard=3Denabled,-Dsmartcard=3Ddisabl=
ed,libcacard,libcacard"
 PACKAGECONFIG[sasl] =3D "-Dsasl=3Dtrue,-Dsasl=3Dfalse,cyrus-sasl,"
 PACKAGECONFIG[opus] =3D "-Dopus=3Denabled,-Dopus=3Ddisabled,libopus,"
--=20
2.43.0


