Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SHUug-0008MG-77
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Apr 2012 08:50:50 +0200
Received: by wera1 with SMTP id a1so3003564wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Apr 2012 23:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Ojl+QQvIGuzux/5XqKScShWHkWy2jNIvpf2kq7JGDp0=;
	b=d//HEBaN3Sh8rHonNLnqYzoAYhJ/dGlX5wPD1h220TY6D2q5HsvLPtnZhcy+tY30TP
	iZtBuNqddMmTfEqQ3hURaeuYspCV//tV6lbhQ5uTNRRvvDuCVvKSwNXk1ynJqLSuFf5+
	LK2PVEUr8wx4UyabhItdKG0CxwMZbsEOuejZVcTtSIr13eQuxvXbYcNZJ3GmmUHhQfvG
	7n5KIn2Y6lFihhXGZQMbyymr8+gJMTyZ5Poxqa+DHAAkdNTl5S1pq+LgBroEDtnTnx3Q
	4rinoFoufP+EJzJY/4HiETsjlvW1khNFh5m4e5sQStHWVA28eO2xaHRx9UOD0PEOUOSi
	3u6A==
Received: by 10.180.100.2 with SMTP id eu2mr4145477wib.1.1334040092953;
	Mon, 09 Apr 2012 23:41:32 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k6sm35610752wiy.7.2012.04.09.23.41.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 Apr 2012 23:41:31 -0700 (PDT)
Date: Tue, 10 Apr 2012 08:41:31 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120410064131.GA3583@jama.jama.net>
References: <4F80ACD6.8080901@gmail.com>
MIME-Version: 1.0
In-Reply-To: <4F80ACD6.8080901@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: meta-linaro and toolchain-layer
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
X-List-Received-Date: Tue, 10 Apr 2012 06:50:50 -0000
X-Groupsio-MsgNum: 38181
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="huq684BweRXVnRxX"
Content-Disposition: inline

--huq684BweRXVnRxX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 07, 2012 at 02:08:38PM -0700, Khem Raj wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Hi,
>=20
> Ken Werner @ Linaro has created a meta-linaro layer. I have created a
> github repo of same here https://github.com/kraj/meta-linaro
>=20
> Moving forward soon gcc 4.7 will land in OE-Core and 4.6 will be
> more or less retired. In natural progression it would move to
> toolchain-layer if there are consumers of it.
>=20
> linaro is also working on gcc-4.7 improvements in  same manner as
> 4.6  and there could be more tools e.g. gdb binutils etc. that could
> be useful for armv7+ from that layer.
>=20
> I would like to propose few things we could do.
>=20
> Use gcc-4.6 from meta-linaro and retire it from toolchain-layer
> which means toolchain layer only has gcc-4.5 and eventually
> This also means that we don't move gcc-4.6 into toolchain-layer
> when its relegated from OE-Core

I haven't tried gcc-4.7 on my armv4t machines yet, because I fear
similar issues like with binutils gold (which are still not resolved),
because nobody uses armv4t much nowadays :/.

The same I fear from 4.6 from meta-linaro, but maybe they will be
responsive as you were, when I reported issues on armv4t with some new
patch added by linaro..

So using meta-linaro for gcc-4.6 and gcc-4.7 is fine, but please keep
current "snapshot" of gcc-4.6 (oe-core+toolchain-layer patches)
somewhere as safe version before meta-linaro 4.6 is well tested on all
devices.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--huq684BweRXVnRxX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+D1hsACgkQN1Ujt2V2gBwt7QCglGmAC5Cm9quQYVU3aThkwSQh
dTgAn3OAuR02g7m5/h2d3tB8nZaYmgPZ
=lwIe
-----END PGP SIGNATURE-----

--huq684BweRXVnRxX--
