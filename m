Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RyWPL-000792-I3
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Feb 2012 23:36:03 +0100
Received: by eaal10 with SMTP id l10so1285837eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2012 14:27:48 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.52.7 as permitted sender) client-ip=10.14.52.7; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.52.7 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.52.7])
	by 10.14.52.7 with SMTP id d7mr5586194eec.80.1329517668676 (num_hops =
	1); Fri, 17 Feb 2012 14:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=DZxuqDeppbRT1YDc1AWA2jf/weQ/bkpNeExofYu5skA=;
	b=SYEllSD/6AgZ86IN+chQpfxeMF6bDqVZuVzLa6rfSAMXRnnfwFQB2ptwmbLyRKO4Pk
	C316BpZBtoIG7DPyJOXnROY2aS3Tqsph/VBZlDw7uKUI4Lk2ydAPjq228fpUGXwJ9zjd
	YIZMwBjP/pKq4aQDKVjR268kDd+MzTfiZJMp0=
Received: by 10.14.52.7 with SMTP id d7mr4535709eec.80.1329517668567;
	Fri, 17 Feb 2012 14:27:48 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w60sm43606308eeb.4.2012.02.17.14.27.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 17 Feb 2012 14:27:47 -0800 (PST)
Date: Fri, 17 Feb 2012 23:27:44 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120217222744.GI5822@jama.jama.net>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
	<20120216125339.GC5822@jama.jama.net>
	<CALbNGRQyyn2Pr5_pcLk4hGfh+y65o2V93sy49KLTv8801dniNA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRQyyn2Pr5_pcLk4hGfh+y65o2V93sy49KLTv8801dniNA@mail.gmail.com>
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
X-List-Received-Date: Fri, 17 Feb 2012 22:36:03 -0000
X-Groupsio-MsgNum: 37217
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="16qp2B0xu0fRvRD7"
Content-Disposition: inline

--16qp2B0xu0fRvRD7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 17, 2012 at 07:53:49PM +0100, Andreas M=FCller wrote:
> On Thu, Feb 16, 2012 at 1:53 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > On Thu, Feb 16, 2012 at 03:02:54AM +0100, Andreas M=FCller wrote:
> >> V1 -> V2:
> >> [2] =A0do not check configuration variables for cross and nativesdk
> >> [3] =A0rename systemd_package to systemd_generate_package_scripts
> >> [6] =A0parse unit files to determine the files to pack
> >> [7] =A0create warning if *-systemd package already rdepends
> >> =A0 =A0 =A0it's base package
> >> added in V2:
> >> [8]-[20] remove obsolet systemd code from recipes (these were used as
> >> =A0 =A0 =A0test cases)
> >> [21] dhcp-(relay) test case for multiple systemd packages
> >> [22] modified to start service
> >
> > Whole series looks good to me sofar.
> >
> > I'm not sure what's meant by this warning:
> > WARNING:
> > /OE/shr-core/meta-openembedded/meta-oe/recipes-connectivity/gateone/gat=
eone_git.bb:
> > it is recommended to set SYSTEMD_PACKAGES as <existing-package>-systemd
> > WARNING:
> > /OE/shr-core/meta-openembedded/meta-oe/recipes-devtools/cloud9/cloud9_0=
=2E5.1.bb:
> > it is recommended to set SYSTEMD_PACKAGES as <existing-package>-systemd
> >
> > I guess we should
> > -SYSTEMD_PACKAGES =3D "${PN}"
> > +SYSTEMD_PACKAGES =3D "${PN}-systemd"
> > with this patchset too and add ${PN}-systemd to task which pulls gateon=
e/cloud9.
> >
> > And I'm not sure if this change is intentional:
> > http://git.shr-project.org/git/?p=3Dbuildhistory.git;a=3Dcommitdiff;h=
=3D3d27d7267406bd0fb2ea2a48b108dbb8bc7c128f#patch18
> >
> > as xserver-nodm-init-systemd doesn't really need xserver-nodm-init, but
> > probably won't harm if xserver-nodm-init is used only to pull
> > xinit+xserver-common dependency.
> >
> The only 'clean' way out here I see is an additional variable
> overriding automatic rdepending. How about
>=20
> SYSTEMD_RDEPENDS: If this variable is set with a list of packages, its
> contents are used for redepending (systemd is still added). It should
> be possible to set packages outside of recipe and of course the
> contents should be checked during parse. What do you think?

Looks good or even
SYSTEMD_PACKAGES_RDEPENDS
to be more clear where it will be applied.

Cheers,

>=20
> Andreas
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--16qp2B0xu0fRvRD7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8+1GAACgkQN1Ujt2V2gBzNHQCghWOlMqstPI3rWznsnQ8OfpYU
6JQAn3kH0hIskIenixWYPU939MUsyv/7
=wxgE
-----END PGP SIGNATURE-----

--16qp2B0xu0fRvRD7--
