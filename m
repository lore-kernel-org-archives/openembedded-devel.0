Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TP9Be-0000O9-Ay
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Oct 2012 11:48:15 +0200
Received: by mail-we0-f175.google.com with SMTP id t44so126066wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Oct 2012 02:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=QMkmbYrzNoDlvJ9jsfef2x4/ezwYa7DmeJFwK4dR+d0=;
	b=ej4bNarWyee9TKoTHwfKmBkcWPxNqlJ5MXjtkutC8v2q9oI1cSOzwcza5EAL0SIsCF
	SM2q/EVva6yYYVJOEgGWhouh/EnBINDhzdLtxNjnYX3Uog8AOzTU9ts1ia3zQTtQ43Hq
	XOptSTe37uHsafgITV9w4R07EY69uCy9yFXEPY0hFUoxYHlXQ7qE4LfE5VP0u2xx/DXu
	QZ34nZhJrpRL05+0XYql1Pb6kP8eIoyD1++UG9abqggMqK/egaZVxpgINSpuwStQyPaB
	L+csP/5Hx8EmFMmYWBF3j0+ybNAzVGQxPK/iSXkk6TD9eTxkW/OsBiZzJmioAWWP+SSJ
	5NsQ==
Received: by 10.216.210.5 with SMTP id t5mr468474weo.32.1350639293804;
	Fri, 19 Oct 2012 02:34:53 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k20sm34018172wiv.11.2012.10.19.02.34.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 19 Oct 2012 02:34:52 -0700 (PDT)
Date: Fri, 19 Oct 2012 11:35:02 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121019093502.GI3087@jama.jama.net>
References: <cover.1350589969.git.Martin.Jansa@gmail.com>
	<ba8a3e71ad6e1ca180e2998525129b907948a0db.1350589969.git.Martin.Jansa@gmail.com>
	<CAJTo0LZ-2=f3bHO8a0aM2BJFXfGnF+s8tEBDK7ehjHK3Zfi71g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZ-2=f3bHO8a0aM2BJFXfGnF+s8tEBDK7ehjHK3Zfi71g@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 3/5] ecore: drop libxputil from DEPENDS
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
X-List-Received-Date: Fri, 19 Oct 2012 09:48:15 -0000
X-Groupsio-MsgNum: 41160
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="itqfrb9Qq3wY07cp"
Content-Disposition: inline

--itqfrb9Qq3wY07cp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 19, 2012 at 10:26:07AM +0100, Burton, Ross wrote:
> On 18 October 2012 20:54, Martin Jansa <martin.jansa@gmail.com> wrote:
> > * it was removed from oe-core
> >   http://git.openembedded.org/openembedded-core/commit/?id=3D5b3748d463=
a6666c0d8e2624092619da8d8e6328
> > * it needs to be explicitly disabled now, because recipe was removed in
> >   oe-core, but files still stay in sysroot and we cannot even
> >   cleansstate it now without recipes around.
>=20
> To be honest you'll probably want to tell upstream to just remove
> Xprint.  It was removed from oe-core because support in the server was
> removed in 2008.  Since 2008 the Xprint code in any client application
> has been unable to work.

They are migrating all efl libs to one efl tree now and removing a lot
of options in the process so I guess they will remove Xprint too in the
process, but I'll tell them if they keep it autodetected.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--itqfrb9Qq3wY07cp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCBHsYACgkQN1Ujt2V2gByheQCdGNufougWr+9tOvIZv9biZF4y
i5oAmwVbTmnAosLoBbGSdEtur4/4ddbp
=0F7U
-----END PGP SIGNATURE-----

--itqfrb9Qq3wY07cp--
