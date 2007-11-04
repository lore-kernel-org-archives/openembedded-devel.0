Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1Iookp-00067Q-Lp
	for openembedded-devel@openembedded.org; Mon, 05 Nov 2007 00:19:44 +0100
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	lA4NItUo022882 for <openembedded-devel@lists.openembedded.org>;
	Mon, 5 Nov 2007 00:18:56 +0100
Message-ID: <472E5362.8040909@student.utwente.nl>
Date: Mon, 05 Nov 2007 00:18:58 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <E1Ioitd-00024s-TQ@linuxtogo.org>
	<200711042303.04292.openembedded@haerwu.biz>
In-Reply-To: <200711042303.04292.openembedded@haerwu.biz>
X-Enigmail-Version: 0.95.5
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
X-MIME-Autoconverted: from 8bit to quoted-printable by smtp.utwente.nl id
	lA4NItUo022882
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
X-List-Received-Date: Sun, 04 Nov 2007 23:19:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Marcin Juszkiewicz schreef:
> Dnia niedziela, 4 listopada 2007, mickeyl commit napisa=C5=82:
>=20
>> neod: add dependency to dbus-1
>>
>> Author: mickeyl@openembedded.org
>> Branch: org.openembedded.dev
>> Revision: dfbec4dce18c3885b36210c05ed69759ab6bf5b6
>=20
>> packages/openmoko2/neod_svn.bb	6cc80a4570dfd74c4eefe208b331a5b8c8d049a=
f
>> packages/openmoko2/neod_svn.bb	92a5e00ba437275e36002f64963caa7aab304a1=
7
>> @@ -1,7 +1,7 @@ DEPENDS =3D "gtk+ pulseaudio"
>>  DESCRIPTION =3D "Simple Neo1973 Daemon for Button Handling and Power=20
>>  Management" =20
>>  SECTION =3D "openmoko/daemons"=20
>>  DEPENDS =3D "gtk+ pulseaudio"
>> -RDEPENDS =3D "gpe-scap xrandr alsa-utils-amixer apm"
>> +RDEPENDS =3D "gpe-scap xrandr alsa-utils-amixer apm dbus-1"
>=20
> Why such rdependency? If it does not use dbus libraries then it does no=
t=20
> need it. If it use them then it gets linked to it.

There are 2 cases[*] where you need to add RDEPENDS manually for such a
thing:

1) when using something like dlopen();
2) when using something like system();

neod uses option 2):

g_spawn_command_line_async( "dbus-send /org/freedesktop/PowerManagement
org.freesmartphone.powermanagement.ChargerConnected", NULL );

Apart from that adding 'dbus-1' breaks OE, you should use 'dbus'
instead, OE will automagically convert that to 'dbus-1' when using
debian.bbclass.

regards

Koen

- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

[*] 2 cases I know off, but I'm not a coder
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD4DBQFHLlNTMkyGM64RGpERAmvMAKCWlwivubDR8TWvfOqzbpcaExPYogCWLjbY
TPE9f5nPKNYLYILdMZiiTA=3D=3D
=3DZdnm
-----END PGP SIGNATURE-----


