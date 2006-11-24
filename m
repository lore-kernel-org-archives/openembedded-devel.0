Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <openembedded@hrw.one.pl>) id 1GndZT-0005kU-0m
	for openembedded-devel@openembedded.org; Fri, 24 Nov 2006 17:06:35 +0100
Received: (qmail 13817 invoked by uid 813007); 24 Nov 2006 16:03:30 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO ?192.168.1.90?)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 24 Nov 2006 16:03:30 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Nov 2006 17:03:26 +0100
User-Agent: KMail/1.9.5
References: <200610291528.40663.openembedded@hrw.one.pl>
	<200611170101.06186.openembedded@hrw.one.pl>
	<1163755540.5551.4.camel@localhost.localdomain>
In-Reply-To: <1163755540.5551.4.camel@localhost.localdomain>
Organization: OpenEmbedded
MIME-Version: 1.0
Message-Id: <200611241703.26332.openembedded@hrw.one.pl>
Subject: Re: RFC: handling of machine/distro features stuff
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
X-List-Received-Date: Fri, 24 Nov 2006 16:06:35 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia pi=C4=85tek, 17 listopada 2006 10:25, Richard Purdie napisa=C5=82:
> > Which points me to this idea: how about adding COMBINED_FEATURES into
> > overrides? I do not know will it slow down BitBake or make metadata
> > bit more ugly but it is kind of solution.

> Also, this would automatically make any package machine specific and
> make multimachine pointless (anything using COMBINED_FEATURES is machine
> specific).

Koen suggested other solution - marking packages MACHINE specific when
COMBINED_FEATURES are used. For example wpa-supplicant will get this:

DEPENDS =3D "gnutls ${@base_contains('COMBINED_FEATURES', 'pci', 'madwifi-n=
g', '',d)}"
PACKAGE_ARCH =3D "${@base_contains('COMBINED_FEATURES', 'pci', ${MACHINE}, =
${TARGET_ARCH}, d)}"

export HAS_PCI =3D ${@base_contains('COMBINED_FEATURES', 'pci', 1, 0,d)}

do_configure () {
        install -m 0755 ${WORKDIR}/defconfig-gnutls  .config

        if [ "x$HAS_PCI" =3D=3D "x1" ] then; do
                echo "CONFIG_DRIVER_MADWIFI=3Dy" >> .config
                echo "CFLAGS +=3D -I${STAGING_INCDIR}/madwifi-ng" >> .config
        fi
}

Opinions?

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

        "To be or not to be that is the question.":
         every programmer knows the answer $2b or (not $2b) is $ff.




