Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <thebohemian@gmx.net>) id 1LSYZi-0004vk-A3
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Jan 2009 16:13:02 +0100
Received: (qmail invoked by alias); 29 Jan 2009 15:05:19 -0000
Received: from p579E182A.dip.t-dialin.net (EHLO [192.168.4.51]) [87.158.24.42]
	by mail.gmx.net (mp046) with SMTP; 29 Jan 2009 16:05:19 +0100
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX19k/2YtmnBk8yBi9PeEtK4c2Q3EbFDJHVF0rUY1UT
	m4lBk3GY6fZluF
Message-ID: <4981C586.4080202@gmx.net>
Date: Thu, 29 Jan 2009 16:04:38 +0100
From: Robert Schuster <thebohemian@gmx.net>
User-Agent: Thunderbird 2.0.0.19 (X11/20090105)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4981B266.6010501@mgb-tech.com>
In-Reply-To: <4981B266.6010501@mgb-tech.com>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.58
Subject: Re: GNU Classpath and the XMPP Smack API
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Jan 2009 15:13:02 -0000
X-Groupsio-MsgNum: 7483
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig6733E4D830195BC97ACF8CBD"

--------------enig6733E4D830195BC97ACF8CBD
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

Jan Pannecoeck schrieb:
> As the subject is already telling you, I'm stuck trying to get the Smac=
k
> API working on my embedded device. The Smack library is written to
> communicate using XMPP. I know already that smack is developed to work
> under the Java Sun library, and that using GNU Classpath could cause
> problems. But since they have managed to get it working at Android, wit=
h
> the GNU Classpath, I think that it should be possible to run it also on=

> an OpenEmbedded device.
Android is using Apache's JavaSE library called Harmony.


> I've got the latest version of the smack.jar that was patched for the
> Android, but that still isn't working. I have had a bunch of different
> errors like:
>=20
> - OEFException during the SSLSocket doHandshake method.
> - KeyStoreException: jks during an SALSAuthentication
First of all, the "Java Keystore" (jks) format isn't supported by GNU
Classpath.

Furthermore I know that SSL stuff often caused trouble but do not
understand this enough to fix it on my own.

> I know this problem is quite big and my explanation is probably not tha=
t
> great neither, but still I hope that someone has done this before and
> succeeded in his mission. If someone could send me some more informatio=
n
> about this, or a working smack.jar (if possible with source code) that
> would be great!!
>=20
> All help is welcome ofcourse!
If you are adventurous you might try the Cacao+OpenJDK solution for your
device.
That would give you OpenJDK class library plus Cacao as the VM.

In order to build it you need to add the Jalimo SVN repo as an overlay
to OE. Disable the strict md5sum checking for now, since the files
mentioned in the overlay are not in OE's official checksum.ini .

Regards
Robert




--------------enig6733E4D830195BC97ACF8CBD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEARECAAYFAkmBxYYACgkQG9cfwmwwEtpS4gCfRuQ7FUO76KWOb5dO5O746nYt
Ua4AnRPdj4TpNQIrcoK5qiZlCFSGl79N
=TLZI
-----END PGP SIGNATURE-----

--------------enig6733E4D830195BC97ACF8CBD--
