Received: from mail-fx0-f51.google.com ([209.85.161.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QkF0U-0007Uv-3Y
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jul 2011 14:39:06 +0200
Received: by fxh10 with SMTP id 10so5305920fxh.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jul 2011 05:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=k0NvUv/sunISiq/QhfdZV6SHr/4xt0guaZMVovQ24BE=;
	b=mZ23Hbd7YJfHquS/NHm+AeMLPviu9H2gZYUovapFbLQ6kDkO4kfkcZ0CotiykzIpgO
	tBUhFfPTTMIF5lUFwsubenlwBba9R0Fl12epiWUg0vg+c7SwooNhySsAah/sOlohmQXK
	+tYSBS60j9YsWgMDQ7Gkc+l4YptmtG1N/O8qo=
Received: by 10.223.23.26 with SMTP id p26mr2048143fab.98.1311338097633;
	Fri, 22 Jul 2011 05:34:57 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id c1sm274722fam.22.2011.07.22.05.34.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 22 Jul 2011 05:34:56 -0700 (PDT)
Date: Fri, 22 Jul 2011 14:34:49 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110722123449.GC3767@jama.jama.net>
References: <1311287464-13001-1-git-send-email-philippedeswert@gmail.com>
	<1311288853.7847.6.camel@mattotaupa>
	<CAPsFW+QbVj089SmBAWtMU3xX2yPxghQmpsF=qAUZhpcnVLvKdA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPsFW+QbVj089SmBAWtMU3xX2yPxghQmpsF=qAUZhpcnVLvKdA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] gpe-mini-browser2_svn : remove fixes SRCREV
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
X-List-Received-Date: Fri, 22 Jul 2011 12:39:06 -0000
X-Groupsio-MsgNum: 33287
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="d9ADC0YsG2v16Js0"
Content-Disposition: inline

--d9ADC0YsG2v16Js0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 22, 2011 at 03:18:37PM +0300, Philippe De Swert wrote:
> Hi Paul,
>=20
> On 22/07/2011, Paul Menzel <paulepanter@users.sourceforge.net> wrote:
> > thank you for your patch.
>=20
> Thank you for the review.
>=20
> > Please do not remove the `SRCREV` but replace it by a valid and working
> > revision. Otherwise the builds would not be reproducible.
> >
>=20
> I already wondered who added one (as I originally added the svn
> recipe). Anyway I thought the whole idea of _svn etc were to have
> bleeding edge builds. If we wanted stable there would be a versioned
> recipe.

If you want it bleeding then you or your distribution will set

SRCREV_pn-gpe-mini-browser2 =3D "${AUTOREV}"

in local.conf or some distro .inc file
like there is
conf/distro/include/shr-autorev.inc
conf/distro/include/fso-autorev.inc
etc.

but for rest of world is better to say which SRCREV was tested and
should work for everybody.

> Of course I can add a new SRCREV but it defeats the whole purpose of
> the recipe...

Main purpose of _svn recipes is to allow build project without proper
release or old release etc.. picking random bleeding edge revision and
expect to get building image with it everytime I need to build newer
images is not purpose but insanity :).

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--d9ADC0YsG2v16Js0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEUEARECAAYFAk4pbmkACgkQN1Ujt2V2gBy9kgCgsnNiSVob/9bPW1r2o9oNWDIb
RSgAmM6WlN0/OkEcLKLOeQrP/nj9vGc=
=EIfQ
-----END PGP SIGNATURE-----

--d9ADC0YsG2v16Js0--
