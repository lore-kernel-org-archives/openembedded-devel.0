Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id EA0006CEA7
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 13:47:48 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id l10so3935739eei.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Oct 2013 06:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=7Jq2Z1/RasK0W2cidMRXOnx1RdaEI7qOlvgidE2coRo=;
	b=iOC08JTqQe8WzfAmSIld6OXjHabOWpGz2/jCSWjtFTeLkv5K5k6f8r8iG6S+LqDsrU
	wYuqLsbAPNqyDPn78ypkWGq2IYPKXQmfuUCMQ22srdxnFSbW0Qc1O2zmlWBaguqwhykV
	b83sHGf/snVT795TJ6lr82XjldkHEgCO5vMOEF3S0K07RMtWkl+q3opk0f0b2dklTkON
	9lPs9H7JJB1IdeweaeRf6JAd29kV1eMXbGRLHYpK3x3JfA1Z8k1fOtpbA+zJ0znoBj7d
	w4px5a3F/c8q4Nvo9gl4JqlI1Q/wKIgCI1pqoVaer8Q1dXTtLkzXoYQCq2QKoPCAQMmn
	V+pA==
X-Received: by 10.14.3.9 with SMTP id 9mr2603566eeg.72.1381240069970;
	Tue, 08 Oct 2013 06:47:49 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a1sm76156717eem.1.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 08 Oct 2013 06:47:49 -0700 (PDT)
Date: Tue, 8 Oct 2013 15:47:59 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131008134759.GC2872@jama>
References: <1381236055-734-1-git-send-email-eric@eukrea.com>
	<20131008124523.GA2872@jama> <20131008134523.GC22340@denix.org>
MIME-Version: 1.0
In-Reply-To: <20131008134523.GC22340@denix.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-qt5][PATCH] cinematicexperience: fix typo
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
X-List-Received-Date: Tue, 08 Oct 2013 13:47:49 -0000
X-Groupsio-MsgNum: 46553
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lCAWRPmW1mITcIfM"
Content-Disposition: inline

--lCAWRPmW1mITcIfM
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 08, 2013 at 09:45:23AM -0400, Denys Dmytriyenko wrote:
> On Tue, Oct 08, 2013 at 02:45:23PM +0200, Martin Jansa wrote:
> > On Tue, Oct 08, 2013 at 02:40:55PM +0200, Eric B=E9nard wrote:
> > > Signed-off-by: Eric B=E9nard <eric@eukrea.com>
> > > ---
> > >  recipes-qt/examples/cinematicexperience_1.0.bb | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/recipes-qt/examples/cinematicexperience_1.0.bb b/recipes=
-qt/examples/cinematicexperience_1.0.bb
> > > index 3fa6f06..9ee5532 100644
> > > --- a/recipes-qt/examples/cinematicexperience_1.0.bb
> > > +++ b/recipes-qt/examples/cinematicexperience_1.0.bb
> > > @@ -32,7 +32,7 @@ do_install() {
> > >      echo "#!/bin/sh" > ${D}${bindir}/Qt5_CinematicExperience
> > >      echo "export QML_IMPORT_PATH=3D${datadir}/${P}" >> ${D}${bindir}=
/Qt5_CinematicExperience
> > >      echo "export QML2_IMPORT_PATH=3D${datadir}/${P}" >> ${D}${bindir=
}/Qt5_CinematicExperience
> > > -    echo "${datadir}/${P}/Qt5_CinematicExperiencea \$* " >> ${D}${bi=
ndir}/Qt5_CinematicExperience
> > > +    echo "${datadir}/${P}/Qt5_CinematicExperience \$* " >> ${D}${bin=
dir}/Qt5_CinematicExperience
> > >      chmod +x ${D}${bindir}/Qt5_CinematicExperience
> > >  }
> >=20
> > Thanks, I'll squash this into cinematicexperience commit.
>=20
> Martin,
>=20
> Could you please also pick up my other patch for PACKAGECONFIG[linuxfb]?=
=20

It's already in jansa/test and dora-next since this morning.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--lCAWRPmW1mITcIfM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlJUDQ8ACgkQN1Ujt2V2gBw7IACglCJfIKOA8vqfWzjnfVPGujFU
C3cAoLY/Q31QNF/hjNbkG15CsMrE4EO0
=JTOM
-----END PGP SIGNATURE-----

--lCAWRPmW1mITcIfM--
