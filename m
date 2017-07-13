Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 49DEA6FFC7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jul 2017 03:20:38 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga104.jf.intel.com with ESMTP; 12 Jul 2017 20:20:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,352,1496127600"; 
	d="scan'208,217";a="126578146"
Received: from samhenry-mobl2.amr.corp.intel.com ([10.252.200.245])
	by fmsmga006.fm.intel.com with ESMTP; 12 Jul 2017 20:20:34 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
Message-Id: <DDA8AF45-8CFA-48EA-9557-0705A00B4447@linux.intel.com>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Date: Wed, 12 Jul 2017 20:20:34 -0700
In-Reply-To: <CALatG=41hQ1ZgkROHNM-s+bhgKNeDprAp4UaucVYx_nPBbE_bw@mail.gmail.com>
To: Ming Liu <liu.ming50@gmail.com>
References: <1499791478-2407-1-git-send-email-liu.ming50@gmail.com>
	<1499791478-2407-4-git-send-email-liu.ming50@gmail.com>
	<18D3A338-C9CF-4313-A570-DB325E456160@linux.intel.com>
	<CALatG=4gZNNnL66_8zepakvwvy2J9snr2k3Y0hiYQNAoSFM_Ew@mail.gmail.com>
	<0A125451-F862-48AD-8905-27348AFEFB0E@linux.intel.com>
	<CALatG=41hQ1ZgkROHNM-s+bhgKNeDprAp4UaucVYx_nPBbE_bw@mail.gmail.com>
X-Mailer: Apple Mail (2.3273)
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe/meta-perl] [PATCH 3/8] libterm-readkey-perl: add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Jul 2017 03:20:39 -0000
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Understood. I now acknowledge that you did your due diligence. I guess I =
have some issues with Debian=E2=80=99s packaging of po4a, but that is =
for a different channel.

Thank you for thinking things through and answering my concerns.

=E2=80=94Tim

> On Jul 11, 2017, at 8:44 PM, Ming Liu <liu.ming50@gmail.com> wrote:
>=20
> Hi, TIm:
>=20
> I also had considered splitting po4a perl modules to a sub package to =
follow perl module naming scheme, but I finally decided to use the same =
package naming as it is on debian/ubuntu distributions(just a single =
main package named po4a), which I think is easier to be =
maintained/understood by developers/users, especially for those who are =
comfortable with debian systems.
>=20
>=20
> //MIng Liu
>=20
> 2017-07-12 4:51 GMT+02:00 Tim Orling <timothy.t.orling@linux.intel.com =
<mailto:timothy.t.orling@linux.intel.com>>:
>=20
>> On Jul 11, 2017, at 7:07 PM, Ming Liu <liu.ming50@gmail.com =
<mailto:liu.ming50@gmail.com>> wrote:
>>=20
>> Hi, Tim:
>>=20
>> po4a is providing some perl modules and also some normal binaries, =
and it's named as "po4a" on debian/ubuntu distributions as well, that's =
why I did not take po4a-perl as its name, shouldn't we let it have a =
identical name as debian distributions have, to follow debian naming?
>>=20
>=20
> In that case the po4a recipe is unclear and too simple. I would expect =
to see the libraries broken out into a sub package which does follow =
Debian naming. There is nothing in the recipe or commit message to =
indicate it is NOT a standard perl package.  It will be read by =
non-informed users as open season to use any naming scheme they want. =
Hence my concern.
>=20
> Just my 2 cents.
>=20
> =E2=80=94Tim
>=20
>> the best,
>> thank you=20
>>=20
>> 2017-07-12 0:34 GMT+02:00 Tim Orling =
<timothy.t.orling@linux.intel.com =
<mailto:timothy.t.orling@linux.intel.com>>:
>> The original po4a recipe should have been named libpo4a-perl, to =
follow Debian naming. Notice that every other perl module you have in =
DEPENDS or RRECOMMENDS __are__ following Debian naming. Please help us =
keep the metadata consistent in the meta-perl layer. Thank you.
>>=20
>> See 4.2 in:
>> =
https://www.debian.org/doc/packaging-manuals/perl-policy/ch-module_package=
s.html =
<https://www.debian.org/doc/packaging-manuals/perl-policy/ch-module_packag=
es.html>
>>=20
>>=20
>> > On Jul 11, 2017, at 9:44 AM, liu.ming50@gmail.com =
<mailto:liu.ming50@gmail.com> wrote:
>> >
>> > From: Ming Liu <peter.x.liu@external.atlascopco.com =
<mailto:peter.x.liu@external.atlascopco.com>>
>> >
>> > Term::ReadKey - A perl module for simple terminal control.
>> >
>> > It's being strongly recommended by po4a.
>> >
>> > Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com =
<mailto:peter.x.liu@external.atlascopco.com>>
>> > ---
>> > .../libterm/libterm-readkey-perl_2.37.bb =
<http://libterm-readkey-perl_2.37.bb/>           | 36 =
++++++++++++++++++++++
>> > 1 file changed, 36 insertions(+)
>> > create mode 100644 =
meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.37.bb =
<http://libterm-readkey-perl_2.37.bb/>
>> >
>> > diff --git =
a/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.37.bb =
<http://libterm-readkey-perl_2.37.bb/> =
b/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.37.bb =
<http://libterm-readkey-perl_2.37.bb/>
>> > new file mode 100644
>> > index 0000000..6b76682
>> > --- /dev/null
>> > +++ b/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.37.bb =
<http://libterm-readkey-perl_2.37.bb/>
>> > @@ -0,0 +1,36 @@
>> > +SUMMARY =3D "Term::ReadKey - A perl module for simple terminal =
control."
>> > +DESCRIPTION =3D "Term::ReadKey is a compiled perl module dedicated =
to providing simple \
>> > +control over terminal driver modes (cbreak, raw, cooked, etc.,) =
support \
>> > +for non-blocking reads, if the architecture allows, and some =
generalized \
>> > +handy functions for working with terminals. One of the main goals =
is to \
>> > +have the functions as portable as possible, so you can just plug =
in "use \
>> > +Term::ReadKey" on any architecture and have a good likelihood of =
it \
>> > +working."
>> > +HOMEPAGE =3D "http://search.cpan.org/~jstowe/TermReadKey-${PV} =
<http://search.cpan.org/~jstowe/TermReadKey-$%7BPV%7D>"
>> > +SECTION =3D "libraries"
>> > +
>> > +LICENSE =3D "Artistic-1.0 | GPLv1+"
>> > +LIC_FILES_CHKSUM =3D "file://README;md5=3D =
<>c275db663c8489a5709ebb22b185add5"
>> > +
>> > +SRC_URI =3D =
"${CPAN_MIRROR}/authors/id/J/JS/JSTOWE/TermReadKey-${PV}.tar.gz"
>> > +
>> > +SRC_URI[md5sum] =3D "e8ea15c16333ac4f8d146d702e83cc0c"
>> > +SRC_URI[sha256sum] =3D =
"4a9383cf2e0e0194668fe2bd546e894ffad41d556b41d2f2f577c8db682db241"
>> > +
>> > +S =3D "${WORKDIR}/TermReadKey-${PV}"
>> > +
>> > +# It needs depend on native to let dynamic loader use native =
modules
>> > +# rather than target ones.
>> > +DEPENDS =3D "libterm-readkey-perl-native"
>> > +
>> > +inherit cpan
>> > +
>> > +do_configure_append () {
>> > +    # Hack the dynamic module loader so that it use native modules =
since it can't load
>> > +    # the target ones.
>> > +    if [ "${BUILD_SYS}" !=3D "${HOST_SYS}" ]; then
>> > +        sed -i -e =
"s#-I\$(INST_ARCHLIB)#-I${STAGING_BINDIR_NATIVE}/perl-native/perl/vendor_p=
erl/${@get_perl_version(d)}#g" Makefile
>> > +    fi
>> > +}
>> > +
>> > +BBCLASSEXTEND =3D "native"
>> > --
>> > 2.7.4
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org =
<mailto:Openembedded-devel@lists.openembedded.org>
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel =
<http://lists.openembedded.org/mailman/listinfo/openembedded-devel>
>>=20
>>=20
>=20
>=20


