Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RROKJ-00011j-SJ
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Nov 2011 14:17:56 +0100
Received: by bkbzs2 with SMTP id zs2so3360126bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Nov 2011 05:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=diP+y+qqgM+3fi3UcvXYlxo8x56Ci1v9kmGkv8RAER4=;
	b=njUxmk9Cp9V/iN15d42/U78I6ghRN/dZ5TzHWsQL56UkapfJuHEZCYlsnc66zb5nP8
	unhB4+kLZOXOyjqVmxwF3/YiibNTFnECe5wksyzT8zXeREjGgOQ0N2Ady2RoueQuLoYm
	OIoXtk1NDDgT+rHGO2Dikm+PRVik+1Fb+l+tA=
Received: by 10.205.127.134 with SMTP id ha6mr3375469bkc.23.1321621889460;
	Fri, 18 Nov 2011 05:11:29 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o16sm5311967fag.21.2011.11.18.05.11.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 18 Nov 2011 05:11:28 -0800 (PST)
Date: Fri, 18 Nov 2011 14:11:16 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111118131116.GB3549@jama.jama.net>
References: <cover.1321575642.git.andrea.adami@gmail.com>
	<c4465784961e18f1e86e94fe2d57b93ea1e6ec58.1321575642.git.andrea.adami@gmail.com>
	<20111118095503.GA3549@jama.jama.net> <15369757.CEiKJYElQt@helios>
MIME-Version: 1.0
In-Reply-To: <15369757.CEiKJYElQt@helios>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-handheld][PATCH 5/5] linux: remove unused git version
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
X-List-Received-Date: Fri, 18 Nov 2011 13:17:56 -0000
X-Groupsio-MsgNum: 35450
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VrqPEDrXMn8OVzN4"
Content-Disposition: inline

--VrqPEDrXMn8OVzN4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 18, 2011 at 10:18:17AM +0000, Paul Eggleton wrote:
> On Friday 18 November 2011 10:55:03 Martin Jansa wrote:
> > On Fri, Nov 18, 2011 at 01:36:07AM +0100, Andrea Adami wrote:
> > > * for our old beloved handhelds the kernel
> >=20
> > I'm using it.. but if I'm alone then I can keep it in my own branch..
> > currently upgrading from 3.1.0-rc10 to 3.2.0-rc2
>=20
> If you're still using it Martin I'd rather keep it around than force you =
to=20
> maintain your own branch with it in; it shouldn't get in the way of anyon=
e=20
> else.

Well, it doesn't cost me anything to maintain it and if nobody booted
3.1.0-rc* from that recipe except me then I'm fine with dropping it.

But I rememeber a while back when we were trying to boot something like
2.6.32-rcX and we had to exchange few patches and defconfigs to find usable
configuration and meta-handheld looks like good place to share such
stuff if it at least work for someone (in this case me), but no other
side I do not send patch with every SRCREV change I have locally unless
it needs defconfig change or extra patch (expecting that everybody can
bump SRCREV and rcX locally to test newer version).

like this:
https://gitorious.org/shr/meta-handheld/commit/5136fd456569a254b3203545af3c=
98d643e8b681?format=3Dpatch

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--VrqPEDrXMn8OVzN4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7GWXQACgkQN1Ujt2V2gBwsnwCeNoyDwxS6J5PWcSZ/MFDylyQP
v+QAn3jDuoB1Ds/wgiKV4XFNl2Vzfv/j
=GmpH
-----END PGP SIGNATURE-----

--VrqPEDrXMn8OVzN4--
