Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by mx.groups.io with SMTP id smtpd.web09.9438.1611649538427797036
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jan 2021 00:25:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=Cq7Zl0Sq;
 spf=pass (domain: gmx.net, ip: 212.227.17.22, mailfrom: n.jeker@gmx.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1611649536;
	bh=5afCIIXRiPGCffegMEMGfWFcP+VM7FdAY1Ijc++PEcE=;
	h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
	b=Cq7Zl0SqplOWW3s+2dbDIO88qcd5vNYRRH6KaimF4DmJR0PvrdKEhwfR8I0wbn2uh
	 MitMyVut7VGFqb869pxHx5M/BgrWhns6pOKGxGRb7BSManTDX11cnJRKV+Z4SAxjFw
	 iZpBMyyFKBME/+2GtbzdhTnjBbT9pooZdnhysdeo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from station.v.cablecom.net ([84.75.156.97]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1M9Fjb-1l6mFL25Ch-006OCN for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jan 2021 09:25:36 +0100
From: "Nicolas Jeker" <n.jeker@gmx.net>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/2] networkmanager: Add Wireless Extensions to PACKAGECONFIG[wifi]
Date: Tue, 26 Jan 2021 09:25:35 +0100
Message-Id: <20210126082535.49621-2-n.jeker@gmx.net>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210126082535.49621-1-n.jeker@gmx.net>
References: <20210126082535.49621-1-n.jeker@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:aiwFUDs8pSO0WUz8MoJduVgZVA6onWICkj7avxApqUuMOGziS1P
 dp/POskieLGohZFGZqqcYe/cFmi/7XODCN1C322JdAx33tvLSwT4ra4a8YSyJQ9GUcfhZc4
 nl51NQvCLiNpjYIWY1Ay58FFp3XyDOJWVXxY92TW0Q9HWwasSvX9pvKp9wjdErNgQj+tmaB
 EJxHRRBZF9n63V30/sNYA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:4DgrDFOVICU=:htyhsO/eAYOnCFBDttIQKX
 L6l9kELpQFZ7osykX1UZJKZQWtmylRxg6Bj4hpt2seJbMYpMJbZqgrjfx4nqEI7etTXXf2G4m
 jHuxymy+9wIJ6tEYiTHW8GZjy604QDelcvyrAQnFncKR8Ah1gElWldmTDTw6HAsv08OLl0RhX
 tJvAMZRgmwPxShy57cmkhgjbdY+DkIcto1HlGINBZ2o95jurfG2rUWJJ/wHWju+CoxhM6eAyZ
 0/xK7EiGwiiaQdnNcDxfs/M1adH7NoXekkc9apQ6qNutjcBXpXO9AYwn4nOWkW2EyGEsPe7kv
 if91oA/YLAyVRVDhKGvBjN0IOxC7QSOGjkia7kxFi5bUoMI4epFU/QP8JdDV77eQe/DY6Bb3r
 pc0am7QVaCpqNoYT+TFMfPg5kC2TsUdBy4HiliFXNbP+Q2hug2CNObXKHFyXasTph+tmf5p0e
 ANtIyCC+y5Bj66cG3fRQc/j/e62d6vjM+BhXiP2pDt3mf0tBk1QSPGLYGA3d0CzLAy+oSoEpc
 DzQs84sK+PaT9UBocdRuhULWR7slgRFMAa6UyzDC75RLOqlbmpjnDfwcsDpb/S+8rlxfCnbzQ
 27Ll1WY8+j7OppMk1xz4aftiKFX1lGgIWWeEG6BkmtQalYzVuyp6PuCsKXfD0lWCHpbTwod6X
 Auv1elhd2q/82NAi82EJbC6z59GcVPr8VHWbV43txLadBm7Z9LVKBWl71KfF35efh+17mauJi
 sODvQHu6NC2Wdjck5ipaGSZ9y0Og7VIIyxTnv+LMSQS+99RsVVHGqz1aWDSkaRORQZUY7aLIb
 9bdhYxubGwLOiYn3kFvrwU7joYCfBceVr0fT9lHjWbHCOo/GDa9QmaVtYZ1+Q/nOjnsaUb7ws
 Redo8xmjUl5xKQX7C/dQ==
Content-Transfer-Encoding: quoted-printable

Linux Wireless Extensions (Wext) support is enabled per default in
NetworkManager. Having Wext enabled without enabling WiFi support, too,
doesn't make much sense. Therefore, instead of creating a separate
PACKAGECONFIG flag, 'wext' was added to the already existing 'wifi'
flag.

Signed-off-by: Nicolas Jeker <n.jeker@gmx.net>
=2D--
 .../networkmanager/networkmanager_1.28.0.bb                     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkma=
nager_1.28.0.bb b/meta-networking/recipes-connectivity/networkmanager/netw=
orkmanager_1.28.0.bb
index 157a7e7b0..1b4fa95a2 100644
=2D-- a/meta-networking/recipes-connectivity/networkmanager/networkmanager=
_1.28.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1=
.28.0.bb
@@ -80,7 +80,7 @@ PACKAGECONFIG[dnsmasq] =3D "--with-dnsmasq=3D${bindir}/d=
nsmasq"
 PACKAGECONFIG[nss] =3D "--with-crypto=3Dnss,,nss"
 PACKAGECONFIG[resolvconf] =3D "--with-resolvconf=3D${base_sbindir}/resolv=
conf,,,resolvconf"
 PACKAGECONFIG[gnutls] =3D "--with-crypto=3Dgnutls,,gnutls"
-PACKAGECONFIG[wifi] =3D "--enable-wifi=3Dyes,--enable-wifi=3Dno,,wpa-supp=
licant"
+PACKAGECONFIG[wifi] =3D "--with-wext=3Dyes --enable-wifi=3Dyes,--with-wex=
t=3Dno --enable-wifi=3Dno,,wpa-supplicant"
 PACKAGECONFIG[ifupdown] =3D "--enable-ifupdown,--disable-ifupdown"
 PACKAGECONFIG[qt4-x11-free] =3D "--enable-qt,--disable-qt,qt4-x11-free"
 PACKAGECONFIG[cloud-setup] =3D "--with-nm-cloud-setup=3Dyes,--with-nm-clo=
ud-setup=3Dno"
=2D-
2.30.0

