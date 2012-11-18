Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TZzk5-0001mj-O6
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Nov 2012 08:56:37 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1539244eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Nov 2012 23:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=3x39T5WEv7RNTKEyjjE0alSew2y3fAkUmOSHhwRb8cU=;
	b=b9yjKRjOOuORzgBDfIUHyBBha9dSgkki0a4r3wXLXAkjIdzB7IAlzn2ZKtIzVkEGrH
	eeIRcfhruBTINT6L9v7C0o/srRf7UOtPBLpAoIOcG5mqPeRDILq4PVARtRdTFhNNr9OC
	NmrtjUVQQpvhbOb8b7lylINXUrK63lT1rjIHERPTGhRyP2C0eZexKJMns63k9UdLvrMl
	Zpzat5ZYdpnKf7pUqTjpldOFEB366BX7GnMw3XDQ9nXD6UCaCUcssSGasmFpueXJGEbj
	A8VbbNF72rHGCMVSm3ufkBN9LD8mIroBoBbh+sGE8czwbsfRSE/nYdZByii+81Hmma33
	p0Bw==
Received: by 10.14.200.194 with SMTP id z42mr13124724een.13.1353224556989;
	Sat, 17 Nov 2012 23:42:36 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k2sm15658258eep.15.2012.11.17.23.42.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 17 Nov 2012 23:42:35 -0800 (PST)
Date: Sun, 18 Nov 2012 08:42:53 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121118074253.GN3411@jama.jama.net>
References: <CAOd_LFyo-7GmLS9AtdO8BXXVxGuqdQvoZqmHHsm+qGSittwVmw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOd_LFyo-7GmLS9AtdO8BXXVxGuqdQvoZqmHHsm+qGSittwVmw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: window managers?
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
X-List-Received-Date: Sun, 18 Nov 2012 07:56:37 -0000
X-Groupsio-MsgNum: 41541
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pvq4FPIYehQuVelz"
Content-Disposition: inline

--pvq4FPIYehQuVelz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 17, 2012 at 04:57:41PM -0500, Cliff Brake wrote:
> Hello,
>=20
> I did some looking into window managers in recent oe/meta-oe/angstrom,
> and this is what I found:
>=20
> matchbox
> - is this still maintained?  Does not seem like a lot of new development.
>=20
> xfce
> - looks promising, but xconf did not build
>=20
> gnome
> - build problems
>=20
> enlightenment
> - builds, but got stuck with enlightenment_start.oe, no profiles
> listed, so can't get through the initial dialogs on startup
>=20
> twm
> -worked, but is very minimalist
>=20
> Questions:
> 1) any opinions on WM for embedded Linux systems?  For most projects,
> we simply run a single full screen app, but a WM would be nice in some
> cases.
>=20
> 2) any idea how to get profiles installed so that enlightenment can
> start?  Is there any way to bypass this for a canned embedded
> scenario?

Install e-wm-config-mobile or e-wm-config-standard, you can use packagegrou=
p-x11-illume.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--pvq4FPIYehQuVelz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCokX0ACgkQN1Ujt2V2gBx3+ACfYC1pNAdB3yZdpcLhyyLkMDMO
fpcAnA+Jt8wHMBSQo4LNeDHY79ytCtH/
=02oB
-----END PGP SIGNATURE-----

--pvq4FPIYehQuVelz--
