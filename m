Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Rtadb-0002rP-A6
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Feb 2012 09:06:24 +0100
Received: by eaal10 with SMTP id l10so989760eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Feb 2012 23:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=V/GBhn9bcSgQp2wX2iy/Ix8NclIBd29XKxrcOyev5Fk=;
	b=tiBmeGySKy6TwSjQi0B6ZSm0VDeRCMAUJLP6ADJdA8472m+Olsceb3beNxQN0+kvF+
	jv8ODduK8avODLm0RV3/Oa8uZ9YnRAwJA3PUBneVD8zwGMbSK+jmJfcYRVw9RFZMpZpW
	zBa2fC2vflFJ3g78dNW5Tw/tmoHlem1N6sWS8=
Received: by 10.213.98.78 with SMTP id p14mr194795ebn.145.1328342304368;
	Fri, 03 Feb 2012 23:58:24 -0800 (PST)
Received: from localhost ([94.230.150.14])
	by mx.google.com with ESMTPS id z47sm24075733eeh.9.2012.02.03.23.58.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 03 Feb 2012 23:58:23 -0800 (PST)
Date: Sat, 4 Feb 2012 08:58:22 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120204075822.GA4718@jama.jama.net>
References: <20120201080441.DA76610333@opal>
	<20120203131451.GJ3893@jama.jama.net>
	<CAP9ODKqdXtrAqUY=1XHE4QDpRPyNbOV5ZswKihCWbSWU9+L05w@mail.gmail.com>
	<20120203154742.GM3893@jama.jama.net>
	<CAP9ODKoaqi96Bzktk=TC0dXmz6YV1v-1vAAgaqc+qE02Rpd81Q@mail.gmail.com>
	<CAAQYJAvfYLRcYw7fKVogjkwuST-b4oYMCH4_VZG6P8Xy5QgjgQ@mail.gmail.com>
	<jghu9u$dqo$2@dough.gmane.org>
	<CALbNGRQ+qOr43Nkr5ja6E8V_VVD-e2ZTaFCd1Lga=CYaRVFt-w@mail.gmail.com>
	<CAPOJ94NwJJYeTm5w-W84u2VL3=Qk0O6X864z5irbR-XGA0fvOg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPOJ94NwJJYeTm5w-W84u2VL3=Qk0O6X864z5irbR-XGA0fvOg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [oe-commits] Otavio Salvador : systemd.bbclass: depends on systemd
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
X-List-Received-Date: Sat, 04 Feb 2012 08:06:24 -0000
X-Groupsio-MsgNum: 36891
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7AUc2qLy4jB3hD7Z"
Content-Disposition: inline

--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 03, 2012 at 08:15:46PM -0600, Peter Bigot wrote:
> On Fri, Feb 3, 2012 at 8:00 PM, Andreas M=FCller
> <schnitzeltony@googlemail.com> wrote:
> >>> Which recipes really depend on systemd during build? I know about
> >>> polkit, something else?
> >
> > udisks [1]
>=20
> Yeah, but that might be a consequence of udisks depending on polkit.
> It was a libsystemd-login reference in a polkit .la file dependency
> that made me install that patch so I could get udisks to build.

OK, so I have 21 recipes which inherit systemd and 2 need build-time
systemd dependency and the rest is fine with RDEPENDS, can we please=20
move systemd from inherited DEPENDS to those 2 recipe (polkit and
udisks)?

Cheers,

>=20
> >
> > [1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2012-Januar=
y/037230.html
> >
> > Andreas
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7AUc2qLy4jB3hD7Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8s5R4ACgkQN1Ujt2V2gBwKawCfW+7qD9t/rER/de+UatNWGbvH
eFQAoJpO3+qjg4Ba+9SWsXPDQZUfg7af
=z150
-----END PGP SIGNATURE-----

--7AUc2qLy4jB3hD7Z--
