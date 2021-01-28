Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by mx.groups.io with SMTP id smtpd.web12.21186.1611818389009506771
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jan 2021 23:19:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=h5jFa6kp;
 spf=pass (domain: gmx.net, ip: 212.227.15.15, mailfrom: n.jeker@gmx.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1611818387;
	bh=7YZRrAkmsPbKynpxbOjnjCOD9x/YxPiRbY4rYv69J5E=;
	h=X-UI-Sender-Class:From:To:Subject:Date;
	b=h5jFa6kpN8FhpslTE+X1ccrlfO1ecm2MStxjelOkTQB5GLtxP82IVRYkq0d3TU0Xk
	 +7NnU6WVhUFjoeOWU2gRmmejiyrmnNiGYYKcjJtDadZKn0ZYoJQVw5czciYnnzuSOq
	 3BeuPFcVFYBRFDQmRKFcTLCMnZ+iDH0mNUD5Tg5w=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from station.v.cablecom.net ([84.75.156.97]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MgvvT-1ldYSc066H-00hLdq for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Jan 2021 08:19:47 +0100
From: "Nicolas Jeker" <n.jeker@gmx.net>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] network-manager-applet: Build without libteam support
Date: Thu, 28 Jan 2021 08:19:46 +0100
Message-Id: <20210128071946.9624-1-n.jeker@gmx.net>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:yTGa8DClzGlJsHIhIDQ/dyDUC8S4SszSc/t5PTpAh7x/3QkSv1s
 a1lLEURTBEIiifGlwVL6o7PlPBwCtakWM7ykKWH1i5K+sFxW/6USOq9yxknu3x6csVAcvyd
 SyOA044Rb5n/Ha855tpocWair990JspCbabz0ZvUrvVz0lBJGAeqyyoieGIakGtyEnIqNv4
 4fi9AtrY5BwRs1ff4W/yw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:x0rBdPe5oQU=:6EHVYkUCFAwPEm7gL80D6X
 k08PzIbR13ejqI8LmOGSc2saiIJe3P0m2ccIkVu6RfzETPp2lE/i1PYALBWWgaY1lnNLUDddi
 0O0lZER+IKa97rRXIiOMoesTXetjUVnyzGdqtf2aPzAULDOjfx5UUR/N68w7MGdTHjCuQcCKx
 WUhbDR4OymC5X7XKpPPDzM2Rk1uIxDToTSf8cMJ6vS4ApC15/a5dmUPILn2GEocPD+B5R/OR3
 cgzCepsz1Gy3+bTidI067O5cESKS5NMCKqC5FSSl+9sO/lDZg6DAQaxgX4UiO/Sevaw3r5Gi6
 GT/riHIbOba4STsJb9GcIdEnwFcwHZdHlYjdP6GQk/hdz9PUIaBhDeZOd0U7xx31/d/rm61j6
 78H99DiBc6UhG1pyNJyo36VCzfFmfQsHglNTX8GF2/eiIQggNZxaipeuA02Fw7850NufxYhF6
 1EDoMABw8jvA7QA3qOSL0g7XxrDUW/cpwQt2wYqpvZRwwBZub1LlingLLUhbCe2ibAx7fqcTA
 zBw9yYyOvkc8GckJHPWuhtTj9iGxqhHUN7kRos/0GNChk3OdZHa7QZnXqNeGJc853KI+ORLZY
 V07t/1lKsJvVkXsQksnzAg7tjPYElyAaliU9RaT8DwBQnQTQzu36ohp75sGeKdB3rIMsumuxV
 cNyL6PvzYY7vZH2t1XfKfnG4oPGdWna/1tJ519XZBUFfp5HtsH1rG+sXVuxl3HG9lmlD+EmfH
 nBhbF1oYz+mhY09uXR+5k36rgQnVOBs9monboM7YOi+WysgCkPKqy7U8yIyc0gxYbM3xpjh24
 GKbyleBW6NalWrA5UUDLyK8eDD2ewJEKfWCm52ZaUkyQJubUYutfTdjJRLaCYBN6Lwdae563J
 CEm8nGtYROTaTz/zEB7A==
Content-Transfer-Encoding: quoted-printable

NetworkManager is curently built without libteamdctrl support, so
disable it in the applet, too.
=2D--
 .../network-manager-applet/network-manager-applet_1.18.0.bb     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/networ=
k-manager-applet_1.18.0.bb b/meta-gnome/recipes-connectivity/network-manag=
er-applet/network-manager-applet_1.18.0.bb
index f2bc24ea9..bc3e66ca2 100644
=2D-- a/meta-gnome/recipes-connectivity/network-manager-applet/network-man=
ager-applet_1.18.0.bb
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manag=
er-applet_1.18.0.bb
@@ -13,6 +13,8 @@ SRC_URI[archive.sha256sum] =3D "ddbb400ace804b59cc513611=
ce9701f7ef3f00de151dbbfb96

 # We don't not have ubuntu's appindicator (yet?)
 EXTRA_OEMESON =3D "-Dappindicator=3Dno"
+# We currently don't build NetworkManager with libteamdctl support
+EXTRA_OEMESON +=3D "-Dteam=3Dfalse"

 PACKAGECONFIG ??=3D ""
 PACKAGECONFIG[modemmanager] =3D "-Dwwan=3Dtrue, -Dwwan=3Dfalse, modemmana=
ger"
=2D-
2.30.0

