Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id EF2756FD8D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jun 2014 14:47:24 +0000 (UTC)
Received: by mail-we0-f177.google.com with SMTP id u56so2871740wes.22
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jun 2014 07:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=H7gu171SUA4HMXM9tspr+xXSYlL4PugotaBPLpmiG/0=;
	b=KCTysc+dTHdQHjgbGpN07zShnxmS0bUW1z1X3EdrVGaNSDqRn8O+o8x8NlNrJCkVAe
	h0aiDbtSu129DPTLaults7X3ZOj6fG/7C0wxsGNL6tojD9T46RHl1oDqYFFnU+EG2QRu
	AooQHovRMe9T/xJyQbzS6EjUN3auslj2Piriu85HzwfCqwP67SqalNsPDhewKm0mNjSZ
	rjbpJ1DvLF+7iBdod39RyOio5bLn2LGRAlHrel1vBjfQJM3sk0rRc6KP1fSsQef02a6n
	WCW8eF7p4+j+KLyQ3SnKFxz18FL4wQiqhQiglYsy7JX03Fy2DelUJfNgUKiaVfMhR26O
	JMIg==
X-Received: by 10.194.79.135 with SMTP id j7mr3079111wjx.56.1402670844711;
	Fri, 13 Jun 2014 07:47:24 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	h49sm12282426eeg.21.2014.06.13.07.47.23 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Jun 2014 07:47:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 13 Jun 2014 16:47:46 +0200
To: Ash Charles <ashcharles@gmail.com>
Message-ID: <20140613144746.GJ2428@jama>
References: <20140610112604.GF2433@jama>
	<1402424282-324-1-git-send-email-ashcharles@gmail.com>
	<20140613114047.GI2428@jama>
	<CAK8F28kOVF4uwefMHoFmjv8TLfhARRbbvASQyTC4avWfdWf3uw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAK8F28kOVF4uwefMHoFmjv8TLfhARRbbvASQyTC4avWfdWf3uw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [Patch v3] eject: copy po subdirectory for out-of-tree build
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Jun 2014 14:47:28 -0000
X-Groupsio-MsgNum: 50328
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BEa57a89OpeoUzGD"
Content-Disposition: inline

--BEa57a89OpeoUzGD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2014 at 06:57:54AM -0700, Ash Charles wrote:
> Any chance this is getting built with autotools-brokensep still in place?

Yes, that could be it, I'll remove eject from my big autotools-broken
sep, but can we make it compatible with B=3DS as well? That's what commit
message suggests.

> On Jun 13, 2014 4:40 AM, "Martin Jansa" <martin.jansa@gmail.com> wrote:
>=20
> > On Tue, Jun 10, 2014 at 11:18:02AM -0700, Ash Charles wrote:
> > > The po subdirectory found on the VPATH for an out-of-tree build so we
> > > copy it over. See [1] for discussion.
> > >
> > > [1]
> > http://lists.openembedded.org/pipermail/openembedded-devel/2014-May/096=
052.html
> > >
> > > v3: only create and populate po/ if it doesn't already exist
> >
> > ^ this doesn't match with patch and it still fails:
> >
> > ERROR: Function failed: do_compile (log file is located at
> > /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe=
-linux/eject/2.1.5-r1/temp/log.do_compile.31092)
> > ERROR: Logfile of failure stored in:
> > /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe=
-linux/eject/2.1.5-r1/temp/log.do_compile.31092
> > Log data follows:
> > | DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc',
> > 'bit-64', 'x86_64-linux', 'common']
> > | DEBUG: Executing shell function do_compile
> > | cp:
> > `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-o=
e-linux/eject/2.1.5-r1/eject/po/CVS'
> > and
> > `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-o=
e-linux/eject/2.1.5-r1/eject/po/CVS'
> > are the same file
> > | cp:
> > `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-o=
e-linux/eject/2.1.5-r1/eject/po/Makefile'
> > and
> > `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-o=
e-linux/eject/2.1.5-r1/eject/po/Makefile'
> > are the same file
> > | cp:
> > `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-o=
e-linux/eject/2.1.5-r1/eject/po/cs_CZ.po'
> > and
> > `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-o=
e-linux/eject/2.1.5-r1/eject/po/cs_CZ.po'
> > are the same file
> > | cp:
> > `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-o=
e-linux/eject/2.1.5-r1/eject/po/de_DE.po'
> > and
> > `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-o=
e-linux/eject/2.1.5-r1/eject/po/de_DE.po'
> > are the same file
> > | cp:
> > `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-o=
e-linux/eject/2.1.5-r1/eject/po/eject.pot'
> > and
> > `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-o=
e-linux/eject/2.1.5-r1/eject/po/eject.pot'
> > are the same file
> > | cp:
> > `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-o=
e-linux/eject/2.1.5-r1/eject/po/es_ES.po'
> > and
> > `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-o=
e-linux/eject/2.1.5-r1/eject/po/es_ES.po'
> > are the same file
> > | cp:
> > `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-o=
e-linux/eject/2.1.5-r1/eject/po/fr_FR.po'
> > and
> > `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-o=
e-linux/eject/2.1.5-r1/eject/po/fr_FR.po'
> > are the same file
> > | cp:
> > `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-o=
e-linux/eject/2.1.5-r1/eject/po/ja_JP.eucJP.po'
> > and
> > `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-o=
e-linux/eject/2.1.5-r1/eject/po/ja_JP.eucJP.po'
> > are the same file
> > | cp:
> > `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-o=
e-linux/eject/2.1.5-r1/eject/po/pt_BR.po'
> > and
> > `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-o=
e-linux/eject/2.1.5-r1/eject/po/pt_BR.po'
> > are the same file
> > | cp:
> > `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-o=
e-linux/eject/2.1.5-r1/eject/po/tr_TR.po'
> > and
> > `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-o=
e-linux/eject/2.1.5-r1/eject/po/tr_TR.po'
> > are the same file
> > | cp:
> > `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-o=
e-linux/eject/2.1.5-r1/eject/po/zh_TW.UTF-8.po'
> > and
> > `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-o=
e-linux/eject/2.1.5-r1/eject/po/zh_TW.UTF-8.po'
> > are the same file
> > | WARNING: exit code 1 from a shell command.
> > | ERROR: Function failed: do_compile (log file is located at
> > /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe=
-linux/eject/2.1.5-r1/temp/log.do_compile.31092)
> > NOTE: recipe eject-2.1.5-r1: task do_compile: Failed
> > ERROR: Task 21543
> > (/home/jenkins/oe/shr-core-branches/shr-core/meta-openembedded/meta-oe/=
recipes-support/eject/
> > eject_2.1.5.bb, do_compile) failed with exit code '1'
> >
> > > Signed-off-by: Ash Charles <ashcharles@gmail.com>
> > > Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>
> > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > ---
> > >  meta-oe/recipes-support/eject/eject_2.1.5.bb | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > >
> > > diff --git a/meta-oe/recipes-support/eject/eject_2.1.5.bb
> > b/meta-oe/recipes-support/eject/eject_2.1.5.bb
> > > index c47c653..a71d83f 100644
> > > --- a/meta-oe/recipes-support/eject/eject_2.1.5.bb
> > > +++ b/meta-oe/recipes-support/eject/eject_2.1.5.bb
> > > @@ -16,6 +16,12 @@ S =3D "${WORKDIR}/${BPN}"
> > >
> > >  PR =3D "r1"
> > >
> > > +do_compile_prepend() {
> > > +    # PO subdir must be in build directory
> > > +    mkdir -p ${B}/po
> > > +    cp -r ${S}/po/* ${B}/po/
> > > +}
> > > +
> > >  ALTERNATIVE_${PN} =3D "volname eject"
> > >  ALTERNATIVE_LINK_NAME[volname] =3D "${bindir}/volname"
> > >  ALTERNATIVE_LINK_NAME[eject] =3D "${bindir}/eject"
> > > --
> > > 1.8.3.2
> > >
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--BEa57a89OpeoUzGD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlObDxIACgkQN1Ujt2V2gBy6ewCghClQe9ivUjzU2mDL2fVC2R5g
ODgAoIR4FOfB0kgJQw2S7248C1I8aCIn
=NLrG
-----END PGP SIGNATURE-----

--BEa57a89OpeoUzGD--
