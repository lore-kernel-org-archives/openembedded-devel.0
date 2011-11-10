Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ROPam-0007St-3t
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Nov 2011 09:02:36 +0100
Received: by faat2 with SMTP id t2so2647309faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Nov 2011 23:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Tq5TqqV1+JfKJADfYQlYAXcMK7BUqX8rp0bn+I8Tce0=;
	b=TuQfeT/IB318LLmVmSv2cXDFRUV3IPIiWigEkXPFCY7DAVIWIWk+o/UY0Dah41xHSR
	2iBh++7kYLkyXWsF566CSOqT+/Nujv5F93TJG4XeNXL7zQAc6sP9NSj9su8w4Qkdk6QG
	TUQ7ZePoY3KoCNuEGylEpRS1MgFWNDc4mr/8M=
Received: by 10.223.81.196 with SMTP id y4mr10583911fak.6.1320911779791;
	Wed, 09 Nov 2011 23:56:19 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id i3sm10153671faf.0.2011.11.09.23.56.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Nov 2011 23:56:18 -0800 (PST)
Date: Thu, 10 Nov 2011 08:56:07 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111110075607.GH21022@jama.jama.net>
References: <1320866629-22073-1-git-send-email-Martin.Jansa@gmail.com>
	<20111110074449.GB3933@ad.chargestorm.se>
MIME-Version: 1.0
In-Reply-To: <20111110074449.GB3933@ad.chargestorm.se>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH][meta-oe] systemd: add postrm u-a calls
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
X-List-Received-Date: Thu, 10 Nov 2011 08:02:36 -0000
X-Groupsio-MsgNum: 35284
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="X1xGqyAVbSpAWs5A"
Content-Disposition: inline

--X1xGqyAVbSpAWs5A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 10, 2011 at 08:44:49AM +0100, Anders Darander wrote:
> * Martin Jansa <martin.jansa@gmail.com> [111109 20:25]:
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta-oe/recipes-core/systemd/systemd_git.bb |   11 +++++++++--
> >  1 files changed, 9 insertions(+), 2 deletions(-)
>=20
> > diff --git a/meta-oe/recipes-core/systemd/systemd_git.bb b/meta-oe/reci=
pes-core/systemd/systemd_git.bb
> > index 90862a3..d1d4306 100644
> > --- a/meta-oe/recipes-core/systemd/systemd_git.bb
> > +++ b/meta-oe/recipes-core/systemd/systemd_git.bb
> > @@ -14,7 +14,7 @@ inherit gitpkgv
> >  # TODO:
> >  # u-a for runlevel and telinit
> > -# u-a prerm
>=20
> Here on your todo list, it stated u-a for prerm, but you applied it to
> the postrm. In this case, it probably doesn't really matter, but I'd
> still guess that it would make more sense to remove the u-a before
> removing the binaries. Although, I don't think it'll actually cause any
> problems in this case.

I did what u-a.bbclass usually do.. if you think it should be in prerm
then it would be best to first fix in u-a.bbclass and then we can update
the rest of metadata.

Cheers,

>=20
> Cheers,
> Anders
>=20
> >  pkg_postinst_systemd () {
> >  update-alternatives --install ${base_sbindir}/init init ${base_bindir}=
/systemd 300
> > @@ -117,3 +116,11 @@ update-alternatives --install ${base_sbindir}/rebo=
ot reboot ${base_bindir}/syste
> >  update-alternatives --install ${base_sbindir}/shutdown shutdown ${base=
_bindir}/systemctl 300
> >  update-alternatives --install ${base_sbindir}/poweroff poweroff ${base=
_bindir}/systemctl 300
> >  }
> > +
> > +pkg_postrm_systemd () {
> > +update-alternatives --remove init ${base_bindir}/systemd
> > +update-alternatives --remove halt ${base_bindir}/systemctl
> > +update-alternatives --remove reboot ${base_bindir}/systemctl
> > +update-alternatives --remove shutdown ${base_bindir}/systemctl
> > +update-alternatives --remove poweroff ${base_bindir}/systemctl
> > +}
> --=20
> Anders Darander
> ChargeStorm AB / eStorm AB
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--X1xGqyAVbSpAWs5A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk67g5cACgkQN1Ujt2V2gBzELwCggt0We7r3K6XYOeKJYVqZs/QT
ARIAnila8FfBXFdzN8IfX6uFyuCVZyfK
=Q3sb
-----END PGP SIGNATURE-----

--X1xGqyAVbSpAWs5A--
