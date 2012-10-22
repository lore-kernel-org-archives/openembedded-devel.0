Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TQIAh-0001V6-D9
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Oct 2012 15:35:59 +0200
Received: by mail-we0-f175.google.com with SMTP id t44so1387128wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Oct 2012 06:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=I+RXXXPr97ti/u3vfYSTSVZN2ow9m/3vMtaTON0dZXY=;
	b=bDZ61XFrVbFtEvQO6L/5fdevK4xhHbfUosPEzmZtJXcWeV8rKQu98gPU6DEKT8TsH3
	CBLnwAYF6Ok4Esj77zenbdLRVaQSL1rnbN+NuHkNDNRz7hQkW+10P/CrWfYJkd57xVgf
	guCM+TxhSDtpymobBkq2yw5wDZMK4pXvuDp5kVSsum/48w3dmccD4lJ/UnwCiuR+7JbC
	0lZpcFUHmmwuaQBYFE/GBxVhrDsrNYaduLCIG7uJNO8ixBaoU/WSqPU1rMY9ftS5APRN
	gXm+21n7byrYuhk2HrP7GcgrFM8KlfsEpkqZgGalwD+idwIKdASV2hCIkf5H8oWJbPWO
	Us7g==
Received: by 10.216.207.199 with SMTP id n49mr5433670weo.136.1350912154804;
	Mon, 22 Oct 2012 06:22:34 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id cn6sm21912209wib.9.2012.10.22.06.22.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 22 Oct 2012 06:22:33 -0700 (PDT)
Date: Mon, 22 Oct 2012 15:22:48 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121022132248.GI3269@jama.jama.net>
References: <1350899940-2274-1-git-send-email-s.stirtzel@googlemail.com>
	<7D46E86EC0A8354091174257B2FED10159275020@DLEE12.ent.ti.com>
	<CAGiJk9e0xzegmQ32NAkKFdvY+TcyP5ZtnvyUBk59cz0Tc1sQeQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGiJk9e0xzegmQ32NAkKFdvY+TcyP5ZtnvyUBk59cz0Tc1sQeQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH v2] libjpeg-turbo: Add RPROVIDES to fix errors when rdepending on jpeg
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
X-List-Received-Date: Mon, 22 Oct 2012 13:35:59 -0000
X-Groupsio-MsgNum: 41204
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QDIl5R72YNOeCxaP"
Content-Disposition: inline

--QDIl5R72YNOeCxaP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 22, 2012 at 03:20:35PM +0200, Samuel Stirtzel wrote:
> 2012/10/22 Maupin, Chase <chase.maupin@ti.com>:
> >> -----Original Message-----
> >> From: openembedded-devel-bounces@lists.openembedded.org
> >> [mailto:openembedded-devel-bounces@lists.openembedded.org] On
> >> Behalf Of Samuel Stirtzel
> >> Sent: Monday, October 22, 2012 4:59 AM
> >> To: openembedded-devel@lists.openembedded.org
> >> Subject: [oe] [meta-oe][PATCH v2] libjpeg-turbo: Add RPROVIDES to
> >> fix errors when rdepending on jpeg
> >>
> >> This fixes "ERROR: Multiple .bb files are due to be built which
> >> each provide jpeg"
> >>
> >> Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
> >> ---
> >>  meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb |    3 +++
> >>  1 file changed, 3 insertions(+)
> >>
> >> diff --git a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
> >> b/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
> >> index 2aefe1f..303bbae 100644
> >> --- a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
> >> +++ b/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
> >> @@ -15,6 +15,9 @@ S =3D "${WORKDIR}/trunk"
> >>
> >>  # Drop-in replacement for jpeg
> >>  PROVIDES =3D "jpeg"
> >> +RPROVIDES_${PN} +=3D "jpeg"
> >> +RREPLACES_${PN} +=3D "jpeg"
> >> +RCONFLICTS_${PN} +=3D "jpeg"
> >
> > Does this need a PR bump?  Aside from that this has my ack.
> >
>=20
> The error message disappeared without PR bumps or rebuilding.
> Hopefully it doesn't need one, as that would trigger a rebuild of many
> recipes (like Qt, gtk+, gtk+3)

It needs one to replace jpeg with libjpeg-turbo on target.

opkg won't replace it without PR bump afaik

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--QDIl5R72YNOeCxaP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCFSKgACgkQN1Ujt2V2gBy3GACfVm9dYaQt/Chn14pI7vBaonZD
giwAoKmwJxrrLpM0KPmbjMLpQNZZRKRd
=//o7
-----END PGP SIGNATURE-----

--QDIl5R72YNOeCxaP--
