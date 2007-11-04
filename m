Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <openembedded@haerwu.biz>) id 1IonZG-0007Bn-HE
	for openembedded-devel@openembedded.org; Sun, 04 Nov 2007 23:03:42 +0100
Received: (qmail 5808 invoked by uid 813007); 4 Nov 2007 22:03:04 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 4 Nov 2007 22:03:04 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 4 Nov 2007 23:03:03 +0100
User-Agent: KMail/1.9.7
References: <E1Ioitd-00024s-TQ@linuxtogo.org>
In-Reply-To: <E1Ioitd-00024s-TQ@linuxtogo.org>
MIME-Version: 1.0
Message-Id: <200711042303.04292.openembedded@haerwu.biz>
Subject: Re: [oe-commits] org.oe.dev neod: add dependency to dbus-1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 04 Nov 2007 22:03:43 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia niedziela, 4 listopada 2007, mickeyl commit napisa=B3:

> neod: add dependency to dbus-1
>
> Author: mickeyl@openembedded.org
> Branch: org.openembedded.dev
> Revision: dfbec4dce18c3885b36210c05ed69759ab6bf5b6

> packages/openmoko2/neod_svn.bb	6cc80a4570dfd74c4eefe208b331a5b8c8d049af
> packages/openmoko2/neod_svn.bb	92a5e00ba437275e36002f64963caa7aab304a17
> @@ -1,7 +1,7 @@ DEPENDS =3D "gtk+ pulseaudio"
>  DESCRIPTION =3D "Simple Neo1973 Daemon for Button Handling and Power=20
>  Management" =20
>  SECTION =3D "openmoko/daemons"=20
>  DEPENDS =3D "gtk+ pulseaudio"
> -RDEPENDS =3D "gpe-scap xrandr alsa-utils-amixer apm"
> +RDEPENDS =3D "gpe-scap xrandr alsa-utils-amixer apm dbus-1"

Why such rdependency? If it does not use dbus libraries then it does not=20
need it. If it use them then it gets linked to it.

Neod currently is linked to gconf which is linked to dbus. So maybe there=20
is other place where this rdependency should be placed?

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

         Computers are not intelligent. They only think they are.




