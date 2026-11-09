Received: from codeconstruct.com.au (codeconstruct.com.au [203.29.241.158])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1446.1794209550541960877
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Nov 2026 23:32:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@codeconstruct.com.au header.s=2022a header.b=MBcmS4Fj;
 spf=pass (domain: codeconstruct.com.au, ip: 203.29.241.158, mailfrom: james@codeconstruct.com.au)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1794209546;
	bh=rZTNU9z9VSAOOEAVPktBpLiYujs1oqd1ACjfrMMWhm4=;
	h=From:To:Cc:Subject:Date;
	b=MBcmS4FjQ7+crMd3CoVhvqjUhHB6bkKJ1pJTGvB3rk8a4W0Iqhn0AxKIab1F815QJ
	 q8GTGLT1NHwV0PnG605dnuaZvu6sePyq2WjGxkp0OntoHOhGfdnt893KEe4WNLvYNW
	 O4r6SthHZCK7VM76MLOBJETyzO2RUWKXeba/SL85iPdlM77TAbza99SGoOCyhPB1sl
	 RX1QQ/+5mIyeY0Ne4qVbvDpFzhkuPHLuI+I7iqCXNi1EynRLdQmFDQ0MyGIhW4rRDr
	 E7xbJ3SCXFebN98fibU++2BbE3CL6Pbc1ZV1k/XrNEK4vqKMmSYgmZJvsixatKPlfW
	 CtOx4y1WQHg0A==
Received: by codeconstruct.com.au (Postfix, from userid 10004)
	id 8E51D71388; Mon,  9 Nov 2026 15:32:26 +0800 (AWST)
From: James Lee <james@codeconstruct.com.au>
To: openembedded-devel@lists.openembedded.org
Cc: jk@codeconstruct.com.au
Subject: [blacksail][meta-networking][PATCH] mctp: upgrade 2.6.1 -> 2.6.2
Date: Mon,  9 Nov 2026 15:32:23 +0800
Message-ID: <20261109073223.1090322-1-james@codeconstruct.com.au>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2026 07:32:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132048
Content-Type: text/plain; charset="utf-8"

mctp 2.6.2 is a bugfix release that corrects mctpd's dbus policy file.
Users need access to the org.freedesktop.DBus.Properties interface to
view the properties of the objects managed by mctpd. There is a
misspelling in the v2.6.1 policy file that prevents this.

Bump mctp and mctpd to version 2.6.2 to correct this.

Changelog:
https://github.com/CodeConstruct/mctp/blob/v2.6.2/CHANGELOG.md

Signed-off-by: James Lee <james@codeconstruct.com.au>
---
 meta-networking/recipes-support/mctp/mctp.inc                   | 2 +-
 .../recipes-support/mctp/{mctp_2.6.1.bb =3D> mctp_2.6.2.bb}       | 0
 .../recipes-support/mctp/{mctpd_2.6.1.bb =3D> mctpd_2.6.2.bb}     | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/mctp/{mctp_2.6.1.bb =3D> mctp_2.6=
.2.bb} (100%)
 rename meta-networking/recipes-support/mctp/{mctpd_2.6.1.bb =3D> mctpd_2=
.6.2.bb} (100%)

diff --git a/meta-networking/recipes-support/mctp/mctp.inc b/meta-network=
ing/recipes-support/mctp/mctp.inc
index cc140f23a1..1150c9aae7 100644
--- a/meta-networking/recipes-support/mctp/mctp.inc
+++ b/meta-networking/recipes-support/mctp/mctp.inc
@@ -4,7 +4,7 @@ LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4cc91856b08b094b4f406a29dc61d=
b21"
=20
 SRC_URI =3D "git://github.com/CodeConstruct/mctp;branch=3Dstable/2.6.x;p=
rotocol=3Dhttps;tag=3Dv${PV}"
-SRCREV =3D "ea1dfa9e59681c42d02ed3bf91cb150161481403"
+SRCREV =3D "96a3d47ae30df7bd47fa57cd88f69d5317d68ef0"
=20
 inherit meson pkgconfig
=20
diff --git a/meta-networking/recipes-support/mctp/mctp_2.6.1.bb b/meta-ne=
tworking/recipes-support/mctp/mctp_2.6.2.bb
similarity index 100%
rename from meta-networking/recipes-support/mctp/mctp_2.6.1.bb
rename to meta-networking/recipes-support/mctp/mctp_2.6.2.bb
diff --git a/meta-networking/recipes-support/mctp/mctpd_2.6.1.bb b/meta-n=
etworking/recipes-support/mctp/mctpd_2.6.2.bb
similarity index 100%
rename from meta-networking/recipes-support/mctp/mctpd_2.6.1.bb
rename to meta-networking/recipes-support/mctp/mctpd_2.6.2.bb
--=20
2.47.3

