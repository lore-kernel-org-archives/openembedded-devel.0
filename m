Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QPF56-0005fF-Uu
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 May 2011 16:29:05 +0200
Received: by fxm19 with SMTP id 19so6150857fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 May 2011 07:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=2xPw6HrOUhQ9/aHbG9UocN0f0NShn0YSPSh95vNnxwY=;
	b=xD9EnzTW/fnriszv2Xlfe72OuqMtDCpUIOHlqWZC1E8glPcF8KEq4OdP7JPlCjo6KJ
	pcLvEihpPJaMLw2Iaf+ZC9FMyM3dOUmgGn6oVaA56E+nGtMW7RtfYp/y86DIrgkoq7Is
	whu30QRYoARYslrFyXZZFh47bQr53tociDqWU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=gkDrUqP9x0cZufDvXTPWOdOBS8T/lulA6fvsP4W4E6/tsF7lmEG7QUTdxWrqXoFKn3
	/JVhBABpurw4FYTjsO/M6R7Va/cWFSUOgMTNOLr9Ls3EYiIp2VbUdhGD8DdtjD0A8SfJ
	NLjl1fDs/1UUGOZ1QpbFdQKURbN9/pYeFfX3Q=
Received: by 10.223.103.3 with SMTP id i3mr5078504fao.110.1306333562384;
	Wed, 25 May 2011 07:26:02 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id x13sm255186fan.9.2011.05.25.07.26.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 May 2011 07:26:01 -0700 (PDT)
Date: Wed, 25 May 2011 16:25:59 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110525142559.GI3222@jama.jama.net>
References: <y> <1306328337-19285-1-git-send-email-eyalr@ti.com>
	<4DDD05E0.4070504@opendreambox.org>
	<1306332204.10056.81.camel@mattotaupa>
	<irj2ot$fj8$1@dough.gmane.org>
	<EC51CDB0807A51469E0C9CB8CF72D65F03324D1F57@dnce02.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <EC51CDB0807A51469E0C9CB8CF72D65F03324D1F57@dnce02.ent.ti.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] wpa-gui-e: build the latest version from git sources
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
X-List-Received-Date: Wed, 25 May 2011 14:29:05 -0000
X-Groupsio-MsgNum: 32289
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Z8yxTSU1mh2gsre7"
Content-Disposition: inline

--Z8yxTSU1mh2gsre7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 25, 2011 at 04:18:20PM +0200, Reizer, Eyal wrote:
> Koen,
>=20
> Do you mean that using SRCREV instead of SRCPV as below is ok, or should =
I also remove the PV =3D "..."?
>=20
> +PV =3D "0.7.3+0.8.0-rc"
> +PR_append =3D "+git${SRCREV}"

Please stay with ${SRCPV} and +gitr (not +git) if you care about
upgradable paths.

And I don't care if it's in PV or PR and I use it from PR sometimes too,
because it's easier to put ie patches to ${PN}-${PV} dir like
wpa-gui-e-0.7.3+0.8.0-rc/foo.path
and better (even faster for ricers) then shared wpa-gui-e/foo.path

Regards,

> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org
> > [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> > Koen Kooi
> > Sent: Wednesday, May 25, 2011 5:13 PM
> > To: openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [PATCH] wpa-gui-e: build the latest version from git
> > sources
> >=20
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >=20
> > On 25-05-11 16:03, Paul Menzel wrote:
> > > Dear Andreas, dear Eyal,
> > >
> > >
> > > On Mi, 2011-05-25 at 15:36 +0200, Andreas Oberritter wrote:
> > >
> > >> On 05/25/2011 02:58 PM, Eyal Reizer wrote:
> > >
> > > [=E2=80=A6]
> > >
> > >>> +SRCREV =3D "b8fb017272ed4794339978c9fbc0e74571a44728"
> > >>> +PR =3D "r0"
> > >>
> > >> PR =3D "r0" is the default and can be removed.
> > >
> > > it seems there are different opinions on this topic. At least the
> > manual
> > > says differently.
> > >
> > >         Note
> > >
> > >         It is good practice to always define PR in your recipes, even
> > >         for the "r0" release, so that when editing the recipe it is
> > >         clear that the PR number needs to be updated.
> > >
> > >         You should always increment PR when modifying a recipe.
> > >         Sometimes this can be avoided if the change will have no
> > effect
> > >         on the actual packages generated by the recipe, such as
> > updating
> > >         the SRC_URI to point to a new host. If in any doubt then you
> > >         should increase the PR regardless of what has been changed.
> > >
> > >         The PR value should never be decremented. If you accidentally
> > >         submit a large PR value for example then it should be left at
> > >         the value and just increased for new releases, not reset back
> > to
> > >         a lower version.
> > >
> > >>> +PV =3D "0.7.3+0.8.0-rc"
> > >>> +PR_append =3D "+gitr${SRCPV}"
> > >>
> > >> SRCPV should not be used in PR (even if it's been copied from
> > another
> > >> recipe which does it wrong).
> > >
> > > I am still confused about this one. That is why I still have not
> > > committed the pkg-config patch yet [2]. Could the right way be
> > > documented in the manual.
> >=20
> > It is completely OK to use it in PR if you want the hash in PR, but not
> > PV.
> > -----BEGIN PGP SIGNATURE-----
> > Version: GnuPG v1.4.5 (Darwin)
> >=20
> > iD8DBQFN3Q5dMkyGM64RGpERAhwhAKCKxo/HdbjYY90JHWbgtyiGCMwLFQCgiaRa
> > HB1AMRMFaS/r4+iF6S6wa5M=3D
> > =3DXI4d
> > -----END PGP SIGNATURE-----
> >=20
> >=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Z8yxTSU1mh2gsre7
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk3dEXcACgkQN1Ujt2V2gByA7ACeNNVcdP7pedvJP6WApQk0uHcz
kw0AniGy22Qn3XTlDhhgxLpzEKs6kBJc
=8nhZ
-----END PGP SIGNATURE-----

--Z8yxTSU1mh2gsre7--
