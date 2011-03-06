Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PwFmO-0001mY-NR for openembedded-devel@lists.openembedded.org;
	Sun, 06 Mar 2011 16:21:56 +0100
Received: from f053033200.adsl.alicedsl.de ([78.53.33.200]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PwFkw-0007sd-Vm for openembedded-devel@lists.openembedded.org;
	Sun, 06 Mar 2011 15:20:27 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <BAY127-W1827E1EE86FC2D2EC65922D8C40@phx.gbl>
References: <BAY127-W1192DA5D5640002E5C3260D8DE0@phx.gbl>
	, <BAY127-W206420CDF3284BCE4FAF0CD8C10@phx.gbl>
	<BAY127-W1827E1EE86FC2D2EC65922D8C40@phx.gbl>
Date: Sun, 06 Mar 2011 16:20:25 +0100
Message-ID: <1299424825.28285.20.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: Linux-libc-headers do_fetch Failed due to cheksum mismatch
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
X-List-Received-Date: Sun, 06 Mar 2011 15:21:56 -0000
X-Groupsio-MsgNum: 29947
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-N0c6yhkMhTgw5vSJ3P3Z"

--=-N0c6yhkMhTgw5vSJ3P3Z
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Saleh,


Am Sonntag, den 06.03.2011, 19:49 +0500 schrieb saleh usman:

[=E2=80=A6]

please do not insert empty lines at the beginning of messages.

> I am building console-image

What machine do you use?

> and having problem while fetching liunx-libc-headers. do_fetch task is
> failed due to checksum mismatch. Kindly guide me how to resolve this
> issue.console log follows
>=20
> NOTE: Running task 16 of 4329 (ID: 678, virtual:native:/oe/openembedded/r=
ecipes/linux-libc-headers/linux-libc-headers_2.6.31.bb, do_fetch)
> NOTE: package linux-libc-headers-native-2.6.31-r6: task do_fetch: Started
> FATAL: linux-libc-headers-native-2.6.31: http://kernel.org/pub/linux/kern=
el/v2.6/linux-2.6.31.tar.bz2 cannot check archive integrity
> ERROR: Error in executing python function in: /oe/openembedded/recipes/li=
nux-libc-headers/linux-libc-headers_2.6.31.bb
> ERROR: Exception:<type 'exceptions.SystemExit'> Message:1
> ERROR: Printing the environment of the function
> ERROR: Function base_do_fetch failed
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of virtual:native:/oe/openembedded/recipes/linux-libc-header=
s/linux-libc-headers_2.6.31.bb do_fetch failed
> NOTE: The checksums for '/oe/openembedded/sources/linux-2.6.31.tar.bz2' d=
id not match.
> Expected MD5: '84c077a37684e4cbfa67b18154390d8a' and Got: '9244b699b96680=
4dfc2e243c89b3ead4'
> Expected SHA256: '0acd83f7b85db7ee18c2b0b7505e1ba6fd722c36f49a8870a831c85=
1660e3512' and Got: 'c522e06dc9639473f9962ed49b038ef5577e5d10cd2f4d9e4c62cd=
f3223de089'
> NOTE: Your checksums:
> SRC_URI[md5sum] =3D "9244b699b966804dfc2e243c89b3ead4"
> SRC_URI[sha256sum] =3D "c522e06dc9639473f9962ed49b038ef5577e5d10cd2f4d9e4=
c62cdf3223de089"
>=20
> FATAL: linux-libc-headers-native-2.6.31: http://kernel.org/pub/linux/kern=
el/v2.6/linux-2.6.31.tar.bz2 cannot check archive integrity

As you can see in the recipe [1] and read in the user manual each
downloaded file has a checksum to check the validity. The file you got
seems to be corrupt, since the checksums in the recipes [1] are also the
ones I got.

        $ wget http://kernel.org/pub/linux/kernel/v2.6/linux-2.6.31.tar.bz2
        --2011-03-06 16:09:49--  http://kernel.org/pub/linux/kernel/v2.6/li=
nux-2.6.31.tar.bz2
        Aufl=C3=B6sen des Hostnamen kernel.org... 130.239.17.4, 149.20.4.69=
, 149.20.20.133, ...
        Verbindungsaufbau zu kernel.org|130.239.17.4|:80... verbunden.
        HTTP-Anforderung gesendet, warte auf Antwort... 200 OK
        L=C3=A4nge: 61494822 (59M) [application/x-bzip2]
        In =C2=BBlinux-2.6.31.tar.bz2=C2=AB speichern.
       =20
        100%[=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>] 61.494.822  1,29M/=
s   in 46s    =20
       =20
        2011-03-06 16:10:35 (1,28 MB/s) - =C2=BBlinux-2.6.31.tar.bz2=C2=AB =
gespeichert [61494822/61494822]
       =20
        $ md5sum linux-2.6.31.tar.bz2=20
        84c077a37684e4cbfa67b18154390d8a  linux-2.6.31.tar.bz2
        $ sha256sum linux-2.6.31.tar.bz2=20
        0acd83f7b85db7ee18c2b0b7505e1ba6fd722c36f49a8870a831c851660e3512  l=
inux-2.6.31.tar.bz2

So something has gone wrong when the file was downloaded to your system.
I suggest to delete `linux-2.6.31.tar.bz2` from your download directory
and try again.


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/linux-l=
ibc-headers/linux-libc-headers_2.6.31.bb?id=3D9f1368c60dcef32eb965c0f9ecb81=
c4adc4f49c5#n27
[2] http://docs.openembedded.org/usermanual/usermanual.html#src_uri_variabl=
e

--=-N0c6yhkMhTgw5vSJ3P3Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk1zpjkACgkQPX1aK2wOHVgKCwCfRs/PVfr6LldVdHbLubGp/Z75
C8oAnjH0CDVuyZK4iDAngRbXmqufNnzV
=eYo6
-----END PGP SIGNATURE-----

--=-N0c6yhkMhTgw5vSJ3P3Z--
