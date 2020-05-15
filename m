Received: from first.geanix.com (first.geanix.com [116.203.34.67])
 by mx.groups.io with SMTP id smtpd.web10.11984.1589544883283006038
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 May 2020 05:14:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@geanix.com header.s=first header.b=Vfk0AxAC;
 spf=pass (domain: geanix.com, ip: 116.203.34.67, mailfrom: sean@geanix.com)
Received: from zen.localdomain (unknown [85.184.140.241])
	by first.geanix.com (Postfix) with ESMTPSA id 9AD4B2021F65;
	Fri, 15 May 2020 12:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
	t=1589544879; bh=xzRdOYJnoBfcduCBxFWWTwOH/NKfZJqqTjmjaX1RmXM=;
	h=From:To:Cc:Subject:Date;
	b=Vfk0AxAC2tEYGbxXuZ6uDdPwdWv86/1wDntFtCSP+A8ujVcPR3nLzDU/GLJfz2Jut
	 J+sR6LPRLTU4R/qoWfHlmvs5WPnEMUWvn/nbW1mvIVctIp7Jp1gZuC5H1or9KGzvHa
	 cgtRvdz4uUeV/BOu2RjyiwUhQt4zWi7J127j3ePKY9Ei1o3x0+NrvIhIbEPgvVK+nO
	 0/Lp1LWJ/0bWv9w1+AKuN1oSFWwcmQRzHhgBP3zVpMvZZVdlRTuhY22IwZCVhpd38L
	 oYfLiq/NdofXiN39yVLkB/F51GD9Y3FySAhHQAfKweIZjZbQ/OVZ6ASmKK87f5uF5J
	 SMYsqfpCYHnfw==
From: "Sean Nyekjaer" <sean@geanix.com>
To: openembedded-devel@lists.openembedded.org
Cc: Sean Nyekjaer <sean@geanix.com>,
	alistair23@gmail.com
Subject: [oe] [meta-oe] [PATCH] gpsd: fix build on aarch64
Date: Fri, 15 May 2020 14:14:36 +0200
Message-Id: <20200515121436.2078760-1-sean@geanix.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Spam-Status: No, score=-3.1 required=4.0 tests=ALL_TRUSTED,BAYES_00,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,URIBL_BLOCKED
	autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on fdf6823a942a
Content-Transfer-Encoding: quoted-printable

Explicitly add ${CC} as linker, for it to understand -Wl option.

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---

Alistair please check in your setup :)

 meta-oe/recipes-navigation/gpsd/gpsd_3.20.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.20.bb b/meta-oe/recip=
es-navigation/gpsd/gpsd_3.20.bb
index 0914f7ec2..5463c8231 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.20.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.20.bb
@@ -35,6 +35,7 @@ EXTRA_OESCONS =3D " \
     systemd=3D'${SYSTEMD_OESCONS}' \
     libdir=3D'${libdir}' \
     manbuild=3D'false' \
+    LINK=3D'${CC}' \
     ${PACKAGECONFIG_CONFARGS} \
 "
 # this cannot be used, because then chrpath is not found and only static=
 lib is built
@@ -44,6 +45,7 @@ do_compile_prepend() {
     export PKG_CONFIG_PATH=3D"${PKG_CONFIG_PATH}"
     export PKG_CONFIG=3D"PKG_CONFIG_SYSROOT_DIR=3D\"${PKG_CONFIG_SYSROOT=
_DIR}\" pkg-config"
     export STAGING_PREFIX=3D"${STAGING_DIR_HOST}/${prefix}"
+    export LD=3D"${CC}"
     export LINKFLAGS=3D"${LDFLAGS}"
 }
=20
@@ -51,6 +53,7 @@ do_install() {
     export PKG_CONFIG_PATH=3D"${PKG_CONFIG_PATH}"
     export PKG_CONFIG=3D"PKG_CONFIG_SYSROOT_DIR=3D\"${PKG_CONFIG_SYSROOT=
_DIR}\" pkg-config"
     export STAGING_PREFIX=3D"${STAGING_DIR_HOST}/${prefix}"
+    export LD=3D"${CC}"
     export LINKFLAGS=3D"${LDFLAGS}"
=20
     export DESTDIR=3D"${D}"
--=20
2.26.2

