Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q4Uqq-0005rg-Ol
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Mar 2011 11:04:36 +0200
Received: by bwz5 with SMTP id 5so17863bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Mar 2011 02:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=RWrGw3P1/VEyHyhk4iPN+4wl2yt7jhscWlAWqTNaaz0=;
	b=tT6ZRfvoXED628YdWOccksNK6P73erPpNCrSiakI5uQ7krxgnlFYLMzPZ+RJ3yHuxR
	ZS/x7OY8+tBN2Huf6T05VYIg74I9qbsNw5iIUATJa+D0bU65Wapr79d2b78APtYLpKJq
	Y3i9BRdBHr4O+8kqyYqurzqSQqksI8UZbnzH4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Lagluiv6pCA4Jxl+9Hk7Q5XQBZGqkI37YpFhWXxZZtlslGsXcXZfhsKQWO3USByB69
	+u6tereYY31+zHjwJHRVzN559XpHMm7rYpw1AH5FNRXgah5DWLVDNyzEyHFdGsVSSH+1
	6R48xHS/zSnUVQ1bZZusNuGPw8H7N4Ce834s4=
Received: by 10.204.26.132 with SMTP id e4mr2101302bkc.142.1301388967870;
	Tue, 29 Mar 2011 01:56:07 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id z18sm3250648bkf.8.2011.03.29.01.56.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 Mar 2011 01:56:06 -0700 (PDT)
Date: Tue, 29 Mar 2011 10:56:04 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110329085604.GA3439@jama.jama.net>
References: <1301337206-24526-1-git-send-email-philippedeswert@gmail.com>
	<1301388439.4200.8.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1301388439.4200.8.camel@mattotaupa>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] poppler 0.12.3: remove "default_preference = -1"
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
X-List-Received-Date: Tue, 29 Mar 2011 09:04:36 -0000
X-Groupsio-MsgNum: 30688
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HlL+5n6rz5pIUxbD"
Content-Disposition: inline

--HlL+5n6rz5pIUxbD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 29, 2011 at 10:47:18AM +0200, Paul Menzel wrote:
> Dear Philippe,
>=20
>=20
> please read the commit policy [1] and example [2] on how to format the
> commit message. You do not have to resend this patch as I will edit the
> commit message before pushing your patch.
>=20
> Am Montag, den 28.03.2011, 21:33 +0300 schrieb phdeswer:
>=20
> > remove default_preference game as everybody wants to use the latest
> > version, but the default_prefernce is -1 so this fails building packages
> > that depend on poppler if not used with a distro that has a preferred
> > version or default_preference bump
>=20
> Please note that you can always set your preferred version in
> `conf/local.conf`.
>=20
> > Signed-off-by: phdeswer <philippedeswert@gmail.com>
> >
> > ---
> >  recipes/poppler/poppler_0.12.3.bb |    5 -----
> >  1 files changed, 0 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/recipes/poppler/poppler_0.12.3.bb b/recipes/poppler/popple=
r_0.12.3.bb
> > index 8b9fcca..ce1952e 100644
> > --- a/recipes/poppler/poppler_0.12.3.bb
> > +++ b/recipes/poppler/poppler_0.12.3.bb
> > @@ -2,11 +2,6 @@ require poppler.inc
> > =20
> >  DEPENDS +=3D "lcms"
> > =20
> > -DEFAULT_PREFERENCE =3D "-1"
> > -DEFAULT_PREFERENCE_angstrom =3D "1"
> > -DEFAULT_PREFERENCE_minimal =3D "1"
> > -DEFAULT_PREFERENCE_minimal-uclibc =3D "1"
> > -
> >  EXTRA_OECONF_append =3D " --disable-abiword-output "
> > =20
> >  RDEPENDS_${PN} =3D "poppler-data"
>=20
> Do all distribution maintainers agree with this patch? I do not see a
> problem since it has been used in tested in =C8=A6ngstr=C3=B6m and
> minimal{,-uclibc} for over six months.

and in SHR too (pinned in preferred-shr-versions.inc), feel free to
remove it there too.

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

> Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>
>=20
>=20
> Thanks,
>=20
> Paul
>=20
>=20
> [1] http://openembedded.org/index.php/Commit_Policy
> [2] http://openembedded.org/index.php/Commit_log_example



> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--HlL+5n6rz5pIUxbD
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk2RnqQACgkQN1Ujt2V2gBxCRwCfTALPKLql82XTI8QXvpx4XEqB
MMUAmgOvSOWpdhTGKTyTD18lL0wQlFCg
=PapI
-----END PGP SIGNATURE-----

--HlL+5n6rz5pIUxbD--
