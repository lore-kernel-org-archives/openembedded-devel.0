Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by mx.groups.io with SMTP id smtpd.web10.9591.1611649538707104691
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jan 2021 00:25:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=G8iQ3p+k;
 spf=pass (domain: gmx.net, ip: 212.227.17.21, mailfrom: n.jeker@gmx.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1611649536;
	bh=Bhd2y9U6vsT2VTsrisbGayJ44Cho5FqPz+/Xo+M88jk=;
	h=X-UI-Sender-Class:From:To:Subject:Date;
	b=G8iQ3p+kArB/jk3vUbOA7U4fKijCZDCuzKL0BXKqhzDQaDhAZEduvsB6CseEEdaN4
	 PPuACF3bMwsL1kfFQ6CGlcT83QgXeYFSnDwhE57Y+/UrQv5IO9OaNvqX7bKF0JLOrF
	 uRjYK2UbbEJXazOFtHB7LKNVbxVfkmyWpaEjIeDk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from station.v.cablecom.net ([84.75.156.97]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MLzBp-1lLZZJ1Yyv-00HzKr for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jan 2021 09:25:36 +0100
From: "Nicolas Jeker" <n.jeker@gmx.net>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/2] networkmanager: Add PACKAGECONFIG for ovs
Date: Tue, 26 Jan 2021 09:25:34 +0100
Message-Id: <20210126082535.49621-1-n.jeker@gmx.net>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:4Ot2fH11GLGcP4srZs1dcQOGdnLixi3yWKU3nHVcOmkEqwOpXzI
 JlPB6vLMI1VJNSOjR/J1f2ZvPaMv8+3vcoZrQfvQLy8lOb+++NJCvXhkKw7GJdIon90AyVx
 4CsFFG+yDA+SJVlpno5MhNctrB/McVVz0h1WWzHrIqZebQqjDA4EW9cJ6A274G30+0VLSug
 5CKM/mVn1X64iV5XuxKAQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:q/sobd7ybPY=:1iranqB85Dpg3HSNTlySL/
 RdO5HGPHe3yqwL1K1Ta9p0iUQwtz0TMTDHw6t8N13WmM3RKinqeMBbKx/I4n7kwMyVXGBpxNP
 4CpmZOOjuIKHfqxFyz6BizPaTgtDd5c2d6+DA3bF5Rjld61lvWhFYdm3tG9LW+T1sBIr6XHHX
 n4Jp1dwYnfL5ohXEHqWHktdf6nt7jDPIf3egBj2i9sg0nzrMfznldrPUfNXuGUi+VDfYV11VE
 msZxJPb3i5so1UjqAk51bC/1e3e4oDvKzIcq0OK6r42xh33RtI8WLSzuzf1Q0SrAR2SrsPutf
 Ph4/L+BDDj9UOJqlpseaF5TN2C4U65f9wfZgrMqayLw3wixXtJYTuW/pdEFV8aeGD+4TGXARa
 YREfug3Gc7UlOzzStgX9JhkMDCD5PH7/n5OPXPrSLsEBn6e4asPiWaIYoIQyX2uUEyTSv7RWR
 cPuIDwuOd1V7QIn/RabGQTQrSiDSqkdTpi0qAE8va9qiLY1QZ5d1tbNfxTFZqJVb14dpuWl1H
 wuF+pVS3Sxw/3G+AnEpRvE7Ya6SoF4kSwToJOg4D2lXEs+yga8hd8kmkoSGabDd6iO8dQ+lfM
 hjuL1n6CUU6gwJn3R7mLC8DRTXHuP1GAaTGiEtj+v7ggiEROCE8bFzEM48uzMyBXFpeIRld74
 Xb4rmRQ9B1Q0tnF94csIYxHp47LS8Gjon/Ou7OhhoOxOgjLiaAwT1VEMMhmFHSfe8qR7APxIj
 EY36rGsOZi2W1Ohj5yDoCRmkhOAIzK2MgX2MheiRbEllChacXma0pUDPG1C+v2nSZXo6PQ2RH
 YaR/+89O/V5bnkwz7R9C3sWjoXPRMqSemPj1rcoWTBVH3Kkq1LBy13ICzLuO+kwApKxghaHxQ
 Bj0b/YRYOZY5e5Z2f8Sg==
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

