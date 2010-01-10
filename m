Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NTsdx-0000Ll-Mg for openembedded-devel@lists.openembedded.org;
	Sun, 10 Jan 2010 08:55:28 +0100
Received: from f053034057.adsl.alicedsl.de ([78.53.34.57]
	helo=[192.168.178.25])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NTsbw-0000uT-D3 for openembedded-devel@lists.openembedded.org;
	Sun, 10 Jan 2010 07:53:20 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jan 2010 08:53:18 +0100
Message-ID: <1263109998.16109.11.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: vdr: questions regarding cplusplus.patch
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
X-List-Received-Date: Sun, 10 Jan 2010 07:55:28 -0000
X-Groupsio-MsgNum: 15513
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-Gs2UdojILnohrX1GgYxF"

--=-Gs2UdojILnohrX1GgYxF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Henning and list,


packaging VDR for OE you added cplusplus.patch [1] to be applied. I am
trying to get the patches upstream, but I have some questions.

Is it correct, that the two changes have the following goals?

1. Instead of using the C headers which are deprecated use the headers
provided by C++ as mentioned for example in [2].
2. You changed `canonicalize_file_name(FileName);` to
`realpath(FileName,NULL);`. Is that because OE just support Linux and
not GNU/Hurd for example [3]?
3. I do not understand why a lot of headers are included in tools.h and
tools.c. But I have to look that up in some reference.


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/vdr/fil=
es/cplusplus.patch
[2] http://en.wikipedia.org/wiki/Stdarg.h
[3] http://mail.gnome.org/archives/gtk-devel-list/2002-October/msg00111.htm=
l

--=-Gs2UdojILnohrX1GgYxF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktJh1gACgkQPX1aK2wOHVieMACfdi+RYs54OqMazH8Orm8lzNX6
pGEAnREittHnU8f+nX4zFDV2vNAHQsuh
=Z0Dv
-----END PGP SIGNATURE-----

--=-Gs2UdojILnohrX1GgYxF--
