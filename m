Return-Path: <james@codeconstruct.com.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE659C5B575
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 07:25:41 +0000 (UTC)
Received: from codeconstruct.com.au (codeconstruct.com.au [203.29.241.158])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49098.1786433138894713466
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Aug 2026 00:25:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@codeconstruct.com.au header.s=2022a header.b=V7SLqhMN;
 spf=pass (domain: codeconstruct.com.au, ip: 203.29.241.158, mailfrom: james@codeconstruct.com.au)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1786433136;
	bh=K/U/jP0/j2w11jOrKdpfltG7UayQ3wh3cnMxN6jvQ+8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=V7SLqhMNGijl4K0sk7iwzWtWI+C0leXN6e6XKfEQ8N9sxkGEK1jGIr3WIN+dbz5AA
	 ZxjgEU2b3eSIueDdEImKGBKHQh2C7vphENMC+NjTTOVKLSs6CugyfuFUl2ebFUppgP
	 fG7ZSOX3orFWVtmLfTzwkjcwhcXenV+XwRJZ+IanocCDvedAfMNiw+2EZPLZ4ibxhB
	 CFlzT833fT7/hhkAL29VPiIL2OjGrDcLV2BB/vg240w9z/KLamZW+ey3EWtEVgznru
	 tIhC0iIHVvTp2aZQH0/1xYIZqqWkLqq6/DcipPL3gxgeanisMQs5C+zl6RBMffm0/G
	 YsL6CaD+tRXGA==
Received: by codeconstruct.com.au (Postfix, from userid 10004)
	id 63A396783E; Tue, 11 Aug 2026 15:25:36 +0800 (AWST)
From: James Lee <james@codeconstruct.com.au>
To: openembedded-devel@lists.openembedded.org
Cc: andrew@codeconstruct.com.au,
	jk@codeconstruct.com.au
Subject: [oe] [meta-networking] [PATCH v2 2/2] mctp: upgrade 2.5 -> 2.6
Date: Tue, 11 Aug 2026 15:25:23 +0800
Message-ID: <20260811072523.3463118-2-james@codeconstruct.com.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260811072523.3463118-1-james@codeconstruct.com.au>
References: <20260811072523.3463118-1-james@codeconstruct.com.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Aug 2026 07:25:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128923

Bumped mctp and mctp-daemon version to 2.6, and added the new system
user to own mctpd's service.

Signed-off-by: James Lee <james@codeconstruct.com.au>
---
 meta-networking/recipes-support/mctp/mctp.inc                | 2 +-
 .../recipes-support/mctp/{mctp_2.5.bb =3D> mctp_2.6.bb}        | 0
 .../recipes-support/mctp/{mctpd_2.5.bb =3D> mctpd_2.6.bb}      | 5 ++++-
 3 files changed, 5 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/mctp/{mctp_2.5.bb =3D> mctp_2.6.b=
b} (100%)
 rename meta-networking/recipes-support/mctp/{mctpd_2.5.bb =3D> mctpd_2.6=
.bb} (89%)

diff --git a/meta-networking/recipes-support/mctp/mctp.inc b/meta-network=
ing/recipes-support/mctp/mctp.inc
index 98225cffea..c8fc98f63a 100644
--- a/meta-networking/recipes-support/mctp/mctp.inc
+++ b/meta-networking/recipes-support/mctp/mctp.inc
@@ -4,7 +4,7 @@ LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4cc91856b08b094b4f406a29dc61d=
b21"
=20
 SRC_URI =3D "git://github.com/CodeConstruct/mctp;branch=3Dmain;protocol=3D=
https;tag=3Dv${PV}"
-SRCREV =3D "07c7a5d526f686da89bc9ae9cad917e46652b272"
+SRCREV =3D "31ac0e86b0e23d32abf34d191653a87a47f3c9a7"
=20
 inherit meson pkgconfig
=20
diff --git a/meta-networking/recipes-support/mctp/mctp_2.5.bb b/meta-netw=
orking/recipes-support/mctp/mctp_2.6.bb
similarity index 100%
rename from meta-networking/recipes-support/mctp/mctp_2.5.bb
rename to meta-networking/recipes-support/mctp/mctp_2.6.bb
diff --git a/meta-networking/recipes-support/mctp/mctpd_2.5.bb b/meta-net=
working/recipes-support/mctp/mctpd_2.6.bb
similarity index 89%
rename from meta-networking/recipes-support/mctp/mctpd_2.5.bb
rename to meta-networking/recipes-support/mctp/mctpd_2.6.bb
index f049be646b..f4c5bb976c 100644
--- a/meta-networking/recipes-support/mctp/mctpd_2.5.bb
+++ b/meta-networking/recipes-support/mctp/mctpd_2.6.bb
@@ -2,7 +2,7 @@ require mctp.inc
=20
 SUMMARY =3D "Management Component Transport Protocol (MCTP) control prot=
ocol daemon"
=20
-inherit systemd
+inherit systemd useradd
=20
 do_install:append () {
     install -d ${D}${systemd_system_unitdir}
@@ -17,6 +17,9 @@ do_install:append () {
=20
 SYSTEMD_SERVICE:${PN} =3D "mctpd.service mctp.target mctp-local.target"
=20
+USERADD_PACKAGES =3D "${PN}"
+USERADD_PARAM:${PN} =3D "-r -U -s /bin/false mctpd"
+
 DEPENDS +=3D "systemd"
=20
 # Meson adds mctp utility binaries to FILES and do_install(), which cann=
ot be
--=20
2.47.3


