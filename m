Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pespin.shar@gmail.com>) id 1RG9sd-0004sQ-FL
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 15:38:55 +0200
Received: by qam2 with SMTP id 2so375319qam.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2011 06:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=D8n3GIN6swUqGTy5Nzfewb0W6/05bUft9K+Lwx/uGz8=;
	b=kFSYLwn65a36wKUIm+Y8NjQAODHoTJynbJJPgd3PNKQ9+PnhkZjnzFeZzrfL+AoRXv
	nOHyOThSuP7zH2moyLvRRnB/W7T4NmCUtvT1KsAz3xLLkHmrmr4fEW7hFa7SxgA88tBK
	Bdz3pfnGA7MvtxxLntgGn+Xlxafkp4mmyLt6k=
MIME-Version: 1.0
Received: by 10.229.64.81 with SMTP id d17mr535742qci.114.1318944784941; Tue,
	18 Oct 2011 06:33:04 -0700 (PDT)
Received: by 10.229.198.227 with HTTP; Tue, 18 Oct 2011 06:33:04 -0700 (PDT)
In-Reply-To: <j7giom$e07$1@dough.gmane.org>
References: <1318800781-21037-1-git-send-email-pespin.shar@gmail.com>
	<j7giom$e07$1@dough.gmane.org>
Date: Tue, 18 Oct 2011 15:33:04 +0200
Message-ID: <CAEGpDuYCQPYDLZ3CNPPDMbf23Jjjt2cnQgQpVr9SjKx59WmEAQ@mail.gmail.com>
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH][meta-oe] lightmediascanner: Add version 0.4.4 (initial recipe)
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
X-List-Received-Date: Tue, 18 Oct 2011 13:38:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

meta-efl ;)

El 17 d=E2=80=99octubre de 2011 8:42, Koen Kooi <koen@dominion.thruhere.net=
> ha
escrit:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> [PATCH][meta-oe] lightmediascanner: Add version 0.4.4 (initial recipe)
>
> I know the difference is academic, but meta-oe or meta-efl?
>
> Op 16-10-11 23:33, Pau Espin Pedrol schreef:
> > * Copied from oe-classic
> > <
> http://git.openembedded.org/openembedded/commit/?id=3D63d3969b0f839fc4b7b=
f7fe836daec729d9d3c53
> >
> >
> >
> * Remove PE=3D1
> > * Add LIC_FILES_CHKSUM * Builds fine using SHR distro
> >
> > Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com> ---
> > .../lightmediascanner/lightmediascanner_0.4.4.bb   |   29
> > ++++++++++++++++++++ 1 files changed, 29 insertions(+), 0 deletions(-)
> > create mode 100644
> > meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.4.4.b=
b
> >
> > diff --git
> > a/meta-efl/recipes-multimedia/lightmediascanner/
> lightmediascanner_0.4.4.bb
> > b/meta-efl/recipes-multimedia/lightmediascanner/
> lightmediascanner_0.4.4.bb
> >
> >
> new file mode 100644
> > index 0000000..cb35fb0 --- /dev/null +++
> > b/meta-efl/recipes-multimedia/lightmediascanner/
> lightmediascanner_0.4.4.bb
> >
> >
> @@ -0,0 +1,29 @@
> > +DESCRIPTION =3D "Lightweight media scanner meant to be used in
> > not-so-powerful devices" +AUTHOR =3D "ProFUSION" +HOMEPAGE =3D
> > "http://lms.garage.maemo.org/" +SECTION =3D "libs/multimedia" +LICENSE =
=3D
> > "LGPLv2.1+" +LIC_FILES_CHKSUM =3D
> > "file://COPYING;md5=3Da6f89e2100d9b6cdffcea4f398e37343" +DEPENDS =3D "s=
qlite3
> > flac virtual/libiconv" + +PR =3D "r0" + +SRC_URI =3D
> > "
> http://git.profusion.mobi/cgit.cgi/lightmediascanner.git/snapshot/release=
_${PV}.tar.bz2
> > \ +" +SRC_URI[md5sum] =3D "f423376a70f8f321af69b12563b176fe"
> > +SRC_URI[sha256sum] =3D
> > "302a7f6cc355467cd20332f4e02c8b87ba6c0c7a6818a6a987e007aace19b41e" + +S=
 =3D
> > "${WORKDIR}/release_${PV}" + +inherit autotools pkgconfig +
> > +do_install_append() { +    install -d ${D}/${bindir}/ +    install -m
> > 755 ${S}/src/bin/.libs/test  ${D}/${bindir}/test-lms +} + +PACKAGES =3D=
+
> > "${PN}-test" + +FILES_${PN}-test =3D "${bindir}/test-lms" +
> > +FILES_${PN}-dbg +=3D "${libdir}/${PN}/plugins/.debug"
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iD8DBQFOm85WMkyGM64RGpERApAnAJ9JtVK+0TfgAev2BW7aB0ACg/3DMwCgoDbv
> 4r1P2NRHiDH3S6cA64cRP0w=3D
> =3D92no
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Pau Espin Pedrol
mail/jabber: pespin.shar@gmail.com
http://blog.espeweb.net

