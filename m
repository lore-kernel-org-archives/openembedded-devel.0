Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RGCYy-0001iR-4L
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 18:30:48 +0200
Received: by bkat8 with SMTP id t8so1104149bka.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2011 09:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=aJ97TlGXfTUJH0MxxiAUhW5B+06L6MrAmFpFEauoRj0=;
	b=HribBsT78fQ1H7beh5/Bv7318EzY4/rd6xTJ4CUk+I09ZpXl3uEYyjUSsC6KzG56VY
	0UlWrwdSGxNhKi5k4qLKkE//8g5dXIOfpdkJpdt1Qc/2s8cCz2HqmyLxnqAx/h6vpqEb
	uhgYsXlshXfOOtp+1Fm8pfzRoH7UIdWN8ieUI=
Received: by 10.204.130.208 with SMTP id u16mr2315792bks.47.1318955082866;
	Tue, 18 Oct 2011 09:24:42 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id r12sm2774524bkw.5.2011.10.18.09.24.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Oct 2011 09:24:41 -0700 (PDT)
Date: Tue, 18 Oct 2011 18:24:33 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111018162433.GJ20678@jama.jama.net>
References: <359a5968f27008d6fcbaee5137c237bfcabd2579.1318946821.git.Martin.Jansa@gmail.com>
	<c4b964c5a17f463645b3e9cb7a8351bbe62eef9a.1318946821.git.Martin.Jansa@gmail.com>
	<1318949469.3538.34.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1318949469.3538.34.camel@mattotaupa>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-efl 3/3] lightmediascanner: Add version 0.4.4 (initial recipe)
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
X-List-Received-Date: Tue, 18 Oct 2011 16:30:48 -0000
X-Groupsio-MsgNum: 34871
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4wkndigzIeYF6Hbg"
Content-Disposition: inline

--4wkndigzIeYF6Hbg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 18, 2011 at 04:51:09PM +0200, Paul Menzel wrote:
> Am Dienstag, den 18.10.2011, 16:10 +0200 schrieb Martin Jansa:
> > From: pespin <pespin.shar@gmail.com>
>=20
> The name is still not correct. Although the Signed-off-by line is.
> Please correct that.

Thanks for catching that, fixed in jansa/pull branch.

> > * Copied from oe-classic <http://git.openembedded.org/openembedded/comm=
it/?id=3D63d3969b0f839fc4b7bf7fe836daec729d9d3c53>
> > * Remove PE=3D1
> > * Add LIC_FILES_CHKSUM
> > * Builds fine using SHR distro
> > * JaMa: removed PR
>=20
> Was the recipe tested somehow?

Tested on om-gta02 after building it with SHR and added
RDEPENDS_${PN}-test =3D "glibc-gconv-utf-16"
(was also updated in branch after sending pull request)

> > Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  .../lightmediascanner/lightmediascanner_0.4.4.bb   |   27 ++++++++++++=
++++++++
> >  1 files changed, 27 insertions(+), 0 deletions(-)
> >  create mode 100644 meta-efl/recipes-multimedia/lightmediascanner/light=
mediascanner_0.4.4.bb

Also there is trivial patch for enjoy in 4/4:
enjoy: include icon in FILES_${PN}

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4wkndigzIeYF6Hbg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6dqEEACgkQN1Ujt2V2gBxtLACfQ1g1b42MIiGKYENP7gKqMPTS
LcoAn2OG+jIF8/MO9KZhGX3Fjjy35Y7Y
=VLOV
-----END PGP SIGNATURE-----

--4wkndigzIeYF6Hbg--
