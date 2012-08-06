Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SyQ7c-0003tv-I3
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Aug 2012 18:25:36 +0200
Received: by wibhm11 with SMTP id hm11so1727255wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Aug 2012 09:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=OAD0C9Qy86cPEcvx83q6bFouFVsDdo2p+aNQQc8VbDg=;
	b=I4+yv5GWVHHwUjitOvjJJ24wl12L4Msnkj50ASUDGgB6zZ2mTTQVL6kNsxchofssr/
	ZLdU/6NyD3yyv9WOA+ydosn6Y8iIWfZOxXylX9Kcp1pDK9YaEApHUVsPs6PL6Sm/Y/VI
	BCCsJt6CB8wenuIY4hZS2mMKO7ao+UlQkuMp5uWtatZER94Rur4g1Yv5992btYzBEWxg
	yj2V6Xs+uRglfkTsUJ/BXe8XXHDiDc68ARtaiNVavsHF7UPOKyNJ6QhXEBxpYdZzi2AD
	u6utd0/4wVyCuGi7AjImWeK1m20bHV/b6dtIXCLmRggg48/Ox01S63eo/IR42vnGzHya
	FfCQ==
Received: by 10.180.107.2 with SMTP id gy2mr19733178wib.2.1344269631923;
	Mon, 06 Aug 2012 09:13:51 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ck9sm23951071wib.2.2012.08.06.09.13.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 06 Aug 2012 09:13:50 -0700 (PDT)
Date: Mon, 6 Aug 2012 18:13:46 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120806161346.GM3267@jama.jama.net>
References: <cover.1343859304.git.Martin.Jansa@gmail.com>
	<5dd20f461ce240ffcaf43bd048e9b5e6ffd06bd0.1344259248.git.Martin.Jansa@gmail.com>
	<jvok48$5ct$1@dough.gmane.org>
	<20120806143306.GL3267@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120806143306.GL3267@jama.jama.net>
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
X-List-Received-Date: Mon, 06 Aug 2012 16:25:36 -0000
X-Groupsio-MsgNum: 40084
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vdqwC0msT4ilQ2it"
Content-Disposition: inline

--vdqwC0msT4ilQ2it
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 06, 2012 at 04:33:06PM +0200, Martin Jansa wrote:
> On Mon, Aug 06, 2012 at 04:25:58PM +0200, Koen Kooi wrote:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >=20
> > Op 06-08-12 15:37, Martin Jansa schreef:
> > > * variable allows to add items in .bbappend without overwritting whol=
e=20
> > > postinst * hwclock.service should be used to blacklist SYSV hwclock.sh
> > > (not hwclock.sh.service) * show only newly disabled SYSV scripts
> > >=20
> > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com> ---=20
> > > .../recipes-core/systemd/systemd-compat-units.bb   |   19
> > > ++++++++++++++----- 1 files changed, 14 insertions(+), 5 deletions(-)
> > >=20
> > > diff --git a/meta-systemd/recipes-core/systemd/systemd-compat-units.bb
> > > b/meta-systemd/recipes-core/systemd/systemd-compat-units.bb index
> > > c9a6b67..2973208 100644 ---
> > > a/meta-systemd/recipes-core/systemd/systemd-compat-units.bb +++
> > > b/meta-systemd/recipes-core/systemd/systemd-compat-units.bb @@ -3,7 +=
3,7
> > > @@ DESCRIPTION =3D "Units to make systemd work better with existing
> > > sysvinit scripts" LICENSE =3D "MIT" LIC_FILES_CHKSUM =3D
> > > "file://${COREBASE}/LICENSE;md5=3D3f40d7994397109285ec7b81fdeb3b58"
> > >=20
> > > -PR =3D "r15" +PR =3D "r16"
> > >=20
> > > inherit allarch
> > >=20
> > > @@ -26,15 +26,24 @@ do_install() { chmod 0755 ${D}${bindir}/runlevel }
> > >=20
> > > +SYSTEMD_DISABLED_SYSV_SERVICES =3D " \ +  busybox-udhcpc \ +  dnsmas=
q \ +
> > > hwclock \ +  networking \ +  syslog \ +  syslog.busybox \ +" +=20
> > > pkg_postinst_${PN} () { cd $D${sysconfdir}/init.d
> > >=20
> > > echo -n "Disabling the following sysv scripts: "
> > >=20
> > > -for i in busybox-udhcpc dnsmasq hwclock.sh networking syslog
> > > syslog.busybox ; do -	if [ -e $i ] ; then -		echo -n "$i " ; ln -s
> > > /dev/null $D${systemd_unitdir}/system/$i.service -	fi +for i in
> > > ${SYSTEMD_DISABLED_SYSV_SERVICES} ; do +    if [ \( -e $i -o $i.sh \)=
 -a
> > > ! -e $D${base_libdir}/systemd/system/$i.service ] ; then +        ech=
o -n
> > > "$i " ; ln -s /dev/null $D${base_libdir}/systemd/system/$i.service +
> > > fi done ; echo }
> >=20
> > Doing something like this should work a bit better:
> >=20
> > for i in ${SYSTEMD_DISABLED_SYSV_SERVICES} ; do
> > 	systemctl mask $i
> > done
>=20
> Thanks for info.
>=20
> It needs .service suffis so
> systemctl mask $i.service
>=20
> and I'll send v2 after testing if this works also in do_rootfs time.

Doesn't seem to work in do_rootfs
http://git.shr-project.org/git/?p=3Dbuildhistory.git;a=3Dcommitdiff;h=3D0a3=
0b3b26081ab6f543d280874c2ecff43cbe0fa
http://git.shr-project.org/git/?p=3Dbuildhistory.git;a=3Dcommitdiff;h=3D7b6=
90a71c50e07a685fb31ef4a5295fdb5c2f853
but no error in log.do_rootfs

Configuring systemd-speed-hacks.
Configuring systemd-compat-units.
Configuring udev-extraconf.

(even the line "Disabling the following sysv scripts:" is missing,
weird)

Cheers,

>=20
> Or you can merge this pull request and I'll send thich change as=20
> follow-up after testing.
>=20
> Cheers,
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--vdqwC0msT4ilQ2it
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAf7ToACgkQN1Ujt2V2gBxnDwCgj4WK8AICWVrO2O9/y1ch5KR4
6L8Anivx7dHTB+rJupi4wUZRn2JgIGI6
=opFC
-----END PGP SIGNATURE-----

--vdqwC0msT4ilQ2it--
