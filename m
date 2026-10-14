Return-Path: <james@codeconstruct.com.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1981CC6B27
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 07:53:39 +0000 (UTC)
Received: from codeconstruct.com.au (codeconstruct.com.au [203.29.241.158])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8314.1791964412517696387
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 00:53:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@codeconstruct.com.au header.s=2022a header.b=GQyyd8oh;
 spf=pass (domain: codeconstruct.com.au, ip: 203.29.241.158, mailfrom: james@codeconstruct.com.au)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1791964408;
	bh=6hBC/khF04eMPYgGnAOL/bKF49gItK4vzVcXMIuoCGU=;
	h=From:To:Cc:Subject:Date;
	b=GQyyd8oh5/Is4qdDmIoy/nD9/0/kQsV6WkhLve84zFUEyUVFJIrF+EVZZGQtnuPMe
	 bisqa1uDZL6FOOH1sBw0uwN5ao/VSUcTByU+/IzTa41Lbk2akix2FC2KW69o9cQ5uu
	 BSVH4td709KaHYB9GxmEZpeacKKalc8gDq3jmxRK/ENRHUXJvV++WDmRySPGuRHeEv
	 P+2+VrwNMyccH1FpieUziZPApX95l8IWrsrpFlU/76aj4eGwo4TXWUlO3HjS9dsuRe
	 1vjq46Eq5peF++Jck9/UPEDiXaF2zJGqfBuouiOfsgMFwXw6vvwYU/h6rfm8lF2yFZ
	 VhV2PjYL+9a7w==
Received: by codeconstruct.com.au (Postfix, from userid 10004)
	id E36986FD80; Wed, 14 Oct 2026 15:53:28 +0800 (AWST)
From: James Lee <james@codeconstruct.com.au>
To: openembedded-devel@lists.openembedded.org
Cc: andrew@codeconstruct.com.au,
	matt@codeconstruct.com.au,
	jk@codeconstruct.com.au
Subject: [oe][meta-networking][PATCH] mctp: upgrade 2.6 -> 2.7
Date: Wed, 14 Oct 2026 15:53:25 +0800
Message-ID: <20261014075325.1205663-1-james@codeconstruct.com.au>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 07:53:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130867

mctp version 2.7 adds Meson's installation tags to the project, now allow=
ing
binaries to be selectively installed.

Use MESON_INSTALL_TAGS to selectively install files specific to each reci=
pe.
No longer rm in mctpd's do_install step, which was a now-unneeded hack.
Meson tags prevent installation of the extra binaries.

Add mctpd.conf to FILES in the mctpd recipe following its installation to
improve recipe readability.

Signed-off-by: James Lee <james@codeconstruct.com.au>
---
 meta-networking/recipes-support/mctp/mctp.inc         |  2 +-
 .../recipes-support/mctp/{mctp_2.6.bb =3D> mctp_2.7.bb} |  1 +
 .../mctp/{mctpd_2.6.bb =3D> mctpd_2.7.bb}               | 11 +++--------
 3 files changed, 5 insertions(+), 9 deletions(-)
 rename meta-networking/recipes-support/mctp/{mctp_2.6.bb =3D> mctp_2.7.b=
b} (80%)
 rename meta-networking/recipes-support/mctp/{mctpd_2.6.bb =3D> mctpd_2.7=
.bb} (73%)

diff --git a/meta-networking/recipes-support/mctp/mctp.inc b/meta-network=
ing/recipes-support/mctp/mctp.inc
index c8fc98f63a..05a09f6c70 100644
--- a/meta-networking/recipes-support/mctp/mctp.inc
+++ b/meta-networking/recipes-support/mctp/mctp.inc
@@ -4,7 +4,7 @@ LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4cc91856b08b094b4f406a29dc61d=
b21"
=20
 SRC_URI =3D "git://github.com/CodeConstruct/mctp;branch=3Dmain;protocol=3D=
https;tag=3Dv${PV}"
-SRCREV =3D "31ac0e86b0e23d32abf34d191653a87a47f3c9a7"
+SRCREV =3D "eca0e9a7f87ed478be206e4f52bcd51561da18aa"
=20
 inherit meson pkgconfig
=20
diff --git a/meta-networking/recipes-support/mctp/mctp_2.6.bb b/meta-netw=
orking/recipes-support/mctp/mctp_2.7.bb
similarity index 80%
rename from meta-networking/recipes-support/mctp/mctp_2.6.bb
rename to meta-networking/recipes-support/mctp/mctp_2.7.bb
index 5811495c66..6d2a401716 100644
--- a/meta-networking/recipes-support/mctp/mctp_2.6.bb
+++ b/meta-networking/recipes-support/mctp/mctp_2.7.bb
@@ -3,3 +3,4 @@ require mctp.inc
 SUMMARY =3D "Management Component Transport Protocol (MCTP) utilities"
=20
 MESON_TARGET =3D "mctp mctp-client"
+MESON_INSTALL_TAGS +=3D "utils"
diff --git a/meta-networking/recipes-support/mctp/mctpd_2.6.bb b/meta-net=
working/recipes-support/mctp/mctpd_2.7.bb
similarity index 73%
rename from meta-networking/recipes-support/mctp/mctpd_2.6.bb
rename to meta-networking/recipes-support/mctp/mctpd_2.7.bb
index 139865d7c4..b8b3719c9e 100644
--- a/meta-networking/recipes-support/mctp/mctpd_2.6.bb
+++ b/meta-networking/recipes-support/mctp/mctpd_2.7.bb
@@ -4,6 +4,8 @@ SUMMARY =3D "Management Component Transport Protocol (MCT=
P) control protocol daemo
=20
 inherit systemd features_check useradd
=20
+MESON_INSTALL_TAGS +=3D "mctpd"
+
 do_install:append () {
     install -d ${D}${systemd_system_unitdir}
     install -m 0644 ${S}/conf/mctpd.service \
@@ -14,6 +16,7 @@ do_install:append () {
     install -m 0644 ${S}/conf/mctpd-dbus.conf \
             ${D}${datadir}/dbus-1/system.d/mctpd.conf
 }
+FILES:${PN} +=3D "${datadir}/dbus-1/system.d/mctpd.conf"
=20
 SYSTEMD_SERVICE:${PN} =3D "mctpd.service mctp.target mctp-local.target"
=20
@@ -22,11 +25,3 @@ USERADD_PARAM:${PN} =3D "-r -U -s /bin/false mctpd"
=20
 DEPENDS +=3D "systemd"
 REQUIRED_DISTRO_FEATURES =3D "systemd"
-
-# Meson adds mctp utility binaries to FILES and do_install(), which cann=
ot be
-# overriden by MESON_TARGET. Override FILES and remove binaries to corre=
ct.
-FILES:${PN} =3D "${datadir}/dbus-1/system.d/mctpd.conf ${sbindir}/mctpd"
-
-do_install:append () {
-    rm -r ${D}${bindir}
-}
--=20
2.47.3


