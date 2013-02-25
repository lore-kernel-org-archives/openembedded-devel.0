Received: from mail-da0-f49.google.com ([209.85.210.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UA3wd-0005P8-0d
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Feb 2013 20:42:39 +0100
Received: by mail-da0-f49.google.com with SMTP id t11so671508daj.22
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Feb 2013 11:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ovmIZzbydM0kKWVM9pNhmEVLM8y2LUggWAflFNP6nmw=;
	b=ZqrEQBSbl9KYhX/u0rvS6YzXhnkJZ+ElFe5GyjQq2oessiNBYTeMHAjQmBCmZ62Kzo
	XQK+5nuqZJh9lzVy3JB0L/r8LwS3OetdLXp5gLsTfYWsFwGDJL0nnLSAwEd9qYR+CJ0y
	NCReCVGr8F0NeRGiePW2zIKci0xYQQgeIGnZoIvGJQRJOgHk1T+aDma51z+oM6dUqkVL
	Xbomk8pDB4o8UpmWAxgQiBHYEv8Ho7DVEkX1xms7Z/mOtCxPnS4wGyBzOX4jb5hfKSCM
	Df+bkrAHpR6lWjnVek/MQIdfnxTrGuojgUS55YJlgdUCYd76JRrRB2FHlnDc1hgWDCjc
	mmlQ==
X-Received: by 10.66.118.7 with SMTP id ki7mr18108082pab.184.1361820380219;
	Mon, 25 Feb 2013 11:26:20 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id 1sm13615005pba.32.2013.02.25.11.26.18
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 25 Feb 2013 11:26:19 -0800 (PST)
Date: Mon, 25 Feb 2013 20:26:29 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130225192629.GD3239@jama>
References: <1355519149-23005-1-git-send-email-gary@mlbassoc.com>
	<20121216180022.GC3448@jama>
	<20130109142121.GN3722@jama.palm1.palmone.com>
	<50ED7FDD.7060003@mlbassoc.com>
	<20130110112754.GB3722@jama.palm1.palmone.com>
MIME-Version: 1.0
In-Reply-To: <20130110112754.GB3722@jama.palm1.palmone.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] rng-tools: Fixes for latest OE layouts
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
X-List-Received-Date: Mon, 25 Feb 2013 19:42:40 -0000
X-Groupsio-MsgNum: 43300
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EY/WZ/HvNxOox07X"
Content-Disposition: inline

--EY/WZ/HvNxOox07X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 10, 2013 at 12:27:54PM +0100, Martin Jansa wrote:
> On Wed, Jan 09, 2013 at 07:34:05AM -0700, Gary Thomas wrote:
> > On 2013-01-09 07:21, Martin Jansa wrote:
> > > On Sun, Dec 16, 2012 at 07:00:22PM +0100, Martin Jansa wrote:
> > >> On Fri, Dec 14, 2012 at 02:05:48PM -0700, Gary Thomas wrote:
> > >>> The current recipe has a few installation errors:
> > >>>    * The manipulation of configurable paths drops a '/'
> > >>>    * The init script defaults are placed in the wrong file
> > >>>    * Finer control over init script start/stop
> > >>>    * The default device is non-standard
> > >>>
> > >>> This patch fixes these little nits and makes the package usable aga=
in.
> > >>>
> > >>> Signed-off-by: Gary Thomas <gary@mlbassoc.com>
> > >>> ---
> > >>>   meta-oe/recipes-support/rng-tools/files/default  |    3 ++-
> > >>>   meta-oe/recipes-support/rng-tools/rng-tools_2.bb |    5 +++--
> > >>>   2 files changed, 5 insertions(+), 3 deletions(-)
> > >>>
> > >>> diff --git a/meta-oe/recipes-support/rng-tools/files/default b/meta=
-oe/recipes-support/rng-tools/files/default
> > >>> index ab7cd93..7aede9b 100644
> > >>> --- a/meta-oe/recipes-support/rng-tools/files/default
> > >>> +++ b/meta-oe/recipes-support/rng-tools/files/default
> > >>> @@ -1,2 +1,3 @@
> > >>>   # Specify rng device
> > >>> -RNG_DEVICE=3D/dev/hwrng
> > >>> +#RNG_DEVICE=3D/dev/hwrng
> > >>> +RNG_DEVICE=3D/dev/urandom
> > >>> diff --git a/meta-oe/recipes-support/rng-tools/rng-tools_2.bb b/met=
a-oe/recipes-support/rng-tools/rng-tools_2.bb
> > >>> index ef753cf..b94854a 100644
> > >>> --- a/meta-oe/recipes-support/rng-tools/rng-tools_2.bb
> > >>> +++ b/meta-oe/recipes-support/rng-tools/rng-tools_2.bb
> > >>> @@ -15,12 +15,13 @@ inherit autotools update-rc.d
> > >>>   do_install_append() {
> > >>>           install -d "${D}${sysconfdir}/init.d"
> > >>>           install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/=
rng-tools
> > >>> -        sed -i -e 's,/etc/,${sysconfdir}/,' -e 's,/usr/sbin/,${sbi=
ndir},' \
> > >>> +        sed -i -e 's,/etc/,${sysconfdir}/,' -e 's,/usr/sbin/,${sbi=
ndir}/,' \
> > >>>               ${D}${sysconfdir}/init.d/rng-tools
> > >>>
> > >>>           install -d "${D}${sysconfdir}/default"
> > >>> -        install -m 0644 ${WORKDIR}/default ${D}${sysconfdir}/defau=
lt
> > >>> +        install -m 0644 ${WORKDIR}/default ${D}${sysconfdir}/rng-t=
ools
> > >>>   }
> > >>>
> > >>>   INITSCRIPT_NAME =3D "rng-tools"
> > >>>   INITSCRIPT_PARAMS =3D "defaults"
> > >>> +INITSCRIPT_PARAMS =3D "start 30 S . stop 30 0 6 1 ."
> > >>
> > >> Why do you add 2nd INITSCRIPT_PARAMS ?
> > >
> > > ping :)
> >=20
> > Sorry, must have missed your query (holidays).
> >=20
> > That second line should really replace the first for finer grain
> > control over the start/stop choice.  I can fix this and resend the patc=
h.
>=20
> Yes, please do if you want it applied.

Last call for update. Next week I'll remove it from my queue and mark it
as "Changes requested" on patchwork when not updated.

>=20
> Cheers,
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--EY/WZ/HvNxOox07X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEruuUACgkQN1Ujt2V2gByK7wCeOxaEYt91Rxy8a7QUcxfAa0hD
KoYAn2H2UCZoFUOniUhXLyH2jLjt+gT8
=bXcR
-----END PGP SIGNATURE-----

--EY/WZ/HvNxOox07X--
