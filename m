Return-Path: <james@codeconstruct.com.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 238B7C44529
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 08:27:40 +0000 (UTC)
Received: from codeconstruct.com.au (codeconstruct.com.au [203.29.241.158])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17873.1784622452059656366
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Jul 2026 01:27:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@codeconstruct.com.au header.s=2022a header.b=axPM2LHN;
 spf=pass (domain: codeconstruct.com.au, ip: 203.29.241.158, mailfrom: james@codeconstruct.com.au)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1784622449;
	bh=J/w2NGohuoqbxRG55cmGB0RFpf8gqCKV331lQZNdJu8=;
	h=From:To:Cc:Subject:Date;
	b=axPM2LHNkOkGf1kWAu3IRq6GHQiYQns3j+KwL0hQj/bLT4lohnO7+VSwlyruVYyKK
	 53aRSDMBhChVLBjIODruWc0yrSQcPzUKJnl0X+b2IWIDh4crGXudN7CsaICLwDF9SH
	 qHCiQKMfq3FbrgFakK7+jIy1cPo9YTHCqumyiivwOnRX8M/0ry6Jr2cb928+bgWbVz
	 Qo8iNuh+5pZ/4fBoJjkrq6nCrl1dA9V59KOTNdc/3Me5W2kAcrj37wPtdnSJLCZL6Q
	 lcw9ZwZQ0v5E06v3FywHdqrPRAw9URvuDDx/ZPM2pMamql2hZqgk+Wh5TjFhQZdqWZ
	 6lsGh/nMTsH2w==
Received: by codeconstruct.com.au (Postfix, from userid 10004)
	id 1E67966322; Tue, 21 Jul 2026 16:27:29 +0800 (AWST)
From: James Lee <james@codeconstruct.com.au>
To: openembedded-devel@lists.openembedded.org
Cc: jk@codeconstruct.com.au
Subject: [oe] [meta-networking] [PATCH] mctp: upgrade 2.5 -> 2.6
Date: Tue, 21 Jul 2026 16:27:26 +0800
Message-ID: <20260721082727.2994105-1-james@codeconstruct.com.au>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Jul 2026 08:27:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128340

mctp version 2.6 released on 2026-07-21, bump srcrev to the v2.6 tag.

The new version of mctpd can run as an unprivileged user with
CAP_NET_BIND_SERVICE and CAP_NET_ADMIN added to the process' ambient
capabilities. Added this unpriviledged user to the recipe when systemd
is available.

Signed-off-by: James Lee <james@codeconstruct.com.au>
Acked-by: Jeremy Kerr <jk@codeconstruct.com.au>
---
 .../recipes-support/mctp/{mctp_2.5.bb =3D> mctp_2.6.bb}      | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/mctp/{mctp_2.5.bb =3D> mctp_2.6.b=
b} (82%)

diff --git a/meta-networking/recipes-support/mctp/mctp_2.5.bb b/meta-netw=
orking/recipes-support/mctp/mctp_2.6.bb
similarity index 82%
rename from meta-networking/recipes-support/mctp/mctp_2.5.bb
rename to meta-networking/recipes-support/mctp/mctp_2.6.bb
index a8787d3f2b..73e090bdab 100644
--- a/meta-networking/recipes-support/mctp/mctp_2.5.bb
+++ b/meta-networking/recipes-support/mctp/mctp_2.6.bb
@@ -5,12 +5,12 @@ LICENSE =3D "GPL-2.0-only"
=20
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4cc91856b08b094b4f406a29dc61d=
b21"
=20
-SRCREV =3D "07c7a5d526f686da89bc9ae9cad917e46652b272"
+SRCREV =3D "31ac0e86b0e23d32abf34d191653a87a47f3c9a7"
=20
 SRC_URI =3D "git://github.com/CodeConstruct/mctp;branch=3Dmain;protocol=3D=
https;tag=3Dv${PV}"
=20
=20
-inherit meson pkgconfig systemd
+inherit meson pkgconfig systemd useradd
=20
 EXTRA_OEMESON =3D " \
     -Dtests=3Dfalse \
@@ -39,6 +39,9 @@ do_install:append () {
     fi
 }
=20
+USERADD_PACKAGES =3D "${@bb.utils.contains('PACKAGECONFIG', 'systemd', '=
${PN}', '', d)}"
+USERADD_PARAM:${PN} =3D "${@bb.utils.contains('PACKAGECONFIG', 'systemd'=
, '-r -U -s /bin/false mctpd', '', d)}"
+
 FILES:${PN} +=3D " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', \
             '${datadir}/dbus-1/system.d/mctpd.conf', '', d)} \
--=20
2.47.3


