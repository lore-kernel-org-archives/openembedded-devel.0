Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RyWXN-0007ks-ML
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Feb 2012 23:44:21 +0100
Received: by eaal10 with SMTP id l10so1287263eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2012 14:36:07 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.213.21.145 as permitted sender) client-ip=10.213.21.145; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.213.21.145 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.213.21.145])
	by 10.213.21.145 with SMTP id j17mr1831061ebb.139.1329518167322
	(num_hops = 1); Fri, 17 Feb 2012 14:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=6piSrXzEUBdliM4UfmyyPVq0TeI3fKuUi59sxX02jrc=;
	b=lDEpgZXG+V9uG7FAFzz2CgOlinNCBo7hbtXV1Tupu+HWTomTvDOtuR2HW+qHjxtdQJ
	/PEMXiXBHwWdsx0ranNjNL0ejYxtb3ZkIvxJ/EUehbratm0Ivul5oFseSa1TQvEdIbIT
	r11G+eR3Cld3Iba5CHo9HfYiRi+NmJy/KJqQE=
Received: by 10.213.21.145 with SMTP id j17mr1462301ebb.139.1329518167187;
	Fri, 17 Feb 2012 14:36:07 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a58sm43622510eeb.8.2012.02.17.14.36.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 17 Feb 2012 14:36:06 -0800 (PST)
Date: Fri, 17 Feb 2012 23:36:04 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120217223604.GM5822@jama.jama.net>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
	<20120216125339.GC5822@jama.jama.net>
	<CALbNGRQyyn2Pr5_pcLk4hGfh+y65o2V93sy49KLTv8801dniNA@mail.gmail.com>
	<CALbNGRQMQwGUiQRJGzF82qpBa8j3YyeFJAbi3fGkFMVMS_ZQdQ@mail.gmail.com>
	<CALbNGRREd9yBF2FkbsoBT1mJL8OBDraz-QB4=NHfp4=qCj+qWw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRREd9yBF2FkbsoBT1mJL8OBDraz-QB4=NHfp4=qCj+qWw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][v2] 00/22] systemd rework
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
X-List-Received-Date: Fri, 17 Feb 2012 22:44:21 -0000
X-Groupsio-MsgNum: 37221
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bZ2MuwyI/0uB8yuJ"
Content-Disposition: inline

--bZ2MuwyI/0uB8yuJ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 17, 2012 at 11:30:38PM +0100, Andreas M=FCller wrote:
> On Fri, Feb 17, 2012 at 11:27 PM, Andreas M=FCller
> <schnitzeltony@googlemail.com> wrote:
> > On Fri, Feb 17, 2012 at 7:53 PM, Andreas M=FCller
> > <schnitzeltony@googlemail.com> wrote:
> >> On Thu, Feb 16, 2012 at 1:53 PM, Martin Jansa <martin.jansa@gmail.com>=
 wrote:
> >>> On Thu, Feb 16, 2012 at 03:02:54AM +0100, Andreas M=FCller wrote:
> >>>> V1 -> V2:
> >>>> [2] =A0do not check configuration variables for cross and nativesdk
> >>>> [3] =A0rename systemd_package to systemd_generate_package_scripts
> >>>> [6] =A0parse unit files to determine the files to pack
> >>>> [7] =A0create warning if *-systemd package already rdepends
> >>>> =A0 =A0 =A0it's base package
> >>>> added in V2:
> >>>> [8]-[20] remove obsolet systemd code from recipes (these were used as
> >>>> =A0 =A0 =A0test cases)
> >>>> [21] dhcp-(relay) test case for multiple systemd packages
> >>>> [22] modified to start service
> >>>
> >>> Whole series looks good to me sofar.
> >>>
> >>> I'm not sure what's meant by this warning:
> >>> WARNING:
> >>> /OE/shr-core/meta-openembedded/meta-oe/recipes-connectivity/gateone/g=
ateone_git.bb:
> >>> it is recommended to set SYSTEMD_PACKAGES as <existing-package>-syste=
md
> >>> WARNING:
> >>> /OE/shr-core/meta-openembedded/meta-oe/recipes-devtools/cloud9/cloud9=
_0.5.1.bb:
> >>> it is recommended to set SYSTEMD_PACKAGES as <existing-package>-syste=
md
> >>>
> >>> I guess we should
> >>> -SYSTEMD_PACKAGES =3D "${PN}"
> >>> +SYSTEMD_PACKAGES =3D "${PN}-systemd"
> >>> with this patchset too and add ${PN}-systemd to task which pulls gate=
one/cloud9.
> >>>
> >>> And I'm not sure if this change is intentional:
> >>> http://git.shr-project.org/git/?p=3Dbuildhistory.git;a=3Dcommitdiff;h=
=3D3d27d7267406bd0fb2ea2a48b108dbb8bc7c128f#patch18
> >>>
> >>> as xserver-nodm-init-systemd doesn't really need xserver-nodm-init, b=
ut
> >>> probably won't harm if xserver-nodm-init is used only to pull
> >>> xinit+xserver-common dependency.
> >>>
> >> The only 'clean' way out here I see is an additional variable
> >> overriding automatic rdepending. How about
> >>
> >> SYSTEMD_RDEPENDS: If this variable is set with a list of packages, its
> >> contents are used for redepending (systemd is still added). It should
> >> be possible to set packages outside of recipe and of course the
> >> contents should be checked during parse. What do you think?
> >>
> > How about this: If systemd.bbclass detects, that
> > RDEPENDS_${systemd-base-package} is not empty, it will only append
> sorry I meant RDEPENDS_${SYSTEMD_PACKAGES[]}
> > 'systemd'. So the recipe can override the automatism easily and there
> > is no need for another variable.

If it works even when RDEPENDS_${SYSTEMD_PACKAGES[]} is in recipe after
inherit systemd then also OK.

Cheers,

> >
> > Andreas
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--bZ2MuwyI/0uB8yuJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8+1lQACgkQN1Ujt2V2gByEawCfVYajUWVIXZPt1MOy14Ozc3IU
fYgAn2R6ngtd9Og/RVHrgITqHLO6Rfik
=svG6
-----END PGP SIGNATURE-----

--bZ2MuwyI/0uB8yuJ--
