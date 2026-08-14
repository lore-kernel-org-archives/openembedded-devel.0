Return-Path: <james@codeconstruct.com.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A4AAC5CFC1
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 07:17:18 +0000 (UTC)
Received: from codeconstruct.com.au (codeconstruct.com.au [203.29.241.158])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7939.1786691828118989197
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 00:17:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@codeconstruct.com.au header.s=2022a header.b=DYTHo2dQ;
 spf=pass (domain: codeconstruct.com.au, ip: 203.29.241.158, mailfrom: james@codeconstruct.com.au)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1786691825;
	bh=b48zUzeKAuEhXt7rKZAFdo63iOCVVUK4NxjJ2PISiuY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DYTHo2dQP7ez6ERfp5PghiiGDrF7cPNFR1u1MoXXUAq2ZJeiFJjdpGpqRUcl7/Yj8
	 NYupvh1TV+mhN4UVEHen8SyeuS9itv3R0Gq5eH/hkcg5qR8rk814HtqHuYkXVgcGXX
	 eGbGtga8iRik/Ws+K2HsZPnq5hcSOcLm6XvrIg6f5Bu2AshH2seGS50ijnf0cBGDok
	 iEwDFZcsZvbYdPVf1WlZLEh/Ss+oE6qeBdT/GpWtijtnK+7SbqYLfcY82B/npgIn+d
	 9hFjzz4vRNutxBTa1x+BhgVoIMhqJzQIcdZMUf6ZcAVKKOrtRpbR1VUx6h5xndzm8L
	 XZ2C6fSO87tyQ==
Received: by codeconstruct.com.au (Postfix, from userid 10004)
	id BDD1A67A15; Fri, 14 Aug 2026 15:17:05 +0800 (AWST)
From: James Lee <james@codeconstruct.com.au>
To: openembedded-devel@lists.openembedded.org
Cc: andrew@codeconstruct.com.au,
	jk@codeconstruct.com.au
Subject: [oe] [meta-networking] [PATCH v3 2/2] mctp: upgrade 2.5 -> 2.6
Date: Fri, 14 Aug 2026 15:17:01 +0800
Message-ID: <20260814071701.3733870-2-james@codeconstruct.com.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260814071701.3733870-1-james@codeconstruct.com.au>
References: <20260814071701.3733870-1-james@codeconstruct.com.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 07:17:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129042

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
.bb} (88%)

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
similarity index 88%
rename from meta-networking/recipes-support/mctp/mctpd_2.5.bb
rename to meta-networking/recipes-support/mctp/mctpd_2.6.bb
index a0f2f778a3..139865d7c4 100644
--- a/meta-networking/recipes-support/mctp/mctpd_2.5.bb
+++ b/meta-networking/recipes-support/mctp/mctpd_2.6.bb
@@ -2,7 +2,7 @@ require mctp.inc
=20
 SUMMARY =3D "Management Component Transport Protocol (MCTP) control prot=
ocol daemon"
=20
-inherit systemd features_check
+inherit systemd features_check useradd
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
 REQUIRED_DISTRO_FEATURES =3D "systemd"
=20
--=20
2.47.3


