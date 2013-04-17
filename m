Received: from mail-pa0-f54.google.com ([209.85.220.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1USOpL-0002OB-9Q
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Apr 2013 11:38:59 +0200
Received: by mail-pa0-f54.google.com with SMTP id fa11so832522pad.41
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Apr 2013 02:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=qq4mRUC17BPTZUiEiOTBke5lK2lbV9C9qwck4fUTcHo=;
	b=S0bphZPMfQCC4UJegjsXUCSvsPuCevaUHeDr1wFudsFJaU+dBYMU7HOLLmXzVyMjIx
	XFAAXAA+tpYHw0+RTbMBFgZx7qUnYF9iR/IqhiszWUu9JHFJ9Yt/SB08r3c8zaQaLgas
	UvGmK1iIqKSGi45y9ZTaKZVU6FMijyF8pyRiboAQ88CvQDVV/d51ZLT+idVN7id3F0i1
	PzkQvdKSnHDwfGhI6x/YawYxx8isNKx7DRmJT6rOXtRXE4f5ka5bPLGUcjDsMup53Fl9
	IKxP2OAcVG58D3ufTQEt74LszMZq0xBEjM2lFuRBbKgtJwp+8DkuoA6uyWD75VOuHL1F
	4aFw==
X-Received: by 10.66.197.165 with SMTP id iv5mr7985401pac.7.1366190483191;
	Wed, 17 Apr 2013 02:21:23 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id pa2sm6440742pac.9.2013.04.17.02.21.20
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 17 Apr 2013 02:21:22 -0700 (PDT)
Date: Wed, 17 Apr 2013 11:21:21 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20130417092121.GD26007@jama>
References: <1366139500-880-1-git-send-email-Martin.Jansa@gmail.com>
	<10677100.l6Guga4Du7@helios>
MIME-Version: 1.0
In-Reply-To: <10677100.l6Guga4Du7@helios>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 1/2] xserver-nodm-init: install .service and conf only with systemd in DISTRO_FEATURES
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
X-List-Received-Date: Wed, 17 Apr 2013 09:39:00 -0000
X-Groupsio-MsgNum: 44272
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WChQLJJJfbwij+9x"
Content-Disposition: inline

--WChQLJJJfbwij+9x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 17, 2013 at 09:51:45AM +0100, Paul Eggleton wrote:
> On Tuesday 16 April 2013 21:11:39 Martin Jansa wrote:
> > * Otavio reported unpackaged files without systemd enabled
>=20
> We have this problem in a lot of recipes. I've filed this bug to fix it i=
n=20
> systemd.bbclass itself:
>=20
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D4309

Yes :/ maybe I should wait a bit more with moving them from meta-systemd
to get reply here
http://lists.linuxtogo.org/pipermail/openembedded-core/2013-February/036169=
=2Ehtml

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--WChQLJJJfbwij+9x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFuaZEACgkQN1Ujt2V2gBwCyACfZ0AOiTFGy1R+s9rEN2w6KQyY
nc4An2N1JCwJl4Lf8FdK3K/xLyqivdA9
=fepa
-----END PGP SIGNATURE-----

--WChQLJJJfbwij+9x--
