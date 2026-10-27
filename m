Received: from codeconstruct.com.au (codeconstruct.com.au [203.29.241.158])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14875.1793092911917570688
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:21:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@codeconstruct.com.au header.s=2022a header.b=cjgRuYCB;
 spf=pass (domain: codeconstruct.com.au, ip: 203.29.241.158, mailfrom: james@codeconstruct.com.au)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1793092909;
	bh=mb+KL4w25xKBOy0f8uiyPpKGNApjPgxEcVaoCHKUvq4=;
	h=From:To:Cc:Subject:Date;
	b=cjgRuYCB3kgEDXpileh24J1lnSlpTwKjTmjscBbncfg9osIyE4othzf12k8vFvLmH
	 N+mK6/Iw8nrG14pomtIG60zHGYadEob0tHccSiBaLUfYI1aV1zpisLg6XdhcEkAUWb
	 G9IoPNMdHqTSkVp3Y+qXk1+Z6VbAkD/B5ng5AzndTguZz+NlWVLBMZwJGDwEHkJ556
	 6uWybUexEq1P1P/6Gb7el0Uf708XBEW62UhU7Yx6/M1v8EvOvgEGnuSbPtixo3FEXG
	 tISnZlTveWPrIt8NP5wJ8MRz9TZ1Pwx2od/uE3uGzTN30q0hysk3RUC/hYStxNdEUM
	 ZMmCSyrbokF8g==
Received: by codeconstruct.com.au (Postfix, from userid 10004)
	id 49DF764ACD; Tue, 27 Oct 2026 17:21:49 +0800 (AWST)
From: James Lee <james@codeconstruct.com.au>
To: openembedded-devel@lists.openembedded.org
Cc: jk@codeconstruct.com.au
Subject: [blacksail][meta-networking][PATCH v2] mctp: upgrade 2.6 -> 2.6.1
Date: Tue, 27 Oct 2026 17:21:46 +0800
Message-ID: <20261027092146.2571059-1-james@codeconstruct.com.au>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:21:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131526
Content-Type: text/plain; charset="utf-8"

mctp 2.6.1 is a bugfix release that corrects mctpd's systemd service
file. mctpd requires CAP_NET_RAW to send MCTP control messages when
running as an unprivileged user. This capability is missing from
version 2.6, breaking mctpd.

Bump mctp and mctpd to version 2.6.1 to correct this.

Changelog:
https://github.com/CodeConstruct/mctp/blob/v2.6.1/CHANGELOG.md

Signed-off-by: James Lee <james@codeconstruct.com.au>
---
v2
* Update SRCREV
---
 meta-networking/recipes-support/mctp/mctp.inc                 | 4 ++--
 .../recipes-support/mctp/{mctp_2.6.bb =3D> mctp_2.6.1.bb}       | 0
 .../recipes-support/mctp/{mctpd_2.6.bb =3D> mctpd_2.6.1.bb}     | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/mctp/{mctp_2.6.bb =3D> mctp_2.6.1=
.bb} (100%)
 rename meta-networking/recipes-support/mctp/{mctpd_2.6.bb =3D> mctpd_2.6=
.1.bb} (100%)

diff --git a/meta-networking/recipes-support/mctp/mctp.inc b/meta-network=
ing/recipes-support/mctp/mctp.inc
index c8fc98f63a..cc140f23a1 100644
--- a/meta-networking/recipes-support/mctp/mctp.inc
+++ b/meta-networking/recipes-support/mctp/mctp.inc
@@ -3,8 +3,8 @@ SECTION =3D "net"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4cc91856b08b094b4f406a29dc61d=
b21"
=20
-SRC_URI =3D "git://github.com/CodeConstruct/mctp;branch=3Dmain;protocol=3D=
https;tag=3Dv${PV}"
-SRCREV =3D "31ac0e86b0e23d32abf34d191653a87a47f3c9a7"
+SRC_URI =3D "git://github.com/CodeConstruct/mctp;branch=3Dstable/2.6.x;p=
rotocol=3Dhttps;tag=3Dv${PV}"
+SRCREV =3D "ea1dfa9e59681c42d02ed3bf91cb150161481403"
=20
 inherit meson pkgconfig
=20
diff --git a/meta-networking/recipes-support/mctp/mctp_2.6.bb b/meta-netw=
orking/recipes-support/mctp/mctp_2.6.1.bb
similarity index 100%
rename from meta-networking/recipes-support/mctp/mctp_2.6.bb
rename to meta-networking/recipes-support/mctp/mctp_2.6.1.bb
diff --git a/meta-networking/recipes-support/mctp/mctpd_2.6.bb b/meta-net=
working/recipes-support/mctp/mctpd_2.6.1.bb
similarity index 100%
rename from meta-networking/recipes-support/mctp/mctpd_2.6.bb
rename to meta-networking/recipes-support/mctp/mctpd_2.6.1.bb
--=20
2.47.3

