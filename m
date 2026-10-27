Received: from codeconstruct.com.au (codeconstruct.com.au [203.29.241.158])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14022.1793089006593051073
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 01:16:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@codeconstruct.com.au header.s=2022a header.b=QSsyFVNi;
 spf=pass (domain: codeconstruct.com.au, ip: 203.29.241.158, mailfrom: james@codeconstruct.com.au)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1793089004;
	bh=CsXHYNGH0QXFu5ZpAfg2AgQisl+60UHHspyTABHMF6o=;
	h=From:To:Cc:Subject:Date;
	b=QSsyFVNiK2zUe5YvoMDZ2rdi6g2q0ju1utSApivZPUVrzM0aFSACNJqYWvJOvQB9D
	 iCp1QA49GQkzlv+8RbBb0ysRlcaPWFtLvqoaYJip5bLtBPnRAw0jxBsKPLYzm0U7s8
	 iEhR/DL2qoa2sscz/7SAfsoaQ3ErACa3xjRUWZ52QrQy/i3b2mBY7UaSVFnKnZ/lAT
	 F0kCAI+B+xSK6r51W6AvJeU/2mPYvobgD0z1x9PVqWoAfMScqaJht52mdTB4QPALBZ
	 toJe+SBU9XRNvmLaDIzUgjCvDION5IJAq+3WAKY/+PXVzq/WZ/AI3TB5stjO62buHY
	 QgoW4I1cJSD4g==
Received: by codeconstruct.com.au (Postfix, from userid 10004)
	id 461CC64AB5; Tue, 27 Oct 2026 16:16:44 +0800 (AWST)
From: James Lee <james@codeconstruct.com.au>
To: openembedded-devel@lists.openembedded.org
Cc: jk@codeconstruct.com.au
Subject: [blacksail][meta-networking][PATCH] mctp: upgrade 2.6 -> 2.6.1
Date: Tue, 27 Oct 2026 16:16:31 +0800
Message-ID: <20261027081632.2560647-1-james@codeconstruct.com.au>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 08:16:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131459
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
 meta-networking/recipes-support/mctp/mctp.inc                   | 2 +-
 .../recipes-support/mctp/{mctp_2.6.bb =3D> mctp_2.6.1.bb}         | 0
 .../recipes-support/mctp/{mctpd_2.6.bb =3D> mctpd_2.6.1.bb}       | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/mctp/{mctp_2.6.bb =3D> mctp_2.6.1=
.bb} (100%)
 rename meta-networking/recipes-support/mctp/{mctpd_2.6.bb =3D> mctpd_2.6=
.1.bb} (100%)

diff --git a/meta-networking/recipes-support/mctp/mctp.inc b/meta-network=
ing/recipes-support/mctp/mctp.inc
index c8fc98f63a..5c66d8c620 100644
--- a/meta-networking/recipes-support/mctp/mctp.inc
+++ b/meta-networking/recipes-support/mctp/mctp.inc
@@ -3,7 +3,7 @@ SECTION =3D "net"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4cc91856b08b094b4f406a29dc61d=
b21"
=20
-SRC_URI =3D "git://github.com/CodeConstruct/mctp;branch=3Dmain;protocol=3D=
https;tag=3Dv${PV}"
+SRC_URI =3D "git://github.com/CodeConstruct/mctp;branch=3Dstable/2.6.x;p=
rotocol=3Dhttps;tag=3Dv${PV}"
 SRCREV =3D "31ac0e86b0e23d32abf34d191653a87a47f3c9a7"
=20
 inherit meson pkgconfig
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

