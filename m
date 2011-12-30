Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Rgesd-0004tt-UZ
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Dec 2011 17:00:29 +0100
Received: by eeit10 with SMTP id t10so8758186eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Dec 2011 07:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=to9W6PzEFx+/+Vagu95f5HmQmWFiEVq+Gt+1TGvuWB4=;
	b=nuL2dcxOjRGFDNsoyLD0YQ0OKhNGLPYJ3Ok+i6Kp7BRARw0RlAIQ/GrU6aKTRB50Wv
	So8Yzw2A3I8fr6366x0Z8G24QjBLLbpeuekbQZzc5qGCQHVBuMZobwDTJmXyRV2tm5Dc
	jfppi6Dwgo8ir+szla6khpOVsVPg5r411dZ/E=
Received: by 10.213.28.7 with SMTP id k7mr11263031ebc.11.1325260381546;
	Fri, 30 Dec 2011 07:53:01 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b49sm118267825eec.9.2011.12.30.07.52.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Dec 2011 07:53:00 -0800 (PST)
Date: Fri, 30 Dec 2011 16:52:58 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111230155258.GJ16885@jama.jama.net>
References: <cover.1325248824.git.otavio@ossystems.com.br>
	<06b8fd4ed68ad3e735b54d661f66737048ce9597.1325248824.git.otavio@ossystems.com.br>
	<20111230130026.GH16885@jama.jama.net>
	<CAP9ODKredoCdpROP-4xjYMo5RAjj9Ctj_tGmET9ptTXgX4gaZQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKredoCdpROP-4xjYMo5RAjj9Ctj_tGmET9ptTXgX4gaZQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 3/3] task-x11: use xserver-nodm-init-systemd
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
X-List-Received-Date: Fri, 30 Dec 2011 16:00:29 -0000
X-Groupsio-MsgNum: 36319
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bgLLobvf7eP6VP5c"
Content-Disposition: inline

--bgLLobvf7eP6VP5c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 30, 2011 at 01:47:18PM -0200, Otavio Salvador wrote:
> On Fri, Dec 30, 2011 at 11:00, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
>=20
> > >  # elsa, xserver-nodm-init
> > > -VIRTUAL-RUNTIME_graphical_init_manager ?=3D "xserver-nodm-init"
> > > +VIRTUAL-RUNTIME_graphical_init_manager ?=3D "xserver-nodm-init-syste=
md"
> >
> > There are still people not using systemd _only_ and I belive that this
> > change drops sysvinit script completely (xserver-nodm-init-systemd
> > correctly doesn't rdepend on xserver-nodm-init, because is using only
> > xinit and xserver-common provider).
> >
>=20
> I added it because the task-basic depends on systemd-compat-units so it is
> clearly forcing systemd use. So anyone using sysv will need to avoid
> task-basic et all.

Yes, but this is task-x11 not task-basic.. I wouldn't complain if you
add it to task-basic.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--bgLLobvf7eP6VP5c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk793loACgkQN1Ujt2V2gByDJwCgk3mWIQlEb0LXFkrNPJvAC84O
ZgMAoJtAkpZz3Bwzymw5BvdojSbMBDjv
=LGOg
-----END PGP SIGNATURE-----

--bgLLobvf7eP6VP5c--
