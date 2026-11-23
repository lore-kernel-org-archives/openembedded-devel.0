Received: from codeconstruct.com.au (codeconstruct.com.au [203.29.241.158])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48782.1795413357403567606
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:55:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@codeconstruct.com.au header.s=2022a header.b=Fbgy/oVN;
 spf=pass (domain: codeconstruct.com.au, ip: 203.29.241.158, mailfrom: james@codeconstruct.com.au)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1795413354;
	bh=lFhd9YOQfJDIbJaEJuCWmybbKFHsRw/bgqViEVGK3EE=;
	h=From:To:Cc:Subject:Date;
	b=Fbgy/oVN/LsDLwwzl1O5sZsl9EZIXxJnU7RbH3o7Kwv95R2IRzwnYMVfBNCBz3AVi
	 RclcT6CGFeJY5zxKbW7YT5ujCu+RSIlJ0itsCzEM2n/aT6n+T4dYc6NmaetzALpd2Q
	 0UnKZd13cTRQ11w+R3EAnB57sZ8KinHiz2DWoKSdgoVjdjZIIgGZbqpOXQqxN0ybHf
	 l7/PIAjV7Zpm0ZxKZSib8+siqZT9x+Uw7SFxPaIs4kriSAAMZHlswGX5438i/FmIyV
	 JExQ7zyADpfMTwutR13W/o7AvEJpzPqJF9reqW/TXK33QL74So/t4qQn8+RnmLXSvQ
	 CsxbOv7bv/6Xw==
Received: by codeconstruct.com.au (Postfix, from userid 10004)
	id 56BE4607E6; Mon, 23 Nov 2026 13:55:54 +0800 (AWST)
From: James Lee <james@codeconstruct.com.au>
To: openembedded-devel@lists.openembedded.org
Cc: jk@codeconstruct.com.au
Subject: [meta-networking][PATCH 1/2] mctp: refine user creation
Date: Mon, 23 Nov 2026 13:55:50 +0800
Message-ID: <20261123055551.276146-1-james@codeconstruct.com.au>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:56:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132883
Content-Type: text/plain; charset="utf-8"

The current recipe does not handle user creation when upgrading.
Add mctpd user to sysusers.d to ensure it is created if needed.

Current useradd params unintentionally set the home directory to
/home/mctpd which does not exist and would conflict with the user
definition in sysusers.d. Update useradd params to set the home
directory to "/".

Signed-off-by: James Lee <james@codeconstruct.com.au>
---
 meta-networking/recipes-support/mctp/mctpd_2.7.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/mctp/mctpd_2.7.bb b/meta-net=
working/recipes-support/mctp/mctpd_2.7.bb
index b8b3719c9e..a75f76be20 100644
--- a/meta-networking/recipes-support/mctp/mctpd_2.7.bb
+++ b/meta-networking/recipes-support/mctp/mctpd_2.7.bb
@@ -15,13 +15,15 @@ do_install:append () {
     install -d ${D}${datadir}/dbus-1/system.d
     install -m 0644 ${S}/conf/mctpd-dbus.conf \
             ${D}${datadir}/dbus-1/system.d/mctpd.conf
+    install -d ${D}${nonarch_libdir}/sysusers.d
+    printf 'u! mctpd - "mctpd daemon" / /bin/false\n' > ${D}${nonarch_li=
bdir}/sysusers.d/mctpd.conf
 }
-FILES:${PN} +=3D "${datadir}/dbus-1/system.d/mctpd.conf"
+FILES:${PN} +=3D "${datadir}/dbus-1/system.d/mctpd.conf ${nonarch_libdir=
}/sysusers.d/mctpd.conf"
=20
 SYSTEMD_SERVICE:${PN} =3D "mctpd.service mctp.target mctp-local.target"
=20
 USERADD_PACKAGES =3D "${PN}"
-USERADD_PARAM:${PN} =3D "-r -U -s /bin/false mctpd"
+USERADD_PARAM:${PN} =3D "-r -U -d / -s /bin/false mctpd"
=20
 DEPENDS +=3D "systemd"
 REQUIRED_DISTRO_FEATURES =3D "systemd"
--=20
2.47.3

