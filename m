Received: from codeconstruct.com.au (codeconstruct.com.au [203.29.241.158])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48294.1795413357458011304
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:55:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@codeconstruct.com.au header.s=2022a header.b=WFLhmARs;
 spf=pass (domain: codeconstruct.com.au, ip: 203.29.241.158, mailfrom: james@codeconstruct.com.au)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1795413354;
	bh=za5MwFFXkruuOnTiyyCYT7qincdwOPAXtzTwzN+MPRU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WFLhmARs70ozJCZb4AS5tNQGy0FQbhtJRmUwRA5t5d7UTt/Lc8M5skTY8+voXa3oz
	 ZHZESdQ/nP6A/+0LquGWX8E0H7reOCg8NDMGEkw+BPapi3IZbVQgcNpYiit8H6TAYP
	 3Iau66A+urkvE5vPWtNAG4tvv2vFDo3zYkJBLFf3ZuBU38o5gLU1sOj20meTOtBTGt
	 X3WQKTY7P/DtT9hhngcT49M+gMOdllkonY4mK51Q0x+Enlj2kbKTat4lWt3otJozDw
	 chSrsn7stCWFfMUdIz2QsgAtiLC7dFFMTDpWpOOpRF5Vu++yfM1BkJznyoOPMlW3vx
	 zH9DkYK4zXhDw==
Received: by codeconstruct.com.au (Postfix, from userid 10004)
	id 9FD0860836; Mon, 23 Nov 2026 13:55:54 +0800 (AWST)
From: James Lee <james@codeconstruct.com.au>
To: openembedded-devel@lists.openembedded.org
Cc: jk@codeconstruct.com.au
Subject: [meta-networking][PATCH 2/2] mctp: add mctp-admin group
Date: Mon, 23 Nov 2026 13:55:51 +0800
Message-ID: <20261123055551.276146-2-james@codeconstruct.com.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123055551.276146-1-james@codeconstruct.com.au>
References: <20261123055551.276146-1-james@codeconstruct.com.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:56:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132884
Content-Type: text/plain; charset="utf-8"

The mctpd D-Bus config relies on a "mctp-admin" group to allow users to
send messages to mctpd's interfaces. Create that group.

Signed-off-by: James Lee <james@codeconstruct.com.au>
---
 meta-networking/recipes-support/mctp/mctpd_2.7.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/mctp/mctpd_2.7.bb b/meta-net=
working/recipes-support/mctp/mctpd_2.7.bb
index a75f76be20..0e32f523a6 100644
--- a/meta-networking/recipes-support/mctp/mctpd_2.7.bb
+++ b/meta-networking/recipes-support/mctp/mctpd_2.7.bb
@@ -16,7 +16,7 @@ do_install:append () {
     install -m 0644 ${S}/conf/mctpd-dbus.conf \
             ${D}${datadir}/dbus-1/system.d/mctpd.conf
     install -d ${D}${nonarch_libdir}/sysusers.d
-    printf 'u! mctpd - "mctpd daemon" / /bin/false\n' > ${D}${nonarch_li=
bdir}/sysusers.d/mctpd.conf
+    printf 'u! mctpd - "mctpd daemon" / /bin/false\ng mctp-admin\n' > ${=
D}${nonarch_libdir}/sysusers.d/mctpd.conf
 }
 FILES:${PN} +=3D "${datadir}/dbus-1/system.d/mctpd.conf ${nonarch_libdir=
}/sysusers.d/mctpd.conf"
=20
@@ -24,6 +24,7 @@ SYSTEMD_SERVICE:${PN} =3D "mctpd.service mctp.target mc=
tp-local.target"
=20
 USERADD_PACKAGES =3D "${PN}"
 USERADD_PARAM:${PN} =3D "-r -U -d / -s /bin/false mctpd"
+GROUPADD_PARAM:${PN} =3D "-r mctp-admin"
=20
 DEPENDS +=3D "systemd"
 REQUIRED_DISTRO_FEATURES =3D "systemd"
--=20
2.47.3

