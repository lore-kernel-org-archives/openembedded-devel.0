Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SyOYB-0001fj-Qt
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Aug 2012 16:44:55 +0200
Received: by wgbdr1 with SMTP id dr1so2450385wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Aug 2012 07:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=kZLYqdXyCmeGZ/qAJD2CjhvUrDf4WzoOQh8/lR8q5j0=;
	b=m9oem//iaPl6q5y6x3y4cqjspGSaQuxvuh6ULHLjw4p+a8eJru5GiiSfsF60PFqhAr
	zj3/A3K4ADXo5QRyEQIFTvOPPE2HkZS+CH/jGIo9V9MuGDz0fhCaIsbL4VvWmovBunrH
	+suXxV0uJtIRY1r/JXWeaS2wsbYOBSeX5+cLhRtYJf+HrcDpyTUalv7NCJz7vxnwTRLB
	fHAJWBMBlCNTD9cYc6ky0VoE8U58EoSdswZd/1Dmliza2ob71lE+TPgcf95JybEFFRQc
	z1MaOD7dO7HXdb4kzy8nUPtxleiGHIdHm8pkibKtvz4DCW9m585JHKYyD/0egVi90ahT
	TeWA==
Received: by 10.180.92.9 with SMTP id ci9mr18901684wib.22.1344263591240;
	Mon, 06 Aug 2012 07:33:11 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w7sm15826353wiz.0.2012.08.06.07.33.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 06 Aug 2012 07:33:10 -0700 (PDT)
Date: Mon, 6 Aug 2012 16:33:06 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120806143306.GL3267@jama.jama.net>
References: <cover.1343859304.git.Martin.Jansa@gmail.com>
	<5dd20f461ce240ffcaf43bd048e9b5e6ffd06bd0.1344259248.git.Martin.Jansa@gmail.com>
	<jvok48$5ct$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <jvok48$5ct$1@dough.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 09/12] systemd-compat-units: move list of disabled services to variable, fix hwclock.sh and output
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
X-List-Received-Date: Mon, 06 Aug 2012 14:44:55 -0000
X-Groupsio-MsgNum: 40082
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AQNmCumFClRcGgHG"
Content-Disposition: inline

--AQNmCumFClRcGgHG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 06, 2012 at 04:25:58PM +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Op 06-08-12 15:37, Martin Jansa schreef:
> > * variable allows to add items in .bbappend without overwritting whole=
=20
> > postinst * hwclock.service should be used to blacklist SYSV hwclock.sh
> > (not hwclock.sh.service) * show only newly disabled SYSV scripts
> >=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com> ---=20
> > .../recipes-core/systemd/systemd-compat-units.bb   |   19
> > ++++++++++++++----- 1 files changed, 14 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/meta-systemd/recipes-core/systemd/systemd-compat-units.bb
> > b/meta-systemd/recipes-core/systemd/systemd-compat-units.bb index
> > c9a6b67..2973208 100644 ---
> > a/meta-systemd/recipes-core/systemd/systemd-compat-units.bb +++
> > b/meta-systemd/recipes-core/systemd/systemd-compat-units.bb @@ -3,7 +3,7
> > @@ DESCRIPTION =3D "Units to make systemd work better with existing
> > sysvinit scripts" LICENSE =3D "MIT" LIC_FILES_CHKSUM =3D
> > "file://${COREBASE}/LICENSE;md5=3D3f40d7994397109285ec7b81fdeb3b58"
> >=20
> > -PR =3D "r15" +PR =3D "r16"
> >=20
> > inherit allarch
> >=20
> > @@ -26,15 +26,24 @@ do_install() { chmod 0755 ${D}${bindir}/runlevel }
> >=20
> > +SYSTEMD_DISABLED_SYSV_SERVICES =3D " \ +  busybox-udhcpc \ +  dnsmasq =
\ +
> > hwclock \ +  networking \ +  syslog \ +  syslog.busybox \ +" +=20
> > pkg_postinst_${PN} () { cd $D${sysconfdir}/init.d
> >=20
> > echo -n "Disabling the following sysv scripts: "
> >=20
> > -for i in busybox-udhcpc dnsmasq hwclock.sh networking syslog
> > syslog.busybox ; do -	if [ -e $i ] ; then -		echo -n "$i " ; ln -s
> > /dev/null $D${systemd_unitdir}/system/$i.service -	fi +for i in
> > ${SYSTEMD_DISABLED_SYSV_SERVICES} ; do +    if [ \( -e $i -o $i.sh \) -a
> > ! -e $D${base_libdir}/systemd/system/$i.service ] ; then +        echo =
-n
> > "$i " ; ln -s /dev/null $D${base_libdir}/systemd/system/$i.service +
> > fi done ; echo }
>=20
> Doing something like this should work a bit better:
>=20
> for i in ${SYSTEMD_DISABLED_SYSV_SERVICES} ; do
> 	systemctl mask $i
> done

Thanks for info.

It needs .service suffis so
systemctl mask $i.service

and I'll send v2 after testing if this works also in do_rootfs time.

Or you can merge this pull request and I'll send thich change as=20
follow-up after testing.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--AQNmCumFClRcGgHG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAf1aIACgkQN1Ujt2V2gBwIgwCgiTgQxDieV4B1cx2aB7tJ/XFo
ozEAnjaNFHUCSsQzkWDOOT+ENsNjkFWs
=pdE6
-----END PGP SIGNATURE-----

--AQNmCumFClRcGgHG--
