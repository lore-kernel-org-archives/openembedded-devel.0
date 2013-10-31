Return-Path: <joe@deserted.net>
Received: from mail-qa0-f46.google.com (mail-qa0-f46.google.com
	[209.85.216.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1BE0B6D298
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2013 13:56:36 +0000 (UTC)
Received: by mail-qa0-f46.google.com with SMTP id j15so4534197qaq.19
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2013 06:56:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=f4mXOBzoFmTigVdFcOEai5Nm8QPUQVigHYetNvNdXEM=;
	b=hOqcOEM6oOK+z/Q5V+kqNHZgTUShwA9FZ94XpBCnoXcZ+Rjer9yS/8mDnVn55juuea
	iQ7n2WWDqwH7aCtTebZlYa4cLuYk8+32/SQWJ+dCHZI8MV/4E7424w4L2ZlmPL0E/5Lh
	/bjbuW4rJp2ELxwEi0QYBg7jj/3w0Hwro6NNfkDYzfeSlnFfT4EFvGR5mR9Oa314pH2L
	wojUgpyDpvCC/LZweGOeYXQQO0cHNcEi9Vf3xsJlygUXlEufKXWXV9yt5kmeVHoobwpC
	G3NkvG3RHT114BkYiOv1ajCapK6D1sr9jaziN9yd51Tk/MFwQ5WoBIFUQpLwJkgeg10v
	o23g==
X-Gm-Message-State: ALoCoQnbWD1ARd70+VAu4tmNEjsHIQILQwR2y/FLkEzJOOaGuBHh176LsDOsZGSZbk/J7Ht3PEWB
X-Received: by 10.49.76.6 with SMTP id g6mr4157949qew.41.1383227797481;
	Thu, 31 Oct 2013 06:56:37 -0700 (PDT)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id x10sm9379410qas.5.2013.10.31.06.56.35
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 31 Oct 2013 06:56:36 -0700 (PDT)
Date: Thu, 31 Oct 2013 09:56:33 -0400
From: Joe MacDonald <joe@deserted.net>
To: Martin Jansa <martin.jansa@gmail.com>, Zongchun YU <b40527@freescale.com>,
	'Zongchun Yu' <Zongchun.Yu@freescale.com>
Message-ID: <20131031135632.GA4563@deserted.net>
References: <1383205247-8487-1-git-send-email-b40527@freescale.com>
	<20131031081012.GC32015@jama> <006201ced618$dc97d420$95c77c60$@com>
	<20131031092314.GF32015@jama>
MIME-Version: 1.0
In-Reply-To: <20131031092314.GF32015@jama>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org, b44149@freescale.com
Subject: Re: [meta-oe][PATCH v2] tcpreplay:add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 31 Oct 2013 13:56:36 -0000
X-Groupsio-MsgNum: 46961
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Qxx1br4bt0+wmkIi"
Content-Disposition: inline

--Qxx1br4bt0+wmkIi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-oe][PATCH v2] tcpreplay:add recipe] On 13.10.31 (Thu 10:23)=
 Martin Jansa wrote:

> On Thu, Oct 31, 2013 at 05:09:07PM +0800, Zongchun YU wrote:
> > Hi Martin.
> >=20
> > Thanks for your kind comments. I see tcpdump in meta-oe layer too. tcpr=
eplay
> > may use packages captured by tcpdump.
> > putting them in the same layer maybe better. Wish your suggestion?
> >=20
> > Best Regards
> > Zongchun
>=20
> +Joe
>=20
> tcpdump is used only in one meta-oe recipe, were it can be dropped or
> replaced with PACKAGECONFIG
>=20
> meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb:    tcpdump
>=20
> And then we can move tcpdump to meta-networking and add tcpreplay there.

Wow, been a while since I thought about tcpdump's location in the tree.
I knew we'd discussed moving it to meta-networking it previously and it
didn't move but I couldn't remember why.  Looks like it was mostly due
to inertia.  I've no objection to relocating it, I think it's a sensible
location for it anyway.  Zongchun:  would you be able to prepare a patch
set that includes the move and the introduction of tcpreplay?

As for the recipe itself, I only noticed two small things on a quick
scan.  tcpreplay-3.4.4-no-bfp-support.patch is lacking OE headers, at
least an upstream-status is important here, even though it's pretty
clear what that'll be.  :-)  Also, I don't think you need the PR in the
recipe.

--=20
-Joe MacDonald.
:wq

--Qxx1br4bt0+wmkIi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlJyYYcACgkQwFvcllog0XzqLQCdHp6MQcKPJ3DhX60jlIHfYDtR
ixAAniq0QKRD3yPlHKue46GfZK3J8j1g
=zfH3
-----END PGP SIGNATURE-----

--Qxx1br4bt0+wmkIi--
