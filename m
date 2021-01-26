Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by mx.groups.io with SMTP id smtpd.web11.9262.1611645765003971773
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jan 2021 23:22:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=kOlOjtOr;
 spf=pass (domain: gmx.net, ip: 212.227.17.22, mailfrom: n.jeker@gmx.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1611645762;
	bh=Bhd2y9U6vsT2VTsrisbGayJ44Cho5FqPz+/Xo+M88jk=;
	h=X-UI-Sender-Class:From:To:Subject:Date;
	b=kOlOjtOrcy8YsJXFZ7H0e3e6YUZf8lI9AYs11KACCd5F0FglCtOT04mmsbuaN0Ycv
	 vlEvtIbxIGQo8Lbat953bGlDVlc9bzz/o8X+X8VvuVt/D6U1n5cUgSfOuH0CxdcnZD
	 VYq2x/t8CwFEmL30e3zn/mowXPftoVHIkze4rqo8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from station.v.cablecom.net ([84.75.156.97]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MAfYm-1lAwX42uDo-00B1ah for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jan 2021 08:22:42 +0100
From: "Nicolas Jeker" <n.jeker@gmx.net>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/2] networkmanager: Add PACKAGECONFIG for ovs
Date: Tue, 26 Jan 2021 08:22:40 +0100
Message-Id: <20210126072241.43425-1-n.jeker@gmx.net>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:G4BsShg3SCRtbHvlKoqLRBSOmHsoJLzEb/zERUnXNMcWIWXFw5h
 NWeou72eIoK24NMeo4EJz6JFu9cSisl9/Xcv/nnji28ok2Sske2XA6tNa1mpjEt+k87Ovk4
 t31rF8AjiJipciz0XjnRnG3xYSfveA8JbT+HwIaB3h+/Qaegqj1sxHqXO0fjtwiikix/7u0
 f5EH77W5U9qTSxp0Dp+bA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:X77GoVTfjyk=:SzjNSWSNGj+IhNY7Qxupr2
 BRedy4YOOse4rEqjUQzcciI9Gvqu1VCBLpXWL8LurcNbzuTE78XJn2lNB4XcGHOQD4JEPD/re
 kPj8XXUbHcm1654WNKquAzynPvMoAOpCMV241oRoYYFytsWWHtBK824Xn1Zm7T+jUs3QCu3/P
 WDBgY/X+U6pi8F0Ts1l9SF8/KfnNwC9VJZvbj36bwO3fIpFMwSN5i+itWvO8hODNP86JZiiau
 CkHmiWsLFVww1+F+EdkNq+BpDglyZBq4axoaA0dEQEimbEdVnEI00rjdI2Zbn7sIliPF5l7Eu
 8u6usd53xwEcC4JB0A/vWiAjVHL+ypIG39M+Vxb6egT07MdL7JW+UX/exh5WG3MNsTl4x1LXc
 BLNhQ4EMwDG0fAeJschFver7IqVGhVzWkOdU6RY9lQvW2AvNL8lNyBcfgL0jDYS+3Xq784RoJ
 UEmt/GBR1shdYGt9qLI9DDUUIEzvR+saxb5vgOk/og5gSmx3HfLVbvRuoHFcI5S2sF4NU3XOh
 zCwP728RHWLcM+TNAXWTTwtDbQEWfomyZY7GZp3iJUMWNqNjQd0GNRle9JuT4QIniOHxfLDe/
 Fn8MqNe6ZZ2MAujOZVffpF8oyRadnYXGh5WabrmFez8iqNMZ22BmFdcLUWq/weHoe2c32SIoA
 zQesxk/nrpScPHRvyJZ4lCWZ0C6jC1KWkSOCGYpFVoAcrf/Nr+/vCLZ5En07AgfOendeO+9WQ
 RwEv+LGj9/XFNE7mim5ogSKUv/jGubsPMnbVaSzkt3BtW7p5FENNKCGQMOwYKWphFefsdHePc
 RYlrnQgCcIYLF7NFdvyxWgOkeN4aImk6JDsizlW+Y5SsI9w/rpVUP+INOg80odWUGcym6hRWv
 JDIY6Gz19JZv0MEFXlWA==
Content-Transfer-Encoding: quoted-printable

Open vSwitch support is enabled by default in NetworkManager, but only
useful in the context of several virtualisation environments, e.g. Xen,
KVM, OpenStack and more. Therefore, the ovs PACKAGECONFIG is now disabled =
by
default.

The jansson dependency is only required for Open vSwitch and teamsdctl
support in NetworkManager. As there is no libteamsdctl recipe around
(and no teamsdctl PACKAGECONFIG), make it dependent on the ovs
PACKAGECONFIG.

Signed-off-by: Nicolas Jeker <n.jeker@gmx.net>
=2D--
 .../networkmanager/networkmanager_1.28.0.bb                     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkma=
nager_1.28.0.bb b/meta-networking/recipes-connectivity/networkmanager/netw=
orkmanager_1.28.0.bb
index 1053bdd42..157a7e7b0 100644
=2D-- a/meta-networking/recipes-connectivity/networkmanager/networkmanager=
_1.28.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1=
.28.0.bb
@@ -15,7 +15,6 @@ DEPENDS =3D " \
     util-linux \
     libndp \
     libnewt \
-    jansson \
     curl \
 "

@@ -85,6 +84,7 @@ PACKAGECONFIG[wifi] =3D "--enable-wifi=3Dyes,--enable-wi=
fi=3Dno,,wpa-supplicant"
 PACKAGECONFIG[ifupdown] =3D "--enable-ifupdown,--disable-ifupdown"
 PACKAGECONFIG[qt4-x11-free] =3D "--enable-qt,--disable-qt,qt4-x11-free"
 PACKAGECONFIG[cloud-setup] =3D "--with-nm-cloud-setup=3Dyes,--with-nm-clo=
ud-setup=3Dno"
+PACKAGECONFIG[ovs] =3D "--enable-ovs,--disable-ovs,,jansson"

 PACKAGES =3D+ " \
   ${PN}-nmcli ${PN}-nmcli-doc \
=2D-
2.30.0

