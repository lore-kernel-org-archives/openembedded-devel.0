Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S7p83-0001uE-7h
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Mar 2012 15:24:39 +0100
Received: by wibhj13 with SMTP id hj13so6268852wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Mar 2012 07:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=PA6rgO9xTggwvVb3ZewWnI0ejbSZexVoc3J19x/3LrY=;
	b=Gy2zCUiRLc2aX41ux1qrr/PdwxPrfqbyO3AJSarR6jx4J6zbJVPuJ8ulocynC4Jlt6
	cMDLvQrIj98y/biRJvT840Qyt4cl6rW/gLhY4Y9QpH5EPn3CTkduB835UojgsJOicrKk
	0mZPqKQhTud6QNFQ9WqgAYLky3dTQjU5i7VuVrhbrve2lR1mkl/xR1WD6UBP1i7HOUt4
	GScfowLdDpD7yn8dcofWG3O8HRd40cRQGjeoR108rna2/5vDf2ED8SntwYQzQBHdKoL9
	4wExTlgwZYu3ptYoIMWoJh5TMBKIkoOTPZAOBzsbI+q17/BLarDGXxInQCsCjJKNPe9E
	BPiQ==
Received: by 10.180.81.37 with SMTP id w5mr6748208wix.16.1331734554109;
	Wed, 14 Mar 2012 07:15:54 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n8sm16994491wix.10.2012.03.14.07.15.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 14 Mar 2012 07:15:53 -0700 (PDT)
Date: Wed, 14 Mar 2012 15:15:51 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120314141551.GH3919@jama.jama.net>
References: <20120313114820.9572210335@opal>
	<20120314070803.GB3919@jama.jama.net>
	<20120314084016.GD3919@jama.jama.net>
	<4F60A1A6.4090204@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <4F60A1A6.4090204@opendreambox.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [oe-commits] Andreas Oberritter : qt4: fix deps in libQtWebkit.la and QtWebKit.pc
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
X-List-Received-Date: Wed, 14 Mar 2012 14:24:39 -0000
X-Groupsio-MsgNum: 37762
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AqCDj3hiknadvR6t"
Content-Disposition: inline

--AqCDj3hiknadvR6t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 14, 2012 at 02:48:22PM +0100, Andreas Oberritter wrote:
> On 14.03.2012 09:40, Martin Jansa wrote:
> > On Wed, Mar 14, 2012 at 08:08:03AM +0100, Martin Jansa wrote:
> >> On Tue, Mar 13, 2012 at 11:48:20AM +0000, git@git.openembedded.org wro=
te:
> >>> Module: openembedded-core.git
> >>> Branch: master
> >>> Commit: 4c41a3204ef72f53813ddc86fe525fa9c6714daa
> >>> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dco=
mmit;h=3D4c41a3204ef72f53813ddc86fe525fa9c6714daa
> >>>
> >>> Author: Andreas Oberritter <obi@opendreambox.org>
> >>> Date:   Wed Mar  7 21:36:28 2012 +0100
> >>>
> >>> qt4: fix deps in libQtWebkit.la and QtWebKit.pc
> >>>
> >>> * Both files contain -L../../WebCore/release -L../../JavaScriptCore/r=
elease -lwebcore -ljscore
> >>> * These paths and libs don't get installed.
> >>> * When building a shared lib with libtool, that links
> >>>   with libQtWebKit, libtool adds these unneeded parameters
> >>>   to the linker command-line, thus linking fails.
> >>
> >> BTW: here with bitbake having R/W to rootfs every qt4-x11-free build
> >> creates /include/WebCore/libdummy.prl (yes really in root)
> >> anynone seen this?
> >> -rw-r--r-- 1 bitbake bitbake 680 Mar 14 01:13 /include/WebCore/libdumm=
y.prl
>=20
> I'm only using qt4-embedded, with which I haven't noticed this file.

I guess it fails on most builders as user running bitbake doesn't have
right to create it (my is special because it's minimal chroot
environment owned by same user as who is running bitbake process).

> >> Maybe it's sign of another small issue in qt4 build.
> >=20
> > It's created during do_configure and probably caused by
> > ./qt-everywhere-opensource-src-4.8.0/src/3rdparty/webkit/Source/WebKit2=
/Makefile:all: Makefile /include/WebCore/libdummy.prl  /include/WebCore/$(T=
ARGET)
> > ./qt-everywhere-opensource-src-4.8.0/src/3rdparty/webkit/Source/WebKit2=
/Makefile:/include/WebCore/libdummy.prl:
> >=20
> > But in unpacked sources closest thing to libdummy.prl is=20
> > ./Source/WebKit2/DerivedSources.pro:TARGET =3D dummy
>=20
> I thought that Qt 4.8 didn't use WebKit2 by default. Did you enable it
> manually?

No everything default oe-core+meta-oe.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--AqCDj3hiknadvR6t
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9gqBcACgkQN1Ujt2V2gBxutgCcC2iDICg2wCPnsewwwwmQTd+k
FrwAni0FCCGDe5I9TvkslLKTdPwjXgyH
=eI8V
-----END PGP SIGNATURE-----

--AqCDj3hiknadvR6t--
