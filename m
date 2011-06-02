Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QRzgO-00032h-K4
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Jun 2011 06:38:56 +0200
Received: by bwz5 with SMTP id 5so748853bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Jun 2011 21:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=m7LAaXQ727MEtrSrbWZ7A/oZtrvD4ayM4xGIKg37sC0=;
	b=kcYykffc0mDVFkS1M0PAAdGJNezZp15YX+op7TOPmCsrz/qeHFtMPn27PClNx2bqnK
	GNw4Nwp2SlM2Al3Bl3yhyEnpoTqtJs9Uz5bQvde7ULrtEkC3MkdarARYn/HZPErdzYxk
	Qzfy64aeOz0Kq57iX6wPOFkxwjEedpnOHx4kg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=EpL1pjfUS+TdmHG2gBhuzUpPFFQ46h/pG2bGIbOBPWL7c0o0iX6W0dAR/91jnS/Gj4
	GswstJ+Q4KGWv1YODhM4GcKzA9RC8p6NbL077u/4tIcISdBLqm2CFHihMENvuIohbJi9
	qFq36GXkwoHEjWUv/9ZpbC5wXTJbWfBbj1TmI=
Received: by 10.204.80.28 with SMTP id r28mr267663bkk.46.1306989345160;
	Wed, 01 Jun 2011 21:35:45 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id k10sm150273bkq.22.2011.06.01.21.35.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Jun 2011 21:35:38 -0700 (PDT)
Date: Thu, 2 Jun 2011 06:35:30 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110602043530.GF3281@jama.jama.net>
References: <cover.1306962838.git.Martin.Jansa@gmail.com>
	<is6d2d$11c$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <is6d2d$11c$1@dough.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 0/2] Pull request #15
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
X-List-Received-Date: Thu, 02 Jun 2011 04:38:56 -0000
X-Groupsio-MsgNum: 32468
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FLPM4o+7JoHGki3m"
Content-Disposition: inline

--FLPM4o+7JoHGki3m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 02, 2011 at 12:05:01AM +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> On 01-06-11 23:14, Martin Jansa wrote:
> > Initial bits are already in oe-core so it's time to push this too.
> >=20
> > The following changes since commit 7da05acc4665dcfcd008e6ce698169b8e950=
3b33:
> >=20
> >   udev-extra-rules: remove modprobe rule, it has moved back to udev (20=
11-05-31 20:37:45 +0200)
> >=20
> > are available in the git repository at:
> >   git://git.openembedded.org/meta-openembedded-contrib jansa/allarch
> >   http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?=
h=3Djansa/allarch
> >=20
> > Martin Jansa (2):
> >   siteinfo: add allarch-linux target
> >   recipes: use allarch.bbclass instead just PACKAGE_ARCH =3D all
>=20
> koen@dominion:/OE/tentacle/sources/meta-openembedded$
> MACHINE=3Dbeagleboard bitbake ccid udev-extra-rules freerdp pcsc-lite lib=
inih

Can you please test with
http://patches.openembedded.org/patch/5265/
applied to oe-core?

Strange this I've seen this error after it was renamed s/all/allarch=20
http://git.openembedded.net/cgit.cgi/openembedded-core/commit/?id=3D5d7d4e1=
ed9bedf2b6510796d76ea8f94739b9de2
and allarch was missing in oe-core/meta/classes/siteinfo.bbclass
and then I still see it with allarch missing in
meta-oe/classes/siteinfo.bbclass

looks like both siteinfo.bbclass are sometimes used

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--FLPM4o+7JoHGki3m
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk3nExIACgkQN1Ujt2V2gBzVGQCgr8Ew8Wjpee8gyVJK56p6iy5f
UsUAoI9M9QcldEzaGnqOQMqHMpWuT/K2
=y2RS
-----END PGP SIGNATURE-----

--FLPM4o+7JoHGki3m--
