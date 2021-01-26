Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by mx.groups.io with SMTP id smtpd.web10.10028.1611653485381006491
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jan 2021 01:31:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=DtoYzoxQ;
 spf=pass (domain: gmx.net, ip: 212.227.17.21, mailfrom: n.jeker@gmx.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1611653483;
	bh=XPh+3ZHsZgl1Daq/IWmoa8KQJxIX/L8tl41Vyl8SJh8=;
	h=X-UI-Sender-Class:From:To:Subject:Date;
	b=DtoYzoxQUn08PLw+x4YgwIFB26T+EHWa6tSyLTUEY5aMf5ILFP/Opc/HTbZ1+s787
	 vckXmrpYS6gMEGQXGU8PfH6hTibToJcMh70QL0rlCNSF8CbFcsqvGyvLedKlOWa1G6
	 +LuqZzg3lvcGuI894dgY+N4vENTgWPdIWKNenFaQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from station.v.cablecom.net ([84.75.156.97]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MWRVb-1lW1se0k39-00XqqJ for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jan 2021 10:31:23 +0100
From: "Nicolas Jeker" <n.jeker@gmx.net>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH v2] networkmanager: Add PACKAGECONFIG for ovs
Date: Tue, 26 Jan 2021 10:31:22 +0100
Message-Id: <20210126093122.716978-1-n.jeker@gmx.net>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:HfWcNSMIXa7LPOSI+fzLBNw+mOREtQ8QIAjHnh+BBXQKB325jjN
 E2ywc8d9qE4jO+ioMJkIkhw+3JPQz+/6tDUjo4vPn97BLDKzFzqGLcOvSpkksiwtxk7pYrq
 9rmfPTh0AnAdTO13mDab2X+EESC6S3HZcfLBVudRbwI7zEWWSkHZmveVDsHKTPEHg+ZNOwR
 zrIyaD2c7WLiFOKpDDt1w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:RhybztfjWy8=:UHIf7s2TBSGEWuanQh6q4Q
 cC9fDuqMBTY4HeoXBP3n2+ovyvKO5rLXn4VkDfZSMbPSMIm2HNt8M3d93sK9DItcb1+C3MhPn
 USXdUGGq4UAZewRxSt7+tNgkwWeOUUGLUkHpqp7IcU92ehzFzXuPo/fOm+JVotqbYubFdOU++
 Jq+TUbYhZik0GUTWCgQ0C8hlnjE4SKo6AYBWcJ09NXjKqwDqKu0Q5gWPFTrUVyK9Z1306H0ha
 LlGvMSt7LZtYRMuqBwOaadAJ28eXDH6q9+4q4RtPYD0yTG7AvfhXDW8DBIwKetDhYJ28n+Dv5
 rCOVmy71I0OmkI1QA0DnvqOyHzcHmAk3cQe/p0xoEjJ+CPdF2NDHv0/7V+ruBpJy7OvLAyZGS
 amE2We383AzjWJe6yAVb9gsICm9C2rz3IBiIp2xzvad69ZhOGk4tABskv8/HaHy0hAc1EEPq2
 s4m1duId/W++TzHRAIQo7bVfOYJj9X6AMONnS7NpgUuqwdptAyHfqxEcgs9XdPafh0rCIfoye
 C5ag90IB6v7VqSd22aTP8Qet7CyyBJpEHpGwXhp3Xkzc6k27llcKmP48KfpSa5q1FoY4w8dGa
 MgRQrYcgoajHItXHFY+T5j76nzzlWnyQnxn70CWvOhodOQHgPbCqsqfnaGw5payQEoPmwzPxI
 tV2XGHE/zDnjV6uhsRP5vKUB+V2vxymFNO2udNVyb6eFv9Fkk3xORYUTw2e7niCWQBNCATjLT
 Qupzf7mKcNEYhbjWE18/nVeLtxqarrCG0rqsm2S7xtt60olArMLyclwvcI+X4kztvhSB+Mp/+
 5yuDdx9XUKbGGnvi3DZM+5WVUM4vJfpLZbkPCHBE3KIQkp79IcPgVM6dXIw+buYwNDcUkXi1a
 h18G0SEKgtJ4W0MSno9g==
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
index 3e7a068ac..646ebea49 100644
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

@@ -85,6 +84,7 @@ PACKAGECONFIG[wifi] =3D "--with-wext=3Dyes --enable-wifi=
=3Dyes,--with-wext=3Dno --enable
 PACKAGECONFIG[ifupdown] =3D "--enable-ifupdown,--disable-ifupdown"
 PACKAGECONFIG[qt4-x11-free] =3D "--enable-qt,--disable-qt,qt4-x11-free"
 PACKAGECONFIG[cloud-setup] =3D "--with-nm-cloud-setup=3Dyes,--with-nm-clo=
ud-setup=3Dno"
+PACKAGECONFIG[ovs] =3D "--enable-ovs,--disable-ovs,jansson"

 PACKAGES =3D+ " \
   ${PN}-nmcli ${PN}-nmcli-doc \
=2D-
2.30.0

