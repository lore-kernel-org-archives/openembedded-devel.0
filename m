Received: from [134.169.172.64] (helo=thebe.totalueberwachung.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <daniel@totalueberwachung.de>)
	id 1LN4LD-00084e-0z; Wed, 14 Jan 2009 12:55:23 +0100
Received: from adrastea.totalueberwachung.de
	(adrastea.dyn.totalueberwachung.de [192.168.0.8])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by thebe.totalueberwachung.de (Postfix) with ESMTP id 71406D8323;
	Wed, 14 Jan 2009 12:48:48 +0100 (CET)
Date: Wed, 14 Jan 2009 12:48:42 +0100
From: Daniel Willmann <daniel@totalueberwachung.de>
To: openembedded-commits@lists.openembedded.org
Message-ID: <20090114124842.32a3241e@adrastea.totalueberwachung.de>
In-Reply-To: <20090113203242.4D378189331@amethyst.openembedded.net>
References: <20090113203242.4D378189331@amethyst.openembedded.net>
X-Mailer: Claws Mail 3.6.1 (GTK+ 2.12.11; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Cc: Koen Kooi <koen@openembedded.org>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] Koen Kooi : mtd-utils-native: remove default-preference from 1.20+git, it shows now errors in my tests
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
X-List-Received-Date: Wed, 14 Jan 2009 11:55:24 -0000
X-Groupsio-MsgNum: 7221
Content-Type: multipart/signed; boundary="Sig_/_uj38FXSYIBNO1Kp+QnpkTw";
	protocol="application/pgp-signature"; micalg=PGP-SHA1

--Sig_/_uj38FXSYIBNO1Kp+QnpkTw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 13 Jan 2009 21:32:42 +0100 (CET)
git@amethyst.openembedded.net (GIT User account) wrote:

> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: 78fca8ee204f310352b0bc950fd9a536a98e5d2e
> URL:
> http://gitweb.openembedded.net/?p=3Dopenembedded.git&a=3Dcommit;h=3D78fca=
8ee204f310352b0bc950fd9a536a98e5d2e
>=20
> Author: Koen Kooi <koen@openembedded.org>
> Date:   Tue Jan 13 21:31:16 2009 +0100
>=20
> mtd-utils-native: remove default-preference from 1.20+git, it shows
> now errors in my tests

mtd-utils-native fails here with:

| make[1]: Leaving directory `/home/alphaone/oe-dev/tmp/work/x86_64-linux/m=
td-ut
ils-native-1.2.0+git-r2/git/ubi-utils'
| ccache gcc  -isystem/home/alphaone/oe-dev/tmp/staging/x86_64-linux/usr/in=
clude
 -O2 -I/home/alphaone/oe-dev/tmp/work/x86_64-linux/mtd-utils-native-1.2.0+g=
it-r2
/git//include -DWITHOUT_XATTR -L/home/alphaone/oe-dev/tmp/staging/x86_64-li=
nux/u
sr/lib -Wl,-rpath-link,/home/alphaone/oe-dev/tmp/staging/x86_64-linux/usr/l=
ib -W
l,-rpath,/home/alphaone/oe-dev/tmp/staging/x86_64-linux/usr/lib -Wl,-O1  -g=
 -o /
home/alphaone/oe-dev/tmp/work/x86_64-linux/mtd-utils-native-1.2.0+git-r2/gi=
t/ftl
_format /home/alphaone/oe-dev/tmp/work/x86_64-linux/mtd-utils-native-1.2.0+=
git-r
2/git/ftl_format.o
| /home/alphaone/oe-dev/tmp/work/x86_64-linux/mtd-utils-native-1.2.0+git-r2=
/git/
mkfs.ubifs/mkfs.ubifs.o: In function `write_super':
| /home/alphaone/oe-dev/tmp/work/x86_64-linux/mtd-utils-native-1.2.0+git-r2=
/git/mkfs.ubifs/mkfs.ubifs.c:1866: undefined reference to `uuid_unparse_upp=
er'
| collect2: ld returned 1 exit status
| make[1]: *** [/home/alphaone/oe-dev/tmp/work/x86_64-linux/mtd-utils-nativ=
e-1.2.0+git-r2/git/mkfs.ubifs/mkfs.ubifs] Error 1
| rm /home/alphaone/oe-dev/tmp/work/x86_64-linux/mtd-utils-native-1.2.0+git=
-r2/git/mkfs.ubifs/mkfs.ubifs.o
| make[1]: Leaving directory `/home/alphaone/oe-dev/tmp/work/x86_64-linux/m=
td-utils-native-1.2.0+git-r2/git/mkfs.ubifs'
| make: *** [subdirs_mkfs.ubifs_all] Error 2
| make: *** Waiting for unfinished jobs....

The older version still works.

Regards,
Daniel Willmann

--Sig_/_uj38FXSYIBNO1Kp+QnpkTw
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)

iEYEARECAAYFAklt0RwACgkQZ2fhlIqbZ1h1hwCghXAzUaluimKq9Aj2G9OaAbpB
+vcAoKRnD7T5ojzdkvBBVQQRn15Dyr1J
=zBfH
-----END PGP SIGNATURE-----

--Sig_/_uj38FXSYIBNO1Kp+QnpkTw--
