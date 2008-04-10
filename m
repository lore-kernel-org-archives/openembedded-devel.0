Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1JjxqC-0007uj-Iu
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Apr 2008 16:33:28 +0200
Received: (qmail invoked by alias); 10 Apr 2008 14:33:24 -0000
Received: from brln-4db998e3.pool.einsundeins.de (EHLO [192.168.4.110])
	[77.185.152.227]
	by mail.gmx.net (mp053) with SMTP; 10 Apr 2008 16:33:24 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX19qizEMo6VqW6Z3jCi1bzakemZZpTCwsx0V04DYsr
	+zZ7TRwhTSJ2oU
Message-ID: <47FE2530.2@gmx.net>
Date: Thu, 10 Apr 2008 16:33:20 +0200
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.9 (X11/20080110)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <35a670560804100650w7de4cec0gae583d5ae73b8fad@mail.gmail.com>
In-Reply-To: <35a670560804100650w7de4cec0gae583d5ae73b8fad@mail.gmail.com>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
Subject: Re: Building ubuntu/gcc-4_2-branch to get GCJ for arm EABI
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
X-List-Received-Date: Thu, 10 Apr 2008 14:33:30 -0000
X-Groupsio-MsgNum: 4938
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig13771E2D465E049734259CE1"

--------------enig13771E2D465E049734259CE1
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Matthijs,
I am interested in seeing a working GCJ on ARM EABI, too.

Matthijs van de Water schrieb:
> I was thinking of calling my package 'gcc-4.2.3-ubuntu' does that make =
sense?
For testing purposes it makes sense to

> For now, I simply copied 4.2.2*.bb and 4.2.2*.inc files to 4.2.3-ubuntu=
 files:
>     gcc_4.2.3-ubuntu.bb
>     gcc-cross_4.2.3-ubuntu.bb
>     gcc-4.2.3-ubuntu.inc
>     gcc-cross-sdk_4.2.3-ubuntu.bb
>     gcc-cross-initial_4.2.3-ubuntu.bb
>     gcc-4.2.3-ubuntu
You do not need to modify gcc-cross-initial and gcc-cross-sdk in the
first place because the GCJ in them is not used at all. You need to
modify gcc-cross and gcc however.

You will use first to ahead-of-time compile your Java app and create the
db file. The latter contains gij which you have to put on your target
device.

> and changed gcc-4.2.3-ubuntu.inc to point its SRC_URI to svn, S to the
> correct dir and enabled JAVA by
> JAVA_linux-gnueabi =3D ",java"
Not quite sure whether this is the way it is supposed to do. I thought
there is a variable enable_java or something like that in the recipes
which you have to set to 1 in your local.conf.

> I'm running a build now (but that tends to take quite a while) and
> I'll report back my findings. Any suggestions or general explanations
> of how all these packages work together are more than welcome, because
> I'm not really sure what I'm doing...
Please report your results.

If you get it working please try whether the GCJ patches can be applied
to any of the existing GCC versions within OE. That way all
distributions in OE can make use of it optionally (when they switch to
this GCC).

Regards
Robert


--------------enig13771E2D465E049734259CE1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFH/iUzG9cfwmwwEtoRCCMWAJ0ZJY7+q3nBPmk0qU/JyTD3HVaQPACdFRwV
cn2ZAmA+q6KgWJKDrl0/Dqs=
=IJJr
-----END PGP SIGNATURE-----

--------------enig13771E2D465E049734259CE1--
