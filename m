Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1SjvIo-0004qZ-Ly
	for openembedded-devel@openembedded.org; Wed, 27 Jun 2012 18:41:14 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id 09A80EA040;
	Wed, 27 Jun 2012 18:37:04 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id A0F6A604DE; Wed, 27 Jun 2012 18:30:21 +0200 (CEST)
Date: Wed, 27 Jun 2012 18:30:21 +0200
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@openembedded.org
Message-ID: <20120627163021.GC25892@hermes>
References: <1340062930-19293-1-git-send-email-apelete@seketeli.net>
	<1340062930-19293-2-git-send-email-apelete@seketeli.net>
	<20120619052932.GN3178@jama.jama.net>
	<20120619060703.GA4845@hermes>
	<20120619063448.GO3178@jama.jama.net>
	<20120619195610.GC4845@hermes> <20120619214933.GG4845@hermes>
	<20120619215238.GH4845@hermes> <20120619215519.GI4845@hermes>
MIME-Version: 1.0
In-Reply-To: <20120619215519.GI4845@hermes>
X-Operating-System: Debian GNU/Linux wheezy/sid
X-URL: http://www.seketeli.net/~apelete
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Kristoffer Ericson <kristoffer.ericson@gmail.com>
Subject: Re: [oe-classic][gtk+][PATCH v2 2/2] gtk+: Add no-test-inline-pixbufs.patch to gtk+-2.20.1
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
X-List-Received-Date: Wed, 27 Jun 2012 16:41:14 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

Le 19-Jun-12, Apelete Seketeli a =E9crit:
> This patch adds a patch to the gtk+-2.20.1 recipe that removes the
> need to build test-inline-pixbufs.h in the demos/Makefile.am file of
> the gtk+-2.20.1 upstream package.
> It also removes all the demo programs that were dependant on
> test-inline-pixbufs.h from demos/Makefile.am.
>=20
> Signed-off-by: Apelete Seketeli <apelete@seketeli.net>
> ---
>  .../gtk+/gtk+-2.20.1/no-test-inline-pixbufs.patch  |   22 ++++++++++++=
++++++++
>  recipes/gtk+/gtk+_2.20.1.bb                        |    1 +
>  2 files changed, 23 insertions(+)
>  create mode 100644 recipes/gtk+/gtk+-2.20.1/no-test-inline-pixbufs.pat=
ch
>=20
> diff --git a/recipes/gtk+/gtk+-2.20.1/no-test-inline-pixbufs.patch b/re=
cipes/gtk+/gtk+-2.20.1/no-test-inline-pixbufs.patch
> new file mode 100644
> index 0000000..c1fcbd7
> --- /dev/null
> +++ b/recipes/gtk+/gtk+-2.20.1/no-test-inline-pixbufs.patch
> @@ -0,0 +1,22 @@
> +--- gtk+-2.20.1/demos/Makefile.am.orig	2012-06-18 21:53:07.365997572 +=
0200
> ++++ gtk+-2.20.1/demos/Makefile.am	2012-06-18 21:53:43.718177837 +0200
> +@@ -23,18 +23,9 @@
> + 	$(GTK_DEP_LIBS)							\
> + 	$(MATH_LIB)
> +=20
> +-noinst_PROGRAMS =3D 		\
> +-	testpixbuf-drawable 	\
> +-	testanimation 		\
> +-	testpixbuf-color	\
> +-	testpixbuf-save		\
> +-	testpixbuf-scale 	\
> +-	pixbuf-demo
> +-
> + # Need to build test-inline-pixbufs.h for testpixbuf
> + if HAVE_PNG
> +-noinst_PROGRAMS +=3D testpixbuf
> +-BUILT_SOURCES =3D test-inline-pixbufs.h
> ++BUILT_SOURCES =3D
> + endif
> +=20
> + if CROSS_COMPILING
> diff --git a/recipes/gtk+/gtk+_2.20.1.bb b/recipes/gtk+/gtk+_2.20.1.bb
> index 9cffee1..af73d31 100644
> --- a/recipes/gtk+/gtk+_2.20.1.bb
> +++ b/recipes/gtk+/gtk+_2.20.1.bb
> @@ -5,6 +5,7 @@ SRC_URI_append_virtclass-native =3D " file://no-demos.p=
atch \
>  SRC_URI_append =3D "file://gtk-dnd-grab-deadlock-fix.patch \
>  		  file://cross-nm.patch \
>  		  file://xkb-ifdef.patch \
> +		  file://no-test-inline-pixbufs.patch \
>  		 "
> =20
>  SRC_URI[gtk.md5sum] =3D "53e6f3a93bd22934878fc4a4a34c68aa"
> --=20
> 1.7.10

I need the two patches for gtk+-2.20.1 found in this thread in order
to build muffinman-image in oe-classic (it does not build anymore in
its current state). Can someone please review those patches ?

Cheers.
--=20
        Apelete


