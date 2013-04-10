Received: from mail-pd0-f181.google.com ([209.85.192.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UPwA6-0004KA-VQ
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Apr 2013 16:38:11 +0200
Received: by mail-pd0-f181.google.com with SMTP id y10so291526pdj.40
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2013 07:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=kht7Df5ccHkTM550B99uaI1EpCjTzBE8P+zORgjrQ58=;
	b=kAQ+0tZxEsWE6zyaeMDT8mNe06wLAsQHuCzmEag/huaLQqE8BKar+Q4o/o2YieVy+e
	sI2B3lTjQoKBkA9j0OV5gU3mJL5+K3ZhZryCohRm8xP/Ed+Vk9HvZEcivC1YNMKGF82Z
	Gz7ZeAHnhwCcHYDs8kZk9bhkvsjy6cucm5RGO910LNN/gTWjfJWjIp8vUM39yk3146Vw
	mlbtGHrcbv+KRcXiL2IapXXGnCdhqtULuK0/5lgw9el90/SMa7T94WsaKc1DeVPnMv/y
	Su3krRFvqPJsbfQYMR3gtnkSp+cqzAk0JYZ3d1NjMsxV6IhgRjobJhlwbfXHqY0/NBWA
	G7JA==
X-Received: by 10.66.171.11 with SMTP id aq11mr3963399pac.24.1365603648603;
	Wed, 10 Apr 2013 07:20:48 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ew5sm145682pbc.9.2013.04.10.07.20.45
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 10 Apr 2013 07:20:47 -0700 (PDT)
Date: Wed, 10 Apr 2013 16:20:39 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130410142039.GC2471@jama>
References: <CAOT3miKm12uZ75LrH5fvRxrSvZ7wbyi+ioxMQgROsF3B-mJTvQ@mail.gmail.com>
	<CAJTo0LZLF9JhAd_Eo3Hr5n2LxXxgGCD_D9K4=ZQ8cSjwvWL6Uw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZLF9JhAd_Eo3Hr5n2LxXxgGCD_D9K4=ZQ8cSjwvWL6Uw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: why does gupnp depends on gnome-icon-theme?
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
X-List-Received-Date: Wed, 10 Apr 2013 14:38:11 -0000
X-Groupsio-MsgNum: 44016
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="32u276st3Jlj2kUU"
Content-Disposition: inline

--32u276st3Jlj2kUU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 10, 2013 at 02:40:16PM +0100, Burton, Ross wrote:
> On 10 April 2013 14:12, Nicolas Dechesne <ndec13@gmail.com> wrote:
> > i have noticed that gupnp (in meta-multimedia/recipes-connectivity)
> > depends on gnome-icon-theme, and I don't really understand why, see
> >
> > http://cgit.openembedded.org/meta-openembedded/tree/meta-multimedia/rec=
ipes-connectivity/gupnp/gupnp.inc#n5
>=20
> That's historical, the only dependency on g-i-t is in gupnp-tools.
> Patch welcome to remove it!
>=20
> > i was able to build an image with gupnp even after patching DEPENDS to
> > get rid of the dependency, and the main concern with this dependency
> > is that it brings:
> >
> > RRECOMMENDS_${PN} =3D "librsvg-gtk"
> > and as such attempts to build gtk+, while I am trying to make a
> > directfb image without GTK.
>=20
> That's also a bit annoying isn't it...  Maybe that should be removed
> generally, and we'll leave it to distros/products to decide/know
> whether they are using SVG icons or not.

Well I'm not sure if it's still segfaulting like before, but e.g. midori
was segfaulting when loading some pages without gtk-theme-clearlooks or
some other usable theme :/. That's why we keep .bbappend with added
RDEPENDS to change gtk-theme :/.

https://github.com/shr-distribution/meta-smartphone/blob/shr/meta-shr/recip=
es-connectivity/midori/midori_0.5.0.bbappend

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--32u276st3Jlj2kUU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFldTcACgkQN1Ujt2V2gBx/bgCfUNTHT6Cr6XW05QapisVzsQUV
JVUAnR+UvTu8uY0+artBlN+VBBGmRqtl
=Dz9L
-----END PGP SIGNATURE-----

--32u276st3Jlj2kUU--
