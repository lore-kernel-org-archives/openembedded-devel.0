Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PzoJP-0002Y0-Q0 for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 11:50:43 +0100
Received: from f053032013.adsl.alicedsl.de ([78.53.32.13]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PzoHn-0003uD-0H for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 10:49:03 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTi=-9cukS2AG7Dtdnusvvggt5PLvELkK2CcWZ+nO@mail.gmail.com>
References: <1300194647.3759.256.camel@mattotaupa>
	<AANLkTi=-9cukS2AG7Dtdnusvvggt5PLvELkK2CcWZ+nO@mail.gmail.com>
Date: Wed, 16 Mar 2011 11:49:01 +0100
Message-ID: <1300272541.3840.63.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: pygtksourceview-2.10.1: task compile fails, because `PYGOBJECT_DATADIR` not taken from staging directory (was: $(srcdir) not substituted with staging directory)
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
X-List-Received-Date: Wed, 16 Mar 2011 10:50:43 -0000
X-Groupsio-MsgNum: 30258
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-eylRwrlX1XArRreVaJvZ"

--=-eylRwrlX1XArRreVaJvZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 15.03.2011, 09:22 -0700 schrieb Khem Raj:
> On Tue, Mar 15, 2011 at 6:10 AM, Paul Menzel wrote:
> > Dear OE folks,
> >
> >
> > task compile of `pygtksourceview-2.10.1.bb` fails with the following
> > error.
> >
> >        + do_compile
> >        + base_do_compile
> >        + '[' -e Makefile -o -e makefile -o -e GNUmakefile ']'
> >        + oe_runmake
> >        + oenote make -j4
> >        + echo NOTE: 'make -j4'
> >        NOTE: make -j4
> >        + make -j4
> >        make  all-recursive
> >        make[1]: Entering directory `/oe/build-angstrom-next/angstrom-de=
v/work/armv7a-angstrom-linux-gnueabi/python-pygtksourceview-2.10.1-r0/pygtk=
sourceview-2.10.1'
> >        Making all in test
> >        make[2]: Entering directory `/oe/build-angstrom-next/angstrom-de=
v/work/armv7a-angstrom-linux-gnueabi/python-pygtksourceview-2.10.1-r0/pygtk=
sourceview-2.10.1/test'
> >        make[2]: Nothing to be done for `all'.
> >        make[2]: Leaving directory `/oe/build-angstrom-next/angstrom-dev=
/work/armv7a-angstrom-linux-gnueabi/python-pygtksourceview-2.10.1-r0/pygtks=
ourceview-2.10.1/test'
> >        Making all in docs
> >        make[2]: Entering directory `/oe/build-angstrom-next/angstrom-de=
v/work/armv7a-angstrom-linux-gnueabi/python-pygtksourceview-2.10.1-r0/pygtk=
sourceview-2.10.1/docs'
> >        /oe/build-angstrom-next/angstrom-dev/sysroots/i686-linux/usr/bin=
/python -c 'import datetime; print datetime.date.today()' > reference/build=
date.xml
> >        /oe/build-angstrom-next/angstrom-dev/sysroots/i686-linux/usr/bin=
/xsltproc --nonet --xinclude -o ../docs/html/ \
> >                         --path ../docs/reference:./reference \
> >                         --stringparam gtkdoc.bookname "pygtksourceview2=
" \
> >                         --stringparam gtkdoc.version . \
> >                         /usr/share/pygobject/xsl/ref-html-style.xsl ./r=
eference/gtksourceview2-ref.xml
> >        warning: failed to load external entity "/usr/share/pygobject/xs=
l/ref-html-style.xsl"
> >        cannot parse /usr/share/pygobject/xsl/ref-html-style.xsl
> >        make[2]: *** [build_stamp] Error 4
> >        make[2]: Leaving directory `/oe/build-angstrom-next/angstrom-dev=
/work/armv7a-angstrom-linux-gnueabi/python-pygtksourceview-2.10.1-r0/pygtks=
ourceview-2.10.1/docs'
> >        make[1]: *** [all-recursive] Error 1
> >        make[1]: Leaving directory `/oe/build-angstrom-next/angstrom-dev=
/work/armv7a-angstrom-linux-gnueabi/python-pygtksourceview-2.10.1-r0/pygtks=
ourceview-2.10.1'
> >        make: *** [all] Error 2
> >        + die 'oe_runmake failed'
> >
> > Apparently in
> >
> >        $ more docs/Makefile.am
> >        [=E2=80=A6]
> >        build_stamp: $(REFERENCE_DEPS)reference/builddate.xml
> >                xsltproc --nonet --xinclude -o $(BUILDDIR)/html/ \
> >                         --path $(BUILDDIR)/reference:$(srcdir)/referenc=
e \
> >                         --stringparam gtkdoc.bookname "pygtksourceview2=
" \
> >                         --stringparam gtkdoc.version ${REF_VERSION} \
> >                         $(HTML_STYLE) $(srcdir)/reference/gtksourceview=
2-ref.xml
> >                $(PYGOBJECT_FIXXREF) -i $(PYGOBJECT_PYGDOCS) $(BUILDDIR)=
/html
> >                touch $@
> >        [=E2=80=A6]
> >
> > `$(srcdir)` is not set to the staging directory.
> >
> >        angstrom-dev/work/armv7a-angstrom-linux-gnueabi/python-pygtksour=
ceview-2.10.1-r0/pygtksourceview-2.10.1/Makefile:srcdir =3D .
> >
> > How is that dealt with in OE? Or should something else be used in
> > `Makefile.am`?
>=20
> EXTRA_OEMAKE +=3D "srcdir=3D${S}" or something like that might help may b=
e
> it needs a dir below $S

Thank you for your answer and help. I found that `configure` also seems
to have an option to do this

        $ ./configure --help
              --srcdir=3DDIR        find the sources in DIR [configure dir =
or `..']

which could be passed using `EXTRA_OECONF +=3D "--srcdir=3D${S}"`.

Anyway reading the error message again, it turns out to be a different
problem.

`/usr/share/pygobject/xsl/ref-html-style.xsl` is the value of `
$(HTML_STYLE)` which is defined the following way.

        ./docs/Makefile.am:HTML_STYLE =3D $(PYGOBJECT_DATADIR)/pygobject/xs=
l/ref-html-style.xsl

`PYGOBJECT_DATADIR` is set in `configure.ac`.

        ./configure.ac:PYGOBJECT_DATADIR=3D`$PKG_CONFIG --variable=3Ddatadi=
r pygobject-2.0`
        ./configure.ac:AC_SUBST(PYGOBJECT_DATADIR)

So it looks like a problem with pkg-config program.

        $ find angstrom-dev/ -iname pygobject*.pc
        angstrom-dev/sysroots/i686-linux/usr/lib/pkgconfig/pygobject-2.0.pc
        angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/pkgconf=
ig/pygobject-2.0.pc

The content is the following.

        $ less angstrom-dev/sysroots/i686-linux/usr/lib/pkgconfig/pygobject=
-2.0.pc
        prefix=3D/oe/build-angstrom-next/angstrom-dev/sysroots/i686-linux/u=
sr
        prefix=3D/oe/build-angstrom-next/angstrom-dev/sysroots/i686-linux/u=
sr
        exec_prefix=3D/oe/build-angstrom-next/angstrom-dev/sysroots/i686-li=
nux/usr
        includedir=3D/oe/build-angstrom-next/angstrom-dev/sysroots/i686-lin=
ux/usr/include
        datarootdir=3D${prefix}/share
        datadir=3D/oe/build-angstrom-next/angstrom-dev/sysroots/i686-linux/=
usr/share
        libdir=3D/oe/build-angstrom-next/angstrom-dev/sysroots/i686-linux/u=
sr/lib=20
       =20
        # you can use the --variable=3Dpygtkincludedir argument to
        # pkg-config to get this value.  You might want to use this to
        # install additional headers.
        pygtkincludedir=3D${includedir}/pygtk-2.0
        fixxref=3D${datadir}/pygobject/xsl/fixxref.py
        pygdocs=3D${datadir}/gtk-doc/html/pygobject
        defsdir=3D${datadir}/pygobject/2.0/defs
        codegendir=3D${datadir}/pygobject/2.0/codegen
       =20
        Name: PyGObject
        Description: Python bindings for GObject
        Requires: gobject-2.0
        Requires.private:
        Version: 2.20.0
        Cflags: -I${pygtkincludedir}

and

        $ more angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/=
pkgconfig/pygobject-2.0.pc
        prefix=3D/usr
        exec_prefix=3D/usr
        includedir=3D/usr/include
        datarootdir=3D${prefix}/share
        datadir=3D/usr/share
        libdir=3D/usr/lib
       =20
        # you can use the --variable=3Dpygtkincludedir argument to
        # pkg-config to get this value.  You might want to use this to
        # install additional headers.
        pygtkincludedir=3D${includedir}/pygtk-2.0
        fixxref=3D${datadir}/pygobject/xsl/fixxref.py
        pygdocs=3D${datadir}/gtk-doc/html/pygobject
        defsdir=3D${datadir}/pygobject/2.0/defs
        codegendir=3D${datadir}/pygobject/2.0/codegen
       =20
        Name: PyGObject
        Description: Python bindings for GObject
        Requires: gobject-2.0
        Requires.private: libffi
        Version: 2.20.0
        Cflags: -I${pygtkincludedir}

So why does not pkg-config return the value for the staging directory?
This seems to happen for a lot of GTK/GNOME programs (`git grep
'${STAGING_DATADIR}' recipes/`) and I have experienced that before
[1][2].


Thanks,

Paul


[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-October/02=
5287.html
[2] Also with Evince or GNOME Games, but I cannot find the messages in
the archive, where I was told that it is no problem because if it was
there would be a lot more breakage.

--=-eylRwrlX1XArRreVaJvZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2AlZ0ACgkQPX1aK2wOHVh7EACfSOHbcgNcmhcuxRor45/gAy/N
7SUAnRNPxbvW7RJ609nfZoH512AARe6S
=c8c+
-----END PGP SIGNATURE-----

--=-eylRwrlX1XArRreVaJvZ--
