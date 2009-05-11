Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <g.eismann@gmx.net>) id 1M3cDR-0004sV-2S
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 May 2009 22:35:13 +0200
Received: (qmail invoked by alias); 11 May 2009 20:28:37 -0000
Received: from 247.70.222.87.dynamic.jazztel.es (EHLO inferno.localnet)
	[87.222.70.247]
	by mail.gmx.net (mp005) with SMTP; 11 May 2009 22:28:37 +0200
X-Authenticated: #21729387
X-Provags-ID: V01U2FsdGVkX1/cxwI1mPjcXyNrj8nzYQ67H1NYwt7JW3zCuB+Lcp
	Cguophttij942R
From: "G. Eismann" <g.eismann@gmx.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 May 2009 22:28:33 +0200
User-Agent: KMail/1.11.3 (Linux/2.6.28-11-generic; KDE/4.2.3; i686; ; )
References: <200905111744.00650.g.eismann@gmx.net>
	<200905112052.53485.g.eismann@gmx.net>
	<f96d234e0905111309u1ae4805bnaeb9adc1bf1ceca3@mail.gmail.com>
In-Reply-To: <f96d234e0905111309u1ae4805bnaeb9adc1bf1ceca3@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200905112228.33758.g.eismann@gmx.net>
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.52,0.52
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: image generation
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
X-List-Received-Date: Mon, 11 May 2009 20:35:13 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Lunes 11 Mayo 2009 22:09:47 Cliff Brake escribi=F3:

> >
> > When building the image, the release 5 (the last one) of the package is
> > built, but in the "do_package_write_ipk" step there is an error because
> > is looking for the install directory for the release 1.
>
> Can you post your recipe, and we'll take a look?

=46inally I have "fixed" it copying the recipe to a new one with a new name=
; so=20
I am not sure if the problem has something to do with the recipe.

bitbake was looking for release 1 of the recipe, while the release number i=
s=20
5.
I dont know why it did only for "do_package_write_ipk" step and not for all=
 of=20
them.

Anyway, the recipe:

=2D----
DESCRIPTION =3D "foo"
SECTION =3D "base"
LICENSE =3D "GPL"
PR =3D "r5"

RDEPENDS =3D "haserl dash"

SRC_URI =3D "file://www/*    \
           file://init/*   \
           file://config/* \
          "

do_install () {
        install -d ${D}${localstatedir}/www/
        install -d ${D}${sysconfdir}/config/
        install -d ${D}${sysconfdir}/init.d/

        install -m 0644 ${WORKDIR}/www/*html ${D}${localstatedir}/www/
        install -m 0644 ${WORKDIR}/www/*css ${D}${localstatedir}/www/
        install -m 0755 ${WORKDIR}/www/*cgi ${D}${localstatedir}/www/
        install -m 0644 ${WORKDIR}/config/* ${D}${sysconfdir}/config/
        install -m 0755 ${WORKDIR}/init/* ${D}${sysconfdir}/init.d/
        for level in S 0 2 3 4 5 6; do
            install -d ${D}${sysconfdir}/rc$level.d
        done
}

PACKAGE_ARCH =3D "all"
=2D----



=2D-=20
  - Eismann -

