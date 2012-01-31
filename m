Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RsE8g-0002vS-1Z
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jan 2012 14:52:50 +0100
Received: by eaao11 with SMTP id o11so52772eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jan 2012 05:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=7ugQ9QxXtQNYKL7VGnvPjmS85AC2KT/lpqlpDuRPfdM=;
	b=YYKNZsnaR0uiyK8SpiH6LGuaaI5AEnKL+DsHCSfq+wTwhvqGG2BswXwxyiEPVqH/Q1
	9mjGWJffAr663t2+KCpSgI9VynVuoUzoh1NpBls0TGRct7xPdjb3YDScXmMSDGsjpFG5
	oNrwwneUoSxRMjcY7g1K1G2lbFrMKWtO5Rywc=
Received: by 10.213.113.138 with SMTP id a10mr1995025ebq.68.1328017495170;
	Tue, 31 Jan 2012 05:44:55 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o49sm32163451eei.0.2012.01.31.05.44.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 31 Jan 2012 05:44:54 -0800 (PST)
Date: Tue, 31 Jan 2012 14:44:52 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20120131134452.GC3644@jama.jama.net>
References: <20120131132717.GB3644@jama.jama.net> <2408772.PAkgyL27F6@helios>
MIME-Version: 1.0
In-Reply-To: <2408772.PAkgyL27F6@helios>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: WARN: polkit pulls systemd to image if not disabled explicitly
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
X-List-Received-Date: Tue, 31 Jan 2012 13:52:50 -0000
X-Groupsio-MsgNum: 36785
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qjNfmADvan18RZcF"
Content-Disposition: inline

--qjNfmADvan18RZcF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 31, 2012 at 01:36:15PM +0000, Paul Eggleton wrote:
> On Tuesday 31 January 2012 14:27:18 Martin Jansa wrote:
> > Since version 104 polkit has support for systemd session tracking
> > commit
> > http://cgit.freedesktop.org/PolicyKit/commit/?id=3D2027302e803a9569a370=
b429a47
> > 5dae5ef8afe34
> >=20
> > Unless passed --disable-systemd it will autodetect libsystemd-login
> > with pkg-config and enable it, which results in polkit package pulling
> > systemd as RDEPEND.
> >=20
> > To check your build look for
> > Session tracking:           ConsoleKit
> > or
> > Session tracking:           systemd
> > in polkit-0.104-r*/temp/log.do_configure
> >=20
> > and as gconf depends on polkit I guess this happens for a lot of images.
>=20
> Are we now at the stage where we need a distro-level option to enable/dis=
able=20
> systemd?

It would be easier with some global (as distro-level) switch.. it's easy
to watch for ${PN}-systemd subpackages going to image (as they are
usually pulled by task-* recipes), but in case like this with polkit
it's more difficult and cannot work OOTB for both sides I guess.=20
(I'm fine with bbappend in my distro layer for now..)

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qjNfmADvan18RZcF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8n8FQACgkQN1Ujt2V2gBx1jwCgrftQjHf05VAs/ae7x3b11oPA
iggAoIlV20tjvopzerH92vFnClbiUdtf
=Ub3T
-----END PGP SIGNATURE-----

--qjNfmADvan18RZcF--
