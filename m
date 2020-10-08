Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1400.1602173936571631092
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Oct 2020 09:18:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E42D1529
	for <openembedded-devel@lists.openembedded.org>; Thu,  8 Oct 2020 09:18:55 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0A4C23F70D
	for <openembedded-devel@lists.openembedded.org>; Thu,  8 Oct 2020 09:18:54 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/2] mpv: don't remove lua for aarch64 twice
Date: Thu,  8 Oct 2020 17:18:50 +0100
Message-Id: <20201008161850.3097336-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201008161850.3097336-1-ross.burton@arm.com>
References: <20201008161850.3097336-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

LUA_aarch64 is already unset, so there's no need to remove 'lua' from
PACKAGECONFIG again.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb b/meta-oe/r=
ecipes-multimedia/mplayer/mpv_0.32.0.bb
index 5273fc040..973a978b1 100644
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb
@@ -44,7 +44,6 @@ PACKAGECONFIG ??=3D " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)} \
 "
=20
-PACKAGECONFIG_remove_aarch64 =3D "lua"
 PACKAGECONFIG[x11] =3D "--enable-x11,--disable-x11,virtual/libx11"
 PACKAGECONFIG[xv] =3D "--enable-xv,--disable-xv,libxv"
 PACKAGECONFIG[opengl] =3D "--enable-gl,--disable-gl,virtual/libgl"
--=20
2.25.1

